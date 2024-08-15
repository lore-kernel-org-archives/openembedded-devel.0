Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E838C531DD
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 06:31:07 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.117290.1723703461950219501
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 23:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HbwwlAUQ;
 spf=pass (domain: konsulko.com, ip: 209.85.167.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ed741fe46so629291e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 23:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723703460; x=1724308260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNZmB8JeL5BUwkZdsWGFVmhs63EvGCFctUq1BvMgR3c=;
        b=HbwwlAUQUpqu/Rn8Sl3kt7ea78e0BSLkjYEJYR2QlotYA6f8XqH4o3+SFDKp1DJVv+
         sn5g8RPMl57iZc7vuPp5cwX/J3KQ48/QLGUtDFxRW1ijCIw3uUzD4XLd4yYHliD9wCv2
         kLnPI+9GUsJenHjRgx6YZIfUJFTozCD9cK1Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723703460; x=1724308260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNZmB8JeL5BUwkZdsWGFVmhs63EvGCFctUq1BvMgR3c=;
        b=rLj0SC8XJV0J5WKvxMmhwdtZ+fjJs27/JCJiykmgQ5QRAltTxT7GQ1z7AfjUMmVs42
         VkeCUWAHcwSm8BVSVIfDqjWrN9ztY1tp9NX+wo1EabP4DqGvKWouj8i7LnoYAdy4cUsj
         6xQ6vEA0GA78EvzhVZuZfDg3Er2PJKvRvkqsCtGA0uQF3gpI2Dx6IDp72WQA2CFtKrAg
         SYuR9gC0XSHh0YAU+fZnoXj433n52olfuwJIXibrrzreKgVQpqasUIUjzk8ldLFNrKvf
         diuzTO0cs5y74JgnaxNv7SYCSjdrsAEGsBSdgk47fnkQdBItPjvQJUbh5APQ6oKNd3Yb
         QEvA==
X-Gm-Message-State: AOJu0YzU6Ey8mmVTHnMMOF9vjEPHqvBeGcdv5XiJExI2uG8q55VsHZRQ
	h7E/j5KtcmU27hINTm+fpRgLsIVcNn2DZqOqHeESk8WSTQ9Wh9CX/8Ys/3VB4xbuwlfLr9kR6SI
	M
X-Google-Smtp-Source: AGHT+IEBrC2ZhgW6i6jectxR+iwx9v4ByilJqledoEJorOqXHcM0z9Q1bUVIH9qT3tpN4hFFgy8PfA==
X-Received: by 2002:a05:6512:39cb:b0:530:e228:77ae with SMTP id 2adb3069b0e04-532edbad7a7mr3401701e87.40.1723703459371;
        Wed, 14 Aug 2024 23:30:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a286sm707174f8f.54.2024.08.14.23.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 23:30:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-astroid: Upgrade 3.2.4 -> 3.3.2
Date: Thu, 15 Aug 2024 09:30:55 +0300
Message-Id: <20240815063055.2088675-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240815063055.2088675-1-leon.anavi@konsulko.com>
References: <20240815063055.2088675-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 06:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111820

Upgrade to release 3.3.2:

- Restore support for soft-deprecated members of the typing module
  with python 3.13.
- Fix a crash introduced in 3.3.0 involving invalid format strings.
- Add support for Python 3.13.
- Remove support for Python 3.8 (and constants PY38, PY39_PLUS,
  and PYPY_7_3_11_PLUS).
- Add the __annotations__ attribute to the ClassDef object model.
- Implement inference for JoinedStr and FormattedValue
- Add support for ssl.OP_LEGACY_SERVER_CONNECT (new in Python 3.12)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_3.2.4.bb => python3-astroid_3.3.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.2.4.bb => python3-astroid_3.3.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.2.4.bb b/meta-python/recipes-devtools/python/python3-astroid_3.3.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.3.2.bb
index 056b37279..e5f05bd0e 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.3.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "0e14202810b30da1b735827f78f5157be2bbd4a7a59b7707ca0bfc2fb4c0063a"
+SRC_URI[sha256sum] = "99e9b5b602cbb005434084309213d6af32bf7a9b743c836749168b8e2b330cbd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


