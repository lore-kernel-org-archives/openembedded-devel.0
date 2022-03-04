Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6B3C4321E
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:33 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.5027.1646383827024473208
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EWICeI6+;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id z15so7079303pfe.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BfjMlI+bD3xxcEBj5xeFCdDnvg90ZP9uRfuCwh//xeE=;
        b=EWICeI6+9vVPodPhFBxCij4cliTacwLO1wELUjKLUm0E7Yh17IM7WwPfJQ+bEY5N8f
         oQZCv0ssHVqg0AKm2KoC3OlyTk/6xFrbFRRrnvI7jnTxkJ4xyf64Eb3IHTpBkkBWJII7
         gKP/P3wvGk+29ps4zg3mlLbBGb+8qzDe8Kv5iufc/5riWZqsmSdpcybO6oMTrB52aNhl
         7ZuOvQFFB4scn/6JCwIvHIIvdiLITsb/+cwkc3hZMP0KsyJeKvFivlsNpC8zbWtaCy7z
         sauISqxi/rzAn8KFelHQULTdZUY0tzmwFsdRR6IF/g/lH/vPu8CTtWDdu8qZbplIhC22
         d6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BfjMlI+bD3xxcEBj5xeFCdDnvg90ZP9uRfuCwh//xeE=;
        b=zPPtjQkVN/USzKwToslRRhMMy4i3gtwRF9ZNnpbwDjYhhSaNk8OBIZcb+k3s8T/EeR
         msQ599tfZfeW9TVvvGcbz/qW+2tP7UW0E/HKdp9OD0TqkApZ//7hQDFu3688444mPgYJ
         CucOvSKtR+qMljzLFLUNS5KwZQDeqklT1VpAEbCIUHbjVeGxUpI7GfUh3DjPiLdrnhmW
         nMk9U1b/J4kBLVYgxoz6HWxCY4kUSuFAhaabLz/PJBo6CI/3+B2xmV7OOJvBQAPycTSq
         nDctN/p/C6WxMuTwlTxgoiS0CguxBqgk4t0/8OIHbGgVKbxRQbztoMrBlROHzgcyDnv/
         BXQQ==
X-Gm-Message-State: AOAM532LdHJvva9ROOvlk2yRAlpuM9yAkVu7et5Vb3HEN5/Og8cRC5hq
	9I15AsWouH0STq2gnTI8okS5ChkBTOuCVQ==
X-Google-Smtp-Source: 
 ABdhPJzEPLLGSiAN2mx/HqKnG3cxF3ZZg0FtRKIw/N9Je2FxKlpChI+ap/eZF2vtnwUzNlTq8WKzcQ==
X-Received: by 2002:a65:56cb:0:b0:378:82ed:d74 with SMTP id
 w11-20020a6556cb000000b0037882ed0d74mr22681595pgs.491.1646383825688;
        Fri, 04 Mar 2022 00:50:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 05/10] recipes: Update LICENSE variable to
 use SPDX license identifiers
Date: Fri,  4 Mar 2022 00:50:13 -0800
Message-Id: <20220304085018.1255075-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304085018.1255075-1-raj.khem@gmail.com>
References: <20220304085018.1255075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:50:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95772

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb     | 2 +-
 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb | 2 +-
 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb   | 2 +-
 .../recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb            | 2 +-
 meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb      | 2 +-
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb                  | 2 +-
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb          | 2 +-
 meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb            | 2 +-
 meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb    | 2 +-
 meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb | 2 +-
 meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb          | 2 +-
 .../recipes-multimedia/cdparanoia/cdparanoia_10.2.bb            | 2 +-
 meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb          | 2 +-
 .../recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb    | 2 +-
 meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb  | 2 +-
 .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb          | 2 +-
 .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
 meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb   | 2 +-
 meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb        | 2 +-
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc    | 2 +-
 meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb     | 2 +-
 .../recipes-multimedia/gstreamer-1.0/gst-shark_git.bb           | 2 +-
 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb    | 2 +-
 meta-multimedia/recipes-multimedia/juce/projucer.inc            | 2 +-
 meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb         | 2 +-
 .../recipes-multimedia/libavc1394/libavc1394_0.5.4.bb           | 2 +-
 meta-multimedia/recipes-multimedia/libcamera/libcamera.bb       | 2 +-
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb | 2 +-
 meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb   | 2 +-
 meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb | 2 +-
 meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb | 2 +-
 meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb | 2 +-
 .../recipes-multimedia/libiec61883/libiec61883_1.2.0.bb         | 2 +-
 meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb       | 2 +-
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb        | 2 +-
 meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb    | 2 +-
 meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb          | 2 +-
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb        | 2 +-
 meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb        | 2 +-
 meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb | 2 +-
 meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb | 2 +-
 meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb | 2 +-
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb     | 2 +-
 .../recipes-multimedia/schroedinger/schroedinger_1.0.11.bb      | 2 +-
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb            | 2 +-
 .../recipes-multimedia/streamripper/streamripper_1.64.6.bb      | 2 +-
 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb       | 2 +-
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb          | 2 +-
 .../recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb       | 2 +-
 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb           | 2 +-
 .../recipes-support/gst-instruments/gst-instruments_git.bb      | 2 +-
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb        | 2 +-
 52 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
index 97b0bbd287..1d8cbb1aea 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP \
                (Simpe Service Discovery Protocol)."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gssdp/"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gssdp/-/issues"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb
index e1758c19b2..8dc5fce199 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Helpers for AV applications using DLNA"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=1;endline=22;md5=1b85459f65cb1e73a885ca137aab6274"
 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb
index 4bbfb6e705..49cd8d8318 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Helpers for interacting with Internet Gateway Devices over UPnP"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libgupnp-igd/gupnp-simple-igd.c;beginline=1;endline=21;md5=aa292c0d9390463a6e1055dc5fc68e80"
 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb
index 49f7d91b74..20aced8329 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tools for GUPnP"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/network-light/main.c;beginline=1;endline=21;md5=2c39b3a000495dabd4932f231c7efed8"
 
diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
index 9633cab530..ec7824b60d 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
@@ -5,7 +5,7 @@ Additionally, media player software may use Rygel to become a MediaRenderer \
 that may be controlled remotely by a UPnP or DLNA Controller."
 HOMEPAGE = "http://live.gnome.org/Rygel"
 
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index 5acdd7ebc7..7c09e39d66 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -1,7 +1,7 @@
 SUMMARY = "OSCam: Open Source Conditional Access Module"
 HOMEPAGE = "http://www.streamboard.tv/oscam/"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libusb1 openssl pcsc-lite"
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 193055893c..c278cf5994 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -5,7 +5,7 @@ inherit autotools-brokensep gettext gitpkgv pkgconfig
 
 DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl uriparser zlib"
 
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
 
 SRC_URI = "git://github.com/tvheadend/tvheadend.git;branch=master;protocol=https \
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
index 70df73f835..744486fa2a 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "libebml is a C++ libary to parse EBML files"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "\
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
index fdffa41ec5..890be69269 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "libmatroska is a C++ libary to parse Matroska files (.mkv and .mka)"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libebml"
diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
index 4d100999b6..b5c8ddca11 100644
--- a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A real-time adjustable equalizer plugin for ALSA"
 HOMEPAGE = "https://web.archive.org/web/20161105202833/http://thedigitalmachine.net/alsaequal.html"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 DEPENDS = "alsa-lib"
diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
index ed2b6c6adf..f33d7ad582 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "The CAPS Audio Plugin Suite - LADSPA plugin suite"
 HOMEPAGE = "http://quitte.de/dsp/caps.html"
