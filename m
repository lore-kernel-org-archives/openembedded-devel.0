Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80269C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 02:07:19 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.6502.1661306837314441648
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hg448CEJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 ds12-20020a17090b08cc00b001fae6343d9fso2646146pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=sBGsmvfj3ofFAnLS0Pdr+zL2d/sml5PTVw7spJlbZh4=;
        b=Hg448CEJNEWOxi1DUBsBhZwUQTUc9aqYqe9oPbNYCYZNe8zQsyvfyhN80Rpafmaj+y
         83AG+CcNGlTrM8e9+aZbObU8fVA9f/Y0PDwNvj4+mixDrgtqz5K52z1KZkHwTzBLQSAh
         FfcWrm+Hssee1PfOCbd1eZVhZvmLbwMXp3XQYTUNKyr6GvCVXVfQMo5gBygf62JdkY7j
         O4/7WRfyIVowVKiSaYqPCkcTuaoa5V/jJm9H/GErq6PbC4zGsiHBBbcRGx1rlbCV5yMi
         alLfWGQwSy0w08mep5tW5pV1aJzlgTMwY3XliOirARbSCUsMYNodRpS7wYTEBkK7Pp4A
         ivbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sBGsmvfj3ofFAnLS0Pdr+zL2d/sml5PTVw7spJlbZh4=;
        b=bjPwkVHsM1ogpULrML4ywS2ws2LiFg1ktz18fxHWrO58/MGOOyOK/ogcWZcKxwBfbt
         NB/TUlm5t/vXhpA1N7lDIAsEMF+N1pwaaDfb1sv42vqLX3DXmfGhqEM9Jdzea4Ah6mF3
         xaRLbHU9s6W2IVk1Z6BqRWOFetMwjvQ8JmhdETwqfKBHS+Hvh11jQmienBCRlkPj5jvk
         CuXyuWyWkXYTB59QM+At+Hvr+uYqkvEsA6yj9TgVp0sPuJhE0Fp3czjWDw1M3mKlupob
         cbmCRDibXLnpTW0FvDbgG34snznBKxYvsUG9PRKiBO9BrSSLX6vX8jqa3qjnd8x/g/U8
         +LZQ==
X-Gm-Message-State: ACgBeo3o3Y9QkC4NuSpJcFycL3UR82Y9ZfC4stLTVsQeexXjE1Iaumxj
	eUz5Q8dPMGvAc3t5mIJqPmDUphOMwhQ=
X-Google-Smtp-Source: 
 AA6agR4ERsn3JLvFZch2ykZvJGz3tDN7BtBUyT4KFeBsvFE51xkLxnojip9TMIVasb2AbgZeXTB98A==
X-Received: by 2002:a17:903:2049:b0:172:eb95:c61e with SMTP id
 q9-20020a170903204900b00172eb95c61emr11524333pla.74.1661306836381;
        Tue, 23 Aug 2022 19:07:16 -0700 (PDT)
Received: from localhost.localdomain ([157.45.12.99])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11213409plk.14.2022.08.23.19.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 19:07:16 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [meta-python][PATCH] python3-django: remove 2.2.x recipe
Date: Wed, 24 Aug 2022 02:06:59 +0000
Message-Id: <20220824020659.78-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 02:07:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98412

python3-django 2.2 LTS went end of extended support on
April 11,2022 use python3-django 3.2.x instead which as
end of extended support upto April 2024.

More info: https://www.djangoproject.com/download/
           https://bugzilla.yoctoproject.org/show_bug.cgi?id=14888

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 .../recipes-devtools/python/python3-django_2.2.28.bb | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.28.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
deleted file mode 100644
index 9ef988176..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require python-django.inc
-
-# Pin to 2.2.x LTS releases ONLY for this recipe
-UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
-
-inherit setuptools3
-
-SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-"
-- 
2.17.1


