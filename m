Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C671C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 00:39:00 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.2648.1668645530787782047
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Nov 2022 16:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZWurcNOY;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id s196so536958pgs.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 16:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKLqIA7Mp1vU/Nq+251Ro/ej2WznNfVSBoI6iDCmf4s=;
        b=ZWurcNOYwA8xsoUrFljSPQ+3p6dgZbqRC2zoOoWAI71F8TeV86Y4kk87V4HYzr/2WB
         FbK0J1xc4Jjp986JKm25xBvza5N0Wf1Nl7XpPaXe/UO1E2XJTUHRgxUb100/9VeGuhtP
         w43oD1XMXdl/QBhvyNF2i9RrrkdsLKyMfbEH4sqmMuSG1ra11inUdvgU0wn49W4dPR4l
         8Kv3ZWIB4Z2RcR/fJ+ZmKdnZay5XZNgRiSb4kBkxBKe/F0ZgGuzwHcDwK80taDBd91AR
         PiITliPf1O/5OzFSGyzoZOqi0/n4w+lo1LC9EfW09TViGMmc1kqUX3zohqhlY/NbNCsA
         zKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKLqIA7Mp1vU/Nq+251Ro/ej2WznNfVSBoI6iDCmf4s=;
        b=KyubHo8K+dXLJUT86NiNT1ReFpk8juGRIRd7mcNEaQdki2MHhC3BbYCoxE3vnP5zr9
         bUj8KF9QXAknZmijEqy04w0qM7VOVWpwj0fHDVRWUGRseeWCVE7EsnssKI66CDljfOEW
         Zuwn1Ka55oo/sO9nczQ+aWcr5jtAR1LGFS1s+4noivGEJ9iJGXykZqqi9ImWy/p/EWV5
         F6PwheIIpMM+MGQvZ4t0HoKwyitoQUT4dAgODUvNgCABwQUNyYbGmx0jSTqkCzkUDDpq
         guWVAO8pcc9hw/QeWkxEci+adq2ln8QnQ+MiZ7HtyZy5t9MqBhdal/e0IFMoqRiblaYJ
         O/UQ==
X-Gm-Message-State: ANoB5plitqVx2t8y7LcIHEad7FrDDs0RuF2fzGZbFIeqzom7gfy2Da83
	8fv2gSpmK3oTv+yJA0qMSGQuFPsBiRI=
X-Google-Smtp-Source: AA0mqf48AW14YpcDmwx0HHhdmn+KRRV5U+48bCJqiSwd2gFBA+c9wbfrIw92wH5LuQ99et1LV7XWCg==
X-Received: by 2002:a05:6a00:cd5:b0:56d:7aaa:f1ea with SMTP id b21-20020a056a000cd500b0056d7aaaf1eamr480193pfv.69.1668645529679;
        Wed, 16 Nov 2022 16:38:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::8bfc])
        by smtp.gmail.com with ESMTPSA id i65-20020a628744000000b0056b6c7a17c6sm11966449pfe.12.2022.11.16.16.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:38:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gnome-text-editor: Add missing libpcre build time depenedency
Date: Wed, 16 Nov 2022 16:38:47 -0800
Message-Id: <20221117003847.3964354-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 00:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99598

libpcre is needed. glib-2.0 now uses libpcre2 instead of libpcre which
was indirectly satisfying this

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
index 1446b151c5..763384b7ea 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
@@ -10,6 +10,7 @@ DEPENDS = " \
     gtk4 \
     gtksourceview5 \
     enchant2 \
+    libpcre \
 "
 
 GTKIC_VERSION = "4"
-- 
2.38.1


