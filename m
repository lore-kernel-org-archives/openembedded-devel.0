Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B40C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28084.1786651739492320787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FAEMDIjg;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so5297235ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651739; x=1787256539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVQrMu2aeRZD9b3hNAyIg8WJX9H38o9yLDeZ39V8qUY=;
        b=FAEMDIjgbJIQQxp+1xzOQOO1ImBTk/qYgz8xWJc9aJdHjwk1Cmtia0Mc35fAOAd50G
         +ZVJNjn+rp4+jiifCYfw0E32GMUMgyCnKkfo9cHcawY4aaGmEKKiKuxBgRDcA96ZokjR
         /KBVsoRSjRuaEJvTOzd6+RuGm5yML1AJCRwfW2F2LncTXkFH/pkdLe0TQs1ANXvMU9nb
         +Hc7KeVuog7xhrat1ROo9xXbR/1x4uu2xwS1doZ5VAK97a2/t6cGGaNXqDI9EV9D8aTW
         qnZOawR5HO8bDTraIiXFnGZlRG0fNdobm+r7JQPgzNNlPDQzNZEfgDyGl/5M2jRwCy1K
         IhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651739; x=1787256539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVQrMu2aeRZD9b3hNAyIg8WJX9H38o9yLDeZ39V8qUY=;
        b=tTEuK+e5hCFwb49uRmuXHwfbIE4RM+2jU55S8jjFvY6sWMDMYZtfBGePA+V+tlO0oy
         Yw7N14mAG+a9wlRni07DFlBAQrNAMb4JWLkdR5hDv8ov58MmgcVuellxY4G6Z+pat6Ub
         2kcdMAjI1Ongmyz4Q99Z4+jjNq3YEgTZjgGTjBe5R3Y3s9+3Q4G3EEYSOZqYaJxhvEhz
         xup2weEwi2Z969ylXOHXp0WMO3auVuyRzC9Knedybf9QXFpkPCUIFgjV+5m9uZv1T1JB
         XcG8qq8sBuBgpweD/eXj8gfwFv8H1f/kl0L2BfJJafgnkV83fbSDvMenPrrp193WBdDP
         zvIw==
X-Gm-Message-State: AOJu0Yw7Hi2Fh07o8p7MmxFHIQlgpcjE2+S4/U+xYHdgNqQj7EWCqQ3k
	wMh7wYraNfhST6wPqhfmXmkt74X83/9pZvWVK99vnScak/fkAwHkJM/614AQ5YNL
X-Gm-Gg: AR+sD122kB16243cXIspks4z10Egll3MO2sJXkRikJg1i7sBQCxeL6rFFS7QTOk10tY
	HDs3hP2UgENZejVM2zX1CA2cpscLEipOaFCP6hd552n7R6hXhKvT0UzkucBqwP65N1otIC/ZQHv
	OAyRVyf1GMp4DOMqnBy+qK3nPrqFwv5yg2T+kCj6McU6wsKh3OSh8aJeXOzt7J697d7CcLaEidI
	KalOZraMcAvTsXwID3wY7fA7HrAKfl/aFJkqQI5n0TCPmnsKTr6tiU8PzxuDTxbxC5GrvfFqt2K
	jBCtbJZ9pfS+7EoAPjxYCls3dA2979DpX6gBHwC39ESCSpXSoR4SChUnSr74p8uW7uOvDZTnqsg
	RTv/IAYp0pSvrxBzlFKf8i+CKI8iMM8RBipJ5LDM6hQFKUas0GihNIG+siCPg+fBkISWm7021Hd
	kfIB30/lBBjbX06YKjID92whvXcCQp5bV6nN1MeRi7Dak/ZikDm18XDkPtiUZ99YWH3QhZRSfz4
	ew0+FfJe2PFoOKtzYzrHxJo95lLnmj+fMkpkARD2x/1z8PRW2vDSBpfG6uvKD3R/n8gaxWPmksJ
	WtwOIHASZMNJRgezG0uBYZJ0EqIhLDPaL7xizIx8N0YMJraOp/4ZR89WBGCzP4XGPC+1VFTTQ3K
	X555LVstvR03KWdfTwi/S48kfH/YVUvVEz1HefSoq4Gy6Ew==
X-Received: by 2002:a05:6a21:1391:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cc7200c62dmr254035637.25.1786651738762;
        Thu, 13 Aug 2026 13:08:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 11/80] python3-bumble: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:25 -0700
Message-ID: <20260813200834.1302829-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128955

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
index d8aa40666c..9e45fc9dd2 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "0883e2dc744f0b8228f5095f54bdf8df7f74e47d92bc5fd97ebfc2ee48
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\

