Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8075D2594B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:00:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3823.1769493640186684994
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNLH/teT;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so41282595e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769493638; x=1770098438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUKWN2hRCYb84BTRAaXga3mo+lqJakfoHJ4Lej3iJQ0=;
        b=nNLH/teTxUqmg7AOlSKgAWZT4dy5Pu/YgIznl5FWXguqC6ckvRBPpnxVs5/RQXC+Ki
         TVI2pbMlXEuMS01vcY0yHiGKcpmoIAPZZUJIwsmbvHXXWfQ/mrMHVh/Ep8PYl3OZl2DC
         GSP/xnN0ZO1/ouenOdHz4VOqrWTTxweQ3tcXkcTS6h/FAzcutV/gWjCNje8axIsTi/hc
         qvMNOhMzk+E7miinwcORWiyPrt3Ri/J8SDecA6O5WCaHi4Jbc/7jgP6+4KH8qG7IGvQQ
         qmFJ81ri/FX7kypqmLSegfG4EehO1VionpTPaymj4WFcgn1563gLYGVSo8ZrkvneGAJH
         5hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493638; x=1770098438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wUKWN2hRCYb84BTRAaXga3mo+lqJakfoHJ4Lej3iJQ0=;
        b=atMAlqVuN7Oagt3joEDbFQ/ygk9ObMD95ed46sdQz9K7GwzOJAQtnb89B3SsGLemhZ
         thbQoBnsGuTJk50jt+ev/8FAxM6YuaPhyyhfsRF0TzawKwKH+ebE2mBrvHcvs8Qf6wZL
         3LpLLEjbZh0KiV5FlVW+UVEeKkBF6kU+PpWLSjisRsPRJqhk8gnsuUcrTNxoKQh4p4C2
         u947LeYykU6oCR3Qt7wo+K4rgVvaLImjCiMizfxUOEYErQegd193c9+QDrmDkWnpvxZ2
         jod8XGiHVMbJFu6iWYOuM5/vkzRQScJZi5i5bV0qV4GlgSNqkrPfH6kkuQLK2TGLXqan
         19xw==
X-Gm-Message-State: AOJu0YxObNLEjs6E55wxHW8fxUHTfjTtxmwq9lNQy5Hbc7/I7JgXVbga
	NrZIobRtOfu7Fz563CVCKoX0KgW5VEAk9sTtr0GEYDmlj4Cp5iYbUxypqUIDkw==
X-Gm-Gg: AZuq6aKxHyBBSfEbYxiMQNnprXGpNjpURcr/fVC1pWjfAIuTDJhtsA7q5U3JHKh9vcV
	32I9tJ6fIkw+zTtrkJepT5WJHQkXT03Qpg2tFZkgfGH7QZord2IgrsF0ZD6AN5WiG9Yomte6zHU
	mJV5Bt0W/5kBNMcY2YvbIMGawOLaXSVxyqRvNHzATY0C0zQQVZLseqUV9suihrnDImovoBmsSzx
	tSCe38bFejChk62gYOgJg29IXJLtPl1nUh/Ri6YQGA0IeRdvyW3kjGDqtzVJopS8ezsL+fDVUop
	/FXq3LfvLncmP+rSp5fCy+UaBt96vDBjKvVjbWsA5WudaoAqikXQfn6g4bvSKMau9hbMAzeEHSF
	EI9xUUOawc9I2b/jl5jNkgvTPOLcC9tVAx5zKx9H9cEIjnwxDeDpvfYFvxae5VEGrZ587ZbeTCK
	wEe0rloLkQw2M9nBp334E=
X-Received: by 2002:a05:600c:8708:b0:480:5678:1fdd with SMTP id 5b1f17b1804b1-48069c0dea2mr6805975e9.12.1769493638546;
        Mon, 26 Jan 2026 22:00:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3ae17esm126122825e9.0.2026.01.26.22.00.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:00:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 4/5] gtk4: fix qa error with gstreamer PACKAGECONFIG
Date: Tue, 27 Jan 2026 07:00:33 +0100
Message-ID: <20260127060034.1301860-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127060034.1301860-1-skandigraun@gmail.com>
References: <20260127060034.1301860-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123903

When gstreamer PACKAGECONFIG is enabled, packaging fails with the following error:

ERROR: gtk4-4.6.9-r0 do_package: QA Issue: gtk4: Files/directories were installed but not shipped in any package:
  /usr/lib/gtk-4.0/4.0.0/media/libmedia-gstreamer.so

Fix it by packaging this file also.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gtk4/gtk4_4.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.9.bb b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.9.bb
index d0f2eb0d02..c1fcaa3eff 100644
--- a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.9.bb
+++ b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.9.bb
@@ -95,6 +95,7 @@ FILES:${PN}:append = " \
     ${datadir}/gtk-4.0/emoji/ \
     ${datadir}/metainfo/ \
     ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
+    ${libdir}/gtk-4.0/${LIBV}/media \
     ${libdir}/gtk-4.0/${LIBV}/printbackends \
     ${bindir}/gtk4-update-icon-cache \
     ${bindir}/gtk4-launch \

