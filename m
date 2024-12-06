Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5A1E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 11:11:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.34761.1733483500418858673
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Dec 2024 03:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=vGwYE/5h;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a10588f3so12850135e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733483499; x=1734088299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jrj1SU6UbofHhuzTnQBF3ZqhNcZQ00z9XaWLity+BRk=;
        b=vGwYE/5hmQO+vSFFH8x5bgjIx6HE/8Bryw3LCB1lbEQu08p9AFFUrnO6NZMSrTq2vW
         knxRd1YeD7bl1MfcVtuo8FSNWSe0Xkjd9PSw99kTb1dVAIb3FIsdS5enWMR1Cngc67rh
         AwICirhO6ODV7oyNBwUCBq40FU38HppaTROExTa98Gmh32beqJdzDKqej4Pbi62mHUxU
         5d/ZHnw7O86ZbI1bfZ5E8EDb6BVySZ7OjDzFAKUqQi3VxitTq7yFMuXUllM3DRbyeTWy
         MmiemxgoEr5s93ZUxvkdL5YcNGfmzlt8XJ1uI/bjp7crG9/7GnMq69wtYi4IZeivRZZL
         N/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483499; x=1734088299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jrj1SU6UbofHhuzTnQBF3ZqhNcZQ00z9XaWLity+BRk=;
        b=pu6Z+2u13dRaVpCyJkEE8tbbgUdFhAKF73FdFnt8V9TzFmzMSTGfX0pOx2BxTKedsI
         HQ+rHv0jEp0gmJeFE8wfP+nXUHXxNlTUSxFNUP0AbtniKPyQM1nn6MhKapXZ2HT+hoJ1
         JmbLZmc3kuz/ympupLenw/uSNFGDEhlcJAbnOedBP6dJdagkN/s+0n0hqlOsjlcVCRjR
         Ys/q+iqO99a+HjttmUCicZ7GPmljKpGZwcSD9kq8iGKNhRJNLBdR2GHLl6ZKvcchHauW
         7zbEGbN8zMBr1ZJ0zGmrXKU15v8se6zNvUyndbCDwx1sgnBjbO+kUN8E9DNAHV3sMt/7
         X2ew==
X-Forwarded-Encrypted: i=1; AJvYcCVFkxr6SIkfv9jPpxRGsAady5bCASmJUBhSY7S791R7yH8nly012bT1ab1kA5PMiTWQ4YD0MI1ne+uUmuIQXJiItL4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxoY3/ONYLln2aLlXbyv7K75Auy0zU7QBqgoxiQbRliJuuaaTuR
	G2omn/b8F+j+jZp524YNM28GNHfGUlFz5bn6nkDynYUF3PyNZilaWspVjLfV58AFQE55Q25H4Nn
	D
X-Gm-Gg: ASbGncvuc0Z5uPeE4UIOof8XI6/QX3K+O/I7i/DDccbSCvb15FCw+MNCb+GMTYXWonf
	cFNTY4vTh8Ybfz8UpyQ9RZK6GipjPbWtZj3+vAUmExKiTZDILFIlQSvf/ksqpzxS8xCRfC0sG1a
	QZDqm4zDjzQhwkjkiWKRtxVEkTiav9km6vi+Kr4fa4qvhWSGnJkWhdIQ74TRhZJPyrneOzYWigU
	U6y5k6H96ME8VvO33Fj9JYC2pKY7QCo5nhrDPzawgPT184Aig==
X-Google-Smtp-Source: AGHT+IFe4rWo4CX7nVHQNP8Z3O0D/iz7WZBw+tNXfBgwKmmxmHkvFfHVeXhXUcVwK3+pRwH2zr/YVw==
X-Received: by 2002:a05:600c:5494:b0:434:882c:f740 with SMTP id 5b1f17b1804b1-434ddeddbc1mr19456365e9.32.1733483498700;
        Fri, 06 Dec 2024 03:11:38 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6dc5:5621:fbd1:6903])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da461sm53830585e9.20.2024.12.06.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:11:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 3/3] python3-gpiod: don't recommend kernel-module-configfs for ptest
Date: Fri,  6 Dec 2024 12:11:31 +0100
Message-ID: <20241206111131.35594-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206111131.35594-1-brgl@bgdev.pl>
References: <20241206111131.35594-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 11:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114217

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is already done by the libgpiod recipe for libgpiod-gpiosim which
is a dependency for python3-gpiod's ptest package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
index c4be99468..a7c4ee52c 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
@@ -24,7 +24,6 @@ RDEPENDS:${PN}-ptest += " \
     libgpiod-gpiosim \
     python3-setuptools \
 "
-RRECOMMENDS:${PN}-ptest += "kernel-module-configfs"
 
 export LINK_SYSTEM_LIBGPIOD = "1"
 
-- 
2.45.2


