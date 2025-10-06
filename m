Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D29CCD183
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 09:54:07 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.30467.1759744445081508810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 02:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QHyb2e5z;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so9287202a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759744443; x=1760349243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljFdurdwq4Hx4t5g2lPyKMam47Eo2tseO3IWcm1SYbc=;
        b=QHyb2e5zQ28/ZtDdrCRVN4Sbdg6jNxQdzKkxT9ZU6UAlWwOk6Yt3FE+FL4QRwghP33
         GVkaM1X5N/KseL85gKRMUedrxR/vE6+Ddu2MF91FtmZAwCY/+Ub+/SVmUWa8H9Xc2ogX
         lHB04UIcyo4kK4v1w7Wj+qjkAO9QDabuR8Tto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759744443; x=1760349243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljFdurdwq4Hx4t5g2lPyKMam47Eo2tseO3IWcm1SYbc=;
        b=kJEqDms6dhwANp2yw0Nrt/rAJbT8iMdjMdZZUf7B7fzMgXHZafC3RX5vneb2yIt9HK
         gATqgV+r0M16xgMOrVCWbP2XghV1RFDs2Uq+0inU4imKEflmfLVUB7o0M5lk3BKdu2sI
         G67f0KV4UgmbgfoNBfc/sd9mug9H7NptlkajfQv1MpstkK6Lugfc46erCPyJmEnUsHZU
         Kqs0ADxB8GNlueZc3keGLCjqvKmXkGN/MPRgttD9O5tZ5hIZJQ7Kq4KtN/xj6GgPpbUw
         flS5RJmirr2XHmBLmHQeMnyWLe1iq/lOa2e3CM67yv48xJjIEVndVL/15xw4T1N8welh
         InfQ==
X-Gm-Message-State: AOJu0YyracXD4Hs8yB97YjYXyKcaALuwoo0eb2QHteESL10mHeY1ChFN
	EEWXwIhM/FRXyRSEsgS5/7/QM4UicqJVhU+VhiHGprtns2twjcSqt5xf/50W033hTFq+stLTH5X
	XvGsd
X-Gm-Gg: ASbGnctpgHymyTVDL5VpeifnAQTn1Bu2jUc4hatnP0B3yIY4UCzZ4RjQui+UTwf66/H
	veGC2d0Slo1JDmXnCBK7nkqqqkgIgilCKFMHjd2c0t4FvXwwJK0zLyRNGUUbr3kdzJoLcHoScsD
	xlx0UkGESWLOcE8jbjX1xpGoQ6VBCB3+tDq1+jCCGH2InVZd45foxbIZUqlQwkzneviWFqt0xY6
	nmZBlD/I2qYkOb4MK4XFqroTv5VhQDTnADdU7W4gl+kvOgT71KD0htOrKsDMjfHT5fumahqhfL0
	pllAYB3ZoYKMOHJcG2STAgrBWvMyPHE+qhXDDggwL9HceDhEI7WssT3XZXSPkX1ADKwSba7mgos
	L3HEu1v3rTvaAslXesvkxQx+n0s+SdYZaTk4/3TjXUjhSN5shM+a9+V9SBjfX
X-Google-Smtp-Source: AGHT+IGtjPwSg6rv84NfMOIWBEZANR5WUgYgIQImtnHwCKtTFaOv0YBj/hKTP/oyevUFpGvSMao2xg==
X-Received: by 2002:a17:907:c1e:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b49c3f74b27mr1703900666b.48.1759744442904;
        Mon, 06 Oct 2025 02:54:02 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1094493466b.45.2025.10.06.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:54:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-aiohue: Upgrade 4.7.5 -> 4.8.0
Date: Mon,  6 Oct 2025 12:53:56 +0300
Message-ID: <20251006095358.532479-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251006095358.532479-1-leon.anavi@konsulko.com>
References: <20251006095358.532479-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 09:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120274

Upgrade to release 4.8.0:

- Drop tomli in pyproject.toml
- Add scene status (active + last_recall) fields
- Update various models
- Add a few missing models to complete MotionAware

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_4.7.5.bb => python3-aiohue_4.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.7.5.bb => python3-aiohue_4.8.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.7.5.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.8.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.7.5.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.8.0.bb
index 23354152be..ac20dcb1c1 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.8.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "77d7ee467c41bb0c3e00f4e2e533ba65f58a29147ed7df407f84cd4595d2d20c"
+SRC_URI[sha256sum] = "78c5af843c916affd8cd7efeddccfc6edd0cca288fe9909c21186fef03606cd0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


