Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE73C0015E
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.209.1687531222375132825
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=FSKq7AbG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f9c88ac077so9154045e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531221; x=1690123221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMygM2PB6hnFkYkmsax/xdkPLOhohgGU4ntilxWfGtc=;
        b=FSKq7AbGmFAor+6C9unT49rfK2iyGJSU6i4J2vhwPdPTIMdWWKgNkD1YLphZXOtI4Q
         faG0S1OqrrfFvjh5dmnEBiOQFmcdnQA0UP73M3tMlJMB7Ij8RYZcIGwQkScojOkjGu6z
         3cCJazyw+bBsAEToyq/Yu3hmA8DF9rKtEdMBTqf+MHbE7rFdnyRXKEusNCGwz2cT/XPv
         vAkSlI+94nf0uS4CH/AQUkyLJ4Un/rJzeGHLJLIgQh7fcdRyLioDR+nljTUbJmJo78F1
         sm6qOwBdOgMnwk0tswxFG8qb3YP0LK9UIDoDF0+fH4pUjaYZg3cdsXVkQYBlT4HY6Ics
         8MRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531221; x=1690123221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMygM2PB6hnFkYkmsax/xdkPLOhohgGU4ntilxWfGtc=;
        b=FzkTlIj2fH5nD0BaxnWlKwaSwE73B6ccZwzTDVB4Cr1HNcxXa0NMNoZYIA1A742ZMn
         e/GM7sZGpo12TvqWZ7EpIu7TuDIoRtk4GKe68YttkUkauK6+GtzBKiQqbcoiG4N1a37k
         dz1tWPRKWxFxaoouO/tunf+j59xk4DxazpIwjAxj5kJHgETrlcXFGUt/QQc5wmlYjCvp
         i+NI5eZFBh9aO7hgE/tqVTl7DxbEnIsnmgiogBKR8exlecg2yM7db85Hwiod9ASdrDbA
         mFoMc+n2BlLfpnGekJNXSrGFiYXoxt+OIt6BNosVD2rxDgqIPUSWmB5YHx4YBQc4Xtv2
         M3Hg==
X-Gm-Message-State: AC+VfDzwxevjwW5RxpI1+mF8wRY7fQkVwCoEmGtWXc7vf3xMlYfDAE0+
	ciJ5or62KS+KxjudvWRVkCp5l6bQGhhM2g6lIQU=
X-Google-Smtp-Source: ACHHUZ63/cCtIGWBcHrbtBPYnWnV28rDzg7DGJZyB5RAXK+bs9COka+eK77Hjc4Y+qtVSqmthZRSpA==
X-Received: by 2002:a05:600c:2104:b0:3f9:988:b77d with SMTP id u4-20020a05600c210400b003f90988b77dmr13605077wml.38.1687531220948;
        Fri, 23 Jun 2023 07:40:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 47/55] python3-coverage: fix coding style and RDEPENDS
Date: Fri, 23 Jun 2023 16:39:13 +0200
Message-Id: <20230623143921.146338-48-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103543

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't use PYTHON_PN, order RDEPENDS alphabetically. Replace toml with
tomllib to fix a run-time dependency issue.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-coverage_7.2.7.bb          | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
index f625996ba..a69c05d25 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
@@ -8,14 +8,13 @@ SRC_URI[sha256sum] = "924d94291ca674905fe9481f12294eb11f2d3d3fd1adb20314ba89e94f
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-sqlite3 \
-	${PYTHON_PN}-core \
-	${PYTHON_PN}-pprint \
-	${PYTHON_PN}-json \
-	${PYTHON_PN}-xml \
-	${PYTHON_PN}-crypt \
-	${PYTHON_PN}-shell \
-	${PYTHON_PN}-io \
-	${PYTHON_PN}-toml \
-	${PYTHON_PN}-multiprocessing \
+    python3-crypt \
+    python3-io \
+    python3-json \
+    python3-multiprocessing \
+    python3-pprint \
+    python3-shell \
+    python3-sqlite3 \
+    python3-tomllib \
+    python3-xml \
 "
-- 
2.39.2


