Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200ADC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:06:19 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.31860.1723032372549041560
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4ZJXJh0;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso20157741fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723032370; x=1723637170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v36bBKvtlmfekP5w+DXzqyQc2e7uQhNqb0XfZYX8ezQ=;
        b=d4ZJXJh0uEX1HqfncYXlO85NwXVbb+kSyJpUSK92XQkTyxZUtGpFrr7Zw1BCKF/JtF
         sKKqYPs6pXszKpXtZyCph2qLhQvDnEe2zqmBp4V14FKnoMbEa5mcSml7mHeicj6tLVJl
         1jfhPi1k+lPiGYFBIbhJFsOpbb+CJ6GF30oBJ0ghpFtVAFzKMA1IXzLqvuKQ8/V6OtWp
         VY7K20VQFlV27MQpcRZbIZQ+LspxUiiyQRJcq19uJOR2mW5MTf+KNdZ/dvzKR4VOlAOO
         OJ6huHoht9SzjTLmLA9lx/tqavoE995HheAiSeqvi3vX6kqdQWaIXNePcilzaxTSHOrq
         /n0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723032370; x=1723637170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v36bBKvtlmfekP5w+DXzqyQc2e7uQhNqb0XfZYX8ezQ=;
        b=e2fgQBTkxOF3CPOVkAe5N/iXZISoOnHoxKz3n6OUUyruLxJo0NcL60tbV9gXZjzMee
         yZ+K8Vlx78OAN5hBNPkoe6FgmLFm3YXOwJPWenEehdozmp2vLshgXLadcobxklzyOLLo
         sKy3hi/ZB5mBNo/POcmLwvzf67lo63BHSpVQLinhn1XCjWKFFExbzDGnU2SsDbbm1BQ3
         JHDkRwE2Lsf4JnlbWWLQ2F1pvv1WmhqR6e1PYbOFT1sQXnwht7gpLNYpW9FdwKrcJ0Hf
         61g2oLamQ07kKELaTYSYJql0dUbL3Cv+EoO+OGBWCQjPQhP2gP1flpOfp8wslCSGHiFg
         +jJA==
X-Gm-Message-State: AOJu0Ywvw1BIY2Ubj9B5yibqjrFvcqrYnc58Hex6+UT6PPpVWrhb3SM8
	VbtBtBkT+abSH6xrVoeZB7+fpr9oL40+zmWaGzvDGk+ue4H3rRjJAVgTHXJu
X-Google-Smtp-Source: AGHT+IF8Hulegj1G5eR7ItXchOxCYqkoHiJ/5UGl9f/ghynP+g9wGZHh9hlRIpEwv/EH6uZE+6/GdA==
X-Received: by 2002:a2e:984d:0:b0:2ef:21a6:1d72 with SMTP id 38308e7fff4ca-2f15ab3ce0amr120962861fa.48.1723032369662;
        Wed, 07 Aug 2024 05:06:09 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36be1daa030sm7391179f8f.114.2024.08.07.05.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:06:09 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pyproj: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:06:07 +0300
Message-Id: <20240807120607.100527-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111622

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyproj-3.6.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
index a4121c393..799096d6f 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
@@ -4,9 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=873757af01d2d221eedb422c4c1dd163"
 DEPENDS = "python3-cython proj"
 DEPENDS:append:class-target = " python3-cython-native proj-native"
 
-PYPI_PACKAGE = "pyproj"
-
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "44aa7c704c2b7d8fb3d483bbf75af6cb2350d30a63b144279a09b75fead501bf"
 
-- 
2.25.1


