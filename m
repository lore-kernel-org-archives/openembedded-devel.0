Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6251E71D37
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 13:38:58 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.17425.1695994731310794783
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 06:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWW+zd4p;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so934037066b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 06:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695994729; x=1696599529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dThlM2DCE9fwg5VzpxXIzqH4QzJ4KMu2XbESaW12TXE=;
        b=nWW+zd4pavp8ortwX/HYC8xfuiieW5QKsQOEENQdUy9zV20QDqj0LF064+O1JPzc6s
         e0i7I3AmnVU2zlBfY1yTE4KTQg6KPQltB0/zFjfzF6DwqBRdbUakz+tJhzq7JiXTA2cG
         PAWtr5md6WuF/8L5M9OTMFSVPLfWkmApoqhss0KbRXir/TjEIljb81+moT8Vsuz9KPiz
         lFq8R8Z682rVcxVVBFr9yqFDga1Llax9ySZeSWQICH6PP41rekRaPntqXJ3eCXs0IyVo
         AcHsqQigGJ3S2AVYPzVDJ/8jVlC5dqqSRIZ87T1dRrjXtR7h1G0M64G67VLJnFVOU9SW
         zvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994729; x=1696599529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dThlM2DCE9fwg5VzpxXIzqH4QzJ4KMu2XbESaW12TXE=;
        b=YhpQn8ORhSVgJowGu/FrLIMk2ugdqefkVIbOWc5uX/zuhqDmMiPM+DMXB1WCESRbXY
         jOigQLRq/6dzwt/S6pYIy+bMKYMAFylWe4vzQmCn/qlWL70gahSIUmbEBUVTae6fQSZe
         CJgZvsJwnx+hSQFdgKNk2+RwX2QJVSy7EaO73vTtzgYUI3YhpRuQpQ6/wI89n/TDAizo
         iohypzI8E2QWVYuKTGBx3ILQ3/4jfNJztN8kxqp25ZdkSDOCuK7Q+saYyd1t1rdnPJKf
         OqcV4USO0Za5jMYk2XFEJN5CgTGBJZQGvocfoMnhHRyS3zhyKt6TW4+O5szrtuYz9eaN
         Vn9A==
X-Gm-Message-State: AOJu0YxrtUPlWWd3Y4fCBVvZAP2cmjz0BWgPSpxIdukceJJUb+hwY3Qk
	vxk7FVgNwuNWbWXCFrUMKJBzsS0046Sbgq1WNQ4=
X-Google-Smtp-Source: AGHT+IHxKN3cHP9URgAadA/S28wubteQdt1H7ysvdSP8/HsDtWACTg6RIrzOOMyXg5dPp38WEYhyLg==
X-Received: by 2002:a17:906:3150:b0:9ae:696c:2c43 with SMTP id e16-20020a170906315000b009ae696c2c43mr3844590eje.28.1695994729292;
        Fri, 29 Sep 2023 06:38:49 -0700 (PDT)
Received: from slackware.local ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id zg22-20020a170907249600b009a5f1d15642sm12431287ejb.158.2023.09.29.06.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:38:49 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH 1/3] overlayfs-tools: Drop unneeded dependency
Date: Fri, 29 Sep 2023 15:37:22 +0200
Message-Id: <20230929133724.56928-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105243

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
index eb6e4963a..c638be9af 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
@@ -15,7 +15,6 @@ SRCREV = "291c7f4a3fb548d06c572700650c2e3bccb0cd27"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-DEPENDS += "attr"
 # Required to have the fts.h header for musl
 DEPENDS:append:libc-musl = " fts"
 
-- 
2.35.1


