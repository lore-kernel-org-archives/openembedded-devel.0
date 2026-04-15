Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CA4F419A0
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:28:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17688.1776256117800437705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nI2/e3VH;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2363655f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1776256116; x=1776860916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQIEb7UiZv2xZtfYx2IpQBGykmbDAMFOmIULcxpzqQw=;
        b=nI2/e3VHZ4+S9RKVpV41Dvqud2eD9wPrmeq8Tob+S8ktqKV/Lz6KJC8eY20hYrbZWI
         +veCJMq3psQUor/iGOMnB0GuiG9l69kHNt8ADaJZ/x+zv1gUQlD2MX5RtiVOptZud6jR
         maDLmqG4jLBitrGY++5Df/8ggpa1L1Bhm6O/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256116; x=1776860916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQIEb7UiZv2xZtfYx2IpQBGykmbDAMFOmIULcxpzqQw=;
        b=I0mP19xsgsqhIlA+gTC7+FFOOWYiqmg6H3Kk87YiV9Yt7E8l5lOA0G5pJVJlNT0sH8
         zV0fq2c4ZfnyFxpZN3nlVZJvLO5e9kjWb/Qmok9yxfgkVgobo4yP0C0uBsmtfwie1QWN
         g9mAmI0xDBHwur7ASU5c5KSaJfXKLQ0pGNcG4meYJlw/KFsmdK62G3CNaAOUwAdaJ2qT
         CTNdfaDwWnbp4tYr5QAyJBMItn0pew27SuI5PRgB2xo/bDtJ4tEgIQiizZHwYRUelVXe
         U+X5O6mzL+/OK22D8WHB/c2wqXk3RCUnKy5XIYXZ2URufyWOlyBr7ba0/TI8eSfbi9Fz
         B07g==
X-Gm-Message-State: AOJu0YzyyaXD7Sern5VeROHPneuRdVus/LIB5y71Y0Th0fVdTbG4qDZi
	ubfPEyApo1G/NZKXY99VNkppXylQRfSpbc19fc6lEeH891ljla5M+sVmHYt1tJF5ObMripmnvKB
	HYl/X
X-Gm-Gg: AeBDieuKhVo1u4BMAvM4qMXiG71Ye7larl+EB2lLpkXgcLHZrnecFwkC9ahBjH07jj8
	kvJ1LVKjKaW9I60+v7tBKC78ZVjZxZZHDAvUZHx/8AnB42xC3rp4q+JTDVmYavyzQn3Ro8u0EE7
	PBR06KXx7S0FBdP5j0/0vwFCEAUPwTuGWskRAGOKi8KvGX0B0y/zIuE/zUdJAxudJiu4yMIw7ig
	MAvFEOnDUbaLIXvArlgQHjiSJVzP1cgbmY7eHlAixm731O+aDgQTCGkVvLgtWAD428h6tA3hvOY
	X0JTyMiRTbHC2bqPIwD5Z2DTpu8J/5V2FkENj6vgUozWBy3kvvScHd1+tGzs5ygdu5sGBOwnZoI
	cEMclLDiAbIoth4vKVZEURm75dhg4N908ygQpM8Wc/UYKkhgwfJR9YYQMjN43Y8eZj3aaLsQw7U
	g/AOg9lmkrLVsfirDjo7Rh/FOid9kL/pMn6NuI
X-Received: by 2002:a5d:5f87:0:b0:43d:785e:7d1b with SMTP id ffacd0b85a97d-43d785e7e1amr18840686f8f.48.1776256115289;
        Wed, 15 Apr 2026 05:28:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5c8fsm5135031f8f.19.2026.04.15.05.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:28:34 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-huey: Upgrade 2.6.0 -> 3.0.0
Date: Wed, 15 Apr 2026 15:28:29 +0300
Message-ID: <20260415122831.955529-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415122831.955529-1-leon.anavi@konsulko.com>
References: <20260415122831.955529-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 12:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126356

Upgrade to release 3.0.0:

- Add chord() (map -> reduce) and group() (map) primitives.
- Add timeout (using SIGALRM for process and gevent.Timeout for
  greenlet) to control task running time. For threads, unfortunately,
  there's no good mechanism so instead APIs for cooperatively
  checking timeout are provided on the Task instance.
- Add simple fixed-window rate_limit() for tasks.
- Add Result.is_ready() method for checking result readiness.
- New option for low-latency result fetching, available for RedisHuey.
  To use, pass notify_result=True when initializing your Huey instance.
- Add new incr(key, amount=1) to storage API for atomic increment
  primitive. This is used by chord().
- Add new wait_result() method to storage APIs for efficiently waiting
  for a result to become ready. The default implementation uses the
  exponential backoff from the previous implementation of a blocking
  Result.get() - so no changes are needed. However if you have a custom
  storage implementation, this provides a mechanism for pub/sub or
  other notification of result readiness.
- Remove Python 2.x compatibility.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_2.6.0.bb => python3-huey_3.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.6.0.bb => python3-huey_3.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.6.0.bb b/meta-python/recipes-devtools/python/python3-huey_3.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.0.0.bb
index 2821262153..f07383ed45 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "8d11f8688999d65266af1425b831f6e3773e99415027177b8734b0ffd5e251f6"
+SRC_URI[sha256sum] = "0cfc83617b90132b0d375a3a3726aa7263cd461e7ae12af79b3a94e2630afaf5"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.47.3


