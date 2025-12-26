Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6F2E8FDA8
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 16:32:28 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155096.1766766739480299375
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 08:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DF6t8/PZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78e6dc6d6d7so64438997b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 08:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766766738; x=1767371538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFIJXdAQonE5M1mDPeNpPfplY1XL3l3b7YtQSD923cs=;
        b=DF6t8/PZ1q9saA0DTxtKhVRxpPGo0fGOBeCY1gXKG4lJ57UxL0kw2aIC+lTNFPzebx
         EAISeY43zpghZseKkqzCKBLvHmDzkwkNtVPkDixqScaRz6Y2tL3WASus7EQLs79clJpD
         LOCD+YNMVB1eDmDv/Wy8Rr3bgljstASZ+LVaT9rwlhoSgqs18XZdi45MrU9bunGz2rJy
         Xos/mUrj/yx5+qZDWyCZbAY+qD/yaIc6mZnJHBS5FAzwl39Z4Lv71XxHs0y7jJobNQYg
         gkJyrsrmklGxX6FDgUAj//2NQzENtHtYA5/8OoG8N0EZzWaDJTJkrCYApofSlXQaCyaO
         blMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766766738; x=1767371538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFIJXdAQonE5M1mDPeNpPfplY1XL3l3b7YtQSD923cs=;
        b=vefIrN3T32Xd12WXGB5i5sQt7nvWtCxvIYfzEcejzGsH9E+d3bDyX02yu9tIxSPxMh
         sc76hsd/uwKs6k5FLNSb0EhXIBxqhrGO0Dx30P2rOtBxNvxupUFIdJJ7g6yzdS5nmuLj
         eCtxJcaLzrX8xeZdPGivOlIsMoouF5M/28f/aDh/9S5DLocbP825gqwTeVr84sL0/YL2
         mU9ouGvJqL9HisNiCdhVUnWhLqM4AahjzdVBpv+b0IXSB2AT/ySxnn0Qfs+CFoWuUl0a
         eLruCR568jdqN22U4uwnk3z+UBhG3cNEDHImy/V9CFoYZoNCcY4e6Wv3P3s+KPP0yhyr
         paLQ==
X-Gm-Message-State: AOJu0Yx+3H4OFUo+EJx8IpmyrUKiHt2MX3tZb29VOX8EPydPCRDoxbfX
	AxWkPWIEZDaAra4jQGm8Decwx1JTL0pDwynICBdyGgZarWZ3WhWZo8hN6iGgFK6N
X-Gm-Gg: AY/fxX7tsrS9N35YPANJFpl+8IlfqpXS2233CfrKEpRBlwQntPqqO34qvyj05TJKVTC
	3XC863qzMI3kFvquYIiv3aWGSVCqgnwKkqXpQBtvphtqNb7twwY1l+xyOu78HEOCaJqhpqugWUf
	YbseaTSMTRj8sBtkfhSkYcSv6aX8FQwBrpj3Fj4NEags0Bto9mRSKH796XcjWaOyZZzDLTcsEJ0
	3U3sZw1qDi9+qzMuo4HJcW4dnF25pY2bEdBfe+WciRmieo2/nHbgk+2Yc/qZ0yFs5qV0DnnKSKo
	IvzE2OeEIP1WwNfr1mLtF3b/9dj9JBwM++BfErwerhc/hqngJ91Q+5dWbk+gzUIF3KXMzaR3ds2
	bXgjarC9CIAovq/8V/IVbyulVo+h8nub4Lyy9N7+pQesF0JxXAxoW6Oaqb9tXh1yTrrE9qmx5SJ
	Q3cHV6ZPTd1fVjus3Cx7IzDipwxOQfbbMsYyzEVnQMhO7UhGvyvVHNXVmyNCGHQov4SwwiWXzIy
	BEngaAtRLZHgEKu/lPsQJh30claCf5BfkGK
X-Google-Smtp-Source: AGHT+IHI/mT5hBJvNLPzMQ9ETZGWjSAeGmO3NF0iRC1osfFk+j2+JEen/CV08DP+GDXx6syaRrq3sA==
X-Received: by 2002:a05:690c:2503:b0:787:f5c5:c5a6 with SMTP id 00721157ae682-78fb3ecc120mr192026047b3.6.1766766737999;
        Fri, 26 Dec 2025 08:32:17 -0800 (PST)
Received: from localhost.localdomain ([71.3.192.67])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb437380esm87911437b3.4.2025.12.26.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 08:32:17 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][scarthgap][PATCH] Add missing HOMEPAGEs to xfce recipes
Date: Fri, 26 Dec 2025 11:32:14 -0500
Message-ID: <20251226163214.17823-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 16:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122938

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4d964d4d79388c8c2db8d8a3fec029a656f9f937)
Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo_4.19.0.bb                         | 1 +
 meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb                   | 1 +
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb     | 1 +
 meta-xfce/recipes-xfce/tumbler/tumbler_4.18.0.bb                 | 1 +
 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb | 1 +
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb         | 1 +
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb     | 1 +
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb   | 1 +
 meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb                   | 1 +
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb                     | 1 +
 10 files changed, 10 insertions(+)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.19.0.bb b/meta-xfce/recipes-xfce/exo/exo_4.19.0.bb
index 48044240a8..00ed5d6193 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.19.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.19.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Application library for the Xfce desktop environment"
+HOMEPAGE = "https://docs.xfce.org/xfce/exo/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb
index 321f645b01..58eb2549a6 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce Menu Library"
+HOMEPAGE = "https://docs.xfce.org/xfce/garcon/start"
 SECTION = "x11/libs"
 LICENSE = "LGPL-2.0-only & GFDL-1.1-no-invariants-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb
index a136ba0545..37481b2cc2 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.18.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Automatic management of removable drives and media for thunar"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/thunar-volman"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.18.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.18.0.bb
index 0472d4885f..a9753d3f92 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.18.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Thumbnail service implementing the thumbnail management D-Bus specification"
+HOMEPAGE = "https://docs.xfce.org/xfce/tumbler/start"
 SECTION = "x11/libs"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb
index 0fea41c773..e5f5c5d506 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.1.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce4 Application Finder"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-appfinder/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb
index 7e70754431..2900d694ed 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce4 Panel"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-panel/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb
index 4021243e41..04b134e419 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-session/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb
index 0a182273bb..e72e3c84ba 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce4 settings"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-settings/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
index f5c598b8df..74bb10d1c2 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce configuration daemon and utilities"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfconf/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
index 839f1c8704..3912d8f64f 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce4 Window Manager"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfwm4/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-- 
2.43.0


