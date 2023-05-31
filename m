Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69955C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:31:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.9137.1685521860398158244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=SGPTg8M2;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so40295315e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521859; x=1688113859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J0X0QgUrHt8MBrkSanMRUvC+CyyDHYigT9PkuQFaOU=;
        b=SGPTg8M2HTtfinsGwQZHNtv5/Hq4eJZjU2s1Zs4IqsdahSKZB6r2dT1yqaLlmPrCht
         /9URIaoaSbPTcUQ/nMRmkXjCQkdpY8LCYKT4THdLnTHZSc3MtfrLBh4RBtSg2uEgJFyu
         7eEq2arMrN65opo5QFIu6kTQc0ALk2u4DsJ+YkpY51CbMtcWHwEfHMXgXGkjMYQ6pX+m
         oGpy5v0oo6pAQL8hXay4Mj1BG54rWWfc+llPRfRrJ9ZTuELUIp1pKeGzXEbP6GrESmRY
         ruw+202K+dGWWYI9/9k40drLrFkka2y59bEJ/c8nTA7AG+H/zij4J2IElHYNGatJesV2
         tPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521859; x=1688113859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4J0X0QgUrHt8MBrkSanMRUvC+CyyDHYigT9PkuQFaOU=;
        b=NUhDnydV7hXpogRM1Qye5fJlO5spMDttw0cYsUIx0oGB88ByfHaCasvSTSfWAj4vFK
         iZstOpRq1QdWnhsJxDiX37q8A/aiq0BJPs9aQLluxTyJi8yZ5Gt1H2XlzO4giQg7aS2C
         GwvMUiMZt8HaSq9QD1zoZvx6xFNvTQW+yStOr4EBaveV7vb3YEuWZyJZYR0nHV1Ksj4B
         GyRvpvRt27yH5aVqN0Q3KepGNyonMfxfVlvAq6eOXWQyA4ylyZzyM7AazLhM1ofYwo9/
         gkTe32JObRG0Y221rKE9zNaJbWfBEHVxktwpUjx/yrw9T4tz9fVlZeBtvFgbI/69iTuD
         UScw==
X-Gm-Message-State: AC+VfDwTEOJgDKeuxvqKkszOxDdAiq85ZxsTcX1sy1d8XXFhPVRV/heA
	NORlcvf+GE3KL2XSwg8Kd/FpHsEcHR0YeZXZyno=
X-Google-Smtp-Source: ACHHUZ6zkokis65xAnVuVKolrFjK4pJmZsbOt55t3w8c3sA8HwRHcsL0e2lxcXA1BxZYDP+WB03MWA==
X-Received: by 2002:a1c:4b0f:0:b0:3f4:2328:b5c2 with SMTP id y15-20020a1c4b0f000000b003f42328b5c2mr3040239wma.35.1685521858992;
        Wed, 31 May 2023 01:30:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f604793989sm23338288wmi.18.2023.05.31.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:30:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 095/149] python3-ninja-syntax: new package
Date: Wed, 31 May 2023 10:29:10 +0200
Message-Id: <20230531083004.11083-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531083004.11083-1-brgl@bgdev.pl>
References: <20230531083004.11083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103022

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for ninja-syntax - a package that allows to use all
features of python3-ninja.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-ninja-syntax_1.7.2.bb               | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
new file mode 100644
index 000000000..9a6326f37
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Python module for generating .ninja files."
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=38;endline=38;md5=f5441d6119564d4094cf77bee7cf7b0a"
+
+SRC_URI[sha256sum] = "342dc97b9e88a6495bae22953ee6063f91d2f03db6f727b62ba5c3092a18ef1f"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "ninja_syntax"
-- 
2.39.2


