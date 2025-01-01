Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948E9E7718B
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 14:13:08 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.14765.1735740784773855106
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jan 2025 06:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B5FGy6MY;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e398484b60bso12557067276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 06:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735740784; x=1736345584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RnRADRLuqh8HuqY6VSPQ+PxaTnS+Yu76RRvdxm/psOU=;
        b=B5FGy6MYHgXEaad2cBypKcu4MFntBqWLVuYeG5uAu8bYPXVoSZZ43KC4JCPU4m/WSI
         fIAAEgy12TLIvvxyzj9igH03VEmZZY+IpvXYEa8azUNbmENjfzlqbMPhl7YaMslf7W7f
         pOPF6apNGHEyLh+5uGO7bDH50bjuLnQW5brBFj90LB76wsxlmMFOO6yr71khRRo+OzSg
         7kGMwYbqTeMBRnSJe8UXIcqh3PTcKN6QJkXKSffUZWBRDJMochbrJ7zfd82RwkhcaLtY
         XmuM60nDfSA2R7r+2eVphr7nhIc7uPvcMsr7yAW0qYKyW8O2PsvsLO8eaW//1+fQ8Uwa
         kTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735740784; x=1736345584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnRADRLuqh8HuqY6VSPQ+PxaTnS+Yu76RRvdxm/psOU=;
        b=JeZbrRQqg42863sHrRdMicK/zVbF7jkhE1MWLTaZ2Bu5T9XPIRRo7fih/NoWLIh1OW
         XBB919o4v4UoMcykP7knTqHotxNFvPrikYz+LPGGoM8VBTPAMw1rvKwvv8Mv1eEWMlBz
         A1R5jk2uCTIDVYlKTczLX07A5x1YGcLuVeJwZhCRb5+Alqa3niqYrjspdx8vls8zK38r
         BnNXrcHo1A2mdem74KX7k7RPWhghkgn/klSwxJm6Pp2X7E1vFAjk3svwaSVKnPfG0o/L
         NPWx5JykFOC5YS7IcSOampE4nsdjcl0dt2AEopWDApKyy53NPN70ZA1PGjFZIFq1+hLP
         saYw==
X-Gm-Message-State: AOJu0YwnzgRmpODQVPhJvQ4pG4DcnO17lHP9LvHjGI1Z9zmnNsMlziIk
	912u37uWVCvGXllvfJGCAS2wMYyIIJKIpydf35YDePUzHuEk++No7eDJiQmI
X-Gm-Gg: ASbGncsv3QLBxf/dfuOP3OXkY/RaZ0CT8f6cXxDv1O+Xqu80BOeAA130w670qdZpdG+
	ved8hABC4YHBicn8lgx2YMeypR5MuxaaQMp7kckUPWih1Oc6rH7Zen6auaUJm+M+mwfHq8OYSb1
	mS8GsSmB8RWzaDoCbQtQwn/2BfRHRZStA12Mf0dsNu6MwderomlsVgNBnMDhwhZr7VSVIbQVFTA
	R9sTmaLXMBUac0AiXXRUb07YSer/4bIKCJzgyXrVwWMvOMT7CeQDZDdrtpy6Wi0AjjuS+s=
X-Google-Smtp-Source: AGHT+IH3tgpf/W/ViCYRCgCp2ubcNOhquidC8npdQOdiJaEwbjoLr4RAS83zbiTaQrEJrEwT92WrLw==
X-Received: by 2002:a05:690c:74c3:b0:6ef:738a:94b3 with SMTP id 00721157ae682-6f3f80d16c5mr250849877b3.4.1735740783801;
        Wed, 01 Jan 2025 06:13:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:96f5:c643:ece4:950a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e77ed577sm67775297b3.76.2025.01.01.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 06:13:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][kirkstone][PATCH
Date: Wed,  1 Jan 2025 09:13:02 -0500
Message-ID: <20250101141302.3853057-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 14:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114609

From: Khem Raj <raj.khem@gmail.com>

Because they get renamed, it is better to ignore them and let a
dependency build them

Fixes errors like
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (gssdp to libgssdp-1.2-0)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit eafecde2aedae38879b4c45dd213ff9483f209ad)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroup-meta-multimedia.bb           | 34 ++-----------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index b0fce73b53..f4f5578bfb 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -25,67 +25,45 @@ RDEPENDS:packagegroup-meta-multimedia = "\
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
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
     libcamera \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libde265 openh264", "", d)} \
     vorbis-tools \
-    libdvbcsa \
     libopenmpt \
-    libuvc \
     mimic \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "minidlna", "", d)} \
     mycroft \
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
-    gupnp \
     libupnp \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "rygel", "", d)} \
 "
@@ -94,17 +72,9 @@ RDEPENDS:packagegroup-meta-multimedia-dvb = "\
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
2.43.0


