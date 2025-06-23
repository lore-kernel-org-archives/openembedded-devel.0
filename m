Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F97DC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 17:12:20 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.523.1750698738909797658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 10:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fB2X6nRc;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso4709489a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750698738; x=1751303538; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oov58ObT5Yf/Kw9fBjuMaDbsvvCO53NrSsCiPmlX9Uo=;
        b=fB2X6nRc8/E03OC0p46L4PspUk41NkYw3FeGCZzrH25LBuYU+A5UOJKrzwgMjVSY8e
         b0BG8cv/PLO/eW4ghZrIRy7dXUlkF2DtCGT9T6uM0/Uy3qY6Qn9CEcoWbDEVuaXm/G9n
         0eNjshIM760LY9iIuBoUthf/hW5H+3WbBzMS3Dw1j6xE4KbptFvwqSD7vE4v6iRHfgei
         0IxIpTsEoZPGzpyf/xCcaKLS41eB99uXvm9xxrbo9SqWg2lMObwT9OcFG9bHxbz1sVjU
         LZQVtFuf1U3ga1kjg/OnIW21RK88QBbJ2CL+nmIkCUET3lR4n0AmP+gCS5uLeNn0uo2B
         6RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698738; x=1751303538;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oov58ObT5Yf/Kw9fBjuMaDbsvvCO53NrSsCiPmlX9Uo=;
        b=ijwEskOqlbokq38bMzAnZgaAk/4iTUN2ysrertyqK9DfGoaWQ5XNYyRYSyIcPjAMVT
         AVLWJLaEbjJQbKIHcg6XF6vx5IMf3CBlAu0//VwAlB+DnhOT9U1bUwyzod6ZHdh8S8Zs
         LN1fl1xfrBh7v9bcy+7SJwZMziXlnFamASqv+LwEaH0cMyd5CzusourEum0O/Y4VOZay
         npyxJx31PG7ffBoI4K2/Z8WtxB98kidFosacAbvfM2sRBD5ujXxtbcIUVtw5bT+jJDA+
         ZvBDLzP6kyigWmJsCBhZc2K3gP10USdEcsW/uTbZjoTS3TCFqZXZNq1PqmLeXrGyaJDj
         Cxug==
X-Gm-Message-State: AOJu0YxpT84oJiLFu19qppdv2XcPhWPTIoIVgEBKM4qNNyy52TByJ74a
	Xax9PMhwUI736SKK16dWxHvFsQXH3KglZqLBHD1Ttf07KHeJwHYaVLflkYbtWcqiGtpLXpGADhm
	k8ZJcbQwOEUPPM+vUg/P4cDeNeQr/DmWSHQ==
X-Gm-Gg: ASbGncuXNAAs6WHWegkpzMFuDPmZWACw1xSvypa56GmyfdGVkKoNimAk2VTA5XdCWBg
	xHjj7ObQjd6ZGvln4K/LZa4msd3+auS1SSB8ibeOLDlQhLrahkOPzi1Q29mKAFiu2azHZ2iyEgp
	Qr2JyjDpltEtSmDlF/dN6dYW4ninMCkAnOJjFRRGvPRmc=
X-Google-Smtp-Source: AGHT+IGsx4KLDWIHS6OhEqW2k9Y9pBn/BKfDX94EmFppl4AU/WKzMWe4/aOOiwKXcFeuETt+oOBUdI3mXntEPV4w5u4=
X-Received: by 2002:a17:90b:3c4b:b0:311:f2f6:44ff with SMTP id
 98e67ed59e1d1-3159d8c3e2dmr24737013a91.17.1750698735940; Mon, 23 Jun 2025
 10:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250623162331.186485-1-alperyasinak1@gmail.com>
In-Reply-To: <20250623162331.186485-1-alperyasinak1@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Mon, 23 Jun 2025 20:12:01 +0300
X-Gm-Features: AX0GCFuXy4osqHpLA58jG1lBfhnhM_K7iYRfxkH6TnsP-nntAA4OQ4RTtRh2V7M
Message-ID: <CAGpma=6fXf-WTrbsV1mR0dOTX_yLdN+MGd4930B6kyWGDuqK+g@mail.gmail.com>
Subject: Re: [meta-openembedded][PATCH] Remove consecutive blank lines from recipes
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 17:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118086

Please, don't accept this. I will send v2.

Alper Ak <alperyasinak1@gmail.com>, 23 Haz 2025 Pzt, 19:23 tarihinde =C5=9F=
unu yazd=C4=B1:
>
> Some of them were introduced by mass-removal of S =3D WORKDIR/git assignm=
ents;
> rather than try to fix up (or redo) just these, I've run this sed command=
 over
> the whole tree:
>
> sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name *.bb -o -name =
*.inc`
>
> The rationale is that more than one empty line is wasting vertical screen=
 space, and
> does nothing for readability.
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  .../recipes-filesystems/logfsprogs/logfsprogs_git.bb        | 1 -
>  meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb     | 1 -
>  .../recipes-filesystems/smbnetfs/smbnetfs_git.bb            | 1 -
>  .../recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb    | 1 -
>  .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb          | 1 -
>  meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb       | 1 -
>  meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb   | 1 -
>  meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb       | 1 -
>  .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb  | 1 -
>  meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb     | 1 -
>  .../recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb           | 1 -
>  meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb       | 1 -
>  meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb | 1 -
>  .../recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb     | 1 -
>  .../recipes-utils/ufs-utils/ufs-utils_6.14.11.bb            | 1 -
>  .../recipes-utils/xfstests/xfstests_2025.04.27.bb           | 1 -
>  .../recipes-extended/polkit-gnome/polkit-gnome_0.105.bb     | 1 -
>  meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb                  | 1 -
>  meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb           | 1 -
>  meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb       | 1 -
>  meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb              | 1 -
>  meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb       | 1 -
>  meta-gnome/recipes-gnome/eog/eog_47.0.bb                    | 1 -
>  meta-gnome/recipes-gnome/evince/evince_48.0.bb              | 1 -
>  .../evolution-data-server/evolution-data-server.bb          | 1 -
>  meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb    | 1 -
>  meta-gnome/recipes-gnome/gdm/gdm_48.0.bb                    | 1 -
>  meta-gnome/recipes-gnome/gedit/gedit_46.2.bb                | 1 -
>  meta-gnome/recipes-gnome/ghex/ghex_46.2.bb                  | 1 -
>  meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb                  | 1 -
>  .../gnome-disk-utility/gnome-disk-utility_46.1.bb           | 1 -
>  .../gnome-font-viewer/gnome-font-viewer_48.0.bb             | 1 -
>  meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb  | 1 -
>  .../recipes-gnome/gnome-session/gnome-session_47.0.1.bb     | 1 -
>  .../gnome-settings-daemon/gnome-settings-daemon_48.0.bb     | 1 -
>  meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb    | 1 -
>  .../gnome-system-monitor/gnome-system-monitor_48.1.bb       | 1 -
>  .../gnome-text-editor/gnome-text-editor_48.1.bb             | 1 -
>  meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb  | 1 -
>  .../recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb | 1 -
>  meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb             | 1 -
>  .../recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb    | 1 -
>  .../recipes-gnome/libchamplain/libchamplain_0.12.21.bb      | 1 -
>  meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb     | 1 -
>  meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb        | 1 -
>  meta-gnome/recipes-gnome/mutter/mutter_48.0.bb              | 1 -
>  meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb          | 1 -
>  meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                 | 1 -
>  meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb                 | 1 -
>  meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb       | 2 --
>  meta-gnome/recipes-gnome/yelp/yelp_42.2.bb                  | 1 -
>  .../packagegroups/packagegroup-core-clutter.bb              | 1 -
>  meta-gnome/recipes-support/keybinder/keybinder_3.0.bb       | 1 -
>  meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb       | 1 -
>  meta-initramfs/recipes-devtools/dracut/dracut_106.bb        | 1 -
>  .../recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb           | 1 -
>  .../recipes-kernel/kexec/kexec-tools-klibc_git.bb           | 1 -
>  meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb   | 1 -
>  .../recipes-connectivity/libupnp/libupnp_1.14.18.bb         | 1 -
>  meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb             | 1 -
>  meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb      | 1 -
>  meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb        | 1 -
>  .../recipes-mkv/libmatroska/libmatroska_1.7.1.bb            | 1 -
>  meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb        | 1 -
>  .../recipes-multimedia/bluealsa/bluealsa_4.3.0.bb           | 1 -
>  meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb     | 1 -
>  meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb      | 1 -
>  meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb | 1 -
>  meta-multimedia/recipes-multimedia/flite/flite_2.2.bb       | 1 -
>  .../recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb       | 1 -
>  meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb | 1 -
>  .../recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb     | 1 -
>  meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 1 -
>  .../recipes-multimedia/libcamera/libcamera_0.4.0.bb         | 1 -
>  .../recipes-multimedia/libde265/libde265_1.0.15.bb          | 1 -
>  .../recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb         | 1 -
>  .../recipes-multimedia/libsquish/libsquish_git.bb           | 1 -
>  meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb   | 1 -
>  meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb   | 1 -
>  meta-multimedia/recipes-multimedia/minidlna/minidlna.inc    | 1 -
>  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb    | 1 -
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb    | 1 -
>  .../recipes-multimedia/mycroft/mycroft_19.8.1.bb            | 1 -
>  .../recipes-multimedia/openal/openal-soft_1.24.3.bb         | 1 -
>  .../recipes-multimedia/pipewire/pipewire_1.4.5.bb           | 1 -
>  meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb | 1 -
>  meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb   | 1 -
>  .../recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb           | 1 -
>  .../recipes-multimedia/tremor/tremor_20180319.bb            | 1 -
>  .../recipes-multimedia/wireplumber/wireplumber_0.5.10.bb    | 1 -
>  .../recipes-support/crossguid/crossguid_0.2.2.bb            | 1 -
>  .../recipes-support/gst-instruments/gst-instruments_git.bb  | 1 -
>  .../recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb    | 1 -
>  meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb    | 1 -
>  meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb   | 1 -
>  meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb | 1 -
>  meta-networking/recipes-connectivity/bluepy/bluepy_git.bb   | 1 -
>  .../recipes-connectivity/bluez-tools/bluez-tools_git.bb     | 1 -
>  .../recipes-connectivity/cannelloni/cannelloni_1.1.0.bb     | 1 -
>  .../recipes-connectivity/civetweb/civetweb_1.16.bb          | 1 -
>  meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb   | 1 -
>  meta-networking/recipes-connectivity/dibbler/dibbler_git.bb | 1 -
>  .../recipes-connectivity/freeradius/freeradius_3.2.7.bb     | 1 -
>  .../recipes-connectivity/libdnet/libdnet_1.18.0.bb          | 1 -
>  .../recipes-connectivity/libiec61850/libiec61850_1.5.3.bb   | 1 -
>  .../recipes-connectivity/nanomsg/nanomsg_1.2.1.bb           | 1 -
>  meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb   | 1 -
>  meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb   | 1 -
>  .../networkmanager/networkmanager_1.52.0.bb                 | 4 ----
>  .../recipes-connectivity/openconnect/openconnect_9.12.bb    | 1 -
>  .../openfortivpn/openfortivpn_1.23.1.bb                     | 1 -
>  .../recipes-connectivity/openthread/ot-daemon_git.bb        | 1 -
>  .../recipes-connectivity/openthread/wpantund_git.bb         | 1 -
>  meta-networking/recipes-connectivity/relayd/relayd_git.bb   | 1 -
>  .../recipes-connectivity/sethdlc/sethdlc_1.18.bb            | 3 ---
>  .../recipes-connectivity/snort/snort3_3.7.1.0.bb            | 1 -
>  meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb      | 1 -
>  meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb     | 1 -
>  .../recipes-connectivity/wolfssl/wolfssl_5.8.0.bb           | 1 -
>  meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb        | 2 --
>  meta-networking/recipes-daemons/ippool/ippool_1.3.bb        | 2 --
>  .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb   | 1 -
>  .../networkd-dispatcher/networkd-dispatcher_2.2.4.bb        | 1 -
>  meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb    | 1 -
>  meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb    | 2 --
>  meta-networking/recipes-daemons/vblade/vblade_25.bb         | 1 -
>  meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb      | 1 -
>  meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb   | 1 -
>  .../recipes-devtools/python/python3-scapy_2.6.0.bb          | 1 -
>  .../recipes-extended/kronosnet/kronosnet_1.24.bb            | 1 -
>  meta-networking/recipes-extended/tgt/tgt_1.0.90.bb          | 1 -
>  .../arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb  | 1 -
>  .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb   | 1 -
>  .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb | 1 -
>  .../recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb       | 1 -
>  meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb   | 1 -
>  meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb       | 1 -
>  meta-networking/recipes-irc/znc/znc_1.8.2.bb                | 1 -
>  .../wireguard/wireguard-module_1.0.20220627.bb              | 1 -
>  meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb   | 1 -
>  .../recipes-protocols/freediameter/freediameter_1.5.0.bb    | 1 -
>  meta-networking/recipes-protocols/frr/frr_10.3.bb           | 2 --
>  meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb | 1 -
>  meta-networking/recipes-protocols/openflow/openflow_git.bb  | 1 -
>  .../recipes-protocols/openlldp/openlldp_1.1.1.bb            | 1 -
>  meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb | 1 -
>  meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb    | 1 -
>  meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb  | 1 -
>  meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb   | 1 -
>  meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb  | 1 -
>  .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb      | 1 -
>  meta-networking/recipes-support/celt051/celt051_git.bb      | 1 -
>  meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb      | 1 -
>  meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb   | 1 -
>  .../recipes-support/dropwatch/dropwatch_1.5.4.bb            | 1 -
>  .../recipes-support/ettercap/ettercap_0.8.3.1.bb            | 1 -
>  meta-networking/recipes-support/geoip/geoip-perl_1.51.bb    | 1 -
>  meta-networking/recipes-support/geoip/geoip_1.6.12.bb       | 2 --
>  .../recipes-support/http-parser/http-parser_2.9.4.bb        | 1 -
>  meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb | 1 -
>  meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb      | 1 -
>  meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb     | 1 -
>  meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb  | 1 -
>  .../recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb     | 1 -
>  .../recipes-support/lowpan-tools/lowpan-tools_git.bb        | 1 -
>  meta-networking/recipes-support/mctp/mctp_2.1.bb            | 1 -
>  .../recipes-support/mdio-tools/mdio-netlink_1.3.1.bb        | 1 -
>  .../recipes-support/mdio-tools/mdio-tools_1.3.1.bb          | 1 -
>  meta-networking/recipes-support/mtr/mtr_0.95.bb             | 1 -
>  meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb    | 1 -
>  meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb    | 1 -
>  meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb      | 1 -
>  meta-networking/recipes-support/netcat/netcat_0.7.1.bb      | 1 -
>  meta-networking/recipes-support/netcf/netcf_0.2.8.bb        | 1 -
>  meta-networking/recipes-support/netperf/netperf_git.bb      | 1 -
>  .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb        | 1 -
>  meta-networking/recipes-support/nis/yp-tools_4.2.3.bb       | 1 -
>  meta-networking/recipes-support/ntimed/ntimed_git.bb        | 1 -
>  meta-networking/recipes-support/ntopng/ndpi_4.2.bb          | 1 -
>  meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb      | 1 -
>  meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb         | 1 -
>  .../recipes-support/open-isns/open-isns_0.102.bb            | 1 -
>  meta-networking/recipes-support/phytool/phytool.bb          | 1 -
>  meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb  | 1 -
>  meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb      | 1 -
>  meta-networking/recipes-support/spice/libcacard_2.8.1.bb    | 1 -
>  meta-networking/recipes-support/spice/spice-gtk_0.42.bb     | 1 -
>  .../recipes-support/spice/spice-guest-vdagent_0.22.1.bb     | 1 -
>  .../recipes-support/spice/spice-protocol_0.14.4.bb          | 1 -
>  meta-networking/recipes-support/spice/spice_git.bb          | 1 -
>  meta-networking/recipes-support/spice/usbredir_0.14.0.bb    | 1 -
>  .../recipes-support/strongswan/strongswan_6.0.1.bb          | 1 -
>  meta-networking/recipes-support/unbound/unbound_1.22.0.bb   | 1 -
>  meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb    | 1 -
>  .../recipes-support/wpan-tools/wpan-tools_0.10.bb           | 1 -
>  .../meta-python/recipes-bsp/rwmem/rwmem_1.2.bb              | 1 -
>  .../recipes-connectivity/netplan/netplan_1.1.2.bb           | 1 -
>  .../thingsboard-gateway/thingsboard-gateway_3.7.4.bb        | 1 -
>  .../meta-python/recipes-dbs/mongodb/mongodb_git.bb          | 1 -
>  .../meta-python/recipes-devtools/nanopb/nanopb.inc          | 1 -
>  .../meta-python/recipes-extended/lcdproc/lcdproc_git.bb     | 1 -
>  .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb       | 1 -
>  .../meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb    | 1 -
>  .../recipes-graphics/taisei/taisei_1.4.2.bb                 | 1 -
>  .../perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb | 1 -
>  meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb        | 1 -
>  meta-oe/recipes-benchmark/fio/fio_3.39.bb                   | 1 -
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb            | 1 -
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb             | 1 -
>  meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb      | 1 -
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb | 1 -
>  meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb         | 1 -
>  meta-oe/recipes-benchmark/mbw/mbw_2.0.bb                    | 1 -
>  meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb             | 1 -
>  meta-oe/recipes-benchmark/s-suite/s-suite_git.bb            | 1 -
>  .../recipes-benchmark/stressapptest/stressapptest_1.0.11.bb | 1 -
>  meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb       | 1 -
>  meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb  | 1 -
>  meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb        | 1 -
>  meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb                      | 1 -
>  meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb              | 1 -
>  meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb        | 2 --
>  .../dediprog-flasher/dediprog-flasher_1.14.20.bb            | 1 -
>  meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb            | 1 -
>  meta-oe/recipes-bsp/firmwared/firmwared_git.bb              | 1 -
>  meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb                   | 1 -
>  meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb                    | 1 -
>  meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb                   | 1 -
>  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb           | 2 --
>  meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb          | 1 -
>  meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb  | 1 -
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb         | 1 -
>  meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb         | 1 -
>  meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb        | 1 -
>  meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb      | 1 -
>  meta-oe/recipes-connectivity/libnet/libnet_1.3.bb           | 1 -
>  meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb        | 1 -
>  .../recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb   | 1 -
>  .../libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb     | 1 -
>  .../recipes-connectivity/libtorrent/libtorrent_0.14.0.bb    | 1 -
>  .../modemmanager/modemmanager_1.22.0.bb                     | 1 -
>  .../recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb  | 1 -
>  .../paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb                    | 1 -
>  .../recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb | 1 -
>  .../recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb    | 1 -
>  meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb    | 1 -
>  meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb  | 1 -
>  .../recipes-connectivity/transmission/transmission_4.0.6.bb | 1 -
>  meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb         | 1 -
>  meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb        | 1 -
>  meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb             | 1 -
>  meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb          | 1 -
>  meta-oe/recipes-core/emlog/emlog_git.bb                     | 2 --
>  meta-oe/recipes-core/glfw/glfw_3.3.8.bb                     | 1 -
>  meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb              | 1 -
>  meta-oe/recipes-core/mdbus2/mdbus2_git.bb                   | 1 -
>  meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb         | 2 --
>  meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb           | 1 -
>  meta-oe/recipes-core/ndctl/ndctl_v79.bb                     | 1 -
>  meta-oe/recipes-core/opencl/clpeak_1.1.4.bb                 | 1 -
>  meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 1 -
>  meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb      | 1 -
>  meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb        | 1 -
>  meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 1 -
>  meta-oe/recipes-core/packagegroups/packagegroup-basic.bb    | 1 -
>  meta-oe/recipes-core/packagegroups/packagegroup-boot.bb     | 1 -
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb  | 1 -
>  meta-oe/recipes-core/pim435/pim435_git.bb                   | 1 -
>  .../recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb    | 1 -
>  meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb           | 1 -
>  meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb | 1 -
>  meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb    | 1 -
>  meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb                  | 1 -
>  meta-oe/recipes-dbs/mysql/mariadb.inc                       | 2 --
>  meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb               | 1 -
>  .../recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb    | 1 -
>  meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb       | 1 -
>  .../android-tools/android-tools_5.1.1.r37.bb                | 1 -
>  meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb          | 1 -
>  meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb    | 1 -
>  meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb              | 1 -
>  .../recipes-devtools/concurrencykit/concurrencykit_git.bb   | 1 -
>  meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb     | 1 -
>  meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb      | 1 -
>  .../recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb   | 1 -
>  meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb          | 1 -
>  meta-oe/recipes-devtools/exprtk/exprtk_git.bb               | 1 -
>  meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb   | 1 -
>  meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb         | 1 -
>  meta-oe/recipes-devtools/flatcc/flatcc_git.bb               | 1 -
>  meta-oe/recipes-devtools/glade/glade_3.36.0.bb              | 6 ------
>  meta-oe/recipes-devtools/guider/guider_3.9.9.bb             | 1 -
>  meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb       | 1 -
>  meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb         | 1 -
>  .../json-schema-validator/json-schema-validator_2.2.0.bb    | 1 -
>  meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb           | 1 -
>  meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb           | 1 -
>  meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb           | 1 -
>  .../kconfig-frontends/kconfig-frontends_4.11.0.1.bb         | 1 -
>  meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb              | 1 -
>  meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb     | 1 -
>  meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb       | 1 -
>  meta-oe/recipes-devtools/libubox/libubox_git.bb             | 1 -
>  meta-oe/recipes-devtools/lshw/lshw_02.20.bb                 | 1 -
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb               | 1 -
>  meta-oe/recipes-devtools/luajit/luajit_git.bb               | 1 -
>  meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb         | 1 -
>  meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb             | 1 -
>  .../recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb   | 1 -
>  meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb         | 1 -
>  meta-oe/recipes-devtools/musl/musl-nscd_git.bb              | 1 -
>  meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb | 1 -
>  .../recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb  | 3 ---
>  .../packagegroups/packagegroup-sdk-target.bb                | 1 -
>  meta-oe/recipes-devtools/pahole/pahole_1.29.bb              | 1 -
>  meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb               | 1 -
>  meta-oe/recipes-devtools/perl/exiftool_12.89.bb             | 1 -
>  meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb         | 1 -
>  meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb       | 1 -
>  meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb        | 1 -
>  meta-oe/recipes-devtools/ply/ply_git.bb                     | 1 -
>  meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb         | 1 -
>  meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb       | 1 -
>  meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb        | 1 -
>  meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb        | 1 -
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb         | 1 -
>  meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb   | 1 -
>  meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb          | 1 -
>  meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb       | 1 -
>  .../squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb            | 1 -
>  meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb             | 1 -
>  meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb  | 1 -
>  .../unattended-upgrades/unattended-upgrades_2.9.1.bb        | 1 -
>  meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb         | 1 -
>  meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb                | 1 -
>  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                 | 1 -
>  meta-oe/recipes-devtools/yasm/yasm_git.bb                   | 1 -
>  meta-oe/recipes-extended/7zip/7zip_24.09.bb                 | 1 -
>  meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb                | 1 -
>  meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb       | 1 -
>  meta-oe/recipes-extended/brotli/brotli_1.1.0.bb             | 1 -
>  meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb  | 1 -
>  meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb   | 1 -
>  meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb       | 1 -
>  meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb      | 1 -
>  meta-oe/recipes-extended/etcd/etcd_3.5.7.bb                 | 1 -
>  meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb | 1 -
>  meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb          | 1 -
>  meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb       | 1 -
>  meta-oe/recipes-extended/hexedit/hexedit_1.6.bb             | 1 -
>  meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb           | 1 -
>  meta-oe/recipes-extended/iotop/iotop_1.30.bb                | 1 -
>  meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb     | 1 -
>  meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb   | 1 -
>  meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb          | 1 -
>  meta-oe/recipes-extended/libcec/libcec_7.0.0.bb             | 1 -
>  .../recipes-extended/libdivecomputer/libdivecomputer_git.bb | 2 --
>  meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb | 1 -
>  meta-oe/recipes-extended/libimobiledevice/libplist_git.bb   | 1 -
>  .../recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb   | 1 -
>  meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb | 1 -
>  meta-oe/recipes-extended/libleak/libleak_0.3.6.bb           | 1 -
>  meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb     | 1 -
>  meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb      | 1 -
>  meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb | 1 -
>  meta-oe/recipes-extended/libreport/libreport_2.17.15.bb     | 1 -
>  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb             | 1 -
>  meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb            | 2 --
>  meta-oe/recipes-extended/libyang/libyang_3.12.2.bb          | 1 -
>  meta-oe/recipes-extended/md5deep/md5deep_git.bb             | 1 -
>  meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb    | 1 -
>  meta-oe/recipes-extended/mraa/mraa_git.bb                   | 1 -
>  meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb       | 1 -
>  meta-oe/recipes-extended/p8platform/p8platform_git.bb       | 1 -
>  meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb        | 1 -
>  meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb     | 1 -
>  meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb            | 1 -
>  meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb               | 1 -
>  meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb                 | 1 -
>  .../recipes-extended/properties-cpp/properties-cpp_git.bb   | 1 -
>  meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb               | 1 -
>  .../redis-plus-plus/redis-plus-plus_1.3.11.bb               | 1 -
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb           | 1 -
>  meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb    | 1 -
>  meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb          | 1 -
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb        | 1 -
>  meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb           | 1 -
>  meta-oe/recipes-extended/sedutil/sedutil_git.bb             | 1 -
>  meta-oe/recipes-extended/snappy/snappy_1.1.10.bb            | 1 -
>  meta-oe/recipes-extended/socketcan/can-isotp_git.bb         | 1 -
>  meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb     | 1 -
>  meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb        | 1 -
>  meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb   | 1 -
>  meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb            | 1 -
>  meta-oe/recipes-extended/tipcutils/tipcutils_git.bb         | 1 -
>  meta-oe/recipes-extended/tmate/tmate_2.4.0.bb               | 1 -
>  meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb   | 1 -
>  meta-oe/recipes-extended/upm/upm_git.bb                     | 1 -
>  meta-oe/recipes-extended/valkey/valkey_8.1.1.bb             | 1 -
>  meta-oe/recipes-extended/wipe/wipe_0.24.bb                  | 1 -
>  meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb            | 1 -
>  meta-oe/recipes-extended/zlog/zlog_1.2.16.bb                | 1 -
>  meta-oe/recipes-extended/zram/zram_0.2.bb                   | 1 -
>  meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb                   | 1 -
>  meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb                 | 1 -
>  meta-oe/recipes-graphics/aml/aml_git.bb                     | 1 -
>  meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb                 | 1 -
>  meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb       | 1 -
>  meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb     | 1 -
>  meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb              | 1 -
>  meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb                 | 1 -
>  meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb                 | 1 -
>  meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb         | 1 -
>  meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb            | 1 -
>  meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb     | 1 -
>  .../recipes-graphics/libvncserver/libvncserver_0.9.14.bb    | 1 -
>  meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb         | 1 -
>  meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb           | 1 -
>  meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb           | 1 -
>  meta-oe/recipes-graphics/openbox/obconf_git.bb              | 1 -
>  .../panel-mipi-dbi/panel-mipi-dbi-native_git.bb             | 1 -
>  meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb            | 1 -
>  .../parallel-deqp-runner/parallel-deqp-runner_git.bb        | 1 -
>  meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb         | 1 -
>  meta-oe/recipes-graphics/surf/surf_2.1.bb                   | 1 -
>  meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb  | 1 -
>  meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb       | 1 -
>  meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb        | 1 -
>  meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb  | 1 -
>  .../recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb   | 1 -
>  .../ttf-fonts/ttf-ubuntu-font-family_0.83.bb                | 1 -
>  .../unclutter-xfixes/unclutter-xfixes_1.6.bb                | 1 -
>  meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb              | 1 -
>  meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb             | 1 -
>  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc          | 1 -
>  meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc       | 1 -
>  .../recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb | 1 -
>  meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb  | 1 -
>  meta-oe/recipes-graphics/yad/yad_6.0.bb                     | 1 -
>  meta-oe/recipes-graphics/ydotool/ydotool_git.bb             | 1 -
>  meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb      | 1 -
>  meta-oe/recipes-kernel/blktests/blktests.bb                 | 1 -
>  .../broadcom-bt-firmware_12.0.1.1105_p3.bb                  | 1 -
>  meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb  | 1 -
>  meta-oe/recipes-kernel/crash/crash.inc                      | 1 -
>  meta-oe/recipes-kernel/crash/crash_8.0.6.bb                 | 1 -
>  meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb          | 1 -
>  meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb          | 1 -
>  meta-oe/recipes-kernel/kpatch/kpatch.inc                    | 1 -
>  meta-oe/recipes-kernel/kpatch/kpatch_git.bb                 | 1 -
>  meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb       | 1 -
>  .../recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb   | 1 -
>  meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb         | 1 -
>  meta-oe/recipes-kernel/turbostat/turbostat.bb               | 2 --
>  meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb            | 1 -
>  meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb           | 1 -
>  meta-oe/recipes-multimedia/jack/a2jmidid_9.bb               | 1 -
>  meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb     | 1 -
>  meta-oe/recipes-multimedia/jack/jack_1.9.22.bb              | 1 -
>  meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb    | 1 -
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb     | 1 -
>  meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb         | 1 -
>  meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb            | 1 -
>  meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb         | 1 -
>  meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb  | 1 -
>  meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb                | 1 -
>  .../kernel-hardening-checker_0.6.10.bb                      | 1 -
>  meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb         | 2 --
>  .../spectre-meltdown-checker_0.46.bb                        | 1 -
>  meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb                 | 1 -
>  .../ace-cloud-editor/ace-cloud-editor_git.bb                | 1 -
>  meta-oe/recipes-support/bcu/bcu_1.1.115.bb                  | 1 -
>  meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb                | 1 -
>  meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb       | 1 -
>  meta-oe/recipes-support/btop/btop_1.4.3.bb                  | 1 -
>  meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb    | 1 -
>  meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb  | 1 -
>  meta-oe/recipes-support/composefs/composefs_1.0.8.bb        | 1 -
>  meta-oe/recipes-support/consolation/consolation_0.0.9.bb    | 1 -
>  meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb        | 1 -
>  meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb          | 1 -
>  meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb            | 1 -
>  meta-oe/recipes-support/crucible/crucible_2023.11.02.bb     | 1 -
>  meta-oe/recipes-support/ctre/ctre_3.9.0.bb                  | 1 -
>  meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb            | 1 -
>  meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb                | 1 -
>  meta-oe/recipes-support/daemonize/daemonize_git.bb          | 1 -
>  meta-oe/recipes-support/dc/double-conversion_3.3.1.bb       | 2 --
>  meta-oe/recipes-support/devmem2/devmem2_2.0.bb              | 1 -
>  meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb          | 1 -
>  meta-oe/recipes-support/dool/dool_1.3.4.bb                  | 2 --
>  meta-oe/recipes-support/driverctl/driverctl_0.115.bb        | 1 -
>  meta-oe/recipes-support/edid-decode/edid-decode_git.bb      | 1 -
>  meta-oe/recipes-support/eject/eject_2.1.5.bb                | 1 -
>  meta-oe/recipes-support/emacs/emacs_29.1.bb                 | 5 -----
>  meta-oe/recipes-support/espeak/espeak_1.48.04.bb            | 1 -
>  meta-oe/recipes-support/fbset/fbset_2.1.bb                  | 1 -
>  meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb           | 1 -
>  meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb           | 1 -
>  meta-oe/recipes-support/function2/function2_4.2.4.bb        | 1 -
>  meta-oe/recipes-support/gd/gd_2.3.3.bb                      | 1 -
>  meta-oe/recipes-support/gflags/gflags_2.2.2.bb              | 1 -
>  meta-oe/recipes-support/glog/glog_0.7.1.bb                  | 1 -
>  meta-oe/recipes-support/gnulib/gnulib_202401.bb             | 1 -
>  .../googlebenchmark/googlebenchmark_1.9.4.bb                | 1 -
>  meta-oe/recipes-support/gperftools/gperftools_2.16.bb       | 1 -
>  meta-oe/recipes-support/gpm/gpm_git.bb                      | 1 -
>  meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb       | 1 -
>  meta-oe/recipes-support/htop/htop_3.3.0.bb                  | 1 -
>  meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb   | 1 -
>  meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb          | 1 -
>  meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb | 1 -
>  .../recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb | 1 -
>  meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb          | 1 -
>  meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb     | 1 -
>  meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb            | 1 -
>  meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb     | 1 -
>  meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb        | 1 -
>  meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb      | 1 -
>  .../recipes-support/libcyusbserial/libcyusbserial_git.bb    | 1 -
>  meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb          | 1 -
>  meta-oe/recipes-support/libfann/libfann_git.bb              | 1 -
>  meta-oe/recipes-support/libharu/libharu_2.4.5.bb            | 1 -
>  meta-oe/recipes-support/libiio/libiio_0.26.bb               | 1 -
>  meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb  | 1 -
>  .../recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb   | 1 -
>  meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb  | 1 -
>  meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb      | 1 -
>  meta-oe/recipes-support/libnvme/libnvme_1.12.bb             | 1 -
>  meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb       | 1 -
>  meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb | 1 -
>  meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb     | 1 -
>  meta-oe/recipes-support/libp11/libp11_0.4.13.bb             | 1 -
>  meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb      | 1 -
>  meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb  | 2 --
>  meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb              | 1 -
>  meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb            | 1 -
>  meta-oe/recipes-support/libssh/libssh_0.11.1.bb             | 1 -
>  meta-oe/recipes-support/libteam/libteam_1.32.bb             | 1 -
>  meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb      | 1 -
>  meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb   | 1 -
>  meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb      | 1 -
>  meta-oe/recipes-support/liburing/liburing_2.9.bb            | 1 -
>  meta-oe/recipes-support/libusbg/libusbg_git.bb              | 1 -
>  meta-oe/recipes-support/libusbgx/libusbgx_git.bb            | 1 -
>  meta-oe/recipes-support/mcelog/mce-inject_git.bb            | 1 -
>  meta-oe/recipes-support/mcelog/mce-test_git.bb              | 1 -
>  meta-oe/recipes-support/mcelog/mcelog_204.bb                | 1 -
>  meta-oe/recipes-support/md4c/md4c_0.5.2.bb                  | 2 --
>  meta-oe/recipes-support/mg/mg_20230501.bb                   | 1 -
>  .../multipath-tools/multipath-tools_0.11.1.bb               | 1 -
>  meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb       | 1 -
>  meta-oe/recipes-support/opencv/ade_0.1.2.bb                 | 1 -
>  meta-oe/recipes-support/opencv/opencv_4.11.0.bb             | 2 --
>  meta-oe/recipes-support/opensc/opensc_0.26.1.bb             | 1 -
>  meta-oe/recipes-support/p910nd/p910nd_0.97.bb               | 2 --
>  meta-oe/recipes-support/pcp/pcp.inc                         | 1 -
>  meta-oe/recipes-support/pcp/pcp_6.3.7.bb                    | 1 -
>  meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb      | 1 -
>  meta-oe/recipes-support/picocom/picocom_2024.bb             | 1 -
>  meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb     | 1 -
>  meta-oe/recipes-support/pidgin/icyque_git.bb                | 1 -
>  .../recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb  | 1 -
>  meta-oe/recipes-support/poco/poco_1.13.3.bb                 | 1 -
>  meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb   | 1 -
>  meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb        | 1 -
>  meta-oe/recipes-support/re2/re2_2024.03.01.bb               | 1 -
>  meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb      | 1 -
>  meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb             | 1 -
>  meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb          | 1 -
>  meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb      | 1 -
>  meta-oe/recipes-support/sdmon/sdmon_git.bb                  | 1 -
>  meta-oe/recipes-support/serial/serial_1.2.1.bb              | 1 -
>  meta-oe/recipes-support/smarty/smarty_5.4.5.bb              | 1 -
>  meta-oe/recipes-support/snapper/snapper_0.11.2.bb           | 1 -
>  meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb       | 1 -
>  meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb             | 1 -
>  meta-oe/recipes-support/spitools/spitools_git.bb            | 2 --
>  .../recipes-support/switchtec-user/switchtec-user_4.2.bb    | 1 -
>  meta-oe/recipes-support/synergy/synergy_git.bb              | 1 -
>  .../systemd-netlogd/systemd-netlogd_1.4.4.bb                | 1 -
>  meta-oe/recipes-support/tbb/tbb_2022.1.0.bb                 | 3 ---
>  meta-oe/recipes-support/tio/tio_3.9.bb                      | 1 -
>  meta-oe/recipes-support/usbids/usbids_2025.04.01.bb         | 1 -
>  meta-oe/recipes-support/uthash/uthash_2.3.0.bb              | 1 -
>  meta-oe/recipes-support/utouch/utouch-evemu_git.bb          | 1 -
>  meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb    | 1 -
>  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb        | 1 -
>  meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb          | 1 -
>  meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb             | 1 -
>  meta-oe/recipes-test/bats/bats_1.12.0.bb                    | 1 -
>  meta-oe/recipes-test/catch2/catch2_3.8.1.bb                 | 1 -
>  meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb                 | 1 -
>  meta-oe/recipes-test/cpputest/cpputest_4.0.bb               | 1 -
>  meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb               | 1 -
>  meta-oe/recipes-test/evtest/evtest_1.35.bb                  | 1 -
>  meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb                | 1 -
>  meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb      | 1 -
>  .../recipes-test/linux-serial-test/linux-serial-test_git.bb | 1 -
>  meta-oe/recipes-test/pm-qa/pm-qa_git.bb                     | 1 -
>  meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb               | 1 -
>  meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb         | 1 -
>  meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb    | 1 -
>  meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb  | 2 --
>  meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb    | 1 -
>  .../libmodule/libmodule-build-tiny-perl_0.048.bb            | 1 -
>  .../recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb  | 1 -
>  .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb  | 1 -
>  .../telepathy/telepathy-python3_0.15.19.bb                  | 1 -
>  .../recipes-devtools/python/python3-asgiref_3.8.1.bb        | 1 -
>  meta-python/recipes-devtools/python/python3-astor_0.8.1.bb  | 1 -
>  .../python/python3-aws-iot-device-sdk-python_1.5.2.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-behave_1.2.6.bb | 1 -
>  .../recipes-devtools/python/python3-betamax_0.9.0.bb        | 1 -
>  .../recipes-devtools/python/python3-binwalk_2.3.4.bb        | 1 -
>  meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb | 1 -
>  .../recipes-devtools/python/python3-covdefaults_2.3.0.bb    | 1 -
>  .../recipes-devtools/python/python3-crypt-r_3.13.1.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb | 1 -
>  meta-python/recipes-devtools/python/python3-dasbus_1.7.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-dbussy_1.3.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-gcovr_8.3.bb    | 1 -
>  .../recipes-devtools/python/python3-inflection_0.5.1.bb     | 1 -
>  meta-python/recipes-devtools/python/python3-inotify_git.bb  | 1 -
>  .../recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb  | 1 -
>  .../python/python3-keras-applications_1.0.8.bb              | 1 -
>  meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb   | 1 -
>  .../recipes-devtools/python/python3-linux-procfs_0.7.3.bb   | 1 -
>  .../recipes-devtools/python/python3-monotonic_1.6.bb        | 1 -
>  .../recipes-devtools/python/python3-pillow_11.2.1.bb        | 1 -
>  meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb  | 1 -
>  .../recipes-devtools/python/python3-pyatspi_2.46.1.bb       | 1 -
>  .../recipes-devtools/python/python3-pybind11_2.13.6.bb      | 1 -
>  .../recipes-devtools/python/python3-pydantic_2.11.3.bb      | 1 -
>  meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb | 1 -
>  .../recipes-devtools/python/python3-pyhsslms_2.0.0.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb | 1 -
>  .../recipes-devtools/python/python3-pyruvate_1.2.1.bb       | 1 -
>  .../recipes-devtools/python/python3-pyyaml-include_2.2.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb    | 1 -
>  .../recipes-devtools/python/python3-schedutils_0.6.bb       | 1 -
>  meta-python/recipes-devtools/python/python3-systemd_235.bb  | 1 -
>  .../recipes-devtools/python/python3-tomli-w_1.2.0.bb        | 1 -
>  .../recipes-devtools/python/python3-uefi-firmware_1.12.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb | 1 -
>  meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb   | 2 --
>  .../python3-piccata/python3-piccata_2.0.3.bb                | 1 -
>  .../python-blivet/python3-blivetgui_2.6.0.bb                | 1 -
>  .../recipes-extended/python-cson/python3-cson_git.bb        | 1 -
>  meta-python/recipes-extended/python-meh/python3-meh_0.52.bb | 1 -
>  meta-python/recipes-extended/tuna/tuna_0.19.bb              | 1 -
>  .../recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb        | 1 -
>  .../recipes-httpd/apache-mod/apache-websocket_git.bb        | 1 -
>  meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb    | 1 -
>  meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb      | 1 -
>  meta-webserver/recipes-support/fcgi/fcgi_git.bb             | 1 -
>  meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb      | 1 -
>  .../xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb   | 1 -
>  meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb  | 1 -
>  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb      | 1 -
>  .../packagegroups/packagegroup-xfce-extended.bb             | 1 -
>  661 files changed, 703 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_g=
it.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> index 06051d8013..a5138b9553 100644
> --- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D "git://github.com/prasad-joshi/logfsprogs.g=
it;branch=3Dmaster;protocol=3Dh
>             "
>  SRCREV =3D "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
>
> -
>  EXTRA_OEMAKE =3D "CC=3D"${CC}" LD=3D"${LD}" AR=3D"${AR}""
>
>  do_install () {
> diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb b/me=
ta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
> index 890c8aecc0..bfa155bbc2 100644
> --- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
> +++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/owfs/owfs;branch=3Dmaster=
;protocol=3Dhttps \
>             file://owserver \
>             "
>
> -
>  inherit autotools-brokensep update-rc.d pkgconfig systemd
>
>  EXTRA_OECONF =3D " \
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.b=
b b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> index 97c7ad396e..1ffa3d9cf4 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> @@ -27,5 +27,4 @@ SRC_URI =3D "git://smbnetfs.git.sourceforge.net/gitroot=
/smbnetfs/smbnetfs;branch=3Dm
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[libsecret] =3D "--with-libsecret=3Dyes,--with-libsecret=3D=
no,libsecret"
>
> -
>  LDFLAGS:append:libc-musl =3D " -lexecinfo"
> diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fu=
se_3.4.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_=
3.4.bb
> index fc474e3238..23de13710c 100644
> --- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.=
bb
> +++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.=
bb
> @@ -14,5 +14,4 @@ SRCREV =3D "773f1853b043eeb64b7459f903a2c65bd096f9d9"
>  DEPENDS =3D "fuse3"
>  RDEPENDS:${PN} =3D "bash"
>
> -
>  inherit cmake pkgconfig
> diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git=
.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> index d30309a95a..af00fce319 100644
> --- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> +++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> @@ -25,7 +25,6 @@ SRCREV =3D "68030683543cccb4d942e3fedbcad1dc267e261c"
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  CFLAGS:append =3D " -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPE=
S"
>  EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
>
> diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb b/meta=
-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> index cf56cca84c..5416fb8031 100644
> --- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/openzfs/zfs;protocol=3Dht=
tps;branch=3Dzfs-2.2-release \
>             file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_=
t.patch \
>  "
>
> -
>  # Using both 'module' and 'autotools' classes seems a bit odd, they both
>  # define a do_compile function.
>  # That's why we opt for module-base, also this prevents module splitting=
.
> diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/=
meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> index 913b2c1d32..249e040189 100644
> --- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> +++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> @@ -21,7 +21,6 @@ UPSTREAM_CHECK_COMMITS =3D "1"
>
>  PV =3D "4.9+git"
>
> -
>  export HOSTCC =3D "${BUILD_CC}"
>  do_configure:prepend() {
>     # Replace sbin,bin paths with bitbake environment
> diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb b/meta=
-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
> index eda41010a9..1e3e4460b9 100644
> --- a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
> +++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
> @@ -10,5 +10,4 @@ RDEPENDS:${PN} =3D "fuse"
>  SRC_URI =3D "git://github.com/mpartel/bindfs;protocol=3Dhttps;branch=3Dm=
aster;tag=3D${PV}"
>  SRCREV =3D "a276dbe66faaf7af02d967a648f7598589bf5c5b"
>
> -
>  inherit autotools pkgconfig gettext
> diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmainten=
ance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintena=
nce_0.5.bb
> index 645e38ca49..0777bd0b58 100644
> --- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.=
5.bb
> +++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.=
5.bb
> @@ -20,7 +20,6 @@ UPSTREAM_CHECK_REGEX =3D "${BPN}/releases/tag/v(?P<pver=
>\d+(?:\.\d+)*)"
>
>  RDEPENDS:${PN} =3D "bash btrfs-tools"
>
> -
>  do_configure[noexec] =3D "1"
>  do_compile[noexec] =3D "1"
>
> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/me=
ta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> index a60fbec821..1a4d8e7602 100644
> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "46da6c398e70635a296245851fcedbc56c35e824"
>
> -
>  inherit autotools pkgconfig ptest
>
>  # Otherwise these tools will be detected from build host and
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.=
bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> index 68727b008e..878b71e465 100644
> --- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/jaegeuk/f2fs-tools.git;
>             "
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
> -
>  inherit pkgconfig autotools
>
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb b/meta=
-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
> index bdde0d311a..c9e929b4bd 100644
> --- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
> +++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
> @@ -15,5 +15,4 @@ SRC_URI =3D "git://github.com/Gregwar/fatcat.git;branch=
=3Dmaster;protocol=3Dhttps \
>
>  SRCREV =3D "99cb99fc86eb1601ac7ae27f5bba23add04d2543"
>
> -
>  inherit cmake
> diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb =
b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
> index 7f90bfd666..ae9e6abbcc 100644
> --- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
> +++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://salsa.debian.org/parted-team/fatresize=
.git;protocol=3Dhttps;branc
>            "
>  SRCREV =3D "12da22087de2ec43f0fe5af1237389e94619c483"
>
> -
>  DEPENDS =3D "parted"
>
>  inherit autotools pkgconfig
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v20=
24.07.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.0=
7.bb
> index 708bbfcf02..23af14f7de 100644
> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.b=
b
> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.b=
b
> @@ -11,7 +11,6 @@ SRC_URI =3D "\
>
>  SRCREV =3D "7a4a0c4f2c6c86aa46a40e3468e394fd4a237491"
>
> -
>  inherit meson pkgconfig
>
>  DEPENDS:append:libc-musl =3D " fts"
> diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.b=
b b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
> index a22e54e24c..22a279dd75 100644
> --- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
> +++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/westerndigitalcorporation=
/ufs-utils.git;protocol=3Dhtt
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${CC}" CFLAGS=
=3D"${CFLAGS}""
>
>  CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__ -D_GNU_SOURCE=
"
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.=
bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
> index 9e86b77c5e..3a15613b22 100644
> --- a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstes=
ts-dev.git;branch=3Dmaster;ta
>             file://0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-b=
uil.patch \
>             "
>
> -
>  # brokensep because m4/package_globals.m4 calls ". ./VERSION" (and that'=
s not the only issue)
>  inherit autotools-brokensep useradd pkgconfig
>
> diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.=
bb b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
> index 032532456d..acb1f8f426 100644
> --- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
> +++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
> @@ -20,7 +20,6 @@ SRC_URI =3D " \
>  "
>  SRCREV =3D "a0763a246a81188f60b0f9810143e49224dc752f"
>
> -
>  do_install:append() {
>    install -d ${D}${datadir}/applications
>    install -m644 ${UNPACKDIR}/polkit-gnome-authentication-agent-1.desktop=
 \
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.4.bb
> index 414f9c5203..d540245a38 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
> @@ -63,7 +63,6 @@ SRC_URI +=3D "file://0001-meson.build-dont-check-for-lg=
i.patch"
>  SRC_URI +=3D "file://0001-meson.build-require-iso-codes-native.patch"
>  SRCREV =3D "c1901c5be644ab8dcaf779b1f383bf5370bc90c6"
>
> -
>  PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
>  PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
>  PACKAGECONFIG[appdata-test] =3D "-Dappdata-test=3Denabled,-Dappdata-test=
=3Ddisabled,appstream-native"
> diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gno=
me/recipes-gimp/mypaint/libmypaint_git.bb
> index b64e91a765..7945de87cb 100644
> --- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> +++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
> @@ -19,7 +19,6 @@ SRCREV =3D "2768251dacce3939136c839aeca413f4aa4241d0"
>
>  PV =3D "1.6.1"
>
> -
>  EXTRA_AUTORECONF +=3D "-I m4"
>
>  do_configure:append() {
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb b/meta=
-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
> index 32a69a0707..8c91f66616 100644
> --- a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
> +++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "Configuration editor for dconf"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
>
> -
>  DEPENDS =3D " \
>      dconf \
>      desktop-file-utils-native \
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb b/meta-gnome/=
recipes-gnome/dconf/dconf_0.40.0.bb
> index c5c45a0264..e3645cd9f3 100644
> --- a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
> +++ b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
> @@ -7,7 +7,6 @@ SRC_URI[archive.sha256sum] =3D "cf7f22a4c9200421d8d3325c5=
c1b8b93a36843650c9f95d645
>
>  DEPENDS =3D "dbus glib-2.0 intltool-native"
>
> -
>  inherit gnomebase bash-completion vala
>
>  # I/O error : Attempt to load network entity http://docbook.sourceforge.=
net/release/xsl/current/manpages/docbook.xsl
> diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta=
-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> index 2bbf73dffc..8f443ca131 100644
> --- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> +++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/dsalt/devilspie2;branch=
=3Dmaster;protocol=3Dhttps \
>      file://devilspie2.desktop \
>  "
>
> -
>  inherit features_check pkgconfig gettext
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> diff --git a/meta-gnome/recipes-gnome/eog/eog_47.0.bb b/meta-gnome/recipe=
s-gnome/eog/eog_47.0.bb
> index a82cd60cc9..668427ec8a 100644
> --- a/meta-gnome/recipes-gnome/eog/eog_47.0.bb
> +++ b/meta-gnome/recipes-gnome/eog/eog_47.0.bb
> @@ -16,7 +16,6 @@ DEPENDS =3D " \
>      lcms \
>  "
>
> -
>  inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime=
-xdg features_check gtk-icon-cache
>
>  # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
> diff --git a/meta-gnome/recipes-gnome/evince/evince_48.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_48.0.bb
> index 31345542f2..0e19f78f81 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_48.0.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_48.0.bb
> @@ -25,7 +25,6 @@ DEPENDS =3D " \
>      zlib \
>  "
>
> -
>  inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introsp=
ection gettext mime-xdg gi-docgen features_check gtk-icon-cache
>
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'opengl', '', d)}"
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data=
-server.bb
> index c3c4e3eae5..e738bd8221 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
> @@ -50,7 +50,6 @@ PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH=
_KRB5=3DOFF,krb5"
>  PACKAGECONFIG[openldap] =3D "-DWITH_OPENLDAP=3DON,-DWITH_OPENLDAP=3DOFF,=
openldap"
>  PACKAGECONFIG[weather] =3D "-DENABLE_WEATHER=3DON,-DENABLE_WEATHER=3DOFF=
,libgweather4"
>
> -
>  # -ldb needs this on some platforms
>  LDFLAGS +=3D "-lpthread -lgmodule-2.0 -lgthread-2.0"
>
> diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb b/m=
eta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
> index 050f6803c7..b2f68f7b55 100644
> --- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
> +++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "An archive manager utility for the  GNOME En=
vironment"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
>
> -
>  DEPENDS =3D " \
>      desktop-file-utils-native \
>      glib-2.0-native \
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_48.0.bb
> index 92ddc143f6..2dcaad1f87 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
> @@ -18,7 +18,6 @@ DEPENDS =3D " \
>  REQUIRED_DISTRO_FEATURES =3D "x11 systemd pam polkit gobject-introspecti=
on-data"
>  GIR_MESON_OPTION =3D ""
>
> -
>  inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
>
>  SRC_URI +=3D "file://a3e0aca75e16aeafc171751028406b54f5ed8397.patch"
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.2.bb
> index 91b2221d7a..fd08164fe2 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
> @@ -3,7 +3,6 @@ SECTION =3D "x11/gnome"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
>
> -
>  DEPENDS =3D " \
>      appstream-glib-native \
>      desktop-file-utils-native \
> diff --git a/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb b/meta-gnome/reci=
pes-gnome/ghex/ghex_46.2.bb
> index f29ddbb6fd..f1a600511b 100644
> --- a/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
> +++ b/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "GHex - a hex editor for GNOME"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -
>  DEPENDS =3D " \
>      desktop-file-utils-native  \
>      glib-2.0-native \
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.84.1.bb
> index 55bd38c97c..719acf1508 100644
> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "Javascript bindings for GNOME"
>  LICENSE =3D "MIT & LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51e=
c48"
>
> -
>  DEPENDS =3D "mozjs-128 cairo"
>
>  inherit gnomebase gobject-introspection gettext features_check upstream-=
version-is-even pkgconfig multilib_script
> diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_46.1.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility=
_46.1.bb
> index 6f910c4c13..2ea777976f 100644
> --- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1=
.bb
> +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1=
.bb
> @@ -16,7 +16,6 @@ DEPENDS =3D " \
>      xz \
>  "
>
> -
>  inherit gnomebase gsettings gtk-icon-cache gettext features_check mime-x=
dg
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer=
_48.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.=
0.bb
> index e8d51a12df..b8b9556797 100644
> --- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.b=
b
> +++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.b=
b
> @@ -10,7 +10,6 @@ DEPENDS =3D " \
>      libadwaita \
>  "
>
> -
>  inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
>
>  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb b=
/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
> index 81c3c65a48..aa036e89c7 100644
> --- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
> @@ -25,7 +25,6 @@ DEPENDS =3D " \
>
>  RDEPENDS:${PN} =3D "localsearch"
>
> -
>  inherit gnomebase gettext gnome-help features_check
>
>  def gnome_verdir(v):
> diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.=
bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
> index 3bb1cb1651..de128da218 100644
> --- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
> @@ -14,7 +14,6 @@ DEPENDS =3D " \
>      systemd \
>  "
>
> -
>  inherit gnomebase gettext gsettings upstream-version-is-even features_ch=
eck
>
>  REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-d=
ata"
> diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_48.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-set=
tings-daemon_48.0.bb
> index 9a2948d432..44ff9c0673 100644
> --- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_48.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_48.0.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "Window navigation construction toolkit"
>  LICENSE =3D "LGPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
>
> -
>  inherit gnomebase gsettings gobject-introspection gettext features_check=
 upstream-version-is-even
>
>  DEPENDS =3D " \
> diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
> index 1a0f89b6fc..17c1cc6ca6 100644
> --- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "GNOME Shell is the graphical shell of the GN=
OME desktop environment"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -
>  DEPENDS =3D " \
>      libxml2-native \
>      gtk4 \
> diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_48.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system=
-monitor_48.1.bb
> index db07eaa27a..2a02c6ea93 100644
> --- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
48.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
48.1.bb
> @@ -17,7 +17,6 @@ DEPENDS =3D " \
>      libhandy \
>  "
>
> -
>  inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_c=
heck gettext
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_48.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.=
1.bb
> index 317d082940..c9d42d8ace 100644
> --- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.1.b=
b
> +++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.1.b=
b
> @@ -2,7 +2,6 @@ SUMMARY =3D "A simple text editor"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
>
> -
>  DEPENDS =3D " \
>      desktop-file-utils-native \
>      libadwaita \
> diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb b=
/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
> index a8d6a2ad69..107137d6ab 100644
> --- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS =3D "libhandy"
>
> -
>  inherit gnomebase gtk-icon-cache gobject-introspection features_check
>
>  # same as gnome-shell
> diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_4=
7.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
> index 3b087c148d..a7cb5c3e19 100644
> --- a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "This is gnome-user-share 43.0, a system for =
easy sharing of user file
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>
> -
>  DEPENDS =3D " \
>      glib-2.0-native \
>      glib-2.0 \
> diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb b/meta-gnome=
/recipes-gnome/gsound/gsound_1.0.3.bb
> index 6a50c22c73..5380e82b8b 100644
> --- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
> +++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
> @@ -7,7 +7,6 @@ DEPENDS =3D " \
>      libcanberra \
>  "
>
> -
>  VALA_MESON_OPTION =3D "enable_vala"
>
>  inherit gnomebase gettext gobject-introspection vala
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
> index 7076214a4d..661ca1f460 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
> @@ -18,7 +18,6 @@ PNAME =3D "gtksourceview"
>
>  S =3D "${UNPACKDIR}/${PNAME}-${PV}"
>
> -
>  inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-=
cache gobject-introspection vala
>
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
> diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.b=
b b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
> index b7c587d25f..fffe1a107e 100644
> --- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
> +++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
> @@ -10,4 +10,3 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
>  SRCREV =3D "941560af497148588783db991e8135f52a82574d"
>  SRC_URI =3D "git://github.com/gnome/libchamplain.git;branch=3Dmaster;pro=
tocol=3Dhttps"
>
> -
> diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb b/me=
ta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
> index f52c210ed4..8c996f4e7f 100644
> --- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
> +++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
> @@ -33,4 +33,3 @@ do_compile:append() {
>                libxklavier.pc
>  }
>
> -
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb b/meta-=
gnome/recipes-gnome/metacity/metacity_3.52.0.bb
> index 32f0801706..a5d6a4ab26 100644
> --- a/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
> @@ -17,7 +17,6 @@ DEPENDS =3D " \
>      libxpresent \
>  "
>
> -
>  # depends on startup-notification which depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_48.0.bb
> index 6f799ad57a..ecd80faf6f 100644
> --- a/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
> +++ b/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
> @@ -24,7 +24,6 @@ DEPENDS =3D " \
>      xwayland \
>  "
>
> -
>  inherit gnomebase gsettings gobject-introspection gettext features_check
>
>  SRC_URI[archive.sha256sum] =3D "9ca177fd5851a4077f17f6a888c45447b7d1163c=
9879580597a1fd837f47e57d"
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_48.2.bb
> index f867cd14d1..d3af6d3fad 100644
> --- a/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
> @@ -4,7 +4,6 @@ SECTION =3D "x11/gnome"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
> -
>  DEPENDS =3D " \
>      appstream-glib-native \
>      desktop-file-utils-native \
> diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.1.bb
> index 0483d3070d..553a8b96d5 100644
> --- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> +++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> @@ -3,7 +3,6 @@ HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
>  LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
>
> -
>  DEPENDS =3D " \
>      glib-2.0 \
>      glib-2.0-native \
> diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb b/meta-gnome/rec=
ipes-gnome/tepl/tepl_6.8.0.bb
> index f4d027ebf7..6f40d74f6e 100644
> --- a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> +++ b/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> @@ -18,7 +18,6 @@ DEPENDS =3D " \
>
>  inherit meson gobject-introspection gettext features_check pkgconfig
>
> -
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>  SRC_URI =3D "git://gitlab.gnome.org/swilmet/tepl;protocol=3Dhttps;branch=
=3Dmain"
>  SRCREV =3D "16ab2567257a053bd957699f89080fafd0999035"
> diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb b/meta=
-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
> index ffea1f76b3..6f13c9f666 100644
> --- a/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
> +++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
> @@ -11,7 +11,6 @@ DEPENDS =3D " \
>      zlib \
>  "
>
> -
>  inherit gnomebase gsettings gobject-introspection vala bash-completion f=
eatures_check
>
>  SRC_URI:append =3D " \
> @@ -74,7 +73,6 @@ EXTRA_OEMESON +=3D " \
>      -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
>  "
>
> -
>  FILES:${PN} +=3D " \
>      ${datadir} \
>      ${libdir}/localsearch-3.0 \
> diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/reci=
pes-gnome/yelp/yelp_42.2.bb
> index 14986f2650..64bf7a2a54 100644
> --- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> +++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> @@ -28,7 +28,6 @@ PACKAGECONFIG ??=3D "${PACKAGECONFIG_SOUP}"
>  PACKAGECONFIG[soup2] =3D "--with-webkit2gtk-4-0,,"
>  PACKAGECONFIG[soup3] =3D ",--with-webkit2gtk-4-0,"
>
> -
>  do_configure:prepend() {
>      export ITSTOOL=3D${STAGING_BINDIR_NATIVE}/itstool
>  }
> diff --git a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-=
clutter.bb b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-cl=
utter.bb
> index a3c274240a..f97c6cbd3f 100644
> --- a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter=
.bb
> +++ b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter=
.bb
> @@ -4,7 +4,6 @@
>
>  SUMMARY =3D "Clutter package groups"
>
> -
>  # clutter-1.0 gets debian renamed to libclutter-1.0-0
>  # clutter-gtk-1.0 gets debian renamed to libclutter-gtk-1.0-0
>  PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
> diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta=
-gnome/recipes-support/keybinder/keybinder_3.0.bb
> index bbd7c866e1..1ba92ed0d8 100644
> --- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> +++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> @@ -8,7 +8,6 @@ DEPENDS =3D "gtk+3 gobject-introspection-native \
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1f18f9c6d8b4cfcc7d7804a243a4c=
0b4"
>
> -
>  SRCREV =3D "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
>  PV =3D "3.0+git"
>  SRC_URI =3D "git://github.com/engla/keybinder.git;branch=3Dkeybinder-3.0=
;protocol=3Dhttps \
> diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb b/meta=
-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
> index f816cdf239..45f5a6baa0 100644
> --- a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
> +++ b/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
> @@ -15,7 +15,6 @@ DEPENDS =3D " \
>      libgudev \
>  "
>
> -
>  inherit meson pkgconfig
>
>  EXTRA_OEMESON =3D " \
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb b/meta-=
initramfs/recipes-devtools/dracut/dracut_106.bb
> index d59b357dc1..7d92431daf 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
> @@ -18,7 +18,6 @@ DEPENDS:append:libc-musl =3D " fts"
>
>  inherit bash-completion pkgconfig
>
> -
>  EXTRA_OECONF =3D "--prefix=3D${prefix} \
>                  --libdir=3D${nonarch_libdir} \
>                  --datadir=3D${datadir} \
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb=
 b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
> index 461d75e625..c185ab8471 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "git://git.infradead.org/mtd-utils.git;bran=
ch=3Dmaster \
>               file://0001-make-Add-compiler-includes-in-cflags.patch \
>               "
>
> -
>  EXTRA_OECONF +=3D "--disable-tests --without-jffs --without-ubifs"
>
>  PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
> diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb=
 b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> index 2df53ff38e..b223b59af0 100644
> --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> @@ -61,7 +61,6 @@ SRC_URI:append:aarch64 =3D " file://arm64_kexec-image-h=
eader.h-add-missing-le64toh
>
>  SRC_URI:append:powerpc =3D " file://powerpc-purgatory-Makefile-remove-un=
known-flags.patch"
>
> -
>  EXTRA_OECONF +=3D "--without-zlib --without-lzma --without-xen"
>
>  # fix purgatory/printf.c:2:10: fatal error: limits.h: No such file or di=
rectory
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb b/=
meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
> index 7d9b8a477f..4f3aa4c9ef 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
> @@ -10,7 +10,6 @@ inherit gnomebase pkgconfig vala gobject-introspection
>  SRC_URI[archive.sha256sum] =3D "c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3d=
ae2891e311a993a574f5a04f"
>  SRC_URI +=3D "file://0001-gupnp-enums.c.template-use-basename-instead-of=
-filen.patch"
>
> -
>  SYSROOT_PREPROCESS_FUNCS +=3D "gupnp_sysroot_preprocess"
>
>  gupnp_sysroot_preprocess () {
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18=
.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> index 5a42fc760c..eaeceb4c5f 100644
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
> @@ -12,7 +12,6 @@ SRCREV =3D "c540ce2431bdeac73359029d4592b45790e1d154"
>  SRC_URI =3D "git://github.com/pupnp/pupnp.git;protocol=3Dhttps;branch=3D=
branch-1.14.x \
>            "
>
> -
>  inherit autotools pkgconfig
>
>  EXTRA_OECONF +=3D "--enable-reuseaddr"
> diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb b/meta-multi=
media/recipes-dvb/oscam/oscam_1.20.bb
> index 37431dca05..36005a2973 100644
> --- a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
> +++ b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
> @@ -9,7 +9,6 @@ DEPENDS =3D "libusb1 openssl pcsc-lite"
>  SRCREV =3D "190d6dee96ca70f8b614932b1498332b1504632b"
>  SRC_URI =3D "git://repo.or.cz/oscam.git;protocol=3Dhttps;nobranch=3D1"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DDEFAULT_CS_CONFDIR=3D${sysconfdir} -DCMAKE_BUILD_TY=
PE=3DDebug"
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/met=
a-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> index 6a7f6c3f5d..1460e4735a 100644
> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -16,7 +16,6 @@ SRCREV =3D "cc602833684953fc3e6f1c89d4f08f6dfef179e3"
>  PV =3D "4.3+git"
>  PKGV =3D "4.3+git${GITPKGV}"
>
> -
>  EXTRA_OECONF +=3D "--arch=3D${TARGET_ARCH} \
>                   --disable-hdhomerun_static \
>                   --disable-ffmpeg_static \
> diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb b/meta-=
multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
> index 4b439e2ca5..7c68c3570c 100644
> --- a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
> +++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3D4fbd65380=
cdd255951079008b364516c"
>  SRC_URI =3D "git://github.com/Matroska-Org/libebml.git;branch=3Dv1.x;pro=
tocol=3Dhttps"
>  SRCREV =3D "1878e784321673561039a6a37076b2736f4dc98f"
>
> -
>  inherit pkgconfig cmake dos2unix
>
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON"
> diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb=
 b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
> index d38366a735..1d4e2a66b4 100644
> --- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
> +++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
> @@ -8,7 +8,6 @@ DEPENDS =3D "libebml"
>  SRC_URI =3D "git://github.com/Matroska-Org/libmatroska.git;branch=3Dv1.x=
;protocol=3Dhttps"
>  SRCREV =3D "f5315fddda2d434e47035c038549a808d8b8eac7"
>
> -
>  inherit pkgconfig cmake
>
>  #Static library enabled by default. It has been added in case you want t=
o use it dynamically.
> diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb b/meta-=
multimedia/recipes-multimedia/aom/aom_3.12.1.bb
> index 72baf58cf0..a89e87dbae 100644
> --- a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
> +++ b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "10aece4157eb79315da205f39e19bf6ab3ee30d0"
>  SRC_URI =3D "git://aomedia.googlesource.com/aom;protocol=3Dhttps;branch=
=3Dmain;tag=3Dv${PV} \
>             file://0001-subpel_variance_neon-Provide-prototypes-for-missi=
ng-.patch"
>
> -
>  inherit cmake pkgconfig
>
>  DEPENDS =3D " nasm-native"
> diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.b=
b b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
> index 162a51284e..31ae408929 100644
> --- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
> +++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
> @@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/Arkq/bluez-alsa.git;proto=
col=3Dhttps;branch=3Dmaster \
>
>  SRCREV =3D "959573c2cccef5cf074f5b2fa7941abbd699c5f4"
>
> -
>  PACKAGECONFIG ??=3D "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURE=
S', 'systemd', d)}"
>  PACKAGECONFIG[a2dpconf] =3D "--enable-a2dpconf,--disable-a2dpconf"
>  PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,fdk-aac"
> diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
> index d600e3b5e3..9235381e5d 100644
> --- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
> +++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548df=
daa3a6dc45d8793669"
>  SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;nobranch=3D1"
>  SRCREV =3D "42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa"
>
> -
>  DEPENDS:append:x86 =3D " nasm-native"
>  DEPENDS:append:x86-64 =3D " nasm-native"
>
> diff --git a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb b/met=
a-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
> index a330d769c5..7117be351a 100644
> --- a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
> +++ b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/foo86/dcadec.git;protocol=
=3Dhttps;branch=3Dmaster \
>             file://0001-define-BASELIB-make-variable.patch \
>            "
>
> -
>  inherit lib_package
>
>  EXTRA_OEMAKE =3D "CONFIG_SHARED=3D1 PREFIX=3D${prefix} BASELIB=3D${basel=
ib}"
> diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb =
b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
> index 97196bbcf2..8c7466b888 100644
> --- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
> +++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://NOTICE;md5=3D5985e1e12f4af=
a710d64ed7bfd291875"
>  SRC_URI =3D "git://github.com/mstorsjo/fdk-aac.git;protocol=3Dhttps;bran=
ch=3Dmaster"
>  SRCREV =3D "801f67f671929311e0c9952c5f92d6e147c7b003"
>
> -
>  SRC_URI[md5sum] =3D "fef453b5d6ee28ff302c600b8cded3e7"
>  SRC_URI[sha256sum] =3D "07c2a64b098eb48b2e9d729d5e778c08f7d22f28adc8da7c=
3f92c58da1cbbd8e"
>
> diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta=
-multimedia/recipes-multimedia/flite/flite_2.2.bb
> index af543af80e..ebae9c6c5f 100644
> --- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> +++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> @@ -13,7 +13,6 @@ SRC_URI +=3D "file://0001-Remove-defining-const-as-noth=
ing.patch"
>
>  SRCREV =3D "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
>
> -
>  EXTRA_OECONF +=3D "--enable-shared"
>
>  do_configure:append() {
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4=
.5.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
> index b8396209c5..b33c03e012 100644
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D " \
>  "
>  SRCREV =3D "9f2edaa3cbd456997cb420fb68b6f960faaafd12"
>
> -
>  inherit cmake pkgconfig lib_package
>
>  EXTRA_OECMAKE =3D "-Denable-floats=3DON -DLIB_SUFFIX=3D${@d.getVar('base=
lib').replace('lib', '')}"
> diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb =
b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
> index 6348f25a57..2acbf6755f 100644
> --- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
> +++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D25cdec9afe3=
f1f26212ead6bd2f7fac8"
>  SRC_URI =3D "git://github.com/gerbera/gerbera.git;protocol=3Dhttps;branc=
h=3Dmaster"
>  SRCREV =3D "870dd32d42f626dc2246d34b2224ffb6fd73e205"
>
> -
>  DEPENDS =3D "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp =
libnsl2"
>
>  SYSTEMD_SERVICE:${PN} =3D "gerbera.service"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0=
.8.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.=
bb
> index e1c903f6ed..3872a0f054 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D " \
>      file://0001-tracers-Fix-buffer-overflow.patch \
>  "
>
> -
>  EXTRA_OECONF +=3D " \
>      --disable-graphviz \
>      --enable-gtk-doc=3Dno \
> diff --git a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb =
b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> index 69d33c9f6a..b776df5617 100644
> --- a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/Avnu/libavtp.git;branch=3Dm=
aster;protocol=3Dhttps"
>  SRC_URI:append:libc-musl =3D " file://0001-provide-64bit-host-to-network=
-conversion-macros.patch"
>  SRCREV =3D "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
>
> -
>  inherit meson pkgconfig
>
>  EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> index c7fe631a43..2617661057 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> @@ -18,7 +18,6 @@ SRCREV =3D "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
>
>  PE =3D "1"
>
> -
>  DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtba=
se-native', '', d)}"
>
> diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.=
bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> index a509337894..b150eb0015 100644
> --- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D695b556799ab=
b2435c97a113cdca512f"
>  SRC_URI =3D "git://github.com/strukturag/libde265.git;branch=3Dmaster;pr=
otocol=3Dhttps"
>  SRCREV =3D "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
>
> -
>  inherit cmake pkgconfig
>
>  PACKAGECONFIG ?=3D "libsdl"
> diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0=
.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
> index 93bdc63b56..b437a18aba 100644
> --- a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://code.videolan.org/videolan/libdvbcsa.g=
it;protocol=3Dhttps;branch=3D
>             file://libdvbcsa.pc \
>  "
>
> -
>  inherit autotools lib_package pkgconfig
>
>  do_install:append() {
> diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.b=
b b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> index d7325abd7a..db57881834 100644
> --- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> +++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/OpenELEC/libsquish.git;pr=
otocol=3Dhttps;branch=3Dmaster
>             file://0001-Add-support-for-variable-libdir.patch \
>            "
>
> -
>  EXTRA_OEMAKE =3D "INSTALL_DIR=3D${D}${prefix} LIBDIR_SUFFIX=3D${@d.getVa=
r('baselib').replace('lib', '')} \
>                  ${@bb.utils.contains('TUNE_FEATURES', 'altivec', 'USE_AL=
TIVEC=3D1', '', d)}"
>
> diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb b/=
meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
> index 10e64e9878..facfe6edd8 100644
> --- a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
> +++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
> @@ -9,5 +9,4 @@ DEPENDS =3D "libusb jpeg"
>  SRC_URI =3D "git://github.com/libuvc/libuvc.git;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "68d07a00e11d1944e27b7295ee69673239c00b4b"
>
> -
>  inherit cmake pkgconfig
> diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/=
meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
> index b9093d19bb..326ece7ed2 100644
> --- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
> +++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
> @@ -27,5 +27,4 @@ SRC_URI =3D "git://github.com/MycroftAI/mimic1.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>
>  inherit autotools pkgconfig
>
> -
>  CPPFLAGS:append =3D " -Wno-error"
> diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/m=
eta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> index cb2a1865e8..d07117c9a8 100644
> --- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> +++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://git.code.sf.net/p/minidlna/git;branc=
h=3Dmaster;module=3Dgit \
>             file://0001-Add-compatibility-with-FFMPEG-7.0.patch \
>             "
>
> -
>  # This remove "--exclude=3Dautopoint" option from autoreconf argument to=
 avoid
>  # configure.ac:30: error: required file './ABOUT-NLS' not found
>  EXTRA_AUTORECONF =3D ""
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index 1ae43e8aef..953adde042 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz=
.git;branch=3Dmaster;protocol
>             file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_reque=
st_.patch \
>             "
>
> -
>  inherit cmake pkgconfig
>
>  EXTRA_OECMAKE:append:class-target =3D " -DIMPORT_EXECUTABLES=3D${STAGING=
_LIBDIR_NATIVE}/cmake/${BPN}/ImportExecutables.cmake"
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
> index d1dd4d7442..b7a232f426 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
> @@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;bra=
nch=3Dmaster;protocol=3Dhttps \
>             "
>  SRCREV =3D "063abb31a68f7ee92a246256eec4234ab8b7ed8b"
>
> -
>  EXTRA_OEMESON +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
-Dsystemd=3Denabled -Dsystemd_system_unit_dir=3D${systemd_system_unitdir} -=
Dsystemd_user_unit_dir=3D${systemd_system_unitdir}', '-Dsystemd=3Ddisabled'=
, d)} \
>      -Dadplug=3Ddisabled \
>      -Dsndio=3Ddisabled \
> diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb=
 b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
> index bdc4d7280c..325ffb0f4e 100644
> --- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
> +++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
> @@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/MycroftAI/mycroft-core.gi=
t;branch=3Dmaster;protocol=3Dht
>             file://mycroft.service \
>            "
>
> -
>  inherit systemd features_check
>
>  # Mycroft installs itself on the host
> diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3=
.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
> index 4204017c20..0d4be34780 100644
> --- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
> +++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
> @@ -10,7 +10,6 @@ DEPENDS =3D "zlib libsndfile1"
>  SRCREV =3D "dc7d7054a5b4f3bec1dc23a42fd616a0847af948"
>  SRC_URI =3D "git://github.com/kcat/openal-soft.git;protocol=3Dhttps;bran=
ch=3Dmaster"
>
> -
>  PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pipewire=
 pulseaudio', d)}"
>  PACKAGECONFIG[alsa] =3D "-DALSOFT_BACKEND_ALSA=3DON,-DALSOFT_BACKEND_ALS=
A=3DOFF,alsa-lib"
>  PACKAGECONFIG[oss] =3D "-DALSOFT_BACKEND_OSS=3DON,-DALSOFT_BACKEND_OSS=
=3DOFF"
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
> index e41cfd221c..f0dab4d0f4 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
> @@ -16,7 +16,6 @@ SRCREV =3D "83ada1e086f8fa49bf9652df2edd9ccee5efa48b"
>  BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
>  SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=
=3D${BRANCH};protocol=3Dhttps"
>
> -
>  inherit meson pkgconfig systemd gettext useradd
>
>  USERADD_PACKAGES =3D "${PN}"
> diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb =
b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
> index c02b45054f..64636f4789 100644
> --- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
> +++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D " \
>      git://git.ffmpeg.org/rtmpdump;branch=3Dmaster \
>  "
>
> -
>  CVE_STATUS_GROUPS +=3D "CVES_2015"
>  CVES_2015 =3D "CVE-2015-8270 CVE-2015-8271 CVE-2015-8272"
>  CVES_2015[status] =3D "fixed-version: patched in current git hash"
> diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/=
meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> index 9993837f19..cd94b4ea0f 100644
> --- a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> @@ -28,7 +28,6 @@ SRC_URI =3D "\
>  # https://lists.openembedded.org/g/openembedded-devel/message/109325
>  SRCREV =3D "df1282eb9af538ab1aadb6d66146e258451d4fe4"
>
> -
>  inherit autotools
>
>  PACKAGECONFIG ?=3D ""
> diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.b=
b b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
> index 8965c8ee75..5f72d20d57 100644
> --- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
> +++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
> @@ -10,7 +10,6 @@ PV .=3D "+git"
>  SRCREV =3D "f78ed25aced2dfea743867b8205a787bfb091340"
>  SRC_URI =3D "git://github.com/tinyalsa/tinyalsa;branch=3Dmaster;protocol=
=3Dhttps"
>
> -
>  inherit meson
>
>  # tinyalsa is built as a static library. Enable PIC to avoid relocation
> diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb=
 b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> index f195a4a654..0e3cea8ebb 100644
> --- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> +++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://gitlab.xiph.org/xiph/tremor.git;prot=
ocol=3Dhttps;branch=3Dmaster \
>  "
>  SRCREV =3D "7c30a66346199f3f09017a09567c6c8a3a0eedc8"
>
> -
>  inherit autotools pkgconfig
>
>  EXTRA_OECONF =3D "--enable-shared"
> diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.10.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.1=
0.bb
> index 8e50378bfd..42baa985fd 100644
> --- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.b=
b
> +++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.b=
b
> @@ -16,7 +16,6 @@ SRC_URI =3D " \
>      file://90-OE-disable-session-dbus-dependent-features.lua \
>  "
>
> -
>  inherit meson pkgconfig gobject-introspection systemd
>
>  GIR_MESON_ENABLE_FLAG =3D 'enabled'
> diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb=
 b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
> index 811a876885..363c1ab5f3 100644
> --- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
> +++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
> @@ -11,7 +11,6 @@ SRCREV =3D "ca1bf4b810e2d188d04cb6286f957008ee1b7681"
>  SRC_URI =3D "git://github.com/graeme-hill/crossguid;protocol=3Dhttps;bra=
nch=3Dmaster \
>             file://0001-include-missing-cstdint.patch"
>
> -
>  inherit cmake
>
>  do_install:append() {
> diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instrume=
nts_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instrument=
s_git.bb
> index b3953cf5c3..949b32a841 100644
> --- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git=
.bb
> +++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git=
.bb
> @@ -10,7 +10,6 @@ PV =3D "0.3.1+git"
>
>  SRC_URI =3D "git://github.com/kirushyk/gst-instruments.git;protocol=3Dht=
tps;branch=3Dmaster"
>
> -
>  inherit vala meson pkgconfig
>
>  FILES:${PN}-staticdev +=3D "${libdir}/gstreamer-1.0/*a"
> diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_=
1.9.6.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.=
6.bb
> index c5d497c468..8655b0ae56 100644
> --- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.b=
b
> +++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.b=
b
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd653=
80cdd255951079008b364516c \
>
>  DEPENDS =3D "glib-2.0 gdk-pixbuf"
>
> -
>  inherit gnomebase gobject-introspection vala features_check
>
>  SRC_URI =3D "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
> diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb b/m=
eta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
> index 9130b290b9..24928b0160 100644
> --- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
> +++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2909fcf6f09f=
fff8430463d91c08c4e1"
>  SRC_URI =3D "git://github.com/cisco/libsrtp.git;branch=3Dmain;protocol=
=3Dhttps"
>  SRCREV =3D "a566a9cfcd619e8327784aa7cff4a1276dc1e895"
>
> -
>  PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG[nss] =3D "-Dcrypto-library=3Dnss,, nss,,, openssl"
>  PACKAGECONFIG[openssl] =3D "-Dcrypto-library=3Dopenssl,, openssl,,, nss"
> diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb b/=
meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
> index 2f15abbcfd..31c2991c0a 100644
> --- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
> +++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
> @@ -8,7 +8,6 @@ SRCREV =3D "8e88e3590a19006362ea8b8dfdc18bb88b3cb3b5"
>
>  SRC_URI =3D "git://gitlab.freedesktop.org/realmd/adcli;protocol=3Dhttps;=
branch=3Dmaster"
>
> -
>  LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D23c2a5e0106b99d75238986559bb5=
fc6"
>
> diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb =
b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> index 17ef3c99cb..b80b9a6c3b 100644
> --- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> +++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> @@ -40,7 +40,6 @@ EXTRA_OEMAKE +=3D 'CC=3D"${CC}" CFLAGS=3D"${CFLAGS}" LD=
DLL=3D"${CCLD} ${LDFLAGS}" LD=3D"${
>                   ${@ "STATICLIB=3Dno" if d.getVar('DISABLE_STATIC') !=3D=
 "" else "" } \
>  '
>
> -
>  do_install() {
>         install -d ${D}/${bindir} ${D}/${libdir} ${D}/${includedir}
>         install -m 0755 ${B}/build/brssl ${D}/${bindir}
> diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/=
meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> index e1f01de8a0..eefc0b5aea 100644
> --- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> +++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/IanHarvey/bluepy.git;prot=
ocol=3Dhttps;branch=3Dmaster \
>             file://0001-bluepy-Fix-username-issue-with-tarballs.patch \
>            "
>
> -
>  inherit setuptools3 pkgconfig
>
>  RDEPENDS:${PN} =3D "bluez5"
> diff --git a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools=
_git.bb b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.=
bb
> index ab9cebaf38..ae3cc9447b 100644
> --- a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
> +++ b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D "\
>  "
>  SRCREV =3D "f65321736475429316f07ee94ec0deac8e46ec4a"
>
> -
>  inherit autotools pkgconfig
>
>  RDEPENDS:${PN} =3D "bluez5"
> diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1=
.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.=
bb
> index 835f33055a..e2a60f8d24 100644
> --- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
> +++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
> @@ -11,6 +11,5 @@ LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d=
69f5fce4486a80fdaf4a4263"
>
>  inherit cmake
>
> -
>  PACKAGECONFIG ??=3D "lksctp-tools"
>  PACKAGECONFIG[lksctp-tools] =3D "-DSCTP_SUPPORT=3Dtrue, -DSCTP_SUPPORT=
=3Dfalse, lksctp-tools"
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.=
bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> index 06d78b9328..63255ff8e5 100644
> --- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/civetweb/civetweb.git;bra=
nch=3Dmaster;protocol=3Dhttps \
>             file://0001-Unittest-Link-librt-and-libm-using-l-option.patch=
 \
>             "
>
> -
>  # civetweb supports building with make or cmake (although cmake lacks fe=
w features)
>  inherit cmake
>
> diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb b/=
meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
> index 23a439a989..25d7cacc07 100644
> --- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
> +++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
> @@ -14,5 +14,4 @@ SRC_URI =3D "git://github.com/snort3/libdaq.git;protoco=
l=3Dhttps;branch=3Dmaster \
>
>  SRCREV =3D "434f205cbd45de0961cc42e541b5bf54569e912a"
>
> -
>  FILES:${PN} +=3D "${libdir}/daq/*.so"
> diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb =
b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
> index 1dff38f0d5..fbe37675dc 100644
> --- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
> +++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/tomaszmrugalski/dibbler;b=
ranch=3Dmaster;protocol=3Dhttps
>             "
>  PV =3D "1.0.1+1.0.2RC1+git${SRCREV}"
>
> -
>  PACKAGECONFIG ??=3D "debug bind-reuse resolvconf dns-update"
>
>  PACKAGECONFIG[debug] =3D "--enable-debug,,,"
> diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3=
.2.7.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.=
bb
> index fea4d858ed..6b732b0a60 100644
> --- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
> +++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
> @@ -48,7 +48,6 @@ CVE_STATUS[CVE-2011-4966] =3D "fixed-version: The CPE i=
n the NVD database doesn't
>
>  PARALLEL_MAKE =3D ""
>
> -
>  LDFLAGS:append:powerpc =3D " -latomic"
>  LDFLAGS:append:mipsarch =3D " -latomic"
>  LDFLAGS:append:armv5 =3D " -latomic"
> diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.=
bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
> index f79121b142..6fec047571 100644
> --- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
> +++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
> @@ -10,7 +10,6 @@ SRCREV =3D "3dfbe889b1f65077efe579da34fc1d6819fcb7f3"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "libdnet-(?P<pver>\d+(\.\d+)+)"
>
> -
>  inherit autotools multilib_script pkgconfig
>
>  DEPENDS +=3D "libcheck"
> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850=
_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.=
5.3.bb
> index cfded66e41..82e8ff0fc6 100644
> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.=
bb
> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.=
bb
> @@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/mz-automation/${BPN}.git;=
branch=3Dv1.5;protocol=3Dhttps
>             file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInsta=
llD.patch \
>  "
>
> -
>  inherit cmake pkgconfig python3-dir python3native siteinfo
>
>  EXTRA_OECMAKE =3D " \
> diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.b=
b b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
> index 8dce6c5c4a..23aff50998 100644
> --- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
> +++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
> @@ -12,7 +12,6 @@ SECTION =3D "libs/networking"
>  SRC_URI =3D "git://github.com/nanomsg/nanomsg.git;protocol=3Dhttps;branc=
h=3Dmaster"
>  SRCREV =3D "fc3f684a80151a3319446fc96083a9ff384ee4fe"
>
> -
>  inherit cmake pkgconfig
>
>  # nanomsg documentation generation requires asciidoctor,
> diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb b/=
meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
> index 8d681f495e..ced1437ab3 100644
> --- a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
> +++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da41e579bb4=
326c21c774f8e51e41d8a3"
>  SRC_URI =3D "git://github.com/nanomsg/nng.git;branch=3Dmain;protocol=3Dh=
ttps"
>  SRCREV =3D "85fbe7f9e4642b554d0d97f2e3ff2aa12978691a"
>
> -
>  inherit cmake pkgconfig
>
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DNNG_ENABLE_NNGCAT=3DON"
> diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb b/=
meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
> index aac26966f1..d061df359b 100644
> --- a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
> +++ b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
> @@ -9,5 +9,4 @@ PV =3D "1.3.0"
>
>  SRC_URI =3D "git://github.com/cwzx/nngpp;branch=3Dmaster;protocol=3Dhttp=
s"
>
> -
>  inherit cmake
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.52.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.52.0.bb
> index b8c6a936ad..e097bf7d84 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.52.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.52.0.bb
> @@ -47,7 +47,6 @@ SRC_URI:append:libc-musl =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'ld-is-lld',
>
>  SRCREV =3D "995a28fa1ccc54ad22e794294c3c6783cc3f30ed"
>
> -
>  # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
>  NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??=3D "auto"
>
> @@ -122,7 +121,6 @@ PACKAGECONFIG[wwan] =3D ",,"
>  # The following PACKAGECONFIG is used to determine whether NM is managin=
g /etc/resolv.conf itself or not
>  PACKAGECONFIG[man-resolv-conf] =3D ",,"
>
> -
>  PACKAGES =3D+ " \
>      libnm \
>      ${PN}-adsl \
> @@ -144,7 +142,6 @@ INITSCRIPT_PACKAGES =3D "${PN}-daemon"
>  NETWORKMANAGER_PLUGINDIR =3D "${libdir}/NetworkManager/${PV}"
>  NETWORKMANAGER_DISPATCHERDIR =3D "${nonarch_libdir}/NetworkManager/dispa=
tcher.d"
>
> -
>  SUMMARY:libnm =3D "Libraries for adding NetworkManager support to applic=
ations"
>  FILES:libnm =3D "\
>      ${libdir}/libnm.so.* \
> @@ -276,7 +273,6 @@ ALTERNATIVE:${PN}-daemon =3D "${@bb.utils.contains('P=
ACKAGECONFIG','man-resolv-con
>  ALTERNATIVE_TARGET[resolv-conf] =3D "${@bb.utils.contains('PACKAGECONFIG=
','man-resolv-conf','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
>  ALTERNATIVE_LINK_NAME[resolv-conf] =3D "${@bb.utils.contains('PACKAGECON=
FIG','man-resolv-conf','${sysconfdir}/resolv.conf','',d)}"
>
> -
>  # The networkmanager package is an empty meta package which weakly depen=
ds on all the compiled features.
>  # Install this package to get all plugins and related dependencies insta=
lled. Alternatively just install
>  # plugins and related dependencies e.g. by installing networkmanager-wif=
i or networkmanager-wwan
> diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect=
_9.12.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_9.1=
2.bb
> index e1027747b6..b49c149b01 100644
> --- a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.b=
b
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.b=
b
> @@ -21,7 +21,6 @@ PACKAGECONFIG[libproxy]  =3D "--with-libproxy,--without=
-libproxy,libproxy,"
>  # not config defaults
>  PACKAGECONFIG[pcsc-lite] =3D "--with-libpcsclite,--without-libpcsclite,p=
csc-lite,"
>
> -
>  inherit autotools pkgconfig bash-completion
>
>  EXTRA_OECONF +=3D "--with-vpnc-script=3D${sysconfdir}/vpnc/vpnc-script \
> diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortiv=
pn_1.23.1.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortiv=
pn_1.23.1.bb
> index 9823d772a3..5b0c6c7076 100644
> --- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23=
.1.bb
> +++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23=
.1.bb
> @@ -12,7 +12,6 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'systemd', d)}"
>  PACKAGECONFIG[resolvconf] =3D "--with-resolvconf=3D${base_sbindir}/resol=
vconf --enable-resolvconf,--with-resolvconf=3DDISABLED,,"
>  PACKAGECONFIG[systemd] =3D "--with-systemdsystemunitdir=3D${systemd_syst=
em_unitdir},--without-systemdsystemunitdir,,"
>
> -
>  inherit autotools pkgconfig systemd
>
>  EXTRA_OECONF =3D " \
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_gi=
t.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> index 009a6ef88c..c512906915 100644
> --- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> @@ -14,7 +14,6 @@ PV =3D "0.1+git"
>  SRC_URI =3D "git://github.com/openthread/openthread.git;protocol=3Dhttps=
;branch=3Dmain \
>             "
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DOT_DAEMON=3DON \
> diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git=
.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> index 9c64872917..860240d20b 100644
> --- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "gitsm://github.com/openthread/wpantund.git=
;protocol=3Dhttps;branch=3Dmast
>             file://basename.patch \
>             "
>
> -
>  inherit pkgconfig perlnative autotools
>
>  # There has not been a wpantund release as of yet that includes these fi=
xes.
> diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/=
meta-networking/recipes-connectivity/relayd/relayd_git.bb
> index 17745da806..002a283bac 100644
> --- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> +++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> @@ -12,7 +12,6 @@ PV =3D "0.0.1+git"
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit cmake
>
>  CFLAGS:append:toolchain-clang =3D " -Wno-error=3Dgnu-variable-sized-type=
-not-at-end"
> diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb=
 b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
> index faaf393529..42afe7eb97 100644
> --- a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
> +++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
> @@ -4,14 +4,12 @@ SECTION =3D "comm"
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later "
>  LIC_FILES_CHKSUM =3D "file://sethdlc.c;endline=3D10;md5=3D90f936879e9f8b=
755a138aeb348782eb"
>
> -
>  SRC_URI =3D "https://www.kernel.org/pub/linux/utils/net/hdlc/${BP}.tar.g=
z \
>             file://sethdlc-fix-host-contamination.patch \
>  "
>  SRC_URI[md5sum] =3D "9016878156a5eadb06c0bae71cc5c9ab"
>  SRC_URI[sha256sum] =3D "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706=
bd5b3d4f6ab6b04e"
>
> -
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  DEPENDS =3D "virtual/kernel"
>
> @@ -22,7 +20,6 @@ do_compile:prepend () {
>      oe_runmake clean
>  }
>
> -
>  do_install() {
>      install -d ${D}/${bindir}
>      install sethdlc ${D}/${bindir}/
> diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb=
 b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
> index e9169a050f..d47d039b12 100644
> --- a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/snort3/snort3.git;protoco=
l=3Dhttps;branch=3Dmaster \
>
>  SRCREV =3D "6a11279883a8584e06ad9ab2df162c639961cd61"
>
> -
>  PACKAGES =3D+ "${PN}-scripts"
>
>  inherit cmake pkgconfig
> diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/met=
a-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> index c479eefba0..fb56b9e169 100644
> --- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> +++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> @@ -38,7 +38,6 @@ RRECOMMENDS:${PN} =3D " \
>                       kernel-module-nf-recent \
>  "
>
> -
>  do_configure:prepend() {
>      if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',=
d)}; then
>          sed -i -e 's|/lib|${nonarch_base_libdir}|' ${S}/setup.py
> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/me=
ta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> index 5d9d2634a0..019ef1c026 100644
> --- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> +++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> @@ -29,7 +29,6 @@ PACKAGECONFIG[openssl] =3D ",,openssl"
>
>  PACKAGES =3D+ "${PN}-script"
>
> -
>  inherit perlnative pkgconfig
>
>  #EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.b=
b b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> index af591cfd7a..9f72a9ae50 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
> @@ -20,7 +20,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "b077c81eb635392e694ccedbab8b644297ec0285"
>
> -
>  inherit autotools ptest
>
>  EXTRA_OECONF +=3D "--enable-certreq --enable-dtls --enable-opensslextra =
--enable-certext --enable-certgen"
> diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb b/meta-=
networking/recipes-daemons/atftp/atftp_0.8.0.bb
> index eca004302b..317b2b1cd4 100644
> --- a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
> +++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://git.code.sf.net/p/atftp/code;branch=
=3Dmaster;protocol=3Dhttps \
>             file://atftpd.service \
>  "
>
> -
>  inherit autotools update-rc.d systemd
>
>  PACKAGECONFIG ??=3D "tcp-wrappers"
> @@ -23,7 +22,6 @@ INITSCRIPT_PACKAGES =3D "${PN}d"
>  INITSCRIPT_NAME:${PN}d =3D "atftpd"
>  INITSCRIPT_PARAMS:${PN}d =3D "defaults 80"
>
> -
>  EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS} -std=3Dgnu89'"
>
>  do_install:append() {
> diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-=
networking/recipes-daemons/ippool/ippool_1.3.bb
> index ede4491309..6591a5648b 100644
> --- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
> +++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
> @@ -55,7 +55,6 @@ do_compile:prepend() {
>      sed -i -e "s:-I/usr/include/pppd:-I=3D/usr/include/pppd:" ${S}/pppd/=
Makefile
>  }
>
> -
>  do_install() {
>      oe_runmake DESTDIR=3D${D} install
>
> @@ -73,7 +72,6 @@ do_install() {
>          ${D}/opt/${BPN}/test_procs.tcl
>  }
>
> -
>  PACKAGES =3D+ "${PN}-test"
>
>  FILES:${PN} +=3D "${libdir}/pppd/${PPPD_VERSION}/ippool.so"
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-=
initiator-utils_2.1.11.bb b/meta-networking/recipes-daemons/iscsi-initiator=
-utils/iscsi-initiator-utils_2.1.11.bb
> index db4a4313a4..5f5a738a40 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiat=
or-utils_2.1.11.bb
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiat=
or-utils_2.1.11.bb
> @@ -43,7 +43,6 @@ EXTRA_OEMAKE =3D ' \
>      SED=3Dsed \
>  '
>
> -
>  do_configure () {
>      cd ${S}/iscsiuio ; autoreconf --install; ./configure ${EXTRA_OECONF}
>  }
> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd=
-dispatcher_2.2.4.bb b/meta-networking/recipes-daemons/networkd-dispatcher/=
networkd-dispatcher_2.2.4.bb
> index e7db8a948b..46de366b19 100644
> --- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispat=
cher_2.2.4.bb
> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispat=
cher_2.2.4.bb
> @@ -14,7 +14,6 @@ REQUIRED_DISTRO_FEATURES =3D "systemd gobject-introspec=
tion-data"
>  SRCREV =3D "dfd26d72793914eb3da910ef8c71de6d7c8942a2"
>  SRC_URI =3D "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=3Dh=
ttps;nobranch=3D1"
>
> -
>  SYSTEMD_PACKAGES =3D "${PN}"
>  SYSTEMD_SERVICE:${PN} =3D "networkd-dispatcher.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb b/m=
eta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
> index 65dd2f9561..13364b91ed 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/proftpd/proftpd.git;branc=
h=3D${BRANCH};protocol=3Dhttps;
>             file://proftpd.service \
>             "
>
> -
>  inherit autotools-brokensep useradd update-rc.d systemd multilib_script
>
>  # patch releases have character after version
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/m=
eta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> index b5a2b9dae0..35df023242 100644
> --- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> @@ -12,7 +12,6 @@ LICENSE =3D "BSD-4-Clause"
>  LIC_FILES_CHKSUM =3D "file://MCONFIG.in;beginline=3D1;endline=3D9;md5=3D=
c28ba5adb43041fae4629db05c83cbdd \
>                      file://tftp/tftp.c;beginline=3D1;endline=3D32;md5=3D=
988c1cba99d70858a26cd877209857f4"
>
> -
>  SRC_URI =3D "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-h=
pa-${PV}.tar.bz2 \
>             file://tftp-0.40-remap.patch \
>             file://tftp-0.42-tftpboot.patch \
> @@ -92,7 +91,6 @@ ALTERNATIVE:${PN} =3D "tftp"
>  ALTERNATIVE_TARGET[tftp] =3D "${bindir}/tftp-hpa"
>  ALTERNATIVE_PRIORITY =3D "100"
>
> -
>  SYSTEMD_PACKAGES =3D "tftp-hpa-server"
>  SYSTEMD_SERVICE:tftp-hpa-server =3D "tftpd-hpa.socket tftpd-hpa.service"
>  SYSTEMD_AUTO_ENABLE:tftp-hpa-server =3D "enable"
> diff --git a/meta-networking/recipes-daemons/vblade/vblade_25.bb b/meta-n=
etworking/recipes-daemons/vblade/vblade_25.bb
> index f73e72442b..e6d441fa86 100644
> --- a/meta-networking/recipes-daemons/vblade/vblade_25.bb
> +++ b/meta-networking/recipes-daemons/vblade/vblade_25.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/OpenAoE/vblade;branch=3Dm=
aster;protocol=3Dhttps \
>             file://volatiles.99_vblade \
>            "
>
> -
>  UPSTREAM_CHECK_URI =3D "https://github.com/OpenAoE/vblade/archive/"
>
>  inherit update-rc.d systemd
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
> index 9b2be6236b..c6d90ee9a4 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
> @@ -31,7 +31,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b2=
8336613aed9dd47b1271 \
>                          file://LICENSE;md5=3D654df2042d44b8cac8a5654fc5b=
e63eb"
>  SRC_URI[sha256sum] =3D "26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736=
df1f278c70bc91d3"
>
> -
>  PACKAGECONFIG ??=3D "tcp-wrappers"
>  PACKAGECONFIG[tcp-wrappers] =3D ",,tcp-wrappers"
>
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb b/=
meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> index a4e5f5ca46..6fc994a90a 100644
> --- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/obgm/libcoap.git;branch=
=3Dmain;protocol=3Dhttps \
>             "
>  SRCREV =3D "7cf7465b784baded4de183290c547d582becfd28"
>
> -
>  inherit autotools manpages pkgconfig ptest
>
>  DEPENDS +=3D "ctags-native"
> diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.=
bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
> index fdef5473ef..eb70089c43 100644
> --- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
> +++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
> @@ -20,7 +20,6 @@ SRCREV =3D "f7a64114b35fd8ee63ce07290f8a2dffd52b215f"
>  SRC_URI =3D "git://github.com/secdev/scapy.git;branch=3Dmaster;protocol=
=3Dhttps \
>             file://run-ptest"
>
> -
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
>  inherit python_setuptools_build_meta ptest
> diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb=
 b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
> index 06b2fa4d2d..9737bee31c 100644
> --- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
> +++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
> @@ -20,7 +20,6 @@ UPSTREAM_CHECK_URI =3D "https://github.com/kronosnet/kr=
onosnet/releases"
>
>  inherit autotools pkgconfig
>
> -
>  # libknet/transport_udp.c:326:48: error: comparison of integers of diffe=
rent signs: 'unsigned long' and 'int' [-Werror,-Wsign-compare]
>  # for (cmsg =3D CMSG_FIRSTHDR(&msg);cmsg; cmsg =3D CMSG_NXTHDR(&msg, cms=
g)) {
>  #                                                             ^~~~~~~~~~=
~~~~~~~~~~~~~
> diff --git a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb b/meta-ne=
tworking/recipes-extended/tgt/tgt_1.0.90.bb
> index a110d556a3..fea4e07029 100644
> --- a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
> +++ b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
> @@ -17,7 +17,6 @@ SRC_URI +=3D "file://tgtd.init \
>              file://tgtd \
>  "
>
> -
>  CONFFILES:${PN} +=3D "${sysconfdir}/tgt/targets.conf"
>
>  inherit update-rc.d systemd
> diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-i=
ptables-firewall_2.1.2.bb b/meta-networking/recipes-filter/arno-iptables-fi=
rewall/arno-iptables-firewall_2.1.2.bb
> index 20ba132fd0..f0634f31f4 100644
> --- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables=
-firewall_2.1.2.bb
> +++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables=
-firewall_2.1.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://gpl_license.txt;md5=3D11c7b6=
5c4a4acb9d5175f7e9bf99c403"
>  SRCREV =3D "c8dfd85b9e8e453e279525f30c1e3184c092f036"
>  SRC_URI =3D "git://github.com/arno-iptables-firewall/aif;branch=3Dmaster=
;protocol=3Dhttps"
>
> -
>  inherit systemd
>
>  do_install() {
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log=
_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.=
0.2.bb
> index a6e6b9b153..bb119d9b63 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.=
bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.=
bb
> @@ -9,5 +9,4 @@ SRCREV =3D "b0e4be94c0b8f68d4e912402b93a130063c34e17"
>
>  SRC_URI =3D "git://git.netfilter.org/libnetfilter_log;branch=3Dmaster"
>
> -
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-que=
ue_1.0.5.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queu=
e_1.0.5.bb
> index ccaa80f5ff..40153acf19 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.=
5.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.=
5.bb
> @@ -11,7 +11,6 @@ SRCREV =3D "2ff321690b8dafeca99ee8e9cafac71e36f292b9"
>  SRC_URI =3D "git://git.netfilter.org/libnetfilter_queue;branch=3Dmaster =
\
>             "
>
> -
>  inherit autotools pkgconfig
>
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0=
.2.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
> index 2778185618..c7fd0cf8e1 100644
> --- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
> +++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
> @@ -8,7 +8,6 @@ HOMEPAGE =3D "https://www.netfilter.org/projects/libnfnet=
link/index.html"
>  SECTION =3D "libs"
>  LICENSE =3D "GPL-2.0-or-later"
>
> -
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
>
>  SRC_URI =3D "https://www.netfilter.org/projects/libnfnetlink/files/${BPN=
}-${PV}.tar.bz2 \
> diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb b/=
meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
> index abcebceab8..e70b9efcbf 100644
> --- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
> +++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://git.netfilter.org/libnftnl;branch=3Dma=
ster;tag=3D${BP} \
>             "
>  SRCREV =3D "17190762f33f78090f5ff99a436c4cb866ac3ccd"
>
> -
>  inherit autotools pkgconfig ptest
>
>  DEPENDS =3D "libmnl"
> diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb b/meta=
-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> index febcf5147c..7c77d33753 100644
> --- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> +++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D "git://git.netfilter.org/ulogd2;branch=3Dma=
ster \
>  "
>  SRCREV =3D "79aa980f2df9dda0c097e8f883a62f414b9e5138"
>
> -
>  inherit autotools manpages pkgconfig systemd update-rc.d
>
>  PACKAGECONFIG ?=3D "dbi json nfacct nfct nflog pcap sqlite3 ulog"
> diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networki=
ng/recipes-irc/znc/znc_1.8.2.bb
> index 7356115d53..49f1a4168e 100644
> --- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
> +++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "gitsm://github.com/znc/znc.git;branch=3Dmast=
er;protocol=3Dhttps"
>
>  SRCREV =3D "bf253640d33d03331310778e001fb6f5aba2989e"
>
> -
>  inherit autotools-brokensep pkgconfig
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.=
0.20220627.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1=
.0.20220627.bb
> index d80bdd87ab..94d5c7996f 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220=
627.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220=
627.bb
> @@ -22,7 +22,6 @@ MODULES_INSTALL_TARGET =3D "module-install"
>  RRECOMMENDS:${PN} =3D "kernel-module-xt-hashlimit"
>  MODULE_NAME =3D "wireguard"
>
> -
>  # WireGuard has been merged into Linux kernel >=3D 5.6 and therefore thi=
s compatibility module is no longer required.
>  # OE-core post dunfell has moved to use kernel 5.8 which now means we ca=
nt build this module in world builds
>  # for reference machines e.g. qemu
> diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb b/=
meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
> index cc69f1448a..4c383cad37 100644
> --- a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
> +++ b/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
> @@ -17,7 +17,6 @@ SRCREV =3D "3d61ea1e843e2c5f9706c74d1adad4e1d24d44b9"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "babeld-(?P<pver>\d+(\.\d+)+)"
>
> -
>  EXTRA_OEMAKE +=3D "CFLAGS=3D'${CFLAGS}'"
>
>  do_compile () {
> diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_=
1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.=
0.bb
> index 89b2572c04..8b84676a4d 100644
> --- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.b=
b
> +++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.b=
b
> @@ -27,7 +27,6 @@ SRC_URI =3D "git://github.com/freeDiameter/freeDiameter=
;protocol=3Dhttps;branch=3Dmast
>      file://0001-fixes-for-gcc-15.patch \
>      "
>
> -
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D868c059b6147748b1d621e500feea=
c4f"
>
> diff --git a/meta-networking/recipes-protocols/frr/frr_10.3.bb b/meta-net=
working/recipes-protocols/frr/frr_10.3.bb
> index f0f3f34ab3..bad07457e1 100644
> --- a/meta-networking/recipes-protocols/frr/frr_10.3.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_10.3.bb
> @@ -9,7 +9,6 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \
>                      file://doc/licenses/LGPL-2.1;md5=3D4fbd65380cdd25595=
1079008b364516c"
>
> -
>  SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=
=3Dstable/10.3 \
>             file://frr.pam \
>             "
> @@ -20,7 +19,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "frr-(?P<pver>\d+(\.\d+)=
+)$"
>
>  CVE_PRODUCT =3D "frrouting"
>
> -
>  inherit autotools-brokensep python3native pkgconfig useradd systemd
>
>  DEPENDS:class-native =3D "bison-native elfutils-native"
> diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb =
b/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
> index b7f5112197..53ac161dd7 100644
> --- a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
> +++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
> @@ -21,7 +21,6 @@ SRC_URI =3D " \
>      file://0001-fix-build-do-not-install-git-files.patch \
>  "
>
> -
>  inherit cmake python3native
>
>  EXTRA_OECMAKE +=3D "\
> diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b=
/meta-networking/recipes-protocols/openflow/openflow_git.bb
> index 1588245f8a..a96915cfc1 100644
> --- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
> +++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
> @@ -37,7 +37,6 @@ EXTRA_OECONF +=3D " \
>                  "
>  DEPENDS:append:libc-musl =3D " libexecinfo"
>
> -
>  inherit autotools-brokensep pkgconfig
>
>  do_configure:prepend() {
> diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb=
 b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
> index ad72b5cdde..b34fed40ce 100644
> --- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
> +++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
> @@ -5,7 +5,6 @@ HOMEPAGE =3D "http://open-lldp.org/start"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2bc283e65df398ced5f5b747e78=
162"
>
> -
>  inherit pkgconfig autotools
>  inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', ''=
, d)}
>
> diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb =
b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
> index 42e9c4260f..e9610b2a40 100644
> --- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
> +++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
> @@ -4,7 +4,6 @@ SECTION =3D "net"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://doc/LICENSE;md5=3Da194eaefae2be54ee3221339b=
10d0581"
>
> -
>  SRC_URI =3D "https://downloads.uls.co.za/rp-pppoe/rp-pppoe-${PV}.tar.gz =
\
>             file://top-autoconf.patch \
>             file://configure_in_cross.patch \
> diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/m=
eta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> index 8f21620584..a557e53e9f 100644
> --- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> +++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> @@ -6,7 +6,6 @@ SRCREV =3D "848eca82f92273af9a79687a90343a2ebcf3481d"
>  SRC_URI =3D "git://github.com/sctplab/usrsctp;protocol=3Dhttps;branch=3D=
master \
>            "
>
> -
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb b=
/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
> index f854078004..fca88a98ec 100644
> --- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
> +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
> @@ -26,7 +26,6 @@ COMPATIBLE_HOST:libc-musl =3D 'null'
>
>  DEPENDS =3D "boost dlt-daemon googletest"
>
> -
>  inherit cmake pkgconfig
>
>  EXTRA_OECMAKE =3D "-DINSTALL_LIB_DIR:PATH=3D${baselib} \
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/=
meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> index e1638bfa19..3bb57adc3e 100644
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> @@ -15,7 +15,6 @@ SRCREV =3D "1ef2a025981223c1e16fc833bef226c86ff8c295"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/xelerance/xl2tpd/releases"
>
> -
>  inherit update-rc.d
>
>  do_compile () {
> diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b=
/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
> index cb26699212..7ea5cdcf35 100644
> --- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
> +++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
> @@ -13,7 +13,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396fe=
bcb659c36b49533135d4 \
>                      file://zeroconf.c;beginline=3D1;endline=3D13;md5=3Da=
5bada96e1e34b08eb7446b28e2630b2"
>  SECTION =3D "net"
>
> -
>  SRC_URI =3D "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-$=
{PV}.tar.gz \
>             file://compilefix.patch \
>             file://makefile-add-ldflags.patch \
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.=
7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
> index 59e3dbae5f..03b3501c9e 100644
> --- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "\
>      file://0004-cleanup-includes.patch \
>  "
>
> -
>  CVE_PRODUCT =3D "kernel:bridge-utils"
>
>  inherit autotools-brokensep update-alternatives
> diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/met=
a-networking/recipes-support/celt051/celt051_git.bb
> index a9a664c196..e58287687b 100644
> --- a/meta-networking/recipes-support/celt051/celt051_git.bb
> +++ b/meta-networking/recipes-support/celt051/celt051_git.bb
> @@ -21,7 +21,6 @@ SRC_URI =3D "git://gitlab.xiph.org/xiph/celt.git;branch=
=3Dcompat-v0.5.1;protocol=3Dhtt
>             file://0001-tests-Include-entcode.c-into-test-sources-to-prov=
ide.patch \
>             "
>
> -
>  inherit pkgconfig autotools-brokensep
>
>  PACKAGECONFIG:class-native =3D ""
> diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/met=
a-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> index 25ea1fdefb..92fac91be3 100644
> --- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> +++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/jpbarrette/curlpp.git;bra=
nch=3Dmaster;protocol=3Dhttps \
>
>  SRCREV =3D "592552a165cc569dac7674cb7fc9de3dc829906f"
>
> -
>  inherit cmake pkgconfig binconfig
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb b/=
meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
> index 4c520e8c78..9dcb3c0386 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
> +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
> @@ -18,7 +18,6 @@ SRCREV_drbd-headers =3D "94f4472513f351efba5788f783feba=
6ac6efe9fc"
>
>  SRCREV_FORMAT =3D "drbd-utils_drbd-headers"
>
> -
>  UPSTREAM_CHECK_URI =3D "https://github.com/LINBIT/drbd-utils/releases"
>
>  SYSTEMD_SERVICE:${PN} =3D "drbd.service"
> diff --git a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb=
 b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> index badeed8e82..69eeb22080 100644
> --- a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> +++ b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/nhorman/dropwatch.git;pro=
tocol=3Dhttps;nobranch=3D1 \
>  "
>  SRCREV =3D "1e7e487a019a7c02f1f429c4d3a4647fa3787a13"
>
> -
>  DEPENDS =3D "binutils libnl libpcap readline"
>
>  inherit pkgconfig autotools
> diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb=
 b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
> index d5dc10a889..a83468c28c 100644
> --- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
> +++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
> @@ -25,7 +25,6 @@ SRC_URI =3D "gitsm://github.com/Ettercap/ettercap;branc=
h=3Dmaster;protocol=3Dhttps \
>
>  SRCREV =3D "7281fbddb7da7478beb1d21e3cb105fff3778b31"
>
> -
>  EXTRA_OECMAKE =3D " \
>      -DCMAKE_SKIP_RPATH=3DTRUE \
>      -DBUNDLED_LIBS=3DON \
> diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/m=
eta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> index 9c2535b95b..5879c26646 100644
> --- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> +++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> @@ -20,7 +20,6 @@ inherit cpan ptest
>
>  EXTRA_CPANFLAGS =3D "LIBS=3D'-L${STAGING_LIBDIR}' INC=3D'-I${STAGING_INC=
DIR}'"
>
> -
>  # perl scripts and some special small data files
>  #
>  do_install_ptest () {
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta=
-networking/recipes-support/geoip/geoip_1.6.12.bb
> index 7482dba64a..133caba822 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> @@ -36,7 +36,6 @@ LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad \
>                      file://LICENSE;md5=3D0388276749a542b0d611601fa7c1dcc=
8 "
>
> -
>  inherit autotools
>
>  EXTRA_OECONF =3D "--disable-static               \
> @@ -84,7 +83,6 @@ do_configure_ptest() {
>          ${S}/test/test-geoip-region.c
>  }
>
> -
>  do_install_ptest() {
>      oe_runmake -C test DESTDIR=3D${D}  install-testPROGRAMS
>      install ${S}/test/*.txt ${D}${PTEST_PATH}/tests
> diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.=
4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> index 7def915db5..f7e9380cf7 100644
> --- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> +++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-MIT;md5=3D9bfa835d=
048c194ab30487af8d7b3778"
>  SRC_URI =3D "git://github.com/nodejs/http-parser.git;branch=3Dmaster;pro=
tocol=3Dhttps"
>  SRCREV =3D "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
>
> -
>  EXTRA_OEMAKE =3D "PLATFORM=3Dlinux"
>
>  do_configure[noexec] =3D "1"
> diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb =
b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
> index bc0975ecc1..edd9c73880 100644
> --- a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dacc89=
812938cf9ad6b1debc37cea0253
>  SRCREV =3D "62e60904afbe58fda0c7104fdad1c4f618266ba6"
>  SRC_URI =3D "git://salsa.debian.org/debian/ifenslave.git;protocol=3Dhttp=
s;branch=3Dmain"
>
> -
>  do_install() {
>      install -m 0755 -D ${S}/debian/ifenslave.if-pre-up ${D}${sysconfdir}=
/network/if-pre-up.d/ifenslave
>      install -m 0755 -D ${S}/debian/ifenslave.if-post-down ${D}${sysconfd=
ir}/network/if-post-down.d/ifenslave
> diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb b/met=
a-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
> index 18970751c3..4d435790d9 100644
> --- a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
> +++ b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
> @@ -9,5 +9,4 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>  SRC_URI =3D "git://gitlab.com/ipcalc/ipcalc.git;protocol=3Dhttps;branch=
=3Dmaster"
>  SRCREV =3D "c341e55be386649c0a5347eefeae410753c4e753"
>
> -
>  inherit meson
> diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb b/me=
ta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
> index 03cd877901..d038cfd686 100644
> --- a/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
> +++ b/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
> @@ -11,7 +11,6 @@ DEPENDS =3D "curl openssl"
>  SRC_URI =3D "git://github.com/libcpr/cpr.git;protocol=3Dhttps;branch=3D1=
.11.x"
>  SRCREV =3D "bb01c8db702fb41e5497aee9c0559ddf4bf13749"
>
> -
>  inherit cmake
>
>  # building tests is currently using FetchContent for mongoose
> diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b=
/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
> index 50f83221c0..b3310ec519 100644
> --- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
> +++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/libesmtp/libESMTP.git;bra=
nch=3Dmaster;protocol=3Dhttps \
>             file://0001-Add-build-option-for-NTLM-support.patch"
>  SRCREV =3D "1d0af244310a66943ab400be56b15a9087f181eb"
>
> -
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742 \
>                      file://COPYING.GPL;md5=3D393a5ca445f6965873eca0259a1=
7f833"
>
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.21.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.=
bb
> index 407194792f..77e6759346 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D " \
>      file://v6test.sh \
>  "
>
> -
>  BBCLASSEXTEND =3D "native"
>
>  inherit autotools-brokensep pkgconfig binconfig ptest
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_gi=
t.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> index b442fb9f56..f05204f1f3 100644
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/linux-wpan/lowpan-tools;b=
ranch=3Dmaster;protocol=3Dhttps
>             "
>  SRCREV =3D "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
>
> -
>  inherit autotools python3-dir pkgconfig
>
>  CACHED_CONFIGUREVARS +=3D "am_cv_python_pythondir=3D${PYTHON_SITEPACKAGE=
S_DIR}/lowpan-tools"
> diff --git a/meta-networking/recipes-support/mctp/mctp_2.1.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.1.bb
> index 04fecf7aca..9b6d694693 100644
> --- a/meta-networking/recipes-support/mctp/mctp_2.1.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_2.1.bb
> @@ -10,7 +10,6 @@ SRCREV =3D "dd944cf5b5a8b834f3685bcb2017190258dbcd0b"
>  SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=
=3Dhttps \
>             file://0001-mctp-bench-Adjust-headers.patch"
>
> -
>  inherit meson pkgconfig systemd
>
>  EXTRA_OEMESON =3D " \
> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.=
1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
> index 52e7e53c32..d2877d62e9 100644
> --- a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
> +++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
> @@ -3,7 +3,6 @@ require mdio-tools.inc
>  DEPENDS +=3D "virtual/kernel libmnl"
>  # This module requires Linux 5.6 higher
>
> -
>  inherit module
>
>  EXTRA_OEMAKE =3D "-C kernel/ KDIR=3D${STAGING_KERNEL_DIR}"
> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.=
bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
> index 2c8f9b8c37..a08532b9e9 100644
> --- a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
> @@ -2,7 +2,6 @@ require mdio-tools.inc
>
>  DEPENDS +=3D "virtual/kernel libmnl"
>
> -
>  inherit pkgconfig autotools
>
>  RRECOMMENDS:${PN} =3D "kernel-module-mdio-netlink"
> diff --git a/meta-networking/recipes-support/mtr/mtr_0.95.bb b/meta-netwo=
rking/recipes-support/mtr/mtr_0.95.bb
> index ac8b48e4e5..e991b313e4 100644
> --- a/meta-networking/recipes-support/mtr/mtr_0.95.bb
> +++ b/meta-networking/recipes-support/mtr/mtr_0.95.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
>  SRCREV =3D "852e5617fbf331cf292723702161f0ac9afe257c"
>  SRC_URI =3D "git://github.com/traviscross/mtr;branch=3Dmaster;protocol=
=3Dhttps"
>
> -
>  inherit autotools pkgconfig
>
>  EXTRA_OECONF =3D "--without-gtk"
> diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb b/m=
eta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
> index 1c9db1e956..55f620dd4c 100644
> --- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
> +++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/libguestfs/nbdkit.git;pro=
tocol=3Dhttps;branch=3Dmaster \
>             file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.pat=
ch"
>  SRCREV =3D "6c02c6a469d62a047f230b0ccf03f72328312d2b"
>
> -
>  DEPENDS =3D "curl xz e2fsprogs zlib"
>
>  # autotools-brokensep is needed as nbdkit does not support build in exte=
rnal directory
> diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb b/m=
eta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
> index 9e7bdc9966..1261694e2a 100644
> --- a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
> +++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://gitlab.com/nbdkit/nbdkit.git;protoco=
l=3Dhttps;branch=3Dmaster;tag=3Dv
>             "
>  SRCREV =3D "2d0f232b590f4001881dd0819f55af72b88c4b2f"
>
> -
>  DEPENDS =3D "curl xz e2fsprogs zlib"
>
>  # autotools-brokensep is needed as nbdkit does not support build in exte=
rnal directory
> diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb b/met=
a-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
> index 6931c64d4a..7152380def 100644
> --- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
> +++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://git.remlab.net/git/ndisc6.git;protoc=
ol=3Dhttp;branch=3Dmaster \
>             file://0001-Remove-use-of-variables-indicating-buildtime-info=
rma.patch \
>             "
>
> -
>  DEPENDS =3D "coreutils-native"
>
>  inherit autotools gettext
> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/met=
a-networking/recipes-support/netcat/netcat_0.7.1.bb
> index fd36aadd7e..28ca1c0e74 100644
> --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> @@ -2,7 +2,6 @@ require netcat.inc
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>
> -
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
>             file://obsolete_autoconf_macros.patch \
>             file://netcat-locale_h.patch \
> diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-=
networking/recipes-support/netcf/netcf_0.2.8.bb
> index cddb0ead2f..e13f420724 100644
> --- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> @@ -18,7 +18,6 @@ DEPENDS +=3D "augeas libnl libxslt libxml2"
>
>  do_configure[depends] +=3D "${MLPREFIX}gnulib:do_populate_sysroot"
>
> -
>  inherit gettext autotools perlnative pkgconfig systemd
>
>  EXTRA_OECONF:append:class-target =3D " --with-driver=3Dredhat"
> diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/met=
a-networking/recipes-support/netperf/netperf_git.bb
> index 4043da5621..96f3cdbff1 100644
> --- a/meta-networking/recipes-support/netperf/netperf_git.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_git.bb
> @@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/HewlettPackard/netperf.gi=
t;branch=3Dmaster;protocol=3Dht
>
>  SRCREV =3D "3bc455b23f901dae377ca0a558e1e32aa56b31c4"
>
> -
>  inherit update-rc.d autotools texinfo systemd
>
>  # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ ma=
cros
> diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.=
8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
> index 58ace6263d..b2e151ede7 100644
> --- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
> +++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D " \
>         file://0001-Cmds-automatically-create-folder.patch \
>         "
>
> -
>  inherit pkgconfig
>
>  EXTRA_OEMAKE +=3D " TERM=3D'' "
> diff --git a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb b/meta=
-networking/recipes-support/nis/yp-tools_4.2.3.bb
> index 54fd68ed43..ce3b46c37c 100644
> --- a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
> +++ b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D "git://github.com/thkukuk/yp-tools;branch=
=3Dmaster;protocol=3Dhttps \
>             file://domainname.service \
>             "
>
> -
>  DEPENDS =3D "libtirpc libnsl2 virtual/crypt"
>
>  inherit autotools systemd
> diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-=
networking/recipes-support/ntimed/ntimed_git.bb
> index 36fba5f57b..6f9eb902aa 100644
> --- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
> +++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/bsdphk/Ntimed;branch=3Dma=
ster;protocol=3Dhttps \
>  PV =3D "0.0+git"
>  SRCREV =3D "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
>
> -
>  # use adjtimex on musl
>  CFLAGS:append:libc-musl =3D " -Dntp_adjtime=3Dadjtimex"
>
> diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-ne=
tworking/recipes-support/ntopng/ndpi_4.2.bb
> index f0175167a4..60d0052c5d 100644
> --- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
> +++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/ntop/nDPI.git;branch=3D4.=
2-stable;protocol=3Dhttps \
>             file://0001-autogen.sh-not-generate-configure.patch \
>             "
>
> -
>  inherit autotools-brokensep pkgconfig
>
>  CPPFLAGS +=3D "${SELECTED_OPTIMIZATION}"
> diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/met=
a-networking/recipes-support/ntopng/ntopng_5.2.1.bb
> index 014706893a..729d57fad1 100644
> --- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
> +++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
> @@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/ntop/ntopng.git;protocol=
=3Dhttps;branch=3D5.2-stable \
>             file://ntopng.service \
>             "
>
> -
>  # don't use the lua under thirdparty as it supports cross compiling badl=
y
>  export LUA_LIB =3D "${STAGING_LIBDIR}/liblua.a"
>
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-n=
etworking/recipes-support/ntp/ntp_4.2.8p18.bb
> index 33d19a696a..d545d27c31 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
> @@ -54,7 +54,6 @@ CVE_STATUS_NTP =3D " \
>      CVE-2016-9311 \
>  "
>
> -
>  inherit autotools update-rc.d useradd systemd pkgconfig
>
>  # For some reason this recipe reconfigures the nested configure.ac files=
 in
> diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb=
 b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
> index 5c38f6b5dc..cd06be3b76 100644
> --- a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
> +++ b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/open-iscsi/open-isns;bran=
ch=3Dmaster;protocol=3Dhttps \
>
>  SRCREV =3D "c0e6d9fedc5a7041260de477fe1a8455fa074113"
>
> -
>  inherit systemd autotools-brokensep update-rc.d
>
>  EXTRA_OECONF =3D " --prefix=3D${prefix} --enable-shared"
> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-ne=
tworking/recipes-support/phytool/phytool.bb
> index 6471f46c28..83f831f242 100644
> --- a/meta-networking/recipes-support/phytool/phytool.bb
> +++ b/meta-networking/recipes-support/phytool/phytool.bb
> @@ -6,7 +6,6 @@ PV =3D "2+git"
>  SRCREV =3D "8882328c08ba2efb13c049812098f1d0cb8adf0c"
>  SRC_URI =3D "git://github.com/wkz/phytool.git;branch=3Dmaster;protocol=
=3Dhttps"
>
> -
>  # The Makefile has "$PREFIX/bin" hardcoded into it, hence not using $bin=
dir here
>  do_install() {
>      install -d ${D}${prefix}/bin
> diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb b=
/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
> index bb12d7a907..4773684612 100644
> --- a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
> +++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
> @@ -8,5 +8,4 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
>  SRCREV =3D "b315d06ddb0dad16a52fe91e5831b4030ce37010"
>  SRC_URI =3D "git://github.com/troglobit/smcroute.git;branch=3Dmaster;pro=
tocol=3Dhttps"
>
> -
>  inherit autotools pkgconfig
> diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb b/met=
a-networking/recipes-support/sngrep/sngrep_1.8.2.bb
> index 12fe3ececa..bab7e8585d 100644
> --- a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
> +++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
> @@ -18,7 +18,6 @@ DEPENDS =3D "\
>  SRC_URI =3D "git://github.com/irontec/sngrep.git;protocol=3Dhttps;branch=
=3Dmaster"
>  SRCREV =3D "dad1033640f249fa4994f976cf6ee96826c15702"
>
> -
>  inherit cmake pkgconfig
>
>  PACKAGECONFIG ?=3D "\
> diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/m=
eta-networking/recipes-support/spice/libcacard_2.8.1.bb
> index 1a2d9dc9c4..2731271183 100644
> --- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
> +++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
> @@ -8,7 +8,6 @@ SRCREV =3D "7b07684ea6698d4885ff2062350ad8798a04de42"
>
>  SRC_URI =3D "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=
=3Dhttps;branch=3Dmaster"
>
> -
>  inherit meson pkgconfig
>
>  do_configure:prepend() {
> diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.42.bb
> index 3588d674f7..9290e96865 100644
> --- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
> +++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice=
-gtk.git;protocol=3Dhttps;bra
>
>  CVE_STATUS[CVE-2012-4425] =3D "fixed-version: fixed since 0.15.3"
>
> -
>  DEPENDS =3D " \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland wayla=
nd-native wayland-protocols', '', d)} \
> diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.=
22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.=
bb
> index b13dd5d148..4baf0a618d 100644
> --- a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> +++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> @@ -7,7 +7,6 @@ SRCREV =3D "aa08162f036840d3e33502dc0a836b03b9cec97c"
>
>  SRC_URI =3D "git://gitlab.freedesktop.org/spice/linux/vd_agent.git;proto=
col=3Dhttps;branch=3Dmaster"
>
> -
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES =3D "opengl x11"
>
> diff --git a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.=
bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> index 7f08eebee7..a42e4f2c4a 100644
> --- a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> +++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> @@ -12,7 +12,6 @@ SRCREV =3D "6f453a775d87087c6ba59fc180c1a1e466631a47"
>
>  SRC_URI =3D "git://gitlab.freedesktop.org/spice/spice-protocol.git;proto=
col=3Dhttps;branch=3Dmaster"
>
> -
>  inherit meson pkgconfig
>
>  ALLOW_EMPTY:${PN} =3D "1"
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
> index c9418a1765..1a7a1a5c6a 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -19,7 +19,6 @@ SRCREV =3D "0c2c1413a8b387ea597a95b6c867470a7c56c8ab"
>
>  SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;=
protocol=3Dhttps"
>
> -
>  CVE_STATUS[CVE-2016-0749] =3D "fixed-version: patched since 0.13.2"
>  CVE_STATUS[CVE-2016-2150] =3D "fixed-version: patched since 0.13.2"
>  CVE_STATUS[CVE-2018-10893] =3D "fixed-version: patched already, caused b=
y inaccurate CPE in the NVD database."
> diff --git a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb b/m=
eta-networking/recipes-support/spice/usbredir_0.14.0.bb
> index 81c7fdf0c8..970950fe91 100644
> --- a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
> +++ b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
> @@ -11,7 +11,6 @@ SRCREV =3D "2d373432e604960c1dcc14fb97098febe4d64025"
>
>  SRC_URI =3D "git://gitlab.freedesktop.org/spice/usbredir;branch=3Dmain;p=
rotocol=3Dhttps"
>
> -
>  inherit meson pkgconfig
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.1.=
bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
> index 771470f695..d53c73083e 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
> @@ -65,7 +65,6 @@ PACKAGECONFIG[systemd-charon] =3D "--enable-systemd,--d=
isable-systemd,systemd,"
>  # tpm needs meta-tpm layer
>  PACKAGECONFIG[tpm2] =3D "--enable-tpm,--disable-tpm,,${PN}-plugin-tpm"
>
> -
>  # integraty configuration needs meta-integraty
>  #imc
>  PACKAGECONFIG[tnc-imc] =3D "--enable-tnc-imc,--disable-tnc-imc,,  ${PN}-=
plugin-tnc-imc ${PN}-plugin-tnc-tnccs"
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb b/=
meta-networking/recipes-support/unbound/unbound_1.22.0.bb
> index c35148b77e..fe174a9247 100644
> --- a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
> +++ b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
> @@ -26,7 +26,6 @@ inherit autotools pkgconfig systemd update-rc.d ptest
>  DEPENDS =3D "openssl libtool-native bison-native expat"
>  RDEPENDS:${PN} =3D "bash openssl-bin daemonize"
>
> -
>  EXTRA_OECONF =3D "--with-libexpat=3D${STAGING_EXECPREFIXDIR} \
>                  --disable-rpath --with-ssl=3D${STAGING_EXECPREFIXDIR} \
>                  --enable-largefile"
> diff --git a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb b/m=
eta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
> index 4857c0af4f..73d2e00a4c 100644
> --- a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
> +++ b/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
> @@ -22,6 +22,5 @@ EXTRA_OEMAKE =3D "\
>      CC=3D'${CC}' CFLAGS=3D'${CFLAGS} -pthread -I${STAGING_INCDIR}/libnl3=
' \
>  "
>
> -
>  # wavemon does not support using out-of-tree builds
>  inherit autotools-brokensep pkgconfig
> diff --git a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.b=
b b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
> index 2f5ebe53ae..4ed281a4a1 100644
> --- a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
> +++ b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
> @@ -11,5 +11,4 @@ DEPENDS =3D "libnl"
>  SRC_URI =3D "git://github.com/linux-wpan/wpan-tools;branch=3Dmaster;prot=
ocol=3Dhttps"
>  SRCREV =3D "91b0f038aef2f62cb6a222d190b887fdfd6bc164"
>
> -
>  inherit autotools pkgconfig
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1=
.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> index a32c9403c8..5f13096a07 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> @@ -20,7 +20,6 @@ SRCREV =3D "8416326777b2aada0706539b8f9f6acefa476b16"
>  SRC_URI =3D "git://github.com/tomba/rwmem.git;protocol=3Dhttps;name=3Drw=
mem;branch=3Dmaster \
>             file://0001-include-missing-cstdint.patch"
>
> -
>  inherit meson pkgconfig python3native
>
>  PACKAGECONFIG ?=3D "python static"
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netp=
lan/netplan_1.1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectiv=
ity/netplan/netplan_1.1.2.bb
> index ef1945b4fe..c636faf658 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/net=
plan_1.1.2.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/net=
plan_1.1.2.bb
> @@ -22,7 +22,6 @@ SRC_URI:append:libc-musl =3D " file://0001-don-t-fail-i=
f-GLOB_BRACE-is-not-defined
>
>  SRCREV =3D "01045f683b9419beb90119497cd1b2be44e83b8e"
>
> -
>  DEPENDS =3D "glib-2.0 libyaml util-linux-libuuid \
>             systemd python3-cffi-native \
>            "
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thin=
gsboard-gateway/thingsboard-gateway_3.7.4.bb b/meta-oe/dynamic-layers/meta-=
python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.b=
b
> index 57e162cabd..3cafbd9513 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/thingsboard-gateway_3.7.4.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/thingsboard-gateway_3.7.4.bb
> @@ -40,7 +40,6 @@ SRC_URI +=3D "file://bacnet.json \
>              file://thingsboard-gateway.service \
>              "
>
> -
>  inherit systemd
>
>  SYSTEMD_PACKAGES =3D "${PN}"
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongo=
db_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_=
git.bb
> index 23515d9fa8..0d202db3b7 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.=
bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.=
bb
> @@ -48,7 +48,6 @@ SRC_URI:append:toolchain-clang =3D "\
>             file://0001-asio-Dont-use-experimental-with-clang.patch \
>             "
>
> -
>  CVE_STATUS[CVE-2014-8180] =3D "not-applicable-config: Not affecting our =
configuration so it can be safely ignored."
>  CVE_STATUS[CVE-2017-2665] =3D "not-applicable-config: Not affecting our =
configuration so it can be safely ignored."
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/n=
anopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nano=
pb.inc
> index 4fe3995cd5..ccae04aaa1 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.i=
nc
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.i=
nc
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D9db4b73a55=
a3994384112efcdb37c01f"
>  SRC_URI =3D "git://github.com/nanopb/nanopb.git;branch=3Dmaintenance_0.4=
;protocol=3Dhttps"
>  SRCREV =3D "cad3c18ef15a663e30e3e43e3a752b66378adec1"
>
> -
>  inherit cmake
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/=
lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdpro=
c/lcdproc_git.bb
> index d4987acede..38d6ff1a40 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc=
_git.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc=
_git.bb
> @@ -13,7 +13,6 @@ PV =3D "0.5.9+git"
>  SRCREV =3D "0e2ce9b9c46c47363436f9ee730f7c71bf455f0f"
>  SRC_URI =3D "git://github.com/lcdproc/lcdproc;branch=3Dmaster;protocol=
=3Dhttps"
>
> -
>  inherit autotools pkgconfig update-rc.d
>
>  LCD_DRIVERS ?=3D "all,!irman,!svga${SERIALVFD}"
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/=
kmsxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/=
kmsxx_git.bb
> index 5d204d7d94..7f4a64d8f2 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_g=
it.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_g=
it.bb
> @@ -20,7 +20,6 @@ PACKAGECONFIG[utils] +=3D "-Dutils=3Dtrue, -Dutils=3Dfa=
lse"
>
>  DEPENDS +=3D "libdrm libevdev fmt"
>
> -
>  inherit meson pkgconfig
>
>  do_install:append() {
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/=
nvmetcli_0.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetc=
li/nvmetcli_0.8.bb
> index cf2d54c07d..c1a8cccca1 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcl=
i_0.8.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcl=
i_0.8.bb
> @@ -22,7 +22,6 @@ RDEPENDS:${PN} +=3D "python3 python3-six python3-pypars=
ing python3-configshell-fb"
>  SRCREV =3D "d323d5a3091af490502c5d025ec7361a3a2cfbd9"
>  SRC_URI =3D "git://git.infradead.org/users/hch/nvmetcli.git;branch=3Dmas=
ter"
>
> -
>  do_install:append() {
>      # Install example configuration scripts.
>      install -d ${D}${datadir}/nvmet
> diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/tai=
sei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graph=
ics/taisei/taisei_1.4.2.bb
> index ee65f89ab7..01565a9fa1 100644
> --- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/tai=
sei_1.4.2.bb
> +++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/tai=
sei_1.4.2.bb
> @@ -38,7 +38,6 @@ SRC_URI =3D "gitsm://github.com/taisei-project/taisei.g=
it;branch=3Dv1.4.x;protocol=3Dh
>
>  SRCREV =3D "c098579d4fa0f004ccc204c5bc46eac3717cba28"
>
> -
>  inherit features_check meson mime mime-xdg pkgconfig python3native
>
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
> diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/=
rasdaemon_0.8.3.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasd=
aemon/rasdaemon_0.8.3.bb
> index 301861de38..05ea730fc2 100644
> --- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaem=
on_0.8.3.bb
> +++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaem=
on_0.8.3.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/mchehab/rasdaemon.git;branc=
h=3Dmaster;protocol=3Dhttps \
>
>  SRCREV =3D "db0870edd2919f4f4d0101843136bcae92ab0743"
>
> -
>  DEPENDS =3D "libtraceevent"
>  RDEPENDS:${BPN} =3D "perl perl-module-file-basename perl-module-file-fin=
d perl-module-file-spec perl-module-getopt-long \
>         perl-module-posix perl-module-file-glob libdbi-perl libdbd-sqlite=
-perl"
> diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-=
oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> index feda6599a8..bb0a768162 100644
> --- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> +++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/ssvb/cpuburn-arm.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>             file://0003-burn.S-Remove-.func-.endfunc.patch \
>             "
>
> -
>  do_compile() {
>
>      # If the arch is set to ARM 64-bit -  we only produce and ship burn-=
a53 version.
> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-=
benchmark/fio/fio_3.39.bb
> index 345c7f08e7..ad78b6d3b1 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
> @@ -27,7 +27,6 @@ SRCREV =3D "a6e474c9e896e4ba1eb40066a03402afb040710a"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "fio-(?P<pver>\d+(\.\d+)+)"
>
> -
>  # avoids build breaks when using no-static-libs.inc
>  DISABLE_STATIC =3D ""
>
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/r=
ecipes-benchmark/glmark2/glmark2_git.bb
> index 8bcb763f06..ebf947915d 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -21,7 +21,6 @@ SRC_URI =3D " \
>  "
>  SRCREV =3D "42e3d8fe3aa88743ef90348138f643f7b04a9237"
>
> -
>  inherit meson pkgconfig features_check
>
>  ANY_OF_DISTRO_FEATURES =3D "opengl dispmanx"
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/re=
cipes-benchmark/iperf3/iperf3_3.18.bb
> index 08f29937c0..d4b4d08892 100644
> --- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
> @@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/esnet/iperf.git;branch=3D=
master;protocol=3Dhttps \
>
>  SRCREV =3D "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
>
> -
>  inherit autotools
>
>  PACKAGECONFIG ?=3D "openssl"
> diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb b/met=
a-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> index ae87262870..f434023dcd 100644
> --- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> +++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "git://git.musl-libc.org/libc-bench;branch=
=3Dmaster \
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  do_install () {
>      install -d ${D}${bindir}
>      install -m 0755 ${B}/libc-bench ${D}${bindir}
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb =
b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> index e688d6ede2..636684a096 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> @@ -28,7 +28,6 @@ SRC_URI =3D " \
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
>
> -
>  COMPATIBLE_HOST =3D "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux=
*"
>
>  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-o=
e/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index acd4d6decf..15ef13dac4 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -10,7 +10,6 @@ inherit autotools-brokensep update-alternatives
>  DEPENDS +=3D "libtirpc"
>  CFLAGS +=3D "-I${STAGING_INCDIR}/tirpc"
>
> -
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
>             file://lmbench-run \
>             file://rename-line-binary.patch \
> diff --git a/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb b/meta-oe/recipes-b=
enchmark/mbw/mbw_2.0.bb
> index 1fd95de038..bcebc59eda 100644
> --- a/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
> +++ b/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/raas/${BPN}.git;branch=3Dma=
ster;protocol=3Dhttps"
>
>  SRCREV =3D "c3155b544a5065e8235508059c6512af6c46bd4d"
>
> -
>  do_install() {
>      install -d ${D}${bindir}
>      install -m 0755 ${B}/mbw ${D}${bindir}
> diff --git a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb b/meta-oe/re=
cipes-benchmark/qperf/qperf_0.4.11.bb
> index e034371604..8ac836b6a4 100644
> --- a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
> +++ b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
> @@ -9,7 +9,6 @@ inherit autotools-brokensep
>  SRCREV =3D "c706363815a38ff2c5cbc07b73e2cfaaa59bae0f"
>  SRC_URI =3D "git://github.com/linux-rdma/qperf.git;protocol=3Dhttps;bran=
ch=3Dmaster"
>
> -
>  do_configure() {
>    ./cleanup
>    ./autogen.sh
> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/r=
ecipes-benchmark/s-suite/s-suite_git.bb
> index caefdb7b6b..e0b94ff5e2 100644
> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/Algodev-github/S.git;prot=
ocol=3Dhttps;branch=3Dmaster"
>  # upstream updates
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  # installing in /opt/S-suite since the package has
>  # dependencies to the directory structure.
>  do_install() {
> diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11=
.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
> index 2d450094b7..a9e9838202 100644
> --- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
> +++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
> @@ -18,5 +18,4 @@ GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
>  GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
>  SRC_URI =3D "git://github.com/stressapptest/stressapptest;branch=3Dmaste=
r;protocol=3Dhttps"
>
> -
>  inherit autotools
> diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb b/meta=
-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> index 198552e5c6..b0a65c649c 100644
> --- a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> +++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> @@ -13,7 +13,6 @@ inherit autotools-brokensep pkgconfig
>  SRC_URI =3D "git://github.com/akopytov/sysbench.git;protocol=3Dhttps;bra=
nch=3Dmaster"
>  SRCREV =3D "ebf1c90da05dea94648165e4f149abc20c979557"
>
> -
>  COMPATIBLE_HOST =3D "(arm|aarch64|i.86|x86_64).*-linux*"
>
>  EXTRA_OECONF +=3D "--enable-largefile --with-system-luajit --with-system=
-ck --without-gcc-arch --with-lib-prefix=3Dno"
> diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b=
/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> index 8f65a6135c..e11f4ef2f2 100644
> --- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> +++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/ssvb/tinymembench.git;bra=
nch=3Dmaster;protocol=3Dhttps \
>             file://0001-asm-Delete-.func-.endfunc-directives.patch \
>             "
>
> -
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
>  do_install() {
> diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-=
oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
> index 98914836ed..dad112ac92 100644
> --- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
> +++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
> @@ -3,7 +3,6 @@ HOMEPAGE =3D "http://sourceforge.net/projects/tiobench/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
>
> -
>  SRC_URI =3D "\
>      http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${BP}.=
tar.gz \
>      file://tiobench-makefile.patch \
> diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp=
/bolt/bolt_0.9.6.bb
> index ec3cdcaa75..e61f38d960 100644
> --- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
> +++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
> @@ -10,7 +10,6 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
>  SRC_URI =3D "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=3Dhttps=
;branch=3Dmaster"
>  SRCREV =3D "f03c50b22ae3fda26711ddabd91e2c5dd8103478"
>
> -
>  CVE_PRODUCT =3D "freedesktop:bolt"
>
>  inherit cmake pkgconfig meson features_check
> diff --git a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb b/meta-oe/rec=
ipes-bsp/con2fbmap/con2fbmap_git.bb
> index 515c009ead..e613075376 100644
> --- a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
> +++ b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
> @@ -16,6 +16,5 @@ SRC_URI =3D "git://gitlab.com/pibox/con2fbmap.git;proto=
col=3Dhttps;branch=3Dmaster \
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit autotools
>
> diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-=
oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
> index 9e23a4b67d..ff04b16b28 100644
> --- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
> +++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
> @@ -19,8 +19,6 @@ UPSTREAM_CHECK_COMMITS =3D "1"
>
>  EXTRA_OEMAKE:append =3D " ${@['', 'NLS=3Dfalse']['${USE_NLS}' =3D=3D 'no=
']} "
>
> -
> -
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
>  EXTRA_OEMAKE =3D "V=3D1 CROSS=3D${TARGET_PREFIX} STRIPCMD=3Decho 'CP=3Dc=
p'"
> diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.2=
0.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> index e0041b58e6..8cfed09d6d 100644
> --- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> @@ -16,7 +16,6 @@ EXTRA_OEMAKE =3D "NOSTRIP=3D1 DESTDIR=3D${D} PREFIX=3D$=
{prefix}"
>
>  PV =3D "1.0+${SRCPV}"
>
> -
>  do_install() {
>      oe_runmake install
>  }
> diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/r=
ecipes-bsp/edac-utils/edac-utils_git.bb
> index 0d8f3c8a6b..0cef6a2d9f 100644
> --- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> +++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> @@ -13,7 +13,6 @@ DEPENDS =3D " sysfsutils"
>  SRCREV =3D "1c57818ecee186aa47af0342149577df5302c022"
>  PV =3D "0.18+git"
>
> -
>  SRC_URI =3D "git://github.com/grondo/edac-utils;branch=3Dmaster;protocol=
=3Dhttps \
>      file://make-init-script-be-able-to-automatically-load-EDAC-.patch \
>      file://add-restart-to-initscript.patch \
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/rec=
ipes-bsp/firmwared/firmwared_git.bb
> index 1542ee73d1..0e0edc93a7 100644
> --- a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> @@ -16,7 +16,6 @@ SRCREV =3D "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  DEPENDS =3D "glib-2.0 systemd"
>
>  inherit pkgconfig autotools systemd features_check
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb b/meta-oe/recipes-=
bsp/fwupd/fwupd_1.9.25.bb
> index a098bf8eea..6f4224dcd0 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
> @@ -75,7 +75,6 @@ PACKAGECONFIG[sqlite] =3D "-Dsqlite=3Denabled,-Dsqlite=
=3Ddisabled,sqlite3"
>  PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
>  PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,gcab-native"
>
> -
>  # TODO plugins-all meta-option that expands to all plugin_*?
>  PACKAGECONFIG[plugin_acpi_phat] =3D "-Dplugin_acpi_phat=3Denabled,-Dplug=
in_acpi_phat=3Ddisabled"
>  PACKAGECONFIG[plugin_android_boot] =3D "-Dplugin_android_boot=3Denabled,=
-Dplugin_android_boot=3Ddisabled"
> diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-b=
sp/i2cdev/i2cdev_git.bb
> index d3d08720a6..1600b39582 100644
> --- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
> +++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
> @@ -21,5 +21,4 @@ SRC_URI =3D "\
>  "
>  SRCREV =3D "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"
>
> -
>  inherit autotools
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipes-=
bsp/ledmon/ledmon_0.97.bb
> index ff3b29406b..ba50f00432 100644
> --- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> @@ -23,7 +23,6 @@ SRCREV =3D "b0edae14e8660b80ffe0384354038a9f62e2978d"
>  COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
>  COMPATIBLE_HOST:libc-musl =3D "null"
>
> -
>  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-=
-enable-systemd', '', d)}"
>
>  EXTRA_OEMAKE =3D "CC=3D'${CC}' LDFLAGS=3D'${LDFLAGS}' CFLAGS=3D'${CFLAGS=
}'"
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/=
recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> index af0f5a7999..933503a139 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> @@ -44,7 +44,6 @@ SYSTEMD_SERVICE:${PN}-fancontrol =3D "fancontrol.servic=
e"
>  SYSTEMD_SERVICE:${PN}-sensord =3D "sensord.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
>
> -
>  EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
>          MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} MANDIR=3D${mandir} \
>          LIBDIR=3D${libdir} \
> @@ -123,7 +122,6 @@ PACKAGES =3D+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
>  # isadump and isaset helper program
>  PACKAGES =3D+ "${PN}-isatools ${PN}-isatools-doc"
>
> -
>  # libsensors files
>  FILES:${PN}-libsensors =3D "${libdir}/libsensors.so.* ${sysconfdir}/sens=
ors3.conf ${sysconfdir}/sensors.d"
>  FILES:${PN}-libsensors-dev =3D "${libdir}/libsensors.so ${includedir}"
> diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe=
/recipes-bsp/pcmciautils/pcmciautils_018.bb
> index 0bdd8042f8..2f434a1980 100644
> --- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
> +++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
>  DEPENDS =3D "udev sysfsutils flex-native bison-native"
>  RDEPENDS:${PN} =3D "udev module-init-tools"
>
> -
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz =
\
>             file://makefile_fix.patch \
>             file://makefile_race.patch \
> diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb b=
/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
> index fc020695e3..3256c7051d 100644
> --- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
> +++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
> @@ -9,5 +9,4 @@ SRCREV =3D "21046ebc4a5475c14cea446715734c88fe33d276"
>
>  DEPENDS =3D "openssl boost"
>
> -
>  inherit cmake
> diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-o=
e/recipes-connectivity/gattlib/gattlib_git.bb
> index 06f0b5bf0a..0063c0b036 100644
> --- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> +++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/labapart/gattlib.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>  SRCBRANCH =3D "master"
>  SRCREV =3D "33a8a275928b186381bb0aea0f9778e330e57ec3"
>
> -
>  CVE_STATUS[CVE-2019-6498] =3D "fixed-version: patch is already included =
in sources"
>
>  PACKAGECONFIG[examples] =3D "-DGATTLIB_BUILD_EXAMPLES=3DON,-DGATTLIB_BUI=
LD_EXAMPLES=3DOFF"
> diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb b/meta-o=
e/recipes-connectivity/gensio/gensio_2.8.7.bb
> index 9325b1e5dc..28b43d2b83 100644
> --- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
> +++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "e4dbb9687bd5e887fa98a4cdcec012ea85da1ef2"
>
>  SRC_URI =3D "git://github.com/cminyard/gensio;protocol=3Dhttps;branch=3D=
master"
>
> -
>  inherit autotools
>
>  PACKAGECONFIG ??=3D "openssl tcp-wrappers"
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-=
oe/recipes-connectivity/hostapd/hostapd_2.11.bb
> index 693afe6c53..83be5233e7 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D " \
>      file://hostapd.service \
>  "
>
> -
>  SRC_URI[sha256sum] =3D "2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e3=
30219fe7aed1747a"
>
>  inherit update-rc.d systemd pkgconfig features_check
> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb b/met=
a-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
> index 27d28d71cb..2041e2a8a2 100644
> --- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
> @@ -14,7 +14,6 @@ inherit meson pkgconfig bash-completion gobject-introsp=
ection upstream-version-i
>  SRCREV =3D "e10df4b6b3edfe6a46d93f7f5f5cab31c29a7091"
>  SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;p=
rotocol=3Dhttps;branch=3Dmain"
>
> -
>  EXTRA_OEMESON =3D " \
>      -Dgtk_doc=3Dfalse \
>      -Dman=3Dfalse \
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb b/meta-oe/=
recipes-connectivity/libnet/libnet_1.3.bb
> index 0594b2485e..dc36d95a81 100644
> --- a/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
> +++ b/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/libnet/libnet.git;protoco=
l=3Dhttps;branch=3Dmaster"
>  SRC_URI[sha256sum] =3D "1e9e9054d688b059bcbaf878d8c4fbf69bfc0c9386cd4e77=
79fbb53339050d2e"
>  SRCREV =3D "deaebdfe2743e8a6f04d3c307d9272afeeecfade"
>
> -
>  inherit autotools binconfig multilib_script
>  MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/libnet-config"
>
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-=
oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
> index 8dc7ec3773..03138ff450 100644
> --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
> @@ -15,7 +15,6 @@ inherit meson pkgconfig bash-completion gobject-introsp=
ection upstream-version-i
>  SRCREV =3D "3f07d6e5b4677558543b3b4484ea88ad92257e92"
>  SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;pr=
otocol=3Dhttps;branch=3Dqmi-1-34"
>
> -
>  PACKAGECONFIG ??=3D "udev mbim"
>  PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue,-Dudev=3Dfalse,libgudev"
>  PACKAGECONFIG[mbim] =3D "-Dmbim_qmux=3Dtrue,-Dmbim_qmux=3Dfalse,libmbim"
> diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.b=
b b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> index f195008650..f869cb3bc5 100644
> --- a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> +++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadb=
and/libqrtr-glib.git;protoc
>  PV =3D "1.2.2+git"
>  SRCREV =3D "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
>
> -
>  inherit meson pkgconfig gobject-introspection
>
>  DEPENDS =3D "glib-2.0"
> diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent=
-rasterbar_2.0.10.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/li=
btorrent-rasterbar_2.0.10.bb
> index 6bfcbec25f..c84893043e 100644
> --- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-raster=
bar_2.0.10.bb
> +++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-raster=
bar_2.0.10.bb
> @@ -13,7 +13,6 @@ SRCREV =3D "74bc93a37a5e31c78f0aa02037a68fb9ac5deb41"
>  SRCREV_try_signal =3D "105cce59972f925a33aa6b1c3109e4cd3caf583d"
>  SRCREV_FORMAT .=3D "_try_signal"
>
> -
>  inherit cmake pkgconfig python3targetconfig
>
>  CVE_PRODUCT =3D "libtorrent"
> diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb=
 b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
> index 220bb62c64..5cda75c572 100644
> --- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
> +++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
> @@ -13,7 +13,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
>  CVE_STATUS[CVE-2009-1760] =3D "backported-patch: patched in our product"
>
> -
>  CVE_PRODUCT =3D ""
>
>  PACKAGECONFIG ??=3D "instrumentation aligned"
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.=
0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> index 82cc1167e2..55aca95e73 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> @@ -14,7 +14,6 @@ DEPENDS =3D "glib-2.0 libgudev libxslt-native dbus"
>  SRCREV =3D "03f786ce66360d67c669f4f122f8aa458e6f01ea"
>  SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.=
git;protocol=3Dhttps;branch=3Dmm-1-22"
>
> -
>  # strict, permissive
>  MODEMMANAGER_POLKIT_TYPE ??=3D "permissive"
>
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.=
bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
> index ad6637ed88..7e5ae79c60 100644
> --- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
> @@ -19,7 +19,6 @@ SRCREV =3D "2150ba29d9df24ad1733c460eb099f292af84ee5"
>
>  DEPENDS =3D "openssl"
>
> -
>  inherit cmake
>
>  do_configure:prepend() {
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5=
.3.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
> index d1674403f0..f89e47889e 100644
> --- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/eclipse/paho.mqtt.cpp;pro=
tocol=3Dhttps;branch=3Dmaster;t
>
>  DEPENDS =3D "openssl paho-mqtt-c"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE +=3D "-DPAHO_WITH_SSL=3DON -DPAHO_BUILD_EXAMPLES=3DOFF"
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09=
.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
> index a04102aa42..e899cad201 100644
> --- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;p=
rotocol=3Dhttps;branch=3Dmaster
>            "
>  SRCREV =3D "4af4b8b04e6d5dd40b8e69cc30c5c1f62e7fe368"
>
> -
>  inherit cmake
>
>  PACKAGECONFIG ??=3D ""
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb=
 b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> index 4fd6302f2c..8d44e95955 100644
> --- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> @@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/alanxz/rabbitmq-c.git;branc=
h=3Dmaster;protocol=3Dhttps \
>  "
>  SRCREV =3D "84b81cd97a1b5515d3d4b304796680da24c666d8"
>
> -
>  DEPENDS =3D "popt openssl"
>
>  EXTRA_OECMAKE =3D "-DBUILD_EXAMPLES=3DOFF -DBUILD_TOOLS=3DON -DBUILD_TOO=
LS_DOCS=3DOFF -DBUILD_API_DOCS=3DOFF"
> diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb b/m=
eta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
> index 02a97cd6e3..51b528d64d 100644
> --- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
> +++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
> @@ -8,7 +8,6 @@ DEPENDS =3D "autoconf-archive libsigc++-2.0 curl cppunit =
libtool libtorrent ncurse
>  SRC_URI =3D "git://github.com/rakshasa/rtorrent;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "a88cab6d2e764e22cac232ef8d5af039d41b8280"
>
> -
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb b=
/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> index e5a3f88867..ef4ea7df9e 100644
> --- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "http://smstools3.kekekasvi.com/packages/${=
BP}.tar.gz \
>
>  SRC_URI[sha256sum] =3D "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030=
cd4e4905f6a92084"
>
> -
>  S =3D "${UNPACKDIR}/${BPN}"
>
>  EXTRA_OEMAKE +=3D "LFLAGS=3D'${LDFLAGS}'"
> diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6=
.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
> index 5d0dd6a389..aa66ee047c 100644
> --- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
> +++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D " \
>  # Transmission release 4.0.6
>  SRCREV =3D "38c164933e9f77c110b48fe745861c3b98e3d83e"
>
> -
>  inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
>
>  LDFLAGS:append:riscv32 =3D " -latomic"
> diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-o=
e/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> index 5a880ed6d2..51a8014d5b 100644
> --- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> +++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> @@ -14,7 +14,6 @@ PV =3D "1.1.2+git"
>  SRCREV =3D "01c94c77f59404924f1c46d99c4e5e0c7817281b"
>  SRC_URI =3D "git://github.com/libimobiledevice/usbmuxd;protocol=3Dhttps;=
branch=3Dmaster"
>
> -
>  EXTRA_OECONF +=3D "--without-preflight"
>
>  FILES:${PN} +=3D "${base_libdir}/udev/rules.d/"
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb b/meta-=
oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
> index e411e6efc0..55772eb388 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
> @@ -8,7 +8,6 @@ SRCREV =3D "c94c20743ed7d4aa37835a5c46567ab0790d4acc"
>
>  SRC_URI =3D "git://github.com/zeromq/cppzmq.git;branch=3Dmaster;protocol=
=3Dhttps"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DCPPZMQ_BUILD_TESTS=3DOFF"
> diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/re=
cipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
> index 0908409e1e..54ac934331 100644
> --- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
> +++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
> @@ -12,7 +12,6 @@ DEPENDS =3D "libsigc++-3"
>
>  RDEPENDS:${PN}:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
>
> -
>  inherit pkgconfig cmake
>
>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
> diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe=
/recipes-core/dbus/dbus-daemon-proxy_git.bb
> index e99bf28ce5..51ba25b86a 100644
> --- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/alban/dbus-daemon-proxy;b=
ranch=3Dmaster;protocol=3Dhttps
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit pkgconfig
>
>  do_compile() {
> diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-co=
re/emlog/emlog_git.bb
> index 3f3b5bc920..72938cd620 100644
> --- a/meta-oe/recipes-core/emlog/emlog_git.bb
> +++ b/meta-oe/recipes-core/emlog/emlog_git.bb
> @@ -10,8 +10,6 @@ inherit update-rc.d
>
>  INITSCRIPT_NAME =3D "${BPN}"
>
> -
> -
>  do_compile() {
>      oe_runmake nbcat
>      oe_runmake mkemlog
> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb b/meta-oe/recipes-co=
re/glfw/glfw_3.3.8.bb
> index 8abb13b580..3b35b5c970 100644
> --- a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> @@ -14,7 +14,6 @@ PV .=3D "+git"
>  SRCREV =3D "7482de6071d21db77a7236155da44c172a7f6c9e"
>  SRC_URI =3D "git://github.com/glfw/glfw.git;branch=3D3.3-stable;protocol=
=3Dhttps"
>
> -
>  EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLFW_BUILD_DOCS=3DOFF"
>
>  CFLAGS +=3D "-fPIC"
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb b/meta-oe/rec=
ipes-core/glib-2.0/glibmm_2.66.7.bb
> index 7c7a3fafb7..86a953b04c 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42dfffebc56fec=
7527aac53b7a89d1d8 \
>
>  DEPENDS =3D "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
>
> -
>  inherit gnomebase
>
>  SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
> diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-=
core/mdbus2/mdbus2_git.bb
> index 948d50b471..ba7f6fd2b8 100644
> --- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> +++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/freesmartphone/mdbus.git;=
protocol=3Dhttps;branch=3Dmaste
>             "
>  SRCREV =3D "28202692d0b441000f4ddb8f347f72d1355021aa"
>
> -
>  inherit autotools pkgconfig vala
>
>  EXTRA_OECONF +=3D "--enable-vala"
> diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-o=
e/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
> index cf98c0cf2e..8755dcddc1 100644
> --- a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
> +++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/zlib-ng/minizip-ng.git;pr=
otocol=3Dhttps;branch=3Dmaster
>
>  SRCREV =3D "55db144e03027b43263e5ebcb599bf0878ba58de"
>
> -
>  RCONFLICTS:${PN} +=3D "minizip"
>
>  DEPENDS =3D "xz openssl bzip2"
> @@ -29,7 +28,6 @@ PACKAGECONFIG[zlib] =3D "-DMZ_ZLIB=3DON,-DMZ_ZLIB=3DOFF=
, zlib"
>  PACKAGECONFIG[zlib-ng] =3D "-DMZ_ZLIB=3DON,-DMZ_ZLIB=3DOFF, zlib-ng"
>  PACKAGECONFIG[test] =3D "-DMZ_BUILD_TESTS=3DON -DMZ_BUILD_UNIT_TESTS=3DO=
N, -DMZ_BUILD_TESTS=3DOFF -DMZ_BUILD_UNIT_TESTS=3DOFF, googletest"
>
> -
>  do_install:append () {
>      # remove absolute paths
>      sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/minizip/miniz=
ip.cmake
> diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb b/meta-oe/=
recipes-core/mm-common/mm-common_1.0.6.bb
> index a252a6b48e..c45a327c3f 100644
> --- a/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
> +++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "Common GNOME build files for C++ bindings"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>
> -
>  inherit gnomebase
>
>  # All the recipe does is stage python and shell script, some autotools f=
iles; nothing is compiled.
> diff --git a/meta-oe/recipes-core/ndctl/ndctl_v79.bb b/meta-oe/recipes-co=
re/ndctl/ndctl_v79.bb
> index 4014e3bca6..d1c47a6276 100644
> --- a/meta-oe/recipes-core/ndctl/ndctl_v79.bb
> +++ b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
> @@ -18,7 +18,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>v\d+(\.\d+)*)"
>
>  DEPENDS =3D "kmod udev json-c keyutils iniparser libtraceevent libtracef=
s"
>
> -
>  EXTRA_OEMESON +=3D "-Diniparserdir=3D${STAGING_INCDIR}/iniparser"
>
>  PACKAGECONFIG ??=3D "tests ${@bb.utils.contains('DISTRO_FEATURES','syste=
md','systemd','',d)}"
> diff --git a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb b/meta-oe/recipe=
s-core/opencl/clpeak_1.1.4.bb
> index 59f807b7ae..3c76f7e953 100644
> --- a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
> +++ b/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c=
9479bd8986968f4327"
>
>  SRCREV =3D "527695de8393a3144863a0a07f9b92f1c734d1c4"
>
> -
>  inherit cmake
>
>  DEPENDS +=3D "opencl-clhpp virtual/opencl-icd"
> diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recip=
es-core/opencl/ocl-icd_2.3.2.bb
> index 9e32242e31..b356f3089e 100644
> --- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> +++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/OCL-dev/ocl-icd.git;protoco=
l=3Dhttps;branch=3Dmaster"
>
>  SRCREV =3D "fdde6677b21329432db8b481e2637cd10f7d3cb2"
>
> -
>  inherit autotools
>
>  DEPENDS =3D "ruby-native"
> diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb b/met=
a-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> index 7335712d6f..c7e6cf5130 100644
> --- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> @@ -10,7 +10,6 @@ SRCREV =3D "c7b4aded1cab9560b226041dd962f63375a9a384"
>
>  SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=3Dh=
ttps;branch=3Dmain"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D " \
> diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb b/meta-=
oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
> index c766a66640..7a5ddfa766 100644
> --- a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
> @@ -8,7 +8,6 @@ inherit pkgconfig cmake
>  DEPENDS +=3D "opencl-headers opencl-icd-loader"
>  RDEPENDS:${PN} +=3D "python3-core python3-io"
>
> -
>  SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=3Dhtt=
ps;branch=3Dmain;lfs=3D0 \
>            file://0001-Ignore-Compiler-Warnings.patch"
>
> diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb =
b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> index 7cfc75f5ed..0eba1984d4 100644
> --- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> @@ -11,7 +11,6 @@ DEPENDS +=3D "opencl-headers"
>  PROVIDES =3D "virtual/opencl-icd"
>  RPROVIDES:${PN} =3D "virtual-opencl-icd"
>
> -
>  SRCREV =3D "861b68b290e76d08e7241608479c16431f529945"
>  SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=
=3Dmain;protocol=3Dhttps"
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> index 324406c1ed..002ac8e7a0 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> @@ -3,7 +3,6 @@
>
>  SUMMARY =3D "Basic task to get a device online"
>
> -
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  inherit packagegroup
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/me=
ta-oe/recipes-core/packagegroups/packagegroup-boot.bb
> index f6ddb1a352..acd9d4fcea 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
> @@ -1,6 +1,5 @@
>  SUMMARY =3D "Basic task to get a device booting"
>
> -
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  inherit packagegroup
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 2055a0ff91..32218bfce0 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -960,7 +960,6 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:r=
iscv32 =3D "oprofile-ptest"
>  RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:arm =3D "numactl-pte=
st"
>  RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:libc-musl =3D "minic=
oredumper-ptest"
>
> -
>  RDEPENDS:packagegroup-meta-oe-fortran-packages =3D "\
>      lapack \
>      octave \
> diff --git a/meta-oe/recipes-core/pim435/pim435_git.bb b/meta-oe/recipes-=
core/pim435/pim435_git.bb
> index a18e889683..8396db03ca 100644
> --- a/meta-oe/recipes-core/pim435/pim435_git.bb
> +++ b/meta-oe/recipes-core/pim435/pim435_git.bb
> @@ -15,7 +15,6 @@ SRCREV =3D "445ed623ec8d3ecbb1d566900b4ef3fb3031d689"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  DEPENDS =3D "i2c-tools"
>
>  EXTRA_OEMAKE +=3D "DESTDIR=3D${D}"
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb=
 b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
> index 9c39d40d23..46c954f9c0 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
> @@ -55,7 +55,6 @@ CFLAGS:append:libc-musl =3D " -D__UAPI_DEF_ETHHDR=3D0 "
>
>  EXTRA_OEMESON +=3D "-Dstatic-libsystemd=3Dpic"
>
> -
>  RDEPENDS:${PN}-dev =3D ""
>
>  do_compile() {
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb b/meta-oe/=
recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> index 62b30e9894..6d3cf68301 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> @@ -24,7 +24,6 @@ EXTRA_OECMAKE =3D "-DSDBUSCPP_BUILD_CODEGEN=3DOFF \
>                   -DSDBUSCPP_BUILD_DOCS=3DON \
>                   -DSDBUSCPP_BUILD_DOXYGEN_DOCS=3DOFF"
>
> -
>  # Link libatomic on architectures without 64bit atomics fixes
>  # libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'
>  LDFLAGS:append:mips =3D " -Wl,--no-as-needed -latomic -Wl,--as-needed"
> diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb =
b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
> index 840c04e52e..3d01f9c28a 100644
> --- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
> +++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
> @@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbc974d217b52=
5ea216a336adb73e1220"
>  SRCREV =3D "2543e6e5037c0b1b448282c2793f8a6ce8b12d71"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git=
;branch=3Dmaster"
>
> -
>  DEPENDS =3D "openssl"
>
>  EXTRA_OEMAKE:append =3D " PREFIX=3D${prefix} LIBDIR=3D${libdir} USE_SHAR=
ED_LIB=3D1"
> diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/m=
eta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
> index a9a147c35b..65e4d2b3d8 100644
> --- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
> +++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
> @@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/libtom/libtomcrypt.git;pr=
otocol=3Dhttps;branch=3Dmaster
>
>  SRCREV =3D "7e7eb695d581782f04b24dc444cbfde86af59853"
>
> -
>  inherit pkgconfig
>
>  PACKAGECONFIG ??=3D "ltm"
> diff --git a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb b/meta-oe/recipes=
-dbs/libdbi/libdbi_0.9.0.bb
> index 9623ef7f19..dc9f38a483 100644
> --- a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
> +++ b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
> @@ -1,4 +1,3 @@
>  require ${PN}.inc
>
> -
>  SRC_URI[sha256sum] =3D "dafb6cdca524c628df832b6dd0bf8fabceb103248edb2176=
2c02d3068fca4503"
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 13e55ebacd..785d0d22dd 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -97,7 +97,6 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>                   -DMASK_LONGDOUBLE_EXITCODE=3D0 \
>                   -DCMAKE_AR:FILEPATH=3D${AR}"
>
> -
>  # With Ninja it fails with:
>  # make: *** No rule to make target `install'.  Stop.
>  OECMAKE_GENERATOR =3D "Unix Makefiles"
> @@ -125,7 +124,6 @@ do_generate_toolchain_file:append:class-native () {
>      sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cmake
>  }
>
> -
>  do_compile:prepend:class-target () {
>      # These need to be in-tree or make will think they need to be built,
>      # and since we're cross-compiling that is disabled
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb b/meta-oe/reci=
pes-dbs/rocksdb/rocksdb_9.10.0.bb
> index 5bbb010f8b..6600e390c3 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
> @@ -29,7 +29,6 @@ SRC_URI:append:mips =3D " file://0001-replace-old-sync-=
with-new-atomic-builtin-equ
>  SRC_URI:append:powerpc =3D " file://0001-replace-old-sync-with-new-atomi=
c-builtin-equivalents.patch"
>  SRC_URI:remove:toolchain-clang:riscv32 =3D "file://0001-replace-old-sync=
-with-new-atomic-builtin-equivalents.patch"
>
> -
>  inherit cmake ptest
>
>  PACKAGECONFIG ??=3D "bzip2 zlib lz4 gflags"
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb=
 b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
> index 4afbba963a..59868d69bd 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=
=3D${BRANCH};protocol=3Dhttps \
>             file://0002-abseil-ppc-fixes.patch \
>             "
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> diff --git a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb b/meta=
-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
> index e027b8d4aa..94ea0eb965 100644
> --- a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
> +++ b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/gong.chen/aer-inject.gi
>  "
>  SRCREV =3D "9bd5e2c7886fca72f139cd8402488a2235957d41"
>
> -
>  DEPENDS =3D "bison-native"
>
>  do_compile() {
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r=
37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> index ff83b6c2ee..61d30917ef 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> @@ -61,7 +61,6 @@ SRC_URI =3D " \
>      file://mkbootimg.mk;subdir=3D${BPN} \
>  "
>
> -
>  B =3D "${WORKDIR}/${BPN}"
>
>  # http://errors.yoctoproject.org/Errors/Details/133881/
> diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe=
/recipes-devtools/apitrace/apitrace_11.1.bb
> index 244d9a3c6f..c4ca57d331 100644
> --- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> +++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "gitsm://github.com/${BPN}/${BPN}.git;branc=
h=3Dmaster;protocol=3Dhttps \
>             file://0001-Explicit-header-stdint.patch \
>            "
>
> -
>  DEPENDS +=3D "zlib libpng python3-native"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/m=
eta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> index 0e51289507..c6bbbe6f0c 100644
> --- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
> @@ -102,7 +102,6 @@ PACKAGES =3D+ "${PN}-minidump-upload ${PN}-sym-upload=
"
>  FILES:${PN}-minidump-upload =3D "${bindir}/minidump_upload"
>  FILES:${PN}-sym-upload =3D "${bindir}/sym_upload"
>
> -
>  SYSROOT_PREPROCESS_FUNCS +=3D "breakpad_populate_sysroot"
>  breakpad_populate_sysroot() {
>          sysroot_stage_dir ${D}/usr/include ${SYSROOT_DESTDIR}/usr/includ=
e
> diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/rec=
ipes-devtools/cjson/cjson_1.7.18.bb
> index 33c8c28531..01c9b7c927 100644
> --- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> +++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/DaveGamble/cJSON.git;branch=
=3Dmaster;protocol=3Dhttps \
>           "
>  SRCREV =3D "acc76239bee01d8e9c858ae2cab296704e52d916"
>
> -
>  inherit cmake pkgconfig ptest
>
>  RDEPENDS:${PN}-ptest +=3D "cmake"
> diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.b=
b b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> index ab4e6148e9..0bf59db289 100644
> --- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> +++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/concurrencykit/ck.git;bra=
nch=3Dmaster;protocol=3Dhttps \
>             file://0001-configure-Fix-compoiler-detection-logic-for-cross=
-co.patch \
>             file://0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64=
.patch"
>
> -
>  COMPATIBLE_HOST =3D "(arm|aarch64|i.86|x86_64|powerpc|powerpc64|riscv32|=
riscv64).*-linux*"
>
>  inherit autotools-brokensep
> diff --git a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb b/me=
ta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
> index 6e709b6e7e..be602e0922 100644
> --- a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
> +++ b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa818a259cbed7=
ce8bc2a22d35a464fc"
>  SRC_URI =3D "git://github.com/rm5248/libcppgenerate.git;branch=3Dmaster;=
protocol=3Dhttps"
>  SRCREV =3D "930c5503f76c877b72b9ff8546353d6f422bd010"
>
> -
>  inherit cmake
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb b/met=
a-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
> index 845a78da76..f953a41f99 100644
> --- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
> +++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
> @@ -17,7 +17,6 @@ inherit autotools-brokensep pkgconfig manpages
>  SRCREV =3D "c06d333b3162660694b26604a364cdab89e2010e"
>  SRC_URI =3D "git://github.com/universal-ctags/ctags;branch=3Dmaster;prot=
ocol=3Dhttps;tag=3Dp${PV}"
>
> -
>  PACKAGECONFIG ??=3D " \
>      readcmd \
>      xml \
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.b=
b b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
> index bc558b7d62..222540af4e 100644
> --- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
> @@ -10,7 +10,6 @@ SRC_URI:append:class-target =3D " file://oe-remote.repo=
.sample"
>
>  inherit setuptools3-base
>
> -
>  do_install:append() {
>      install -d ${D}${datadir}/dnf
>      install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-oe=
/recipes-devtools/doxygen/doxygen_1.14.0.bb
> index 512a63549e..d58c3184d6 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "\
>
>  SRCREV =3D "cbe58f6237b2238c9af7f51c6b7afb8bbf52c866"
>
> -
>  UPSTREAM_CHECK_GITTAGREGEX =3D "Release_(?P<pver>\d+(\_\d+)+)"
>
>  inherit cmake python3native
> diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/reci=
pes-devtools/exprtk/exprtk_git.bb
> index bdaa39b402..d4f086ab71 100644
> --- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> +++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> @@ -7,7 +7,6 @@ SRCREV =3D "a4b17d543f072d2e3ba564e4bc5c3a0d2b05c338"
>
>  SRC_URI =3D "git://github.com/ArashPartow/exprtk.git;branch=3Drelease;pr=
otocol=3Dhttps"
>
> -
>  # other packages commonly reference the file directly as "exprtk.hpp"
>  # create symlink to allow this usage
>  do_install() {
> diff --git a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb b/=
meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
> index 83e9383d4a..f320d370f4 100644
> --- a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
> +++ b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
> @@ -7,7 +7,6 @@ DEPENDS =3D "openssl"
>  SRC_URI =3D "git://git.pengutronix.de/git/extract-cert;protocol=3Dhttps;=
branch=3Dmaster;"
>  SRCREV =3D "d652b4e8279aef2a85f58676ab472744bafeafc9"
>
> -
>  inherit meson pkgconfig
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-o=
e/recipes-devtools/flatbuffers/flatbuffers.bb
> index c51a49ba01..451885e515 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
> @@ -13,7 +13,6 @@ DEPENDS =3D "flatbuffers-native"
>  RDEPENDS:${PN}-compiler =3D "${PN}"
>  RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>
> -
>  EXTRA_OECMAKE +=3D " \
>      -DFLATBUFFERS_BUILD_TESTS=3DOFF \
>      -DFLATBUFFERS_BUILD_SHAREDLIB=3DON \
> diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/reci=
pes-devtools/flatcc/flatcc_git.bb
> index 2565e3b9bd..6275a0c38e 100644
> --- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
> +++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D " \
>  "
>  SRCREV =3D "1653ec964730ec7d9892a08a1695ada6d20f5196"
>
> -
>  inherit cmake
>
>  # Enable installation for target
> diff --git a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb b/meta-oe/rec=
ipes-devtools/glade/glade_3.36.0.bb
> index 3645de3cc3..f510eba62a 100644
> --- a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
> +++ b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
> @@ -25,9 +25,3 @@ EXTRA_OECONF +=3D "--disable-man-pages"
>
>  FILES:${PN} +=3D "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/m=
odules/libgladegtk.so"
>
> -
> -
> -
> -
> -
> -
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.9.bb b/meta-oe/re=
cipes-devtools/guider/guider_3.9.9.bb
> index 27f39ed1e1..0ac84e39af 100644
> --- a/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
> @@ -10,7 +10,6 @@ PV =3D "3.9.9"
>  SRC_URI =3D "git://github.com/iipeace/${BPN};branch=3Dmaster;protocol=3D=
https;tag=3Dversions/${PV}"
>  SRCREV =3D "118ab61773463e56dedc78f5cf6723b97a4ad946"
>
> -
>  inherit setuptools3
>
>  RDEPENDS:${PN} =3D "python3 python3-core \
> diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta=
-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
> index 3aca51ee3e..a2465da259 100644
> --- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
> +++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/KDE/heaptrack.git;protoco=
l=3Dhttps;branch=3Dmaster \
>
>  SRCREV =3D "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE +=3D "-DHEAPTRACK_BUILD_GUI=3DOFF"
> diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-o=
e/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> index aa1f417604..f157579fd6 100644
> --- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> +++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> @@ -20,7 +20,6 @@ SRCREV =3D "630434bb0ac619f7beec927569782d924c459385"
>  PV_LONG :=3D "${PV}-171-g${SRCREV}"
>  PV .=3D "+git"
>
> -
>  inherit autotools ptest
>
>  EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
> diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-v=
alidator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-sch=
ema-validator_2.2.0.bb
> index 241fd328d8..61ac3f265f 100644
> --- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r_2.2.0.bb
> +++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r_2.2.0.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/pboettch/json-schema-vali=
dator;branch=3Dmain;protocol=3D
>
>  SRCREV =3D "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
>
> -
>  DEPENDS +=3D "nlohmann-json"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb b/meta-oe/=
recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
> index f68ffd2c0f..7503080fc7 100644
> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
> @@ -16,7 +16,6 @@ PE =3D "1"
>  SRCREV =3D "89e2973c754a9c02a49974d839779b151e95afd6"
>  SRC_URI =3D "git://github.com/open-source-parsers/jsoncpp;branch=3Dmaste=
r;protocol=3Dhttps"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DBUILD_OBJECT_LIBS=3DOFF -=
DJSONCPP_WITH_TESTS=3DOFF"
> diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb b/meta-oe/=
recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
> index ae86e20a4a..4916ca3f6a 100644
> --- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/cinemast/libjson-rpc-cpp;=
branch=3Dmaster;protocol=3Dhttp
>
>  SRCREV =3D "ec5ce12fc9c0299e1454cc002c70218b5a6f005b"
>
> -
>  PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG[coverage] =3D "-DWITH_COVERAGE=3DYES,-DWITH_COVERAGE=3DNO,=
,"
>
> diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb b/meta-oe/=
recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
> index 5ad953d260..256c78b422 100644
> --- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
> +++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/Thalhammer/jwt-cpp.git;bran=
ch=3Dmaster;protocol=3Dhttps
>
>  SRCREV =3D "e71e0c2d584baff06925bbb3aad683f677e4d498"
>
> -
>  DEPENDS =3D "openssl"
>
>  inherit cmake
> diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends=
_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends=
_4.11.0.1.bb
> index 43a61908f5..17d1b8d172 100644
> --- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0=
.1.bb
> +++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0=
.1.bb
> @@ -23,7 +23,6 @@ SRCREV =3D "f22fce3a308be1c7790ebefc6bbedb33c5f7c86a"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit autotools pkgconfig
>  do_configure:prepend () {
>         mkdir -p ${S}/scripts/.autostuff/m4
> diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/rec=
ipes-devtools/lemon/lemon_3.44.2.bb
> index 8a8491b76b..f16cd7c498 100644
> --- a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> +++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/sqlite/sqlite;protocol=3Dht=
tps;branch=3Dbranch-3.44"
>
>  SRCREV =3D "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
>
> -
>  do_compile() {
>      ${CC} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o lemon
>  }
> diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb b/me=
ta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> index 3616eb519d..c36cc5f3b9 100644
> --- a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> +++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> @@ -16,7 +16,6 @@ inherit autotools-brokensep pkgconfig
>  # sombok-2.4.0
>  SRCREV =3D "0098d85a037ef5c99a648a3669a077781a45e8cc"
>
> -
>  # Disable libthai support
>  EXTRA_OECONF =3D "--disable-libthai"
>
> diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta=
-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> index 38786b79ed..051353d213 100644
> --- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> +++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/ToruNiina/toml11;branch=
=3Dmain;protocol=3Dhttps \
>  "
>  SRCREV_FORMAT =3D "json_doctest"
>
> -
>  inherit cmake ptest
>
>  EXTRA_OECMAKE +=3D "-DTOML11_PRECOMPILE=3DON \
> diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/re=
cipes-devtools/libubox/libubox_git.bb
> index 394cf9c000..9d7374c33f 100644
> --- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
> +++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> @@ -25,7 +25,6 @@ PV =3D "1.0.1+git"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit cmake pkgconfig
>
>  DEPENDS =3D "json-c"
> diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb b/meta-oe/recipe=
s-devtools/lshw/lshw_02.20.bb
> index 95e2084255..eee9103089 100644
> --- a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> +++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D " \
>      file://0001-disable-docbook2man.patch \
>  "
>
> -
>  inherit pkgconfig
>
>  DEPENDS =3D "gettext-native"
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_git.bb
> index f84d989eef..b93cffc3e7 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -31,7 +31,6 @@ SRC_URI =3D "git://gitlab.com/cespedes/ltrace.git;proto=
col=3Dhttps;branch=3Dmain \
>             "
>  SRC_URI:append:libc-musl =3D " file://add_ppc64le.patch"
>
> -
>  inherit autotools
>
>  PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}=
"
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
> index f4a1345ab2..93205161c6 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protoc=
ol=3Dhttp;branch=3Dv2.1 \
>  PV =3D "2.1"
>  SRCREV =3D "538a82133ad6fddfd0ca64de167c4aca3bc1a2da"
>
> -
>  inherit pkgconfig binconfig siteinfo
>
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb b/meta-o=
e/recipes-devtools/makeself/makeself_2.5.0.bb
> index 57c8417f44..041bddf735 100644
> --- a/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
> +++ b/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "\
>
>  SRCREV =3D "09488c50c6bdc40aec8e3a9b23a539c5054a634c"
>
> -
>  do_configure[noexec] =3D "1"
>  do_compile[noexec] =3D "1"
>
> diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb b/meta-oe/re=
cipes-devtools/mbpoll/mbpoll_1.5.2.bb
> index 4590b49955..80c321f27a 100644
> --- a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
> +++ b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
> @@ -11,5 +11,4 @@ DEPENDS =3D "libmodbus (>=3D3.1.4)"
>  SRC_URI =3D "git://github.com/epsilonrt/mbpoll;protocol=3Dhttps;branch=
=3Dmaster"
>  SRCREV =3D "a0bd6c08d3d15b086f2104477295c0705aed366a"
>
> -
>  inherit pkgconfig cmake
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.b=
b b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> index 2fbbf8f06a..bcd295fc00 100644
> --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/microsoft/GSL.git;protoco=
l=3Dhttps;branch=3Dmain \
>  "
>  SRCREV =3D "a3534567187d2edc428efd3f13466ff75fe5805c"
>
> -
>  inherit cmake pkgconfig ptest
>
>  # this is header-only library
> diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb b/meta-o=
e/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> index aa7629763c..e5dfbaf9b0 100644
> --- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> +++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/msgpack/msgpack-c;branch=
=3Dc_master;protocol=3Dhttps \
>             "
>  SRCREV =3D "8160ede5e20fd3019a77eea46d9c72cf6163f802"
>
> -
>  inherit cmake pkgconfig
>
>  EXTRA_OECMAKE +=3D "-DMSGPACK_BUILD_TESTS=3Doff"
> diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/rec=
ipes-devtools/musl/musl-nscd_git.bb
> index ef2553760d..919bb55dab 100644
> --- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> +++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> @@ -20,7 +20,6 @@ UPSTREAM_CHECK_COMMITS =3D "1"
>
>  inherit autotools-brokensep
>
> -
>  do_configure () {
>      # no debug set -s flag
>      sed -i -e 's/LDFLAGS_AUTO=3D-s/LDFLAGS_AUTO=3D/' ${S}/configure
> diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb =
b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> index ec87535ec7..c4a28fb3ce 100644
> --- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> @@ -12,7 +12,6 @@ SRCREV =3D "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  # nlohmann-fifo is a header only C++ library, so the main package will b=
e empty.
>
>  RDEPENDS:${PN}-dev =3D ""
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.=
bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> index 1dfcc6ad75..f942a2d79d 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
> @@ -16,7 +16,6 @@ SRCREV_json-test-data =3D "a1375cea09d27cc1c4cadb8d0047=
0375b421ac37"
>
>  SRCREV_FORMAT .=3D "_json-test-data"
>
> -
>  inherit cmake ptest
>
>  EXTRA_OECMAKE +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '-DJSON_B=
uildTests=3DON -DJSON_TestDataDirectory=3D${PTEST_PATH}/json_test_data', '-=
DJSON_BuildTests=3DOFF', d)}"
> @@ -28,7 +27,6 @@ RDEPENDS:${PN}-ptest =3D "perl locale-base-de-de"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> -
>  do_install_ptest () {
>      install -d ${D}${PTEST_PATH}/tests
>      cp -r ${S}/json_test_data/ ${D}${PTEST_PATH}/
> @@ -36,7 +34,6 @@ do_install_ptest () {
>      rm -rf ${D}${PTEST_PATH}/json_test_data/.git
>  }
>
> -
>  # other packages commonly reference the file directly as "json.hpp"
>  # create symlink to allow this usage
>  do_install:append() {
> diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-targ=
et.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
> index ee7674a0c7..77c34c4779 100644
> --- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
> +++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
> @@ -1,6 +1,5 @@
>  SUMMARY =3D "Packages required for a target (on-device) SDK"
>
> -
>  inherit packagegroup
>
>  RPROVIDES:${PN} +=3D "packagegroup-native-sdk"
> diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/rec=
ipes-devtools/pahole/pahole_1.29.bb
> index aca915bf32..fdf7a34d57 100644
> --- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
> +++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
> @@ -13,7 +13,6 @@ SRCREV =3D "b9cc7963051b2099795129450f9b70c81950d02f"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=
=3Dmaster \
>             file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-p=
yth.patch"
>
> -
>  inherit cmake pkgconfig
>
>  PACKAGECONFIG[python3] =3D ",,python3,python3-core"
> diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/reci=
pes-devtools/pcimem/pcimem_2.0.bb
> index 130980b0cd..3f082fbe80 100644
> --- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> +++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/billfarrow/pcimem.git;bra=
nch=3Dmaster;protocol=3Dhttps"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  do_install() {
>      install -D -m 0755 ${B}/pcimem ${D}${bindir}/pcimem
>  }
> diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb b/meta-oe/re=
cipes-devtools/perl/exiftool_12.89.bb
> index 69a4f79815..edfd040dae 100644
> --- a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
> +++ b/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
> @@ -10,7 +10,6 @@ inherit cpan
>  SRCREV =3D "e04534a40925354187e8432d44248229d774f34a"
>  SRC_URI =3D "git://github.com/exiftool/exiftool;protocol=3Dhttps;branch=
=3Dmaster"
>
> -
>  RDEPENDS:${PN} =3D " \
>      perl \
>      perl-module-list-util \
> diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb b/meta-o=
e/recipes-devtools/perl/ipc-run_20231003.0.bb
> index 9cdb0a52cc..c8328ae9e7 100644
> --- a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
> +++ b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
> @@ -12,7 +12,6 @@ DEPENDS =3D "perl"
>  SRC_URI =3D "git://github.com/toddr/IPC-Run.git;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "ad56c3b5f5a211d32bbb8ac29f180d707ee58c1b"
>
> -
>  inherit cpan
>
>  EXTRA_CPANFLAGS =3D "EXPATLIBPATH=3D${STAGING_LIBDIR} EXPATINCPATH=3D${S=
TAGING_INCDIR}"
> diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb b/meta=
-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
> index ded0dea0d1..813620d290 100644
> --- a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
> +++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/makamaka/JSON.git;protoco=
l=3Dhttps;branch=3Dmaster"
>
>  SRCREV =3D "39bc0e567c202762a575fed2844ebdb941c3ca09"
>
> -
>  inherit cpan
>
>  RDEPENDS:${PN} +=3D "perl"
> diff --git a/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb b/meta-=
oe/recipes-devtools/pistache/pistache_0.4.26.bb
> index b0a20e3ece..2c4b20b3be 100644
> --- a/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
> +++ b/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
> @@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/pistacheio/pistache.git;bra=
nch=3Dmaster;protocol=3Dhttps
>  # SRCREV tagged 0.4.26
>  SRCREV =3D "ddffda861aa49012dcda28f1362d0339e718cd52"
>
> -
>  DEPENDS =3D "rapidjson"
>
>  inherit pkgconfig meson
> diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-de=
vtools/ply/ply_git.bb
> index 916ff29118..3f1259dfd8 100644
> --- a/meta-oe/recipes-devtools/ply/ply_git.bb
> +++ b/meta-oe/recipes-devtools/ply/ply_git.bb
> @@ -10,7 +10,6 @@ PV =3D "2.4.0"
>  SRC_URI =3D "git://github.com/iovisor/ply;branch=3Dmaster;protocol=3Dhtt=
ps"
>  SRCREV =3D "282558cfa1c0f0e095354e3a6ec4486b524179dc"
>
> -
>  CACHED_CONFIGUREVARS =3D 'LD=3D"${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS}=
 ${HOST_LD_ARCH}"'
>
>  inherit autotools-brokensep
> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
> index f3ffccf626..70cbdbe7ad 100644
> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
> @@ -16,7 +16,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e0=
9bc07f8cf64135026d91"
>  SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain"
>  SRCREV =3D "8a3bdd7e0a43b44e3b32548543128d95e68a3802"
>
> -
>  inherit cmake
>
>  CFLAGS +=3D "-fPIC"
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb b/meta=
-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
> index 30c9e19b16..8227597d75 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
> @@ -19,7 +19,6 @@ SRC_URI:append:class-native =3D " file://0001-Makefile.=
am-do-not-compile-the-code-
>
>  SRCREV =3D "185beed28e65494be7505b30c1afeaf199e19b23"
>
> -
>  inherit autotools pkgconfig
>
>  export PROTOC =3D "${STAGING_BINDIR_NATIVE}/protoc"
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> index 61aff1da28..519c1e2758 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> @@ -26,7 +26,6 @@ SRC_URI:append:mipsarcho32:toolchain-clang =3D " file:/=
/0001-Fix-build-on-mips-cla
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.(25\.(\d+)))"
>
> -
>  CVE_PRODUCT =3D "google:protobuf protobuf:protobuf google-protobuf proto=
buf-cpp"
>
>  inherit cmake pkgconfig ptest
> diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb b/meta-=
oe/recipes-devtools/python/python3-apt_2.5.3.bb
> index d5c440f413..14c7dec53b 100644
> --- a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
> +++ b/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
> @@ -7,7 +7,6 @@ SRC_URI =3D "git://salsa.debian.org/apt-team/python-apt.g=
it;protocol=3Dhttps;branch=3D
>
>  SRCREV =3D "3252935b6224b3bd2e2250894b9559b47c61b2e1"
>
> -
>  inherit setuptools3
>
>  DEPENDS +=3D "apt"
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-o=
e/recipes-devtools/rapidjson/rapidjson_git.bb
> index 724d329ee2..8fb91aedca 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -10,7 +10,6 @@ SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"
>
>  PV =3D "1.1.0+git"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE +=3D "-DRAPIDJSON_BUILD_DOC=3DOFF -DRAPIDJSON_BUILD_TESTS=
=3DOFF -DRAPIDJSON_BUILD_EXAMPLES=3DOFF"
> diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/=
meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> index 672c46055d..145b355cce 100644
> --- a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> +++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "45eb2ffa5378396e85432872833890b0a1cba872"
>
> -
>  inherit autotools
>
>  DEPENDS:append:libc-musl =3D " argp-standalone"
> diff --git a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb b/meta-oe=
/recipes-devtools/sexpect/sexpect_2.3.15.bb
> index 72ccd1d6b7..263b6fe4b3 100644
> --- a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
> +++ b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
> @@ -7,5 +7,4 @@ BRANCH =3D "master"
>  SRC_URI =3D "git://github.com/clarkwang/sexpect;branch=3D${BRANCH};proto=
col=3Dhttps;tag=3Dv${PV}"
>  SRCREV =3D "d3645392424d47532be90fcbc0abf3148324785b"
>
> -
>  inherit cmake
> diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb b/meta=
-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
> index ea4fc5d3dd..4d5a8d38a6 100644
> --- a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
> +++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
> @@ -9,7 +9,6 @@ DEPENDS =3D "ncurses"
>  SRC_URI =3D "git://github.com/ColinIanKing/smemstat.git;protocol=3Dhttps=
;branch=3Dmaster"
>  SRCREV =3D "1edc560602aa116b96408110b8b9d66a4edef60e"
>
> -
>  inherit bash-completion
>
>  do_compile () {
> diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng=
_1.3.2.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.=
3.2.bb
> index 966d14874e..c7b7d1f55c 100644
> --- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.=
bb
> +++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.=
bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3Da709b68f1=
ce8a9f10aeea6401446c1f4 \
>  SRCREV =3D "667faf69cc35215e33e747b4bffdcba3643c2629"
>  SRC_URI =3D "git://github.com/AgentD/squashfs-tools-ng.git;protocol=3Dht=
tps;branch=3Dfixes-1.3.0"
>
> -
>  inherit autotools pkgconfig
>
>  PACKAGECONFIG ??=3D "gzip xz lzo lz4 zstd ${@bb.utils.filter('DISTRO_FEA=
TURES', 'selinux', d)}"
> diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/re=
cipes-devtools/ssd1306/ssd1306_git.bb
> index 7824ed1a68..de8116b79b 100644
> --- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> +++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D " \
>  "
>  SRCREV =3D "34b42992a43fda69c6ba2557b718601cafe16251"
>
> -
>  # coreutils provides fmt which is used in the Makefile
>  DEPENDS =3D "i2c-tools coreutils-native"
>
> diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b=
/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> index 8effd042fb..e4d4e2f076 100644
> --- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> +++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/DrTimothyAldenDavis/SuiteSp=
arse;protocol=3Dhttps;branc
>             "
>  SRCREV =3D "538273cfd53720a10e34a3d80d3779b607e1ac26"
>
> -
>  DEPENDS =3D "cmake-native lapack gmp mpfr chrpath-native"
>
>  PROVIDES =3D "mongoose graphblas"
> diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgr=
ades_2.9.1.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upg=
rades_2.9.1.bb
> index 3d92f59ff2..2391ef4e5a 100644
> --- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.=
9.1.bb
> +++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.=
9.1.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/mvo5/unattended-upgrades.=
git;protocol=3Dhttps;branch=3Dm
>
>  SRCREV =3D "5aff8fa2b5b60b7c11bbfb39c884477e72d11d02"
>
> -
>  inherit setuptools3_legacy
>
>  DEPENDS +=3D "apt intltool-native python3-distutils-extra-native"
> diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb b/meta-o=
e/recipes-devtools/valijson/valijson_1.0.6.bb
> index 4e5f02746c..a2e790cf6f 100644
> --- a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
> +++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5c4583a434195e=
4f3b418e17c8ca2daf"
>  SRC_URI =3D "git://github.com/tristanpenman/valijson.git;branch=3Dmaster=
;protocol=3Dhttps;tag=3Dv${PV}"
>  SRCREV =3D "4edda758546436462da479bb8c8514f8a95c35ad"
>
> -
>  inherit cmake
>
>  PACKAGECONFIG ?=3D "boost"
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recip=
es-devtools/yajl/yajl_1.0.12.bb
> index 3e569859b7..4dee28746b 100644
> --- a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> +++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/lloyd/yajl;nobranch=3D1;p=
rotocol=3Dhttps"
>
>  inherit cmake lib_package
>
> -
>  EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')}"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>1(\.\d+)+)"
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipe=
s-devtools/yajl/yajl_2.1.0.bb
> index e4434bee45..82502810d7 100644
> --- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> +++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/lloyd/yajl;branch=3Dmaste=
r;protocol=3Dhttps \
>             "
>  SRCREV =3D "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
>
> -
>  inherit cmake lib_package
>
>  EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')}"
> diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-=
devtools/yasm/yasm_git.bb
> index 68895a1697..137f16e72b 100644
> --- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> +++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/yasm/yasm.git;branch=3Dma=
ster;protocol=3Dhttps \
>             file://0001-bitvect-fix-build-with-gcc-15.patch \
>  "
>
> -
>  inherit autotools gettext python3native
>
>  CACHED_CONFIGUREVARS =3D "CCLD_FOR_BUILD=3D'${CC_FOR_BUILD}'"
> diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipe=
s-extended/7zip/7zip_24.09.bb
> index 74e44c44e3..d48c38df20 100644
> --- a/meta-oe/recipes-extended/7zip/7zip_24.09.bb
> +++ b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
> @@ -14,7 +14,6 @@ SRCREV =3D "e5431fa6f5505e385c6f9367260717e9c47dc2ee"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/ip7z/7zip/releases/latest"
>
> -
>  # Support Yocto cross compiling
>  CXXFLAGS:append:toolchain-clang =3D " -Wno-error=3Dcast-qual -Wno-error=
=3Dsign-conversion \
>                                      -Wno-error=3Ddisabled-macro-expansio=
n \
> diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb b/meta-oe/recip=
es-extended/7zip/bit7z_4.0.9.bb
> index 033461d614..c975739d0b 100644
> --- a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
> +++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
> @@ -32,7 +32,6 @@ SRCHASH_CPM =3D "c8cdc32c03816538ce22781ed72964dc864b2a=
34a310d3b7104812a5ca2d835d"
>  TAG_CPM =3D "0.40.2"
>  SRC_URI[sha256sum] =3D "${SRCHASH_CPM}"
>
> -
>  inherit cmake ptest
>
>  DEPENDS =3D "7zip"
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta=
-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
> index b2cfd9b874..d267e62a38 100644
> --- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
> +++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
> @@ -41,7 +41,6 @@ inherit gettext autotools pkgconfig features_check syst=
emd
>
>  REQUIRED_DISTRO_FEATURES +=3D "opengl"
>
> -
>  EXTRA_OECONF +=3D "\
>      --enable-libraries \
>      --enable-unicode \
> diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/re=
cipes-extended/brotli/brotli_1.1.0.bb
> index 411f8a7610..887e043c24 100644
> --- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
> +++ b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D941ee9cd1=
609382f946352712a319b4b"
>  SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
>
> -
>  inherit cmake lib_package
>
>  do_install:append () {
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb b=
/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> index 26c80195b0..0416017849 100644
> --- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.g=
it;protocol=3Dhttps;branch=3Dma
>
>  SRCREV  =3D "e0760b2e9657907e691be4df384ca7617109635d"
>
> -
>  inherit cmake ptest
>
>  EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> index 8b48d20aac..0de8f9eb70 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> @@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/COVESA/${BPN}.git;protoco=
l=3Dhttps;branch=3Dmaster \
>             "
>  SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
>
> -
>  PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
 systemd systemd-watchdog systemd-journal ', '', d)} \
>   dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console =
\
>   udp-connection dlt-system dlt-filetransfer "
> diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta=
-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> index 71305cc35f..667c373857 100644
> --- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> +++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> @@ -20,7 +20,6 @@ SRC_URI =3D "\
>      git://github.com/docopt/docopt.cpp.git;protocol=3Dhttps;branch=3Dmas=
ter \
>  "
>
> -
>  inherit cmake
>
>  PACKAGECONFIG ??=3D ""
> diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb b/met=
a-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
> index c3a5a02a3f..10e2ad3f16 100644
> --- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
> +++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
> @@ -16,7 +16,6 @@ inherit cmake
>
>  DEPENDS +=3D "grpc protobuf cpprest grpc-native protobuf-native"
>
> -
>  EXTRA_OECONF +=3D "-DCPPREST_EXCLUDE_WEBSOCKETS=3DON"
>
>  do_install:append() {
> diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipe=
s-extended/etcd/etcd_3.5.7.bb
> index dd30543a41..43d0ddf049 100644
> --- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
> +++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
> @@ -43,7 +43,6 @@ go_do_compile:prepend() {
>      cd ${GO_INSTALL}
>      ./build.sh
>
> -
>      # Lots of discussion in go community about how it sets packages to
>      # read-only by default -> https://github.com/golang/go/issues/31481
>      # etcd is going to need some upstream work to support it.
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb =
b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
> index df7a4e2758..a06fe95bc3 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
> @@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/flatpak/flatpak-xdg-utils.g=
it;protocol=3Dhttps;branch=3D
>
>  SRCREV =3D "05abdd7421688be5835a6b12f2b068086c38d4aa"
>
> -
>  inherit meson pkgconfig
>
>  DEPENDS =3D "glib-2.0"
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.16.0.bb
> index f99c8ac36a..3df17913a1 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "1440f4faa67ebf69c7559f31d2cab59e6ec6fe2b"
>
> -
>  inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check useradd
>
>  REQUIRED_DISTRO_FEATURES =3D "polkit"
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> index 05e4fd937f..99e4230890 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> @@ -32,7 +32,6 @@ SRC_URI:append:libc-musl =3D "\
>  # prefix tag with "v" to avoid upgrade to random tags like "20220215"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
>
> -
>  PACKAGECONFIG ??=3D "\
>      aws \
>      binary \
> diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb b/meta-oe/re=
cipes-extended/hexedit/hexedit_1.6.bb
> index 2299d55b2b..e43bf3e610 100644
> --- a/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
> +++ b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/pixel/hexedit.git;branch=
=3Dmaster;protocol=3Dhttps \
>
>  SRCREV =3D "eab92dcaa34b66bc5182772afc9fda4ac8a27597"
>
> -
>  inherit autotools-brokensep update-alternatives
>
>  ALTERNATIVE:${PN} =3D "hexedit"
> diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/=
recipes-extended/hiredis/hiredis_1.2.0.bb
> index 8678447cf5..05f1484727 100644
> --- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
> +++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D " \
>      "
>  SRCREV =3D "60e5075d4ac77424809f855ba3e398df7aacefe8"
>
> -
>  inherit cmake ptest
>
>  # 'testssl' is not enabled by default as redis recipe does not build wit=
h ssl support
> diff --git a/meta-oe/recipes-extended/iotop/iotop_1.30.bb b/meta-oe/recip=
es-extended/iotop/iotop_1.30.bb
> index 9fe774f9f2..3a6b41c098 100644
> --- a/meta-oe/recipes-extended/iotop/iotop_1.30.bb
> +++ b/meta-oe/recipes-extended/iotop/iotop_1.30.bb
> @@ -7,7 +7,6 @@ DEPENDS =3D "ncurses"
>  SRC_URI =3D "git://github.com/Tomas-M/iotop.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
>  SRCREV =3D "c3366a8a235f9c8ddc4797625f22cfdf12ba2c36"
>
> -
>  inherit pkgconfig
>
>  EXTRA_OEMAKE =3D "V=3D1 STRIP=3Dtrue"
> diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/me=
ta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> index 7129d6ef8c..d13d51e35e 100644
> --- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> +++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> @@ -7,7 +7,6 @@ PV =3D "2.3.6+git"
>  SRC_URI =3D "git://github.com/snarlistic/jpnevulator.git;protocol=3Dhttp=
s;branch=3Dmaster"
>  SRCREV =3D "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
>
> -
>  do_compile() {
>         oe_runmake
>  }
> diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/=
meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> index 6ca8569bc5..f68c2af2ad 100644
> --- a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> +++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> @@ -16,7 +16,6 @@ SRCREV =3D "9ae4f4ae4481b1e69d38ed810980d33103544613"
>  # The current PV is not a git tag but a README content
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit autotools
>
>  EXTRA_OECONF +=3D "--with-system-libunwind --enable-shared --disable-sta=
tic"
> diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb b/meta-oe=
/recipes-extended/libcbor/libcbor_0.12.0.bb
> index 60c3c6fadd..e8652bbf47 100755
> --- a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
> +++ b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D6f3b3881df6=
2ca763a02d359a6e94071"
>  SRC_URI =3D "git://github.com/PJK/libcbor.git;protocol=3Dhttps;branch=3D=
master"
>  SRCREV =3D "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelease -DBUILD_SHARED_LIBS:BOO=
L=3DON"
> diff --git a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb b/meta-oe/re=
cipes-extended/libcec/libcec_7.0.0.bb
> index 2def38d73f..0d00c3ad70 100644
> --- a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
> +++ b/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/Pulse-Eight/libcec.git;br=
anch=3Drelease;protocol=3Dhttps
>             file://0001-Enhance-reproducibility.patch \
>            "
>
> -
>  inherit cmake pkgconfig
>
>  # default config is for RaspberryPi API, use the Linux 4.10+ API by defa=
ult
> diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git=
.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> index 9f4b2a19d0..2894e33011 100644
> --- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> +++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> @@ -14,5 +14,3 @@ SRCREV =3D "db9371cf9f38b5a3b2f6e4fae3f92eb052d2d929"
>  SRC_URI =3D "git://github.com/libdivecomputer/libdivecomputer.git;protoc=
ol=3Dhttps;branch=3Dmaster \
>            "
>
> -
> -
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb =
b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> index 7f01962a97..d49903b8b8 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> @@ -11,7 +11,6 @@ inherit autotools pkgconfig python3native python3target=
config
>  SRCREV =3D "2117b8fdb6b4096455bd2041a63e59a028120136"
>  SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
>
> -
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
>  CVE_STATUS_LIBLIST[status] =3D "fixed-version: The CPE in the NVD databa=
se doesn't reflect correctly the vulnerable versions."
>  CVE_STATUS_LIBLIST =3D " \
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/=
meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> index e29ec88e06..8980fc1798 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> @@ -13,7 +13,6 @@ PV =3D "2.3.0+git"
>  SRCREV =3D "2cd858c679d25633077ca78b67182a9b77653816"
>  SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
>
> -
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
>  CVE_STATUS_LIBLIST[status] =3D "fixed-version: The CPE in the NVD databa=
se doesn't reflect correctly the vulnerable versions."
>  CVE_STATUS_LIBLIST =3D " \
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.b=
b b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
> index 7869fc1941..bbcf8eb6f7 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
> @@ -11,5 +11,4 @@ PKGV =3D "${GITPKGVTAG}"
>  SRCREV =3D "adf9c22b9010490e4b55eaeb14731991db1c172c"
>  SRC_URI =3D "git://github.com/libimobiledevice/libusbmuxd;protocol=3Dhtt=
ps;branch=3Dmaster"
>
> -
>  FILES:${PN} +=3D "${base_libdir}/udev/rules.d/"
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb =
b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> index 76759fe69d..f3958aa59f 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> @@ -12,5 +12,4 @@ PV =3D "2.0.2+git"
>  SRCREV =3D "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
>  SRC_URI =3D "git://github.com/libimobiledevice/libusbmuxd;protocol=3Dhtt=
ps;branch=3Dmaster"
>
> -
>  FILES:${PN} +=3D "${base_libdir}/udev/rules.d/"
> diff --git a/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb b/meta-oe/=
recipes-extended/libleak/libleak_0.3.6.bb
> index 8021d8cf06..e546b75619 100644
> --- a/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
> +++ b/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "gitsm://github.com/WuBingzheng/libleak;pro=
tocol=3Dhttps;branch=3Dmaster \
>             file://0001-respect-environment-variables.patch \
>            "
>
> -
>  do_configure () {
>         :
>  }
> diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb b/me=
ta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
> index 89670d10ca..4d8645c719 100644
> --- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
> +++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/rsyslog/liblognorm;branch=
=3Dmaster;protocol=3Dhttps \
>             "
>  SRCREV =3D "46c6ee4c8e5f827893e485a4ef1aff04ea881273"
>
> -
>  inherit autotools pkgconfig
>
>  PACKAGECONFIG ??=3D "testbench tools"
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb b/met=
a-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
> index ffbb3a8c8e..852f87dcd3 100644
> --- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd653=
80cdd255951079008b364516c"
>  SRC_URI =3D "git://github.com/stephane/libmodbus;branch=3Dmaster;protoco=
l=3Dhttps"
>  SRCREV =3D "5190e5e141780ae481f24be16d7b39a5f3ad8f8f"
>
> -
>  inherit autotools pkgconfig
>
>  PACKAGECONFIG ??=3D ""
> diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb =
b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> index 7ec01ecd3f..55b30f94fe 100644
> --- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> +++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/libpwquality/libpwquality=
;branch=3Dmaster;protocol=3Dhtt
>  "
>  SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
>
> -
>  inherit autotools-brokensep gettext setuptools3-base
>
>  do_configure:prepend() {
> diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb b/me=
ta-oe/recipes-extended/libreport/libreport_2.17.15.bb
> index ba10f062ec..293132e6b1 100644
> --- a/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
> +++ b/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
> @@ -21,7 +21,6 @@ SRCREV =3D "f6bb06a699617d078fcd4f8b71b4d063bf47b52b"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
>
> -
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES =3D "systemd"
>
> diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/re=
cipes-extended/libuio/libuio_0.2.1.bb
> index d7e88f4fd0..e3115493d1 100644
> --- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> @@ -11,7 +11,6 @@ PV .=3D "+0.2.2+git"
>
>  inherit autotools
>
> -
>  PACKAGES +=3D "${PN}-tools"
>
>  FILES:${PN} =3D "${libdir}"
> diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb b/meta-oe/r=
ecipes-extended/libwmf/libwmf_0.2.13.bb
> index c5411d53a1..7d7180871f 100644
> --- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
> +++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
> @@ -6,7 +6,6 @@ SECTION =3D "libs"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>
> -
>  DEPENDS:class-native =3D "freetype-native libpng-native jpeg-native"
>  DEPENDS =3D "freetype libpng jpeg expat gtk+"
>
> @@ -19,7 +18,6 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
>  SRC_URI =3D "git://github.com/caolanm/libwmf.git;protocol=3Dhttps;branch=
=3Dmaster"
>  SRCREV =3D "9e4737f2293c0d127bda92e5b01896df10571424"
>
> -
>  do_install:append() {
>      sed -i -e 's@${RECIPE_SYSROOT}@@g' ${D}${bindir}/libwmf-config ${D}$=
{libdir}/pkgconfig/libwmf.pc
>  }
> diff --git a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb b/meta-oe=
/recipes-extended/libyang/libyang_3.12.2.bb
> index 7fff0b96a1..eabb190e27 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/CESNET/libyang.git;branch=
=3Dmaster;protocol=3Dhttps;tag=3D
>             file://run-ptest \
>             "
>
> -
>  # Main dependencies
>  inherit cmake pkgconfig lib_package ptest multilib_header
>  DEPENDS =3D "libpcre2"
> diff --git a/meta-oe/recipes-extended/md5deep/md5deep_git.bb b/meta-oe/re=
cipes-extended/md5deep/md5deep_git.bb
> index 4b7192290e..34571a474d 100644
> --- a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> +++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> @@ -13,5 +13,4 @@ SRC_URI =3D "git://github.com/jessek/hashdeep.git;branc=
h=3Dmaster;protocol=3Dhttps \
>             file://0001-Fix-literal-and-identifier-spacing-as-dictated-by=
-C-.patch \
>             "
>
> -
>  inherit autotools
> diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/m=
eta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> index ab08322805..f78b4c1702 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> +++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> @@ -58,7 +58,6 @@ SRC_URI[ossp-uuid.sha256sum] =3D "11a615225baa5f8bb6868=
24423f50e4427acd3f70d394765
>  # libsodium: 1.0.19
>  SRC_URI[libsodium.sha256sum] =3D "018d79fe0a045cca07331d37bd0cb57b2e838c=
51bc48fd837a1472e50068bbea"
>
> -
>  inherit pkgconfig cmake systemd
>
>  DEPENDS =3D "virtual/crypt bison-native flex-native flex openssl curl zl=
ib xz bzip2 yaml-cpp zstd lz4"
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-=
extended/mraa/mraa_git.bb
> index b53be9803e..fb847f1e15 100644
> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/eclipse/${BPN}.git;protoc=
ol=3Dhttps;branch=3Dmaster \
>             file://0002-gpio-Include-limits.h-for-PATH_MAX.patch \
>             "
>
> -
>  # CMakeLists.txt checks the architecture, only x86 and ARM supported for=
 now
>  COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
>
> diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta=
-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
> index 970d7fb5fc..b1b05d4ce6 100644
> --- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
> +++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
> @@ -24,7 +24,6 @@ SRC_URI =3D "git://github.com/Openwsman/openwsman.git;b=
ranch=3Dmain;protocol=3Dhttps \
>             file://0001-Link-with-libm-for-floor-function.patch \
>             "
>
> -
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd4f53d4c6cf73b9d43186ce3be6dd=
0ba"
>
> diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta=
-oe/recipes-extended/p8platform/p8platform_git.bb
> index e69d544b66..8809dcedd1 100644
> --- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> +++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> @@ -9,7 +9,6 @@ PV =3D "2.1.0.1+git"
>  SRC_URI =3D "git://github.com/Pulse-Eight/platform.git;branch=3Dmaster;p=
rotocol=3Dhttps"
>  SRCREV =3D "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
>
> -
>  inherit cmake pkgconfig
>
>  EXTRA_OECMAKE +=3D "-DCMAKE_INSTALL_LIBDIR=3D${libdir} -DCMAKE_INSTALL_L=
IBDIR_NOARCH=3D${libdir}"
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-=
oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> index ab5a8ef342..4e59bd10cb 100644
> --- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D "git://github.com/PADL/pam_ccreds;branch=3D=
master;protocol=3Dhttps \
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit autotools
>
>  EXTRA_OECONF +=3D "--libdir=3D${base_libdir} "
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb b/me=
ta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
> index 2886137b7d..b28e27fecf 100644
> --- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
> @@ -13,7 +13,6 @@ REQUIRED_DISTRO_FEATURES =3D "pam"
>  SRCREV =3D "3e026863cad1fd45c760ee1bc93ef4f0606cc852"
>  SRC_URI =3D "git://github.com/rmbreak/pam_ldapdb;branch=3Dmaster;protoco=
l=3Dhttps"
>
> -
>  do_install () {
>      oe_runmake install DESTDIR=3D${D} PAMDIR=3D${base_libdir}/security
>  }
> diff --git a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb b/meta-oe/r=
ecipes-extended/pam/pam-radius_3.0.0.bb
> index 0e2199b066..1c761a0cdd 100644
> --- a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
> +++ b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcbbd794e2a0a=
289b9dfcc9f513d1996e"
>  SRC_URI =3D "git://github.com/FreeRADIUS/pam_radius.git;protocol=3Dhttps=
;branch=3Dmaster"
>  SRCREV =3D "b6442c3e0147f1019990520483fa3a30e4ccf059"
>
> -
>  DEPENDS =3D "libpam"
>
>  inherit autotools-brokensep features_check
> diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb b/meta-oe/reci=
pes-extended/pegtl/pegtl_3.2.8.bb
> index 4d540d0180..4e42f54c0f 100644
> --- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
> +++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
> @@ -12,7 +12,6 @@ SRCREV =3D "be527327653e94b02e711f7eff59285ad13e1db0"
>
>  inherit cmake ptest
>
> -
>  do_install_ptest () {
>      install -d ${D}${PTEST_PATH}/src/test/pegtl/data
>      install -m 0755 ${B}/src/test/pegtl/pegtl-test-* ${D}${PTEST_PATH}/s=
rc/test/pegtl
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb b/meta-oe/recipe=
s-extended/pmdk/pmdk_2.1.1.bb
> index 5aba331acc..8e7553ad6d 100644
> --- a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
> @@ -9,7 +9,6 @@ DEPENDS =3D "ndctl"
>  # Required to have the fts.h header for musl
>  DEPENDS:append:libc-musl =3D " fts"
>
> -
>  SRC_URI =3D "git://github.com/pmem/pmdk.git;branch=3Dmaster;protocol=3Dh=
ttps"
>  SRCREV =3D "0f0ab391d8e3db52f745f33c92b9d9a462bb3695"
>
> diff --git a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.b=
b b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> index 20b7f0a5bd..0e63ca0799 100644
> --- a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> +++ b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/lib-cpp/${BPN}.git;branch=
=3Dmaster;protocol=3Dhttps"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  do_configure:prepend() {
>      echo " " > ${S}/tests/CMakeLists.txt
>  }
> diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb b/meta-oe/reci=
pes-extended/qcbor/qcbor_1.4.1.bb
> index 00cae11c4e..4597b5c9ed 100644
> --- a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
> +++ b/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/laurencelundblade/QCBOR;p=
rotocol=3Dhttps;branch=3Dmaster
>
>  SRCREV =3D "4487f10e1bf258434fb8a39e4f59c29e31910ad0"
>
> -
>  inherit pkgconfig
>
>  CFLAGS +=3D " \
> diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3=
.11.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
> index d643c6f0b9..d1993fd489 100644
> --- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
> +++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/sewenew/redis-plus-plus;b=
ranch=3Dmaster;protocol=3Dhttps
>             file://0001-CMakeLists.txt-fix-substitution-for-static-libs.p=
atch"
>  SRCREV =3D "ad6baa121f4c6fbc7622d83d606210ac22549c78"
>
> -
>  inherit cmake
>
>  # if ssl is enabled for redis-plus-plus it must also be enabled for hire=
dis
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb b/meta-oe/=
recipes-extended/rrdtool/rrdtool_1.9.0.bb
> index 69c281bd92..9e183a35ea 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "\
>      git://github.com/oetiker/rrdtool-1.x.git;protocol=3Dhttps;branch=3Dm=
aster \
>  "
>
> -
>  inherit cpan autotools-brokensep gettext pkgconfig python3native python3=
-dir systemd
>
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/m=
eta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
> index f1235d7b96..987fd28afd 100644
> --- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/rsyslog/libfastjson.git;p=
rotocol=3Dhttps;branch=3Dmaster
>
>  SRCREV =3D "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
>
> -
>  CVE_PRODUCT =3D "rsyslog:libfastjson"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe=
/recipes-extended/rsyslog/librelp_1.11.0.bb
> index 3ccb87a9c5..089f7a04be 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/rsyslog/librelp.git;proto=
col=3Dhttps;branch=3Dstable \
>
>  SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
>
> -
>  CVE_PRODUCT =3D "rsyslog:librelp"
>
>  inherit autotools pkgconfig ptest
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb b/meta-=
oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
> index c4ddb72bcc..a14c4ca37f 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
> @@ -86,7 +86,6 @@ PACKAGECONFIG[mail] =3D "--enable-mail,--disable-mail,,=
"
>  PACKAGECONFIG[valgrind] =3D ",--without-valgrind-testbench,valgrind,"
>  PACKAGECONFIG[imhttp] =3D "--enable-imhttp,--disable-imhttp,civetweb,"
>
> -
>  TESTDIR =3D "tests"
>  do_compile_ptest() {
>      echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
> diff --git a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb b/meta-oe/=
recipes-extended/sanlock/sanlock_4.0.0.bb
> index fe8592be39..c2135fac8b 100644
> --- a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
> +++ b/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "git://pagure.io/sanlock.git;protocol=3Dhtt=
p;branch=3Dmaster \
>             "
>  SRCREV =3D "70c268a07273da78a4aadd14c40ffb75138ccebe"
>
> -
>  CVE_STATUS[CVE-2012-5638] =3D "fixed-version: The CPE in the NVD databas=
e doesn't reflect correctly the vulnerable versions."
>
>  DEPENDS =3D "libaio util-linux"
> diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/re=
cipes-extended/sedutil/sedutil_git.bb
> index e8987b2dd0..338330ed2f 100644
> --- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> +++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
> @@ -14,5 +14,4 @@ SRC_URI =3D "git://github.com/Drive-Trust-Alliance/sedu=
til.git;branch=3Dmaster;proto
>             file://0001-Fix-build-on-big-endian-architectures.patch \
>             "
>
> -
>  inherit autotools-brokensep
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb b/meta-oe/r=
ecipes-extended/snappy/snappy_1.1.10.bb
> index 2a49ba99b0..c526602c93 100644
> --- a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "gitsm://github.com/google/snappy.git;proto=
col=3Dhttps;branch=3Dmain \
>
>  SRCREV =3D "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
>
> -
>  inherit cmake pkgconfig
>
>  PACKAGECONFIG ??=3D ""
> diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-o=
e/recipes-extended/socketcan/can-isotp_git.bb
> index 530e38ce21..9adb08f8d2 100644
> --- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/hartkopp/can-isotp.git;prot=
ocol=3Dhttps;branch=3Dmaster"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit module
>
>  EXTRA_OEMAKE +=3D "KERNELDIR=3D${STAGING_KERNEL_DIR}"
> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/me=
ta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> index 5dc41bcb93..98a2f86d34 100644
> --- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/linux-can/${BPN}.git;protoc=
ol=3Dhttps;branch=3Dmaster \
>
>  SRCREV =3D "01083a64ebf28cc716efe2d2fd51c141042ae34b"
>
> -
>  inherit cmake pkgconfig update-alternatives
>
>  PACKAGES =3D+ " \
> diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-=
oe/recipes-extended/socketcan/canutils_4.0.6.bb
> index b92b8086d6..314e61be2d 100644
> --- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
> +++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://git.pengutronix.de/git/tools/canutil=
s.git;protocol=3Dhttps;branch
>
>  inherit update-alternatives
>
> -
>  inherit autotools pkgconfig
>
>  # Busybox ip doesn't support can interface configuration, use the real t=
hing
> diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb b/=
meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
> index 535f37f84c..6e29a75f67 100644
> --- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
> +++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "077def398ad303043d73339112968e5112d8d7c8"
>
>  SRC_URI =3D "git://git.pengutronix.de/git/tools/libsocketcan.git;protoco=
l=3Dhttps;branch=3Dmaster"
>
> -
>  inherit autotools pkgconfig
>
>  PACKAGECONFIG ?=3D ""
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/r=
ecipes-extended/sysdig/sysdig_0.28.0.bb
> index b60f9c643c..3f26bf2f01 100644
> --- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
> +++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
> @@ -33,7 +33,6 @@ SRCREV_falco =3D "caa0e4d0044fdaaebab086592a97f0c7f32ae=
aa9"
>
>  SRCREV_FORMAT =3D "sysdig_falco"
>
> -
>  EXTRA_OECMAKE =3D "\
>                  -DBUILD_DRIVER=3DOFF \
>                  -DMINIMAL_BUILD=3DON \
> diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-o=
e/recipes-extended/tipcutils/tipcutils_git.bb
> index a4bf3eaaca..25d66e2f4b 100644
> --- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> @@ -18,7 +18,6 @@ DEPENDS +=3D "libdaemon"
>
>  RDEPENDS:${PN} =3D "iproute2-tipc"
>
> -
>  do_configure:prepend() {
>      ( cd ${S}; ${S}/bootstrap )
>  }
> diff --git a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb b/meta-oe/reci=
pes-extended/tmate/tmate_2.4.0.bb
> index 5fb28b0085..fe8e26dee6 100644
> --- a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
> +++ b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
> @@ -12,5 +12,4 @@ SRC_URI =3D "\
>
>  SRCREV =3D "5e00bfa5e137e76c81888727712ced2b3fd99f5b"
>
> -
>  inherit pkgconfig autotools
> diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb b/=
meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> index 1a453ebe10..308ea64bbf 100644
> --- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> +++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "44a173195986d0d853316cb02a58785ded66c12b"
>  PV =3D "0.5.0+git"
>  SRC_URI =3D "git://github.com/wertarbyte/${BPN}.git;branch=3Ddebian;prot=
ocol=3Dhttps"
>
> -
>  inherit pkgconfig perlnative update-rc.d systemd
>
>  PACKAGECONFIG =3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','sys=
temd','',d)}"
> diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-ex=
tended/upm/upm_git.bb
> index 616f4ca09a..6e6dc40937 100644
> --- a/meta-oe/recipes-extended/upm/upm_git.bb
> +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> @@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/eclipse/${BPN}.git;protoc=
ol=3Dhttps;branch=3Dmaster \
>
>  SRC_URI:append:toolchain-clang:x86 =3D " file://0001-nmea_gps-Link-with-=
latomic.patch "
>
> -
>  # Depends on mraa which only supports x86 and ARM for now
>  COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
>
> diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb b/meta-oe/re=
cipes-extended/valkey/valkey_8.1.1.bb
> index 35b3d3c4a7..609da56a24 100644
> --- a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
> +++ b/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D " \
>  "
>  SRCREV =3D "fcd8bc3ee40f5d7841b7d5a8f3cd12252fec14e4"
>
> -
>  RPROVIDES:${PN} =3D "virtual-redis"
>
>  inherit pkgconfig update-rc.d systemd useradd
> diff --git a/meta-oe/recipes-extended/wipe/wipe_0.24.bb b/meta-oe/recipes=
-extended/wipe/wipe_0.24.bb
> index ba3ed29d59..2709c28630 100644
> --- a/meta-oe/recipes-extended/wipe/wipe_0.24.bb
> +++ b/meta-oe/recipes-extended/wipe/wipe_0.24.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/berke/wipe.git;branch=3Dm=
aster;protocol=3Dhttps \
>  "
>  SRCREV =3D "796b62293e007546e051619bd03f5ba338ef28e5"
>
> -
>  EXTRA_OEMAKE =3D "linux"
>
>  do_install() {
> diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/r=
ecipes-extended/wtmpdb/wtmpdb_0.11.0.bb
> index b901e8815a..c2da11752a 100644
> --- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
> +++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
> @@ -10,7 +10,6 @@ SRCREV =3D "493e9704dbc50f141d5fbd41c823311e79d7e8d3"
>  SRC_URI =3D "git://github.com/thkukuk/wtmpdb.git;branch=3Dmain;protocol=
=3Dhttps \
>             file://0001-include-libgen.h-for-basename.patch"
>
> -
>  inherit meson pkgconfig systemd features_check
>
>  DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)} sqlite3 "
> diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/recip=
es-extended/zlog/zlog_1.2.16.bb
> index f450c2cf01..c5e9f2967e 100644
> --- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> +++ b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
>  SRCREV =3D "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
>  SRC_URI =3D "git://github.com/HardySimpson/zlog;branch=3Dmaster;protocol=
=3Dhttps"
>
> -
>  inherit pkgconfig
>
>  EXTRA_OEMAKE =3D "CC=3D'${CC}' LD=3D'${LD}' LIBRARY_PATH=3D${baselib}"
> diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-=
extended/zram/zram_0.2.bb
> index 2c894c0230..91977d87f4 100644
> --- a/meta-oe/recipes-extended/zram/zram_0.2.bb
> +++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
> @@ -8,7 +8,6 @@ RDEPENDS:${PN} =3D "kmod util-linux-swaponoff \
>      ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux-zramctl=
','',d)}"
>  RRECOMMENDS:${PN} =3D "kernel-module-zram"
>
> -
>  SRC_URI =3D " \
>             file://init \
>             file://zram-swap-init \
> diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb b/meta-oe/recipes-=
gnome/atk/atkmm_2.28.2.bb
> index bc637470f9..af3f3e602b 100644
> --- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
> +++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495=
befef8f17206a5b0a1 \
>
>  DEPENDS =3D "atk glibmm"
>
> -
>  inherit gnomebase features_check
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipe=
s-gnome/gtk+/gtkmm3_3.24.7.bb
> index cac6474e73..5000b90e4e 100644
> --- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
> @@ -10,7 +10,6 @@ DEPENDS =3D "glib-2.0-native atkmm pangomm glibmm gtk+3=
 cairomm gdk-pixbuf-native"
>
>  BPN =3D "gtkmm"
>
> -
>  inherit gnomebase features_check
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-gr=
aphics/aml/aml_git.bb
> index a0b27bd256..18b278612b 100644
> --- a/meta-oe/recipes-graphics/aml/aml_git.bb
> +++ b/meta-oe/recipes-graphics/aml/aml_git.bb
> @@ -10,7 +10,6 @@ SRCREV =3D "b83f3576ce4187d9285f06e9066ef43a691464d4"
>
>  PV =3D "0.3.0+git"
>
> -
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
>
> diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb b/meta-oe/recipe=
s-graphics/cglm/cglm_0.9.6.bb
> index b2673f1e9b..6b05d5e739 100644
> --- a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
> +++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/recp/cglm;branch=3Dmaster=
;protocol=3Dhttps"
>  # Tag v0.9.6
>  SRCREV =3D "144d1e7c29b3b0c6dede7917a0476cc95248559c"
>
> -
>  PACKAGECONFIG[build_tests] =3D "-Dbuild_tests=3Dtrue,-Dbuild_tests=3Dfal=
se,"
>
>  PACKAGECONFIG ?=3D ""
> diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta=
-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> index 1018e0675e..ac1770124f 100644
> --- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> +++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/lucasdemarchi/dietsplash.=
git;branch=3Dmaster;protocol=3D
>
>  inherit autotools
>
> -
>  EXTRA_OECONF =3D " --with-systemdsystemunitdir=3D${systemd_unitdir}/syst=
em \
>                   --disable-staticimages --with-rootdir=3D${root_prefix}"
>
> diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb b/me=
ta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
> index ef6dc14ca6..d85df82268 100644
> --- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
> +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/manatools/dnfdragora.git;=
branch=3Dstable-2.x;protocol=3D
>
>  SRCREV =3D "abbe08b7a487325182758d5285b54437a914207b"
>
> -
>  inherit cmake gettext pkgconfig python3-dir python3native setuptools3-ba=
se mime-xdg
>
>  DEPENDS +=3D "dnf python3 "
> diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/rec=
ipes-graphics/drm/drm-info_2.7.0.bb
> index 810be40013..aaa85961ca 100644
> --- a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> +++ b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D32fd56d355bd6a=
61017655d8da26b67c"
>  SRC_URI =3D "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=
=3Dmaster;protocol=3Dhttps"
>  SRCREV =3D "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
>
> -
>  inherit meson pkgconfig
>
>  DEPENDS =3D "json-c libdrm"
> diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb b/meta-oe/recipe=
s-graphics/fvwm/fvwm_2.7.0.bb
> index 959463e962..71a5e8fe06 100644
> --- a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
> +++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
> @@ -41,7 +41,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "7baf540e56fb1a3e91752acba872a88543529d46"
>
> -
>  inherit autotools gettext update-alternatives pkgconfig python3native pe=
rlnative features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipe=
s-graphics/glm/glm_0.9.9.8.bb
> index e6fd0edd21..11dcfd3a68 100644
> --- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> +++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> @@ -20,7 +20,6 @@ SRC_URI =3D " \
>  SRCREV =3D "efec5db081e3aad807d0731e172ac597f6a39447"
>  PV .=3D "+0.9.9.9+git"
>
> -
>  inherit cmake
>
>  do_install() {
> diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-o=
e/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> index f26caf6940..776e997b68 100644
> --- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> +++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> @@ -13,7 +13,6 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
>
>  inherit meson pkgconfig features_check
>
> -
>  PACKAGECONFIG ?=3D "\
>    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '=
', d)} \
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/r=
ecipes-graphics/libsdl/libsdl_1.2.15.bb
> index 8122b88a68..df33fe9b7f 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -10,7 +10,6 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd83877a8e3ef82b82798=
ef4"
>
> -
>  SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>             file://libsdl-1.2.15-xdata32.patch \
>             file://pkgconfig.patch \
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
> index ac425f6ad2..b70388bcfb 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
> @@ -9,7 +9,6 @@ DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp"
>  SRC_URI =3D "git://github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x"
>  SRCREV =3D "11154afb7855293159588b245b446a4ef09e574f"
>
> -
>  inherit cmake pkgconfig
>
>  FILES:${PN} +=3D "${datadir}/licenses"
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb=
 b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
> index ff5df428e8..d4305bd024 100644
> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
> @@ -47,7 +47,6 @@ inherit cmake
>  SRC_URI =3D "git://github.com/LibVNC/libvncserver;branch=3Dmaster;protoc=
ol=3Dhttps"
>  SRCREV =3D "10e9eb75f73e973725dc75c373de5d89807af028"
>
> -
>  EXTRA_OECMAKE =3D "-DMAKE_INSTALL_LIBDIR=3D${libdir}"
>
>  do_install:append() {
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
> index ede5c16f3f..2f94837b6a 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
> @@ -24,7 +24,6 @@ require lv-conf.inc
>
>  inherit cmake
>
> -
>  do_configure:prepend() {
>         if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
>                 # Add libsdl build dependency, SDL2_image has no cmake fi=
le
> diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb b/meta-oe/=
recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> index 2b26ec57ae..a3418ffdec 100644
> --- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> +++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/any1/neatvnc;branch=3Dv0.8;=
protocol=3Dhttps"
>
>  SRCREV =3D "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
>
> -
>  DEPENDS =3D "libdrm pixman aml zlib"
>
>  PACKAGECONFIG ??=3D ""
> diff --git a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb b/meta-oe/=
recipes-graphics/nyancat/nyancat_1.5.2.bb
> index c31ad985d9..e28835258e 100644
> --- a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
> +++ b/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
> @@ -5,7 +5,6 @@ SECTION =3D "graphics"
>  LICENSE =3D "NCSA"
>  LIC_FILES_CHKSUM =3D "file://src/nyancat.c;beginline=3D27;endline=3D49;m=
d5=3D285f7ac87da4a631f348800687d845bd"
>
> -
>  SRCREV =3D "5ffb6c5c03d0e9156db8f360599d4f0449bb16b9"
>  SRC_URI =3D " \
>         git://github.com/klange/nyancat;protocol=3Dhttps;branch=3Dmaster =
\
> diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/rec=
ipes-graphics/openbox/obconf_git.bb
> index 917492c982..ee241b0650 100644
> --- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
> +++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D " \
>      file://0001-Fix-function-protype-visibility.patch \
>  "
>
> -
>  inherit autotools gettext pkgconfig mime mime-xdg features_check
>  # depends on openbox, which is X11-only
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> diff --git a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-nativ=
e_git.bb b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_gi=
t.bb
> index d3c96cd66f..9f09b10618 100644
> --- a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.b=
b
> +++ b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.b=
b
> @@ -15,7 +15,6 @@ SRCREV =3D "1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e"
>
>  SRC_URI =3D "git://github.com/notro/panel-mipi-dbi.git;protocol=3Dhttps;=
branch=3Dmain"
>
> -
>  inherit native
>
>  do_configure[noexec] =3D "1"
> diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb b/meta-oe/r=
ecipes-graphics/pango/pangomm_2.46.4.bb
> index 6f228b131e..d16a528778 100644
> --- a/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
> +++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c=
1cb29a1e3fd737b499 \
>
>  DEPENDS =3D "mm-common cairomm glibmm pango"
>
> -
>  inherit gnomebase features_check
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-=
runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp=
-runner_git.bb
> index 88cdce26d1..fa12388a84 100644
> --- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_=
git.bb
> +++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_=
git.bb
> @@ -10,5 +10,4 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/parallel=
-deqp-runner.git;protocol=3Dh
>  PV =3D "2020.06.15+git"
>  SRCREV =3D "e1642fb691d29b1462504b58916f7f514a963e80"
>
> -
>  inherit pkgconfig meson
> diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb b/meta-o=
e/recipes-graphics/qrencode/qrencode_4.1.1.bb
> index c794f41370..a3475deaa4 100644
> --- a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
> +++ b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495=
befef8f17206a5b0a1"
>  SRCREV =3D "715e29fd4cd71b6e452ae0f4e36d917b43122ce8"
>  SRC_URI =3D "git://github.com/fukuchi/libqrencode.git;branch=3Dmaster;pr=
otocol=3Dhttps"
>
> -
>  inherit autotools pkgconfig
>
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-=
graphics/surf/surf_2.1.bb
> index 258c78e509..4065eacc4e 100644
> --- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
> +++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://git.suckless.org/surf;branch=3Dsurf-=
webkit2 \
>             "
>  SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'soup3', 'file://000=
1-config.mk-Fix-compiler-and-linker.patch file://0001-config.ml-make-compat=
ible-with-webkitgtk-2.34.0.patch', '', d)}"
>
> -
>  inherit pkgconfig features_check
>
>  PACKAGECONFIG_SOUP ?=3D "soup3"
> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb b=
/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> index f4923f3f00..e94d4d079c 100644
> --- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> +++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
>  SRCREV =3D "4767ea922bcc460e70b87b1d303ebdfed0897da8"
>  SRC_URI =3D "git://github.com/tesseract-ocr/tessdata.git;branch=3Dmain;p=
rotocol=3Dhttps"
>
> -
>  inherit allarch
>
>  do_install() {
> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb b/meta=
-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
> index 4bc0f5b88f..f51ded61ab 100644
> --- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
> +++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
>  SRCREV =3D "3b7c70e34dea179549ed3e995872e2e019eb8477"
>  SRC_URI =3D "git://github.com/${BPN}-ocr/${BPN}.git;branch=3Dmain;protoc=
ol=3Dhttps"
>
> -
>  DEPENDS =3D "leptonica"
>
>  EXTRA_OECONF +=3D "LIBLEPT_HEADERSDIR=3D${STAGING_INCDIR}/leptonica"
> diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-=
oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
> index dd4f79c314..8b94e0fc6b 100644
> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
> @@ -7,7 +7,6 @@ RDEPENDS:${PN} =3D "coreutils hicolor-icon-theme perl bas=
h xkbcomp"
>
>  LIC_FILES_CHKSUM =3D "file://LICENCE.TXT;md5=3D75b02c2872421380bbd47781d=
2bd75d3"
>
> -
>  inherit autotools cmake features_check pkgconfig systemd
>
>  REQUIRED_DISTRO_FEATURES =3D "x11 pam"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb b=
/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
> index 92717da32f..7e91fb9c2c 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
> @@ -6,7 +6,6 @@ LICENSE =3D "OFL-1.1"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df96db970a9a46c5369142b99f5303=
66b \
>  "
>
> -
>  SRCREV =3D "4b0192046158094654e865245832c66d2104219e"
>  SRC_URI =3D "git://github.com/liberationfonts/liberation-fonts.git;branc=
h=3Dmain;protocol=3Dhttps"
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.b=
b b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> index b5dae22a9d..be1370fb45 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> @@ -11,7 +11,6 @@ SRCREV =3D "aac7ccaa4d1dea4543453b96f7d6fc47066a57ff"
>  PACKAGES =3D "${PN}-color ${PN}-regular"
>  FONT_PACKAGES =3D "${PN}-color ${PN}-regular"
>
> -
>  FILES:${PN}-color =3D "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
>  FILES:${PN}-regular =3D "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf=
"
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.=
83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
> index ff89f7466a..ec0aa0b28d 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
> @@ -9,7 +9,6 @@ SHA1SUM =3D "0cef8205"
>
>  SRC_URI =3D "https://assets.ubuntu.com/v1/${SHA1SUM}-ubuntu-font-family-=
${PV}.zip"
>
> -
>  SRC_URI[sha256sum] =3D "61a2b342526fd552f19fef438bb9211a8212de19ad96e32a=
1209c039f1d68ecf"
>
>  UPSTREAM_CHECK_URI =3D "https://repology.org/project/fonts:ubuntu/packag=
es"
> diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1=
.6.bb b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
> index 5aea738c15..61be451d81 100644
> --- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
> +++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
> @@ -14,7 +14,6 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
>
>  DEPENDS =3D "libev libx11 libxi libxfixes"
>
> -
>  do_install:append() {
>      # LICENSE is installed to /usr/share/licenses but we don't want it i=
n the package
>      rm -rf ${D}${datadir}
> diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb b/meta-oe/rec=
ipes-graphics/vdpau/libvdpau_1.5.bb
> index 3ba561a54e..e2142c5d0a 100644
> --- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
> +++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
> @@ -8,7 +8,6 @@ DEPENDS =3D "virtual/libx11 libxext xorgproto"
>  SRCREV =3D "79f1506a3307d3275b0fdfb2e110c173f68e6f78"
>  SRC_URI =3D "git://anongit.freedesktop.org/vdpau/libvdpau;branch=3Dmaste=
r"
>
> -
>  inherit features_check meson pkgconfig
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> diff --git a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb b/meta-oe/re=
cipes-graphics/vdpau/vdpauinfo_1.5.bb
> index a7db743239..64af8a4b40 100644
> --- a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
> +++ b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
> @@ -15,5 +15,4 @@ RDEPENDS:${PN} =3D "libvdpau"
>  SRCREV =3D "d3c5bd63bf8878d59b22d618d2bb5116db392d28"
>  SRC_URI =3D "git://anongit.freedesktop.org/vdpau/vdpauinfo;branch=3Dmast=
er"
>
> -
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index 1cc2da7a49..821a781f6c 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -12,7 +12,6 @@ SRC_URI:append:toolchain-clang =3D "file://fix-clang-pr=
ivate-operator.patch"
>
>  SRCREV_FORMAT =3D "vk-gl-cts"
>
> -
>  inherit pkgconfig cmake cmake-qemu features_check python3native
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
> diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc b/meta=
-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
> index 042db48acb..edc4696215 100644
> --- a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
> +++ b/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
> @@ -10,4 +10,3 @@ SRC_URI =3D "${XORG_MIRROR}/individual/doc/${BPN}-${PV}=
.tar.${SRC_URI_EXT}"
>
>  inherit autotools pkgconfig
>
> -
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1=
.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
> index 8fd2ae2e84..2f98b589fa 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
> @@ -9,5 +9,4 @@ DEPENDS +=3D "virtual/libx11 libdrm xorgproto"
>  SRCREV =3D "8bbdb2ae3bb8ef649999a8da33ddbe11a04763b8"
>  SRC_URI =3D "git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc=
;branch=3Dmaster"
>
> -
>  RDEPENDS:${PN} +=3D "xserver-xorg-module-exa"
> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb b=
/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
> index 073b3f0912..c79d2d1c5d 100644
> --- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
> @@ -24,7 +24,6 @@ RDEPENDS:${PN} =3D " \
>
>  inherit systemd perlnative pkgconfig gettext autotools-brokensep feature=
s_check
>
> -
>  EXTRA_OECONF +=3D "--with-app-defaults=3D${datadir}/X11/app-defaults --l=
ibdir=3D${STAGING_LIBDIR} \
>                   --includedir=3D${STAGING_INCDIR} --with-pam --with-logi=
n-manager"
>
> diff --git a/meta-oe/recipes-graphics/yad/yad_6.0.bb b/meta-oe/recipes-gr=
aphics/yad/yad_6.0.bb
> index 64c12f5904..be0921e35f 100644
> --- a/meta-oe/recipes-graphics/yad/yad_6.0.bb
> +++ b/meta-oe/recipes-graphics/yad/yad_6.0.bb
> @@ -13,5 +13,4 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
>
>  DEPENDS =3D "gtk+3 glib-2.0-native intltool-native"
>
> -
>  FILES:${PN} +=3D "${datadir}/icons/"
> diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/re=
cipes-graphics/ydotool/ydotool_git.bb
> index 7562271d90..111b286093 100644
> --- a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> +++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> @@ -8,7 +8,6 @@ PV =3D "1.0.4+git"
>  SRC_URI =3D "git://github.com/ReimuNotMoe/ydotool;protocol=3Dhttps;branc=
h=3Dmaster"
>  SRCREV =3D "0c295346d55afcc6aebaaee564333b3e1efabcbd"
>
> -
>  inherit cmake systemd
>
>  EXTRA_OECMAKE =3D "\
> diff --git a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb b/met=
a-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
> index 3bbfe4cf9f..814f681268 100644
> --- a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
> +++ b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/=
kgdb/agent-proxy.git;protoc
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> -
>  do_install () {
>      install -d ${D}${bindir}
>      install -m 0755 agent-proxy ${D}${bindir}
> diff --git a/meta-oe/recipes-kernel/blktests/blktests.bb b/meta-oe/recipe=
s-kernel/blktests/blktests.bb
> index ded03a4de2..ab69812301 100644
> --- a/meta-oe/recipes-kernel/blktests/blktests.bb
> +++ b/meta-oe/recipes-kernel/blktests/blktests.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D " \
>         git://github.com/osandov/blktests.git;nobranch=3D1;protocol=3Dhtt=
ps \
>         "
>
> -
>  inherit autotools-brokensep
>
>  do_configure[noexec] =3D "1"
> diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firm=
ware_12.0.1.1105_p3.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadc=
om-bt-firmware_12.0.1.1105_p3.bb
> index fe980e3e6f..fe09c22268 100644
> --- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12=
.0.1.1105_p3.bb
> +++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12=
.0.1.1105_p3.bb
> @@ -14,7 +14,6 @@ SRCREV =3D "a0eb4805dbb232f02f156b9351a23790c1a4cec7"
>
>  PE =3D "1"
>
> -
>  inherit allarch
>
>  CLEANBROKEN =3D "1"
> diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb b=
/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
> index bafe56d2c4..458c600c59 100644
> --- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
> +++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
> @@ -6,7 +6,6 @@ BPN =3D "crash"
>
>  require crash.inc
>
> -
>  DEPENDS =3D "\
>      nativesdk-ncurses \
>      nativesdk-expat \
> diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-ker=
nel/crash/crash.inc
> index 3c9a99ae4a..90dbd8d30d 100644
> --- a/meta-oe/recipes-kernel/crash/crash.inc
> +++ b/meta-oe/recipes-kernel/crash/crash.inc
> @@ -44,7 +44,6 @@ COMPATIBLE_HOST:riscv32 =3D "null"
>  COMPATIBLE_HOST:mipsarchn64 =3D "null"
>  COMPATIBLE_HOST:mipsarchn32 =3D "null"
>
> -
>  EXTRA_OEMAKE =3D 'RPMPKG=3D"${PV}" \
>                  GDB_TARGET=3D"${TARGET_SYS}" \
>                  GDB_HOST=3D"${BUILD_SYS}" \
> diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb b/meta-oe/recipe=
s-kernel/crash/crash_8.0.6.bb
> index 1af90978e0..9a49e459bc 100644
> --- a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
> +++ b/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
> @@ -1,6 +1,5 @@
>  require crash.inc
>
> -
>  BBCLASSEXTEND =3D "native cross"
>
>  EXTRA_OEMAKE:class-cross =3D 'RPMPKG=3D"${PV}" \
> diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb b/meta-oe=
/recipes-kernel/drgn/python3-drgn_0.0.31.bb
> index b1ff8d4019..bd04a21ccb 100644
> --- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
> +++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c83d30e99508d=
6b790eacdd3abab846"
>  SRC_URI =3D "git://github.com/osandov/drgn.git;protocol=3Dhttps;branch=
=3Dmain;tag=3Dv${PV}"
>  SRCREV =3D "8209a147fb61deed38ca376d063bbff0343ca234"
>
> -
>  DEPENDS =3D "\
>      autoconf-native \
>      automake-native \
> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe=
/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> index b5b8075fd7..8fc82a3e31 100644
> --- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
> @@ -35,7 +35,6 @@ IANA_ENTERPRISE_NUMBERS ?=3D ""
>  #IANA_ENTERPRISE_NUMBERS =3D "http://www.iana.org/assignments/enterprise=
-numbers.txt;name=3Diana-enterprise-numbers;downloadfilename=3Diana-enterpr=
ise-numbers"
>  #SRC_URI[iana-enterprise-numbers.sha256sum] =3D "cdd97fc08325667434b805e=
b589104ae63f7a9eb720ecea73cb55110b383934c"
>
> -
>  inherit autotools pkgconfig
>
>  do_install:append() {
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-k=
ernel/kpatch/kpatch.inc
> index b8ef092262..ee75ad5ff0 100644
> --- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
> @@ -22,7 +22,6 @@ EXTRA_OEMAKE =3D " \
>         CC=3D'${CC}' \
>         "
>
> -
>  do_install () {
>         oe_runmake install
>  }
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipe=
s-kernel/kpatch/kpatch_git.bb
> index 6521830b7a..49b858c597 100644
> --- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> @@ -6,5 +6,4 @@ SRCREV =3D "0c3c21930895f6582a5c9d9d797f7e11ff41ffb2"
>
>  PV =3D "0.9.1"
>
> -
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb b/meta=
-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
> index 1a90dcf998..65df447b06 100644
> --- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
> +++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D " \
>         file://0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.=
patch \
>         "
>
> -
>  inherit autotools-brokensep pkgconfig systemd
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)}"
> diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.b=
b b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
> index 4073381899..19d4cbc9b7 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D "git://github.com/diamon/minicoredumper;pro=
tocol=3Dhttps;branch=3Dmaster \
>             file://0001-corestripper-Fix-uninitialized-warning.patch \
>             "
>
> -
>  SYSTEMD_SERVICE:${PN} =3D "minicoredumper.service"
>  SYSTEMD_AUTO_ENABLE =3D "enable"
>
> diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-o=
e/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
> index 6782dec228..7ba7558ec9 100644
> --- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
> +++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/rostedt/trace-cmd.git;b
>             file://0001-Do-not-emit-useless-rpath.patch"
>  SRCREV =3D "18233e4c32857cb7ddd4960beeec8360ed834fc5"
>
> -
>  DEPENDS +=3D "libtraceevent libtracefs zstd xmlto-native asciidoc-native=
 swig-native bison-native flex-native"
>
>  inherit pkgconfig bash-completion
> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat.bb b/meta-oe/reci=
pes-kernel/turbostat/turbostat.bb
> index f65699865e..6447c35417 100644
> --- a/meta-oe/recipes-kernel/turbostat/turbostat.bb
> +++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
> @@ -33,7 +33,6 @@ DEPENDS =3D "libcap"
>  #
>  do_populate_lic[depends] =3D "${PN}:do_configure"
>
> -
>  EXTRA_OEMAKE =3D '\
>                  CC=3D"${CC}" 'CFLAGS=3D-Wall ${LDFLAGS}'  \
>                 '
> @@ -63,7 +62,6 @@ do_configure:prepend() {
>         cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
>  }
>
> -
>  do_compile() {
>         sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
>         sed -i 's#<linux/compiler.h>#"compiler.h"#' build_bug.h
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb b/meta-oe/r=
ecipes-multimedia/faad2/faad2_2.11.2.bb
> index 83fcaa248d..3c5b0822fc 100644
> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
> @@ -12,5 +12,4 @@ PV .=3D "+git"
>  SRC_URI =3D "git://github.com/knik0/faad2.git;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "673a22a3c7c33e96e2ff7aae7c4d2bc190dfbf92"
>
> -
>  inherit cmake
> diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/=
recipes-multimedia/id3lib/id3lib_3.8.3.bb
> index 7ae262345b..f15a464881 100644
> --- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
> +++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
> @@ -4,7 +4,6 @@ LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7"
>  DEPENDS =3D "zlib"
>
> -
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=3Darc=
hive \
>             ${DEBIAN_MIRROR}/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-16.2.de=
bian.tar.xz;name=3Dpatch;subdir=3D${BP} \
>             file://acdefine.patch \
> diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb b/meta-oe/reci=
pes-multimedia/jack/a2jmidid_9.bb
> index 7f8988c3c3..a9bc1a47f8 100644
> --- a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
> +++ b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D " \
>      file://ppc_musl_ucontext.patch \
>  "
>
> -
>  inherit meson pkgconfig
>
>  EXTRA_OEMESON =3D "-Db_lto=3Dfalse"
> diff --git a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb b/me=
ta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
> index 58bbd8cac3..cba3d28985 100644
> --- a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
> @@ -9,7 +9,6 @@ DEPENDS =3D "jack"
>  SRC_URI =3D "git://github.com/jackaudio/jack-example-tools.git;branch=3D=
main;protocol=3Dhttps"
>  SRCREV =3D "33de8b4285fa5054af1b37fe0496c110604ed564"
>
> -
>  inherit meson pkgconfig
>
>  PACKAGECONFIG ??=3D "alsa_in_out jack_rec"
> diff --git a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb b/meta-oe/rec=
ipes-multimedia/jack/jack_1.9.22.bb
> index 3b3ea85349..91484e1ddd 100644
> --- a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
> @@ -24,7 +24,6 @@ SRCREV =3D "4f58969432339a250ce87fe855fb962c67d00ddb"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
> -
>  inherit waf pkgconfig
>
>  PACKAGECONFIG ??=3D "alsa"
> diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb b/m=
eta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
> index 68a29dde91..80b0a0b6e1 100644
> --- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "3188549fba13bbdf3a5a98de2a38c2e71f04e21e"
>
>  inherit meson pkgconfig
>
> -
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan openg=
l', d)} lcms"
>
>  PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader shaderc spirv-shader-generator"
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> index 0a3b5d28b6..fbc2b9aee6 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> @@ -33,7 +33,6 @@ SRC_URI =3D "\
>
>  SRCREV =3D "fc15e229d9d337e46d730f00647821adbbd58548"
>
> -
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v4l-utils-(?P<pver>\d+(\.\d+)+)"
>
>  EXTRA_OEMESON =3D "-Dudevdir=3D${base_libdir}/udev -Dv4l2-compliance-32=
=3Dfalse -Dv4l2-ctl-32=3Dfalse"
> diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb b/meta-o=
e/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> index 651fbc4192..232b4171d2 100644
> --- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> +++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/dbry/WavPack.git;branch=
=3Dmaster;protocol=3Dhttps \
>
>  SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
>
> -
>  inherit cmake pkgconfig lib_package
>
>  EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON"
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb b/meta-oe/r=
ecipes-multimedia/webm/libvpx_1.15.2.bb
> index a7cd76e0c7..e38525d47b 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
> @@ -12,7 +12,6 @@ SRC_URI +=3D "git://chromium.googlesource.com/webm/libv=
px;protocol=3Dhttps;branch=3Dma
>             file://libvpx-configure-support-blank-prefix.patch \
>             "
>
> -
>  # ffmpeg links with this and fails
>  # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.te=
xt+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GL=
IBC_2.4'
>  ARM_INSTRUCTION_SET =3D "arm"
> diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb b/meta-o=
e/recipes-navigation/geoclue/geoclue_2.7.2.bb
> index 48b2535a03..79646d8a9f 100644
> --- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
> +++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D "git://gitlab.freedesktop.org/geoclue/geocl=
ue.git;protocol=3Dhttps;branc
>      file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.pat=
ch \
>  "
>
> -
>  # Without this line, package is declared a library and named libgeoclue*
>  AUTO_LIBNAME_PKGS =3D ""
>
> diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b=
/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> index bd15b0bda8..8e1dc41f7f 100644
> --- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> +++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
> @@ -24,7 +24,6 @@ SRC_URI =3D " \
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/cyrusimap/cyrus-sasl/archives=
"
>
> -
>  inherit autotools pkgconfig useradd systemd
>
>  EXTRA_OECONF +=3D "--with-dblib=3Dberkeley \
> diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb b/meta-oe/recip=
es-printing/qpdf/qpdf_12.2.0.bb
> index 8ed993aa78..2387c6d919 100644
> --- a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
> +++ b/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
> @@ -20,7 +20,6 @@ EXTRA_OECMAKE =3D ' \
>  LDFLAGS:append:mipsarch =3D " -latomic"
>  LDFLAGS:append:riscv32 =3D " -latomic"
>
> -
>  PACKAGECONFIG ?=3D "gnutls"
>  PACKAGECONFIG[gnutls] =3D "-DREQUIRE_CRYPTO_GNUTLS=3DON,-DREQUIRE_CRYPTO=
_OPENSSL=3DON"
>
> diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-har=
dening-checker_0.6.10.bb b/meta-oe/recipes-security/kernel-hardening-checke=
r/kernel-hardening-checker_0.6.10.bb
> index e7610ac785..fa52dcfa67 100644
> --- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.10.bb
> +++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.10.bb
> @@ -15,7 +15,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd32239bc=
b673463ab874e80d47fae504"
>  SRC_URI =3D "git://github.com/a13xp0p0v/kernel-hardening-checker;protoco=
l=3Dhttps;branch=3Dmaster"
>  SRCREV =3D "f4dbe258ff3d37489962ea9cf210192ae7ff9280"
>
> -
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>  RDEPENDS:${PN} =3D "\
> diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb b/meta-o=
e/recipes-security/keyutils/keyutils_1.6.3.bb
> index 86f45656f6..55f54b1b14 100644
> --- a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
> +++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
> @@ -26,7 +26,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/dhowells/keyutils.git;p
>             "
>  SRCREV =3D "cb3bb194cca88211cbfcdde2f10c0f43c3fb8ec3"
>
> -
>  PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG[manpages] =3D ""
>
> @@ -53,7 +52,6 @@ do_install_ptest () {
>      sed -i -e 's/OSDIST=3DUnknown/OSDIST=3D${DISTRO}/' ${D}${PTEST_PATH}=
/tests/prepare.inc.sh
>  }
>
> -
>  RDEPENDS:${PN}-ptest +=3D "bash file lsb-release make"
>  RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-utils"
>  RDEPENDS:${PN}-ptest:append:libc-musl =3D " musl-utils"
> diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-me=
ltdown-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/=
spectre-meltdown-checker_0.46.bb
> index 48f9a738bb..3b2580fe94 100644
> --- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-=
checker_0.46.bb
> +++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-=
checker_0.46.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.s=
h;beginline=3D2;endline=3D2;md5
>  SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=
=3Dhttps;branch=3Dmaster"
>  SRCREV =3D "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
>
> -
>  # binutils: readelf,objdump might be used for deeper analysis
>  # coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cases
>  # kernel-dev: /boot/config is used
> diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb b/meta-oe/recipe=
s-shells/tcsh/tcsh_6.24.12.bb
> index 058fe6a7c4..6991a64a17 100644
> --- a/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
> +++ b/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
> @@ -37,7 +37,6 @@ do_install:append () {
>
>  FILES:${PN} +=3D "${datadir}/emacs/site-lisp/csh-mode.el"
>
> -
>  pkg_postinst:${PN} () {
>  #!/bin/sh -e
>  echo /usr/bin/tcsh >> $D/etc/shells
> diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_gi=
t.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> index 85443984a2..45accf0b62 100644
> --- a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> +++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> @@ -11,7 +11,6 @@ SRCREV =3D "812e2c56aed246931a667f16c28b096e34597016"
>
>  FILES:${PN} =3D "${datadir}/ace-builds"
>
> -
>  DEPENDS +=3D "rsync-native"
>
>  do_install () {
> diff --git a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb b/meta-oe/recipes=
-support/bcu/bcu_1.1.115.bb
> index 260fba02a9..f47d818764 100644
> --- a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
> +++ b/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/nxp-imx/bcu;protocol=3Dht=
tps;branch=3Dmaster \
>             "
>  SRCREV =3D "f081c69c26e330cf03ec790051c415c4716509d9"
>
> -
>  DEPENDS =3D "curl libyaml libusb1 openssl libftdi"
>
>  inherit cmake pkgconfig
> diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb b/meta-oe/recip=
es-support/bdwgc/bdwgc_8.2.8.bb
> index 3c8c41cc03..232b0988be 100644
> --- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
> +++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
> @@ -26,7 +26,6 @@ DEPENDS =3D "libatomic-ops"
>  SRCREV =3D "ee59af3722e56de8404de6cd0c21c2493cc4d855"
>  SRC_URI =3D "git://github.com/ivmai/bdwgc.git;branch=3Drelease-8_2;proto=
col=3Dhttps"
>
> -
>  inherit autotools pkgconfig
>
>  EXTRA_OECONF +=3D "--enable-cplusplus"
> diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb b/meta=
-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
> index 0a2514237a..21b555526f 100644
> --- a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
> +++ b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
> @@ -11,7 +11,6 @@ DEPENDS +=3D "boost qemu-native"
>  SRC_URI =3D "git://github.com/boost-ext/sml.git;protocol=3Dhttps;branch=
=3Dmaster"
>  SRCREV =3D "cd3ef80206b71463de96d6b682cfdc99703ec147"
>
> -
>  inherit cmake
>
>  # Building benchmarks takes a lot of time and requires additional header=
s (euml2.hpp)
> diff --git a/meta-oe/recipes-support/btop/btop_1.4.3.bb b/meta-oe/recipes=
-support/btop/btop_1.4.3.bb
> index 9a5a21c56d..e01a034aed 100644
> --- a/meta-oe/recipes-support/btop/btop_1.4.3.bb
> +++ b/meta-oe/recipes-support/btop/btop_1.4.3.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/aristocratos/btop.git;proto=
col=3Dhttps;branch=3Dmain;tag
>             "
>  SRCREV =3D "3f1ccd9f6c455fef6d4d8cfbc8ed71b86961323d"
>
> -
>  inherit cmake
>
>  FILES:${PN} +=3D " \
> diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb b/m=
eta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
> index 058ede614e..38f0587ceb 100644
> --- a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
> +++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88456d0a60d=
e4c71ff4d787c212f253"
>  SRC_URI =3D "git://github.com/vsergeev/c-periphery;protocol=3Dhttps;bran=
ch=3Dmaster"
>  SRCREV =3D "911e989fe41eb90c7df274cb54555346caf2a632"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON"
> diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb b=
/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
> index 63500def05..0224bde784 100644
> --- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
> +++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
> @@ -8,7 +8,6 @@ DEPENDS =3D "libeigen glog"
>  SRC_URI =3D "git://github.com/ceres-solver/ceres-solver.git;branch=3Dmas=
ter;protocol=3Dhttps"
>  SRCREV =3D "85331393dc0dff09f6fb9903ab0c4bfa3e134b01"
>
> -
>  inherit cmake
>
>  do_configure:prepend() {
> diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb b/meta-=
oe/recipes-support/composefs/composefs_1.0.8.bb
> index f2bae91f44..f66fb75979 100644
> --- a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
> +++ b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
> @@ -16,7 +16,6 @@ LIC_FILES_CHKSUM =3D "\
>  SRCREV =3D "858ce1b38e1534c2602eb431124b5dca706bc746"
>  SRC_URI =3D "git://github.com/containers/composefs.git;protocol=3Dhttps;=
branch=3Dmain"
>
> -
>  inherit meson
>
>  DEPENDS =3D "openssl"
> diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb b/m=
eta-oe/recipes-support/consolation/consolation_0.0.9.bb
> index a1523be376..f137584033 100644
> --- a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
> +++ b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
> @@ -17,7 +17,6 @@ DEPENDS =3D " \
>  SRC_URI =3D "git://salsa.debian.org/consolation-team/consolation.git;bra=
nch=3Dmaster"
>  SRCREV =3D "5ef08f0cd6ede62de14de477b74fc3611108c676"
>
> -
>  inherit autotools pkgconfig systemd
>
>  do_install:append() {
> diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-=
oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> index 4b8bf162fa..0ee70b0161 100644
> --- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> +++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "\
>      file://a53f123040998744602f190944464af0e159ea19.patch \
>  "
>
> -
>  inherit cmake pkgconfig
>
>  DEPENDS =3D "zlib boost openssl"
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb b/meta-oe=
/recipes-support/cpprest/cpprest_2.10.19.bb
> index ec7be4ad37..5b3ae39b2d 100644
> --- a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/Microsoft/cpprestsdk.git;=
protocol=3Dhttps;branch=3Dmaste
>  # tag 2.10.19
>  SRCREV =3D "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
>
> -
>  inherit cmake pkgconfig
>
>  SKIP_RECIPE[cpprest] ?=3D "Needs websocketpp which does not yet work wit=
h boost >=3D 1.87"
> diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/r=
ecipes-support/cpulimit/cpulimit_0.2.bb
> index 676028efa1..b42702488a 100644
> --- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> +++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/opsengine/cpulimit.git;pr=
otocol=3Dhttps;branch=3Dmaster
>             file://0002-busy.c-Fix-incompatible-pointer-type-error.patch =
\
>             "
>
> -
>  do_compile() {
>      oe_runmake all
>  }
> diff --git a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb b/me=
ta-oe/recipes-support/crucible/crucible_2023.11.02.bb
> index 132395e023..97d63bd893 100644
> --- a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
> +++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
> @@ -9,7 +9,6 @@ require ${BPN}-go-mods.inc
>
>  SRCREV =3D "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
>
> -
>  GO_IMPORT =3D "github.com/usbarmory/crucible"
>  GO_INSTALL =3D "\
>      ${GO_IMPORT}/cmd/crucible \
> diff --git a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb b/meta-oe/recipes=
-support/ctre/ctre_3.9.0.bb
> index 901763f0ad..4914b15a4d 100644
> --- a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
> +++ b/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2e982d844baa4d=
f1c80de75470e0c5cb"
>  SRC_URI =3D "git://github.com/hanickadot/compile-time-regular-expression=
s.git;protocol=3Dhttps;branch=3Dmain"
>  SRCREV =3D "eb9577aae3515d14e6c5564f9aeb046d2e7c1124"
>
> -
>  inherit cmake
>
>  PACKAGECONFIG ??=3D ""
> diff --git a/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb b/meta-oe/r=
ecipes-support/cxxopts/cxxopts_3.3.1.bb
> index 7b0cc05979..9c53c11609 100644
> --- a/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
> +++ b/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8de00431559a76=
a1b43f6fd44f8f6689"
>  SRC_URI =3D "git://github.com/jarro2783/cxxopts.git;protocol=3Dhttps;bra=
nch=3Dmaster"
>  SRCREV =3D "44380e5a44706ab7347f400698c703eb2a196202"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE:append =3D " \
> diff --git a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb b/meta-oe/recip=
es-support/cyaml/cyaml_1.4.1.bb
> index 5f33c27c52..f98d77eab0 100644
> --- a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
> +++ b/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
> @@ -11,7 +11,6 @@ SRCREV =3D "07ff8654a270ec9b410acd3152b60de9e9f941af"
>
>  SRC_URI =3D "git://github.com/tlsa/libcyaml.git;protocol=3Dhttps;branch=
=3Dmain"
>
> -
>  inherit pkgconfig
>
>  EXTRA_OEMAKE =3D "'PREFIX=3D""' 'DESTDIR=3D${D}' 'CFLAGS=3D${CFLAGS}' 'L=
IBDIR=3D${libdir}' 'INCLUDEDIR=3D${includedir}' 'VARIANT=3Drelease'"
> diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe=
/recipes-support/daemonize/daemonize_git.bb
> index bae04ca7a3..4f0ea059ac 100644
> --- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
> +++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
> @@ -12,5 +12,4 @@ SRC_URI =3D " \
>      file://0001-fix-getopt.c-too-many-arguments-to-function-write-er.pat=
ch \
>  "
>
> -
>  EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
> diff --git a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb b/meta=
-oe/recipes-support/dc/double-conversion_3.3.1.bb
> index 31330faa17..6aa59085b3 100644
> --- a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
> +++ b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
> @@ -5,8 +5,6 @@ HOMEPAGE =3D "https://github.com/google/double-conversion=
.git"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ea35644f0ec0d9767897115667e9=
01f"
>
> -
> -
>  SRC_URI =3D " \
>          git://github.com/google/double-conversion.git;protocol=3Dhttps;b=
ranch=3Dmaster \
>          file://run-ptest \
> diff --git a/meta-oe/recipes-support/devmem2/devmem2_2.0.bb b/meta-oe/rec=
ipes-support/devmem2/devmem2_2.0.bb
> index e601755af4..3b4bdadcd7 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
> @@ -8,7 +8,6 @@ SRCREV =3D "5b395a946894eb4f4ef5d07c80a50a88573a541e"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  CFLAGS +=3D "-DFORCE_STRICT_ALIGNMENT"
>
>  do_compile() {
> diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb b/meta-oe=
/recipes-support/digitemp/digitemp_3.7.2.bb
> index baddf42e6b..0097284e93 100644
> --- a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
> +++ b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "a162e63aad35358aab325388f3d5e88121606419"
>
> -
>  EXTRA_OEMAKE =3D "ds9097 ds9097u \
>                  SYSTYPE=3D'Linux' \
>  "
> diff --git a/meta-oe/recipes-support/dool/dool_1.3.4.bb b/meta-oe/recipes=
-support/dool/dool_1.3.4.bb
> index d18f5c8b01..46a6ccbc23 100644
> --- a/meta-oe/recipes-support/dool/dool_1.3.4.bb
> +++ b/meta-oe/recipes-support/dool/dool_1.3.4.bb
> @@ -14,9 +14,7 @@ SRC_URI =3D "git://github.com/scottchiefbaker/dool.git;=
branch=3Dmaster;protocol=3Dhttp
>
>  SRCREV =3D "5068abef0a960c173a91e84a45e7fea1b0a802c0"
>
> -
>  do_install() {
>      oe_runmake 'DESTDIR=3D${D}' install
>  }
>
> -
> diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb b/meta-=
oe/recipes-support/driverctl/driverctl_0.115.bb
> index 578a2b8d3b..cd9d3d23ae 100644
> --- a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
> +++ b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
> @@ -10,7 +10,6 @@ RDEPENDS:${PN} +=3D "bash bash-completion"
>  SRC_URI =3D "git://gitlab.com/driverctl/driverctl.git;branch=3Dmaster;pr=
otocol=3Dhttps"
>  SRCREV =3D "2ba60536eb20ca0a6a751bd8b6501dba84ec45d3"
>
> -
>  inherit pkgconfig systemd features_check
>
>  do_install () {
> diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/met=
a-oe/recipes-support/edid-decode/edid-decode_git.bb
> index fc8681ca44..f29b603290 100644
> --- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> +++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> @@ -13,7 +13,6 @@ PV =3D "0.0+git"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  do_install() {
>      oe_runmake 'DESTDIR=3D${D}' install
>  }
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recip=
es-support/eject/eject_2.1.5.bb
> index aa0e86db12..9897208de0 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -17,7 +17,6 @@ SRC_URI[sha256sum] =3D "ef9f7906484cfde4ba223b2682a3705=
8f9a3c7d3bb1adda7a34a67402e
>
>  S =3D "${UNPACKDIR}/${BPN}"
>
> -
>  do_compile:prepend() {
>      # PO subdir must be in build directory
>      if [ ! ${S} =3D ${B} ]; then
> diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipe=
s-support/emacs/emacs_29.1.bb
> index 5cbe4551c0..d95b37a8e4 100644
> --- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
> +++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
> @@ -29,13 +29,11 @@ EXTRA_OECONF =3D " --with-x=3Dno --with-dumping=3Dnon=
e --disable-build-details"
>  # Disable seccomp, as its a default dependency for gnutls but it doesnt =
work when cross-compiling emacs
>  EXTRA_OECONF:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'gnutls'=
, 'ac_cv_have_decl_SECCOMP_FILTER_FLAG_TSYNC=3Dno ac_cv_have_decl_SECCOMP_S=
ET_MODE_FILTER=3Dno', '', d)}"
>
> -
>  DEPENDS =3D "ncurses"
>  DEPENDS:append:class-target =3D " emacs-native"
>
>  inherit autotools mime-xdg pkgconfig
>
> -
>  # Create the required native tools for the target build
>  do_compile:class-native (){
>      cd ${B}/lib-src
> @@ -58,7 +56,6 @@ do_compile:prepend:class-target () {
>      export EMACSDATA=3D${S}/etc
>  }
>
> -
>  do_install:prepend:class-target(){
>      # export EMACS env variables for the native tools to use to allow ca=
lling bootstrap-emacs
>      export EMACSLOADPATH=3D${S}/lisp
> @@ -94,7 +91,6 @@ RPROVIDES:${PN}-base =3D "${PN}"
>  RDEPENDS:${PN}-base:class-target =3D "${PN}-minimal"
>  RDEPENDS:${PN}-full:class-target =3D "${PN}"
>
> -
>  # A minimal version of emacs that works
>  # These are kept sorted in alphabetical order
>  FILES:${PN}-minimal =3D " \
> @@ -304,7 +300,6 @@ FILES:${PN}-base =3D " \
>  FILES:${PN}-full =3D "${FILES:${PN}}"
>  FILES:${PN}-full:append =3D " ${datadir}/icons"
>
> -
>  # The following does NOT build a native emacs.
>  # It only builds some parts of it that are
>  # required to by the build for target emacs.
> diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/r=
ecipes-support/espeak/espeak_1.48.04.bb
> index c80bf12ade..9ce413b1d8 100644
> --- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
> +++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
> @@ -15,7 +15,6 @@ S =3D "${UNPACKDIR}/espeak-${PV}-source"
>  DEPENDS =3D "portaudio-v19 qemu-helper-native"
>  inherit siteinfo qemu
>
> -
>  CXXFLAGS +=3D "-DUSE_PORTAUDIO"
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
> diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes=
-support/fbset/fbset_2.1.bb
> index e6f357fd4f..d1ee267c3e 100644
> --- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
> +++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
> @@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://fbset.c;endline=3D19;md5=
=3Dbf326f82cdfcac391af208f019c560
>  RRECOMMENDS:${PN} =3D "fbset-modes"
>  DEPENDS =3D "bison-native flex-native"
>
> -
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/f/fbset/fbset_2.1.orig.tar.gz \
>             file://makefile.patch \
>             file://fbset-2.1-fix-makefile-dep.patch \
> diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/=
recipes-support/freerdp/freerdp3_3.5.1.bb
> index 284f61c137..823bc1c087 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
> @@ -10,7 +10,6 @@ inherit pkgconfig cmake
>  SRCREV =3D "eda5c99686e15327f2f37b9cadf307e852b96adf"
>  SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protoc=
ol=3Dhttps"
>
> -
>  CVE_PRODUCT =3D "freerdp"
>
>  PACKAGECONFIG ??=3D " \
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/=
recipes-support/freerdp/freerdp_2.11.7.bb
> index 18af3229d7..5fcbb36aa0 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> @@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branc=
h=3Dstable-2.0;protocol=3Dhttps
>             file://CVE-2024-32661.patch \
>             "
>
> -
>  EXTRA_OECMAKE +=3D " \
>      -DWITH_FFMPEG=3DOFF \
>      -DWITH_CUNIT=3DOFF \
> diff --git a/meta-oe/recipes-support/function2/function2_4.2.4.bb b/meta-=
oe/recipes-support/function2/function2_4.2.4.bb
> index 588e44deaa..45596263fc 100644
> --- a/meta-oe/recipes-support/function2/function2_4.2.4.bb
> +++ b/meta-oe/recipes-support/function2/function2_4.2.4.bb
> @@ -8,7 +8,6 @@ PV .=3D "+git"
>
>  SRC_URI +=3D "gitsm://github.com/Naios/function2;branch=3Dmaster;protoco=
l=3Dhttps"
>
> -
>  inherit cmake
>  inherit ptest
>
> diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-sup=
port/gd/gd_2.3.3.bb
> index ea5c487c52..e8bf89b2b0 100644
> --- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/libgd/libgd.git;nobranch=
=3D1;protocol=3Dhttps \
>
>  SRCREV =3D "b5319a41286107b53daa0e08e402aa1819764bdc"
>
> -
>  inherit autotools binconfig gettext pkgconfig
>
>  EXTRA_OECONF +=3D " --disable-rpath \
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb b/meta-oe/rec=
ipes-support/gflags/gflags_2.2.2.bb
> index 8ea158eab3..8b8869003d 100644
> --- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> +++ b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dc80d1a3b62=
3f72bb85a4c75b556551df"
>  SRC_URI =3D "git://github.com/gflags/gflags.git;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DREGISTER_INSTALL_PREFIX=3D=
OFF -DLIB_INSTALL_DIR=3D${baselib}"
> diff --git a/meta-oe/recipes-support/glog/glog_0.7.1.bb b/meta-oe/recipes=
-support/glog/glog_0.7.1.bb
> index 570d9a7e5f..6c9cc4a1b7 100644
> --- a/meta-oe/recipes-support/glog/glog_0.7.1.bb
> +++ b/meta-oe/recipes-support/glog/glog_0.7.1.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "7b134a5c82c0c0b5698bb6bf7a835b230c5638e4"
>
> -
>  inherit cmake
>
>  PACKAGECONFIG ?=3D "shared unwind 64bit-atomics"
> diff --git a/meta-oe/recipes-support/gnulib/gnulib_202401.bb b/meta-oe/re=
cipes-support/gnulib/gnulib_202401.bb
> index f3fbb94ae8..97aab865bf 100644
> --- a/meta-oe/recipes-support/gnulib/gnulib_202401.bb
> +++ b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
> @@ -16,7 +16,6 @@ SRCREV =3D "c99c8d491850dc3a6e0b8604a2729d8bc5c0eff1"
>  SRC_URI =3D "git://git.savannah.gnu.org/git/gnulib.git;branch=3Dstable-$=
{PV};protocol=3Dhttps \
>  "
>
> -
>  do_install () {
>      install -d ${D}/${datadir}/gnulib
>      cp --no-preserve=3Downership --recursive ${S}/* ${D}/${datadir}/gnul=
ib/
> diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.=
4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
> index 4558aa13d6..f41f3091c4 100644
> --- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
> +++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
>  SRC_URI =3D "git://github.com/google/benchmark.git;protocol=3Dhttps;bran=
ch=3Dmain;tag=3Dv${PV}"
>  SRCREV =3D "eddb0241389718a23a42db6af5f0164b6e0139af"
>
> -
>  EXTRA_OECMAKE =3D " \
>      -DBUILD_SHARED_LIBS=3Dyes \
>      -DBENCHMARK_ENABLE_TESTING=3Dno \
> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb b/meta=
-oe/recipes-support/gperftools/gperftools_2.16.bb
> index c0fe586f6d..ff6d1737c1 100644
> --- a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
> @@ -21,7 +21,6 @@ SRC_URI:append:libc-musl =3D " \
>
>  inherit autotools
>
> -
>  # On mips, we have the following error.
>  #   do_page_fault(): sending SIGSEGV to ls for invalid read access from =
00000008
>  #   Segmentation fault (core dumped)
> diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-sup=
port/gpm/gpm_git.bb
> index 155e56bdef..b0bcf742ae 100644
> --- a/meta-oe/recipes-support/gpm/gpm_git.bb
> +++ b/meta-oe/recipes-support/gpm/gpm_git.bb
> @@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/telmich/gpm;protocol=3Dht=
tps;branch=3Dmaster \
>             file://0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_=
Wge.patch \
>             "
>
> -
>  inherit autotools-brokensep update-rc.d systemd texinfo
>
>  INITSCRIPT_NAME =3D "gpm"
> diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta=
-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
> index 5930a8c95c..96fc40351d 100644
> --- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
> +++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
> @@ -2,7 +2,6 @@ SUMMARY =3D "Hard disk temperature monitor daemon"
>  SECTION =3D "console/network"
>  LICENSE =3D "GPL-2.0-or-later"
>
> -
>  SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz=
2 \
>             file://hddtemp-no-nls-support.patch \
>             file://hddtemp_0.3-beta15-52.diff \
> diff --git a/meta-oe/recipes-support/htop/htop_3.3.0.bb b/meta-oe/recipes=
-support/htop/htop_3.3.0.bb
> index efb89bf3ae..0d8d515aff 100644
> --- a/meta-oe/recipes-support/htop/htop_3.3.0.bb
> +++ b/meta-oe/recipes-support/htop/htop_3.3.0.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/htop-dev/htop.git;branch=
=3Dmain;protocol=3Dhttps \
>  "
>  SRCREV =3D "68c970c7ef4a0682760ed570b3d82388ae7ccf54"
>
> -
>  inherit autotools pkgconfig
>
>  PACKAGECONFIG ??=3D " \
> diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/=
meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> index 7f6fba995c..bc97573b9c 100644
> --- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> +++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> @@ -140,7 +140,6 @@ SRC_URI =3D "git://github.com/wooorm/dictionaries.git=
;branch=3Dmain;protocol=3Dhttps"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  do_install() {
>      for LANGUAGE in `ls -d1 ${S}/dictionaries/*` ; do
>          LANGUAGE_DIR=3D`basename $LANGUAGE | sed 's:-:_:'`
> diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb b/meta-oe=
/recipes-support/hunspell/hunspell_1.7.2.bb
> index 67a51f5c9f..b62b9ec5c0 100644
> --- a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
> +++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D " \
>  SRCREV =3D "2969be996acad84b91ab3875b1816636fe61a40e"
>  SRC_URI =3D "git://github.com/${BPN}/${BPN}.git;branch=3Dmaster;protocol=
=3Dhttps"
>
> -
>  inherit autotools pkgconfig gettext
>
>  # ispellaff2myspell: A program to convert ispell affix tables to myspell=
 format
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb =
b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
> index 10d2150998..a97ce95526 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
> @@ -15,7 +15,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>([0-9][\.|_|-]=
?)+)"
>  SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;=
protocol=3Dhttps"
>  SRCREV =3D "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
>
> -
>  inherit autotools pkgconfig update-alternatives
>  export ac_cv_sys_file_offset_bits =3D "64"
>
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0=
.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
> index cb77dc81b0..32db50b3eb 100644
> --- a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "5c2ab772338bcbe516306bf8cf1059ddf2fa6bb7"
>  SRC_URI =3D "git://github.com/${BPN}/${BPN};branch=3Dmaster;protocol=3Dh=
ttps \
>             "
>
> -
>  inherit autotools
>
>  EXTRA_OECONF =3D "--disable-doxygen"
> diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb b/meta-oe=
/recipes-support/jsoncons/jsoncons_1.3.2.bb
> index 314f67928a..6b7e226c24 100644
> --- a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
> +++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ee7f7ed2001e4=
cde4679fdb8926f820"
>  SRC_URI =3D "git://github.com/danielaparker/jsoncons.git;protocol=3Dhttp=
s;branch=3Dmaster;tag=3Dv${PV}"
>  SRCREV =3D "64b9da1e9f15eeff4ec9d6bc856538db542118f2"
>
> -
>  inherit cmake
>
>  PACKAGECONFIG ??=3D ""
> diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/me=
ta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> index 89b2dff0ba..1822bcabd6 100644
> --- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> +++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://git.0pointer.net/libatasmart.git;proto=
col=3Dhttp;branch=3Dmaster \
>             file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patc=
h \
>  "
>
> -
>  inherit autotools lib_package pkgconfig
>
>  do_install:append() {
> diff --git a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb b/meta-oe/r=
ecipes-support/libb64/libb64_2.0.0.1.bb
> index 4a1052e75b..200b079172 100644
> --- a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> +++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/libb64/libb64;protocol=3D=
https;branch=3Dmaster \
>             file://0001-examples-Use-proper-function-prototype-for-main.p=
atch \
>             "
>
> -
>  CFLAGS +=3D "-fPIC"
>
>  do_configure () {
> diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb b/me=
ta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
> index ef2a6c76fb..24434f20f4 100644
> --- a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
> +++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
> @@ -6,7 +6,6 @@ SECTION =3D "devel/lib"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc07cb499d259452f324bb90c3067d=
85c"
>
> -
>  SRCREV =3D "9da72b2732508b0ba0ceed27f5e50bc276ef31f2"
>  SRC_URI =3D "git://github.com/storaged-project/libbytesize;branch=3Dmain=
;protocol=3Dhttps"
>
> diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-=
oe/recipes-support/libcereal/libcereal_1.3.2.bb
> index 7d4a352a31..b8007e34ad 100644
> --- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> +++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> @@ -26,7 +26,6 @@ SRC_URI =3D "git://github.com/USCiLab/cereal.git;branch=
=3Dmaster;protocol=3Dhttps \
>             file://run-ptest \
>  "
>
> -
>  inherit cmake pkgconfig ptest
>
>  CXXFLAGS:append:toolchain-clang =3D " -Wno-error=3Dc++11-narrowing-const=
-reference"
> diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/met=
a-oe/recipes-support/libcppkafka/libcppkafka_git.bb
> index d825f8fdee..598bbe3164 100644
> --- a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
> +++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
> @@ -21,7 +21,6 @@ inherit cmake
>
>  EXTRA_OECMAKE =3D "-DCPPKAFKA_BUILD_SHARED=3DON"
>
> -
>  do_install:append(){
>      chrpath -d ${D}${libdir}/libcppkafka.so.${BASEPV}
>      sed -i -e 's|${STAGING_INCDIR}|\$\{includedir\}|g' ${D}${datadir}/pk=
gconfig/cppkafka.pc
> diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb=
 b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> index 939e7db24e..1a9f2ca4cf 100644
> --- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> +++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/cyrozap/${BPN}.git;branch=
=3Dmaster;protocol=3Dhttps \
>      file://0001-Fix-gcc-15-incompatible-pointer-types-error.patch \
>  "
>
> -
>  inherit cmake
>
>  PACKAGES =3D+ "${PN}-utils"
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe=
/recipes-support/libeigen/libeigen_3.4.0.bb
> index f5f874941a..29ae6d0c4e 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> @@ -19,7 +19,6 @@ SRC_URI =3D "git://gitlab.com/libeigen/eigen.git;protoc=
ol=3Dhttp;branch=3D3.4 \
>
>  SRCREV =3D "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
>
> -
>  inherit cmake
>
>  FILES:${PN}-dev +=3D "${datadir}/eigen3/cmake"
> diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/rec=
ipes-support/libfann/libfann_git.bb
> index 2f68ea95a8..421259ff01 100644
> --- a/meta-oe/recipes-support/libfann/libfann_git.bb
> +++ b/meta-oe/recipes-support/libfann/libfann_git.bb
> @@ -14,5 +14,4 @@ SRC_URI =3D "git://github.com/libfann/fann.git;branch=
=3Dmaster;protocol=3Dhttps \
>
>  PV =3D "2.2.0+git"
>
> -
>  EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')}"
> diff --git a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb b/meta-oe/r=
ecipes-support/libharu/libharu_2.4.5.bb
> index 0ad4bd92c0..f6aa812b77 100644
> --- a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
> +++ b/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
> @@ -11,5 +11,4 @@ DEPENDS +=3D "libpng zlib"
>  SRC_URI =3D "git://github.com/libharu/libharu.git;branch=3Dmaster;protoc=
ol=3Dhttps"
>  SRCREV =3D "8fe5a738541a04642885fb7a75b2b5b9c5b416fa"
>
> -
>  inherit cmake
> diff --git a/meta-oe/recipes-support/libiio/libiio_0.26.bb b/meta-oe/reci=
pes-support/libiio/libiio_0.26.bb
> index ecd9223600..a4a4ea42c4 100644
> --- a/meta-oe/recipes-support/libiio/libiio_0.26.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_0.26.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "a0eca0d2bf10326506fb762f0eec14255b27bef5"
>  SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhtt=
ps;branch=3Dlibiio-v0"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
> -
>  SETUPTOOLS_SETUP_PATH ?=3D "${B}/bindings/python/"
>
>  DEPENDS =3D " \
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb b=
/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
> index f4e26a65fc..db5b671e87 100644
> --- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
> @@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/js-cookie/js-cookie.git;pro=
tocol=3Dhttps;branch=3Dmain"
>
>  SRCREV =3D "ab3f67fc4fad88cdf07b258c08e4164e06bf7506"
>
> -
>  JQUERYCOOKIEDIR =3D "${datadir}/javascript/jquery-cookie"
>  JQUERYCOOKIEDOCDIR =3D "${docdir}/libjs-jquery-cookie"
>
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.b=
b b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
> index cbf5700a5b..472b08ac33 100644
> --- a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
> @@ -3,7 +3,6 @@ SECTION =3D "console/network"
>  HOMEPAGE =3D "https://github.com/globalizejs/globalize"
>  LICENSE =3D "MIT"
>
> -
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4db68fb4d1d9986d736b35039f2ad=
9ea"
>
>  SRCREV =3D "771061fb35f7fd8d7c2c37f5d5bb26115be382bc"
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b=
/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
> index 88fbc109ee..305501f7ae 100644
> --- a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/fronteed/icheck.git;protoco=
l=3Dhttps;branch=3D${PV}"
>
>  SRCREV =3D "c8c1af84e4b90b4aea31466aad09bf877619e943"
>
> -
>  do_install() {
>          install -d ${D}${datadir}/javascript/jquery-icheck/
>          install -m 0644 ${S}/icheck.js ${D}${datadir}/javascript/jquery-=
icheck/
> diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/met=
a-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> index a2de42d946..d5c606cd5b 100644
> --- a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> +++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> @@ -16,7 +16,6 @@ SRC_URI +=3D "git://github.com/LadislavSopko/mimetic/;b=
ranch=3Dmaster;protocol=3Dhttps
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  CXXFLAGS +=3D "-Wno-narrowing -std=3Dc++14"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb b/meta-oe/re=
cipes-support/libnvme/libnvme_1.12.bb
> index 95d18a1ed0..2593329492 100644
> --- a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
> +++ b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
> @@ -16,7 +16,6 @@ SRCREV =3D "5ec1f5284ecb0eda481f3d2d61236fbc5b46164f"
>  SRC_URI =3D "git://github.com/linux-nvme/libnvme;protocol=3Dhttps;branch=
=3Dmaster \
>             file://0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch"
>
> -
>  inherit meson pkgconfig
>
>  PACKAGECONFIG ??=3D "keyutils openssl"
> diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb b/meta=
-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
> index 2462786aae..d38c49500b 100644
> --- a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
> +++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "b505ef5161d2552102a743acd4ad83298d3d8f99"
>
> -
>  inherit meson pkgconfig gtk-doc gobject-introspection vala
>
>  DEPENDS =3D "glib-2.0 libsoup libxslt"
> diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb =
b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
> index ee75c39eee..194a5a8c9b 100644
> --- a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
> +++ b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://gitlab.com/libosinfo/osinfo-db-tools=
.git;branch=3Dmain;protocol=3Dh
>             "
>  SRCREV =3D "e5564be303bfac49cc3490bd0fada342cd65566f"
>
> -
>  inherit meson pkgconfig
>
>  do_configure:prepend () {
> diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb b/me=
ta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
> index 33e17234ce..e9fce7e5fd 100644
> --- a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
> +++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://gitlab.com/libosinfo/osinfo-db.git;b=
ranch=3Dmain;protocol=3Dhttps"
>
>  SRCREV =3D "62f8adceb8ee88e643a134f2cfaf04fc11b9fc51"
>
> -
>  inherit allarch autotools-brokensep
>
>  EXTRA_OEMAKE =3D "OSINFO_DB_TARGET=3D'--dir ${datadir}/osinfo'"
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb b/meta-oe/re=
cipes-support/libp11/libp11_0.4.13.bb
> index 1731d350ae..51526e39c5 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
> @@ -15,7 +15,6 @@ SRCREV =3D "6d669183c7b241ce47ecce28744837ad92814f5c"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "libp11-(?P<pver>\d+(\.\d+)+)"
>
> -
>  inherit autotools pkgconfig
>
>  EXTRA_OECONF =3D "--disable-static"
> diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb b/met=
a-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> index 968094daff..b5f70b2e0a 100644
> --- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> +++ b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> @@ -16,7 +16,6 @@ DEPENDS =3D "zlib openssl zstd"
>
>  inherit cmake
>
> -
>  FILES:${PN} +=3D "${datadir}"
>
>  EXTRA_OECMAKE +=3D "-DRDKAFKA_BUILD_EXAMPLES=3DOFF -DRDKAFKA_BUILD_TESTS=
=3DOFF"
> diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb b=
/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> index 31dce12155..7e2a75d871 100644
> --- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> +++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> @@ -9,10 +9,8 @@ SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.g=
it;branch=3Dmain;protocol=3Dht
>
>  SRCREV =3D "093d80b4006042b75a433a5e63760ae9bebad142"
>
> -
>  inherit cmake
>
>  # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
>  EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
>
> -
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb b/meta-oe/rec=
ipes-support/libsoc/libsoc_0.8.2.bb
> index 958f3cf5a1..d3e5367c5c 100644
> --- a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
> @@ -12,7 +12,6 @@ inherit autotools pkgconfig python3-dir
>  SRCREV =3D "fd1ad6e7823fa76d8db0d3c5884faffa8ffddafb"
>  SRC_URI =3D "git://github.com/jackmitch/libsoc.git;branch=3Dmaster;proto=
col=3Dhttps"
>
> -
>  BOARD ??=3D "devboard"
>
>  PACKAGECONFIG ?=3D ""
> diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb b/meta-oe/r=
ecipes-support/libspdm/libspdm_3.7.0.bb
> index c6bbd1716b..e09497eef1 100644
> --- a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> +++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=
=3Dmain;protocol=3Dhttps \
>             file://0001-Backport-API-introduced-in-openssl-3.5.0.patch"
>  SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
>
> -
>  inherit cmake
>
>  LIBSPDM_CFLAGS =3D "\
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb b/meta-oe/re=
cipes-support/libssh/libssh_0.11.1.bb
> index bb2b0dc466..9aa3c33707 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
> @@ -15,7 +15,6 @@ SRC_URI:append:toolchain-clang =3D " file://0001-Compil=
erChecks.cmake-drop-Wunused
>
>  SRCREV =3D "854795c654eda518ed6de6c1ebb4e2107fcb2e73"
>
> -
>  inherit cmake ptest
>
>  PACKAGECONFIG ??=3D "gcrypt ${@bb.utils.contains('PTEST_ENABLED', '1', '=
tests', '', d)}"
> diff --git a/meta-oe/recipes-support/libteam/libteam_1.32.bb b/meta-oe/re=
cipes-support/libteam/libteam_1.32.bb
> index 4686f4be5c..035dd05270 100644
> --- a/meta-oe/recipes-support/libteam/libteam_1.32.bb
> +++ b/meta-oe/recipes-support/libteam/libteam_1.32.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/jpirko/libteam;branch=3Dm=
aster;protocol=3Dhttps \
>             "
>  SRCREV =3D "8b843e93cee1dab61fb79b01791201cdad45e1d1"
>
> -
>  inherit autotools pkgconfig ptest
>
>  FILES:${PN} =3D "${libdir}/libteam${SOLIBS} \
> diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/met=
a-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> index b91a455aff..eeaede825f 100644
> --- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> +++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://readme.txt;md5=3Df8f366f3370=
dda889f60faa7db162cf4"
>  SECTION =3D "libs"
>  CVE_PRODUCT =3D "tinyxml"
>
> -
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.=
', '_')}.tar.gz \
>             file://enforce-use-stl.patch \
>             file://entity-encoding.patch \
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/=
meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> index 89e6eca99b..2ba5cc062e 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "9148bdf719e997d1f474be6bcc7943881046dba1"
>  SRC_URI =3D "git://github.com/leethomason/tinyxml2.git;branch=3Dmaster;p=
rotocol=3Dhttps \
>             file://run-ptest"
>
> -
>  inherit meson ptest
>
>  EXTRA_OEMESON +=3D " \
> diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb b/met=
a-oe/recipes-support/libtommath/libtommath_1.3.0.bb
> index 28c474e1dd..aa2b2fcea5 100644
> --- a/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
> +++ b/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/libtom/libtommath.git;pro=
tocol=3Dhttps;branch=3Dmaster"
>
>  SRCREV =3D "95d80fd8229d05dd6cb4ec88bc8d4f5377ff00ef"
>
> -
>  EXTRA_OEMAKE =3D "'PREFIX=3D${prefix}' 'DESTDIR=3D${D}' 'LIBPATH=3D${lib=
dir}' 'CFLAGS=3D${CFLAGS}'"
>
>  do_compile() {
> diff --git a/meta-oe/recipes-support/liburing/liburing_2.9.bb b/meta-oe/r=
ecipes-support/liburing/liburing_2.9.bb
> index a645a8e4c4..34c8bbf663 100644
> --- a/meta-oe/recipes-support/liburing/liburing_2.9.bb
> +++ b/meta-oe/recipes-support/liburing/liburing_2.9.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/axboe/liburing.git;branch=
=3Dmaster;protocol=3Dhttps \
>             file://0001-test-Including-missing-string.h-for-memcpy.patch"
>  SRCREV =3D "08468cc3830185c75f9e7edefd88aa01e5c2f8ab"
>
> -
>  DEPENDS:append:libc-musl =3D " libucontext"
>  XCFLAGS =3D "-pthread"
>  XCFLAGS:append:libc-musl =3D " -lucontext"
> diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/rec=
ipes-support/libusbg/libusbg_git.bb
> index 84f97aab2c..c2763f2b8c 100644
> --- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
> +++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/libusbg/libusbg.git;branc=
h=3Dmaster;protocol=3Dhttps \
>             file://0001-Fix-out-of-tree-builds.patch \
>            "
>
> -
>  ALTERNATIVE:${PN} =3D "gadget-acm-ecm show-gadgets"
>  ALTERNATIVE_LINK_NAME[gadget-acm-ecm] =3D "${bindir}/gadget-acm-ecm"
>  ALTERNATIVE_LINK_NAME[show-gadgets] =3D "${bindir}/show-gadgets"
> diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/r=
ecipes-support/libusbgx/libusbgx_git.bb
> index 7b12b911d8..4542d47a5a 100644
> --- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> +++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D " \
>      file://usbgx.service \
>  "
>
> -
>  PACKAGECONFIG ??=3D "examples gadget-schemes libconfig"
>  PACKAGECONFIG[libconfig] =3D "--with-libconfig=3Dyes,--without-libconfig=
,libconfig"
>  PACKAGECONFIG[examples] =3D "--enable-examples,--disable-examples"
> diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/r=
ecipes-support/mcelog/mce-inject_git.bb
> index c8ffb65fa1..d2f6089cbf 100644
> --- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
> +++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
> @@ -15,7 +15,6 @@ DEPENDS =3D "bison-native"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D30;md5=3D94c18755082a2da=
9c9cf97cba3ad47d6"
>
> -
>  COMPATIBLE_HOST =3D '(x86_64.*|i.86.*)-linux'
>
>  EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS}'"
> diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/rec=
ipes-support/mcelog/mce-test_git.bb
> index 3b96210633..842383cd04 100644
> --- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
> +++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
> @@ -22,7 +22,6 @@ RDEPENDS:${PN} =3D "mcelog mce-inject dialog bash"
>
>  COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
>
> -
>  EXTRA_OEMAKE +=3D "CFLAGS=3D'${CFLAGS}'"
>
>  do_install:append(){
> diff --git a/meta-oe/recipes-support/mcelog/mcelog_204.bb b/meta-oe/recip=
es-support/mcelog/mcelog_204.bb
> index c3d082aa67..cb96042267 100644
> --- a/meta-oe/recipes-support/mcelog/mcelog_204.bb
> +++ b/meta-oe/recipes-support/mcelog/mcelog_204.bb
> @@ -15,7 +15,6 @@ SRCREV =3D "ad244c6b60fcbd08a5d73497bfb3487983801598"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -
>  inherit ptest
>
>  COMPATIBLE_HOST =3D '(x86_64.*|i.86.*)-linux'
> diff --git a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb b/meta-oe/recipes=
-support/md4c/md4c_0.5.2.bb
> index 59f2e430aa..262f3b0666 100644
> --- a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
> +++ b/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
> @@ -5,8 +5,6 @@ HOMEPAGE =3D "http://github.com/mity/md4c"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D383f39920f391605af6e8e46e6=
0e2378"
>
> -
> -
>  SRC_URI =3D " \
>          git://github.com/mity/md4c.git;protocol=3Dhttps;branch=3Dmaster =
\
>  "
> diff --git a/meta-oe/recipes-support/mg/mg_20230501.bb b/meta-oe/recipes-=
support/mg/mg_20230501.bb
> index 04811f1bdd..3979424fa1 100644
> --- a/meta-oe/recipes-support/mg/mg_20230501.bb
> +++ b/meta-oe/recipes-support/mg/mg_20230501.bb
> @@ -14,7 +14,6 @@ SRC_URI:append:libc-musl =3D "\
>             file://0001-Undefine-REGEX-for-musl-based-systems.patch \
>             "
>
> -
>  # CFLAGS isn't in EXTRA_OEMAKE, as the makefile picks it up via ?=3D
>  EXTRA_OEMAKE =3D "\
>      'CC=3D${CC}' \
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11=
.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> index 07bc84ce8b..5c9506b4db 100644
> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
> @@ -53,7 +53,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ec28527f3d5=
44b51ceb0e1907d0bf3f"
>
>  SRCREV =3D "cb8de98b2cc3b62fd1a578ba479c0820778e9c02"
>
> -
>  inherit systemd pkgconfig
>
>  SYSTEMD_SERVICE:${PN} =3D "multipathd.service"
> diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb b/meta=
-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> index 7390d83bcc..da9afcfc01 100644
> --- a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> +++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/Oblomov/clinfo.git;protoc=
ol=3Dhttps;branch=3Dmaster"
>
>  SRCREV =3D "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
>
> -
>  DEPENDS +=3D "opencl-headers virtual/opencl-icd"
>
>  do_install() {
> diff --git a/meta-oe/recipes-support/opencv/ade_0.1.2.bb b/meta-oe/recipe=
s-support/opencv/ade_0.1.2.bb
> index b54c28d624..dd24d7af1f 100644
> --- a/meta-oe/recipes-support/opencv/ade_0.1.2.bb
> +++ b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
> @@ -13,7 +13,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57"
>
>  inherit cmake
>
> -
>  EXTRA_OECMAKE +=3D " -DCMAKE_BUILD_TYPE=3DRelease"
>
>  FILES:${PN}-dev +=3D "${datadir}/${BPN}/*.cmake"
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.11.0.bb
> index 826eff30ca..7001a526df 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> @@ -18,7 +18,6 @@ SRCREV_face =3D "8afa57abc8229d611c4937165d20e2a2d9fc5a=
12"
>  SRCREV_wechat-qrcode =3D "a8b69ccc738421293254aec5ddb38bd523503252"
>  SRCREV_fastcv =3D "8d86e68dad8b80b8575a8d3cf401d3ee96c24148"
>
> -
>  SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg_fastcv"
>  SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dopencv;branch=3D4=
.x;protocol=3Dhttps \
>             git://github.com/opencv/opencv_contrib.git;destsuffix=3D${BB_=
GIT_DEFAULT_DESTSUFFIX}/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttp=
s \
> @@ -39,7 +38,6 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3D=
opencv;branch=3D4.x;protocol=3Dht
>             "
>  SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.=
patch;patchdir=3Dcontrib"
>
> -
>  # OpenCV wants to download more files during configure.  We download the=
se in
>  # do_fetch and construct a source cache in the format it expects
>  OPENCV_DLDIR =3D "${WORKDIR}/downloads"
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb b/meta-oe/re=
cipes-support/opensc/opensc_0.26.1.bb
> index 78258c965a..b2554c616a 100644
> --- a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
> +++ b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3D0.=
26.1;protocol=3Dhttps"
>
>  CVE_STATUS[CVE-2024-8443] =3D "fixed-version: this is fixed since 0.26.0=
"
>
> -
>  inherit autotools pkgconfig bash-completion
>
>  EXTRA_OECONF =3D " \
> diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb b/meta-oe/reci=
pes-support/p910nd/p910nd_0.97.bb
> index 0b5740c161..9628a464bb 100644
> --- a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
> +++ b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
> @@ -4,13 +4,11 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D3d82780e8917b360cbee7b9ec3=
e40734"
>
> -
>  # v0.97
>  SRCREV =3D "57ebc07ad8723ea4106090536c58c7f7160743e2"
>  SRC_URI =3D "git://github.com/kenyapcomau/p910nd;protocol=3Dhttps;branch=
=3Dmaster \
>             file://fix-var-lock.patch"
>
> -
>  inherit update-rc.d
>
>  INITSCRIPT_NAME =3D "p910nd"
> diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-suppor=
t/pcp/pcp.inc
> index c54c054cf8..0cf54488a5 100644
> --- a/meta-oe/recipes-support/pcp/pcp.inc
> +++ b/meta-oe/recipes-support/pcp/pcp.inc
> @@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/performancecopilot/pcp;br=
anch=3Dstable;protocol=3Dhttps
>
>  SRCREV =3D "d8d97b79ee47d9dfb076a3242564ed3cae04eba9"
>
> -
>  inherit setuptools3-base pkgconfig autotools-brokensep
>
>  # Specify any options you want to pass to the configure script using EXT=
RA_OECONF:
> diff --git a/meta-oe/recipes-support/pcp/pcp_6.3.7.bb b/meta-oe/recipes-s=
upport/pcp/pcp_6.3.7.bb
> index 65efac06be..2485341448 100644
> --- a/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
> +++ b/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
> @@ -9,7 +9,6 @@ require pcp.inc
>  DEPENDS +=3D "perl-native bison-native flex-native python3-native python=
3-setuptools python3 \
>         pcp-native cairo zlib ncurses readline libx11 avahi openssl"
>
> -
>  SRC_URI +=3D "file://0001-Remove-unsuitble-part-for-cross-compile.patch =
\
>              file://pass-options-to-AR.patch \
>              file://fix_parallel_make.patch \
> diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb b/met=
a-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
> index 14ffab6128..633ad8bcf9 100644
> --- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
> +++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "778da3d86a59f5166443118c158e11ba4da9a5f1"
>
>  inherit autotools pkgconfig
>
> -
>  DEPENDS =3D "pcsc-lite autoconf-archive-native"
>
>  RDEPENDS:${PN} +=3D " \
> diff --git a/meta-oe/recipes-support/picocom/picocom_2024.bb b/meta-oe/re=
cipes-support/picocom/picocom_2024.bb
> index 37cf2d0a4c..b2d09e80f2 100644
> --- a/meta-oe/recipes-support/picocom/picocom_2024.bb
> +++ b/meta-oe/recipes-support/picocom/picocom_2024.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "7b6acbd421a2d4ca99376b7b427828dc1bcba4d8"
>  SRC_URI =3D "git://gitlab.com/wsakernel/picocom;branch=3Dmaster;protocol=
=3Dhttps \
>             "
>
> -
>  EXTRA_OEMAKE =3D "'CC=3D${CC}' 'LD=3D${CC}' 'VERSION=3D${PV}' \
>                 'CFLAGS=3D${CFLAGS}' 'LDFLAGS=3D${LDFLAGS}' "
>
> diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb b/me=
ta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> index c547b0532e..d92486aeb6 100644
> --- a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> +++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> @@ -13,7 +13,6 @@ SRCREV =3D "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  do_compile() {
>      oe_runmake CC=3D"${CC}" CXX=3D"${CXX}" EXTRA_INCLUDES=3D"${TARGET_CF=
LAGS}" AR=3D"${AR}";
>  }
> diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recip=
es-support/pidgin/icyque_git.bb
> index e8b4a3c2c3..1211cdf2a9 100644
> --- a/meta-oe/recipes-support/pidgin/icyque_git.bb
> +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
> @@ -15,7 +15,6 @@ SRCREV =3D "513fc162d5d1a201c2b044e2b42941436d1069d5"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  do_compile() {
>      oe_runmake;
>  }
> diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.=
bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
> index a403289cfc..2014d499cb 100644
> --- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
> +++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
> @@ -19,7 +19,6 @@ SRCREV =3D "8f6b94409d4872265076df310492da1e5f6abdf7"
>
>  SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
>
> -
>  inherit meson pkgconfig
>
>  # Overwrite default pkcs11 module path
> diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipe=
s-support/poco/poco_1.13.3.bb
> index e0f6c4169e..9103cc591c 100644
> --- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
> @@ -18,7 +18,6 @@ SRCREV =3D "7f848d25aa0461d3beeff1189dc61b48ffe8e2f4"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "poco-(?P<pver>\d+(\.\d+)+)"
>
> -
>  inherit cmake ptest
>
>  # By default the most commonly used poco components are built
> diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/=
meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> index 4451e96307..cbd110776c 100644
> --- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> +++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> @@ -8,7 +8,6 @@ PV .=3D "+git"
>  SRC_URI =3D "git://github.com/PortAudio/portaudio.git;branch=3Dmaster;pr=
otocol=3Dhttps"
>  SRCREV =3D "929e2e8f7af281c5eb4fa07758930d542ec43d97"
>
> -
>  inherit cmake pkgconfig
>
>  EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON"
> diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb b/meta-=
oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
> index 65caa05a13..99b2de6341 100644
> --- a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
> +++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/ago/pps-tools.git;branch=3D=
master;protocol=3Dhttps \
>             file://0001-Use-lld-in-printf-for-64-bit-time_t.patch \
>             "
>
> -
>  RDEPENDS:${PN} =3D "bash"
>
>  do_install() {
> diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/reci=
pes-support/re2/re2_2024.03.01.bb
> index 55a834fa42..a9b08ec5a4 100644
> --- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> +++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/google/re2.git;branch=3Dm=
ain;protocol=3Dhttps \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest'=
, '', d)} \
>            "
>
> -
>  DEPENDS =3D "abseil-cpp ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtes=
t googlebenchmark', '', d)}"
>
>  inherit cmake ptest
> diff --git a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb b/met=
a-oe/recipes-support/reboot-mode/reboot-mode_git.bb
> index 4172de857c..2a84c06ea1 100644
> --- a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
> +++ b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84dcc94da3adb5=
2b53ae4fa38fe49e5d"
>  SRC_URI =3D "git://gitlab.com/postmarketOS/reboot-mode.git;protocol=3Dht=
tp;branch=3Dmaster"
>  SRCREV =3D "84831b20512abd9033414ca5f5a023f333525335"
>
> -
>  # Upstream repo has not made releases/tags after 1.0.0
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> diff --git a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb b/meta-oe/re=
cipes-support/reptyr/reptyr_0.10.0.bb
> index 5f4ffcd657..cd023ad7bf 100644
> --- a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
> +++ b/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D25a0555028c718=
37623fa6dfa4cc45c0"
>  SRC_URI =3D "git://github.com/nelhage/reptyr.git;protocol=3Dhttps;branch=
=3Dmaster"
>  SRCREV =3D "1238097fc2cd15db058d2185cc4985daa87bcd41"
>
> -
>  inherit bash-completion github-releases manpages pkgconfig
>
>  GITHUB_BASE_URI =3D "https://github.com/nelhage/${BPN}/releases/"
> diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe=
/recipes-support/rsnapshot/rsnapshot_git.bb
> index 8c4183bae3..520c2591bb 100644
> --- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> +++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> @@ -29,7 +29,6 @@ SRC_URI =3D "git://github.com/DrHyde/${BPN};branch=3Dma=
ster;protocol=3Dhttps \
>             file://configure-fix-cmd_rsync.patch \
>            "
>
> -
>  inherit autotools perlnative
>
>  # Fix rsnapshot.conf.default:
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb b/met=
a-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
> index 711d4696fd..1dcd030294 100644
> --- a/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74274e8a218423=
e49eefdea80bc55038"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BP=
N}.git;protocol=3Dhttps;branch=3Dmaster"
>  SRCREV =3D "61839777afedcc7bdb68ea4628c5ce5ca72c2ac8"
>
> -
>  EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
>
>  do_install() {
> diff --git a/meta-oe/recipes-support/sdmon/sdmon_git.bb b/meta-oe/recipes=
-support/sdmon/sdmon_git.bb
> index 8007ead6c6..b941eb95b3 100644
> --- a/meta-oe/recipes-support/sdmon/sdmon_git.bb
> +++ b/meta-oe/recipes-support/sdmon/sdmon_git.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/Ognian/sdmon;protocol=3Dhtt=
ps;branch=3Dmaster"
>  PV =3D "0.9.0"
>  SRCREV =3D "4dff9b690e8d4454fada6abfbb6b32fcb794968c"
>
> -
>  do_compile() {
>         oe_runmake -C ${S}/src CC=3D"${CC}" CFLAGS=3D"${CFLAGS} -D_REENTR=
ANT -DVERSION=3D\"\\\"${PV}\\\"\"" LDFLAGS=3D"${LDFLAGS}"
>  }
> diff --git a/meta-oe/recipes-support/serial/serial_1.2.1.bb b/meta-oe/rec=
ipes-support/serial/serial_1.2.1.bb
> index 42151da532..a8410b2e40 100644
> --- a/meta-oe/recipes-support/serial/serial_1.2.1.bb
> +++ b/meta-oe/recipes-support/serial/serial_1.2.1.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D " \
>  SRCREV =3D "10ac4e1c25c2cda1dc0a32a8e12b87fd89f3bb4f"
>  SRC_URI[sha256sum] =3D "c8cd235dda2ef7d977ba06dfcb35c35e42f45cfd9149ba3a=
d257756123d8ff96"
>
> -
>  inherit cmake
>
>  # Work-around for https://github.com/wjwwood/serial/issues/135
> diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/rec=
ipes-support/smarty/smarty_5.4.5.bb
> index 047f10589d..940d9f7268 100644
> --- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> +++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/smarty-php/smarty.git;pro=
tocol=3Dhttps;branch=3Dmaster;t
>
>  SRCREV =3D "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
>
> -
>  INHIBIT_DEFAULT_DEPS =3D "1"
>
>  # `make clean` removes files, they can't be rebuild with `make all`
> diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.11.2.bb
> index 887615ef45..542eb3e39a 100644
> --- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D " \
>  "
>  SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
>
> -
>  EXTRA_OECONF +=3D "--disable-zypp"
>
>  PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'api-documenta=
tion systemd pam', d)}"
> diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb b/meta=
-oe/recipes-support/span-lite/span-lite_0.11.0.bb
> index 9fef39216f..6f38fd9759 100644
> --- a/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
> +++ b/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
> @@ -6,5 +6,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaec=
b14d942c71d31bef20d78c"
>  SRC_URI +=3D "git://github.com/martinmoene/span-lite;branch=3Dmaster;pro=
tocol=3Dhttps"
>  SRCREV =3D "50f55c59d1b66910837313c40d11328d03447a41"
>
> -
>  inherit cmake
> diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb b/meta-oe/re=
cipes-support/spdlog/spdlog_1.15.0.bb
> index 25d8249917..27ea330f43 100644
> --- a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
> +++ b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/gabime/spdlog.git;protocol=
=3Dhttps;branch=3Dv1.x"
>
>  DEPENDS +=3D "fmt"
>
> -
>  inherit cmake
>
>  # no need to build example & tests & benchmarks on pure yocto
> diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/r=
ecipes-support/spitools/spitools_git.bb
> index e313685d95..743d5caf8a 100644
> --- a/meta-oe/recipes-support/spitools/spitools_git.bb
> +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
> @@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c16666ae6c159=
876a0ba63099614381"
>  PV =3D "1.0.2"
>  SRCREV =3D "1748e092425a4a0ff693aa347062a57fc1ffdd00"
>
> -
>  SRC_URI =3D "git://github.com/cpb-/spi-tools.git;protocol=3Dhttps;branch=
=3Dmaster"
>
> -
>  inherit autotools
> diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb=
 b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
> index bba2507e14..be9f6b211d 100644
> --- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
> +++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
> @@ -10,7 +10,6 @@ SRCREV =3D "e7c351c6c722336b3c79b79cd002c7c2986eefb0"
>  SRC_URI =3D "git://github.com/Microsemi/switchtec-user.git;protocol=3Dht=
tps;branch=3Dmaster"
>  SRC_URI[sha256sum] =3D "a715e46d8498418dbb8a2519318ba0714ee148151d7e4a7f=
a5e27770a2f6888f"
>
> -
>  inherit autotools-brokensep pkgconfig
>
>  EXTRA_OEMAKE =3D "DESTDIR=3D'${D}' PREFIX=3D'${prefix}' LDCONFIG=3D'true=
' LIBDIR=3D'${D}${libdir}'"
> diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/rec=
ipes-support/synergy/synergy_git.bb
> index e215c62620..6b0174389a 100644
> --- a/meta-oe/recipes-support/synergy/synergy_git.bb
> +++ b/meta-oe/recipes-support/synergy/synergy_git.bb
> @@ -16,7 +16,6 @@ SRC_URI +=3D "file://CVE-2020-15117.patch"
>  SRCREV ?=3D "1b4c076127687aceac931d269e898beaac1cad9f"
>  PV =3D "1.10.1+git"
>
> -
>  inherit cmake features_check
>
>  EXTRA_OECMAKE +=3D "-DSYNERGY_BUILD_LEGACY_GUI=3DOFF"
> diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.=
4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> index 019098fdf7..4a5d1e322e 100644
> --- a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> +++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> @@ -11,7 +11,6 @@ inherit meson systemd pkgconfig useradd features_check
>  REQUIRED_DISTRO_FEATURES =3D "systemd"
>  COMPATIBLE_HOST:libc-musl =3D "null"
>
> -
>  DEPENDS +=3D "systemd"
>  DEPENDS +=3D "openssl"
>  DEPENDS +=3D "gperf-native"
> diff --git a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb b/meta-oe/recipe=
s-support/tbb/tbb_2022.1.0.bb
> index 937cf6a0b9..15009d790d 100644
> --- a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
> @@ -17,7 +17,6 @@ SRCREV =3D "45587e94dfb6dfe00220c5f520020a5bc745e92f"
>  SRC_URI =3D "git://github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;bra=
nch=3D${BRANCH} \
>            "
>
> -
>  inherit cmake pkgconfig
>
>  # test build fails, error: 'mallinfo mallinfo()' is deprecated
> @@ -53,11 +52,9 @@ LDFLAGS:append:libc-musl =3D " -lucontext"
>  # The latest version of oneTBB does not support PPC
>  COMPATIBLE_MACHINE:powerpc =3D "(!.*ppc).*"
>
> -
>  do_install:append:class-target() {
>      # fix for qa check buildpaths
>      sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/TBB/TBBTargets.c=
make
>  }
>
> -
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-support/tio/tio_3.9.bb b/meta-oe/recipes-sup=
port/tio/tio_3.9.bb
> index 67107e2924..a95986e759 100644
> --- a/meta-oe/recipes-support/tio/tio_3.9.bb
> +++ b/meta-oe/recipes-support/tio/tio_3.9.bb
> @@ -9,7 +9,6 @@ SRCREV =3D "bdfe87e1cbf6e3bfd48324a25ea026fcd3cc47e9"
>
>  SRC_URI =3D "git://github.com/tio/tio;protocol=3Dhttps;branch=3Dmaster;t=
ag=3Dv${PV}"
>
> -
>  inherit meson pkgconfig
>
>  RDEPENDS:${PN} +=3D " lua"
> diff --git a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb b/meta-o=
e/recipes-support/usbids/usbids_2025.04.01.bb
> index aa884419f8..3718d1bdfb 100644
> --- a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
> +++ b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/usbids/usbids.git;branch=3D=
master;protocol=3Dhttps"
>  # April 1, 2025
>  SRCREV =3D "635738b64eb52d376c5d1756c265de67236c8934"
>
> -
>  do_install() {
>         install -d ${D}${datadir}
>         install -m0644 ${S}/usb.ids ${D}${datadir}
> diff --git a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb b/meta-oe/rec=
ipes-support/uthash/uthash_2.3.0.bb
> index 357ddfdbca..58cc19459b 100644
> --- a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
> +++ b/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "\
>      file://run-ptest \
>  "
>
> -
>  inherit ptest
>
>  do_compile[noexec] =3D "1"
> diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe=
/recipes-support/utouch/utouch-evemu_git.bb
> index e42b19a8d0..c62c12a870 100644
> --- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> @@ -14,5 +14,4 @@ SRCREV =3D "9752b50e922572e4cd214ac45ed95e4ee410fe24"
>
>  PV =3D "1.0.6+git"
>
> -
>  PARALLEL_MAKE =3D ""
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb b/m=
eta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
> index 17b71411ca..81a585e3c2 100644
> --- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
> @@ -25,7 +25,6 @@ RDEPENDS:${PN}-dev =3D ""
>  # tag 0.8.2
>  SRCREV =3D "56123c87598f8b1dd471be83ca841ceae07f95ba"
>
> -
>  inherit cmake
>
>  PACKAGES =3D+ "${PN}-examples"
> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb b/meta-=
oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
> index 533b0801cb..1f7db38415 100644
> --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
> @@ -16,7 +16,6 @@ SRCREV =3D "d463bad9639c910fadc2f30dac473c7688b11cfc"
>
>  PV =3D "0.9.19"
>
> -
>  FILES:${PN} +=3D "${libdir}/xorg/modules/*"
>
>  require recipes-graphics/xorg-xserver/xserver-abi.inc
> diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb b/meta-oe=
/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
> index 09db5519ea..6ba656ae6c 100644
> --- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
> +++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/jbeder/yaml-cpp.git;branc=
h=3Dmaster;protocol=3Dhttps"
>  SRCREV =3D "28f93bdec6387d42332220afa9558060c8016795"
>  PV .=3D "+git"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DYAML_CPP_BUILD_TESTS=3DOFF -DYAML_BUILD_SHARED_LIBS=
=3DON -DYAML_CPP_BUILD_TOOLS=3DOFF"
> diff --git a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb b/meta-oe/re=
cipes-support/yyjson/yyjson_0.11.1.bb
> index 0655f225b4..244239747a 100644
> --- a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
> +++ b/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc8ae1b99922935=
413d4c596f50b59545"
>  SRC_URI =3D "git://github.com/ibireme/yyjson.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
>  SRCREV =3D "9e24d6bcead647231f81173cc5c6bb6c097c00e4"
>
> -
>  inherit cmake
>
>  PACKAGECONFIG ??=3D "reader writer utils fast-fp-conv non-standard utf8-=
validation unaligned-memory-access"
> diff --git a/meta-oe/recipes-test/bats/bats_1.12.0.bb b/meta-oe/recipes-t=
est/bats/bats_1.12.0.bb
> index 14a234c866..04c8de85f8 100644
> --- a/meta-oe/recipes-test/bats/bats_1.12.0.bb
> +++ b/meta-oe/recipes-test/bats/bats_1.12.0.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "\
>  # v1.12.0
>  SRCREV =3D "713504bc0224a19b3d7c7958c18dc07f64f54b44"
>
> -
>  # Numerous scripts assume ${baselib} =3D=3D lib, which is not true.
>  #
>  do_configure:prepend() {
> diff --git a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb b/meta-oe/recipe=
s-test/catch2/catch2_3.8.1.bb
> index 6a7fc5ad47..375dea8fb2 100644
> --- a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
> +++ b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaec=
b14d942c71d31bef20d78c"
>  SRC_URI =3D "git://github.com/catchorg/Catch2.git;branch=3Ddevel;protoco=
l=3Dhttps"
>  SRCREV =3D "2b60af89e23d28eefc081bc930831ee9d45ea58b"
>
> -
>  inherit cmake python3native
>
>  do_install:append() {
> diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipe=
s-test/cmocka/cmocka_1.1.7.bb
> index 09afe36666..7e929ea5f3 100644
> --- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> @@ -13,7 +13,6 @@ SRC_URI =3D "git://git.cryptomilk.org/projects/cmocka.g=
it;protocol=3Dhttps;branch=3Dst
>             file://run-ptest \
>            "
>
> -
>  inherit cmake ptest
>
>  EXTRA_OECMAKE +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_=
BUILD_TYPE=3DDebug -DUNIT_TESTING=3DON', '', d)}"
> diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/reci=
pes-test/cpputest/cpputest_4.0.bb
> index 5710585b6c..46d03af582 100644
> --- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> +++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dce5d5f1fe02bcd=
1343ced64a06fd4177"
>  SRC_URI =3D "git://github.com/cpputest/cpputest.git;protocol=3Dhttps;bra=
nch=3Dmaster"
>  SRCREV =3D "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
>
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DLONGLONG=3DON \
> diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb b/meta-oe/reci=
pes-test/cukinia/cukinia_0.7.0.bb
> index ad545e627b..0e75172c2f 100644
> --- a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
> +++ b/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/savoirfairelinux/cukinia.=
git;protocol=3Dhttps;branch=3Dm
>
>  SRCREV =3D "be56f653743cc0e68bef81ef35df7c50ff8919c4"
>
> -
>  RRECOMMENDS:${PN} =3D "libgpiod-tools"
>
>  do_install () {
> diff --git a/meta-oe/recipes-test/evtest/evtest_1.35.bb b/meta-oe/recipes=
-test/evtest/evtest_1.35.bb
> index 9c42efcdab..9e4ea2e177 100644
> --- a/meta-oe/recipes-test/evtest/evtest_1.35.bb
> +++ b/meta-oe/recipes-test/evtest/evtest_1.35.bb
> @@ -11,5 +11,4 @@ SRC_URI =3D "git://gitlab.freedesktop.org/libevdev/evte=
st.git;protocol=3Dhttps;branc
>             file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch=
 \
>             "
>
> -
>  inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb b/meta-oe/recip=
es-test/fbtest/fb-test_1.1.0.bb
> index 98db76eda1..b614805f6a 100644
> --- a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
> +++ b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com//ponty/fb-test-app.git;bran=
ch=3Dmaster;protocol=3Dhttps"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  do_install() {
>      install -d ${D}${bindir}
>      install -m 0755 fb-test ${D}${bindir}
> diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/met=
a-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> index 3588e96847..877de5f31a 100644
> --- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/wolfcw/libfaketime.git;bran=
ch=3Dmaster;protocol=3Dhttps
>             file://0001-Makefile-Detect-compiler-in-makefile.patch \
>             "
>
> -
>  CFLAGS:append:libc-musl =3D " -D_LARGEFILE64_SOURCE"
>
>  do_configure[noexec] =3D "1"
> diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git=
.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> index c617cf09a3..a884239e2c 100644
> --- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> +++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> @@ -11,5 +11,4 @@ SRCREV =3D "2ee61484167eab846f7b7c565284d7c350d738d3"
>  # Upstream repo does not tag
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -
>  inherit cmake
> diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-te=
st/pm-qa/pm-qa_git.bb
> index d7e9618985..1b24bba388 100644
> --- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> +++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D " \
>      file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.pat=
ch \
>  "
>
> -
>  CFLAGS +=3D "-pthread"
>
>  PATCHTOOL =3D "git"
> diff --git a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb b/meta-oe/reci=
pes-test/shunit2/shunit2_2.1.8.bb
> index 8d298e3c1d..fc6e97915f 100644
> --- a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
> +++ b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a36=
4313df4b21ef20c29e"
>  SRC_URI =3D " git://github.com/kward/shunit2.git;branch=3Dmaster;protoco=
l=3Dhttps"
>  SRCREV =3D "080159b303537888c5d41910b4d47a5002638e30"
>
> -
>  do_install() {
>      install -D -m 0755 ${S}/shunit2 ${D}${bindir}/shunit2
>  }
> diff --git a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb b/meta-o=
e/recipes-test/trompeloeil/trompeloeil_v47.bb
> index 3f2f07c28f..38854874aa 100644
> --- a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
> +++ b/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224c=
caecb14d942c71d31bef20d78c"
>  SRC_URI =3D "git://github.com/rollbear/trompeloeil.git;branch=3Dmain;pro=
tocol=3Dhttps"
>  SRCREV =3D "ad9bc41b1e01ae92802de59a12d19cf7c8683d6d"
>
> -
>  inherit cmake
>
>  # Header-only library
> diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb b/m=
eta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
> index 7b28d59228..6e7373def3 100644
> --- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
> +++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
> @@ -9,7 +9,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8f3499d09ee74a050c0319391ff9d=
100"
>
> -
>  DEPENDS +=3D "perl"
>
>  RDEPENDS:${PN} +=3D " \
> diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b=
/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> index 519c2ad54c..c486e01901 100644
> --- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> +++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> @@ -12,10 +12,8 @@ SRC_URI[sha256sum] =3D "adb17dac9e36cd011f5243881c9739=
417fd102fce760f8de4e9be4c713
>
>  S =3D "${UNPACKDIR}/HTML-Tagset-${PV}"
>
> -
>  inherit cpan ptest-perl
>
> -
>  RDEPENDS:${PN} +=3D "perl-module-strict perl-module-vars"
>
>  RDEPENDS:${PN}-ptest +=3D "perl-module-test"
> diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/m=
eta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> index a2c3e8a46e..4c9cecca17 100644
> --- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> +++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> @@ -8,7 +8,6 @@ SECTION =3D "devel"
>  LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D01406e4ff2e60d88d42ef1caebdd0=
011"
>
> -
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.=
gz"
>  SRC_URI[sha256sum] =3D "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6a=
aa8296ea41bf199d"
>
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0=
.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.=
bb
> index f3c6e1a016..7914e7189d 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
> @@ -27,7 +27,6 @@ do_install:append() {
>      `find ${D}/usr/lib/perl5 -type f -name .packlist`
>  }
>
> -
>  RDEPENDS:${PN} +=3D " \
>      libextutils-config-perl \
>      libextutils-helpers-perl \
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.=
2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> index 108c965968..38fb8cb6df 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> @@ -19,7 +19,6 @@ SRCNAME =3D "Module-Pluggable"
>  SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.=
gz"
>  SRC_URI[sha256sum] =3D "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc6=
4e86b9fa75c5a6df"
>
> -
>  UPSTREAM_CHECK_REGEX =3D "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"
>  UPSTREAM_CHECK_URI =3D "https://metacpan.org/release/${SRCNAME}"
>
> diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.=
9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
> index 205775ef63..6e8618a3d1 100644
> --- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
> +++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
> @@ -14,5 +14,4 @@ RDEPENDS:${PN} +=3D " \
>  SRC_URI =3D "git://github.com/MostAwesomeDude/txWS.git;branch=3Dmaster;p=
rotocol=3Dhttps"
>  SRCREV =3D "88cf6d9b9b685ffa1720644bd53c742afb10a414"
>
> -
>  inherit setuptools3
> diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3=
_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_=
0.15.19.bb
> index a6395b9e47..f7df7e9ff6 100644
> --- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.1=
9.bb
> +++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.1=
9.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "http://telepathy.freedesktop.org/releases/=
telepathy-python/telepathy-
>             file://remove_duplicate_install.patch \
>             file://telepathy-python_fix_for_automake_1.12.patch"
>
> -
>  S =3D "${UNPACKDIR}/telepathy-python-${PV}"
>
>  inherit autotools python3native
> diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb=
 b/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
> index 5d68b3e3f9..eee001ffdc 100644
> --- a/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
> @@ -4,7 +4,6 @@ SECTION =3D "devel/python"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df09eb47206614a4954c51db8a9484=
0fa"
>
> -
>  SRC_URI[sha256sum] =3D "c343bd80a0bec947a9860adb4c432ffa7db769836c64238f=
c34bdc3fec84d590"
>
>  export BUILD_SYS
> diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b=
/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> index b2834568b7..2c39dc3e75 100644
> --- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> @@ -11,5 +11,4 @@ SRCREV ?=3D "c7553c79f9222e20783fe9bd8a553f932e918072"
>
>  inherit setuptools3
>
> -
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-s=
dk-python_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-de=
vice-sdk-python_1.5.2.bb
> index 4b4ff952ef..b5b4ce4e04 100644
> --- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-pyth=
on_1.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-pyth=
on_1.5.2.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/aws/aws-iot-device-sdk-py=
thon;branch=3Dmaster;protocol
>             file://0001-setup.py-Use-setuptools-instead-of-distutils.patc=
h \
>             "
>
> -
>  inherit setuptools3
>
>  PYPI_PACKAGE =3D "AWSIoTPythonSDK"
> diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb =
b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
> index 97b59358f7..5014d5d5cb 100644
> --- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
> @@ -7,7 +7,6 @@ PV .=3D "+git${SRCREV}"
>  SRCREV =3D "9520119376046aeff73804b5f1ea05d87a63f370"
>  SRC_URI +=3D "git://github.com/behave/behave;branch=3Dmaster;protocol=3D=
https"
>
> -
>  inherit setuptools3
>
>  RDEPENDS:${PN} +=3D " \
> diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb=
 b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
> index f88d43a21a..3c6fcc0c93 100644
> --- a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
> @@ -12,7 +12,6 @@ SRC_URI +=3D " \
>          file://0001-Drop-ptests-fixtures-and-recorde_modes.patch \
>  "
>
> -
>  inherit setuptools3 ptest
>
>  RDEPENDS:${PN} +=3D " \
> diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb=
 b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
> index 288c4068cd..bbbe6c2a4a 100644
> --- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/ReFirmLabs/binwalk;protoc=
ol=3Dhttps;branch=3Dmaster"
>
>  SRCREV =3D "cddfede795971045d99422bd7a9676c8803ec5ee"
>
> -
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
>  inherit setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb =
b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
> index 4c534e1892..3ee2cd76de 100644
> --- a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
> @@ -8,7 +8,6 @@ PYPI_SRC_URI =3D "git://github.com/hbldh/bleak.git;protoc=
ol=3Dhttps;branch=3Ddevelop;d
>
>  inherit pypi python_poetry_core ptest-python-pytest
>
> -
>  RDEPENDS:${PN}-ptest +=3D " \
>         python3-pytest-asyncio \
>  "
> diff --git a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.=
0.bb b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
> index 16aa5c3477..dc38df852e 100644
> --- a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
> @@ -11,7 +11,6 @@ SRC_URI +=3D " \
>
>  SRCREV =3D "007f5aff5d1c817883385a5f61f742dd11776dc6"
>
> -
>  inherit setuptools3 ptest
>
>  RDEPENDS:${PN} +=3D " \
> diff --git a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.b=
b b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
> index 6e6e3eba31..ddaa9242b9 100644
> --- a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
> @@ -6,5 +6,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfcf6b249c26415=
40219a727f35d8d2c2"
>  SRC_URI =3D "git://github.com/fedora-python/crypt_r.git;branch=3Dmain;pr=
otocol=3Dhttps"
>  SRCREV =3D "b20e21d9f24d6fa17a6781bbc9f272ce38246eef"
>
> -
>  inherit python_setuptools_build_meta
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb =
b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
> index 78402d50f4..efb8d41025 100644
> --- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
> @@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/cvxopt/cvxopt;protocol=3Dht=
tps;branch=3Dmaster"
>
>  SRCREV =3D "3b718ee560b3b97d6255c55f0ed7f64cb4b72082"
>
> -
>  RDEPENDS:${PN} +=3D "lapack suitesparse"
>  DEPENDS +=3D "lapack suitesparse"
>
> diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/=
meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> index 7c759613ee..1022a3b2cc 100644
> --- a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/dasbus-project/dasbus.git;p=
rotocol=3Dhttps;branch=3Dmast
>  "
>  SRCREV =3D "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
>
> -
>  inherit setuptools3 ptest-python-pytest
>
>  do_install_ptest:append () {
> diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb b/=
meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> index b72d7bd401..b23a449514 100644
> --- a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/ldo/dbussy.git;branch=3Dmas=
ter;protocol=3Dhttps \
>
>  SRCREV =3D "37ede4242b48def73ada46c2747a4c5cae6abf45"
>
> -
>  inherit setuptools3
>
>  RDEPENDS:${PN} +=3D "\
> diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb b/m=
eta-python/recipes-devtools/python/python3-gcovr_8.3.bb
> index 4f0b6bb150..430a6453b3 100644
> --- a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D " \
>  "
>  SRCREV =3D "fe536afac4da31e86909191ef31708755ab8cf83"
>
> -
>  inherit python_hatchling
>
>  DEPENDS +=3D " \
> diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.1=
.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
> index 368b9e49b7..0d556d5842 100644
> --- a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
> @@ -12,7 +12,6 @@ do_install_ptest:append () {
>         cp -f ${S}/test_inflection.py ${D}${PTEST_PATH}/
>  }
>
> -
>  RDEPENDS:${PN} +=3D "python3-pytest"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b=
/meta-python/recipes-devtools/python/python3-inotify_git.bb
> index e8d88250a3..df8f8a65c7 100644
> --- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
> +++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D " \
>
>  SRCREV =3D "9be6a51d1660991562eefaaddefa757ca0e0e00f"
>
> -
>  inherit setuptools3 ptest-python-pytest
>
>  RDEPENDS:${PN} +=3D " \
> diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.=
0.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
> index 99f583e717..04b069885b 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/explodinglabs/jsonrpcclient=
.git;branch=3Dmain;protocol
>
>  inherit python_setuptools_build_meta
>
> -
>  RDEPENDS:${PN} +=3D "\
>      python3-json \
>      python3-math \
> diff --git a/meta-python/recipes-devtools/python/python3-keras-applicatio=
ns_1.0.8.bb b/meta-python/recipes-devtools/python/python3-keras-application=
s_1.0.8.bb
> index ce965b3e43..7488a25d95 100644
> --- a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.=
8.bb
> +++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.=
8.bb
> @@ -9,7 +9,6 @@ SRCREV ?=3D "3b180cb10eda683dda7913ecee2e6487288d292d"
>
>  inherit setuptools3
>
> -
>  BBCLASSEXTEND =3D "native"
>
>  RDEPENDS:${PN} =3D "python3-numpy \
> diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/=
meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
> index 4cdc773ba6..9838e4decf 100644
> --- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
> @@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3D=
https;branch=3Dstable \
>
>  SRCREV =3D "20d74dcd30f143abbd1aa94c76bafc5bd934d5bd"
>
> -
>  PACKAGES +=3D "${PN}-examples"
>  FILES:${PN}-examples =3D "/usr/share/kivy-examples"
>
> diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7=
.3.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
> index 26da91b16b..9e103fea08 100644
> --- a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6855782848d5=
72347212f667a2d637"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/libs/python/python-linux-procf=
s/python-linux-procfs.git;branch=3Dmain"
>  SRCREV =3D "59ecd1ba018141a02ffe59c16a9346991dfd0d48"
>
> -
>  inherit setuptools3
>
>  RDEPENDS:${PN} +=3D "python3-six"
> diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb=
 b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
> index b801c5d731..35e61f4732 100644
> --- a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
> @@ -8,5 +8,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907=
fdace235a619d80314"
>  SRCREV =3D "80681f6604e136e513550342f977edb98f5fc5ad"
>  SRC_URI =3D "git://github.com/atdt/monotonic.git;branch=3Dmaster;protoco=
l=3Dhttps"
>
> -
>  inherit setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb=
 b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
> index b9b7a74e6e..b1be599bd2 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
> @@ -60,7 +60,6 @@ RDEPENDS:${PN}-ptest +=3D " \
>
>  CVE_PRODUCT =3D "pillow"
>
> -
>  RPROVIDES:${PN} +=3D "python3-imaging"
>
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb b=
/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
> index 53996cc231..813b336235 100644
> --- a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
> @@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/M0r13n/pyais;protocol=3Dhtt=
ps;branch=3Dmaster"
>  PV .=3D "+git"
>  SRCREV =3D "e7780f743b03c5e6ecc651fdeb209fa94e0e0250"
>
> -
>  inherit python_setuptools_build_meta ptest-python-pytest
>
>  PYPI_PACKAGE =3D "pyais"
> diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.b=
b b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
> index cb9b61bd66..daf9152577 100644
> --- a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
> @@ -10,7 +10,6 @@ DEPENDS =3D "python3-dbus-native glib-2.0 dbus-glib lib=
xml2 atk gtk+ python3-pygob
>  SRC_URI =3D "git://github.com/GNOME/pyatspi2.git;protocol=3Dhttps;branch=
=3Dmaster"
>  SRCREV =3D "8c69016b38d0e4caaf4c986938ea3410fb7351b6"
>
> -
>  # Same restriction as gtk+
>  inherit features_check setuptools3
>  ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.=
bb b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> index 7d71767297..f5c0ccfd09 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "\
>      git://github.com/pybind/pybind11.git;branch=3Dstable;protocol=3Dhttp=
s \
>  "
>
> -
>  inherit cmake python_setuptools_build_meta
>
>  EXTRA_OECMAKE =3D "-DPYBIND11_TEST=3DOFF -DPYBIND11_USE_CROSSCOMPILING=
=3DON"
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.=
bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
> index 47c077853a..3bd7059ed2 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
> @@ -15,7 +15,6 @@ SRCREV =3D "bce81efdeac1cbefd0196b478a32aa2586bd595a"
>  PV .=3D "+git"
>  SRC_URI =3D "git://github.com/pydantic/pydantic;protocol=3Dhttps;branch=
=3Dmain"
>
> -
>  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
>
>  RECIPE_NO_UPDATE_REASON =3D "Must be updated in sync with python3-pydant=
ic-core."
> diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb =
b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> index 5a1934383e..9c56a04fcc 100644
> --- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D " \
>
>  inherit ptest setuptools3
>
> -
>  RDEPENDS:${PN} =3D "python3-pygobject \
>                    python3-io \
>                    python3-logging"
> diff --git a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.b=
b b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> index 58f571be3f..903c03f730 100644
> --- a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> @@ -10,7 +10,6 @@ inherit python_setuptools_build_meta
>  SRC_URI =3D "git:///github.com/russhousley/pyhsslms.git;branch=3Dmaster;=
protocol=3Dhttps"
>  SRCREV =3D "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
>
> -
>  RDEPENDS:${PN} +=3D " \
>      python3-core \
>      python3-crypt \
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb =
b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
> index 04761471d3..7afcb50bd0 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
> @@ -12,7 +12,6 @@ SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=
=3Dmaintenance/3.3.x;protocol
>
>  inherit python_setuptools_build_meta ptest
>
> -
>  RDEPENDS:${PN} +=3D "\
>      python3-astroid \
>      python3-difflib \
> diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.b=
b b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
> index e05b63587f..a2c48e6a61 100644
> --- a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
> @@ -20,7 +20,6 @@ SRCREV =3D "57db64c9f65ced05c71b8d786c1cedfaa2991597"
>
>  SRC_URI:append:mips =3D " file://0001-check-for-mips-targets-for-stat.st=
_dev-definitions.patch;patchdir=3D${UNPACKDIR}/cargo_home/bitbake/libsystem=
d-0.5.0/"
>
> -
>  inherit python_setuptools3_rust cargo-update-recipe-crates
>
>  # crossbeam-* -> std::sync::atomic AtomicI64, AtomicU64
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2=
.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
> index 41ebe44dbd..63bbeecf16 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
> @@ -9,7 +9,6 @@ SRC_URI =3D " \
>              git://github.com/tanbro/pyyaml-include;protocol=3Dhttps;bran=
ch=3Dmain \
>            "
>
> -
>  inherit python_setuptools_build_meta ptest-python-pytest
>
>  do_compile:prepend() {
> diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb b/m=
eta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
> index 2fb0bff29f..32d8fe0551 100644
> --- a/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
> @@ -24,7 +24,6 @@ ALTERNATIVE_LINK_NAME[pyrsa-sign] =3D "${bindir}/pyrsa-=
sign"
>  ALTERNATIVE_LINK_NAME[pyrsa-verify] =3D "${bindir}/pyrsa-verify"
>  ALTERNATIVE_PRIORITY =3D "30"
>
> -
>  RDEPENDS:${PN} +=3D "\
>      python3-compression \
>      python3-crypt \
> diff --git a/meta-python/recipes-devtools/python/python3-schedutils_0.6.b=
b b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
> index dba3bcace7..48b9eeaf54 100644
> --- a/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
> @@ -7,5 +7,4 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c23=
36e835926c2166c28b"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/libs/python/python-schedutils/=
python-schedutils.git;branch=3Dmain"
>  SRCREV =3D "46469f425f9844f355f6496785ee1ce993b58747"
>
> -
>  inherit setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b=
/meta-python/recipes-devtools/python/python3-systemd_235.bb
> index 3abea5f5f2..0e923bc35c 100644
> --- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
> +++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
> @@ -3,7 +3,6 @@ HOMEPAGE =3D "https://github.com/systemd/python-systemd"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fbd65380cdd255951079008b=
364516c"
>
> -
>  PYPI_PACKAGE =3D "systemd-python"
>  SRC_URI:append:libc-musl =3D " file://0001-Provide-implementation-of-str=
ndupa-for-musl.patch"
>  SRC_URI[sha256sum] =3D "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71=
c8c6b8008e695c0a"
> diff --git a/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
> index ea364ae8f6..811113402c 100644
> --- a/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
> @@ -8,7 +8,6 @@ PYPI_SRC_URI =3D "git://github.com/hukkin/tomli-w.git;pro=
tocol=3Dhttps;branch=3Dmaster
>
>  inherit pypi python_flit_core ptest-python-pytest
>
> -
>  RDEPENDS:${PN}-ptest +=3D " \
>          python3-tomli \
>  "
> diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.=
12.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
> index 09732fc865..9c6c598182 100644
> --- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
> @@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/theopolis/uefi-firmware-p=
arser;protocol=3Dhttps;branch
>
>  SRCREV =3D "0c5fb74bcecc0e5c80625c38130fe948c2a3656e"
>
> -
>  inherit setuptools3
>
>  RDEPENDS:${PN} +=3D " \
> diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb =
b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
> index 3a187f9386..c0bee7c9ce 100644
> --- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
> @@ -12,7 +12,6 @@ SRCREV =3D "bcc1f26b2fe8fc962f5033c3a3a773425500789a"
>  SRC_URI +=3D "git://github.com/GrahamDumpleton/wrapt;protocol=3Dhttps;br=
anch=3Dmaster \
>  "
>
> -
>  # python3-misc for 'this' module
>  RDEPENDS:${PN}-ptest +=3D " \
>         python3-misc \
> diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/=
meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> index 4707e31854..12ba2c82f3 100644
> --- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> @@ -8,12 +8,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D00ea1e843a43=
c20d9b63a8112239b0d1"
>
>  SRC_URI[sha256sum] =3D "f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d=
013c9aef274d0c88"
>
> -
>  SRC_URI =3D "git://github.com/python-excel/xlrd.git;branch=3Dmaster;prot=
ocol=3Dhttps \
>  "
>  SRCREV =3D "b8d573e11ec149da695d695c81a156232b89a949"
>
> -
>  inherit ptest-python-pytest setuptools3
>
>  RDEPENDS:${PN} +=3D " \
> diff --git a/meta-python/recipes-devtools/python3-piccata/python3-piccata=
_2.0.3.bb b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.=
0.3.bb
> index af231ca908..1ae5b292a0 100644
> --- a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.=
bb
> +++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.=
bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De664eb75e2791c=
2e505e6e1c274e6d4f"
>  SRCREV =3D "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
>  SRC_URI =3D "git://github.com/NordicSemiconductor/piccata.git;protocol=
=3Dhttps;branch=3Dmaster"
>
> -
>  inherit setuptools3
>
>  RDEPENDS:${PN} +=3D "python3-core python3-datetime python3-io python3-lo=
gging python3-math"
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui=
_2.6.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.=
6.0.bb
> index 79bee63d08..1346c55371 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.=
bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.=
bb
> @@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>  SRC_URI =3D "git://github.com/storaged-project/blivet-gui.git;branch=3Dm=
ain;protocol=3Dhttps"
>  SRCREV =3D "7cec4bd48af4c8f7beb1a74bac751c3d520dedf1"
>
> -
>  inherit features_check setuptools3
>  REQUIRED_DISTRO_FEATURES =3D "x11 systemd gobject-introspection-data"
>
> diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb=
 b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> index 4ffe68aab6..73df5691b2 100644
> --- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> +++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
> @@ -12,7 +12,6 @@ SRCREV =3D "69090778bccc5ed124342ba288597fbb2bfa9f39"
>  SRC_URI =3D "git://github.com/gt3389b/python-cson.git;branch=3Dmaster;pr=
otocol=3Dhttps \
>             file://0001-setup.py-Do-not-poke-at-git-describe-to-find-vers=
ion.patch"
>
> -
>  RDEPENDS:${PN} =3D "python3-json"
>
>  inherit setuptools3
> diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb =
b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
> index 80f9881b58..81775d693f 100644
> --- a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
> +++ b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>
>  inherit setuptools3_legacy
>
> -
>  SRC_URI =3D "git://github.com/rhinstaller/python-meh.git;protocol=3Dhttp=
s;branch=3Dmaster"
>
>  SRCREV =3D "f0fcc3ce1943dce9cf958f4a2f7398daff619c9f"
> diff --git a/meta-python/recipes-extended/tuna/tuna_0.19.bb b/meta-python=
/recipes-extended/tuna/tuna_0.19.bb
> index 643e3a09ff..66810493a1 100644
> --- a/meta-python/recipes-extended/tuna/tuna_0.19.bb
> +++ b/meta-python/recipes-extended/tuna/tuna_0.19.bb
> @@ -7,7 +7,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/tuna/tuna=
.git;branch=3Dmain"
>
>  SRCREV =3D "b972b8ce386c29bcbcd45029a617db3db9e5b6ca"
>
> -
>  RDEPENDS:${PN} +=3D " \
>      python3-io \
>      python3-linux-procfs \
> diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2=
.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
> index f0653006a3..1601dd891a 100644
> --- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
> +++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
> @@ -16,7 +16,6 @@ SRCREV =3D "3c7e281d97fd3e70b25f7ff4a001eabd56e375d7"
>
>  CVE_STATUS[CVE-2016-1000229] =3D "fixed-version: fixed since 2.2.1"
>
> -
>  do_install() {
>      install -d ${D}${localstatedir}/www/openapi/static
>      cp -r ${S}/dist/* ${D}${localstatedir}/www/openapi/static
> diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git=
.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> index b93fa2d186..d44a741fa4 100644
> --- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> +++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> @@ -17,7 +17,6 @@ SRCREV =3D "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
>
>  PV =3D "0.1.2+git"
>
> -
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
>
>  EXTRA_OECONF =3D "APACHECTL=3D${STAGING_DIR_TARGET}${sbindir}/apachectl"
> diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb b/m=
eta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
> index aca6d598f8..0b9247c82a 100644
> --- a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
> +++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
> @@ -8,7 +8,6 @@ DEPENDS =3D "apache2 avahi"
>  SRC_URI =3D "git://git.0pointer.net/mod_dnssd.git;protocol=3Dhttps;branc=
h=3Dmaster"
>  SRCREV =3D "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
>
> -
>  EXTRA_OECONF =3D "--disable-lynx"
>
>  inherit autotools pkgconfig
> diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/met=
a-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> index 9ff1772531..c6a0e855e9 100644
> --- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> +++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> @@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/blueness/${BPN};branch=3D=
master;protocol=3Dhttps \
>  UPSTREAM_CHECK_URI =3D "https://github.com/blueness/sthttpd/releases/"
>  UPSTREAM_CHECK_REGEX =3D "v(?P<pver>\d+(\.\d+)+).tar.gz"
>
> -
>  inherit autotools update-rc.d systemd update-alternatives
>
>  ALTERNATIVE_PRIORITY =3D "100"
> diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webse=
rver/recipes-support/fcgi/fcgi_git.bb
> index 03425c53c9..e77ed60d7a 100644
> --- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
> +++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
> @@ -9,7 +9,6 @@ PV =3D "2.4.2"
>  SRC_URI =3D "git://github.com/FastCGI-Archives/fcgi2.git;protocol=3Dhttp=
s;branch=3Dmaster \
>            "
>
> -
>  inherit autotools
>
>  PARALLEL_MAKE =3D ""
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb b/met=
a-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
> index 61a94f7bf4..b344802b38 100644
> --- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
> @@ -10,7 +10,6 @@ DEPENDS =3D "gtk+3 glib-2.0 xfce4-dev-tools-native intl=
tool-native"
>  SRC_URI =3D "git://github.com/ib/xarchiver.git;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "55f923ebc623bcc8f53368543847350a23688189"
>
> -
>  inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-x=
dg
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-=
setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datet=
ime-setter_3.32.2.bb
> index 308da40c34..63c7301413 100644
> --- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_=
3.32.2.bb
> +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_=
3.32.2.bb
> @@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/schnitzeltony/xfce4-datet=
ime-setter.git;protocol=3Dhtt
>  "
>  SRCREV =3D "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
>
> -
>  inherit gettext meson features_check pkgconfig
>
>  REQUIRED_DISTRO_FEATURES =3D "systemd x11"
> diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb b=
/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
> index 59de3b3a08..9fabd38ef9 100644
> --- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
> +++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
> @@ -22,7 +22,6 @@ SRC_URI =3D "git://gitlab.com/tagoh/imsettings.git;prot=
ocol=3Dhttps;branch=3Dmain \
>            "
>  SRCREV =3D "27d84c88831ef76397a15891ba0738ce9a83902a"
>
> -
>  do_configure:prepend() {
>      cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
>  }
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb b/met=
a-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
> index b2dd9dfa79..abb70381b0 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
> @@ -24,7 +24,6 @@ PACKAGECONFIG ??=3D " \
>  PACKAGECONFIG[gladeui2] =3D "--enable-gladeui2,--disable-gladeui2,glade"
>  PACKAGECONFIG[x11] =3D "--enable-startup-notification,--disable-startup-=
notification,libepoxy libice libsm startup-notification"
>
> -
>  PACKAGES +=3D "${PN}-glade"
>  FILES:${PN}-glade =3D " \
>      ${libdir}/glade \
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-exten=
ded.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> index 500719a8f6..d0e731b374 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> @@ -1,7 +1,6 @@
>  SUMMARY =3D "All packages for full XFCE installation"
>  SECTION =3D "x11/wm"
>
> -
>  inherit packagegroup features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> --
> 2.43.0
>

