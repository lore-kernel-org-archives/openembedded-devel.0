Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57EAEF06E8
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26687.1770562315410400108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QDpB54ec;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48068127f00so33542555e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562314; x=1771167114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hm+mq0HeOsMuvgyyQfs1QAdg5kOzsQ9Sqd0AYTP1Ds8=;
        b=QDpB54ecA0GRtFSdet9bj+b6+ZTHC+7gMraZFMhO+VJ0oFo/Hl707bG3PcOJ3zhgJW
         z/vM+kosNhcsX83NZXTkL2MCQnddr6MCJP+sjefyS0XTQ/7vIHDhYUYqu3hzJljYvq/8
         2qBMev5oVsMuNvdVtQBbOHsHyf3GgnwMnDc4CHdaAzsHvcj6DiZYaSzRG5IiUdsxmAJj
         oIxqcn42j8OLu8dwRYV7i3HmooKV35VdIGRHyt4StXO45896ph4Nhe2tlvHiK4Jrsv0B
         1GHrwFFMhzWfqf9SoQGO48C7FrbRpEuUi8+/Unv07SvUo3TT4CcR8uTcKmAaVxss1M2d
         EqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562314; x=1771167114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hm+mq0HeOsMuvgyyQfs1QAdg5kOzsQ9Sqd0AYTP1Ds8=;
        b=h8Qenq+pTEACwrbA7z47Eg/2pWrHfCJGkiNCHDTH4liS25fHReZaaRVDYn106Hp+dO
         snV5n3vj8kibYCd0eGe3l7irLcTjHt+U5KxsS4dJ98x60CYiiXStuIVLh6ibgcJvu5Ve
         K142MEsJpw5iBbs7bwfwVk/oUPuasRKNBseDX2yFfYz+RWFChoBZUWwCoUTa2E9N0x4m
         N8asxejDya5jISDmTeBHHsHtZE9mC2CGpR3/yLSYSqGTbBS0JAJLs5OLKIXnzH+kN6Ki
         DngB0kn5ZAbq0kPL5HHziDnMtWXo54lvRKthL6ryocyabdCLIe5ikzIYUMzDAoZg3aXw
         3+LA==
X-Gm-Message-State: AOJu0YwjgZdEWlH3MOVMnFkIfkpdhrkvUJn2MUwJDW2lqYNUeycI3mf9
	kUb3QazUAoDk3zIESVpGTztlJyzlZ+x+jrab7pXxGGwTX+KD7FHVqzg8e+2g/g==
X-Gm-Gg: AZuq6aKuDWmsJD/z7vN+iwYojnSEZTXj9ktatLYa2oVnRZsPxWbDolWP0H8R6BbugcT
	PHLm6w4NEizwzn61lCigu9M/qMVHZ33ANPjZIE4CFNfbCg7TRDUvCrfDb0GvDMUHRS0f5/7JTZ5
	gTOXxD6k/qkjf/URb1Ug2l5YQ/5+gHZ9yZBknhCP+oXEFjithlYa6FpyuTgJqXAmL5pVzxlM79r
	3hzvb+0reoQQROYSDLFe594O6KQd7Oi1/ksilcB8rEIhuKridYEdqKTUj+kEa/+r31wdsslxFIb
	ygENvsPy3IiYXJFi3gHiV0JaCnwrI8JuROkhYk0pyPnIF6e6Wvac/MvJ1qLykqnbjgx24tWx+r1
	0dVDO7dOnw88I8MaPTJGfV9rfr9ql1dx1sSqnjTIsDFu81gcrLMpnLEI5gxMperlviZ9pT96zsI
	n7a9SYL2tz
X-Received: by 2002:a05:600d:4453:10b0:477:54cd:200e with SMTP id 5b1f17b1804b1-483255d0beamr76909555e9.1.1770562313661;
        Sun, 08 Feb 2026 06:51:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 09/10] eog: upgrade 45.3 -> 45.4
Date: Sun,  8 Feb 2026 15:51:42 +0100
Message-ID: <20260208145143.20464-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124282

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4181632bc18930e6b92f14f058e154681e57e0a0)

Changes:
- Regenerate thumbnails on save
- Use "fast" content type as fallback if normal content type
  is unavailable
- docs: Replace dead links to developer-old.gnome.org (Andre Klapper)
- Updated translations

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/eog/{eog_45.3.bb => eog_45.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_45.3.bb => eog_45.4.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_45.3.bb b/meta-gnome/recipes-gnome/eog/eog_45.4.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_45.3.bb
rename to meta-gnome/recipes-gnome/eog/eog_45.4.bb
index f3892f824d..bb97025ac2 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.4.bb
@@ -22,7 +22,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "8650f662d4921d83a7904f6bb9ca245baf735f717b47fac5b37f0d90e5e891a8"
+SRC_URI[archive.sha256sum] = "b50f321c70ac64af7bcaa5b4460dc675b3ca60fdad385616f3ac7b770e0666fe"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 

