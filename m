Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1890FC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 13:52:37 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.25842.1639489955739278828
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Mq9uGZ67;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id m12so28414585ljj.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5GR8woKADn5PpmYrV+eN0kr77s2Uze9QbgB/je3K2XM=;
        b=Mq9uGZ67z2yufQuC2yGG3y0XPHIyh5eIqBYiRCn48mo6h3tWZjhr9D8yl97q4a5LK+
         kJAXOYoBHTEUHDperJ8HQ/DpcJ3I+V0f2TJqvd2vC2sB2CdbHBhlXm2Qcd8VTmBzxyuZ
         gFlsUCOsTkPqnm//n4iy8PZrzIK8XUBgc2r1oOU1/WUo0GFZ+bi9PzbmzlOQJ6jwXLGD
         5zVLnhEFLPP2KX9F3bkOMBvGNqJgF5yFYCuZrknLAeeQ0S1pytMXan18shxxW+eUPUSj
         7lv5rAMKDnrab7evYWI6NHw53GHPJFq4feT0w6jD3RkFJLFEGlTjQzZuhpLLVj1NotcF
         fliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5GR8woKADn5PpmYrV+eN0kr77s2Uze9QbgB/je3K2XM=;
        b=xzCBrmEIkyUlxqsyAVRLuc84WdEu8h7kLlMy3WkzOOkNltBYryXRrv3TL/n4Gq+JHu
         fJQwMGpNHzG3K4G7wiwB7NYun2+AsUItJK9y2qAmIyJg37xEUSTeW3xrhYbjqkiPl/Ac
         PgG50mjcD2yDIKxGxp5XkBDprbYgdxN6vMcFFOOTnJ498Zq8A54GS87FHsbePy8Skehy
         YqUg874ZTqRyvi5sqQxjPY0ltwaxcjCXBRM6fcSB9caScVSgPI72cUOo8NZc/VJWSPkq
         Axx9E54lwjg2nqoMzK49qyz4iCyqfHUBWjDxvwgdnVLpgkOo1e4sjd9gPenxmucc6NB8
         pCHg==
X-Gm-Message-State: AOAM533YMaxA2vwiqgLFaj+nDZZucQ61eMFIOWyBYkBx2fB/zJ0zxpb6
	d3eRrCzDw26UFIJWdN2fMIxER9lf2afpuWir
X-Google-Smtp-Source: 
 ABdhPJzovCWyFbT7gFL33eTxSLaJKXuqQlYbvMue8ZUdhsjSIBOh8wa0qJU5zp/a+jn7/ofwCJ6dIg==
X-Received: by 2002:a05:651c:50c:: with SMTP id
 o12mr5164564ljp.88.1639489953046;
        Tue, 14 Dec 2021 05:52:33 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 c15sm1869579lfb.40.2021.12.14.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:52:32 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-twitter: update 4.4.0
Date: Tue, 14 Dec 2021 14:52:30 +0100
Message-Id: <20211214135230.1181395-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 13:52:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94354

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-twitter_4.1.0.bb => python3-twitter_4.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.1.0.bb => python3-twitter_4.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.1.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twitter_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.4.0.bb
index ac1dab8d8..2305e89af 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.4.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "88e2938de5ac7043c9ba8b8358996fbc5806059d63c96269d22527a40ca7d511"
+SRC_URI[sha256sum] = "8d4b4520271b796fa7efc4c5d5ef3228af4d79f6a4d3ace3900b2778ed8f6f1c"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.25.1


