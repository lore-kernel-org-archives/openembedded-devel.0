Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02765D2B948
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.19504.1730817406302984222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0VXo0wI;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea051d04caso40891897b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817405; x=1731422205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OYD96HKCTNTlL9K3VuncPVdHip4gx5eTwa8TCeFOcI=;
        b=F0VXo0wIPB2z4jv+IkF3jfLUWmrPaDaD/nEI0JyrXIpmD54f8hBsIliNXXdt2HY2DL
         iylBZy2Hk3wux0ROgsG0CW/csL1xAwK5T0DmkeFhoi9uI7Iyh/DGxcnjecUMj8d4Iyf8
         vb+vJfnI9E93JApvjBn26NV4QwfXLyvMYDRjt5bW28yNvty0XODm4tHENlSDkJ1wGNkA
         dLHlGTPzeJGSx2fSKT58dCjeT3XKPtGRP2O9zZe82Bx3ZUZOtElfNSLzioIBejRpPRaF
         nyVqKA4xY3mTSnbZ2AzDWmVq6NkRAoU+QAZhfnc6RyjIJ2NFUdnGbEPKmqyUTquD1Bdg
         uJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817405; x=1731422205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OYD96HKCTNTlL9K3VuncPVdHip4gx5eTwa8TCeFOcI=;
        b=mfS7yHGlZhAsYMdKKHcaoDR5B/JSMJV5jmc0s/i9TSkqYb60b2djovZipB3TrOYDpd
         W60VNxw8lZ5JGRtfV8zAcSrUSiEdd0XxCVfODdm2FaKqzX/D/BT0GzN8+cYSiWmZ/fAj
         UgQcHA2ArS18wp/SPQ3Scuxi35KjAMxdSTIh4/z7t5HhO27ZmmxVsB0fdyvC8o6TxnBO
         yAGReqjORRriWAoO0EW2HjJUo6IqgCbPKohOjpmZFSyivIYW84qUdl6GqfL9FXHFuGw5
         MIl3/jKdgAihkawB5Ts9Gioyc8wScUYDOTY6tCzdHkQtYnOi2yaFAjAX7b/eNUGE2VdS
         GtAg==
X-Gm-Message-State: AOJu0YxEg/l3zI6TPO8jKEjK85lPcek5JAil2kss1KN9dPEd8AJZshZN
	zzJ3BzV4HhGcYlUnGN65mDuN7RhSzZwgZ8j6BOsQa/toHKaFQhpbZwqt4g==
X-Google-Smtp-Source: AGHT+IEeaoy8voqdyrPnsVf81QLlhgRQzm+Bi4PU9uT3ajaQDV9XOF0J5bNbdE/yjheIPa286TH+xw==
X-Received: by 2002:a05:690c:64c8:b0:6e3:16da:e74 with SMTP id 00721157ae682-6ea64acace0mr180327247b3.16.1730817405405;
        Tue, 05 Nov 2024 06:36:45 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 14/90] python3-platformdirs: upgrade 4.3.1 -> 4.3.6
Date: Tue,  5 Nov 2024 09:34:39 -0500
Message-ID: <20241105143638.2301245-15-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113432

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix readme download target
- Split build and publish for release
- Use upstream setup-uv with uv python
- Bump astral-sh/setup-uv from 2 to 3
- [pre-commit.ci] pre-commit autoupdate
- don't include outdated changelog in docs
- Fix multi-path returned from _path methods on MacOS
- Use uv as installer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...hon3-platformdirs_4.3.1.bb => python3-platformdirs_4.3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.3.1.bb => python3-platformdirs_4.3.6.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
index a994197efc..02d8c3cec7 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.3.6.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "63b79589009fa8159973601dd4563143396b35c5f93a58b36f9049ff046949b1"
+SRC_URI[sha256sum] = "357fb2acbc885b0419afd3ce3ed34564c13c9b95c89360cd9563f73aa5e2b907"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


