Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3F6C88E5C
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:12 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12074.1789355589436338270
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VIIAFYwe;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so2166909b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355589; x=1789960389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdfR3hspc4XMllBn+YHDmeCYofjcWQ6JPF8DWcfxMi4=;
        b=VIIAFYwevAnim8l85PaGecIWxWTzFNnJwndugXmkkcalCkripDgVqTiRw1vvBfY+kN
         wItOyM02Vj5R2Jt2YpSCHHi+JQErF5pUzRIFE4NLfPDxkbaocUbf8EbT7i9uC5BsboFq
         LSE+kvgFCfZivEhvtFMxretJApI3yrRXIr1A/M/RUVh6fCWxbv0Bz3CXwUXpZI0RsqLB
         wgmVSRfqM2+dZPR/1r7V9wNXQX2Z0H+VVPtYBbeYe1fGaMVLMCtrK5L1i4ea2Ytkq9jL
         A8IKhWc2OOEA159CoM0oKar7f/rGhvO5/Nmtb8jqdIbXCz4XYkHG3+sqXqxx/rWiFyxm
         m9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355589; x=1789960389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdfR3hspc4XMllBn+YHDmeCYofjcWQ6JPF8DWcfxMi4=;
        b=P7KJZX1S1MefZa0or4xnQxilc2Rrhz8yPj7Ce5BDlQf9CmWu5TX0G5f7jLOvitCbSR
         ul9YmealMxwsit2ktqG9rUvJnihamimFAliPu++1KR4B0rFU+nzXJG86JolEQFVDGZws
         d0c6vpBnVbZENIJWPfxLu3DfJ1eeQffl0fvKtDSoAXJwq8P5Y433Uu9sGoWxEyxqIIG8
         Bi2iy2OrJyRjkzdy0ThHdQg+B1xejG5P84o2hkqoeAyDIryNkivJRqItMLAblU6Ob4Wr
         qSc66gmeRThezd9mLD0GE3LNA8S6ikYv9u2GT1exw7a66U02ETtSx4jYxfv9k3h2G4Rq
         kveA==
X-Gm-Message-State: AFuF++mzeD1Drn2Y+3Mwpn9+fBygMiJWwf9sLf9lmqpcJo7bYBSf5ojh
	iOYd16zr5NBYR/LjxUlU1I1JU/2/Lsq2do5WiyFmaFkJjkDbLRD84omJxqFtEt7Z
X-Gm-Gg: AYBFou1twH6m4b33JxFd4hfUK1nSu9A1ymQMFXm2vCogeneLwZGkmAcj+YxFPq3D/wX
	SAyYa9k1Pl1I8tDSpR9BGfOHZA73siFWfjzmxPeYO7iz6G1+E5VTGiWAhaHHZTNTueGOU/FM3ml
	6beGlcFkbWnDLVkePFPfgm+l8KE4RDRFpTGI8QXab6CCK8lqNDrWk8dJw8aHpuE3FW7aQan0eAC
	7QKx+xxjLSinAjbKRo7N8lIYkJ96mk/k+dtAaJg+J+qI2T/j0XHUDXxwYcsxzCejzpKHrra9Hsq
	IgAlEOuFzOm4SQn0BnpucJ4uYzatHo9856fmMqhJ7spUyoT1NO3ATL6oFQu9mIRjcHKyyg2RvGh
	J9ONcC/CekDdX1gVvq5IlnMBqpunyrVVjVmC8kWBmNXAbeTXtFp+/nSZjov5Mt9ajK95aMytTY5
	AU+OkxW+9petJXn9qHWuAQW+JSB+OyT8dFQO5Gc5+Re/ULjKxj4MGb682yJ+VIS1DT6rsFiJiNH
	zUATWMQQIJOmWwqNMb7
X-Received: by 2002:a05:6a00:950b:b0:869:8620:26d2 with SMTP id d2e1a72fcca58-86f82f51c34mr1773606b3a.1.1789355588593;
        Sun, 13 Sep 2026 20:13:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 1/10] python3-django: upgrade 6.0.7 -> 6.0.8
Date: Mon, 14 Sep 2026 15:12:49 +1200
Message-ID: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130009

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also revert bump in the minimum setuptools version.

Release Notes:
https://docs.djangoproject.com/en/dev/releases/6.0.8/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ped-minimum-setuptools-version-to-83.patch | 42 +++++++++++++++++++
 ...jango_6.0.7.bb => python3-django_6.0.8.bb} |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Revert-Bumped-minimum-setuptools-version-to-83.patch
 rename meta-python/recipes-devtools/python/{python3-django_6.0.7.bb => python3-django_6.0.8.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Revert-Bumped-minimum-setuptools-version-to-83.patch b/meta-python/recipes-devtools/python/python3-django/0001-Revert-Bumped-minimum-setuptools-version-to-83.patch
new file mode 100644
index 0000000000..5913287038
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Revert-Bumped-minimum-setuptools-version-to-83.patch
@@ -0,0 +1,42 @@
+From 2c7d43e13909886bbb0b6b5dcd5e718c67818031 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Mon, 14 Sep 2026 11:37:53 +1200
+Subject: [PATCH] Revert "Bumped minimum setuptools version to 83."
+
+This reverts commit 8362cdc7efc9c881fdba48ce19e89b9194de7c46.
+
+Upstream precautionarily bumped minimum setuptools version[1]
+Revert the change to allow building new versions of Django.
+
+[1]https://github.com/django/django/pull/21691
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ docs/intro/reusable-apps.txt | 2 +-
+ pyproject.toml               | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/docs/intro/reusable-apps.txt b/docs/intro/reusable-apps.txt
+index 41122dff9a..bb33dc0197 100644
+--- a/docs/intro/reusable-apps.txt
++++ b/docs/intro/reusable-apps.txt
+@@ -211,7 +211,7 @@ this. For a small app like polls, this process isn't too difficult.
+        :caption: ``django-polls/pyproject.toml``
+ 
+        [build-system]
+-       requires = ["setuptools>83"]
++       requires = ["setuptools>=77.0.3"]
+        build-backend = "setuptools.build_meta"
+ 
+        [project]
+diff --git a/pyproject.toml b/pyproject.toml
+index 1c5f5fbbe0..2b8ddbf314 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=83"]
++requires = ["setuptools>=77.0.3"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.7.bb b/meta-python/recipes-devtools/python/python3-django_6.0.8.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-django_6.0.7.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.8.bb
index 4542485154..f8a5d6962c 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.8.bb
@@ -1,7 +1,8 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2998503fc083124fb58037084bfa00de323c7c743f05f1b4284e77bff0ab8890"
+SRC_URI[sha256sum] = "cb0bd962d27fc866f3c514b20aae6a7df56ec80b488f9899da46d675cd051526"
+SRC_URI += "file://0001-Revert-Bumped-minimum-setuptools-version-to-83.patch"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

