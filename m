Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D8ACCF2C9
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:30 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9806.1792302980557599003
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F6zlY08M;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso2052048eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302980; x=1792907780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlrbT/5KuqKB4jBToRvrbxW5DH7fgHXGnau9CUndq00=;
        b=F6zlY08MSqQA6eE9ueF/SxY7F4edY6RzB3XfDpLoXWYXJ6xb82JPoNuZv9HkOS03YC
         gGa2De6m6E+nWh1cMpEEwG/gN3c8YiWHMLQwKJWjbj6kXcxhMGYfYqlNLnhlX/EhL9TM
         GwOHWVWm8R5WrkhBHslzDFENWgGGY970U5py1n74BVkdzA2uYNGTCVdRDZSoCIDbQfsn
         VEf4c/ccSwLwWtqKqM1hzeh+p7rdF/OHLCPZI3nhJJvpKElyHX61Pm+abKFb9wbMmQL2
         CIs+ordjyOaLpaDqLOoZ0RwkeAxEMWh3IjBdsHxDBRzv6hEwVFRHGsbiJia5+mOZ+nb0
         Qfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302980; x=1792907780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlrbT/5KuqKB4jBToRvrbxW5DH7fgHXGnau9CUndq00=;
        b=XxKiEpBlEE5uJkVZDBfqYZJyZjFiVNA/7kzK8K2iE8XSG+iM5LAwOz0N2KrOXeG69G
         awhhuDS7+W0GB4Hu05POyjxLkuTf8ngX0yerAMafFcrJnyRrX7eGkkuZxdYZ5SWC4zsQ
         ucBc7J+NLPuWkgPx8Z39gntOaVxCQAmEoqKGjbB99VWS0yaP2EiGMFUX5NzcJ54XmN4I
         UZYa/dV98RTPZPvlG9C00NYEbcJtWpdzykzGiq3kA1giYbfbbevnNvhGPQulMTmRoydU
         msR2rCmY24dYxvDqGrYBHJqiAHpBi2DK0f838VF+m9L4Vv7MedI94uJ0WQWU5avDuzJl
         H1PA==
X-Gm-Message-State: AFq9FYLCfL8nUSomJIbrC4bKG9cdmXG0njkOGeJ4XiGxLlimK3oGYuro
	WwqDKnBOfAwa0IFwGlAKM1vo5NwPbIiDxUO9/zyYHk9103379aVzjmmU1FZxkE6GBL0=
X-Gm-Gg: AYBFou2BZNvCDJNZZn0r9GdDShBKGDmQiIasa/w2yBFJK4pvik53I46Xrr76yhzePRR
	ucA9oXm8ubmIpzLSuqz5NobyxsO3MOYIWXyD8jpnOly9W1SWvCytuIJR81bXy3RlYfpkLU+nsgI
	oSPP4yhLAEPNFw3l6+1EB6yePUGIAZ5UdtSJneEQR08zowdS2LMfWprdI5Rolys8ZUJKpFyTSW0
	Evmm6nf+Y5sPt8afghq1ps88FiwzkPqIjakV4V5weakq7o1HBYlxdVFX2GoYCmuJWfNtJB17YRq
	ruRP7VDcTcgZg7R05+RtO609yR0YIwN6X1clwznapPxJyIdHQzJdfPMAWZOeQzmo1Xoz8fCeLOs
	cxKvmdtB74IFgkNlmkE1yGpox4oPMePW1kwJcZ7Z6GoddbDZ+NlgTQKJ4+Lpj55cdzeHQBZQ7Xo
	LVAUSMzf5m1wiR3b6DrOaKgwhly8/szj1NpDCgB0DEEZnaEP0M22tw6ofx/FcayKS2LpZBWvN4y
	LYiuZFx5Z2GBaovxWCewAhyrzV9EFWRrn8cZ5yysoHHzmS2ITjPDlzZb953LB1+4e9VPxOQGbfT
	dA/0UYxdLKdk0+3PhJmh9L2JYrUvZWhxBQefEnFx0La8/cT2GULJTMNJNayxT5BCLczROgahR3j
	m9VpxKCyY8FH6mba6Y6L+hIOg3W2AJ7GDT3GBsTWq9J9TONIp6s1O3sZXQjNjkW1iwMjv+fu281
	k1NveyFInLctyqNme3/RHmxyvpbMsHEs8DdbNd3zfKu4eFiQ==
X-Received: by 2002:a05:693c:87c2:10b0:351:202c:c7a5 with SMTP id 5a478bee46e88-3619b7f866fmr6613405eec.0.1792302979717;
        Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 08/11] glycin: Mark incompatible with riscv32
Date: Sat, 17 Oct 2026 22:55:35 -0700
Message-ID: <20261018055605.179605-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131090

glycin unconditionally requires libseccomp, and oe-core opts riscv32 out
of the seccomp distro feature since libseccomp is not ported to rv32.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb b/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
index 279124200f..50824468f3 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
+++ b/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
@@ -106,3 +106,4 @@ RDEPENDS:${PN}[vardeps] += "PACKAGECONFIG"
 RRECOMMENDS:${PN}-loaders += "${@bb.utils.contains('PACKAGECONFIG', 'thumbnailer', '${PN}-thumbnailer', '', d)}"
 RDEPENDS:${PN}-thumbnailer += "${PN}"
 
+COMPATIBLE_HOST:riscv32 = "null"