-LICENSE = "GPL-3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://quitte.de/dsp/${BPN}_${PV}.tar.bz2 \
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
index 27fa0e5855..0b844ee7d3 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
@@ -4,7 +4,7 @@ error corrections, hence the name paranoia."
 HOMEPAGE = "https://www.xiph.org/"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=d370feaa1c9edcdbd29ca27ea3d2304d"
 
 SRC_URI = "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-${PV}.src.tgz \
diff --git a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
index 343b9d7915..ddd4c26efe 100644
--- a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "DTS Coherent Acoustics decoder with support for HD extensions"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
 
 SRCREV = "b93deed1a231dd6dd7e39b9fe7d2abe05aa00158"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
index 5645de2a71..033854f19e 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "D-Bus connector for dLeyna libraries"
 HOMEPAGE = "https://01.org/dleyna/"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://src/connector-dbus.c;endline=21;md5=0a1695cef53beefc36651de439f643b5"
 
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
index 647532d9fa..eafbb50db4 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
@@ -5,7 +5,7 @@ e.g., dleyna-server. In brief, it provides APIs for logging, error, settings \
 and task management and an IPC asbstraction API."
 HOMEPAGE = "https://01.org/dleyna/"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://libdleyna/core/core.c;endline=21;md5=68602998351825b0844aae34c684c54e"
 
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
index 9c4af8128d..3e43c0d2a7 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -4,7 +4,7 @@ that allow clients to discover and manipulate Digital Media Renderers. \
 An implementation of such a service for linux is also included."
 HOMEPAGE = "https://01.org/dleyna/"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://libdleyna/renderer/server.c;endline=21;md5=f51acd4757fb6a779a87122c43cf1346"
 
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index 036d5c1591..b25e446c41 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -4,7 +4,7 @@ allow clients to discover, browse and manipulate Digital Media Servers. \
 An implementation of such a service for linux is also included."
 HOMEPAGE = "https://01.org/dleyna/"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://libdleyna/server/server.c;endline=22;md5=437455d8aeff69ebd0996a76c67397bb"
 
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
index 3cf0ca4eb8..98970d5b71 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Linux DVB API applications and utilities"
 HOMEPAGE = "http://www.linuxtv.org"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "3d43b280298c39a67d1d889e01e173f52c12da35"
 
diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
index 44662e2a30..1663548b22 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
 SECTION = "libs"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 HOMEPAGE = "http://www.audiocoding.com/faac.html"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 978d05e74a..218a51fc48 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Fluidsynth is a software synthesizer"
 HOMEPAGE = "http://www.fluidsynth.org/"
 SECTION = "libs/multimedia"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https"
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
index 7e6ae97983..cbb127d3dc 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
@@ -1,6 +1,6 @@
 Description = "Gerbera - An UPnP media server"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https;branch=master \
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index 8c0a5c153f..4e50897de6 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Gst-Shark Tracers"
 DESCRIPTION = "Benchmarks and profiling tools for GStreamer"
 HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=GstShark"
 SECTION = "multimedia"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97"
 
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index d37ab986c0..38fafe82e4 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Gstreamer Daemon"
 SUMMARY = "GStreamer framework for controlling audio and video streaming using TCP connection messages"
 HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=Gstd-1.0"
 SECTION = "multimedia"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon jansson"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
index ee97993426..37680f498e 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Projucer is used to build and generate support files and build in
 JUCE supported platforms, including Linux and Embedded Linux."
 SECTION = "utils"
 HOMEPAGE = "http://juce.com/"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e9c2db7897c0349a4cc1c6d2a8c5d5"
 
 inherit pkgconfig features_check
diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index e6a9b7d250..b30f398e87 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Libao is a cross-platform audio library that allows programs to \
 SECTION = "multimedia"
 HOMEPAGE = "https://www.xiph.org/ao/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI="http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
diff --git a/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb b/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
index f85c166f1e..02a90c547d 100644
--- a/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
+++ b/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
@@ -6,7 +6,7 @@ SECTION = "libs/multimedia"
 DEPENDS = "libraw1394"
 DEPENDS:append:libc-musl = " argp-standalone"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index a8d54f08f6..7136260699 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linux libcamera framework"
 SECTION = "libs"
 
