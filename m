Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8216C88E55
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:12:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14230.1769407968499856120
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lS+lD/p0;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso31768185e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769407967; x=1770012767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfHWY/f0wlG8nTh7OOiBm2JnDf4gf98Q9jz3HKsHcRM=;
        b=lS+lD/p0gznQrsHQiICqqSNldz3cc55ZLyRx/E0FTf9g5IwVkoa6c8ZE1XQ8sKqgHA
         Dd713Jx7VuJCNCsE5lolDzZz85S04dUXMqK/X4tlksWQ4TCLSUf+T4HViKgYYblat9M4
         GQum3t8XpZrvDGdfCLn9F9MKF/MaHZUijj8RMLWnHUQYujIaO/VBb3NJhMnWRRdEF68r
         hjHDESi78+YoH+wH40ewAXmA+Vi8Ox/9+P/GmzYyeL3YjmK7g/skeZZJufRJ14x5XlLm
         uEU52aujSdh8vMTGInlE2fU/EsfOaFp/dTrVPDAHyVD/94kXDqUKihTYwwW3cvzKbugB
         r9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769407967; x=1770012767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VfHWY/f0wlG8nTh7OOiBm2JnDf4gf98Q9jz3HKsHcRM=;
        b=AJyzaeQyfAi/WeVVl4NK8FIGh0fItcuXQHiacGG1LWdLs41TUTZQHmddLOZnaVOxDp
         Raix/ucR7jwl9Ax0OHYxlwW2WH+Ejcpl6ekJvy7dAUFnRbnlJ387IZaYyKAynVC9Hh4a
         nMlatvT2NxvAuYtqVrm+iGYmNjPy+fo6wNusrrHW87OlQkyPiSSX8XtmSvH+PqndowG/
         dHpTZmiR0ggYNqqvkxOQ09GhAYPvOcPmdncrZQlxEXeqjKCu7CUIPnwBIRTE0KvKLWBy
         ZRJAoqh8B7olOhWcoeAq4WHAsSFmxFtlyj8Hs5bjIgV6sYBMRPZyTb/+vA+0AkKXDG4J
         8rOg==
X-Gm-Message-State: AOJu0YyvDufSIoVAuA9gIfW9bluwBX/U6KTPsyHoYmcs19t5VchQXhNW
	ovj1swoE3QTpYabyNgmn0NmZHwQDVuggNLzoupw4JMj5if75E37CB0E+xRONOg==
X-Gm-Gg: AZuq6aJMabqqB9vOlNwSnEiPUU6wwAWEhKtWQaazip0G6R+4rNcDheCEYJOUW2diRXq
	HmDOXv2C4j531axAmb501pLGEZ055pb6i4i7dnbbYlfEW2G2NG83vBjdeE39oOJ+n9sAX161zp1
	As/1KUFhN2rK4Wv+82EDTPWuNv/qRRCTqEps+TwZSfnf+nB/lyi+Glt1bjJbwvljToVrbAmn3H9
	gGR6VrNoheU+Iyu7FlIRo8OxkDpacjpKDDuCF/yEpML73PIkFeBD+2pBnPZx0McMdZdOZn6ouxU
	x62y4eQ/zMSvvS+rSkiQZl1AYGKfhP3TRnQvaTWTtWca32B1t2bya03z7TS9L46QjiVKm2cjW6X
	5wdsd9fUdA/J9X0K7jIrA6+iyhFuyBc5Hy2I8IWRpJFiucKq3f69TlIbU6ZAIeo2a6Z5rHU/sb5
	V5cIrS4feD
X-Received: by 2002:a05:600c:8b81:b0:480:52fe:58f5 with SMTP id 5b1f17b1804b1-4805cf6e244mr55881905e9.31.1769407966735;
        Sun, 25 Jan 2026 22:12:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d6588e3sm97454005e9.3.2026.01.25.22.12.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:12:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 3/5] gnome-shell: upgrade 42.0 -> 42.9
Date: Mon, 26 Jan 2026 07:12:42 +0100
Message-ID: <20260126061244.3386739-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126061244.3386739-1-skandigraun@gmail.com>
References: <20260126061244.3386739-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123852

