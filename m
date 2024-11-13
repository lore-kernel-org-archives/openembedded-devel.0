Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27897E6781F
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 17:04:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.16615.1731517453903462538
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 09:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=sTwPK0Vm;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso88789235e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731517452; x=1732122252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5HQ03wfTgVLIEoWVbc+jcPN5E/6bgbO+B4lu9nCTkSM=;
        b=sTwPK0Vmg31LUnqT5BvaKXWsKBk/n2f3igpRSU85VnrNQTGdI9wz0JsOAB972rQj+F
         jarSUEvJ3WWTqwUvcBsRVKYq4EmEDpWJ7Le72jD4hFpT9gco/qwq0FY8Vr9slylnmUXS
         dQio+LBoPrrvpDQN6Kz/FIM4wQIDncSCPg7wnsa/rlLyR1uprQfYko0ofu46mLea58nH
         D2flzK14aLEhJ6TuHUIMLPDZze9DDYlHEvNp+L0Tc+2GHr0gNFVcJdi73Crb/05cj2FC
         uufqMHWYN9WPW2Ox4i8TG7Bgih6JM7B19DBTt880mjTKaF8FFy/I8lOdawP2SozSe98I
         lfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731517452; x=1732122252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HQ03wfTgVLIEoWVbc+jcPN5E/6bgbO+B4lu9nCTkSM=;
        b=gDFO5/aWjkmBI0auCVYU1LpRoBwc21thHTswBh4iwga2SrPf5gUtyYBAXxV/pl12oA
         0Ggk2bcMzNCOdWqU8b/c3u9+gaLBzfV7WBRSwIQH3RElDRwGuLdx1fJcoWQ/mEnkP4SD
         nrmbLZ0Mtmknsw41T2q8ZiBqbmNSImm74oSo/zOBogw7G0cTgzthH8XcSz/VTQaR6UUb
         qL5s6KKHTcb+Jv434ri2wQs5gl/YvIlL1XpKzoevwy8CIMiZR2KMhcjnLmk72Mhjex7t
         cJ2VwNat8zx7I8l/9YIohVRNL/nsAv4gktsZDy4VSFNeu0rv2Zhyb1Y810AljQ1cZiVH
         kQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzSDKGTmhd8fuXZrzjeP/MzmbKu3pzunmbiMf7WcMkyiCKgDYySdW1+A0RFokdwlGdKGyAT9R/hYS2Q9jE1Q/8vgk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwsPohXpT3xwh9IZCAYfn4ft1gvbwn8p4nR4L6pRxnApVTiBFlO
	Pd0mAVLLNCEINOSbGuzuXJGSp0QAu/Fg9lOqsu6dpvS+6leGuCF7If7Ipx0pSso=
X-Google-Smtp-Source: AGHT+IE9bGrQarK9q94ZjRRt5isqiBxB7HDpQ7BivkbOj372909VWNz5QLkrcZqV7UJjJWPUMokKoQ==
X-Received: by 2002:a05:600c:3b29:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-432b7518d17mr224488105e9.22.1731517452137;
        Wed, 13 Nov 2024 09:04:12 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b75:191:f7eb:da75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54f82b6sm30611705e9.15.2024.11.13.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 09:04:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: remove stray newline
Date: Wed, 13 Nov 2024 18:04:08 +0100
Message-ID: <20241113170408.100602-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 17:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113813

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's an additional, unneeded newline at the end of libgpiod.inc.
Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index 7b68f77d20..fb309c5644 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -53,4 +53,3 @@ do_install_ptest() {
         install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
     done
 }
-
-- 
2.45.2


