Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333FACA601F
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:15:09 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2145.1791569700748490051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=PF9mXSyy;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout02.t-online.de (Postfix) with SMTP id C47D8EC2F
	for <openembedded-devel@lists.openembedded.org>; Fri,  9 Oct 2026 20:14:31 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.240]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xFF6y-2aEHsO0; Fri, 9 Oct 2026 20:14:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [blackksail][meta-oe][PATCH] Revert "libpwquality: remove recipe (moved to oe-core)"
Date: Fri,  9 Oct 2026 20:14:19 +0200
Message-ID: <20261009181419.1209594-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791569668-637FDBB1-1253942C/0/0 CLEAN NORMAL
X-TOI-MSGID: 75860482-cb6c-4034-8468-5c7c2137b74c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791569671; i=f_l_k@t-online.de;
	bh=kpOU/qg1yzqGF9fXQAwVqtKKS1Th/cQvOWGXGC5nkBA=;
	h=From:To:Subject:Date;
	b=PF9mXSyy3D2AuUM5HbGKjVMKEWRfJ6yiIGHJI5fWRJrmPi70gdRklxOeo+Ch9S3Ep
	 kWq3ba7iHW02V5+EskuX+7irkFxocrO+DACNoCyceihIX/xTSM0l5lSSBECpOlCgw9
	 guofvWXVIzhLyX2sH6q/MxhqTiwgEIobCsYNoDxP+g7kMoNMZGqbjNNaXZAS5h7ylB
	 M5A1Ixuf7LgfrlLdRF62rLE1bGEGOqKlTB5ogC7SRUOEGkpWdtX6S9A4uT9PmC0S+B
	 GHQTuG3hIkTDkkDAFO1ipw+gvBCEpZcovNv/902ZTX+mLXCqeKh/3/ac/LjtCS2v6u
	 601SY8P6N2k6g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 18:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130705

This reverts commit 50d5f23e07431865470d16aeaeb8e442f690186b.

The import into oe-core (3d295bef38 "libpwquality: import recipe from
meta-oe") is only in oe-core master, not in blacksail, so on blacksail
the recipe is missing and gnome-disk-utility, gnome-control-center,
cryptsetup and others fail with "Nothing PROVIDES 'libpwquality'".

AI-Generated: Uses Claude Code (Claude Opus 4.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
 ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 +++++++
 .../libpwquality/libpwquality_1.4.5.bb        | 39 ++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-Use-=
setuptools-instead-of-distutils.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-Make=
file.am-respect-PYTHONSITEDIR.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/libpwquality_1.=
4.5.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index cc3f7cf064..225cd95604 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -368,6 +368,7 @@ RDEPENDS:packagegroup-meta-oe-extended =3D "\
     liblognorm \
     libmodbus \
     libplist \
+    libpwquality \
     libqb \
     librelp \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", =
d)} \
diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setupto=
ols-instead-of-distutils.patch b/meta-oe/recipes-extended/libpwquality/fi=
les/0001-Use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..7eaca66b5c
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-ins=
tead-of-distutils.patch
@@ -0,0 +1,78 @@
+From ad95b7684365dea8335c34527d4c1463c1668af0 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
+Date: Fri, 31 Mar 2023 14:52:19 +0200
+Subject: [PATCH] Use setuptools instead of distutils
+
+distutils is removed from Python 3.12+:
+https://peps.python.org/pep-0632/
+
+Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/=
commit/7b5e0f0097faebdcc6a8b783237bbba7a983147a]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ libpwquality.spec.in | 11 ++---------
+ python/Makefile.am   |  2 +-
+ python/setup.py.in   |  6 +++---
+ 3 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/libpwquality.spec.in b/libpwquality.spec.in
+index 70a6f53..0809126 100644
+--- a/libpwquality.spec.in
++++ b/libpwquality.spec.in
+@@ -33,9 +33,11 @@ BuildRequires: gettext
+ BuildRequires: pam-devel
+ %if %{with python2}
+ BuildRequires: python2-devel
++BuildRequires: python2-setuptools
+ %endif
+ %if %{with python3}
+ BuildRequires: python3-devel
++BuildRequires: python3-setuptools
+ %endif
+=20
+ URL: https://github.com/libpwquality/libpwquality/
+@@ -103,15 +105,6 @@ cp -a . %{py3dir}
+ pushd %{py3dir}
+ %endif
+ %if %{with python3}
+-# setuptools >=3D 60 changes the environment to use its bundled copy of=
 distutils
