Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49A7CD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:19:55 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17876.1763014790385746517
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CBpZNcas;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso449578b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014790; x=1763619590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IH2oENhUhGfA6XTrOSJj+5nhm8XaQUmuac3DoiCL44=;
        b=CBpZNcaso5+sRmtkVoTAvy3ecUFY59XL4G8KEtPKbxAa9zMqDksBpjW2Wq8LYmxhBR
         HPp/dg5MwSPtGcr7Z8p2mJUyYJnuht29LlTXs78KumOrbacJHw0pzQ9Q1Xb+mNzu+C+T
         t0IEJIhiCraGrA6AJn6wrdYG2Nsmz4uvpD+S7p+KS1OTz047EydbPXUv4k+zgG4t4kN5
         Ooz9hZUXxqZId5TXSx2i2a2Gn/Z3RqRn9Fz6p2MUkfXvnVhVwH7OX7kVSJgt6PzjPwlI
         9PkZbPc2+i0veE0D9txxosgYmyBi20O2ztLlAhX8542U6miARCqYjYM0CT/c3jc1X1hT
         TeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014790; x=1763619590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IH2oENhUhGfA6XTrOSJj+5nhm8XaQUmuac3DoiCL44=;
        b=AUeu+rxN3/LW9t0gFh2oP8LxFPPM1XsYKo9kz0uSciot+7lMegSBNU1UuwFgucIEFl
         L/SiA8yXNVGBO0ct5itJyNOpItzn+kEuUpU8eTCkXwq1TDkx/+jN2GCNn2W0HpPp93dk
         a+s4C3g1xV3DD38zd6fbgRxyBXSoDYYrUczaBtM/lkFEYeRa+tyht1NWP91IQ/EfhAUe
         cQhu+RyzCTdrbvCbs20V/xU8QICkwKeT5TVexcPoBsy/NmM5nD+YEWQNaFbfg+KuqjYh
         H+M/J4i9MpEFIi3kbKHoYizK8A3HAkeFNB3JA90wBMG5av0/Jay/VQtqugYyr1O26MR8
         QkoA==
X-Gm-Message-State: AOJu0YzZCyHPXB6vclKkp3VSc26ktFINl94lfffL2HGJ8XWTjLKsLxtT
	PCAoJrnJbtUz5PugC7BZOlEdU3E07xXDCqkVjag+JuPkf77z1OpHoNuiAyXJEg==
X-Gm-Gg: ASbGncvN2v2jMpU16aGAoP7ko28x02oZN/U3CXIRgu2RAV08IlPXMeUXviCE5Giyzbs
	F5lpVezONVOCLWQzjZx99ggMbWoq8cIEwEeLDnwAHAU+EE244u0nmPaCdVMiikvB++9VpQ6kF/x
	x5U8W9nbYbxqMNGXO4wKeNHl25umNkfpzkJQsqXAFQXE7ICja7LeIXnNBvr0nhX3CxidF2cbfvq
	hMvwK6QraOzBGgBxmEXBTaj0Hcmd8Vv3KJqvlVdh/8tYIPokX2y1+8SmWzXj12v5I57k5GTArQB
	wDeT+YncLJc9zy57QOMrRP7fVPhO5IAWjajNSrzHUnFCsAB+ha+LvshcbEL7++VrmRwheE4LTld
	cNa9Nr6VA74vUPiUwAok6X26Lcu+LZ3MhfK18oF5R4tPPrxsHiPuAMUt89TRywxSyYGswGBCMru
	jPfmCrJOjQ2zXh2A==
X-Google-Smtp-Source: AGHT+IHvBwxmFwxLJjF137wgFgr8yB3PmR2gRp7Pc1JvqW/z0khvDc6ZfetdOwALvqymtvhzuP4CaA==
X-Received: by 2002:a05:6a00:909f:b0:7b7:ac37:9235 with SMTP id d2e1a72fcca58-7b7ac3797c1mr6843725b3a.15.1763014789632;
        Wed, 12 Nov 2025 22:19:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 06/38] usbids: upgrade 2023.01.16 -> 2025.04.01
Date: Thu, 13 Nov 2025 19:18:41 +1300
Message-ID: <20251113061914.3756301-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121604

From: Jason Schonberg <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a7bc0ed175a1c2661599dad14ee66b8b7d0a99e7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../usbids/{usbids_2023.01.16.bb => usbids_2025.04.01.bb}      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/usbids/{usbids_2023.01.16.bb => usbids_2025.04.01.bb} (85%)

diff --git a/meta-oe/recipes-support/usbids/usbids_2023.01.16.bb b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
similarity index 85%
rename from meta-oe/recipes-support/usbids/usbids_2023.01.16.bb
rename to meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
index b0dd72fb25..bdb5807aa6 100644
--- a/meta-oe/recipes-support/usbids/usbids_2023.01.16.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
 
-SRCREV = "7963233faf69eb9c80ffca8dfc1f31940f75999f"
+# April 1, 2025
+SRCREV = "635738b64eb52d376c5d1756c265de67236c8934"
 
 S = "${WORKDIR}/git"
 

