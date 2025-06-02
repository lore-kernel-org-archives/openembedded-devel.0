Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8A4C5B559
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:41:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.45905.1748857303211928154
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 02:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VbcL4GKH;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a363d15c64so2876271f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748857301; x=1749462101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/G6NBC5bj409FGZAxQWWF29w7jFATezNl13xwVnW8U=;
        b=VbcL4GKHeYVgaolNJbEsGxjX8pivOby071RYDCAuOe0OH9V467mvIticyrOotkTR/J
         C1+ba4+bVc206JF4W8y/DJ2Yb2BkPiWx+0zlQgY8EmXvIHbKDs0cGSfvR9wINlM0T3Iu
         /5bWD/EL0bHfagq4m+kWIi9uHykGycgvYtKyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857301; x=1749462101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/G6NBC5bj409FGZAxQWWF29w7jFATezNl13xwVnW8U=;
        b=OfbbJVCFJ8iN/9x2z+AwM3tg+Q9PfsS/OwrzMZkaT+jw8Yz1P1vEO9vSSZ9wsGVOU1
         5z+4l6VX5w4MCqx8CY6SwYFLdr+zo8VdGbN80NDzPRenDwLzhCHDq+TuneqPHDKUNgwy
         nOK+yMFKEP1uoKGLWrojFkbcm5EgwVxsFlrjtnoKmHc8ju7kzba+g+nL1JKrHgX/VwvJ
         e4EpXoDZWbk4ymieOW4msPRfOffpNPxgeUegu9rbFLuI8/4Wi06xH6mgKuI/4LBjqEbh
         ONeMO8DtrjBRI2f7ZrRMdeGCQEsgWrs5GDIzjv85kYmSwrCP8L4e0IBBQyQ30Jw0Ma5E
         hIqQ==
X-Gm-Message-State: AOJu0YwN6bBj0Vu5ULICo6ZCKWt9FLE9driA02s7P/Yd/d4WNvjaMidi
	CiTP409l8SeZIwmF4X3QZ8pRFWObjTFKE1GvQAQeFmLqrPoRAjUbCb5SQLpYb+7edyCvKmOouU7
	XqR3G
X-Gm-Gg: ASbGncsMbSpD8tCGuwlxxO5vY4uPQ6hKFtKCJMymvpqTZc42fu+hw/P9ejDdchukPDl
	HAHxT3MEdwK5xywx3sXTfrMly/FKQks8MZDx95V29xuVAwZoutjMCc2yaRyHCHzFGhudc2BhJHK
	L5TqUpmsKE45Zpuz7fm1g04kt2d2jN4GRStz/vCAi/FqeCejW14fV3d90O7sOiSzDkuWrrr429g
	xGZ5FH7YFMRlOkru/ycijjn18Ra29WoWY9oCotJsLJ98BSWej6NNvs424Ept3OnSSABLkGRwb3U
	2srRjZck+SQFep6ZeBK/RU9vB7k5iKnSKAa+CanRGaPpYmGthCtNwijzTBqcxnoToNA4ZwQzqEA
	S
X-Google-Smtp-Source: AGHT+IFnuYY+3wZe7qMhXM4vihvLLITzSYtAzhc/+p2w0NGszn4ytbkoxK2X4uxgLn81gdgdqb+PCA==
X-Received: by 2002:a05:6000:4009:b0:3a3:7bad:29cb with SMTP id ffacd0b85a97d-3a4f7a7ced6mr9076755f8f.52.1748857301468;
        Mon, 02 Jun 2025 02:41:41 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm14025417f8f.41.2025.06.02.02.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 02:41:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-coverage: Upgrade to release 7.8.2
Date: Mon,  2 Jun 2025 12:41:35 +0300
Message-Id: <20250602094135.830557-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602094135.830557-1-leon.anavi@konsulko.com>
References: <20250602094135.830557-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 09:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117701

Upgrade to release 7.8.2:

- Wheels are provided for Windows ARM64 on Python 3.11, 3.12, and
  3.13
- A number of EncodingWarnings were fixed that could appear if
  you've enabled PYTHONWARNDEFAULTENCODING
- Fixed a race condition when using sys.monitoring with
  free-threading Python

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.8.0.bb => python3-coverage_7.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.8.0.bb => python3-coverage_7.8.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.8.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.8.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.8.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.8.2.bb
index 9c4330a361..9438d2f32c 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "7a3d62b3b03b4b6fd41a085f3574874cf946cb4604d2b4d3e8dca8cd570ca501"
+SRC_URI[sha256sum] = "a886d531373a1f6ff9fad2a2ba4a045b68467b779ae729ee0b3b10ac20033b27"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


