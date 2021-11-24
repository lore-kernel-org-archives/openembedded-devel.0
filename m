Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A634FC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:55:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.192.1637769347194590062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63EE11FB
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:55:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DD173F66F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:55:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fwupd: fix dependency typo
Date: Wed, 24 Nov 2021 15:55:38 +0000
Message-Id: <20211124155538.3917495-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Nov 2021 15:55:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94114

lzma was the PACKAGECONFIG name, not the recipe name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb b/meta-oe/recipes-b=
sp/fwupd/fwupd_1.7.2.bb
index 81f74f46db..939f1c9293 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb
@@ -65,7 +65,7 @@ PACKAGECONFIG[plugin_dummy] =3D "-Dplugin_dummy=3Dtrue,=
-Dplugin_dummy=3Dfalse"
 PACKAGECONFIG[plugin_emmc] =3D "-Dplugin_emmc=3Dtrue,-Dplugin_emmc=3Dfal=
se"
 PACKAGECONFIG[plugin_fastboot] =3D "-Dplugin_fastboot=3Dtrue,-Dplugin_fa=
stboot=3Dfalse"
 PACKAGECONFIG[plugin_flashrom] =3D "-Dplugin_flashrom=3Dtrue,-Dplugin_fl=
ashrom=3Dfalse,flashrom"
-PACKAGECONFIG[plugin_intel_spi] =3D "-Dplugin_intel_spi=3Dtrue -Dlzma=3D=
true,-Dplugin_intel_spi=3Dfalse -Dlzma=3Dfalse,lzma"
+PACKAGECONFIG[plugin_intel_spi] =3D "-Dplugin_intel_spi=3Dtrue -Dlzma=3D=
true,-Dplugin_intel_spi=3Dfalse -Dlzma=3Dfalse,xz"
 PACKAGECONFIG[plugin_logitech_bulkcontroller] =3D "-Dplugin_logitech_bul=
kcontroller=3Dtrue,-Dplugin_logitech_bulkcontroller=3Dfalse,protobuf-c-na=
tive protobuf-c"
 PACKAGECONFIG[plugin_modem_manager] =3D "-Dplugin_modem_manager=3Dtrue,-=
Dplugin_modem_manager=3Dfalse,libqmi modemmanager"
 PACKAGECONFIG[plugin_msr] =3D "-Dplugin_msr=3Dtrue,-Dplugin_msr=3Dfalse,=
cpuid"
--=20
2.25.1


