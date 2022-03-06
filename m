Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3543C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 22:35:20 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.19949.1646606120325688288
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gHWM1OFb;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id t14so12071609pgr.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qn9m9tiBg1aulg4eTevvn2szFqdZFgrwLjimWpU3gx0=;
        b=gHWM1OFbvpGUlULeMftAcmuOBpqGpv5x2BeTsb5D6d5ki85z8Hm6tW/JjtfyjxeBLK
         x6QZHJZs2nVRlBRchyHPCLzDcK2Z+4G7jfwF8n7mMnrsHfeZAKudCtjLQQDr3gMtfaJm
         GwYX23ndT9mCdBQJ3nYT2E23DYRzV34WVLtmAa72aQ5wYDvdZB/jKf8sEpg7GCFHDKrA
         oj199w2KwFw32TWvQqq33wbNgEMoZxhQst7WIF0JR/zCT0FB2N1snICYE1kHrzsZ256Z
         UvUC9lABxW/+oW3ws9f3GZnNnZY128herxng+abc4BSDjVrdt5PidUzABm/sUY2CglNB
         LYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qn9m9tiBg1aulg4eTevvn2szFqdZFgrwLjimWpU3gx0=;
        b=SFmknjmbTkRia8iW60FgF7JRJAb0uZjcRYxR+oMluzZSO+NwTLA4nB5dy97+V1bIGh
         0QB6PrqRH5iS+k9PjM37WhhAgMia2bkQ+EhglkCsnZA/WV2sPgp33PxfSiAc5hTAMMsW
         Qkdxf5HGJziJt3aFSJccnQVksbzELoF2TL51HJP8bXtKU6hiESHpwzMri1YoqhrzprXu
         U+vMPXwPxOr+PtI+PcP8ODWiJUsj5YWq8R+Al5Dwki/oet8KG1dU+0+w0UGHh0RXlSPS
         Oii8XjGvEARJUNwbBExZVv1NwYr20+L2UUEGrL3O9Umj3BJxiet4GAmLxuT8AHLT09ZF
         GNyA==
X-Gm-Message-State: AOAM532tGa0muZbRpoPT6xRcdTB8jVmMfz1t9+4VsItqscCEF7KNnFuR
	KTp161vQsyxvDd6hV6hezTsMjETWOmGvPg==
X-Google-Smtp-Source: 
 ABdhPJyR5o8+dzvWyT/zZkntqz3SW3rO4puVX7jyJB45eSr6LYa201H7F4O/oLPb9tHzRovmAHVOKg==
X-Received: by 2002:a05:6a00:2182:b0:4f6:5051:61db with SMTP id
 h2-20020a056a00218200b004f6505161dbmr9917915pfi.40.1646606119694;
        Sun, 06 Mar 2022 14:35:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm13502369pfh.83.2022.03.06.14.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 14:35:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/6] gfbgraph: Check for x11 distro feature
Date: Sun,  6 Mar 2022 14:35:12 -0800
Message-Id: <20220306223516.504947-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306223516.504947-1-raj.khem@gmail.com>
References: <20220306223516.504947-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 22:35:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95823

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
index b64b231b50..2b36003635 100644
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
@@ -10,7 +10,10 @@ DEPENDS = " \
     gnome-online-accounts \
 "
 
-inherit gnomebase gtk-doc gobject-introspection pkgconfig
+inherit gnomebase gtk-doc gobject-introspection pkgconfig features_check
+
+# for gnome-online-accounts
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " file://0001-Update-rest-requirement-to-rest-1.0.patch"
 SRC_URI[archive.md5sum] = "c38af63e49f8fe8baad99537956b69ba"
-- 
2.35.1


