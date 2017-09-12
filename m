Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 27DD978415
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:34:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f4so8714260wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SK7TC7HuREKT4+n0wnCIMpPkEEjYoLW/LQJ97cirUZE=;
	b=R/B23oC7SaAwamUWNToS0P3el7c19XxCsXAJLCcrim2I16+ElbTs7/ye6BwWqAdM4m
	vr1/9Wx9wW4WYcTv5ZEONL7I6zzyejaZvI7Kmb4MI9GxwKip2Ys+MIbaNm/ZmuCt4NmD
	HuIH1X5/9Q7W89fxZjc+ZCXTvLsAiUcMomxf2i6XystbaHq0eEPePGrBN4EfCwYGT3sP
	/S1l+SO/G/O11Hx61PqVDEgzjcMFI9fUEZ8qGtPPYjvmkqmSbXl3myKZ18A3ZXSmE6g3
	eBaHs9V7Qhy4x3CMpYKoPPd7HNDp/Y+D/0Vz6gDt01hxpwuXCEyj8+0pRybGHiwbRkQ1
	rmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SK7TC7HuREKT4+n0wnCIMpPkEEjYoLW/LQJ97cirUZE=;
	b=mfy/N5OO/MKiBbu17Y2uWIS20M93Tr0ccEpQRWv3+lCHU0Lr+G0axEtoB56M1RO1zn
	QG7vIP8ffArzZFBORgsTb/2sxIBrTrC5KWX/TVSnDdgIQ+ySX7H/Dw8lUGBqIdq5l8Vm
	c+AtDDe60uT+d3pBeq6vSmfm7j7gA6P+UpjekVa2z8P46ZvFd0GPrY9G+kM8qjg7F/zw
	bwbM+Mzx2WM7sxryGt1p6ay3x4DvsJU5oX9PIdGskLJlbRmr+4394hUqzJw6ileDPev+
	WHAHGuvPe3bbbY0JmrEbaHSgR0/+JOQH38AI3FwICNfrjwJky9wAyQSXz9B4/IHG+gMa
	npFw==
X-Gm-Message-State: AHPjjUgm5UjEwVXvGF+cqsHyTs7Pxnn9czZomkZ8F1p3nj8BLojqC9le
	pf0tECXisUjWzmfKw2TqSLeZkQ==
X-Google-Smtp-Source: AOwi7QDOpC6oXBPyIJxdcIbFUeT04kwPgszgwNk/m5028G/eeAP+RxVgHvRGaJsQzteTp8u6S8z9Jw==
X-Received: by 10.28.208.72 with SMTP id h69mr4295095wmg.134.1505205241553;
	Tue, 12 Sep 2017 01:34:01 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l73sm22050707wma.24.2017.09.12.01.34.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 01:34:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Sep 2017 10:36:14 +0200
Message-Id: <20170912083614.5300-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912083614.5300-1-Martin.Jansa@gmail.com>
References: <20170912083614.5300-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] gnome-keyring: delete blacklisted
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
X-List-Received-Date: Tue, 12 Sep 2017 08:34:01 -0000

* there was some work on it recently, but still contains QA issues and no
  reply in 2 weeks:
  http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114415.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gnome-keyring/gnome-keyring/egg-asn1x.patch    | 55 ----------------------
 .../gnome-keyring/gnome-keyring_2.32.1.bb          | 45 ------------------
 2 files changed, 100 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb

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
index 4ac75cbef..000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ /dev/null
@@ -1,45 +0,0 @@
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
-inherit autotools gnome gtk-doc pkgconfig gsettings
-
-SRC_URI += "file://egg-asn1x.patch"
-
-DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
-RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
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
-PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.14.1


