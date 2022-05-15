Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E51AC433F5
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.17030.1652622573920736918
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ud/VY5WZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id v11so11772325pff.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gOig1cgElaIEJGNKyvuethtXavj6/AKW68Mp5P8ZPmw=;
        b=Ud/VY5WZ+SS2r6aoJDJrPfnS4yWLtejKs+nbhVRcRaDImYOx8ZWj/9QQ1z2PICV/Gh
         fXxkrk7luLHy/y9/59u47c6TITfXr/dhWhLVHBlo3k8oznLQYv5breakec26w8Jp1dE4
         z8b18stLHbbLdgRKGBqKiHevU1TpLu8t8HIM5HnmoDeYDX1KGmBb5+BXSvCRmc0Nq+Th
         BkK+q8Yh8LbdEzRpZ0B2ThN3w3ABzxCgW47YRAK1A5lXwW32jHVFFGo9YWSf+n8CQBq6
         6owBlqMftjCDr+ELJH+Xf7afBZ/th7ALmz+mZsB7UXhG1u41uiujWMo09Fz352NdMXun
         Ew+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gOig1cgElaIEJGNKyvuethtXavj6/AKW68Mp5P8ZPmw=;
        b=pRgo6M11VnAPhyUYRz3pCRAwUMVubmKA9HuAWB+SKDYni2RSCX9b+/Pj46+Rg3MLNu
         SpAGEOPLWuGX+Ta+vewn0plfwoSI26jRAIVOMi+zkT84zIBT1y4ZqIvKbEicHdhJJvbQ
         z1WHuzTgpcUvKtL52jL+QmXdW6+bX5DgWDgt1dMdPygEGxTbFJQ8E6gm3SvBXIhuSWDp
         +HRIKf+msRcBAqdhJRaNYb4YLx6h9HCJ7BEsEYOJCKFeA9xZLCVZ/bhi1TbCE7IYi5lD
         Yei6QBGlWGhgGi/Z5kN7Qjiiki20PE3dY7ilBc3/5w8cL7QEuIhxglhkvl+LQIqK+4B2
         90JA==
X-Gm-Message-State: AOAM530q903j37o2KbEs+v3aHRf94zq6v4clCoXCc7jmcDSh/XtNJZGN
	2gnUHnBq3pQt6cOxFPqmjDgERuNn2g0bbQ==
X-Google-Smtp-Source: 
 ABdhPJytVwVMBzjw11y15MhUhDp2HK87r/2tEp+GQi0lvhOprPL4Hnejt5zV5OOu6hr2ycUHxvtERA==
X-Received: by 2002:a63:f242:0:b0:3f2:470e:f6c7 with SMTP id
 d2-20020a63f242000000b003f2470ef6c7mr5336810pgk.492.1652622583105;
        Sun, 15 May 2022 06:49:43 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 13/22] meta-gnome: fix layer depends.
Date: Sun, 15 May 2022 06:49:13 -0700
Message-Id: 
 <74452781326c487c7530590983cb8c70d1f82ccb.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97110

meta-networking no longer depends on meta-python so add it separatily.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f264601e7ddbc357ce294b4e23bc7b00d276f382)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 2fb3485155..2406f5fca8 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -15,7 +15,7 @@ IMAGE_LINGUAS_COMPLEMENTARY:append = " ${@bb.utils.contains('DISTRO_FEATURES','h
 # cause compatibility issues with other layers
 LAYERVERSION_gnome-layer = "1"
 
-LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
+LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
 LAYERSERIES_COMPAT_gnome-layer = "kirkstone"
 
-- 
2.25.1


