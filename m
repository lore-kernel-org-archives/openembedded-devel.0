Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8D5360746
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 08:17:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6J8Hd5k017928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 01:17:39 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jul 2016 01:17:38 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2016 04:17:37 -0400
Message-ID: <1468916257-144334-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] squid: upgrade to 3.5.20
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
X-List-Received-Date: Tue, 19 Jul 2016 08:17:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Remove the blacklist since the issue is gone with new version
* Remove two CVE patches which have been fixed:
  - CVE-2016-3947 and CVE-2016-4553
* Rebased the patch for ptest.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../squid/files/CVE-2016-3947.patch                | 48 --------------------
 .../squid/files/CVE-2016-4553.patch                | 51 ----------------------
 ...d-use-serial-tests-config-needed-by-ptest.patch | 18 ++++----
 .../squid/{squid_3.5.7.bb => squid_3.5.20.bb}      | 11 ++---
 4 files changed, 12 insertions(+), 116 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch
 rename meta-networking/recipes-daemons/squid/{squid_3.5.7.bb => squid_3.5.20.bb} (85%)

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
deleted file mode 100644
index c83e6ab..0000000
--- a/meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0fe108ecb2bbdf684f159950eaa55d22f07c4008 Mon Sep 17 00:00:00 2001
-From: Catalin Enache <catalin.enache@windriver.com>
-Date: Wed, 20 Apr 2016 15:17:18 +0300
-Subject: [PATCH] pinger: Fix buffer overflow in Icmp6::Recv
-
-Upstream-Status: Backport
-CVE: CVE-2016-3947
-
-Author: Yuriy M. Kaminskiy <yumkam@gmail.com>
-Committer: Amos Jeffries <squid3@treenet.co.nz
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/icmp/Icmp6.cc | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/icmp/Icmp6.cc b/src/icmp/Icmp6.cc
-index 794a51a..ee84b80 100644
---- a/src/icmp/Icmp6.cc
-+++ b/src/icmp/Icmp6.cc
-@@ -256,7 +256,7 @@ Icmp6::Recv(void)
-     #define ip6_hops    // HOPS!!!  (can it be true??)
- 
-         ip = (struct ip6_hdr *) pkt;
--        pkt += sizeof(ip6_hdr);
-+        NP: echo size needs to +sizeof(ip6_hdr);
- 
-     debugs(42, DBG_CRITICAL, HERE << "ip6_nxt=" << ip->ip6_nxt <<
-             ", ip6_plen=" << ip->ip6_plen <<
-@@ -267,7 +267,6 @@ Icmp6::Recv(void)
-     */
- 
-     icmp6header = (struct icmp6_hdr *) pkt;
--    pkt += sizeof(icmp6_hdr);
- 
-     if (icmp6header->icmp6_type != ICMP6_ECHO_REPLY) {
- 
-@@ -292,7 +291,7 @@ Icmp6::Recv(void)
-         return;
-     }
- 
--    echo = (icmpEchoData *) pkt;
-+    echo = (icmpEchoData *) (pkt + sizeof(icmp6_hdr));
- 
-     preply.opcode = echo->opcode;
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch b/meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch
deleted file mode 100644
index 497ace4..0000000
--- a/meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 41ccaa04bb445f52bdb671ef6fbf994634b6efbe Mon Sep 17 00:00:00 2001
-From: Catalin Enache <catalin.enache@windriver.com>
-Date: Mon, 23 May 2016 12:47:39 +0300
-Subject: [PATCH] Bug 4501: HTTP/1.1: normalize Host header
-
-Upstream-Status: Backport
-CVE: CVE-2016-4553
-
-When absolute-URI is provided Host header should be ignored. However some
-code still uses Host directly so normalize it using the URL authority
-value before doing any further request processing.
-
-For now preserve the case where Host is completely absent. That matters
-to the CVE-2009-0801 protection.
-
-This also has the desirable side effect of removing multiple or duplicate
-Host header entries, and invalid port values.
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/client_side.cc | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/src/client_side.cc b/src/client_side.cc
-index 8c41c21..36a27de 100644
---- a/src/client_side.cc
-+++ b/src/client_side.cc
-@@ -2652,6 +2652,20 @@ clientProcessRequest(ConnStateData *conn, HttpParser *hp, ClientSocketContext *c
-             clientProcessRequestFinished(conn, request);
-             return;
-         }
-+
-+        // when absolute-URI is provided Host header should be ignored. However
-+        // some code still uses Host directly so normalize it.
-+        // For now preserve the case where Host is completely absent. That matters.
-+        if (request->header.has(HDR_HOST)) {
-+            const char *host = request->header.getStr(HDR_HOST);
-+            SBuf authority(request->GetHost());
-+            if (request->port != urlDefaultPort(request->url.getScheme()))
-+                authority.appendf(":%d", request->port);
-+            debugs(33, 5, "URL domain " << authority << " overrides header Host: " << host);
-+            // URL authority overrides Host header
-+            request->header.delById(HDR_HOST);
-+            request->header.putStr(HDR_HOST, authority.c_str());
-+        }
-     }
- 
-     // Some blobs below are still HTTP-specific, but we would have to rewrite
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
index 9e2ceab..01ec596 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
@@ -1,6 +1,6 @@
-From 2192fdbc90b0ff2d5408e8763df200620870deea Mon Sep 17 00:00:00 2001
+From bd58d3672bc267824000f34a37561c7ab2bd571f Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 13 Oct 2014 01:32:37 -0700
+Date: Tue, 19 Jul 2016 01:56:23 -0400
 Subject: [PATCH] squid: use serial-tests config needed by ptest
 
 ptest needs buildtest-TESTS and runtest-TESTS targets.
