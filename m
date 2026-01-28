Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1349FD35678
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 05:51:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6992.1769579481625221164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 21:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oqc059UN;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327555464cso4555992f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 21:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769579480; x=1770184280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kj+Zh5DpGqY20v89eSc8nRXZOBUZiMRq4ClGxUiOOk=;
        b=Oqc059UNnRFqMOLkmMBw8mxnJ4Q1o5Rkucy3v21J8WXQDaR59+UVD9fHXCkorhc12D
         ohND8cpcKdfOWbhNvsktUtd4++4YS/TEyvFgTCkS7PAgz9fM8GXKbqGpv7jidhe210C4
         FL9jUxhZeSxgYQN11yHQuYop3HVDTdbBUY0gllraJ46s+VsTuWisPNla985WuHavQX8f
         rI5Iqugb/l1qdmrMVS8oCEFtgogbKpGgcJeG+fmVLuZ1Uwuh9lPasyeFcEGyaTMg64Pv
         FTqDtizNpp7XlfEuOwhcFIjKKgiCMmuqoHEisKttaNZ8emUejZLJnePevg/p7kflgA8e
         pVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769579480; x=1770184280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Kj+Zh5DpGqY20v89eSc8nRXZOBUZiMRq4ClGxUiOOk=;
        b=j9taaeo4QK5NvSdEkv4G7FFtd7YUhW0UH8Q2AtX5hgHG6XYi+uA6LCkN93lboBdvQR
         kpxTKU2zIiRXk646RblKTMZGI86RBi5e+XZbnCFRbwmDaxXgvFbFLGVIU0sB27eIMgPT
         4VHQFRHOpHU19dxmay5CEUnOKvyLbhcTImZpGZ6YqeTlHKl53GXIzqifiuFAdG5VJkCc
         O6jy2VZbdQXwwnEhnvEwm51TK1lygr41Ym6c3AdqFwdFlti+9b+2YAcX3fx2VYQM58E0
         +ckQjAtRczh1NFZ1luSrChwPsa+UW3vMBPOvHucsBz8eTpv0Za5JzEkRml99JADUrZt1
         w5wA==
X-Gm-Message-State: AOJu0YyIM/F1m37WxmulEXb0Q8jMjZtkyYhY+9iFlbV5BcbwqozEOwJC
	/5zcAByEpD8RJa2OgyyxjAGuZDZndQsY9duB38Hl4abJDujOVPrxOeFZAQ8Gqg==
X-Gm-Gg: AZuq6aINsZJEogeteqTogPyE3gIXW3OX1jBMoh5GJMfUJjUHwV1R/2mlxc4Kv/ntmeD
	A8heMEdc24YpqtMJ3Yju1PAglZ+hdJrGAznW5SrboQ4MHj6eotjPfZnqZIafFtHBfEiCSbgWgxK
	uT3PIYZuy8mAgSQV99XVXGxKzsb0kl48goILrGYj5Cq0rdLHYorlKaItygaLx2gObZseY7eXiRd
	3Vz+8nJII3QcRVPVHZLwP8KC04VB3Mz7l/+ZimsexIeY74yyH9d4asxFfThAxgAO4W8f9L1an0X
	vKm79Tsx2Ey9phaSESJgBdgt/8vv4ONEpohAjlQpQHqRB/3ibCxk6g6ELq6MXQg1nC/jKyBCSjT
	JPzKfWmKYaNp0JwR1vSyFcmOXfTUtoTWEkPv1aUvJ/iUFUjs9EzSa+KAKB8E81XkTPZqBicCWY8
	fTYRJ2TdL5
X-Received: by 2002:a05:6000:4282:b0:435:a48a:1239 with SMTP id ffacd0b85a97d-435dd05aabemr5315781f8f.14.1769579479439;
        Tue, 27 Jan 2026 21:51:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm4371777f8f.19.2026.01.27.21.51.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:51:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 1/5] libadwaita: upgrade 1.1.1 -> 1.1.7
Date: Wed, 28 Jan 2026 06:51:14 +0100
Message-ID: <20260128055118.2011068-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 05:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123964

Bugfix releases.

Changelog:

Version 1.1.7:
- AdwCarousel
  - Fix allocation
- AdwFlap
  - Add a missing setter annotation for :fold-policy
  - Correctly measure separator
  - Avoid notify emissions in dispose()
- AdwLeaflet
  - Fix can-unfold=false
- AdwSpringAnimation
  - Fix critical damping velocity
- AdwSwipeable
  - Fix get_swipe_area() fallback
- AdwTabBar
  - Fix clipped labels
- AdwToastOverlay
  - Don't focus buttons on click
- Demo
  - Open primary menu with F10
  - Fix the switch on the avatar page
- Stylesheet
  - Fix GtkLevelBar fill colors
- Fix dependency names in docs
- Memory leak fixes

Version 1.1.6:
- AdwAvatar
  - Correctly redraw on custom image changes
- AdwFlap
  - Fix natural width with fold-policy=never
- AdwSplitButton
  - Don't make dropdown insensitive when the button is
- AdwTabBar
  - Fix focus handling
  - Fix autoscroll for non-local drags
- AdwToastOverlay
  - Clarify documentation
- Stylesheet
  - Fix GtkSpinButton inside toolbars

Version 1.1.5:
- AdwCarousel
  - Fix a crash when removing a child while it's animating
- AdwSqueezer
  - Sizing fixes
- AdwTabBar
  - Fix long press handling
  - Fix a crash when clicking empty space while a tab is animating
- AdwTabView
  - Fix set_menu_model() input check

Version 1.1.4:
- AdwAvatar
  - Fix draw_to_texture() with rectangular avatars
- AdwTabBar
  - Fix squished or clipped text with gtk-hint-font-metrics=0
- AdwShadowHelper
  - Fix warnings when drawing vertical shadow
- AdwSwipeTracker
  - Fix swipe speed on GTK 4.7.x
  - Fix criticals with GTK 4.7.x

Version 1.1.3:
- AdwLeaflet
  - Fix a broken link in docs
- AdwPreferencesGroup
  - Fix accessibility labels
- AdwToast
  - Fix the example in docs
- Stylesheet
  - Add missing borders in high contrast version

Version 1.1.2:
- AdwLeaflet
  - Fix child sizing with fold-threshold-policy=natural
- AdwStyleManager
  - Correctly handle removing a GdkDisplay
- AdwSwipeTracker
  - Fix a memory leak
  - Fix high contrast setting name when using a portal
- AdwTabBar
  - Fix middle click when inside GtkWindowHandle
- Stylesheet
  - Fix action row title and subtitle inside GtkHeaderBar
  - Fix progressbar.osd overriding text color
  - Ensure active states consistently work with touchscreens
  - Fix GtkDropDown visual glitch when pressed on touchscreen
- Translation updates:

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libadwaita/{libadwaita_1.1.1.bb => libadwaita_1.1.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.1.bb => libadwaita_1.1.7.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.7.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.7.bb
index 8ca3be352e..2150b86813 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.7.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "491169d4f6a11765328996bc088272d05c7235453bc0ee73c20dfd4bd67b401c"
+SRC_URI[archive.sha256sum] = "f54481638e921b1e42a7edd16c4fadd5eb859f8ef1425285618821c844b38d92"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"

