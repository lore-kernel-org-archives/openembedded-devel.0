Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5618C04FEC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 19:02:59 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.4431.1695236573525037914
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 12:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-792965813e7so7587539f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 12:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695236572; x=1695841372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w78FE7vrBzASz5SMhJx/yfOHgA60skSmd3OsijtCgY8=;
        b=LiOSfrqVrvV18fToiaC1H7kX6sXSS6hXnQHSU9/MiOgM9z2EUO1AtbPo0BXuXfVW87
         ChRkc6Ul9+CiyQxJP5flLQtcTrSt8jc25ItfLGGRyyOfbaOBlFkU9ePxC91j9A7ktXG4
         wHRrCqKcLMlxR0r+STbxUIxOR1MWz/9ABd0O2Uhyi5/9N0FuV9kjOlf8pJlYHYjkkJnP
         XbzgSK3DCKl8FdxrZsm9ZVAGUy5iZTGcw+RJikgx8UaUPSPcQ+wcEeup7hWrbYCMKSx5
         3ep8sHD1PYwJ3qlIKXZierauXK5Zgl91+2VghCDYkSjJR84JdP+aAGR3pCPRWfrdh9ci
         gUcw==
X-Gm-Message-State: AOJu0YzOOep9Oxv+Zl+rg2vOGy5/IGie+l8sATQsKKDFm9nP7LXXy5fg
	E15m+a86M2IealrD/s6rSPBKqzcMfD3ZsQ==
X-Google-Smtp-Source: AGHT+IGow/nSVVFpFZjFFZR2Ksng7xFfMMb/NaHk7103lEbg+WhCI20UxPqklPJmO2wMWMgyQlmgqA==
X-Received: by 2002:a05:6602:42c2:b0:792:792e:6619 with SMTP id ce2-20020a05660242c200b00792792e6619mr3682455iob.2.1695236572345;
        Wed, 20 Sep 2023 12:02:52 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id a11-20020a6b6d0b000000b0077a1d1029fcsm4140315iod.28.2023.09.20.12.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 12:02:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-distlib: Update version 0.3.6 -> 0.3.7
Date: Wed, 20 Sep 2023 19:02:41 +0000
Message-Id: <20230920190241.1338058-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 19:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105024

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-distlib_0.3.6.bb => python3-distlib_0.3.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distlib_0.3.6.bb => python3-distlib_0.3.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb b/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb
rename to meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
index ffffece56..1d9d53e27 100644
--- a/meta-python/recipes-devtools/python/python3-distlib_0.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.3.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/distlib"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc"
 
-SRC_URI[sha256sum] = "14bad2d9b04d3a36127ac97f30b12a19268f211063d8f8ee4f47108896e11b46"
+SRC_URI[sha256sum] = "9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_setuptools_build_meta
-- 
2.34.1


