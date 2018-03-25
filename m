Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 39D3378690
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:38 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v21so10736520wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aQqPC8nUIaELO7JsPxfXigh0GPLNO2dJNMPvLfE6ZSs=;
	b=XljSaWdBtvWpQjOTM+i+hmDmagfV4tRkDOdpnBSKK82EcPvqmrsHWewTRWKAOP5Hye
	4DyKkp4jsuNa9dnSB0Ja7kRknnjCFgbUkT6r/LFxVc9aR3NZkAQyNGRPb8FlBM8t8mAY
	ZjS1g2v+bZs9iMuBFciqTUt3mzeFo/UKPdyiz3zfqXveiBqdA8GdPMKE/FFF1+0jUKEu
	PSvzkNOKPR0y6lrAJdz5OIre+ix+4rpszZp1kz+i08AB2/RcRen9gpizddSNNsXzUKcV
	TCniw9ypz6tTfAqWRE2hDwyzcpyzE/zFF47xxofm12Y2bNwgEd9h2TIVuEuGUkw8PPMY
	H/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aQqPC8nUIaELO7JsPxfXigh0GPLNO2dJNMPvLfE6ZSs=;
	b=JjMaFH32O9vR+QlTdSSa/yU12EvR/QRi9OTWPZiq7YtCYNi6x4JiIbDUvWCwp3AjrW
	mU6+MKMyfqKjTgJz1WFzO+v2DlcjSBI9gfW2r/WdYlM8Ohb7IALqFVupUm/y1TVMAfEq
	3mVNo6KxXOtZ82OlfGbteqIII4sbaAO8eVzWzyPhX05ZPDuHfmaVuw3WM4xVigY8WxGv
	3DRYuXd2Aj+GlYmx4fDpOrDPbvh0v1lboUHKUxyxerdtSEALvY8tFmPfnkBl7ijOZDTR
	siTQ4JHfST3xpai7OH1YT+46J3V2X24LxAnwe1lGiJZADfCudixGFU6YopEmy0trSxqw
	SArA==
X-Gm-Message-State: AElRT7HRyV6qvNoa6v2VkswSByR8cLYMHf1ekVxpafqXLC03lZz6UTrt
	5T+hmeXw2VU0tzqkgFnHh8S5eQ==
X-Google-Smtp-Source: AIpwx48zmOhH/nmy8etolKMaa68xgJtkXLABvVnaA7r4Te4cY83/OZuEKjK1dn0qKubrk8EPPO7Wuw==
X-Received: by 10.28.106.1 with SMTP id f1mr5443833wmc.59.1521981339513;
	Sun, 25 Mar 2018 05:35:39 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:08 +0200
Message-Id: <20180325123520.16452-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/20] gnome-keyring: update 2.32.1 -> 3.20.0
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* update to 3.28.0 is not yet possible due to gcr >= 3.27.90 required
* license: Many sourcefiles are gone and those still left reference to
  COPYING or COPYING.LIB
* recipe cleanup

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-keyring/gnome-keyring/egg-asn1x.patch    | 55 --------------------
 .../gnome-keyring/gnome-keyring_2.32.1.bb          | 58 ----------------------
 .../gnome-keyring/gnome-keyring_3.20.0.bb          | 42 ++++++++++++++++
 3 files changed, 42 insertions(+), 113 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
