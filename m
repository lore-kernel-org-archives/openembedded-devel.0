Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3AFC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 19:05:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.624.1646852746924101306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 11:05:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o8zQM4/H;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d17so3114734pfv.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 11:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2q4cxUC70qkhg+ggNgpDZk41yZFbTQseX1FlS09dHw=;
        b=o8zQM4/Hc2J+k7g0I0sm0PWUxt3WLSmMvN/wQ4Dr67Va9++OuC5/qC7gxk8VbEqAUF
         4I6tYQTocwMtC0JcnXkqcXcuASJzDX5vTn191STkwO6yjlBnU7/k5yMb9SlnJ+yBAD6K
         /lFlvCvde1LUAMOTKAZpL4biIS5OQ93bTRf5Dod+oN/eOznpi5cr/CLbWZR+HdTucPwI
         Z8y/rhshuTtcR5x37lXvrMQ7jQYr7Br8abliS3fKXUSMUkDyLP/6vhy/EJcyyaAf7a97
         pc10SrDQD9e9YfKOXWIhzqS7dMeNzxcUcsogIJ4bIEZ1RAR4r3Ccg/UuPZtyhwOOMBby
         ANGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2q4cxUC70qkhg+ggNgpDZk41yZFbTQseX1FlS09dHw=;
        b=262Ov7T2u+E0UaCg2QGIiW7BJIwzSHABbS03cUHmEw9p6rwWk1Ka4+moDxDquKZhVI
         gWqNi8uwY3yBUO9o1Gbx1fqDfG1whSR4T7C5P9bQvMcsVOQ8yK3IMy8/s+s17iApwaoC
         yxg1WYKwpBfOaUBavzGj+e3BuM7BFWKjGctSGkExP9uHAAwePmok97srVBervZAw3g2F
         8o3QEJYtUPlNf9eN2IXXfMi1jyZiVt/n7/GXgqz28UDLtZwDEixlywPBApN7XdFzfYAi
         9FkftcqVQ//as0GQwfZpgc5jyqPlrtnsuOU5L+Eqk6pXu3fP7QsPdF2/VlPVHPNF/hYn
         8G0Q==
X-Gm-Message-State: AOAM530jupLHXc5YqTcIyLWkD0MgBfDIstVDio0aix5XztVY1mfgKej6
	M2cA4PDlOyxHppohN2XH12aVWWSj34qHXQ==
X-Google-Smtp-Source: 
 ABdhPJxcxiPbuk4sDaRK/5UpcurV8pkszQGBgFmVimEnbleW+o6ClAMuwxmIW05+UbD9t7YoJ2ftRQ==
X-Received: by 2002:a05:6a00:15c6:b0:4f0:ecec:8214 with SMTP id
 o6-20020a056a0015c600b004f0ecec8214mr968061pfu.33.1646852745986;
        Wed, 09 Mar 2022 11:05:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 14-20020a17090a01ce00b001bfbffc1331sm1063540pjd.46.2022.03.09.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 11:05:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/2] catfish: Do not set PYPA_WHEEL
Date: Wed,  9 Mar 2022 11:05:43 -0800
Message-Id: <20220309190543.664728-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220309190543.664728-1-raj.khem@gmail.com>
References: <20220309190543.664728-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 19:05:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95911

OE-Core has addressed the pertaining issue which does not require
setting this here anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
index 6aa5ae8c30..27a807be29 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
@@ -4,7 +4,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
 inherit xfce-app setuptools_build_meta gtk-icon-cache mime-xdg
-PYPA_WHEEL = "${B}/dist/UNKNOWN-*-*.whl"
 
 DEPENDS += "python3-distutils-extra-native"
 
-- 
2.35.1


