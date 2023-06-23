Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F58CC001E0
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.203.1687531204764071194
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=xd+mgKL1;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f9b0f139feso8979405e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531203; x=1690123203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56a+TtA/43hlKUDfP6j66MC3RA8BXrHAxnNq5ym+Q2k=;
        b=xd+mgKL1DKAVWDczKv8nZWYunzXbXopk8QaHApxc5edWQIxaeUR+jsVQY87XKU6wAS
         MLmHxy5t95O3j8suxqm+XO8WJcASRXwi+u0ZJMnTUOxLxmzwZy1dK10FI7Cfn6wz4FVq
         BeyhdGObIZfeYTperZ8TQG+AS2miXyuX7qp8Br74jmdRVcLKdnHllvHcKNrMZLcmNAUf
         P09ZGm8XsD5+gYAJDvmDTp+WJZba0FdPcybz33y+dwzjNE5WX8x4S9f7fhOoMTEsE6n2
         V3EhZ9Jeqt7ffCALK55o398+B31RY+wCECycnC6dNrNr07Gz8ljBJAkutBgKapYEW4BJ
         A9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531203; x=1690123203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56a+TtA/43hlKUDfP6j66MC3RA8BXrHAxnNq5ym+Q2k=;
        b=Vl/iO70HYEaqdxbsWcbbOQUjnLtJM7fOUhjerw55xLpMDZebi1qMZq2X6ZOwIEGbvH
         d2LK2I1TwqhXkUV+6SxuYCOT7Yw4AplOIcUqUWC1sLTsceuQIfOJK+1ubxPOBt7kDrCp
         +Tf7YheHzXwZ51/EoeGzpnwJr6OUErPPA2pTnH3wgpThXK8Epg/Lqh2LqB53lwL+AmH9
         JZthOvSOfpStfqo1tgWKtko5aOHCkB7NKvrPvVUNzs6IFl/0moJ3EY2JimwhWV1l5dpa
         xZv2Skh+/2H3eU9NT6AC16mBgAKuBAAaOlJbzwHt/ETWRegecoSCMbZ7vAV1HapVOpoT
         FHuw==
X-Gm-Message-State: AC+VfDwup7OkDmtx9KoOWNCO1Nt9hMF2lufrVE+8j2IEI+2v19GqaWwq
	2hiEbp1yxcHCzAEOKj2fnrkHaA==
X-Google-Smtp-Source: ACHHUZ6CGWumi+0qgn7670XfTK+8+w4+YIFUY0IZmUxBJoQzZAd7cA05DeWECUN13FfRvFylAMU8qQ==
X-Received: by 2002:a05:600c:284:b0:3fa:7dfc:411f with SMTP id 4-20020a05600c028400b003fa7dfc411fmr1119057wmk.23.1687531203337;
        Fri, 23 Jun 2023 07:40:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 31/55] python3-flask-script: remove recipe
Date: Fri, 23 Jun 2023 16:38:57 +0200
Message-Id: <20230623143921.146338-32-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103527

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This package has long been deprecated by upstream maintainers and doesn't
even work in meta-openembedded due to a run-time import error. Remove
the recipe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 -
 .../recipes-devtools/python/python-flask-script.inc  | 12 ------------
 .../python/python3-flask-script_2.0.6.bb             |  2 --
 3 files changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 982e41303..b23d24c6d 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -137,7 +137,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-flask-nav \
     python3-flask-pymongo \
     python3-flask-restful \
-    python3-flask-script \
     python3-flask-sijax \
     python3-flask-socketio \
     python3-flask-sqlalchemy \
diff --git a/meta-python/recipes-devtools/python/python-flask-script.inc b/meta-python/recipes-devtools/python/python-flask-script.inc
deleted file mode 100644
index 3a7adb32c..000000000
--- a/meta-python/recipes-devtools/python/python-flask-script.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Scripting support for flask"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e686048adb69341fc8a08caeda528b41"
-
-SRC_URI[md5sum] = "3fbd91fe13cebedfb2431331f6eabb68"
-SRC_URI[sha256sum] = "6425963d91054cfcc185807141c7314a9c5ad46325911bd24dcb489bd0161c65"
-
-PYPI_PACKAGE = "Flask-Script"
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-flask \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb b/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
deleted file mode 100644
index 9f885191b..000000000
--- a/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-flask-script.inc
-- 
2.39.2


