Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D09C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9080.1685521591102384023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=fmcTQDHH;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ad458f085so539065f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521589; x=1688113589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmYpnnQED1djtQbya5n7t4YnlJusULTk7gXk+4e06fw=;
        b=fmcTQDHHRLDIN+JyfWUeh2fvgByHQuhoylMVFk/lRKogr2TxT0peXV++jcwGLLxwJM
         peq0gN5xe2muAl4/F7F9P5TTv4mp4ciIrP5WAQf8OyHtJvwaydCGuidD6eoU3gOU3Tm+
         YEqc4UOInIlT/tKpcyoRZP8qLvx2qKYqPCZ/H9LytRxXOB/lDnJkSgMG2UpY/35rUVcy
         ryYD84MNp0XVm7VsNiA5UkEus6kQHHabBsmYAxfAnuvAfyy7xQNndSSrGhju3cScsJZI
         EwzbleCdQgsZbQv65mx+irmZbvd/5Diabv8ZZkfzRYSX2CjMff8DsUPwvgUcohPEM883
         uWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521589; x=1688113589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmYpnnQED1djtQbya5n7t4YnlJusULTk7gXk+4e06fw=;
        b=Tx5yI5XFPZL3a+3qGAh4H5dUBBYYKnGhEisK4zflQj4z0+AzYuMPB+tjLSgHbJL/6d
         3UTyXDz09UlWNZnQLaygIrd8JoLrxBdDRwwJ9OAnAH6p+6ApYoh4w6/HnmkiFlZ9lfKe
         dqltjD3DIvU/cCia4/fjKkJ1i72ziT4Avpqe6Q8w7MRbe6+whGS2Knt/o3dNbD4ksLAy
         pkCkM//AR8DzhOWHrkSqkLfilalAgWMMx9+SteCm2b/EtMXH0xKllT/LXaJ/N/D8odGD
         On+yvmPhqsYIsYV0ivrWanLqWxnyY6LviuswWdvOAIb2oAc4r4SH8ENg8YPQe753DPFE
         80eg==
X-Gm-Message-State: AC+VfDxKKGiDMGvSThdqYqPEpr1wxnnH5zJREDCgYmkuB7+5iSrqXL68
	kmBAg7OEFBeuKemluQIjWoeVIOHEf2vTPeCcjtc=
X-Google-Smtp-Source: ACHHUZ7EEQMhtXZ9yPFRpD8dSRyuvhiyf6FOajAELYsF8FuDL0tVE2ivDjgjsgjUnb3EZPMwnGyNTA==
X-Received: by 2002:adf:f1d2:0:b0:30a:f0a0:90ad with SMTP id z18-20020adff1d2000000b0030af0a090admr5298886wro.25.1685521589676;
        Wed, 31 May 2023 01:26:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 074/149] python3-javaobj-py3: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:22 +0200
Message-Id: <20230531082437.10646-75-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103001

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-javaobj-py3_0.4.3.bb     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
index eb93e7173..5555a1256 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
@@ -12,3 +12,8 @@ SRC_URI[sha256sum] = "38f74db3a57e9998a9774e3614afb95cb396f139f29b3fdb130c5af554
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-logging \
+"
-- 
2.39.2


