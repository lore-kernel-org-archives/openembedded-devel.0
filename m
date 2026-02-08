Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6C4EF06E8
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26683.1770562308978376880
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYFMuUE4;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4805ef35864so30337305e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562307; x=1771167107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNqBtAPeerWUBrr4JL3RifWfosTBQ4rpQjA+q459Wzs=;
        b=jYFMuUE4GcNJS2fmRoPzUFJc9Xyb4yEj1wxOXe/357vGuHTu/VzKqS8gyVt+m7fWF3
         YHoT3wQyMLfVBzLyXnjNXal5BeV4iBH5SGOaRYweyrbBDEjtBRdGUxL//v+I6hFZe76r
         JCuVuerwEe0bkCEQ/41yYx/F9ZZN96NMGDsBXU2P+aFit6PmfcHK0tEkR0TFvnDW1/7u
         gvLdcxnBSYgdsq3IqCHrSk0RUWHzKdeJ45yp9rJbXOKR092eqHM7JFUBjUcAF3q6E/2d
         Pr4yZZ+JpvTQNKq+Oat+1fIMzwRuQxhmeIahQ4530kgM9PnQy3qP1v9Kr6mXgKVh7uzc
         lPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562307; x=1771167107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CNqBtAPeerWUBrr4JL3RifWfosTBQ4rpQjA+q459Wzs=;
        b=ZPRkWLxieVXC2u1uuVZZVtLHgbJlLzntUkUSVIJFI7MKtSCYDWD2b8Vkg5AfMD6ip7
         KQrIBff7v0gF0rgA1nsgL8LD2PhXFdFMNgKM8LfXCqAGtUtabBocrqesh66dDrdzhVD8
         QF3vQ0cY0mHSm2G+c4BKCLPDbVXKM4XJDfpZBuWtGsnp+J66VXqeRM7IG3BFURhXa87g
         fVdwSCjPLMnraIZWsTp4f/iY/f/fUx2oTr2qJAOIfHnJdhudFz6AsHlDNuurxEgFlJOB
         EjsnaofZzw537xdVB0+XzeFOsQB4ys0igOrQFKzJ9pSL13HmGWJtjcgV78laKrC5DHhg
         MEMA==
X-Gm-Message-State: AOJu0Yx9k6ugCm/2bZSutLUUPG2VLVrQAZJwZI5Bqr9yLQ2seCD8M2pq
	9CWSeXNKybX75tKBPQIQ8b/j8waXvyhld7xSyC1BHLV0CoZgXO+ibycn2WpIMQ==
X-Gm-Gg: AZuq6aIlBt6VXAxQuaD+8C7ev1FsfZ7KcZHS6dNtP6WI/cOC8hzd+kpBLFsfDYQBLq+
	mQz1Qo7oljulqrGiCTxbrgeL8rzIQU8VqlWA0j8c+vGGKe50v+dA/xqp8/JgQa5VnZ2CLBxs2eK
	rUZq7Gz81pE8BHpNVGHsyg2ldrktbxddSkyE6AVoqIXv4lNNrKZlIAd0RMsg4TjB5XXEokcXLC8
	sy9bekxeD2tSMMilGx8PzcbQ1tns6J9EdFx0iGh+YK+rp7hfi48nvfTldhsv2s5Xz5m/wgb1V+O
	H8MdAbW4plBdkNZkBwq2o5FxYVs24/DsAO1t1+xfdqnLcdW9SbP7wyUD3O9bQ17ZPPu+dh0c9/o
	DBbR8ChawvIgwUywCIM+7t6Ab3RZY0yj6O+SHc7cpE8B3XiDmRtMDz6k794wAR7X/XLx2NIhXhX
	dErgLmviY0
X-Received: by 2002:a05:600c:4750:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-483201dd2f4mr114723965e9.14.1770562307180;
        Sun, 08 Feb 2026 06:51:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 03/10] gnome-bluetooth: upgrade 46.0 -> 46.2
Date: Sun,  8 Feb 2026 15:51:36 +0100
Message-ID: <20260208145143.20464-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124276

Changes:
ver 46.2:
This version contains a fix for the devices page staying empty on load
in some circumstances, as well as translation updates.

ver 46.1:
This version contains translation updates and a bug fix for some device
icons not appearing correctly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-bluetooth_46.0.bb => gnome-bluetooth_46.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_46.0.bb => gnome-bluetooth_46.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.2.bb
index 1b29e52c75..a5bd19dc1c 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.2.bb
@@ -25,7 +25,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "13fe1e75f317acdbdf5e80c9029d2e0632d60a9ccf72a43ae36eb7545021fbef"
+SRC_URI[archive.sha256sum] = "1b48feec75b8b4f1a6e564cce7cc4ebd35b3225cb8d8be93c8efc44894003635"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \

