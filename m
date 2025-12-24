Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089C3E78496
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 20:55:26 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128349.1766609720188752421
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 12:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SWDa1bvU;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so52475345e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766609718; x=1767214518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dht8/SnxA3QBadAXkIPu+ohTaBN/K27LsdFN4QyAEP4=;
        b=SWDa1bvUOJFtdyyzoIv4l5IBB2SjzE2ZU76XWVMfPzPvLA6tfOeuwCfcaJa+I4sh85
         RcijtsHsijQEPVnB/p/GbE5Usno2pMqJxKKvjBWvX3gRg1B1iMbLSc+ly/L+urJKvIp/
         ebHvKaJ6a31n8S4dOB/237BI5Ibw7RhZpRXLJsR3T64iWWka2rm7J+OrjUUw4hEmqTP+
         t+ClLuMRNyRUGvO+vQDaMVu7KCyjJpsGCuGbouCfPnh9z06dywG+oRk7cZh0ZolE4Jx6
         GTUDd7U7qgnuV1KmsVgCakPqcZQ5QcP9pNdHY4s8F1U5Qs/kb4smbB6vlRIjM3Jm4P3K
         N/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766609718; x=1767214518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dht8/SnxA3QBadAXkIPu+ohTaBN/K27LsdFN4QyAEP4=;
        b=WfyBMVoQgUzXVD1jVBkugcsA4XXAgLbTYyiW7HxCz4JPwcK2mdRk/mYY7zUxjOs20m
         uI4RKPPIPb1N96NemGah3edn+z1PTvaenrRrcXqoB7QWknV71XcQPCPolmcGzPAj0RG0
         fEcSTR8EVtfsG8V92eftxK/RR/Q8JKC3PoPRVVpQmmvsKMId7ABkpaqEQGIAcsRks14H
         b2rt8jGE5lLH7JmELPCPsuZCQ27eLtf8R35TiUkM++gaHVB/Y6AP+G8dm3GlY+dtPQ1g
         tSSRJ5K0X2QTKHFP4IQxJ/agqFOFn8oLmEqp4ID2KBqEW2UijzQk9jvWZSAZJL3hXXXC
         eMvw==
X-Gm-Message-State: AOJu0Ywk95ibb4xV3dFv0VZzjJpVIQUAKYsJR0UN8Evt8BsRyMQgfnGh
	hw2BOTzbg5ucfJZKnVRohS4zIrnrnUU2f4i4F1tTY6bbdriY3hlHKr/qIjrXzw==
X-Gm-Gg: AY/fxX58iv3RY+F3GTKdzlq9GsrAgDATRfD1OnN9d1GMLzZNvM65LYmQrrM2pJIgBJG
	agxbpxf3ikDPmzNJ0AsOX3QTPbhFiUDJKeR8gjGzDJvMd0UcmCYNRBILulbta4oc4bF6mK/+VnG
	fRFIYYr/dFTU+D7LGZ6JGNhSsiSl4rbXCRH/UgTFDFFHfI/lZphBtIo3kE5ffGDy6RDefFC/uDk
	02TE5I4rSf3OCT7TxlMXHNQqkksKkYc+AdoUaVvhh33o98bRNGV53RhdTAvEdkJYPE6ZtO8qZxf
	b5gamSNw0DLJDnlOuWsE0aCqFaTGm16yAGxf4EVCuO/ZxqTHOty4WwYDcBwGLFMczzHlTH3gV/9
	fmET3klNmPOwt1mm1rTIOuGPjk0IIbnoLV0ravd9TdX2fHEFGz5XoYLLaslJY6dwnKte0T689GG
	OFYv4VkQNp
X-Google-Smtp-Source: AGHT+IHuOeCAN2Pv8NzXhTELI3Yn2Rk0zSjo0qKl1bBBvAetmT4+0Li8oNJYxzmtnEjmJkv+LxUp/w==
X-Received: by 2002:a05:600c:3b8f:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-47d19593d0dmr245599175e9.32.1766609718025;
        Wed, 24 Dec 2025 12:55:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aea77bsm140679535e9.17.2025.12.24.12.55.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 12:55:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH v2 1/2] wireplumber: upgrade 0.5.11 -> 0.5.13
Date: Wed, 24 Dec 2025 21:55:15 +0100
Message-ID: <20251224205516.2850233-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 20:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122903

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

v2: use the bash-completion class instead of manually replicating its functionality

 .../{wireplumber_0.5.11.bb => wireplumber_0.5.13.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.11.bb => wireplumber_0.5.13.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.11.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.11.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
index 665efd95af..b497d51e96 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.11.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.bb
@@ -10,14 +10,14 @@ DEPENDS = "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
 
-SRCREV = "3a785e502642ddb1e91d953e587c7b06444e0b51"
+SRCREV = "84429b47943d789389fbde17c06b82efb197d04e"
 SRC_URI = " \
-    git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https \
+    git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https;tag=${PV} \
     file://90-OE-disable-session-dbus-dependent-features.lua \
 "
 
 
-inherit meson pkgconfig gobject-introspection systemd
+inherit meson pkgconfig gobject-introspection systemd bash-completion
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'

