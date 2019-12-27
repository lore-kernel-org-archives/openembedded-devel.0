Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2CE7C7A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c14so27244517wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3eTnjZj5mmxQqzhkacN7Undgw6YHJuv6TNm55Ta2Z50=;
	b=WwtBVmURAfE81IIPIYglQe8TDYoG7lDLmMvyFRiCLvuT/tdCFDbnFDZN9RJSBPlNbo
	LdnboEt9jmANUQEDxhpqd30KuQ3v1zpQ7HOYXEToFuNH2f1GAIVLyLrZ16Z0BS4Ca8ez
	kkyVOF/b7pW5AYmw2xYRXloA1oRY864eLu/YuD8nlGkoGSOtMxx29zIZfRpm5zN6SAES
	iszucKZ6nZ1kX/sLcwLE/cZEay0jb76u0LhXrqQH0jO5HCNBQgK4sKA6RPtNTJTEkTQU
	JzSa2fa4BFhBnxdXvDZwy4HNw872iKKSHIuoxsBP9yQkiIZBDSt71ysa3pXn0hzZ3XYT
	CgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3eTnjZj5mmxQqzhkacN7Undgw6YHJuv6TNm55Ta2Z50=;
	b=AyvPjB2PNQVTLmetTHrkDuecU3S0UPrz1OL5pGvp4tHziSWypMIXrWD2LMFnocCWCu
	yzRgJerViGx3Ip41e1qo+9nGzJ7iib0Gf81kuaayncVprEM25ZwdGO1/UD0oqSoVWsTt
	MjashAXU17DD38SLKx4BpUY5VkJlTY4t85oXl9qI+Bpk2byuAk/OtPcH1Zg+Z0OICsrC
	pF0zeaQ3Eu675IxuKqZaGDCavOAHg53GyMl1V84ctwv6d1kUIrot4l1Dn/15Ewrwf1Ux
	FDOBkfg8R+SFUX3w/Z282YCj5rSThBww2J8P0X5MlOctCZkb5AOw/g9l2t3XRutrJ/fc
	5/8g==
X-Gm-Message-State: APjAAAVM/XJsFAhquN0+oCJKbI8M1yYvcxBqoepv+AuK78qEwRn79iSJ
	XbT/6nMtSksXFfaKT8Iqz88A9Y9/57U=
X-Google-Smtp-Source: APXvYqxpT96eMMd1e9XxDqqQdOaoOfW9xfnN69LByzsajX5CstONHjBQ1ZWigYdeCAZHTzfdQjfb2A==
X-Received: by 2002:adf:f091:: with SMTP id n17mr53791378wro.387.1577482300110;
	Fri, 27 Dec 2019 13:31:40 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:13 +0100
Message-Id: <20191227213120.3930-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/23] gnome-settings-daemon: upgrade 3.34.1 -> 3.34.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2019 21:31:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

==============
Version 3.34.2
==============
Media-keys:
- Place spawned processes into a systemd scope.
  For this to work, gnome-settings-daemon needs to be build with
  libgnome-desktop >= 3.34.2.1, as the API was added in that release.
- Fixed saving screenshots to clipboard on wayland.
  For 3.34, this feature was fixed by using the X11 clipboard,
  saving to clipboard will indefinitely raise Xwayland
  if the Xwayland-on-demand experimental feature was enabled,
  and will not work at all if --no-x11 is passed to gnome-shell.
- Fix crash on keybinding migration

Smartcard:
- Initialize pointer before use

[1] http://ftp.gnome.org/pub/gnome/sources/gnome-settings-daemon/3.34/gnome-settings-daemon-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...tings-daemon_3.34.1.bb => gnome-settings-daemon_3.34.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-daemon_3.34.1.bb => gnome-settings-daemon_3.34.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
index 65f669349..0b6865d29 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
@@ -28,8 +28,8 @@ DEPENDS = " \
 REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "cdd0d0c8664056deb78aa40c88ec24d1"
-SRC_URI[archive.sha256sum] = "9981a20babf8da7744b7fbe175b9e36078bf08f3bf65fe5aedeb82cfe27ac11f"
+SRC_URI[archive.md5sum] = "493332fa0f36645188468fed41c0060b"
+SRC_URI[archive.sha256sum] = "9fbae67e217e53b99e4f9e7d392c91ffbe31253941c9b136ef09c2d9db7ad7ed"
 
 # allow cross build mixed with build of native tools
 do_write_config_append() {
-- 
2.21.0


