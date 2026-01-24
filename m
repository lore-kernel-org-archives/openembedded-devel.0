Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146A7D715CE
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 05:32:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13755.1769232740557554463
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 21:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y5wIAtyg;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so22258755e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 21:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769232739; x=1769837539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVGCKNWZ4Iip28LTIgYmMnvrSmpoqo0uYnOcmyMn3/0=;
        b=Y5wIAtygaBzWtWU6e2HyfPoMRWYsdAAahOj26eA+sKt1xqyibSw/NNoGJyVcsHLWh2
         IEUoE6caHmRC8ZgL2tE/ptQ2uDLeh+cjg9knUnMBJe/6o6w9lxMTLEERQf8JmKIuxMyr
         MRQHWR7SpsPMREPG+Urbrr8IPh6Pa8Yw8AIJo1ayzes5mjLVBg8QtqgHI9oTXnoaDnV+
         s+57mVlw4oMDDeOgwQKNtZhD376Bz31ov80DqRDbHwfPkIqTPo0hzcN3xJzpVO/kinDZ
         d8TLnQ5erHwdRuHnUGoEcw1YCpqHxKF5qdckh5C7RJF294p1poE6wvVqjUmRncTm7Kuf
         SgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769232739; x=1769837539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JVGCKNWZ4Iip28LTIgYmMnvrSmpoqo0uYnOcmyMn3/0=;
        b=VkHVzh1jeLSeIo9xCfabKVR8vEbwkqZfttheOGsYCtW4uaq0sDhorWvF9OK3ZcRqDk
         0ANZ6i1KTnuUmG3xlosF+rMxwmEJSh1WCPkgekVdbHbJmWGhw2cnYt6Uc0uovL8CZnoW
         +HWuigkSn9gn9nJOFj33cWVcoM9QA+QFtdQnOf2F6pYRDoN+waoQKEKPpTvAKVAt4cmP
         k1SQpen+snOZCfzGOzKSOeSgoHAyFniD1ag1k3wKP9H6/RUAsnlUBBsJckNQejID1vPS
         sc5adtltqNZQrZuCdVa0CnV/3Q64c0pueDuptUWP+z2bfkfRgasYhlV+SP1G7bB/F3y6
         Ulxw==
X-Gm-Message-State: AOJu0YxiUV4ediuljPmvQaMgMYROMr2T6xqNR31blwrOWGPkZBCibmog
	s50F2R33FKvHeUZKfol8hW6R6QF5nRPwkyp71aSOxr2Ytudjd3apZS9X0H3eSw==
X-Gm-Gg: AZuq6aLU66z5Tsg5pyun6wyZgZgIx4XM1kI4fPLttuz/vX/+Zw/xjONKWJ0AZNvTPxp
	bJ9cpBBbtV7U2MWODfuoIspLFqNOo3beVgk9QWhsgr852X/6JFcBfh9HmFRiX78wamW+lvRNP9D
	GX2RzUxQcfT+rYtw1UXjoEMntx8y9MiBRUVjyZ3UwOu6rpUClatZ2Hk+dizkw6RLXrOIgM7nXg2
	E0K1qK+xW4DRtPXqVDBLPldKBnVBVIOtLxRrmiA7Gw91Ibl+VsaCxmanBqtyo01selxmFOJoAej
	Rz62/YKG+jPAQNN7LXfn7BNfU9KOvIAYLaaPeoylDJhQEoxJPV0HMMLLt5oUd2GskcPgx+/hUXQ
	Zv7u5MOTrAIoswwXYsUNdYWvzWN4budJf2AuK9BFgHUb4hxruVyAWAdaNXk6TfDNuPhHhL6P/el
	DBmBRzEdER
X-Received: by 2002:a05:600c:638e:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-4804c9c900amr82075875e9.36.1769232738777;
        Fri, 23 Jan 2026 21:32:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6315sm40746155e9.4.2026.01.23.21.32.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 21:32:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 5/5] mutter: upgrade 42.0 -> 42.9
Date: Sat, 24 Jan 2026 06:32:15 +0100
Message-ID: <20260124053215.4066209-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124053215.4066209-1-skandigraun@gmail.com>
References: <20260124053215.4066209-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 05:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123806

