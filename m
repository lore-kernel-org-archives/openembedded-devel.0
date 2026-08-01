Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79BEC55181
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13597.1785620738541374460
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UsbOIVDh;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacf197759so31506855ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620738; x=1786225538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1tX7krFp5HFaeMbsFQoL4Q5C8KzJAthEAvtgv+Z1ZQ=;
        b=UsbOIVDhCNhOMOMuHruGG3dnMdWeRLTeflV+j8sipSKXeB8gVF8C28q9a+HGL+f5Pb
         l6/1aGCYhQI7LtojaqCdwnk4uUF6Lu9KLhYEeN67fllSfhRVfCzlmE+MJaFOq8C+zX2x
         n5CvQL5rKfe3JuFLV8jTia5uQzHsVWLK486MPtSSP3NLJwHa4ThyOE7dncafUb+9BTyC
         s3BC3ZuOQ1tdA75KgWa02ohHQevALoEoVUYOL1UCa8bavBM+ov/W2AGfa7Yobr7qkWM4
         S48SUsgwSX2HkLLh90UAGu39eFuMidOETXdJMWMYXmS7zkip31qKlP5U1rtZefLQyfYY
         uZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620738; x=1786225538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1tX7krFp5HFaeMbsFQoL4Q5C8KzJAthEAvtgv+Z1ZQ=;
        b=JGAiYDJkAjCgZjynjQBXrzEUAKNS9g8JFqrUh3MdfI8Z1fzDCwVBmZBRAmAyKoyZFm
         UjChjtz2fD6mJTbCg0pm1fyAWYfLyjfZVr/7zlttR5ydVS6+NaMtzNOFThYQvM7O3iAP
         gQroTjJtylkYUCjo93WDO6pfLmRPtHdDA0dQVnWpDY10hO208xjO7nUWCqdc7n1tFgEz
         DF7/lmOMJCRr06GnBsDcHvEPwonBeDBoOHdrbTUIgvxlNZ/wKH0SkSD2oJykDAgK/FWy
         9ie0z5RsLfWBhjBsee9kusNKycVDcHlMFQc/h/8744QkH7g3ZzfBNnwnFMmYsSQwRPJK
         e0Pw==
X-Gm-Message-State: AOJu0Yxl8V5KqX+XmMQRT4UjuMhZJKWnG29AdgGk3wsOnc6HQb2qSMrO
	Us9eU+sqgjrq1XYwj6pL0lVLI89WWUTvM07dAVdMHWmN5cSYpHWm6hTu076ba3n9
X-Gm-Gg: AR+sD120wtIuvZeM3ZmNbxFBnZMV4BbFa2qmlUsJH6j1KLpeFIUWYbCYLQYTj/f+/Aq
	9hlwy91NJhemV3pVGd9HrGBC7G6nr69kIwjeGpGdg9N211TdVT+VZi+IGSjRwN9yRAnlfPemeu3
	oqzSEN6MxhMyV1Z9lTcBUaod7oSbefrJAJde5gljVXA4TL64MyyF+SBttOKm+R9Tupwj/efhnSx
	iQqje884v1Zw76lJTvrEvqhiS5CifD2awWBs06HG+9MI74sYsCfHxdHODXmAV8iBa+CyTRLOqrU
	BkeOjrlqQHaV0UdqgJbk1E/+O12o/T6oB1Avp/j25OqlkwRzHz1h50N80goJPEwwZYiENa/G+4A
	hhieHcxwdqGC1CvCLJpQ4jvB8Rr284l+jizNJihrwLXRUudtvqySeQyf4Xov4JjGVyd5cmqctLy
	BWPESWU82S19Cc/9VnjORXNtkb6ejJ0/F7K9tVGgPk9CabPnAZvmCmTH1xWFAjA6PqwN5eFBCXC
	14ObiPN6MrbkCNaiVb+CQqpTfoP5sXhxp/Io6asu4Ek0OifSv4A4Z+FlyU3yVRAyw+92pogGKPU
	KNc5+uOyeZIEiC9oESKMrfYza8eEfw1UkdbD9xLfCSjBHSdtcIJPxgNNaXt7XLcGiqe8Yor6FPV
	ZsLw5KWXvRSlIeQ==
X-Received: by 2002:a05:6a21:a395:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3c92a626e1amr4226605637.28.1785620737837;
        Sat, 01 Aug 2026 14:45:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 10/31] libsrtp: upgrade 2.7.0 -> 2.8.0
Date: Sat,  1 Aug 2026 14:45:05 -0700
Message-ID: <20260801214526.788343-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128627

Upstream changes (CHANGES, 2.8.0):
 * Backport cryptex support to the v2 branch (#778).
 * Fix AES-192 KDF (#770).
 * Properly support the null-crypto and null-auth scenario (#760).

Version-only bump (git tag v2.8.0); recipe unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libsrtp/{libsrtp_2.7.0.bb => libsrtp_2.8.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.7.0.bb => libsrtp_2.8.0.bb} (94%)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
similarity index 94%
rename from meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb
rename to meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
index 3e992c403b..19cb9ae061 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.7.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 
 SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_x_dev;protocol=https;tag=v${PV}"
-SRCREV = "ee1a77c9f9dc02c42bda9901038c500c5efe4cfa"
+SRCREV = "24b3bf8f19b6f5ab4cd2bcceb4f4064efca86fd5"
 
 
 PACKAGECONFIG ?= ""

