Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A57AC52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:23:17 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.58565.1723119787810204611
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MUuKFzmZ;
 spf=pass (domain: konsulko.com, ip: 209.85.167.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efdf02d13so1664253e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 05:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723119786; x=1723724586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVAxxFCbsZA1VYoNaMu4KEO5DLwuo+mXB0dx38RmMIA=;
        b=MUuKFzmZCCqORklo/a7dlfbx+1ICDW2ujZw6G8V0kTDz/o3LPxEtfar+kbhRnxBCY6
         o4QmWztWZeqe1X28F0l3cEeFHUPWKsRVmiO9XOdgtfsXuZlQyvllcEO2sYrsbk/GhXhM
         34Xk6jXPPIUBQQiJ4XsHx8dborjUdTgNsKVWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723119786; x=1723724586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVAxxFCbsZA1VYoNaMu4KEO5DLwuo+mXB0dx38RmMIA=;
        b=tNId/O7+Fkms3s1SmzpdZVG1z/g4Vl2szob2O4uISpuZHaTA3Z2kJJu8ZqN3exD3Mc
         QcJ2a/ebGkWemm4Anmkka3s7tz1fPRhm1rZMqD8dVGRSqIvfnR3zmp+ptuOf3nORffBt
         qklFnJENxjuTUaGGVHAk3wABDTTy3nycIWKOE2+cbDBlIBTzsxjBIkcfGnYWJQeheqC7
         Fae0eTQow0udK2SGtwKU5/sSDnfzAvih0Oe5s+utVXzrwl3a07en7LtaVZQ8GyHVjRoU
         STGBKE7uThFixv/SdG+8ihZfZsuq2BTCy/UD1SLMit/K8/eAhgXtgIClvT8dxGkRVvq6
         fHeA==
X-Gm-Message-State: AOJu0YwO30fK61JlFE2Y1k/UIh2ilMjeXXEpG+COtSc/Xc2F4eYSuMNO
	KHWs0mj21nIaUvTIAmiFwRoAKYDkdXqc6miQDEjF1m51KJ1nzbNuwGaLbzly4NoI3ZAVy1oKccw
	F
X-Google-Smtp-Source: AGHT+IGvYU5UX5SNrZea5En7TczH0+hDJEZrDqO9YGnC++ofkosj0qmeTEpC7XiCN4TVTufsrlDwAA==
X-Received: by 2002:a05:6512:220a:b0:52e:73f5:b7c4 with SMTP id 2adb3069b0e04-530e5876b25mr1723328e87.37.1723119785499;
        Thu, 08 Aug 2024 05:23:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec886esm736135366b.203.2024.08.08.05.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:23:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] coverage: Upgrade 7.6.0 -> 7.6.1
Date: Thu,  8 Aug 2024 15:22:58 +0300
Message-Id: <20240808122301.2271346-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240808122301.2271346-1-leon.anavi@konsulko.com>
References: <20240808122301.2271346-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111656

Upgrade to release 7.6.1:

- Fix: coverage used to fail when measuring code using
  runpy.run_path <python:runpy.run_path> with a Path
  <python:pathlib.Path> argument. This is now fixed.
- Fix: backslashes preceding a multi-line backslashed string could
  confuse the HTML report. This is now fixed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.6.0.bb => python3-coverage_7.6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.6.0.bb => python3-coverage_7.6.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.6.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.6.1.bb
index 5901d9993..7749158f5 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "289cc803fa1dc901f84701ac10c9ee873619320f2f9aff38794db4a4a0268d51"
+SRC_URI[sha256sum] = "953510dfb7b12ab69d20135a0662397f077c59b1e6379a768e97c59d852ee51d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


