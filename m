Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C23FE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 11:11:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.34759.1733483499393952671
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Dec 2024 03:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=uSyc7i7X;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434aa472617so13526365e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733483498; x=1734088298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fItchsX+7kV6kUOaIc26h980oXg2fPlxX5pENy/XsUs=;
        b=uSyc7i7XBwqRtddcVMiL4a+UB8zFvdDo5OtOkZXmziKIAIAiGc3ivCo4ogB6iB2c9M
         4x4/AFt8eBDT+iwod2oZRnji4cULYGJd9AVqPAAZ7ljQjHg0kIvaTbxnYuLNcf1CCBGU
         UOVbL6cL4YsIpak3TkaOk84wA4XEOWmBLQQ3+sMztr8psOOmTGthRfoIAfLNN5MeNau8
         1bP6hqM2wmULBjjEYPZZ8iULGIVTM92EJ5lkJZMuU+QggVcc8K8WVeCzEoD+2fpo5qTP
         VYdkOVKXIh4AP7zHI2ZplOqwKrGp5Cv9vr81oIg19Fsu5XOqWBH+tMpLMUmYkF7AXREz
         WzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483498; x=1734088298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fItchsX+7kV6kUOaIc26h980oXg2fPlxX5pENy/XsUs=;
        b=KVHEDYfFDr8KllIsNwuquEO/1MpW30uXetv2ncBKZzWc8v7Tl/8cwzM2+41lW+77dE
         Ofe7nMuncUhfCBdohttgjyhV/T1HZpyDkj3Id3HXlvGVFBY/KA8sY2RfZGlQnOvJ6K0j
         IQ/BsEOmdSSnwkA9AGFiNXvsqPih2Qm8ugMIRWhoF99rzjuiLZ7PByAIGFfTfX16qeFn
         OtlQxpRyU4+2fsaqhWmj8Q634WAdZCzniN73HXP8DACEe0Y+kt6ZyyTBvHG+5YGekcLz
         XzpeL5KYFkXK8leFraMZckVUE1O1riUnXE3NR5opt9DsDDNAFljZnnhCFItg6Xp0HIyr
         zG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUxWxHodZko/h276nz6Kzl9gCMVOx1OZAGdIdwpcQgOnph1o/vKzrvdWFAcaGB4qaBfHxRzE6LjOL9YxTKgWK1z84=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAay4dJob6Va8ZjFBZcoSrxSZH7XMAySPaBDD+gF5rChnGUPlw
	nAw3Ihg1vl3JG6HhOI6uKde4eN49yxo9JKYb8lfZDN+Q7+UX3yUYp+3tWXl+H2Q=
X-Gm-Gg: ASbGncvE15UCMQ560IE2Zm2CL/jQ9gv/4zMKwx2HXWDCGm9zH0QiT/pbz3Qdcd7YysR
	XYTL9sjoO7BS4vvD6cNYDzJOuw8CXHefIK9M77aFzBmrf0Tre3ENtnZ7YVCxpqFzusf7+xvwGh9
	1d5Z9B7qd0YrJfckYXLyHWpMS7tOLyz/Wv7bA3s7UQ5CuWiWDv82Yy9Pbpt4e3Fa7IXnVwGilXt
	v89a6x1GlUnGxJolA04bXhW8mUQ7KeoeFH7HkhEANMhPk0ETw==
X-Google-Smtp-Source: AGHT+IFRsSDHIpB/S0sHMgVpexDEzc3yzfGC2K42dBaYeTcuOY3LuCx6LwGczMqqLzg+JJGYspRX/g==
X-Received: by 2002:a05:600c:1d1e:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-434dde6b13cmr25013765e9.0.1733483497822;
        Fri, 06 Dec 2024 03:11:37 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6dc5:5621:fbd1:6903])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da461sm53830585e9.20.2024.12.06.03.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:11:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 2/3] python3-gpiod: pull in just libgpiosim, not the entire libgpiod-ptest
Date: Fri,  6 Dec 2024 12:11:30 +0100
Message-ID: <20241206111131.35594-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206111131.35594-1-brgl@bgdev.pl>
References: <20241206111131.35594-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 11:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114216

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We now have a separate package containing the libgpiosim shared object
which is all from libgpiod-ptest that we need for this package's tests.
Let's relax the run-time dependency.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
index 0c7e8ef93..c4be99468 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += " \
     python3-profile \
 "
 RDEPENDS:${PN}-ptest += " \
-    libgpiod-ptest \
+    libgpiod-gpiosim \
     python3-setuptools \
 "
 RRECOMMENDS:${PN}-ptest += "kernel-module-configfs"
-- 
2.45.2


