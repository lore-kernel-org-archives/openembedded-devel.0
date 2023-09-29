Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54484E71D56
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:07:58 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.29288.1696021677846855627
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: straka.derek@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1dd71c0a41fso3341886fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021677; x=1696626477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmP1LEs/PT/3ed+4Yb5HzQO7MuNCz1ENzAemTFJ9INk=;
        b=Vk8+D2yauEk9jzI3vQSSfCgbnzmrassQcTTKrL8Yfc/GtNT6ohF8JVY82Oa9GOSkCL
         2ljomDQgG/K+NYOgBlGZeXwsjuYJ0G3EIk2W2OpPXbXfzttUlHMUIWjDis/df0/jMDIw
         RqmOgEhc3ENduUWzXHHXJkd7h/Le3bfI2AAec8d7T4OxVyytxHiPeqfYVzM8BVh3nXhU
         Qp2Y5rPv5iPyxOPRniWz+MIj1D7xwXGf/w7JhS4+dRCu308w0racL8CE5yUyPnpcAgaE
         bbudhN0AyB+hMczBiRSpHmstHs9MWkvLw997raBKNy/tK1ToPMRalq17F+SKhnBQeZTp
         DMrg==
X-Gm-Message-State: AOJu0Yx22FxWS4ME4ZpuW5ePu8oR7cFyGWc60JOWUXf0IDkflj6dC4SL
	5EU2dExLqIUo2lDYolUCkG9CcRgGkm8YcxLs
X-Google-Smtp-Source: AGHT+IG9IXfscYPqbXxdOdY5YxpnpwEoDxkJ2XWgWbabu7HrmzoK1x5W3aIW55hHwi9aFQDKxJjHTg==
X-Received: by 2002:a05:6870:6111:b0:1d6:40f9:804a with SMTP id s17-20020a056870611100b001d640f9804amr5948418oae.57.1696021676558;
        Fri, 29 Sep 2023 14:07:56 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k12-20020a0cf28c000000b0065d0a4262e0sm1636113qvl.70.2023.09.29.14.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:07:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-google-api-core: update version 2.12.0
Date: Fri, 29 Sep 2023 21:07:46 +0000
Message-Id: <20230929210746.2125480-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 21:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105268

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...gle-api-core_2.11.1.bb => python3-google-api-core_2.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.11.1.bb => python3-google-api-core_2.12.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb
index de2bd3d12..28c6a7989 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.12.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "25d29e05a0058ed5f19c61c0a78b1b53adea4d9364b464d014fbda941f6d1c9a"
+SRC_URI[sha256sum] = "c22e01b1e3c4dcd90998494879612c38d0a3411d1f7b679eb89e2abe3ce1f553"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


