Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3750.1792837532427750729
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 03:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ArSUonZR;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso620610a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837532; x=1793442332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HoE+XWoP92PNkb31Rtxuxtpw08zAizvBzFVPuXf3NI=;
        b=ArSUonZRKxF7tx2ZsoX5RwUspadySyT9WPpclxO2CVFXjBhvUaTVAH8VdCTXXSxov8
         2F71Bqez6NmfWzBf5qFoXI13H/O/4EQ3E9uy9Gs2cE/FqdU5SDXeC7pRWe5GOzJ7dXO8
         +Os2hwp/5OlH1ZvVvqwkWNMwrWlI0O4kfMBmYhyivpVu44gz+jB2kPoUYyqc0V5K+bP8
         DjdqJCVYJOI3T0x/AAw8cMs4jJmpuC/V5GLB3Zo4CXecSGQirBfwJcH4MliybZTsB82d
         OZivH9zHJ/YZ4zlhAewKU7biKsVbFjZKYy916ODDDV3J3kaQK2EFs1d90PpER5SwE2gz
         1Bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837532; x=1793442332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HoE+XWoP92PNkb31Rtxuxtpw08zAizvBzFVPuXf3NI=;
        b=POc1FtJsc1afnagvfg7pCijqZnJagVdx6mgnEj6lSlwMJT1BFYJTTPJtEAInirb58W
         GWqhr0VkF9jbZaSIRXcO02+Z2nTZm0cyehC56iLcEJ2n1/3A6MtZa9FSoDPTWVt8SxAW
         CyyMXeAPrUaWu5jif87FSxfsQNufUs5hSz9GK/GVSTz2ePV4KdK5j4hY46kxNMbkCh0b
         XflzeJM4RfxiYOqKJ7NoDw441X/kV0cqBzkW8JHt0PBB6gTiqyur6OaALga34aQeAkYm
         EGFh8ioilIL8ofOmWGg+RWeNy6+BhGCfXQuDR7h4YIyne5K16wFyIWNpt4yAY2cErL8d
         dcDA==
X-Gm-Message-State: AFq9FYKp9FslKrJLm8MOUrI2O+IjgpXWPftzzZ41ZH4ylk4ds7fLcKsn
	xIQgUSRWFKNrxluLl+USrN+dK50fJFUAgQztiqDlrNWvsynCMkvtw7KOnVzVmil7
X-Gm-Gg: AYBFou25SCr7ENoqgHT/JIUgsKSltNZSCeuTyVeznmwwjXqSPnHdlc7p7zEFU32sUhm
	kdOVjvL9cl/O8m+Kvuy+8bhKtouJjEgkT5IFn+zFjEAuPGITdQr6wpESbGCmeBkUCLs4cPvk1mM
	sRq7PSpzfsrg9TKZXNjiuTGgTzgKAr9ppKVvczBGYX4HG/C+hjnWKwWBe5MEyPdvDpaGthhr/zA
	l7HiACC7rshw1MOnYRDyiOZ3n24lqUbJYX8t1GFKISaeV1e5lYweMliz7w6nR/H0ZefNR589wqJ
	q8mEvq9FYEvFPEyGpwfF+hRkhWJQaGLkJX6H4983JH8xm0BStURFEBDL9oPhRc+n7rT2Jdl3cDa
	t0MMKIEYwbWL2u8V1xrvqHChuUrPDYJgvvXMVRFEDlMnJOBhgiiCLqTdvdKyKN8TFo2sWpqJUB/
	eTwS6mj2z+ho+y7ogfdz88ctEVwlS6GhQAGtvsu6g9+mmrY7pN26Tfdz863E83SNDwwULSIqai6
	xaN72QPUPCTGHxAYJRz8qOjjsWDd5R/dFIEgNU4fx2rjWsCTpqf+5Vs2LGs6lP3GxjSOoSkmGGR
	c5yso+J3nmJGH3ri7h5WfvCquf47yyM=
X-Received: by 2002:a17:903:240b:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2ea9c69aa11mr13757265ad.18.1792837531787;
        Sat, 24 Oct 2026 03:25:31 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm4293935ad.64.2026.10.24.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:25:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/7] 7zip: upgrade 26.04 -> 26.05
Date: Sat, 24 Oct 2026 23:25:07 +1300
Message-ID: <20261024102507.2256303-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
References: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 10:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131399
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.05

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.04.bb => 7zip_26.05.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.04.bb => 7zip_26.05.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.04.bb b/meta-oe/recipes-extended/7zip/7zip_26.05.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.04.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.05.bb
index 49437b807d..050673f678 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.04.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.05.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "9128b80e3a471108678e2b3ec3c985861c8d7b0f"
+SRCREV = "b88c6bc09339de32f7d18bbab900686b244f42ba"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