deleted file mode 100644
index ad8a40ccf..000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Fixed build error with gcc 4.8
-
-Errors like below
-
-egg-asn1x.c: In function 'anode_encode_build':
-egg-asn1x.c:1280:7: warning: variable 'type' set but not used [-Wunused-but-set-variable]
-egg-asn1x.c: In function 'traverse_and_prepare':
-egg-asn1x.c:3354:3: warning: passing argument 1 of 'egg_asn1x_create' from incompatible pointer type [enabled by default]
-In file included from egg-asn1x.c:50:0:
-egg-asn1x.h:38:8: note: expected 'const struct static_struct_asn *' but argument is of type 'const struct asn1_static_node *'
-egg-asn1x.c: At top level:
-egg-asn1x.c:3509:1: error: conflicting types for 'egg_asn1x_create'
-In file included from egg-asn1x.c:50:0:
-egg-asn1x.h:38:8: note: previous declaration of 'egg_asn1x_create' was here
-egg-asn1x.c:3572:1: error: conflicting types for 'egg_asn1x_create_quark'
-In file included from egg-asn1x.c:50:0:
-egg-asn1x.h:41:8: note: previous declaration of 'egg_asn1x_create_quark' was here
-egg-asn1x.c:3579:1: error: conflicting types for 'egg_asn1x_create_and_decode'
-In file included from egg-asn1x.c:50:0:
-egg-asn1x.h:44:8: note: previous declaration of 'egg_asn1x_create_and_decode' was here
-make[4]: *** [libegg_la-egg-asn1x.lo] Error 1
-
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: gnome-keyring-2.32.1/egg/egg-asn1x.h
-===================================================================
---- gnome-keyring-2.32.1.orig/egg/egg-asn1x.h	2010-10-18 19:11:38.000000000 -0700
-+++ gnome-keyring-2.32.1/egg/egg-asn1x.h	2013-06-11 15:15:00.675399263 -0700
-@@ -25,6 +25,7 @@
- #define EGG_ASN1X_H_
- 
- #include <glib.h>
-+#include <libtasn1.h>
- 
- #ifndef HAVE_EGG_ALLOCATOR
- typedef void* (*EggAllocator) (void* p, gsize);
-@@ -35,13 +36,13 @@
- 
- struct static_struct_asn;
- 
--GNode*              egg_asn1x_create                 (const struct static_struct_asn *defs,
-+GNode*              egg_asn1x_create                 (const ASN1_ARRAY_TYPE *defs,
-                                                       const gchar *type);
- 
--GNode*              egg_asn1x_create_quark           (const struct static_struct_asn *defs,
-+GNode*              egg_asn1x_create_quark           (const ASN1_ARRAY_TYPE *defs,
-                                                       GQuark type);
- 
--GNode*              egg_asn1x_create_and_decode      (const struct static_struct_asn *defs,
-+GNode*              egg_asn1x_create_and_decode      (const ASN1_ARRAY_TYPE *defs,
-                                                       const gchar *type,
-                                                       gconstpointer data,
-                                                       gsize n_data);
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
deleted file mode 100644
index 9d85c651c..000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-SUMMARY = "Password and keyring managing daemon"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://gcr/gcr.h;endline=22;md5=a272df1e633e27ecf35e74fb5576250e \
-                    file://egg/egg-dbus.h;endline=25;md5=eb6f531af37165dc53420c073d774e61 \
-                    file://gp11/gp11.h;endline=24;md5=bd8c7a8a21d6c28d40536d96a35e3469 \
-                    file://pkcs11/pkcs11i.h;endline=24;md5=e72cfbb718389b76a4dae838d1c1f439"
-
-SECTION = "x11/gnome"
-
-PR = "r12"
-
-inherit distro_features_check autotools gnome gtk-doc pkgconfig gsettings
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI += "file://egg-asn1x.patch \
-            file://musl.patch \
-"
-
-DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
-RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
-
-LDFLAGS += "-lgmodule-2.0"
-
-EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
-
-SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
-SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
-GNOME_COMPRESS_TYPE="bz2"
-
-FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
-                ${base_libdir}/security/*${SOLIBSDEV} \
-               "
-
-FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
-                    ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
-                    ${libdir}/${BPN}/standalone/*.la \
-                    ${base_libdir}/security/*.la \
-                   "
-
-INSANE_SKIP_${PN}-dev += "dev-elf"
-
-FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
-                    ${libdir}/${BPN}/devel/.debug/ \
-                    ${base_libdir}/security/.debug/"
-
-# Make compatible with gcr version 3 or newer by removing
-# org.gnome.crypto.pgp.*, which is the provider for this optional
-# functionality.
-
-do_install_append() {
-	rm ${D}${datadir}/GConf/gsettings/org.gnome.crypto.pgp.convert
-	rm ${D}${datadir}/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
-}
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
new file mode 100644
index 000000000..adf2ff926
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Password and keyring managing daemon"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/gnome"
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+
+inherit distro_features_check gnomebase
+
+DEPENDS = " \
+    intltool-native \
+    glib-2.0-native \
+    gtk+3 \
+    gcr \
+    libgcrypt \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
+"
+
+SRC_URI[archive.md5sum] = "e09efe8021944dae404736b5a2adb98e"
+SRC_URI[archive.sha256sum] = "bc17cecd748a0e46e302171d11c3ae3d76bba5258c441fabec3786f418e7ec99"
+SRC_URI += "file://musl.patch"
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
+
+EXTRA_OECONF = " \
+    --disable-doc \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)} \
+"
+
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1/services \
+    ${datadir}/p11-kit \
+    ${base_libdir}/security/*${SOLIBSDEV} \
+    ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
+"
-- 
2.14.3


