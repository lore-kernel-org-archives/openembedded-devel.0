Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B609BC04FE9
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 18:52:39 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.4065.1695235958670245690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 11:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59bf1dde73fso1904967b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 11:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695235957; x=1695840757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8V85wfAWjZ4q84kX+su5b49cPIpe/i24QLOIq7NoQ/w=;
        b=ZhfGfoxaFcOc3nE/85oWn1b5CkSTFg8XL5bo6+gt460O101oI/Ql5R8qUef/me5+Uh
         2j25ZE8MbETi0/Y03RDB3HA73eT7gIHUMZorvWrnDZxt8WHz9rL31uwROK3DOnNsRkBZ
         IJs7g5K0ruvM/1k0wFK+SxI7/1pRcErSez+1fHs66USPBVV9lmhjuyxKn+8jamUaar0t
         Au4Hj/FhtYYGE0R7Q9dCPGbDwespF2390hbO3SZ5eESGbwwtVRgnfB4DkdWFB1T0AFqv
         H9i3+31wtmLA5EKz1xZD9o6b5cguDCXr4QultQDftgS4UT8N54kPdjn90FQpReznzhNh
         Xi5A==
X-Gm-Message-State: AOJu0YxagflRZb3nLm7nKhZB5Ph6M3nAwPjUwIX+YLdZn9AJzf+ikK1A
	HnUA0Qp2nuEK6ztAnuDbM+aK2kGjQYMzMQ==
X-Google-Smtp-Source: AGHT+IF0Vyiy6UEp79aaxxRHzyVc+JDCqQlUUSf5z7cpSk8Lv4mvBFVOcKeXQR9g2qR/4898/FWUJA==
X-Received: by 2002:a81:8202:0:b0:59b:8da4:dc2 with SMTP id s2-20020a818202000000b0059b8da40dc2mr3516646ywf.48.1695235957265;
        Wed, 20 Sep 2023 11:52:37 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id i78-20020a819151000000b00576c727498dsm3922827ywg.92.2023.09.20.11.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 11:52:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-configshell-fb: Update version 1.1.29 -> 1.1.30
Date: Wed, 20 Sep 2023 18:52:26 +0000
Message-Id: <20230920185226.1331516-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 18:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105022

Refactor recipe to leverage pypi + poetry

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...hell-fb_1.1.29.bb => python3-configshell-fb_1.1.30.bb} | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configshell-fb_1.1.29.bb => python3-configshell-fb_1.1.30.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.30.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
rename to meta-python/recipes-devtools/python/python3-configshell-fb_1.1.30.bb
index 7a7ecd753..aa14c99e8 100644
--- a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
+++ b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.30.bb
@@ -6,13 +6,9 @@ building simple but nice CLI-based applications. This runs with Python 2 and \
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI = "git://github.com/open-iscsi/configshell-fb.git;protocol=https;branch=master"
-SRCREV = "d74a33b69f688ed9b8b28033835303604639d4eb"
+SRC_URI[sha256sum] = "41f6b7eaa7c9ff422acdc910762fd39ef3333a365918463fef8b398d857170fe"
 
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-PIP_INSTALL_PACKAGE = "configshell_fb"
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
     python3-fcntl \
-- 
2.34.1


