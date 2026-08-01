Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10ED6C55183
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13596.1785620736652715076
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CYAlNezr;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceb096e675so25827695ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620736; x=1786225536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SE9QOv2mCLLhT+Rc9EbDA1uk4qcndTY6oSfigPkLAEE=;
        b=CYAlNezrz3FEHK4M0PbFpCBM5oUs7nLKRbTh61sKqpGMeQkrky9iqQKZInMUML6jzY
         sbGx5M2Rg5/Tk6IVVGmpFybtb5/NYA+dW96YL+4c4c803jHdvW5LdQUU+J7ZyDJP/jjL
         IJblvmt9QarEEyzhgezp+fKbLxOzxcMC/H0b8poyonq47mGTWlcubwiNcAND7boC3aoC
         VTUsdvXUj6yV/PMA0CIMydtFq8orPgxfpt1Y0H+rDtG9UlwSPGrFW/R2TYiE2fKm5zmv
         0PPQdvxNm1HTeI2AVUADla/CyHxYqu421p52MvBOU2Ee7HQlO5fFnDpNH3nH9HMhxTiR
         NXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620736; x=1786225536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SE9QOv2mCLLhT+Rc9EbDA1uk4qcndTY6oSfigPkLAEE=;
        b=L9rheYOxmGd62I/abHdNAlcjAc0hZjZC9ulg0NT3Lj0gDNFlZ6S7Eo8YIoR4h3xmgD
         GgUo9NXSKegPmhnjEcuK3uWjHnsVTIgSUKI+FywVbvxX2q5I5ETvdFgh5ZqQWWbmfwVK
         UsKPwiWRZEanf3a/UReNQZH3bwff6LFIHwdAL6q312EZZGRDE9fd6okJMfPYsbKgRfg3
         7IFQsDd7Aoh7bvKhrN/OUypuPmT9mEPxQ4sdnNSwRlk4XqRJdYxHNyE6Bi7UuFi60ANL
         IigDiRDuLIw/yjrQS5j/e5Q8h7bBJUSF9WeIwZwbXXCsh86szdXyecwrdlHhcepxvOpx
         aNqQ==
X-Gm-Message-State: AOJu0Yw7o1wt8UWpExb3iSlRx3WhRgIdYqVO8TYnlBlDWbnNQ5Z+slqa
	d+Owu+kMM5xzTppobvE3waKYC31Ld8/uMRwSQVJE3krh9UE/ZbfvnNJvl9uXM2+y
X-Gm-Gg: AR+sD10t06JC9awangnmTyIxQtAgqRvSF/tnOO0KNcTf7VXKQmOrvGLJRTi+tnP57km
	TSPWgZydNM13tL5TJDxCmD/lPxa8Ox+RhkV6WWssg2i6R0Ir5trrHoPZ82Rik1iUh1uWRcAtXwG
	FIZ5JJ8qgLsLXQ8MnSsxD/1SgW2Xu3Fl6897davGgFOAeQ+ca+Bd7Y7TxBiPoF38UcLO6HPegC5
	IqmVriQRSERVAGuMCT+fLNLjqoqVTiSIPC7NLNcr4DI+NpN7qtiMod95nzNsRS475gsFptcUuhU
	amApJA7zpgr4NOcecWKJR3DeLk++BM6oGeOuQfZ2DonixrY3sFqIona3WsPDnL0+JPulMRnC0wU
	9Gv9qHHx1HPFjiXq8tp+QKPvSwxA8Vkwn6+lrLPvHFnFPwOL3batogV3kL3/Ji637UlqF1Szd0S
	88UlfO93eiIH1jGRl9iGPO5ykytj1XU7HIAY36Hg/7rrQ43LmJ+wj+XfiFn57bzGGG9v/c0IR1r
	8ze6n8LN4z3FEP4r8SauzomlFT/QlKHBb+WzESV5xwZcTBzbOqzUyhk5teKrFoSr/MYqugtK2rB
	VYCw/8Oa/70BKfaTUk648KDT5LiqI8T+8zMBSV/1C7yO+FRwtX9w4TXoDXyOZstu9jNZIE6W8Ic
	IhQ==
X-Received: by 2002:a05:6a21:1798:b0:3c3:8bab:808 with SMTP id adf61e73a8af0-3c92a8f3f88mr4699098637.61.1785620736030;
        Sat, 01 Aug 2026 14:45:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 08/31] liblc3: upgrade 1.0.4 -> 1.1.3
Date: Sat,  1 Aug 2026 14:45:03 -0700
Message-ID: <20260801214526.788343-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128625

Upstream changes (git log v1.0.4..v1.1.3):
 * Major new feature: LC3plus and LC3plus High-Resolution mode, including
   2.5 ms and 5 ms frame durations, asymmetric stereo frame sizes,
   half-bitrate fallback, and updated C++/Python wrappers.
 * Build: switch to a shared-object library, hidden GNU visibility and
   LTO; add a Python library wrapper.
 * Fixes: crash with NaN/infinite PCM input under fast-math; wrong gain
   offset at high-bitrate/high-resolution 48 kHz; TNS quantization
   adjustments required for LC3plus HR; conformance reports added.

Version-only bump (git tag v1.1.3); recipe unchanged and packaging
verified with the new shared library layout.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../liblc3/{liblc3_1.0.4.bb => liblc3_1.1.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/liblc3/{liblc3_1.0.4.bb => liblc3_1.1.3.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
rename to meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
index 1baa84c330..40c4b0f93e 100644
--- a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
+++ b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/liblc3.git;protocol=https;branch=main"
 
-SRCREV = "1a5938ebaca4f13fe79ce074f5dee079783aa29f"
+SRCREV = "96a3af0beb5487aca3b98a4b992a539a1f6d80d1"
 
 inherit pkgconfig meson
 

