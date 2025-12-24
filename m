Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DA7E7848A
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:25:35 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126346.1766604325935985803
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CIH5sX9y;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so5290938f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604324; x=1767209124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hc9Tda1S+AN78R/+/DcoS6ADOdfcrKocwxqdXAgki18=;
        b=CIH5sX9yZMUfPVErxWZVvdhIDZaJMk+Yb1bO2gBgGlcN+ynvr06aiHdR+IT2cQRAkS
         qzq6mqDzrmk8cV/BVXKCz7zE2Dg7jAxugQ7z2sG9x/x8tSSWK9h8nHB/PGktBlegc8jo
         pgGfT0sf74VpWgvVxfXwDfHnN84OBuKNXItbUEbFPwceE4dMSTaS3KDsasXpnFkeSeky
         ON1G1ipv/+hvY8nIOgyfVXfP2cMHbmspyM1QVJWryzKFzCY7sfiAUOftrlxlRY8pFOIO
         QNidd2To5iQ+pW4YbxG64OhEaoQ7S9YfAWdYlknQysJw+7tuBMhe56ocX0lp0sPFwapk
         s02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604324; x=1767209124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hc9Tda1S+AN78R/+/DcoS6ADOdfcrKocwxqdXAgki18=;
        b=O86Y8A+usHDUEXbwrhWrP/QJpw07ZHV5mF262oFJd92ql9z7vdNCuXSPE+7n9AlB4U
         hQ7T3IEM/tO26DbTSAU5VHyYcI3CnfONeylRAKM7bNPWKOziX7dpScNlY2uagix/FNtS
         vnw99MVG9FdS6Hgm2K28wY5O5KIXvVhi3z3gxnmAyuEHv8s49S/umFt7hot9ODaqwTlO
         Uo0n4chU5NjgLpsh38AtO94iBAYiE31mbrFk/wGHDLWQnFCy9S0g2PLjpHAaKInBQYci
         rF653gdD1Zp0cfuXEmHRQWia1iP054yusxXfD1+/Fq8d++KmmFskTCxvtYnrwtdRIeZ5
         KObg==
X-Gm-Message-State: AOJu0YxREUbnliKzV5+/F4rld7OCRyqYg2bl5afaz1OhQDItebUJBdhf
	0A08pf3GmSLI98ptliMyoGV3FxhuCUJjbqTNhSDnQ/kqQtDLyTVQPfrV8eZEWQ==
X-Gm-Gg: AY/fxX51qWcSIXzaWjUOCqa613cawRGIEx+5yPjRdzaBmQJpbjJ6BnGyhOL1T40mp+A
	gojua1nNRgU082JU/W/3rtwLa8YiSByE6r1jizsY2a/xGa6I+Ki5N7fXa+uWwPyG5h2vq7Cs8AF
	Cw1prAKJ0N7w0cmcZPFVG8SiqqmUfSh515glvdzrT6vgXEMMHd2inGbtopiRV4GSVZWmJ0e6xeP
	gVDeHvg2+Kmo8UP3pvxYswyczgUX93zpzbdRKEuOOgEuulGeAUIktbhqqyJXk6qe8Ftry0IQADY
	Ete/REyBpKaZBNRZ0Ui2fv+2f0Z6o32UwE0le2UeNyDFweRt8jk/PxEcKuwtwxiGT99AaKJhr05
	Qnvdqt+Ojr187YAJrcdJvrFVNpHJ6H3EX8nAILDogBJyoyMPpJTVLsLp8aaRKBeUx5eXsRqZbJB
	moEzRFW7Zr/aNklObtLjs=
X-Google-Smtp-Source: AGHT+IE6OFrfv4B4G8vUITmoJLqrwWcAXezx0KSvq7M1Q7Z5QOBM0K3Z/39zBBniLpt5CO6RnwL1LQ==
X-Received: by 2002:a05:6000:2c03:b0:42f:bbc6:edc1 with SMTP id ffacd0b85a97d-4324e4c1230mr19609309f8f.1.1766604324216;
        Wed, 24 Dec 2025 11:25:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm36782038f8f.17.2025.12.24.11.25.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:25:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 5/6] wireplumber: upgrade 0.5.11 -> 0.5.13
Date: Wed, 24 Dec 2025 20:25:18 +0100
Message-ID: <20251224192519.2630037-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224192519.2630037-1-skandigraun@gmail.com>
References: <20251224192519.2630037-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122890

