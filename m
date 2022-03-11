Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3E4C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:00:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7755.1647018029870098733
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3958175A
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:00:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 719F03FA45
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:00:28 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] meta-*: remove obsolete PYPA_WHEEL and PIP_INSTALL_PACKAGE
 assignments
Date: Fri, 11 Mar 2022 17:00:25 +0000
Message-Id: <20220311170025.21266-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 17:00:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95955

These variables are no longer used by pip_install_wheel, so remove them
from all recipes that set them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb  | 2 --
 .../recipes-devtools/python/python3-scapy_2.4.5.bb         | 2 --
 meta-oe/recipes-devtools/guider/guider_3.9.8.bb            | 1 -
 meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb       | 2 --
 meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb          | 3 ---
 .../python/python3-flask-versioned_0.9.4-20101221.bb       | 7 -------
 meta-python/recipes-devtools/python/python3-path_16.4.0.bb | 1 -
 7 files changed, 18 deletions(-)

diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/=
meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index ba5d9ac0e6..8e164708ed 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -15,8 +15,6 @@ S =3D "${WORKDIR}/git"
=20
 inherit setuptools3 pkgconfig
=20
-PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
-
 RDEPENDS:${PN} =3D "bluez5"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.=
bb b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
index 53c2ce3d8e..0f66dfd784 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
@@ -25,8 +25,6 @@ S =3D "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 inherit setuptools3 ptest
-PIP_INSTALL_PACKAGE =3D "scapy"
-PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
=20
 do_install:append() {
         mv ${D}${bindir}/scapy ${D}${bindir}/scapy3
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb b/meta-oe/re=
cipes-devtools/guider/guider_3.9.8.bb
index c519fa02a3..30d17c84b3 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
@@ -14,7 +14,6 @@ SRCREV =3D "a502cd93b13235b7539557a91328de00b7c51bc3"
 S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
-PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-3.9.8-*.=
whl"
=20
 RDEPENDS:${PN} =3D "python3 python3-core \
         python3-ctypes python3-shell python3-json"
diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb b/meta-=
oe/recipes-devtools/python/python3-apt_2.3.0.bb
index e17e773cb4..ec1539b442 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
@@ -10,8 +10,6 @@ SRCREV =3D "6145b6484d220685edfd922d364afbf065127efe"
 S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
-PIP_INSTALL_PACKAGE =3D "python_apt"
-PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.0.0-*.=
whl"
=20
 DEPENDS +=3D "apt"
 RDEPENDS:${PN} +=3D "apt python3-core"
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb b/meta-oe/=
recipes-extended/sanlock/sanlock_3.8.4.bb
index d8cb24cab0..ecbfad394d 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
@@ -26,9 +26,6 @@ DEPENDS =3D "libaio util-linux"
 inherit setuptools3 useradd
=20
 SETUPTOOLS_SETUP_PATH =3D "${S}/python"
-PIP_INSTALL_DIST_PATH =3D "${B}/python/dist"
-PIP_INSTALL_PACKAGE =3D "sanlock_python"
-PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-3.8.4-*.=
whl"
=20
 do_compile:prepend () {
     oe_runmake -C ${S}/wdmd CMD_LDFLAGS=3D"${LDFLAGS}" LIB_LDFLAGS=3D"${=
LDFLAGS}"
diff --git a/meta-python/recipes-devtools/python/python3-flask-versioned_=
0.9.4-20101221.bb b/meta-python/recipes-devtools/python/python3-flask-ver=
sioned_0.9.4-20101221.bb
index 04493b21d4..7aaf439b83 100644
--- a/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-2=
0101221.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-2=
0101221.bb
@@ -7,10 +7,3 @@ PYPI_PACKAGE =3D "Flask-Versioned"
 SRC_URI[sha256sum] =3D "516694dc860a1bc4f22ab60b324a85083c0150522be10928=
2a3bed681057fd34"
=20
 inherit pypi setuptools3
-
-def get_pypa_wheel_name(d):
-    return (d.getVar('PIP_INSTALL_DIST_PATH') + '/' + \
-           d.getVar('PIP_INSTALL_PACKAGE') + '-'  + \
-           d.getVar('PV').replace('-', '.post') + '-*.whl')
-
-PYPA_WHEEL =3D "${@get_pypa_wheel_name(d)}"
diff --git a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb b=
/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
index 0fc0a33b2b..60ac948cf4 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
@@ -5,6 +5,5 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7a7126e0682062=
90f3fe9f8d6c713ea6"
 SRC_URI[sha256sum] =3D "baf2e757c4b19be8208f9e67e48fb475b4a577d5613590ce=
46693bdbdf082f52"
=20
 inherit pypi setuptools_build_meta
-PYPA_WHEEL =3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.0.0-*.=
whl"
=20
 BBCLASSEXTEND =3D "nativesdk native"
--=20
2.25.1


