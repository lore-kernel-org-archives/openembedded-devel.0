Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490B2D0D159
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:11:58 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12760.1767809513328848635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYKMbepK;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0bb2f093aso19066965ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809512; x=1768414312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xb3vO7Rz7ntmEq4NYlXPjbPmDmVBHO4vExZymP9VTFI=;
        b=TYKMbepKiw6hynsCa0trcZwTKqvVrXCWnafla2h2CAr873ooS1HU0L7Y1y/BBfZaeW
         66bMSm8qpV7uSpLGbIfxzBWKnTL80KMmrnQOuDzeksofmRMmqb9AHPiuCIY+EldIcX58
         XftanWIkjp5vaLygjPARfRN0atwEs/8wWqYw/31xFOwfQjCd3Cy7Oc4uK2M2+QAKDZSg
         9TQarxiUnhIDj6jvE5bOu/dZAif9zAukiXWIL7vbFxLPyN7FTjVy8SGIZ1KBz+tCzVsW
         aX+0nPEuIEyB/7bNgBibQt6BvHPhbJBAV3hYx44HsNzPVgLXCTKz1qkMw0iCYnhXhB/B
         iZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809512; x=1768414312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb3vO7Rz7ntmEq4NYlXPjbPmDmVBHO4vExZymP9VTFI=;
        b=Is/jcP7tDM1VedmKHW7U968dW9bIseYrul0dBMsap6t1nHlnlx+eGCD4vUYUlYm7B4
         4WJWrS2vii1pGcNItSWTkXlQhD4XJX80S3H8b2Hlt37GJ/iyUtBsBlFzE3X3T/w8mUSy
         Y1WAv3Argqu9sNWGJvRhdtIBVh0aeRuzEEzeE1vvJDHADRI8ROjtR/yTuz9sMdyF5kWN
         GDiOeYBFE4h23CvYTKB3McXaVs2xBXwOSZ2+iNh0oUXylV5DE9ivw21IvL/ThD122r2s
         gEpEEKqYS3hh93dsz6eSXaiV8kZD/xxceAw3xVsKJU37UwSiWZfizEqgVxfTsGvDG/C1
         aV5A==
X-Gm-Message-State: AOJu0YyPldBy5SSF+NDRWWZjSg4t2ZuQIDGhPFS0543vVoG2O2j89HCF
	+Sui3fFTbBGV6nAa61agDj6Opvqi7E//It+9DcyB/bQ7B/XDvlMTfgcfJE8ihw==
X-Gm-Gg: AY/fxX4PpQv8PadMzJ6KBDsk+NkX/9xgfUN9uWaav0rNdIdlJfvBD2CUhb3L+FriuoV
	kP81M6iBSzbN40a71SBMDcMpuEffA96lgrhxKaWjUejHuxqLPYute/yCU0dHoUCUMkXhEKYi0Ih
	C/QKwadTf3aEjmooajJJ6LFDK8U+8P1JmZQ2AhfX2IiTLp52O5J/GrY4busgSBFUiwd3L/IgIVV
	X3JpuKYZ7Ze6x+ii4WF6R0W+zv3LTDLSBHOUCdHrySJH35cEpfStgRnFHVFV9W4G+D4Rc3gST4a
	utDdlI3g+q+ZA1hr9acHqFeVFJ37JrIW41Gm2ujN7z2YldVm9QKGYFybUELkyy3/ZJpAunXuGMN
	ZEyjN0tCtqghC5C3t2HFrk+x4ZEAl6AtHSLBqzrupWofSCU7nb6X62Rzvx9X6HUsgx2OEWZrqNf
	4SejukopqTDQAJOOAb9YoFR4U=
X-Google-Smtp-Source: AGHT+IFxvVag9AKYiLJTTaB/NhNyjFqh1SAiwigs7LFkD9ZvC+2HR+nAaQAf8YG8DDjTv8uWS6qyFQ==
X-Received: by 2002:a17:903:b84:b0:295:86a1:5008 with SMTP id d9443c01a7336-2a3ee4b3022mr27959745ad.38.1767809512410;
        Wed, 07 Jan 2026 10:11:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c20sm57040455ad.32.2026.01.07.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:11:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH] libjxl: Fix build error with arm and musl
Date: Thu,  8 Jan 2026 07:11:38 +1300
Message-ID: <20260107181140.1026336-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123229

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Build fails for qemuarm with musl with following error:
/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1/lib/jxl/convolve_separable5.cc
| error: out of range pc-relative fixup value

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
index 7b0a6db9fb..ad5b5d169b 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
@@ -46,5 +46,8 @@ PACKAGECONFIG[sizeless-vectors] = "-DJPEGXL_ENABLE_SIZELESS_VECTORS=ON,-DJPEGXL_
 # lcms/src/cmsps2.c
 # error: out of range pc-relative fixup value
 CFLAGS:append:toolchain-clang:arm = " -fno-integrated-as"
+# lib/jxl/convolve_separable5.cc
+# error: out of range pc-relative fixup value
+CXXFLAGS:append:toolchain-clang:arm = " -fno-integrated-as"
 
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"

