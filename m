Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B48EC83F03
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 18:47:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.30583.1751568434435433711
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 11:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cp+cWmMF;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2349f096605so3628485ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 11:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751568433; x=1752173233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CsteAG3cPSGoza7Q6Px7D6lwetFFw/p35p/sVAWdgXA=;
        b=cp+cWmMFAit13RfFK48QteKG3d4Ij2p3HT67o7zyAYaYDbQVAc9BgP4hqG66+oOpWj
         2AgxxnjkOnBLYZY7k+gCu+FL6onZnEyGWgAKPwM0R0bl+XJOtpoCXzVdKBv00f8R7v9D
         8qACw4I0t7EoxjTQt5walHnH/4uhxsbTgNEztqRTxIXcoiuA4KJ1wUFnYaXjREcqiMwq
         ytrttI8W1um8qODtzfSbt2FYoeynFQGfZ/kgeJK7X+LyxzJ+vRuNK8A/lLGx7r8dlbc4
         7N+JrLBwKWJHg9wHEBkhQZMithFZzc3XqI1rgKWIaxoRpqVzjLLOZCNJol+kfqX/tdW6
         HmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751568433; x=1752173233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsteAG3cPSGoza7Q6Px7D6lwetFFw/p35p/sVAWdgXA=;
        b=WGlRXYtniNUH7TXmm4vqCVMaYAJM34+1MeAT3sCJ7w3vQzrP+U8cfdxxLJnHD6jYl9
         /vmJu8DbzAW4YXR/4y0ha1mj7evrF5QpeuqZD3HoxuVv0Q19EB5ipnMPbOsI36MOH2mO
         sNnspqVSXovpj1mBWnQWPwZen+ZJ0s2siOFkXRr/bIENtBz1OptjDGM7zRI8dZAXjSrl
         1HzUyrKbv7QozGCA72rJYu2v1USOXYyNHd41aidq+Lj8TQF4XkzvfCa955L42RYAc98p
         If7aA36IgdUz57089HXHuGYrzSXvQGnSFgXsfoBz2tPJIu8azB5ml+P7enoUh8tFm+2l
         +Ecg==
X-Gm-Message-State: AOJu0YwgoRNbhydzZ550RlQUxttjRp+SZ5re5VoXnXebRLZ1FHX8JwCM
	5eoOyGr5Raoe1WqpnGeIXyIRKSpeG3WUTwsyB4dJMD6PD9Vs1JQEbasQlM/r/Umo
X-Gm-Gg: ASbGnctqN4UXk8PF7GSvnfuIWmBsRo0BtMH7xrtqW0OSrt84LNR8CHbJuRe0VDtoLS2
	dss2F9x8a1L0epdo6k8+wZxS/f96BzHEox/4frR6qcdmvxHXsgfpuiSt/H81/BOTxkcrsJSUY23
	rHnfqR350qOe8pBw0e55M7MVnW+YV2YYkO4DfDDXqFr4wtFdAdyVo89eUjU+3111b7w/2gk26YH
	+PS8P/coHcHAhQYRAJ0otO+2lZmNxK+9BqYrs28VEHYe8E1GoE8yzpOETAbvnfV3/GWDaGlIlM4
	iYdoot/t3XSmxBkG1jugUwxNiCnooSyCMf5ocXnTLsShelI9KhWHzsDDj6Dt9y8e
X-Google-Smtp-Source: AGHT+IEv7igtSIZarzUEECWjt7VQ7XLNPIOU+KPCgMF+Q5Mhd6tbWBAcq0RUY/wk/L3q2bEkweLNOw==
X-Received: by 2002:a17:902:ce8d:b0:234:b123:b4ff with SMTP id d9443c01a7336-23c6e502d8emr138215585ad.21.1751568433469;
        Thu, 03 Jul 2025 11:47:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a3a6sm2176275ad.40.2025.07.03.11.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 11:47:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-types-psutil: Use pep517-backend Fixes
Date: Thu,  3 Jul 2025 11:47:10 -0700
Message-ID: <20250703184710.2598995-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 18:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118225

QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-types-psutil_7.0.0.20250601.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
index fead4ea903..146361c5fd 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ec038232ab86edd7354b091c54e190e2"
 
 PYPI_PACKAGE = "types_psutil"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "71fe9c4477a7e3d4f1233862f0877af87bff057ff398f04f4e5c0ca60aded197"
 

