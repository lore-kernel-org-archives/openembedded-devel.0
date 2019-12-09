Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 958747FAAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:55 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w15so14169450wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=c1RA5pNuF89djl7JRoT9K56j/fmXR+o7Gq+MwiJ5Oys=;
	b=W3bov0svGPHVmvEtUB/Wg2DOEexU6enoKI9/gwvMuva52/S9WRMUI819seF5aIa/b1
	3fMgB7DSuIgeeW+xfRndIK1AZxbo8Le5qjMfuJJPk9c64pj6HCSThSd+oLXNb0gX235e
	z4PKVWVSH0Zp3jHJKODS0LE4y/JxLB0qhnpvPpbKrMNV5EPzuExM3v0IEp/rLhyUbZj/
	2n4bDu7NcjKe+QHT2ovAPYJpte7hECzxc+VBTdpfh+pNCFV9MTRU+ilvrfdhuc3W2VfZ
	ecC/MqhAoEd/lsZ0KqDyqcqbxm93jH6Jn/xndYmGv+wMQVo/RKCpNwnNFNm7tanamGuD
	deGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c1RA5pNuF89djl7JRoT9K56j/fmXR+o7Gq+MwiJ5Oys=;
	b=qB3hgNqSByduvg/UBFqpibgMxJhAzdi/CDQ5Nf1cVW/toKs7KEqFFlNNZcBDDDqnTe
	WXCcFpCQG5pqpKCi2BH8fSa6hqCCBMSSK5DLL0dWM2dxyEPm/FD2AqSkF16ThCsVCtQg
	eJnMM6zvYN7yW7HrhIwVSS7cXYk5OPWGg98w5NAWdmvPNVrvwS9Gwb0/mZX1O0Jqs3M5
	NouWV1cKfSUwniWnYnP4qiN9eQoAlRQMlfEK/xny5886jt0eECu5FxGycGlaCvBQz1y8
	sYgD3NgnCyZ5vRxbdXSqTbaAuKFXsuI/VC2Cq6vqS4WglmiN6AylWkrPMMgMHDc1qf7m
	sdcw==
X-Gm-Message-State: APjAAAUDz0K9niSRnR/aY/dDHh3pqblUo4uKbP3/K9+jbwaoxtfzOV/z
	D6qjkeaMUFVok1nJZ7pvARhEcrle
X-Google-Smtp-Source: APXvYqzjjaidhMFDLTx2CZCu5P8kdMpY97u6s1YYT/ekGPTkObj/h3Goj20pVWf7ZhMDYf9kU/HnLg==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr28720730wro.105.1575851936189;
	Sun, 08 Dec 2019 16:38:56 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:16 +0100
Message-Id: <20191209003840.3383-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/29] gjs: initial add 1.58.3
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is a dependency for upcoming gnome shell
* this is the latest stable version currently [1]

[1] http://ftp.gnome.org/pub/gnome/sources/gjs/1.63/gjs-1.63.1.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 +++++++++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
new file mode 100644
index 000000000..0953214fb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
@@ -0,0 +1,33 @@
+From 95379de2132786f855e8caec1fd5869225774d02 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 18 May 2019 01:14:07 +0200
+Subject: [PATCH] Disable tests on host
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fa4e136..056e96e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -335,9 +335,7 @@ AS_IF([test "x$with_dbus_tests" != "xno"], [
+ ])
+ AM_CONDITIONAL([DBUS_TESTS], [test "x$with_dbus_tests" != "xno"])
+ 
+-AC_MSG_CHECKING([for a suitable UTF-8 locale to run the tests in])
+-TESTS_LOCALE=$($srcdir/build/choose-tests-locale.sh)
+-AC_MSG_RESULT([$TESTS_LOCALE])
++TESTS_LOCALE=C
+ AC_SUBST([TESTS_LOCALE])
+ 
+ AC_SUBST([gjsjsdir], [\${datadir}/gjs-1.0])
+-- 
+2.20.1
+
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
new file mode 100644
index 000000000..ddd5196b2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Javascript bindings for GNOME"
+LICENSE = "MIT & LGPLv2+"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=beb29cf17fabe736f0639b09ee6e76fa \
+    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7 \
+"
+
+GNOMEBASEBUILDCLASS = "autotools"
+
+DEPENDS = "mozjs gtk+3"
+
+inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
+
+SRC_URI[archive.md5sum] = "bce6dea9a6583a8b3c6af5854df76aaf"
+SRC_URI[archive.sha256sum] = "ca9fcd47b95ab0fc445301b2595e51fcea24d6f3cd87c190fe07006146d773ae"
+SRC_URI += "file://0001-Disable-tests-on-host.patch"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+
+EXTRA_OECONF = " \
+    --without-dbus-tests \
+    --disable-installed-tests \
+"
+
+do_configure_prepend() {
+    # make configure find gobject-introspection test code. Although we set
+    # --disable-installed-tests gjs builds them
+    sed -i 's|:$GI_DATADIR|:${STAGING_DIR_NATIVE}$GI_DATADIR|g' ${S}/configure.ac
+}
+
+FILES_${PN} += "${datadir}/gjs-1.0/lsan"
+
+PACKAGES =+ "${PN}-valgrind"
+FILES_${PN}-valgrind = "${datadir}/gjs-1.0/valgrind"
+RSEPENDS_${PN}-valgrind += "valgrind"
-- 
2.21.0


