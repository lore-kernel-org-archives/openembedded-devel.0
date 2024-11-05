Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970AED2C125
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.19630.1730817427774751293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yg9ouyt4;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e5e5c43497so44349327b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817427; x=1731422227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfAfRNa1a17E4UlhDbqL35x6yj5zKZf5Bt1SOJ50AqI=;
        b=Yg9ouyt4/pBKYsQXdPsqLEbzfeWZNvc0t9gujr+ABNA4568xeRVSYntbpuf0sSJtXY
         /9ZsW7aBCbWEOkGG3IoJCkZk/gDEispZQK4oarryshN6Ahog8SdmxeqTcmwk+DbT6SOH
         mjZnvR4LC0WnYBFR5sJYEAQ6IwcwOu1xZz+do0qNRkYJ9I/8tRKy0iIG/xWbJHMeYZGD
         qCGL4qsFDTjekguCUUnFhdlMu6Qp495mHN8ZibBQO6a7J0Qn9QDvGGOtnorprdo7/fXZ
         UtS2lW9p0RnsCt80EhA0RjTxiA5amYo/pleW2D+lGDlHJGW3hBIKa9U1lF8J8i9qPjqT
         FxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817427; x=1731422227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfAfRNa1a17E4UlhDbqL35x6yj5zKZf5Bt1SOJ50AqI=;
        b=cUDuPiENz6EseAlGedxtEWA3e6R2jqjJY3OJzXE5adWe+0KcbXSp5xOdCvFPXIZ0Bd
         /yhb/21Cm8Q1JWePTVEa3bJOKn9NVe1EQAYZ5USc2/qkd9AsMLwejkS7J6sLP6IAsWIv
         H93pUPBLoziABEDuSxuE878GNtIX2cGNEr9SwPpWIMk+88juHffhF6jWv0ukLotWKBnR
         XxcJG5vFQR0LIw2k+8OsWLZWCxGu5gSC5RyODwHPAI5EnEQHIN43fUtcD9PAMxJsr3W0
         5a8z5VwV4LycBp0FnnYBW5nLa1cFCqEZj7/+csnUvE0EpEeziKbVu59km1EFfKrOeZsQ
         j6KQ==
X-Gm-Message-State: AOJu0YynBvk8zpV5Vu0uJsD/As69qMSftbolmnAgRq7B3IJR9tqjFR6Q
	gmo1xgFcsXjsR5PDh8A4b8OAEBhV/aDwCZM+z7o5GT+Nw+T3gwcDIvJuuw==
X-Google-Smtp-Source: AGHT+IEyxSeZnYRITwZP6DcoXd9KrQ2CSMimgE4HPu/64qOpP9j9GpVMIl1B4/eBkCJGyt/JoXlO/A==
X-Received: by 2002:a05:690c:4989:b0:6e5:a431:af41 with SMTP id 00721157ae682-6ea52540af7mr200460027b3.38.1730817426872;
        Tue, 05 Nov 2024 06:37:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 60/90] python3-alembic: switch to PEP-517 build backend
Date: Tue,  5 Nov 2024 09:35:25 -0500
Message-ID: <20241105143638.2301245-61-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113478

From: alperak <alperyasinak1@gmail.com>

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.
- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as alembic, it is by default.

WARNING: python3-alembic-1.13.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 207266f4c08f7de1bbe70f6d9105f97533df2b5d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
index 6f8fb8c334..5a276539d6 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
@@ -2,12 +2,10 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00f8f5c8aab58c3e1cd61525a6675174"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef"
 
-PYPI_PACKAGE = "alembic"
-
 RDEPENDS:${PN} += "\
     python3-dateutil \
     python3-editor \
-- 
2.43.0


