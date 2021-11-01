Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C354CC433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 06:53:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.40872.1635749555727956397
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 23:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kTfIJEtA;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so15383614pje.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 23:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=48xwir4gWvRS74FduWd/5vtAuiBB+vttFWKySR1FYC4=;
        b=kTfIJEtAx1OB++cTg+gFszDMPf7LcXH3dvCU9aZZNGRtBqvuca93BSTKG0HN97H/Co
         G5xvc+xbPM3EXIJoNPDYflJVaakvOzZqCMyMo3di4kxExx/pxT5+d5e5jn0iA6BsRtyE
         qia5fYNH++QDY2KkdqRtTNC8yRcOCpa8Lh6P5W/AmkpyqAkFh89hgSMWmZJCwNLgoY/M
         iKblvruFBokoHAZ76QDW4/F9dAIGlEBkFOrKsowk5kLvSM2fA78HOW24UzzmcVdjgEIM
         e3caAnlrIuQRFr7m2DS9xC1cGkoHn21nBGvK1FTqqkTV3ZoH/jHBMWmcIhmHaq/WAeBE
         k4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=48xwir4gWvRS74FduWd/5vtAuiBB+vttFWKySR1FYC4=;
        b=yw0IotaFadg8IYdrOhNAXqKUPv4iYPTu2DSfOE1Z/VLnUGyaPqaGOeZhwyA3H+ETS3
         HiTj9BKz7mDUCHUYVLjwkq7mmjSsunkx0aPfeiw6lwSnBh5m+8v4LOGF9DWOB7eRB+lu
         /bzV0D+OOJNFvhhIrPLgdHnzY4hGgckDRKwrdMGoAtJpXTMUWkyKfCgEhfw/d6Nh/Xnr
         dBKjIl0zBRNpFqjWaDNabo0svOXikce+zsbSuWlWbOvXqdsV2vXgcGptLy9MGTA5dAFR
         +ahGHJuU5TQV0ftLGNgB/04qrrrAvL6YE9R/+Fo28uqaCV2LxqNNUIEj5IsUfiqTcOkr
         UzDQ==
X-Gm-Message-State: AOAM533SOrDHRZN2tn5WP1vPXChnR9ngj5D5HwE8EKMO37uIfwb1yv3n
	vsr2HKScAZQOBf6PukmAWFXCssQJlEI=
X-Google-Smtp-Source: 
 ABdhPJzTaf6iyZL0X8B3tAGFUEGifAWuqpm47k02PFp3b0DLzrUCFsl7GQwQaumMLvJktcC/pYlSTg==
X-Received: by 2002:a17:902:f784:b0:141:c9ce:6725 with SMTP id
 q4-20020a170902f78400b00141c9ce6725mr10267316pln.58.1635749555051;
        Sun, 31 Oct 2021 23:52:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 l21sm14558506pfu.213.2021.10.31.23.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 23:52:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/4] gjs: Exclude from builds for now
Date: Sun, 31 Oct 2021 23:52:28 -0700
Message-Id: <20211101065228.1430262-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101065228.1430262-1-raj.khem@gmail.com>
References: <20211101065228.1430262-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 06:53:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93691

It needs forward porting to mozjs91+ until its done it is not buildable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
index d5f10ff3f5..4942bfcbb1 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
@@ -32,3 +32,5 @@ RDEPENDS:${PN}-valgrind += "valgrind"
 # Valgrind not yet available on rv32/rv64
 RDEPENDS:${PN}-valgrind:remove:riscv32 = "valgrind"
 RDEPENDS:${PN}-valgrind:remove:riscv64 = "valgrind"
+
+PNBLACKLIST[gjs] ?= "Needs porting to mozjs91+"
-- 
2.33.1


