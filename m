Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id C291A6AA66
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 23:18:25 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so5966787pad.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 16:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0Z7VMWvK5ZTMiVvnPN5AN3n/bUYJtn0BMVBh+5i3qw0=;
	b=xp2yOpVRQqSrm7UiSbe0OxvUaOPqJdhwgKqb2ZiQcIhTn/ybte6TqA+ejkb8+rgzow
	e682MV5s7iiSIW/OJOx/5t+QvnUeBaps4k4FP2Ri6rajqHcr/sqp4U/fd+A9quN/rPPZ
	rSsKdSZPfgVQjBhdIYXeU31GxojOKKomQOjVhsZ3NP6S8QfPVTazeAnadZqbGrt4voM6
	IB3pOqR5ruwxUdV8w02sgVgMMej6fD7OoxqkccGVJHyrn10ql0LsGPAhb7A4YSqHrqQh
	DdGYPfj8V0UzDLykd3cgLYRnN9wNTWGpblBWx6xWVpAwHCx4s39WyDsIIwjnM7aS4r4A
	ePHg==
X-Received: by 10.68.11.232 with SMTP id t8mr16783424pbb.128.1370992706600;
	Tue, 11 Jun 2013 16:18:26 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	lq4sm21946273pab.19.2013.06.11.16.18.25 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 16:18:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:16:04 -0700
Message-Id: <1370992564-19617-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH] gnome-keyring: Fix build error due to missing asn1 prototypes
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
X-List-Received-Date: Tue, 11 Jun 2013 23:18:25 -0000

This fixes the errors that started to pop up recently
while building gnome-keyring as part of gnome images
The error is decribed in patch header

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-keyring/gnome-keyring/egg-asn1x.patch    |   55 ++++++++++++++++++++
 .../gnome-keyring/gnome-keyring_2.32.1.bb          |    3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
new file mode 100644
index 0000000..ad8a40c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
@@ -0,0 +1,55 @@
+Fixed build error with gcc 4.8
+
+Errors like below
+
+egg-asn1x.c: In function 'anode_encode_build':
+egg-asn1x.c:1280:7: warning: variable 'type' set but not used [-Wunused-but-set-variable]
+egg-asn1x.c: In function 'traverse_and_prepare':
+egg-asn1x.c:3354:3: warning: passing argument 1 of 'egg_asn1x_create' from incompatible pointer type [enabled by default]
+In file included from egg-asn1x.c:50:0:
+egg-asn1x.h:38:8: note: expected 'const struct static_struct_asn *' but argument is of type 'const struct asn1_static_node *'
+egg-asn1x.c: At top level:
+egg-asn1x.c:3509:1: error: conflicting types for 'egg_asn1x_create'
+In file included from egg-asn1x.c:50:0:
+egg-asn1x.h:38:8: note: previous declaration of 'egg_asn1x_create' was here
+egg-asn1x.c:3572:1: error: conflicting types for 'egg_asn1x_create_quark'
+In file included from egg-asn1x.c:50:0:
+egg-asn1x.h:41:8: note: previous declaration of 'egg_asn1x_create_quark' was here
+egg-asn1x.c:3579:1: error: conflicting types for 'egg_asn1x_create_and_decode'
+In file included from egg-asn1x.c:50:0:
+egg-asn1x.h:44:8: note: previous declaration of 'egg_asn1x_create_and_decode' was here
+make[4]: *** [libegg_la-egg-asn1x.lo] Error 1
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: gnome-keyring-2.32.1/egg/egg-asn1x.h
+===================================================================
+--- gnome-keyring-2.32.1.orig/egg/egg-asn1x.h	2010-10-18 19:11:38.000000000 -0700
++++ gnome-keyring-2.32.1/egg/egg-asn1x.h	2013-06-11 15:15:00.675399263 -0700
+@@ -25,6 +25,7 @@
+ #define EGG_ASN1X_H_
+ 
+ #include <glib.h>
++#include <libtasn1.h>
+ 
+ #ifndef HAVE_EGG_ALLOCATOR
+ typedef void* (*EggAllocator) (void* p, gsize);
+@@ -35,13 +36,13 @@
+ 
+ struct static_struct_asn;
+ 
+-GNode*              egg_asn1x_create                 (const struct static_struct_asn *defs,
++GNode*              egg_asn1x_create                 (const ASN1_ARRAY_TYPE *defs,
+                                                       const gchar *type);
+ 
+-GNode*              egg_asn1x_create_quark           (const struct static_struct_asn *defs,
++GNode*              egg_asn1x_create_quark           (const ASN1_ARRAY_TYPE *defs,
+                                                       GQuark type);
+ 
+-GNode*              egg_asn1x_create_and_decode      (const struct static_struct_asn *defs,
++GNode*              egg_asn1x_create_and_decode      (const ASN1_ARRAY_TYPE *defs,
+                                                       const gchar *type,
+                                                       gconstpointer data,
+                                                       gsize n_data);
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 72f2722..0d0f171 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -15,6 +15,8 @@ PR = "r12"
 
 inherit autotools gnome gtk-doc pkgconfig gsettings
 
+SRC_URI += "file://egg-asn1x.patch"
+
 DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
 
@@ -24,7 +26,6 @@ SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
 SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
 
 FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr"
-                
 
 FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
                     ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
-- 
1.7.9.5


