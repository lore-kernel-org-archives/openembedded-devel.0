Return-Path: <Catalin.Enache@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 096B6771C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 07:45:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4V7jIPC019777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 00:45:18 -0700
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 31 May 2016 00:45:17 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 May 2016 10:50:00 +0300
Message-ID: <1464681000-17571-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] squid: CVE-2016-4555
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
X-List-Received-Date: Tue, 31 May 2016 07:45:19 -0000
Content-Type: text/plain

client_side_request.cc in Squid 3.x before 3.5.18 and 4.x
before 4.0.10 allows remote servers to cause a denial of
service (crash) via crafted Edge Side Includes (ESI) responses.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4555

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../squid/files/CVE-2016-4555.patch                | 46 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4555.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-4555.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-4555.patch
new file mode 100644
index 0000000..eeabbcd
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2016-4555.patch
@@ -0,0 +1,46 @@
+From f7aabf74e4f274b107d52cb62dfa2f9899f410ac Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Tue, 31 May 2016 09:11:53 +0300
+Subject: [PATCH] Bug 4455: SegFault from ESIInclude::Start
+
+Upstream-Status: Backport
+CVE: CVE-2016-4555
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/client_side_request.cc | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/src/client_side_request.cc b/src/client_side_request.cc
+index 6a8f921..8b1e147 100644
+--- a/src/client_side_request.cc
++++ b/src/client_side_request.cc
+@@ -141,16 +141,18 @@ ClientHttpRequest::ClientHttpRequest(ConnStateData * aConn) :
+     setConn(aConn);
+     al = new AccessLogEntry;
+     al->cache.start_time = current_time;
+-    al->tcpClient = clientConnection = aConn->clientConnection;
+-    al->cache.port = aConn->port;
+-    al->cache.caddr = aConn->log_addr;
++    if (aConn) {
++        al->tcpClient = clientConnection = aConn->clientConnection;
++        al->cache.port = aConn->port;
++        al->cache.caddr = aConn->log_addr;
+ 
+ #if USE_OPENSSL
+-    if (aConn->clientConnection != NULL && aConn->clientConnection->isOpen()) {
+-        if (SSL *ssl = fd_table[aConn->clientConnection->fd].ssl)
+-            al->cache.sslClientCert.reset(SSL_get_peer_certificate(ssl));
+-    }
++        if (aConn->clientConnection != NULL && aConn->clientConnection->isOpen()) {
++            if (SSL *ssl = fd_table[aConn->clientConnection->fd].ssl)
++                al->cache.sslClientCert.reset(SSL_get_peer_certificate(ssl));
++        }
+ #endif
++    }
+     dlinkAdd(this, &active, &ClientActiveRequests);
+ #if USE_ADAPTATION
+     request_satisfaction_mode = false;
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index 7fe41ee..7e1f62e 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://volatiles.03_squid \
            file://CVE-2016-3947.patch \
            file://CVE-2016-4554.patch \
+           file://CVE-2016-4555.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.7.4


