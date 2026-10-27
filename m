Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28060.1793132099030402405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 13:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iAFpNigb;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so341685c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793132098; x=1793736898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5iJJW3bh+Uzn4d+5xHTKkM8YJnJrDZCNnpTvqfleh0=;
        b=iAFpNigb8WS1mUcGqYcgI49LFK/xUQY+9gcB5X4SQkm8AmDi0yQ3BBnXza+bs9b/It
         FELyCC36/zs5IyKVUNSc2EV7QyhSMFomhJg+oDsPJ98TtE80l8ty48F5Dhe+SoKlAjQC
         evKMIbmMPBymo90swOLidRn7xawCJfEPEv4K/UrGoHvNOcFoYL/h2uPdbf58eViwjjN1
         OQglC9D9bHzE9YizVwPvBBMtjrIg3/OOCJ+AfoI7IDLG0jGc6Af+U28k/Ir3cqahQUIi
         DpeqG0IenJPK5d5YXa6VYd3UIRLIQb5J5igaXBGf3bz0cneJd5kssnrz3/xabWsc66tr
         2PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132098; x=1793736898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5iJJW3bh+Uzn4d+5xHTKkM8YJnJrDZCNnpTvqfleh0=;
        b=RzStTbx3KscJaikzKhbd8Lj599bvWhhbS8ay474K5HvR33ReNay7uQd1FRAfDf9idm
         qUEP2wXa90Vq52/dhMQHCd9dKEnhN4IWK6WWWCBS5cgH/85Sspf5DnQgVL0Exm4D3V8W
         b/2Vw5tkoGtpXGQGQD4tOfg2pwB5Zr+1ZqNutBGMSWY2n3ekDnJegTxMOVo2oNuA9Chp
         Hpwihi6Qgk63LUdECXwH6C30LTBS6u2CNXIKaGrxOuNRf7WmCUpuQRGewJehCwrSg7j5
         qaYDfIF8fLmlvZNcO7PoKThEBGOTn4oFdoLnvSfn2s8k45bIicNehq/SUgI7PnxhPlgn
         QOzw==
X-Gm-Message-State: AFq9FYJ1Yczv6sAoioLFIC00MTyHu2qlfaAGg9TpIvcwPbbih+lVtoFW
	Zk59uPAKHlKgEDXwFr9vphcHyLEvAN9q58mMiiM71aSwnM7YmSqmhKWUN+SFcxhYuws=
X-Gm-Gg: AYBFou2nUfCFZLMrtxcF6dNPxWmCwbE+yxlX1XgRR1/8gjIY10S0jZmh55mdUWIaR5X
	DlNzKXZPCL2lOHBRpAUYhLkQpE4WbgHfuPkUR1SOk7JTl4k5Xu3k8Fxg7fCQYnHu3QtV+XbO56Y
	bX+LSjgUNPCziCsqpfrm1floU2fFg/RnsF0eXG3wpxLFXxUlcpycVS6HmSA99FHVZXFyZy8Ye/3
	jAlP0HSUMUpU6uFcrCYG9OwDb4ZV+wzCsJgESEa5ZrzQFViRlenXeYyyC8o7LH2EIzZlu8JrYK6
	1+8ejyqKcl/FkWAllvMu0Js7phl8qAYhePRy2Sgr8BHxzsvRRhExiGUggU9Is2emzddbmNFdXe6
	LRHcriQw1gLm5vwzOliAP92DJy1uBHtm9fdzPFlZ7vmbd4maAkEWia0hHCbXqeZ1Teafnbhp/sH
	kJhxQfQRgfIxmq42vERmK2bkO8G452bl0CEH0L1UbA0g+UP4xsLM8rx8jx1lyFI4lSeHRIz6wII
	SUhKgR5RficZCugAgXj4a4RHjDFxp3yJW1VRCY2klANIQSUmEAJCOrVsERPc5PbokYv9BqqHMVB
	XV2cN3jLPlBP7AQOYo5IuBsS9i3QxBRt9YcXdaogRC+fbwGGP5hZwUVdfgfZCoDC0S8G7ClhHbc
	gWpjPLid/fkT91WEuEfTUfeLGM0+RD1HnVLKEn4X/UOr1lYuqRXv+Q4/Yuy6Ix3Zuf1LPzcKCh+
	zgWwT/Gr4E6gYNu+vUtd8ASdBjU727eyeXUDMht/CVf30mReizhrb60vgkVxKZ1Qgql9YgGphiY
	hqSDB7HTsj4+9KQ4Xv8FDHwW7FLgps=
X-Received: by 2002:a05:701b:2511:b0:1a4:fac9:aeee with SMTP id a92af1059eb24-1a6c87bc707mr360158c88.4.1793132098172;
        Tue, 27 Oct 2026 13:14:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d8a5ede7sm485530c88.9.2026.10.27.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:14:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] kernel-selftest: Enable in world builds
Date: Tue, 27 Oct 2026 13:14:55 -0700
Message-ID: <20261027201455.2159289-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 20:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131549
Content-Type: text/plain; charset="utf-8"

Clang is now in core

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 7a27ada2f0..018ac74b85 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -238,7 +238,3 @@ INSANE_SKIP:${PN} += "already-stripped"

 SECURITY_CFLAGS = ""
 COMPATIBLE_HOST:libc-musl = 'null'
-
-# It has native clang/llvm dependency, poky distro is reluctant to include them as deps
-# this helps with world builds on AB
-EXCLUDE_FROM_WORLD = "1"
