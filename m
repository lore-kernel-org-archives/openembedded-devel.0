Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1F3C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 12:03:00 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.28103.1652702570740612592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 05:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=76iyaD+I;
 spf=pass (domain: baylibre.com, ip: 209.85.221.66,
 mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f66.google.com with SMTP id a5so16403674wrp.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 05:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UEbu57SnY4tvWESIzwoWX4BKlLr2rw9bDYnnxEthVWg=;
        b=76iyaD+ILv9BkVYq2N+Uu7rQ2Yl+0eZU4PVfdtyMg7ZuktQAT48/nSK3MiMCsJ59Yf
         GIxK1RCD7VIuIw7143JwVrN/Oh8HRQaqwCtjlQ+pg4LTgGSogRTcT7wIgfIv8JWgPlGZ
         daQbQ074ZXcB/aDDLS3owoTkz8sFP09DnQLw5BaGptJot8XP/l/XqrZ8Eua7WHy6gfRr
         Gp2sS+FnH1vYoFDsCI9Wj3IM0/bDxblskTYSTtuPCGrwXUyXRwRX+sUtNs2N7sXQZwNj
         88jnyOXgH1bPQ2v4uMe+TxwS8fMNDeeaCYOSXl3vV7dvfNBb3x5INPicZ6LRql9/xIlm
         8RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UEbu57SnY4tvWESIzwoWX4BKlLr2rw9bDYnnxEthVWg=;
        b=vdWMafb3jiYb4yV06ptXW5qVbuuspEs2s8PlnW1cz8fm3XTc9cKBiyItk86PWKcgdx
         hhew04Ed1vBfuxaFpL89NRYY9982eQU36Rr3ZB0LQOqcwfoss0Z+xHzeLds4j8Ulr5XC
         G/wKUacXC9Ul8Xi+SiHEqs/OowEAqbSZqQ36Ez6NWglyGJv+bxCWtIV/OlIaJI9Gj+M9
         +88hqYZkxrzFz+ueEHfUo0sy2fjevTZGiXWxu+rMyFeKqZDSXKWonyx17I915dD9Uvok
         5CeyB5Cl2/P/Lj8LWqhRwWvXzJqRaTl0BV/uhf1w7ZTzSxNCaPJkcZkX1UgWBH0BoZ9Z
         1T8w==
X-Gm-Message-State: AOAM531jLbAYN/7gGMwlrFR6EYiQq9nnq9nWoeF+I/UykBGDp7zjDfdq
	Eoa8BwFcUmxUP5haC2ExI14yxWiOW167+GKe
X-Google-Smtp-Source: 
 ABdhPJxXdpp9wL+qcudNarWlbKuyZHFJeMUNx6FPOFlYwSaQTmntZJKYbGhpU3KcRkhaxO/T+F0/Rw==
X-Received: by 2002:a05:6000:1547:b0:20c:58cd:ea1f with SMTP id
 7-20020a056000154700b0020c58cdea1fmr13619384wry.648.1652702568775;
        Mon, 16 May 2022 05:02:48 -0700 (PDT)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
        by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039466988f6csm12867483wmj.31.2022.05.16.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 05:02:48 -0700 (PDT)
From: Julien STEPHAN <jstephan@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: mkorpershoek@baylibre.com,
	Julien STEPHAN <jstephan@baylibre.com>
Subject: [meta-oe][dunfell][PATCH] opencl-icd-loader: switch to main branch
Date: Mon, 16 May 2022 14:00:35 +0200
Message-Id: <20220516120035.3847472-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 12:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97124

master branch was renamed main, so update the URI

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
---
 meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
index 1396dc9bf..de355d29d 100644
--- a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
+++ b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
@@ -8,7 +8,7 @@ inherit pkgconfig cmake
 
 S = "${WORKDIR}/git"
 SRCREV = "b342ff7b7f70a4b3f2cfc53215af8fa20adc3d86"
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
 
 do_install () {
 	install -d ${D}${bindir}
-- 
2.35.2


