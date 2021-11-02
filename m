Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE83C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 12:32:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.94.1635856359523787304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 05:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16C79D6E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Nov 2021 05:32:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B41723F70D
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Nov 2021 05:32:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-imgtool: add recipe
Date: Tue,  2 Nov 2021 12:32:34 +0000
Message-Id: <20211102123234.2423780-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 12:32:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93770

imgtool is part of MCUboot, used to sign images and manage keys.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-imgtool/cbor2.patch        | 67 +++++++++++++++++++
 .../python/python3-imgtool_1.8.0.bb           | 14 ++++
 2 files changed, 81 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-imgtool/c=
bor2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-imgtool_1=
.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-imgtool/cbor2.pa=
tch b/meta-python/recipes-devtools/python/python3-imgtool/cbor2.patch
new file mode 100644
index 0000000000..3e8c202bce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-imgtool/cbor2.patch
@@ -0,0 +1,67 @@
+Upstream-Status: Submitted [https://github.com/mcu-tools/mcuboot/pull/11=
90]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From f9c6f31b936d34df9a6551609cb16ed9c348be88 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 2 Nov 2021 11:12:04 +0000
+Subject: [PATCH] imgtool: prefer cbor2 over cbor
+
+The cbor module is unmaintained, with the last release in 2016[1]. The
+cbor2 module however is under active development and was last released
+just last month[2].
+
+As the APIs are identical, we can import cbor2 and if that fails fall
+back to cbor.
+
+[1] https://pypi.org/project/cbor/#history
+[2] https://pypi.org/project/cbor2/#history
+
+Closes #1189
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ scripts/imgtool.nix            | 2 +-
+ scripts/imgtool/boot_record.py | 7 +++++--
+ scripts/requirements.txt       | 2 +-
+ scripts/setup.py               | 2 +-
+ 4 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/scripts/imgtool/boot_record.py b/scripts/imgtool/boot_recor=
d.py
+index ac433aa..6f0045e 100644
+--- a/scripts/imgtool/boot_record.py
++++ b/scripts/imgtool/boot_record.py
+@@ -16,8 +16,11 @@
+ # limitations under the License.
+=20
+ from enum import Enum
+-import cbor
+=20
++try:
++    from cbor2 import dumps
++except ImportError:
++    from cbor import dumps
+=20
+ class SwComponent(int, Enum):
+     """
+@@ -46,4 +49,4 @@ def create_sw_component_data(sw_type, sw_version, sw_m=
easurement_description,
+     #       list because later it will be modified by the bootloader.
+     properties[SwComponent.MEASUREMENT_VALUE] =3D sw_measurement_value
+=20
+-    return cbor.dumps(properties)
++    return dumps(properties)
+diff --git a/scripts/setup.py b/scripts/setup.py
+index a228ea3..692cfb7 100644
+--- a/scripts/setup.py
++++ b/scripts/setup.py
+@@ -17,7 +17,7 @@ setuptools.setup(
+         'cryptography>=3D2.4.2',
+         'intelhex>=3D2.2.1',
+         'click',
+-        'cbor>=3D1.0.0',
++        'cbor2',
+     ],
+     entry_points=3D{
+         "console_scripts": ["imgtool=3Dimgtool.main:imgtool"]
+--=20
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb=
 b/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
new file mode 100644
index 0000000000..c957fce3ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "MCUboot's image signing and key management tool"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://imgtool/main.py;beginline=3D3;endline=3D18;=
md5=3D9965f09ae52c04886a1f04e13ccdce57"
+
+SRC_URI +=3D "file://cbor2.patch;striplevel=3D2"
+
+SRC_URI[sha256sum] =3D "4858f5c5f48cfa4a0bb99e60d00aa291172a7ecc2afe4fb7=
7ed96121f59b6e2f"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} =3D "python3-cbor2 python3-click python3-cryptography pyt=
hon3-intelhex"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


