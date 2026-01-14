Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D04FD37E25
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:55 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9449.1768395705815590101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J0vtW+O1;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81f42a49437so1792236b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395705; x=1769000505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL/MC06w3J0sPU79R3CtNr0PuxijUcGE8O/UN8tdIT0=;
        b=J0vtW+O1p8z11coM7dM5rM2h85+6jAy4WbMRuPq3STNlvm/uZoff032lFzKMPBDVky
         ZImN65Xn1pJq9iAItTq0yxDxjnIaCMzBEsH4Gw7nMQdQ34N9B856QyfgZLOuLuWa4qFl
         I4mMRNcjot5ZE33zaT8ppdOD7UriQRVJ51yVRmLhvmaccFePQvT+5YhDMgRCfCG+SqpP
         dJbWJdMnozoTlC8jZCB15qmD+/JIAftGhr3gJ6W2TDfQheXQD4jekT8BD193lte9k32i
         Yo9TMF5dXMTHvY1q2XyUKjJ3eLbIJYTyWm+CAmRB+7FDXZiHF2nJStxBr3Q6QaXD0oBB
         dBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395705; x=1769000505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uL/MC06w3J0sPU79R3CtNr0PuxijUcGE8O/UN8tdIT0=;
        b=FkhJm8MOBoP03stFcQLEeYa++vTgNmizLIctsMtzs7/irrYZbJk9QFaMRrIWfHqfb8
         WZJMwWMnAe3Lx6mXX81JTbM0K6alSKudz+EjKDXGx2GCqA9d8sMs7RGsu5kce0GRcxMV
         ZH1oY+OzAZ4yjtchy0j+ladg7Xf94DsjlESlObYrCLh9fWd0pdweo+Sq/4DzQYwz6mO4
         Rr+wQOTz3MN1BC4aNcQ8HfrJkwsDqNi3ctB0MYZVAUHw9PhU0EXxWPgj7i7zap9DWEZ1
         qHWBbFz9yUyWg58ZQGx1kERg4fsxGfvLYnR4m5mTc6Mz2iHBCoE2CN38d0qeWFpydou5
         Huug==
X-Gm-Message-State: AOJu0YyRrfI9NrbYb1B77BFVpgA+M3ATc2iUc2ei29tucPkZtNJo5bHq
	Ru+dUdFtHlKFyQEs0OpGaJn4XGca0J4Clm60jKQV4tC2UxNpvD9n5uHFdNFifw==
X-Gm-Gg: AY/fxX7ggIempmWyNoP48YOa2vNRjrlX1k7wJF0ljVsHu1WEPkcY2n/iHW7U+Nfq45x
	CGfLgPBXMyWHO+aximZts2Homqj2EWs4ITsr/64jAv/0DA08JuzWcg2//Ss23Lng/Up1iQ7PrSh
	mMIawFe5Ju20yRTpZ9qMfkQ/jNheaDuUn/fsmOCnrJmbui0ZjeglQOQ01aLWuzgQHxCnXxXoa0z
	RiohSxRIysl4yW62oP4uvtQMQEjRMb3iduJlgdwZig4yKOxjwqhbePhrmq/X5seN6KRoS00AmNf
	z91KvUt7GgZG5Anq8Hq775x06ufT61v23MY50o+lXkLLcL8fBguUQCGVS2BxgTXPlTWp7E3sQXH
	qy6leOPlSxiABQN6ZVYV43kKLAys3WlfU6bRNlWU9Vf8hI+r2jbVdwWJwlyYej0IEE9CK5o/rkL
	yMtEfR+J2tp12YCF2uHH68REfbXQoqHmpb+QLQ1ojPmCXY
X-Received: by 2002:a05:6a00:8c10:b0:81e:3e27:df25 with SMTP id d2e1a72fcca58-81f81d0feedmr1892063b3a.5.1768395704594;
        Wed, 14 Jan 2026 05:01:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 17/20] python3-virtualenv: upgrade 20.25.3 -> 20.25.3
Date: Thu, 15 Jan 2026 02:00:54 +1300
Message-ID: <20260114130100.1016416-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123470

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-3-2024-04-17
https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-2-2024-04-16
https://virtualenv.pypa.io/en/latest/changelog.html#v20-25-1-2024-02-21

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...hon3-virtualenv_20.25.0.bb => python3-virtualenv_20.25.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.25.0.bb => python3-virtualenv_20.25.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index 1858fee25a..fee5250c4d 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "bf51c0d9c7dd63ea8e44086fa1e4fb1093a31e963b86959257378aef020e1f1b"
+SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling

