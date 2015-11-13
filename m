Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 67B19772E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 15:53:05 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so87898936wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 07:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=7rMhBx1rLZ9hh3BZOkFZRixcCuEp8XwOd0hWwYDF39w=;
	b=NOJqgx7goUVzneTZtZVFykm/FjHUzAGUFKdxrNsujqxq9uKTs1JD6d8sAXVz7nhCgL
	ozEZY9A7QTEpC2B88nitJiQgcJ0+1M8/il67hfcU4bBYo3Lc2iJPZjD4NgLdRXFYtBnT
	eFn5RQdq9a7hTzp2vlPi+LJnSf08g58D+g5y7cj67eF/hG8nFxGJgNCRflRc0C95iWUR
	u1BuKxSEWCQMschPmhE9KMpU6sf2NBUFniYYXrCSask2fr05IUPt+h9FMWH0PoobMltL
	jfGyfTbaPyFv9/X25wD/6RTFxENF3RRLblIxhSo1SEHMyV3bi/IKJmKxutrMzB15rjh7
	bgGQ==
X-Received: by 10.28.146.146 with SMTP id u140mr4411220wmd.85.1447429984173;
	Fri, 13 Nov 2015 07:53:04 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	ot9sm7103691wjc.12.2015.11.13.07.53.03
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 07:53:03 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Date: Fri, 13 Nov 2015 16:53:01 +0100
Message-Id: <9A2ED550-50FC-4223-B79E-5801010FEF49@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-oe][PATCH] talloc: rename to libtalloc and cleanup dependency mess
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
X-List-Received-Date: Fri, 13 Nov 2015 15:53:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


To avoid errors when building dev-images (talloc-dev is missing), and to =
avoid
insane empty packages for that, rename talloc -> libtalloc as libtevent =
shows.

With that, remove dependencies to attr/xattr and libbsd - unless =
explicitely
enabled via PACKAGECONFIG.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libtalloc/avoid-attr-unless-wanted.patch       | 20 =
+++++++++++++++++
 .../libtalloc/avoid-libbsd-unless-wanted.patch     | 10 +++++++++
 .../libtalloc_2.1.1.bb}                            | 25 =
+++++++++-------------
 .../recipes-support/libtevent/libtevent_0.9.21.bb  |  3 +--
 4 files changed, 41 insertions(+), 17 deletions(-)
 create mode 100644 =
meta-oe/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch=

 create mode 100644 =
meta-oe/recipes-support/libtalloc/libtalloc/avoid-libbsd-unless-wanted.pat=
ch
 rename meta-oe/recipes-support/{talloc/talloc_2.1.1.bb =3D> =
libtalloc/libtalloc_2.1.1.bb} (70%)

