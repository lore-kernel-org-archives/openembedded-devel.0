Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0656C46CD2
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:45:00 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.54217.1703173491750646032
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 07:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35f89f18daeso3218545ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 07:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703173490; x=1703778290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3FOfDAUK+VLsE6sSaTugLgq6OIAqj+rFt8x+E/bo7I=;
        b=jurEnasMLvX4juVydXDfi9tcwNvCDdOr2B0rOearKJ2auRB6yPL8m753TvuuBqs5uq
         Me9o88ypK5xkW3rDgJxDsb5cEazTKWHW5WUdy83fsSLn3IaargQqs34l5+tRVKfC6nGw
         Rpj51nWM/GUepGi0fnRw6B7TThWMnHxCwNeQk6eUWuYlhoYwoPoAyZpwZPK0YnKEFj/r
         HiDXHpKtqvxzIUWzSd7TzozUZwLAfpDSjtiI1ddY6Tuz2mmqI3v39D1zmY+1StRnvg6s
         ZGdxy9PrSqL8fudFufVt2p4qFIcxf6XeGolcw1BHCz/p+Lb2zfyioHmBK9kBA0LHnQz0
         8Kyg==
X-Gm-Message-State: AOJu0YzVgXHadPEfD05bMPO8vdVVOuBdUBdd65EmZKZoa74dqLLFSXv8
	ALfz01hau6B2HghbLUL4ap1Y9Y4xTHhTSg==
X-Google-Smtp-Source: AGHT+IFywSmgzkXYWzMb03ZqYD3zprtzRfSY9JrmhJbvXf1nCKYgr7ETyXwSMpDYX0GjWfO9c9PKKA==
X-Received: by 2002:a05:6e02:170f:b0:35e:6bf2:3090 with SMTP id u15-20020a056e02170f00b0035e6bf23090mr26553514ill.31.1703173490177;
        Thu, 21 Dec 2023 07:44:50 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k28-20020a02ccdc000000b00469328386c8sm530578jaq.162.2023.12.21.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 07:44:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 3/5] python3-pyfanotify: update to version 0.2.2
Date: Thu, 21 Dec 2023 15:44:33 +0000
Message-Id: <20231221154435.3874910-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221154435.3874910-1-derek@asterius.io>
References: <20231221154435.3874910-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107717

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ine-FNM_EXTMATCH-if-not-already-defined.patch | 16 +++++++---------
 ...tify_0.2.1.bb => python3-pyfanotify_0.2.2.bb} |  2 +-
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyfanotify_0.2.1.bb => python3-pyfanotify_0.2.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch b/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
index 2fa3cb05d..4c279bbcd 100644
--- a/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify/0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch
@@ -1,19 +1,20 @@
-From 9e7894b97ae7afe43a9901b774de5aef401549ac Mon Sep 17 00:00:00 2001
+From 87f1bf7d1e0ca2a841706d1c41d14382f11264db Mon Sep 17 00:00:00 2001
 From: Bartosz Golaszewski <brgl@bgdev.pl>
 Date: Thu, 28 Apr 2022 16:32:06 +0200
 Subject: [PATCH] ext: define FNM_EXTMATCH if not already defined
 
 On musl this constant is not defined. Define it locally if not present.
 
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
 Upstream-Status: Inappropriate
 
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+
+---
  src/ext.c | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/src/ext.c b/src/ext.c
-index e0bbe21..7d979d3 100644
+index fb33de1..fa01a81 100644
 --- a/src/ext.c
 +++ b/src/ext.c
 @@ -19,6 +19,9 @@
@@ -24,8 +25,5 @@ index e0bbe21..7d979d3 100644
 +#define FNM_EXTMATCH 0
 +#endif
  
- PyDoc_STRVAR(ext__doc__,
- "Wrapper for fanotify.\n"
--- 
-2.34.1
-
+ #define FUNUSED __attribute__((unused))
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.1.bb b/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyfanotify_0.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyfanotify_0.2.2.bb
index c9fd07144..292ceab2e 100644
--- a/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=636a36c9df04efcfacf839b8866d9a37"
 
 SRC_URI += "file://0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch"
-SRC_URI[sha256sum] = "fd62dccdf3c17ca117e3279f0cbc65c639e53c9dec8a459d44ed6a35c1a18e60"
+SRC_URI[sha256sum] = "90219aa9f8b78fa732f24aa7b21c7bb6ac97a6eb47f1763c899b8194e23af1df"
 
 inherit pypi setuptools3
 
-- 
2.34.1


