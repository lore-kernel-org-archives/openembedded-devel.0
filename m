Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C65726FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 12:45:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4NCjBn7013632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 05:45:11 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 23 May 2016 05:45:10 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 May 2016 15:49:34 +0300
Message-ID: <1464007774-24377-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] squid: CVE-2016-4553
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 May 2016 12:45:13 -0000
Content-Type: text/plain

client_side.cc in Squid before 3.5.18 and 4.x before 4.0.10
does not properly ignore the Host header when absolute-URI
is provided, which allows remote attackers to conduct
cache-poisoning attacks via an HTTP request.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4553

Backported upstream patch:
http://www.squid-cache.org/Versions/v3/3.5/changesets/squid-3.5-14039.patch

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../squid/files/CVE-2016-4553.patch                | 51 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch
new file mode 100644
index 0000000..497ace4
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch
@@ -0,0 +1,51 @@
+From 41ccaa04bb445f52bdb671ef6fbf994634b6efbe Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Mon, 23 May 2016 12:47:39 +0300
+Subject: [PATCH] Bug 4501: HTTP/1.1: normalize Host header
+
+Upstream-Status: Backport
+CVE: CVE-2016-4553
+
+When absolute-URI is provided Host header should be ignored. However some
+code still uses Host directly so normalize it using the URL authority
+value before doing any further request processing.
+
+For now preserve the case where Host is completely absent. That matters
+to the CVE-2009-0801 protection.
+
+This also has the desirable side effect of removing multiple or duplicate
+Host header entries, and invalid port values.
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/client_side.cc | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/src/client_side.cc b/src/client_side.cc
+index 8c41c21..36a27de 100644
+--- a/src/client_side.cc
++++ b/src/client_side.cc
+@@ -2652,6 +2652,20 @@ clientProcessRequest(ConnStateData *conn, HttpParser *hp, ClientSocketContext *c
+             clientProcessRequestFinished(conn, request);
+             return;
+         }
++
++        // when absolute-URI is provided Host header should be ignored. However
++        // some code still uses Host directly so normalize it.
++        // For now preserve the case where Host is completely absent. That matters.
++        if (request->header.has(HDR_HOST)) {
++            const char *host = request->header.getStr(HDR_HOST);
++            SBuf authority(request->GetHost());
++            if (request->port != urlDefaultPort(request->url.getScheme()))
++                authority.appendf(":%d", request->port);
++            debugs(33, 5, "URL domain " << authority << " overrides header Host: " << host);
++            // URL authority overrides Host header
++            request->header.delById(HDR_HOST);
++            request->header.putStr(HDR_HOST, authority.c_str());
++        }
+     }
+ 
+     // Some blobs below are still HTTP-specific, but we would have to rewrite
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index 750484a..b571e29 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://run-ptest \
            file://volatiles.03_squid \
            file://CVE-2016-3947.patch \
+           file://CVE-2016-4553.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.7.4


