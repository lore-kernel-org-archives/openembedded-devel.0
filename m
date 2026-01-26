Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B97BC88E51
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:12:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14229.1769407967403172001
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H09D6QZU;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee974e230so36784265e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769407966; x=1770012766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYiQfoywWk0sDdtPV/biSRxfG1IuFUZe0jJxfoRi07k=;
        b=H09D6QZUOm/jj/4/AB+dAFEyL6PgXhjbNIPpDZvnoVJH/fVpwdGDRLleN9WZzvDCK6
         jteSc4NwUxiBYZkFZSRVvKC8CzXLs7AJ2DzIAqYQ4HcrRYalNonpYGiaU2YRUfwzt4fO
         xpuXuadxh9fVMF9gjK1nxPD5YYDTx+RIVBFJ8L6VfBWwq7FmDiU02qz/YSVap2caSazt
         VqMqIiymFlIt6pnIEzUjSSKTgFQCAO+OkRPF7ApXSiPQaLha6YjWNZW1YIeKThmqFRcT
         Ah3ymytp8m2DGvICh4Tw0iEEcK+2NoUF7Tx92b0m/NOvMHqZlKQjv5V4hJWnUk1b5E2K
         kz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769407966; x=1770012766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYiQfoywWk0sDdtPV/biSRxfG1IuFUZe0jJxfoRi07k=;
        b=O3LiOt0Cxgd57tKUhM4RFD+9o+Hf0yOJB0McbTJrxWU2vMUKbXsj3BK2CZvMvLanxu
         1vjfXhLGrvp2kH9fpBxzi7cxNAlHsVSNAHSX7532NqgZsV9PafblpNPbYjRn0lWal7uP
         MQ8dDyeDTDDNYOkeSFSzJXC4u4MBUXQ++4Z7fs2o+A5SYP0X2/R4bCeZXQuX3yWgX5vh
         8q7N2y7vTy9ecVNfSpq59bNUyN6IcUzQ+u70g34s45k59tV5oyO3+dU2B1DpOuxsSVfc
         Gfckq9oBqSIvx9iHVtu6QJLfpREeoTuI/jEmPbGiyf/GnidBk1NUxeMJJP65dK6zwcdq
         fvgw==
X-Gm-Message-State: AOJu0Yw1Xp0e1o+6h+/ApNU8rU6M3u/grOi31qrcHoSPkk4ERWCgSF17
	iOsfGQY0ldT+AF/ZqvIW6bWz9x49gjK2Kf6d3z6o39MiCU5W9zLevUf2hMptOA==
X-Gm-Gg: AZuq6aKsiOgiECDIHKuaQpfCOMwVPPtrHCI83NHtbpqUMLHkaZpE84++2FiUJXph/Vn
	eenCFL67C7yCpVelDjudpVzIuApTy9dsVMsgoeht0Y0ZkTUw7NaWi2TgfYpHveCKBPhT9XBbSqi
	LLsfuLCgBddU/EtvS6/SEVJxqohth5DFM6eYcTR/RHGiyNqv9y03Y2ZZr++xSt2YvOnTvv66iuR
	8rqguGl8SqPYg6KTAsHDeJ8JDMMotybFXJYEK637Y+8YxIeBhRdb2QIJzN9axlyc1QHyzcNGy1K
	wlk1/L1iXbA9zT4sOcJs26Zlzl2MMU1xFTSb+DKr3/GFMsxMYVTqCXteQv4kcPpi/PNcMNc7H9K
	XLUPJ1DaWiiCPYMuFDA8hc9qVkv9tYAvJ+rCBTtkVFEAvgT07GO9/xwnyg54Bv5vgk11G461Eu4
	NmYiK4Huwc
X-Received: by 2002:a05:600c:4eca:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-4805ce3fdddmr50659385e9.3.1769407965482;
        Sun, 25 Jan 2026 22:12:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d6588e3sm97454005e9.3.2026.01.25.22.12.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:12:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 1/5] gnome-settings-daemon: upgrade 42.1 -> 42.2
Date: Mon, 26 Jan 2026 07:12:40 +0100
Message-ID: <20260126061244.3386739-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123850

Changelog:
- Translation updates
- Drop direct uses of GSlice

A11y-settings:
- Enable toolkit-accessibility when using the magnifier

Xsettings:
- Simplify fetching string for an enum value
- Remove direct mapping from gtk-im-module to Gtk/IMModule

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...me-settings-daemon_42.1.bb => gnome-settings-daemon_42.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-daemon_42.1.bb => gnome-settings-daemon_42.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.2.bb
index 3d5913ac06..45622490f0 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.2.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-SRC_URI[archive.sha256sum] = "ed65851ae54adcd58a24c86837d624fc6a14bd84ab22e94df40a3a4cfd19ffdb"
+SRC_URI[archive.sha256sum] = "9c449714aa8ec1271c0db5137df3458195943f05ccd0ac8935d93397770bab00"
 
 PACKAGECONFIG ??= " \
     cups nm \