These releases contain many bugfixes.

Changelog:

42.9
====
* Do not overwrite previously set offsets on attach
* Don't disable KMS modifiers on newer i915 systems
* Reduce memory bandwidth usage in some GPUs
* Fix pointer constrains with subsurfaces
* Fix partial updates on offscreen rotated screens
* Do not require a physical device to update pointer visibility
* Fix Xwayland focus regressions

42.8
====
* Skip resize effects for tiled windows during user grabs
* Disable direct scanout during drag-n-drop operations
* Ignore unmapped subsurfaces in direct scanout check
* Fix cursor disappearing over windows during grabs
* Fix cursor position in window screencasts
* Fix initialization of keyboard accessibility
* Don't allow window activation to break global grabs
* Fixed crashes
* Plugged leak
* Misc. bug fixes and cleanups

42.7
====
* Always send modifiers to clients if supported
* Make NVIDIA + gbm use atomic mode setting
* Disable client modifiers with amdgpu driver
* Handle stage view updates without allocation more gracefully
* Fix window screenshots being cut off at the bottom right
* Implement wl_output v3 and v4
* Fix recalculating viewport after window resize
* Fixed crashes
* Misc. bug fixes and cleanups

42.6
====
* Add quirk to work around issue with Mali GPUs
* Stop sending frame callbacks to minimized clients
* Fixed crashes
* Misc. bug fixes and cleanups

42.5
====
* Improve heuristics for adding fallback monitor modes
* Fixed crash
* Misc. bug fixes and cleanups

42.4
====
* screencast: Set correct stride when using dmabufs
* Fix glitches in apps using subsurfaces
* Reduce client work when entering overview
* Highlight actors becoming reactive under the pointer
* Fall back to ARGB if XRGB is not supported
* Support direct scanout on GPUs without modifiers support
* Fix registering as X11 window manager if GDK_BACKEND is set
* Fixed crash
* Plugged leak
* Misc. bug fixes and cleanups

42.3
====
* wayland: Fix rotation transform
* Fix dma-buf screencast regression
* Fix monitor mirroring in some cases
* Fixed crash
* Plugged leak

42.2
====
* Don't use direct scanout for transparent windows
* Fix initialization of privacy mode in displays that support it
* Fix --replace again
* Improve picking a window for direct scanout
* Do not allow windows to steal focus when the shell has a grab
* Fix night light without GAMMA_LUT property
* Fixed crash
* Misc. bug fixes

42.1
====
* Send correct LEAVE events when entering windows
* Be more forgiving with wrongly sized clients
* Add ClutterInputCapabilities enum and device property
* Fall back if COPY_MODE_SECONDARY_GPU fails to init
* Fix missing root window properties after XWayland start
* wayland/shm: Add support for ABGR8888 and XBGR8888 formats
* Keep actors dirty if a redraw was queued up during paint()
* Fix overview painting of shaped texture with layer snippets
* Survive missing GAMMA_LUT KMS property
* Record current event when going through event filters
* Pass events to pointer a11y before going through filters
* Update cursor when scaled or transformed
* Fix screen cast when DMA buffer fails or can't be used
* Repick when pointer actor goes unmapped
* Improve IM support
* Allow using dumb buffers for cursor sprites
* wayland/dma-buf: Only advertise supported formats
* Fix screen cast cursor metadata with unthrottled input
* Fixed crashes
* Plugged memory leak
* Misc. bug fixes and cleanups

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/mutter/{mutter_42.0.bb => mutter_42.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_42.0.bb => mutter_42.9.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_42.0.bb b/meta-gnome/recipes-gnome/mutter/mutter_42.9.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/mutter/mutter_42.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_42.9.bb
index 7855362800..4f8033761b 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_42.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_42.9.bb
@@ -25,7 +25,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
-SRC_URI[archive.sha256sum] = "d1e240446b7f8cd8a3ff9daae336c1c9016193ba7e0769c79a5e6c03849022e5"
+SRC_URI[archive.sha256sum] = "d080e52f2c47fbfdf03248b11354d039b4aa453f1997288b30af841d6dcee6c3"
 
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"

