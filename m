Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1896FC5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27769.1786651749980040361
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BNLRSu12;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso3373255ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651749; x=1787256549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz8Z9M8+WHo5YeQu6flO8LTbun+xg8UpZ9w/9d18DvI=;
        b=BNLRSu12+1MJ/EEni+pm6afBD2In7vTlFvkfn02by6j7wbBbRHQ/z57WPhs1ilf8yi
         8X2iB1TeHX6N9HEOxwKT5MsAPMf5Eo5C1VjBTE1PuzsWV47bR6d4pdVk133vThKGyk6o
         Yh/m1+MX5hCpH4miJWLnrAOBliUtLB0Pz33bDRx85WoKQm898hKuHlalDypapknzU34t
         4KK4K/Vj9DUTXs+50EgDtMBoamQbEMjYWVGkDUxtamDHQuXzO7nJi7m2UBFM0vDRybL6
         2MgUxQaBm6VmGPrSu9/JbLHNRMPzPZJ4booceg5CTL2Rl5CVnAcVDZDsKBDVaZ5LZBEc
         OYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651749; x=1787256549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8Z9M8+WHo5YeQu6flO8LTbun+xg8UpZ9w/9d18DvI=;
        b=sBaKR8ic+APjSu3lik5/MPYSrAD2kTjzbo0pW7ngV33rs2RhNsZpUIAO6sASlvGE2r
         XkqfrjRrR0+KL5dzNnC7s+I4s6siyaFBJRDkg6qCBk3gNL2iqVa1ynkZhGPW9mp4X40d
         AyqUt9ltGMXZXoky1GB25v0OlTZxEDuwV711DEFZQVDQXE/k6feW1SHzBE5inc2hW/qW
         idqSnJvkgBhpaUFAEKyhNeU5TweVJUDi7Alk8B/TjYBeSDPfnc4HXr/iPnpXwsYGA2+h
         rgpT0dCHYW2oLn1jnHN7PMQbXKycbTHwaLJ+m/0m8ILbH3A4rLQGATPaAl2797gzznbi
         QnDA==
X-Gm-Message-State: AOJu0YwOqT7mDA4GWWWr0v3DjE1IQZRinBU7Us+RVNJkv8ekHy3++Lk0
	Lf9WVqeZ8tD1ncvLQWOU2Txzifr7GS8yqKHSeJthYjOtWosF0CqtAZjX+/z/3uz2
X-Gm-Gg: AR+sD10ataM0/F46o5UHYf7uoQS7XjjAPSovpiYKtw9Eeq4JKGvezsxILAyj6M3IDru
	x+B05hR8KLmhMtjbXjw6NhpIaur6mszsxm8qegD4UnTptXpyDG0zuqMGGpC50aPZjCn28pC/4ac
	NRyJ/adeVn1C/yQG5xHBavrLvjST8FARW9xvYWGdrCqlzqhFJF0TU1KYqA4tO1rXLEqFJdTp2NQ
	PWCy4sqCyEWRsHBfkBkgzS+jjI7J0hmXpME/c/Gv0oFwNPNpwfZFJ8ZVEjZ/32OP3xlGmWUJXty
	bAts9dHLYD7I2gLNiFeZCM3V2S9yJ1OVqOR37IHBrVaYrSxewiN/qZCIUpRhrAKSB1mfhau4zJQ
	jic5wQ2eBQqK+2gHcyjZbDiXgfS2/VFiwQs0v5FtqBS++ONbLsazTuG4iC8y+osVKsJi24kwbzE
	Xm2XDgfreDnv2qJCTl8aBjbOcf77HMG0o1lmDLmPg8RUnI+AQCc4M9klucrH9GnP7ve1nl0QUZS
	YPUki+hjKGFd/VRx0qJ5vOmun5VIYc2dhBPKnepQu8/rH0fCW+bg3eM8ozQk/MBY10dX9slQ7LF
	P/cN2qZ3rr/XrPyM89enuAFDQgsh40aqKFYE9Uos69nYEAzfkD9JflnwbST4jsvL6tqddDKbfGc
	61wShiCA33DjvMvxUikohh1UVvu3LOwq4UdN6U/dtRllmpA==
X-Received: by 2002:a05:6a20:430d:b0:3bf:6237:4d46 with SMTP id adf61e73a8af0-3cc71d00570mr288466637.28.1786651749130;
        Thu, 13 Aug 2026 13:09:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 17/80] python3-dbus-fast: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:31 -0700
Message-ID: <20260813200834.1302829-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128961

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
 meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
index 15bbc1706e..a45a7fa920 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_4.0.0.bb
@@ -11,6 +11,8 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_poetry_core cython
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += " \
     python3-core (>=3.7) \
     python3-async-timeout \

