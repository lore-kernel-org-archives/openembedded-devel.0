Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A45C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:19:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.31052.1723029527643503635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fM1up9Rt;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428e3129851so11357525e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723029526; x=1723634326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AE0Rj7ov3MGY/YWG5STL5JxWFW2FsQNItugVTQ7CVPY=;
        b=fM1up9RtDOxRD7ApJsKUCJN9El8bKVtzSLHOEDs9ntZTqqqhEWLdjTVzgq8aiZOei2
         5qzw1KItxF2QFiKT1mjWm106rwvbPXdfZnkoIKUqj89B/Fje46J8WGls3qfAzWD8QQlN
         8kKZvP4NIXoCU9ADzMVxFBkEddVZ3Kiw6OS0JSJIY3MDdzhufAbA5xfVS9GZri4W+EHA
         t3F1G3X810jANq+4D889O8MGOQDdC2/NFhh33cOtwovM5EPBXIjvIVGTlG9s5n3JyRbq
         mcB5S2iKciRwebVQzZ6rpcgQsLg+2ECSRKH/FMS1VDOxms1yvvLwodBOf0r9+LqP1xxC
         +pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029526; x=1723634326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AE0Rj7ov3MGY/YWG5STL5JxWFW2FsQNItugVTQ7CVPY=;
        b=VIe4/sXOXeNtrn051wtbzfOJ6QuT6QP6GWjbHCrIG40x7h8MwzWfMWMr2D96sJkm8a
         sdgd0/lrPk+cBCNcz51SMzWzJOJ6HI7/jpaubUR38tpgZispx4TTUaKsk8cbNgghn2M5
         DFuy39Vaq7QS+MnTnDVf3b2Y7jAcyaTo2+EvlWhzszFSqbbqoY9thilC8OIUSYQwQgh4
         1q6jJR7xGrWuX1bZQehe80oYQxNKe2OsnsHGeXvHmRtxQMhWO0+waYXGGkW5lLs2agmY
         bnG49caeOqPoShxJCg4E+qWTOk+RhtXnL4Rk+KRijhfirLVaB/AGtmn2MByndQTG8pDN
         5Edw==
X-Gm-Message-State: AOJu0YwKv/Dh5OFvDyUizD7yqRKTpaUINdBurNoumqRuniFm2+TjawoG
	dgBUrIhw0XCK8sDVSmnaEuJ+oAk6BmPIcjRoDuY9TOvmBF5U27VXlw3GYXfM
X-Google-Smtp-Source: AGHT+IGozxMB+16CC0erztD8Gz3Xv03kgT0urE+2heINiFl1ME7gwTPnrc1qgY7M9kWNMBPPRB0snw==
X-Received: by 2002:a05:600c:1552:b0:426:6822:861 with SMTP id 5b1f17b1804b1-428e6b925c7mr118916585e9.36.1723029525312;
        Wed, 07 Aug 2024 04:18:45 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd0597b2sm15645104f8f.81.2024.08.07.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:18:44 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-brotli: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:18:42 +0300
Message-Id: <20240807111842.57452-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111612

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-brotli-1.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
index 678f12b73..542c8640d 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
@@ -8,10 +8,10 @@ PYPI_PACKAGE = "Brotli"
 
 SRC_URI[sha256sum] = "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} = "\
-  python3-cffi \
+RDEPENDS:${PN} += " \
+	python3-cffi \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


