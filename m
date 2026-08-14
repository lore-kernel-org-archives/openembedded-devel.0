Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D07C5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:31 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24407.1786747649325950163
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XSDmaI+C;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so21595235ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747649; x=1787352449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OTmaM6JW/IJKgWLCZw1QLeKawTL7GwFmfUna9mAGTU=;
        b=XSDmaI+CzSsjrwiyNIVr/T9q0alIU86v8jHzJKhaOt1e7bRyviu6iR9do4YVJCr8wm
         yOY4Gjm5JZItn310CKGav924S3Yd7gAlf/sQbqLGaY78qg9gBm4osBln7LNa5KQypwv3
         87kUz17scOjO0YX/T0pzeqZIjj6wmKw4vnmbjW8/I9DtFe9s9J68KSBQaSoiaUULf+dc
         Uudx6LFtKnflLhwtjeBg8NGrsjaGqt56jnoRVcS6QxOEZOa81avuv5WGb3g9xvfIsGzl
         Uns5P71bo4bvSFxX/csVK0tNrCT5Z5kRgxMbg924HUaa93jMVAs+NRl8uxgsqLzkOK0g
         uBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747649; x=1787352449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OTmaM6JW/IJKgWLCZw1QLeKawTL7GwFmfUna9mAGTU=;
        b=I7WHI9Gn2K5VIuKrVkcYskSOfEQ93esGYiW/hPAskBgKP95IL0Gr4aGzEMwVHcaQvO
         cfELYWQ5AzlwkLt26FUdyQ42AjXkCnEVbZAxhfH8BIcjy1zwux3YOihWIZt1JMxA3WBk
         XDGELTjcZj2DX5+N903jhkZUHUDoTDgSY4KY8AsMxZrtnMMVwzsKEmKDKQUyIlaPJiGI
         AkN+gs8Gmkl8/rB4Y4qC9Nh6xyUwbkqTlvutgCAcbmqnKg1LlHZe9docjR8Uem7/qDnB
         66ZABEUiICDMCpGoVcVGjc+rGERVTO09BilzEGJUVTwrjyipOZhsoiuStCnlWcBekzBn
         QG4w==
X-Gm-Message-State: AOJu0YwKIJuuXQgCc4y3IS9KFIQ7Ujwy+my0USxxPEEjDxxWRsn9B9A3
	3ZosvBMmNlfobSPNXjAoYEwuJA1fnlMsFVVKVvq1x83PVViRSZVrLigqWxnybWJR
X-Gm-Gg: AR+sD114gILQ761kG1I19E1OcAsGQ6+IeFujwtTORhDTWRCnL/okiuxoBvzfUeSjPw3
	zMIACI+7zt7sLAxFlsMAY7ZuXo+li5MOjz5ZeQT1IkM4rjUfRuPnh8+B0QAd8s0Dt3VPiWE12D5
	4SZ4qZDqGPAkavBHZxj5TH9U+hJbNG8Xf3l5baIyrwMTBH4s3h44/zfZYJiT4zhUJV4WGWa8R3/
	vOdXKpIDobMssOuEnhGY3fPVaNQc+s/mDn7cyJWu3c8P12d5sEuL9sDaC/u6Woc04F5a6y8NVXl
	BXRpuuak0Y3LNu/8P0KYlqVFuuQ7kGzFxAJHHwec9iPSfjo++FJkZX+j3Xb3Kk/nd4kJ1r2mUOk
	cuBrwcjHQjkIKtzEg3EJXN8iMViKT4gSLV2OiVf4KxD15YNzcaq3T8GsnC6EATPYXqshd2+96ZO
	ZHiFB2TbGhCiC1H0r+8SxpFBidFqA4QemHNaRAn8cQ7uXPW4OdySm9Nc8UsPGbcDdHjckX/M464
	h3TkdyM+FMOBLKtBtf7wLCLlQ1/AjIt64PXtFtrJJQgjXjfszuJZduXch9gxvZQV0sPRoavbROA
	Myp8Yqmq9C47dXBv+0532ezEparjGImgkhsBAKktJ5nm5Kc/H/zZcVHNwOoobfJaAq5otcU8vFC
	VjiR3vTtjpRdf0zgF9Jx5U2PpcbsrU6TrVL/srdBHZiSPxA==
X-Received: by 2002:a05:6a20:3c8d:b0:3bf:8de9:c647 with SMTP id adf61e73a8af0-3cc71881d83mr10399669637.0.1786747648626;
        Fri, 14 Aug 2026 15:47:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 089/109] nbd: upgrade 3.27.0 -> 3.27.1
Date: Fri, 14 Aug 2026 15:45:15 -0700
Message-ID: <20260814224539.1523174-89-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129153

Fixes nbd-client failing to find the device index when given a device
name without the /dev/ prefix; also refactors nbd-client's argument
parsing to be testable and adds a test for it.

Upstream's 3.27.1 GitHub release carries no tarball assets (unlike
3.27.0), so switch SRC_URI to fetch via git protocol pinned at the
nbd-3.27.1 tag's commit, consistent with OE's "no unstable GitHub
archive tarball" QA policy.

No patches involved. Build-verified with a full cleansstate rebuild.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/nbd/{nbd_3.27.0.bb => nbd_3.27.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nbd/{nbd_3.27.0.bb => nbd_3.27.1.bb} (79%)

diff --git a/meta-networking/recipes-support/nbd/nbd_3.27.0.bb b/meta-networking/recipes-support/nbd/nbd_3.27.1.bb
similarity index 79%
rename from meta-networking/recipes-support/nbd/nbd_3.27.0.bb
rename to meta-networking/recipes-support/nbd/nbd_3.27.1.bb
index 2dcf01204d..039786d3a5 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.27.0.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.27.1.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "autoconf-archive bison-native glib-2.0 libnl zlib bison-native"
 
-SRC_URI = "https://github.com/NetworkBlockDevice/${BPN}/releases/download/${BP}/${BP}.tar.xz \
+SRC_URI = "git://github.com/NetworkBlockDevice/${BPN}.git;branch=master;protocol=https \
            "
-SRC_URI[sha256sum] = "422a02adcdbab01c622307c6babeda5c84ca6c6f2d4e0b29936e6ae9b6a7662f"
+SRCREV = "f96f7fca3b37f4254c26c95f5c6c9dae70e030a1"
 
 inherit autotools pkgconfig
 

