Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B709CD4F4C
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 00:29:40 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.42309.1725841777914782027
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 17:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=frWZkj0O;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-206bd1c6ccdso33606465ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725841776; x=1726446576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmmxFrQaVxaq8oc652zXjfcxeh3dkqm+8oW7KVc8I90=;
        b=frWZkj0OcAr7oCYKHirQ8eqT/BViZPpBEafuxpJUSQt3cxR955/9ergGdUxgKMRHHi
         vHBanSZ/CMroeH/iqpRMHZbYN7JIBLhvo2Aa3coy7kibbBm9e1Pmd8xWg5v37jyH6T20
         FDlsOkGqx+lTn6DW9Q7Mr48eemqfG3fTHhtuoSkphJAysf38O5hmtnPXgVQtbWKfRZr1
         LyN/Dodxpe8Gz2RELZRNxIAUp+6RAlwor3tHnFwx6F91HZdCdcD9WPO+AcGzeLnaTC3Q
         JHJECUxvMk5GcDY3rSI33t4AJrs2SgBHVzRvj1CfXRFuBqyv5t/v4o87opxzFLo+PX+5
         ttPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725841776; x=1726446576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmmxFrQaVxaq8oc652zXjfcxeh3dkqm+8oW7KVc8I90=;
        b=jfLoy1Y1TarzV2PUa2mqppCta9ygMRNSyzwfj56zhSPh2wrQWK7prK/SFr321ftI5r
         pnKlDEayu2JndVw/XcnKhkZjBU1HCQ9ONX9eG8I3JZiq17OhV8qzsPRomWRUmo2jOwOD
         Bcvw0CSJrHZxrbgo1wu3NClEmZ0YZhDkDqo1zMxweFiibbW3taWDelCzx3ajrTpcBX5C
         5fGgCFRXkfIUiiiNHsGKv2ksjQNmzdomznHjvy7LyUSk1DIimiYDlkp7eREz0MkyNJrn
         3tXMvNmc+Qd1eJgZtlK7N1gd6ZXpn80oWGORc6HbPrf/q4IJbjJCgtAIt1ZX1B22s+4R
         OwgQ==
X-Gm-Message-State: AOJu0YzQesI5MaHt5O+Q/3zxKgSAJnCRc0T1d6tgdng1QKYEgoonKufb
	W+vu9Ky7nQjha3FQx9CpnSjTYJmuFVBIGI1QeHrDjNnivtE1xrlVXaEvfg==
X-Google-Smtp-Source: AGHT+IHmcFHyt9pKhf1EREpCdbfoC4YG6VEZQCBpecM8mddyqpaDam6YW/flVqP9rgHQt594EnJniA==
X-Received: by 2002:a17:902:e811:b0:202:2b3e:28d0 with SMTP id d9443c01a7336-206f049d483mr76250655ad.8.1725841775892;
        Sun, 08 Sep 2024 17:29:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:524d:76fe:68f:aaa1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e34f7esm24169195ad.115.2024.09.08.17.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 17:29:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	otavio@ossystems.com.br,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] imx-cst: Add recipe
Date: Sun,  8 Sep 2024 21:29:29 -0300
Message-Id: <20240909002929.269148-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 00:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112175

From: Fabio Estevam <festevam@denx.de>

Add a recipe for the i.MX CST (Code Signing Tool) version 3.4.0.

The Code Signing Tool is used for secure boot implementation on
i.MX devices.

Example on how to use the CST tool to sign U-Boot on i.MX5/i.MX6/i.MX7:

https://source.denx.de/u-boot/u-boot/-/blob/master/doc/imx/habv4/guides/mx6_mx7_secure_boot.txt

Example on how to use the CST tool to sign U-Boot on i.MX8M:

https://source.denx.de/u-boot/u-boot/-/blob/master/doc/imx/habv4/guides/mx8m_spl_secure_boot.txt

Multiple layers include the imx-cst package and offer their version of
the recipes:

- meta-freescale
- meta-secure-imx
- meta-phytec

and probably more.

The idea of having imx-cst in meta-oe is to centralize and maintain
the efforts in a single location.

Move the existing imx-cst recipe from meta-freescale recipe to meta-oe.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Improve the commit log. (Khem)

 .../recipes-support/imx-cst/imx-cst_3.4.0.bb  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
new file mode 100644
index 000000000..b558ce619
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
@@ -0,0 +1,39 @@
+SUMMARY = "i.MX code signing tool"
+DESCRIPTION = "Code signing support that integrates the HABv4 and AHAB library for i.MX processors"
+LICENSE = "BSD-3-Clause & Apache-2.0"
+
+LIC_FILES_CHKSUM = "\
+    file://LICENSE.bsd3;md5=14aba05f9fa6c25527297c8aac95fcf6 \
+    file://LICENSE.hidapi;md5=e0ea014f523f64f0adb13409055ee59e \
+    file://LICENSE.openssl;md5=3441526b1df5cc01d812c7dfc218cea6 \
+"
+
+DEPENDS = "byacc-native flex-native openssl"
+
+# debian: 3.4.0+dfsg-2
+DEBIAN_PGK_NAME = "imx-code-signing-tool"
+DEBIAN_PGK_VERSION = "${PV}+dfsg"
+
+SRC_URI = "\
+    ${DEBIAN_MIRROR}/main/i/${DEBIAN_PGK_NAME}/${DEBIAN_PGK_NAME}_${DEBIAN_PGK_VERSION}.orig.tar.xz \
+"
+
+SRC_URI[sha256sum] = "52ee3cee3bc500a42095f73c4584e223b4b9d2dfc1cd3e5df965c5952eba8c8d"
+
+S = "${WORKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
+
+EXTRA_OEMAKE = 'CC="${CC}" LD="${CC}" AR="${AR}" OBJCOPY="${OBJCOPY}"'
+
+do_compile() {
+    oe_runmake -C code/obj.linux64 OSTYPE=linux64 ENCRYPTION=yes COPTIONS="${CFLAGS} ${CPPFLAGS}" LDOPTIONS="${LDFLAGS}"
+    oe_runmake -C add-ons/hab_csf_parser COPTS="${CFLAGS} ${CPPFLAGS} ${LDFLAGS}"
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/code/obj.linux64/cst ${D}${bindir}/
+    install -m 755 ${S}/code/obj.linux64/srktool ${D}${bindir}
+    install -m 755 ${S}/add-ons/hab_csf_parser/csf_parser ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


