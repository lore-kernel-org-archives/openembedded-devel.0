Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4A0606A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 19:44:33 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so254332123wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=MIhdg+QH4WWn4xd9FgEtNTiajRztrXU+AiPZa29U9I0=;
	b=X1GqRjhYUfDovO6u6303hTNm7T87mrQ3ls9tV83K+ZpxKAITkLWT03bGbtF5kP11xH
	tKuPhBKpWVYJHkgV8N1bh9hgZBEa/TA/Jmnqxoqb3lAr2jP3jndQiSvme4vVYSCRxlzC
	BGqVaDz96WHzsx7u+lv2Jn7K5wtjgVwdQTY5535LrD/+5QQL+bTbalMlI/j0vLzQk7at
	v4NR+PEsjjbkiO+pi7DOoqplsvKapyBDt1cM42everzNEZYLEqDCmDn+DQ/U2yRXEU9J
	vcN8CQKQBk5pXcbz6PDj3n8xcnEVbY3jTDgY1EcPqJZ1rRHnQUPhxJ47/J3W+6SZQbq9
	bLTA==
X-Received: by 10.28.1.8 with SMTP id 8mr12487477wmb.40.1447962273732;
	Thu, 19 Nov 2015 11:44:33 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	d66sm35625971wma.21.2015.11.19.11.44.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 11:44:33 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <D2648347-D3B8-420B-8527-0FEBE36BFD0C@gmail.com>
Date: Thu, 19 Nov 2015 20:44:32 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-networking][PATCH 2/6] talloc: rename to libtalloc and cleanup dependency mess
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
X-List-Received-Date: Thu, 19 Nov 2015 19:44:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


To avoid errors when building dev-images (talloc-dev is missing), and to =
avoid
insane empty packages for that, rename talloc -> libtalloc as libtevent =
shows.

With that, remove dependencies to attr/xattr - unless explicitely =
enabled via
PACKAGECONFIG.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-connectivity/samba/samba_4.1.12.bb     |  2 +-
 .../recipes-support/cifs/cifs-utils_git.bb         |  2 +-
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |  2 +-
 .../recipes-support/libldb/libldb_1.1.17.bb        |  6 +++---
 .../libtalloc/avoid-attr-unless-wanted.patch       | 20 =
+++++++++++++++++
 .../libtalloc_2.1.1.bb}                            | 25 =
+++++++++-------------
 .../recipes-support/libtevent/libtevent_0.9.21.bb  |  3 +--
 7 files changed, 37 insertions(+), 23 deletions(-)
 create mode 100644 =
meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-want=
ed.patch
 rename meta-networking/recipes-support/{talloc/talloc_2.1.1.bb =3D> =
libtalloc/libtalloc_2.1.1.bb} (70%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index cb29ab9..40afce8 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -40,7 +40,7 @@ SRC_URI[sha256sum] =3D =
"033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274f
=20
 inherit systemd waf-samba cpan-base perlnative
=20
-DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb =
libtevent libldb krb5 ctdb libbsd cyrus-sasl"
+DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb =
libtevent libldb krb5 ctdb libbsd cyrus-sasl"
=20
=20
 SYSVINITTYPE_linuxstdbase =3D "lsb"
diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb =
b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 00617c9..49a1aec 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -17,7 +17,7 @@ PACKAGECONFIG[cap] =3D =
"--with-libcap,--without-libcap,libcap"
 # when enabled, it creates ${bindir}/cifscreds and =
--ignore-fail-on-non-empty in do_install_append is needed
 PACKAGECONFIG[cifscreds] =3D =
"--enable-cifscreds,--disable-cifscreds,keyutils"
 # when enabled, it creates ${sbindir}/cifs.upcall and =
--ignore-fail-on-non-empty in do_install_append is needed
-PACKAGECONFIG[cifsupcall] =3D =
"--enable-cifsupcall,--disable-cifsupcall,krb5 talloc keyutils"
+PACKAGECONFIG[cifsupcall] =3D =
"--enable-cifsupcall,--disable-cifsupcall,krb5 libtalloc keyutils"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb =
b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 3731efd..25d5dc9 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -26,7 +26,7 @@ inherit autotools-brokensep pkgconfig systemd
=20
 PARALLEL_MAKE =3D ""
=20
-DEPENDS +=3D "popt libtevent talloc"
+DEPENDS +=3D "popt libtevent libtalloc"
=20
 do_configure() {
     oe_runconf
diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.17.bb =
b/meta-networking/recipes-support/libldb/libldb_1.1.17.bb
index 44f061a..e587858 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.17.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.17.bb
@@ -3,9 +3,9 @@ HOMEPAGE =3D "http://ldb.samba.org"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
=20
-DEPENDS +=3D "libtdb talloc libtevent popt"
-RDEPENDS_${PN} +=3D "libtevent popt libtalloc openldap"
-RDEPENDS_pyldb +=3D "python libtdb libtalloc"
+DEPENDS +=3D "libtdb libtalloc libtevent popt"
+RDEPENDS_${PN} +=3D "openldap"
+RDEPENDS_pyldb +=3D "python"
=20
 SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch =
\
diff --git =
a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wa=
nted.patch =
b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wa=
nted.patch
new file mode 100644
index 0000000..a3ee9cc
--- /dev/null
+++ =
b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wa=
nted.patch
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
diff --git a/meta-networking/recipes-support/talloc/talloc_2.1.1.bb =
b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb
similarity index 70%
rename from meta-networking/recipes-support/talloc/talloc_2.1.1.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb
index 89c390f..9016f42 100644
--- a/meta-networking/recipes-support/talloc/talloc_2.1.1.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.1.bb
@@ -3,7 +3,9 @@ HOMEPAGE =3D "http://talloc.samba.org"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
=20
-SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
+DEPENDS +=3D "libbsd"
+
+SRC_URI =3D "http://samba.org/ftp/${BPN}/talloc-${PV}.tar.gz"
 LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=3Dbfccfe952269=
fff2b407dd11f2f3083b \
                     =
file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=3Dc79ff39f19dfec=
6d293b95dea7b07891"
=20
@@ -12,6 +14,12 @@ SRC_URI[sha256sum] =3D =
"3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb6a45902548
=20
 inherit waf-samba
=20
+PACKAGECONFIG[attr] =3D ",,attr"
+
+SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', =
'file://avoid-attr-unless-wanted.patch', d)}"
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
diff --git =
a/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb =
b/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb
index f297f30..36ce7d6 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb
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
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


