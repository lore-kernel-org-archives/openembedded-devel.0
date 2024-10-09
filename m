Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A472CEDD89
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 12:30:20 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.15101.1728477015813097321
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 05:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fR1ybeTr;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so1661328a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 05:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728477014; x=1729081814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=APqMlM9fQilNCzVr6j3gn5duA7xKUDGogqphhs1WOoc=;
        b=fR1ybeTr5L0TvXG2fJGzNT0LhS93FSd/OnfKe7NxpHXz5j0WFY1TyHWI+e5z4GwKCM
         Uk0UqRJ06TTlP/ZvBLChhpVx6LBLp3Bl49306rYBBoE1L3A76UrxTtai2t/H0Sci+C64
         ArR80jrAdDFVr+WreGJ/ISJ+VvTqLCa7gCxig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728477014; x=1729081814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APqMlM9fQilNCzVr6j3gn5duA7xKUDGogqphhs1WOoc=;
        b=xQIkea7nNhqlqYsOXG/krkqPofA1umvs2+vXO0r89shp0nyw365jBUi2pj1Z05pge9
         kcXX540r7IJ2vDqiAROThaQXF1AaPSyWcnepZ9tRnlTkos3wLyK+h2wpENVTew7Nm09A
         Lqe4QwvJQtLizM3U/REdwc1NwglBK6RtwYQVdEMkePzEXmnAwqGkegVb26ef0MnNYoaf
         ojgrdIxLj268m9xVnm0KBMFDChSNd3np4Cah+M3coVKUnriH5qyMNCxObAHnBEBLtCLO
         0lCMwIz4uIDpNmOebOOsFguVeWH4dS8iDV0qFbclCQoq//Xr+2olHqctr2hw8EY3ArWH
         N+hw==
X-Gm-Message-State: AOJu0YytT/BqAZVLtVMD80ET2sEwXZ3VFKF+TQLjyXxc3vEv3SFVcwzx
	eZMzHXIZXeKkd1gYtfP9EjkTJuLKAIw9BhXMjVzTSaf6PH/qUU0n/8m2GDN+jzrcFEEPI7LhvVj
	d
X-Google-Smtp-Source: AGHT+IGSJKSYtC5IRe3r6P1P3lw5MtGhNq+3PKC/nWd16M1cQUyBqeNQ58duIHA75l1pKFnN6DnUkw==
X-Received: by 2002:a17:907:e2a8:b0:a99:5cf0:4b83 with SMTP id a640c23a62f3a-a998d207664mr210040966b.30.1728477011532;
        Wed, 09 Oct 2024 05:30:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9944c6d6basm543582266b.145.2024.10.09.05.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:30:11 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-stevedore: Upgrade 5.2.0 -> 5.3.0
Date: Wed,  9 Oct 2024 15:30:03 +0300
Message-Id: <20241009123007.1023153-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 12:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112727

Upgrade to version 5.3.0:

- reno: Update master for unmaintained/zed
- Remove old excludes
- Update master for stable/2024.1
- reno: Update master for unmaintained/xena
- reno: Update master for unmaintained/wallaby
- reno: Update master for unmaintained/victoria

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-stevedore_5.2.0.bb => python3-stevedore_5.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.2.0.bb => python3-stevedore_5.3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.2.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.3.0.bb
index 7cc0a2e52..7c9c3ebbf 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "46b93ca40e1114cea93d738a6c1e365396981bb6bb78c27045b7587c9473544d"
+SRC_URI[sha256sum] = "9a64265f4060312828151c204efbe9b7a9852a0d9228756344dbc7e4023e375a"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.39.5


