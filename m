Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F438C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 19:18:10 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.78779.1673284813284797149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 09:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 90858240004;
	Mon,  9 Jan 2023 17:20:10 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	openembedded-devel@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH meta-python 2/2] devtools: add recipe for esptool
Date: Mon,  9 Jan 2023 18:19:52 +0100
Message-Id: <20230109-esptool-v1-2-a27de84d748a@theobroma-systems.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109-esptool-v1-0-a27de84d748a@theobroma-systems.com>
References: <20230109-esptool-v1-0-a27de84d748a@theobroma-systems.com>
MIME-Version: 1.0
X-Mailer: b4 0.11.2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 19:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100491

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

esptool Python module is a collection of libs and scripts to interact
with the bootloader on Espressif SoCs. The Python module happens to
provide three useful scripts: esptool, espefuse and espsecure. esptool
is the backbone of communication with the Espressif SoC's bootloader.
espefuse is useful when one needs to burn fuses or read the current fuse
state. Finally, espsecure is a tool for setting up Espressif
implementation of secure boot on their SoC.

espsecure depends on python3-cryptography which is a Rust-based Python
module, making it a heavy tool dependency-wise which is the reason why
the scripts have been split in their own package so that people only
interested in esptool script have the smallest possible dependency
chain.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 .../python3-esptool/python3-esptool_4.4.bb         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-esptool/python3-esptool_4.4.bb b/meta-python/recipes-devtools/python3-esptool/python3-esptool_4.4.bb
new file mode 100644
index 0000000000..573e5fbdd1
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-esptool/python3-esptool_4.4.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A Python-based, open-source, platform-independent utility to communicate with the ROM bootloader in Espressif chips."
+HOMEPAGE = "https://github.com/espressif/esptool"
+BUGTRACKER = "https://github.com/espressif/esptool/issues"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI[sha256sum] = "8acd4dfe70819b1302861ae92894380fb4700b377f5a4739479a4ec276e0b256"
+
+inherit pypi setuptools3
+
+# Split the Python package into multiple Yocto packages to avoid bringing in
+# heavy dependencies like python3-cryptography when only esptool.py might be
+# needed.
+PACKAGE_BEFORE_PN += "${PN}-espefuse ${PN}-espsecure"
+
+RDEPENDS:${PN} += "python3-core python3-pyserial"
+
+RDEPENDS:${PN}-espsecure += "${PN} python3-cryptography python3-ecdsa"
+FILES:${PN}-espsecure = "${bindir}/espsecure.py ${PYTHON_SITEPACKAGES_DIR}/espsecure/*"
+
+RDEPENDS:${PN}-espefuse += "${PN} python3-bitstring ${PN}-espsecure python3-reedsolo"
+FILES:${PN}-espefuse = "${bindir}/espefuse.py ${PYTHON_SITEPACKAGES_DIR}/espefuse/*"

-- 
2.39.0

