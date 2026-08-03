Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4ABC5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 23:55:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6091.1785801326193028542
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 16:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=keHHcyTc;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so357340a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 16:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785801325; x=1786406125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jz0WDkVDVRuqRlqpwIMm0Xl4DBr6nBaGSd6ZMN2vPwI=;
        b=keHHcyTcw+l+vFSQbnSpxuINH4mQuAkm8fH9pxJa3x+M3VTE2WJeFWgI5XXTVMCbiv
         g2n3ANaC22qTLLRx8w+rP6FzO/6osk/HpuvH+CIJi2dLnTHLqUb3FAK/ksRoi0WIA/RO
         CrEpiKcWbx95stU7LHNc7Beofp478w61fDmeauCAJCao5Fi0pgtrjGNryzCekPpKWj+z
         jHBf8sUypDjUkPeFjvV32R2lFDSAoIv+UOK8DivIU74oOIQW2HHO2yjsvmjM2lgizsP5
         aBjzw8W4pQEoQri4GIMkl4dTbNGFTiobVwqg3Hx9z2OY80Haa40o11TAGyJlhKfqQC1R
         xmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785801325; x=1786406125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jz0WDkVDVRuqRlqpwIMm0Xl4DBr6nBaGSd6ZMN2vPwI=;
        b=HA+nU9I5AAEfYg0QeCevyHzxBxQvyS5Mw7P40Pa+z0ckeVtxxGv/5pTmQ+We+KH6M8
         YR5BiBydlONQt6+3b3zeIYrf0TkmsT8Uw60zap+/s287lK7proM2DIRqu/zZj+XpWomL
         zTDISyQ/7AnlhU/91Pm3/VKfN6Puvq2ORSwMJ79w0IFnKOz0BB15NbTdxqjfw2bdriBI
         ydslQ7oggKdoGJJNfbv+931iWjFCaAsv2q2ITnlvy7INz43tTsEUofyRG4iL8FVV2+V8
         muEtbpFWnCK5NImJcxHlS9ybDwF+YjCslkgoB4EYgx1HzXEkTUS6KHmhjXCwD6NfvHvQ
         CkGg==
X-Gm-Message-State: AOJu0YzzKWqDksUzDXN2ZTXaKX1XTcDtEedH3y3Op25+mxgLO6l8nyDN
	PTBK2bh9aqYery9C4tYtOHv58SIZ0egMS4iwAlGjOO9IveKlO8uWOjVVihmZG4r4
X-Gm-Gg: AR+sD13wHt0f2/Ky9RSaSi3pd9ncuoP+A/fhHGjh3w8LRLK8w5aqRAhfhmtaURjiivk
	v4dtlvEElDsMSE7gRIkppkH/a3yp+9/c8cfVuVdq455rgwyqEMIES4AHs12qJmitePLKC6kVQv/
	KfDj7RsoaJaAPY5va7BoQIM8ORv3IYhsWrKWrMDTmokErUtKadncFltaYCtj/2ZFAVd5TG04I1X
	oD+Hv+LAfhm2HrX7Mb85dGAvZzu5YRuXPfImZY/Q0BVTL++vkXxSEXTVSqBBdHxnoYb16pdLJ5X
	WLbIHxPvEOZCFMGLWRsmI2j8MlFPghAGc8qyljHNWkQ7nKXh1qRU213UCsSVgkbkIlcL4Ys18xj
	a3R+6cnOHs5UVkcB/OrTtIAMTxt7M0YROy7WQnjmglSy8xP8kajCCPmnOqEuEKiQbF02VSqoqmy
	a0hB7WsW9eVm4bnxiF3Q2bmAN313J3rE3SzcCv97SYlXGcORFX+C8lMoSxt7kfzMVIdhZfpIsU5
	pjmop7QO2G3y93ZYUbQXtBPqxzrII/Vps7SA5bjCO+MS+xwuXE0PEVsTG3NWTBRgfBZrGuzz63F
	/LfP6LWh1+dezkGa1uyw6U9IQpLdnVpcDuHsLNVbk4AlaqTdcd2J3XlIfUVvuEPhOgTjoQXfaGH
	P1DPDJ+YI391g
X-Received: by 2002:a17:90b:4d05:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-38fecc2f007mr1296238a91.11.1785801325441;
        Mon, 03 Aug 2026 16:55:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm69105780eec.28.2026.08.03.16.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:55:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] crash-cross-canadian: Use oe.utils.all_multilib_tune_values in the docs
Date: Mon,  3 Aug 2026 16:55:20 -0700
Message-ID: <20260803235521.1358903-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803235521.1358903-1-khem.raj@oss.qualcomm.com>
References: <20260803235521.1358903-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 23:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128699

oe-core 6b2defb521 ("utils: Move functions from utils.bbclass to utils.py")
moved all_multilib_tune_values out of utils.bbclass, so the unqualified name
is no longer available to recipes. Update the packagegroup snippet in the
comment block so that copying it still works.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
index 924e3ccfc0..bb9bc321b4 100644
--- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
@@ -60,7 +60,7 @@ do_compile() {
 # To ship crash into your sdk, you should create/update a packagegroup-cross-canadian.bbappend and
 # add the following
 # CRASH = "crash-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-# RDEPENDS:${PN} += "${@all_multilib_tune_values(d, 'CRASH')}"
+# RDEPENDS:${PN} += "${@oe.utils.all_multilib_tune_values(d, 'CRASH')}"
 #
 # You should also add some kernel packages in your sdk, add the followng in your conf/local.conf:
 #

