Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2155C606D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 19:46:31 +0000 (UTC)
Received: by wmec201 with SMTP id c201so42258013wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=THuB6aqtQlMIZEVJM5Uhf0/y1xi2kWchIIKxDWCXWes=;
	b=lJCf5KEHrzRrxB4DWM4Tpbs2L7FfHF1ARE9lJofOFBT2y3PowfnHHRYOsyXdLulGzO
	+r9K5e4SVZPyNqeh4CPN0OyhsLmXV9H6CyJhnpCx+uPLv3MYWoZcSA54GJgZ87SqBuoV
	e0TT0UCHLr7D1QDAD5zu+iDHfQphcZKNSMXUZcLKRY2WQng1Kiq1YC5aAmuct5IH/ny4
	rv0TSUgTbeCKxfbm8Iv5jgqjL1dSPZhDKaHI3QV7FXJFLKLH6kY5YqZ3N6n7/thk2M1w
	xV3TDgNpEMqh2wO9+3VqsK02K87JyGHeOmhPFoLla6sNz/iiBiqO01VgqZ/f5nYFUZb/
	mU6w==
X-Received: by 10.194.243.6 with SMTP id wu6mr10219462wjc.14.1447962391408;
	Thu, 19 Nov 2015 11:46:31 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	d66sm35625971wma.21.2015.11.19.11.46.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 11:46:30 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <F53CCE03-2470-4366-A584-2E4F946F4FBD@gmail.com>
Date: Thu, 19 Nov 2015 20:46:30 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-networking][PATCH 5/6] libtevent: rework dependencies for deterministic build
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
X-List-Received-Date: Thu, 19 Nov 2015 19:46:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since waf configure infrastructure is a body blow compared to reasonable
autoconf script from packager point of view, samba support libs need
feature-disable-patches. This one is for libtevent removing libcap
(introduced by libldap_r) and attr.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libtevent/avoid-attr-unless-wanted.patch         | 20 =
++++++++++++++++++++
 .../recipes-support/libtevent/libtevent_0.9.21.bb    |  6 +++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 =
meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-want=
ed.patch

diff --git =
a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wa=
nted.patch =
b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wa=
nted.patch
new file mode 100644
index 0000000..2fc5523
--- /dev/null
+++ =
b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wa=
nted.patch
@@ -0,0 +1,20 @@
+--- a/lib/replace/wscript	2015-11-18 15:40:19.000000000 +0100
++++ b/lib/replace/wscript	2015-11-18 15:48:09.000000000 +0100
+@@ -618,8 +618,6 @@
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
+@@ -630,7 +628,7 @@
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
a/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb =
b/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb
index 36ce7d6..006b36d 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://tevent.samba.org"
 SECTION =3D "libs"
 LICENSE =3D "LGPLv3+"
=20
-DEPENDS +=3D "libtalloc libcap"
+DEPENDS +=3D "libbsd libtalloc"
 RDEPENDS_python-tevent =3D "python"
=20
 SRC_URI =3D "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
@@ -14,6 +14,10 @@ SRC_URI[sha256sum] =3D =
"f2be7463573dab2d8210cb57fe7e7e2aeb323274cbdc865a6e29ddcfb9
=20
 inherit waf-samba
=20
+PACKAGECONFIG[attr] =3D ",,attr"
+
+SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', =
'file://avoid-attr-unless-wanted.patch', d)}"
+
 S =3D "${WORKDIR}/tevent-${PV}"
=20
 EXTRA_OECONF +=3D "--disable-rpath \
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


