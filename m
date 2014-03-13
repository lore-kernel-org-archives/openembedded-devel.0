Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD6F6EEFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 11:12:17 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D25FAF811E9; Thu, 13 Mar 2014 05:12:18 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id CF4ECF811DC;
	Thu, 13 Mar 2014 05:12:16 -0600 (MDT)
Message-ID: <53219295.9010302@mlbassoc.com>
Date: Thu, 13 Mar 2014 05:12:21 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1394599581-26844-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1394599581-26844-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-browser][RFT][PATCH] chromium: Upgrade 29 -> 35
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 11:12:18 -0000
X-Groupsio-MsgNum: 48645
Content-Type: multipart/mixed; boundary="------------020704060208010400090600"

--------------020704060208010400090600
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-03-11 22:46, Khem Raj wrote:
> Removed already applied patches
> 
> License year changed thats why there is change in checksum
> 
> -// Copyright 2014 The Chromium Authors. All rights reserved.
> +// Copyright (c) 2013 The Chromium Authors. All rights reserved.
> 
> we see
> 
> rpm/bin/debugedit: canonicalization unexpectedly shrank by one character
> 
> so we add PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ..._focus_tracker_notify_deprecated_since_ATK_2_9_4.patch |  0
>  .../{chromium-29.0.1518.2 => chromium}/armv6/include.gypi |  0
>  .../armv6/oe-defaults.gypi                                |  0
>  .../armv7a/include.gypi                                   |  0
>  .../armv7a/oe-defaults.gypi                               |  0
>  .../{chromium-29.0.1518.2 => chromium}/google-chrome      |  0
>  .../google-chrome.desktop                                 |  0
>  .../{chromium-29.0.1518.2 => chromium}/i586/include.gypi  |  0
>  .../i586/oe-defaults.gypi                                 |  0
>  .../secitem_array.patch                                   |  0
>  .../uninitialised-warning.patch                           |  6 +++---
>  .../{chromium-29.0.1518.2 => chromium}/unistd-2.patch     |  0
>  .../x86-64/include.gypi                                   |  0
>  .../x86-64/oe-defaults.gypi                               |  0
>  .../{chromium_29.0.1518.2.bb => chromium_35.0.1883.0.bb}  | 15 ++++++++-------
>  15 files changed, 11 insertions(+), 10 deletions(-)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv6/include.gypi (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv6/oe-defaults.gypi (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv7a/include.gypi (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv7a/oe-defaults.gypi (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/google-chrome (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/google-chrome.desktop (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/i586/include.gypi (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/i586/oe-defaults.gypi (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/secitem_array.patch (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/uninitialised-warning.patch (96%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/unistd-2.patch (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/x86-64/include.gypi (100%)
>  rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/x86-64/oe-defaults.gypi (100%)
>  rename recipes-browser/chromium/{chromium_29.0.1518.2.bb => chromium_35.0.1883.0.bb} (84%)
> 
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch b/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
> rename to recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi b/recipes-browser/chromium/chromium/armv6/include.gypi
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
> rename to recipes-browser/chromium/chromium/armv6/include.gypi
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi b/recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
> rename to recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi b/recipes-browser/chromium/chromium/armv7a/include.gypi
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
> rename to recipes-browser/chromium/chromium/armv7a/include.gypi
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi b/recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
> rename to recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome b/recipes-browser/chromium/chromium/google-chrome
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
> rename to recipes-browser/chromium/chromium/google-chrome
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
> rename to recipes-browser/chromium/chromium/google-chrome.desktop
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi b/recipes-browser/chromium/chromium/i586/include.gypi
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
> rename to recipes-browser/chromium/chromium/i586/include.gypi
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi b/recipes-browser/chromium/chromium/i586/oe-defaults.gypi
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
> rename to recipes-browser/chromium/chromium/i586/oe-defaults.gypi
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch b/recipes-browser/chromium/chromium/secitem_array.patch
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch
> rename to recipes-browser/chromium/chromium/secitem_array.patch
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch b/recipes-browser/chromium/chromium/uninitialised-warning.patch
> similarity index 96%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
> rename to recipes-browser/chromium/chromium/uninitialised-warning.patch
> index fac12bb..afdd784 100644
> --- a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
> +++ b/recipes-browser/chromium/chromium/uninitialised-warning.patch
> @@ -30,10 +30,10 @@ Make gcc 4.8 happy. It complains about uninitialized symbols
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  
>  Upstream-Status: Unknown
> -Index: chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
> +Index: chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
>  ===================================================================
> ---- chromium-29.0.1518.2.orig/webkit/glue/webclipboard_impl.cc
> -+++ chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
> +--- chromium-29.0.1518.2.orig/content/renderer/webclipboard_impl.cc
> ++++ chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
>  @@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
>   }
>   
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch b/recipes-browser/chromium/chromium/unistd-2.patch
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
> rename to recipes-browser/chromium/chromium/unistd-2.patch
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi b/recipes-browser/chromium/chromium/x86-64/include.gypi
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
> rename to recipes-browser/chromium/chromium/x86-64/include.gypi
> diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi b/recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
> similarity index 100%
> rename from recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
> rename to recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
> diff --git a/recipes-browser/chromium/chromium_29.0.1518.2.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
> similarity index 84%
> rename from recipes-browser/chromium/chromium_29.0.1518.2.bb
> rename to recipes-browser/chromium/chromium_35.0.1883.0.bb
> index 1c62f1e..6a03d6b 100644
> --- a/recipes-browser/chromium/chromium_29.0.1518.2.bb
> +++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Chromium browser"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d2d164565cc10f298390174d9cb6d18d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
>  DEPENDS = "xz-native pciutils pulseaudio xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
>  SRC_URI = "\
>          http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
> @@ -9,12 +9,9 @@ SRC_URI = "\
>          file://unistd-2.patch \
>          file://google-chrome \
>          file://google-chrome.desktop \
> -        file://uninitialised-warning.patch \
> -	file://001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch \
> -	file://secitem_array.patch;striplevel=2 \
>  "
> -SRC_URI[md5sum] = "2480c3fd109ef000575629acb8a906ca"
> -SRC_URI[sha256sum] = "7f08624f7d9bd120de0043da7ee09985ae6b6990d22d8c1b1f7c66fd4ed681a1"
> +SRC_URI[md5sum] = "c0659bc3c6b540e106e043fd27f54358"
> +SRC_URI[sha256sum] = "666d5948c6508072f9f5d6acff82290fa5939e1da1b94b042a1e05daf3357b61"
>  
>  # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
>  COMPATIBLE_MACHINE = "(-)"
> @@ -60,8 +57,9 @@ do_install() {
>  
>  	install -d ${D}${bindir}/chrome/
>  	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
> -	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
>  	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
> +	install -m 0644 ${S}/out/Release/content_resources.pak ${D}${bindir}/chrome/
> +	install -m 0644 ${S}/out/Release/keyboard_resources.pak ${D}${bindir}/chrome/
>  	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
>  	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
>  	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
> @@ -72,3 +70,6 @@ do_install() {
>  
>  FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications"
>  FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
> +
> +PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
> +
> 

I finally got this to build on my beefy machine, but it fails
when launched:
  [0313/110152:FATAL:content_main_runner.cc(734)] Check failed: base::i18n::InitializeICU().

I've built this same system and used the previous version of chrome successfully.

What could be missing/broken?  My package manifest is attached.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------020704060208010400090600
Content-Type: text/plain; charset=UTF-8;
 name="pkgs"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pkgs"

alsa-conf-base cortexa9hf-vfp-neon 1.0.27.2-r0.0
amltd-feed-config-opkg nitrogen6x 1.0-r1.0
base-files nitrogen6x 3.0.14-r86.0
base-passwd cortexa9hf-vfp-neon 3.5.29-r0.0
busybox cortexa9hf-vfp-neon 1.22.1-r0.0
busybox-syslog cortexa9hf-vfp-neon 1.22.1-r0.0
busybox-udhcpc cortexa9hf-vfp-neon 1.22.1-r0.0
bzip2 cortexa9hf-vfp-neon 1.0.6-r5.0
chromium cortexa9hf-vfp-neon 35.0.1883.0-r0.0
coreutils cortexa9hf-vfp-neon 8.22-r0.0
db cortexa9hf-vfp-neon 5.3.21-r0.0
dbus-1 cortexa9hf-vfp-neon 1.6.18-r0.0
dbus-wait cortexa9hf-vfp-neon 0.1+git0+6cc6077a36-r2.0
dropbear cortexa9hf-vfp-neon 2014.63-r0.0
eglibc-binary-localedata-en-us cortexa9hf-vfp-neon 2.19-r0.0
eglibc-gconv cortexa9hf-vfp-neon 2.19-r0.0
eglibc-gconv-iso8859-1 cortexa9hf-vfp-neon 2.19-r0.0
enca cortexa9hf-vfp-neon 1.9-r0.0
ethtool cortexa9hf-vfp-neon 3.13-r0.0
fbset cortexa9hf-vfp-neon 2.1-r3.0
fbset-modes all 0.1.0-r5.0
firmware-imx-vpu-imx6q cortexa9hf-vfp-neon-mx6 1:3.5.7-1.0.0-r0.0
fontconfig-utils cortexa9hf-vfp-neon 2.11.0-r0.0
formfactor nitrogen6x 0.0-r44.0
fsl-alsa-plugins nitrogen6x 1.0.25-r0.0
gconf cortexa9hf-vfp-neon 3.2.6-r0.0
gdk-pixbuf cortexa9hf-vfp-neon 2.30.3-r0.0
gdk-pixbuf-loader-gif cortexa9hf-vfp-neon 2.30.3-r0.0
gdk-pixbuf-loader-jpeg cortexa9hf-vfp-neon 2.30.3-r0.0
gdk-pixbuf-loader-png cortexa9hf-vfp-neon 2.30.3-r0.0
gdk-pixbuf-loader-xpm cortexa9hf-vfp-neon 2.30.3-r0.0
glib-networking cortexa9hf-vfp-neon 2.38.0-r0.0
gnome-mime-data cortexa9hf-vfp-neon 2.18.0-r4.0
gst-ffmpeg cortexa9hf-vfp-neon 0.10.13-r9.0
gst-fluendo-mpegmux cortexa9hf-vfp-neon 0.10.4-r0.0
gst-fsl-plugin nitrogen6x 3.0.10-r0.0
gst-meta-audio cortexa9hf-vfp-neon 0.10-r13.0
gst-meta-base cortexa9hf-vfp-neon 0.10-r13.0
gst-meta-video cortexa9hf-vfp-neon 0.10-r13.0
gst-meta-x11-base cortexa9hf-vfp-neon 0.10-r13.0
gst-plugins-bad-bayer cortexa9hf-vfp-neon 0.10.23-r4.0
gst-plugins-bad cortexa9hf-vfp-neon 0.10.23-r4.0
gst-plugins-bad-mpegdemux cortexa9hf-vfp-neon 0.10.23-r4.0
gst-plugins-bad-mpegtsmux cortexa9hf-vfp-neon 0.10.23-r4.0
gst-plugins-base-alsa cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-app cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-audioconvert cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-audioresample cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-audiotestsrc cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-decodebin2 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-decodebin cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-ffmpegcolorspace cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-gio cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-ogg cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-playbin cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-tcp cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-theora cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-typefindfunctions cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-videorate cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-videoscale cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-videotestsrc cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-volume cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-vorbis cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-ximagesink cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-base-xvimagesink cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
gst-plugins-good-alaw cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-autodetect cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-avi cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-flac cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-id3demux cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-isomp4 cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-matroska cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-rtp cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-rtpmanager cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-souphttpsrc cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-udp cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-video4linux2 cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-good-wavparse cortexa9hf-vfp-neon 0.10.31-r8.0
gst-plugins-ugly cortexa9hf-vfp-neon 0.10.19-r3.0
gst-plugins-ugly-mpegstream cortexa9hf-vfp-neon 0.10.19-r3.0
gst-plugins-ugly-x264 cortexa9hf-vfp-neon 0.10.19-r3.0
gstreamer cortexa9hf-vfp-neon 0.10.36-r2.0
gtk-sato-engine cortexa9hf-vfp-neon 0.3.3+git0+4740ad8d53-r0.0
gtk-theme-sato cortexa9hf-vfp-neon 0.3.3+git0+4740ad8d53-r0.0
hicolor-icon-theme all 0.12-r1.0
imx-lib nitrogen6x 1:3.10.17-1.0.0-r0.0
init-ifupdown cortexa9hf-vfp-neon 1.0-r7.0
initscripts cortexa9hf-vfp-neon 1.0-r154.0
initscripts-functions cortexa9hf-vfp-neon 1.0-r154.0
kernel-3.0.35-4.1.0+yocto+g79a3b6d nitrogen6x 3.0.35-r0.1
kernel-image-3.0.35-4.1.0+yocto+g79a3b6d nitrogen6x 3.0.35-r0.1
kernel-module-camera-sensor-clock nitrogen6x 3.0.35-r0.1
kernel-module-crc-ccitt nitrogen6x 3.0.35-r0.1
kernel-module-drm nitrogen6x 3.0.35-r0.1
kernel-module-g-cdc nitrogen6x 3.0.35-r0.1
kernel-module-g-ether nitrogen6x 3.0.35-r0.1
kernel-module-g-file-storage nitrogen6x 3.0.35-r0.1
kernel-module-g-serial nitrogen6x 3.0.35-r0.1
kernel-module-gspca-main nitrogen6x 3.0.35-r0.1
kernel-module-i2c-algo-bit nitrogen6x 3.0.35-r0.1
kernel-module-ipu-bg-overlay-sdc nitrogen6x 3.0.35-r0.1
kernel-module-ipu-csi-enc nitrogen6x 3.0.35-r0.1
kernel-module-ipu-fg-overlay-sdc nitrogen6x 3.0.35-r0.1
kernel-module-ipu-prp-enc nitrogen6x 3.0.35-r0.1
kernel-module-ipu-still nitrogen6x 3.0.35-r0.1
kernel-module-mxc-v4l2-capture nitrogen6x 3.0.35-r0.1
kernel-module-mxs-perfmon nitrogen6x 3.0.35-r0.1
kernel-module-nls-ascii nitrogen6x 3.0.35-r0.1
kernel-module-nls-utf8 nitrogen6x 3.0.35-r0.1
kernel-module-ov5642-camera nitrogen6x 3.0.35-r0.1
kernel-module-scsi-wait-scan nitrogen6x 3.0.35-r0.1
kernel-modules nitrogen6x 3.0.35-r0.1
kernel-module-tcrypt nitrogen6x 3.0.35-r0.1
kernel-module-uvcvideo nitrogen6x 3.0.35-r0.1
kernel-module-vivante nitrogen6x 3.0.35-r0.1
kernel-module-wl12xx-sdio nitrogen6x 3.0.35-r0.1
kernel-module-xhci-hcd nitrogen6x 3.0.35-r0.1
libapm1 cortexa9hf-vfp-neon 3.2.2-14-r2.0
libasound2 cortexa9hf-vfp-neon 1.0.27.2-r0.0
libass4 cortexa9hf-vfp-neon 0.9.11-r0.0.0
libatk-1.0-0 cortexa9hf-vfp-neon 2.10.0-r0.0
libattr1 cortexa9hf-vfp-neon 2.4.47-r0.0
libavcodec53 cortexa9hf-vfp-neon 0.8.9-r0.0
libavformat53 cortexa9hf-vfp-neon 0.8.9-r0.0
libavutil51 cortexa9hf-vfp-neon 0.8.9-r0.0
libblkid1 cortexa9hf-vfp-neon 2.23.2-r0.0
libbz2-0 cortexa9hf-vfp-neon 1.0.6-r5.0
libc6 cortexa9hf-vfp-neon 2.19-r0.0
libcairo2 cortexa9hf-vfp-neon 1.12.16-r0.0
libcap2 cortexa9hf-vfp-neon 2.22-r6.0
libcrypto1.0.0 cortexa9hf-vfp-neon 1.0.1e-r15.0.0
libdbus-1-3 cortexa9hf-vfp-neon 1.6.18-r0.0
libdbus-glib-1-2 cortexa9hf-vfp-neon 0.100.2-r0.0
libdmx1 cortexa9hf-vfp-neon 1:1.1.3-r0.0
libdricore9.2.5-1 cortexa9hf-vfp-neon-mx6 2:9.2.5-r0.0
libdrm2 cortexa9hf-vfp-neon-mx6 2.4.52-r0.0
libdvdread4 cortexa9hf-vfp-neon 4.2.0-r0.0
liberation-fonts cortexa9hf-vfp-neon 1:1.04-r4.0
libexpat1 cortexa9hf-vfp-neon 2.1.0-r0.0
libfaad2 cortexa9hf-vfp-neon 2.7-r0.0
libfakekey0 cortexa9hf-vfp-neon 0.0+git0+e327ff049b-r0.0
libffi6 cortexa9hf-vfp-neon 3.0.13-r0.0
libflac8 cortexa9hf-vfp-neon 1.3.0-r0.0
libfontconfig1 cortexa9hf-vfp-neon 2.11.0-r0.0
libfontenc1 cortexa9hf-vfp-neon 1:1.1.2-r0.0
libfreetype6 cortexa9hf-vfp-neon 2.5.2-r0.0
libfslcodec-aac nitrogen6x 3.0.10-r0.0
libfslcodec-h264 nitrogen6x 3.0.10-r0.0
libfslcodec-mp3 nitrogen6x 3.0.10-r0.0
libfslcodec-mpeg2 nitrogen6x 3.0.10-r0.0
libfslcodec-mpeg4asp nitrogen6x 3.0.10-r0.0
libfslcodec-nb nitrogen6x 3.0.10-r0.0
libfslcodec-oggvorbis nitrogen6x 3.0.10-r0.0
libfslcodec-peq nitrogen6x 3.0.10-r0.0
libfslcodec-wb nitrogen6x 3.0.10-r0.0
libfslparser nitrogen6x 3.0.10-r0.0
libfslvpuwrap3 nitrogen6x 1.0.45-r0.0
libgal-mx6 cortexa9hf-vfp-neon-mx6 1:3.10.9-1.0.0-hfp-r0.0
libgcc1 cortexa9hf-vfp-neon 4.7.2-r20.0
libgcrypt11 cortexa9hf-vfp-neon 1.5.3-r0.0
libgdbm4 cortexa9hf-vfp-neon 1.11-r0.0
libglade-2.0-0 cortexa9hf-vfp-neon 2.6.4-r5.0
libglib-2.0-0 cortexa9hf-vfp-neon 1:2.38.2-r0.0
libglib-2.0-utils cortexa9hf-vfp-neon 1:2.38.2-r0.0
libgl-mx6 cortexa9hf-vfp-neon-mx6 1:3.10.9-1.0.0-hfp-r0.0
libgmp10 cortexa9hf-vfp-neon 5.1.1-r0.0
libgnutls26 cortexa9hf-vfp-neon 2.12.23-r8.4.0
libgpg-error0 cortexa9hf-vfp-neon 1.12-r0.0
libgstapp-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstaudio-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstfsl-0.10-0 nitrogen6x 3.0.10-r0.0
libgstinterfaces-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstnetbuffer-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstpbutils-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstriff-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstrtp-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstrtsp-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstrtspserver-0.10-0 cortexa9hf-vfp-neon 0.10.8-r0.0
libgstsdp-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgsttag-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgstvideo-0.10-0 cortexa9hf-vfp-neon-mx6 0.10.36-r9.0
libgtk-2.0 cortexa9hf-vfp-neon 2.24.22-r0.0
libgudev-1.0-0 cortexa9hf-vfp-neon 182-r7.1.0
libharfbuzz0 cortexa9hf-vfp-neon 0.9.26-r0.0
libice6 cortexa9hf-vfp-neon 1:1.0.8-r0.0
libjpeg8 cortexa9hf-vfp-neon 8d-r1.0
libkmod2 cortexa9hf-vfp-neon 16+git0+36c4bb928a-r0.0
liblzma5 cortexa9hf-vfp-neon 5.1.3alpha-r0.0
libmb1 cortexa9hf-vfp-neon 1.11-r0.0
libncurses5 cortexa9hf-vfp-neon 5.9-r15.1.0
libncursesw5 cortexa9hf-vfp-neon 5.9-r15.1.0
libogg0 cortexa9hf-vfp-neon 1.3.1-r0.0
libopencv-calib3d2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-contrib2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-core2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-features2d2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-flann2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-highgui2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-imgproc2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-legacy2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-ml2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-nonfree2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-objdetect2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-photo2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopencv-video2.4 cortexa9hf-vfp-neon 2.4.3-r2.0
libopkg1 cortexa9hf-vfp-neon 1:0.2.1-r0.0
libpanelw5 cortexa9hf-vfp-neon 5.9-r15.1.0
libpciaccess0 cortexa9hf-vfp-neon 0.13.2-r0.0
libperl5 cortexa9hf-vfp-neon 5.14.3-r1.0
libpixman-1-0 cortexa9hf-vfp-neon 1:0.32.4-r0.0
libpng16-16 cortexa9hf-vfp-neon 1.6.8-r0.0
libpopt0 cortexa9hf-vfp-neon 1.16-r3.0
libpostproc52 cortexa9hf-vfp-neon 0.8.9-r0.0
libpyglib-2.0-python0 cortexa9hf-vfp-neon 2.27.91-r6.0
libpython2.7-1.0 cortexa9hf-vfp-neon 2.7.3-r0.3.0
librtmp0 cortexa9hf-vfp-neon git-r0.0
libsdl-1.2-0 cortexa9hf-vfp-neon-mx6 1.2.15-r3.0
libsm6 cortexa9hf-vfp-neon 1:1.2.2-r0.0
libsoup-2.4 cortexa9hf-vfp-neon 2.45.3-r0.0
libsqlite3-0 cortexa9hf-vfp-neon 1:3.8.3.1-r0.0
libssl1.0.0 cortexa9hf-vfp-neon 1.0.1e-r15.0.0
libstartup-notification-1-0 cortexa9hf-vfp-neon 0.12-r2.0
libstdc++6 cortexa9hf-vfp-neon 4.7.2-r20.0
libswscale2 cortexa9hf-vfp-neon 0.8.9-r0.0
libtasn1-6 cortexa9hf-vfp-neon 3.4-r0.0
libtheora cortexa9hf-vfp-neon 1.1.1-r1.0
libtiff5 cortexa9hf-vfp-neon 4.0.3-r0.0
libtinfo5 cortexa9hf-vfp-neon 5.9-r15.1.0
libts-1.0-0 cortexa9hf-vfp-neon 1.1-r0.0
libtsmux0 cortexa9hf-vfp-neon 0.3.0-r0.0
libudev0 cortexa9hf-vfp-neon 182-r7.1.0
libuuid1 cortexa9hf-vfp-neon 2.23.2-r0.0
libv4l cortexa9hf-vfp-neon 0.8.8-r0.0
libvivante-dri-mx6 cortexa9hf-vfp-neon-mx6 1:3.10.9-1.0.0-hfp-r0.0
libvorbis cortexa9hf-vfp-neon 1.3.4-r0.0
libvpu4 nitrogen6x 1:3.10.17-1.0.0-r0.0
libvte9 cortexa9hf-vfp-neon 0.28.2-r6.0
libx11-6 cortexa9hf-vfp-neon 1:1.6.2-r0.0
libx11-xcb1 cortexa9hf-vfp-neon 1:1.6.2-r0.0
libx264-129 cortexa9hf-vfp-neon r2230+git-r1.0
libxau6 cortexa9hf-vfp-neon 1:1.0.8-r0.0
libxcalibrate0 cortexa9hf-vfp-neon 0.0+git0+209d83af61-r0.0
libxcb1 cortexa9hf-vfp-neon 1.10-r0.0
libxcb-render0 cortexa9hf-vfp-neon 1.10-r0.0
libxcb-shm0 cortexa9hf-vfp-neon 1.10-r0.0
libxcb-util1 cortexa9hf-vfp-neon 0.3.9-r0.0
libxcomposite1 cortexa9hf-vfp-neon 1:0.4.4-r0.0
libxcursor1 cortexa9hf-vfp-neon 1:1.1.14-r0.0
libxdamage1 cortexa9hf-vfp-neon 1:1.1.4-r0.0
libxdmcp6 cortexa9hf-vfp-neon 1:1.1.1-r0.0
libxext6 cortexa9hf-vfp-neon 1:1.3.2-r0.0
libxfixes3 cortexa9hf-vfp-neon 1:5.0.1-r0.0
libxfont1 cortexa9hf-vfp-neon 1:1.4.7-r0.0
libxft2 cortexa9hf-vfp-neon 1:2.3.1-r0.0
libxi6 cortexa9hf-vfp-neon 1:1.7.2-r0.0
libxinerama1 cortexa9hf-vfp-neon 1:1.1.3-r0.0
libxkbfile1 cortexa9hf-vfp-neon 1:1.0.8-r0.0
libxml2 cortexa9hf-vfp-neon 2.9.1-r0.0
libxmuu1 cortexa9hf-vfp-neon 1:1.1.2-r0.0
libxrandr2 cortexa9hf-vfp-neon 1:1.4.2-r0.0
libxrender1 cortexa9hf-vfp-neon 1:0.9.8-r0.0
libxsettings-client0 cortexa9hf-vfp-neon 0.10-r5.0
libxss1 cortexa9hf-vfp-neon 1:1.2.2-r0.0
libxtst6 cortexa9hf-vfp-neon 1:1.2.2-r0.0
libxv1 cortexa9hf-vfp-neon 1.0.10-r0.0
libxxf86dga1 cortexa9hf-vfp-neon 1:1.1.4-r0.0
libxxf86misc1 cortexa9hf-vfp-neon 1:1.0.3-r0.0
libxxf86vm1 cortexa9hf-vfp-neon 1:1.1.3-r0.0
libz1 cortexa9hf-vfp-neon 1.2.8-r0.0
linux-firmware-wl12xx all 1:0.0+git0+600caefd83-r0.0
locale-base-en-us cortexa9hf-vfp-neon 2.19-r0.0
matchbox-config-gtk cortexa9hf-vfp-neon 0.0+git0+3ed74dfb7c-r0.0
matchbox-desktop cortexa9hf-vfp-neon 2.0+git0+71e3e6e042-r0.0
matchbox-desktop-sato cortexa9hf-vfp-neon 0.1+git0+810b0b08eb-r1.0
matchbox-keyboard-applet cortexa9hf-vfp-neon 0.0+git0+217f1bfe14-r4.0
matchbox-keyboard cortexa9hf-vfp-neon 0.0+git0+217f1bfe14-r4.0
matchbox-keyboard-im cortexa9hf-vfp-neon 0.0+git0+217f1bfe14-r4.0
matchbox-panel-2 cortexa9hf-vfp-neon 2.0+git0+26a3a67b41-r0.0
matchbox-session cortexa9hf-vfp-neon 0.1-r4.0
matchbox-session-sato nitrogen6x 0.1-r30.0
matchbox-terminal cortexa9hf-vfp-neon 0.0+git0+452bca2534-r0.0
matchbox-theme-sato cortexa9hf-vfp-neon 0.1-r1.0
matchbox-wm cortexa9hf-vfp-neon 1.2+git0+29544f0e61-r0.0
mesa-driver-swrast cortexa9hf-vfp-neon-mx6 2:9.2.5-r0.0
modutils-initscripts cortexa9hf-vfp-neon 1.0-r7.0
mplayer2 cortexa9hf-vfp-neon 2.0+gitr0+e3f5043233-r10.0
mplayer-common all 0.0.1-r0.0
mtdev cortexa9hf-vfp-neon 1.1.5-r0.0
ncurses-terminfo-base cortexa9hf-vfp-neon 5.9-r15.1.0
netbase cortexa9hf-vfp-neon 1:5.2-r0.0
nspr cortexa9hf-vfp-neon 4.10.3-r0.0
nss cortexa9hf-vfp-neon 3.15.1-r0.0
ntpdate cortexa9hf-vfp-neon 4.2.6p5-r6.0.0
opencv-apps cortexa9hf-vfp-neon 2.4.3-r2.0
opencv-samples cortexa9hf-vfp-neon 2.4.3-r0.0
openssl-conf cortexa9hf-vfp-neon 1.0.1e-r15.0.0
openssl cortexa9hf-vfp-neon 1.0.1e-r15.0.0
opkg-collateral cortexa9hf-vfp-neon 1.0-r2.0
opkg-config-base nitrogen6x 1.0-r1.0
opkg cortexa9hf-vfp-neon 1:0.2.1-r0.0
packagegroup-amltd-boot nitrogen6x 1.0-r1.0
pango cortexa9hf-vfp-neon 1.36.2-r0.0
pango-module-basic-fc cortexa9hf-vfp-neon 1.36.2-r0.0
perl cortexa9hf-vfp-neon 5.14.3-r1.0
pointercal nitrogen6x 0.0-r11.0
psplash cortexa9hf-vfp-neon 0.1+git0+afd4e228c6-r15.0
psplash-default cortexa9hf-vfp-neon 0.1+git0+afd4e228c6-r15.0
python-2to3 cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-audio cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-bsddb cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-codecs cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-compile cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-compiler cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-compression cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-core cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-crypt cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-ctypes cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-curses cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-datetime cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-db cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-debugger cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-difflib cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-distutils cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-doctest cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-elementtree cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-email cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-fcntl cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-gdbm cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-gst cortexa9hf-vfp-neon 0.10.22-r2.0
python-hotshot cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-html cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-idle cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-image cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-io cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-json cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-lang cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-logging cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-mailbox cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-math cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-mime cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-misc cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-mmap cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-modules cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-multiprocessing cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-netclient cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-netserver cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-nose cortexa9hf-vfp-neon 1.2.1-r0.0
python-numbers cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-numpy cortexa9hf-vfp-neon 1.7.0-r0.0
python-opencv cortexa9hf-vfp-neon 2.4.3-r2.0
python-pickle cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-pkgutil cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-pprint cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-profile cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-pycairo cortexa9hf-vfp-neon 1.10.0-r2.0
python-pydoc cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-pygobject cortexa9hf-vfp-neon 2.27.91-r6.0
python-pygtk cortexa9hf-vfp-neon 2.24.0-r1.0
python-readline cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-re cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-resource cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-robotparser cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-shell cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-smtpd cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-sqlite3 cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-sqlite3-tests cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-stringold cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-subprocess cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-syslog cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-terminal cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-tests cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-textutils cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-threading cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-tkinter cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-tornado cortexa9hf-vfp-neon 2.4.1a-r1.0
python-unittest cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-unixadmin cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-xml cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-xmlrpc cortexa9hf-vfp-neon 2.7.3-r0.3.0
python-zlib cortexa9hf-vfp-neon 2.7.3-r0.3.0
rgb cortexa9hf-vfp-neon 1:1.0.5-r8.0.0
rsync cortexa9hf-vfp-neon 3.1.0-r0.0
rtsp-server nitrogen6x 0.0.1-r0.0
run-postinsts all 1.0-r9.0
sato-icon-theme all 0.4.1-r6.0
settings-daemon cortexa9hf-vfp-neon 0.0+git0+9a99528b02-r0.0
shadow cortexa9hf-vfp-neon 4.1.4.3-r14.0
shadow-securetty nitrogen6x 4.1.4.3-r3.0
shared-mime-info cortexa9hf-vfp-neon 1.2-r0.0
speex cortexa9hf-vfp-neon 1.2rc1-r2.0
strace cortexa9hf-vfp-neon 4.8-r0.0
sysvinit cortexa9hf-vfp-neon 2.88dsf-r11.0
sysvinit-inittab nitrogen6x 2.88dsf-r10.0
sysvinit-pidof cortexa9hf-vfp-neon 2.88dsf-r11.0
tar cortexa9hf-vfp-neon 1.27.1-r0.0
tslib-calibrate cortexa9hf-vfp-neon 1.1-r0.0
tslib-conf cortexa9hf-vfp-neon 1.1-r0.0
tslib-tests cortexa9hf-vfp-neon 1.1-r0.0
udev-cache cortexa9hf-vfp-neon 182-r7.1.0
udev cortexa9hf-vfp-neon 182-r7.1.0
udev-extraconf nitrogen6x 1.0-r17.0
udev-utils cortexa9hf-vfp-neon 182-r7.1.0
update-alternatives-opkg cortexa9hf-vfp-neon 0.1.8+git0+c33b217016-r0.0
update-rc.d all 0.7-r5.0
util-linux-mcookie cortexa9hf-vfp-neon 2.23.2-r0.0
vte-termcap cortexa9hf-vfp-neon 0.28.2-r6.0
x11-common cortexa9hf-vfp-neon 0.1-r47.0
xauth cortexa9hf-vfp-neon 1:1.0.8-r0.0
xcursor-transparent-theme all 0.1.1-r4.0
xdpyinfo cortexa9hf-vfp-neon 1:1.3.1-r0.0
xf86-input-evdev cortexa9hf-vfp-neon 2:2.8.2-r0.0
xf86-video-imxfb-vivante cortexa9hf-vfp-neon-mx6 3:3.5.7-1.0.0-alpha.2-r0.0
xhost cortexa9hf-vfp-neon 1:1.0.6-r0.0
xinit cortexa9hf-vfp-neon 1:1.3.3-r0.0
xkbcomp cortexa9hf-vfp-neon 1.2.4-r8.0.0
xkeyboard-config cortexa9hf-vfp-neon 2.11-r0.0
xmodmap cortexa9hf-vfp-neon 1:1.0.8-r0.0
xserver-nodm-init nitrogen6x 1.0-r31.0
xserver-xf86-config nitrogen6x 0.1-r35.0
xserver-xorg cortexa9hf-vfp-neon-mx6 2:1.14.4-r0.0
xserver-xorg-extension-glx cortexa9hf-vfp-neon-mx6 2:1.14.4-r0.0
xserver-xorg-module-exa cortexa9hf-vfp-neon-mx6 2:1.14.4-r0.0
xset cortexa9hf-vfp-neon 1:1.2.3-r0.0
xtscal cortexa9hf-vfp-neon 0.6.3-r13.0

--------------020704060208010400090600--
