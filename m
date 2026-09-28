Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7DBC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 06:45:20 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52668.1790577918303920481
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 23:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ep9uLJJU;
 spf=pass (domain: konsulko.com, ip: 74.125.225.141, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso15402065e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790577916; x=1791182716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zs3c6CK1AuhSEqK8pv7dRJ9i/RKY8CDZmNpDN2KPGxQ=;
        b=Ep9uLJJUV76oyNgpXFVkQRb9v7QqxfnY/mexxGQkA0m6xzoymwNKebAtqYF/tsp1HE
         aX2158Jhlu+9LYPS8lMV5e1izV70EgjDq2TfSaf3Q3c0pEaZmkK3l6zYlxJ+LDCwxjsk
         f7wotbbl9kSVz9bQS9yxc2E6+b2ovPe9XhCms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577916; x=1791182716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zs3c6CK1AuhSEqK8pv7dRJ9i/RKY8CDZmNpDN2KPGxQ=;
        b=Fuycb6Y5ICeVvkmjKhdjP3izi+WAhE3q3rQTgqfXlm/WrBuQYb7HIkutjdQUPW25gU
         K+2yX+RxJMNCVucslhp/KFwmWA4kMJg8SQpL8bIEdx4HE8+EE+iQ3rO7HI5RD9aQTJO1
         fRdNJ0SzwYii0GlgvloCQpwozLhl2QL7BdOcMsByywLkkKomb6Rhdns0DXV+zLt//Y8h
         ypqC3ZBG3eMeB17bE5z5nocmJ7rESG9cWeewfXah5MbzTHJizj0j4/Cxf+gMZ1CzsqXN
         LGzbJ8E2dBygbpk7dx9fJeU2gIqNqFMqCIajIp+FK6/8q2lsB+jNlXSn50Kwk0nfw6NI
         IPlA==
X-Gm-Message-State: AFuF++kbFoaXe2ivkuUBuWoi6K1JQ3dmT8inWhdw2PKDAjRlJ+8SFXZc
	0giyxnD3ifeCdVLZ6UfsQPZ8DY2+EDBMJU9ZuBq2z5W2CaH+3UKiJpDQVghP6a5ok6Vm8CWzJw6
	B6Rb7
X-Gm-Gg: AYBFou1+kh7MR7LMPGfPQzcUFFVmDh+Wdi2i5eraYW+uO9JaO8yyAdwDRMxIWgzRbGF
	6Aqr7es/pUWDn2r2LeM7WftFaoz2+EnOQUUTyVyexLRbkSKqnF8lmcizXbW5DwfuftsV3rylJ+A
	YOBK2lu4EoWNThPiOMmPRBPZGCdU8iey65WL7BlrtYUU/Gs/0c7siSEcvbDROTp3CiUo09BHtDv
	U1YutXTwO8+wEOjQxkn3M95sgRq75k5qmK9b9T65Mlp/JNwlxOJhNnBhKVWgsm6rNV/gxty8icT
	DyV6TjSLFxZVjX6ksz9QJYFhIb3lK2lTD1HkYXEQB2dNwwHo7KARWdy/3U9L9hIVkrsRMkxN+rc
	s9O3Cr8QgJDbR87DZ4tJZL01Rnh4DXJe1+HfbIUURrptSomKHwyXtJ1cGBIGloTS1d6dQ6NraYG
	tvp+zhgQTOvlkx47Qti133g3qy7SwhOjEc5Mb7+hLTiB9QS3fvB6nCCEETj7I5IfSn2zwGnJRWn
	jKmw3cEe/4lWOf0Y0IonIuy3VGU1hr3nLZmyNDo7NNPfkHrhkqzfEH8U4S3YD5DZJEFItxT9yuG
	hDnmwFXosHTWwhDKuDXZuYmGnEQjCiMDBA==
X-Received: by 2002:a05:600c:4e08:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49fe66d05cbmr190121645e9.8.1790577916486;
        Sun, 27 Sep 2026 23:45:16 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001771ce3sm120714915e9.7.2026.09.27.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:45:16 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [meta-python][PATCHv2] python3-pydantic: Minor improvements
Date: Mon, 28 Sep 2026 09:45:11 +0300
Message-ID: <20260928064511.2399288-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 06:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130425

Apply minor improvements:

- Do not explicitly set PV
- Use oe.utils.trim_version('${PV}', 2) in the SRC_URI

This work was sponsored by GOVCERT.LU.

Suggested-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
index 7c5dcdcb26..508414c18e 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 inherit python_hatchling ptest-python-pytest
 
 SRCREV = "001dea020e0809844e5b17666432c9135a976f46"
-PV .= "+git"
-SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.13-fixes"
+SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v${@oe.utils.trim_version('${PV}', 2)}-fixes;tag=v${PV}"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 CVE_PRODUCT = "pydantic:pydantic"
-- 
2.47.3


