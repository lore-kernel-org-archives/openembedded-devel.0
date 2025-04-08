Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EA1C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 04:15:37 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.67391.1744085734799195005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 21:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIAvH4yu;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: alistair23@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3031354f134so3798598a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 21:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744085734; x=1744690534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JBPxn2k75TA4ouLrOKftrdnDu0IC/s/IOmBF3PIiCq0=;
        b=lIAvH4yuHMQGNVQAZTpaR+hC3SiKCSBO+jXZQcyy4g1t4m+zzmhqFNryP8pcjs1JbU
         mofg4b9LtqTOyHzPQdVEuYhM9xVRz81gsH6L5ni4b/FakSBcUJQHgEvycpizjmfyKhsV
         hfrzFrvH+HIxaLs6zryawdmt8JFRdPCWspwqzAE+yNw20actChdPCw9x8ihPIn6pIFdm
         2JBbgsxBzHNovBF9kHbXz3wKHzakMZB37coQ0fl9bCg7VlWn1GtYGcAcISfJEnahqXkN
         vc6an1+bVS8dkx6LMSI7Kz4L5dLcBRjwzLq3vpTP1gYFCHeQl09MuDdLOKYmB200L8RP
         VLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744085734; x=1744690534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBPxn2k75TA4ouLrOKftrdnDu0IC/s/IOmBF3PIiCq0=;
        b=h7/U+qSI9+4Q/1M6OkepfNGpDSzR3gWEFgMhVHXhtanOaRFHs+9ZxMeWfEVb2WUpqw
         w/IB5r7Mr6Ydyvf4h9WIEOCMW/YiP9Jpj/zK9KXeIoMkJo7tM5t4aTCOqaNpW4lKIrQ4
         vSfE1gILxMtHJK6xQlUaSGVR/lQB3s5wLM5skiRJNCMkh3g2lPbKT2lR0ebUNg3HtiBy
         htopTENuwyVsqVdTgIGl9LSFh5g+D3t8x5IrruhD38BAr+cuReM/Y6ub8w64lMprTW8l
         gc9XTGwMMBUiU14R8tspRwxPukIsqSdpfSt80lwKchytbjOwpX2z20FBKUbH0tXbTdNz
         Pdtw==
X-Gm-Message-State: AOJu0YxthYSjbfgiqWPDOsA5k0oAvHfQYR4Qwhx5XTK/o/vDw2U5D2/k
	bB2hZ/Yq3CaoxzVyi/pRc+S7nLm0/UK4ZJIyY8EnSBprosW1ppw7ZbXwbg==
X-Gm-Gg: ASbGncvmsDLkxiZD6CL9Iw0JSoubEgNrNFOHJrFHIBy5bSbXaxd1jySXiY9e1AC6wRx
	hDhfU8FxM6GpKHi5GgrzlyPXuedxP1OvRWnVZt7nsnex62wec8fB5RdiPl1FrFCiSwELzSQ7JC+
	QB9lohxnRQd8OUd77vLgZDhRF6Bk77ZEQjk6jvvJ5ukvj/uDyP3CkMzaj5GnRMf1d+7XtJyC5Rp
	h8xC/fQYSpQw1CVz6f6WF6ixhRIQcmFhyAJ4y33H3cvBO+FK/gLqLw56u7GPiRP0u9vvGfyjkSF
	YPPXDbWbj2diQVC2puYqq81HR+nZfpV2W9GBaUlXjtGPKbs+xx0KOFTdd0Js1M7wua9/VXQ5TU7
	jOZD87TqsFX7HGkwYys1IABDeGK+uet5jAsxZjwqYrZsR5YAV1w==
X-Google-Smtp-Source: AGHT+IFwUuIm311MWavSDBpsTS7JQAqpJdpvtHQJBMq8WEeOVyYnjv9HbeSAfbkMDuAYAWNiaLUm1w==
X-Received: by 2002:a17:90b:5683:b0:301:1c29:a1d9 with SMTP id 98e67ed59e1d1-306a6167814mr18613111a91.21.1744085733927;
        Mon, 07 Apr 2025 21:15:33 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a2f6b2sm9868212a91.24.2025.04.07.21.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 21:15:33 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH 1/2] libnvme: Update to 1.12
Date: Tue,  8 Apr 2025 14:15:21 +1000
Message-ID: <20250408041523.4029757-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 04:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116686

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../libnvme/{libnvme_1.11.1.bb => libnvme_1.12.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.11.1.bb => libnvme_1.12.bb} (94%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
similarity index 94%
rename from meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.12.bb
index bf66099ddf..6b73defa56 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "cec9feaeb03da8046d14bb395f592c601cf2ae5f"
+SRCREV = "5ec1f5284ecb0eda481f3d2d61236fbc5b46164f"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
-- 
2.49.0


