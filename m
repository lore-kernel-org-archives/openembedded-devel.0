Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A7DC74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:24:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.19811.1679419455849418684
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 10:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K7lvJI4/;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id bc12so16177547plb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 10:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679419455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=La72aLYAsjGxgTZmI580hAOba0w5qXmvsdcnzFN8/N0=;
        b=K7lvJI4/PufPTclXxwMi6pz/ReVo7+aoUf50V+difhfOX37GnlRtXOrhesBkwQLNvi
         GpNy/zfAAPAIP/8QqLxDhHpgzzOlFEFCla8SFBMgRvCBm4ZnES/W+2t9zMz4TMwsWQJQ
         XuraLXI5eAdv51Ah9ZsxlN6AaUnjDahQu1+yp/Qxl4ghaCu/zk5e5DezQTFGuKSyLKEc
         C+CXb951cj4SntsHFiifcbM/XUcr7IV+MJcEu2gvtFY7iUd2kuR6ZHqIXgVsfrxQNYZe
         gaYYEcPhWeM16xaFkp3tfuXPc40CcrbtwmYwaOoigAJ3DXxCCUM6rPvnljlCACH2l3JW
         6E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679419455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=La72aLYAsjGxgTZmI580hAOba0w5qXmvsdcnzFN8/N0=;
        b=Ys9TSDgeeDbuqP1l7jjtp/gn6vxGGKE8vPXwshRR6GlXiJD/uhjV5X7A10oiJNMXrl
         +DKLGEuEbnFpB3jcl88hJcpE0NEAF7WocMEY4Fhrgniz/A5a5V5cusFc7uyY4YHXv8x8
         0oUn1A/brY9RYnC/0eIcukFvkTdgIUeRaWbqAcGSM0vlAl7EBoz1NmJ4DctM0uk8HDx7
         hCbDmKpsHb4jWzy38Gf17YGyWSsLJy+MJ69yk5s8gw+db7Cvhs41q6Ji6SWTXB4FdRlf
         nwLXLYNarKgOqSmRdmLhMTzN8j7rfX6exgR17PmaiirbwxZZ4a8YpHfl1NipZ3R/gxIn
         7ytw==
X-Gm-Message-State: AO0yUKXF5djJUvB1/10Q2IScWD6iSSLb8eUDGNS2unfxEh+0QJCCMfeQ
	ZAmJdfwHFKHrL9iBGqf0PeCnMfdabSVnSQ==
X-Google-Smtp-Source: AK7set9GsRHFIUdxf88X0d2uM7LLIZykbhYet9HWKzAJcX2VhZQhCJFqfRcXsH+vZVx2PAPLHGZrlw==
X-Received: by 2002:a17:90a:1a01:b0:23f:1159:c0c8 with SMTP id 1-20020a17090a1a0100b0023f1159c0c8mr470241pjk.35.1679419454683;
        Tue, 21 Mar 2023 10:24:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::86bb])
        by smtp.gmail.com with ESMTPSA id s29-20020a63525d000000b0050fb618800dsm967426pgl.67.2023.03.21.10.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:24:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] packagegroup-meta-multimedia: Remove library only packages from rdeps
Date: Tue, 21 Mar 2023 10:24:11 -0700
Message-Id: <20230321172411.2055216-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 17:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101622

Because they get renamed, it is better to ignore them and let a
dependency build them

Fixes errors like
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (gssdp to libgssdp-1.2-0)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-meta-multimedia.bb           | 34 ++-----------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 6f5c244519..589794ebfe 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -25,65 +25,45 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     bluealsa \
     caps \
     cdparanoia \
-    dcadec \
     dleyna-connector-dbus \
-    dleyna-core \
     dleyna-renderer \
     dleyna-server \
     dvb-apps \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faac fdk-aac mpd", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faac mpd", "", d)} \
     gerbera \
-    libao \
     libavc1394 \
-    libdc1394 \
-    libdvbpsi \
-    libdvdnav \
     libiec61883 \
-    fluidsynth \
+    fluidsynth-bin \
     libmusicbrainz \
-    libmpdclient \
     mpc \
     ncmpc \
-    libmpd \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "opencore-amr vo-aacenc vo-amrwbenc", "", d)} \
-    gst-shark \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "opencore-amr", "", d)} \
     gstd \
     rtmpdump \
     bigbuckbunny-1080p \
     bigbuckbunny-480p \
     bigbuckbunny-720p \
     tearsofsteel-1080p \
-    schroedinger \
     pipewire \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "projucer", "", d)} \
     libcamera \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libde265 openh264", "", d)} \
     vorbis-tools \
-    libdvbcsa \
     libopenmpt \
-    libuvc \
     mimic \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "minidlna", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pulseaudio", "mycroft", "", d)} \
     openal-soft \
     opusfile \
     opus-tools \
-    libdvdcss \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "vlc", "", d), "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "sox streamripper", "", d)} \
     tinyalsa \
-    tremor \
-    webrtc-audio-processing \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 i686 x86-64", "x265", "", d), "", d)} \
 "
 RDEPENDS:packagegroup-meta-multimedia:remove:libc-musl = "projucer"
-RDEPENDS:packagegroup-meta-multimedia:remove:powerpc64le = "openh264"
 
 RDEPENDS:packagegroup-meta-multimedia-connectivity = "\
-    gssdp \
-    gupnp-av \
     gupnp-dlna \
-    gupnp-igd \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gupnp-tools", "", d)} \
     gupnp \
     libupnp \
@@ -94,17 +74,9 @@ RDEPENDS:packagegroup-meta-multimedia-dvb = "\
     tvheadend \
 "
 
-RDEPENDS:packagegroup-meta-multimedia-mkv = "\
-    libebml \
-    libmatroska \
-"
-
 RDEPENDS:packagegroup-meta-multimedia-support = "\
     crossguid \
-    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "libmediaart-2.0", "", d)} \
     gst-instruments \
-    libsrtp \
-    srt \
 "
 # devel headers/libraries only packages
 # libsquish
-- 
2.40.0


