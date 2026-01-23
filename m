Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB9FD74EE3
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 15:16:59 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.383.1769181415547681958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 07:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nf54VLKl;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-649523df010so2019103d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 07:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769181414; x=1769786214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABmyUXq/wITk7DWZ7Tevxocazh0uEXdDyrof9nv9nbg=;
        b=nf54VLKlL0VdHJag3eikIOnCaZsRXAkV+eCUpNIQLhuWUJ3Km095pcZD9Bq8cSRK67
         WOemWJ3PFkvjFeZl+KT9/rutwCZFY8u36OwhIz9fF8gwV2IURw17rDIMqu6uQ4QzejyS
         ERBSSOmTlRbRhUHzYPrk61kuo4DBN4ZtzQPTEZNRkDYIpeNmQaMfFAPUfrBH5rx04yBr
         lVP+0z0/6L7zlW6eyiBGTwKXvfvSZk7qGNiR8M+sSnyVwEBsq+9n4kdvooPti3ibKnDx
         izewft6p8cPKWdNke6O/b3SAFcGzedKVpoR5X0XISbk4Rgy9/lYLfdTpNjDt3YdTHzKS
         /qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769181414; x=1769786214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABmyUXq/wITk7DWZ7Tevxocazh0uEXdDyrof9nv9nbg=;
        b=xEgjV9zI+cN7npc/arRAhH+LzinhoxaWZzbaYffCQC/HJSHHo0qqSzvcIrIY0f32Pi
         DIg6CI/Sl2FxfVSPCbgt0EOCvVhYX03U4xY9cG9Tpk+0TtMorv0Zi2A36Ok18mNFfmIK
         pefdmAHyjX4Qou7N17zP2wESgPYaz3xKN4soNOnlI0EHYOPwNqZJzSRrvHtbK93rV1Z7
         iKVVQVJUZ6KUsY4xIc/tXp8XJIUS6EnmWhC+11ZnYYM3dh/g/WLnFUNbfWik5W3qQwdb
         Kwl/WOvy1ggyEylgRmOP4Nictl0Ti4FbfsuetrfTzujYKdDB+x23d28Gqcwd2jCMwHW2
         3rCQ==
X-Gm-Message-State: AOJu0YyezWv29WMdT3nzPrmhDRQ4Svm9ZFEvxW6vi1Ej+2vIGj1i8brZ
	IFdJSSeTGKBDTlOH2jffX58ZAtAfr/m4BuwIWy8geZK7JddLvQvfo8RXckeY7Lta
X-Gm-Gg: AZuq6aIxLp/qmfeix9H0NOUWJ/Bt4SVUyMs0ePGCquOJ9BCue0fpp+1qnham0GDMsYT
	VdbGzTudjb/kXGVg1tnuSWEvKlOzFXPoCx03Ev7Q2IgQyMCXNyXZ5I3kXvA2yRfiRAUzvRznUCJ
	4CtFCCshHXi/+j8cnbdPk97b8orUhI4EINhVHUAsFisDmtIX1+suGvH18YBx/MuGsiB/ZyHqnom
	G0hmCjhdHC0oz6dzZNnFpxscbOnxaZoY4rRspxvih9Mya+CXAYZ0T+NcavwOijrIG8fRskAVFzX
	hwMnOJ8CjInHCQV31DWFm26i9mATQU2gtIOPCRImA1owFi1e0Iu/rzaSj5f4FfxEDNCaEbnwtKm
	eO9LLEroKCHQVQDAdFm4bBWmZ+pJ/+Hd1guCZbOlMYmJUheHK/2WSbu6jVwEN0v7JR3V7v+bs8H
	1Hekq8vTIaxxmuPita2mZ+dReFtjqx7XMjaj611A1UBW4kJ3B2os0edgW4uITS+p1MwMO90Fhbr
	y/jj5L4mAhpMpf2rK2/gC4XvcpBf8cZp3tgf0ZUV0np1fpz
X-Received: by 2002:a53:c486:0:b0:649:4888:fb1e with SMTP id 956f58d0204a3-6495c043bbcmr1745556d50.84.1769181414131;
        Fri, 23 Jan 2026 07:16:54 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b2a2b0bsm11663537b3.31.2026.01.23.07.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:16:53 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] usbids: upgrade 2025.09.15 -> 2025.12.13
Date: Fri, 23 Jan 2026 10:16:45 -0500
Message-ID: <20260123151645.7059-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 15:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123781

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../usbids/{usbids_2025.09.15.bb => usbids_2025.12.13.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/usbids/{usbids_2025.09.15.bb => usbids_2025.12.13.bb} (83%)

diff --git a/meta-oe/recipes-support/usbids/usbids_2025.09.15.bb b/meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
similarity index 83%
rename from meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
rename to meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
index 925a8ddda9..ebaa1d1f99 100644
--- a/meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
 
-# September 15, 2025
-SRCREV = "18b3055a9819a341ac2ff957f0b92f564d0d5d6e"
+# December 13, 2025
+SRCREV = "5de1427442504bc8e28d35cca5397d64ea177456"
 
 
 do_install() {
-- 
2.43.0


