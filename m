Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D67E7AD5E
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:51:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137507.1766667104161578497
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHn2Nilq;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbc544b09so5072177f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766667102; x=1767271902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xpYk0ufJzEnHOO2ZV8SE00ScRWeoJMwUCaX/uKdDX8=;
        b=AHn2NilqcsX7FMuND36bVwX/A9Ty6wVGu57dK9Q5GY5iJIrGwTzUNFNxcijL8oFymS
         EGA+lb1WhhhDdUhgYGSHVjLJcsrIjiaz5D8LpUTh+q0+X/cPi21M4fV2Q7nD9veTv8oy
         CWueLruZWNMa92y5p5pFMB/CCqWXZYfhOR3pz+z1TnpHTN4FRVq8fMpstoDnmf8GSaWc
         sFZMkq8ec3+KeBu+DAJ8vT3nZqlqFcRot/4sY+zNCTUNsBsoiKfn1VQ0J85pOBoY+4X+
         5VffZYqyNnDqOff0+WmIj8glAViktFDyud6AA/FDG3eQSz1CERs+biuqh7Tgyd2CuHzO
         BhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766667102; x=1767271902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3xpYk0ufJzEnHOO2ZV8SE00ScRWeoJMwUCaX/uKdDX8=;
        b=wnKyTK8JYSc+6UCJpdFmT1BjCAegCNLFe13pQ2wHKFftluQc8G7Dy+fjZsx+tEHw6t
         TlyP7e8YLJeZhAwZvuW3JcZBHxgNE6x2VUkTJ9wY1wfVgH5Rwgav9DyL7SHNGmfoZwcy
         /JKw7f/o4Fz1pRHZAWbMbh8apoUjcTALe9PegyI3DjAlnEP2w9HKzl7b75MojTVEkzdj
         vmElYGk1ZgKdwexIN9KUDXILIvFu3sez4zn74vySbUPDFh6+BZXXVBoVOjH34KO2x8Xy
         3V7nJ3lt7G2v6mlzL9c3pkXhe75ttilLdmuU+pNO6DkdalGXF7QLK+rkL4MSqKFvDZ6a
         IazQ==
X-Gm-Message-State: AOJu0Yxuxy8IGERG5Q/ot5Kt/fADTJWgGAk7h3qPE1uD8NzMU1t4MIRL
	gnr9FqsC09HOz7MDRZITeNrZapquncg6IrmTCTGP4GIBDrvZDVG9ad7v7uABdA==
X-Gm-Gg: AY/fxX4CzJBa5F5bTLrtrAJ1P2BT9JxjXOP9I9c/gAXxs48NVmdswVvCvwv30dzDSL9
	bgf6zTQhmuKm1eqj7uC/eh91A4K1wBA+Nje3jGQ1Gt0Jbu3izxHeHNUOE3/YTx25OSORpRAUZod
	heeh2tjJXF2bVWAGG8ia5zc2WRNSumZ6SKFCOnwp8FSCEm4c1Harp5QkocC/pXECn0FbEeUyVqg
	YA8EpBUYZSn5Y2edHUN2aL7WxT0tdqXa38HUvI24FDWECyhrfTPJ8NxXwbu/tvi9W0OYAiRE/Gz
	VCfgJ/IEyArZwsDgY9HcBguCXiHqk0ysjbWPfx5qPhvysLPKw/9H55l8/9T+xBB/3OH/kRHc0WM
	oPXf3Tgz/80H69iqJvwT7MyqpUA+HKWCyJdU+jWOCefTSGfXtDSFm0oH/fVPAo83e9Q0FpU3S2i
	e0kVw/LEIT
X-Google-Smtp-Source: AGHT+IEpyUBKge0cl7NYYZOoHR7qDg7HtrNQmZ5B7rmQrLpQqXBX6/Qwq62ZGB3WyWw+iLlM3GPSCw==
X-Received: by 2002:a05:6000:144e:b0:3eb:c276:a347 with SMTP id ffacd0b85a97d-4324e45b407mr20314420f8f.0.1766667102465;
        Thu, 25 Dec 2025 04:51:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm40219073f8f.20.2025.12.25.04.51.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:51:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/8] redis: ignore CVE-2025-46686
Date: Thu, 25 Dec 2025 13:51:35 +0100
Message-ID: <20251225125139.2436941-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225125139.2436941-1-skandigraun@gmail.com>
References: <20251225125139.2436941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122916

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-46686

Upstream disputes that it is a security violation, and says that
implementing a mitigation for this would negatively affect the rest
of the application, so they elected to ignore it.

See Github advisory about the same vulnerability:
https://github.com/redis/redis/security/advisories/GHSA-2r7g-8hpc-rpq9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.21.bb | 2 ++
 meta-oe/recipes-extended/redis/redis_7.0.15.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
index e81984c081..3c24d459d6 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -25,6 +25,8 @@ inherit autotools-brokensep update-rc.d systemd useradd
 CVE_CHECK_IGNORE += "CVE-2022-0543"
 # not-applicable-config: only affects Windows
 CVE_CHECK_IGNORE += "CVE-2022-3734"
+# disputed: not strictly a bug, mitigating it would affect functionality
+CVE_CHECK_IGNORE += "CVE-2025-46686"
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
 FINAL_LIBS:riscv32:toolchain-clang = "-latomic"
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.15.bb b/meta-oe/recipes-extended/redis/redis_7.0.15.bb
index 61a088775b..3768453db2 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.15.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.15.bb
@@ -38,6 +38,8 @@ inherit autotools-brokensep update-rc.d systemd useradd
 CVE_CHECK_IGNORE += "CVE-2022-0543"
 # not-applicable-config: only affects Windows
 CVE_CHECK_IGNORE += "CVE-2022-3734"
+# disputed: not strictly a bug, mitigating it would affect functionality
+CVE_CHECK_IGNORE += "CVE-2025-46686"
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
 FINAL_LIBS:riscv32:toolchain-clang = "-latomic"