diff --git =
a/meta-oe/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.pat=
ch =
b/meta-oe/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.pat=
ch
new file mode 100644
index 0000000..a3ee9cc
--- /dev/null
+++ =
b/meta-oe/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.pat=
ch
@@ -0,0 +1,20 @@
+--- a/lib/replace/wscript	2015-11-13 16:04:04.000000000 +0100
++++ b/lib/replace/wscript	2015-11-13 16:23:20.000000000 +0100
+@@ -636,8 +636,6 @@
+     if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE +=3D ' =
inet_aton.c'
+     if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE +=3D ' =
inet_ntop.c'
+     if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE +=3D ' =
inet_pton.c'
+-    if not bld.CONFIG_SET('HAVE_GETXATTR') or =
bld.CONFIG_SET('XATTR_ADDITIONAL_OPTIONS'):
+-                                                 REPLACE_SOURCE +=3D ' =
xattr.c'
+=20
+     bld.SAMBA_LIBRARY('replace',
+                       source=3DREPLACE_SOURCE,
+@@ -648,7 +646,7 @@
+                       # at the moment:
+                       # hide_symbols=3Dbld.BUILTIN_LIBRARY('replace'),
+                       private_library=3DTrue,
+-                      deps=3D'crypt dl nsl socket rt attr' + =
extra_libs)
++                      deps=3D'crypt dl nsl socket rt ' + extra_libs)
+=20
+     bld.SAMBA_SUBSYSTEM('replace-test',
+                       source=3D'''test/testsuite.c test/strptime.c
diff --git =
a/meta-oe/recipes-support/libtalloc/libtalloc/avoid-libbsd-unless-wanted.p=
atch =
b/meta-oe/recipes-support/libtalloc/libtalloc/avoid-libbsd-unless-wanted.p=
atch
new file mode 100644
index 0000000..292bdfd
--- /dev/null
+++ =
b/meta-oe/recipes-support/libtalloc/libtalloc/avoid-libbsd-unless-wanted.p=
atch
@@ -0,0 +1,10 @@
+--- a/lib/replace/wscript	2015-11-13 16:26:06.000000000 +0100
++++ b/lib/replace/wscript	2015-11-13 16:26:12.000000000 +0100
+@@ -610,7 +610,6 @@
+                 break
+=20
+     extra_libs =3D ''
+-    if bld.CONFIG_SET('HAVE_LIBBSD'): extra_libs +=3D ' bsd'
+=20
+     bld.SAMBA_SUBSYSTEM('LIBREPLACE_HOSTCC',
+         REPLACE_HOSTCC_SOURCE,
diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb =
b/meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
similarity index 70%
rename from meta-oe/recipes-support/talloc/talloc_2.1.1.bb
rename to meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
index 89c390f..7f0e6ae 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
+++ b/meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://talloc.samba.org"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
=20
-SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI =3D "http://samba.org/ftp/${BPN}/talloc-${PV}.tar.gz"
 LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=3Dbfccfe952269=
fff2b407dd11f2f3083b \
                     =
file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=3Dc79ff39f19dfec=
6d293b95dea7b07891"
=20
@@ -12,6 +12,14 @@ SRC_URI[sha256sum] =3D =
"3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb6a45902548
=20
 inherit waf-samba
=20
+PACKAGECONFIG[attr] =3D ",,attr"
+PACKAGECONFIG[libbsd] =3D ",,libbsd"
+
+SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'attr', =
'avoid-attr-unless-wanted.patch', '', d)}"
+SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'libbsd', =
'avoid-libbsd-unless-wanted.patch', '', d)}"
+
+S =3D "${WORKDIR}/talloc-${PV}"
+
 EXTRA_OECONF +=3D "--disable-rpath \
                  --disable-rpath-install \
                  --bundled-libraries=3DNONE \
@@ -20,20 +28,7 @@ EXTRA_OECONF +=3D "--disable-rpath \
                  --with-libiconv=3D${STAGING_DIR_HOST}${prefix}\
                 "
=20
-PACKAGES +=3D "libtalloc libtalloc-dbg libtalloc-dev pytalloc =
pytalloc-dbg pytalloc-dev"
-
-#ALLOW_EMPTY_${PN} =3D "1"
-FILES_${PN} =3D ""
-FILES_${PN}-dev =3D ""
-FILES_${PN}-dbg =3D ""
-
-FILES_libtalloc =3D "${libdir}/libtalloc.so.2 \
-                   ${libdir}/libtalloc.so.2.1.1"
-FILES_libtalloc-dbg =3D "/usr/src/debug/ \
-                   ${libdir}/.debug/libtalloc.so.2.1.1"
-FILES_libtalloc-dev =3D "${includedir}/ \
-                   ${libdir}/libtalloc.so \
-                   ${libdir}/pkgconfig/"
+PACKAGES +=3D "pytalloc pytalloc-dbg pytalloc-dev"
=20
 FILES_pytalloc =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
                   ${libdir}/libpytalloc-util.so.2 \
diff --git a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb =
b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
index f297f30..36ce7d6 100644
--- a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
+++ b/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
@@ -3,8 +3,7 @@ HOMEPAGE =3D "http://tevent.samba.org"
 SECTION =3D "libs"
 LICENSE =3D "LGPLv3+"
=20
-DEPENDS +=3D "talloc libcap"
-RDEPENDS_${PN} +=3D "libtalloc"
+DEPENDS +=3D "libtalloc libcap"
 RDEPENDS_python-tevent =3D "python"
=20
 SRC_URI =3D "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
--=20
2.4.9 (Apple Git-60)

I would work on all the waf-packages in a similar way, if this is =
reasonable.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


