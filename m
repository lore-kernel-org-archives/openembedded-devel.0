Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11301.1792773644285940845
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 09:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=aEIFuq1T;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58A3F1C00
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 09:40:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38A8C3F673
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792773643; bh=vEjZd++xc6HPeXqyC8BFnee7KzKZSxmsbb8PZxlZj1Q=;
	h=From:To:Subject:Date:From;
	b=aEIFuq1TapJlGQ967zZJQe1jMOnJetHGFR5kyQLF7GXyQNmqH8Pkd1bDUhjN1HN0q
	 mrMoxtLgXSwQOab5wKNitG8F9mrzzGz1KOjkQW7EJ0/rRoImS5ly3PBNJ3cLIhB506
	 itYcisBk4FtOaSYGQ6ppXTuCJkojcb20Gs0baQb0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-dbus-fast: upgrade 4.0.0 -> 5.2.0
Date: Fri, 23 Oct 2026 17:40:41 +0100
Message-ID: <20261023164041.3766710-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 16:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131379
Content-Type: text/plain; charset="utf-8"

Drop the Cython version patch, as upstream has a wider range now.

async-timeout was removed as an dependency upstream in v1.90.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...emove-upper-version-constraint-for-C.patch | 34 -------------------
 ...st_4.0.0.bb =3D> python3-dbus-fast_5.2.0.bb} |  9 ++---
 2 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dbus-fast=
/0001-pyproject.toml-Remove-upper-version-constraint-for-C.patch
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_4.0.0.bb =3D=
> python3-dbus-fast_5.2.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast/0001-p=
yproject.toml-Remove-upper-version-constraint-for-C.patch b/meta-python/r=
ecipes-devtools/python/python3-dbus-fast/0001-pyproject.toml-Remove-upper=
-version-constraint-for-C.patch
deleted file mode 100644
index e5b53340a85..00000000000
--- a/meta-python/recipes-devtools/python/python3-dbus-fast/0001-pyprojec=
t.toml-Remove-upper-version-constraint-for-C.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From bca444d7069afab9e1ac84f765e744d308d39e57 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 18 May 2025 10:24:19 -0700
-Subject: [PATCH] pyproject.toml: Remove upper version constraint for Cyt=
hon
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 6604cb8..40bd8c3 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -50,7 +50,7 @@ pytest-cov =3D ">=3D3,<8"
- pytest-asyncio =3D ">=3D0.19,<1.4"
- pycairo =3D "^1.21.0"
- PyGObject =3D {version =3D ">=3D3.50,<3.51", python =3D "<4"}
--Cython =3D ">=3D3,<3.3.0"
-+Cython =3D ">=3D3"
- setuptools =3D ">=3D65.4.1,<81.0.0"
- pytest-timeout =3D "^2.1.0"
- pytest-codspeed =3D ">=3D3.1.1,<5.0.0"
-@@ -108,7 +108,7 @@ module =3D "docs.*"
- ignore_errors =3D true
-=20
- [build-system]
--requires =3D ['setuptools>=3D65.4.1', 'wheel', 'Cython>=3D3,<3.3.0', "p=
oetry-core>=3D1.0.0"]
-+requires =3D ['setuptools>=3D65.4.1', 'wheel', 'Cython>=3D3', "poetry-c=
ore>=3D1.0.0"]
- build-backend =3D "poetry.core.masonry.api"
-=20
- [tool.ruff]
diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.=
bb b/meta-python/recipes-devtools/python/python3-dbus-fast_5.2.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.b=
b
rename to meta-python/recipes-devtools/python/python3-dbus-fast_5.2.0.bb
index 2f4d43e1121..134f60942d3 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_5.2.0.bb
@@ -3,14 +3,11 @@ HOMEPAGE =3D "https://github.com/bluetooth-devices/dbus=
-fast"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D729e372b5ea0168438e4fd4a00a04=
947"
=20
-SRC_URI +=3D "file://0001-pyproject.toml-Remove-upper-version-constraint=
-for-C.patch"
-SRC_URI[sha256sum] =3D "e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df9=
58cee24bef86b8fe"
+SRC_URI[sha256sum] =3D "a4a5dddc04b1ade5eb7650d791e2f6fb7c13345955934739=
14e78a2526ecddda"
=20
 inherit pypi python_poetry_core cython
=20
+# Remove when https://github.com/Bluetooth-Devices/dbus-fast/issues/825 =
is closed
 DEPENDS +=3D "python3-wheel-native"
=20
-RDEPENDS:${PN} +=3D " \
-    python3-core (>=3D3.7) \
-    python3-async-timeout \
-"
+RDEPENDS:${PN} +=3D "python3-core"
--=20
2.43.0

