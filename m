Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AFAC4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:27 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.23544.1668873502718239066
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EDz4ovDo;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id l2so4931395qtq.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfZ5phnOz5CV1YEpgDuLY/qUQwgwkVnjt3St+vkUIsg=;
        b=EDz4ovDoVHT5ivnxoOCx1g7Frq37xLHJVWzHumg+TdvwI2fPhe2Xi27cIlPjHVBayp
         0WxPrsj51GUODyg+Z6TMHj8FCtpROdoaGyOT7qsfDSPkZU3lFdtCTtdtqM84gWXHZ8zM
         ceY4H4GP4G5s6lqzrDIJR3YoA0fZhU7Gx1tfTPS1kYHFx18vgg1uC853SzkBGDXDLh2r
         0rGlHpkC/BI3IZeL4HZuZKRTuPtCkq9z8e/UsS+WPAhAcY1YUtwRHmr9OLqewwOjYTGu
         t9aOFo6KVDM9Djj2L+jPT7hQC2lmW4e9egIFDJQ35KhcwJRxVNRdsLGXULUDkxbqtjty
         XpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfZ5phnOz5CV1YEpgDuLY/qUQwgwkVnjt3St+vkUIsg=;
        b=GFZZZj3W2YmBN4I7mfL8CV/yxm34LJAJZmJdI8o8Cwm2iLtJe1whBDgDB/p5XxLO5Y
         F46DP4NoxbNVGhQbYi33QssqWl0yhw1sju4ZD3EIXwEyUPzoLLMBne7PN5pHv2iUJVfZ
         7t/lazigw7O8knoFUDfIAg+gQku2bkd8XAqjWVz4RTA6lhl+EuagFCURUEJPX3iN6ORB
         K3vFwqaSFOZIg5H4KGEs55lT6flR1Ts9s3yid6x4MIBKbJZl7o2N8v5BchwDIxNtYpJ6
         q2JjE8pvfTrkf5acWCg68+QvAg4jPJnrWgAyV2UUD2fxH82Li2zlOS9CQm0kq+uby5qm
         jdMg==
X-Gm-Message-State: ANoB5pmM0X8JAkUGvX0gMrlEw+05B2vfIJyRtsNXfnMQrDNMHQASUe+m
	nX3Owvu2AbcgAzEUXK/RBQ12ALQXYjtB0g==
X-Google-Smtp-Source: AA0mqf5sjsyUiApGax9rWsgljG+zgM9xbDxgo+dwkJfPbZGk1n/OLE5zXu9OLZimvr6jp1HWosF+hg==
X-Received: by 2002:ac8:687:0:b0:3a5:41fd:2216 with SMTP id f7-20020ac80687000000b003a541fd2216mr11376412qth.338.1668873501357;
        Sat, 19 Nov 2022 07:58:21 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 13/35] python3-google-api-python-client: upgrade 2.64.0 -> 2.65.0
Date: Sat, 19 Nov 2022 10:57:37 -0500
Message-Id: <c147d1fa1db903db84fd833ecb00584abc572841.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99652

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a25ba3ae919f7290ba54baedd98adaf26609338e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ent_2.64.0.bb => python3-google-api-python-client_2.65.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.64.0.bb => python3-google-api-python-client_2.65.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb
index af83c1704c..4246d461e9 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "0dc4c967a5c795e981af01340f1bd22173a986534de968b5456cb208ed6775a6"
+SRC_URI[sha256sum] = "b8a0ca8454ad57bc65199044717d3d214197ae1e2d666426bbcd4021b36762e0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


