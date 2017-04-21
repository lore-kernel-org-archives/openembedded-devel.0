Return-Path: <andrej.rode@ettus.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0B11B6093F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 21:04:02 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id g66so767327ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6TOFe0Wy1btw5GWkml0/x3U6dTZRYIPyNHk7CuzXbxE=;
	b=RVY2gfVTNcMxpu95Z8s3eUe0HkW2eey/bD2c4MmAF7FQaTZIoja/WAOkjB4RT0oit7
	G5vF2rPn8i6RRtfIMALfOAQyhlWQaRSJeCWX2EF+7qVhrRqH52j0QBgoNS3yMDbv8Bs9
	QeK6Qc6DpG76O6FYK4dQWholqB3RmboEzGkNk4jzIPdvfdknDsaeljm4J4oE6k8+quFC
	VS8CH4wq9NYQxs0bNoEj/3T9+qFOjyNMtXji3CTwCFxehqvQKGZegbQnRCy1fTNWtGrj
	/PIJeGleQF/2uOljegBA9/yiP+2M6R0RW91YXxsnvRq6Fr6bXrDAH0BUEX55CPTjD5Kp
	paGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6TOFe0Wy1btw5GWkml0/x3U6dTZRYIPyNHk7CuzXbxE=;
	b=UbpwlWgTzH9XZ7mZI6AT9s2kbT98dFazl9Uf9seBbHghon+9g6281/wbeGnMQcPMr9
	kPMrLYAdTMf6+Rm+/Y4wA7ExPWGEao660tL6wov4jVvPZ5nwsTNjhlgFRC6yaosFGM8U
	oIJsc4mGiUdoHL9NePyQ38MgLr5WAnSJ5g6DHjvLSipw9Ap7m86bFCv7y632FiyMVDUQ
	XMj/WDmLjOGJXLXOxcwGB+9yLWibxirnNWAYTqR8tJTFFiFF0GWDqFXBoWeJDq19mViA
	GnZrRI+jXOnBbU1hjdrofhKeLQR079zDd4n8+SwcRUN1Ilo61qVdqIhz8bZ7tF5KLSi3
	OJIw==
X-Gm-Message-State: AN3rC/6G8+d84nvhUV0lUz8PtUUVeRgs1lewzu2yTTsHfrF8VtzJUcZn
	X0C5P3fK/VR/2ipa
X-Received: by 10.84.241.65 with SMTP id u1mr18132910plm.28.1492808643206;
	Fri, 21 Apr 2017 14:04:03 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	i189sm17571486pgd.61.2017.04.21.14.04.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Apr 2017 14:04:02 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Apr 2017 14:03:16 -0700
Message-Id: <20170421210316.12798-1-andrej.rode@ettus.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 21:04:03 -0000

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


