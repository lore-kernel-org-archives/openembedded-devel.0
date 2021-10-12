Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF91C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 21:48:31 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.616.1634075310480453588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 14:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P1Lw99Rw;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so679912pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 14:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Waqalj/yBsQ86yxzU0Vu2jj0kz7UdRyFyvBObx9lbsU=;
        b=P1Lw99RwLqd2Oadppq0750mBxn01w+68FE+B89+pqMbpofsT0pKAd83dWgmWdYU8/0
         tI0/Cvhn11m6gdFjJinIe1yEPloLNKGFcWUjp+SVvzksteO0m5td5PBwZOcjaLQnXW68
         NhrEY7UbNL8rdM7r9tvw7JlhuoUxEX/0/ru+joXPMK6gApKm1THCxLNWW8NotDpqvFNC
         x6O5LvU5EreGmtTZsjcI3HyeXWB4zuQDVzJbRjegVMeM+T9OnT5yhlBiWFUcjoWmKJrc
         u9dWWqD5/25uzIHr971H3cMjp9LHOXDAiuwrRjFuoRcgyfRVdyebsRUmvJU8pycyy26P
         kW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Waqalj/yBsQ86yxzU0Vu2jj0kz7UdRyFyvBObx9lbsU=;
        b=PGivWzTsO65M28KAEP2KzWOw7Vo4XkaijGhmMrnrrq1qTs0hsR09J2PQqnn+s6ffbl
         rvcnMInIeY+F1zPIzrzH5ILUgmA5Fd/vblRy8Pah8sjLKy9aV1JRZO8lKzYOXThafzAO
         e+AJaHbagV775zsVJChjWzjyEPedu+8K+lO9QLL/9ms342NZXcodD4lgQBPLVPrkvln1
         2Oq5wst886KwmbjLmrrc5V05H9/JGSXyZSO9n0TS4pXHBEviCi9f4vjBHBqfpqJuyvW3
         NdhSyhF20aJerbtjQPOaRnminoWDXRY9LNwBu34ClpHDzKjZIi/AbHxoiIsqxnrziMRx
         DCkA==
X-Gm-Message-State: AOAM533Qz71T/CIs7hQL6PA3oPSB1KIESDTwpYXtHeKRt2v2DoRFVgle
	i5e9RMZGO3n86hpYEznJvMhnQPjvNSZeQg==
X-Google-Smtp-Source: 
 ABdhPJzbpY2Nu7RMAzENZAI0SW9KOcTBAoni1woHaT3OXj9sdKSEYQESE5qbPnkCsPLsdQ74q26fSg==
X-Received: by 2002:a17:90b:3851:: with SMTP id
 nl17mr8982338pjb.12.1634075309625;
        Tue, 12 Oct 2021 14:48:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 e15sm11555948pfc.134.2021.10.12.14.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:48:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/3] gjs: Inherit pkgconfig
Date: Tue, 12 Oct 2021 14:48:25 -0700
Message-Id: <20211012214827.3477092-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 21:48:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93257

Fixes
configure: error: Package requirements (glib-2.0 >= 2.58.0 gobject-2.0 >= 2.58.0 gio-2.0 >= 2.58.0 gobject-introspection-1.0 libffi gthread-2.0 gio-2.0 >= 2.58.0 mozjs-60) were not met:

No package 'mozjs-60' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
index ccac08d060..096e277bb4 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
@@ -9,7 +9,7 @@ GNOMEBASEBUILDCLASS = "autotools"
 
 DEPENDS = "mozjs gtk+3"
 
-inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
+inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
 SRC_URI[archive.sha256sum] = "7fb3eb746c17363d9ee47f4a5d0bb048f0075611763eb0da11d85e0e57aff381"
 SRC_URI += "file://0001-Disable-tests-on-host.patch \
-- 
2.33.0


