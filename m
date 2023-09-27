Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1D6E80A83
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 04:49:55 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.10694.1695790192743009736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 21:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4180adafdc6so50852941cf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695790191; x=1696394991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woaMLsO+9He1HZGMDVtLELMuo10/dHoZZ6VAzYgUz18=;
        b=jKKiHnPE4rHAWXfH7BI81Bro1LUwTdP+U+Aj/v/PlhovdT7GuLxKff74EBzEALVCnq
         qI9lkHeHaE9kXEO+KZt92BA+dVfxFWzc1xoHEHH/+DPN4ClB9BQ1du6RWp+8eWRPn3fb
         Ycn6QBCiZb9Iwu6Z13AgICn2OfpQw0z6T68IyiNMgjnBSn1OVExX8dfTfNAkoQNwm2+p
         InzTibMZkKT6bswrIAHU/wXMeNIoxaeWdYMMUJElKhZ/JE9nEcEWJIKTSdxuVf8BwhNV
         6U8p3xuFrnwK/Yv3561ojDCGqJ2euOCX0CKagQvcAv0S+TiF8D3JYft3gxWsoy2tBgdN
         Sr7Q==
X-Gm-Message-State: AOJu0YySPx4YP0/YziTskNyLcBBjS0JNItbPXWV7J28MOcGo39D2qEbH
	RFpN9DCP72FPvmu77j/CDKvRkMihXNqn9g==
X-Google-Smtp-Source: AGHT+IH6w2f0Jl0izh9dMWeVvsl+xr3qSSuf3s2HLG6ozUS4yFXJUb5eLVIjc1YT+fRjiF+Gl5kFsQ==
X-Received: by 2002:ac8:5b48:0:b0:418:eee:15ed with SMTP id n8-20020ac85b48000000b004180eee15edmr1105864qtw.64.1695790191453;
        Tue, 26 Sep 2023 21:49:51 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id w22-20020a05622a191600b0041514d1da65sm5146337qtc.20.2023.09.26.21.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 21:49:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-xxhash: update version 3.2.0 -> 3.3.0
Date: Wed, 27 Sep 2023 04:49:43 +0000
Message-Id: <20230927044943.1682902-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105161

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-xxhash_3.2.0.bb => python3-xxhash_3.3.0.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.2.0.bb => python3-xxhash_3.3.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
index c4d74306c..e3aec9737 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.3.0.bb
@@ -3,13 +3,15 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
-SRC_URI[sha256sum] = "1afd47af8955c5db730f630ad53ae798cf7fae0acb64cebb3cf94d35c47dd088"
+DEPENDS += "python3-setuptools-scm-native"
+
+SRC_URI[sha256sum] = "c3f9e322b1ebeebd44e3d9d2d9b124e0c550c1ef41bd552afdcdd719516ee41a"
 
 SRC_URI += " \
     file://run-ptest \
 "
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-pytest \
-- 
2.34.1


