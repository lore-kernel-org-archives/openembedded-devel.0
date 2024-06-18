Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACE9C2BA15
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 20:38:58 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.4995.1718743133768488876
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jun 2024 13:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=tp11feSZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.173, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so71178611fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718743132; x=1719347932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgxhXhTPNYprlcqc6zxmqh8Iv3A4G8NFrwpGX/rZCV8=;
        b=tp11feSZ39LWpyB38IgVIMw9kC5Mt+WMsWgRiFt55KIHz2GWJeOJULGsQDIJloZ5bT
         ZhzeeQBMPzvmMGmU2q5ZOCyGBWqWG4w6PAhrUoWE3YQx2BD6l7zzFvrpolho49UyigZF
         oeMUzTfpP81hPHW1juBKo3Vg55SAvVHIfeISlFYCC4ohRfI3Ik4PhdZOmSEy3OwwCo1S
         XqrTTk1jR9J8exVKN4MScR6xYXqhHTQJTmltXtF3VwV3HK73pDesl99BjrPxim0TfFfS
         SPSD5TZnNgtkIQyI9Sx2jhuHOL1EpwrZu8sn3otPHKAtWJMM0hTMuA5rrXbQtpWf88FT
         J7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718743132; x=1719347932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgxhXhTPNYprlcqc6zxmqh8Iv3A4G8NFrwpGX/rZCV8=;
        b=EGcTyfAwT0sn8wPNqndJs/2xOnKR6HGpdnAl3rA+L+F6br3ZRysv165cqxIiSXmjDj
         LnBq1zGZPi50HI2vI4gogvB+41ih5rw1nPSahMJii+sfnB1zKiL3lfNMnJuqyaZVHf1o
         KKe4kUeuUt0foNlWu9tgdVGzpUOwz2EJ5MwmPmh+G8HLpZ/D5EQ2VByVULQSGtSi6OKb
         tAMGD3x/cRduE/8X8OyBAWFbIbcIHKgCvfgn7SCNIoXlBP+nN1BcHsqo06C1VLkOqv1k
         3ikNN3cAMvnECOzuuLL3vthbol3G8BnXJ5guqSvPPcSG2PMG/9592mskIW6khORLRzib
         BQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ57+1qkic5Aro18f0TMS+/PK6Qo8FMStDTsxoDOmutrZGRrhEyw0PnH/X1U8fk78RtY4RfR1tidMnFEX5w38/LoChu7x44o/moV/yg3KjFdLl3LYUzcassQ==
X-Gm-Message-State: AOJu0Yw6kciPrJ+DFh0JMeEbukQUvPusRPn2tl06oUjL9ateylBX9IMc
	0V5ikKIckb8akf8ykx6Qc16fL2qW2YQryqSUY/9f4eg66CK6sbOGHvQFWXrs4tE=
X-Google-Smtp-Source: AGHT+IG8gRXWEWiLk1EJWpvLwtwBudgOOfxF2Qyhr6vj8dDM/UjhElNJHjdg5yc5SDtELw810KenqQ==
X-Received: by 2002:a2e:7e0b:0:b0:2ec:1708:4db5 with SMTP id 38308e7fff4ca-2ec3cffc628mr5840851fa.51.1718743131791;
        Tue, 18 Jun 2024 13:38:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:4028:a105:7678:4219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef70csm240885185e9.3.2024.06.18.13.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 13:38:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-gpiod: update to v2.2.0
Date: Tue, 18 Jun 2024 22:38:47 +0200
Message-ID: <20240618203848.32597-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 20:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110957

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is minor release that contains some fixes and code improvements.
There are no new interfaces but line.Value can now correctly be cast to
bool and __repr__() implementations have been fixed to actually allow
using them to recreate objects.

Starting from this release pypi also provides wheels but this isn't
relevant to meta-oe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/{python3-gpiod_2.1.3.bb => python3-gpiod_2.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.1.3.bb => python3-gpiod_2.2.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.2.0.bb
index d8c8628da..c89fc7e92 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=237;endline=237;md5=f5ddb56912b7f2
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "a33193d6cab79d252329f71666a35a3668e04f1f82bf9b93ee2c9ae852398b20"
+SRC_URI[sha256sum] = "4447f05ab42a9ea596e548a9a65389aa84bf61c95dc7a78074bb9c5f8f6a6b35"
 
 inherit setuptools3-base python_pep517 ptest pypi
 
-- 
2.43.0


