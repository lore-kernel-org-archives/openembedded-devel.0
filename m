Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D982C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 08:44:46 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.5290.1647679485238640171
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 01:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UKHdAnr7;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id q11so8853231pln.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaR9urwx50Q7befDxxFBkgSJAPu5z0kQcvM/GrswzKA=;
        b=UKHdAnr728QM1Gkl2zl+kur17t3Ulhl9U5pVqb1nipfmWI5Kv8jDElspcIAGc/zO9O
         Xjhs/RdA1Bgo9Gig3msDvEZgQSqmYuNuu+3w0EEGKNLHb90wlFEGEYTa3EWJ7mTkFkfk
         YWFH/Lh6qhMsjcybKyILF1LUBgRJQnsXJB7/mOQWgUouSbPjzdQmiOJalTOa2+ThSFkd
         8ecIA18RRJdbCP3bZe2Vnc0Vit0GGPxdwuOwVYJL71Oc6MH1Fyusue8o9kRR+12EPA8L
         +1V4R/MPb7AqJqIEmRF6fRqFBxlZA1IO8rWWeUcZe5lGWPb+iJTVQ9Ika1txNFA3wTBo
         m6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaR9urwx50Q7befDxxFBkgSJAPu5z0kQcvM/GrswzKA=;
        b=eJcKSlNI5PhiZk2M6kZx9Y/bzLnQqyljdOn5J8F1CvBX6BQRfZo0K4uP5szxhbF/JQ
         HiUpYlSnpjHJVnS/V0FGWePewUW2/ptmMopLKpb2ECq3EX12f1g0WuP8ejEoN6Uhoh06
         i8tUSyF+8THvJ2FS5JmBbl0mbbya7GcpuTZ7KAJFQXGo99GTT0dl8nZMoDSTYVTnLoxp
         H7PMWbjOPZrDhc2dCKgElPfl6BpMApCewxdkfGg7IwyRXQ82wfR2aaQxZu914dnvwOph
         qQ4oLw+kcLs+XP83NptwyT5u7t/wwfHVVLgL9B4hGGwheSy3FNqfjuzaJDahd3M7oN93
         giCA==
X-Gm-Message-State: AOAM533/5YEGVgbW8JSuDVSo6flhM0jEAMDvhZKuUm/3PRdHupFSbZwu
	QUEdgaQ5zHbKvrXeeBAXRAymSpS505RhkA==
X-Google-Smtp-Source: 
 ABdhPJwR2Cz/JoBbgqMraSlafih7TfLFjW1yOvQ22h4mmOCNCtbAJ8n35S29uSTXonZP5s234vw/Fw==
X-Received: by 2002:a17:90b:f82:b0:1c6:58b9:bd36 with SMTP id
 ft2-20020a17090b0f8200b001c658b9bd36mr19897121pjb.141.1647679484187;
        Sat, 19 Mar 2022 01:44:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 ip13-20020a17090b314d00b001bfaa1f060bsm15113107pjb.5.2022.03.19.01.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 01:44:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] libgphoto: Fix build with libtool 2.4.7
Date: Sat, 19 Mar 2022 01:44:40 -0700
Message-Id: <20220319084442.425475-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Mar 2022 08:44:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96060

Delete old m4 macros, so autoreconf can repopulate it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.27.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.27.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.27.bb
index cb289751ea..41600be2e1 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.27.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.27.bb
@@ -25,6 +25,11 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gd] = ",--without-gdlib,gd"
 PACKAGECONFIG[serial] = "--enable-serial,--disable-serial,lockdev"
 
+do_configure:prepend() {
+    rm -rf ${S}/libgphoto2_port/auto-m4/*
+    rm -rf ${S}/auto-m4/*
+}
+
 do_configure:append() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
     cd ${S}/libgphoto2_port/
-- 
2.35.1


