Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A7FC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.581.1642801150342239367
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CHU5Pd1v;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e8so241893wrc.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4A1R6YLO2hpQa9V0PBrd5QGbLTUPnUA2KajMzsbDCXA=;
        b=CHU5Pd1va/Badw7z78g+HEaUyzjPZGypVfaN0uEfA9nmFgeCUTAfEShoBCgYQ3LAVc
         bWB+PHd4Bu/oAK6O1jaD2e33TKQCQOZ5aNbYCJ3vlZcyl463cY6QhQ+zu82x2zID5xnF
         JOMf9qbMi7/LMFwhA3cxCQIv7hu+bMyTKvpRO+b7cf81xXNhJ5inP5hpVkVhsBZtbI+w
         YTl+dBlt3Z2Ep/0kCEoEJ/4E8IxYsASYrox93PLd5cB0/MLwWAkxBO5n2smS+1XErqKM
         6CBwkXKdPt+k+AoNpYYsVOstVsAbGetvLgVlmJdSf/5DGO97AbGux4w2DLV0DPwHoOLo
         703g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4A1R6YLO2hpQa9V0PBrd5QGbLTUPnUA2KajMzsbDCXA=;
        b=3BhZLQ8YhrI5iY/V2fNwbVP/P2gYme4O8s6yg/CcE3jd6d5mKbClN/cfJy3HckT1bs
         kyprU6Qh7Uzz0Aw8/2/vo5up9OUae5afOHqs+Bt5HsEitqbJWqilT4cvRXQDugRIxDXt
         QvidEMYtJ1SGsErGyBdK2kdtk/PM/C7Lbkb+teDfFTYO7M5sYmpKavJBfNueXGU/LAoD
         Tb5f2SZMh4vyl4r+5Bh0eWG0qfjxGOB08u7O4axCFhqqYQI9ccf5kejNwfda8jQP4DZn
         E0+K/aY3nKrvtBkK4u6TmaXxs7a0DCo2nEdoz+xEb3X3ipcroK8fw1g2zptvzNJFIAPs
         TOUg==
X-Gm-Message-State: AOAM533Xq1AZMWgx0cLyg+nw+3BDBoi8CJDQOi//+G62gXqCvTMf/CXm
	QwR+cyXNHMeVvwgxMr5UEhnCkvyMZdQ=
X-Google-Smtp-Source: 
 ABdhPJxCQPXZN+btPt+O/sCjFfGK2WbvqHhRdwOQTWfOCVxqPluwTqaUm6I7nSiQgd4BhHk+PwPrhQ==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr5444332wri.394.1642801148941;
        Fri, 21 Jan 2022 13:39:08 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/19] gnome-bluetooth: backport a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:43 +0100
Message-Id: <20220121213858.762625-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94982

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ix-build-for-newer-versions-of-meson.patch | 25 +++++++++++++++++++
 .../gnome-bluetooth/gnome-bluetooth_3.34.5.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-build-Fix-build-for-newer-versions-of-meson.patch

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-build-Fix-build-for-newer-versions-of-meson.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-build-Fix-build-for-newer-versions-of-meson.patch
new file mode 100644
index 000000000..16c87b6a6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-build-Fix-build-for-newer-versions-of-meson.patch
@@ -0,0 +1,25 @@
+From 7355664f671bec7852e3c4523d75c27fc77a2eb2 Mon Sep 17 00:00:00 2001
+From: Bastien Nocera <hadess@hadess.net>
+Date: Fri, 7 Jan 2022 12:51:22 +0100
+Subject: [PATCH] build: Fix build for newer versions of meson
+
+sendto/meson.build:24:5: ERROR: Function does not take positional arguments.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ sendto/meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/sendto/meson.build b/sendto/meson.build
+index 24a4e39..3e233a0 100644
+--- a/sendto/meson.build
++++ b/sendto/meson.build
+@@ -22,7 +22,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file (
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
index e3806f64f..8eed26299 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
@@ -18,6 +18,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # gtk-icon-cache bbclass will take care of this for us.
 EXTRA_OEMESON = "-Dicon_update=false"
 
+SRC_URI += " file://0001-build-Fix-build-for-newer-versions-of-meson.patch"
 SRC_URI[archive.md5sum] = "d83faa54abaf64bb40b5313bc233e74e"
 SRC_URI[archive.sha256sum] = "6c949e52c8becc2054daacd604901f66ce5cf709a5fa91c4bb7cacc939b53ea9"
 
-- 
2.20.1


