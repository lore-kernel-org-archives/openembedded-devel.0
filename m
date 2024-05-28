Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A777C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 09:15:11 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.18022.1716887702937014117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 02:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BBJklL2Z;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e724bc46bfso5542461fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716887701; x=1717492501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrPgswMUQfUpwo19fU5ay407q4gX3TrT1h4GSsbrCZg=;
        b=BBJklL2ZnhEE9NwAsBgt2dUV3wG+9DcbfoNy1aUARZ5vo7m/1e2/MtxGvEbPD2riSR
         OxrR4sB0EwgAgl11jcNbDdcFsjg5Lz3W47PH8G04TDsvvq9w03Bo0DoNxbcTwtftR2DG
         4QdmksC5A+S6VECTCPRAjJeNEa7WvKxtMep69WPSlO0PkXX6kjznc64+nWIDcQRF0PHm
         mVw/T59LHbOSfAXoPxAehNqrTBmx0pxor7Di9MZSQcFJBTvcYN4HIelBcjZUknwoCiyq
         Xzl5PXL193eGl1/NOfsJKoowuFBrDwhwkgZsLaPMjYo5FQp2JYbonl23sn7+Pv3+yYK+
         I0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716887701; x=1717492501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrPgswMUQfUpwo19fU5ay407q4gX3TrT1h4GSsbrCZg=;
        b=oGJ76SjQylpTYgrMik2i+LiXe7n8xKHr08VvFW4lcFZ1llGHxydr0CthhoneXxFjjf
         eUhlJyjAfdhhWPaW+vQvoQMvcR6BrYOthO+EoDjRsxRnMPZD0JFlH1Eg5lqW9/yiva/Q
         jO+2FKBAFOT87gRt5ECuuJltaw8h/+jrJPI4OqvGt9T4oXZA0Dc6ETaMssb4r1irWH+i
         q5yl469rOtZVkcKXvlph1fJAqD0rZFuihmlqRcFwhfo1gx/hjDkvWsXyfi5raaMEoYyC
         EhtTAz+U8zzULqh6n6zwXtrmFdsa8Kpnj1ySjiE2pbeA8vc8kAoRLStbA/aonaTnUwd9
         hyaA==
X-Gm-Message-State: AOJu0YxWvEy1irLDKkva1/rQURCys9onqdKovcUWotHLymM8TPHoUH2G
	5k5iJhZLaneTwT9MVGcHPKfk3oXtBqOkf84ZIP2nZ0roAR/610WC0AweS8VLKre/eG+biytLj8S
	F
X-Google-Smtp-Source: AGHT+IGTfP35NRUHu/iz7U8RdgtXNxeeV5aMjwB6OgrnNOFbWI7IWB03mvlK/SRx5Iydo43n+XpIqw==
X-Received: by 2002:a2e:9f42:0:b0:2e5:67a9:4dcf with SMTP id 38308e7fff4ca-2e95b08f99fmr77881491fa.18.1716887700694;
        Tue, 28 May 2024 02:15:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4640sm22100941fa.56.2024.05.28.02.15.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 02:15:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] android-tools-configfs: point S to UNPACKDIR
Date: Tue, 28 May 2024 12:14:59 +0300
Message-Id: <20240528091459.3885623-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 09:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110579

android-tools-configfs doesn't have any checked out source files, which
results in a warning regarding S not existing. Fix the warning by
pointing S to UNPACKDIR.

The warning text:

WARNING: android-tools-conf-configfs-1.0-r0 do_unpack:
android-tools-conf-configfs: the directory ${WORKDIR}/${BP} (<scrubbed>)
pointed to by the S variable doesn't exist - please set S within the
recipe to point to where the source has been unpacked to

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../android-tools/android-tools-conf-configfs_1.0.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
index 430b53c4d0cf..b50437615ebf 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
@@ -3,6 +3,8 @@ SECTION = "console/utils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+S = "${UNPACKDIR}"
+
 SRC_URI = " \
     file://android-gadget-setup \
     file://android-gadget-start \
-- 
2.39.2


