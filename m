Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id CD1837F387
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 04:03:33 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 19so42685121pfa.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2019 21:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AdMld6xOn5g+Mwd0hJl2H7sRiUrnV3TPlR9m8OHLP/Q=;
	b=C4vfQGpQVVNqv3mNdxe3p87cRMBZtLGDnIsnagss9+UyaQAfN0UgOzu8typBTVIXgs
	llL+Kr/KXrc2AdwblCdJ9gNiohG/RyCG/vt6BJsCsI+GK98LQoEe8Ssc9DS2cZeOFouz
	+pzY2UI160Elrk/05iVQ6iFcxilq7xwiGFVOBC8gTxmXjRZIp3rmAqrv3efeqjBr6O0+
	9mrMbqxdyGThQxYOnw9DaLZZKiXkuRIyVUk99Aqdx7TBTmlWKIxCGjsnwDoS4PEAnzuT
	MoDEWvZLMXBBwxl6MmCKZkZ0epPhYkERXlCNtINBJtpPmYisVcqJplPueC75cm6pRkxM
	idOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AdMld6xOn5g+Mwd0hJl2H7sRiUrnV3TPlR9m8OHLP/Q=;
	b=mLi99LiG0GMVVhw9yniHdPvXxj8m3WIHIXMvxAOoL6ZS2Fi8xoyJwkAh0KfjlTQYWe
	rOQW4ZRaVutlb7gIJE3M+O5Me7BCoSVq1z0pd9kTwYaeDg8aaiyL9lgWbrXbGduaiYGJ
	PO6Q2cy7Cck6/3aC+MLQbWLNUwBcKb5gXkjiDzYOn1VbSst21kTSvKZ9QewGsyVAS0xs
	bIXMDUelD7F9fDDejwD1vr+ARF7fD42mZ43UvvxIci5ahk5bVj9KeY/Y9N6pfPCgRTDJ
	5kXxTqaGDpGoXP25fe3ZdwroutVHxvbxkA/PP0X9PpxnDgnoXmACgPb3ma3xHLtr919c
	WMhg==
X-Gm-Message-State: APjAAAVL+tBEsp8eYwjXsIy78/T9xzVuXt/mAZJ5m39xBDLZ8tCrgqD+
	ftJ47xNRzHfK8+Oz1HPFpa+FGDf3K5Q=
X-Google-Smtp-Source: APXvYqyXN/2DPNAcCR4wDmU8UE2jlI8ay1XSuZSAlG83lpW6EJTyHSPNsOnDrGZaEtTBUCSTeJKWEg==
X-Received: by 2002:a17:90a:2008:: with SMTP id n8mr6360307pjc.4.1565150614298;
	Tue, 06 Aug 2019 21:03:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	p27sm133054061pfq.136.2019.08.06.21.03.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 21:03:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Aug 2019 21:03:23 -0700
Message-Id: <20190807040323.17521-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807040323.17521-1-raj.khem@gmail.com>
References: <20190807040323.17521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] graphviz: Do not build tcl support for target
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
X-List-Received-Date: Wed, 07 Aug 2019 04:03:33 -0000
Content-Transfer-Encoding: 8bit

tclpkg looks for tclsh on buildhost and if we try to use the native
version then it groks the paths from the native sysroot and builds and
installs the target tcl packages into the same path, in the end it ends
up being wrongly packaged. Therefore its best to disable tcl

Secondly, package python and perl pieces into independent packages so
the runtime dependencies are also set accordingly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-be-empty-string-if-tcl-is-disabled.patch | 33 +++++++++++++++++++
 .../graphviz/graphviz_2.40.1.bb               | 19 ++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
new file mode 100644
index 0000000000..21bf1bcd5c
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
@@ -0,0 +1,33 @@
+From 564901ab78da2b2b1bed92351dc3c102dc0a8154 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Aug 2019 17:51:39 -0700
+Subject: [PATCH] Set use_tcl to be empty string if tcl is disabled
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -1676,7 +1676,7 @@ AC_ARG_ENABLE(tcl,
+   [], [enable_tcl=yes])
+ 
+ if test "x$enable_tcl" != "xyes"; then
+-  use_tcl="No (disabled)"
++  use_tcl=""
+ fi
+ 
+ if test "x$use_tcl" = "x"; then
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -19,7 +19,7 @@ pkginclude_HEADERS = $(top_builddir)/gra
+ man_MANS = graphviz.7
+ 
+ # $(subdirs) contains the list from: AC_CONFIG_SUBDIRS
+-SUBDIRS = $(subdirs) lib plugin cmd tclpkg doc contrib share graphs rtest tests
++SUBDIRS = $(subdirs) lib plugin cmd doc contrib share graphs rtest tests
+ 
+ .PHONY: doxygen
+ doxygen:
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
index fb8ea2a5b3..176cf4498a 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -29,7 +29,10 @@ SRC_URI = "https://gitlab.com/graphviz/graphviz/-/archive/stable_release_${PV}/g
            file://0001-plugin-pango-Include-freetype-headers-explicitly.patch \
 "
 # Use native mkdefs
-SRC_URI_append_class-target = " file://0001-Use-native-mkdefs.patch"
+SRC_URI_append_class-target = "\
+           file://0001-Use-native-mkdefs.patch \
+           file://0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch \
+"
 SRC_URI[md5sum] = "2acf30ca8e6cc8b001b0334db65fd072"
 SRC_URI[sha256sum] = "e6c3f8dbfde1c4523055403927bef29f97f9fc12715c1042b5dcf648a2c1c62a"
 
@@ -40,6 +43,7 @@ EXTRA_OECONF_class-target = "\
                 --with-expatlibdir=${STAGING_LIBDIR} \
                 --without-included-ltdl \
                 --disable-java \
+                --disable-tcl \
                 --disable-r \
                 --disable-sharp \
                 "
@@ -55,6 +59,19 @@ do_install_append_class-native() {
     install -m755 ${B}/lib/gvpr/mkdefs ${D}${bindir}
 }
 
+PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
+
+FILES_${PN}-python += "${libdir}/python*/site-packages/ ${libdir}/graphviz/python/"
+FILES_${PN}-perl += "${libdir}/perl5/*/vendor_perl/ ${libdir}/graphviz/perl/"
+FILES_${PN}-demo += "${datadir}/graphviz/demo/"
+
+RDEPENDS_${PN}-perl += "perl"
+RDEPENDS_${PN}-python += "python"
+RDEPENDS_${PN}-demo += "python perl"
+
+INSANE_SKIP_${PN}-perl = "dev-so"
+INSANE_SKIP_${PN}-python = "dev-so"
+
 FILES_SOLIBSDEV_append = " ${libdir}/graphviz/lib*${SOLIBSDEV}"
 
 BBCLASSEXTEND = "native"
-- 
2.22.0


