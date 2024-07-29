Return-Path: <przemyslaw.zegan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C78C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 18:25:41 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.63301.1722277539274078491
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 11:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mkEnugvU;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: przemyslaw.zegan@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef23d04541so47308371fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722277537; x=1722882337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rTx+t9+/gGJbKx+jPly+a7y6DHHfjb5ln2NTc5APpJA=;
        b=mkEnugvUMQtTvUb+EwgwNP9Y7eIv3vE8NiRXku/mQ8kl6cS0ejFbFE1sC9J8V3cWiB
         5NyPPP/h1vTX99FRFraO+ySd1WRcJNJsJfX2XQ7tO+A93dJwYLfImAXtI7cUdy5XlGS4
         3zJL/YVut7rgoimw0nESaZUvaui0rSPWSdN5xKS4xFL5r9BF1HBm12/jx+D5R6IGeTaC
         cNzU0npAFCW1XGA96sN43DqzZfosVxCRoYUC+DcGiIMZkkZ6bRKHuxIjtTdo50Exxinf
         GlnV7d4Bro+UQ/yZ+6O/Zis014b1r7JVUBmEVkWMpztffDx354RL821GWOfh71u9Xbun
         weWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722277537; x=1722882337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTx+t9+/gGJbKx+jPly+a7y6DHHfjb5ln2NTc5APpJA=;
        b=b4Tt8SHbC6B2/12GjoNIi5sy31luv22mbruBusyuNIrTjNUvIuMshKZixoXdBIGewV
         ahsoVs96+S2EQhgXNuBgL4d0xu6plxK+sPJbnvoeokUhXGbviMEyXjMTK3MYjiVE1hga
         JACDzDRJ18XxNMPrQ+kuhpqFRltyjTanNIkSW32VsR1QmEn42qGGUucU1hq9w5CHIT2g
         EUry6XE7d7t8OYJ8Ehi4xBrJDqP9y2QsF8Q133xgyhBxXKLeZmFPWqlHE+rnZqIrY1Zo
         cXWrCLmASFhG6wbo2DSGgHkBI4PXqMNsuKI2nTNe8l5NCeD+xetuBEoyGx4RYO865Owe
         Zl4Q==
X-Gm-Message-State: AOJu0Yz4tCQeJeDCzmXqKSwRspMETfr+9Tmy+0852D/lPlOwV0IUG/D7
	RsQYVRIhsz9lVmuafRTWuv3qtGWf4zca1qylB/YryGpHxBcPZppwC81wSw==
X-Google-Smtp-Source: AGHT+IF+JWtz6QfGkesNWRf1FmlKAYOE5CxM9ROWa6OaLuhwFMpwHbVzEp6ZWHViKOUP+UrB5mP4og==
X-Received: by 2002:a2e:7808:0:b0:2ef:295b:4946 with SMTP id 38308e7fff4ca-2f12edefd2cmr52778971fa.4.1722277536400;
        Mon, 29 Jul 2024 11:25:36 -0700 (PDT)
Received: from enc.home (2a01-115f-4215-9a00-ecc5-4144-2bef-1f96.fa.ipv6.supernova.orange.pl. [2a01:115f:4215:9a00:ecc5:4144:2bef:1f96])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac631b052bsm6020528a12.15.2024.07.29.11.25.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:25:36 -0700 (PDT)
Sender: Przemyslaw Zegan <przemyslawzegan@gmail.com>
From: Przemyslaw Zegan <przemyslaw.zegan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe,scarthgap][PATCH] libftdi: Fix missing ftdi_eeprom
Date: Mon, 29 Jul 2024 20:25:32 +0200
Message-Id: <20240729182532.432091-1-przemyslaw.zegan@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 18:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111474

Due to the incorrect subpackage name, the ftdi_eeprom does not placed in the generated image. This patch fixes it.

Signed-off-by: Przemyslaw Zegan <przemyslaw.zegan@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index eae1c02f0..ed989a311 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -36,5 +36,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "${PN}-python ftdi-eeprom"
 
-FILES:ftdi-eeprom = "${bindir}/ftdi_eeprom"
+FILES:${PN}-ftdi-eeprom = "${bindir}/ftdi_eeprom"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/"
-- 
2.34.1


