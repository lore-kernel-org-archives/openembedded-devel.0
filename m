Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE9ACA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:57:17 +0000 (UTC)
Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64916.1790618228951339907
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I4u2OxfD;
 spf=pass (domain: gmail.com, ip: 74.125.227.167, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a47d6146d1so533458a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618228; x=1791223028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDBBOnfQrgQlRkfrvSfVfWB7jMYW4GYqbKzCIrWzfpg=;
        b=I4u2OxfDiI1zMHy71dAGQ/JY2g60e6WVRpyMdD0W1n+QZ4Pzl0PbZoLapuPqEeswDz
         zsZPFaNqN0L97bPi8mQV3N5/OaLtx33/hDITn0CgkOnbiOwyOsRqTjQfDnXYFHOtEADg
         2n9fcvaQAAkLYxht7fh/NjsXfDw0EU8fJczYOA/4Pv58+o3qCZ8cPJgdLI64+eg07Hwk
         5DLqWt9j0VwqVDjKLkoP9u3CAZqtPR4UO8YFLFdLDgnJGR9e8YZxt9FZ3OpBgEdVDi1y
         9hkSx99ZDA3RnF60PcA7GItarD+Z3eS8f9sbyrPdTESRoKUK3lHhF1paWOoDbb0b8L+z
         zpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618228; x=1791223028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDBBOnfQrgQlRkfrvSfVfWB7jMYW4GYqbKzCIrWzfpg=;
        b=xtjDcOKvQtocLFCzrjtwp5l80AtyMuXbwzupCavp/J+JavlX0+B4sUg1MUH2KnpIGg
         QOzybZPqRNQ0QWhkXby7ZLnz2giWVMAkzCrYGrv97wVbvTfQmttivz66+0DxYqY2INiq
         DYLA014HgaxgoKVT4HXOkyCPMxjw1KBOFhwsQ+spTTYy1Z66rhsroQQrg5a3HIPaG8OL
         vMaa+XofAp4JywdeiDsaK3BOxZsDaamOiwM1avx4LSWT0REWLyx4h2a5ko3TLstLsdx9
         3WquewJ3BtgAUFZNZSK/gXQHku+5yoF55tJ+x5vy+AuJIhfWaviXWE+dAc8P28PBULni
         l2xg==
X-Gm-Message-State: AFq9FYJ04dgV+e3lEZHGiTWxYk1X2gj0kdgZ5ZNnOVmVaVoRDQtVcKfu
	EjHhkTdTxzfwnDPtWmRPfZriLYNeAr6eUoW3Iz7IEX/cmmJ4Iuh3QMySGRj8Jw==
X-Gm-Gg: AYBFou1hadQAeH3BQeXRLvRHv9aMdVInemqe0kgGbCRbQj5vk86zJ3b7cE500bdV/Iv
	2C0NY8fgAenSUncIR9tQMgvgLYHJEigD8NscqJG4i2/fsqUVxOhDIDbZAZgiw3+dYzpPYOe/hDy
	OP2lcIebWT2AnY2heCRHEx86BGn5ooWb2rpk8M4YYmB3JvtG3GS8OXbm0V39HRsdUHCFa84gxMp
	W3X11OmfzgCtXvLppgA1ew+4cK8rH90b1SYq1q4CmM54V2o4FgfV+vFguXklpxrTvzw4nBfXJPm
	s0x5lC0nYmGceUNFd1CdW5N2fD4fccGa/4N5rDbql3bu0QoiAHS1dPpS3u/UJBdl81dPV98CG2H
	SppuE7HiYo7Zo0UcQXMqvDsRSednRgGBsrA6k95Ky+ySeM5srgLJSkFfhI/TaHv8GpGz81ZDWl1
	GP44ststW/B55oj/rl6wlowIevXl9urMpW8zdwOac8w7aEllhejXn5Zl4AyFsMca7Jcwyc4nJ6p
	poPrdZ5hzI85AybMBPye97PFSMdLcTpqA==
X-Received: by 2002:a17:90b:1c83:b0:3a0:cde8:1dd6 with SMTP id 98e67ed59e1d1-3a0cde82a7amr4617958a91.6.1790618228257;
        Mon, 28 Sep 2026 10:57:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm577182a91.13.2026.09.28.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:57:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/8] liboauth2: upgrade 2.3.0 -> 2.4.0
Date: Tue, 29 Sep 2026 06:56:51 +1300
Message-ID: <20260928175656.3501512-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
References: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130463

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/OpenIDC/liboauth2/releases/tag/v2.4.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../liboauth2/{liboauth2_2.3.0.bb => liboauth2_2.4.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/liboauth2/{liboauth2_2.3.0.bb => liboauth2_2.4.0.bb} (93%)

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.3.0.bb b/meta-oe/recipes-support/liboauth2/liboauth2_2.4.0.bb
similarity index 93%
rename from meta-oe/recipes-support/liboauth2/liboauth2_2.3.0.bb
rename to meta-oe/recipes-support/liboauth2/liboauth2_2.4.0.bb
index 0f82165ab4..b189be45e4 100644
--- a/meta-oe/recipes-support/liboauth2/liboauth2_2.3.0.bb
+++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRC_URI = " \
     git://github.com/OpenIDC/liboauth2;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "5aeae56ab2c0ae1ff1c70bc13e0628b134ece70c"
+SRCREV = "85da4346435aec77f2ff11b529f2c1e8e5033c44"
 
 DEPENDS = "libpcre2 jansson curl openssl cjose"
 

