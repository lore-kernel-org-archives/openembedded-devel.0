Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.51.1616519489150597888
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 10:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=ZClFwS8B;
 spf=pass (domain: blade-group.com, ip: 209.85.128.54, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f54.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so11250387wmf.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Mar 2021 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIAMy6Q9iaAKUf6Xebx98+PTlurbdVPp2a/jg5QY/VM=;
        b=ZClFwS8BKDYFxIL3Y/0BgfHLc2GMYN+da18xIWdvfXyW/OSu35QzF3UkaI8NENL4KF
         4Znaj0y/pxl4U1jxHL2Wr2bKuxPqsOsISAIiE0jGp9fcGF55SLAgBL8P+eoGjsKRVtPx
         V+Zfx5kKd3PdMZYabtIMkOfBHPAbJCZmZ6UvAbZon+fm0JTPVYfxFAiFG10aqPW98FRU
         6srE8wjMICyd9D0pJr+cwrtp6Sr/nel8cM4JU/bJ5grnD9GaTsceFWS0Z6Z6xmR2jiPm
         AbqD4yckeftggBu3owCkkPtICq5N9knUwXkJrasaoCfT2OiEeboYa/mcvUNjpUWoq/Rp
         qBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIAMy6Q9iaAKUf6Xebx98+PTlurbdVPp2a/jg5QY/VM=;
        b=d8Fr+k6KIXD8tgU2+5GV2EhzIwlfNOCsclwxngh4z4Hs0U+Hxxz7OqsSIEq1gp9rTr
         toHIdhXJOc27xUo6BNkDJn1N+9mUeopbnOCjNj6IAeaxLdVPWy2f7+IdCq8zyHJCeuxJ
         B1VcS+TIuIs8NzV5dIaC0hA6jZgN8deqJdBX8dhi8heLfbqE0xQPPJsH1lvrRsrO4A1/
         o3UgB0+qW2NJIhhsYt2YNUw/1OzJMFlsiq+ABCaNwb8r6p9OtL2jUyHunBOfo1ogd+Mn
         L7FdiEJsg8rYPzF2rNoB1CdAO7P4hEotDeEsG2JSwkb6k9mpdRj8h79ObOCFbXTMre/s
         PeRQ==
X-Gm-Message-State: AOAM5316anmZQyUXRTktU3bS9VQd+oJ2qk9qzXC6TgtZfaZQwOVCPoFk
	MVmv3qEi9RyD/42NrwzlYjRHl+tLiXFxIQ==
X-Google-Smtp-Source: ABdhPJwfbs/ofJ3B/OoxYGpqvheDmPjfSftRaVQb/RUm4cDrzkb9YeoseAMPWezcC7s4m6v0cPckRQ==
X-Received: by 2002:a05:600c:252:: with SMTP id 18mr4206757wmj.67.1616519487576;
        Tue, 23 Mar 2021 10:11:27 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id s9sm3517805wmh.31.2021.03.23.10.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 10:11:26 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch] mpv: remove explicit LICENSE_FLAGS
Date: Tue, 23 Mar 2021 18:11:07 +0100
Message-Id: <20210323171107.812146-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This flag does not describe the mpv package, but ffmpeg instead.
It gets in the way of using finer-grained LICENSE_FLAGS in ffmpeg.

It is above all not needed, the real problem is even more clear without it:

 ffmpeg was skipped: because it has a restricted license 'commercial'. Which is not whitelisted i  LICENSE_FLAGS_WHITELIST
 ERROR: Required build target 'mpv' has no buildable providers.
 Missing or unbuildable dependency chain was: ['mpv', 'ffmpeg']

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index e04925d0f..6a3fd9715 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -12,9 +12,6 @@ DEPENDS += " \
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=91f1cb870c1cc2d31351a4d2595441cb"
 
-# While this item does not require it, it depends on ffmpeg which does
-LICENSE_FLAGS = "commercial"
-
 SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
 SRC_URI = " \
     git://github.com/mpv-player/mpv;name=mpv \
-- 
2.30.2

