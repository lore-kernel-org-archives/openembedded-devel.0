Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BB4C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.44969.1674653491218567072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eEdYUmi7;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id t14-20020a4ad0ae000000b004f51f61de9fso3133612oor.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJbrKF+NAOyPWXcIhohzVQg3D4n1LmQ8pHj4o890gMs=;
        b=eEdYUmi7u4cz0vV1ZZ5P7p+Mhb7YjLNn5BWKpCFseEAdav5NUceH49vHCHeupu8nGl
         eVLHAlHR/gWGNvPEOri7XwTjsnq0YtegAl/92UwoJRRGcRXK8GCPXchHdHD8x45Qr8EG
         AaMUf4jmmnIjYvVU0HCIZeSUiIjDbRifq+xcKoOtGEN0MB6nEmt4UTRSvzEW4rNP08/q
         R4wM6ntRiBjcDESJ2uKtGaJ9U67v1OwVwtXt9VH/S++AY2gmy8dhBslSe+H3w7wUUgOl
         9VWt7SjZLZHt9D7arQ6uT7hDhRKufunUJU/IUF2J+771PImY68xhfYBcpwKLdix8z/mP
         ogpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJbrKF+NAOyPWXcIhohzVQg3D4n1LmQ8pHj4o890gMs=;
        b=UKWk3lRxN+2enOaRfkvQZuKGtZ9Xg6lKZamTARwWcFTW+rVA6aLVifJrbbCM2Ap+8K
         y4S+vOX4wkKRdvNZChdGxmARC189tMG4sDNQcWnPOB+2z8TB49eFN4lyu5ZvxSp5FkQ0
         3BBQgpoglMrFhDfpk2lo8re6GbWikzLodCKO1Ubpak7AvlilNsEqAF7a/9+BkZrN7MYP
         IIaP3YNo1GNwaJiAHds/e/4pigMnOL3ulyRk8Z/mQocIHnmGrqLDXMNRHBlQiZbxHRS/
         VVS01+ZiRLEmJDMo2zFLgZRJdOgglLJd7fxHhEbkPh56Iqf7FhsPNzWHyVpvXMKnPHcX
         ijTA==
X-Gm-Message-State: AFqh2kqCKUwQXQXorVI8xRLjid8i6i4166au3xU3tVFA7xU9+jZlYAXL
	Ecvz2OhvThzuV3nUFmQljNM1JiyfML0=
X-Google-Smtp-Source: AMrXdXupL5F55SrqcPazKjOJ5GPZTjdLuutmK+yhjn9EF3aKS4chITdV3/0salUqmjO+kbrDbccr9w==
X-Received: by 2002:a05:6820:413:b0:49f:dba7:5e65 with SMTP id o19-20020a056820041300b0049fdba75e65mr13836584oou.3.1674653495982;
        Wed, 25 Jan 2023 05:31:35 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 10/41] imapfilter: Upgrade to 2.7.6
Date: Wed, 25 Jan 2023 08:30:52 -0500
Message-Id: <112f75b77f6698395da8dc3d80f4536317144a65.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100745

From: Khem Raj <raj.khem@gmail.com>

Use git fetcher to avoid src-uri-bad build QA error

Changes in this release [1]

License-Update: Update copyright years [2]

[1] https://github.com/lefcha/imapfilter/compare/v2.7.5...v2.7.6
[2] https://github.com/lefcha/imapfilter/commit/ce6b9050b284b9944ac52371a4a2254fc73bc219

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8299706b637b76d95716079455c276a825d6f0c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb}          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb} (60%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
similarity index 60%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
index 111a8208a9..eb23816e8a 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
@@ -1,11 +1,13 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=db3b99f230f9758fd77e4a0654e2266d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c11d4fd926d3ce7aac13b0ed1e9b3a63"
 
-SRC_URI = "https://codeload.github.com/lefcha/${BPN}/tar.gz/v${PV};downloadfilename=${BP}.tar.gz \
+# v2.7.6
+SRCREV = "b39d0430f29d7c953581186955c11b461e6c824f"
+SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
            file://ldflags.patch \
 "
-SRC_URI[sha256sum] = "ab19f840712e6951e51c29e44c43b3b2fa42e93693f98f8969cc763a4fad56bf"
+S = "${WORKDIR}/git"
 
 DEPENDS= "openssl lua libpcre2"
 
-- 
2.25.1


