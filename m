Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BFCCA601D
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:26 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4468.1791540379291445774
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JiPxeCq3;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso832427a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540379; x=1792145179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=We6Wv0DIaKtR1+LadGTrin6DSb0r7Cq6epCyzqMOI7s=;
        b=JiPxeCq3xUtSDEIQNB3qVZD04s6sK4++vn1utFQeQVGIiqZ8Z6nif0JuoyUsN8ta+u
         vGA8hOXXwXP2KSatY9uHEuTAMtxAKeBpqYhP8RGwue0fXp6bvUOwCP1p/2jqal+PYNC0
         fI0biNSTrpdgPVUdqpTUOc3o5PCXJSuA2CnA9mjxwIEaczZI60rCTfOVO/wGEDtvEv1R
         mtg0Q+pW/4uG6N56BNPw7MUQhs2wxs8PxHWU+DszLar+KApJPCxVa0+gb0e7ZeJoe92n
         LNVRCctfYgs+O73Z6x/Uyb5pxoUT0YgIm/v+bsb+2/u4zr+MMtLi8A7pqP0qZ/f6SOrK
         6UXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540379; x=1792145179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=We6Wv0DIaKtR1+LadGTrin6DSb0r7Cq6epCyzqMOI7s=;
        b=k3fBKayg6VyVR5dVLiQpD/zxSJzQJw+LNr59HFhAAsgGrPFTS0kQB2UeJ0d1/1syHJ
         0a4maf26VcbU0uZomNemd+Dl/EDi9U3qq4SIR4pSJhhcV7+ilLm6de3PErB7peP3DMXN
         8hldpsyPIZCK+EbOJGQUpas14A3/+gEGz80pH6g/xCvG+A3SynXQtLVqVFqXMUWwZBWb
         xCA9KHiBNhW1piN2HyCwI4cqDIbUTDdjokn6j37L4NQBfy9a0aeC/F/O40zNWQJu5agf
         7VyftrEPkkq3NbIkWWqagvNWtgZCLQtQ44nJLICpa7p04eb/jwb9aZEq709e27V+u/zj
         asSw==
X-Gm-Message-State: AFq9FYJpwUd/F7O3pk9+9LynFRnLJ/fHJ41N8M705HelSrEE5giJWX8o
	dD8iffFuX9SV8VzNyjyrojqLOvK1DPHyLyQvKJptcuZDWAcr1niFOBrHyszkeA==
X-Gm-Gg: AYBFou0XzcQqbm1ZS0nXb+BMUtGKVB9QkXM7nqsKVHfxslw0A/bsqX0yhNW69xIvHHx
	ySC+7IwoBruQHQbuDfDh9HRSnP8o3yUUFWbBC/USuTaummLn/Ob1fo+73y2fxiyCZsj1HJ26auE
	XlSH8lDk7/eYqi2O7mZVgK3Oolyc0Opm2oadK0ptyoAd3DZHvO5ngVBLpIh88GmFgY+EGPgr8Nj
	6KHI/vEO+qDsCrOdM4SR+q6h63oN0d6M9s+MpsnDZCrOGKvru2kgVtwo/EsJ/YGU1BAV5Vlada8
	hTnGLLBE9gHIiHNYXozEkQrX+dDrH+QAteIKNEtFNtpdJVzymT/oIwqCinjqp8B1boea1LxFGUO
	jvahCrg2iLzrSkY3qlLp7lzUKNSHaI2ziuaux93RKgtFl0713IUWw6y2Ye2Q9Mf/yqYoRbwJfxA
	90CUMxW4UlI6VuvuJMoJv9AzDPYLrfVhUh82b6pPt+kDAydkKh5peVk6s9QNEpjUN9Kn4G8CCpc
	PG7ucTTScBwYsk/KuB+8XFD8v0AhO3e5TvGTmI=
X-Received: by 2002:a17:90b:4fcb:b0:3a4:bbec:b4b4 with SMTP id 98e67ed59e1d1-3ab3a94c1efmr1280030a91.26.1791540378591;
        Fri, 09 Oct 2026 03:06:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2723866a91.13.2026.10.09.03.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:06:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][wrynose][PATCH 6/8] python3-sdbus: upgrade 0.14.2 -> 0.14.3
Date: Fri,  9 Oct 2026 23:05:41 +1300
Message-ID: <20261009100544.1428938-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
References: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130690

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-sdbus/python-sdbus/releases/tag/0.14.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a9ded298151160cf8249932090f5378ab734344d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-sdbus_0.14.2.bb => python3-sdbus_0.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sdbus_0.14.2.bb => python3-sdbus_0.14.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb b/meta-python/recipes-devtools/python/python3-sdbus_0.14.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb
rename to meta-python/recipes-devtools/python/python3-sdbus_0.14.3.bb
index 532349dcbe..e15bf1028e 100644
--- a/meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sdbus_0.14.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-sdbus.readthedocs.io/en/latest/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "4f5d13b196e1e1de35311ebb2563a32de791451a30f5b9a4894528ba98766412"
+SRC_URI[sha256sum] = "4ec4fa4108629bae5ab2775e5575b0251fdb555d4a3613c9ddb37fc73f882983"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS += "systemd"