@@ -10,22 +10,22 @@ Upstream-Status: Inappropriate [default automake behavior incompatible with ptes
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
- configure.ac |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6f7171f..ab9b93e 100644
+index 05ad027..e324b93 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_PREREQ(2.61)
+@@ -10,7 +10,7 @@ AC_PREREQ(2.61)
  AC_CONFIG_HEADERS([include/autoconf.h])
  AC_CONFIG_AUX_DIR(cfgaux)
  AC_CONFIG_SRCDIR([src/main.cc])
--AM_INIT_AUTOMAKE([tar-ustar nostdinc])
-+AM_INIT_AUTOMAKE([tar-ustar nostdinc serial-tests])
+-AM_INIT_AUTOMAKE([tar-ustar nostdinc subdir-objects])
++AM_INIT_AUTOMAKE([tar-ustar nostdinc subdir-objects serial-tests])
  AC_REVISION($Revision$)dnl
  AC_PREFIX_DEFAULT(/usr/local/squid)
  AM_MAINTAINER_MODE
 -- 
-1.7.1
+2.8.1
 
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
similarity index 85%
rename from meta-networking/recipes-daemons/squid/squid_3.5.7.bb
rename to meta-networking/recipes-daemons/squid/squid_3.5.20.bb
index b571e29..f26aebe 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
@@ -19,15 +19,13 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
-           file://CVE-2016-3947.patch \
-           file://CVE-2016-4553.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-                    file://errors/COPYRIGHT;md5=0fed8f1462f6fdbc62bb431bcb618f46 \
+                    file://errors/COPYRIGHT;md5=0d98c4448c368d146f31a970bb0ced21 \
                    "
-SRC_URI[md5sum] = "06e43abc67aedcc3903a2780de20a3ed"
-SRC_URI[sha256sum] = "b7dcec8c5cb7f5687aff4256a7522f670c310a350cc9e9c0f29f3fd9cf88d017"
+SRC_URI[md5sum] = "6a29d7dfc544205001f7a75c6996dc60"
+SRC_URI[sha256sum] = "5a114f8f7f44b5ae3c9b77d7b81aef13fe69e7f530855213d551f48b157cb5f1"
 
 DEPENDS = "libtool krb5 openldap db cyrus-sasl"
 
@@ -75,6 +73,3 @@ FILES_${PN}-doc += "${datadir}/*.txt"
 
 RDEPENDS_${PN} += "perl"
 RDEPENDS_${PN}-ptest += "make"
-
-# http://errors.yoctoproject.org/Errors/Details/35128/
-PNBLACKLIST[squid] ?= "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclaration of 'IPPROTO_IP'"
-- 
2.8.1


