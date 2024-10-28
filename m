Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17656D3399E
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 16:31:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.56395.1730133052250530257
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 09:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kt9p9S/E;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so47213305e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730133050; x=1730737850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RjFle4mJBfE/LytHkRq7WBC8wfilYJoApNdFgSxz0Lg=;
        b=Kt9p9S/EwFgl0A+vdnouAD8G39u+z3TSNP3qIZ4qx9SxGzIUlm3nztpCpAMyT5WQb/
         5DeG/i8REPmfF3iGFmdMItYKNwkT0Qmh1Ii/HBo4hNiErw0xw+cDm7b7LJbagPJe1uzg
         jCenJ3Qj0jhD6WiOGfWxjBhJz+O9d8BVa1r5uzONUvoeTTY0iQfB6FnTqTEtGdiLGpLp
         FF+xSON0x25cSsH6FVHc3RQuHmPnRziLMu03g+i7WVterBFqB5Bwn/taK6led+LjuZhs
         62aYAAMa9PAPhFXn49jLvaTW7oSK2li74bdHAyedjrDx10G2e2k1ZjJL5b6jSSXFO96Z
         S8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133050; x=1730737850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjFle4mJBfE/LytHkRq7WBC8wfilYJoApNdFgSxz0Lg=;
        b=aQMd2djpysBKs0gox/PQLSixOwrNlNCdpSdTeZtdnsTJbq24t0Dn343VUWfsPv8pUm
         KnAdqIxzmZr2NmgZaSs1E5QhTz/58HYycp/mR3CNduxU8PnCMe6Qx9MkkqGvT9INeQBP
         Mz2tLy6akVZudQzATFRlqFvoF0nYFKI4j1uS4BIFlcEpaKGkWJ1H//s3555zXjuH7+HR
         u8tns6z+gB0Y01KMdkARjNeO5pu+JpNigVycilwRDSVfnZCT5Q9NHq1RwVa6I+f84SzF
         CR9wF8+g6SZ3XltYGwTRa+GG3xYJCiBAAC/j6QDy/QpNtbfHh76K90FBvLFNF5Y11b6h
         91CA==
X-Gm-Message-State: AOJu0YxWnVEd7pWiwnozdKS2R/lWL2lQFAbKHdDQ/onLhoOZyYLBWv4B
	Hr5DZ0CfLIe7VosKxjwzjnUjTNn52gkI35/XIR4WrsooZVqONv2nzA0jEQ==
X-Google-Smtp-Source: AGHT+IGHReXeHtdDl6D93q0ewAqmoWvAUc8qjf9KMR+d30pppJWK9doaTN61JZMSa3cyoTrbixl8rQ==
X-Received: by 2002:a05:600c:1d99:b0:431:1868:417f with SMTP id 5b1f17b1804b1-4319acadccdmr94011405e9.17.1730133049929;
        Mon, 28 Oct 2024 09:30:49 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f6df1sm116941435e9.35.2024.10.28.09.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:30:49 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-twisted: upgrade 24.7.0 -> 24.10.0
Date: Mon, 28 Oct 2024 16:30:38 +0000
Message-ID: <20241028163038.4447-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 16:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113261

This release adds support for Python 3.13

Full changelog:
https://github.com/twisted/twisted/releases/tag/twisted-24.10.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../{python3-twisted_24.7.0.bb => python3-twisted_24.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_24.7.0.bb => python3-twisted_24.10.0.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
index e0472d1d8..056ddf428 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.10.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://twisted.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
 
-SRC_URI[sha256sum] = "5a60147f044187a127ec7da96d170d49bcce50c6fd36f594e60f4587eff4d394"
+SRC_URI[sha256sum] = "02951299672595fea0f70fa2d5f7b5e3d56836157eda68859a6ad6492d36756e"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


