Return-Path: <zhenhua.luo@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0253.outbound.messaging.microsoft.com [213.199.154.253])
	by mail.openembedded.org (Postfix) with ESMTP id 389EB6CC86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:44:32 +0000 (UTC)
Received: from mail16-db9-R.bigfish.com (10.174.16.254) by
	DB9EHSOBE012.bigfish.com (10.174.14.75) with Microsoft SMTP Server id
	14.1.225.22; Wed, 20 Nov 2013 10:44:33 +0000
Received: from mail16-db9 (localhost [127.0.0.1])	by mail16-db9-R.bigfish.com
	(Postfix) with ESMTP id 2FFC71A01EC	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:44:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h1155h)
Received: from mail16-db9 (localhost.localdomain [127.0.0.1]) by mail16-db9
	(MessageSwitch) id 1384944271593759_12692;
	Wed, 20 Nov 2013 10:44:31 +0000 (UTC)
Received: from DB9EHSMHS011.bigfish.com (unknown [10.174.16.232])	by
	mail16-db9.bigfish.com (Postfix) with ESMTP id 831072600AA	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:44:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS011.bigfish.com
	(10.174.14.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 20 Nov 2013 10:44:31 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 20 Nov 2013 10:44:29 +0000
Received: from localhost.localdomain (B19537-03.ap.freescale.net
	[10.192.208.102])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rAKAiODs020425;	Wed, 20 Nov 2013 03:44:27 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2013 18:44:22 +0800
Message-ID: <1384944262-4850-2-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384944262-4850-1-git-send-email-zhenhua.luo@freescale.com>
References: <1384944262-4850-1-git-send-email-zhenhua.luo@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: b40527@freescale.com
Subject: [meta-oe/meta-oe][PATCH 2/2] python-numpy: fix incorrect path of config files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2013 10:44:32 -0000
Content-Type: text/plain

Fix following two build issues
1. WARNING: Failed to fetch URL file://config.h, attempting MIRRORS if available
   ERROR: Fetcher failure: Unable to find file file://config.h anywhere. The paths that were searched were:
   ... [snip] ...
   ERROR: Function failed: Fetcher failure for URL: 'file://config.h'. Unable to fetch URL from any source.
2. cp: cannot stat `.../python-numpy/1.7.0-r0/*config.h': No such file or directory

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 .../recipes-devtools/python/python-numpy_1.7.0.bb  | 34 +++++++++++-----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
index 99662da..a61827c 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -10,37 +10,37 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
 CONFIGFILESURI ?= ""
 
 CONFIGFILESURI_aarch64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
+    file://aarch64/config.h \
+    file://aarch64/_numpyconfig.h \
 "
 CONFIGFILESURI_arm = " \
-    file://config.h \
-    file://numpyconfig.h \
+    file://arm/config.h \
+    file://arm/numpyconfig.h \
 "
 CONFIGFILESURI_armeb = " \
-    file://config.h \
-    file://numpyconfig.h \
+    file://armeb/config.h \
+    file://armeb/numpyconfig.h \
 "
 CONFIGFILESURI_mipsel = " \
-    file://config.h \
-    file://numpyconfig.h \
+    file://mipsel/config.h \
+    file://mipsel/numpyconfig.h \
 "
 CONFIGFILESURI_i586 = " \
-    file://config.h \
-    file://numpyconfig.h \
+    file://i586/config.h \
+    file://i586/numpyconfig.h \
 "
 CONFIGFILESURI_x86-64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
+    file://x86-64/config.h \
+    file://x86-64/_numpyconfig.h \
 "
 
 CONFIGFILESURI_powerpc = " \
-    file://config.h \
-    file://numpyconfig.h \
+    file://ppc/config.h \
+    file://ppc/numpyconfig.h \
 "
 CONFIGFILESURI_powerpc64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
+    file://ppc64/config.h \
+    file://ppc64/_numpyconfig.h \
 "
 
 S = "${WORKDIR}/numpy-${PV}"
@@ -53,7 +53,7 @@ do_compile_prepend() {
     BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
     ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
     true
-    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
+    cp ${WORKDIR}/*/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
 }
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
-- 
1.8.3.1



