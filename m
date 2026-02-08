Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCFAEF06E9
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26621.1770562307447027255
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bnH41diV;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so40069365e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562306; x=1771167106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hp9Q4qENdnCtZV6GRrzPRe0aqvK2KBaKQLukOjQ9gH8=;
        b=bnH41diVAd/GDh0xyL3Rx2ACdn7oU9GGYNKyugDGW9A6yPepHr3br3viFwCPIazu/d
         /jt6sC9y1RVPX7y8edw235UfBqRFUkTjGr9tZM2Z5lNJU5qTkl7m6iZspZTy80S6P+pf
         Guhbw6/oS2Ml4QgXfA5+6qYsSYK4Vuv2gq2Df6kXgKWzNufK3RO/1ym1qjcSrSgHWmD+
         bEd6d9CWWk0zDGesEfhl/4/5rYrQfOkWj/iHHb6q/uKbpqGdV5/mzRrcA1u4GV3vL5KU
         CpcW1xXugC9ZSfRLJIKj33LF8azoKuBDI5JpKu2T1udFEoMAu64uN4uSYRQYeOCj4ifh
         9WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562306; x=1771167106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hp9Q4qENdnCtZV6GRrzPRe0aqvK2KBaKQLukOjQ9gH8=;
        b=cO5sub8pnH1deZYsp35U5ZEgoa47g0mBxlxLBnPntxElLBpZXeLRd2yD0OFqFcOJQe
         agCMYhUnwaxPoL2H9q83RYbHaXorTNduu9I8bjjSXYoa+aIBMBa972tK3eocfws5HUKB
         zCEkAnWhvpoOjZ7nUB7+N96sDwxwEu2IE2jTiHaE8ST1LusrPuzv9qEQkLjjcj+LQclS
         OYi5iOPE7neChKNmMntkPdysR7+NadPPEyQGvie3+5c1seIazr6tLdFnJJXZ4NTjK6iG
         C8bXuCY3lDszU+TQO4HPVIL1KSXVd6iJEE3uZs9G6inp5Ylg+PHvWK7P3Wxs61lXQlBs
         C+vQ==
X-Gm-Message-State: AOJu0YyDoyucudk5M5ElgYgKEBWfEpoVI/dHM+q0MlSskLiYhVwWUFjI
	ru8UhstN99jSf3zUvSnNLG74WePofbevNA6UHh0yPSRfGp5/3kSM79KGV0qWzQ==
X-Gm-Gg: AZuq6aKQ2Ek3iVJL/2A/ZK0CZCHgaAdlh5P2zm9a6DDeYK1iugttQOEdCjcYBn3mxV4
	5d8RkjU9waiDpQRcGV14xbRJqdxFBfP9QIyrm9lznkMaFuJpCecD2ZN660lfzZmZYuKYvPSC9Vt
	MdkrfnUI8hHxhxxwS9aSwSoMvpvs2ZHkI7BFqsU+3oKFd8u0lRwn1sFHgGEDnuBHzDIJNtU6BfK
	qElkWvRSPe6rkqFZ78mDaJ0RbUXIGV6R36ZqMmZvqQmD/u82TKf9+Dkxc9h3jBT1ZW8x7a0OAuq
	d0nuWA0YYITGez05ihnjN+yl6NfXmb9mTMwNe1WM9Vs3b/OUnHODoyPdGRSJFfXn248FXEIfv87
	I1MAVCga2m/OQ0J0XjmntBFi6RN7vsk6k9VE9aQmX6EYQIaVjNCwdsermtGpsU02nqC9JQ+kNlU
	bDZ6s/m0NU
X-Received: by 2002:a05:600c:468d:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4832023126bmr138504455e9.17.1770562305682;
        Sun, 08 Feb 2026 06:51:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 01/10] mutter: upgrade 46.1 -> 46.9
Date: Sun,  8 Feb 2026 15:51:34 +0100
Message-ID: <20260208145143.20464-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124274

Contains many bugfixes: https://gitlab.gnome.org/GNOME/mutter/-/blob/46.9/NEWS

46.9
====
* Support presentation-time version 2
* Honor wl_surface.offset on cursor surfaces
* Fix crash

46.8
====
* Use BT709 coefficients and limited range for YUV conversion by defaults
* Also request high priority secondary EGL context
* Fix applying initial _NET_WM_WINDOW_OPACITY on Xwayland
* Misc. bug fixes and cleanups

46.7
====
* Default to high thread instead of realtime priority for KMS thread
* Fix updating cursor immediately when starting window drag
* Prefer GPUs with built-in panels connected as primary GPU
* Fix cursor glitches when using virtual monitors
* Ensure frame events are sent for cursor surfaces
* Allow BGRX8888 format on big endian
* Fix touchscreen drag-and-drop on wayland
* Fixed crashes
* Misc. bug fixes and cleanups

46.6
====
* Fix grabbing tablet devices
* Fix explicit sync with virtual monitors w/o pipewire streams
* Improve detecting preferred primary devices
* Fixed crashes
* Misc. bug fixes and cleanups

46.5:
* Fix drag and drop between X11 and wayland clients
* Fix drag and drop from grabbing popups
* Fix EGLDevice support
* Fix frozen cursor on some hybrid machines
* Fix touch window dragging with pointer lock enabled
* Fix propagating tablet device removals to clients
* Fix tablet input in maximized windows
* Reduce damage on window movement
* Fix frozen cursor after suspend
* Fix using modifiers on multi-GPU setups
* Fixed crashes
* Misc. bug fixes and cleanups

46.4:
* Fix nested popovers on wayland
* Misc. bug fixes and cleanups

46.3.1:
* Fix visibility of Xwayland windows
* Misc. bug fixes

46.3:
* Fix performance issues with second virtual monitor
* Fix missing unmap animation of some windows
* Fix placement/resizing regression
* Fix possible out of sync primary selections and clipboard
* Fix ibus support in popups
* Fix hardware accelerated rendering when headless
* Add back support for legacy X11 cursor themes
* Fix preedit offsets
* Use character offsets to specify surrounding text
* Don't force titlebar on screen on all interactive resizes
* Fixed crashes
* Misc. bug fixes and cleanups

46.2:
* Fix hardware cursor with non-atomic KMS drivers
* Fix night light state getting stuck on monitor changes
* Fix sending preferred buffer transform
* Fix key press events with immediate release being ignored
* Fix unsetting clipboard on screen lock
* Fix wrong input region of undecorated X11 windows
* Fix windows potentially shrinking unexpectedly on configure
* Fix popup menus sometimes closing immediately
* Fixed crashes
* Misc. bug fixes and cleanups

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/mutter/{mutter_46.1.bb => mutter_46.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_46.1.bb => mutter_46.9.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_46.1.bb b/meta-gnome/recipes-gnome/mutter/mutter_46.9.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_46.1.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_46.9.bb
index b60ffefb0a..0cf5d4146f 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_46.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_46.9.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
-SRC_URI[archive.sha256sum] = "63b2660dd0fa193fa662c80ee12eb8b16f2b8c3bc3896366200c79943824d51d"
+SRC_URI[archive.sha256sum] = "b5071ff62fc060d3eb39c95fd54ff1accd4600756d7205f747a24d71e0ea6429"
 
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"

