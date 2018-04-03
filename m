Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DDEAA74870
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 07:32:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38496398"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Apr 2018 15:30:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7FF594724009
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:30:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 3 Apr 2018 15:30:25 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Apr 2018 15:30:33 +0800
Message-ID: <1522740633-13532-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 7FF594724009.A64A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] wireshark: 2.2.11 -> 2.4.5
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
X-List-Received-Date: Tue, 03 Apr 2018 07:32:33 -0000
Content-Type: text/plain

1.Upgrade wireshark from 2.2.11 to 2.4.5.
2.Delete one configure option "--with-gcrypt", since it has been not supported in 2.4.5.
3.Add 0001-use-pkgconfig-to-check-libgcrypt.patch, since libgcrypt does no longer provide
  libgcrypt-config, and provide *.pc, so we should use pkgconfig to check.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../0001-use-pkgconfig-to-check-libgcrypt.patch    | 29 ++++++++++++++++++++++
 .../{wireshark_2.2.11.bb => wireshark_2.4.5.bb}    | 11 ++++----
 2 files changed, 35 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-support/wireshark/wireshark/0001-use-pkgconfig-to-check-libgcrypt.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.11.bb => wireshark_2.4.5.bb} (91%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark/0001-use-pkgconfig-to-check-libgcrypt.patch b/meta-networking/recipes-support/wireshark/wireshark/0001-use-pkgconfig-to-check-libgcrypt.patch
new file mode 100644
index 0000000..c2cb078
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark/0001-use-pkgconfig-to-check-libgcrypt.patch
@@ -0,0 +1,29 @@
+Subject: [PATCH] use pkgconfig to check libgcrypt
+
+Upstream-status: Inappropriate [configuration]
+
+libgcrypt does no longer provide libgcrypt-config, and provide
+*.pc, so we should use pkgconfig to check
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4b8654a..4182875 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -303,8 +303,8 @@ if test "x$with_gnutls" = "xyes"; then
+ fi
+
+ # libgrypt (for decryption, MAC, etc. functionality).
+-AM_PATH_LIBGCRYPT(1.4.2, [ ] , [
+-  AC_MSG_ERROR([[libgcrypt not installed for development; install libgcrypt, including any development package, for your system]])
++PKG_CHECK_MODULES([LIBGCRYPT], [libgcrypt >= 1.4.2], [ ],
++[AC_MSG_ERROR([libgcrypt not installed for development; install libgcrypt, including any development package, for your system])
+ ])
+
+ AC_ARG_WITH(libnl,
+--
+2.7.4
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
similarity index 91%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
index 5eb372e..d6669b7 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
@@ -4,14 +4,16 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt"
 
-SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
+SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.xz \
+	   file://0001-use-pkgconfig-to-check-libgcrypt.patch \
+"
 
 PE = "1"
 
-SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
-SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
+SRC_URI[md5sum] = "2b6f1f37c72fa15a0a1863016a0abcc0"
+SRC_URI[sha256sum] = "b3b2ec29fba0f4a3a590438abe4054e56f19108d440fc2d61492db9d8ff16fd7"
 
 inherit autotools pkgconfig perlnative
 
@@ -30,7 +32,6 @@ PACKAGECONFIG[gtk2] = "--with-gtk=2, , gtk+"
 PACKAGECONFIG[gtk3] = "--with-gtk=3, , gtk+3"
 PACKAGECONFIG[graphics] = "--enable-wireshark, --with-gtk=no --disable-wireshark,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
-PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
 PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
 PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
-- 
2.7.4