+-# by default, not the Python-bundled one. To run the Python's standard =
library
+-# distutils, the environment variable must be set.
+-# Although technically setuptools is not needed for this package, if it=
's
+-# pulled by another package, it changes the environment and consequentl=
y,
+-# the build fails. This was reported in:
+-# https://github.com/pypa/setuptools/issues/3143
+-export SETUPTOOLS_USE_DISTUTILS=3Dstdlib
+-
+ %configure \
+ 	--with-securedir=3D%{_moduledir} \
+ 	--with-pythonsitedir=3D%{python3_sitearch} \
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 1d00c0c..6e51744 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py buil=
d --build-base py$(PYTHONREV)
+=20
+ install-exec-local:
+-	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py buil=
d --build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
++	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py buil=
d --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${pref=
ix}
+=20
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
+diff --git a/python/setup.py.in b/python/setup.py.in
+index a741b91..f934c50 100755
+--- a/python/setup.py.in
++++ b/python/setup.py.in
+@@ -6,9 +6,9 @@
+=20
+ import os
+=20
+-from distutils.core import setup, Extension
+-from distutils.command.build_ext import build_ext as _build_ext
+-from distutils.command.sdist import sdist as _sdist
++from setuptools import setup, Extension
++from setuptools.command.build_ext import build_ext as _build_ext
++from setuptools.command.sdist import sdist as _sdist
+=20
+ def genconstants(headerfile, outputfile):
+     hf =3D open(headerfile, 'r')
diff --git a/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am=
-respect-PYTHONSITEDIR.patch b/meta-oe/recipes-extended/libpwquality/file=
s/0002-Makefile.am-respect-PYTHONSITEDIR.patch
new file mode 100644
index 0000000000..cd59a6d887
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respec=
t-PYTHONSITEDIR.patch
@@ -0,0 +1,26 @@
+From edc51ba1b446913232cdf2945f485392bca72dc7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 3 Aug 2015 13:43:14 +0800
+Subject: [PATCH] Makefile.am: respect ${PYTHONSITEDIR}
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/=
commit/5192eab011ada47b0157f8d0524bf5b18bba3bd0]
+
+ python/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 6e51744..0a3bad5 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py buil=
d --build-base py$(PYTHONREV)
+=20
+ install-exec-local:
+-	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py buil=
d --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${pref=
ix}
++	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py buil=
d --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${pref=
ix} --install-lib=3D$(pythonsitedir)
+=20
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb =
b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
new file mode 100644
index 0000000000..b7c673be52
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -0,0 +1,39 @@
+DESCRIPTION =3D "Library for password quality checking and generating ra=
ndom passwords"
+HOMEPAGE =3D "https://github.com/libpwquality/libpwquality"
+SECTION =3D "devel/lib"
+
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde676=
fc2"
+
+DEPENDS =3D "cracklib"
+
+SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;=
protocol=3Dhttps \
+    file://0001-Use-setuptools-instead-of-distutils.patch \
+    file://0002-Makefile.am-respect-PYTHONSITEDIR.patch \
+"
+SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
+
+
+inherit autotools-brokensep gettext
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'setuptoo=
ls3-base', '', d)}
+
+do_configure:prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
+}
+
+export PYTHON_DIR
+export BUILD_SYS
+export HOST_SYS
+
+EXTRA_OECONF +=3D "--libdir=3D${libdir} \
+                 --with-securedir=3D${base_libdir}/security \
+"
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
', '', d)} python3"
+PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[python3] =3D "--enable-python-bindings --with-python-rev=3D=
${PYTHON_BASEVERSION} --with-python-binary=3D${STAGING_BINDIR_NATIVE}/pyt=
hon3-native/python3 --with-pythonsitedir=3D${PYTHON_SITEPACKAGES_DIR},--d=
isable-python-bindings,python3-setuptools-native"
+
+FILES:${PN} +=3D "${base_libdir}/security/pam_pwquality.so"
+FILES:${PN}-dbg +=3D "${base_libdir}/security/.debug"
+FILES:${PN}-staticdev +=3D "${base_libdir}/security/pam_pwquality.a"
+FILES:${PN}-dev +=3D "${base_libdir}/security/pam_pwquality.la"
--=20
2.55.0