-LICENSE = "GPL-2.0+ & LGPL-2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "\
     file://LICENSES/GPL-2.0-or-later.txt;md5=fed54355545ffd980b814dab4a3b312c \
diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
index c9ade4ac99..d5e189dcb6 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Capture and control API for IIDC compliant cameras"
 HOMEPAGE = "http://sourceforge.net/projects/libdc1394/"
 SECTION = "libs"
-LICENSE = "LGPL-2.0"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
 
 # libsdl to provide sdl.m4 with AM_PATH_SDL
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
index f101afd193..d0ecd04f16 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
@@ -4,7 +4,7 @@ simple integration into other software."
 HOMEPAGE = "http://www.libde265.org/"
 SECTION = "libs/multimedia"
 
-LICENSE = "LGPLv3 & MIT"
+LICENSE = "LGPL-3.0-only & MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
index f9b8c7d722..5de717c281 100644
--- a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Open implementation of the DVB Common Scrambling Algorithm, encrypt and decrypt "
 SECTION = "libs/multimedia"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRCREV = "bc6c0b164a87ce05e9925785cc6fb3f54c02b026"
diff --git a/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb b/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
index 48b0111047..5ca146792c 100644
--- a/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libdvbpsi is a simple library designed for decoding \
 and generation of MPEG TS and DVB PSI tables according to standards \
 ISO/IEC 13818 and ITU-T H.222.0."
 HOMEPAGE = "http://www.videolan.org/developers/libdvbpsi.html"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.videolan.org/pub/libdvbpsi/${PV}/libdvbpsi-${PV}.tar.bz2"
diff --git a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
index c1a9c4879a..766ee02ca2 100644
--- a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "library for DVD navigation features"
 SECTION = "libs/multimedia"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libdvdread"
 
diff --git a/meta-multimedia/recipes-multimedia/libiec61883/libiec61883_1.2.0.bb b/meta-multimedia/recipes-multimedia/libiec61883/libiec61883_1.2.0.bb
index e6079bd752..7c90faa45e 100644
--- a/meta-multimedia/recipes-multimedia/libiec61883/libiec61883_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libiec61883/libiec61883_1.2.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs/multimedia"
 
 DEPENDS = "libraw1394"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=771782cb6245c7fbbe74bc0ec059beff"
 
 SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}.tar.xz"
diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index 0cdc709f09..ac0165a5d0 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://mimic.mycroft.ai/"
 SECTION = "multimedia"
 
 # "Mimic is available under permissive BSD-like licenses"
-LICENSE = "MIT-X & \
+LICENSE = "MIT & \
            PD & \
            CMU-Tex & \
            BSD & \
diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 3564f6df87..803c6279ce 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "MusicBrainz client library"
 DESCRIPTION = "The MusicBrainz client is a library which can be built into other programs.  The library allows you to access the data held on the MusicBrainz server."
 HOMEPAGE = "http://musicbrainz.org"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "expat libxml2 libxml2-native neon neon-native libmusicbrainz-native"
 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
index 54d79109df..d5ee395af8 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Music Player Daemon library"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 DEPENDS = "glib-2.0"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
index 09190a8197..b3178ea81b 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A minimalist command line interface to the Music Player Daemon"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE = "https://www.musicpd.org/clients/mpc/"
 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb
index 5596760d56..f6baca5239 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Music Player Daemon"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 HOMEPAGE ="http://www.musicpd.org"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
index b1ecbf1e43..3f51d7a273 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A curses client for the Music Player Daemon"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE = "https://www.musicpd.org/clients/ncmpc/"
 
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
index 095ef93a11..ad70005721 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "OpenAL is a cross-platform 3D audio API"
 HOMEPAGE = "http://kcat.strangesoft.net/openal.html"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e"
 
 inherit cmake pkgconfig
diff --git a/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb b/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
index b5e6ed947a..b76c5ba01d 100644
--- a/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
+++ b/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Opus Audio Tools"
 HOMEPAGE = "http://www.opus-codec.org/"
 
