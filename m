Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E4DC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 16:18:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.46236.1635783515003473863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 09:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24E3413A1
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 09:18:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C34EB3F5A1
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 09:18:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python] python3-imgtool: add recipe
Date: Mon,  1 Nov 2021 16:18:31 +0000
Message-Id: <20211101161831.1978140-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 16:18:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93747

imgtool is part of MCUboot, used to sign images and manage keys.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-imgtool_1.8.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-imgtool_1=
.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb=
 b/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
new file mode 100644
index 0000000000..143c011a2a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "MCUboot's image signing and key management tool"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://imgtool/main.py;beginline=3D3;endline=3D18;=
md5=3D9965f09ae52c04886a1f04e13ccdce57"
+
+SRC_URI[sha256sum] =3D "4858f5c5f48cfa4a0bb99e60d00aa291172a7ecc2afe4fb7=
7ed96121f59b6e2f"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} =3D "python3-cbor python3-click python3-cryptography pyth=
on3-intelhex"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


