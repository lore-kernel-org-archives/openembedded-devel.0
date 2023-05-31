Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0910BC7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9087.1685521599287312802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=1RMBw7Ei;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30aebe2602fso2459170f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521598; x=1688113598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usBUmpzfXLU98pSKZLDO7UFS7aOB/cGHM1k44TPsfKI=;
        b=1RMBw7Ei2f5UhilkAk9I+lLf1v6B5YbwLv9YE+DxwSRB7UQII6Z05kwGj4Q8m4vsYP
         89hsz07jrI4kjHP3K5JpPjUFU7eXPFZq8tbHapJShrsKeigMYDYeUF62kjpk6O1mk94n
         f7IUFNPoo0597bneqg1RipKRRNNiO+0NCO4uZ4ADhU83hPk/gMsRp6Y0ZOK6vjr8BpEt
         Fm/sPrG0hktu/OLhLcaUQsXM1mVQyNaEUUKQo1u4MKo5LFTip/bPTHN6qnvrN9FGRvSd
         6fEOWjS1T4aL00eWlUmoOM6HGUNhNUs1m9/6M0RpdPnOGqBt7GaDOar+YPrhUanjc45f
         v1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521598; x=1688113598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usBUmpzfXLU98pSKZLDO7UFS7aOB/cGHM1k44TPsfKI=;
        b=UCzGgyLuZx+qz6oBf93TMFmlPmdwb9xrpmw1tFvexaSHq19Ujq4j2wyPbT66sFtYUX
         PIQtVV7LZSzCwEVsmxSMqolopdp8BXGj7SiVw7CzwI3/5+PvHzGdR9f+u4ISPr3zdXRO
         KSkETwU6iIDe0s3VAzcvurLjMguYyEACc6inIl5jXoyQtAfy7uYsUZM14JhRBOlRxVFG
         TnhddAKmLy+Se4s+s5BxZl969c/7jxf9+9AW+sHdwv8Zh8Ts6by0CoKoyLa8mY2UwDAs
         ChFOjap8MfWYruotMZrUP5zDokpaQmwwNqLnDgwj8+nqV4vvAj4bRX1T8BAtAA31B0d2
         EqUw==
X-Gm-Message-State: AC+VfDxsvfOWZBp6eE58dJS7SObfDircg+6BN+JczZE7ImazVQaXl+xM
	WK7oHi9mWeHrCXW9o3P3eHMGHQ==
X-Google-Smtp-Source: ACHHUZ6lgl/ed7Z+mTnecdOH1+ImM6eohSQ4tiPqjfdjnSeFsZwL3Irkwun+PGMaZBlv7/DTrdJKYg==
X-Received: by 2002:a5d:644f:0:b0:306:4239:4cd with SMTP id d15-20020a5d644f000000b00306423904cdmr3492670wrw.31.1685521597853;
        Wed, 31 May 2023 01:26:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 082/149] python3-pefile: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:30 +0200
Message-Id: <20230531082437.10646-83-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103009

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pefile_2023.2.7.bb      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
index 580b17413..f3e071108 100644
--- a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
@@ -11,3 +11,9 @@ PIP_INSTALL_PACKAGE = "pefile"
 PIP_INSTALL_DIST_PATH = "${S}/dist"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-mmap \
+    python3-netclient \
+    python3-stringold \
+"
-- 
2.39.2


