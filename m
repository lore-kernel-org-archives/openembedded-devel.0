Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9E7C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 16:44:41 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.55142.1703177076065524376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 08:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7b7f6097355so33710039f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 08:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703177074; x=1703781874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbxFx9YIVcZ13rs2l8fvus7cAFgG7WfsySCmcFNVdBo=;
        b=uuhY7IBRZmESocAb1P6XJegnnueJYZFDEl8VB6VImglpQ2jvxOgeFgbkiTD0uIjFZx
         hOPGPDBVRwfx6lQyDrEoGuYT/dMrkC7iCpdp2UNrW25r1eZPR0U7Se1xYVYOsou40LI1
         tol7goMjae6k5dVjYrfuGUmGxqsYbJ11sPVRDis6WEz8I9j31vMc0XYsHAHe/vN3H6uF
         Yok7nqmNHgdTL5ciKTvrTGidfNyubktXEGE7mYpwSMFE08zxrFpZspUZQHkqTrgQXesS
         FC81m4GDaX4WHnlfvxUr83BW6npM7Psz4bGl6ZaYD9iTp1ywuwMRY1CJiI+6ofDYwbyb
         ypiA==
X-Gm-Message-State: AOJu0YyvheHAUR8XiOJI/4nvETmVwUkUlaSLEybM+7PrK5zLI4N0UOrA
	3tPEwrwb6i+fVKpTAzigYNDM+nFKrpRWMg==
X-Google-Smtp-Source: AGHT+IGFjsSRBLI5TJu1ulUgRIA5oruO0E5Pp1WatJvFkKEwOqzxUrUkNIRQyR+FUt7FKU0FQ/q7Dw==
X-Received: by 2002:a6b:e916:0:b0:7ba:7d68:c407 with SMTP id u22-20020a6be916000000b007ba7d68c407mr14122iof.6.1703177074415;
        Thu, 21 Dec 2023 08:44:34 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id o4-20020a5eda44000000b007ba81a6cb52sm559510iop.44.2023.12.21.08.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 08:44:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/2] python3-grpcio: update to version 1.60.0
Date: Thu, 21 Dec 2023 16:44:24 +0000
Message-Id: <20231221164425.3890796-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 16:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107720

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-grpcio_1.59.3.bb => python3-grpcio_1.60.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.59.3.bb => python3-grpcio_1.60.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.59.3.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.60.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.59.3.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.60.0.bb
index 7b1631527..77b4198e3 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.59.3.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.60.0.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            "
-SRC_URI[sha256sum] = "7800f99568a74a06ebdccd419dd1b6e639b477dcaf6da77ea702f8fb14ce5f80"
+SRC_URI[sha256sum] = "2199165a1affb666aa24adf0c97436686d0a61bc5fc113c037701fb7c7fceb96"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.34.1


