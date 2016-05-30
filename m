Return-Path: <Catalin.Enache@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24C38771AA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 09:17:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4U9HvZM021227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 02:17:58 -0700
Received: from otp-linux01.corp.ad.wrs.com (128.224.126.17) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 30 May 2016 02:17:57 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 May 2016 12:17:56 +0300
Message-ID: <1464599876-108961-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] squid: CVE-2016-4554
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
X-List-Received-Date: Mon, 30 May 2016 09:17:59 -0000
Content-Type: text/plain

mime_header.cc in Squid before 3.5.18 allows remote attackers
to bypass intended same-origin restrictions and possibly
conduct cache-poisoning attacks via a crated HTTP Host header,
aka a header smuggling issue.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4554

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../squid/files/CVE-2016-4554.patch                | 35 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4554.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-4554.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-4554.patch
new file mode 100644
index 0000000..c02b67e
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-4554.patch
@@ -0,0 +1,35 @@
+From a5d62fe9d7326b8aef2ebcb700d4a228c8b2681a Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Thu, 26 May 2016 10:31:48 +0300
+Subject: [PATCH] Require exact match in Host header name lookup
+
+Upstream-Status: Backport
+CVE: CVE-2016-4554
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/mime_header.cc | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/mime_header.cc b/src/mime_header.cc
+index 4190b37..db18764 100644
+--- a/src/mime_header.cc
++++ b/src/mime_header.cc
+@@ -36,11 +36,11 @@ mime_get_header_field(const char *mime, const char *name, const char *prefix)
+ 
+     debugs(25, 5, "mime_get_header: looking for '" << name << "'");
+ 
+-    for (p = mime; *p; p += strcspn(p, "\n\r")) {
+-        if (strcmp(p, "\r\n\r\n") == 0 || strcmp(p, "\n\n") == 0)
++    for (p = mime; *p; p += strcspn(p, "\n")) {
++        if (strcmp(p, "\n\r\n") == 0 || strcmp(p, "\n\n") == 0)
+             return NULL;
+ 
+-        while (xisspace(*p))
++        if (*p == '\n')
+             ++p;
+ 
+         if (strncasecmp(p, name, namelen))
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index d0e1b16..7fe41ee 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://run-ptest \
            file://volatiles.03_squid \
            file://CVE-2016-3947.patch \
+           file://CVE-2016-4554.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.7.4