-LICENSE = "BSD-2-Clause & GPLv2"
+LICENSE = "BSD-2-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79f6fc2a6239fbe5f6e52f20ac76698c"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
index d6dfd87fce..52a672f042 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Multimedia processing server for Linux"
 AUTHOR = "Wim Taymans <wtaymans@redhat.com>"
 HOMEPAGE = "https://pipewire.org"
 SECTION = "multimedia"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=d8153c6e65986f862a0550ca74a3ed73 \
     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
index 53ee2a82fb..aa92c58808 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "RTMP Dump"
 DESCRIPTION = "rtmpdump is a toolkit for RTMP streams. All forms of RTMP are \
 supported, including rtmp://, rtmpt://, rtmpe://, rtmpte://, and rtmps://."
 HOMEPAGE = "http://rtmpdump.mplayerhq.hu/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "gnutls zlib"
diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
index 2f1fda341e..c9d98a2da1 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Dirac compressed video encoder/decoder"
 HOMEPAGE = "http://schrodinger.sourceforge.net/"
-LICENSE = "MPL-1.1 | GPLv2 | LGPLv2 | MIT"
+LICENSE = "MPL-1.1 | GPL-2.0-only | LGPL-2.0-only | MIT"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d91a46405fc074b88c963cc4f2a0aae9 \
                     file://COPYING.GPL;md5=e181e3b7c66f5f96921d813c1074f833 \
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 544b6138fc..0791c85f74 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -23,7 +23,7 @@ PACKAGECONFIG[id3tag] = "--with-id3tag,--without-id3tag,libid3tag,"
 PACKAGECONFIG[lame] = "--with-lame,--without-lame,lame,"
 PACKAGECONFIG[ao] = "--with-ao,--without-ao,libao,"
 
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24"
 
diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
index 3068a476e5..6014326826 100644
--- a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "download online streams into audio files"
 DESCRIPTION = "This command-line tool can be used to record MPEG III \
 and OGG online radio-streams into track-separated audio files."
 HOMEPAGE = "http://streamripper.sourceforge.net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "glib-2.0 libmad libogg libvorbis"
 
diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
index fe06699ab4..0b472b81d9 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "libdvdcss is a simple library for accessing DVDs like block devices"
 DESCRIPTION = "libdvdcss is a simple library designed for accessing DVDs like a block device without having to bother about the decryption."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-${PV}.tar.bz2"
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
index 2e3eb3e245..9b85cb5374 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Video player and streamer - davinci edition"
 HOMEPAGE = "http://www.videolan.org"
 SECTION = "multimedia"
 
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native bison-native \
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
index f399bfaa28..290162127f 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
@@ -5,7 +5,7 @@ include some command line applications to use the libraries."
 HOMEPAGE = "http://www.vorbis.com/"
 BUGTRACKER = "https://trac.xiph.org"
 SECTION = "multimedia"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libogg libvorbis"
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
index 3d8aef0cfe..c36619b819 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "H.265/HEVC video encoder"
 DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
 HOMEPAGE = "http://www.videolan.org/developers/x265.html"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
 
diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
index c3457217eb..9a6c71cb71 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Profiling utilities for GStreamer 1.0 pipelines"
 HOMEPAGE = "https://github.com/kirushyk/gst-instruments"
 SECTION = "multimedia"
 
-LICENSE = "LGPL-3.0"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 DEPENDS = "gstreamer1.0"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
index ffedb2625e..ad42e27278 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library tasked with managing, extracting and handling media art caches"
 
-LICENSE = "LGPLv2+ & GPLv2+"
+LICENSE = "LGPL-2.0-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
                     file://libmediaart/extract.c;endline=18;md5=dff2b6328ab067b5baadc135f9876c36 \
                     file://tests/mediaarttest.c;endline=18;md5=067106eaa1f7a9d918759a096667f18e"
-- 
2.35.1