Changelog:
0.5.13:
Additions & Enhancements:
- Added internal filter graph support for audio nodes, allowing users to
  create audio preprocessing and postprocessing chains without exposing
  filters to applications, useful for software DSP
- Added new Lua Properties API that significantly improves performance by
  avoiding constant serialization between WpProperties and Lua tables,
  resulting in approximately 40% faster node linking
- Added WpIterator Lua API for more efficient parameter enumeration
- Added bash completions for wpctl command
- Added script to find suitable volume control when using role-based policy,
  allowing volume sliders to automatically adjust the volume of the currently
  active role (e.g., ringing, call, media)
- Added experimental HDMI channel detection setting to use HDMI ELD
  information for channel configuration
- Enhanced role-based policy to allow setting preferred target sinks for
  media role loopbacks via policy.role-based.preferred-target
- Enhanced Bluetooth profile autoswitch logic to be more robust and handle
  saved profiles correctly, including support for loopback sink nodes
- Enhanced ALSA monitor to include alsa.* device properties on nodes for
  rule matching
- Optimized stream node linking for common cases to reduce latency when new
  audio/video streams are added
- Improved event dispatcher performance by using hash table registration for
  event hooks, eliminating performance degradation as more hooks are
  registered
- Increased audio headroom for VMware and VirtualBox virtual machines
- Added setting to prevent restoring "Off" profiles via
  session.dont-restore-off-profile property
- Added support for 128 audio channels when compiled with a recent version of
  PipeWire

Fixes:
- Fixed memory leaks and issues in the modem manager module
- Fixed MPRIS module incorrectly treating GHashTable as GObject
- Fixed warning messages when process files in /proc/<pid>/* don't exist,
  particularly when processes are removed quickly
- Fixed MONO audio configuration to only apply to device sink nodes, allowing
  multi-channel mixing in the graph
- Fixed event dispatcher hook registration and removal to avoid spurious
  errors
- Improved logging for standard-link activation failures
- Simplified event-hook interest matching for better performance

0.5.12:
Additions & Enhancements:
- Added mono audio configuration support via node.features.audio.mono
  setting that can be changed at runtime with wpctl
- Added automatic muting of ALSA devices when a running node is removed,
  helping prevent loud audio on speakers when headsets are unplugged
- Added notifications API module for sending system notifications
- Added comprehensive wpctl man page and documentation
- Enhanced object interest handling for PipeWire properties on session items

Fixes:
- Fixed race condition during shutdown in the permissions portal module that
  could cause crashes in GDBus signal handling
- Added device validity check in state-routes handling to prevent issues
  when devices are removed during async operations
- Fixed Log.critical undefined function error in device-info-cache
- Improved device hook documentation and configuration

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{wireplumber_0.5.11.bb => wireplumber_0.5.13.bb}       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.11.bb => wireplumber_0.5.13.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.11.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.11.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
index 665efd95af..334861b6db 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.11.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
@@ -10,9 +10,9 @@ DEPENDS = "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
 
-SRCREV = "3a785e502642ddb1e91d953e587c7b06444e0b51"
+SRCREV = "84429b47943d789389fbde17c06b82efb197d04e"
 SRC_URI = " \
-    git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https \
+    git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https;tag=${PV} \
     file://90-OE-disable-session-dbus-dependent-features.lua \
 "
 
@@ -114,6 +114,7 @@ python set_dynamic_metapkg_rdepends () {
 
 PACKAGES =+ "\
     libwireplumber \
+    ${PN}-bash-completion \
     ${PN}-default-config \
     ${PN}-scripts \
     ${PN}-modules \
@@ -132,6 +133,7 @@ CONFFILES:${PN} += " \
 RRECOMMENDS:${PN} += "pipewire ${PN}-scripts ${PN}-modules-meta"
 
 FILES:${PN} += "${systemd_user_unitdir} ${systemd_system_unitdir} ${datadir}/zsh"
+FILES:${PN}-bash-completion += "${datadir}/bash-completion/completions/wpctl"
 
 FILES:libwireplumber = " \
     ${libdir}/libwireplumber-*.so.* \
@@ -142,3 +144,4 @@ FILES:${PN}-scripts += "${datadir}/wireplumber/scripts/*"
 # Dynamic packages (see set_dynamic_metapkg_rdepends).
 FILES:${PN}-modules = ""
 RRECOMMENDS:${PN}-modules += "${PN}-modules-meta"
+RDEPENDS:${PN}-bash-completion = "bash bash-completion"

