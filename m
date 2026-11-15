Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3797.1794728969669867680
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=druEEL+Y;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372bdb942dbso2301248eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728969; x=1795333769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H02IZOHALJsi2YNUnojgmesiu8Ay39jPcze92gB9yCM=;
        b=druEEL+YCDuStub3i7LegYTsPgx4ey7yvgFUV4jWzhOH2SpWyTw2DT/fgmSKnzxybl
         CviyoXXGa3e2Pg+zP/Vz16DYkGwMSfVLlL+3o8CEyFWSPBZSIlLhUD8Hopk7TPgRzjGW
         tnq+UevbJKSec/gqCl9X3XRcQqzDhrCqhf+NJAbcA9vWfuwD/WlQ35xVZSOcFbgHKDsC
         /JrVG2Ljd01+IKyyl5+jzb+jx9S+BQWaBfIx7niuBwssSQzC6fH9Nm91Sb4a52aaz3uV
         2j4Q5yuT7ZNnaABtIhQm18e3xUrOPeyOc54+kr2HoCi6+rblJ1+WbWrxF85y7x13TY39
         L+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728969; x=1795333769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H02IZOHALJsi2YNUnojgmesiu8Ay39jPcze92gB9yCM=;
        b=00DPI0UxjFfQWDlRQmzSFVahuo1p9u/fva+bm2lBatAeqF12oHegQs18Yy5ZhFvUw5
         BYP2SbSe4ax+KZE07DaGZ/dT459M9RXH9npra2+obOTuCieRMdlv88honUSnxjbelV1A
         +tUASHKFQiw5S8MsAeAljnvJX5brQOny7II4yZ4CnrsvFCY0jkdq0f1mD6Hofhr48lVP
         fVwj4GLm2iCmJwq1TZdAYL6dlT6xk3u5FgyIHo7I6emu8CUGofz1DvlI914/iG8I/uDu
         XAXk+UbSOApQwBxiLaLRKyEsJ1GF9+4bGoQNV2ygE2dR1M9vebZIWl3Xm+IP1Lfqd8Sp
         xxdw==
X-Gm-Message-State: APuU4Z/kKc2OaoBwbPK6Wf7x37e2WwwSAJocKnN80WORqoDzImED76tO
	FpVFogeLqm5j23tAR1BE5tnBeSKo1k3rdH8OkjYA6EKQOhehtCSPi2nWrGZUVlXx
X-Gm-Gg: AYBFou2yfBQkLqK2o46dIv1dIBr7ArcQsj5sOcQgfAPLfl2QoLoAarKkm62kCmKBKPX
	q8sjWm+6hXC5Z0j+c6iuJM1IMehUfT+pjA8qVdjzNB12mBoPG6rU2h2dP3LPG1UVZLc1aZKHJOe
	lON4DRALPGOTlSfmFhEDpzFfXv9AKOkJUzwalSnjWeoJfETSdvRQSdJGSKcrg8U9ai+gODpzxDZ
	TgkPUkrsLJhxj3H+devU8w/3GpWDB+6xzGQ5lZjR9eH5yzq60i2hkcCdABLuy9Ylw/fPi9hv6FE
	cqRYRYbyMp1DYYoJkKc9RTipgu/Yo3JEa5012qPFwk1IG9HoM8zbe3QtCb5DnFx235FCr8XxLnK
	Zmk4EXCDbcu/bk2gbCAe8c9+lPbHQmEXk8leJFmcCi4cg17NzXZPf3O/YtXoPXRjbW0kwTcCu8d
	/si4Z+Oamvlog+bsqifP/CjJialo2P6P37NXLbzNTDo4p2KFDCT+0U45dNKvRVFoACNgJ/+amrh
	ff+qHyFi5p95vvRHBq+BJkdML0yzOH0oR37OGCH/NUtbEpwLJmiq48KvS0SGQPcdrhU9DYmuXbd
	lvSRUG2kz8jlq2CC27XdCEGdvgTx7fIOGaacYJFP2UTSTErPj8iT0/Zesk9V2a0wHoLOe6tV3Cl
	3fQ/sEsJ2R9SxDy1BhbjfvmyftFvIL9U7Pwm7dRkejDW5aFZjcuawcpvrVAZvtwfmGvIZXWevTU
	YZWePE/TZ03ymcBH5vVw7gcKmcXR29J1icHLqSoLIyl9kSuKFR3Tf6Eo/R+WD9b4bwwZWqzMm2d
	2CvsyR60M7vLiD/Ws/xWwnyPI1jBa5OuDkzbEuSNeKcc/BY2YWMttqj6jj5UmIes9W2/WlGdLBZ
	dJkj
X-Received: by 2002:a05:693c:808f:b0:351:29c8:643 with SMTP id 5a478bee46e88-379675fc97fmr7329064eec.18.1794728968973;
        Sat, 14 Nov 2026 23:49:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/96] googlebenchmark: upgrade 1.9.5 -> 1.10.0
Date: Sat, 14 Nov 2026 23:47:43 -0800
Message-ID: <20261115074918.2932593-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132275
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{googlebenchmark_1.9.5.bb => googlebenchmark_1.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.9.5.bb => googlebenchmark_1.10.0.bb} (91%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.5.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.10.0.bb
similarity index 91%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.5.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.10.0.bb
index b72b57f4df..479443fe76 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.5.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.10.0.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "192ef10025eb2c4cdd392bc502f0c852196baa48"
+SRCREV = "a6b4a9f00b36c19af9997d68a1cf6e0b5b3d032c"
 
 EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=yes \
