Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50810C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 19:18:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.78192.1673283755875309941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 09:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: theobroma-systems.com, ip: 217.70.183.193, mailfrom: quentin.schulz@theobroma-systems.com)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 7DE34240007;
	Mon,  9 Jan 2023 17:02:30 +0000 (UTC)
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	openembedded-devel@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH meta-python 0/2] add recipe for esptool and its dependencies
Date: Mon,  9 Jan 2023 18:02:13 +0100
Message-Id: <20230109-esptool-v1-0-938893bfd362@theobroma-systems.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailer: b4 0.11.2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 19:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100486

esptool Python module is a collection of libs and scripts to interact
with the bootloader on Espressif SoCs. The Python module happens to
provide three useful scripts: esptool, espefuse and espsecure. esptool
is the backbone of communication with the Espressif SoC's bootloader.
espefuse is useful when one needs to burn fuses or read the current fuse
state. Finally, espsecure is a tool for setting up Espressif
implementation of secure boot on their SoC.

Espressif SoCs aren't all used as main processor of a system and can also
be used as companion microcontrollers for specific tasks (e.g. providing
radio support such as WiFi and BT to a more powerful host, e.g. an
Aarch64-based system), esptool allows to flash the ESP companion controller
from the host system to which it is connected.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Cc: Tim "moto-timo" Orling <TicoTimo@gmail.com>
Cc: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org

---
Quentin Schulz (2):
      devtools: add new recipe for reedsolo
      devtools: add recipe for esptool

 .../python3-esptool/python3-esptool_4.4.bb         | 22 ++++++++++++++++++++++
 .../python3-reedsolo/python3-reedsolo_1.6.1.bb     | 10 ++++++++++
 2 files changed, 32 insertions(+)
---
base-commit: cd1388161143e9cbc3eb7d8c2edbc3b751728e75
change-id: 20230109-esptool-1c9e9445db00

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

