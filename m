Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1531E6FE46
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 18:47:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.6547.1725648457089395676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Sep 2024 11:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GsTAnzzw;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-205909af9b5so19312235ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Sep 2024 11:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725648456; x=1726253256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eSCsDLWaZnXjVK/7j2NC/rlVeqbNbcQ9GjAKP2op9Y=;
        b=GsTAnzzwSfbgl9xdQ4lLEURT1/qbf/80EDxjte2Ot6FUouOPooMvO3vS/Ju+JLcU6u
         ogo7OKxFPz1KHkA6fc7SbIxOCkNkN7+5uHSLSRUyU5VWDVA5DtjKnA1AftLWtyKScf21
         RDjkTOM1kPf5o2SKJ0yP0U52BxezPfZ5LQXaOLEhg7DFum1gII9PYjA0kke3HPz0oVln
         8UlFd7YrvDFhKeGuloSrLttboFR8JyPH0Qy0zZZSyL8ido91fHOrrckkR9Z4DegProBN
         Cx9nkExa033ia16elnX0we0IBIpwV1TUZRbF4su/nVt9cbFfb+xqmGmiQKziBgO5lq/b
         0g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725648456; x=1726253256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eSCsDLWaZnXjVK/7j2NC/rlVeqbNbcQ9GjAKP2op9Y=;
        b=YpnKdK3L+H0xJ6GHDTqrYvnCEUmALMdSJVufqU4Ho4JKnvgZAXd/0J9jP/xmqUVSZm
         vuYDhlcP1uTddhofBAtuIreB/LP7QezVMifcygZoGU7utX/6EKBNicRFI0B+MOTXk8w3
         Si4m36jtSA7dJvrztQC89ZZDaQ4AMLSvhRTaOs2Djd+5c0pb7PHs2vCXBtQRmOO+PSfc
         WXxWLu0cXwKOXJqdFQthi/rW6VIlT8/+ou8bfRxJuYeNyTan//u1Ix51N8oyYF+XWyui
         vRza4abhF0beQs7+kFyxeKz8MX9PqcrPEXbvMf5BYUkSdA8j96D/z8RvlNeUBgPufbhk
         Iepw==
X-Gm-Message-State: AOJu0Yy02FwNLmE3h+C9pgugoKFmz8KD8pbp1u9qLeLqzAABaJ4DOk2f
	W7cn2m8wkFandVCHvOGVvzCPz89qCpivtNffRPXq8NnGSWTKJHR7y80ICw==
X-Google-Smtp-Source: AGHT+IEE7fpalVlfAqRXz/3AugcqHEIEdQM4ZOP8Z5XM601lodzfejjxePHL3bYADaFoXJ0y9SaX+A==
X-Received: by 2002:a17:902:e80c:b0:202:38d8:173 with SMTP id d9443c01a7336-206f052587dmr39064975ad.29.1725648455891;
        Fri, 06 Sep 2024 11:47:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:75f6:ce44:2e95:7412])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae912fc0sm46355935ad.15.2024.09.06.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:47:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: otavio@ossystems.com.br,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] imx-cst: Add recipe
Date: Fri,  6 Sep 2024 15:47:11 -0300
Message-Id: <20240906184711.3654693-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Sep 2024 18:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112110

From: Fabio Estevam <festevam@denx.de>

Add a recipe for the i.MX CST (Code Signing Tool) version 3.4.0.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
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