Bugfix releases.

Changelog:

42.9
====
* Misc. bug fixes and cleanups

42.8
====
* Lower OOM score of gnome-shell process
* Fixed crash
* Plugged leak
* Misc. bug fixes and cleanups

42.7
====
* Properly apply saved shortcuts inhibition permissions
* Don't let wayland popovers block overview
* Misc. bug fixes and cleanups

42.6
====
* Fix remembering inhibit-shortcut permission for multiple apps
* Forward TERMINAL input purpose to ibus
* Fix default keyboard layout during initial setup
* Fix tracking of newly installed apps
* Misc. bug fixes and cleanups

42.5
====
* Fix initial selection in switch-monitor popup on desktop
* Improve handling of recurring events
* Prevent SignalTracker from leaking objects
* Work around pipewire regression for screencasts
* Fix initial input source order
* Fixed crash
* Plugged leak
* Misc. bug fixes

42.4
====
* Fix adding suggestions from on-screen keyboard
* Allow extension updates with only Extension Manager installed
* Only load extensions that support the current session mode
* Fix logging in with realmd
* Tweak access portal dialog
* Improve overview animation performance
* Fix remembering set up bluetooth devices
* Plugged leak
* Misc. bug fixes and cleanups

42.3.1
======
* Fix regression in ibus support
* Make sure screenshot UI opens above dialogs
* Misc. bug fixes and cleanups

42.3
====
* Fix feedback when turning on a11y features by keyboard
* Fix OSD colors with light stylesheet
* Only close messages via delete key if they can be closed
* Fix screenshots when XDG directories are disabled
* Do not create systemd scope for D-Bus activated apps
* Improve high-contrast stylesheet
* Hide overview after 'Show Details' from app context menu
* Fix stylesheet papercuts
* Respect IM hint for candidates list in on-screen keyboard
* Fix edge case where windows stay dimmed after a modal is closed
* Improve Belgian on-screen keyboard layout
* Fix fallback ibus-daemon launching
* Misc. bug fixes

42.2
====
* Align space-padded times in world clocks
* Fix top bar menus on lock screen
* Fix on-screen keyboard gestures
* Fix focus tracking in magnifier on wayland
* Misc. bug fixes

42.1
====
* Limit unfullscreen gesture to not interfere with overview
* Properly hide the second (real) cursor when magnified
* Fix various style glitches
* Fix creating default application folders
* Fix switching monitor configuration
* Add Home/End keynav in app grid
* Handle monitor changes during startup animation
* Fix fractional timezone offsets in world clock
* Default to right text-align in RTL locales
* calendar: Fix alignment of world clocks header in RTL
* Rely on symbolic icons instead of 'HighContrast' icon theme
* Fix moving windows from secondary monitor to non-active workspace
* Make sure startup animation completes
* Fix Swiss on-screen keyboard layouts
* Add Austrian-German on-screen keyboard layout
* Fix on-screen keyboard in modal dialogs and lock screen
* Fix menus in pad OSD
* Sync default colors with libadwaita
* Fix grab regressions when entering overview
* Scale calendar with text size
* Allow more intermediate icon sizes in app grid
* Fixed crash
* Plugged memory leak
* Misc. bug fixes and cleanups

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gnome-shell/{gnome-shell_42.0.bb => gnome-shell_42.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_42.0.bb => gnome-shell_42.9.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.9.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.9.bb
index b58058ed86..4157cdb67d 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.9.bb
@@ -31,7 +31,7 @@ GIR_MESON_OPTION = ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "33d404fb3c93b9de42984f0110a2969d6a4a7247c27fe7f5e24c67ecfec75094"
+SRC_URI[archive.sha256sum] = "4545283fb8c16c3254b2dc1297ac1526f320988394be8ca60b171f5c0d3bbe7d"
 SRC_URI += "file://0001-Introduce-options-gjs_path-to-optionally-set-path-to.patch"
 SRC_URI += "file://0002-screencast-Correct-expected-bus-name-for-streams.patch"
 

