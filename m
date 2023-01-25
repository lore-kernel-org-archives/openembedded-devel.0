Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9EBC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 08:17:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.40651.1674634656394950463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 00:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=BjacX08l;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so687842wmq.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 00:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ8VfuleMtpx5OjG3Dahpo88KC2JF93kyQW4rKCYEKI=;
        b=BjacX08ltvaq+72VhmkFhIs8fEQsxaOG1ctW/HpJipsdunG26oWUvB2xLVB1PP3arL
         CXDva27ajMMtzBwrzuQGJsxZys/UqN8g+K87qqKFeus1DEFgta79PqJhbT8Xxh5zYN+o
         ex8i7hWcwfPMntFIz0uXI6GSLNbf98YOvyML+5W7ZVzUMg68GNzdKmkMUExf3FBjpzZk
         q3vI+k/QM4ow/F3uQA+3GThsiI1kxFyB0PaOVqY5FySCKmZk26eBBqteu5eJZlKMjcz2
         /nqfb1b5yGpBbk/ZpCXPJELYz/15t+dfId4NAnTg8dLnGEOkHO+txxVJGQbctuwOwW/t
         EjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJ8VfuleMtpx5OjG3Dahpo88KC2JF93kyQW4rKCYEKI=;
        b=uMI7VJVGnaDX22XR5F8D0MMSb+scC58p+68dywQr20JJBFHEdxeoRMoh+Dd65rHUvp
         u3u/YZSorUbVTkx0YUzoj6wUIAmW0FFALNNfTmelAfk4kICApqE8pJ7FmD9YYqWaQmvx
         6H4Zwtmcl01qcbsTvWkR6wDvOHXc7SpO/eqLOkAi1GszsJ6inFpih9m1IL2wjjUZ+37j
         fJ1NdcWSMQ6NHf5FEQSyvcAg2Ykyc8yTlcT2tREDu32k8pLO8H3K0s3rZ65tPMWhVmis
         BlK2owYU0Zx6NHd+5tzJ30jffgwvhJMh8qQrB+s2TiqKdaYRrUJq+SqGNOHfNvmaSt90
         IDog==
X-Gm-Message-State: AO0yUKUT90HnDs7r9JpPPhLcm5abkYLI/zvj6EGRiLIXTMJQGiLPc400
	vw7Y3a/dQczs8/hfLwCwg3DOpg==
X-Google-Smtp-Source: AK7set+orbCUDFf3bwxjF4hWjKrlXl9Y961YIXdoMewLchV9uh+j9forZQ9zGi1xLgdRA9MbsxX3xg==
X-Received: by 2002:a05:600c:46cb:b0:3dc:1da2:b2d6 with SMTP id q11-20020a05600c46cb00b003dc1da2b2d6mr955153wmo.1.1674634654481;
        Wed, 25 Jan 2023 00:17:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c598:2394:efb3:feca])
        by smtp.gmail.com with ESMTPSA id x26-20020a1c7c1a000000b003db01178b62sm1044413wmc.40.2023.01.25.00.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:17:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: fix python bindings build
Date: Wed, 25 Jan 2023 09:17:31 +0100
Message-Id: <20230125081731.6157-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 08:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100731

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It seems that automake's AM_PATH_PYTHON() macro no longer sets the
$PYTHON variable. This means the python bindings build for libgpiod has
been broken for some time. As we know which version we're using -
python3 - let's hardcode it in configure.ac. For now add a patch that's
been merged upstream and once a new bugfix release is out, we'll remove
it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...-don-t-expect-automake-to-set-PYTHON.patch | 37 +++++++++++++++++++
 .../libgpiod/libgpiod_1.6.3.bb                |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch

diff --git a/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch b/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
new file mode 100644
index 000000000..a3dc38188
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
@@ -0,0 +1,37 @@
+From 3c461786feb1d5aa1ed2a911942a5f9fbc8b8086 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+Date: Tue, 24 Jan 2023 17:38:43 +0100
+Subject: [libgpiod v1.6.x][PATCH] build: don't expect automake to set $PYTHON
+
+It seems that the implementation of AM_PATH_PYTHON() changed in automake
+recently and no longer sets $PYTHON variable which breaks the build on
+some systems.
+
+We know we use python3 so use python3-config explicitly.
+
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+---
+Upstream-Status: Accepted
+
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3149384..0460810 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -204,9 +204,9 @@ then
+ 		AC_MSG_ERROR([python3-config not found - needed for python bindings])
+ 	fi
+ 	AS_IF([test -z "$PYTHON_CPPFLAGS"],
+-		[AC_SUBST(PYTHON_CPPFLAGS, [`$PYTHON-config --includes`])])
++		[AC_SUBST(PYTHON_CPPFLAGS, [`python3-config --includes`])])
+ 	AS_IF([test -z "$PYTHON_LIBS"],
+-		[AC_SUBST(PYTHON_LIBS, [`$PYTHON-config --libs`])])
++		[AC_SUBST(PYTHON_LIBS, [`python3-config --libs`])])
+ fi
+ 
+ AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 3e6e5d567..5164e7e02 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 SRC_URI = " \
     https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz \
     file://run-ptest \
+    file://0001-build-don-t-expect-automake-to-set-PYTHON.patch \
 "
 
 SRC_URI[md5sum] = "28e79f6f70fee1da9079558d8b7b3736"
-- 
2.37.2


