Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0BA7FB5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 01:01:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,241,1569254400"; d="scan'208";a="77607309"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2019 09:01:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 0C2DE4B6EC6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 08:53:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 29 Oct 2019 09:01:18 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Oct 2019 16:55:38 +0800
Message-ID: <1572339338-8135-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 0C2DE4B6EC6E.A817B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] pure-ftpd: upgrade 1.0.47 -> 1.0.49
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
X-List-Received-Date: Tue, 29 Oct 2019 01:01:23 -0000
Content-Type: text/plain

1) Upgrade pure-ftpd from 1.0.47 to 1.0.49.

2) Update LIC_FILES_CHKSUM as date has been changed.

3) Update 0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch for 1.0.49.

4) Delete "--with-minimal" to fix error as follows:

/usr/src/debug/pure-ftpd/1.0.49-r0/build/src/../../pure-ftpd-1.0.49/src/ls.c:1080: undefined reference to `modernformat'

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...coded-usr-local-includes-from-configure.a.patch | 37 ++++++++++++++--------
 .../{pure-ftpd_1.0.47.bb => pure-ftpd_1.0.49.bb}   |  7 ++--
 2 files changed, 26 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.47.bb => pure-ftpd_1.0.49.bb} (74%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
index 16a611e..2606a36 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
@@ -8,30 +8,39 @@ Upstream-Status: Inappropriate [config]
 Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 
+Update for 1.0.49.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+
 ---
- configure.ac | 12 ------------
- 1 file changed, 12 deletions(-)
+ configure.ac | 15 ---------------
+ 1 file changed, 15 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3a4209b..695ce68 100644
+index 079e6f0..9a1ec06 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -91,18 +91,6 @@ AX_CHECK_LINK_FLAG([-Wl,-z,relro], [LDFLAGS="$LDFLAGS -Wl,-z,relro"])
+@@ -96,21 +96,6 @@ AX_CHECK_LINK_FLAG([-Wl,-z,relro], [LDFLAGS="$LDFLAGS -Wl,-z,relro"])
  AX_CHECK_LINK_FLAG([-Wl,-z,now], [LDFLAGS="$LDFLAGS -Wl,-z,now"])
  AX_CHECK_LINK_FLAG([-Wl,-z,noexecstack], [LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"])
  
--if test -d /usr/local/include; then
--  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
--fi
--
--if test -d /usr/kerberos/include; then
--  CPPFLAGS="$CPPFLAGS -I/usr/kerberos/include"
--fi
--
--if test -d /usr/local/lib; then
--  LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-if test "x$cross_compiling" != "xyes"; then
+-  for path in \
+-    /usr/kerberos \
+-    /usr/local /opt /usr/local/opt \
+-    /usr/openssl@1.1 /opt/openssl@1.1 /usr/local/opt/openssl@1.1 \
+-    /usr/openssl /opt/openssl /usr/local/opt/openssl; do
+-    if test -d $path/include; then
+-      CPPFLAGS="$CPPFLAGS -I${path}/include"
+-    fi
+-    if test -d $path/lib; then
+-      LDFLAGS="$LDFLAGS -L${path}/lib"
+-    fi
+-  done
 -fi
 -
  CPPFLAGS="$CPPFLAGS -D_FORTIFY_SOURCE=2"
  
  dnl Checks for header files
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.49.bb
similarity index 74%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.49.bb
index e7c530b..5a8e9c1 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.49.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "BSD-0-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0595b4261a04bc2d27f30b9c90796c1f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e25e28bc568d70eb26c3a91387c86ccb"
 
 DEPENDS = "libcap virtual/crypt"
 
@@ -11,11 +11,10 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[md5sum] = "f000e519918682ee6b65090352177d4a"
-SRC_URI[sha256sum] = "4740c316f5df879a2d68464489fb9b8b90113fe7dce58e2cdd2054a4768f27ad"
+SRC_URI[md5sum] = "451879495ba61c1d7dcfca8dd231119f"
+SRC_URI[sha256sum] = "767bf458c70b24f80c0bb7a1bbc89823399e75a0a7da141d30051a2b8cc892a5"
 
 inherit autotools
 
-EXTRA_OECONF = "--with-minimal"
 PACKAGECONFIG[libsodium] ="ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=yes, \
                            ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=no, libsodium"
-- 
2.7.4




