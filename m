Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD65C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 18:27:41 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.30835.1747938452702702510
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 11:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iXcVbRO6;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db1bc464dso79389381fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747938450; x=1748543250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMOn6ZyXW4bRc1UmMUJiBLk2U2RlPxMEA+xoXj7u7HY=;
        b=iXcVbRO6Cbj3DgsT33a/4dq67t5DX98x7LqDTtb4pNFC/mMn1XsOi5/bwCmhg0Q+s8
         7d76/rwljVxIx/xAgGswjr5QX3AHmL7ac3TZ2FWSJZ0Oq9+z0PHUAYTo6oVXgzKhUyP9
         SZIVCPu/nMko8nt9lwIdDgxRo1V9IpYJKg+BPacdI6ew2ZodzvcwKpZjaRmvMh23kUlI
         WuteWzMK1GyxdfXZLuRbwwU9unZhNA82GXK0aX89m0/3qJrMoP9K7v9keeO6OJnrqTGH
         NBIsw5wW1zj/VN1Wvd844hGu2V8AxqdedB/oI4vOunlDt24W2sFDKbCpCrjlW49VyZ1p
         xpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938450; x=1748543250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMOn6ZyXW4bRc1UmMUJiBLk2U2RlPxMEA+xoXj7u7HY=;
        b=flSAR6NsoHDq822vchUTuRWi9p0G01jnFEbYw/9eLhdQu+9WlZe/WUYCU+cd0sDaKi
         ht/Dahdzl3G7ey+XppN0Go4G1Jg3/3Pmz8j4aYMY+qv76ASZ6Z9CVnmU+UGM9hyOKAwo
         1qaWKir6oQre4AEwHBy8uXjJUcm4cRCJfnj5MVfT9Vjq7O4jS8O4lPmgKKWSrJyr/P4Q
         k2JCeuJc7pbacDc/QPPxDG9rnQvsITK1Hjx6DltfuckLDp8OmHDOyecUDsiYtturc8Ri
         fC8ULEq5ZJCNKodIXLcmDt3v41hZbR1W+5UVUdlQdxNaem7GMEtcRDL3rGpjezlK6cLa
         A7Nw==
X-Gm-Message-State: AOJu0YzAZXCwgDvrNUzH9VBE+WMLv7C8oRjBjMDpGHcj+7zWxlcETyhL
	pXtWe3KK5/x8EGFBYvoLtLSC1Q7Gtg+OK46L/kp8m4cuk/Z1a+KHLqJqKE6Sc66J
X-Gm-Gg: ASbGncuiC4dL7pErrZx9R5Zgau0+XYM+Y97ZQIc13/3zdDYMEfmyAbiTfKMlcAI4S4C
	FxvIKbA4TqnlkwCZKilcsGD+fdP2UicuqIFNQadGS6VgPTYPNqbbZZytWFxlBIHp8JvsP5c3Bs3
	gytKS0FYGqEEtoOpOcm0vkFnaRIMpJ0zbMrI3ztiBNIhyjs/BdnfBv5nbpPJWH0080m1CxBz0Dv
	ryCoc3M6AmjpHx3pmBD+dhVlS59aw1mga69DhxwPmMPsvXZgjV+LpX1MbcYt6DCS8YS351UcnnB
	PN6S9/e/G97IzZSlq80irxlhcIaxx+turEjkrtOyRARqnguzfPewZsMtCOADUWnA4Zpn
X-Google-Smtp-Source: AGHT+IEGrqSQnqXPMurclZUlKMVheBuDfLn8iV2NRry6qBF5XwxU5RA7FziboyPh8LHwUXy6+I286w==
X-Received: by 2002:a2e:bc29:0:b0:329:23c5:6408 with SMTP id 38308e7fff4ca-32923c5663cmr51509731fa.16.1747938450333;
        Thu, 22 May 2025 11:27:30 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.152])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085d0dafsm33854241fa.109.2025.05.22.11.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:27:29 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] python3-bitarray: switch to PEP-517 build backend
Date: Thu, 22 May 2025 21:27:17 +0300
Message-ID: <20250522182717.257228-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 18:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117595

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-bitarray-3.4.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb
index 01030b43f7..36babb5d0b 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.4.1.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee5304
 
 SRC_URI[sha256sum] = "e5fa88732bbcfb5437ee554e18f842a8f6c86be73656b0580ee146fd373176c9"
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


