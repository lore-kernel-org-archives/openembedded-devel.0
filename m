Return-Path: <alex.kanavin@gmail.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E539C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:53:01 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.151.1750434771136108750
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JthV8+w3;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fafaa60889so12902946d6.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750434770; x=1751039570; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uuel69jmCVFVJJ666oNoVjtZM9cWmci9OmwePvz3xxE=;
        b=JthV8+w3gdvnllFlzvp1LHO9XDPOkPy1tDyb/ZAHIhSq8lo4zx0L6RpHsGAxmYrZYH
         YMDBJIkKOH9RiIpDXPBsqs/0HQj2uh0mFYF0GAxHHG9/BZupZNQjc7QCC1IAHtMqJPk2
         2dHe3j50rQSM7zc4RS/SJyPepho+1P1tfF6ED+3MwQHWR7Mdalss19nxGB+UuowOSWik
         i3fIGPz1Vx1oGeelooK0MaF3Ugeb1tuXoAJCXVBPfCJRRLc8nvP6OFQQ4/UHnHPi+u7/
         YKB7XoSpmrhuZrmhyGiP6DHptWAMzcK6GDGZRZGQSqC4hgvJH0UeA9V+hCzVm6ovXJ59
         Tn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750434770; x=1751039570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uuel69jmCVFVJJ666oNoVjtZM9cWmci9OmwePvz3xxE=;
        b=j6IabijBSddxqoyJE3To8dOgYUHCGnuOdsiIGvXHuFIfRiBJgKYnHYDsM8zisLPbOA
         s8u21UFPbu1cjpHPJhW5rducmgARN0eL9+yeDZ1pFYotWdO8evQldPvwiux1RzUU/mH8
         CELTXGUqjpT0KmvqcA71AZpzXJpYtX4wqtEDhcJsuZU665rCS1g842r4KR6uxvu8wiUW
         e43bQOE/AjQpgqUYR6tKtFOh/K2FDojhaaQ4qo/SXsUcBkbfuCAo0Lce8FVBy9fusPjE
         ePsahELGSMgRiDbfwoGLvfN3xtvN96+RY2Rn+RamoMFMWxvRNJiKmzxTRHNHI7p5FoN2
         KezA==
X-Gm-Message-State: AOJu0YyLhyFjXlRijD55jqi7ejDr5BXk5pi2YdJKBNRE/QX4h+nKxndM
	Fr+/8OnOsY8zN6uNG/CrV+r3XnaY4iJPCawCPreR8j7PDijk+SACQ3z4YuMt5NPzuUrlnGiXrKy
	SQUzda4J5nq+87Qy366EcHyUQpk8gTtg=
X-Gm-Gg: ASbGncshmBCzcKhaRt6Fgw/LVql/yvZe0Mn4nrhEng1tL6FTvtwelFdgD62PdytQhmU
	h1VLi11WlHz+cEtK5GufCrxCQr53txdlyvULz2TG7pP+rIjIsWM7Z2Fcc78OP7JhP3cywGhNSuL
	dAqgSl/qm8iA18uBvs/Ft8vq9JRfgSjJzbwRifL2J2UIxs1HNQFHuIZoM6vHa0Hf3KyzGsI2d46
	Yu5Xw==
X-Google-Smtp-Source: AGHT+IFPwy4bPbM1OBQz3BTRFfhRZasUwq5rQm8Mhiit5GC0ZMW9YqP74uCut/YvP4YH5nf8Bf+9ctkuUinlwQeeXKg=
X-Received: by 2002:a05:6214:242f:b0:6fa:c168:8de4 with SMTP id
 6a1803df08f44-6fd0a5785edmr51273216d6.33.1750434768305; Fri, 20 Jun 2025
 08:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250620122222.1776639-1-f_l_k@t-online.de>
In-Reply-To: <20250620122222.1776639-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jun 2025 17:52:34 +0200
X-Gm-Features: Ac12FXy86_4f5NTBgMDk8AAb9pBB6F2GUAra3JGIV1WEv42e7-Dsg9girXUfHi8
Message-ID: <CANNYZj_jerrOtZTvtg9zy-EEuFSJnS1J7DZoh0qh0iMT09qCOQ@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH] meta-openembedded: fix after S rework
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 15:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117979

I sent a patch first, and I think mine captures more needed changes :)

Also, unfortunately this bit in yours is not correct and will cause fails:

-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}/${BP}"

It should simply be S = "${UNPACKDIR}"

A good smoke test is 'bitbake -c patch world'

Alex

On Fri, 20 Jun 2025 at 17:04, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> In current oe-core master-next branch S is set to be in UNPACKDIR in
> bitbake.conf. This leads to a number of changes in meta-openembedded
>
> I used a quick and dirty script that handles the issues I
> found so far. The result doesn't look that bad and at least this
> fix was enough to make my image buildable again.
>
> This patch was created with:
>
> LAYER=$1
> [ -z $LAYER ] && echo "Layer is needed as an argument" && exit 1
> ! [ -d $(basename $LAYER) ] && echo "$(basename $LAYER) not found in current directory" && exit 1
>
> for file in $(grep -r "S = \"\${WORKDIR}/git\"" $LAYER | cut -d : -f 1); do
>         sed -i -e '/S = \"\${WORKDIR}\/git"/d' $file
>         sed -i "s|S = \"\${WORKDIR}\/git\/|S = \"\${UNPACKDIR}\/\${BP}\/|" $file
> done
>
> for file in $(grep -r "S = \"\${UNPACKDIR}/git\"" $LAYER | cut -d : -f 1); do
>         sed -i -e '/S = \"\${UNPACKDIR}\/git"/d' $file
> done
>
> for file in $(grep -r "S = \"\${WORKDIR}" $LAYER | cut -d : -f 1); do
>         sed -i "s|S = \"\${WORKDIR}|S = \"\${UNPACKDIR}|" $file
> done
>
> for file in $(grep -r "S = \"\${UNPACKDIR}/sources\"" $LAYER | cut -d : -f 1); do
>         sed -i "s|S = \"\${UNPACKDIR}/sources|S = \"\${UNPACKDIR}/\${BP}|" $file
>         sed -i -e '/UNPACKDIR = \"\${S}\"/d' $file
> done
>
> exit 0
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb        | 2 +-
>  .../recipes-filesystems/logfsprogs/logfsprogs_git.bb         | 1 -
>  .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb         | 2 +-
>  meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb      | 1 -
>  .../recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb   | 1 -
>  .../recipes-filesystems/smbnetfs/smbnetfs_git.bb             | 1 -
>  .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb       | 1 -
>  .../recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb     | 1 -
>  .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb           | 1 -
>  meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb        | 1 -
>  meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb    | 1 -
>  meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb        | 1 -
>  .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb   | 1 -
>  meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb      | 1 -
>  .../recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb            | 1 -
>  meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb        | 1 -
>  meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb  | 1 -
>  .../recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb      | 1 -
>  .../recipes-utils/ufs-utils/ufs-utils_6.14.11.bb             | 1 -
>  .../recipes-utils/xfstests/xfstests_2025.04.27.bb            | 1 -
>  meta-gnome/classes/clutter.bbclass                           | 2 +-
>  meta-gnome/recipes-connectivity/geary/geary_46.0.bb          | 1 -
>  .../recipes-extended/polkit-gnome/polkit-gnome_0.105.bb      | 1 -
>  meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb                   | 1 -
>  meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb            | 1 -
>  meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb   | 1 -
>  meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb        | 1 -
>  meta-gnome/recipes-gnome/evince/evince_48.0.bb               | 4 ++--
>  .../recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb | 3 +--
>  meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb        | 1 -
>  .../recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb    | 1 -
>  meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb             | 2 +-
>  .../recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb | 2 +-
>  meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb     | 1 -
>  meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb       | 2 +-
>  .../recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb    | 1 -
>  .../recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb  | 1 -
>  .../gtksourceview/gtksourceview-classic-light_1.0.bb         | 3 +--
>  .../recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb    | 2 +-
>  .../recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb      | 2 +-
>  .../recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb     | 2 +-
>  .../recipes-gnome/libchamplain/libchamplain_0.12.21.bb       | 1 -
>  meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb   | 2 +-
>  meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb                  | 1 -
>  meta-gnome/recipes-support/ibus/ibus.inc                     | 1 -
>  meta-gnome/recipes-support/keybinder/keybinder_3.0.bb        | 1 -
>  meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb        | 1 -
>  .../webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb           | 1 -
>  .../xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb      | 1 -
>  meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb    | 3 +--
>  meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb        | 1 -
>  .../recipes-core/initrdscripts/initramfs-debug_1.0.bb        | 3 +--
>  meta-initramfs/recipes-devtools/dracut/dracut_106.bb         | 1 -
>  meta-initramfs/recipes-devtools/grubby/grubby_git.bb         | 1 -
>  meta-initramfs/recipes-devtools/klibc/klibc.inc              | 2 +-
>  meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb | 1 -
>  meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 1 -
>  .../recipes-connectivity/libupnp/libupnp_1.14.18.bb          | 1 -
>  meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb              | 1 -
>  meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb       | 1 -
>  meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb         | 1 -
>  meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb | 1 -
>  .../recipes-multimedia/alsa-equal/alsa-equal_0.6.bb          | 2 +-
>  meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb         | 1 -
>  .../recipes-multimedia/bluealsa/bluealsa_4.3.0.bb            | 1 -
>  .../recipes-multimedia/cdparanoia/cdparanoia_10.2.bb         | 2 +-
>  meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb      | 1 -
>  meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb       | 1 -
>  .../recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb | 1 -
>  .../recipes-multimedia/dleyna/dleyna-core_0.6.0.bb           | 1 -
>  .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb       | 1 -
>  .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb         | 1 -
>  .../recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb   | 2 +-
>  meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb  | 1 -
>  meta-multimedia/recipes-multimedia/flite/flite_2.2.bb        | 1 -
>  .../recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb        | 1 -
>  meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb  | 1 -
>  .../recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb      | 1 -
>  meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb | 1 -
>  meta-multimedia/recipes-multimedia/juce/projucer.inc         | 1 -
>  meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb  | 1 -
>  meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb  | 1 -
>  .../recipes-multimedia/libcamera/libcamera_0.4.0.bb          | 1 -
>  .../recipes-multimedia/libde265/libde265_1.0.15.bb           | 1 -
>  .../recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb          | 1 -
>  meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb | 1 -
>  meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb    | 1 -
>  .../recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb       | 2 +-
>  .../recipes-multimedia/libsquish/libsquish_git.bb            | 1 -
>  meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb    | 1 -
>  meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb    | 1 -
>  meta-multimedia/recipes-multimedia/minidlna/minidlna.inc     | 1 -
>  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb     | 1 -
>  .../recipes-multimedia/musicpd/libmpdclient_2.22.bb          | 1 -
>  meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb       | 1 -
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb     | 1 -
>  meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb     | 1 -
>  meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb | 1 -
>  .../nv-codec-headers/nv-codec-headers_12.1.14.0.bb           | 1 -
>  .../recipes-multimedia/openal/openal-soft_1.24.3.bb          | 1 -
>  .../recipes-multimedia/openh264/openh264_2.6.0.bb            | 1 -
>  .../recipes-multimedia/opus-tools/opus-tools_0.2.bb          | 2 +-
>  .../pipewire/pipewire-media-session_0.4.2.bb                 | 1 -
>  .../recipes-multimedia/pipewire/pipewire_1.4.5.bb            | 1 -
>  meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb  | 1 -
>  .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb  | 3 +--
>  .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb   | 3 +--
>  .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb   | 3 +--
>  .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb  | 3 +--
>  meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb         | 1 -
>  meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb    | 1 -
>  .../recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb            | 1 -
>  meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 1 -
>  .../webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb | 2 +-
>  .../webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb | 2 +-
>  .../recipes-multimedia/wireplumber/wireplumber_0.5.10.bb     | 1 -
>  meta-multimedia/recipes-multimedia/x265/x265_4.1.bb          | 2 +-
>  meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb | 1 -
>  .../recipes-support/gst-instruments/gst-instruments_git.bb   | 1 -
>  .../recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb     | 2 +-
>  meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb     | 1 -
>  meta-multimedia/recipes-support/srt/srt_1.4.4.bb             | 1 -
>  .../xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb   | 1 -
>  .../system-config-printer/system-config-printer_1.5.18.bb    | 1 -
>  meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb    | 1 -
>  meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb  | 1 -
>  .../recipes-connectivity/blueman/blueman_2.4.4.bb            | 1 -
>  meta-networking/recipes-connectivity/bluepy/bluepy_git.bb    | 1 -
>  .../recipes-connectivity/bluez-tools/bluez-tools_git.bb      | 1 -
>  .../recipes-connectivity/cannelloni/cannelloni_1.1.0.bb      | 1 -
>  .../recipes-connectivity/civetweb/civetweb_1.16.bb           | 1 -
>  meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb    | 1 -
>  .../recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb          | 2 +-
>  meta-networking/recipes-connectivity/dibbler/dibbler_git.bb  | 1 -
>  .../recipes-connectivity/freeradius/freeradius_3.2.7.bb      | 1 -
>  .../recipes-connectivity/libdnet/libdnet_1.18.0.bb           | 1 -
>  .../recipes-connectivity/libiec61850/libiec61850_1.5.3.bb    | 1 -
>  .../recipes-connectivity/mbedtls/mbedtls_2.28.10.bb          | 1 -
>  .../recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb          | 1 -
>  .../recipes-connectivity/nanomsg/nanomsg_1.2.1.bb            | 1 -
>  meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb    | 1 -
>  meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb    | 1 -
>  .../networkmanager/networkmanager-fortisslvpn_1.4.0.bb       | 2 +-
>  .../networkmanager/networkmanager-openconnect_1.2.8.bb       | 2 +-
>  .../networkmanager/networkmanager-openvpn_1.12.0.bb          | 2 +-
>  .../networkmanager/networkmanager_1.52.0.bb                  | 1 -
>  .../recipes-connectivity/openconnect/openconnect_9.12.bb     | 1 -
>  .../recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb | 1 -
>  .../recipes-connectivity/openthread/ot-br-posix_git.bb       | 1 -
>  .../recipes-connectivity/openthread/ot-daemon_git.bb         | 1 -
>  .../recipes-connectivity/openthread/wpantund_git.bb          | 1 -
>  meta-networking/recipes-connectivity/relayd/relayd_git.bb    | 1 -
>  .../recipes-connectivity/restinio/restinio_0.6.13.bb         | 2 +-
>  meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb | 1 -
>  meta-networking/recipes-connectivity/vlan/vlan_1.9.bb        | 2 +-
>  meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb      | 1 -
>  .../recipes-connectivity/wolfssl/wolfssl_5.8.0.bb            | 1 -
>  meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb         | 1 -
>  .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb    | 1 -
>  .../networkd-dispatcher/networkd-dispatcher_2.2.4.bb         | 1 -
>  meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb    | 2 +-
>  meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb     | 1 -
>  meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb           | 2 +-
>  meta-networking/recipes-daemons/vblade/vblade_25.bb          | 1 -
>  meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb    | 1 -
>  .../recipes-devtools/python/python3-scapy_2.6.0.bb           | 1 -
>  meta-networking/recipes-extended/dlm/dlm_4.2.0.bb            | 2 +-
>  meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb | 1 -
>  meta-networking/recipes-extended/tgt/tgt_1.0.90.bb           | 1 -
>  .../arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb   | 1 -
>  .../recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb   | 2 +-
>  .../libnetfilter/libnetfilter-conntrack_1.1.0.bb             | 2 +-
>  .../libnetfilter/libnetfilter-cthelper_1.0.1.bb              | 2 +-
>  .../libnetfilter/libnetfilter-cttimeout_1.0.1.bb             | 2 +-
>  .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb    | 1 -
>  .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb  | 1 -
>  meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb    | 1 -
>  meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb        | 1 -
>  meta-networking/recipes-irc/znc/znc_1.8.2.bb                 | 1 -
>  meta-networking/recipes-kernel/wireguard/wireguard.inc       | 2 +-
>  meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb    | 1 -
>  .../recipes-protocols/freediameter/freediameter_1.5.0.bb     | 1 -
>  meta-networking/recipes-protocols/frr/frr_10.3.bb            | 1 -
>  meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb   | 1 -
>  meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb  | 1 -
>  meta-networking/recipes-protocols/openflow/openflow_git.bb   | 1 -
>  meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb | 1 -
>  .../recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb        | 2 +-
>  meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb  | 2 +-
>  meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb     | 1 -
>  meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb   | 1 -
>  meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb    | 1 -
>  meta-networking/recipes-support/arptables/arptables_git.bb   | 1 -
>  meta-networking/recipes-support/bmon/bmon_4.0.bb             | 1 -
>  .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb       | 1 -
>  meta-networking/recipes-support/celt051/celt051_git.bb       | 1 -
>  meta-networking/recipes-support/cifs/cifs-utils_7.0.bb       | 1 -
>  meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb       | 1 -
>  meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb    | 1 -
>  meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb | 1 -
>  meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb | 1 -
>  meta-networking/recipes-support/fping/fping_5.3.bb           | 2 +-
>  meta-networking/recipes-support/geoip/geoip-perl_1.51.bb     | 1 -
>  meta-networking/recipes-support/geoip/geoip_1.6.12.bb        | 1 -
>  .../recipes-support/http-parser/http-parser_2.9.4.bb         | 1 -
>  meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb  | 1 -
>  meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb       | 1 -
>  meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb      | 1 -
>  meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb   | 1 -
>  meta-networking/recipes-support/libldb/libldb_2.8.1.bb       | 2 +-
>  meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb | 2 +-
>  meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb      | 2 +-
>  .../recipes-support/libtevent/libtevent_0.16.2.bb            | 2 +-
>  .../recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb      | 1 -
>  .../recipes-support/lowpan-tools/lowpan-tools_git.bb         | 1 -
>  meta-networking/recipes-support/mctp/mctp_2.1.bb             | 1 -
>  .../recipes-support/mdio-tools/mdio-netlink_1.3.1.bb         | 1 -
>  .../recipes-support/mdio-tools/mdio-tools_1.3.1.bb           | 1 -
>  meta-networking/recipes-support/mtr/mtr_0.95.bb              | 1 -
>  meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb     | 1 -
>  meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb     | 1 -
>  meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb       | 1 -
>  meta-networking/recipes-support/netcf/netcf_0.2.8.bb         | 1 -
>  meta-networking/recipes-support/netperf/netperf_git.bb       | 1 -
>  .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb         | 1 -
>  meta-networking/recipes-support/nis/yp-tools_4.2.3.bb        | 1 -
>  meta-networking/recipes-support/ntimed/ntimed_git.bb         | 1 -
>  meta-networking/recipes-support/ntopng/ndpi_4.2.bb           | 1 -
>  meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb       | 1 -
>  meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb       | 3 +--
>  meta-networking/recipes-support/open-isns/open-isns_0.102.bb | 1 -
>  .../recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb    | 2 +-
>  meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb  | 2 +-
>  meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb     | 2 +-
>  meta-networking/recipes-support/phytool/phytool.bb           | 1 -
>  meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb  | 1 -
>  meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb   | 1 -
>  meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb       | 1 -
>  meta-networking/recipes-support/spice/libcacard_2.8.1.bb     | 1 -
>  meta-networking/recipes-support/spice/spice-gtk_0.42.bb      | 1 -
>  .../recipes-support/spice/spice-guest-vdagent_0.22.1.bb      | 1 -
>  .../recipes-support/spice/spice-protocol_0.14.4.bb           | 1 -
>  meta-networking/recipes-support/spice/spice_git.bb           | 1 -
>  meta-networking/recipes-support/spice/usbredir_0.14.0.bb     | 1 -
>  meta-networking/recipes-support/unbound/unbound_1.22.0.bb    | 1 -
>  meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb     | 1 -
>  .../recipes-support/wpan-tools/wpan-tools_0.10.bb            | 1 -
>  meta-oe/classes/fitimage.bbclass                             | 3 +--
>  .../recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb          | 1 -
>  .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb | 1 -
>  .../meta-python/recipes-bsp/rwmem/rwmem_1.2.bb               | 1 -
>  .../recipes-connectivity/netplan/netplan_1.1.2.bb            | 1 -
>  .../meta-python/recipes-dbs/mongodb/mongodb_git.bb           | 1 -
>  .../meta-python/recipes-devtools/nanopb/nanopb.inc           | 1 -
>  .../meta-python/recipes-extended/lcdproc/lcdproc_git.bb      | 1 -
>  .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb        | 1 -
>  .../meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb     | 1 -
>  .../meta-python/recipes-support/smem/smem_1.5.bb             | 2 +-
>  .../multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb | 1 -
>  .../perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb  | 1 -
>  .../android-tools/android-tools-conf-configfs_1.0.bb         | 3 +--
>  .../recipes-devtool/android-tools/android-tools-conf_1.0.bb  | 3 +--
>  .../android-tools/android-tools_29.0.6.r14.bb                | 1 -
>  meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb         | 1 -
>  meta-oe/recipes-benchmark/fio/fio_3.39.bb                    | 1 -
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb             | 1 -
>  meta-oe/recipes-benchmark/iozone3/iozone3_507.bb             | 2 +-
>  meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb             | 2 +-
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb              | 1 -
>  meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb       | 1 -
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb  | 1 -
>  meta-oe/recipes-benchmark/linpack/linpack_1.0.bb             | 3 +--
>  meta-oe/recipes-benchmark/mbw/mbw_2.0.bb                     | 1 -
>  .../phoronix-test-suite/phoronix-test-suite_10.8.4.bb        | 2 +-
>  meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb              | 1 -
>  meta-oe/recipes-benchmark/s-suite/s-suite_git.bb             | 1 -
>  .../recipes-benchmark/stressapptest/stressapptest_1.0.11.bb  | 1 -
>  meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb        | 1 -
>  meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb   | 1 -
>  meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb         | 3 +--
>  meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb                       | 1 -
>  meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb               | 1 -
>  meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb         | 1 -
>  .../recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb | 1 -
>  meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb             | 1 -
>  meta-oe/recipes-bsp/firmwared/firmwared_git.bb               | 1 -
>  meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb               | 2 +-
>  meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb                   | 1 -
>  meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb                     | 1 -
>  meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb                    | 1 -
>  meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb       | 3 +--
>  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb            | 1 -
>  meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb                    | 2 +-
>  meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb                | 1 -
>  meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb             | 3 +--
>  meta-oe/recipes-connectivity/ace/ace_8.0.2.bb                | 2 +-
>  meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb   | 1 -
>  meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb    | 2 +-
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb          | 1 -
>  meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb          | 1 -
>  meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb             | 2 +-
>  .../libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb     | 1 -
>  .../libimobiledevice/libimobiledevice_git.bb                 | 1 -
>  .../recipes-connectivity/libirecovery/libirecovery_1.2.1.bb  | 1 -
>  meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb       | 1 -
>  meta-oe/recipes-connectivity/libndp/libndp_1.9.bb            | 1 -
>  meta-oe/recipes-connectivity/libnet/libnet_1.3.bb            | 1 -
>  meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb          | 1 -
>  meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb         | 1 -
>  .../recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb    | 1 -
>  .../libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb      | 1 -
>  meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb | 1 -
>  .../libwebsockets/libwebsockets_4.3.5.bb                     | 1 -
>  .../recipes-connectivity/modemmanager/modemmanager_1.22.0.bb | 1 -
>  meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb          | 2 +-
>  meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb       | 2 +-
>  .../recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb   | 1 -
>  .../paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb                     | 1 -
>  .../recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb  | 1 -
>  meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb | 1 -
>  meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb     | 1 -
>  meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb   | 2 +-
>  .../recipes-connectivity/transmission/transmission_4.0.6.bb  | 1 -
>  meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb          | 1 -
>  .../wifi-test-suite/wifi-test-suite_10.10.1.bb               | 1 -
>  meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb         | 1 -
>  meta-oe/recipes-core/basu/basu_0.2.1.bb                      | 1 -
>  meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb              | 1 -
>  meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb           | 1 -
>  meta-oe/recipes-core/emlog/emlog.inc                         | 1 -
>  meta-oe/recipes-core/glfw/glfw_3.3.8.bb                      | 1 -
>  meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb          | 1 -
>  meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb          | 2 +-
>  meta-oe/recipes-core/libnfc/libnfc_git.bb                    | 1 -
>  meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb   | 2 +-
>  meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb      | 2 +-
>  meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb            | 2 +-
>  meta-oe/recipes-core/mdbus2/mdbus2_git.bb                    | 1 -
>  meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb          | 1 -
>  meta-oe/recipes-core/minizip/minizip_1.3.1.bb                | 2 +-
>  meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb        | 1 -
>  meta-oe/recipes-core/ndctl/ndctl_v79.bb                      | 1 -
>  meta-oe/recipes-core/opencl/clpeak_1.1.4.bb                  | 1 -
>  meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                 | 1 -
>  meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb       | 1 -
>  meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb         | 1 -
>  meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb     | 1 -
>  meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb  | 1 -
>  meta-oe/recipes-core/pim435/pim435_git.bb                    | 1 -
>  meta-oe/recipes-core/safec/safec_3.7.1.bb                    | 1 -
>  meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb | 1 -
>  meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb      | 2 +-
>  meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb            | 1 -
>  meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb  | 1 -
>  meta-oe/recipes-core/usleep/usleep_1.2.bb                    | 3 +--
>  .../recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb  | 1 -
>  meta-oe/recipes-crypto/botan/botan_3.7.1.bb                  | 2 +-
>  meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb  | 1 -
>  meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb            | 1 -
>  meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb     | 1 -
>  meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb        | 2 +-
>  meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb | 1 -
>  meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb              | 1 -
>  meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb                  | 1 -
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb                      | 2 +-
>  meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb                | 1 -
>  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb | 1 -
>  meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb        | 1 -
>  .../android-tools/android-tools-conf-configfs_1.0.bb         | 3 +--
>  .../recipes-devtools/android-tools/android-tools-conf_1.0.bb | 3 +--
>  .../android-tools/android-tools_5.1.1.r37.bb                 | 1 -
>  meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb           | 1 -
>  meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb     | 1 -
>  meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb        | 2 +-
>  meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb         | 1 -
>  meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb               | 1 -
>  .../recipes-devtools/concurrencykit/concurrencykit_git.bb    | 1 -
>  meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb      | 1 -
>  meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb              | 1 -
>  meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb       | 1 -
>  meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb  | 2 +-
>  .../recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb    | 1 -
>  meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb           | 1 -
>  .../editorconfig/editorconfig-core-c_0.12.9.bb               | 1 -
>  meta-oe/recipes-devtools/exprtk/exprtk_git.bb                | 1 -
>  meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb    | 1 -
>  meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb          | 1 -
>  meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb  | 2 +-
>  meta-oe/recipes-devtools/flatcc/flatcc_git.bb                | 1 -
>  meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb                 | 1 -
>  meta-oe/recipes-devtools/guider/guider_3.9.9.bb              | 1 -
>  meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb        | 1 -
>  meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb          | 1 -
>  .../json-schema-validator/json-schema-validator_2.2.0.bb     | 1 -
>  meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb     | 2 +-
>  meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb            | 1 -
>  meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb            | 1 -
>  meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb            | 1 -
>  .../kconfig-frontends/kconfig-frontends_4.11.0.1.bb          | 1 -
>  meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb             | 1 -
>  meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb               | 1 -
>  meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb      | 1 -
>  meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb        | 1 -
>  meta-oe/recipes-devtools/libubox/libubox_git.bb              | 1 -
>  meta-oe/recipes-devtools/lshw/lshw_02.20.bb                  | 1 -
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb                | 1 -
>  meta-oe/recipes-devtools/luajit/luajit_git.bb                | 1 -
>  meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb         | 1 -
>  meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb          | 1 -
>  meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb              | 1 -
>  meta-oe/recipes-devtools/memstat/memstat_1.0.bb              | 2 +-
>  meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb        | 2 +-
>  .../recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb    | 1 -
>  meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb          | 1 -
>  meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb        | 2 +-
>  meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb          | 2 +-
>  meta-oe/recipes-devtools/musl/musl-nscd_git.bb               | 1 -
>  meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb  | 1 -
>  .../recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb   | 1 -
>  .../recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb  | 3 +--
>  meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb            | 2 +-
>  meta-oe/recipes-devtools/openocd/openocd_git.bb              | 1 -
>  meta-oe/recipes-devtools/pahole/pahole_1.29.bb               | 1 -
>  meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb                | 1 -
>  meta-oe/recipes-devtools/perfetto/perfetto.inc               | 1 -
>  meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb            | 2 +-
>  meta-oe/recipes-devtools/perl/exiftool_12.89.bb              | 1 -
>  meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb          | 1 -
>  meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb | 2 +-
>  meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb           | 2 +-
>  meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb   | 2 +-
>  meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb         | 2 +-
>  meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb        | 1 -
>  meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb     | 2 +-
>  meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb         | 2 +-
>  meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb    | 2 +-
>  meta-oe/recipes-devtools/php/php_8.4.6.bb                    | 2 +-
>  meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb         | 1 -
>  meta-oe/recipes-devtools/ply/ply_git.bb                      | 1 -
>  meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb          | 1 -
>  meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb        | 1 -
>  meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb         | 1 -
>  meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb         | 1 -
>  .../recipes-devtools/python/python3-distutils-extra_2.39.bb  | 2 +-
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb          | 1 -
>  meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb    | 1 -
>  meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb           | 1 -
>  meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb        | 1 -
>  meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb        | 1 -
>  .../squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb             | 1 -
>  meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb              | 1 -
>  meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb   | 1 -
>  .../recipes-devtools/systemd/nativesdk-systemd-systemctl.bb  | 3 +--
>  meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb                | 1 -
>  meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb                 | 2 +-
>  meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb                   | 2 +-
>  meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb    | 1 -
>  meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb             | 1 -
>  .../unattended-upgrades/unattended-upgrades_2.9.1.bb         | 1 -
>  meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb            | 2 +-
>  meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb          | 1 -
>  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb         | 2 +-
>  meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb                 | 1 -
>  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                  | 1 -
>  meta-oe/recipes-devtools/yasm/yasm_git.bb                    | 1 -
>  meta-oe/recipes-extended/7zip/7zip_24.09.bb                  | 1 -
>  meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb                 | 1 -
>  meta-oe/recipes-extended/beep/beep_1.4.12.bb                 | 1 -
>  meta-oe/recipes-extended/bitwise/bitwise_0.50.bb             | 2 +-
>  meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb        | 1 -
>  meta-oe/recipes-extended/brotli/brotli_1.1.0.bb              | 1 -
>  meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb   | 1 -
>  meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb              | 1 -
>  .../recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb    | 1 -
>  meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb       | 2 +-
>  meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb    | 1 -
>  meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb        | 1 -
>  meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb        | 1 -
>  meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb       | 1 -
>  meta-oe/recipes-extended/figlet/figlet_git.bb                | 1 -
>  meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb  | 1 -
>  meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb           | 1 -
>  meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb        | 1 -
>  meta-oe/recipes-extended/haveged/haveged_1.9.19.bb           | 1 -
>  meta-oe/recipes-extended/hexedit/hexedit_1.6.bb              | 1 -
>  meta-oe/recipes-extended/highway/highway_1.2.0.bb            | 1 -
>  meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb            | 1 -
>  .../inputattach-config/inputattach-config.bb                 | 3 +--
>  meta-oe/recipes-extended/iotop/iotop_1.30.bb                 | 1 -
>  meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb        | 1 -
>  meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb      | 1 -
>  meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb    | 1 -
>  meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb    | 1 -
>  meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb    | 1 -
>  meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb           | 1 -
>  meta-oe/recipes-extended/libcec/libcec_7.0.0.bb              | 1 -
>  meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb       | 1 -
>  .../recipes-extended/libdivecomputer/libdivecomputer_git.bb  | 1 -
>  meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb  | 1 -
>  meta-oe/recipes-extended/libimobiledevice/libplist_git.bb    | 1 -
>  .../recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb    | 1 -
>  meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb  | 1 -
>  meta-oe/recipes-extended/libleak/libleak_0.3.6.bb            | 1 -
>  .../recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb  | 1 -
>  meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb     | 2 +-
>  meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb      | 1 -
>  meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb       | 1 -
>  meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb  | 1 -
>  meta-oe/recipes-extended/libreport/libreport_2.17.15.bb      | 1 -
>  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb              | 1 -
>  meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb             | 1 -
>  meta-oe/recipes-extended/libyang/libyang_3.12.2.bb           | 1 -
>  meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb  | 2 +-
>  meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb      | 1 -
>  meta-oe/recipes-extended/md5deep/md5deep_git.bb              | 1 -
>  meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb     | 1 -
>  meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb          | 2 +-
>  meta-oe/recipes-extended/mraa/mraa_git.bb                    | 1 -
>  meta-oe/recipes-extended/nana/nana_git.bb                    | 1 -
>  meta-oe/recipes-extended/networking/mstpd_git.bb             | 1 -
>  meta-oe/recipes-extended/newt/libnewt_0.52.25.bb             | 2 +-
>  meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb        | 1 -
>  meta-oe/recipes-extended/ostree/ostree_2024.10.bb            | 2 +-
>  meta-oe/recipes-extended/p8platform/p8platform_git.bb        | 1 -
>  meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb         | 1 -
>  meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb      | 1 -
>  meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb             | 1 -
>  meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb    | 2 +-
>  meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb                | 1 -
>  meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb   | 2 +-
>  meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb                  | 1 -
>  meta-oe/recipes-extended/polkit/polkit_126.bb                | 1 -
>  .../recipes-extended/properties-cpp/properties-cpp_git.bb    | 1 -
>  meta-oe/recipes-extended/qad/qad_git.bb                      | 1 -
>  meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb                | 1 -
>  meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb             | 2 +-
>  .../redis-plus-plus/redis-plus-plus_1.3.11.bb                | 1 -
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb            | 1 -
>  meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb     | 1 -
>  meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb           | 1 -
>  meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb            | 1 -
>  .../sblim-sfc-common/sblim-sfc-common_1.0.1.bb               | 2 +-
>  meta-oe/recipes-extended/sedutil/sedutil_git.bb              | 1 -
>  meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb             | 2 +-
>  meta-oe/recipes-extended/snappy/snappy_1.1.10.bb             | 1 -
>  meta-oe/recipes-extended/socketcan/can-isotp_git.bb          | 1 -
>  meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb      | 1 -
>  meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb         | 1 -
>  meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb    | 1 -
>  meta-oe/recipes-extended/socketcan/socketcand_git.bb         | 1 -
>  meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb             | 1 -
>  meta-oe/recipes-extended/tipcutils/tipcutils_git.bb          | 1 -
>  meta-oe/recipes-extended/tmate/tmate_2.4.0.bb                | 1 -
>  meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb    | 1 -
>  .../recipes-extended/uml-utilities/uml-utilities_20040406.bb | 2 +-
>  meta-oe/recipes-extended/upm/upm_git.bb                      | 1 -
>  meta-oe/recipes-extended/valkey/valkey_8.1.1.bb              | 1 -
>  meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb     | 2 +-
>  meta-oe/recipes-extended/wipe/wipe_0.24.bb                   | 1 -
>  meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb             | 1 -
>  meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb        | 1 -
>  meta-oe/recipes-extended/zlog/zlog_1.2.16.bb                 | 1 -
>  meta-oe/recipes-extended/zram/zram_0.2.bb                    | 3 +--
>  meta-oe/recipes-extended/zsync/zsync-curl_git.bb             | 1 -
>  meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb               | 2 +-
>  meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb                     | 2 +-
>  .../gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb         | 3 +--
>  meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb          | 1 -
>  meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb               | 1 -
>  meta-oe/recipes-gnome/malcontent/malcontent.inc              | 1 -
>  meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb                    | 1 -
>  meta-oe/recipes-graphics/aml/aml_git.bb                      | 1 -
>  meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb        | 2 +-
>  meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb                  | 1 -
>  meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb        | 1 -
>  meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb | 2 +-
>  meta-oe/recipes-graphics/directfb/directfb.inc               | 2 +-
>  meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb      | 1 -
>  meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb               | 1 -
>  meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb                | 1 -
>  meta-oe/recipes-graphics/fbida/fbida_git.bb                  | 1 -
>  meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb     | 1 -
>  meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb                  | 1 -
>  meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb                  | 1 -
>  meta-oe/recipes-graphics/glad/glad_2.0.8.bb                  | 1 -
>  meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb                  | 1 -
>  meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb             | 2 +-
>  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb          | 2 +-
>  meta-oe/recipes-graphics/imlib2/imlib2_git.bb                | 1 -
>  meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb          | 1 -
>  meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb      | 2 +-
>  meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb          | 1 -
>  meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb         | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb       | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb       | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb          | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb         | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb       | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb       | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb         | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb             | 2 +-
>  meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb   | 2 +-
>  meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb      | 1 -
>  meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb        | 2 +-
>  meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb           | 2 +-
>  meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb | 1 -
>  meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb      | 2 +-
>  meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb              | 2 +-
>  meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb          | 1 -
>  meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb                  | 1 -
>  meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb            | 1 -
>  meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb            | 1 -
>  meta-oe/recipes-graphics/openbox/obconf_git.bb               | 1 -
>  meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb          | 1 -
>  .../panel-mipi-dbi/panel-mipi-dbi-native_git.bb              | 1 -
>  meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb        | 2 +-
>  .../parallel-deqp-runner/parallel-deqp-runner_git.bb         | 1 -
>  meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb          | 1 -
>  meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb         | 1 -
>  meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb  | 1 -
>  meta-oe/recipes-graphics/surf/surf_2.1.bb                    | 1 -
>  meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb   | 1 -
>  meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb        | 1 -
>  meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb         | 1 -
>  .../ttf-fonts/source-code-pro-fonts_2.030_1.050.bb           | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb   | 2 +-
>  .../recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb  | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb        | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb          | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb       | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb        | 3 +--
>  meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb   | 2 +-
>  .../recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb   | 3 +--
>  meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb      | 2 +-
>  .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb           | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb   | 1 -
>  .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb           | 3 +--
>  meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb       | 1 -
>  meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb          | 2 +-
>  .../recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb    | 1 -
>  meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb       | 3 +--
>  meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb  | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb    | 2 +-
>  .../ttf-fonts/ttf-ubuntu-font-family_0.83.bb                 | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb  | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb  | 2 +-
>  .../unclutter-xfixes/unclutter-xfixes_1.6.bb                 | 1 -
>  meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb               | 1 -
>  meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb              | 1 -
>  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc           | 1 -
>  meta-oe/recipes-graphics/wayland/libei_1.4.1.bb              | 1 -
>  meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb          | 1 -
>  meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb             | 1 -
>  .../recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb  | 1 -
>  meta-oe/recipes-graphics/yad/yad_6.0.bb                      | 1 -
>  meta-oe/recipes-graphics/ydotool/ydotool_git.bb              | 1 -
>  meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb       | 1 -
>  meta-oe/recipes-kernel/blktests/blktests.bb                  | 1 -
>  .../broadcom-bt-firmware_12.0.1.1105_p3.bb                   | 1 -
>  meta-oe/recipes-kernel/crash/crash.inc                       | 1 -
>  meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb           | 1 -
>  meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb           | 1 -
>  meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb    | 5 ++---
>  meta-oe/recipes-kernel/kpatch/kpatch.inc                     | 1 -
>  meta-oe/recipes-kernel/kpatch/kpatch_git.bb                  | 1 -
>  meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb        | 1 -
>  meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb                | 2 +-
>  meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb              | 2 +-
>  meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb        | 1 -
>  .../recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb    | 1 -
>  meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb             | 1 -
>  meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb          | 1 -
>  meta-oe/recipes-kernel/turbostat/turbostat.bb                | 3 +--
>  meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb            | 2 +-
>  meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb             | 1 -
>  meta-oe/recipes-multimedia/jack/a2jmidid_9.bb                | 1 -
>  meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb      | 1 -
>  meta-oe/recipes-multimedia/jack/jack_1.9.22.bb               | 1 -
>  meta-oe/recipes-multimedia/libass/libass_0.17.4.bb           | 1 -
>  meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb    | 2 +-
>  meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb           | 1 -
>  meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb          | 2 +-
>  meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb          | 2 +-
>  meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb    | 2 +-
>  meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb            | 1 -
>  meta-oe/recipes-multimedia/live555/live555_20210824.bb       | 2 +-
>  meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb     | 1 -
>  meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb             | 1 -
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb      | 1 -
>  meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb             | 1 -
>  meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb          | 1 -
>  meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb             | 1 -
>  meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb              | 2 +-
>  meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb                | 2 +-
>  meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb          | 1 -
>  meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb   | 1 -
>  meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb                 | 1 -
>  meta-oe/recipes-security/audit/audit_4.0.5.bb                | 1 -
>  .../kernel-hardening-checker_0.6.10.bb                       | 1 -
>  meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb          | 1 -
>  .../spectre-meltdown-checker_0.46.bb                         | 1 -
>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb  | 2 +-
>  meta-oe/recipes-shells/mksh/mksh_59c.bb                      | 2 +-
>  .../recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb | 1 -
>  meta-oe/recipes-support/avro/avro-c++_1.11.3.bb              | 2 +-
>  meta-oe/recipes-support/avro/avro-c_1.11.3.bb                | 2 +-
>  meta-oe/recipes-support/bcu/bcu_1.1.115.bb                   | 1 -
>  meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb                 | 1 -
>  meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb     | 1 -
>  meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb        | 1 -
>  meta-oe/recipes-support/btop/btop_1.4.3.bb                   | 1 -
>  meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb     | 1 -
>  meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb   | 1 -
>  meta-oe/recipes-support/cli11/cli11_2.3.2.bb                 | 1 -
>  meta-oe/recipes-support/cmark/cmark_0.31.1.bb                | 1 -
>  meta-oe/recipes-support/composefs/composefs_1.0.8.bb         | 1 -
>  meta-oe/recipes-support/consolation/consolation_0.0.9.bb     | 1 -
>  meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb         | 1 -
>  meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb           | 1 -
>  meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb             | 1 -
>  meta-oe/recipes-support/crucible/crucible_2023.11.02.bb      | 1 -
>  meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb  | 3 +--
>  meta-oe/recipes-support/ctre/ctre_3.9.0.bb                   | 1 -
>  meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb             | 1 -
>  meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb                 | 1 -
>  meta-oe/recipes-support/daemonize/daemonize_git.bb           | 1 -
>  meta-oe/recipes-support/daemontools/daemontools_0.76.bb      | 2 +-
>  meta-oe/recipes-support/dc/double-conversion_3.3.1.bb        | 1 -
>  meta-oe/recipes-support/devmem2/devmem2_2.0.bb               | 1 -
>  meta-oe/recipes-support/dhex/dhex_0.69.bb                    | 2 +-
>  meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb           | 1 -
>  meta-oe/recipes-support/dool/dool_1.3.4.bb                   | 1 -
>  meta-oe/recipes-support/driverctl/driverctl_0.115.bb         | 1 -
>  meta-oe/recipes-support/edid-decode/edid-decode_git.bb       | 1 -
>  meta-oe/recipes-support/eject/eject_2.1.5.bb                 | 2 +-
>  meta-oe/recipes-support/epeg/epeg_git.bb                     | 1 -
>  meta-oe/recipes-support/espeak/espeak_1.48.04.bb             | 2 +-
>  meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb       | 1 -
>  meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb                | 1 -
>  meta-oe/recipes-support/fbset/fbset-modes.bb                 | 3 +--
>  meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb            | 1 -
>  meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb            | 1 -
>  meta-oe/recipes-support/function2/function2_4.2.4.bb         | 1 -
>  meta-oe/recipes-support/fuse/fuse3_3.16.2.bb                 | 2 +-
>  meta-oe/recipes-support/gd/gd_2.3.3.bb                       | 1 -
>  meta-oe/recipes-support/gflags/gflags_2.2.2.bb               | 1 -
>  meta-oe/recipes-support/glog/glog_0.7.1.bb                   | 1 -
>  meta-oe/recipes-support/gnulib/gnulib_202401.bb              | 1 -
>  .../recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb | 1 -
>  meta-oe/recipes-support/gperftools/gperftools_2.16.bb        | 1 -
>  meta-oe/recipes-support/gpm/gpm_git.bb                       | 1 -
>  meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb      | 2 +-
>  meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb               | 2 +-
>  meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb              | 1 -
>  meta-oe/recipes-support/hstr/hstr_3.1.0.bb                   | 2 +-
>  meta-oe/recipes-support/htop/htop_3.3.0.bb                   | 1 -
>  meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb    | 1 -
>  meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb           | 1 -
>  meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb | 1 -
>  meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb  | 1 -
>  meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb       | 1 -
>  meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb             | 2 +-
>  meta-oe/recipes-support/inih/libinih_58.bb                   | 1 -
>  meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb         | 1 -
>  .../recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb  | 1 -
>  meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb           | 1 -
>  meta-oe/recipes-support/lcms/lcms_2.16.bb                    | 2 +-
>  meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb                 | 1 -
>  meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb      | 1 -
>  meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb             | 1 -
>  meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb      | 1 -
>  meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb         | 1 -
>  meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb         | 2 +-
>  meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb       | 1 -
>  meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb | 1 -
>  meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb           | 1 -
>  meta-oe/recipes-support/libfann/libfann_git.bb               | 1 -
>  meta-oe/recipes-support/libftdi/libftdi_1.5.bb               | 2 +-
>  meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb             | 1 -
>  meta-oe/recipes-support/libharu/libharu_2.4.5.bb             | 1 -
>  meta-oe/recipes-support/libiio/libiio_0.26.bb                | 1 -
>  meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb   | 1 -
>  .../recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb    | 1 -
>  meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb   | 1 -
>  meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb          | 3 +--
>  meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb        | 2 +-
>  meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb       | 1 -
>  meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb             | 1 -
>  meta-oe/recipes-support/libnvme/libnvme_1.12.bb              | 1 -
>  meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb        | 1 -
>  meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb  | 1 -
>  meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb      | 1 -
>  meta-oe/recipes-support/libp11/libp11_0.4.13.bb              | 1 -
>  meta-oe/recipes-support/libraw/libraw_0.21.2.bb              | 1 -
>  meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb       | 1 -
>  meta-oe/recipes-support/librsync/librsync_2.3.4.bb           | 1 -
>  .../recipes-support/libserialmodule/libserialmodule_1.0.8.bb | 1 -
>  meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb   | 1 -
>  meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb               | 1 -
>  meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb        | 2 +-
>  meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb             | 1 -
>  meta-oe/recipes-support/libssh/libssh_0.11.1.bb              | 1 -
>  meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb       | 1 -
>  meta-oe/recipes-support/libtar/libtar_1.2.20.bb              | 2 +-
>  meta-oe/recipes-support/libteam/libteam_1.32.bb              | 1 -
>  meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb       | 2 +-
>  meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb    | 1 -
>  meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb       | 1 -
>  meta-oe/recipes-support/liburing/liburing_2.9.bb             | 1 -
>  meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb        | 1 -
>  meta-oe/recipes-support/libusbg/libusbg_git.bb               | 1 -
>  meta-oe/recipes-support/libusbgx/libusbgx-config.bb          | 3 +--
>  meta-oe/recipes-support/libusbgx/libusbgx_git.bb             | 1 -
>  .../recipes-support/libutempter/libutempter_1.2.2-alt1.bb    | 2 +-
>  meta-oe/recipes-support/links/links-x11_2.26.bb              | 2 +-
>  meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb             | 2 +-
>  meta-oe/recipes-support/lvm2/lvm2.inc                        | 1 -
>  meta-oe/recipes-support/mcelog/mce-inject_git.bb             | 1 -
>  meta-oe/recipes-support/mcelog/mce-test_git.bb               | 1 -
>  meta-oe/recipes-support/mcelog/mcelog_204.bb                 | 1 -
>  meta-oe/recipes-support/md4c/md4c_0.5.2.bb                   | 1 -
>  meta-oe/recipes-support/mg/mg_20230501.bb                    | 1 -
>  meta-oe/recipes-support/mime-support/mime-support_3.62.bb    | 2 +-
>  .../multipath-tools/multipath-tools_0.11.1.bb                | 1 -
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb                   | 1 -
>  meta-oe/recipes-support/nmon/nmon_16m.bb                     | 3 +--
>  meta-oe/recipes-support/nspr/nspr_4.36.bb                    | 2 +-
>  meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb        | 1 -
>  meta-oe/recipes-support/opencv/ade_0.1.2.bb                  | 1 -
>  meta-oe/recipes-support/opencv/opencv_4.11.0.bb              | 1 -
>  meta-oe/recipes-support/opensc/opensc_0.26.1.bb              | 1 -
>  meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb            | 2 +-
>  .../opentelemetry/opentelemetry-cpp_1.20.0.bb                | 1 -
>  meta-oe/recipes-support/p910nd/p910nd_0.97.bb                | 1 -
>  meta-oe/recipes-support/pcp/pcp.inc                          | 1 -
>  meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb         | 2 +-
>  meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb       | 1 -
>  meta-oe/recipes-support/picocom/picocom_2024.bb              | 1 -
>  meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb      | 1 -
>  meta-oe/recipes-support/pidgin/icyque_git.bb                 | 1 -
>  meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb        | 1 -
>  .../recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb   | 1 -
>  meta-oe/recipes-support/poco/poco_1.13.3.bb                  | 1 -
>  meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb    | 1 -
>  meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb         | 1 -
>  meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb              | 3 +--
>  meta-oe/recipes-support/re2/re2_2024.03.01.bb                | 1 -
>  meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb       | 1 -
>  meta-oe/recipes-support/remmina/remmina_1.4.36.bb            | 1 -
>  meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb              | 1 -
>  meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb           | 1 -
>  meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb       | 1 -
>  meta-oe/recipes-support/rtkit/rtkit_0.13.bb                  | 1 -
>  meta-oe/recipes-support/satyr/satyr_0.43.bb                  | 1 -
>  meta-oe/recipes-support/sdmon/sdmon_git.bb                   | 1 -
>  meta-oe/recipes-support/serial-utils/pty-forward-native.bb   | 2 +-
>  meta-oe/recipes-support/serial-utils/serial-forward_git.bb   | 2 +-
>  meta-oe/recipes-support/serial/serial_1.2.1.bb               | 1 -
>  meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb          | 2 +-
>  meta-oe/recipes-support/smarty/smarty_5.4.5.bb               | 1 -
>  meta-oe/recipes-support/snapper/snapper_0.11.2.bb            | 1 -
>  .../recipes-support/source-highlight/source-highlight_git.bb | 1 -
>  meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb        | 1 -
>  meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb              | 1 -
>  meta-oe/recipes-support/spitools/spitools_git.bb             | 1 -
>  meta-oe/recipes-support/srecord/srecord_1.65.0.bb            | 2 +-
>  meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb               | 2 +-
>  meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb | 1 -
>  meta-oe/recipes-support/synergy/synergy_git.bb               | 1 -
>  .../recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb | 1 -
>  meta-oe/recipes-support/tbb/tbb_2022.1.0.bb                  | 1 -
>  meta-oe/recipes-support/tio/tio_3.9.bb                       | 1 -
>  meta-oe/recipes-support/udisks/udisks2_2.10.1.bb             | 1 -
>  meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb             | 1 -
>  meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb    | 3 +--
>  meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb          | 2 +-
>  meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb | 1 -
>  meta-oe/recipes-support/upower/upower_1.90.6.bb              | 2 +-
>  meta-oe/recipes-support/usbids/usbids_2025.04.01.bb          | 1 -
>  meta-oe/recipes-support/uthash/uthash_2.3.0.bb               | 1 -
>  meta-oe/recipes-support/utouch/utouch-evemu_git.bb           | 1 -
>  meta-oe/recipes-support/utouch/utouch-frame_git.bb           | 1 -
>  meta-oe/recipes-support/utouch/utouch-mtview_git.bb          | 1 -
>  meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb       | 2 +-
>  meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb     | 1 -
>  meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb              | 2 +-
>  .../recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb   | 1 -
>  .../xdg-desktop-portal/xdg-desktop-portal_1.20.0.bb          | 1 -
>  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb         | 1 -
>  meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb           | 1 -
>  meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb              | 1 -
>  meta-oe/recipes-support/zbar/zbar_git.bb                     | 1 -
>  meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb               | 1 -
>  meta-oe/recipes-test/bats/bats_1.12.0.bb                     | 1 -
>  meta-oe/recipes-test/catch2/catch2_3.8.1.bb                  | 1 -
>  meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb                  | 1 -
>  meta-oe/recipes-test/cpputest/cpputest_4.0.bb                | 1 -
>  meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb                | 1 -
>  meta-oe/recipes-test/cunit/cunit_2.1-3.bb                    | 2 +-
>  meta-oe/recipes-test/evtest/evtest_1.35.bb                   | 1 -
>  meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb                 | 1 -
>  meta-oe/recipes-test/googletest/googletest_1.16.0.bb         | 1 -
>  meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb       | 1 -
>  .../recipes-test/linux-serial-test/linux-serial-test_git.bb  | 1 -
>  meta-oe/recipes-test/pm-qa/pm-qa_git.bb                      | 1 -
>  meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb                | 1 -
>  meta-oe/recipes-test/testfloat/testfloat_3e.bb               | 3 +--
>  meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb          | 1 -
>  meta-perl/recipes-perl/adduser/adduser_3.118.bb              | 2 +-
>  .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb | 2 +-
>  .../recipes-perl/libauthen/libauthen-radius-perl_0.22.bb     | 2 +-
>  .../recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb     | 2 +-
>  .../recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb     | 2 +-
>  meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb            | 2 +-
>  .../libclass/libclass-method-modifiers-perl_2.15.bb          | 2 +-
>  .../libcompress/libcompress-raw-bzip2-perl_2.213.bb          | 2 +-
>  .../libcompress/libcompress-raw-lzma-perl_2.213.bb           | 2 +-
>  .../libcompress/libcompress-raw-zlib-perl_2.213.bb           | 2 +-
>  .../recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb  | 2 +-
>  .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb  | 2 +-
>  .../libcrypt/libcrypt-openssl-guess-perl_0.15.bb             | 2 +-
>  .../libcrypt/libcrypt-openssl-random-perl_0.17.bb            | 2 +-
>  .../recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb  | 2 +-
>  meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb      | 2 +-
>  meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb  | 2 +-
>  meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb      | 2 +-
>  .../libdevel/libdevel-globaldestruction-perl_0.14.bb         | 2 +-
>  meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb | 2 +-
>  meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
>  meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb            | 2 +-
>  meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb     | 2 +-
>  .../libextutils/libextutils-config-perl_0.008.bb             | 2 +-
>  .../libextutils/libextutils-cppguess-perl_0.27.bb            | 2 +-
>  .../libextutils/libextutils-helpers-perl_0.028.bb            | 2 +-
>  .../libextutils/libextutils-installpaths-perl_0.012.bb       | 2 +-
>  .../libextutils/libextutils-parsexs-perl_3.35.bb             | 2 +-
>  meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb | 2 +-
>  meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb | 2 +-
>  meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb   | 2 +-
>  meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb   | 2 +-
>  meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb     | 2 +-
>  .../recipes-perl/libimport/libimport-into-perl_1.002004.bb   | 2 +-
>  .../recipes-perl/libio/libio-compress-lzma-perl_2.213.bb     | 2 +-
>  meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb    | 2 +-
>  meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb  | 2 +-
>  meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb     | 2 +-
>  meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb     | 2 +-
>  .../recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb    | 2 +-
>  .../recipes-perl/libmime/libmime-charset-perl_1.013.1.bb     | 2 +-
>  meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb    | 2 +-
>  .../libmodule/libmodule-build-tiny-perl_0.048.bb             | 2 +-
>  .../recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb   | 2 +-
>  .../recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb   | 2 +-
>  meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb        | 2 +-
>  .../recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb   | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb        | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb    | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb     | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb       | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb     | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb     | 2 +-
>  meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb     | 2 +-
>  meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 2 +-
>  meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb | 2 +-
>  meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb | 2 +-
>  .../libstrictures/libstrictures-perl_2.000006.bb             | 2 +-
>  .../libsub/libsub-exporter-progressive-perl_0.001013.bb      | 2 +-
>  meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb  | 2 +-
>  meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb  | 2 +-
>  meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb    | 2 +-
>  meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb  | 2 +-
>  .../recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb     | 2 +-
>  meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb     | 2 +-
>  .../recipes-perl/libtext/libtext-charwidth-perl_0.04.bb      | 2 +-
>  meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb     | 2 +-
>  meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb     | 2 +-
>  meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb | 2 +-
>  .../libunicode/libunicode-linebreak-perl_2019.001.bb         | 2 +-
>  meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb            | 2 +-
>  .../libxml/libxml-filter-buffertext-perl_1.01.bb             | 2 +-
>  meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb   | 2 +-
>  meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb | 2 +-
>  .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb   | 1 -
>  .../telepathy/telepathy-python3_0.15.19.bb                   | 2 +-
>  meta-python/recipes-devtools/gyp/gyp_git.bb                  | 1 -
>  .../recipes-devtools/python/python3-annotated-types_0.7.0.bb | 2 +-
>  meta-python/recipes-devtools/python/python3-astor_0.8.1.bb   | 1 -
>  .../python/python3-aws-iot-device-sdk-python_1.5.2.bb        | 1 -
>  meta-python/recipes-devtools/python/python3-behave_1.2.6.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb | 1 -
>  meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb | 1 -
>  meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb  | 1 -
>  .../recipes-devtools/python/python3-covdefaults_2.3.0.bb     | 1 -
>  .../recipes-devtools/python/python3-crypt-r_3.13.1.bb        | 1 -
>  meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-dasbus_1.7.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-dbussy_1.3.bb    | 1 -
>  .../recipes-devtools/python/python3-dirty-equals_0.9.0.bb    | 2 +-
>  meta-python/recipes-devtools/python/python3-gcovr_8.3.bb     | 1 -
>  meta-python/recipes-devtools/python/python3-icu_2.15.2.bb    | 2 +-
>  .../python/python3-importlib-metadata_8.7.0.bb               | 2 +-
>  meta-python/recipes-devtools/python/python3-inotify_git.bb   | 1 -
>  .../recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb   | 1 -
>  .../python/python3-keras-applications_1.0.8.bb               | 1 -
>  meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-lief_0.16.5.bb   | 1 -
>  .../recipes-devtools/python/python3-linux-procfs_0.7.3.bb    | 1 -
>  .../recipes-devtools/python/python3-lrparsing_1.0.17.bb      | 2 +-
>  meta-python/recipes-devtools/python/python3-monotonic_1.6.bb | 1 -
>  meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb | 2 +-
>  .../recipes-devtools/python/python3-multidict_6.4.4.bb       | 1 -
>  .../recipes-devtools/python/python3-paho-mqtt_2.1.0.bb       | 2 +-
>  meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb | 1 -
>  meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb   | 1 -
>  .../recipes-devtools/python/python3-ptyprocess_0.7.0.bb      | 2 +-
>  meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb   | 1 -
>  .../recipes-devtools/python/python3-pyatspi_2.46.1.bb        | 1 -
>  .../recipes-devtools/python/python3-pybind11-json_0.2.15.bb  | 1 -
>  .../recipes-devtools/python/python3-pybind11_2.13.6.bb       | 1 -
>  .../recipes-devtools/python/python3-pydantic_2.11.3.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb  | 1 -
>  .../recipes-devtools/python/python3-pyhsslms_2.0.0.bb        | 1 -
>  meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb  | 1 -
>  .../recipes-devtools/python/python3-pymetno_0.13.0.bb        | 1 -
>  .../recipes-devtools/python/python3-pyruvate_1.2.1.bb        | 1 -
>  .../recipes-devtools/python/python3-pyyaml-include_2.2.bb    | 1 -
>  .../recipes-devtools/python/python3-schedutils_0.6.bb        | 1 -
>  .../recipes-devtools/python/python3-slip-dbus_0.6.5.bb       | 2 +-
>  meta-python/recipes-devtools/python/python3-smbus_4.3.bb     | 2 +-
>  meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb | 1 -
>  .../recipes-devtools/python/python3-uefi-firmware_1.12.bb    | 1 -
>  meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb  | 1 -
>  meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb    | 1 -
>  .../python3-piccata/python3-piccata_2.0.3.bb                 | 1 -
>  .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb  | 2 +-
>  .../python-blivet/python3-blivetgui_2.6.0.bb                 | 1 -
>  meta-python/recipes-extended/python-cson/python3-cson_git.bb | 1 -
>  meta-python/recipes-extended/python-meh/python3-meh_0.52.bb  | 1 -
>  .../python-pykickstart/python3-pykickstart_3.63.bb           | 1 -
>  meta-python/recipes-extended/tuna/tuna_0.19.bb               | 1 -
>  .../recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb         | 1 -
>  .../recipes-httpd/apache-mod/apache-websocket_git.bb         | 1 -
>  meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb     | 1 -
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb       | 2 +-
>  meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb          | 1 -
>  meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb       | 1 -
>  meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb    | 2 +-
>  meta-webserver/recipes-support/fcgi/fcgi_git.bb              | 1 -
>  meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb      | 1 -
>  meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb       | 1 -
>  meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb        | 1 -
>  .../xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb    | 1 -
>  meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb        | 2 +-
>  meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb   | 1 -
>  .../closebutton/xfce4-closebutton-plugin_git.bb              | 1 -
>  1055 files changed, 317 insertions(+), 1095 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
> index 5dc3ea6632..2370633551 100644
> --- a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
> +++ b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
> @@ -11,7 +11,7 @@ RDEPENDS:${PN} += "fuse"
>  SRC_URI += "${SOURCEFORGE_MIRROR}/project/httpfs/httpfs2/httpfs2-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "01cb4bb38deb344f540da6f1464dc7edbdeb51213ad810b8c9c282c1e17e0fc1"
>
> -S = "${WORKDIR}/httpfs2-${PV}"
> +S = "${UNPACKDIR}/httpfs2-${PV}"
>
>  do_compile() {
>      oe_runmake -C ${S} httpfs2
> diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> index 7d0a83609e..06051d8013 100644
> --- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> @@ -18,7 +18,6 @@ SRC_URI = "git://github.com/prasad-joshi/logfsprogs.git;branch=master;protocol=h
>             "
>  SRCREV = "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "CC="${CC}" LD="${LD}" AR="${AR}""
>
> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
> index be2a5245ce..4c7fff8ea9 100644
> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
> +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
> @@ -10,7 +10,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
>             file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
>             file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
>  "
> -S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
> +S = "${UNPACKDIR}/ntfs-3g_ntfsprogs-${PV}"
>  SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
>
>  UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
> diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
> index 7768a734d6..890c8aecc0 100644
> --- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
> +++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
> @@ -17,7 +17,6 @@ SRC_URI = "git://github.com/owfs/owfs;branch=master;protocol=https \
>             file://owserver \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep update-rc.d pkgconfig systemd
>
> diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
> index b8399265cd..05a1004b65 100644
> --- a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
> +++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
> @@ -11,4 +11,3 @@ inherit autotools pkgconfig
>  SRC_URI = "git://github.com/phatina/simple-mtpfs.git;protocol=https;branch=master"
>  SRCREV = "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> index 1f8357db00..97c7ad396e 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> @@ -27,6 +27,5 @@ SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=m
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[libsecret] = "--with-libsecret=yes,--with-libsecret=no,libsecret"
>
> -S = "${WORKDIR}/git"
>
>  LDFLAGS:append:libc-musl = " -lexecinfo"
> diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
> index 569c7f6901..c3a00566ab 100644
> --- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
> +++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https \
>             file://a1d58ae1be99571a88b8439b027abe6349b74658.patch \
>  "
>  SRCREV = "c91eb9a9a992f1a36c49a8e6f1146e45b5e1c8e7"
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig ptest
>
> diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
> index e8fda05365..fc474e3238 100644
> --- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
> +++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
> @@ -14,6 +14,5 @@ SRCREV = "773f1853b043eeb64b7459f903a2c65bd096f9d9"
>  DEPENDS = "fuse3"
>  RDEPENDS:${PN} = "bash"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
> diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> index ca5e3302b3..f7379d8935 100644
> --- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> +++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> @@ -25,7 +25,6 @@ SRCREV = "613a901a229e8a701c18f003dd0aee18453e0670"
>
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  CFLAGS:append = " -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES"
>  EXTRA_OEMAKE = "-e MAKEFLAGS="
> diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> index 6fa9104236..cf56cca84c 100644
> --- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
>             file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  # Using both 'module' and 'autotools' classes seems a bit odd, they both
>  # define a do_compile function.
> diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> index 4d2b909809..913b2c1d32 100644
> --- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> +++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> @@ -21,7 +21,6 @@ UPSTREAM_CHECK_COMMITS = "1"
>
>  PV = "4.9+git"
>
> -S = "${WORKDIR}/git"
>
>  export HOSTCC = "${BUILD_CC}"
>  do_configure:prepend() {
> diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
> index 040cbc95bb..eda41010a9 100644
> --- a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
> +++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
> @@ -10,6 +10,5 @@ RDEPENDS:${PN} = "fuse"
>  SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master;tag=${PV}"
>  SRCREV = "a276dbe66faaf7af02d967a648f7598589bf5c5b"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig gettext
> diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
> index b4e5da6e20..645e38ca49 100644
> --- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
> +++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
> @@ -20,7 +20,6 @@ UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
>
>  RDEPENDS:${PN} = "bash btrfs-tools"
>
> -S = "${WORKDIR}/git"
>
>  do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> index d7e654babe..40c4f56650 100644
> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> @@ -18,7 +18,6 @@ SRC_URI = " \
>
>  SRCREV = "46da6c398e70635a296245851fcedbc56c35e824"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig ptest
>
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> index a51c2ef8bd..68727b008e 100644
> --- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig autotools
>
> diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
> index 214b3f914c..bdde0d311a 100644
> --- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
> +++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
> @@ -15,6 +15,5 @@ SRC_URI = "git://github.com/Gregwar/fatcat.git;branch=master;protocol=https \
>
>  SRCREV = "99cb99fc86eb1601ac7ae27f5bba23add04d2543"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
> diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
> index 6832634f61..7f90bfd666 100644
> --- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
> +++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branc
>            "
>  SRCREV = "12da22087de2ec43f0fe5af1237389e94619c483"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "parted"
>
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
> index d11ee0c479..708bbfcf02 100644
> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
> @@ -11,7 +11,6 @@ SRC_URI = "\
>
>  SRCREV = "7a4a0c4f2c6c86aa46a40e3468e394fd4a237491"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
> index d57b5be146..a22e54e24c 100644
> --- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
> +++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=htt
>
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
>
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
> index 2afa752b78..9e86b77c5e 100644
> --- a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;ta
>             file://0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  # brokensep because m4/package_globals.m4 calls ". ./VERSION" (and that's not the only issue)
>  inherit autotools-brokensep useradd pkgconfig
> diff --git a/meta-gnome/classes/clutter.bbclass b/meta-gnome/classes/clutter.bbclass
> index 24b53a13e4..6cf746261a 100644
> --- a/meta-gnome/classes/clutter.bbclass
> +++ b/meta-gnome/classes/clutter.bbclass
> @@ -12,7 +12,7 @@ VERMINOR = "${@get_minor_dir("${PV}")}"
>  REALNAME = "${@get_real_name("${BPN}")}"
>
>  SRC_URI = "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.tar.xz;name=archive"
> -S = "${WORKDIR}/${REALNAME}-${PV}"
> +S = "${UNPACKDIR}/${REALNAME}-${PV}"
>
>  CLUTTERBASEBUILDCLASS ??= "autotools"
>  inherit ${CLUTTERBASEBUILDCLASS} pkgconfig gtk-doc gettext
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
> index 81aa923c03..2012534993 100644
> --- a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
> +++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
> @@ -41,7 +41,6 @@ SRC_URI = " \
>         file://0001-meson-Do-not-check-for-iso-xml-files-during-build.patch \
>  "
>
> -S = "${WORKDIR}/git"
>  SRCREV = "46e93c0c0dafc381e8a308b1befb07e908121722"
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
> index af1a7d8673..032532456d 100644
> --- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
> +++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
> @@ -19,7 +19,6 @@ SRC_URI = " \
>      file://polkit-gnome-authentication-agent-1.desktop \
>  "
>  SRCREV = "a0763a246a81188f60b0f9810143e49224dc752f"
> -S = "${WORKDIR}/git"
>
>
>  do_install:append() {
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
> index 32603af310..414f9c5203 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
> @@ -63,7 +63,6 @@ SRC_URI += "file://0001-meson.build-dont-check-for-lgi.patch"
>  SRC_URI += "file://0001-meson.build-require-iso-codes-native.patch"
>  SRCREV = "c1901c5be644ab8dcaf779b1f383bf5370bc90c6"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"
>  PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
> diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> index b0f9b82e42..b64e91a765 100644
> --- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> +++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> @@ -19,7 +19,6 @@ SRCREV = "2768251dacce3939136c839aeca413f4aa4241d0"
>
>  PV = "1.6.1"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_AUTORECONF += "-I m4"
>
> diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
> index ca3912da88..b6b8ff8c1f 100644
> --- a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
> +++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
> @@ -7,6 +7,5 @@ inherit autotools allarch
>  SRC_URI = "git://github.com/mypaint/mypaint-brushes.git;protocol=https;branch=v1.3.x"
>  SRCREV = "8a0124ac0675103eae8fa41fad533851768ae1ce"
>  PV = "1.3.1"
> -S = "${WORKDIR}/git"
>
>  FILES:${PN} += "${datadir}/mypaint-data"
> diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> index 9e641daa5a..2bbf73dffc 100644
> --- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> +++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/dsalt/devilspie2;branch=master;protocol=https \
>      file://devilspie2.desktop \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit features_check pkgconfig gettext
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince_48.0.bb b/meta-gnome/recipes-gnome/evince/evince_48.0.bb
> index 9f9de50acf..86d7d481bb 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_48.0.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_48.0.bb
> @@ -46,8 +46,8 @@ RRECOMMENDS:${PN} = "adwaita-icon-theme"
>  PACKAGES =+ "${PN}-nautilus-extension"
>
>  do_install:prepend() {
> -    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/libview/ev-view-type-builtins.c
> -    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/libdocument/ev-document-type-builtins.c
> +    sed -i -e 's|${B}/|${TARGET_DBGSRC_DIR}|g' ${B}/libview/ev-view-type-builtins.c
> +    sed -i -e 's|${B}/|${TARGET_DBGSRC_DIR}|g' ${B}/libdocument/ev-document-type-builtins.c
>  }
>
>  FILES:${PN} += "${datadir}/dbus-1 \
> diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
> index 5db9457122..fc88eb7cc1 100644
> --- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
> +++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>  inherit allarch gtk-icon-cache
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${BPN}/${BPN}_${PV}.zip"
>  SRC_URI[sha256sum] = "d4486fda0413f8a81a87e0dd2329f50f2a8a7cb4147b48cf147f0160add8174a"
> diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
> index 11da836ff4..c2e7dd67e9 100644
> --- a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
> +++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
> @@ -8,7 +8,6 @@ DEPENDS = "glib-2.0 gtk+3"
>  inherit meson pkgconfig gobject-introspection features_check gtk-doc
>
>  SRC_URI = "git://github.com/gedit-technology/libgedit-amtk.git;protocol=https;branch=main"
> -S = "${WORKDIR}/git"
>  SRCREV = "f6fbfd1c57de3d97cab2056a5c3088b0da49e8a4"
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
> index d66ce60802..4f21c3e569 100644
> --- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
> +++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
> @@ -8,7 +8,6 @@ DEPENDS = "glib-2.0 gtk+3 libxml2"
>  inherit meson pkgconfig gobject-introspection features_check gtk-doc
>
>  SRC_URI = "git://github.com/gedit-technology/libgedit-gtksourceview.git;protocol=https;branch=main"
> -S = "${WORKDIR}/git"
>  SRCREV = "eaafc892d033713c7c823d8ad602061e456b3c88"
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
> index c9307967de..4b6c3f173f 100644
> --- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
> +++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
> @@ -21,7 +21,7 @@ RDEPENDS:${PN}-python3 = "${PN}"
>  PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
>  src_package_preprocess () {
>          # Trim build paths from comments in generated sources to ensure reproducibility
> -        sed -i -e "s,${B}/../${BPN}-${PV}/${BPN}/,,g" \
> +        sed -i -e "s,${B}/,,g" \
>              ${B}/gexiv2/gexiv2-enums.cpp
>  }
>
> diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
> index 2a97263125..1ceff5ffcf 100644
> --- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
> +++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
> @@ -9,7 +9,7 @@ SECTION = "x11/gnome"
>  DEPENDS = "udev gtk+3 libnotify libcanberra bluez5"
>
>  GNOMEBN = "gnome-bluetooth"
> -S = "${WORKDIR}/${GNOMEBN}-${PV}"
> +S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
>
>  GTKDOC_MESON_OPTION = "gtk_doc"
>
> diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
> index 0e41626e6d..3aa353748b 100644
> --- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
> @@ -28,7 +28,6 @@ inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check
>
>  GIR_MESON_OPTION = ""
>
> -S = "${WORKDIR}/git"
>  SRCREV = "b0bf5288438f74fcb455e1e49f855b4964a2c7cb"
>
>  FILES:${PN} += "${datadir}"
> diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
> index 78606b8a2a..9e2a21d4cc 100644
> --- a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
> +++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
> @@ -8,7 +8,7 @@ SRC_URI = "https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.
>             file://0001-Remove-register-storage-class-classifier.patch"
>  SRC_URI[sha256sum] = "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9d2e6a21f1b6fb9f5"
>
> -S = "${WORKDIR}/chess-${PV}"
> +S = "${UNPACKDIR}/chess-${PV}"
>
>  inherit autotools gettext
>
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
> index cfbde967fd..332c2c5423 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
> @@ -24,7 +24,6 @@ SRC_URI = " \
>         file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
>  "
>  SRCREV = "965cb9307713c618253918633416fcad86bcc5d2"
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[nautilus] = "-Dnautilus_extension=true,-Dnautilus_extension=false,nautilus,nautilus"
> diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
> index 07d631bccb..3b087c148d 100644
> --- a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
> @@ -16,7 +16,6 @@ REQUIRED_DISTRO_FEATURES = "systemd"
>  SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=https;branch=master"
>  SRC_URI += "file://0001-build-Define-list-of-libc-feature-test-macros.patch"
>  SRCREV = "77ecbaddab0ed2121859926acbfccc9cecdee0db"
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "modules"
>  PACKAGECONFIG[httpd] = "-Dhttpd=${sbindir}/httpd,,,apache2 mod-dnssd"
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
> index 9d46b43c42..fe1ae5c7cc 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
> @@ -6,8 +6,7 @@ inherit allarch
>
>  SRC_URI = "file://classic-light.xml"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      install -d ${D}${datadir}/gtksourceview-3.0/styles
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
> index d3fa032fcd..baf4c33d38 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
> @@ -8,7 +8,7 @@ DEPENDS = "gtk+3 libxml2 glib-2.0-native"
>
>  PNAME = "gtksourceview"
>
> -S = "${WORKDIR}/${PNAME}-${PV}"
> +S = "${UNPACKDIR}/${PNAME}-${PV}"
>
>  GNOMEBASEBUILDCLASS = "autotools"
>  inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspection upstream-version-is-even
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
> index 109050397c..b9ff4ef459 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
> @@ -8,7 +8,7 @@ DEPENDS = "gtk+3 libxml2 glib-2.0-native"
>
>  PNAME = "gtksourceview"
>
> -S = "${WORKDIR}/${PNAME}-${PV}"
> +S = "${UNPACKDIR}/${PNAME}-${PV}"
>
>  inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspection vala
>
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
> index 939d053a75..7076214a4d 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
> @@ -16,7 +16,7 @@ DEPENDS = " \
>
>  PNAME = "gtksourceview"
>
> -S = "${WORKDIR}/${PNAME}-${PV}"
> +S = "${UNPACKDIR}/${PNAME}-${PV}"
>
>
>  inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-cache gobject-introspection vala
> diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
> index a89ab8cc74..b7c587d25f 100644
> --- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
> +++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
> @@ -10,5 +10,4 @@ REQUIRED_DISTRO_FEATURES = "opengl"
>  SRCREV = "941560af497148588783db991e8135f52a82574d"
>  SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
> diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
> index 85bc21b5da..3d8a5ed33a 100644
> --- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
> +++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  GNOMEBN = "libgweather"
> -S = "${WORKDIR}/${GNOMEBN}-${PV}"
> +S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
>
>  inherit gnomebase gsettings gobject-introspection gettext gi-docgen vala features_check
>
> diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> index 6c9c36f3ed..f4d027ebf7 100644
> --- a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> +++ b/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> @@ -22,7 +22,6 @@ inherit meson gobject-introspection gettext features_check pkgconfig
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  SRC_URI = "git://gitlab.gnome.org/swilmet/tepl;protocol=https;branch=main"
>  SRCREV = "16ab2567257a053bd957699f89080fafd0999035"
> -S = "${WORKDIR}/git"
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
> diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
> index 9dce2ce4f3..9ec1dfe578 100644
> --- a/meta-gnome/recipes-support/ibus/ibus.inc
> +++ b/meta-gnome/recipes-support/ibus/ibus.inc
> @@ -17,7 +17,6 @@ SRC_URI = " \
>      file://0001-src-Fix-declaration-errors-with-GCC-15.patch \
>  "
>  SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG[appindicator] = "--enable-appindicator,--disable-appindicator,qtbase"
>  PACKAGECONFIG[dconf] = "--enable-dconf,--disable-dconf,dconf"
> diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> index 5365db270e..bbd7c866e1 100644
> --- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> +++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> @@ -8,7 +8,6 @@ DEPENDS = "gtk+3 gobject-introspection-native \
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1f18f9c6d8b4cfcc7d7804a243a4c0b4"
>
> -S = "${WORKDIR}/git"
>
>  SRCREV = "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
>  PV = "3.0+git"
> diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
> index 8f45221ad3..f816cdf239 100644
> --- a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
> +++ b/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
> @@ -15,7 +15,6 @@ DEPENDS = " \
>      libgudev \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb
> index 73f22a3d95..726139a6b3 100644
> --- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb
> +++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb
> @@ -14,7 +14,6 @@ EXTRA_OEMESON = "-Dupdate_cache=true"
>
>  SRC_URI = "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=https;branch=mainline"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "52232e4ba282b2fed68e8fcb4b5d45ed0eaa4ed3"
>
>  FILES:${PN} = " \
> diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
> index 0f6a9291b8..5e83a07a4b 100644
> --- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
> +++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
> @@ -17,7 +17,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
>
>  SRC_URI = "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "337202d4e7179857bc37b03c1a6d8c9d92e47c44"
>
>  PACKAGECONFIG ?= "wallpaper appchooser lockdown settings"
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
> index d8134b228c..30ea09d937 100644
> --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>
>  SRC_URI = "file://icon.xpm"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install:prepend () {
>  echo '# /boot/boot.cfg - KEXECBOOT configuration file.
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> index 2be9076726..00985c09c5 100644
> --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> @@ -4,7 +4,6 @@ HOMEPAGE = "https://github.com/kexecboot/kexecboot/wiki"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  PV = "0.6+git"
> -S = "${WORKDIR}/git"
>  SRC_URI = " \
>      git://github.com/kexecboot/kexecboot.git;branch=master;protocol=https \
>      file://0001-Fix-argument-errors-in-gcc-15.patch \
> diff --git a/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb b/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
> index c2b3faddda..2dcbb95255 100644
> --- a/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
> +++ b/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
> @@ -3,8 +3,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>  SRC_URI = "file://init-debug.sh"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>          install -m 0755 ${UNPACKDIR}/init-debug.sh ${D}/init
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
> index 871119521f..d59b357dc1 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
> @@ -18,7 +18,6 @@ DEPENDS:append:libc-musl = " fts"
>
>  inherit bash-completion pkgconfig
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF = "--prefix=${prefix} \
>                  --libdir=${nonarch_libdir} \
> diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
> index ff18b0b190..60f68728e9 100644
> --- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
> +++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
> @@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
>  DEPENDS = "popt util-linux rpm"
>  DEPENDS:append:libc-musl = " libexecinfo argp-standalone"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "c01b0d5bb182bde35b464d14996acf354a3ada2e"
>  SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;;branch=main \
>             file://0001-rename-grub2-editenv-to-grub-editenv.patch \
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index 6093e19b7c..2af53b18e3 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -29,7 +29,7 @@ ARMPATCHES:arm = " \
>                   "
>  SRC_URI[sha256sum] = "d673a294f742d59368222ff5c38462d81098c55063799de6fb8a7ba3d4af0436"
>
> -S = "${WORKDIR}/klibc-${PV}"
> +S = "${UNPACKDIR}/klibc-${PV}"
>
>  OPTFLAGS = "${TUNE_CCARGS} -Os -fcommon"
>  OPTFLAGS:append = " ${DEBUG_PREFIX_MAP}"
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
> index 43ddb82a00..461d75e625 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
> @@ -19,7 +19,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
>               file://0001-make-Add-compiler-includes-in-cflags.patch \
>               "
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "--disable-tests --without-jffs --without-ubifs"
>
> diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> index 363cdb9adf..2df53ff38e 100644
> --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> @@ -61,7 +61,6 @@ SRC_URI:append:aarch64 = " file://arm64_kexec-image-header.h-add-missing-le64toh
>
>  SRC_URI:append:powerpc = " file://powerpc-purgatory-Makefile-remove-unknown-flags.patch"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
>
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> index 326a754ce7..5a42fc760c 100644
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> @@ -12,7 +12,6 @@ SRCREV = "c540ce2431bdeac73359029d4592b45790e1d154"
>  SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
> index e20358955a..37431dca05 100644
> --- a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
> +++ b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
> @@ -9,7 +9,6 @@ DEPENDS = "libusb1 openssl pcsc-lite"
>  SRCREV = "190d6dee96ca70f8b614932b1498332b1504632b"
>  SRC_URI = "git://repo.or.cz/oscam.git;protocol=https;nobranch=1"
>
> -S = "${UNPACKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> index 2d79777001..6a7f6c3f5d 100644
> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -16,7 +16,6 @@ SRCREV = "cc602833684953fc3e6f1c89d4f08f6dfef179e3"
>  PV = "4.3+git"
>  PKGV = "4.3+git${GITPKGV}"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "--arch=${TARGET_ARCH} \
>                   --disable-hdhomerun_static \
> diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
> index 6803806063..4b439e2ca5 100644
> --- a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
> +++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
>  SRC_URI = "git://github.com/Matroska-Org/libebml.git;branch=v1.x;protocol=https"
>  SRCREV = "1878e784321673561039a6a37076b2736f4dc98f"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig cmake dos2unix
>
> diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
> index 16862e690e..d38366a735 100644
> --- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
> +++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
> @@ -8,7 +8,6 @@ DEPENDS = "libebml"
>  SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https"
>  SRCREV = "f5315fddda2d434e47035c038549a808d8b8eac7"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig cmake
>
> diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
> index b5c8ddca11..92f7270972 100644
> --- a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
> +++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
> @@ -15,7 +15,7 @@ SRC_URI = " \
>  SRC_URI[md5sum] = "d2edc7710c72cbf3ab297c414e35ebda"
>  SRC_URI[sha256sum] = "916e7d152added24617efc350142438a46099efe062bd8781d36dbf10b4e6ff0"
>
> -S = "${WORKDIR}/alsaequal"
> +S = "${UNPACKDIR}/alsaequal"
>
>  EXTRA_OEMAKE = " \
>      Q='' \
> diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
> index 94e3f4f14f..72baf58cf0 100644
> --- a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
> +++ b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
> @@ -9,7 +9,6 @@ SRCREV = "10aece4157eb79315da205f39e19bf6ab3ee30d0"
>  SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV} \
>             file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
> index f089e036e3..162a51284e 100644
> --- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
> +++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
> @@ -21,7 +21,6 @@ SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master \
>
>  SRCREV = "959573c2cccef5cf074f5b2fa7941abbd699c5f4"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[a2dpconf] = "--enable-a2dpconf,--disable-a2dpconf"
> diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
> index 0b844ee7d3..0928da1dbd 100644
> --- a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
> +++ b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
> @@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c50df902a55
>
>  # Uppercase letters are not allowed in the recipe name, thus the recipe can not be named cdparanoia-III and
>  # we need to add the path to the extracted sources explicitely:
> -S = "${WORKDIR}/cdparanoia-III-${PV}"
> +S = "${UNPACKDIR}/cdparanoia-III-${PV}"
>
>  # cdparanoia Makefile can not be used with several threads (because the static library target and the shared
>  # library target use object files which are compiled in the same directory, the object files are just removed
> diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
> index 47341e2106..d600e3b5e3 100644
> --- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
> +++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8055cfe7548dfdaa3a6dc45d8793669"
>  SRC_URI = "git://code.videolan.org/videolan/dav1d.git;protocol=https;nobranch=1"
>  SRCREV = "42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS:append:x86 = " nasm-native"
>  DEPENDS:append:x86-64 = " nasm-native"
> diff --git a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
> index ddd4c26efe..a330d769c5 100644
> --- a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
> +++ b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/foo86/dcadec.git;protocol=https;branch=master \
>             file://0001-define-BASELIB-make-variable.patch \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit lib_package
>
> diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
> index bed5af9bf3..21a6613622 100644
> --- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
> +++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
> @@ -9,7 +9,6 @@ DEPENDS = "glib-2.0 dbus dleyna-core"
>
>  SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https"
>  SRCREV = "de913c35e5c936e2d40ddbd276ee902cd802bd3a"
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
> index 8aaab7893e..4f743b16f6 100644
> --- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
> +++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
> @@ -15,7 +15,6 @@ PV .= "+git"
>
>  SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https"
>  SRCREV = "1c6853f5bc697dc0a8774fd70dbc915c4dbe7c5b"
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
> index a385a50de7..3e55a212d4 100644
> --- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
> +++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https \
>             file://0001-add-gupnp-1.2-API-support.patch \
>            "
>  SRCREV = "50fd1ec9d51328e7dea98874129dc8d6fe3ea1dd"
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> index b0a347f252..d60abd2082 100644
> --- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> +++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> @@ -14,7 +14,6 @@ RDEPENDS:${PN} = "dleyna-connector-dbus"
>  PV .= "+git"
>  SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https"
>  SRCREV = "eb895ae82715e9889a948ffa810c0f828b4f4c76"
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
> index 833ec2a393..232130be0f 100644
> --- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
> +++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
> @@ -13,7 +13,7 @@ SRC_URI = "https://www.linuxtv.org/hg/dvb-apps/archive/3d43b280298c.tar.bz2;down
>            file://0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch \
>            "
>  SRC_URI[sha256sum] = "f39e2f0ebed7e32bce83522062ad4d414f67fccd5df1b647618524497e15e057"
> -S = "${WORKDIR}/${BPN}-3d43b280298c"
> +S = "${UNPACKDIR}/${BPN}-3d43b280298c"
>
>  inherit perlnative
>
> diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
> index 55475b40f1..97196bbcf2 100644
> --- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
> +++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"
>  SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=https;branch=master"
>  SRCREV = "801f67f671929311e0c9952c5f92d6e147c7b003"
>
> -S = "${WORKDIR}/git"
>
>  SRC_URI[md5sum] = "fef453b5d6ee28ff302c600b8cded3e7"
>  SRC_URI[sha256sum] = "07c2a64b098eb48b2e9d729d5e778c08f7d22f28adc8da7c3f92c58da1cbbd8e"
> diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> index bb9edfd5bf..af543af80e 100644
> --- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> +++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> @@ -13,7 +13,6 @@ SRC_URI += "file://0001-Remove-defining-const-as-nothing.patch"
>
>  SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "--enable-shared"
>
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
> index 62900011a1..b8396209c5 100644
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
> @@ -13,7 +13,6 @@ SRC_URI = " \
>  "
>  SRCREV = "9f2edaa3cbd456997cb420fb68b6f960faaafd12"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig lib_package
>
> diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
> index c12be91664..6348f25a57 100644
> --- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
> +++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
>  SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master"
>  SRCREV = "870dd32d42f626dc2246d34b2224ffb6fd73e205"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp libnsl2"
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
> index dc43bed63b..b87442c893 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
> @@ -19,7 +19,6 @@ SRC_URI = " \
>      file://0001-tracers-Fix-buffer-overflow.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += " \
>      --disable-graphviz \
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> index 4720edf153..d068d66bb6 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> @@ -11,7 +11,6 @@ SRCBRANCH ?= "master"
>  SRCREV = "dac03d5e4102080a8f3ef274a6a6583455962095"
>  SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
>             file://0001-gstd-Remove-redundant-rpaths.patch"
> -S = "${WORKDIR}/git"
>
>  # Remove the +really when upstream version is > 1.0
>  PV = "1.0+really0.15.2"
> diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
> index b60cba1dd6..999891c232 100644
> --- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
> +++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
> @@ -21,7 +21,6 @@ SRC_URI = "git://github.com/WeAreROLI/JUCE.git;protocol=https;branch=${BRANCH} \
>             file://0001-StandardHeader-Include-utility-for-GCC-12-compatibil.patch \
>             "
>
> -S = "${WORKDIR}/git"
>  PV = "6.1.6"
>
>  JUCE_PROJUCER_BUILD_PATH = "${B}/extras/Projucer/Builds"
> diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
> index 885758b6a4..9a82cd86bb 100644
> --- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
> +++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c528b75b07425b5c1d2e34de98c397b5"
>
>  SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0.x"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "d1c26facaf5a8a97919ceee06814d05d10e25622"
>
>  DEPENDS = "dav1d"
> diff --git a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> index 98f8e5b84d..69d33c9f6a 100644
> --- a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/Avnu/libavtp.git;branch=master;protocol=https"
>  SRC_URI:append:libc-musl = " file://0001-provide-64bit-host-to-network-conversion-macros.patch"
>  SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> index 3d43b4f1da..c7fe631a43 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> @@ -18,7 +18,6 @@ SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
>
>  PE = "1"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
> diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> index e9d5107986..a509337894 100644
> --- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
>  SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https"
>  SRCREV = "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
> index bfa6de90d3..93bdc63b56 100644
> --- a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://code.videolan.org/videolan/libdvbcsa.git;protocol=https;branch=
>             file://libdvbcsa.pc \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools lib_package pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
> index ac469fce87..a3f5f21406 100644
> --- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
> +++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
> @@ -8,7 +8,6 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
>
>  SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "5e9deb19fe6b3768af0bb8e9e5e8438b15171bf3"
>
>  inherit cmake pkgconfig
> diff --git a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
> index 7f531efc63..bcf91b5453 100644
> --- a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
> +++ b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  SRC_URI = "git://github.com/google/liblc3.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "1a5938ebaca4f13fe79ce074f5dee079783aa29f"
>
>  inherit pkgconfig meson
> diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
> index f59220d0da..613147598a 100644
> --- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
> +++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
> @@ -16,7 +16,7 @@ SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release
>            "
>  SRC_URI[sha256sum] = "093713c1c1024f4f10c4779a66ceb2af51fb7c908a9e99feb892d04019220ba1"
>
> -S = "${WORKDIR}/libopenmpt-${PV}+release.autotools"
> +S = "${UNPACKDIR}/libopenmpt-${PV}+release.autotools"
>
>  inherit autotools pkgconfig ptest
>
> diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> index 3d631ea0b6..d7325abd7a 100644
> --- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> +++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/OpenELEC/libsquish.git;protocol=https;branch=master
>             file://0001-Add-support-for-variable-libdir.patch \
>            "
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "INSTALL_DIR=${D}${prefix} LIBDIR_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
>                  ${@bb.utils.contains('TUNE_FEATURES', 'altivec', 'USE_ALTIVEC=1', '', d)}"
> diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
> index b1572b32ac..10e64e9878 100644
> --- a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
> +++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
> @@ -9,6 +9,5 @@ DEPENDS = "libusb jpeg"
>  SRC_URI = "git://github.com/libuvc/libuvc.git;branch=master;protocol=https"
>  SRCREV = "68d07a00e11d1944e27b7295ee69673239c00b4b"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
> diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
> index 76f51196aa..b9093d19bb 100644
> --- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
> +++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
> @@ -27,6 +27,5 @@ SRC_URI = "git://github.com/MycroftAI/mimic1.git;branch=master;protocol=https \
>
>  inherit autotools pkgconfig
>
> -S = "${WORKDIR}/git"
>
>  CPPFLAGS:append = " -Wno-error"
> diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> index 170e676b24..cb2a1865e8 100644
> --- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> +++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> @@ -15,7 +15,6 @@ SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
>             file://0001-Add-compatibility-with-FFMPEG-7.0.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  # This remove "--exclude=autopoint" option from autoreconf argument to avoid
>  # configure.ac:30: error: required file './ABOUT-NLS' not found
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> index 2b373d31e5..1ae43e8aef 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git;branch=master;protocol
>             file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_request_.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
> index 2746c6bb80..a9dae6073a 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
> @@ -9,7 +9,6 @@ SRC_URI = " \
>      git://github.com/MusicPlayerDaemon/libmpdclient;branch=master;protocol=https \
>  "
>  SRCREV = "7124a0ad4841a44db084bb785a6e7120bc8f0139"
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "tcp"
>  PACKAGECONFIG[tcp] = "-Dtcp=true,-Dtcp=false"
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb
> index 93df25ee2f..6f337febb3 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb
> @@ -10,4 +10,3 @@ DEPENDS += "libmpdclient"
>  SRC_URI = "git://github.com/MusicPlayerDaemon/mpc;branch=master;protocol=https"
>  SRCREV = "31c900b79b3a1cd7f2944e92f24223d12589fdaa"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
> index 7250c22a68..d1dd4d7442 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
> @@ -23,7 +23,6 @@ SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
>             "
>  SRCREV = "063abb31a68f7ee92a246256eec4234ab8b7ed8b"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)} \
>      -Dadplug=disabled \
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
> index d93c054f45..626897aa3b 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
> @@ -34,4 +34,3 @@ PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
>
>  SRC_URI = "git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https"
>  SRCREV = "f81f875fc5785383d24f54fb9bd3cf06efd915a4"
> -S = "${WORKDIR}/git"
> diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
> index 8bedc693ba..bdc4d7280c 100644
> --- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
> +++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
> @@ -20,7 +20,6 @@ SRC_URI = "git://github.com/MycroftAI/mycroft-core.git;branch=master;protocol=ht
>             file://mycroft.service \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit systemd features_check
>
> diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.1.14.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.1.14.0.bb
> index 36885f29e2..6ac74748be 100644
> --- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.1.14.0.bb
> +++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.1.14.0.bb
> @@ -8,7 +8,6 @@ SRC_URI = " \
>      file://0001-Makefile-add-clean-target.patch \
>  "
>  SRCREV = "1889e62e2d35ff7aa9baca2bceb14f053785e6f1"
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${baselib}"
>
> diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
> index d57c9b5c64..4204017c20 100644
> --- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
> +++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
> @@ -10,7 +10,6 @@ DEPENDS = "zlib libsndfile1"
>  SRCREV = "dc7d7054a5b4f3bec1dc23a42fd616a0847af948"
>  SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pipewire pulseaudio', d)}"
>  PACKAGECONFIG[alsa] = "-DALSOFT_BACKEND_ALSA=ON,-DALSOFT_BACKEND_ALSA=OFF,alsa-lib"
> diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb
> index 0226745bbc..b210454efd 100644
> --- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb
> +++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb
> @@ -11,7 +11,6 @@ DEPENDS = " nasm-native"
>
>  inherit meson pkgconfig
>
> -S = "${WORKDIR}/git"
>  SRCREV = "19120fcb8f89b16126e9cfee096b2f0751554fdc"
>  BRANCH = "openh264v${PV}"
>  SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
> diff --git a/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb b/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
> index b76c5ba01d..92df308ce0 100644
> --- a/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
> +++ b/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
> @@ -8,7 +8,7 @@ SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
>  SRC_URI[md5sum] = "ff2d0536e960cabbfb8ca7c8c1759b6c"
>  SRC_URI[sha256sum] = "b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86"
>
> -S = "${WORKDIR}/opus-tools-${PV}"
> +S = "${UNPACKDIR}/opus-tools-${PV}"
>
>  DEPENDS = "libopus libopusenc flac opusfile"
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
> index 184ed45d2d..dde0039584 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.2.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=http
>             file://0001-pass-right-types-to-methods.patch \
>             "
>
> -S = "${WORKDIR}/git"
>  SRCREV = "80dae7e24bec02b2befe09a72fbac6e2b38ccb5c"
>
>  inherit meson pkgconfig
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
> index d4ae3381bd..e41cfd221c 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
> @@ -16,7 +16,6 @@ SRCREV = "83ada1e086f8fa49bf9652df2edd9ccee5efa48b"
>  BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
>  SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig systemd gettext useradd
>
> diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
> index 9297641c88..c02b45054f 100644
> --- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
> +++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
> @@ -13,7 +13,6 @@ SRC_URI = " \
>      git://git.ffmpeg.org/rtmpdump;branch=master \
>  "
>
> -S = "${WORKDIR}/git"
>
>  CVE_STATUS_GROUPS += "CVES_2015"
>  CVES_2015 = "CVE-2015-8270 CVE-2015-8271 CVE-2015-8272"
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> index 5eba4da207..50033eca75 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> @@ -9,8 +9,7 @@ SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c2
>
>  inherit allarch
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      install -d ${D}${datadir}/movies
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> index 29e60cb0a8..0a1f50791c 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> @@ -9,8 +9,7 @@ SRC_URI[sha256sum] = "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea05b6679444864781299b24db0
>
>  inherit allarch
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      install -d ${D}${datadir}/movies
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> index 50ea2e3c88..ed010ce639 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> @@ -9,8 +9,7 @@ SRC_URI[sha256sum] = "b957d6e6212638441b52d3b620af157cc8d40c2a0342669294854a06ed
>
>  inherit allarch
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      install -d ${D}${datadir}/movies
> diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> index ed3ff75ac0..fedb15d053 100644
> --- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> +++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> @@ -8,8 +8,7 @@ SRC_URI[sha256sum] = "bd2b5bc6c16d4085034f47ef7e4b3938afe86b4eec4ac3cf2685367d3b
>
>  inherit allarch
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      install -d ${D}${datadir}/movies
> diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
> index 8607af64ed..90a7a85df8 100644
> --- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
> +++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
> @@ -41,7 +41,6 @@ SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
>  # last release was in 2015, use latest hash from 2024-05-30
>  PV .= "+git"
>  SRCREV = "f3094754a7c2a7e55c35621d20fa9945736e72df"
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT:append = " libsox_project:libsox sound_exchange_project:sound_exchange"
>
> diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> index f115553fd1..9993837f19 100644
> --- a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> @@ -28,7 +28,6 @@ SRC_URI = "\
>  # https://lists.openembedded.org/g/openembedded-devel/message/109325
>  SRCREV = "df1282eb9af538ab1aadb6d66146e258451d4fe4"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
> index b513e959d3..8965c8ee75 100644
> --- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
> +++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
> @@ -10,7 +10,6 @@ PV .= "+git"
>  SRCREV = "f78ed25aced2dfea743867b8205a787bfb091340"
>  SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson
>
> diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> index f8ab1bf680..f195a4a654 100644
> --- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> +++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https;branch=master \
>  "
>  SRCREV = "7c30a66346199f3f09017a09567c6c8a3a0eedc8"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
> index 15ddcdb04e..08104cbc62 100644
> --- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
> +++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
> @@ -15,7 +15,7 @@ SRC_URI = " \
>      file://0001-task_queue-fix-build-with-gcc-15.patch \
>  "
>  SRC_URI[sha256sum] = "2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0838ad6ec2e86f1b9"
> -S = "${WORKDIR}/webrtc-audio-processing-${PV}"
> +S = "${UNPACKDIR}/webrtc-audio-processing-${PV}"
>
>  LDFLAGS:append:libc-musl = " -lexecinfo"
>
> diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
> index 8eab2c4ff0..9aab57a089 100644
> --- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
> +++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
> @@ -13,7 +13,7 @@ SRC_URI = " \
>      file://e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch \
>  "
>  SRC_URI[sha256sum] = "ae9302824b2038d394f10213cab05312c564a038434269f11dbf68f511f9f9fe"
> -S = "${WORKDIR}/webrtc-audio-processing-${PV}"
> +S = "${UNPACKDIR}/webrtc-audio-processing-${PV}"
>
>  LDFLAGS:append:libc-musl = " -lexecinfo"
>  # | riscv32-yoe-linux-musl-ld.lld: error: undefined reference: __atomic_store_8
> diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.bb
> index 9140b724d1..8e50378bfd 100644
> --- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.bb
> +++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.bb
> @@ -16,7 +16,6 @@ SRC_URI = " \
>      file://90-OE-disable-session-dbus-dependent-features.lua \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig gobject-introspection systemd
>
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> index ae0f7758c1..dedc3aa4d3 100644
> --- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> @@ -13,7 +13,7 @@ SRC_URI = " \
>      file://0001-json11.cpp-Include-cstdint.patch \
>  "
>  SRC_URI[sha256sum] = "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
> -S = "${WORKDIR}/x265_${PV}/source"
> +S = "${UNPACKDIR}/x265_${PV}/source"
>
>  inherit lib_package cmake pkgconfig
>
> diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
> index 5e680c4640..811a876885 100644
> --- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
> +++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
> @@ -11,7 +11,6 @@ SRCREV = "ca1bf4b810e2d188d04cb6286f957008ee1b7681"
>  SRC_URI = "git://github.com/graeme-hill/crossguid;protocol=https;branch=master \
>             file://0001-include-missing-cstdint.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
> index 04d16ffe11..b3953cf5c3 100644
> --- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
> +++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
> @@ -10,7 +10,6 @@ PV = "0.3.1+git"
>
>  SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit vala meson pkgconfig
>
> diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
> index 376dd15d17..c5d497c468 100644
> --- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
> +++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
> @@ -13,7 +13,7 @@ inherit gnomebase gobject-introspection vala features_check
>  SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
>  SRC_URI[sha256sum] = "c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17"
>
> -S = "${WORKDIR}/libmediaart-${PV}"
> +S = "${UNPACKDIR}/libmediaart-${PV}"
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
> index d1cbe0f590..9130b290b9 100644
> --- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
> +++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
>  SRC_URI = "git://github.com/cisco/libsrtp.git;branch=main;protocol=https"
>  SRCREV = "a566a9cfcd619e8327784aa7cff4a1276dc1e895"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[nss] = "-Dcrypto-library=nss,, nss,,, openssl"
> diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb b/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
> index d6cf36dfbe..91651fda8e 100644
> --- a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
> +++ b/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master \
>             file://0001-don-t-install-srt-ffplay.patch \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
> index 0b90bc0db9..c3056c9e86 100644
> --- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
> +++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
> @@ -19,7 +19,6 @@ REQUIRED_DISTRO_FEATURES = "opengl wayland"
>  SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;branch=master \
>             file://0001-screencast-Fix-build-with-older-mesa.patch"
>
> -S = "${WORKDIR}/git"
>  PV .= "+git"
>  SRCREV = "d9ada849aeca6137915de2df69beaef4e272cc1d"
>
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> index 6cd25e346a..ac23182009 100644
> --- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> +++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  SRC_URI = "git://github.com/OpenPrinting/system-config-printer.git;protocol=https;branch=master"
>
>  SRCREV = "895d3dec50c93bfd4f142bac9bfcc13051bf84cb"
> -S = "${WORKDIR}/git"
>
>  inherit autotools gettext pkgconfig python3native features_check
>
> diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
> index c5dcccbac5..2f15abbcfd 100644
> --- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
> +++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
> @@ -8,7 +8,6 @@ SRCREV = "8e88e3590a19006362ea8b8dfdc18bb88b3cb3b5"
>
>  SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  LICENSE = "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
> diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> index 39569e9d06..17ef3c99cb 100644
> --- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> +++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> @@ -40,7 +40,6 @@ EXTRA_OEMAKE += 'CC="${CC}" CFLAGS="${CFLAGS}" LDDLL="${CCLD} ${LDFLAGS}" LD="${
>                   ${@ "STATICLIB=no" if d.getVar('DISABLE_STATIC') != "" else "" } \
>  '
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>         install -d ${D}/${bindir} ${D}/${libdir} ${D}/${includedir}
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
> index 629e1bc8cd..4a2e3a3ba0 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
> @@ -9,7 +9,6 @@ inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon-cache f
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>
>  SRC_URI = "git://github.com/blueman-project/blueman.git;protocol=https;branch=2-4-stable"
> -S = "${WORKDIR}/git"
>  SRCREV = "bdacba8afe53066bc3a338997e26fee416af2261"
>
>  EXTRA_OEMESON = "-Druntime_deps_check=false \
> diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> index 5b784d9a04..e1f01de8a0 100644
> --- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> +++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https;branch=master \
>             file://0001-bluepy-Fix-username-issue-with-tarballs.patch \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3 pkgconfig
>
> diff --git a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
> index 22005632c2..ab9cebaf38 100644
> --- a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
> +++ b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
> @@ -17,7 +17,6 @@ SRC_URI = "\
>  "
>  SRCREV = "f65321736475429316f07ee94ec0deac8e46ec4a"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
> index dfa7437ba8..835f33055a 100644
> --- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
> +++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  inherit cmake
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "lksctp-tools"
>  PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> index a7e81213c3..06d78b9328 100644
> --- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
>             file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  # civetweb supports building with make or cmake (although cmake lacks few features)
>  inherit cmake
> diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
> index a8436ea84d..23a439a989 100644
> --- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
> +++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
> @@ -14,6 +14,5 @@ SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
>
>  SRCREV = "434f205cbd45de0961cc42e541b5bf54569e912a"
>
> -S = "${WORKDIR}/git"
>
>  FILES:${PN} += "${libdir}/daq/*.so"
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
> index e458321e6e..8a33feec21 100644
> --- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
> @@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "0ac416bb55997ca8632174fd10737fd61cdb8dba2752160a335775bc21
>  UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>
> -S = "${WORKDIR}/dhcp-4.4.3-P1"
> +S = "${UNPACKDIR}/dhcp-4.4.3-P1"
>
>  inherit autotools-brokensep systemd pkgconfig
>
> diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
> index cc36fbd4f0..1dff38f0d5 100644
> --- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
> +++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/tomaszmrugalski/dibbler;branch=master;protocol=https
>             "
>  PV = "1.0.1+1.0.2RC1+git${SRCREV}"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "debug bind-reuse resolvconf dns-update"
>
> diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
> index 5abdd97594..fea4d858ed 100644
> --- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
> +++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
> @@ -48,7 +48,6 @@ CVE_STATUS[CVE-2011-4966] = "fixed-version: The CPE in the NVD database doesn't
>
>  PARALLEL_MAKE = ""
>
> -S = "${WORKDIR}/git"
>
>  LDFLAGS:append:powerpc = " -latomic"
>  LDFLAGS:append:mipsarch = " -latomic"
> diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
> index 75aaf521c4..f79121b142 100644
> --- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
> +++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
> @@ -10,7 +10,6 @@ SRCREV = "3dfbe889b1f65077efe579da34fc1d6819fcb7f3"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools multilib_script pkgconfig
>
> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
> index 0e1f50164a..cfded66e41 100644
> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
> @@ -20,7 +20,6 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https
>             file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig python3-dir python3native siteinfo
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> index b6938b2991..950c1ff52d 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> @@ -22,7 +22,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>
>  SECTION = "libs"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
>  SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
>             file://run-ptest \
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
> index 1e99f92306..0b64d661c4 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
> @@ -22,7 +22,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>
>  SECTION = "libs"
>
> -S = "${WORKDIR}/git"
>  SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=main;tag=v${PV} \
>             file://run-ptest \
>             "
> diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
> index c250ea8779..8dce6c5c4a 100644
> --- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
> +++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
> @@ -12,7 +12,6 @@ SECTION = "libs/networking"
>  SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master"
>  SRCREV = "fc3f684a80151a3319446fc96083a9ff384ee4fe"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
> index 9ae3b89371..8d681f495e 100644
> --- a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
> +++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
>  SRC_URI = "git://github.com/nanomsg/nng.git;branch=main;protocol=https"
>  SRCREV = "85fbe7f9e4642b554d0d97f2e3ff2aa12978691a"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
> index b52154025b..aac26966f1 100644
> --- a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
> +++ b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
> @@ -9,6 +9,5 @@ PV = "1.3.0"
>
>  SRC_URI = "git://github.com/cwzx/nngpp;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
> index 48f50abaf1..026aea7777 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
> @@ -16,7 +16,7 @@ SRC_URI = " \
>  "
>  SRC_URI[sha256sum] = "b055e26349b516b23585798ab3ef57b436b014800e92a8ac732cfc8e76c5dafa"
>
> -S = "${WORKDIR}/NetworkManager-fortisslvpn-${PV}"
> +S = "${UNPACKDIR}/NetworkManager-fortisslvpn-${PV}"
>
>  # meta-gnome in layers is required using gnome:
>  PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,gtk+3 libnma libsecret,"
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
> index ee19afbd11..6369d8d0ef 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
> @@ -13,7 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager-openconnect/${@gnome_verdir("${PV}")}/
>
>  SRC_URI[sha256sum] = "5dedaa785d82d8e239ddd082bfac5250c691e964464be1807b6827263633cdcc"
>
> -S = "${WORKDIR}/NetworkManager-openconnect-${PV}"
> +S = "${UNPACKDIR}/NetworkManager-openconnect-${PV}"
>
>  # meta-gnome in layers is required using gnome:
>  PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,gtk+3 gcr3 libnma libsecret,"
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb
> index 2d2055ba65..9859d01463 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb
> @@ -15,7 +15,7 @@ SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',
>
>  SRC_URI[sha256sum] = "903fd4c0aebd2aa7ac70c9d8c2bed8df922655d22d764514403566ae89b7e886"
>
> -S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
> +S = "${UNPACKDIR}/NetworkManager-openvpn-${PV}"
>
>  # meta-gnome in layers is required using gnome:
>  PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,gtk+3 libnma libsecret"
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
> index dd894c0900..b8c6a936ad 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
> @@ -47,7 +47,6 @@ SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',
>
>  SRCREV = "995a28fa1ccc54ad22e794294c3c6783cc3f30ed"
>
> -S = "${WORKDIR}/git"
>
>  # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
>  NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
> diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
> index 7d0e5f2052..e1027747b6 100644
> --- a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
> @@ -21,7 +21,6 @@ PACKAGECONFIG[libproxy]  = "--with-libproxy,--without-libproxy,libproxy,"
>  # not config defaults
>  PACKAGECONFIG[pcsc-lite] = "--with-libpcsclite,--without-libpcsclite,pcsc-lite,"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig bash-completion
>
> diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
> index 4e964b3448..9823d772a3 100644
> --- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
> +++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
> @@ -12,7 +12,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[resolvconf] = "--with-resolvconf=${base_sbindir}/resolvconf --enable-resolvconf,--with-resolvconf=DISABLED,,"
>  PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir},--without-systemdsystemunitdir,,"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig systemd
>
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> index 3bca9df5ab..576c316ec3 100644
> --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> @@ -21,7 +21,6 @@ SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=m
>             file://0001-Musl-build-fix.patch;patchdir=third_party/openthread/repo \
>             "
>
> -S = "${WORKDIR}/git"
>  SYSTEMD_SERVICE:${PN} = "otbr-agent.service"
>
>  inherit pkgconfig cmake systemd
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> index 4456835410..009a6ef88c 100644
> --- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> @@ -14,7 +14,6 @@ PV = "0.1+git"
>  SRC_URI = "git://github.com/openthread/openthread.git;protocol=https;branch=main \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> index 6a84897426..9c64872917 100644
> --- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> @@ -19,7 +19,6 @@ SRC_URI = "gitsm://github.com/openthread/wpantund.git;protocol=https;branch=mast
>             file://basename.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig perlnative autotools
>
> diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> index 871df69909..17745da806 100644
> --- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> +++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> @@ -12,7 +12,6 @@ PV = "0.0.1+git"
>
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
> index 9239bd81c2..841f7d5cf8 100644
> --- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
> +++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
> @@ -12,7 +12,7 @@ SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/${B
>  SRC_URI[md5sum] = "37a4310e98912030a74bdd4ed789f33c"
>  SRC_URI[sha256sum] = "b35d696e6fafd4563ca708fcecf9d0cf6705c846d417b5000f5252e0188848e7"
>
> -S = "${WORKDIR}/${BP}/dev"
> +S = "${UNPACKDIR}/${BP}/dev"
>
>  inherit cmake
>
> diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
> index 54eef87a41..e9169a050f 100644
> --- a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
>
>  SRCREV = "6a11279883a8584e06ad9ab2df162c639961cd61"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGES =+ "${PN}-scripts"
>
> diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> index b478692e39..845c3cf53c 100644
> --- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> +++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb486884
>  UPSTREAM_CHECK_URI = "http://vlan.sourcearchive.com/"
>  UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  inherit update-alternatives
>
> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> index 5876b58273..5d9d2634a0 100644
> --- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> +++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> @@ -29,7 +29,6 @@ PACKAGECONFIG[openssl] = ",,openssl"
>
>  PACKAGES =+ "${PN}-script"
>
> -S = "${WORKDIR}/git"
>
>  inherit perlnative pkgconfig
>
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> index b420795cee..af591cfd7a 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> @@ -20,7 +20,6 @@ SRC_URI = " \
>
>  SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools ptest
>
> diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
> index 41b7cf0878..eca004302b 100644
> --- a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
> +++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://git.code.sf.net/p/atftp/code;branch=master;protocol=https \
>             file://atftpd.service \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools update-rc.d systemd
>
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
> index 5f88aea5f2..db4a4313a4 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
> @@ -23,7 +23,6 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
>             file://iscsi-initiator-targets.service \
>             file://set_initiatorname \
>             "
> -S = "${WORKDIR}/git"
>
>  inherit update-rc.d systemd autotools pkgconfig
>
> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
> index 7f06e0ebf3..e7db8a948b 100644
> --- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
> @@ -14,7 +14,6 @@ REQUIRED_DISTRO_FEATURES = "systemd gobject-introspection-data"
>  SRCREV = "dfd26d72793914eb3da910ef8c71de6d7c8942a2"
>  SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=https;nobranch=1"
>
> -S = "${WORKDIR}/git"
>
>  SYSTEMD_PACKAGES = "${PN}"
>  SYSTEMD_SERVICE:${PN} = "networkd-dispatcher.service"
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
> index a9a2163a2f..a85176d871 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
> @@ -32,7 +32,7 @@ SRC_URI[sha256sum] = "75868db7a8ed252cd3a14c13a3ce383ddd42563160c02027d061202ee3
>
>  UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.10(\.\d+)+).tar.gz"
>
> -S = "${WORKDIR}/postfix-${PV}"
> +S = "${UNPACKDIR}/postfix-${PV}"
>
>  CLEANBROKEN = "1"
>
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
> index c6782fcdd3..65dd2f9561 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
> @@ -17,7 +17,6 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;
>             file://proftpd.service \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep useradd update-rc.d systemd multilib_script
>
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
> index f2c300855c..be0652dfbd 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
> @@ -34,7 +34,7 @@ SRC_URI[sha256sum] = "0dbf54dd2c178bd9fe62481d2c37513ee36636d8bf137cfdad96891490
>
>  UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ptpd/files/releases"
>
> -S = "${WORKDIR}/ptpd-${PV}"
> +S = "${UNPACKDIR}/ptpd-${PV}"
>
>  EXTRA_OEMAKE = ""
>
> diff --git a/meta-networking/recipes-daemons/vblade/vblade_25.bb b/meta-networking/recipes-daemons/vblade/vblade_25.bb
> index 54bb798344..f73e72442b 100644
> --- a/meta-networking/recipes-daemons/vblade/vblade_25.bb
> +++ b/meta-networking/recipes-daemons/vblade/vblade_25.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://github.com/OpenAoE/vblade;branch=master;protocol=https \
>             file://volatiles.99_vblade \
>            "
>
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_URI = "https://github.com/OpenAoE/vblade/archive/"
>
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> index 2793b900fe..a4e5f5ca46 100644
> --- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
>             "
>  SRCREV = "7cf7465b784baded4de183290c547d582becfd28"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools manpages pkgconfig ptest
>
> diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
> index ba21c46055..fdef5473ef 100644
> --- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
> +++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
> @@ -20,7 +20,6 @@ SRCREV = "f7a64114b35fd8ee63ce07290f8a2dffd52b215f"
>  SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https \
>             file://run-ptest"
>
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_COMMITS = "1"
>
> diff --git a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
> index 93d293493c..b7966d7f12 100644
> --- a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
> +++ b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
> @@ -21,7 +21,7 @@ UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
>  LICENSE = "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
>
> -S = "${WORKDIR}/dlm-dlm-${PV}"
> +S = "${UNPACKDIR}/dlm-dlm-${PV}"
>
>  DEPENDS += "corosync"
>
> diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
> index cbd5e7a0fd..06b2fa4d2d 100644
> --- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
> +++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
> @@ -20,7 +20,6 @@ UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
>
>  inherit autotools pkgconfig
>
> -S = "${WORKDIR}/git"
>
>  # libknet/transport_udp.c:326:48: error: comparison of integers of different signs: 'unsigned long' and 'int' [-Werror,-Wsign-compare]
>  # for (cmsg = CMSG_FIRSTHDR(&msg);cmsg; cmsg = CMSG_NXTHDR(&msg, cmsg)) {
> diff --git a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
> index e816b79e87..a110d556a3 100644
> --- a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
> +++ b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
> @@ -17,7 +17,6 @@ SRC_URI += "file://tgtd.init \
>              file://tgtd \
>  "
>
> -S = "${WORKDIR}/git"
>
>  CONFFILES:${PN} += "${sysconfdir}/tgt/targets.conf"
>
> diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
> index 940454c3ac..20ba132fd0 100644
> --- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
> +++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
>  SRCREV = "c8dfd85b9e8e453e279525f30c1e3184c092f036"
>  SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit systemd
>
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
> index d92c676fa9..880d962eb3 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
> @@ -12,6 +12,6 @@ SRC_URI = "http://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.
>  SRC_URI[md5sum] = "814b2972b2f5c740ff87510bc109168b"
>  SRC_URI[sha256sum] = "4250ceef3efe2034f4ac05906c3ee427db31b9b0a2df41b2744f4bf79a959a1a"
>
> -S = "${WORKDIR}/libnetfilter_acct-${PV}"
> +S = "${UNPACKDIR}/libnetfilter_acct-${PV}"
>
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb
> index 83533832d4..08d3ab691c 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb
> @@ -11,6 +11,6 @@ SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libne
>
>  SRC_URI[sha256sum] = "67edcb4eb826c2f8dc98af08dabff68f3b3d0fe6fb7d9d0ac1ee7ecce0fe694e"
>
> -S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
> +S = "${UNPACKDIR}/libnetfilter_conntrack-${PV}"
>
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb
> index ebb0eb2329..9a0d6cabbd 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb
> @@ -12,6 +12,6 @@ SRC_URI = "https://www.netfilter.org/projects/libnetfilter_cthelper/files/libnet
>  SRC_URI[md5sum] = "e59279645fe65d40dd7dfc82a797ca5b"
>  SRC_URI[sha256sum] = "14073d5487233897355d3ff04ddc1c8d03cc5ba8d2356236aa88161a9f2dc912"
>
> -S = "${WORKDIR}/libnetfilter_cthelper-${PV}"
> +S = "${UNPACKDIR}/libnetfilter_cthelper-${PV}"
>
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
> index 5349e6e4b8..46576f4d32 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
> @@ -11,6 +11,6 @@ SRC_URI = "https://www.netfilter.org/projects/libnetfilter_cttimeout/files/libne
>  SRC_URI[md5sum] = "ac64b55952b79cb9910db95ce8883940"
>  SRC_URI[sha256sum] = "0b59da2f3204e1c80cb85d1f6d72285fc07b01a2f5678abf5dccfbbefd650325"
>
> -S = "${WORKDIR}/libnetfilter_cttimeout-${PV}"
> +S = "${UNPACKDIR}/libnetfilter_cttimeout-${PV}"
>
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
> index 699b096ae8..a6e6b9b153 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
> @@ -9,6 +9,5 @@ SRCREV = "b0e4be94c0b8f68d4e912402b93a130063c34e17"
>
>  SRC_URI = "git://git.netfilter.org/libnetfilter_log;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
> index 301dd86cf3..ccaa80f5ff 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
> @@ -11,7 +11,6 @@ SRCREV = "2ff321690b8dafeca99ee8e9cafac71e36f292b9"
>  SRC_URI = "git://git.netfilter.org/libnetfilter_queue;branch=master \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
> index 4a5435a743..abcebceab8 100644
> --- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
> +++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${BP} \
>             "
>  SRCREV = "17190762f33f78090f5ff99a436c4cb866ac3ccd"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig ptest
>
> diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> index 635fa6a408..febcf5147c 100644
> --- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> +++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> @@ -17,7 +17,6 @@ SRC_URI = "git://git.netfilter.org/ulogd2;branch=master \
>  "
>  SRCREV = "79aa980f2df9dda0c097e8f883a62f414b9e5138"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools manpages pkgconfig systemd update-rc.d
>
> diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
> index 48a5426572..7356115d53 100644
> --- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
> +++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
> @@ -9,7 +9,6 @@ SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https"
>
>  SRCREV = "bf253640d33d03331310778e001fb6f5aba2989e"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> index 5659a20bd2..9afe009bea 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> @@ -10,4 +10,4 @@ LICENSE = "GPL-2.0-only"
>
>  LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -S = "${WORKDIR}/git/src"
> +S = "${UNPACKDIR}/${BP}/src"
> diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb b/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
> index a799ad197e..cc69f1448a 100644
> --- a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
> +++ b/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
> @@ -17,7 +17,6 @@ SRCREV = "3d61ea1e843e2c5f9706c74d1adad4e1d24d44b9"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
>
> diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
> index 15368a9a3d..89b2572c04 100644
> --- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
> +++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
> @@ -27,7 +27,6 @@ SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=mast
>      file://0001-fixes-for-gcc-15.patch \
>      "
>
> -S = "${WORKDIR}/git"
>
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=868c059b6147748b1d621e500feeac4f"
> diff --git a/meta-networking/recipes-protocols/frr/frr_10.3.bb b/meta-networking/recipes-protocols/frr/frr_10.3.bb
> index be2d986fc3..f0f3f34ab3 100644
> --- a/meta-networking/recipes-protocols/frr/frr_10.3.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_10.3.bb
> @@ -20,7 +20,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
>
>  CVE_PRODUCT = "frrouting"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep python3native pkgconfig useradd systemd
>
> diff --git a/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb b/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
> index b6efa528d4..f7c8f17800 100644
> --- a/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
> +++ b/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
> @@ -27,7 +27,6 @@ SRCREV = "3a0deda2995d98243dae379bcec10e57928c15e8"
>  #
>  # We can't use the approach of setting ${S} to mDNSPosix as we need
>  # DEBUG_PREFIX_MAP to cover files which come from the Clients directory too.
> -S = "${WORKDIR}/git"
>
>  inherit github-releases manpages systemd update-rc.d
>
> diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb b/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
> index 1fde165c4f..0bb838a6b7 100644
> --- a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
> +++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
> @@ -21,7 +21,6 @@ SRC_URI = " \
>      file://0001-fix-build-do-not-install-git-files.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake python3native
>
> diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
> index 0061565f90..1588245f8a 100644
> --- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
> +++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
> @@ -37,7 +37,6 @@ EXTRA_OECONF += " \
>                  "
>  DEPENDS:append:libc-musl = " libexecinfo"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig
>
> diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
> index 010cd5af84..ad72b5cdde 100644
> --- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
> +++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
> @@ -5,7 +5,6 @@ HOMEPAGE = "http://open-lldp.org/start"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig autotools
>  inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
> diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
> index cabe18ef8a..a19b313cc3 100644
> --- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
> +++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
> @@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
>  SRC_URI[md5sum] = "8d25341352fdae5ad5b36b9f18254908"
>  SRC_URI[sha256sum] = "82492db8e487ce73b182ee7f444251d20c44f5c26d6e96c553ec7093aefb5af4"
>
> -S = "${WORKDIR}/pptp-${PV}"
> +S = "${UNPACKDIR}/pptp-${PV}"
>
>  EXTRA_OEMAKE = "-e MAKEFLAGS="
>
> diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> index 8099fa5c6e..2cbb025049 100644
> --- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> +++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
> @@ -21,7 +21,7 @@ inherit autotools-brokensep
>  LIBS:append:libc-musl = " -lssp_nonshared"
>  LIBS:append:libc-glibc = " -lc_nonshared"
>
> -S = "${WORKDIR}/tsocks-1.8"
> +S = "${UNPACKDIR}/tsocks-1.8"
>
>  FILES:${PN} = "${libdir}/* ${bindir}/tsocks"
>  FILES:${PN}-dev = ""
> diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> index 3769d5cab0..8f21620584 100644
> --- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> +++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> @@ -6,7 +6,6 @@ SRCREV = "848eca82f92273af9a79687a90343a2ebcf3481d"
>  SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
>            "
>
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_COMMITS = "1"
>
> diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
> index f227ab749b..6b61349a66 100644
> --- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
> +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
> @@ -26,7 +26,6 @@ COMPATIBLE_HOST:libc-musl = 'null'
>
>  DEPENDS = "boost dlt-daemon googletest"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> index 0b7887dacb..e1638bfa19 100644
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> @@ -15,7 +15,6 @@ SRCREV = "1ef2a025981223c1e16fc833bef226c86ff8c295"
>
>  UPSTREAM_CHECK_URI = "https://github.com/xelerance/xl2tpd/releases"
>
> -S = "${WORKDIR}/git"
>
>  inherit update-rc.d
>
> diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
> index f9dd66f605..be2cfb0816 100644
> --- a/meta-networking/recipes-support/arptables/arptables_git.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
> @@ -14,7 +14,6 @@ SRC_URI = " \
>  SRC_URI[arptables.md5sum] = "1d4ab05761f063b0751645d8f2b8f8e5"
>  SRC_URI[arptables.sha256sum] = "e529fd465c67d69ad335299a043516e6b38cdcd337a5ed21718413e96073f928"
>
> -S = "${WORKDIR}/git"
>  SYSTEMD_SERVICE:${PN} = "arptables.service"
>
>  inherit systemd
> diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb b/meta-networking/recipes-support/bmon/bmon_4.0.bb
> index c974d54fe8..f47069471a 100644
> --- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
> +++ b/meta-networking/recipes-support/bmon/bmon_4.0.bb
> @@ -9,4 +9,3 @@ SRC_URI = "git://github.com/tgraf/bmon.git;branch=master;protocol=https"
>
>  inherit autotools pkgconfig
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
> index e213cd2c60..59e3dbae5f 100644
> --- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
> @@ -15,7 +15,6 @@ SRC_URI = "\
>      file://0004-cleanup-includes.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "kernel:bridge-utils"
>
> diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
> index 4842a0fbdf..a9a664c196 100644
> --- a/meta-networking/recipes-support/celt051/celt051_git.bb
> +++ b/meta-networking/recipes-support/celt051/celt051_git.bb
> @@ -21,7 +21,6 @@ SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=htt
>             file://0001-tests-Include-entcode.c-into-test-sources-to-provide.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig autotools-brokensep
>
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> index c78bbae7b8..e2918503be 100644
> --- a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> +++ b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  SRCREV = "316522036133d44ed02cd39ed2748e2b59c85b30"
>  SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
>
> -S = "${WORKDIR}/git"
>  DEPENDS += "libtalloc"
>
>  PACKAGECONFIG ??= ""
> diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> index cacdc9773b..25ea1fdefb 100644
> --- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> +++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https \
>
>  SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig binconfig
>
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
> index ab515603f5..09dc517c85 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
> +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
> @@ -18,7 +18,6 @@ SRCREV_drbd-headers = "94f4472513f351efba5788f783feba6ac6efe9fc"
>
>  SRCREV_FORMAT = "drbd-utils_drbd-headers"
>
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
>
> diff --git a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> index baa9398a18..badeed8e82 100644
> --- a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> +++ b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/nhorman/dropwatch.git;protocol=https;nobranch=1 \
>  "
>  SRCREV = "1e7e487a019a7c02f1f429c4d3a4647fa3787a13"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "binutils libnl libpcap readline"
>
> diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
> index 723d7c8f78..d5dc10a889 100644
> --- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
> +++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
> @@ -25,7 +25,6 @@ SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https \
>
>  SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = " \
>      -DCMAKE_SKIP_RPATH=TRUE \
> diff --git a/meta-networking/recipes-support/fping/fping_5.3.bb b/meta-networking/recipes-support/fping/fping_5.3.bb
> index d5f77d7c5a..5f3ec67cfc 100644
> --- a/meta-networking/recipes-support/fping/fping_5.3.bb
> +++ b/meta-networking/recipes-support/fping/fping_5.3.bb
> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
>  SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "d57bd0141aea082e3adfc198bfc3db5dfd12a7014c7c2655e97f61cd54901d0e"
>
> -S = "${WORKDIR}/fping-${PV}"
> +S = "${UNPACKDIR}/fping-${PV}"
>
>  inherit autotools
>
> diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> index 8e23b66c48..9c2535b95b 100644
> --- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> +++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> @@ -9,7 +9,6 @@ SECTION = "libdevel"
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e4f3ea6e9b28af88dc0321190a1f8250"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "4cdfdc38eca237c19c22a8b90490446ce6d970fa"
>  SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;branch=main;protocol=https \
>      file://run-ptest \
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> index a054ef0147..7482dba64a 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> @@ -36,7 +36,6 @@ LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad \
>                      file://LICENSE;md5=0388276749a542b0d611601fa7c1dcc8 "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> index 528289b7fd..7def915db5 100644
> --- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> +++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778"
>  SRC_URI = "git://github.com/nodejs/http-parser.git;branch=master;protocol=https"
>  SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "PLATFORM=linux"
>
> diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
> index b41eb78374..bc0975ecc1 100644
> --- a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253
>  SRCREV = "62e60904afbe58fda0c7104fdad1c4f618266ba6"
>  SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      install -m 0755 -D ${S}/debian/ifenslave.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/ifenslave
> diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
> index 055c6e1432..18970751c3 100644
> --- a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
> +++ b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
> @@ -9,6 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  SRC_URI = "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
>  SRCREV = "c341e55be386649c0a5347eefeae410753c4e753"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson
> diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb b/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
> index 93fdb78eba..8af763fee9 100644
> --- a/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
> +++ b/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
> @@ -11,7 +11,6 @@ DEPENDS = "curl openssl"
>  SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=1.10.x"
>  SRCREV = "3b15fa82ea74739b574d705fea44959b58142eb8"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
> index 3d0764a3b9..50f83221c0 100644
> --- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
> +++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/libesmtp/libESMTP.git;branch=master;protocol=https \
>             file://0001-Add-build-option-for-NTLM-support.patch"
>  SRCREV = "1d0af244310a66943ab400be56b15a9087f181eb"
>
> -S = "${WORKDIR}/git"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742 \
>                      file://COPYING.GPL;md5=393a5ca445f6965873eca0259a17f833"
> diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
> index 2040d016e5..dbb27e6ba6 100644
> --- a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
> @@ -38,7 +38,7 @@ SRC_URI[sha256sum] = "b68ce6eb0ccd2870fa3c8c334f2028b5d16606fd41308696c17b71959f
>
>  inherit pkgconfig waf-samba ptest
>
> -S = "${WORKDIR}/ldb-${PV}"
> +S = "${UNPACKDIR}/ldb-${PV}"
>
>  # Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
>  # to cross Popen
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
> index c7f6f1fb31..ff36a61d15 100644
> --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
> @@ -30,7 +30,7 @@ PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
>
>  SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://avoid-attr-unless-wanted.patch', d)}"
>
> -S = "${WORKDIR}/talloc-${PV}"
> +S = "${UNPACKDIR}/talloc-${PV}"
>
>  # Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
>  # to cross Popen
> diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
> index 2f8be7fe61..7221130fe6 100644
> --- a/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
> +++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
> @@ -28,7 +28,7 @@ PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
>  PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
>  PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
>
> -S = "${WORKDIR}/tdb-${PV}"
> +S = "${UNPACKDIR}/tdb-${PV}"
>
>  inherit waf-samba pkgconfig ptest
>
> diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb b/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
> index f38ca3a836..36364b8874 100644
> --- a/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
> +++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
> @@ -33,7 +33,7 @@ PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
>
>  SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://avoid-attr-unless-wanted.patch', d)}"
>
> -S = "${WORKDIR}/tevent-${PV}"
> +S = "${UNPACKDIR}/tevent-${PV}"
>
>  # Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
>  # to cross Popen
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
> index 1300fc658d..407194792f 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
> @@ -17,7 +17,6 @@ SRC_URI = " \
>      file://v6test.sh \
>  "
>
> -S = "${WORKDIR}/git"
>
>  BBCLASSEXTEND = "native"
>
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> index f0b7e9184e..b442fb9f56 100644
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -19,7 +19,6 @@ SRC_URI = "git://github.com/linux-wpan/lowpan-tools;branch=master;protocol=https
>             "
>  SRCREV = "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools python3-dir pkgconfig
>
> diff --git a/meta-networking/recipes-support/mctp/mctp_2.1.bb b/meta-networking/recipes-support/mctp/mctp_2.1.bb
> index c76fc09af3..04fecf7aca 100644
> --- a/meta-networking/recipes-support/mctp/mctp_2.1.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_2.1.bb
> @@ -10,7 +10,6 @@ SRCREV = "dd944cf5b5a8b834f3685bcb2017190258dbcd0b"
>  SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https \
>             file://0001-mctp-bench-Adjust-headers.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig systemd
>
> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
> index 9a00d66a52..52e7e53c32 100644
> --- a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
> +++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
> @@ -3,7 +3,6 @@ require mdio-tools.inc
>  DEPENDS += "virtual/kernel libmnl"
>  # This module requires Linux 5.6 higher
>
> -S = "${WORKDIR}/git"
>
>  inherit module
>
> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
> index 457064c019..2c8f9b8c37 100644
> --- a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
> @@ -2,7 +2,6 @@ require mdio-tools.inc
>
>  DEPENDS += "virtual/kernel libmnl"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig autotools
>
> diff --git a/meta-networking/recipes-support/mtr/mtr_0.95.bb b/meta-networking/recipes-support/mtr/mtr_0.95.bb
> index 92f9c4bfc0..ac8b48e4e5 100644
> --- a/meta-networking/recipes-support/mtr/mtr_0.95.bb
> +++ b/meta-networking/recipes-support/mtr/mtr_0.95.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  SRCREV = "852e5617fbf331cf292723702161f0ac9afe257c"
>  SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
> index cdf2677f13..1c9db1e956 100644
> --- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
> +++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
>             file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch"
>  SRCREV = "6c02c6a469d62a047f230b0ccf03f72328312d2b"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "curl xz e2fsprogs zlib"
>
> diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
> index 2a122ec282..9e7bdc9966 100644
> --- a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
> +++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v
>             "
>  SRCREV = "2d0f232b590f4001881dd0819f55af72b88c4b2f"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "curl xz e2fsprogs zlib"
>
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
> index 21579d64c1..6931c64d4a 100644
> --- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
>             file://0001-Remove-use-of-variables-indicating-buildtime-informa.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "coreutils-native"
>
> diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> index c68974f9f0..cddb0ead2f 100644
> --- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> @@ -18,7 +18,6 @@ DEPENDS += "augeas libnl libxslt libxml2"
>
>  do_configure[depends] += "${MLPREFIX}gnulib:do_populate_sysroot"
>
> -S = "${WORKDIR}/git"
>
>  inherit gettext autotools perlnative pkgconfig systemd
>
> diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
> index 151f243c27..4043da5621 100644
> --- a/meta-networking/recipes-support/netperf/netperf_git.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_git.bb
> @@ -21,7 +21,6 @@ SRC_URI = "git://github.com/HewlettPackard/netperf.git;branch=master;protocol=ht
>
>  SRCREV = "3bc455b23f901dae377ca0a558e1e32aa56b31c4"
>
> -S = "${WORKDIR}/git"
>
>  inherit update-rc.d autotools texinfo systemd
>
> diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
> index 341eab015c..58ace6263d 100644
> --- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
> +++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
> @@ -10,7 +10,6 @@ SRC_URI = " \
>         file://0001-Cmds-automatically-create-folder.patch \
>         "
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
> index 9b2c186873..54fd68ed43 100644
> --- a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
> +++ b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
> @@ -18,7 +18,6 @@ SRC_URI = "git://github.com/thkukuk/yp-tools;branch=master;protocol=https \
>             file://domainname.service \
>             "
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "libtirpc libnsl2 virtual/crypt"
>
> diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-networking/recipes-support/ntimed/ntimed_git.bb
> index 955c03f42d..36fba5f57b 100644
> --- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
> +++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/bsdphk/Ntimed;branch=master;protocol=https \
>  PV = "0.0+git"
>  SRCREV = "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
>
> -S = "${WORKDIR}/git"
>
>  # use adjtimex on musl
>  CFLAGS:append:libc-musl = " -Dntp_adjtime=adjtimex"
> diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
> index ae5139c948..f0175167a4 100644
> --- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
> +++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.2-stable;protocol=https \
>             file://0001-autogen.sh-not-generate-configure.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig
>
> diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
> index 9bb93910f8..014706893a 100644
> --- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
> +++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
> @@ -23,7 +23,6 @@ SRC_URI = "git://github.com/ntop/ntopng.git;protocol=https;branch=5.2-stable \
>             file://ntopng.service \
>             "
>
> -S = "${WORKDIR}/git"
>
>  # don't use the lua under thirdparty as it supports cross compiling badly
>  export LUA_LIB = "${STAGING_LIBDIR}/liblua.a"
> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> index b02f775a55..5d346a4c67 100644
> --- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> +++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> @@ -18,8 +18,7 @@ SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c \
>  SRC_URI[md5sum] = "d3c92c4d2f261221193c3726c1b9a42f"
>  SRC_URI[sha256sum] = "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f2511ac2586d236c8a1"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_compile () {
>      ${CC} ${CFLAGS} ${LDFLAGS} -o nuttcp nuttcp-${PV}.c
> diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
> index 24c520901d..5c38f6b5dc 100644
> --- a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
> +++ b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
> @@ -19,7 +19,6 @@ SRC_URI = "git://github.com/open-iscsi/open-isns;branch=master;protocol=https \
>
>  SRCREV = "c0e6d9fedc5a7041260de477fe1a8455fa074113"
>
> -S = "${WORKDIR}/git"
>
>  inherit systemd autotools-brokensep update-rc.d
>
> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
> index 0288a59458..fa26a759dc 100644
> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
> @@ -53,7 +53,7 @@ SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.pat
>
>  SRCREV = "f2ca37ef3510543172657b82493d1eceefa9a134"
>
> -S = "${WORKDIR}/git/open-vm-tools"
> +S = "${UNPACKDIR}/${BP}/open-vm-tools"
>
>  DEPENDS = "glib-2.0 glib-2.0-native util-linux libdnet procps libtirpc"
>
> diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
> index 74c5ef220d..86b24c1795 100644
> --- a/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
> +++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
> @@ -32,7 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
>             file://ipmi.service \
>             "
>
> -S = "${WORKDIR}/OpenIPMI-${PV}"
> +S = "${UNPACKDIR}/OpenIPMI-${PV}"
>
>  SRC_URI[sha256sum] = "a0403148fa5f7bed930c958a4d1c558047e273763a408b3a0368edc137cc55d9"
>
> diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
> index 7b51fc558e..bdd715aacf 100644
> --- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
> +++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
> @@ -18,7 +18,7 @@ SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
>             "
>  SRC_URI[sha256sum] = "25ed340d7b7dc00c20e4ba763d3f9c07ba891b150d9d48af313a1351cafdd778"
>
> -S = "${WORKDIR}/pgpool-II-${PV}"
> +S = "${UNPACKDIR}/pgpool-II-${PV}"
>
>  inherit autotools-brokensep systemd
>
> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
> index b918e50c68..6471f46c28 100644
> --- a/meta-networking/recipes-support/phytool/phytool.bb
> +++ b/meta-networking/recipes-support/phytool/phytool.bb
> @@ -6,7 +6,6 @@ PV = "2+git"
>  SRCREV = "8882328c08ba2efb13c049812098f1d0cb8adf0c"
>  SRC_URI = "git://github.com/wkz/phytool.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  # The Makefile has "$PREFIX/bin" hardcoded into it, hence not using $bindir here
>  do_install() {
> diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
> index 0c204c109f..2555c43a85 100644
> --- a/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
> +++ b/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=http
>             file://0001-librdmacm-Use-overloadable-function-attribute-with-c.patch \
>  "
>  SRCREV = "6cd09097ad2eebde9a7fa3d3bb09a2cea6e3c2d6"
> -S = "${WORKDIR}/git"
>
>  #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
>  LICENSE = "BSD-2-Clause | GPL-2.0-only"
> diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
> index 950f6a2e21..bb12d7a907 100644
> --- a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
> +++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
> @@ -8,6 +8,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  SRCREV = "b315d06ddb0dad16a52fe91e5831b4030ce37010"
>  SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
> index 518ca9e277..12fe3ececa 100644
> --- a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
> +++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
> @@ -18,7 +18,6 @@ DEPENDS = "\
>  SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master"
>  SRCREV = "dad1033640f249fa4994f976cf6ee96826c15702"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
> index 65f2f80ace..1a2d9dc9c4 100644
> --- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
> +++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
> @@ -8,7 +8,6 @@ SRCREV = "7b07684ea6698d4885ff2062350ad8798a04de42"
>
>  SRC_URI = "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
> index 4ef39f0904..3588d674f7 100644
> --- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
> +++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
> @@ -14,7 +14,6 @@ SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=https;bra
>
>  CVE_STATUS[CVE-2012-4425] = "fixed-version: fixed since 0.15.3"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = " \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
> diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> index 3af973eed1..b13dd5d148 100644
> --- a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> +++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> @@ -7,7 +7,6 @@ SRCREV = "aa08162f036840d3e33502dc0a836b03b9cec97c"
>
>  SRC_URI = "git://gitlab.freedesktop.org/spice/linux/vd_agent.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES = "opengl x11"
> diff --git a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> index 3c8458baac..7f08eebee7 100644
> --- a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> +++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> @@ -12,7 +12,6 @@ SRCREV = "6f453a775d87087c6ba59fc180c1a1e466631a47"
>
>  SRC_URI = "git://gitlab.freedesktop.org/spice/spice-protocol.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
> index fc83be415e..c9418a1765 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -19,7 +19,6 @@ SRCREV = "0c2c1413a8b387ea597a95b6c867470a7c56c8ab"
>
>  SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  CVE_STATUS[CVE-2016-0749] = "fixed-version: patched since 0.13.2"
>  CVE_STATUS[CVE-2016-2150] = "fixed-version: patched since 0.13.2"
> diff --git a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
> index 82f48ccdb8..81c7fdf0c8 100644
> --- a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
> +++ b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
> @@ -11,7 +11,6 @@ SRCREV = "2d373432e604960c1dcc14fb97098febe4d64025"
>
>  SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
> index c434ca181f..c35148b77e 100644
> --- a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
> +++ b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
> @@ -26,7 +26,6 @@ inherit autotools pkgconfig systemd update-rc.d ptest
>  DEPENDS = "openssl libtool-native bison-native expat"
>  RDEPENDS:${PN} = "bash openssl-bin daemonize"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
>                  --disable-rpath --with-ssl=${STAGING_EXECPREFIXDIR} \
> diff --git a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb b/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
> index c3de38a6f8..4857c0af4f 100644
> --- a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
> +++ b/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
> @@ -22,7 +22,6 @@ EXTRA_OEMAKE = "\
>      CC='${CC}' CFLAGS='${CFLAGS} -pthread -I${STAGING_INCDIR}/libnl3' \
>  "
>
> -S = "${WORKDIR}/git"
>
>  # wavemon does not support using out-of-tree builds
>  inherit autotools-brokensep pkgconfig
> diff --git a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
> index a0f9fb8b50..2f5ebe53ae 100644
> --- a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
> +++ b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
> @@ -11,6 +11,5 @@ DEPENDS = "libnl"
>  SRC_URI = "git://github.com/linux-wpan/wpan-tools;branch=master;protocol=https"
>  SRCREV = "91b0f038aef2f62cb6a222d190b887fdfd6bc164"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bbclass
> index 76e7241820..63bc24f689 100644
> --- a/meta-oe/classes/fitimage.bbclass
> +++ b/meta-oe/classes/fitimage.bbclass
> @@ -127,8 +127,7 @@ python __anonymous() {
>              d.setVar('EXTERNAL_KERNEL_DEVICETREE', '${RECIPE_SYSROOT}/boot/devicetree')
>  }
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>  B = "${WORKDIR}/build"
>
>  #
> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb b/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
> index 64cd1d928a..ba6ad09098 100644
> --- a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
> @@ -16,7 +16,6 @@ SRC_URI += "git://github.com/westerndigitalcorporation/spdm-utils.git;protocol=h
>  include spdm-utils-crates.inc
>
>  SRCREV = "f67ac9e00b79f603ecbbd29928a4ecc3dec5abd5"
> -S = "${WORKDIR}/git"
>
>  # bindgen-cli comes from meta-clang and depends on libclang
>  DEPENDS += "libspdm udev bindgen-cli-native pciutils"
> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
> index a60ca11244..3ec7d486fa 100644
> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
> @@ -5,7 +5,6 @@ LICENSE = "GPL-3.0-only"
>  SECTION = "devel"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
> -S = "${WORKDIR}/git"
>
>  SRC_URI = " \
>      git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> index 90c9a7147c..a32c9403c8 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> @@ -20,7 +20,6 @@ SRCREV = "8416326777b2aada0706539b8f9f6acefa476b16"
>  SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master \
>             file://0001-include-missing-cstdint.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig python3native
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
> index 69c2165ab1..ef1945b4fe 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
> @@ -22,7 +22,6 @@ SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined
>
>  SRCREV = "01045f683b9419beb90119497cd1b2be44e83b8e"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "glib-2.0 libyaml util-linux-libuuid \
>             systemd python3-cffi-native \
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
> index cacf211034..23515d9fa8 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
> @@ -48,7 +48,6 @@ SRC_URI:append:toolchain-clang = "\
>             file://0001-asio-Dont-use-experimental-with-clang.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  CVE_STATUS[CVE-2014-8180] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
>  CVE_STATUS[CVE-2017-2665] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
> index 371d66bdfe..4fe3995cd5 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
>  SRC_URI = "git://github.com/nanopb/nanopb.git;branch=maintenance_0.4;protocol=https"
>  SRCREV = "cad3c18ef15a663e30e3e43e3a752b66378adec1"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
> index c29c51a2ae..d4987acede 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
> @@ -13,7 +13,6 @@ PV = "0.5.9+git"
>  SRCREV = "0e2ce9b9c46c47363436f9ee730f7c71bf455f0f"
>  SRC_URI = "git://github.com/lcdproc/lcdproc;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig update-rc.d
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
> index f37c63d316..5d204d7d94 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
> @@ -20,7 +20,6 @@ PACKAGECONFIG[utils] += "-Dutils=true, -Dutils=false"
>
>  DEPENDS += "libdrm libevdev fmt"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
> index ad9873563f..cf2d54c07d 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
> @@ -22,7 +22,6 @@ RDEPENDS:${PN} += "python3 python3-six python3-pyparsing python3-configshell-fb"
>  SRCREV = "d323d5a3091af490502c5d025ec7361a3a2cfbd9"
>  SRC_URI = "git://git.infradead.org/users/hch/nvmetcli.git;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  do_install:append() {
>      # Install example configuration scripts.
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
> index 4e0afefde7..79a7f4095e 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
> @@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "161131c686a6d9962a0e96912526dd46308e022d62e3f8acaed5a56fda
>  UPSTREAM_CHECK_URI = "https://selenic.com/repo/smem/tags"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/${BPN}-${HG_CHANGESET}"
> +S = "${UNPACKDIR}/${BPN}-${HG_CHANGESET}"
>
>  do_compile() {
>          ${CC} ${CFLAGS} ${LDFLAGS} smemcap.c -o smemcap
> diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
> index 7c90db9314..ee65f89ab7 100644
> --- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
> +++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
> @@ -38,7 +38,6 @@ SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=h
>
>  SRCREV = "c098579d4fa0f004ccc204c5bc46eac3717cba28"
>
> -S = "${WORKDIR}/git"
>
>  inherit features_check meson mime mime-xdg pkgconfig python3native
>
> diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
> index f21a3216af..301861de38 100644
> --- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
> +++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
>
>  SRCREV = "db0870edd2919f4f4d0101843136bcae92ab0743"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "libtraceevent"
>  RDEPENDS:${BPN} = "perl perl-module-file-basename perl-module-file-find perl-module-file-spec perl-module-getopt-long \
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
> index 86b0ce0778..78e84f4d71 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
> @@ -3,8 +3,7 @@ SECTION = "console/utils"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  SRC_URI = " \
>      file://android-gadget-setup \
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
> index b98c70db77..de85d51df2 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>
>  SRC_URI = "file://android-gadget-setup"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      install -d ${D}${bindir}
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> index cd3c54e32e..cfcfa1d007 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> @@ -55,7 +55,6 @@ SRC_URI += " \
>      file://0001-liblp-fix-building-with-GCC-14.patch \
>  "
>
> -S = "${WORKDIR}/git"
>  B = "${WORKDIR}/${BPN}"
>
>  # http://errors.yoctoproject.org/Errors/Details/1debian881/
> diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> index c58524aa64..feda6599a8 100644
> --- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> +++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/ssvb/cpuburn-arm.git;branch=master;protocol=https \
>             file://0003-burn.S-Remove-.func-.endfunc.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  do_compile() {
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
> index 91bd23e50e..345c7f08e7 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
> @@ -27,7 +27,6 @@ SRCREV = "a6e474c9e896e4ba1eb40066a03402afb040710a"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "fio-(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  # avoids build breaks when using no-static-libs.inc
>  DISABLE_STATIC = ""
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> index 0b61d6ed62..8bcb763f06 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -21,7 +21,6 @@ SRC_URI = " \
>  "
>  SRCREV = "42e3d8fe3aa88743ef90348138f643f7b04a9237"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig features_check
>
> diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
> index 8e229499b1..725b0af209 100644
> --- a/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
> +++ b/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "1e8087ada056f5d8018ee0bc76686d416fc2251ed03038055dbd0af78d
>
>  UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
>
> -S = "${WORKDIR}/${BPN}_${PV}/src/current"
> +S = "${UNPACKDIR}/${BPN}_${PV}/src/current"
>
>  #
>  # All other arches can use the default OEMAKE except those
> diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
> index c353ce02e1..3d965dac00 100644
> --- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
> +++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
> @@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
>
>  SRC_URI[sha256sum] = "754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb"
>
> -S = "${WORKDIR}/iperf-${PV}"
> +S = "${UNPACKDIR}/iperf-${PV}"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> index 4a71e83b73..08f29937c0 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> @@ -20,7 +20,6 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
>
>  SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> index df76067a44..ae87262870 100644
> --- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> +++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://git.musl-libc.org/libc-bench;branch=master \
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  do_install () {
>      install -d ${D}${bindir}
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> index 6d96a13cd4..e688d6ede2 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> @@ -28,7 +28,6 @@ SRC_URI = " \
>
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
>
> diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> index 735b5560e0..ac0787abc2 100644
> --- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> +++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> @@ -10,8 +10,7 @@ SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpack
>            "
>  SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_compile () {
>         ${CC} ${CFLAGS} ${LDFLAGS} -DDP -o linpack_dp linpacknew.c -lm
> diff --git a/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb b/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
> index bb8c4625d5..1fd95de038 100644
> --- a/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
> +++ b/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/raas/${BPN}.git;branch=master;protocol=https"
>
>  SRCREV = "c3155b544a5065e8235508059c6512af6c46bd4d"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      install -d ${D}${bindir}
> diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
> index 7ca80c02af..5f105c9f8e 100644
> --- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
> +++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
> @@ -11,7 +11,7 @@ SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz \
>
>  SRC_URI[sha256sum] = "1f2092d536c0a3193efc53e4a50f3cee65c0ef1a78d31e5404f1c663fff7b7f4"
>
> -S = "${WORKDIR}/phoronix-test-suite"
> +S = "${UNPACKDIR}/phoronix-test-suite"
>
>  inherit systemd allarch mime mime-xdg
>
> diff --git a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
> index b32f37153e..e034371604 100644
> --- a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
> +++ b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
> @@ -9,7 +9,6 @@ inherit autotools-brokensep
>  SRCREV = "c706363815a38ff2c5cbc07b73e2cfaaa59bae0f"
>  SRC_URI = "git://github.com/linux-rdma/qperf.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  do_configure() {
>    ./cleanup
> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> index 2cfeb72416..caefdb7b6b 100644
> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
>  # upstream updates
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  # installing in /opt/S-suite since the package has
>  # dependencies to the directory structure.
> diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
> index ba61ff971e..2d450094b7 100644
> --- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
> +++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
> @@ -18,6 +18,5 @@ GI_DATA_ENABLED:libc-musl:armv7a = "False"
>  GI_DATA_ENABLED:libc-musl:armv7ve = "False"
>  SRC_URI = "git://github.com/stressapptest/stressapptest;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> index 11e33fec55..198552e5c6 100644
> --- a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> +++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> @@ -13,7 +13,6 @@ inherit autotools-brokensep pkgconfig
>  SRC_URI = "git://github.com/akopytov/sysbench.git;protocol=https;branch=master"
>  SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"
>
> -S = "${WORKDIR}/git"
>
>  COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64).*-linux*"
>
> diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> index 200a0de849..8f65a6135c 100644
> --- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> +++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/ssvb/tinymembench.git;branch=master;protocol=https \
>             file://0001-asm-Delete-.func-.endfunc-directives.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
>
> diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> index fa80236022..0fbb3ecd1e 100644
> --- a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> +++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> @@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/whetstone.c;beginline=1;endline=52;md5=c
>  SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
>  SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_compile () {
>         ${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm
> diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
> index c278a0982a..ec3cdcaa75 100644
> --- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
> +++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
> @@ -10,7 +10,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
>  SRC_URI = "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=https;branch=master"
>  SRCREV = "f03c50b22ae3fda26711ddabd91e2c5dd8103478"
>
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "freedesktop:bolt"
>
> diff --git a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
> index b623d0525a..515c009ead 100644
> --- a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
> +++ b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://gitlab.com/pibox/con2fbmap.git;protocol=https;branch=master \
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
> index fbe9483740..9e23a4b67d 100644
> --- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
> +++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
> @@ -20,7 +20,6 @@ UPSTREAM_CHECK_COMMITS = "1"
>  EXTRA_OEMAKE:append = " ${@['', 'NLS=false']['${USE_NLS}' == 'no']} "
>
>
> -S = "${WORKDIR}/git"
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
>
> diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> index 42256a7afd..e0041b58e6 100644
> --- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> @@ -16,7 +16,6 @@ EXTRA_OEMAKE = "NOSTRIP=1 DESTDIR=${D} PREFIX=${prefix}"
>
>  PV = "1.0+${SRCPV}"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      oe_runmake install
> diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> index 6c80f4c81d..0d8f3c8a6b 100644
> --- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> +++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> @@ -13,7 +13,6 @@ DEPENDS = " sysfsutils"
>  SRCREV = "1c57818ecee186aa47af0342149577df5302c022"
>  PV = "0.18+git"
>
> -S = "${WORKDIR}/git"
>
>  SRC_URI = "git://github.com/grondo/edac-utils;branch=master;protocol=https \
>      file://make-init-script-be-able-to-automatically-load-EDAC-.patch \
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> index 2b7ed256eb..1542ee73d1 100644
> --- a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> @@ -16,7 +16,6 @@ SRCREV = "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "glib-2.0 systemd"
>
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
> index 9a8e81bae3..f7121e2503 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
> @@ -9,7 +9,7 @@ SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
>
>  SRC_URI[sha256sum] = "1f934b076ed49eace203655ec249fc7861a6b8e87fe4aef732e47b6e485b6293"
>
> -S = "${WORKDIR}/flashrom-v${PV}"
> +S = "${UNPACKDIR}/flashrom-v${PV}"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
> index d72f2d9c53..bbf2b1fdac 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
> @@ -6,7 +6,6 @@ SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main \
>             file://0001-efi-generate_binary.py-Use-env-to-detect-python3.patch"
>
>  SRCREV = "58a2928f778278ab1f7f8fcddbab81ba587a8962"
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "gnu-efi python3-pefile-native"
>
> diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
> index 87a71efbe8..d3d08720a6 100644
> --- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
> +++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
> @@ -21,6 +21,5 @@ SRC_URI = "\
>  "
>  SRCREV = "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> index 88a6e5bb30..ff3b29406b 100644
> --- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> @@ -23,7 +23,6 @@ SRCREV = "b0edae14e8660b80ffe0384354038a9f62e2978d"
>  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>  COMPATIBLE_HOST:libc-musl = "null"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd', '', d)}"
>
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
> index 6fad255c89..38ba1c776f 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
> @@ -12,8 +12,7 @@ SRC_URI = "file://fancontrol \
>             file://sensors.conf \
>             file://sensord \
>  "
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  PACKAGECONFIG ??= "sensord"
>  PACKAGECONFIG[sensord] = ",,"
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> index 74a9b839c9..af0f5a7999 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> @@ -44,7 +44,6 @@ SYSTEMD_SERVICE:${PN}-fancontrol = "fancontrol.service"
>  SYSTEMD_SERVICE:${PN}-sensord = "sensord.service"
>  SYSTEMD_AUTO_ENABLE = "disable"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = 'EXLDFLAGS="${LDFLAGS}" \
>          MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
> diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
> index 127be8fbfa..9df6ee9efc 100644
> --- a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
> +++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
> @@ -10,6 +10,6 @@ SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e
>
>  inherit autotools
>
> -S = "${WORKDIR}/lsscsi-${PV}"
> +S = "${UNPACKDIR}/lsscsi-${PV}"
>
>  UPSTREAM_CHECK_REGEX = "lsscsi-(?P<pver>\d+(\.\d+)+)\.tgz"
> diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
> index 7ab244f3cc..eae49b04ea 100644
> --- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
> +++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
> @@ -9,7 +9,6 @@ DEPENDS = "json-c libnvme"
>  SRCREV = "71fa5d9310d6b41a69e844593423ac91b1453472"
>
>  SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
> -S = "${WORKDIR}/git"
>
>  inherit bash-completion meson pkgconfig systemd
>
> diff --git a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
> index 20e870ccb2..581632c1ef 100644
> --- a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
> +++ b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b5fcfc87fb615860d398b5e38685edf"
>  SRC_URI = "file://pointercal \
>             file://COPYING"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      # Only install file if it has a contents
> diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> index 05f4973aed..0fe41a7b92 100644
> --- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> +++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
> @@ -20,7 +20,7 @@ CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: this CVE is for vmware ace"
>
>  COMPATIBLE_HOST:libc-musl = "null"
>
> -S = "${WORKDIR}/ACE_wrappers"
> +S = "${UNPACKDIR}/ACE_wrappers"
>  B = "${WORKDIR}/ACE_wrappers/ace"
>  export ACE_ROOT = "${WORKDIR}/ACE_wrappers"
>
> diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
> index 3a02c714c1..fc020695e3 100644
> --- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
> +++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
> @@ -9,6 +9,5 @@ SRCREV = "21046ebc4a5475c14cea446715734c88fe33d276"
>
>  DEPENDS = "openssl boost"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
> index 979199a1fa..52a0af810f 100644
> --- a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
> +++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
> @@ -12,7 +12,7 @@ inherit pypi setuptools3 pkgconfig
>  SRC_URI += "file://0001-setup.py-StrictVersion-packaging.version.patch"
>  SRC_URI[sha256sum] = "49fc70f01bc192c43ff3ec815e082df5261ea4c8d36a695e977734c4eb4df868"
>
> -S = "${WORKDIR}/python-gammu-${PV}"
> +S = "${UNPACKDIR}/python-gammu-${PV}"
>
>  DEPENDS += "gammu python3-packaging-native"
>
> diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> index 0841dc2596..06f0b5bf0a 100644
> --- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> +++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/labapart/gattlib.git;branch=master;protocol=https \
>  SRCBRANCH = "master"
>  SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
>
> -S = "${WORKDIR}/git"
>
>  CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"
>
> diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
> index f4d0c09306..9325b1e5dc 100644
> --- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
> +++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
> @@ -9,7 +9,6 @@ SRCREV = "e4dbb9687bd5e887fa98a4cdcec012ea85da1ef2"
>
>  SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
> index e500749025..c042dba5a7 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
> @@ -40,7 +40,7 @@ SRC_URI[sha256sum] = "b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd3048
>  CVE_PRODUCT = "kerberos"
>  CVE_VERSION = "5-${PV}"
>
> -S = "${WORKDIR}/${BP}/src"
> +S = "${UNPACKDIR}/${BP}/src"
>
>  DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
>
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
> index 977f34b574..8b7306b598 100644
> --- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
> +++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
> @@ -11,5 +11,4 @@ DEPENDS = "libplist"
>  SRCREV = "aef2bf0f5bfe961ad83d224166462d87b1df2b00"
>  SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
> index b8d7e8872b..3c93c9a37b 100644
> --- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
> +++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
> @@ -14,7 +14,6 @@ SRCREV = "860ffb707af3af94467d2ece4ad258dda957c6cd"
>  SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master \
>             file://0001-include-unistd.h-for-usleep.patch"
>
> -S = "${WORKDIR}/git"
>  inherit autotools pkgconfig
>
>  EXTRA_OECONF = " --without-cython "
> diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
> index 818033243f..6049369290 100644
> --- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
> +++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
> @@ -11,5 +11,4 @@ DEPENDS = "libimobiledevice-glue libusb1 readline"
>  SRCREV = "2fb767d784c01269a0ded5bacd5539aee3768c35"
>  SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
> index a4174e06e3..27d28d71cb 100644
> --- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
> @@ -14,7 +14,6 @@ inherit meson pkgconfig bash-completion gobject-introspection upstream-version-i
>  SRCREV = "e10df4b6b3edfe6a46d93f7f5f5cab31c29a7091"
>  SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMESON = " \
>      -Dgtk_doc=false \
> diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb
> index 69eecdd9fa..fdf5694e9f 100644
> --- a/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb
> +++ b/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb
> @@ -8,6 +8,5 @@ SRC_URI = "git://github.com/jpirko/libndp;branch=master;protocol=https \
>             "
>  # tag for v1.8
>  SRCREV = "2730638bf88984b09531813974f9bd14e1a50165"
> -S = "${WORKDIR}/git"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
> index b4648832f1..0594b2485e 100644
> --- a/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
> +++ b/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/libnet/libnet.git;protocol=https;branch=master"
>  SRC_URI[sha256sum] = "1e9e9054d688b059bcbaf878d8c4fbf69bfc0c9386cd4e7779fbb53339050d2e"
>  SRCREV = "deaebdfe2743e8a6f04d3c307d9272afeeecfade"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools binconfig multilib_script
>  MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/libnet-config"
> diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
> index 0d21a7e596..83f32d3a07 100644
> --- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
> +++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
>             file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
>             "
>  SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "gnutls"
>
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
> index 94164a0b5a..8dc7ec3773 100644
> --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
> @@ -15,7 +15,6 @@ inherit meson pkgconfig bash-completion gobject-introspection upstream-version-i
>  SRCREV = "3f07d6e5b4677558543b3b4484ea88ad92257e92"
>  SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-34"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "udev mbim"
>  PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,libgudev"
> diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> index 3549cac568..f195008650 100644
> --- a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> +++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib.git;protoc
>  PV = "1.2.2+git"
>  SRCREV = "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig gobject-introspection
>
> diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
> index f2de1f468d..8481af7374 100644
> --- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
> +++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
> @@ -13,7 +13,6 @@ SRCREV = "74bc93a37a5e31c78f0aa02037a68fb9ac5deb41"
>  SRCREV_try_signal = "105cce59972f925a33aa6b1c3109e4cd3caf583d"
>  SRCREV_FORMAT .= "_try_signal"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig python3targetconfig
>
> diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
> index 912b002618..220bb62c64 100644
> --- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
> +++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
> @@ -13,7 +13,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
>  CVE_STATUS[CVE-2009-1760] = "backported-patch: patched in our product"
>
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = ""
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
> index 4d6ec3b7ea..0751cff178 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=382bfdf329e774859fd401eaf850d29b"
>  DEPENDS = "zlib"
>  DEPENDS:append:class-native = " libcap-native"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "ab9df9cfc39de7a49967f18387b6b76310947442"
>  SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable \
>             file://0001-sll_protocol-may-be-be16.patch \
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> index 6b4336eb80..82cc1167e2 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> @@ -14,7 +14,6 @@ DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
>  SRCREV = "03f786ce66360d67c669f4f122f8aa458e6f01ea"
>  SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-22"
>
> -S = "${WORKDIR}/git"
>
>  # strict, permissive
>  MODEMMANAGER_POLKIT_TYPE ??= "permissive"
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> index fecf9b129c..be8482ab50 100644
> --- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> @@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "158860aaea52f0fce0c8e4b64550daaae06df2689e05834697b7e8c7d7
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/openobex/files/openobex/"
>  UPSTREAM_CHECK_REGEX = "${BPN}/(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/${BP}-Source"
> +S = "${UNPACKDIR}/${BP}-Source"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
> index a9a12f8e05..30326e89ef 100644
> --- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
> +++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
> @@ -27,7 +27,7 @@ PACKAGECONFIG[swig] = "-DENABLE_SWIG=ON,-DENABLE_SWIG=OFF,swig"
>
>  DEPENDS:remove:class-native = "fuse-native"
>
> -S = "${WORKDIR}/${BP}-Source"
> +S = "${UNPACKDIR}/${BP}-Source"
>
>  EXTRA_OECMAKE += "-DCMAKE_SKIP_RPATH=ON \
>                    -DENABLE_PERL=OFF -DENABLE_PYTHON=OFF \
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
> index b971851b90..ad6637ed88 100644
> --- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
> @@ -19,7 +19,6 @@ SRCREV = "2150ba29d9df24ad1733c460eb099f292af84ee5"
>
>  DEPENDS = "openssl"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
> index 6f2efcda50..cfe5142312 100644
> --- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
> @@ -18,7 +18,6 @@ PV .= "+git"
>
>  DEPENDS = "openssl paho-mqtt-c"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
> index 7979094a0b..a04102aa42 100644
> --- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master
>            "
>  SRCREV = "4af4b8b04e6d5dd40b8e69cc30c5c1f62e7fe368"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> index 680174f005..4fd6302f2c 100644
> --- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
>  "
>  SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "popt openssl"
>
> diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
> index 4c963d9cc4..02a97cd6e3 100644
> --- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
> +++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
> @@ -8,7 +8,6 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
>  SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https"
>  SRCREV = "a88cab6d2e764e22cac232ef8d5af039d41b8280"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> index 38dcb395b2..e5a3f88867 100644
> --- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> @@ -14,7 +14,7 @@ SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
>  SRC_URI[sha256sum] = "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084"
>
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  EXTRA_OEMAKE += "LFLAGS='${LDFLAGS}'"
>
> diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
> index f86389998f..5d0dd6a389 100644
> --- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
> +++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
> @@ -15,7 +15,6 @@ SRC_URI = " \
>  # Transmission release 4.0.6
>  SRCREV = "38c164933e9f77c110b48fe745861c3b98e3d83e"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
>
> diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> index 569d6a41cf..5a880ed6d2 100644
> --- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> +++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> @@ -14,7 +14,6 @@ PV = "1.1.2+git"
>  SRCREV = "01c94c77f59404924f1c46d99c4e5e0c7817281b"
>  SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "--without-preflight"
>
> diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
> index c372b03072..9703c10452 100644
> --- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
> +++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
> @@ -7,7 +7,6 @@ LICENSE  = "ISC"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
>  SECTION = "test"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "12e85fbeca8ca21a632d18e55089a8a7606d64aa"
>  SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;branch=master;protocol=https \
>         file://0001-Use-toolchain-from-environment-variables.patch \
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
> index 135121c5ba..e411e6efc0 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
> @@ -8,7 +8,6 @@ SRCREV = "c94c20743ed7d4aa37835a5c46567ab0790d4acc"
>
>  SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-core/basu/basu_0.2.1.bb b/meta-oe/recipes-core/basu/basu_0.2.1.bb
> index 1b4d5a0fe5..330fe1c607 100644
> --- a/meta-oe/recipes-core/basu/basu_0.2.1.bb
> +++ b/meta-oe/recipes-core/basu/basu_0.2.1.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://git.sr.ht/~emersion/basu;protocol=https;branch=master"
>
>  DEPENDS += "gperf-native"
>
> -S = "${WORKDIR}/git"
>  PV = "0.2.1+git"
>  SRCREV = "a08cf5a575325435040d35710dbac3d0c32b1676"
>
> diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
> index 992a414009..0908409e1e 100644
> --- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
> +++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
> @@ -12,7 +12,6 @@ DEPENDS = "libsigc++-3"
>
>  RDEPENDS:${PN}:class-target = "${VIRTUAL-RUNTIME_dbus}"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig cmake
>
> diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> index 086a37ca1c..e99bf28ce5 100644
> --- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/alban/dbus-daemon-proxy;branch=master;protocol=https
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
> index 713b012177..ff2a106c6e 100644
> --- a/meta-oe/recipes-core/emlog/emlog.inc
> +++ b/meta-oe/recipes-core/emlog/emlog.inc
> @@ -7,7 +7,6 @@ SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=https;branch=master"
>  SRC_URI += "file://0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch"
>  SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
>  PV = "0.70+git"
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "nicupavel:emlog"
>
> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> index 684355ef3e..8abb13b580 100644
> --- a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> @@ -14,7 +14,6 @@ PV .= "+git"
>  SRCREV = "7482de6071d21db77a7236155da44c172a7f6c9e"
>  SRC_URI = "git://github.com/glfw/glfw.git;branch=3.3-stable;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_DOCS=OFF"
>
> diff --git a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
> index ebcc2b267b..97a5592f94 100644
> --- a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  SRC_URI = "git://gitlab.gnome.org/pwithnall/libglib-testing.git;protocol=https;branch=main"
>
>  PV = "0.1.1"
> -S = "${WORKDIR}/git"
>  SRCREV = "e326f73a7139c5e54fcf926896ae6e4cc899a1a7"
>
>  inherit  meson pkgconfig
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
> index a45d31edc2..48a1a2a624 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
> @@ -14,7 +14,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>
>  SRC_URI[archive.sha256sum] = "539b0a29e15a96676c4f0594541250566c5ca44da5d4d87a3732fa2d07909e4a"
>
> -S = "${WORKDIR}/${GNOMEBN}-${PV}"
> +S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
>
>  FILES:${PN} = "${libdir}/lib*.so.*"
>  FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/${BPN}/include/ ${libdir}/${BPN}/proc/ ${libdir}/giomm-2.68/include/"
> diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-core/libnfc/libnfc_git.bb
> index a97a2841f7..ac3a0d85a4 100644
> --- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
> +++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
> @@ -9,7 +9,6 @@ inherit autotools pkgconfig
>
>  PV = "1.8.0+git"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "f02ff51449240102c27a97173dc495e8e7789046"
>  SRC_URI = "git://github.com/nfc-tools/libnfc.git;branch=master;protocol=https"
>
> diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
> index 9a3ddfd15c..3496220fe1 100644
> --- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
> +++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "a9dbee323351d109b7aee074a9cb89ca3e7bcf8ad8edef1851f4cf359b
>  UPSTREAM_CHECK_URI = "https://download.gnome.org/sources/libsigc++/2.12/"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/libsigc++-${PV}"
> +S = "${UNPACKDIR}/libsigc++-${PV}"
>
>  inherit meson
>
> diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
> index 38a80bbf3e..0bfe55fd93 100644
> --- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
> +++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "c3d23b37dfd6e39f2e09f091b77b1541fbfa17c4f0b6bf5c89baef7229
>  UPSTREAM_CHECK_URI = "https://download.gnome.org/sources/libsigc++/3.6/"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/libsigc++-${PV}"
> +S = "${UNPACKDIR}/libsigc++-${PV}"
>
>  inherit setuptools3 meson
>
> diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
> index 0271602555..58c2697b9a 100644
> --- a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
> +++ b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
> @@ -11,7 +11,7 @@ DEPENDS = "libxml2 glibmm"
>  GNOMEBN = "libxml++"
>  inherit gnomebase ptest
>
> -S = "${WORKDIR}/libxml++-${PV}"
> +S = "${UNPACKDIR}/libxml++-${PV}"
>
>  SRC_URI[archive.sha256sum] = "15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098"
>
> diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> index a7ac358f27..948d50b471 100644
> --- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> +++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=https;branch=maste
>             "
>  SRCREV = "28202692d0b441000f4ddb8f347f72d1355021aa"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig vala
>
> diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
> index a013d99ba1..cf98c0cf2e 100644
> --- a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
> +++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master
>
>  SRCREV = "55db144e03027b43263e5ebcb599bf0878ba58de"
>
> -S = "${WORKDIR}/git"
>
>  RCONFLICTS:${PN} += "minizip"
>
> diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> index 0d36ffbcf6..56cd28c9ae 100644
> --- a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> +++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://zip.h;beginline=14;endline=30;md5=8eaa8535a3a1a2296b3
>  SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar.gz"
>  UPSTREAM_CHECK_URI = "http://zlib.net/"
>
> -S = "${WORKDIR}/zlib-${PV}/contrib/minizip"
> +S = "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
>
>  SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
>
> diff --git a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> index fe3cf73e43..9c4db7efec 100644
> --- a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> +++ b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> @@ -12,4 +12,3 @@ UPSTREAM_CHECK_COMMITS = "1"
>
>  inherit autotools
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-core/ndctl/ndctl_v79.bb b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
> index 1ad1476d93..4014e3bca6 100644
> --- a/meta-oe/recipes-core/ndctl/ndctl_v79.bb
> +++ b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
> @@ -18,7 +18,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
>
>  DEPENDS = "kmod udev json-c keyutils iniparser libtraceevent libtracefs"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMESON += "-Diniparserdir=${STAGING_INCDIR}/iniparser"
>
> diff --git a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb b/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
> index 8c05ad6d02..59f807b7ae 100644
> --- a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
> +++ b/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>
>  SRCREV = "527695de8393a3144863a0a07f9b92f1c734d1c4"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> index d43ea281ae..9e32242e31 100644
> --- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> +++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https;branch=master"
>
>  SRCREV = "fdde6677b21329432db8b481e2637cd10f7d3cb2"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> index b815c22eec..7335712d6f 100644
> --- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> @@ -10,7 +10,6 @@ SRCREV = "c7b4aded1cab9560b226041dd962f63375a9a384"
>
>  SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
> index e374ef1863..c766a66640 100644
> --- a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
> @@ -8,7 +8,6 @@ inherit pkgconfig cmake
>  DEPENDS += "opencl-headers opencl-icd-loader"
>  RDEPENDS:${PN} += "python3-core python3-io"
>
> -S = "${WORKDIR}/git"
>
>  SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
>            file://0001-Ignore-Compiler-Warnings.patch"
> diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> index 412b573cb4..0ec2fe5f33 100644
> --- a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> @@ -4,7 +4,6 @@ LICENSE  = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SECTION = "base"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "4ea6df132107e3b4b9407f903204b5522fdffcd6"
>  SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https \
>             file://0001-Command-buffer-supported-queue-properties-265.patch \
> diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> index 38db7a2453..7cfc75f5ed 100644
> --- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> @@ -11,7 +11,6 @@ DEPENDS += "opencl-headers"
>  PROVIDES = "virtual/opencl-icd"
>  RPROVIDES:${PN} = "virtual-opencl-icd"
>
> -S = "${WORKDIR}/git"
>
>  SRCREV = "861b68b290e76d08e7241608479c16431f529945"
>  SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
> diff --git a/meta-oe/recipes-core/pim435/pim435_git.bb b/meta-oe/recipes-core/pim435/pim435_git.bb
> index 8fc8749a1f..a18e889683 100644
> --- a/meta-oe/recipes-core/pim435/pim435_git.bb
> +++ b/meta-oe/recipes-core/pim435/pim435_git.bb
> @@ -15,7 +15,6 @@ SRCREV = "445ed623ec8d3ecbb1d566900b4ef3fb3031d689"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "i2c-tools"
>
> diff --git a/meta-oe/recipes-core/safec/safec_3.7.1.bb b/meta-oe/recipes-core/safec/safec_3.7.1.bb
> index 9dd6f1c7cc..a2f66e9a1a 100644
> --- a/meta-oe/recipes-core/safec/safec_3.7.1.bb
> +++ b/meta-oe/recipes-core/safec/safec_3.7.1.bb
> @@ -6,7 +6,6 @@ SECTION = "lib"
>
>  inherit autotools pkgconfig
>
> -S = "${WORKDIR}/git"
>  SRCREV = "f9add9245b97c7bda6e28cceb0ee37fb7e254fd8"
>  SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https \
>             file://0001-strpbrk_s-Remove-unused-variable-len.patch \
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
> index ceb422325c..9c39d40d23 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
> @@ -55,7 +55,6 @@ CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
>
>  EXTRA_OEMESON += "-Dstatic-libsystemd=pic"
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN}-dev = ""
>
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
> index c55c305611..0467c834b8 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
> @@ -11,6 +11,6 @@ DEPENDS += "expat"
>  SRCREV = "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
>  SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;tag=v${PV};subpath=tools"
>
> -S = "${WORKDIR}/tools"
> +S = "${UNPACKDIR}/tools"
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> index f3799adb3c..62b30e9894 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> @@ -24,7 +24,6 @@ EXTRA_OECMAKE = "-DSDBUSCPP_BUILD_CODEGEN=OFF \
>                   -DSDBUSCPP_BUILD_DOCS=ON \
>                   -DSDBUSCPP_BUILD_DOXYGEN_DOCS=OFF"
>
> -S = "${WORKDIR}/git"
>
>  # Link libatomic on architectures without 64bit atomics fixes
>  # libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'
> diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
> index 15b60af02e..92bebc5e35 100644
> --- a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
> +++ b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
> @@ -16,7 +16,6 @@ SRCREV = "00a12c234e2506f5cab683460199575f13c454db"
>  SRCBRANCH = "v257-stable"
>  SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = " \
>      cryptsetup-native \
> diff --git a/meta-oe/recipes-core/usleep/usleep_1.2.bb b/meta-oe/recipes-core/usleep/usleep_1.2.bb
> index e8b4a7fef9..b6e42018b9 100644
> --- a/meta-oe/recipes-core/usleep/usleep_1.2.bb
> +++ b/meta-oe/recipes-core/usleep/usleep_1.2.bb
> @@ -3,8 +3,7 @@ SECTION = "base"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>  DEPENDS = "popt"
>
>  SRC_URI = "file://usleep.c \
> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb
> index d7c8c44aad..fb95a2de5c 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb
> @@ -13,7 +13,6 @@ SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;branch=main \
>  "
>
>  SRCREV = "18b963ed6f612ac30ebca92426280cf4c1451f6a"
> -S = "${WORKDIR}/git"
>
>  require ${BPN}-crates.inc
>
> diff --git a/meta-oe/recipes-crypto/botan/botan_3.7.1.bb b/meta-oe/recipes-crypto/botan/botan_3.7.1.bb
> index a9d080c9a5..74f895cf3c 100644
> --- a/meta-oe/recipes-crypto/botan/botan_3.7.1.bb
> +++ b/meta-oe/recipes-crypto/botan/botan_3.7.1.bb
> @@ -7,7 +7,7 @@ SECTION = "libs"
>  SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
>  SRC_URI[sha256sum] = "fc0620463461caaea8e60f06711d7e437a3ad1eebd6de4ac29c14bbd901ccd1b"
>
> -S = "${WORKDIR}/Botan-${PV}"
> +S = "${UNPACKDIR}/Botan-${PV}"
>
>  inherit python3native siteinfo lib_package
>
> diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
> index b8ffa45947..840c04e52e 100644
> --- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
> +++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
> @@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
>  SRCREV = "2543e6e5037c0b1b448282c2793f8a6ce8b12d71"
>  SRC_URI = "git://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "openssl"
>
> diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
> index a34614dd9d..7d27081964 100644
> --- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
> +++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
> @@ -3,7 +3,6 @@ HOMEPAGE = "https://www.chronox.de/libkcapi/index.html"
>  LICENSE = "BSD-3-Clause | GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3d8a091d797491204567185a6efce70f"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "fc937358e71253a6efaa3ba74885364976b040ea"
>  SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https \
>            "
> diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
> index 5479007d92..a9a147c35b 100644
> --- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
> +++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
> @@ -21,7 +21,6 @@ SRC_URI = "git://github.com/libtom/libtomcrypt.git;protocol=https;branch=master
>
>  SRCREV = "7e7eb695d581782f04b24dc444cbfde86af59853"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
> index 813c6ec4c8..a601d88e7c 100644
> --- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
> +++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha512sum] = "bf275d4c53ff94af6cdc723a4e002e9f080f4d1436c86c76bb37870b34
>
>  MIRRORS = "https://.*/.* https://github.com/LoupVaillant/Monocypher/releases/download/${PV}/${BPN}-${PV}.tar.gz "
>
> -S = "${WORKDIR}/${BPN}-${PV}"
> +S = "${UNPACKDIR}/${BPN}-${PV}"
>
>  CFLAGS += "-pedantic -Wall -Wextra -O3"
>  EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'CFLAGS=${CFLAGS}' 'LIBDIR=${libdir}'"
> diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
> index d3922cf79e..15d0aefc36 100644
> --- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
> +++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
> @@ -17,7 +17,6 @@ LIC_FILES_CHKSUM = " \
>  "
>  SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>  # master
>  SRCREV = "8bed16034f629a0361fa8ff89deed2b43dc45d8b"
>  PV .= "+1.30.0+git"
> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> index 2ad68d679a..8c0889eb28 100644
> --- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> +++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> @@ -16,7 +16,6 @@ require ${BPN}-go-mods.inc
>
>  SRCREV = "688e697c51fd5353725da078555adbeff0363d01"
>
> -S = "${WORKDIR}/git"
>
>  GO_IMPORT = "github.com/influxdata/influxdb"
>  GO_INSTALL = "\
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
> index 60b486df78..9cefc528ae 100644
> --- a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
> @@ -11,7 +11,6 @@ SRC_URI = "gitsm://github.com/google/${BPN}.git;branch=main;protocol=https \
>  "
>
>  SRCREV = "068d5ee1a3ac40dabd00d211d5013af44be55bea"
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>  PACKAGECONFIG ??= ""
> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
> index b2f1920f6b..065c8559ff 100644
> --- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
> @@ -18,7 +18,7 @@ SRCREV = "ce201088de95d26fc0da36ba805bf2ddc2ba74ff"
>
>  inherit ptest
>
> -S = "${WORKDIR}/git/libraries/liblmdb"
> +S = "${UNPACKDIR}/${BP}/libraries/liblmdb"
>
>  do_compile() {
>      oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" XCFLAGS="${CFLAGS}"
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
> index fefb6df8aa..5bbb010f8b 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
> @@ -29,7 +29,6 @@ SRC_URI:append:mips = " file://0001-replace-old-sync-with-new-atomic-builtin-equ
>  SRC_URI:append:powerpc = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
>  SRC_URI:remove:toolchain-clang:riscv32 = "file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
> index 7d8b813e5f..4afbba963a 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
>             file://0002-abseil-ppc-fixes.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
> index 87c09f5118..e027b8d4aa 100644
> --- a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
> +++ b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.gi
>  "
>  SRCREV = "9bd5e2c7886fca72f139cd8402488a2235957d41"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "bison-native"
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
> index f473d22849..a771b38595 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
> @@ -3,8 +3,7 @@ SECTION = "console/utils"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  SRC_URI = " \
>      file://android-gadget-setup \
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
> index abf21803e5..eb86e9dd77 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>
>  SRC_URI = "file://android-gadget-setup"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> index fe915c3e30..f565007393 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> @@ -62,7 +62,6 @@ SRC_URI = " \
>  "
>
>
> -S = "${WORKDIR}/git"
>  B = "${WORKDIR}/${BPN}"
>
>  # http://errors.yoctoproject.org/Errors/Details/133881/
> diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> index 48ba7dbaea..244d9a3c6f 100644
> --- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> +++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> @@ -11,7 +11,6 @@ SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
>             file://0001-Explicit-header-stdint.patch \
>            "
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "zlib libpng python3-native"
>
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> index 3bf4371e85..2657f1ca0d 100644
> --- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> @@ -41,7 +41,6 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=h
>             file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
>             file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
>  "
> -S = "${WORKDIR}/git"
>
>  CXXFLAGS += "-D_GNU_SOURCE"
>  LDFLAGS:append:libc-musl = " -lucontext"
> diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
> index 77bde79217..0ea243fd20 100644
> --- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
> +++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
> @@ -9,7 +9,7 @@ SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};prot
>             file://0001-Export-binaries-only-for-native-build.patch"
>  SRCREV = "1a0e12c0a3ba1f0dbbad45ddfef555166e0a14fc"
>
> -S = "${WORKDIR}/git/c++"
> +S = "${UNPACKDIR}/${BP}/c++"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
> index eb8556ebc6..8a6337a0d2 100644
> --- a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
> +++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
>  SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=master \
>              file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.155"
>  SRCREV = "bd78bbe59b10eda6ef1255e4acda95c56c6d0279"
> -S = "${WORKDIR}/git"
>
>  inherit cargo pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> index bdeab3055c..33c8c28531 100644
> --- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> +++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
>           "
>  SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig ptest
>
> diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> index 47a3d88853..ab4e6148e9 100644
> --- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> +++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
>             file://0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch \
>             file://0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch"
>
> -S = "${WORKDIR}/git"
>
>  COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64|riscv32|riscv64).*-linux*"
>
> diff --git a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
> index 961c94205f..6e709b6e7e 100644
> --- a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
> +++ b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
>  SRC_URI = "git://github.com/rm5248/libcppgenerate.git;branch=master;protocol=https"
>  SRCREV = "930c5503f76c877b72b9ff8546353d6f422bd010"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
> index b404d4131e..98419a8069 100644
> --- a/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
> +++ b/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  SRC_URI = "git://github.com/SUSE/cpuset.git;protocol=https;branch=master"
>
>  SRCREV = "4f80263208935f0df4f616cf9d8cb7285599a670"
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
> index 6f0fbff0b2..845a78da76 100644
> --- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
> +++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
> @@ -17,7 +17,6 @@ inherit autotools-brokensep pkgconfig manpages
>  SRCREV = "c06d333b3162660694b26604a364cdab89e2010e"
>  SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= " \
>      readcmd \
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
> index 5fa71896b2..9287962ab7 100644
> --- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
> +++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
> @@ -13,7 +13,7 @@ SRC_URI  = "\
>
>  SRC_URI[sha256sum] = "232ec755f4b1f445f829996885846abba6f1b6fd55d049476ab26ddd8c4b4e1b"
>
> -S = "${WORKDIR}/debootstrap"
> +S = "${UNPACKDIR}/debootstrap"
>
>  DEPENDS = " \
>      virtual/fakeroot-native \
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
> index 599675a345..bc558b7d62 100644
> --- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
> @@ -10,7 +10,6 @@ SRC_URI:append:class-target = " file://oe-remote.repo.sample"
>
>  inherit setuptools3-base
>
> -S = "${WORKDIR}/git"
>
>  do_install:append() {
>      install -d ${D}${datadir}/dnf
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> index 1c8b442eef..512a63549e 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> @@ -12,7 +12,6 @@ SRC_URI = "\
>
>  SRCREV = "cbe58f6237b2238c9af7f51c6b7afb8bbf52c866"
>
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "Release_(?P<pver>\d+(\_\d+)+)"
>
> diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
> index b567f11f5c..c6db2ef38c 100644
> --- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
> +++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=38f617473e9f7373b5e79baf437accf8"
>
>  SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "e082c947e7f7b14240195d55c060a6e1eda1b0a1"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> index 74a14f4f08..bdaa39b402 100644
> --- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> +++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> @@ -7,7 +7,6 @@ SRCREV = "a4b17d543f072d2e3ba564e4bc5c3a0d2b05c338"
>
>  SRC_URI = "git://github.com/ArashPartow/exprtk.git;branch=release;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  # other packages commonly reference the file directly as "exprtk.hpp"
>  # create symlink to allow this usage
> diff --git a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
> index a4cd7ad157..83e9383d4a 100644
> --- a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
> +++ b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
> @@ -7,7 +7,6 @@ DEPENDS = "openssl"
>  SRC_URI = "git://git.pengutronix.de/git/extract-cert;protocol=https;branch=master;"
>  SRCREV = "d652b4e8279aef2a85f58676ab472744bafeafc9"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
> index 3103fd0091..c51a49ba01 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
> @@ -13,7 +13,6 @@ DEPENDS = "flatbuffers-native"
>  RDEPENDS:${PN}-compiler = "${PN}"
>  RDEPENDS:${PN}-dev += "${PN}-compiler"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE += " \
>      -DFLATBUFFERS_BUILD_TESTS=OFF \
> diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
> index 1fab013580..feb206f27c 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
> +++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  require flatbuffers.inc
>
> -S = "${WORKDIR}/git/python"
> +S = "${UNPACKDIR}/${BP}/python"
>
>  RDEPENDS:${PN} = "flatbuffers"
>
> diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
> index 2530dac526..2565e3b9bd 100644
> --- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
> +++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
> @@ -14,7 +14,6 @@ SRC_URI = " \
>  "
>  SRCREV = "1653ec964730ec7d9892a08a1695ada6d20f5196"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
> index 6b1a6e5453..53867b8fe6 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
> @@ -23,7 +23,6 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
>  # Both dependencies are mutually exclusive
>  # RDEPENDS:${PN}-dev += "${PN}-compiler"
>
> -S = "${WORKDIR}/git"
>  SRCREV_grpc = "4e9357bca1408596663a218c0c608a4c0560a867"
>  BRANCH = "v1.71.x"
>  SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.9.bb b/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
> index 9c956f0ed1..27f39ed1e1 100644
> --- a/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
> @@ -10,7 +10,6 @@ PV = "3.9.9"
>  SRC_URI = "git://github.com/iipeace/${BPN};branch=master;protocol=https;tag=versions/${PV}"
>  SRCREV = "118ab61773463e56dedc78f5cf6723b97a4ad946"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
> index 599fd2c373..3aca51ee3e 100644
> --- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
> +++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
> @@ -19,7 +19,6 @@ SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https;branch=master \
>
>  SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> index cc21c8beae..aa1f417604 100644
> --- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> +++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> @@ -20,7 +20,6 @@ SRCREV = "630434bb0ac619f7beec927569782d924c459385"
>  PV_LONG := "${PV}-171-g${SRCREV}"
>  PV .= "+git"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools ptest
>
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
> index 02dcdb2696..241fd328d8 100644
> --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=
>
>  SRCREV = "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "nlohmann-json"
>
> diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> index d6e42c81d5..56ddaf59a5 100644
> --- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> +++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> @@ -16,7 +16,7 @@ SRC_URI = "file://json_spirit_v${PV}.zip \
>             file://0001-Link-to-libatomic.patch \
>  "
>
> -S = "${WORKDIR}/json_spirit_v${PV}"
> +S = "${UNPACKDIR}/json_spirit_v${PV}"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
> index 28820baf48..f68ffd2c0f 100644
> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
> @@ -16,7 +16,6 @@ PE = "1"
>  SRCREV = "89e2973c754a9c02a49974d839779b151e95afd6"
>  SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
> index 75f2a53b10..ae86e20a4a 100644
> --- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp;branch=master;protocol=http
>
>  SRCREV = "ec5ce12fc9c0299e1454cc002c70218b5a6f005b"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[coverage] = "-DWITH_COVERAGE=YES,-DWITH_COVERAGE=NO,,"
> diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
> index 57a9cbade1..5ad953d260 100644
> --- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
> +++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https
>
>  SRCREV = "e71e0c2d584baff06925bbb3aad683f677e4d498"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "openssl"
>
> diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
> index efa8c936b4..43a61908f5 100644
> --- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
> +++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
> @@ -23,7 +23,6 @@ SRCREV = "f22fce3a308be1c7790ebefc6bbedb33c5f7c86a"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>  do_configure:prepend () {
> diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
> index 7cb6c097f3..63069b4b83 100644
> --- a/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
> +++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
> @@ -20,7 +20,6 @@ SRCREV = "5ebe92156143a341ab7b14bf76560d30093cfc54"
>  SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
>            "
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[lapacke] = "-DLAPACKE=ON,-DLAPACKE=OFF"
> diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> index 2904a454dc..8a8491b76b 100644
> --- a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> +++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/sqlite/sqlite;protocol=https;branch=branch-3.44"
>
>  SRCREV = "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
>
> -S = "${WORKDIR}/git"
>
>  do_compile() {
>      ${CC} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o lemon
> diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> index 9b18269bcb..3616eb519d 100644
> --- a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> +++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> @@ -16,7 +16,6 @@ inherit autotools-brokensep pkgconfig
>  # sombok-2.4.0
>  SRCREV = "0098d85a037ef5c99a648a3669a077781a45e8cc"
>
> -S = "${WORKDIR}/git"
>
>  # Disable libthai support
>  EXTRA_OECONF = "--disable-libthai"
> diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> index 5b357e2492..c9d0c94740 100644
> --- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> +++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -23,7 +23,6 @@ SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
>  "
>  SRCREV_FORMAT = "json_doctest"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> index 131929b30e..394cf9c000 100644
> --- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
> +++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> @@ -25,7 +25,6 @@ PV = "1.0.1+git"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> index 0fb68d8684..95e2084255 100644
> --- a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> +++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> @@ -18,7 +18,6 @@ SRC_URI = " \
>      file://0001-disable-docbook2man.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> index 58cfcb2f06..f84d989eef 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -31,7 +31,6 @@ SRC_URI = "git://gitlab.com/cespedes/ltrace.git;protocol=https;branch=main \
>             "
>  SRC_URI:append:libc-musl = " file://add_ppc64le.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> index cbad79f3ae..f4a1345ab2 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
>  PV = "2.1"
>  SRCREV = "538a82133ad6fddfd0ca64de167c4aca3bc1a2da"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig binconfig siteinfo
>
> diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb b/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
> index 7fb0965813..59bc4dfcfe 100644
> --- a/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
> +++ b/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
> @@ -8,7 +8,6 @@ DEPENDS += "lua-native lua virtual/crypt"
>  SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release-v36.2;protocol=https \
>  "
>  SRCREV = "5a8d8c768fc3c51f42cb591e9523a60399efc6a1"
> -S = "${WORKDIR}/git"
>  LUA_VERSION = "5.4"
>
>  B = "${S}"
> diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb b/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
> index f94025dd05..57c8417f44 100644
> --- a/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
> +++ b/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
> @@ -14,7 +14,6 @@ SRC_URI = "\
>
>  SRCREV = "09488c50c6bdc40aec8e3a9b23a539c5054a634c"
>
> -S = "${WORKDIR}/git"
>
>  do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
> diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
> index 028a8f9e46..4590b49955 100644
> --- a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
> +++ b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
> @@ -11,6 +11,5 @@ DEPENDS = "libmodbus (>=3.1.4)"
>  SRC_URI = "git://github.com/epsilonrt/mbpoll;protocol=https;branch=master"
>  SRCREV = "a0bd6c08d3d15b086f2104477295c0705aed366a"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig cmake
> diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> index 502843c0d1..a65782d017 100644
> --- a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> +++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> @@ -8,7 +8,7 @@ SECTION = "devtool"
>
>  LICENSE = "GPL-2.0-only"
>
> -S = "${WORKDIR}/memstattool"
> +S = "${UNPACKDIR}/memstattool"
>
>  LIC_FILES_CHKSUM = "file://debian/copyright;md5=87be186443b1ac2cfa466f475e1ee0cb"
>
> diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
> index 9331cd16fe..a312be4aa7 100644
> --- a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
> +++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
> @@ -12,7 +12,7 @@ inherit python3native python3targetconfig
>  SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
>  SRC_URI[sha256sum] = "f75d6a4a75823a1b7d713a4967eca2f596f466e58fc6bc06d72642932fd7e307"
>
> -S = "${WORKDIR}/mercurial-${PV}"
> +S = "${UNPACKDIR}/mercurial-${PV}"
>
>  BBCLASSEXTEND = "native"
>
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> index 8ba121d5ea..2fbbf8f06a 100644
> --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=main \
>  "
>  SRCREV = "a3534567187d2edc428efd3f13466ff75fe5805c"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig ptest
>
> diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> index 40d997a52c..aa7629763c 100644
> --- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> +++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https \
>             "
>  SRCREV = "8160ede5e20fd3019a77eea46d9c72cf6163f802"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
> index ccbaf9cea7..3457964609 100644
> --- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
> +++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "5fd555742e37bbd58d166199e669f01f743c7b3c6177191dd7b31fb0c3
>  UPSTREAM_CHECK_URI = "https://github.com/msgpack/msgpack-c/releases"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/msgpack-cxx-${PV}"
> +S = "${UNPACKDIR}/msgpack-cxx-${PV}"
>
>  DEPENDS += "boost"
>
> diff --git a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
> index 51fb98ccc8..2183170ba6 100644
> --- a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
> +++ b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
> @@ -7,7 +7,7 @@ SECTION = "devel"
>  SRC_URI = "https://01.org/sites/default/files/downloads/msr-tools/msr-tools-${PV}.zip"
>  SRC_URI[sha256sum] = "f9457b5340f5f274da4239a461f0db6b514142b40461559d9c6150f05aab1d1e"
>
> -S = "${WORKDIR}/msr-tools-master"
> +S = "${UNPACKDIR}/msr-tools-master"
>
>  COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
>
> diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> index 82e5c3bc5e..ef2553760d 100644
> --- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> +++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> @@ -20,7 +20,6 @@ UPSTREAM_CHECK_COMMITS = "1"
>
>  inherit autotools-brokensep
>
> -S = "${WORKDIR}/git"
>
>  do_configure () {
>      # no debug set -s flag
> diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> index 36e46021bb..ec87535ec7 100644
> --- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> @@ -12,7 +12,6 @@ SRCREV = "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"
>
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  # nlohmann-fifo is a header only C++ library, so the main package will be empty.
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> index 58567a781e..4e0a34eb2e 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> @@ -16,7 +16,6 @@ SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
>
>  SRCREV_FORMAT .= "_json-test-data"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
> index d4b818f967..7d48717b1a 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
> @@ -8,8 +8,7 @@ SRC_URI = "\
>
>  inherit native
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  B = "${WORKDIR}/build"
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
> index b29c83400a..4bc829f140 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
> @@ -40,7 +40,7 @@ SRC_URI:append:toolchain-clang:powerpc64le = " \
>             "
>  SRC_URI[sha256sum] = "720894f323e5c1ac24968eb2676660c90730d715cb7f090be71a668662a17c37"
>
> -S = "${WORKDIR}/node-v${PV}"
> +S = "${UNPACKDIR}/node-v${PV}"
>
>  CVE_PRODUCT += "node.js"
>
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> index b1ce2ec168..0252a063ae 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -19,7 +19,6 @@ SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
>  SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
>
>  PV = "0.12+git"
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig autotools-brokensep gettext
>
> diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
> index d5fa3b4746..aca915bf32 100644
> --- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
> +++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
> @@ -13,7 +13,6 @@ SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
>  SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
>             file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> index 52af9b99b1..130980b0cd 100644
> --- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> +++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/billfarrow/pcimem.git;branch=master;protocol=https"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      install -D -m 0755 ${B}/pcimem ${D}${bindir}/pcimem
> diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
> index 3cd0cb91b8..1c7e9144cc 100644
> --- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
> +++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
> @@ -10,4 +10,3 @@ SRCREV_perfetto = "c74251226a8caa0b43377902ee06d2570faa0c15"
>  SRCREV_FORMAT = "perfetto"
>  PV = "47.0"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
> index 3b686f7fdc..65f2ec232a 100644
> --- a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
> +++ b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
> @@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "f977a25b4116a0a95a7c8a894fd37097abe19af9a6a9ed4d800604ec17
>
>  RDEPENDS:${PN} = "libdbi-perl"
>
> -S = "${WORKDIR}/DBD-MariaDB-${PV}"
> +S = "${UNPACKDIR}/DBD-MariaDB-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb b/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
> index 3d745146f1..69a4f79815 100644
> --- a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
> +++ b/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
> @@ -10,7 +10,6 @@ inherit cpan
>  SRCREV = "e04534a40925354187e8432d44248229d774f34a"
>  SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} = " \
>      perl \
> diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
> index e28b6ea018..9cdb0a52cc 100644
> --- a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
> +++ b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
> @@ -12,7 +12,6 @@ DEPENDS = "perl"
>  SRC_URI = "git://github.com/toddr/IPC-Run.git;branch=master;protocol=https"
>  SRCREV = "ad56c3b5f5a211d32bbb8ac29f180d707ee58c1b"
>
> -S = "${WORKDIR}/git"
>
>  inherit cpan
>
> diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
> index 9171cbc89c..4886333f3a 100644
> --- a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
> +++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
> @@ -10,7 +10,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.
>
>  SRC_URI[sha256sum] = "473d65127b23dac0e8039c01e28bc4072cb9a6e93e81a1ea4893cea08c698db0"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
>
> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
> index f70f737ba2..c128cb7154 100644
> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=65f65488c774efe1da488e36ad6c4a36"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
>  SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
>
> -S = "${WORKDIR}/DBI-${PV}"
> +S = "${UNPACKDIR}/DBI-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
> index 21e46f5521..43614d55ac 100644
> --- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
> +++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
> @@ -13,7 +13,7 @@ SRC_URI = "https://cpan.metacpan.org/modules/by-module/Devel/Devel-CheckLib-${PV
>  "
>  SRC_URI[sha256sum] = "869d38c258e646dcef676609f0dd7ca90f085f56cf6fd7001b019a5d5b831fca"
>
> -S = "${WORKDIR}/Devel-CheckLib-${PV}"
> +S = "${UNPACKDIR}/Devel-CheckLib-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
> index 6029b7aae9..1464a84d34 100644
> --- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
> +++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
> @@ -7,7 +7,7 @@ SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "b15309fc85623893289cb9b2b88dfa9ed1e69156b75f29938553a45be6d730af"
>
> -S = "${WORKDIR}/IO-Tty-${PV}"
> +S = "${UNPACKDIR}/IO-Tty-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
> index 407ba39140..ded0dea0d1 100644
> --- a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
> +++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/makamaka/JSON.git;protocol=https;branch=master"
>
>  SRCREV = "39bc0e567c202762a575fed2844ebdb941c3ca09"
>
> -S = "${WORKDIR}/git"
>
>  inherit cpan
>
> diff --git a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
> index b77a5c95a2..a7e05922d6 100644
> --- a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
> +++ b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
> @@ -13,7 +13,7 @@ SRC_URI = "https://www.cpan.org/authors/id/W/WB/WBRASWELL/Parse-Yapp-${PV}.tar.g
>
>  SRC_URI[sha256sum] = "3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a8b8e340ca65f13e5"
>
> -S = "${WORKDIR}/Parse-Yapp-${PV}"
> +S = "${UNPACKDIR}/Parse-Yapp-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
> index 1bdb332a75..3e4137a68c 100644
> --- a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
> +++ b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "5cc834438739bd6e4e837fb7e10bd8befb809cd185ae6cf4b33e5fa916
>  UPSTREAM_CHECK_URI = "https://cpan.metacpan.org/authors/id/W/WH/WHOM/"
>  UPSTREAM_CHECK_REGEX = "pcsc-perl-(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/pcsc-perl-${PV}"
> +S = "${UNPACKDIR}/pcsc-perl-${PV}"
>
>  inherit cpan pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
> index 4ce31d6fe6..981c946483 100644
> --- a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
> +++ b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
> @@ -13,7 +13,7 @@ SRC_URI = "https://cpan.metacpan.org/authors/id/N/NW/NWCLARK/PerlIO-gzip-${PV}.t
>
>  SRC_URI[sha256sum] = "4848679a3f201e3f3b0c5f6f9526e602af52923ffa471a2a3657db786bd3bdc5"
>
> -S = "${WORKDIR}/PerlIO-gzip-${PV}"
> +S = "${UNPACKDIR}/PerlIO-gzip-${PV}"
>
>  EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.4.6.bb b/meta-oe/recipes-devtools/php/php_8.4.6.bb
> index 1b8c019a5d..5118ddd6ab 100644
> --- a/meta-oe/recipes-devtools/php/php_8.4.6.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.4.6.bb
> @@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
>              file://php-fpm.service \
>            "
>
> -S = "${WORKDIR}/php-${PV}"
> +S = "${UNPACKDIR}/php-${PV}"
>
>  SRC_URI[sha256sum] = "9cf2734509b603f6589617ab52a9712a03e0fe059951cddd2d4623df4bf7c6c6"
>
> diff --git a/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb b/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
> index feffff623d..b0a20e3ece 100644
> --- a/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
> +++ b/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://github.com/pistacheio/pistache.git;branch=master;protocol=https
>  # SRCREV tagged 0.4.26
>  SRCREV = "ddffda861aa49012dcda28f1362d0339e718cd52"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "rapidjson"
>
> diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
> index 5a39456b2d..916ff29118 100644
> --- a/meta-oe/recipes-devtools/ply/ply_git.bb
> +++ b/meta-oe/recipes-devtools/ply/ply_git.bb
> @@ -10,7 +10,6 @@ PV = "2.4.0"
>  SRC_URI = "git://github.com/iovisor/ply;branch=master;protocol=https"
>  SRCREV = "282558cfa1c0f0e095354e3a6ec4486b524179dc"
>
> -S = "${WORKDIR}/git"
>
>  CACHED_CONFIGUREVARS = 'LD="${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"'
>
> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
> index 7b06d10526..f3ffccf626 100644
> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
> @@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8cdfa87bc5e09bc07f8cf64135026d91"
>  SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main"
>  SRCREV = "8a3bdd7e0a43b44e3b32548543128d95e68a3802"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
> index 7640797771..30c9e19b16 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
> @@ -19,7 +19,6 @@ SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-
>
>  SRCREV = "185beed28e65494be7505b30c1afeaf199e19b23"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> index 30b805e6b1..61aff1da28 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> @@ -26,7 +26,6 @@ SRC_URI:append:mipsarcho32:toolchain-clang = " file://0001-Fix-build-on-mips-cla
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.(25\.(\d+)))"
>
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
>
> diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb b/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
> index 1d54b9f6af..d5c440f413 100644
> --- a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
> +++ b/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://salsa.debian.org/apt-team/python-apt.git;protocol=https;branch=
>
>  SRCREV = "3252935b6224b3bd2e2250894b9559b47c61b2e1"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
> index a98dfab6d9..d80eac7756 100644
> --- a/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
> +++ b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
> @@ -10,6 +10,6 @@ SRC_URI[sha256sum] = "723f24f4d65fc8d99b33a002fbbb3771d4cc9d664c97085bf37f3997ae
>
>  inherit setuptools3
>
> -S = "${WORKDIR}/python-distutils-extra-${PV}"
> +S = "${UNPACKDIR}/python-distutils-extra-${PV}"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> index 8519479c4d..724d329ee2 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -10,7 +10,6 @@ SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
>
>  PV = "1.1.0+git"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> index 29abfe1af5..672c46055d 100644
> --- a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> +++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> @@ -9,7 +9,6 @@ SRC_URI = " \
>
>  SRCREV = "45eb2ffa5378396e85432872833890b0a1cba872"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
> index b97700e53d..72ccd1d6b7 100644
> --- a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
> +++ b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
> @@ -7,6 +7,5 @@ BRANCH = "master"
>  SRC_URI = "git://github.com/clarkwang/sexpect;branch=${BRANCH};protocol=https;tag=v${PV}"
>  SRCREV = "d3645392424d47532be90fcbc0abf3148324785b"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
> index bf5c52fe50..ea4fc5d3dd 100644
> --- a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
> +++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
> @@ -9,7 +9,6 @@ DEPENDS = "ncurses"
>  SRC_URI = "git://github.com/ColinIanKing/smemstat.git;protocol=https;branch=master"
>  SRCREV = "1edc560602aa116b96408110b8b9d66a4edef60e"
>
> -S = "${WORKDIR}/git"
>
>  inherit bash-completion
>
> diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
> index 17c24d5abf..ee203f83e2 100644
> --- a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
> +++ b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
> @@ -12,7 +12,6 @@ SRC_URI = " \
>      git://github.com/fnc12/sqlite_orm;protocol=https;branch=master \
>      file://0001-fix-cstdint-error-with-gcc-15.0.1.patch \
>  "
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE += "-DSqliteOrm_BuildTests=OFF -DLIB_INSTALL_DIR=${libdir} \
>                    -DCMAKE_INSTALL_DIR=${libdir}/cmake \
> diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
> index 10e0e27a20..966d14874e 100644
> --- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
> +++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=a709b68f1ce8a9f10aeea6401446c1f4 \
>  SRCREV = "667faf69cc35215e33e747b4bffdcba3643c2629"
>  SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https;branch=fixes-1.3.0"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> index 2c01e126ff..7824ed1a68 100644
> --- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> +++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> @@ -11,7 +11,6 @@ SRC_URI = " \
>  "
>  SRCREV = "34b42992a43fda69c6ba2557b718601cafe16251"
>
> -S = "${WORKDIR}/git"
>
>  # coreutils provides fmt which is used in the Makefile
>  DEPENDS = "i2c-tools coreutils-native"
> diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> index 7b194790a3..94fd271e3c 100644
> --- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> +++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branc
>             "
>  SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "cmake-native lapack gmp mpfr chrpath-native"
>
> diff --git a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
> index 3360ccf357..84a77e6fd8 100644
> --- a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
> +++ b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
> @@ -7,8 +7,7 @@ inherit nativesdk
>
>  SRC_URI = "file://systemctl"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>         install -d ${D}${bindir}
> diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
> index 60dbc7b422..6f452d3b93 100644
> --- a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
> +++ b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
> @@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5c64b2e8cc50917b2744a90950faa7cd"
>  SRCREV = "81b3d2a0c47895c22e9bb8c577f5ab521f76e5d2"
>  SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.4"
>
> -S = "${WORKDIR}/git"
>  inherit cmake
>
>  ALLOW_EMPTY:${PN} = "1"
> diff --git a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
> index 8518fb8dfe..8cb9f6cb5e 100644
> --- a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
> +++ b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
> @@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
>  UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
>
> -S = "${WORKDIR}/tk${PV}"
> +S = "${UNPACKDIR}/tk${PV}"
>
>  # Short version format: "8.6"
>  VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
> diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> index 8701686b11..504b40927e 100644
> --- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> +++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> @@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "d6f01a4d598bfc6398be9584e1bab828c907b0758db4bbb351a1429106
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
>  UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
>
> -S = "${WORKDIR}/${BPN}${PV}"
> +S = "${UNPACKDIR}/${BPN}${PV}"
>
>  # Short version format: "8.6"
>  VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
> diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> index a6ec89a2ff..da8b1602be 100644
> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/marzer/tomlplusplus.git;protocol=https;branch=master
>
>  PV = "3.4.0"
>  SRCREV = "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "cmake-native"
>
> diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
> index 8fecadb22f..776bb014f4 100644
> --- a/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
> +++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
> @@ -13,7 +13,6 @@ inherit autotools
>  SRCREV = "b0d936107edcefb519abbc9c363ca40daaac23b3"
>  SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
>             file://0001-include-libgen.h-for-basename.patch"
> -S = "${WORKDIR}/git"
>
>  LDFLAGS:append:libc-musl = " -largp"
>
> diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
> index e37dbcd02f..3d92f59ff2 100644
> --- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
> +++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=m
>
>  SRCREV = "5aff8fa2b5b60b7c11bbfb39c884477e72d11d02"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3_legacy
>
> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> index 54d33379da..877f1d57f6 100644
> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> @@ -22,7 +22,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
>
>  SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520004a28"
>
> -S = "${WORKDIR}/imap-${PV}"
> +S = "${UNPACKDIR}/imap-${PV}"
>
>  CVE_STATUS[CVE-2005-0198] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
>
> diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
> index 7f5d0b1416..4e5f02746c 100644
> --- a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
> +++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
>  SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
>  SRCREV = "4edda758546436462da479bb8c8514f8a95c35ad"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> index e9442697fa..3b923fb99e 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> @@ -13,7 +13,7 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
>             "
>  SRCREV = "8ce36bce2438df9b02fcaafd19efa90a56426601"
>
> -S = "${WORKDIR}/git/advanced"
> +S = "${UNPACKDIR}/${BP}/advanced"
>
>  inherit autotools-brokensep binconfig pkgconfig
>
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> index 186f2c8ed0..3e569859b7 100644
> --- a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> +++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/lloyd/yajl;nobranch=1;protocol=https"
>
>  inherit cmake lib_package
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
>
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> index c5b5e60027..e4434bee45 100644
> --- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> +++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
>             "
>  SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake lib_package
>
> diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> index de7eb45c1d..68895a1697 100644
> --- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> +++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
>             file://0001-bitvect-fix-build-with-gcc-15.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools gettext python3native
>
> diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
> index 4b6c7a613c..74e44c44e3 100644
> --- a/meta-oe/recipes-extended/7zip/7zip_24.09.bb
> +++ b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
> @@ -14,7 +14,6 @@ SRCREV = "e5431fa6f5505e385c6f9367260717e9c47dc2ee"
>
>  UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
>
> -S = "${WORKDIR}/git"
>
>  # Support Yocto cross compiling
>  CXXFLAGS:append:toolchain-clang = " -Wno-error=cast-qual -Wno-error=sign-conversion \
> diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
> index 645ea1a2ae..033461d614 100644
> --- a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
> +++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
> @@ -32,7 +32,6 @@ SRCHASH_CPM = "c8cdc32c03816538ce22781ed72964dc864b2a34a310d3b7104812a5ca2d835d"
>  TAG_CPM = "0.40.2"
>  SRC_URI[sha256sum] = "${SRCHASH_CPM}"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-extended/beep/beep_1.4.12.bb b/meta-oe/recipes-extended/beep/beep_1.4.12.bb
> index a4bc10c366..a8d720d9dd 100644
> --- a/meta-oe/recipes-extended/beep/beep_1.4.12.bb
> +++ b/meta-oe/recipes-extended/beep/beep_1.4.12.bb
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  SRC_URI = "git://github.com/spkr-beep/beep.git;protocol=https;branch=master \
>             file://0001-beep-library-Make-it-compatible-with-c99.patch"
>  SRCREV = "11453a79f2cea81832329b06ca3a284aa7a0a52e"
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "prefix='${prefix}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
>
> diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
> index 4d560eb4b8..397829c87b 100644
> --- a/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
> +++ b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "806271fa5bf31de0600315e8720004a8f529954480e991ca84a9868dc1
>  UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
>  UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/${BPN}-v${PV}"
> +S = "${UNPACKDIR}/${BPN}-v${PV}"
>
>  DEPENDS = "ncurses readline"
>
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
> index cfd134dd4f..b2cfd9b874 100644
> --- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
> +++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
> @@ -41,7 +41,6 @@ inherit gettext autotools pkgconfig features_check systemd
>
>  REQUIRED_DISTRO_FEATURES += "opengl"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "\
>      --enable-libraries \
> diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
> index 58214ea59c..411f8a7610 100644
> --- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
> +++ b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
>  SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
>  SRCREV = "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake lib_package
>
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> index dad8e8e8e2..26c80195b0 100644
> --- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> @@ -19,7 +19,6 @@ SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;protocol=https;branch=ma
>
>  SRCREV  = "e0760b2e9657907e691be4df384ca7617109635d"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> index 829e9588c8..e1a6af622b 100644
> --- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> +++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
> @@ -8,7 +8,6 @@ SRC_URI = " \
>      file://0001-reproducibility-Prevent-configuration-from-reading-h.patch \
>  "
>  SRCREV = "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
> index e1f6c558df..da710eaedb 100644
> --- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=main
>             "
>
>  SRCREV = "49d6dcfc71ca421100fcf325e31625817c469fc9"
> -S = "${WORKDIR}/git"
>
>  inherit cmake python3targetconfig
>
> diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
> index f2dbe4029b..7c596371e5 100644
> --- a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
> +++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
> @@ -12,7 +12,7 @@ SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
>  SRC_URI[sha256sum] = "68406329827b783d0a8959cc20a94c6e1791ac861a27f854e06e9020541816dd"
>
>  # hardcoded here for use in dialog-static recipe
> -S = "${WORKDIR}/dialog-${PV}"
> +S = "${UNPACKDIR}/dialog-${PV}"
>
>  inherit autotools-brokensep pkgconfig
>
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> index 888289b357..8b48d20aac 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> @@ -23,7 +23,6 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
>             "
>  SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
>   dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console \
> diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> index ec0b4da935..71305cc35f 100644
> --- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> +++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> @@ -20,7 +20,6 @@ SRC_URI = "\
>      git://github.com/docopt/docopt.cpp.git;protocol=https;branch=master \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
> index 310081b822..ad2aee4570 100644
> --- a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
> +++ b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5940d39995ea6857d01b8227109c2e9c"
>
>  SRCREV = "89c1502b9d40b5cb4a844498b14d74ba1dd559bf"
>  SRC_URI = "git://github.com/Yelp/dumb-init;branch=master;protocol=https"
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS} ${LDFLAGS}'"
>
> diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
> index 82f8366aeb..c3a5a02a3f 100644
> --- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
> +++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
> @@ -16,7 +16,6 @@ inherit cmake
>
>  DEPENDS += "grpc protobuf cpprest grpc-native protobuf-native"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "-DCPPREST_EXCLUDE_WEBSOCKETS=ON"
>
> diff --git a/meta-oe/recipes-extended/figlet/figlet_git.bb b/meta-oe/recipes-extended/figlet/figlet_git.bb
> index 9789ac16d4..d226806050 100644
> --- a/meta-oe/recipes-extended/figlet/figlet_git.bb
> +++ b/meta-oe/recipes-extended/figlet/figlet_git.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1688bcd97b27704f1afcac7336409857"
>  SRC_URI = "git://github.com/cmatsuoka/figlet.git;branch=master;protocol=https \
>             file://0001-build-add-autotools-support-to-allow-easy-cross-comp.patch"
>  SRCREV = "5bbcd7383a8c3a531299b216b0c734e1495c6db3"
> -S = "${WORKDIR}/git"
>  PV = "2.2.5+git"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
> index 5dfba25140..df7a4e2758 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://github.com/flatpak/flatpak-xdg-utils.git;protocol=https;branch=
>
>  SRCREV = "05abdd7421688be5835a6b12f2b068086c38d4aa"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
> index 6696d8347b..f99c8ac36a 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
> @@ -10,7 +10,6 @@ SRC_URI = " \
>
>  SRCREV = "1440f4faa67ebf69c7559f31d2cab59e6ec6fe2b"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
>
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> index 4d82abc783..05e4fd937f 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> @@ -32,7 +32,6 @@ SRC_URI:append:libc-musl = "\
>  # prefix tag with "v" to avoid upgrade to random tags like "20220215"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "\
>      aws \
> diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
> index 7dcc36080a..69de5628c4 100644
> --- a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
> +++ b/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  SRCREV = "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
>  SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
>  "
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_URI = "https://github.com/jirka-h/haveged/releases"
>
> diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
> index d2b23b41b4..2299d55b2b 100644
> --- a/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
> +++ b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/pixel/hexedit.git;branch=master;protocol=https \
>
>  SRCREV = "eab92dcaa34b66bc5182772afc9fda4ac8a27597"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep update-alternatives
>
> diff --git a/meta-oe/recipes-extended/highway/highway_1.2.0.bb b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
> index e7dfc706bd..ea38310398 100644
> --- a/meta-oe/recipes-extended/highway/highway_1.2.0.bb
> +++ b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/google/highway.git;protocol=https;branch=master \
>             file://0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch"
>
>  SRCREV = "457c891775a7397bdb0376bb1031e6e027af1c48"
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"
>
> diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
> index dfabbb91a6..8678447cf5 100644
> --- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
> +++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
> @@ -10,7 +10,6 @@ SRC_URI = " \
>      "
>  SRCREV = "60e5075d4ac77424809f855ba3e398df7aacefe8"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
> index 9bb2e2f1f3..56359d797d 100644
> --- a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
> +++ b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
> @@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171d
>
>  SRC_URI = "file://inputattach.conf"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
> diff --git a/meta-oe/recipes-extended/iotop/iotop_1.30.bb b/meta-oe/recipes-extended/iotop/iotop_1.30.bb
> index 7d04a3b17b..9fe774f9f2 100644
> --- a/meta-oe/recipes-extended/iotop/iotop_1.30.bb
> +++ b/meta-oe/recipes-extended/iotop/iotop_1.30.bb
> @@ -7,7 +7,6 @@ DEPENDS = "ncurses"
>  SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https;tag=v${PV}"
>  SRCREV = "c3366a8a235f9c8ddc4797625f22cfdf12ba2c36"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
> index 87fcf8cc61..fc94d2caab 100644
> --- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
> +++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/rhinstaller/isomd5sum.git;branch=master;protocol=htt
>             file://0002-fix-parallel-error.patch \
>  "
>
> -S = "${WORKDIR}/git"
>  inherit python3native
>
>  EXTRA_OEMAKE += " \
> diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> index bfa0e79d8f..7129d6ef8c 100644
> --- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> +++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> @@ -7,7 +7,6 @@ PV = "2.3.6+git"
>  SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=https;branch=master"
>  SRCREV = "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
>
> -S = "${WORKDIR}/git"
>
>  do_compile() {
>         oe_runmake
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> index bd3a8f2ff5..f3f70b8da3 100644
> --- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/rnovacek/konkretcmpi.git;branch=master;protocol=http
>             "
>
>  SRCREV = "ad28225e6eceff88417a60c1ba8896c8e40f21a7"
> -S = "${WORKDIR}/git"
>
>  inherit cmake python3-dir
>
> diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> index 0c2382fe85..6ca8569bc5 100644
> --- a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> +++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> @@ -16,7 +16,6 @@ SRCREV = "9ae4f4ae4481b1e69d38ed810980d33103544613"
>  # The current PV is not a git tag but a README content
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
> index b98942379e..37c514a219 100644
> --- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
> +++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://github.com/storaged-project/libblockdev;branch=3.2.x-branch;pro
>             file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
>             "
>  SRCREV = "b829b60d9ff049abb190f09a3b9a5fac648cd5a3"
> -S = "${WORKDIR}/git"
>
>  FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
>
> diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
> index 4c5eb8a640..60c3c6fadd 100755
> --- a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
> +++ b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
>  SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master"
>  SRCREV = "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb b/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
> index 532179a9bb..2def38d73f 100644
> --- a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
> +++ b/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release;protocol=https
>             file://0001-Enhance-reproducibility.patch \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
> index e3de8aca62..6683c396e2 100644
> --- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
> +++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master
>      file://0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.patch \
>  "
>
> -S = "${WORKDIR}/git"
>  SRCREV = "275aa5141db6eda3587214e0f1d3a134768f557d"
>
>  inherit cmake pkgconfig
> diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> index 87778c6314..9f4b2a19d0 100644
> --- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> +++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> @@ -14,6 +14,5 @@ SRCREV = "db9371cf9f38b5a3b2f6e4fae3f92eb052d2d929"
>  SRC_URI = "git://github.com/libdivecomputer/libdivecomputer.git;protocol=https;branch=master \
>            "
>
> -S = "${WORKDIR}/git"
>
>
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> index 7278299a08..7f01962a97 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> @@ -11,7 +11,6 @@ inherit autotools pkgconfig python3native python3targetconfig
>  SRCREV = "2117b8fdb6b4096455bd2041a63e59a028120136"
>  SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  CVE_STATUS_GROUPS += "CVE_STATUS_LIBLIST"
>  CVE_STATUS_LIBLIST[status] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> index bfd4af053c..e29ec88e06 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> @@ -13,7 +13,6 @@ PV = "2.3.0+git"
>  SRCREV = "2cd858c679d25633077ca78b67182a9b77653816"
>  SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  CVE_STATUS_GROUPS += "CVE_STATUS_LIBLIST"
>  CVE_STATUS_LIBLIST[status] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
> index 5a7548a7e6..7869fc1941 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
> @@ -11,6 +11,5 @@ PKGV = "${GITPKGVTAG}"
>  SRCREV = "adf9c22b9010490e4b55eaeb14731991db1c172c"
>  SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  FILES:${PN} += "${base_libdir}/udev/rules.d/"
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> index b9f5c34094..76759fe69d 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> @@ -12,6 +12,5 @@ PV = "2.0.2+git"
>  SRCREV = "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
>  SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  FILES:${PN} += "${base_libdir}/udev/rules.d/"
> diff --git a/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb b/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
> index e3e4c01acb..8021d8cf06 100644
> --- a/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
> +++ b/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
> @@ -14,7 +14,6 @@ SRC_URI = "gitsm://github.com/WuBingzheng/libleak;protocol=https;branch=master \
>             file://0001-respect-environment-variables.patch \
>            "
>
> -S = "${WORKDIR}/git"
>
>  do_configure () {
>         :
> diff --git a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
> index 1d650ac63b..c310e0f527 100644
> --- a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
> +++ b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
> @@ -12,4 +12,3 @@ SRC_URI = "git://github.com/Jacajack/liblightmodbus.git;protocol=https;branch=ma
>            "
>  SRCREV = "59d2b405f95701e5b04326589786dbb43ce49e81"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
> index b094337e90..99f23fef05 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
> @@ -17,7 +17,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.17.orig.tar.gz \
>  SRC_URI[sha256sum] = "6e937f3650afab4aac198f348b89b1ca42edceb17fb6bb0918f642143ccfd15e"
>  SRC_URI[1.17-1.sha256sum] = "e3657c0e3facfeccb58900c0b48d56cd68ad5f9f24d1b4c6eaa69c26490fb673"
>
> -S = "${WORKDIR}/${BP}"
> +S = "${UNPACKDIR}/${BP}"
>
>  inherit autotools-brokensep
>
> diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
> index 0cc128c8c4..89670d10ca 100644
> --- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
> +++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/rsyslog/liblognorm;branch=master;protocol=https \
>             "
>  SRCREV = "46c6ee4c8e5f827893e485a4ef1aff04ea881273"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
> index 80644b0833..ffbb3a8c8e 100644
> --- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
>  SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https"
>  SRCREV = "5190e5e141780ae481f24be16d7b39a5f3ad8f8f"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> index f08fea7de3..7ec01ecd3f 100644
> --- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> +++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/libpwquality/libpwquality;branch=master;protocol=htt
>  "
>  SRCREV = "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep gettext setuptools3-base
>
> diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb b/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
> index 28c64a1614..ba10f062ec 100644
> --- a/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
> +++ b/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
> @@ -21,7 +21,6 @@ SRCREV = "f6bb06a699617d078fcd4f8b71b4d063bf47b52b"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES = "systemd"
> diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> index 6e6c8cc226..d7e88f4fd0 100644
> --- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> @@ -11,7 +11,6 @@ PV .= "+0.2.2+git"
>
>  inherit autotools
>
> -S = "${WORKDIR}/git"
>
>  PACKAGES += "${PN}-tools"
>
> diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
> index 7a82f6b4b6..c5411d53a1 100644
> --- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
> +++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
> @@ -19,7 +19,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
>  SRC_URI = "git://github.com/caolanm/libwmf.git;protocol=https;branch=master"
>  SRCREV = "9e4737f2293c0d127bda92e5b01896df10571424"
>
> -S = "${WORKDIR}/git"
>
>  do_install:append() {
>      sed -i -e 's@${RECIPE_SYSROOT}@@g' ${D}${bindir}/libwmf-config ${D}${libdir}/pkgconfig/libwmf.pc
> diff --git a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb b/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
> index ea51f6cb14..7fff0b96a1 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=
>             file://run-ptest \
>             "
>
> -S = "${WORKDIR}/git"
>
>  # Main dependencies
>  inherit cmake pkgconfig lib_package ptest multilib_header
> diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
> index 53023b99a0..4911cebd16 100644
> --- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
> +++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
> @@ -21,7 +21,7 @@ SRC_URI = "\
>
>  SRC_URI[sha256sum] = "bd4d4b7e37da02fc67e47ddf20b6f1243c0a7af7b02b918d5e72138ea8727547"
>
> -S = "${WORKDIR}/linuxconsoletools-${PV}"
> +S = "${UNPACKDIR}/linuxconsoletools-${PV}"
>
>  inherit systemd pkgconfig
>
> diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
> index 4557ed0a80..6d5399c8d0 100644
> --- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
> +++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
> @@ -17,7 +17,6 @@ SRC_URI = " \
>  "
>
>  SRCREV = "e046b69a3736d314fad813e159b1c192eaef92cd"
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-extended/md5deep/md5deep_git.bb b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> index 5351a37db6..4b7192290e 100644
> --- a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> +++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> @@ -13,6 +13,5 @@ SRC_URI = "git://github.com/jessek/hashdeep.git;branch=master;protocol=https \
>             file://0001-Fix-literal-and-identifier-spacing-as-dictated-by-C-.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> index 44daf94c98..ab08322805 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> +++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> @@ -58,7 +58,6 @@ SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765
>  # libsodium: 1.0.19
>  SRC_URI[libsodium.sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
>
> -S = "${UNPACKDIR}/git"
>
>  inherit pkgconfig cmake systemd
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> index c3804ec64d..ceb81d07e5 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> @@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef495d4997154d
>  UPSTREAM_CHECK_URI = "https://tracker.debian.org/pkg/mozjs128"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/firefox-${PV}"
> +S = "${UNPACKDIR}/firefox-${PV}"
>
>  inherit pkgconfig perlnative python3native rust cargo
>
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
> index df487bd769..b53be9803e 100644
> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
>             file://0002-gpio-Include-limits.h-for-PATH_MAX.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  # CMakeLists.txt checks the architecture, only x86 and ARM supported for now
>  COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
> diff --git a/meta-oe/recipes-extended/nana/nana_git.bb b/meta-oe/recipes-extended/nana/nana_git.bb
> index d292bb8827..bad5a797a7 100644
> --- a/meta-oe/recipes-extended/nana/nana_git.bb
> +++ b/meta-oe/recipes-extended/nana/nana_git.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/pjmaker/nana;protocol=https;branch=master \
>      file://0001-Makefile.am-fix-build-with-separate-build-dir.patch \
>      file://0002-man-Makefile.am-we-seem-not-to-need-the-work-around-.patch \
>  "
> -S = "${WORKDIR}/git"
>
>  LICENSE = "BSD-2-Clause"
>
> diff --git a/meta-oe/recipes-extended/networking/mstpd_git.bb b/meta-oe/recipes-extended/networking/mstpd_git.bb
> index e6e1f9a3b2..b003b52d25 100644
> --- a/meta-oe/recipes-extended/networking/mstpd_git.bb
> +++ b/meta-oe/recipes-extended/networking/mstpd_git.bb
> @@ -9,7 +9,6 @@ SRC_URI = " \
>      file://mstpd.service \
>  "
>  SRCREV = "181c453fc1a00573e19f14960dcc54ad84beea7c"
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+){2,})"
>
> diff --git a/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb b/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
> index aa6b120037..18a45a3342 100644
> --- a/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
> +++ b/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
> @@ -24,7 +24,7 @@ SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
>
>  SRC_URI[sha256sum] = "ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82"
>
> -S = "${WORKDIR}/newt-${PV}"
> +S = "${UNPACKDIR}/newt-${PV}"
>
>  inherit autotools-brokensep python3native python3-dir python3targetconfig
>
> diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
> index d8dda6d090..970d7fb5fc 100644
> --- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
> +++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
> @@ -24,7 +24,6 @@ SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
>             file://0001-Link-with-libm-for-floor-function.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d4f53d4c6cf73b9d43186ce3be6dd0ba"
> diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
> index 0667fd670f..c33624987a 100644
> --- a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
> +++ b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
> @@ -24,7 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
>             "
>  SRC_URI[sha256sum] = "54e3387dee1ff16031a0679aca2b60da90ab7f4a26c211822333c7f23000abee"
>
> -S = "${WORKDIR}/libostree-${PV}"
> +S = "${UNPACKDIR}/libostree-${PV}"
>
>  inherit autotools bash-completion gobject-introspection github-releases gtk-doc manpages pkgconfig ptest-gnome systemd
>
> diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> index dc7280f099..e69d544b66 100644
> --- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> +++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> @@ -9,7 +9,6 @@ PV = "2.1.0.1+git"
>  SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
>  SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> index 1637389dba..ab5a8ef342 100644
> --- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> @@ -18,7 +18,6 @@ SRC_URI = "git://github.com/PADL/pam_ccreds;branch=master;protocol=https \
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
> index d5137f80af..2886137b7d 100644
> --- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
> @@ -13,7 +13,6 @@ REQUIRED_DISTRO_FEATURES = "pam"
>  SRCREV = "3e026863cad1fd45c760ee1bc93ef4f0606cc852"
>  SRC_URI = "git://github.com/rmbreak/pam_ldapdb;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  do_install () {
>      oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
> diff --git a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
> index 6633656cea..0e2199b066 100644
> --- a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
> +++ b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
>  SRC_URI = "git://github.com/FreeRADIUS/pam_radius.git;protocol=https;branch=master"
>  SRCREV = "b6442c3e0147f1019990520483fa3a30e4ccf059"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "libpam"
>
> diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
> index 609d2902c0..d14a20609a 100644
> --- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
> +++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
> @@ -25,7 +25,7 @@ RDEPENDS:${PN} += "openssh-misc"
>
>  # Kind of unfortunate to have underscores in the name.
>  #
> -S = "${WORKDIR}/pam_ssh_agent_auth-${PV}"
> +S = "${UNPACKDIR}/pam_ssh_agent_auth-${PV}"
>
>  inherit autotools-brokensep perlnative
>
> diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
> index 917cc694c7..4d540d0180 100644
> --- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
> +++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
> @@ -12,7 +12,6 @@ SRCREV = "be527327653e94b02e711f7eff59285ad13e1db0"
>
>  inherit cmake ptest
>
> -S = "${WORKDIR}/git"
>
>  do_install_ptest () {
>      install -d ${D}${PTEST_PATH}/src/test/pegtl/data
> diff --git a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
> index eeb314fdd4..367aedd4c5 100644
> --- a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
> +++ b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
> @@ -14,7 +14,7 @@ SRC_URI = "https://cpan.metacpan.org/authors/id/M/MJ/MJP/File-FnMatch-${PV}.tar.
>
>  SRC_URI[sha256sum] = "962454b8e86bea8b132bf8af35757d0c6a8f5d599015bd6a5d68cb7ae7a9e916"
>
> -S = "${WORKDIR}/File-FnMatch-${PV}"
> +S = "${UNPACKDIR}/File-FnMatch-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
> index 7baa7945b5..5aba331acc 100644
> --- a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
> @@ -9,7 +9,6 @@ DEPENDS = "ndctl"
>  # Required to have the fts.h header for musl
>  DEPENDS:append:libc-musl = " fts"
>
> -S = "${WORKDIR}/git"
>
>  SRC_URI = "git://github.com/pmem/pmdk.git;branch=master;protocol=https"
>  SRCREV = "0f0ab391d8e3db52f745f33c92b9d9a462bb3695"
> diff --git a/meta-oe/recipes-extended/polkit/polkit_126.bb b/meta-oe/recipes-extended/polkit/polkit_126.bb
> index c503ca9dc4..0438c4e464 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_126.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_126.bb
> @@ -7,7 +7,6 @@ BUGTRACKER = "https://github.com/polkit-org/polkit/issues"
>
>  SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "d627b0d1e1108563658dabe3fb8d2a065e64df10"
>
>  DEPENDS = "expat glib-2.0 duktape"
> diff --git a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> index 029ec2337e..20b7f0a5bd 100644
> --- a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> +++ b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/lib-cpp/${BPN}.git;branch=master;protocol=https"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  do_configure:prepend() {
>      echo " " > ${S}/tests/CMakeLists.txt
> diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-extended/qad/qad_git.bb
> index c68469fce5..189d2f9d15 100644
> --- a/meta-oe/recipes-extended/qad/qad_git.bb
> +++ b/meta-oe/recipes-extended/qad/qad_git.bb
> @@ -17,7 +17,6 @@ SRCREV = "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>  PV = "0.0+git"
>
>  DEPENDS = "cjson libmicrohttpd libdrm libpng"
> diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
> index b04d8df131..00cae11c4e 100644
> --- a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
> +++ b/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master
>
>  SRCREV = "4487f10e1bf258434fb8a39e4f59c29e31910ad0"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> index 2b09b6bcad..c7f320660f 100644
> --- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> +++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> @@ -24,7 +24,7 @@ SRC_URI += "file://0001-rarpd.8-add-man-file.patch \
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://rarpd.c;md5=199b20b172ea93121bc613a9c77b6931"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  EXTRA_OEMAKE = "-e MAKEFLAGS="
>
> diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
> index 3e757e6037..d643c6f0b9 100644
> --- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
> +++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https
>             file://0001-CMakeLists.txt-fix-substitution-for-static-libs.patch"
>  SRCREV = "ad6baa121f4c6fbc7622d83d606210ac22549c78"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
> index 330647a210..69c281bd92 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
> @@ -13,7 +13,6 @@ SRC_URI = "\
>      git://github.com/oetiker/rrdtool-1.x.git;protocol=https;branch=master \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit cpan autotools-brokensep gettext pkgconfig python3native python3-dir systemd
>
> diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
> index 967018ca1f..f1235d7b96 100644
> --- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=master
>
>  SRCREV = "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
>
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "rsyslog:libfastjson"
>
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> index 343a2c2840..3ccb87a9c5 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> @@ -17,7 +17,6 @@ SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
>
>  SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
>
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "rsyslog:librelp"
>
> diff --git a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
> index 8da180ac05..fe8592be39 100644
> --- a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
> +++ b/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
> @@ -19,7 +19,6 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
>             "
>  SRCREV = "70c268a07273da78a4aadd14c40ffb75138ccebe"
>
> -S = "${WORKDIR}/git"
>
>  CVE_STATUS[CVE-2012-5638] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
>
> diff --git a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
> index 29b01d5bf4..03d8d4940c 100644
> --- a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
> +++ b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
> @@ -9,7 +9,7 @@ SECTION = "Development/Libraries"
>
>  DEPENDS = "cmpi-bindings"
>
> -S = "${WORKDIR}/sblim-sfcCommon-${PV}"
> +S = "${UNPACKDIR}/sblim-sfcCommon-${PV}"
>  SRC_URI = "http://downloads.sourceforge.net/sblim/sblim-sfcCommon-${PV}.tar.bz2"
>  SRC_URI[sha256sum] = "b9b1037173d6ae0181c3bd5a316ddab5afd6a342ad0dbdc18e940fc0ad2c3297"
>
> diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> index 64d5111f45..e8987b2dd0 100644
> --- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> +++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> @@ -14,6 +14,5 @@ SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git;branch=master;proto
>             file://0001-Fix-build-on-big-endian-architectures.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep
> diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
> index 98e22f1164..1b3a484ccb 100644
> --- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
> +++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
> @@ -8,7 +8,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.ta
>             "
>  SRC_URI[sha256sum] = "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4a7363d990fc0270b"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE_GPL;md5=393a5ca445f6965873eca0259a17f833"
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> index bc3bc3aa47..2a49ba99b0 100644
> --- a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> @@ -15,7 +15,6 @@ SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main \
>
>  SRCREV = "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> index fa43c9de58..530e38ce21 100644
> --- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https;branch=master"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit module
>
> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> index 63c1e130ad..5dc41bcb93 100644
> --- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master \
>
>  SRCREV = "01083a64ebf28cc716efe2d2fd51c141042ae34b"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig update-alternatives
>
> diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
> index 6989531c81..b92b8086d6 100644
> --- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
> +++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=https;branch
>
>  inherit update-alternatives
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
> index f45c2d750d..535f37f84c 100644
> --- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
> +++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
> @@ -9,7 +9,6 @@ SRCREV = "077def398ad303043d73339112968e5112d8d7c8"
>
>  SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
> index 4e58c76460..ba69875c93 100644
> --- a/meta-oe/recipes-extended/socketcan/socketcand_git.bb
> +++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = " \
>
>  SRC_URI = "git://github.com/linux-can/socketcand;branch=master;protocol=https"
>  SRCREV = "998b0394d028e791aa97d549bfc686b4fbadf5ee"
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
> index 9b95c14de0..a4f27f5e30 100644
> --- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
> +++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
> @@ -33,7 +33,6 @@ SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
>
>  SRCREV_FORMAT = "sysdig_falco"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = "\
>                  -DBUILD_DRIVER=OFF \
> diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> index 71b62cc513..a4bf3eaaca 100644
> --- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> @@ -18,7 +18,6 @@ DEPENDS += "libdaemon"
>
>  RDEPENDS:${PN} = "iproute2-tipc"
>
> -S = "${WORKDIR}/git"
>
>  do_configure:prepend() {
>      ( cd ${S}; ${S}/bootstrap )
> diff --git a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
> index 4e66d8d05a..5fb28b0085 100644
> --- a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
> +++ b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
> @@ -12,6 +12,5 @@ SRC_URI = "\
>
>  SRCREV = "5e00bfa5e137e76c81888727712ced2b3fd99f5b"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig autotools
> diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> index 5eb8e4d9aa..1a453ebe10 100644
> --- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> +++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> @@ -9,7 +9,6 @@ SRCREV = "44a173195986d0d853316cb02a58785ded66c12b"
>  PV = "0.5.0+git"
>  SRC_URI = "git://github.com/wertarbyte/${BPN}.git;branch=debian;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig perlnative update-rc.d systemd
>
> diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
> index 09797124c5..0e189b558f 100644
> --- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
> +++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cd
>
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/user-mode-linux/files/tools/1/"
>
> -S = "${WORKDIR}/tools"
> +S = "${UNPACKDIR}/tools"
>
>  inherit update-alternatives
>
> diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
> index 3aa766d0bd..616f4ca09a 100644
> --- a/meta-oe/recipes-extended/upm/upm_git.bb
> +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> @@ -21,7 +21,6 @@ SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
>
>  SRC_URI:append:toolchain-clang:x86 = " file://0001-nmea_gps-Link-with-latomic.patch "
>
> -S = "${WORKDIR}/git"
>
>  # Depends on mraa which only supports x86 and ARM for now
>  COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
> diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb b/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
> index 1686e533af..35b3d3c4a7 100644
> --- a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
> +++ b/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
> @@ -19,7 +19,6 @@ SRC_URI = " \
>  "
>  SRCREV = "fcd8bc3ee40f5d7841b7d5a8f3cd12252fec14e4"
>
> -S = "${WORKDIR}/git"
>
>  RPROVIDES:${PN} = "virtual-redis"
>
> diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
> index 92a9bbb499..01215a4b25 100644
> --- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
> +++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
> @@ -13,7 +13,7 @@ SRC_URI = "https://releases.pagure.org/volume_key/volume_key-${PV}.tar.xz \
>  SRC_URI[sha256sum] = "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4aeb473a9cd77309b"
>
>  SRCNAME = "volume_key"
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  inherit autotools python3native python3targetconfig gettext pkgconfig
>
> diff --git a/meta-oe/recipes-extended/wipe/wipe_0.24.bb b/meta-oe/recipes-extended/wipe/wipe_0.24.bb
> index ad32cb0e72..ba3ed29d59 100644
> --- a/meta-oe/recipes-extended/wipe/wipe_0.24.bb
> +++ b/meta-oe/recipes-extended/wipe/wipe_0.24.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/berke/wipe.git;branch=master;protocol=https \
>  "
>  SRCREV = "796b62293e007546e051619bd03f5ba338ef28e5"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "linux"
>
> diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
> index d4a8b49e1d..b901e8815a 100644
> --- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
> +++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
> @@ -10,7 +10,6 @@ SRCREV = "493e9704dbc50f141d5fbd41c823311e79d7e8d3"
>  SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https \
>             file://0001-include-libgen.h-for-basename.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig systemd features_check
>
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
> index 1ef707ca60..2cd154cab6 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
> @@ -28,7 +28,6 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https
>             file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
>             "
>  SRCREV = "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> index b75802f09f..f450c2cf01 100644
> --- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> +++ b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  SRCREV = "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
>  SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
> index e4522f89a1..7ec8847187 100644
> --- a/meta-oe/recipes-extended/zram/zram_0.2.bb
> +++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
> @@ -17,8 +17,7 @@ SRC_URI = " \
>             file://dev-zram0.swap \
>  "
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install () {
>      # Install systemd related configuration file
> diff --git a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> index be658561e2..5227b834f9 100644
> --- a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> +++ b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> @@ -17,7 +17,6 @@ UPSTREAM_CHECK_COMMITS = "1"
>
>  inherit autotools
>
> -S = "${WORKDIR}/git"
>  AUTOTOOLS_SCRIPT_PATH = "${S}/src"
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
> index 62ca015309..23e2ff7811 100644
> --- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
> +++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
> @@ -15,7 +15,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI[archive.sha256sum] = "6ec264eaa0c4de0adb7202c600170bde9a7fbe4d466bfbe940eaf7faaa6c5974"
>
> -S = "${WORKDIR}/${GNOMEBN}-${PV}"
> +S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
>
>  EXTRA_OEMESON = "-Dbuild-documentation=false"
>
> diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb b/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
> index 0fd30f7424..bb905265ee 100644
> --- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
> +++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
> @@ -25,7 +25,7 @@ SRC_URI = "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=arc
>  SRC_URI += "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
>  SRC_URI[archive.sha256sum] = "bad10f3c553a0e1854649ab59c5b2434da22ca1a54ae6138f1f53961567e1ab7"
>
> -S = "${WORKDIR}/gcr-${PV}"
> +S = "${UNPACKDIR}/gcr-${PV}"
>
>  PACKAGECONFIG ??= " \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
> index c929763763..650d344a1c 100644
> --- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
> +++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
> @@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
>
>  SRC_URI = "file://gnome-doc-utils.m4"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  PROVIDES = "gnome-doc-utils"
>
> diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
> index b00b4a4679..70da55c137 100644
> --- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
> +++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
> @@ -10,7 +10,6 @@ inherit meson
>
>  SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main;tag=v${PV}"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "c2e74c9d2a5c3895b8025ac1d4b9e4cced71fbe9"
>
>  FILES:${PN} = "${datadir}/themes"
> diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
> index 0e6f4a2ed1..6e31889b69 100644
> --- a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
> +++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
> @@ -12,7 +12,6 @@ SRC_URI = "\
>      file://run-ptest \
>  "
>  SRCREV = "f284d18a694ed98f49ddb06e6920265781a30125"
> -S = "${WORKDIR}/git"
>
>  inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
>
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/recipes-gnome/malcontent/malcontent.inc
> index 68523fa21e..10597f3308 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
> @@ -1,4 +1,3 @@
>  SRC_URI = "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=https;branch=main"
> -S = "${WORKDIR}/git"
>  SRCREV = "21f3ef7b6f984710a23b607d2298fe16e554f0c3"
>  PV = "0.13.0"
> diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
> index 0c9599a49c..b4dc739ec3 100644
> --- a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
> +++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
> @@ -9,4 +9,3 @@ SRC_URI = "git://anongit.freedesktop.org/xdg/pyxdg;branch=master"
>
>  inherit setuptools3
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-graphics/aml/aml_git.bb
> index 2633e0d215..a0b27bd256 100644
> --- a/meta-oe/recipes-graphics/aml/aml_git.bb
> +++ b/meta-oe/recipes-graphics/aml/aml_git.bb
> @@ -10,7 +10,6 @@ SRCREV = "b83f3576ce4187d9285f06e9066ef43a691464d4"
>
>  PV = "0.3.0+git"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
> diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
> index a6872ef0cd..8a8e783309 100644
> --- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
> +++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
> @@ -10,7 +10,7 @@ DEPENDS += "boost cairo libsigc++-3"
>  SRC_URI = "https://www.cairographics.org/releases/cairomm-${PV}.tar.xz"
>  SRC_URI[sha256sum] = "b81255394e3ea8e8aa887276d22afa8985fc8daef60692eb2407d23049f03cfb"
>
> -S = "${WORKDIR}/cairomm-${PV}"
> +S = "${UNPACKDIR}/cairomm-${PV}"
>
>  FILES:${PN}-doc += "${datadir}/devhelp"
>  FILES:${PN}-dev += "${libdir}/cairomm-*/"
> diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb b/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
> index cbcd6c0c6e..b2673f1e9b 100644
> --- a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
> +++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
>  # Tag v0.9.6
>  SRCREV = "144d1e7c29b3b0c6dede7917a0476cc95248559c"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG[build_tests] = "-Dbuild_tests=true,-Dbuild_tests=false,"
>
> diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> index 1ee2657bd0..1018e0675e 100644
> --- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> +++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/lucasdemarchi/dietsplash.git;branch=master;protocol=
>
>  inherit autotools
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF = " --with-systemdsystemunitdir=${systemd_unitdir}/system \
>                   --disable-staticimages --with-rootdir=${root_prefix}"
> diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
> index de91d027e5..f4a257ce89 100644
> --- a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
> +++ b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
> @@ -14,7 +14,7 @@ SRC_URI = " \
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=ecf6fd2b19915afc4da56043926ca18f"
>
> -S = "${WORKDIR}/DirectFB-examples-${PV}"
> +S = "${UNPACKDIR}/DirectFB-examples-${PV}"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
> index 4d962ab5d9..0dc410b2cb 100644
> --- a/meta-oe/recipes-graphics/directfb/directfb.inc
> +++ b/meta-oe/recipes-graphics/directfb/directfb.inc
> @@ -28,7 +28,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
>             file://0001-libdirect-remove-use-of-keyword-register.patch \
>             "
>
> -S = "${WORKDIR}/DirectFB-${PV}"
> +S = "${UNPACKDIR}/DirectFB-${PV}"
>
>  LDFLAGS:append = " -lm"
>
> diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
> index 50504caf9f..ef6dc14ca6 100644
> --- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
> +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=stable-2.x;protocol=
>
>  SRCREV = "abbe08b7a487325182758d5285b54437a914207b"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake gettext pkgconfig python3-dir python3native setuptools3-base mime-xdg
>
> diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> index 9f1cbb47fb..810be40013 100644
> --- a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> +++ b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
>  SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
>  SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
> index efcf5a9ea6..72187696e3 100644
> --- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
> +++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
> @@ -7,7 +7,6 @@ DEPENDS = "libpng zlib"
>  SRC_URI = "git://github.com/GunnarMonell/fbgrab.git;protocol=https;branch=master"
>
>  SRCREV = "f43ce6d5ce48fb01360eaa7c4a92c2573a1d02f8"
> -S = "${WORKDIR}/git"
>
>  do_configure:prepend() {
>      sed \
> diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_git.bb
> index 6c06748499..2736f61004 100644
> --- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
> +++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
> @@ -21,7 +21,6 @@ SRC_URI = "git://github.com/kraxel/fbida;protocol=https;branch=master \
>             file://0001-fbida-Include-missing-sys-types.h.patch \
>  "
>  SRCREV = "eb769e3d7f4a073d4c37ed524ebd5017c6a578f5"
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig features_check
>
> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
> index d470ff12d4..af77ec913e 100644
> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
> @@ -22,7 +22,6 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
>             file://0001-Fix-Translations-containing-invalid-directives-hs.patch \
>             file://CVE-2024-25081_CVE-2024-25082.patch \
>  "
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"
>  PACKAGECONFIG = "readline"
> diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
> index 4db453bc66..c5c547186f 100644
> --- a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
> +++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
> @@ -17,4 +17,3 @@ PV .= "+git"
>  SRC_URI = "git://github.com/HamzaM3/ftgl;protocol=https;branch=master \
>             file://0001-Fix-type-mismatch-with-latest-FreeType.patch"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
> index fcf1bd9cae..959463e962 100644
> --- a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
> +++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
> @@ -41,7 +41,6 @@ SRC_URI = " \
>
>  SRCREV = "7baf540e56fb1a3e91752acba872a88543529d46"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools gettext update-alternatives pkgconfig python3native perlnative features_check
>  # depends on virtual/libx11
> diff --git a/meta-oe/recipes-graphics/glad/glad_2.0.8.bb b/meta-oe/recipes-graphics/glad/glad_2.0.8.bb
> index 4065c27e6f..ea4ee6eac6 100644
> --- a/meta-oe/recipes-graphics/glad/glad_2.0.8.bb
> +++ b/meta-oe/recipes-graphics/glad/glad_2.0.8.bb
> @@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ae570f26774ac096cff8f992091a223c"
>
>  SRC_URI = "git://github.com/Dav1dde/glad.git;protocol=https;branch=glad2"
>  SRCREV = "73db193f853e2ee079bf3ca8a64aa2eaf6459043"
> -S = "${WORKDIR}/git"
>
>  inherit python_setuptools_build_meta
>
> diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> index e313d7a192..e6fd0edd21 100644
> --- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> +++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> @@ -20,7 +20,6 @@ SRC_URI = " \
>  SRCREV = "efec5db081e3aad807d0731e172ac597f6a39447"
>  PV .= "+0.9.9.9+git"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
> index 16ab6d6fd4..ef9b194f9a 100644
> --- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
> +++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
> @@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "${BPN}_(?P<pver>\d+(\.\d+)+)"
>
>  DEPENDS = "gtk+"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  inherit features_check autotools binconfig pkgconfig gettext
>
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
> index 43367aa415..f912686c41 100644
> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
>
>  SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "6201b5f93dcaeafa92fc0ec4ad4baeaf60acf16fc8f019bbf061cf4ebf27938a"
> -S = "${WORKDIR}/${BPN}-gtk3-${PV}"
> +S = "${UNPACKDIR}/${BPN}-gtk3-${PV}"
>
>  DEPENDS = " \
>      gperf-native \
> diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> index 9c9bf10398..66e9f8a0c4 100644
> --- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> @@ -15,7 +15,6 @@ inherit autotools pkgconfig lib_package
>  AUTO_LIBNAME_PKGS = ""
>
>  SRC_URI = "git://git.enlightenment.org/old/legacy-${BPN}.git;protocol=https;branch=master"
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>
> diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
> index 9c6807d7e6..35deb8d2aa 100644
> --- a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
> +++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
> @@ -12,7 +12,6 @@ DEPENDS = " \
>      wayland-protocols \
>  "
>
> -S = "${WORKDIR}/git"
>  SRCREV = "15afd30a6e23e949d022ff18f17dd7fdbd3361e4"
>
>  PACKAGECONFIG ?= "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', d)}"
> diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
> index db648ec8c2..e59de6f0ca 100644
> --- a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
> +++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
> @@ -18,7 +18,7 @@ inherit autotools features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl x11"
>
> -S = "${WORKDIR}/xforms-${PV}"
> +S = "${UNPACKDIR}/xforms-${PV}"
>
>  DEPENDS = "libxpm jpeg libx11 virtual/libgl"
>  RDEPENDS:${PN} = "bash"
> diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> index a737a735b7..f26caf6940 100644
> --- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> +++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> @@ -13,7 +13,6 @@ REQUIRED_DISTRO_FEATURES = "opengl"
>
>  inherit meson pkgconfig features_check
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= "\
>    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
> index 4f702029d9..d707b6c9b4 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
> @@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "dfb15ac5f8ce7a4952dc12d2aed9747518c5e6b335c0e31636d23f93c6
>
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sdlgfx/files/"
>
> -S = "${WORKDIR}/SDL_gfx-${PV}"
> +S = "${UNPACKDIR}/SDL_gfx-${PV}"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
> index 01137bb0ca..29fb8cb4aa 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
> @@ -11,7 +11,7 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.
>             file://configure.patch"
>  SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
>
> -S = "${WORKDIR}/SDL_image-${PV}"
> +S = "${UNPACKDIR}/SDL_image-${PV}"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
> index 35f278c890..d87c15aebc 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
> @@ -10,7 +10,7 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${PV}.tar.
>
>  SRC_URI[sha256sum] = "1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a"
>
> -S = "${WORKDIR}/SDL_mixer-${PV}"
> +S = "${UNPACKDIR}/SDL_mixer-${PV}"
>
>  inherit autotools-brokensep pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
> index 93466872ac..ef4d13ebb6 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
> @@ -14,6 +14,6 @@ SRC_URI = " \
>    file://am_foreign.patch \
>  "
>
> -S = "${WORKDIR}/SDL_net-${PV}"
> +S = "${UNPACKDIR}/SDL_net-${PV}"
>
>  SRC_URI[sha256sum] = "5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4"
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
> index c104444319..2cf3e88f17 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
> @@ -9,7 +9,7 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
>  "
>  SRC_URI[sha256sum] = "724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7"
>
> -S = "${WORKDIR}/SDL_ttf-${PV}"
> +S = "${UNPACKDIR}/SDL_ttf-${PV}"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
> index d3dbf13ae7..c15e986dc3 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
> @@ -9,7 +9,7 @@ DEPENDS = "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
>  SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "2213b56fdaff2220d0e38c8e420cbe1a83c87374190cba8c70af2156097ce30a"
>
> -S = "${WORKDIR}/SDL2_image-${PV}"
> +S = "${UNPACKDIR}/SDL2_image-${PV}"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
> index b24c8782cf..46e6ba0774 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
>  SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "cb760211b056bfe44f4a1e180cc7cb201137e4d1572f2002cc1be728efd22660"
>
> -S = "${WORKDIR}/SDL2_mixer-${PV}"
> +S = "${UNPACKDIR}/SDL2_mixer-${PV}"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
> index d26a545f83..4a7ada94cb 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=68a088513da90254b2fbe664f42af315"
>  SRC_URI = " \
>    https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz \
>  "
> -S = "${WORKDIR}/SDL2_net-${PV}"
> +S = "${UNPACKDIR}/SDL2_net-${PV}"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
> index 35870c4814..8122b88a68 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -31,7 +31,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>
>  UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
>
> -S = "${WORKDIR}/SDL-${PV}"
> +S = "${UNPACKDIR}/SDL-${PV}"
>
>  SRC_URI[sha256sum] = "d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00"
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> index 7e3a06f34f..3b17f350df 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=98241180d857fe975e4b60d44d6c01a5"
>
>  SRC_URI = "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "27e845b1b7dc0a91a85f1a1f18892ed205adb38caf767741eb258008d8264de0"
> -S = "${WORKDIR}/sdl2-compat-${PV}"
> +S = "${UNPACKDIR}/sdl2-compat-${PV}"
>
>  DEPENDS += "libsdl3"
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
> index 8ef20521a9..ac425f6ad2 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
> @@ -9,7 +9,6 @@ DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp"
>  SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.2.x"
>  SRCREV = "11154afb7855293159588b245b446a4ef09e574f"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
> index f914d1dcff..1f82f95d65 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
> @@ -8,7 +8,7 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL3_ttf-${PV}.tar.gz
>  "
>  SRC_URI[sha256sum] = "63547d58d0185c833213885b635a2c0548201cc8f301e6587c0be1a67e1e045d"
>
> -S = "${WORKDIR}/SDL3_ttf-${PV}"
> +S = "${UNPACKDIR}/SDL3_ttf-${PV}"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
> index 7a2a37f69a..9579cb73a1 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "\
>
>  SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
>
> -S = "${WORKDIR}/SDL3-${PV}"
> +S = "${UNPACKDIR}/SDL3-${PV}"
>
>  SRC_URI[sha256sum] = "6340e58879b2d15830c8460d2f589a385c444d1faa2a4828a9626c7322562be8"
>
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
> index e518461d7d..ff5df428e8 100644
> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
> @@ -47,7 +47,6 @@ inherit cmake
>  SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https"
>  SRCREV = "10e9eb75f73e973725dc75c373de5d89807af028"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
>
> diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
> index 4196449f3a..d7c96492b2 100644
> --- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
> +++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
> @@ -11,7 +11,7 @@ SRC_URI:append:class-target = " file://0001-Fix-the-error-of-can-t-find-header-f
>
>  SRCREV = "e691b563262306a40a61bbf228839fa06e4f0516"
>
> -S = "${WORKDIR}/git/libyui-ncurses"
> +S = "${UNPACKDIR}/${BP}/libyui-ncurses"
>
>  inherit cmake gettext pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb b/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
> index 419a9522a4..d86aa4da91 100644
> --- a/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
> +++ b/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https \
>
>  SRCREV = "e691b563262306a40a61bbf228839fa06e4f0516"
>
> -S = "${WORKDIR}/git/libyui"
> +S = "${UNPACKDIR}/${BP}/libyui"
>
>  inherit cmake gettext pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
> index 1228748701..f2995fb1bc 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
> @@ -24,7 +24,6 @@ require lv-conf.inc
>
>  inherit cmake
>
> -S = "${WORKDIR}/git"
>
>  do_configure:prepend() {
>         if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
> index 935e84ad23..28306a1101 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
> @@ -17,7 +17,6 @@ SRCREV = "7f07a129e8d77f4984fff8e623fd5be18ff42e74"
>  inherit cmake
>
>  EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${baselib} -DBUILD_SHARED_LIBS=ON"
> -S = "${WORKDIR}/git"
>
>  require lv-conf.inc
>
> diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> index 9065050c62..2b26ec57ae 100644
> --- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> +++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/any1/neatvnc;branch=v0.8;protocol=https"
>
>  SRCREV = "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "libdrm pixman aml zlib"
>
> diff --git a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb b/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
> index a44e79362d..c31ad985d9 100644
> --- a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
> +++ b/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
> @@ -5,7 +5,6 @@ SECTION = "graphics"
>  LICENSE = "NCSA"
>  LIC_FILES_CHKSUM = "file://src/nyancat.c;beginline=27;endline=49;md5=285f7ac87da4a631f348800687d845bd"
>
> -S = "${WORKDIR}/git"
>
>  SRCREV = "5ffb6c5c03d0e9156db8f360599d4f0449bb16b9"
>  SRC_URI = " \
> diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/recipes-graphics/openbox/obconf_git.bb
> index 1210af70ea..917492c982 100644
> --- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
> +++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
> @@ -16,7 +16,6 @@ SRC_URI = " \
>      file://0001-Fix-function-protype-visibility.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools gettext pkgconfig mime mime-xdg features_check
>  # depends on openbox, which is X11-only
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
> index 231bf84573..6c383e3423 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https
>             file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
>             "
>  SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
> index 0e88e84aff..d3c96cd66f 100644
> --- a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
> +++ b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
> @@ -15,7 +15,6 @@ SRCREV = "1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e"
>
>  SRC_URI = "git://github.com/notro/panel-mipi-dbi.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>
>  inherit native
>
> diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
> index 896195c57d..d99c6ceac0 100644
> --- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
> +++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
> @@ -12,7 +12,7 @@ inherit gnomebase features_check
>  SRC_URI[archive.sha256sum] = "539f5aa60e9bdc6b955bb448e2a62cc14562744df690258040fbb74bf885755d"
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> -S = "${WORKDIR}/${GNOMEBN}-${PV}"
> +S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
>
>  FILES:${PN} = "${libdir}/lib*.so.*"
>  FILES:${PN}-dev += "${libdir}/*/include/ ${libdir}/pangomm-*/"
> diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
> index 2ec89bc05b..88cdce26d1 100644
> --- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
> +++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
> @@ -10,6 +10,5 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/parallel-deqp-runner.git;protocol=h
>  PV = "2020.06.15+git"
>  SRCREV = "e1642fb691d29b1462504b58916f7f514a963e80"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig meson
> diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
> index 039816e4a0..c794f41370 100644
> --- a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
> +++ b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  SRCREV = "715e29fd4cd71b6e452ae0f4e36d917b43122ce8"
>  SRC_URI = "git://github.com/fukuchi/libqrencode.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
> index 8aab26c824..c5a0cdc6aa 100644
> --- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
> +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
> @@ -8,7 +8,6 @@ SRCREV = "34c3c40787f440da9c2947cd63a41e6c4d1f95b9"
>  SRC_URI = " \
>      git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
>  "
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms"
>
> diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
> index bf3070701f..567f7a55e8 100644
> --- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
> +++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
> @@ -4,7 +4,6 @@ LICENSE  = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SECTION = "graphics"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "f09ba2777714871bddb70d049878af34b94fa54d"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=master;protocol=https"
>  inherit cmake pkgconfig
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> index 4d9d4d3dd0..258c78e509 100644
> --- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
> +++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
>             "
>  SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'soup3', 'file://0001-config.mk-Fix-compiler-and-linker.patch file://0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch', '', d)}"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig features_check
>
> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> index 0d45ee765c..f4923f3f00 100644
> --- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> +++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRCREV = "4767ea922bcc460e70b87b1d303ebdfed0897da8"
>  SRC_URI = "git://github.com/tesseract-ocr/tessdata.git;branch=main;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit allarch
>
> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
> index 213dfada23..4bc0f5b88f 100644
> --- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
> +++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRCREV = "3b7c70e34dea179549ed3e995872e2e019eb8477"
>  SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "leptonica"
>
> diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
> index 98777970b0..dd4f79c314 100644
> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
> @@ -7,7 +7,6 @@ RDEPENDS:${PN} = "coreutils hicolor-icon-theme perl bash xkbcomp"
>
>  LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools cmake features_check pkgconfig systemd
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
> index 15449b216a..38a5126eea 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
> @@ -12,7 +12,7 @@ SRC_URI = " \
>      file://44-source-code-pro-fonts-fontconfig.conf \
>  "
>  SRC_URI[sha256sum] = "da2ac159497d31b0c6d9daa8fc390fb8252e75b4a9805ace6a2c9cccaed4932e"
> -S = "${WORKDIR}/source-code-pro-2.030R-ro-1.050R-it"
> +S = "${UNPACKDIR}/source-code-pro-2.030R-ro-1.050R-it"
>
>  UPSTREAM_CHECK_URI = "https://github.com/adobe-fonts/source-code-pro/tags"
>  UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+\.\d+)R"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
> index beb2cf2ff7..4a3b8e471e 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://OFL.txt;md5=6c56db018aa8803f8aff326829e3ce32"
>
>  SRCNAME = "AbyssinicaSIL"
>  SRC_URI = "http://software.sil.org/downloads/r/abyssinica/${SRCNAME}-${PV}.zip"
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  UPSTREAM_CHECK_URI = "https://software.sil.org/abyssinica/download/"
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> index ea734182de..82b2541a60 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
> @@ -8,7 +8,7 @@ RPROVIDES:${PN} = "virtual-chinese-font"
>  FONT_PACKAGES = "${PN}"
>
>  SRC_URI = "https://deb.debian.org/debian/pool/main/f/fonts-arphic-uming/fonts-arphic-uming_0.2.${PV}.2.orig.tar.bz2"
> -S = "${WORKDIR}/ttf-arphic-uming-0.2.20080216.2"
> +S = "${UNPACKDIR}/ttf-arphic-uming-0.2.20080216.2"
>
>  require ttf.inc
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
> index 90a11ca4d6..9dc23fc4c7 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
> @@ -17,7 +17,7 @@ RDEPENDS:${PN}-common = ""
>  SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \
>             file://30-dejavu-aliases.conf"
>
> -S = "${WORKDIR}/dejavu-fonts-ttf-${PV}/ttf"
> +S = "${UNPACKDIR}/dejavu-fonts-ttf-${PV}/ttf"
>
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/dejavu/files/dejavu/"
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> index cc9213ec5b..06ab2a7921 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> @@ -9,7 +9,7 @@ PV = "0.1+git"
>
>  SRC_URI = "git://github.com/android/platform_frameworks_base.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git/data/fonts"
> +S = "${UNPACKDIR}/${BP}/data/fonts"
>
>  do_install:append() {
>      for f in Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf DroidSansThai.ttf \
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> index 84cd30d3c0..f50da65ddc 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://OFL;md5=33a5bf7b98a9c0ae87430760ba762295 \
>
>  SRC_URI = "https://archive.debian.org/debian/pool/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz "
>
> -S = "${WORKDIR}/ttf-sil-gentium-${PV}"
> +S = "${UNPACKDIR}/ttf-sil-gentium-${PV}"
>
>  do_install:append() {
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
> index c142f1dd02..1d7488186e 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
> @@ -23,8 +23,7 @@ SRC_URI = "git://github.com/google/fonts.git;protocol=https;branch=main;subpath=
>             git://github.com/google/fonts.git;protocol=https;branch=main;subpath=ofl/firasanscondensed;name=firasanscondensed \
>             git://github.com/google/fonts.git;protocol=https;branch=main;subpath=ofl/firasansextracondensed;name=firasansextracondensed"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install:append() {
>      install -d ${D}${datadir}/fonts/truetype/
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
> index 8101c7d7a0..373bdb4bde 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://../COPYRIGHT.TXT;md5=70d34478e38b1ad9995079f9921f9ef7
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
>
> -S = "${WORKDIR}/hunkyfonts-${PV}/TTF"
> +S = "${UNPACKDIR}/hunkyfonts-${PV}/TTF"
>
>  PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
>  FONT_PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
> index 85a64000ee..af726f4082 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
> @@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/OFL.txt;md5=969851e3a70122069a4d9ee61dd5
>  SRC_URI = "http://levien.com/type/myfonts/Inconsolata.otf \
>      file://OFL.txt"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  FILES:${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \
>      ${datadir}/doc/ttf-inconsolata/*"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
> index 89c48d5fe2..165ea7576a 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
> @@ -10,7 +10,7 @@ SRC_URI = "https://moji.or.jp/wp-content/ipafont/IPAfont/IPAfont00303.zip "
>
>  SRC_URI[sha256sum] = "f755ed79a4b8e715bed2f05a189172138aedf93db0f465b4e20c344a02766fe5"
>
> -S = "${WORKDIR}/IPAfont00303"
> +S = "${UNPACKDIR}/IPAfont00303"
>
>  PACKAGES = "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
>  FONT_PACKAGES = "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
> index ab7308e735..bb2930ae0b 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
> @@ -15,7 +15,7 @@ SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${P
>
>  SRC_URI[sha256sum] = "61a7e2b6742a43c73e8762cdfeaf6dfcf9abdd2cfa0b099a9854d69bc4cfee5c"
>
> -S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
> +S = "${UNPACKDIR}/liberation-fonts-ttf-${PV}"
>
>  do_install:append () {
>      install -d ${D}${datadir}/fonts/TTF/
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
> index 7b0828574c..92717da32f 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
> @@ -11,7 +11,6 @@ SRCREV = "4b0192046158094654e865245832c66d2104219e"
>  SRC_URI = "git://github.com/liberationfonts/liberation-fonts.git;branch=main;protocol=https"
>
>  DEPENDS = "fontforge-native"
> -S = "${WORKDIR}/git"
>
>  PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
>  FONT_PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
> index 65d0f0bb35..00d0265aa5 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
> @@ -10,8 +10,7 @@ SRC_URI[sha256sum] = "de5750f7048973f851961050f76b8b58e9bda400d5007c3078d9317fbe
>
>  DEPENDS = "fontforge-native"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>  FONT_PACKAGES = "${PN}"
>  FILES:${PN} = "${datadir}"
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
> index 8340cccbb4..43ec61772b 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
> @@ -11,7 +11,6 @@ SRCREV = "a403c9b7f509dad5e58dde85ef63b1c36fde3a21"
>  SRC_URI = "git://github.com/pravins/lohit.git;branch=master;protocol=https"
>
>  DEPENDS = "fontforge-native"
> -S = "${WORKDIR}/git"
>  FONT_PACKAGES = "${PN}"
>  FILES:${PN} = "${datadir}"
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> index 4adada04fa..1ae1d1a2b4 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
>                      file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
>  "
>  SRC_URI = "http://downloads.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
> -S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
> +S = "${UNPACKDIR}/mplus-TESTFLIGHT-${PV}"
>
>  PACKAGESPLITFUNCS:prepend = "split_ttf_mplus_packages "
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> index 9d6a9a6c2e..b5dae22a9d 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> @@ -11,7 +11,6 @@ SRCREV = "aac7ccaa4d1dea4543453b96f7d6fc47066a57ff"
>  PACKAGES = "${PN}-color ${PN}-regular"
>  FONT_PACKAGES = "${PN}-color ${PN}-regular"
>
> -S = "${WORKDIR}/git"
>
>  FILES:${PN}-color = "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
>  FILES:${PN}-regular = "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
> index 25ce8e930d..0320d30245 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>  SRC_URI = "https://github.com/google/roboto/releases/download/v${PV}/roboto-android.zip"
>  SRC_URI[sha256sum] = "c825453253f590cfe62557733e7173f9a421fff103b00f57d33c4ad28ae53baf"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  FILES:${PN} = "${datadir}/fonts/truetype/*.ttf"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> index 76016c57b9..b72307519c 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
>  RPROVIDES:${PN} = "virtual-japanese-font"
>
>  SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
> -S = "${WORKDIR}/sazanami-20040629"
> +S = "${UNPACKDIR}/sazanami-20040629"
>
>  PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"
>  FONT_PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> index 156dc983d7..b224f46869 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979c
>  SRC_URI = "https://launchpad.net/takao-fonts/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
>  SRC_URI[sha256sum] = "e9871f72ac69acb3e277aebbee7ca01fbebf54800733e29fafdc46133fc3552f"
>
> -S = "${WORKDIR}/TakaoFonts_00303.01"
> +S = "${UNPACKDIR}/TakaoFonts_00303.01"
>
>  PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
>  FONT_PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
> index 8512b1fd19..ff89f7466a 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "61a2b342526fd552f19fef438bb9211a8212de19ad96e32a1209c039f1
>  UPSTREAM_CHECK_URI = "https://repology.org/project/fonts:ubuntu/packages"
>  UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/ubuntu-font-family-${PV}"
> +S = "${UNPACKDIR}/ubuntu-font-family-${PV}"
>
>  PACKAGES = "ttf-ubuntu-mono ttf-ubuntu-sans"
>  FONT_PACKAGES = "ttf-ubuntu-mono ttf-ubuntu-sans"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
> index 4cc5afd4a7..c7be162b1b 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
> @@ -12,7 +12,7 @@ SRC_URI = "https://osdn.jp/dl/vlgothic/VLGothic-${PV}.tar.xz"
>
>  SRC_URI[sha256sum] = "297a3813675fbea12c5813b55a78091c9a5946515ecbf9fde8b8102e01c579f4"
>
> -S = "${WORKDIR}/VLGothic"
> +S = "${UNPACKDIR}/VLGothic"
>
>  do_install:append () {
>      install -D -m644 ${S}/LICENSE_E.mplus ${D}${datadir}/licenses/${PN}/COPYING_MPLUS.txt
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
> index dc85617a9b..8d721d00ad 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "e4b7e306475bf9427d1757578f0e4528930c84c44eaa3f167d4c42f110
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/wqy/files/wqy-zenhei/"
>  UPSTREAM_CHECK_REGEX = "wqy-zenhei/(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/wqy-zenhei"
> +S = "${UNPACKDIR}/wqy-zenhei"
>
>  do_install:append () {
>      sed -i -e '/<string>[^W]/d' ${S}/44-wqy-zenhei.conf
> diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
> index e80aebc89b..5aea738c15 100644
> --- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
> +++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
> @@ -14,7 +14,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
>
>  DEPENDS = "libev libx11 libxi libxfixes"
>
> -S = "${WORKDIR}/git"
>
>  do_install:append() {
>      # LICENSE is installed to /usr/share/licenses but we don't want it in the package
> diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
> index db3c045588..3ba561a54e 100644
> --- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
> +++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
> @@ -8,7 +8,6 @@ DEPENDS = "virtual/libx11 libxext xorgproto"
>  SRCREV = "79f1506a3307d3275b0fdfb2e110c173f68e6f78"
>  SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit features_check meson pkgconfig
>
> diff --git a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
> index 3f44e537a4..a7db743239 100644
> --- a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
> +++ b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
> @@ -15,6 +15,5 @@ RDEPENDS:${PN} = "libvdpau"
>  SRCREV = "d3c5bd63bf8878d59b22d618d2bb5116db392d28"
>  SRC_URI = "git://anongit.freedesktop.org/vdpau/vdpauinfo;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index 02af1c6ed0..1cc2da7a49 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -12,7 +12,6 @@ SRC_URI:append:toolchain-clang = "file://fix-clang-private-operator.patch"
>
>  SRCREV_FORMAT = "vk-gl-cts"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig cmake cmake-qemu features_check python3native
>
> diff --git a/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb b/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
> index a2705785ae..764616906f 100644
> --- a/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
> +++ b/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
> @@ -16,7 +16,6 @@ DEPENDS = " \
>
>  SRC_URI = "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "9e0413cbc7d3ae6656266890425f152589ddf74d"
>
>  inherit meson pkgconfig
> diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
> index c1f5f4ed8e..bb909a313a 100644
> --- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
> +++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/NilsBrause/waylandpp.git;protocol=https;branch=maste
>  DEPENDS = "pugixml"
>  DEPENDS:append:class-target = " waylandpp-native wayland virtual/egl virtual/libgles2"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "4321ed5c7b4bffa41b8a2a13dc7f3ece1191f4f3"
>
>  inherit cmake pkgconfig features_check
> diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> index 74f80e1844..1493eed7af 100644
> --- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> +++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/LibVNC/x11vnc;branch=master;protocol=https \
>             file://starting-fix.patch \
>             file://CVE-2020-29074.patch \
>             "
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "\
>         jpeg \
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
> index 8b4526fc5e..8fd2ae2e84 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
> @@ -9,6 +9,5 @@ DEPENDS += "virtual/libx11 libdrm xorgproto"
>  SRCREV = "8bbdb2ae3bb8ef649999a8da33ddbe11a04763b8"
>  SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} += "xserver-xorg-module-exa"
> diff --git a/meta-oe/recipes-graphics/yad/yad_6.0.bb b/meta-oe/recipes-graphics/yad/yad_6.0.bb
> index 9e46215fd8..64c12f5904 100644
> --- a/meta-oe/recipes-graphics/yad/yad_6.0.bb
> +++ b/meta-oe/recipes-graphics/yad/yad_6.0.bb
> @@ -13,6 +13,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
>
>  DEPENDS = "gtk+3 glib-2.0-native intltool-native"
>
> -S = "${WORKDIR}/git"
>
>  FILES:${PN} += "${datadir}/icons/"
> diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> index 3acf70235e..7562271d90 100644
> --- a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> +++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> @@ -8,7 +8,6 @@ PV = "1.0.4+git"
>  SRC_URI = "git://github.com/ReimuNotMoe/ydotool;protocol=https;branch=master"
>  SRCREV = "0c295346d55afcc6aebaaee564333b3e1efabcbd"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake systemd
>
> diff --git a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
> index 0e17800c4b..3bbfe4cf9f 100644
> --- a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
> +++ b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git;protoc
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -S = "${WORKDIR}/git"
>
>  do_install () {
>      install -d ${D}${bindir}
> diff --git a/meta-oe/recipes-kernel/blktests/blktests.bb b/meta-oe/recipes-kernel/blktests/blktests.bb
> index 2fb6db9184..ded03a4de2 100644
> --- a/meta-oe/recipes-kernel/blktests/blktests.bb
> +++ b/meta-oe/recipes-kernel/blktests/blktests.bb
> @@ -10,7 +10,6 @@ SRC_URI = " \
>         git://github.com/osandov/blktests.git;nobranch=1;protocol=https \
>         "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep
>
> diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
> index 4b6026ebc0..fe980e3e6f 100644
> --- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
> +++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
> @@ -14,7 +14,6 @@ SRCREV = "a0eb4805dbb232f02f156b9351a23790c1a4cec7"
>
>  PE = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit allarch
>
> diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
> index 45fc9cd1fd..f3415a04ee 100644
> --- a/meta-oe/recipes-kernel/crash/crash.inc
> +++ b/meta-oe/recipes-kernel/crash/crash.inc
> @@ -14,7 +14,6 @@ DEPENDS = "zlib readline coreutils-native ncurses-native"
>
>  INC_PR = "r1"
>
> -S = "${WORKDIR}/git"
>  SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=https \
>             ${GNU_MIRROR}/gdb/gdb-10.2.tar.gz;name=gdb;subdir=git \
>             file://7001force_define_architecture.patch \
> diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
> index 035ccd58a7..b1ff8d4019 100644
> --- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
> +++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
>  SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main;tag=v${PV}"
>  SRCREV = "8209a147fb61deed38ca376d063bbff0343ca234"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "\
>      autoconf-native \
> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> index 5095dbb253..b5b8075fd7 100644
> --- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> @@ -35,7 +35,6 @@ IANA_ENTERPRISE_NUMBERS ?= ""
>  #IANA_ENTERPRISE_NUMBERS = "http://www.iana.org/assignments/enterprise-numbers.txt;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
>  #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 3a058cd286..d4565091fb 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>
>  DEPENDS = "rsync-native llvm-native"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  # for musl libc
>  SRC_URI:append:libc-musl = "\
> @@ -46,7 +45,7 @@ do_compile[depends] += "virtual/kernel:do_install"
>
>  inherit linux-kernel-base module-base kernel-arch ptest siteinfo
>
> -S = "${WORKDIR}/${BP}"
> +S = "${UNPACKDIR}/${BP}"
>
>  DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
>
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
> index 4d187200ec..b8ef092262 100644
> --- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
> @@ -22,7 +22,6 @@ EXTRA_OEMAKE = " \
>         CC='${CC}' \
>         "
>
> -S = "${WORKDIR}/git"
>
>  do_install () {
>         oe_runmake install
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> index ba3983e6ff..6521830b7a 100644
> --- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> @@ -6,6 +6,5 @@ SRCREV = "0c3c21930895f6582a5c9d9d797f7e11ff41ffb2"
>
>  PV = "0.9.1"
>
> -S = "${WORKDIR}/git"
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
> index ff54d72bca..1a90dcf998 100644
> --- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
> +++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
> @@ -14,7 +14,6 @@ SRC_URI = " \
>         file://0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch \
>         "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig systemd
>
> diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
> index 45caca0114..36312c386b 100644
> --- a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
> +++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
> @@ -17,7 +17,7 @@ SRCREV = "09b9e83102eb8ab9e540d36b4559c55f3bcdb95d"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
>
> -S = "${WORKDIR}/git/src"
> +S = "${UNPACKDIR}/${BP}/src"
>
>  EXTRA_OEMAKE += "DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
>  EXTRA_OEMAKE:append:class-native = " UAPIDIR=${includedir}"
> diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb b/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb
> index be0659ad2a..f87502930e 100644
> --- a/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb
> +++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb
> @@ -26,7 +26,7 @@ EXTRA_OEMAKE:append:powerpc64 = " ARCH=\"powerpc\" BITMODE=\"64\""
>  EXTRA_OEMAKE:append:powerpc64le = " ARCH=\"powerpc\" BITMODE=\"64\""
>  EXTRA_OEMAKE:append:aarch64 = " ARCH=\"arm64\""
>
> -S = "${WORKDIR}/libpfm-${PV}"
> +S = "${UNPACKDIR}/libpfm-${PV}"
>
>  do_install () {
>         oe_runmake install
> diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
> index 66869b29a9..6b9e8b9b38 100644
> --- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
> +++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
> @@ -13,7 +13,6 @@ SRCREV = "417c2e3aa21af670cc5c13db633dd35292f2d0fa"
>  SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
>             file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
>             "
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
> index 90e847c137..4073381899 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
> @@ -18,7 +18,6 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
>             file://0001-corestripper-Fix-uninitialized-warning.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  SYSTEMD_SERVICE:${PN} = "minicoredumper.service"
>  SYSTEMD_AUTO_ENABLE = "enable"
> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
> index 037e30abc4..219629d4d7 100644
> --- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
> @@ -9,7 +9,6 @@ SRCREV = "0987732b013936ad771334f51cba31c453c8a9c9"
>  SRC_URI = "git://github.com/intel/pm-graph.git;branch=master;protocol=https \
>             file://0001-Makefile-fix-multilib-build-failure.patch \
>  "
> -S = "${WORKDIR}/git"
>
>  # Apart from the listed RDEPENDS, analyze-suspend depends on some features
>  # provided by the kernel. These options are:
> diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
> index 11c4037b23..6782dec228 100644
> --- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
> +++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;b
>             file://0001-Do-not-emit-useless-rpath.patch"
>  SRCREV = "18233e4c32857cb7ddd4960beeec8360ed834fc5"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "libtraceevent libtracefs zstd xmlto-native asciidoc-native swig-native bison-native flex-native"
>
> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat.bb b/meta-oe/recipes-kernel/turbostat/turbostat.bb
> index 8ac15164d4..a163c4b64e 100644
> --- a/meta-oe/recipes-kernel/turbostat/turbostat.bb
> +++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
> @@ -23,8 +23,7 @@ SRC_URI += "\
>              file://COPYING \
>              "
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  DEPENDS = "libcap"
> diff --git a/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb b/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
> index e7e4ca50af..aae17a9fd7 100644
> --- a/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
> +++ b/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
> @@ -28,7 +28,7 @@ do_configure[depends] += "virtual/kernel:do_shared_workdir"
>
>  # We need to set S, for not being set to STAGING_KERNEL_DIR, and by that
>  # be wiped when we prune dest below. We just set it to usbip-tools-1.0
> -S = "${WORKDIR}/${BP}"
> +S = "${UNPACKDIR}/${BP}"
>
>  # Copy the source files from KERNEL/tools/usb/usbip to ${S}
>  do_configure[prefuncs] += "copy_usbip_source_from_kernel"
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
> index 9a7ee412da..83fcaa248d 100644
> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
> @@ -12,6 +12,5 @@ PV .= "+git"
>  SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https"
>  SRCREV = "673a22a3c7c33e96e2ff7aae7c4d2bc190dfbf92"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
> index da92a80ce0..7f8988c3c3 100644
> --- a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
> +++ b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
> @@ -16,7 +16,6 @@ SRC_URI = " \
>      file://ppc_musl_ucontext.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb b/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
> index a868a2969d..58bbd8cac3 100644
> --- a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
> @@ -9,7 +9,6 @@ DEPENDS = "jack"
>  SRC_URI = "git://github.com/jackaudio/jack-example-tools.git;branch=main;protocol=https"
>  SRCREV = "33de8b4285fa5054af1b37fe0496c110604ed564"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
> index d4e6447aad..3b3ea85349 100644
> --- a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
> @@ -24,7 +24,6 @@ SRCREV = "4f58969432339a250ce87fe855fb962c67d00ddb"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  inherit waf pkgconfig
>
> diff --git a/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb b/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
> index 297b7c01e8..3165736981 100644
> --- a/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
> +++ b/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
> @@ -9,7 +9,6 @@ DEPENDS = "fontconfig freetype fribidi harfbuzz"
>
>  SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=master"
>  SRCREV = "bbb3c7f1570a4a021e52683f3fbdf74fe492ae84"
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
> index 82db2f159e..23487329fb 100644
> --- a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
> +++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
> @@ -21,6 +21,6 @@ UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
>
>  SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
>
> -S = "${WORKDIR}/libid3tag-${PV}"
> +S = "${UNPACKDIR}/libid3tag-${PV}"
>
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
> index 505fca4c8f..2405126e5c 100644
> --- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
> +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
> @@ -13,7 +13,6 @@ SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1 \
>             "
>
>  SRCREV = "4a3b22d2600f92d8706fb72d85d52bfee2acbd54"
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = " \
>         -DCMAKE_BUILD_TYPE=Release \
> diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> index 3f5a052906..0f89574b9a 100644
> --- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> +++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> @@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0
>
>  CVE_PRODUCT:append = " mad_libmad"
>
> -S = "${WORKDIR}/libmad-${PV}"
> +S = "${UNPACKDIR}/libmad-${PV}"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
> index 02958ef023..642f34f71d 100644
> --- a/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
> +++ b/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b365c2155d66e550e1447075d6744a5"
>  SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "65c1d2f78b9f2fb20082c38cbe47c951ad5839345876e46941612ee87f9a7ce1"
>
> -S = "${WORKDIR}/opus-${PV}"
> +S = "${UNPACKDIR}/opus-${PV}"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
> index 6d941ae5d3..fb822d7a0e 100644
> --- a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
> +++ b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
> @@ -14,6 +14,6 @@ UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
>  SRC_URI = "https://ftp.osuosl.org/pub/xiph/releases/opus/libopusenc-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1c19a564fe106cbb9"
>
> -S = "${WORKDIR}/libopusenc-${PV}"
> +S = "${UNPACKDIR}/libopusenc-${PV}"
>
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
> index b8d916e70a..c302f65ed5 100644
> --- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
> +++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
> @@ -8,4 +8,3 @@ inherit cmake pkgconfig
>  SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
>  SRCREV = "bed660f8e530d399c38f27a5a7732f4e79740585"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> index 80c770c3e3..1622a97fe1 100644
> --- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> +++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> @@ -18,7 +18,7 @@ MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.or
>
>  SRC_URI[sha256sum] = "ce95a1c79f6d18e959f9dc129b8529b711c60e76754acc285e60946303b923ec"
>
> -S = "${WORKDIR}/live"
> +S = "${UNPACKDIR}/live"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>                      file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
> diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
> index 272e293fd4..68a29dde91 100644
> --- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
> @@ -9,7 +9,6 @@ SRCREV = "3188549fba13bbdf3a5a98de2a38c2e71f04e21e"
>
>  inherit meson pkgconfig
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan opengl', d)} lcms"
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> index 3d54bbb341..3223dd69d7 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> @@ -18,7 +18,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"
>
>  SRCREV = "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
>  SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https"
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig mime-xdg
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> index afe217e1f3..0a3b5d28b6 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> @@ -33,7 +33,6 @@ SRC_URI = "\
>
>  SRCREV = "fc15e229d9d337e46d730f00647821adbbd58548"
>
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v4l-utils-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> index 699b5608db..87dc7a7be6 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://git.ideasonboard.org/yavta.git;branch=master;protocol=https \
>  SRCREV = "52c975e5542504ac10bed8b1d68df5c75951d202"
>
>  PV = "0.0"
> -S = "${WORKDIR}/git"
>
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> index 7384d2892f..651fbc4192 100644
> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https \
>
>  SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig lib_package
>
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
> index f709541c20..a7cd76e0c7 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
> @@ -12,7 +12,6 @@ SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=ma
>             file://libvpx-configure-support-blank-prefix.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  # ffmpeg links with this and fails
>  # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
> diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> index 3d100b870c..5023e4e842 100644
> --- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> +++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db043791349ba57ad1169e1c92477cb6"
>
>  SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/${BPN}/${BPN}_${PV}.tar.gz \
>             file://auxdir.patch;striplevel=0"
> -S = "${WORKDIR}/xpext-1.0"
> +S = "${UNPACKDIR}/xpext-1.0"
>
>  inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
> diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
> index 8b9247694c..5350cf1c65 100644
> --- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
> +++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
> @@ -7,7 +7,7 @@ SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/${BPN}_${PV}
>             file://xsp-fix-pc.patch \
>             file://0001-fix-incompatible-pointer-types-build-error-in-gcc-15.patch \
>  "
> -S = "${WORKDIR}/Xsp"
> +S = "${UNPACKDIR}/Xsp"
>
>  inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
> diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
> index db0142502f..48b2535a03 100644
> --- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
> +++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
> @@ -17,7 +17,6 @@ SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branc
>      file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  # Without this line, package is declared a library and named libgeoclue*
>  AUTO_LIBNAME_PKGS = ""
> diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> index 40e51a6a43..bd15b0bda8 100644
> --- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> +++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> @@ -24,7 +24,6 @@ SRC_URI = " \
>
>  UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig useradd systemd
>
> diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
> index e615681687..8ed993aa78 100644
> --- a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
> +++ b/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
> @@ -20,7 +20,6 @@ EXTRA_OECMAKE = ' \
>  LDFLAGS:append:mipsarch = " -latomic"
>  LDFLAGS:append:riscv32 = " -latomic"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= "gnutls"
>  PACKAGECONFIG[gnutls] = "-DREQUIRE_CRYPTO_GNUTLS=ON,-DREQUIRE_CRYPTO_OPENSSL=ON"
> diff --git a/meta-oe/recipes-security/audit/audit_4.0.5.bb b/meta-oe/recipes-security/audit/audit_4.0.5.bb
> index 6fa025abd4..58100b206d 100644
> --- a/meta-oe/recipes-security/audit/audit_4.0.5.bb
> +++ b/meta-oe/recipes-security/audit/audit_4.0.5.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
>             file://auditd \
>            "
>
> -S = "${WORKDIR}/git"
>  SRCREV = "97c4ec3d68b5b199f2796d1e126c2144506bd228"
>
>  inherit autotools python3targetconfig update-rc.d systemd
> diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
> index f4816e733b..e7610ac785 100644
> --- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
> +++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
> @@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
>  SRC_URI = "git://github.com/a13xp0p0v/kernel-hardening-checker;protocol=https;branch=master"
>  SRCREV = "f4dbe258ff3d37489962ea9cf210192ae7ff9280"
>
> -S = "${UNPACKDIR}/git"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
> index 7b3d728216..86f45656f6 100644
> --- a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
> +++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
> @@ -26,7 +26,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git;p
>             "
>  SRCREV = "cb3bb194cca88211cbfcdde2f10c0f43c3fb8ec3"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[manpages] = ""
> diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
> index 40858258c3..48f9a738bb 100644
> --- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
> +++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://spectre-meltdown-checker.sh;beginline=2;endline=2;md5
>  SRC_URI = "git://github.com/speed47/spectre-meltdown-checker;protocol=https;branch=master"
>  SRCREV = "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
>
> -S = "${UNPACKDIR}/git"
>
>  # binutils: readelf,objdump might be used for deeper analysis
>  # coreutils: dd with iflag=skip_bytes oflag=seek_bytes in some cases
> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> index 86acdc7aa1..f172168335 100644
> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
> @@ -8,7 +8,7 @@ SECTION = "System Environment/Kernel"
>  SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910.tar.gz"
>  SRC_URI[sha256sum] = "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42fd311c4022b78010a"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING.tomoyo;md5=751419260aa954499f7abaabaa882bbe"
> diff --git a/meta-oe/recipes-shells/mksh/mksh_59c.bb b/meta-oe/recipes-shells/mksh/mksh_59c.bb
> index e3a8ca8b5e..d27320cf1f 100644
> --- a/meta-oe/recipes-shells/mksh/mksh_59c.bb
> +++ b/meta-oe/recipes-shells/mksh/mksh_59c.bb
> @@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "${BPN}-R(?P<pver>.*)\.tgz"
>
>  inherit update-alternatives
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  ALTERNATIVE:${PN} = "sh"
>  ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
> diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> index 6d64ab71bf..85443984a2 100644
> --- a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> +++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> @@ -11,7 +11,6 @@ SRCREV = "812e2c56aed246931a667f16c28b096e34597016"
>
>  FILES:${PN} = "${datadir}/ace-builds"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "rsync-native"
>
> diff --git a/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb b/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
> index 0ac1decccf..c1e8863fb3 100644
> --- a/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
> +++ b/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
> @@ -15,7 +15,7 @@ SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
>             file://0003-Update-CXX-standard-to-CXX14.patch \
>            "
>
> -S = "${WORKDIR}/git/lang/c++"
> +S = "${UNPACKDIR}/${BP}/lang/c++"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.3.bb b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
> index 37a12006ba..f7da323710 100644
> --- a/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
> +++ b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
> @@ -14,6 +14,6 @@ SRC_URI = " \
>      file://0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch;patchdir=../.. \
>      file://0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch;patchdir=../.. \
>  "
> -S = "${WORKDIR}/git/lang/c"
> +S = "${UNPACKDIR}/${BP}/lang/c"
>
>  inherit cmake pkgconfig
> diff --git a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb b/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
> index 897e7031ca..260fba02a9 100644
> --- a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
> +++ b/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;branch=master \
>             "
>  SRCREV = "f081c69c26e330cf03ec790051c415c4716509d9"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "curl libyaml libusb1 openssl libftdi"
>
> diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
> index fe51c1029d..3c8c41cc03 100644
> --- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
> +++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
> @@ -26,7 +26,6 @@ DEPENDS = "libatomic-ops"
>  SRCREV = "ee59af3722e56de8404de6cd0c21c2493cc4d855"
>  SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb
> index 4f4f58def3..f49aa480da 100644
> --- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb
> +++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e49f4652534af377a713df3d9dec60cb"
>
>  SRC_URI = "git://github.com/embetrix/${BPN};branch=master;protocol=https"
>  SRCREV = "7489280a7a1247f23543343aba4e95bf2f2e8fa6"
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "libtinyxml2 libarchive"
>  inherit cmake pkgconfig
> diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
> index a4b5650c90..0a2514237a 100644
> --- a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
> +++ b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
> @@ -11,7 +11,6 @@ DEPENDS += "boost qemu-native"
>  SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master"
>  SRCREV = "cd3ef80206b71463de96d6b682cfdc99703ec147"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/btop/btop_1.4.3.bb b/meta-oe/recipes-support/btop/btop_1.4.3.bb
> index b0d74d49d7..9a5a21c56d 100644
> --- a/meta-oe/recipes-support/btop/btop_1.4.3.bb
> +++ b/meta-oe/recipes-support/btop/btop_1.4.3.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main;tag
>             "
>  SRCREV = "3f1ccd9f6c455fef6d4d8cfbc8ed71b86961323d"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
> index f512111d66..058ede614e 100644
> --- a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
> +++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88456d0a60de4c71ff4d787c212f253"
>  SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master"
>  SRCREV = "911e989fe41eb90c7df274cb54555346caf2a632"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
> index 18db0721de..63500def05 100644
> --- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
> +++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
> @@ -8,7 +8,6 @@ DEPENDS = "libeigen glog"
>  SRC_URI = "git://github.com/ceres-solver/ceres-solver.git;branch=master;protocol=https"
>  SRCREV = "85331393dc0dff09f6fb9903ab0c4bfa3e134b01"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> index ef3c951bbf..346ccd6c69 100644
> --- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> +++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> @@ -11,7 +11,6 @@ SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
>              file://0001-Do-not-download-the-catch-framework-during-configure.patch"
>
>  SRC_URI[sha256sum] = "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc"
> -S = "${WORKDIR}/git"
>
>  do_configure:prepend() {
>      mkdir -p ${S}/tests/catch2
> diff --git a/meta-oe/recipes-support/cmark/cmark_0.31.1.bb b/meta-oe/recipes-support/cmark/cmark_0.31.1.bb
> index 1edb95e455..bbbb36dace 100644
> --- a/meta-oe/recipes-support/cmark/cmark_0.31.1.bb
> +++ b/meta-oe/recipes-support/cmark/cmark_0.31.1.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
>
>  SRC_URI = "git://github.com/commonmark/cmark.git;branch=master;protocol=https"
>  SRCREV = "bb3678d7a73cb02d35c8876ecd097072636200a8"
> -S = "${WORKDIR}/git"
>
>  inherit cmake lib_package
>
> diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
> index c1df5dce03..f2bae91f44 100644
> --- a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
> +++ b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
> @@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "\
>  SRCREV = "858ce1b38e1534c2602eb431124b5dca706bc746"
>  SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson
>
> diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
> index 17981b6e9b..a1523be376 100644
> --- a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
> +++ b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
> @@ -17,7 +17,6 @@ DEPENDS = " \
>  SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master"
>  SRCREV = "5ef08f0cd6ede62de14de477b74fc3611108c676"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig systemd
>
> diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> index 8b50cb0654..4b8bf162fa 100644
> --- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> +++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> @@ -16,7 +16,6 @@ SRC_URI = "\
>      file://a53f123040998744602f190944464af0e159ea19.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
> index 1444974b44..ec7be4ad37 100644
> --- a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
>  # tag 2.10.19
>  SRCREV = "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> index ee2f91343e..676028efa1 100644
> --- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> +++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/opsengine/cpulimit.git;protocol=https;branch=master
>             file://0002-busy.c-Fix-incompatible-pointer-type-error.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  do_compile() {
>      oe_runmake all
> diff --git a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
> index 8966194704..132395e023 100644
> --- a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
> +++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
> @@ -9,7 +9,6 @@ require ${BPN}-go-mods.inc
>
>  SRCREV = "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
>
> -S = "${WORKDIR}/git"
>
>  GO_IMPORT = "github.com/usbarmory/crucible"
>  GO_INSTALL = "\
> diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
> index ece30a598b..ef709b5715 100644
> --- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
> +++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
> @@ -8,8 +8,7 @@ SRC_URI = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/
>             https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
>  SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_compile() {
>      install -pm 644 ${UNPACKDIR}/ctapi-common.LICENSE LICENSE
> diff --git a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb b/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
> index 3a09fe743c..901763f0ad 100644
> --- a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
> +++ b/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e982d844baa4df1c80de75470e0c5cb"
>  SRC_URI = "git://github.com/hanickadot/compile-time-regular-expressions.git;protocol=https;branch=main"
>  SRCREV = "eb9577aae3515d14e6c5564f9aeb046d2e7c1124"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb b/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
> index 8df707b86f..7b0cc05979 100644
> --- a/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
> +++ b/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8de00431559a76a1b43f6fd44f8f6689"
>  SRC_URI = "git://github.com/jarro2783/cxxopts.git;protocol=https;branch=master"
>  SRCREV = "44380e5a44706ab7347f400698c703eb2a196202"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb b/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
> index f63348a328..5f33c27c52 100644
> --- a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
> +++ b/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
> @@ -11,7 +11,6 @@ SRCREV = "07ff8654a270ec9b410acd3152b60de9e9f941af"
>
>  SRC_URI = "git://github.com/tlsa/libcyaml.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
> index b0712e521b..bae04ca7a3 100644
> --- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
> +++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
> @@ -12,6 +12,5 @@ SRC_URI = " \
>      file://0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_AUTORECONF += "--exclude=autoheader"
> diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
> index 1ef6a07d0d..cc83015e65 100644
> --- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
> +++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "a55535012b2be7a52dcd9eccabb9a198b13be50d0384143bd3b32b8710
>
>  UPSTREAM_CHECK_URI = "http://cr.yp.to/daemontools/install.html"
>
> -S = "${WORKDIR}/admin/${BP}"
> +S = "${UNPACKDIR}/admin/${BP}"
>
>  # http://errors.yoctoproject.org/Errors/Details/766886/
>  # pathexec_run.c:19:17: error: passing argument 2 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
> diff --git a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
> index 50a36a2c27..31330faa17 100644
> --- a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
> +++ b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
> @@ -6,7 +6,6 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ea35644f0ec0d9767897115667e901f"
>
>
> -S = "${WORKDIR}/git"
>
>  SRC_URI = " \
>          git://github.com/google/double-conversion.git;protocol=https;branch=master \
> diff --git a/meta-oe/recipes-support/devmem2/devmem2_2.0.bb b/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
> index 5d2e8463e2..e601755af4 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
> @@ -8,7 +8,6 @@ SRCREV = "5b395a946894eb4f4ef5d07c80a50a88573a541e"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
>
> diff --git a/meta-oe/recipes-support/dhex/dhex_0.69.bb b/meta-oe/recipes-support/dhex/dhex_0.69.bb
> index 14e6ec7112..f292cf8d4f 100644
> --- a/meta-oe/recipes-support/dhex/dhex_0.69.bb
> +++ b/meta-oe/recipes-support/dhex/dhex_0.69.bb
> @@ -13,7 +13,7 @@ SRC_URI = " \
>  "
>  SRC_URI[sha256sum] = "52730bcd1cf16bd4dae0de42531be9a4057535ec61ca38c0804eb8246ea6c41b"
>
> -S = "${WORKDIR}/dhex_${PV}"
> +S = "${UNPACKDIR}/dhex_${PV}"
>
>  EXTRA_OEMAKE += "'CC=${CC}' 'LDFLAGS=${LDFLAGS}' 'CPPFLAGS=${CPPFLAGS}'"
>
> diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
> index 5272b8ea06..baddf42e6b 100644
> --- a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
> +++ b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
> @@ -11,7 +11,6 @@ SRC_URI = " \
>
>  SRCREV = "a162e63aad35358aab325388f3d5e88121606419"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "ds9097 ds9097u \
>                  SYSTYPE='Linux' \
> diff --git a/meta-oe/recipes-support/dool/dool_1.3.4.bb b/meta-oe/recipes-support/dool/dool_1.3.4.bb
> index 25662a0271..d18f5c8b01 100644
> --- a/meta-oe/recipes-support/dool/dool_1.3.4.bb
> +++ b/meta-oe/recipes-support/dool/dool_1.3.4.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=http
>
>  SRCREV = "5068abef0a960c173a91e84a45e7fea1b0a802c0"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
> diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
> index 970844f982..578a2b8d3b 100644
> --- a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
> +++ b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
> @@ -10,7 +10,6 @@ RDEPENDS:${PN} += "bash bash-completion"
>  SRC_URI = "git://gitlab.com/driverctl/driverctl.git;branch=master;protocol=https"
>  SRCREV = "2ba60536eb20ca0a6a751bd8b6501dba84ec45d3"
>
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig systemd features_check
>
> diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> index 197e4b7184..fc8681ca44 100644
> --- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> +++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> @@ -13,7 +13,6 @@ PV = "0.0+git"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> index 3f6017977a..aa0e86db12 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -15,7 +15,7 @@ SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
>
>  SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>
>  do_compile:prepend() {
> diff --git a/meta-oe/recipes-support/epeg/epeg_git.bb b/meta-oe/recipes-support/epeg/epeg_git.bb
> index e5277b1579..63c1455f25 100644
> --- a/meta-oe/recipes-support/epeg/epeg_git.bb
> +++ b/meta-oe/recipes-support/epeg/epeg_git.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/mattes/epeg.git;branch=master;protocol=https \
>             file://0001-configure-Fix-checks-for-libjpeg-and-libexif.patch \
>             "
>  SRCREV = "9a175cd67eaa61fe45413d8da82da72936567047"
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
> index b4812d59d6..c80bf12ade 100644
> --- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
> +++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
> @@ -10,7 +10,7 @@ SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
>  "
>  SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
>
> -S = "${WORKDIR}/espeak-${PV}-source"
> +S = "${UNPACKDIR}/espeak-${PV}-source"
>
>  DEPENDS = "portaudio-v19 qemu-helper-native"
>  inherit siteinfo qemu
> diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> index 491f10dda0..225d15cc7f 100644
> --- a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> +++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> @@ -10,7 +10,6 @@ DEPENDS = "libevdev"
>  SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
>  SRC_URI = "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>  PV = "2.7.0+git"
>
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
> index 3e33ab7953..c0fb32ab79 100644
> --- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
> +++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
> @@ -6,6 +6,5 @@ DEPENDS = "zlib expat brotli libinih"
>
>  SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x"
>  SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
> -S = "${WORKDIR}/git"
>
>  inherit cmake gettext
> diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recipes-support/fbset/fbset-modes.bb
> index fcaf31795b..dd9c392d89 100644
> --- a/meta-oe/recipes-support/fbset/fbset-modes.bb
> +++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
> @@ -7,8 +7,7 @@ PV = "0.1.0"
>
>  SRC_URI = "file://fb.modes"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      install -d ${D}${sysconfdir}
> diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
> index 109b2b599b..284f61c137 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
> @@ -10,7 +10,6 @@ inherit pkgconfig cmake
>  SRCREV = "eda5c99686e15327f2f37b9cadf307e852b96adf"
>  SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "freerdp"
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> index e200f59b05..18af3229d7 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> @@ -23,7 +23,6 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
>             file://CVE-2024-32661.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE += " \
>      -DWITH_FFMPEG=OFF \
> diff --git a/meta-oe/recipes-support/function2/function2_4.2.4.bb b/meta-oe/recipes-support/function2/function2_4.2.4.bb
> index 98d05f6e25..588e44deaa 100644
> --- a/meta-oe/recipes-support/function2/function2_4.2.4.bb
> +++ b/meta-oe/recipes-support/function2/function2_4.2.4.bb
> @@ -8,7 +8,6 @@ PV .= "+git"
>
>  SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>  inherit ptest
> diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
> index e75c88210c..5333c25a9c 100644
> --- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
> +++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
>  SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "f797055d9296b275e981f5f62d4e32e089614fc253d1ef2985851025b8a0ce87"
>
> -S = "${WORKDIR}/fuse-${PV}"
> +S = "${UNPACKDIR}/fuse-${PV}"
>
>  UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
>  UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
> diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
> index cc2c1571e6..ea5c487c52 100644
> --- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
> @@ -19,7 +19,6 @@ SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1;protocol=https \
>
>  SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools binconfig gettext pkgconfig
>
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> index 15efc8cb00..8ea158eab3 100644
> --- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> +++ b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
>  SRC_URI = "git://github.com/gflags/gflags.git;branch=master;protocol=https"
>  SRCREV = "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/glog/glog_0.7.1.bb b/meta-oe/recipes-support/glog/glog_0.7.1.bb
> index 586afcad53..570d9a7e5f 100644
> --- a/meta-oe/recipes-support/glog/glog_0.7.1.bb
> +++ b/meta-oe/recipes-support/glog/glog_0.7.1.bb
> @@ -12,7 +12,6 @@ SRC_URI = " \
>
>  SRCREV = "7b134a5c82c0c0b5698bb6bf7a835b230c5638e4"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/gnulib/gnulib_202401.bb b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
> index 8f70cd7a09..f3fbb94ae8 100644
> --- a/meta-oe/recipes-support/gnulib/gnulib_202401.bb
> +++ b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
> @@ -16,7 +16,6 @@ SRCREV = "c99c8d491850dc3a6e0b8604a2729d8bc5c0eff1"
>  SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=stable-${PV};protocol=https \
>  "
>
> -S = "${WORKDIR}/git"
>
>  do_install () {
>      install -d ${D}/${datadir}/gnulib
> diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
> index 8fda2990d8..4558aa13d6 100644
> --- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
> +++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main;tag=v${PV}"
>  SRCREV = "eddb0241389718a23a42db6af5f0164b6e0139af"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = " \
>      -DBUILD_SHARED_LIBS=yes \
> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb b/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
> index 2b0fb534b3..c0fe586f6d 100644
> --- a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
> @@ -21,7 +21,6 @@ SRC_URI:append:libc-musl = " \
>
>  inherit autotools
>
> -S = "${WORKDIR}/git"
>
>  # On mips, we have the following error.
>  #   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
> diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
> index a379065912..155e56bdef 100644
> --- a/meta-oe/recipes-support/gpm/gpm_git.bb
> +++ b/meta-oe/recipes-support/gpm/gpm_git.bb
> @@ -20,7 +20,6 @@ SRC_URI = "git://github.com/telmich/gpm;protocol=https;branch=master \
>             file://0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep update-rc.d systemd texinfo
>
> diff --git a/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb b/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
> index 89119389fd..c0eb3e02d8 100644
> --- a/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
> +++ b/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "2459290f367a47c8a1ce4ea2ec08359799ea33dc15ed4436439596ce88
>
>  UPSTREAM_CHECK_URI = "https://grsecurity.net/download"
>
> -S = "${WORKDIR}/gradm"
> +S = "${UNPACKDIR}/gradm"
>
>  do_compile() {
>      oe_runmake 'CC=${CC}'                               \
> diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
> index 5528e87e6c..0956eb121c 100644
> --- a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
> +++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
> @@ -13,7 +13,7 @@ inherit autotools
>
>  BBCLASSEXTEND = "native"
>
> -S = "${WORKDIR}/${BPN}-2.8"
> +S = "${UNPACKDIR}/${BPN}-2.8"
>
>  EXTRA_OECONF += "--enable-ipv6 --enable-c-locale"
>  PARALLEL_MAKE = ""
> diff --git a/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb b/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
> index 12823575f9..7d2c87d02d 100644
> --- a/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
> +++ b/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
> @@ -12,4 +12,3 @@ inherit autotools pkgconfig
>
>  SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
>  SRCREV = "d6b2a974608dec3b76fb1e36c189f22b9cf3650c"
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-support/hstr/hstr_3.1.0.bb b/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
> index a641feef6f..0ee900ca3d 100644
> --- a/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
> +++ b/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
> @@ -10,7 +10,7 @@ SRC_URI = "https://github.com/dvorka/hstr/releases/download/3.1/hstr-${PV}-tarba
>             file://0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch \
>             file://0001-Use-OE-specific-checks-for-ncurses.patch"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  SRC_URI[sha256sum] = "4dabf61f045f022bac8bc909e5fd96041af6c53df56d97dfa3cfbf49af4453a5"
>
> diff --git a/meta-oe/recipes-support/htop/htop_3.3.0.bb b/meta-oe/recipes-support/htop/htop_3.3.0.bb
> index cd5b766f0f..efb89bf3ae 100644
> --- a/meta-oe/recipes-support/htop/htop_3.3.0.bb
> +++ b/meta-oe/recipes-support/htop/htop_3.3.0.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
>  "
>  SRCREV = "68c970c7ef4a0682760ed570b3d82388ae7ccf54"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> index ed342d6757..7f6fba995c 100644
> --- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> +++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> @@ -140,7 +140,6 @@ SRC_URI = "git://github.com/wooorm/dictionaries.git;branch=main;protocol=https"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      for LANGUAGE in `ls -d1 ${S}/dictionaries/*` ; do
> diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
> index afe75472a5..67a51f5c9f 100644
> --- a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
> +++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = " \
>  SRCREV = "2969be996acad84b91ab3875b1816636fe61a40e"
>  SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig gettext
>
> diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
> index 8218b08084..03eb7ccbf1 100644
> --- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
> +++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
> @@ -13,5 +13,4 @@ PV = "1.0.1+git"
>  SRCREV = "ecae6c6e8ca6b6bad080a1c73f10ffd0e67d75a7"
>  SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
> index a892a55844..10d2150998 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
> @@ -15,7 +15,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
>  SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
>  SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig update-alternatives
>  export ac_cv_sys_file_offset_bits = "64"
> diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
> index 7b6ed6fdd9..f4905e3c0b 100644
> --- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
> +++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
> @@ -7,7 +7,6 @@ SRCREV = "72f7fa621357299bb6c8f5d29b4efbafcbd34bf7"
>  SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master;tag=v${PV} \
>             file://ldflags.patch \
>  "
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "openssl lua libpcre2"
>
> diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
> index 375c0b4e10..3b57f4ed81 100644
> --- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
> +++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
> @@ -21,7 +21,7 @@ SRC_URI = "\
>
>  SRC_URI[sha256sum] = "52ee3cee3bc500a42095f73c4584e223b4b9d2dfc1cd3e5df965c5952eba8c8d"
>
> -S = "${WORKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
> +S = "${UNPACKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
>
>  EXTRA_OEMAKE = 'CC="${CC}" LD="${CC}" AR="${AR}" OBJCOPY="${OBJCOPY}"'
>
> diff --git a/meta-oe/recipes-support/inih/libinih_58.bb b/meta-oe/recipes-support/inih/libinih_58.bb
> index 2bcf2b4bd4..0ebeec6851 100644
> --- a/meta-oe/recipes-support/inih/libinih_58.bb
> +++ b/meta-oe/recipes-support/inih/libinih_58.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7a95d2af90376e85a05318794e6f202"
>
>  SRC_URI = "git://github.com/benhoyt/inih.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "5cc5e2c24642513aaa5b19126aad42d0e4e0923e"
>
>  inherit meson pkgconfig
> diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
> index aaabfaa085..9ab713ee92 100644
> --- a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
> +++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
> @@ -7,7 +7,6 @@ SRCBRANCH = "main"
>  SRCREV = "4bef811283e0ec1658c60e09950bd5a1ddc92e4b"
>
>  SRC_URI = "git://gitlab.com/iniparser/iniparser.git;protocol=https;branch=${SRCBRANCH}"
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
> index fdec940268..cb77dc81b0 100644
> --- a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
> @@ -9,7 +9,6 @@ SRCREV = "5c2ab772338bcbe516306bf8cf1059ddf2fa6bb7"
>  SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
> index 781a0ef18f..314f67928a 100644
> --- a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
> +++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
>  SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
>  SRCREV = "64b9da1e9f15eeff4ec9d6bc856538db542118f2"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/lcms/lcms_2.16.bb b/meta-oe/recipes-support/lcms/lcms_2.16.bb
> index 8135f83a05..87b0979200 100644
> --- a/meta-oe/recipes-support/lcms/lcms_2.16.bb
> +++ b/meta-oe/recipes-support/lcms/lcms_2.16.bb
> @@ -10,7 +10,7 @@ DEPENDS = "tiff"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -S = "${WORKDIR}/lcms2-${PV}"
> +S = "${UNPACKDIR}/lcms2-${PV}"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb b/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
> index 8b436668dc..344bf119b9 100644
> --- a/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
> +++ b/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
> @@ -13,7 +13,6 @@ DEPENDS = " \
>         gobject-introspection-native \
>  "
>
> -S = "${WORKDIR}/git"
>  SRCREV = "d7666f77e7ee33907c84f5efdef32aef2e1cc196"
>  SRCPV = "${PV}+${SRCREV}"
>
> diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> index dfe63ddbcd..89b2dff0ba 100644
> --- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> +++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://git.0pointer.net/libatasmart.git;protocol=http;branch=master \
>             file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools lib_package pkgconfig
>
> diff --git a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> index e0683b177b..4a1052e75b 100644
> --- a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> +++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://github.com/libb64/libb64;protocol=https;branch=master \
>             file://0001-examples-Use-proper-function-prototype-for-main.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  CFLAGS += "-fPIC"
>
> diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
> index 214c2b2844..ef2a6c76fb 100644
> --- a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
> +++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
> @@ -6,7 +6,6 @@ SECTION = "devel/lib"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
>
> -S = "${WORKDIR}/git"
>
>  SRCREV = "9da72b2732508b0ba0ceed27f5e50bc276ef31f2"
>  SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https"
> diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> index c2ab0d61b8..7d4a352a31 100644
> --- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> +++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> @@ -26,7 +26,6 @@ SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
>             file://run-ptest \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig ptest
>
> diff --git a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb b/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
> index 0e2f1f27b3..20966a535c 100644
> --- a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
> +++ b/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
> @@ -10,6 +10,6 @@ SRC_URI += "file://CVE-2022-40320.patch"
>
>  inherit autotools-brokensep pkgconfig gettext
>
> -S = "${WORKDIR}/confuse-${PV}"
> +S = "${UNPACKDIR}/confuse-${PV}"
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
> index cf2d933169..d825f8fdee 100644
> --- a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
> +++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
> @@ -21,7 +21,6 @@ inherit cmake
>
>  EXTRA_OECMAKE = "-DCPPKAFKA_BUILD_SHARED=ON"
>
> -S = "${WORKDIR}/git"
>
>  do_install:append(){
>      chrpath -d ${D}${libdir}/libcppkafka.so.${BASEPV}
> diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> index 32db913eff..939e7db24e 100644
> --- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> +++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/cyrozap/${BPN}.git;branch=master;protocol=https \
>      file://0001-Fix-gcc-15-incompatible-pointer-types-error.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> index 998a396af1..f5f874941a 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> @@ -19,7 +19,6 @@ SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;branch=3.4 \
>
>  SRCREV = "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/recipes-support/libfann/libfann_git.bb
> index 40f91ac43d..2f68ea95a8 100644
> --- a/meta-oe/recipes-support/libfann/libfann_git.bb
> +++ b/meta-oe/recipes-support/libfann/libfann_git.bb
> @@ -14,6 +14,5 @@ SRC_URI = "git://github.com/libfann/fann.git;branch=master;protocol=https \
>
>  PV = "2.2.0+git"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
> diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> index 1679f212b3..8c30eca0e7 100644
> --- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> +++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> @@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "7c7091e9c86196148bd41177b4590dccb1510bfe6cea5bf7407ff19448
>
>  UPSTREAM_CHECK_URI = "http://www.intra2net.com/en/developer/libftdi/download.php"
>
> -S = "${WORKDIR}/${BPN}1-${PV}"
> +S = "${UNPACKDIR}/${BPN}1-${PV}"
>
>  inherit cmake binconfig pkgconfig python3native
>
> diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb b/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
> index 7f6bec3ea7..9007574fc6 100644
> --- a/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
> +++ b/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
> @@ -16,6 +16,5 @@ GIDOCGEN_MESON_OPTION = 'docs'
>
>  SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main;protocol=https"
>  SRCREV = "ed31c8134d80d006bd45450e84180be2a7c0742e"
> -S = "${WORKDIR}/git"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb b/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
> index db8acd4532..0ad4bd92c0 100644
> --- a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
> +++ b/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
> @@ -11,6 +11,5 @@ DEPENDS += "libpng zlib"
>  SRC_URI = "git://github.com/libharu/libharu.git;branch=master;protocol=https"
>  SRCREV = "8fe5a738541a04642885fb7a75b2b5b9c5b416fa"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-support/libiio/libiio_0.26.bb b/meta-oe/recipes-support/libiio/libiio_0.26.bb
> index e8e6d5f683..ecd9223600 100644
> --- a/meta-oe/recipes-support/libiio/libiio_0.26.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_0.26.bb
> @@ -9,7 +9,6 @@ SRCREV = "a0eca0d2bf10326506fb762f0eec14255b27bef5"
>  SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=libiio-v0"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  SETUPTOOLS_SETUP_PATH ?= "${B}/bindings/python/"
>
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
> index 38ffd032ab..f4e26a65fc 100644
> --- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main"
>
>  SRCREV = "ab3f67fc4fad88cdf07b258c08e4164e06bf7506"
>
> -S = "${WORKDIR}/git"
>
>  JQUERYCOOKIEDIR = "${datadir}/javascript/jquery-cookie"
>  JQUERYCOOKIEDOCDIR = "${docdir}/libjs-jquery-cookie"
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
> index b6147ffeb2..cbf5700a5b 100644
> --- a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
> @@ -3,7 +3,6 @@ SECTION = "console/network"
>  HOMEPAGE = "https://github.com/globalizejs/globalize"
>  LICENSE = "MIT"
>
> -S = "${WORKDIR}/git"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=4db68fb4d1d9986d736b35039f2ad9ea"
>
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
> index 63dfc6fa78..88fbc109ee 100644
> --- a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/fronteed/icheck.git;protocol=https;branch=${PV}"
>
>  SRCREV = "c8c1af84e4b90b4aea31466aad09bf877619e943"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>          install -d ${D}${datadir}/javascript/jquery-icheck/
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
> index 68b5086701..4847d92b4a 100644
> --- a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
> @@ -13,8 +13,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>  JQUERYDIR = "${datadir}/javascript/jquery"
>  JQUERYDOCDIR = "${docdir}/libjs-jquery"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_install() {
>      install -d -m 0755 ${D}${JQUERYDIR}
> diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
> index 3889b17a3c..ffd26d263c 100644
> --- a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
> +++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9"
>  SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/sizzle_1.10.18.orig.tar.gz"
>  SRC_URI[sha256sum] = "8e04ab84bb74b2e338dffc63cd2e52b007f1d8af01b3d25da4d2e07f2b5890f8"
>
> -S = "${WORKDIR}/sizzle-${PV}"
> +S = "${UNPACKDIR}/sizzle-${PV}"
>
>  SIZZLEDIR = "${S}/dist"
>
> diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> index 4d4a5ff109..a2de42d946 100644
> --- a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> +++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> @@ -16,7 +16,6 @@ SRC_URI += "git://github.com/LadislavSopko/mimetic/;branch=master;protocol=https
>
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  CXXFLAGS += "-Wno-narrowing -std=c++14"
>
> diff --git a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb b/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
> index a271b697cd..d692774f08 100644
> --- a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
> +++ b/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
> @@ -6,7 +6,6 @@ BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
>
>  SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
>  SRCREV = "0d5afc4278d7a336d554602b951c2979c3f8f296"
> -S = "${WORKDIR}/git"
>
>  # Package does not support out of tree builds.
>  inherit autotools-brokensep
> diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
> index 1054f83487..95d18a1ed0 100644
> --- a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
> +++ b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
> @@ -16,7 +16,6 @@ SRCREV = "5ec1f5284ecb0eda481f3d2d61236fbc5b46164f"
>  SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master \
>             file://0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
> index edcebf522a..2462786aae 100644
> --- a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
> +++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
> @@ -13,7 +13,6 @@ SRC_URI = " \
>
>  SRCREV = "b505ef5161d2552102a743acd4ad83298d3d8f99"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig gtk-doc gobject-introspection vala
>
> diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
> index 11de5e404b..ee75c39eee 100644
> --- a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
> +++ b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://gitlab.com/libosinfo/osinfo-db-tools.git;branch=main;protocol=h
>             "
>  SRCREV = "e5564be303bfac49cc3490bd0fada342cd65566f"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb b/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
> index 5c5894da01..33e17234ce 100644
> --- a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
> +++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://gitlab.com/libosinfo/osinfo-db.git;branch=main;protocol=https"
>
>  SRCREV = "62f8adceb8ee88e643a134f2cfaf04fc11b9fc51"
>
> -S = "${WORKDIR}/git"
>
>  inherit allarch autotools-brokensep
>
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb b/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
> index 74c70df180..1731d350ae 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
> @@ -15,7 +15,6 @@ SRCREV = "6d669183c7b241ce47ecce28744837ad92814f5c"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
> index 6b1355fa37..01425c6db0 100644
> --- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
> +++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
> @@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
>
>  SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https"
>  SRCREV = "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> index 6148e7cb08..968094daff 100644
> --- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> +++ b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> @@ -16,7 +16,6 @@ DEPENDS = "zlib openssl zstd"
>
>  inherit cmake
>
> -S = "${WORKDIR}/git"
>
>  FILES:${PN} += "${datadir}"
>
> diff --git a/meta-oe/recipes-support/librsync/librsync_2.3.4.bb b/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
> index 3cad665389..c8dfafa2aa 100644
> --- a/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
> +++ b/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
>
>  SRC_URI = "git://github.com/librsync/librsync.git;branch=master;protocol=https"
>  SRCREV = "e364852674780e43d578e4239128ff7014190ed3"
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "popt"
>
> diff --git a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
> index 7994907e13..245d501b8a 100644
> --- a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
> +++ b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
>  DEPENDS = "libsimplelog"
>  SRC_URI = "git://git@github.com/thuanalg/libserialmodule.git;branch=main;protocol=https;tag=v${PV}"
>  SRCREV = "f89f98ff0c9d0aaee2624d40addb0687a74c5d81"
> -S = "${WORKDIR}/git"
>  inherit cmake
>  EXTRA_OECMAKE = "-DUNIX_LINUX=1 -DMETA_OPENEMBEDDED=1"
>
> diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> index b4a721b302..31dce12155 100644
> --- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> +++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=ht
>
>  SRCREV = "093d80b4006042b75a433a5e63760ae9bebad142"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
> index 5969220a41..958f3cf5a1 100644
> --- a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
> @@ -12,7 +12,6 @@ inherit autotools pkgconfig python3-dir
>  SRCREV = "fd1ad6e7823fa76d8db0d3c5884faffa8ffddafb"
>  SRC_URI = "git://github.com/jackmitch/libsoc.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  BOARD ??= "devboard"
>
> diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 52e732b78d..cbc886a2cb 100644
> --- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -44,7 +44,7 @@ SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1
>
>  CVE_PRODUCT = "libsoup"
>
> -S = "${WORKDIR}/libsoup-${PV}"
> +S = "${UNPACKDIR}/libsoup-${PV}"
>
>  inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
>
> diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> index e5915aa795..c6bbd1716b 100644
> --- a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> +++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/DMTF/libspdm.git;branch=main;protocol=https \
>             file://0001-Backport-API-introduced-in-openssl-3.5.0.patch"
>  SRCREV = "1be116c7b7713fa9003e1bd53b53a34758549eb9"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb b/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
> index 5f39c2d79c..bb2b0dc466 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
> @@ -15,7 +15,6 @@ SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused
>
>  SRCREV = "854795c654eda518ed6de6c1ebb4e2107fcb2e73"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb b/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb
> index be2935a385..d462d3018f 100644
> --- a/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb
> +++ b/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/snowballstem/snowball.git;branch=master;protocol=htt
>             file://0001-Build-so-lib.patch \
>             "
>  SRCREV = "48a67a2831005f49c48ec29a5837640e23e54e6b"
> -S = "${WORKDIR}/git"
>
>  LIBVER = "0.0.0"
>
> diff --git a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
> index 9be5601967..a17509d2e5 100644
> --- a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
> +++ b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
> @@ -22,7 +22,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz \
>             file://CVE-2013-4420.patch \
>             "
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  SRC_URI[sha256sum] = "50f24c857a7ef1cb092e6508758b86d06f1188508f897f3e6b40c573e8879109"
>
> diff --git a/meta-oe/recipes-support/libteam/libteam_1.32.bb b/meta-oe/recipes-support/libteam/libteam_1.32.bb
> index 508cbb13bb..4686f4be5c 100644
> --- a/meta-oe/recipes-support/libteam/libteam_1.32.bb
> +++ b/meta-oe/recipes-support/libteam/libteam_1.32.bb
> @@ -17,7 +17,6 @@ SRC_URI = "git://github.com/jpirko/libteam;branch=master;protocol=https \
>             "
>  SRCREV = "8b843e93cee1dab61fb79b01791201cdad45e1d1"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig ptest
>
> diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> index c99930f9e2..b91a455aff 100644
> --- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> +++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> @@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.t
>  "
>  SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
>
> -S = "${WORKDIR}/tinyxml"
> +S = "${UNPACKDIR}/tinyxml"
>
>  EXTRA_CXXFLAGS = "-I. -fPIC"
>
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> index e0b07deca3..89e6eca99b 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> @@ -9,7 +9,6 @@ SRCREV = "9148bdf719e997d1f474be6bcc7943881046dba1"
>  SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
>             file://run-ptest"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson ptest
>
> diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb b/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
> index 4d6c06240d..28c474e1dd 100644
> --- a/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
> +++ b/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/libtom/libtommath.git;protocol=https;branch=master"
>
>  SRCREV = "95d80fd8229d05dd6cb4ec88bc8d4f5377ff00ef"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' 'CFLAGS=${CFLAGS}'"
>
> diff --git a/meta-oe/recipes-support/liburing/liburing_2.9.bb b/meta-oe/recipes-support/liburing/liburing_2.9.bb
> index e17d829c3d..a645a8e4c4 100644
> --- a/meta-oe/recipes-support/liburing/liburing_2.9.bb
> +++ b/meta-oe/recipes-support/liburing/liburing_2.9.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
>             file://0001-test-Including-missing-string.h-for-memcpy.patch"
>  SRCREV = "08468cc3830185c75f9e7edefd88aa01e5c2f8ab"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS:append:libc-musl = " libucontext"
>  XCFLAGS = "-pthread"
> diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb b/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
> index 57f1f54387..960f547f94 100644
> --- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
> +++ b/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
> @@ -28,7 +28,6 @@ SRC_URI = " \
>      file://run-ptest \
>  "
>  SRCREV = "c497eff1ae8c4cfd4fdff370f04c78fa0584f4f3"
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb-compat-0.1/releases"
>
> diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
> index 716d9c4ce4..84f97aab2c 100644
> --- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
> +++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/libusbg/libusbg.git;branch=master;protocol=https \
>             file://0001-Fix-out-of-tree-builds.patch \
>            "
>
> -S = "${WORKDIR}/git"
>
>  ALTERNATIVE:${PN} = "gadget-acm-ecm show-gadgets"
>  ALTERNATIVE_LINK_NAME[gadget-acm-ecm] = "${bindir}/gadget-acm-ecm"
> diff --git a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
> index c79dd092cd..e558274d41 100644
> --- a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
> +++ b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
> @@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>
>  SRC_URI = "file://usbgx.default"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
> diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> index 8d49bf55ba..7b12b911d8 100644
> --- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> +++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> @@ -18,7 +18,6 @@ SRC_URI = " \
>      file://usbgx.service \
>  "
>
> -S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "examples gadget-schemes libconfig"
>  PACKAGECONFIG[libconfig] = "--with-libconfig=yes,--without-libconfig,libconfig"
> diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb b/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
> index 0d2cd135c6..cc28860b04 100644
> --- a/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
> +++ b/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
> @@ -14,7 +14,7 @@ SRC_URI = "git://git.altlinux.org/people/ldv/packages/libutempter.git;branch=mas
>             file://0002-Proper-macro-path-generation.patch \
>             "
>
> -S = "${WORKDIR}/git/${BPN}"
> +S = "${UNPACKDIR}/${BP}/${BPN}"
>
>  CFLAGS += "-DLIBEXECDIR=${libexecdir}"
>
> diff --git a/meta-oe/recipes-support/links/links-x11_2.26.bb b/meta-oe/recipes-support/links/links-x11_2.26.bb
> index 713919bca1..c1601ab7d9 100644
> --- a/meta-oe/recipes-support/links/links-x11_2.26.bb
> +++ b/meta-oe/recipes-support/links/links-x11_2.26.bb
> @@ -13,7 +13,7 @@ SRC_URI += " file://links2.desktop \
>  SRC_URI[sha256sum] = "f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb"
>  SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
>
> -S = "${WORKDIR}/links-${PV}"
> +S = "${UNPACKDIR}/links-${PV}"
>
>  EXTRA_OECONF = "--enable-graphics \
>                  --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
> diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
> index 929b1d186b..d51e51387b 100644
> --- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
> +++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
> @@ -8,7 +8,7 @@ SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.gz \
>            "
>  SRC_URI[sha256sum] = "696113659e426540625274a8b251052cc04306d8ee5c42a0c7639f39ca90c9d6"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 7a87baf5c3..0ff17aed5c 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -19,7 +19,6 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
>             "
>
>  SRCREV = "8817523c5682a7fd83770d3f58a99c436f7e73f7"
> -S = "${WORKDIR}/git"
>  PV = "2.03.32"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
> diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
> index 6c1255772d..c8ffb65fa1 100644
> --- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
> +++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
> @@ -15,7 +15,6 @@ DEPENDS = "bison-native"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://README;beginline=30;md5=94c18755082a2da9c9cf97cba3ad47d6"
>
> -S = "${WORKDIR}/git"
>
>  COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
>
> diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
> index c1661b5ed4..3b96210633 100644
> --- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
> +++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
> @@ -22,7 +22,6 @@ RDEPENDS:${PN} = "mcelog mce-inject dialog bash"
>
>  COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
>
> diff --git a/meta-oe/recipes-support/mcelog/mcelog_204.bb b/meta-oe/recipes-support/mcelog/mcelog_204.bb
> index b0d238361f..c3d082aa67 100644
> --- a/meta-oe/recipes-support/mcelog/mcelog_204.bb
> +++ b/meta-oe/recipes-support/mcelog/mcelog_204.bb
> @@ -15,7 +15,6 @@ SRCREV = "ad244c6b60fcbd08a5d73497bfb3487983801598"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -S = "${WORKDIR}/git"
>
>  inherit ptest
>
> diff --git a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb b/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
> index 6c409666fc..59f2e430aa 100644
> --- a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
> +++ b/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
> @@ -6,7 +6,6 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=383f39920f391605af6e8e46e60e2378"
>
>
> -S = "${WORKDIR}/git"
>
>  SRC_URI = " \
>          git://github.com/mity/md4c.git;protocol=https;branch=master \
> diff --git a/meta-oe/recipes-support/mg/mg_20230501.bb b/meta-oe/recipes-support/mg/mg_20230501.bb
> index ee00003977..04811f1bdd 100644
> --- a/meta-oe/recipes-support/mg/mg_20230501.bb
> +++ b/meta-oe/recipes-support/mg/mg_20230501.bb
> @@ -14,7 +14,6 @@ SRC_URI:append:libc-musl = "\
>             file://0001-Undefine-REGEX-for-musl-based-systems.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  # CFLAGS isn't in EXTRA_OEMAKE, as the makefile picks it up via ?=
>  EXTRA_OEMAKE = "\
> diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.62.bb b/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
> index 46def2a23c..1c0aec13e3 100644
> --- a/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
> +++ b/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
> @@ -12,7 +12,7 @@ RRECOMMENDS:${PN} = "file"
>
>  SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}.tar.gz"
>  SRC_URI[sha256sum] = "54e0a03e0cd63c7c9fe68a18ead0a2143fd3c327604215f989d85484d0409f4a"
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  inherit update-alternatives
>
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> index 3443175d21..07bc84ce8b 100644
> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> @@ -53,7 +53,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
>
>  SRCREV = "cb8de98b2cc3b62fd1a578ba479c0820778e9c02"
>
> -S = "${WORKDIR}/git"
>
>  inherit systemd pkgconfig
>
> diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> index 39ff7ab969..b4db0c0f64 100644
> --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/projectNe10/Ne10.git;branch=master;protocol=https \
>             "
>  SRCREV = "18c4c982a595dad069cd8df4932aefb1d257591f"
>
> -S = "${WORKDIR}/git"
>  PV .= "+git"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-support/nmon/nmon_16m.bb b/meta-oe/recipes-support/nmon/nmon_16m.bb
> index 495afd164f..6f7d35eaf2 100644
> --- a/meta-oe/recipes-support/nmon/nmon_16m.bb
> +++ b/meta-oe/recipes-support/nmon/nmon_16m.bb
> @@ -21,8 +21,7 @@ CFLAGS += "-D JFS -D GETUSER -Wall -D LARGEMEM"
>  LDFLAGS += "-ltinfo -lncursesw -lm"
>  ASNEEDED:pn-nmon = ""
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_compile() {
>      ${CC} ${CFLAGS} ${LDFLAGS} lmon${PV}.c -o nmon
> diff --git a/meta-oe/recipes-support/nspr/nspr_4.36.bb b/meta-oe/recipes-support/nspr/nspr_4.36.bb
> index a717520666..c129362539 100644
> --- a/meta-oe/recipes-support/nspr/nspr_4.36.bb
> +++ b/meta-oe/recipes-support/nspr/nspr_4.36.bb
> @@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "55dec317f1401cd2e5dba844d340b930ab7547f818179a4002bce62e6f
>
>  CVE_PRODUCT = "netscape_portable_runtime"
>
> -S = "${WORKDIR}/nspr-${PV}/nspr"
> +S = "${UNPACKDIR}/nspr-${PV}/nspr"
>
>  RDEPENDS:${PN}-dev += "perl"
>  TARGET_CC_ARCH += "${LDFLAGS}"
> diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> index 6cacd3722c..7390d83bcc 100644
> --- a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> +++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/Oblomov/clinfo.git;protocol=https;branch=master"
>
>  SRCREV = "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "opencl-headers virtual/opencl-icd"
>
> diff --git a/meta-oe/recipes-support/opencv/ade_0.1.2.bb b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
> index 93b14ad4f3..b54c28d624 100644
> --- a/meta-oe/recipes-support/opencv/ade_0.1.2.bb
> +++ b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
> @@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  inherit cmake
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release"
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> index 3f90500784..dcea31daa9 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> @@ -39,7 +39,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
>             "
>  SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
>
> -S = "${WORKDIR}/git"
>
>  # OpenCV wants to download more files during configure.  We download these in
>  # do_fetch and construct a source cache in the format it expects
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
> index 9c9dfd5f45..78258c965a 100644
> --- a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
> +++ b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=0.26.1;protocol=https"
>
>  CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig bash-completion
>
> diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
> index 2d87f13564..02815ec7ba 100644
> --- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
> +++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
> @@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libwbxml/libwbxml-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "a057daa098f12838eb4e635bb28413027f1b73819872c3fbf64e3207790a3f7d"
>
> -S = "${WORKDIR}/libwbxml-${PV}"
> +S = "${UNPACKDIR}/libwbxml-${PV}"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
> index e022b407a0..eb108c177c 100644
> --- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
> +++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
> @@ -10,7 +10,6 @@ DEPENDS = "nlohmann-json"
>  SRC_URI = "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main;tag=v${PV}"
>  SRCREV = "6175aa0b213eea053247e43b4f35b8d201fa356e"
>
> -S = "${WORKDIR}/git"
>  inherit cmake pkgconfig lib_package
>
>  LDFLAGS:append:riscv32 = " -latomic"
> diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
> index c6a3079ea2..0b5740c161 100644
> --- a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
> +++ b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
> @@ -10,7 +10,6 @@ SRCREV = "57ebc07ad8723ea4106090536c58c7f7160743e2"
>  SRC_URI = "git://github.com/kenyapcomau/p910nd;protocol=https;branch=master \
>             file://fix-var-lock.patch"
>
> -S = "${WORKDIR}/git"
>
>  inherit update-rc.d
>
> diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
> index 4ab4f5502f..c54c054cf8 100644
> --- a/meta-oe/recipes-support/pcp/pcp.inc
> +++ b/meta-oe/recipes-support/pcp/pcp.inc
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/performancecopilot/pcp;branch=stable;protocol=https
>
>  SRCREV = "d8d97b79ee47d9dfb076a3242564ed3cae04eba9"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3-base pkgconfig autotools-brokensep
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
> index d5a560a6a0..169630d319 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
> @@ -21,7 +21,7 @@ EXTRA_OECONF = " \
>      --enable-usbdropdir=${libdir}/pcsc/drivers \
>  "
>
> -S = "${WORKDIR}/pcsc-lite-${PV}"
> +S = "${UNPACKDIR}/pcsc-lite-${PV}"
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)} udev"
>  PACKAGECONFIG:class-native ??= ""
> diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
> index 1dfba7c716..14ffab6128 100644
> --- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
> +++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
> @@ -9,7 +9,6 @@ SRCREV = "778da3d86a59f5166443118c158e11ba4da9a5f1"
>
>  inherit autotools pkgconfig
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "pcsc-lite autoconf-archive-native"
>
> diff --git a/meta-oe/recipes-support/picocom/picocom_2024.bb b/meta-oe/recipes-support/picocom/picocom_2024.bb
> index c0c3e25de9..37cf2d0a4c 100644
> --- a/meta-oe/recipes-support/picocom/picocom_2024.bb
> +++ b/meta-oe/recipes-support/picocom/picocom_2024.bb
> @@ -9,7 +9,6 @@ SRCREV = "7b6acbd421a2d4ca99376b7b427828dc1bcba4d8"
>  SRC_URI = "git://gitlab.com/wsakernel/picocom;branch=master;protocol=https \
>             "
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "'CC=${CC}' 'LD=${CC}' 'VERSION=${PV}' \
>                 'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}' "
> diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> index 9337ae5966..c547b0532e 100644
> --- a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> +++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> @@ -13,7 +13,6 @@ SRCREV = "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  do_compile() {
>      oe_runmake CC="${CC}" CXX="${CXX}" EXTRA_INCLUDES="${TARGET_CFLAGS}" AR="${AR}";
> diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recipes-support/pidgin/icyque_git.bb
> index b2f9944c16..e8b4a3c2c3 100644
> --- a/meta-oe/recipes-support/pidgin/icyque_git.bb
> +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
> @@ -15,7 +15,6 @@ SRCREV = "513fc162d5d1a201c2b044e2b42941436d1069d5"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  do_compile() {
>      oe_runmake;
> diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> index 1981f1ee9c..421b1725ba 100644
> --- a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> +++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> @@ -10,7 +10,6 @@ inherit pkgconfig
>  SRC_URI = "git://github.com/EionRobb/skype4pidgin;branch=master;protocol=https"
>  SRCREV = "b226d1c457d73900ae89b8a7469247fbe33677a6"
>
> -S = "${WORKDIR}/git"
>  PV = "1.7+git"
>
>  do_compile() {
> diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
> index 18a156286d..a403289cfc 100644
> --- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
> +++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
> @@ -19,7 +19,6 @@ SRCREV = "8f6b94409d4872265076df310492da1e5f6abdf7"
>
>  SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
> index 662caa27d7..e0f6c4169e 100644
> --- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
> @@ -18,7 +18,6 @@ SRCREV = "7f848d25aa0461d3beeff1189dc61b48ffe8e2f4"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> index 2bf4d0a449..4451e96307 100644
> --- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> +++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> @@ -8,7 +8,6 @@ PV .= "+git"
>  SRC_URI = "git://github.com/PortAudio/portaudio.git;branch=master;protocol=https"
>  SRCREV = "929e2e8f7af281c5eb4fa07758930d542ec43d97"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
> index 34b4bbf75a..65caa05a13 100644
> --- a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
> +++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/ago/pps-tools.git;branch=master;protocol=https \
>             file://0001-Use-lld-in-printf-for-64-bit-time_t.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} = "bash"
>
> diff --git a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
> index bdbe6e73ba..58d3d478d7 100644
> --- a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
> +++ b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
> @@ -9,8 +9,7 @@ SRC_URI = "file://pxaregs.c \
>             file://serial.patch \
>             file://usb.patch "
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_compile() {
>      ${CC} pxaregs.c -o pxaregs ${CFLAGS} ${LDFLAGS}
> diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> index 76d6f0c7a9..55a834fa42 100644
> --- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> +++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
>            "
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "abseil-cpp ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtest googlebenchmark', '', d)}"
>
> diff --git a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
> index 5e0c6cd21c..4172de857c 100644
> --- a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
> +++ b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
>  SRC_URI = "git://gitlab.com/postmarketOS/reboot-mode.git;protocol=http;branch=master"
>  SRCREV = "84831b20512abd9033414ca5f5a023f333525335"
>
> -S = "${WORKDIR}/git"
>
>  # Upstream repo has not made releases/tags after 1.0.0
>  UPSTREAM_CHECK_COMMITS = "1"
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
> index 9d0b676386..aefd871354 100644
> --- a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
> +++ b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
> @@ -27,7 +27,6 @@ LDFLAGS:append:libc-musl = " -lexecinfo"
>
>  SRCREV = "17cf7956b9f925fa788083a2db8d5e669f86bfaf"
>  SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
> -S = "${WORKDIR}/git"
>
>  inherit cmake features_check mime mime-xdg gtk-icon-cache pkgconfig
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb b/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
> index 6889758224..5f4ffcd657 100644
> --- a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
> +++ b/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a0555028c71837623fa6dfa4cc45c0"
>  SRC_URI = "git://github.com/nelhage/reptyr.git;protocol=https;branch=master"
>  SRCREV = "1238097fc2cd15db058d2185cc4985daa87bcd41"
>
> -S = "${WORKDIR}/git"
>
>  inherit bash-completion github-releases manpages pkgconfig
>
> diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> index 3cbd04bd5c..8c4183bae3 100644
> --- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> +++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> @@ -29,7 +29,6 @@ SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=https \
>             file://configure-fix-cmd_rsync.patch \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools perlnative
>
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb b/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
> index d65f5da859..711d4696fd 100644
> --- a/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74274e8a218423e49eefdea80bc55038"
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BPN}.git;protocol=https;branch=master"
>  SRCREV = "61839777afedcc7bdb68ea4628c5ce5ca72c2ac8"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OEMAKE = "DESTDIR=${D}"
>
> diff --git a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
> index 4f06e55e8e..b68820dfd6 100644
> --- a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
> +++ b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a8e768468b658b3ed44971b53d4a6716"
>  SRC_URI = "git://github.com/heftig/rtkit.git;protocol=https;branch=master"
>
>  SRCREV = "b9169402fe5e82d20efb754509eb0b191f214599"
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig features_check useradd
>
> diff --git a/meta-oe/recipes-support/satyr/satyr_0.43.bb b/meta-oe/recipes-support/satyr/satyr_0.43.bb
> index 9e6d701c7f..1976a929bd 100644
> --- a/meta-oe/recipes-support/satyr/satyr_0.43.bb
> +++ b/meta-oe/recipes-support/satyr/satyr_0.43.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/abrt/satyr.git;branch=master;protocol=https \
>             file://0002-fix-compile-failure-against-musl-C-library.patch \
>             "
>  SRCREV = "5891618d6a95afc4cde6757374485adf9bf0e9a5"
> -S = "${WORKDIR}/git"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> diff --git a/meta-oe/recipes-support/sdmon/sdmon_git.bb b/meta-oe/recipes-support/sdmon/sdmon_git.bb
> index 81c8033c15..8007ead6c6 100644
> --- a/meta-oe/recipes-support/sdmon/sdmon_git.bb
> +++ b/meta-oe/recipes-support/sdmon/sdmon_git.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/Ognian/sdmon;protocol=https;branch=master"
>  PV = "0.9.0"
>  SRCREV = "4dff9b690e8d4454fada6abfbb6b32fcb794968c"
>
> -S = "${WORKDIR}/git"
>
>  do_compile() {
>         oe_runmake -C ${S}/src CC="${CC}" CFLAGS="${CFLAGS} -D_REENTRANT -DVERSION=\"\\\"${PV}\\\"\"" LDFLAGS="${LDFLAGS}"
> diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> index 82994331ee..1d7e29ecc5 100644
> --- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> +++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> @@ -6,7 +6,7 @@ SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
>  PV = "1.1+git"
>
>  SRC_URI = "git://github.com/freesmartphone/cornucopia.git;protocol=https;branch=master"
> -S = "${WORKDIR}/git/tools/serial_forward"
> +S = "${UNPACKDIR}/${BP}/tools/serial_forward"
>
>  inherit autotools native
>
> diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> index 541ae84a93..05e965fc63 100644
> --- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> +++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> @@ -9,6 +9,6 @@ SRC_URI = "git://github.com/freesmartphone/cornucopia.git;branch=master;protocol
>             file://0001-serial_forward-Disable-default-static-linking.patch;striplevel=3 \
>             file://0001-correct-the-typo-in-include-file-name-string.h.patch;striplevel=3 \
>            "
> -S = "${WORKDIR}/git/tools/serial_forward"
> +S = "${UNPACKDIR}/${BP}/tools/serial_forward"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-support/serial/serial_1.2.1.bb b/meta-oe/recipes-support/serial/serial_1.2.1.bb
> index c3f13d1af5..42151da532 100644
> --- a/meta-oe/recipes-support/serial/serial_1.2.1.bb
> +++ b/meta-oe/recipes-support/serial/serial_1.2.1.bb
> @@ -11,7 +11,6 @@ SRC_URI = " \
>  SRCREV = "10ac4e1c25c2cda1dc0a32a8e12b87fd89f3bb4f"
>  SRC_URI[sha256sum] = "c8cd235dda2ef7d977ba06dfcb35c35e42f45cfd9149ba3ad257756123d8ff96"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
> index 6c3d813983..4af20fe72a 100644
> --- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
> +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
> @@ -17,6 +17,6 @@ SRC_URI[sha256sum] = "d62b6c3cf20390fa7357044390084166d25f1d932a1135c450b69fe5c2
>
>  inherit autotools-brokensep
>
> -S = "${WORKDIR}/sg3_utils-${PV}"
> +S = "${UNPACKDIR}/sg3_utils-${PV}"
>
>  RDEPENDS:${PN} += "bash"
> diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> index 37336ff5d7..047f10589d 100644
> --- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> +++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> @@ -14,7 +14,6 @@ SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;t
>
>  SRCREV = "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
>
> -S = "${UNPACKDIR}/git"
>
>  INHIBIT_DEFAULT_DEPS = "1"
>
> diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> index 74181ad6ae..887615ef45 100644
> --- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> @@ -15,7 +15,6 @@ SRC_URI = " \
>  "
>  SRCREV = "6c603565f36e9996d85045c8012cd04aba5f3708"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "--disable-zypp"
>
> diff --git a/meta-oe/recipes-support/source-highlight/source-highlight_git.bb b/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
> index 109af2cfe9..8b0a38095f 100644
> --- a/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
> +++ b/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ff95bfe019feaf92f524b73dd79e76eb"
>  SRCREV = "894cacd0799ca60afa359a63782729dec76cbb79"
>  PV = "3.1.9+git"
>  SRC_URI = "git://git.savannah.gnu.org/git/src-highlite.git;protocol=https;branch=master"
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb b/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
> index 9dc393fd08..9fef39216f 100644
> --- a/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
> +++ b/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
> @@ -6,6 +6,5 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
>  SRC_URI += "git://github.com/martinmoene/span-lite;branch=master;protocol=https"
>  SRCREV = "50f55c59d1b66910837313c40d11328d03447a41"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
> index 963de54f73..25d8249917 100644
> --- a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
> +++ b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
>
>  DEPENDS += "fmt"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
> index 929721b27d..e313685d95 100644
> --- a/meta-oe/recipes-support/spitools/spitools_git.bb
> +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
>  PV = "1.0.2"
>  SRCREV = "1748e092425a4a0ff693aa347062a57fc1ffdd00"
>
> -S = "${WORKDIR}/git"
>
>  SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https;branch=master"
>
> diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
> index b4294975bd..1797112a90 100644
> --- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
> +++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
> @@ -11,7 +11,7 @@ SRC_URI = " \
>      file://0001-fix-build-failure-with-gcc-15-by-adding-cstdint-head.patch \
>  "
>  SRC_URI[sha256sum] = "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc41bd2311d1337644"
> -S = "${WORKDIR}/${BP}-Source"
> +S = "${UNPACKDIR}/${BP}-Source"
>
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/srecord/files/releases"
>
> diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
> index 613a2199ca..d634ca1b6e 100644
> --- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
> +++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
> @@ -24,7 +24,7 @@ SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
>             "
>  SRC_URI[sha256sum] = "59daab29363d6e9f07c524029c4239653cfbbee6b0e57fd75df62499728dad8a"
>
> -S = "${WORKDIR}/${BPN}.${PV}"
> +S = "${UNPACKDIR}/${BPN}.${PV}"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
> index 17f54dcf4c..bba2507e14 100644
> --- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
> +++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
> @@ -10,7 +10,6 @@ SRCREV = "e7c351c6c722336b3c79b79cd002c7c2986eefb0"
>  SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master"
>  SRC_URI[sha256sum] = "a715e46d8498418dbb8a2519318ba0714ee148151d7e4a7fa5e27770a2f6888f"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig
>
> diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
> index 2717320886..e215c62620 100644
> --- a/meta-oe/recipes-support/synergy/synergy_git.bb
> +++ b/meta-oe/recipes-support/synergy/synergy_git.bb
> @@ -16,7 +16,6 @@ SRC_URI += "file://CVE-2020-15117.patch"
>  SRCREV ?= "1b4c076127687aceac931d269e898beaac1cad9f"
>  PV = "1.10.1+git"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake features_check
>
> diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> index d88cad75cd..019098fdf7 100644
> --- a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> +++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> @@ -11,7 +11,6 @@ inherit meson systemd pkgconfig useradd features_check
>  REQUIRED_DISTRO_FEATURES = "systemd"
>  COMPATIBLE_HOST:libc-musl = "null"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "systemd"
>  DEPENDS += "openssl"
> diff --git a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
> index 967ace9075..937cf6a0b9 100644
> --- a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
> @@ -17,7 +17,6 @@ SRCREV = "45587e94dfb6dfe00220c5f520020a5bc745e92f"
>  SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> diff --git a/meta-oe/recipes-support/tio/tio_3.9.bb b/meta-oe/recipes-support/tio/tio_3.9.bb
> index ff9c552d02..67107e2924 100644
> --- a/meta-oe/recipes-support/tio/tio_3.9.bb
> +++ b/meta-oe/recipes-support/tio/tio_3.9.bb
> @@ -9,7 +9,6 @@ SRCREV = "bdfe87e1cbf6e3bfd48324a25ea026fcd3cc47e9"
>
>  SRC_URI = "git://github.com/tio/tio;protocol=https;branch=master;tag=v${PV}"
>
> -S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb b/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
> index cb1cbe670d..85859cd968 100644
> --- a/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
> +++ b/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
> @@ -22,7 +22,6 @@ SRC_URI = " \
>         file://0001-Makefile.am-Dont-include-buildpath.patch \
>  "
>  SRCREV = "18c9faf089e306ad6f3f51f5cb887a6b9aa08350"
> -S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "udisks"
>
> diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb
> index bf1103fb57..f4c2eaa63f 100644
> --- a/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb
> +++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRCREV = "352f5878e999c0a9d5a453b34110479b2056d7e7"
>  SRC_URI = "git://github.com/mvp/${BPN};branch=master;protocol=https"
> -S = "${WORKDIR}/git"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
> index 02f952e528..efe074f514 100644
> --- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
> +++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
> @@ -12,8 +12,7 @@ SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4fe
>
>  inherit allarch
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_configure[noexec] = "1"
>
> diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
> index 0927f5c904..389c3be903 100644
> --- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
> +++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
> @@ -20,7 +20,7 @@ UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
>
>  inherit autotools-brokensep multilib_header qemu
>
> -S = "${WORKDIR}/unixODBC-${PV}"
> +S = "${UNPACKDIR}/unixODBC-${PV}"
>
>  EXTRA_OEMAKE += "LIBS=-lltdl"
>  EXTRA_OECONF += "--enable-utf8ini"
> diff --git a/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
> index cc56e2ea8a..f9f7e86990 100644
> --- a/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
> +++ b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
> @@ -18,7 +18,6 @@ EXTRA_OEMESON = "-Dtests=false"
>
>  SRCREV = "5b4994c8a91290481bef87a5bae95391d0ec677f"
>  SRC_URI = "git://gitlab.freedesktop.org/upower/power-profiles-daemon;branch=main;protocol=https"
> -S = "${WORKDIR}/git"
>
>  do_install:append() {
>         install -d ${D}${sysconfdir}/tmpfiles.d
> diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/recipes-support/upower/upower_1.90.6.bb
> index 5bac85c57d..d2f58d5b22 100644
> --- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
> +++ b/meta-oe/recipes-support/upower/upower_1.90.6.bb
> @@ -13,7 +13,7 @@ DEPENDS = " \
>
>  SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
>  SRC_URI[sha256sum] = "aed4e42a21307512ad236ad58d7ee4e0196670c8524a168a0edccdc32964ea0c"
> -S = "${WORKDIR}/${BPN}-v${PV}"
> +S = "${UNPACKDIR}/${BPN}-v${PV}"
>
>  UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
>  UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)"
> diff --git a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
> index bdb5807aa6..aa884419f8 100644
> --- a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
> +++ b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
>  # April 1, 2025
>  SRCREV = "635738b64eb52d376c5d1756c265de67236c8934"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>         install -d ${D}${datadir}
> diff --git a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb b/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
> index ef15613586..357ddfdbca 100644
> --- a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
> +++ b/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
> @@ -16,7 +16,6 @@ SRC_URI = "\
>      file://run-ptest \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit ptest
>
> diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> index bd69dbb11c..e42b19a8d0 100644
> --- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> @@ -14,6 +14,5 @@ SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"
>
>  PV = "1.0.6+git"
>
> -S = "${WORKDIR}/git"
>
>  PARALLEL_MAKE = ""
> diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> index ddd27a7e30..44994cafe0 100644
> --- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> @@ -18,4 +18,3 @@ SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
>
>  PV = "1.1.2+git"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> index d964d7f263..eccaa81d18 100644
> --- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> @@ -16,4 +16,3 @@ DEPENDS += "mtdev utouch-frame utouch-evemu libx11"
>
>  PV = "1.1.7+git"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> index b03ed3cbb9..d11d4808fd 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> @@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
>
> -S = "${WORKDIR}/webkitgtk-${PV}"
> +S = "${UNPACKDIR}/webkitgtk-${PV}"
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
> index 7b8097c80c..17b71411ca 100644
> --- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
> @@ -25,7 +25,6 @@ RDEPENDS:${PN}-dev = ""
>  # tag 0.8.2
>  SRCREV = "56123c87598f8b1dd471be83ca841ceae07f95ba"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
> index 6b35d71a55..93692af682 100644
> --- a/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
> +++ b/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>
>  SRC_URI = "git://github.com/jmacd/xdelta.git;branch=release3_1_apl;protocol=https"
>  SRCREV = "4b4aed71a959fe11852e45242bb6524be85d3709"
> -S = "${WORKDIR}/git/xdelta3"
> +S = "${UNPACKDIR}/${BP}/xdelta3"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
> index fa63196da2..43536f5d7b 100644
> --- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
> +++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
> @@ -13,7 +13,6 @@ inherit meson pkgconfig
>
>  SRC_URI = "git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "1c1989e56f94b9eb3b7567f8a6e8a0aa16cba496"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.0.bb
> index 800624bd90..440d836874 100644
> --- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.0.bb
> +++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.0.bb
> @@ -31,7 +31,6 @@ SRC_URI = " \
>         file://0001-meson.build-add-a-hack-for-crosscompile.patch \
>  "
>
> -S = "${WORKDIR}/git"
>  SRCREV = "85df26fb1c53334969fea3f15c2a06a14831094b"
>
>  FILES:${PN} += "${libdir}/systemd ${datadir}/dbus-1"
> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
> index cad5c07099..533b0801cb 100644
> --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
> @@ -16,7 +16,6 @@ SRCREV = "d463bad9639c910fadc2f30dac473c7688b11cfc"
>
>  PV = "0.9.19"
>
> -S = "${WORKDIR}/git"
>
>  FILES:${PN} += "${libdir}/xorg/modules/*"
>
> diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
> index 29e53fcf04..09db5519ea 100644
> --- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
> +++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
>  SRCREV = "28f93bdec6387d42332220afa9558060c8016795"
>  PV .= "+git"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb b/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
> index 57966980e0..0655f225b4 100644
> --- a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
> +++ b/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c8ae1b99922935413d4c596f50b59545"
>  SRC_URI = "git://github.com/ibireme/yyjson.git;protocol=https;branch=master;tag=${PV}"
>  SRCREV = "9e24d6bcead647231f81173cc5c6bb6c097c00e4"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
> index 975779cd18..053e0161d7 100644
> --- a/meta-oe/recipes-support/zbar/zbar_git.bb
> +++ b/meta-oe/recipes-support/zbar/zbar_git.bb
> @@ -15,7 +15,6 @@ SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https \
>  "
>  SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
>
> -S = "${WORKDIR}/git"
>  PV = "0.23.1+git"
>
>  DEPENDS += "xmlto-native"
> diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
> index a15540f968..9ef380005c 100644
> --- a/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
> +++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
>  SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
>
>  SRCREV = "69dd7d6764e333413dd12848607d72cab310e406"
> -S = "${WORKDIR}/git"
>
>  DEPENDS = "zstd"
>  DEPENDS:append:libc-musl = " argp-standalone"
> diff --git a/meta-oe/recipes-test/bats/bats_1.12.0.bb b/meta-oe/recipes-test/bats/bats_1.12.0.bb
> index ae59a27dc9..14a234c866 100644
> --- a/meta-oe/recipes-test/bats/bats_1.12.0.bb
> +++ b/meta-oe/recipes-test/bats/bats_1.12.0.bb
> @@ -12,7 +12,6 @@ SRC_URI = "\
>  # v1.12.0
>  SRCREV = "713504bc0224a19b3d7c7958c18dc07f64f54b44"
>
> -S = "${WORKDIR}/git"
>
>  # Numerous scripts assume ${baselib} == lib, which is not true.
>  #
> diff --git a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
> index f106b39de4..6a7fc5ad47 100644
> --- a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
> +++ b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
>  SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
>  SRCREV = "2b60af89e23d28eefc081bc930831ee9d45ea58b"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake python3native
>
> diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> index 6c94e9e275..09afe36666 100644
> --- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=st
>             file://run-ptest \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake ptest
>
> diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> index 5536cf07b6..5710585b6c 100644
> --- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> +++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ce5d5f1fe02bcd1343ced64a06fd4177"
>  SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master"
>  SRCREV = "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb b/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
> index e3424d019e..ad545e627b 100644
> --- a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
> +++ b/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=m
>
>  SRCREV = "be56f653743cc0e68bef81ef35df7c50ff8919c4"
>
> -S = "${WORKDIR}/git"
>
>  RRECOMMENDS:${PN} = "libgpiod-tools"
>
> diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
> index b68f0edb3f..9aab617487 100644
> --- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
> +++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
> @@ -4,7 +4,7 @@ LICENSE = "LGPL-2.0-only"
>  SECTION = "libs"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
>
> -S = "${WORKDIR}/CUnit-${PV}"
> +S = "${UNPACKDIR}/CUnit-${PV}"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2 \
>             file://fixup-install-docdir.patch \
> diff --git a/meta-oe/recipes-test/evtest/evtest_1.35.bb b/meta-oe/recipes-test/evtest/evtest_1.35.bb
> index 52f684ce5f..9c42efcdab 100644
> --- a/meta-oe/recipes-test/evtest/evtest_1.35.bb
> +++ b/meta-oe/recipes-test/evtest/evtest_1.35.bb
> @@ -11,6 +11,5 @@ SRC_URI = "git://gitlab.freedesktop.org/libevdev/evtest.git;protocol=https;branc
>             file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
> index b19bba0156..98db76eda1 100644
> --- a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
> +++ b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com//ponty/fb-test-app.git;branch=master;protocol=https"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      install -d ${D}${bindir}
> diff --git a/meta-oe/recipes-test/googletest/googletest_1.16.0.bb b/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
> index fe2f732a5d..55d670a428 100644
> --- a/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
> +++ b/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
>
>  PROVIDES += "gmock gtest"
>
> -S = "${WORKDIR}/git"
>  SRCREV = "6910c9d9165801d8827d628cb72eb7ea9dd538c5"
>  SRC_URI = "git://github.com/google/googletest.git;branch=v1.16.x;protocol=https \
>      file://gtest-ciso646.patch \
> diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> index f13925ee18..3588e96847 100644
> --- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;protocol=https
>             file://0001-Makefile-Detect-compiler-in-makefile.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
>
> diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> index 7346011158..c617cf09a3 100644
> --- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> +++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> @@ -11,6 +11,5 @@ SRCREV = "2ee61484167eab846f7b7c565284d7c350d738d3"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> index 482e5694f6..d7e9618985 100644
> --- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> +++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> @@ -15,7 +15,6 @@ SRC_URI = " \
>      file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  CFLAGS += "-pthread"
>
> diff --git a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
> index 683600f712..8d298e3c1d 100644
> --- a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
> +++ b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
>  SRC_URI = " git://github.com/kward/shunit2.git;branch=master;protocol=https"
>  SRCREV = "080159b303537888c5d41910b4d47a5002638e30"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      install -D -m 0755 ${S}/shunit2 ${D}${bindir}/shunit2
> diff --git a/meta-oe/recipes-test/testfloat/testfloat_3e.bb b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
> index f5aace4d33..3c25c2d4ff 100644
> --- a/meta-oe/recipes-test/testfloat/testfloat_3e.bb
> +++ b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
> @@ -21,8 +21,7 @@ SRC_URI[SoftFloat.sha256sum] = "21130ce885d35c1fe73fc1e1bf2244178167e05c6747cad5
>
>  UPSTREAM_CHECK_URI = "http://www.jhauser.us/arithmetic/TestFloat.html"
>
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> +S = "${UNPACKDIR}/${BP}"
>
>  do_compile(){
>      oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/
> diff --git a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb b/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
> index 788a15dba2..3f2f07c28f 100644
> --- a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
> +++ b/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
>  SRC_URI = "git://github.com/rollbear/trompeloeil.git;branch=main;protocol=https"
>  SRCREV = "ad9bc41b1e01ae92802de59a12d19cf7c8683d6d"
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake
>
> diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
> index 431b41a2dd..9718a2ce9b 100644
> --- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
> +++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
> @@ -13,7 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${
>
>  SRC_URI[sha256sum] = "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d38ed417737ed3166ffc"
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${UNPACKDIR}/${BPN}"
>
>  inherit cpan-base update-alternatives
>
> diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> index cef17fb400..edecc8dbb0 100644
> --- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> +++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=406;endline=409;md5=d
>  SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "aa848b75ad3ecc32d31e8651909551e851cceef74a32822c7a3cb35c259f5190"
>
> -S = "${WORKDIR}/Algorithm-Diff-${PV}"
> +S = "${UNPACKDIR}/Algorithm-Diff-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> index 835fd2f6cc..b36006acd3 100644
> --- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> +++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> @@ -18,7 +18,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.tar.gz \
>  "
>  SRC_URI[sha256sum] = "3b276506986ccaa4949d92b13ce053a0017ad11562a991cc753364923fe81ca7"
>
> -S = "${WORKDIR}/Authen-Radius-${PV}"
> +S = "${UNPACKDIR}/Authen-Radius-${PV}"
>
>  inherit cpan ptest
>
> diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
> index e8ee641d9c..bcd155ff6f 100644
> --- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
> +++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
> @@ -16,7 +16,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/E/EH/EHUELS/Authen-SASL-${PV}.tar.gz \
>            "
>  SRC_URI[sha256sum] = "0b03686bddbbf7d5c6548e468d079a4051c9b73851df740ae28cfd2db234e922"
>
> -S = "${WORKDIR}/Authen-SASL-${PV}"
> +S = "${UNPACKDIR}/Authen-SASL-${PV}"
>
>  inherit cpan ptest
>
> diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
> index 7154a18788..efd78e20e2 100644
> --- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
> +++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
> @@ -17,7 +17,7 @@ SRCNAME = "Capture-Tiny"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "ca6e8d7ce7471c2be54e1009f64c367d7ee233a2894cacf52ebe6f53b04e81e5"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb
> index 59934fe36d..0c738b0b06 100644
> --- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb
> +++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb
> @@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "12fb5a5b392032413571169257f98533488005550774bcbd0715be687a590cf2"
>
> -S = "${WORKDIR}/CGI-${PV}"
> +S = "${UNPACKDIR}/CGI-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
> index f6ed718239..93c186d2d5 100644
> --- a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
> +++ b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d49d07ae038f38923335ac8cc301e1ba"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Class-Method-Modifiers-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "65cd85bfe475d066e9186f7a8cc636070985b30b0ebb1cde8681cf062c2e15fc"
>
> -S = "${WORKDIR}/Class-Method-Modifiers-${PV}"
> +S = "${UNPACKDIR}/Class-Method-Modifiers-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
> index 5735bbba1e..409216fe69 100644
> --- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
> +++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "8d75d3d366c9101ca18061b00d438d3da39478c06159147dea3c666770
>
>  DEPENDS += "bzip2"
>
> -S = "${WORKDIR}/Compress-Raw-Bzip2-${PV}"
> +S = "${UNPACKDIR}/Compress-Raw-Bzip2-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
> index 2bc42cb941..6f18bae7dd 100644
> --- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
> +++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "6b979a8347701ced3ac26123d428c1f202b7999850444da19c4aedbb7c
>
>  DEPENDS += "xz"
>
> -S = "${WORKDIR}/Compress-Raw-Lzma-${PV}"
> +S = "${UNPACKDIR}/Compress-Raw-Lzma-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
> index 205e6a548e..0c6a1070cd 100644
> --- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
> +++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
> @@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "56b21c99cb3a3a7f7876a74dd05daa3f41fc9143ddd4dc98f8e46710a1
>
>  DEPENDS += "zlib"
>
> -S = "${WORKDIR}/Compress-Raw-Zlib-${PV}"
> +S = "${UNPACKDIR}/Compress-Raw-Zlib-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
> index f232c3585b..73694bb95f 100644
> --- a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
> +++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab27c3cedbdb0eb6e656a8722476191a"
>
>  RDEPENDS:${PN} += "perl"
>
> -S = "${WORKDIR}/Config-Tiny-${PV}"
> +S = "${UNPACKDIR}/Config-Tiny-${PV}"
>
>  SRC_URI = "${CPAN_MIRROR}/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
>
> diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> index 8331a1d4af..086b2ff32e 100644
> --- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> +++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> @@ -33,7 +33,7 @@ RDEPENDS:${PN} += "perl-module-text-parsewords"
>  RDEPENDS:${PN} += "perl-module-warnings"
>  RRECOMMENDS:${PN} += "libfile-slurper-perl"
>
> -S = "${WORKDIR}/Config-AutoConf-${PV}"
> +S = "${UNPACKDIR}/Config-AutoConf-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
> index dd6cd8041f..09c145e7cd 100644
> --- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
> +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
> @@ -23,7 +23,7 @@ RDEPENDS:${PN} = "\
>
>  EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
>
> -S = "${WORKDIR}/Crypt-OpenSSL-Guess-${PV}"
> +S = "${UNPACKDIR}/Crypt-OpenSSL-Guess-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
> index c55f7f7680..982d604eaa 100644
> --- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
> +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9e876d4149406d88b4ff1b37645363ad"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/R/RU/RURBAN/Crypt-OpenSSL-Random-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "a571b24181baaa76c96704e92acffc6934ff593e380dade274db4e43c140ad51"
>
> -S = "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
> +S = "${UNPACKDIR}/Crypt-OpenSSL-Random-${PV}"
>
>  DEPENDS += " \
>      openssl \
> diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
> index 36f96d59cd..5b81cfa4a3 100644
> --- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
> +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
> @@ -22,7 +22,7 @@ RDEPENDS:${PN} = " \
>
>  EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
>
> -S = "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
> +S = "${UNPACKDIR}/Crypt-OpenSSL-RSA-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
> index f440209860..e6fc3c8300 100644
> --- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
> +++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
> @@ -15,7 +15,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz \
>
>  SRC_URI[sha256sum] = "84221e0013a2d64a0bae6a32bb44b1ae5734d2cb0465fb89af3e3abd6e05aeb2"
>
> -S = "${WORKDIR}/Curses-${PV}"
> +S = "${UNPACKDIR}/Curses-${PV}"
>
>  EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS=-L${STAGING_LIBDIR} TEST_SYMS_OPTS=-v"
>
> diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> index f52d0034f2..793889de6d 100644
> --- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> +++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> @@ -20,7 +20,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
>  "
>  SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535cd9be70"
>
> -S = "${WORKDIR}/Data-HexDump-${PV}"
> +S = "${UNPACKDIR}/Data-HexDump-${PV}"
>
>  inherit cpan ptest update-alternatives
>
> diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
> index 8425607eeb..e8bbf79b13 100644
> --- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
> +++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "0a33a7a935be63371071dbe600cfaefa67cd971b67580a917bbf6ebaf7
>
>  UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
>
> -S = "${WORKDIR}/DBD-SQLite-${PV}"
> +S = "${UNPACKDIR}/DBD-SQLite-${PV}"
>
>  DEPENDS += "libdbi-perl-native"
>
> diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
> index e8450c7ac8..1da94516eb 100644
> --- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
> +++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=53;endline=55;md5=935dadb9423774f535
>  SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestruction-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41fe5b53efab9154ab"
>
> -S = "${WORKDIR}/Devel-GlobalDestruction-${PV}"
> +S = "${UNPACKDIR}/Devel-GlobalDestruction-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> index 5bbabf24de..bb19dfb415 100644
> --- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
> @@ -13,7 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/A/AR/ARODLAND/Digest-HMAC-${PV}.tar.gz \
>            "
>  SRC_URI[sha256sum] = "215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a992e87c4969fcdc7a"
>
> -S = "${WORKDIR}/Digest-HMAC-${PV}"
> +S = "${UNPACKDIR}/Digest-HMAC-${PV}"
>
>  inherit cpan ptest
>
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> index c677e8ea59..350bad3ea2 100644
> --- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> @@ -11,7 +11,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
>            "
>  SRC_URI[sha256sum] = "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc"
>
> -S = "${WORKDIR}/Digest-SHA1-${PV}"
> +S = "${UNPACKDIR}/Digest-SHA1-${PV}"
>
>  inherit cpan ptest
>
> diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> index f88a418a47..e2a7084061 100644
> --- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> +++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> @@ -13,7 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
>
> -S = "${WORKDIR}/Env-${PV}"
> +S = "${UNPACKDIR}/Env-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
> index cce79f807a..7b28d59228 100644
> --- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
> +++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
> @@ -35,7 +35,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "34d382276c0fb0d6b38355b94c96a30b12d834d5662eb53f088ee25e3e712924"
>
> -S = "${WORKDIR}/Error-${PV}"
> +S = "${UNPACKDIR}/Error-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> index b6e80cd888..401f607571 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1932ab4d8b84c25fd7967aa18088e57e"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c"
>
> -S = "${WORKDIR}/ExtUtils-Config-${PV}"
> +S = "${UNPACKDIR}/ExtUtils-Config-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
> index c7accb3171..f23d4e3eda 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702
>  SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "b2c7b581901054a32dfcea12536fda8626457ed0bfbc02600bd354bde7e2a9b4"
>
> -S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
> +S = "${UNPACKDIR}/ExtUtils-CppGuess-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
> index e03496d789..42c99ddf58 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0280160e4f26faafef507664884bf63"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "c8574875cce073e7dc5345a7b06d502e52044d68894f9160203fcaab379514fe"
>
> -S = "${WORKDIR}/ExtUtils-Helpers-${PV}"
> +S = "${UNPACKDIR}/ExtUtils-Helpers-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
> index 25de3fc5d4..13d5a31d0b 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed"
>
> -S = "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
> +S = "${UNPACKDIR}/ExtUtils-InstallPaths-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
> index c3a85f6f4f..f5b87ff896 100644
> --- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
> +++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
> @@ -16,7 +16,7 @@ SRCNAME = "ExtUtils-ParseXS"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "41def0511278a2a8ba9afa25ccab45b0453f75e7fd774e8644b5f9a57cc4ee1c"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> index a0dcacfaa4..d857f1316a 100644
> --- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> +++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> @@ -10,7 +10,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://README;beginline=37;endline=41;md5=255fbd5f98a90d51d9908d31271ae4d4"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
>
> -S = "${WORKDIR}/File-Slurp-${PV}"
> +S = "${UNPACKDIR}/File-Slurp-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
> index 410ce80461..03001de45e 100644
> --- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
> +++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
> @@ -28,7 +28,7 @@ RDEPENDS:${PN}-ptest += "libtest-warnings-perl \
>      perl-module-test-more \
>      "
>
> -S = "${WORKDIR}/File-Slurper-${PV}"
> +S = "${UNPACKDIR}/File-Slurper-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> index 64330ceeaa..bd6129e4f2 100644
> --- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> +++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> @@ -11,7 +11,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
>
> -S = "${WORKDIR}/HTML-Parser-${PV}"
> +S = "${UNPACKDIR}/HTML-Parser-${PV}"
>
>  EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
>
> diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> index a0ce7c0b2e..519c2ad54c 100644
> --- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> +++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=62;endline=66;md5=aa91eed6adfe182d2a
>  SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2"
>
> -S = "${WORKDIR}/HTML-Tagset-${PV}"
> +S = "${UNPACKDIR}/HTML-Tagset-${PV}"
>
>
>  inherit cpan ptest-perl
> diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> index 7bdebcd37c..77737f666d 100644
> --- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> +++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> @@ -16,7 +16,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz \
>  "
>  SRC_URI[sha256sum] = "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec0387f01eefc2148f"
>
> -S = "${WORKDIR}/HTML-Tree-${PV}"
> +S = "${UNPACKDIR}/HTML-Tree-${PV}"
>
>  inherit cpan_build
>
> diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> index c16c358fcf..76e4d3bbf1 100644
> --- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> +++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=209;endline=223;md5=3cf363f1e405dea6
>  SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "decb259bc2ff015fe3dac85e4a287d4128e9b0506a0b2c5fa7244836a68b1084"
>
> -S = "${WORKDIR}/Import-Into-${PV}"
> +S = "${UNPACKDIR}/Import-Into-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
> index f6733ad02d..b2da8a903f 100644
> --- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
> +++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
> @@ -11,7 +11,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "daa63c3fa1f7708aa55b97a4d189820f5e849f8e4583dc24b5cceebd06a493eb"
>
> -S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
> +S = "${UNPACKDIR}/IO-Compress-Lzma-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
> index 4e0a0be4f0..ce764334f1 100644
> --- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
> +++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
> @@ -20,7 +20,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "ae4d01ae574e4568c5f2fb0573e74631e2720b71ad3bc5a3ffe9480f1cb9a851"
>
> -S = "${WORKDIR}/IO-Compress-${PV}"
> +S = "${UNPACKDIR}/IO-Compress-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
> index ce3097cb63..58d099043d 100644
> --- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
> +++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
> @@ -23,7 +23,7 @@ RDEPENDS:${PN} += "\
>  SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "fdda17888df9f88251b62856f17fcac8f144858c72d7e01d1c4b437d23383d97"
>
> -S = "${WORKDIR}/IO-Socket-SSL-${PV}"
> +S = "${UNPACKDIR}/IO-Socket-SSL-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> index 5c5ccf7db2..a2c3e8a46e 100644
> --- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> +++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6aaa8296ea41bf199d"
>
> -S = "${WORKDIR}/IO-stringy-${PV}"
> +S = "${UNPACKDIR}/IO-stringy-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> index 43a6ff6527..84fcca8da5 100644
> --- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> +++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> @@ -8,7 +8,7 @@ SECTION = "libs"
>  LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM = "file://README;beginline=16;endline=18;md5=f36550f59a0ae5e6e3b0be6a4da60d26"
>
> -S = "${WORKDIR}/IPC-Signal-${PV}"
> +S = "${UNPACKDIR}/IPC-Signal-${PV}"
>
>  SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
>
> diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> index 9774ac55d1..7c23619cde 100644
> --- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> +++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> @@ -13,7 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Locale-gettext-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "909d47954697e7c04218f972915b787bd1244d75e3bd01620bc167d5bbc49c15"
>
> -S = "${WORKDIR}/Locale-gettext-${PV}"
> +S = "${UNPACKDIR}/Locale-gettext-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
> index a390818511..b7b287c399 100644
> --- a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
> +++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
> @@ -11,7 +11,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/MIME-Charset-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "1bb7a6e0c0d251f23d6e60bf84c9adefc5b74eec58475bfee4d39107e60870f0"
>
> -S = "${WORKDIR}/MIME-Charset-${PV}"
> +S = "${UNPACKDIR}/MIME-Charset-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
> index d8203f4353..043e1549af 100644
> --- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
> +++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
> @@ -16,7 +16,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
>            "
>  SRC_URI[sha256sum] = "7099cb5133401acc92d8fb0fd398cac682140be0680e7dfcb4aaf40315a2dfca"
>
> -S = "${WORKDIR}/MIME-Types-${PV}"
> +S = "${UNPACKDIR}/MIME-Types-${PV}"
>
>  inherit cpan ptest
>
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
> index bab9c5c95d..f3c6e1a016 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
> @@ -17,7 +17,7 @@ DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libext
>  SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "79a73e506fb7badabdf79137a45c6c5027daaf6f9ac3dcfb9d4ffcce92eb36bd"
>
> -S = "${WORKDIR}/Module-Build-Tiny-${PV}"
> +S = "${UNPACKDIR}/Module-Build-Tiny-${PV}"
>
>  inherit cpan_build ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> index fac74ba97e..108c965968 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> @@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75
>  UPSTREAM_CHECK_REGEX = "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"
>  UPSTREAM_CHECK_URI = "https://metacpan.org/release/${SRCNAME}"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> index 0ed61ac3a4..4526def40a 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> @@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99
>
>  UPSTREAM_CHECK_REGEX = "Module\-Runtime\-(?P<pver>(\d+\.\d+)).tar"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
> index e92d793d9c..bbb8d9868f 100644
> --- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
> +++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=74f4de483dce5aa4
>  SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "fb5a2952649faed07373f220b78004a9c6aba387739133740c1770e9b1f4b108"
>
> -S = "${WORKDIR}/Moo-${PV}"
> +S = "${UNPACKDIR}/Moo-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
> index b5f980e646..d5c7db4764 100644
> --- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
> +++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a11
>  SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "adeac0752440b2da094e8036bab6c857e22172457658868f5ac364f0c7b35481"
>
> -S = "${WORKDIR}/Mozilla-CA-${PV}"
> +S = "${UNPACKDIR}/Mozilla-CA-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
> index c7c0e381a6..05027f693c 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "c660500b9d96e5aa2b16d9f4260b6f9f05b5602d3c4bea0ca39b45bcd0
>
>  UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
>
> -S = "${WORKDIR}/Net-DNS-${PV}"
> +S = "${UNPACKDIR}/Net-DNS-${PV}"
>
>  EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> index ba79922bac..ee365f9328 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> @@ -12,7 +12,7 @@ DEPENDS += "openssl"
>
>  UPSTREAM_CHECK_REGEX = "Net\-DNS\-SEC\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
>
> -S = "${WORKDIR}/Net-DNS-SEC-${PV}"
> +S = "${UNPACKDIR}/Net-DNS-SEC-${PV}"
>
>  EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_BASELIBDIR} -lcrypto'"
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb b/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
> index 7f33fd2b1f..dd53bebf4c 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
> @@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/C/CF/CFAERBER/Net-IDN-Encode-${PV}.tar.gz \
>  "
>  SRC_URI[sha256sum] = "55453633e3ff24ce325b34bc2c8157b9859962a31ab5cf28bf7ccc1c9b3a3eaa"
>
> -S = "${WORKDIR}/Net-IDN-Encode-${PV}"
> +S = "${UNPACKDIR}/Net-IDN-Encode-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> index a7793200a5..c620485123 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> @@ -13,7 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "e2f389fe3e7a9e4b61488692919ad723b98f3b479b5288f610daa8c27995b351"
>
> -S = "${WORKDIR}/perl-ldap-${PV}"
> +S = "${UNPACKDIR}/perl-ldap-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> index f56b5a26e4..8f029492b1 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> @@ -19,7 +19,7 @@ SRC_URI += "file://libidn-wr-cross-compile.patch"
>
>  LIC_FILES_CHKSUM = "file://README;beginline=42;endline=92;md5=3374ea0369ca3ead6047520477a43147"
>
> -S = "${WORKDIR}/Net-LibIDN-${PV}"
> +S = "${UNPACKDIR}/Net-LibIDN-${PV}"
>
>  EXTRA_CPANFLAGS = "--with-libidn=${STAGING_LIBDIR} --with-libidn-inc=${STAGING_INCDIR} --compiler='${CC}'"
>  EXTRA_CPANFLAGS += "--disable-tld"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> index d09f756fbb..daf07baa22 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> @@ -29,7 +29,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
>            "
>  SRC_URI[sha256sum] = "9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8"
>
> -S = "${WORKDIR}/Net-SSLeay-${PV}"
> +S = "${UNPACKDIR}/Net-SSLeay-${PV}"
>
>  inherit cpan ptest
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> index 2e79a3b1cd..3d05a3d7a3 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6
>  SRC_URI = "${CPAN_MIRROR}/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743"
>
> -S = "${WORKDIR}/Net-Telnet-${PV}"
> +S = "${UNPACKDIR}/Net-Telnet-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> index d9424ed4d6..8478441211 100644
> --- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> +++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=21;endline=23;md5=f36550f59a0ae5e6e3
>
>  RDEPENDS:${PN} += "perl libipc-signal-perl"
>
> -S = "${WORKDIR}/Proc-WaitStat-${PV}"
> +S = "${UNPACKDIR}/Proc-WaitStat-${PV}"
>
>  SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
>
> diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> index 8ccd269e6d..69d84a6edf 100644
> --- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> +++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=197;endline=234;md5=26df7e7c20551fb1
>  SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45"
>
> -S = "${WORKDIR}/Role-Tiny-${PV}"
> +S = "${UNPACKDIR}/Role-Tiny-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> index 6b1c4e8c0f..be52caacf2 100644
> --- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> +++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> @@ -30,7 +30,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c195
>
>  SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea61d6afa"
>
> -S = "${WORKDIR}/Unix-Statgrab-${PV}"
> +S = "${UNPACKDIR}/Unix-Statgrab-${PV}"
>
>  export LD = "${CCLD}"
>
> diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
> index 5a779a6733..426ba68ab8 100644
> --- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
> +++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
> @@ -31,7 +31,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823
>  SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "09d57974a6d1b2380c802870fed471108f51170da81458e2751859f2714f8d57"
>
> -S = "${WORKDIR}/strictures-${PV}"
> +S = "${UNPACKDIR}/strictures-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
> index 10f0fa2044..5ffc3eaef9 100644
> --- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
> +++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
>  SRC_URI = "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056"
>
> -S = "${WORKDIR}/Sub-Exporter-Progressive-${PV}"
> +S = "${UNPACKDIR}/Sub-Exporter-Progressive-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> index 7487712a93..084d55ee60 100644
> --- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> +++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> @@ -19,7 +19,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.t
>
>  SRC_URI[sha256sum] = "b4f3f63b80f680a421332d8851ddbe5a8e72fcaa74d5d1d98f3c8cc4a3ece293"
>
> -S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
> +S = "${UNPACKDIR}/${CPAN_PACKAGE}-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> index 3f184badf5..889b6b655b 100644
> --- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> @@ -16,7 +16,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd22e105a856a47290"
>
> -S = "${WORKDIR}/TermReadKey-${PV}"
> +S = "${UNPACKDIR}/TermReadKey-${PV}"
>
>  UPSTREAM_CHECK_URI = "https://metacpan.org/release/TermReadKey"
>  UPSTREAM_CHECK_REGEX = "TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar.gz"
> diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
> index 7fbddad7fc..414f0efe3d 100644
> --- a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
> +++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
> @@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "42781e9943a7a215e662c4973b9feafdc019fd16469bdb849a8537ee58
>
>  UPSTREAM_CHECK_REGEX = "Test\-Deep\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
>
> -S = "${WORKDIR}/Test-Deep-${PV}"
> +S = "${UNPACKDIR}/Test-Deep-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
> index 24b6806bc6..0af38719c7 100644
> --- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
> +++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
> @@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "79b6acdc444f1924cd4c2e9ed868bdc6e09580021aca8ff078ede2ffef
>
>  UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
>
> -S = "${WORKDIR}/Test-Harness-${PV}"
> +S = "${UNPACKDIR}/Test-Harness-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> index fe178b46ca..23f339bcda 100644
> --- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> +++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> @@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "638a57658cb119af1fe5b15e73d47c2544dcfef84af0c6b1b2e97f0820
>
>  RDEPENDS:${PN} += "perl-module-test-builder perl-module-test-more perl-module-test-tester"
>
> -S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
> +S = "${UNPACKDIR}/${CPAN_PACKAGE}-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
> index 0f0816df9b..6536787623 100644
> --- a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
> +++ b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
> @@ -19,7 +19,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/B/BI/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.t
>
>  SRC_URI[sha256sum] = "98ca32e7f2f5ea89b8bfb9a0609977f3d153e242e2e51705126cb954f1a06b57"
>
> -S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
> +S = "${UNPACKDIR}/${CPAN_PACKAGE}-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> index 8f16aa1ec0..15f8b3f81e 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> @@ -19,7 +19,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-CharWidth-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "abded5f4fdd9338e89fd2f1d8271c44989dae5bf50aece41b6179d8e230704f8"
>
> -S = "${WORKDIR}/Text-CharWidth-${PV}"
> +S = "${UNPACKDIR}/Text-CharWidth-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> index 9c473d15a2..90bd555403 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> @@ -16,7 +16,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz \
>            "
>  SRC_URI[sha256sum] = "a67f50a48e313c1680cc662109ce5f913ea71454db355d0cf4db87ac89d2d2fa"
>
> -S = "${WORKDIR}/Text-Diff-${PV}"
> +S = "${UNPACKDIR}/Text-Diff-${PV}"
>
>  inherit cpan ptest
>  RDEPENDS:${PN}-ptest += "perl-module-test perl-module-test-more"
> diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> index 80c976561a..2d0242d878 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> @@ -17,7 +17,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bcee383d029e7d2d5c3"
>
> -S = "${WORKDIR}/Text-Iconv-${PV}"
> +S = "${UNPACKDIR}/Text-Iconv-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> index 7bc2e234ac..025bcc2873 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> @@ -20,7 +20,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-WrapI18N-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "4bd29a17f0c2c792d12c1005b3c276f2ab0fae39c00859ae1741d7941846a488"
>
> -S = "${WORKDIR}/Text-WrapI18N-${PV}"
> +S = "${UNPACKDIR}/Text-WrapI18N-${PV}"
>
>  DEPENDS = "libtext-charwidth-perl"
>
> diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
> index ae922d9dda..6b552d9502 100644
> --- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
> +++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
> @@ -14,7 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${PV}.tar.gz"
>
>  SRC_URI[sha256sum] = "486762e4cacddcc77b13989f979a029f84630b8175e7fef17989e157d4b6318a"
>
> -S = "${WORKDIR}/Unicode-LineBreak-${PV}"
> +S = "${UNPACKDIR}/Unicode-LineBreak-${PV}"
>
>  DEPENDS = "libsombok3 libmime-charset-perl"
>
> diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
> index 604b046f0d..7c42a7e4a4 100644
> --- a/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
> +++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
> @@ -14,7 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
>
>  SRC_URI[sha256sum] = "9632067d34e14e0dae2da94631c4f25a387fcc48d06fa29330e8b3c04c4e913d"
>
> -S = "${WORKDIR}/URI-${PV}"
> +S = "${UNPACKDIR}/URI-${PV}"
>
>  EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
>
> diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> index 4393fbd91a..6dc2a19e0b 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> @@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "8fd2126d3beec554df852919f4739e689202cbba6a17506e9b66ea1658
>
>  LIC_FILES_CHKSUM = "file://BufferText.pm;beginline=88;endline=90;md5=497aa6d79cc84c3d769a2a0016bee928"
>
> -S = "${WORKDIR}/XML-Filter-BufferText-${PV}"
> +S = "${UNPACKDIR}/XML-Filter-BufferText-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
> index e0ed6e7c3e..6450111da9 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
> @@ -34,7 +34,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=64eda1bc135f0ece1d1187f2a8ac82c1
>  SRC_URI[libxml.md5sum] = "dce687dd8b7e82d1c359fd74b1852f64"
>  SRC_URI[libxml.sha256sum] = "f0bca4d0c2da35d879fee4cd13f352014186cedab27ab5e191f39b5d7d4f46cf"
>
> -S = "${WORKDIR}/XML-LibXML-${PV}"
> +S = "${UNPACKDIR}/XML-LibXML-${PV}"
>
>  inherit cpan ptest-perl
>
> diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> index d4a027e6d8..b66cbc3945 100644
> --- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> +++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> @@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fdabaad70b7be7c
>
>  LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
>
> -S = "${WORKDIR}/XML-SAX-Writer-${PV}"
> +S = "${UNPACKDIR}/XML-SAX-Writer-${PV}"
>
>  inherit cpan
>
> diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
> index 2d77c32945..205775ef63 100644
> --- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
> +++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
> @@ -14,6 +14,5 @@ RDEPENDS:${PN} += " \
>  SRC_URI = "git://github.com/MostAwesomeDude/txWS.git;branch=master;protocol=https"
>  SRCREV = "88cf6d9b9b685ffa1720644bd53c742afb10a414"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
> diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
> index cf2b7fa15e..a6395b9e47 100644
> --- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
> +++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
> @@ -12,7 +12,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-python/telepathy-
>             file://telepathy-python_fix_for_automake_1.12.patch"
>
>
> -S = "${WORKDIR}/telepathy-python-${PV}"
> +S = "${UNPACKDIR}/telepathy-python-${PV}"
>
>  inherit autotools python3native
>
> diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
> index 6ac4228a8b..668aaa5340 100644
> --- a/meta-python/recipes-devtools/gyp/gyp_git.bb
> +++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https;branch=ma
>             "
>  SRCREV = "a03d7413becefc8d55c8aa3df58b55b9bd0e9052"
>
> -S = "${WORKDIR}/git"
>  PV = "0.1+git"
>
>  inherit setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
> index 79e26e7ae3..cf579c74fe 100644
> --- a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6afb13fdc220497ee5cded1e717ed67"
>
>  SRC_URI[sha256sum] = "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
>
> -S = "${WORKDIR}/annotated_types-${PV}"
> +S = "${UNPACKDIR}/annotated_types-${PV}"
>  PYPI_PACKAGE = "annotated_types"
>
>  UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
> diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> index bc3315f751..b2834568b7 100644
> --- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> @@ -11,6 +11,5 @@ SRCREV ?= "c7553c79f9222e20783fe9bd8a553f932e918072"
>
>  inherit setuptools3
>
> -S = "${WORKDIR}/git"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
> index bdadf7c774..4b4ff952ef 100644
> --- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/aws/aws-iot-device-sdk-python;branch=master;protocol
>             file://0001-setup.py-Use-setuptools-instead-of-distutils.patch \
>             "
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
> index da4f3047f9..97b59358f7 100644
> --- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
> @@ -7,7 +7,6 @@ PV .= "+git${SRCREV}"
>  SRCREV = "9520119376046aeff73804b5f1ea05d87a63f370"
>  SRC_URI += "git://github.com/behave/behave;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
> index 68572d98b1..f88d43a21a 100644
> --- a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
> @@ -12,7 +12,6 @@ SRC_URI += " \
>          file://0001-Drop-ptests-fixtures-and-recorde_modes.patch \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3 ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
> index 45b1ff5145..288c4068cd 100644
> --- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
> @@ -10,7 +10,6 @@ SRC_URI = "git://github.com/ReFirmLabs/binwalk;protocol=https;branch=master"
>
>  SRCREV = "cddfede795971045d99422bd7a9676c8803ec5ee"
>
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
> index 47b3bcc62f..25c2d09990 100644
> --- a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
> @@ -8,7 +8,6 @@ PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop"
>
>  inherit pypi python_poetry_core ptest-python-pytest
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN}-ptest += " \
>         python3-pytest-asyncio \
> diff --git a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
> index 7391c3ae2e..16aa5c3477 100644
> --- a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
> @@ -11,7 +11,6 @@ SRC_URI += " \
>
>  SRCREV = "007f5aff5d1c817883385a5f61f742dd11776dc6"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3 ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
> index 8710b59a95..6e6e3eba31 100644
> --- a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
> @@ -6,6 +6,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
>  SRC_URI = "git://github.com/fedora-python/crypt_r.git;branch=main;protocol=https"
>  SRCREV = "b20e21d9f24d6fa17a6781bbc9f272ce38246eef"
>
> -S = "${UNPACKDIR}/git"
>
>  inherit python_setuptools_build_meta
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
> index ab24870a2a..78402d50f4 100644
> --- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https;branch=master"
>
>  SRCREV = "3b718ee560b3b97d6255c55f0ed7f64cb4b72082"
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} += "lapack suitesparse"
>  DEPENDS += "lapack suitesparse"
> diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> index 141e6bfbaf..7c759613ee 100644
> --- a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/dasbus-project/dasbus.git;protocol=https;branch=mast
>  "
>  SRCREV = "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3 ptest-python-pytest
>
> diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> index 59da4545aa..b72d7bd401 100644
> --- a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/ldo/dbussy.git;branch=master;protocol=https \
>
>  SRCREV = "37ede4242b48def73ada46c2747a4c5cae6abf45"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
> index f944d75e97..5fa86e1d8f 100644
> --- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
>
>  SRC_URI[sha256sum] = "17f515970b04ed7900b733c95fd8091f4f85e52f1fb5f268757f25c858eb1f7b"
>
> -S = "${WORKDIR}/dirty_equals-${PV}"
> +S = "${UNPACKDIR}/dirty_equals-${PV}"
>
>  inherit pypi python_hatchling
>
> diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
> index a9b29a4458..4f0b6bb150 100644
> --- a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
> @@ -10,7 +10,6 @@ SRC_URI = " \
>  "
>  SRCREV = "fe536afac4da31e86909191ef31708755ab8cf83"
>
> -S = "${WORKDIR}/git"
>
>  inherit python_hatchling
>
> diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> index d265a20975..8331f9175a 100644
> --- a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> @@ -18,4 +18,4 @@ SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch \
>  inherit pkgconfig pypi python_setuptools_build_meta
>
>  # it's lowercase pyicu instead of ${PYPI_PACKAGE} in this version
> -S = "${WORKDIR}/pyicu-${PV}"
> +S = "${UNPACKDIR}/pyicu-${PV}"
> diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb
> index 7f5da81376..af716ffeb6 100644
> --- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb
> @@ -10,7 +10,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] = "d13b81ad223b890aa16c5471f2ac3056cf76c5f10f82d6f9292f0b415f389000"
>
> -S = "${WORKDIR}/importlib_metadata-${PV}"
> +S = "${UNPACKDIR}/importlib_metadata-${PV}"
>
>  DEPENDS += "python3-setuptools-scm-native"
>  RDEPENDS:${PN} += "python3-zipp"
> diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b/meta-python/recipes-devtools/python/python3-inotify_git.bb
> index f7df716654..e8d88250a3 100644
> --- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
> +++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
> @@ -12,7 +12,6 @@ SRC_URI = " \
>
>  SRCREV = "9be6a51d1660991562eefaaddefa757ca0e0e00f"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3 ptest-python-pytest
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
> index 459726199e..99f583e717 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/explodinglabs/jsonrpcclient.git;branch=main;protocol
>
>  inherit python_setuptools_build_meta
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} += "\
>      python3-json \
> diff --git a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
> index ba1819979b..ce965b3e43 100644
> --- a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
> @@ -9,7 +9,6 @@ SRCREV ?= "3b180cb10eda683dda7913ecee2e6487288d292d"
>
>  inherit setuptools3
>
> -S = "${WORKDIR}/git"
>
>  BBCLASSEXTEND = "native"
>
> diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
> index 83dc97955c..4cdc773ba6 100644
> --- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
> @@ -17,7 +17,6 @@ SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
>
>  SRCREV = "20d74dcd30f143abbd1aa94c76bafc5bd934d5bd"
>
> -S = "${WORKDIR}/git"
>
>  PACKAGES += "${PN}-examples"
>  FILES:${PN}-examples = "/usr/share/kivy-examples"
> diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
> index 2166e3257f..8a0e30133c 100644
> --- a/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
> @@ -13,7 +13,6 @@ SRC_URI = " \
>  SRCREV = "abcf929efb748c7846dd59007cbb807e108db311"
>  PV .= "+git"
>
> -S = "${WORKDIR}/git"
>  PEP517_SOURCE_PATH = "${S}/api/python"
>
>  export LIEF_BUILD_DIR = "${B}"
> diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
> index 8c53d38ce3..26da91b16b 100644
> --- a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6855782848d572347212f667a2d637"
>  SRC_URI = "git://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git;branch=main"
>  SRCREV = "59ecd1ba018141a02ffe59c16a9346991dfd0d48"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
> index f52f0f8970..1022724814 100644
> --- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
> +++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
> @@ -18,6 +18,6 @@ RDEPENDS:${PN} = " \
>
>  inherit setuptools3
>
> -S = "${WORKDIR}/lrparsing-${PV}"
> +S = "${UNPACKDIR}/lrparsing-${PV}"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
> index aacc32a6d6..b801c5d731 100644
> --- a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
> @@ -8,6 +8,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>  SRCREV = "80681f6604e136e513550342f977edb98f5fc5ad"
>  SRC_URI = "git://github.com/atdt/monotonic.git;branch=master;protocol=https"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
> index 433bfc4965..514eafb1b2 100644
> --- a/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
> +++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
> @@ -7,7 +7,7 @@ inherit pypi setuptools3
>
>  SRC_URI[sha256sum] = "988f264c330a17d63219c49dd2365bdaff97156be3ab6c5eaa204b45dca621e8"
>
> -S = "${WORKDIR}/moteus-${PV}"
> +S = "${UNPACKDIR}/moteus-${PV}"
>
>  RDEPENDS:${PN} += "\
>      python3-can \
> diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb b/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
> index da8403af40..463d06338a 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
> @@ -10,7 +10,6 @@ PV .= "+git"
>
>  SRCREV = "e77793a006e8c27ee96ae8b638a38c6413f87b9c"
>  PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN}-ptest += " \
>      python3-objgraph \
> diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
> index 0c3e6e9266..88a07f20ee 100644
> --- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4f7c3968fc1
>
>  PYPI_SRC_URI = "https://files.pythonhosted.org/packages/39/15/0a6214e76d4d32e7f663b109cf71fb22561c2be0f701d67f93950cd40542/paho_mqtt-${PV}.tar.gz"
>
> -S = "${WORKDIR}/paho_mqtt-${PV}"
> +S = "${UNPACKDIR}/paho_mqtt-${PV}"
>
>  DEPENDS += "python3-pytest-runner-native"
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
> index 4de3687c8f..b9b7a74e6e 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
> @@ -60,7 +60,6 @@ RDEPENDS:${PN}-ptest += " \
>
>  CVE_PRODUCT = "pillow"
>
> -S = "${WORKDIR}/git"
>
>  RPROVIDES:${PN} += "python3-imaging"
>
> diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> index a4732993f8..c5f4c1c395 100644
> --- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> @@ -7,7 +7,6 @@ SECTION = "devel/python"
>  LICENSE = "GPL-3.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1475481f9ec754d758859bd2c75f6f6f"
>
> -S = "${WORKDIR}/git"
>  B = "${S}"
>
>  SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
> diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
> index f16fddf36f..1f372d49ba 100644
> --- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347
>
>  inherit pypi python_flit_core ptest-python-pytest
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  RDEPENDS:${PN} = "\
>      python3-core \
> diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb b/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
> index a661606b80..53996cc231 100644
> --- a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
> @@ -8,7 +8,6 @@ SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
>  PV .= "+git"
>  SRCREV = "e7780f743b03c5e6ecc651fdeb209fa94e0e0250"
>
> -S = "${WORKDIR}/git"
>
>  inherit python_setuptools_build_meta ptest-python-pytest
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
> index 2b6a6c2c0e..cb9b61bd66 100644
> --- a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
> @@ -10,7 +10,6 @@ DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygob
>  SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=master"
>  SRCREV = "8c69016b38d0e4caaf4c986938ea3410fb7351b6"
>
> -S = "${WORKDIR}/git"
>
>  # Same restriction as gtk+
>  inherit features_check setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
> index bb2ccae794..fa4a74f925 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
> @@ -9,6 +9,5 @@ SRC_URI = "git://github.com/pybind/pybind11_json;branch=master;protocol=https \
>  DEPENDS += "nlohmann-json python3-pybind11"
>
>  EXTRA_OECMAKE += "-DPYBIND11_USE_CROSSCOMPILING=ON"
> -S = "${WORKDIR}/git"
>
>  inherit cmake python3native python3targetconfig
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> index e853bb33d8..7d71767297 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> @@ -12,7 +12,6 @@ SRC_URI = "\
>      git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
>  "
>
> -S = "${WORKDIR}/git"
>
>  inherit cmake python_setuptools_build_meta
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
> index c323534e12..47c077853a 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
> @@ -15,7 +15,6 @@ SRCREV = "bce81efdeac1cbefd0196b478a32aa2586bd595a"
>  PV .= "+git"
>  SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=main"
>
> -S = "${WORKDIR}/git"
>
>  DEPENDS += "python3-hatch-fancy-pypi-readme-native"
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> index cfdacf53bb..5a1934383e 100644
> --- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> @@ -14,7 +14,6 @@ SRC_URI = " \
>
>  inherit ptest setuptools3
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} = "python3-pygobject \
>                    python3-io \
> diff --git a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> index 310366325e..58f571be3f 100644
> --- a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> @@ -10,7 +10,6 @@ inherit python_setuptools_build_meta
>  SRC_URI = "git:///github.com/russhousley/pyhsslms.git;branch=master;protocol=https"
>  SRCREV = "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} += " \
>      python3-core \
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
> index 073e0cdb1c..04761471d3 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
> @@ -12,7 +12,6 @@ SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.3.x;protocol
>
>  inherit python_setuptools_build_meta ptest
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} += "\
>      python3-astroid \
> diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
> index 1937606642..a9d06c6f1f 100644
> --- a/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
>
>  SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
>  SRCREV = "921812ddad3f147489916c3c7ab7fb7a80d8c646"
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
> index 297eecad0e..e05b63587f 100644
> --- a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
> @@ -20,7 +20,6 @@ SRCREV = "57db64c9f65ced05c71b8d786c1cedfaa2991597"
>
>  SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libsystemd-0.5.0/"
>
> -S = "${WORKDIR}/git"
>
>  inherit python_setuptools3_rust cargo-update-recipe-crates
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
> index 5a3b2f0ab2..41ebe44dbd 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
> @@ -9,7 +9,6 @@ SRC_URI = " \
>              git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit python_setuptools_build_meta ptest-python-pytest
>
> diff --git a/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
> index 50868b9c40..dba3bcace7 100644
> --- a/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
> @@ -7,6 +7,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>  SRC_URI = "git://git.kernel.org/pub/scm/libs/python/python-schedutils/python-schedutils.git;branch=main"
>  SRCREV = "46469f425f9844f355f6496785ee1ce993b58747"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
> index b6680568b4..b706db8d49 100644
> --- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
> @@ -20,7 +20,7 @@ SRC_URI = "https://github.com/nphilipp/${SRCNAME}/releases/download/${SRCNAME}-$
>            "
>  SRC_URI[sha256sum] = "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e3f5b25d9f8d4d10b"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${UNPACKDIR}/${SRCNAME}-${PV}"
>
>  do_compile:prepend() {
>      sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
> diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
> index b305a128a2..4eb2037c5b 100644
> --- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
> @@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "eec464e42301d93586cbeca3845ed61bff40f560670e5b35baec57301d
>
>  DEPENDS += "i2c-tools"
>
> -S = "${WORKDIR}/i2c-tools-${PV}"
> +S = "${UNPACKDIR}/i2c-tools-${PV}"
>
>  inherit setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
> index 55b56616db..aa1281483a 100644
> --- a/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
> @@ -8,7 +8,6 @@ PYPI_SRC_URI = "git://github.com/hukkin/tomli-w.git;protocol=https;branch=master
>
>  inherit pypi python_flit_core ptest-python-pytest
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN}-ptest += " \
>          python3-tomli \
> diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
> index e9e799e168..09732fc865 100644
> --- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch
>
>  SRCREV = "0c5fb74bcecc0e5c80625c38130fe948c2a3656e"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
> index ace11be8e5..3a187f9386 100644
> --- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
> @@ -12,7 +12,6 @@ SRCREV = "bcc1f26b2fe8fc962f5033c3a3a773425500789a"
>  SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=master \
>  "
>
> -S = "${WORKDIR}/git"
>
>  # python3-misc for 'this' module
>  RDEPENDS:${PN}-ptest += " \
> diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> index f8b7c9b5ff..4707e31854 100644
> --- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/python-excel/xlrd.git;branch=master;protocol=https \
>  "
>  SRCREV = "b8d573e11ec149da695d695c81a156232b89a949"
>
> -S = "${WORKDIR}/git"
>
>  inherit ptest-python-pytest setuptools3
>
> diff --git a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
> index fadcc32c24..af231ca908 100644
> --- a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
> +++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e664eb75e2791c2e505e6e1c274e6d4f"
>  SRCREV = "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
>  SRC_URI = "git://github.com/NordicSemiconductor/piccata.git;protocol=https;branch=master"
>
> -S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
> index bed660ced4..dc57c864e4 100644
> --- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
> @@ -18,7 +18,7 @@ SRC_URI += "file://add-back-option-build-base.patch \
>             "
>  SRC_URI[sha256sum] = "5dbcb0650f67fdc2c5965795a255ffaa3d7b09fb149aa8da2d0d9aa44e38e2ba"
>
> -S = "${WORKDIR}/wxPython-${PV}"
> +S = "${UNPACKDIR}/wxPython-${PV}"
>
>  inherit pypi setuptools3 pkgconfig features_check
>
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
> index b615ff2c92..79bee63d08 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https"
>  SRCREV = "7cec4bd48af4c8f7beb1a74bac751c3d520dedf1"
>
> -S = "${WORKDIR}/git"
>
>  inherit features_check setuptools3
>  REQUIRED_DISTRO_FEATURES = "x11 systemd gobject-introspection-data"
> diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> index 489733c767..4ffe68aab6 100644
> --- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> +++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> @@ -12,7 +12,6 @@ SRCREV = "69090778bccc5ed124342ba288597fbb2bfa9f39"
>  SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https \
>             file://0001-setup.py-Do-not-poke-at-git-describe-to-find-version.patch"
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} = "python3-json"
>
> diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
> index 266b94c9d8..80f9881b58 100644
> --- a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
> +++ b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  inherit setuptools3_legacy
>
> -S = "${WORKDIR}/git"
>
>  SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master"
>
> diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
> index c701e361b7..830e46a63c 100644
> --- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
> +++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
> @@ -37,4 +37,3 @@ SRCREV = "6e0d1238cb4696a9040072a5a28a706e5775c552"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
>
> -S = "${WORKDIR}/git"
> diff --git a/meta-python/recipes-extended/tuna/tuna_0.19.bb b/meta-python/recipes-extended/tuna/tuna_0.19.bb
> index ea0f157921..643e3a09ff 100644
> --- a/meta-python/recipes-extended/tuna/tuna_0.19.bb
> +++ b/meta-python/recipes-extended/tuna/tuna_0.19.bb
> @@ -7,7 +7,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main"
>
>  SRCREV = "b972b8ce386c29bcbcd45029a617db3db9e5b6ca"
>
> -S = "${WORKDIR}/git"
>
>  RDEPENDS:${PN} += " \
>      python3-io \
> diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
> index 0998643b2a..f0653006a3 100644
> --- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
> +++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
> @@ -16,7 +16,6 @@ SRCREV = "3c7e281d97fd3e70b25f7ff4a001eabd56e375d7"
>
>  CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
>
> -S = "${WORKDIR}/git"
>
>  do_install() {
>      install -d ${D}${localstatedir}/www/openapi/static
> diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> index 4dbf595c19..b93fa2d186 100644
> --- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> +++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> @@ -17,7 +17,6 @@ SRCREV = "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
>
>  PV = "0.1.2+git"
>
> -S = "${WORKDIR}/git"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>
> diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
> index 6f2a2330ae..aca6d598f8 100644
> --- a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
> +++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
> @@ -8,7 +8,6 @@ DEPENDS = "apache2 avahi"
>  SRC_URI = "git://git.0pointer.net/mod_dnssd.git;protocol=https;branch=master"
>  SRCREV = "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
>
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF = "--disable-lynx"
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
> index 9ef8c13b79..2b4ae41d95 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
> @@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
>  SRC_URI[sha256sum] = "88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95f58f32f94c46ab"
>
> -S = "${WORKDIR}/httpd-${PV}"
> +S = "${UNPACKDIR}/httpd-${PV}"
>
>  inherit autotools update-rc.d pkgconfig systemd multilib_script multilib_header
>
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> index cdb6fb605c..d593b7092b 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/monkey/monkey;branch=1.6;protocol=https \
>             file://monkey.init"
>
>  SRCREV = "7999b487fded645381d387ec0e057e92407b0d2c"
> -S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
>  UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
> diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> index ec188cc482..9ff1772531 100644
> --- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> +++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> @@ -16,7 +16,6 @@ SRC_URI = "git://github.com/blueness/${BPN};branch=master;protocol=https \
>  UPSTREAM_CHECK_URI = "https://github.com/blueness/sthttpd/releases/"
>  UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools update-rc.d systemd update-alternatives
>
> diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> index b896f4409a..f0e8b749aa 100644
> --- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> +++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> @@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "f881819a3b11e653b0212afaf0cc105db85c767715cb3f5852670f7fc3
>  UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
>  UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
>
> -S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
> +S = "${UNPACKDIR}/phpMyAdmin-${PV}-all-languages"
>
>  inherit allarch
>
> diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
> index 61ef6073e0..03425c53c9 100644
> --- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
> +++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
> @@ -9,7 +9,6 @@ PV = "2.4.2"
>  SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master \
>            "
>
> -S = "${WORKDIR}/git"
>
>  inherit autotools
>
> diff --git a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
> index a9a8ce0541..7aa28885e4 100644
> --- a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
> +++ b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
> @@ -13,7 +13,6 @@ SRC_URI = "git://github.com/gnosek/fcgiwrap.git;protocol=https;branch=${BRANCH}
>  BRANCH = "master"
>  SRCREV = "99c942c90063c73734e56bacaa65f947772d9186"
>
> -S = "${WORKDIR}/git"
>  CFLAGS =+ "-I${B}"
>  EXTRA_OEMAKE = "VPATH=${S}"
>
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
> index 4822f0cada..61a94f7bf4 100644
> --- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
> @@ -10,7 +10,6 @@ DEPENDS = "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
>  SRC_URI = "git://github.com/ib/xarchiver.git;branch=master;protocol=https"
>  SRCREV = "55f923ebc623bcc8f53368543847350a23688189"
>
> -S = "${WORKDIR}/git"
>
>  inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-xdg
>
> diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> index 3e3301f748..880e73849c 100644
> --- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> +++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> @@ -11,4 +11,3 @@ SRC_URI = " \
>      git://github.com/ncopa/${BPN}.git;branch=master;protocol=https \
>  "
>  SRCREV = "6d3282cc1734c305850d48f5bf4b4d94e88885e9"
> -S = "${WORKDIR}/git"
> diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> index 6bcfc4ba43..308da40c34 100644
> --- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=htt
>  "
>  SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
>
> -S = "${WORKDIR}/git"
>
>  inherit gettext meson features_check pkgconfig
>
> diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
> index 4b2071eb3f..8ba962fbd4 100644
> --- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
> +++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
> @@ -9,7 +9,7 @@ inherit allarch gtk-icon-cache
>  SRC_URI = "https://mirrors.dotsrc.org/mirrors/exherbo/111343-OpenZone-${PV}.tar.xz"
>  SRC_URI[sha256sum] = "db6fa6d0798aceb56998ce81382fa2246c77911d56b3b06e6aadee4cf5b4816e"
>
> -S = "${WORKDIR}/OpenZone"
> +S = "${UNPACKDIR}/OpenZone"
>
>  do_compile() {
>  }
> diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
> index b2d74a3015..59de3b3a08 100644
> --- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
> +++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
> @@ -22,7 +22,6 @@ SRC_URI = "git://gitlab.com/tagoh/imsettings.git;protocol=https;branch=main \
>            "
>  SRCREV = "27d84c88831ef76397a15891ba0738ce9a83902a"
>
> -S = "${WORKDIR}/git"
>
>  do_configure:prepend() {
>      cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
> diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
> index 2384682ecb..f2a5e544d5 100644
> --- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
> +++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
> @@ -11,7 +11,6 @@ PV = "4.16.0"
>
>  SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git;branch=master;protocol=https"
>  SRCREV = "538f9acfc5d5019f5cde734d056bcc0c95da9b4c"
> -S = "${WORKDIR}/git"
>
>  EXTRA_OECONF += "--enable-maintainer-mode"
>
> --
> 2.49.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117972): https://lists.openembedded.org/g/openembedded-devel/message/117972
> Mute This Topic: https://lists.openembedded.org/mt/113743963/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

