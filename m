Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9236C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 22:40:20 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.8908.1709246417966821269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 14:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JVEHSStT;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d94b222a3aso16120885ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 14:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709246417; x=1709851217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESekO742Lz+C/LXXb5Bz1U7AINiNZOy88oeC9573g7M=;
        b=JVEHSStTMzYVsCCG9u92UsW/fKfOj+Xzs0rDme6hWKdgxlmE9PdFjzKtMykLPWqMk0
         OKkIDE1BL5ILDF1UmlTZigjRdyywzbMIGfuPgqgq6sprNkcB6DCAPemBXF+ma9HsqDN1
         D7mW1A6vvSMXt34c+F7mzILtRM3SRlAa2+TVHLfYpqC9L76B0vCrIZd3xBnT0RECpjiy
         KoXn16IsKo5hN0UwZuRmDfpuKfzyKiMBKpBOng3BeSGGiM8GiO3hFbE/WG8cRApabCt0
         yV0gU6rixwtRd3Z1dg0beK0S8ArVrMYjTRtQDRvbREatgHYWvQD7pijRGOVLPTnArjVA
         7VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709246417; x=1709851217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESekO742Lz+C/LXXb5Bz1U7AINiNZOy88oeC9573g7M=;
        b=ZMpsjdyqLxrsbMg4C/G6u/Fcklvju7dfWtuzR04j4jm1Uk/dindE8Wwp5grDNpFJAn
         MVrYkNLgP/4FFEs4GV1qd4UWpMOp49JDm9C+8JysjyacjqULFquz1El0ICWQItBLzOjZ
         hlYNa2qhi33M07o2210nfy4GfIQqavB8BEg8yve59BuVUB1LzhuQPga/INYcoClQrTuu
         dsJgaGWGsJpiGKNEbdwEt6OZm1qL1GIZBMDaYw/b2sdFwueyLEsKwFXVoa8cIQ4VOAn/
         xtBWqJ7Vtl4ldQ6uhEbY6rlMJEO0fF0r2q2UNvvVk42saxjabNpEL1DmX4BZIqAkXMnG
         QI5A==
X-Gm-Message-State: AOJu0Yz8hJTgMYb/niuHanwo8uSfwb0AQAG46GpebP7C5oYtD4ANJChL
	7ATCkZPu3JDsWPLwvjvoTq+wNAK4uiaPxddW6G94yQYVTic15tzTX4of8T2M
X-Google-Smtp-Source: AGHT+IG4yUiiqnARYkdFnZKRDVdGyV7t7DwFMx+Pjj5s2n8vAWrxOTeG2G4xDYd47EKMaQGXSKIC4g==
X-Received: by 2002:a17:902:d487:b0:1d9:3bb5:2819 with SMTP id c7-20020a170902d48700b001d93bb52819mr4256653plg.34.1709246416718;
        Thu, 29 Feb 2024 14:40:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7ade])
        by smtp.gmail.com with ESMTPSA id d3-20020a170902cec300b001dcc121c43dsm2035894plg.13.2024.02.29.14.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 14:40:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libgpiod: Tests rely on configfs support in kernel
Date: Thu, 29 Feb 2024 14:40:11 -0800
Message-ID: <20240229224011.1551220-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 22:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109063

Add a recommendation on configfs kernel module.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb
index 1e92d00790..33df709a63 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.bb
@@ -24,7 +24,7 @@ RDEPENDS:${PN}-ptest += " \
     bash \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2', '', d)} \
 "
-RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim"
+RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"
 
 do_install_ptest:append() {
     install -m 0755 ${S}/tools/gpio-tools-test.bash ${D}${PTEST_PATH}/tests/
-- 
2.44.0


