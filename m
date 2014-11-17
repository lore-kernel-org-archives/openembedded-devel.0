Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 11C2F72151
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 09:18:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43491360"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Nov 2014 17:15:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAH9I2fL012925
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 17:18:03 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 17 Nov 2014 17:18:20 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Nov 2014 17:15:39 +0800
Message-ID: <1416215740-36026-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416215740-36026-1-git-send-email-biannm@cn.fujitsu.com>
References: <1416215740-36026-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 1/2] Porting libesmtp from openembedded.
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
X-List-Received-Date: Mon, 17 Nov 2014 09:18:26 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../libesmtp/libesmtp/include-topdir.patch         | 48 ++++++++++++++++++++++
 .../recipes-support/libesmtp/libesmtp_1.0.6.bb     | 37 +++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb

diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch b/meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch
new file mode 100644
index 0000000..90c4ce7
--- /dev/null
+++ b/meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch
@@ -0,0 +1,48 @@
+diff -Nurp libesmtp-1.0.6.org/crammd5/Makefile.am libesmtp-1.0.6/crammd5/Makefile.am
+--- libesmtp-1.0.6.org/crammd5/Makefile.am	2010-08-08 23:45:57.000000000 +0800
++++ libesmtp-1.0.6/crammd5/Makefile.am	2014-11-17 11:17:21.663624295 +0800
+@@ -2,7 +2,7 @@
+ 
+ libdir = @plugindir@
+ 
+-INCLUDES = -I@srcdir@
++INCLUDES = -I@srcdir@ -I@srcdir@/../
+ AM_CFLAGS = @CFLAGS@ @EXTRA_CFLAGS@
+ 
+ lib_LTLIBRARIES = sasl-cram-md5.la
+diff -Nurp libesmtp-1.0.6.org/login/Makefile.am libesmtp-1.0.6/login/Makefile.am
+--- libesmtp-1.0.6.org/login/Makefile.am	2010-08-08 23:45:56.000000000 +0800
++++ libesmtp-1.0.6/login/Makefile.am	2014-11-17 11:17:54.339623018 +0800
+@@ -2,7 +2,7 @@
+ 
+ libdir = @plugindir@
+ 
+-INCLUDES = -I@srcdir@
++INCLUDES = -I@srcdir@ -I@srcdir@/../
+ 
+ lib_LTLIBRARIES = sasl-login.la
+ AM_CFLAGS = @CFLAGS@ @EXTRA_CFLAGS@
+diff -Nurp libesmtp-1.0.6.org/ntlm/Makefile.am libesmtp-1.0.6/ntlm/Makefile.am
+--- libesmtp-1.0.6.org/ntlm/Makefile.am	2010-08-08 23:45:56.000000000 +0800
++++ libesmtp-1.0.6/ntlm/Makefile.am	2014-11-17 11:18:10.551622385 +0800
+@@ -2,7 +2,7 @@
+ 
+ libdir = @plugindir@
+ 
+-INCLUDES = -I@srcdir@
++INCLUDES = -I@srcdir@ -I@srcdir@/../
+ AM_CFLAGS = @CFLAGS@ @EXTRA_CFLAGS@
+ 
+ lib_LTLIBRARIES = sasl-ntlm.la
+diff -Nurp libesmtp-1.0.6.org/plain/Makefile.am libesmtp-1.0.6/plain/Makefile.am
+--- libesmtp-1.0.6.org/plain/Makefile.am	2010-08-08 23:45:54.000000000 +0800
++++ libesmtp-1.0.6/plain/Makefile.am	2014-11-17 11:18:33.355621494 +0800
+@@ -2,7 +2,7 @@
+ 
+ libdir = @plugindir@
+ 
+-INCLUDES = -I@srcdir@
++INCLUDES = -I@srcdir@ -I@srcdir@/../
+ AM_CFLAGS = @CFLAGS@ @EXTRA_CFLAGS@
+ 
+ lib_LTLIBRARIES = sasl-plain.la
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
new file mode 100644
index 0000000..938963d
--- /dev/null
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
@@ -0,0 +1,37 @@
+SUMMARY = "SMTP client library"
+DESCRIPTION = "LibESMTP is a library to manage posting \
+(or submission of) electronic mail using SMTP to a \
+preconfigured Mail Transport Agent (MTA) such as Exim or PostFix."
+HOMEPAGE = "http://www.stafford.uklinux.net/libesmtp/"
+LICENSE = "LGPLv2+"
+SECTION = "libs/network"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://www.stafford.uklinux.net/libesmtp/libesmtp-${PV}.tar.bz2 \
+           file://include-topdir.patch"
+SRC_URI[md5sum] = "bf3915e627fd8f35524a8fdfeed979c8"
+SRC_URI[sha256sum] = "d0a61a5c52d99fa7ce7d00ed0a07e341dbda67101dbed1ab0cdae3f37db4eb0b"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
+
+inherit autotools binconfig
+
+#EXTRA_OECONF = "--disable-isoc --with-openssl=${STAGING_LIBDIR}/.."
+
+EXTRA_OECONF = " --with-auth-plugin-dir=${libdir}/esmtp-plugins \
+                 --enable-pthreads                              \
+                 --enable-debug                                 \
+                 --enable-etrn                                  \
+                 --disable-isoc                                 \
+                 --disable-more-warnings                        \
+                 --disable-static                               \
+               "
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS} \
+               ${libdir}/esmtp-plugins/*${SOLIBSDEV}"
+
+FILES_${PN}-dev  += "${libdir}/esmtp-plugins/*.la"
+FILES_${PN}-static += "${libdir}/esmtp-plugins/*.a"
+FILES_${PN}-dbg += "${libdir}/esmtp-plugins/.debug/"
-- 
1.9.1


