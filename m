Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FC6C561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:22 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24992.1785872475432022914
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oc0thf+0;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso81368a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872475; x=1786477275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+HKM+FI82DGUsyNVnubQXnRo7d2u8ldikOZ1KJ//vQ=;
        b=oc0thf+07c0V0HM/nOuitMpuUV1ZQas4xTSB1Ob2BfMPKy7lA4VSfkPSoPPJDSwx9+
         hlk2lFHw1oUlKk/ay4zT7/wwmw0/NGLqYAgJs0/2QbAGUXYD9JzuY4GfKYTMYNTNsPcg
         dSCkq4bfbl9cfhH1zaWdz3yzT7AaPG+XbrW4QMruiCuOsiVSRKKOvoNxOoUpde3JtTrp
         ZCPaLuupRCVBtw9cGOdfFpvS5YMraOKEyilMciAyNPQhX+eovjQ1Evd/YXFEdPKgfwRa
         91BZl7YG9M4USxihTiSbbmWzlYSD/hCAqNjkYdJ/ac4s1gFq84qtoKFktFZF93W0BfSe
         MZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872475; x=1786477275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+HKM+FI82DGUsyNVnubQXnRo7d2u8ldikOZ1KJ//vQ=;
        b=Q896GO9Md+mjz8SFjtgAlPCUWEVx7CryPCWCebGTA+oKAchEN3dEFO+TC1LWPW85sn
         Lc72Gn0weMr0P3Ud5WX84O6Lg9gtHYR/VI7J0p0hn1mRxKctPWnrXqSfbm6udUXeCcst
         5TN08XTySRW9nhMtbc1brMmbAFfBTbzDxHwmwIkC8qwjdcoySU5O2EJ7oyD2+5GARSoY
         57ypvbfVNhcLmq8c1MDgC7gKpPXPgB4arYeXBVm4tVOGJsidd1TGSGWQuT/gq6ArssSq
         wCwOaoDRxc6C9hyAsIVp2QzdFzJIU3H/drH6cCtvsA+atkZIxhVcD7NXnM3qVBH1la/6
         g/lg==
X-Gm-Message-State: AOJu0YyKB81XVI3gU8OdpmnUHQtZ/mt+VJOuXQ4xesIBCPyIYyRzi3dd
	9KTteTSj03RtaeLEb4hX5aAhl1hEuGvX1lKkKd49I6UoGlU/fJGybr4oYnbdnBd+
X-Gm-Gg: AR+sD11YG4O9sozlQgDWDSjLgKI2WMyLK/2sbui8KNZXhyr+tcuSLNL3uCnNYVSFES8
	x4sUd9D5gD44RD4WdYnK5Neo7/IRS2f+k3PRTaODjcLUieetL8U73hbgz23cpa7PfHEcandnVKe
	UtO9+rPJPEV5AQBm1qFVtdCTPBl6l6p2FRSdhfCOAHgRyXceF3swRSrCa6+244cRH/KJiCJOb+K
	YQS1Jy2FuTwGmtv+iw3ZzVvAAY915fMvdA6zmtD4M6oyiJ+XFIZd26/S3Slj4MVQV+FiX2Btpl1
	1p3OeeSWXf2D6vxRmq7VHNqjR3BxE5Jx7rSulfci4IyIFfnrpCHHsLuBBskh8+Oi/memAgRSYGD
	hObA4uZSH/AKXDh4jTgOWWBtLVDejGLe+R2i3PR2dAKE3ZmuxbeJG1PQJZub7JyjG2F5nzos2RS
	hx324d8N08FqVbV4dTCNT6gxkA1jZJW12XKtMDUDpdgJYd361qUri9DBHNXecL5c9J7Hqvn/EVU
	w==
X-Received: by 2002:a05:6a21:4685:b0:3c6:3c5b:fe5f with SMTP id adf61e73a8af0-3cb85df2a61mr1175212637.2.1785872474610;
        Tue, 04 Aug 2026 12:41:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 26/36] libde265: upgrade 1.0.18 -> 1.0.19
Date: Wed,  5 Aug 2026 07:39:53 +1200
Message-ID: <20260804194003.3158916-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128773

From: Khem Raj <khem.raj@oss.qualcomm.com>

Upstream changes (release notes):
 * 1.0.19: security and edge-case correctness fixes - heap-buffer-overflow
   read in decode_slice_unit_tiles() from unvalidated PPS tile geometry
   (CVE-2026-45382) and heap OOB read in decode_slice_unit_WPP() via an
   out-of-bounds CtbAddrRStoTS access (CVE-2026-45383); dec265 SDL fixes
   for 4:4:4 streams and mid-stream resolution changes. ABI compatible
   with 1.0.18.

Not upgraded to 1.1.x: 1.1.0 reworked the x86 SIMD path to dispatch at
runtime via __builtin_cpu_supports(), which reads the compiler-rt global
__cpu_model. Under this distro's clang/lld toolchain, linking the shared
library then fails with

  R_X86_64_PC32 cannot be used against symbol '__cpu_model'; recompile with -fPIC

because clang emits a direct PC-relative access to that exported,
preemptible symbol. Building the objects -fPIC, -Bsymbolic,
--exclude-libs, -fno-direct-access-external-data and a version script
localizing __cpu_model were all tried without success (lld validates the
relocation before applying the localization). 1.0.19 stays on the
compile-time SSE path and builds cleanly, so it is the latest buildable
release here.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 99ca84156ddd5d09aea923013a4830a6430f8ec0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/{libde265_1.0.18.bb => libde265_1.0.19.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.18.bb => libde265_1.0.19.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index 00fc16c0ce..c5fbedb22a 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "36ad04841c209cb8b3577ec2723d431b6bf7efa0"
+SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 
 
 inherit cmake pkgconfig
@@ -22,4 +22,3 @@ PACKAGECONFIG[libsdl] = "-DENABLE_SDL=ON,-DENABLE_SDL=OFF,virtual/libsdl2"
 FILES:${PN} += "${libdir}/libde265.so"
 FILES:${PN}-dev = "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
 INSANE_SKIP:${PN} = "dev-so"
-

