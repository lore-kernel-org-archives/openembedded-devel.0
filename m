Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.48696.1591047955911204410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vie0HMsI;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id l10so1293306wrr.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i1WTaJyRvlO8DHbS8vxzzOK3xRJt6yi3rSt1VvYEa4A=;
        b=Vie0HMsIWs5KFHQD5a1DCSHXLERLmGAPzIG0xa0z4lnnkoxiXuc7kJ1+fAu9cYqSTx
         wKrxoJxy2+TFDRuslvSu0JZaRmuOrzxWe9EoLxjN2OzJKb4mEkUEKkvP0cLT1leFBH3h
         eKa9q3rlDYqIuQs0s8A2EsWeEzYPow6S1AMMnVhOye727ViMRvMQ+BUqtAIeb7IbAXo/
         GNP0lje9SVzKdiPWwNA5R2G1peFlro4GFGlg2ooxAos/oXslYLglmgLlewHV68txva21
         Of5XWkBjAoGhrGQQRe2ZbnWVVtnvrCpNq6UGbNmsFmVsURgDLbZF6/Unz/9FhxPUWaE3
         /JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1WTaJyRvlO8DHbS8vxzzOK3xRJt6yi3rSt1VvYEa4A=;
        b=s6thf+jhxO4/Hpa5GDWmuW+0l9Y9XvM8GDfRqSyzqL7o5A6vWExx6Dca6IIdSsuE9F
         cbqpb7rhFSzvqzsTgiAf0/egizU8VfvDUJbruajp9YUXxaq7qyu8HqZJ5XpkNEBqSBph
         mFRkoYCU/2zufGpUmlutU4SqXuHAfVo5GyZMqjoKE92jp8WOgk2R4rYo4wFohef1PrWe
         dkLaSOa8rfwEfrZpPxIpvNDXrsQ66NdgS4z2jStmSt2Sa9LjqYW7U6dBuJMg+xKwXJ66
         dsssdvn4XpReHv+skefexRjkBw9tvUEDMzrAgTOz1e5xO+peUuTMxM305MwPK+IHRGne
         T3nA==
X-Gm-Message-State: AOAM532nddMsk0pQ7DPydQyEFdNxNoVUtpyyaxXteFiwqdLrcByHsgDJ
	kSxIbxRcW1mwyg8Viv6UjOjSDgRp73I=
X-Google-Smtp-Source: ABdhPJw4drcM1sno1HtA41Ajr+JuYEblLlUnvfr+pn6UI0ykCfYIOjT4DipETHfPgROXdcdEuC2+wg==
X-Received: by 2002:adf:97d3:: with SMTP id t19mr23849022wrb.116.1591047954195;
        Mon, 01 Jun 2020 14:45:54 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:53 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 27/38] gnome-settings-daemon: upgrade 3.34.2 -> 3.36.1
Date: Mon,  1 Jun 2020 23:45:05 +0200
Message-Id: <20200601214516.26624-28-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.36.1
==============
- Translation updates
- CI improvements

Media-keys:
- Do not consider sound feedback a reason to inhibit sound
  feedback.

Print-notification:
- Fix a minor warning on shutdown

Sharing:
- Do not warn after starting/stopping nonexistent services

==============
Version 3.36.0
==============
-Translation updates

===============
Version 3.35.92
===============
- Translation updates
- CI improvements

Xsettings:
- Load scripts from /etc/xdg/Xwayland-session.d in order to lazily set up
  X11 sessions for wayland (e.g. Xwayland being raised on demand)
- Delegate on gnome-shell to enable/disable animations

Sharing:
- Drop support for vino. It is replaced by the windowing agnostic
  gnome-remote-desktop in other places of the stack.

Wacom:
- Fix build without wayland

Housekeeping:
- Use atime instead of mtime in thumbnail cleaner, if available
- Avoid crossing into different filesystems in cleanup dirs (except trash:)

Power:
- Add missing error check to realpath call

===============
Version 3.35.91
===============
- Translation updates
- Add capability to disable USB while the lockscreen is on

Power:
- Increase permissible runtime for some tests

Color:
- Look for builtin profiles in UEFI

Version 3.35.0
==============
- Translation updates
- Lower systemd stop timeout

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...tings-daemon_3.34.2.bb => gnome-settings-daemon_3.36.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-daemon_3.34.2.bb => gnome-settings-daemon_3.36.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
index 0b6865d29..a9f527409 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
@@ -28,8 +28,8 @@ DEPENDS = " \
 REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "493332fa0f36645188468fed41c0060b"
-SRC_URI[archive.sha256sum] = "9fbae67e217e53b99e4f9e7d392c91ffbe31253941c9b136ef09c2d9db7ad7ed"
+SRC_URI[archive.md5sum] = "102dc488a6a726e4050cf5ab7e967e8d"
+SRC_URI[archive.sha256sum] = "3e33dbd319b562a5ab602dcab6de3ca81b85f8346672e90ec632b36bbf15ee4b"
 
 # allow cross build mixed with build of native tools
 do_write_config_append() {
-- 
2.21.3

