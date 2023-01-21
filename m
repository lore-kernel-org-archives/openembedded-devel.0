Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B220C54E94
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2128.1674324091860425572
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cRbtnNpK;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id k13so8032898plg.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOhbP0B0u0BAGq7YyGBmk0vqRTHf1kQlf1jU6L6c67c=;
        b=cRbtnNpKby8JfKApqBW52Z6CUTDOnphO/+5H7NPjE7dzWqZ1WqVb0UIxnPlxSJx2Yn
         M0Oh8z8h2wJGc67I7S9in7h1M05ty6ROT6a5sQhumqbNbyeQ4xVYsz2NDAH5e8KEddPj
         EPjNJzE+AaSvGqjHFisPPxRwh+KdDMK2Mh2RGAi9FsiCI7jXI87mm6Fiw71Y/zGpp5Kt
         JFOhZspF8ewsfGlqRLKijlQz8cGztzbhzymA3U5xK2zspOaq6aEe+mQS0PvubdW0wulm
         Q6aPd0P1rgsNO/fzCWg6XXKIkSQ9yw0KVfS9YJ2vpmvP/ASQ6/um2Hjm0Y/UmdlqJkLs
         gl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOhbP0B0u0BAGq7YyGBmk0vqRTHf1kQlf1jU6L6c67c=;
        b=7aCflIQ2TUts+IxwnTNH+fXkocrg8Tu2ir3n/wi8yXwbhu55yVynsALuwGC+twSR3q
         Q4n5lMZsR56xntP2v6iHbHD7idmJT1I7zxL+Y6+TNWkrkWfQpIAXkL9CebaUjeXlaaq6
         pzYCiBHsw6WmfN/9337gt1hCwMQELjF6kaV8VbBJUrfY3GamuxLx9dXWzVMxKJD8VSzw
         VeWo/kCk3G+DIVbyNDQ+5BosSbKIfleIxiAXyxVDw1Ipdw76EZIV0QccIaZmJhS3I2XP
         09UGcNJGvdqATuQgg8sT4cCYMREqm/VlsIKHdNzvTImXcaDVdmIfOieDlpuJBMvq7P6l
         EEFg==
X-Gm-Message-State: AFqh2kqo6gfS1EMZrJjAzn6jQqLQBf/0l+HvLadwEWwRkLB+nE/lWkOI
	3jknau9QNK15i090G55fB1ncyGNyEuqUMw==
X-Google-Smtp-Source: AMrXdXt1KJJJ+KlOR0yDLYsUszNBseb48KD0nF7Ws6WoDbPPwJVD4G8oRKWxHfX68CiQIXrcN1JmKg==
X-Received: by 2002:a17:90a:be14:b0:229:8ada:ccb2 with SMTP id a20-20020a17090abe1400b002298adaccb2mr20653732pjs.27.1674324091154;
        Sat, 21 Jan 2023 10:01:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/30] audiofile: Stick to c++14 std
Date: Sat, 21 Jan 2023 10:01:00 -0800
Message-Id: <20230121180121.1229895-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100676

It uses std::unary_function which is removed from c++17 onwards, until
this is removed/replaced we can not move beyond c++14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index e91c81d703..a09f84381e 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8c
 
 inherit autotools lib_package pkgconfig
 
+CXXFLAGS += "-std=c++14"
+
 DEPENDS = " \
     asciidoc-native \
     alsa-lib \
-- 
2.39.1


