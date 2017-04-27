Return-Path: <andrej.rode@ettus.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E3D8D77E06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 21:19:23 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 194so38108247pfv.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6TOFe0Wy1btw5GWkml0/x3U6dTZRYIPyNHk7CuzXbxE=;
	b=tOEG9xOdoCBNXOtSKSQ49Zkqja0ixULhAeLntOFAxS1rMeo/4pjL+8vKaZwT44uLEZ
	pUyjEuZ2rq3+dx0FGFdDHMtgHDUz0Yojbn0x5Jq+wFoXu/toJu5x+P16J0GF9ruTAaDx
	fkOLuIR7m2V/CXrPVs0kSRIHwDvRap6ObaiKyxqXzQ3TU8OBvHfAZaZZEO9T++nyqb2Q
	XwFLj+2l0l2bPFh4sfy/igWsq8J1A1vnDoB9ou6NuN26r7vhiO1oBSKRdtt3k26MAzby
	5o5hT3IzkPQ8X1S3JeysFksz6s1x6Kr8tNOJgvJTcFiJj9pa+gKpJzIEU4xO9pIVHqVp
	ILww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6TOFe0Wy1btw5GWkml0/x3U6dTZRYIPyNHk7CuzXbxE=;
	b=Q0eEEoP6M5LkipT0LNdE4mpvKOMi1VUjFT0F/j2xlnRpj5cwNLLiFNROsBBdLyeTPH
	IcEQCDsO1dCPglEEYXXw2rUcVqvP3hqVjnaLxT55mIPm6U+bpqDYNZ91kiU3MGIDXA/f
	CpJh5zQAQJUUTaXizzjko8x3t0wQrJLAOw/sYi+cNjJdjg34ehcvVMwTkiuzkgGAHWRD
	GE1im3NRfiiodu0nvznJOntEd/fY0bnaGwv+b1qEqS8WJoHQTQAqXIauFbcuNd/5YddS
	wZWHcII6q2AZpAIfBTTPsrexl72SK7k3/DoXwBgaEBy/hfjMFtqgI5OyEUiqe1DY60u1
	AReg==
X-Gm-Message-State: AN3rC/5FuoIXdHJkLvEHLdOohefkHiaMMtjnt68cIxs07oE48N0Zj6O7
	kHQzE+rjSthUzZNQ
X-Received: by 10.98.26.70 with SMTP id a67mr8303614pfa.117.1493327964946;
	Thu, 27 Apr 2017 14:19:24 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id x9sm6949052pff.98.2017.04.27.14.19.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Apr 2017 14:19:24 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Apr 2017 14:19:22 -0700
Message-Id: <20170427211922.10843-1-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH] gevent: update 0.13.8 -> 1.2.1
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
X-List-Received-Date: Thu, 27 Apr 2017 21:19:24 -0000

Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
---
 .../python/python-gevent/libev-conf.patch          | 26 ++++++++++++++++++++
 .../python/python-gevent_0.13.8.bb                 | 15 ------------
 .../recipes-devtools/python/python-gevent_1.2.1.bb | 28 ++++++++++++++++++++++
 3 files changed, 54 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-gevent/libev-conf.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python-gevent_1.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-gevent/libev-conf.patch b/meta-python/recipes-devtools/python/python-gevent/libev-conf.patch
new file mode 100644
index 0000000..79c1867
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-gevent/libev-conf.patch
@@ -0,0 +1,26 @@
+From 2294734ef9d5e2efb05820e9759a1635799bdea9 Mon Sep 17 00:00:00 2001
+From: Andrej Rode <andrej.rode@ettus.com>
+Date: Mon, 10 Apr 2017 19:25:18 -0700
+Subject: [PATCH] libev: make configure crosscompile compatible
+
+Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
+---
+ deps/libev/configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/libev/configure b/deps/libev/configure
+index 743817e..96c2366 100755
+--- a/deps/libev/configure
++++ b/deps/libev/configure
+@@ -2208,7 +2208,7 @@ fi
+ ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
++ac_link='$CC -static -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+ 
+-- 
+2.10.2
+
diff --git a/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb b/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
deleted file mode 100644
index d1c0a3c..0000000
--- a/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "A coroutine-based Python networking library"
-DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
-a high-level synchronous API on top of the libevent event loop."
-HOMEPAGE = "http://www.gevent.org"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2 \
-                    file://LICENSE.pyevent;md5=718070c63de243053e2c616268b00fdd"
-DEPENDS += "python-greenlet libevent"
-RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
-
-SRC_URI[md5sum] = "ca9dcaa7880762d8ebbc266b11252960"
-SRC_URI[sha256sum] = "54b8d26300ce408c0916a3e63ef6cd3e6aca76230833558deb7de15196ed955e"
-
-inherit pypi setuptools
-
diff --git a/meta-python/recipes-devtools/python/python-gevent_1.2.1.bb b/meta-python/recipes-devtools/python/python-gevent_1.2.1.bb
new file mode 100644
index 0000000..953f48f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-gevent_1.2.1.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A coroutine-based Python networking library"
+DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
+a high-level synchronous API on top of the libevent event loop."
+HOMEPAGE = "http://www.gevent.org"
+LICENSE = "MIT & Python-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2 \
+                    file://NOTICE;md5=5966cd2c6582656d28ab3c33da3860f8 \
+                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
+DEPENDS += "python-greenlet libevent"
+RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
+
+SRC_URI_append = " \
+    file://libev-conf.patch;patch=1;pnum=1 \
+"
+
+SRC_URI[md5sum] = "6700a2433c8e0635425e6798760efc81"
+SRC_URI[sha256sum] = "3de300d0e32c31311e426e4d5d73b36777ed99c2bac3f8fbad939eeb2c29fa7c"
+
+# The python-gevent has no autoreconf ability
+# and the logic for detecting a cross compile is flawed
+# so always force a cross compile
+do_configure_append() {
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
+}
+
+inherit pypi setuptools
+
-- 
2.10.2


