Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5510C001DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.7373.1687180966925323384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=0+W4cXfM;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f9002a1a9bso32604355e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180965; x=1689772965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lz+LS9bQs/cnmhjSqEYJOvjUWu2hcbzfYk323FgOWkU=;
        b=0+W4cXfMICPSsD0ILQYch6JgTV63gwm8bvfWAaH6bRSVPoaWWn8IqP6TFYNdFy3+Kq
         IuBm/7/H7TY61g1e+GX2AYimmjzPkty8PdknwGejxju0HTxM6qKQdPuI9JGMnBrKYrzY
         uW1PvaWFO84NmVFajPBZm7BrROSc6dNmpQ1EGm3lZG9pxcYNeGW73myfhcSmSr+NrEOF
         LryYXhV58GF2rRk89UG4BEceEUut7EIWuCVwBwh2ACBilgVDaI1MkfGbMY9W4wEy9K9Y
         ygIdqoaPGMJbRp05xckiklV3UvmUTOZShRW+wCv6oGDuLS2ZuDRqJeC84Z4EBtfpPeuB
         hgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180965; x=1689772965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz+LS9bQs/cnmhjSqEYJOvjUWu2hcbzfYk323FgOWkU=;
        b=lttPM0i4LMB4OTSiDfJfF/AAskrsZgAPlGccvUYdZHIqh4WoxLFN8gZNDQDFxK/3J3
         6UKTf3/JR8rKIrsdoeESYKfVZHO6rtKM5tqQzvCrwRYSUZlqYdjz8gf51zVX5OHJFpcP
         JFKNuqiOwW7DRT7pIfdeYjK4BOJLOW5Tuv8o1Uvv86b0hac2shWcVwI4BOPBrskwY+HC
         Opka7DdkQI5NsvSU5Q1iIB094R48JCS/CGZ6vbQSScx3Owotc8OndTY18jCa8MWIleUj
         x39lzh8VosNvy3Vx3BP+C8l/PaC0m+4aWCBydvVCzucrHDWTc8t5XSaMEJ9JgnlHRS2i
         8Riw==
X-Gm-Message-State: AC+VfDyeL3BA+wqNzATOCXvv2pWCDxUjvwKK05gJ6K8anhrRmENldRoG
	K5YTOlZjfHdhe032hEj8nTQ3jA==
X-Google-Smtp-Source: ACHHUZ5wwDlP1xdPd+2/jz91uYla+h8NOCVbxEr3dpWknr5tuKCq07XKhEMA2q2O3fim4h2g83olDw==
X-Received: by 2002:adf:ef50:0:b0:30f:cc45:5af1 with SMTP id c16-20020adfef50000000b0030fcc455af1mr8000379wrp.45.1687180965525;
        Mon, 19 Jun 2023 06:22:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 24/54] python3-gsocketpool: stop using PYTHON_PN
Date: Mon, 19 Jun 2023 15:21:44 +0200
Message-Id: <20230619132214.213417-25-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103408

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python-gsocketpool/python3-gsocketpool_0.1.6.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index 9ded1d4be..ee0ffacbd 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-gevent"
+RDEPENDS:${PN} += "python3-gevent"
 
 SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
 SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
-- 
2.39.2


