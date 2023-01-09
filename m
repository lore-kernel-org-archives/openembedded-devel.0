Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4C5C67871
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 19:18:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.78193.1673283758112645253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 09:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: theobroma-systems.com, ip: 217.70.183.193, mailfrom: quentin.schulz@theobroma-systems.com)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id EAE5024000F;
	Mon,  9 Jan 2023 17:02:33 +0000 (UTC)
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	openembedded-devel@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH meta-python 1/2] devtools: add new recipe for reedsolo
Date: Mon,  9 Jan 2023 18:02:14 +0100
Message-Id: <20230109-esptool-v1-1-938893bfd362@theobroma-systems.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109-esptool-v1-0-938893bfd362@theobroma-systems.com>
References: <20230109-esptool-v1-0-938893bfd362@theobroma-systems.com>
MIME-Version: 1.0
X-Mailer: b4 0.11.2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 19:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100487

reedsolo is a pure-Python Reed Solomon encoder/decoder.
It is required by esptool which will be added in the next commit.
This adds a recipe for the Python module.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 .../python3-reedsolo/python3-reedsolo_1.6.1.bb                 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.6.1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.6.1.bb
new file mode 100644
index 0000000000..51651f3bcf
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.6.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Pure-Python Reed Solomon encoder/decoder"
+HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
+LICENSE = "MIT-0 | Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
+
+SRC_URI[sha256sum] = "a7ce6b0efad8df491a70b87b6ab3543e751f7700dc4ac0b12081a456ef634f5d"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-core"

-- 
2.39.0

