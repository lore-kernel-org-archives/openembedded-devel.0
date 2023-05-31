Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2E7C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:31:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9135.1685521858521079085
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=AiXSzU6r;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6dbe3c230so56193225e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521857; x=1688113857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqURZWj5DJwwzD4lDMbTKh+gk2eOj0s6sKoaawDwau4=;
        b=AiXSzU6rKVkNnjaKtbqneyorLeg6Q9ETqio9ErHQ61I9XlHHgGfLu5kMsyePUxBBcI
         RPVZiwSwl4cC65VAhAaNVOz9ZUwD+B8bK8Pi334YTyagzm3XFWZAZv2RdihDFw15Pb6J
         mUNWuFITcXqVpRQkkHVbg4l6CdsF2lDi94zkbi7N4XtbBp+IL4seW08bo9iheryITpeF
         q3qECdSizf9/5gU+PmEf5qg/Vkdn+GstDtn2ij9yODnX10xjK3ls5Ghj09wRIFsYphz6
         4cSF8DqU1nXpDoZi7JxNiqH7V5xENkYDqFuO7Q/wYagVKZx6BHcBFRmfgnHzBaMiO37d
         dN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521857; x=1688113857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqURZWj5DJwwzD4lDMbTKh+gk2eOj0s6sKoaawDwau4=;
        b=BzFTqPjBK7laLuiiJDuFVQqH0Rhrt39VxE6Sxh+2VzRIkzrCNmdHSq1Ye/C5IQEDv3
         cae6kDXC5P3p9impXzl+fRhNynDPE7w6mw6AxBp5MWlXsaXzDBKZ2DMVwkcX+oae2SFR
         x9ei/gpDmUJgF8P56cB+Z+OH6+3voIoK5KsbojbOnmShDlp+7friXGPHEU7UJiZJB2GE
         f0KNziJULFVZi4hrZq/HjsPYmbJRBxX+QXc0Ro/8jF62KZ9Skku07gkyWeXtAVIfI0V2
         d0wL+ug31D98rReMadz1hnlftCJDJOF0bCauglGbLw32U65FULFpS2DLRTL47l0tuay6
         nGbw==
X-Gm-Message-State: AC+VfDyRPLIfXRpFFuyYXAgDTqB4JRTL4g27v57Z21M9wNN37CoUM5FT
	rW/FYDYceWI2kEJEFVmCJ5lLlg==
X-Google-Smtp-Source: ACHHUZ6ICnymVnO4i7a7uxGcwRmCR6gd0p2VvY7aleJ7w+Pdft2a6+DutFMmsjSOjhJ9BCjy3uXSpQ==
X-Received: by 2002:a1c:f617:0:b0:3f5:f83:4d72 with SMTP id w23-20020a1cf617000000b003f50f834d72mr4294920wmc.38.1685521857027;
        Wed, 31 May 2023 01:30:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f604793989sm23338288wmi.18.2023.05.31.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:30:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 093/149] python3-netaddr: stop using PYTHON_PN
Date: Wed, 31 May 2023 10:29:08 +0200
Message-Id: <20230531083004.11083-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531083004.11083-1-brgl@bgdev.pl>
References: <20230531083004.11083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103020

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so switch to using python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
index ad03eec85..f3d378a59 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-xml \
+    python3-pprint \
+    python3-xml \
 "
-- 
2.39.2


