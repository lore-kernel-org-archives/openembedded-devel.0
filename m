Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A49C7EE2A
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 17:16:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.580.1750699004052330701
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 10:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1QM2GeB;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b16a0e38so4711123e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750699002; x=1751303802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIvaq6WnevKLIHQPwoZL202q53xaVfZU2RXCAhGoVRs=;
        b=M1QM2GeBBdkJToHrfH75kZdEGS4FsgyhL1UONNxQSrEKbfQ8n80Vuch9vTQwVgzbHZ
         CJSJGvBLWir/hRvMyP0fGU3UXry2MaDWS8kgfZ3ATDVLYZ7VKceGGDpB5qqSYsQJynIp
         bkwufdNv3ZPtbF19zl3rGo26kWKlSjS3d3IqOJw55Lb7oN7ehanntB6Q209Hr1A9AODJ
         g2e2SHcB/1kZLpUpejv/sb3dbCne7fSmNjTIYEbf5V1GzPE/3KzqMnkjlfibUSH9tqfI
         SP8ACF1FFGSftD3EkvOi9lWeW8zdeLZ/jlgutnQWX92SF4ymFe7IzZjI/rxnmVabnfQy
         34zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750699002; x=1751303802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIvaq6WnevKLIHQPwoZL202q53xaVfZU2RXCAhGoVRs=;
        b=Izz6uYFoahrID6+5aCRjWA7uwT7cyzd8qcY0nOLCJHfAoOcnOhpfePkQKwZh+Z3H08
         hdZPDIk5D02LrGM3KSrFGz3nzOrUR29puFyvfWwFXNHyx6Ljj50Uk3LXfO66VvbvTNvc
         Oc3O71KI6pdiwWsvnOG4KtnsGLuhKLjaN0qcEFrQczxmupDbnoWIBRTOP0M/NgXCsvjh
         rpP01Fc2Cx1N+6rz5aKUnORXHLtv3BDKwVpbI92inDjEyeyXwCu+syiJjgqnYMcRI0w9
         /QE5YEziYg36oj86YEdnsRe9nnidDUjER9pF0ZBvnVbW1sgwaf5rKlj0UOjwjxN4I6Am
         Kr/Q==
X-Gm-Message-State: AOJu0Yx0GcMn+vNBb03U/YUZ/SDBCu5bZdYmT8GC5OD6a/zU1ethLwct
	mhn3BvZdVE4yev3VayxiwZQ/ahMF7G023pszqPyvfsJWrSvrzVSm54TIvy/A5A==
X-Gm-Gg: ASbGncvayCVVCh+/VTf/BUJ5yTgRqULklybD3ve/3ne3RU0F4YveiyOpOgPqk0CfkMV
	RRhpeG/Hh+4xERV2LTH+R8s/oaHCtgD0yB05tamt1WCfqxkLIAL737u8qGaKRzN1Ain4ExBrNJJ
	LrKYWn1rBGLgnsApmKOKB02fuWDyEmaRkkKsA9Vg+GA0gAyNCMTgzSzqrnkCDcA9cBsoPnlHaQT
	1jvwO8H7MczclzW1shj+x1A3UG4SEFwQzPDfRa+tuipBy6LHhPCyGzd0xNwLGXkO3YQlnaWQ7ot
	SeL7GYEWUKnPG4rqsucMLy8Y1/gEAYd7AXT1nyPU3vbMZhXUvSvYJDqP4/jxzqbTNU0VAujAWbC
	td9LYtQrV0VN8AQ==
X-Google-Smtp-Source: AGHT+IE+Pk+tE0ob1IaY5WJY7aRwLc6QdcHj5uktDPwXTDB8kQsMvy7X9wmD9dFxNZy75HvkhsjI/g==
X-Received: by 2002:a05:6512:3a95:b0:553:aaf1:f63d with SMTP id 2adb3069b0e04-553e3cfd76fmr3423306e87.29.1750699000267;
        Mon, 23 Jun 2025 10:16:40 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2d71sm1451817e87.142.2025.06.23.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:16:38 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCHv2] Remove consecutive blank lines from recipes
Date: Mon, 23 Jun 2025 20:16:32 +0300
Message-ID: <20250623171632.396599-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 17:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118087

Some of them were introduced by mass-removal of S = WORKDIR/git assignments;
rather than try to fix up (or redo) just these, I've run this sed command over
the whole tree:

sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name *.bb -o -name *.inc`

The rationale is that more than one empty line is wasting vertical screen space, and
does nothing for readability.

Note: This follows a similar change in oe-core, and explanation comes from Alex Kanavin.

https://git.openembedded.org/openembedded-core/commit/?id=cedc4ff7c9bcfb22a20e43e47f9759f4007a4f1a

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../recipes-filesystems/logfsprogs/logfsprogs_git.bb        | 1 -
 meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb     | 1 -
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb            | 1 -
 .../recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb    | 1 -
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb          | 1 -
 meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb       | 1 -
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb   | 1 -
 meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb       | 1 -
 .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb  | 1 -
 meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb     | 1 -
 .../recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb           | 1 -
 meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb       | 1 -
 meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb | 1 -
 .../recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb     | 1 -
 .../recipes-utils/ufs-utils/ufs-utils_6.14.11.bb            | 1 -
 .../recipes-utils/xfstests/xfstests_2025.04.27.bb           | 1 -
 .../recipes-extended/polkit-gnome/polkit-gnome_0.105.bb     | 1 -
 meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb                  | 1 -
 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb           | 1 -
 meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb       | 1 -
 meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb              | 1 -
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb       | 1 -
 meta-gnome/recipes-gnome/eog/eog_47.0.bb                    | 1 -
 meta-gnome/recipes-gnome/evince/evince_48.0.bb              | 1 -
 .../evolution-data-server/evolution-data-server.bb          | 1 -
 meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb    | 1 -
 meta-gnome/recipes-gnome/gdm/gdm_48.0.bb                    | 1 -
 meta-gnome/recipes-gnome/gedit/gedit_46.2.bb                | 1 -
 meta-gnome/recipes-gnome/ghex/ghex_46.2.bb                  | 1 -
 meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb                  | 1 -
 .../gnome-disk-utility/gnome-disk-utility_46.1.bb           | 1 -
 .../gnome-font-viewer/gnome-font-viewer_48.0.bb             | 1 -
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb  | 1 -
 .../recipes-gnome/gnome-session/gnome-session_47.0.1.bb     | 1 -
 .../gnome-settings-daemon/gnome-settings-daemon_48.0.bb     | 1 -
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb    | 1 -
 .../gnome-system-monitor/gnome-system-monitor_48.1.bb       | 1 -
 .../gnome-text-editor/gnome-text-editor_48.1.bb             | 1 -
 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb  | 1 -
 .../recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb | 1 -
 meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb             | 1 -
 .../recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb    | 1 -
 .../recipes-gnome/libchamplain/libchamplain_0.12.21.bb      | 1 -
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb     | 1 -
 meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb        | 1 -
 meta-gnome/recipes-gnome/mutter/mutter_48.0.bb              | 1 -
 meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb          | 1 -
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                 | 1 -
 meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb                 | 1 -
 meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb       | 2 --
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb                  | 1 -
 .../packagegroups/packagegroup-core-clutter.bb              | 1 -
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb       | 1 -
 meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb       | 1 -
 meta-initramfs/recipes-devtools/dracut/dracut_106.bb        | 1 -
 .../recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb           | 1 -
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb           | 1 -
 meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb   | 1 -
 .../recipes-connectivity/libupnp/libupnp_1.14.18.bb         | 1 -
 meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb             | 1 -
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb      | 1 -
 meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb        | 1 -
 .../recipes-mkv/libmatroska/libmatroska_1.7.1.bb            | 1 -
 meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb        | 1 -
 .../recipes-multimedia/bluealsa/bluealsa_4.3.0.bb           | 1 -
 meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb     | 1 -
 meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb      | 1 -
 meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb | 1 -
 meta-multimedia/recipes-multimedia/flite/flite_2.2.bb       | 1 -
 .../recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb       | 1 -
 meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb | 1 -
 .../recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb     | 1 -
 meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 1 -
 .../recipes-multimedia/libcamera/libcamera_0.4.0.bb         | 1 -
 .../recipes-multimedia/libde265/libde265_1.0.15.bb          | 1 -
 .../recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb         | 1 -
 .../recipes-multimedia/libsquish/libsquish_git.bb           | 1 -
 meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb   | 1 -
 meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb   | 1 -
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc    | 1 -
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb    | 1 -
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb    | 1 -
 .../recipes-multimedia/mycroft/mycroft_19.8.1.bb            | 1 -
 .../recipes-multimedia/openal/openal-soft_1.24.3.bb         | 1 -
 .../recipes-multimedia/pipewire/pipewire_1.4.5.bb           | 1 -
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb | 1 -
 meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb   | 1 -
 .../recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb           | 1 -
 .../recipes-multimedia/tremor/tremor_20180319.bb            | 1 -
 .../recipes-multimedia/wireplumber/wireplumber_0.5.10.bb    | 1 -
 .../recipes-support/crossguid/crossguid_0.2.2.bb            | 1 -
 .../recipes-support/gst-instruments/gst-instruments_git.bb  | 1 -
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb    | 1 -
 meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb    | 1 -
 meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb   | 1 -
 meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb | 1 -
 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb   | 1 -
 .../recipes-connectivity/bluez-tools/bluez-tools_git.bb     | 1 -
 .../recipes-connectivity/cannelloni/cannelloni_1.1.0.bb     | 1 -
 .../recipes-connectivity/civetweb/civetweb_1.16.bb          | 1 -
 meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb   | 1 -
 meta-networking/recipes-connectivity/dibbler/dibbler_git.bb | 1 -
 .../recipes-connectivity/freeradius/freeradius_3.2.7.bb     | 1 -
 .../recipes-connectivity/libdnet/libdnet_1.18.0.bb          | 1 -
 .../recipes-connectivity/libiec61850/libiec61850_1.5.3.bb   | 1 -
 .../recipes-connectivity/nanomsg/nanomsg_1.2.1.bb           | 1 -
 meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb   | 1 -
 meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb   | 1 -
 .../networkmanager/networkmanager_1.52.0.bb                 | 4 ----
 .../recipes-connectivity/openconnect/openconnect_9.12.bb    | 1 -
 .../openfortivpn/openfortivpn_1.23.1.bb                     | 1 -
 .../recipes-connectivity/openthread/ot-daemon_git.bb        | 1 -
 .../recipes-connectivity/openthread/wpantund_git.bb         | 1 -
 meta-networking/recipes-connectivity/relayd/relayd_git.bb   | 1 -
 .../recipes-connectivity/sethdlc/sethdlc_1.18.bb            | 3 ---
 .../recipes-connectivity/snort/snort3_3.7.1.0.bb            | 1 -
 meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb      | 1 -
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb     | 1 -
 .../recipes-connectivity/wolfssl/wolfssl_5.8.0.bb           | 1 -
 meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb        | 2 --
 meta-networking/recipes-daemons/ippool/ippool_1.3.bb        | 2 --
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb   | 1 -
 .../networkd-dispatcher/networkd-dispatcher_2.2.4.bb        | 1 -
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb    | 1 -
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb    | 2 --
 meta-networking/recipes-daemons/vblade/vblade_25.bb         | 1 -
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb      | 1 -
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb   | 1 -
 .../recipes-devtools/python/python3-scapy_2.6.0.bb          | 1 -
 .../recipes-extended/kronosnet/kronosnet_1.24.bb            | 1 -
 meta-networking/recipes-extended/tgt/tgt_1.0.90.bb          | 1 -
 .../arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb  | 1 -
 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb   | 1 -
 .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb | 1 -
 .../recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb       | 1 -
 meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb   | 1 -
 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb       | 1 -
 meta-networking/recipes-irc/znc/znc_1.8.2.bb                | 1 -
 .../wireguard/wireguard-module_1.0.20220627.bb              | 1 -
 meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb   | 1 -
 .../recipes-protocols/freediameter/freediameter_1.5.0.bb    | 1 -
 meta-networking/recipes-protocols/frr/frr_10.3.bb           | 2 --
 meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb | 1 -
 meta-networking/recipes-protocols/openflow/openflow_git.bb  | 1 -
 .../recipes-protocols/openlldp/openlldp_1.1.1.bb            | 1 -
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb | 1 -
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb    | 1 -
 meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb  | 1 -
 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb   | 1 -
 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb  | 1 -
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb      | 1 -
 meta-networking/recipes-support/celt051/celt051_git.bb      | 1 -
 meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb      | 1 -
 meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb   | 1 -
 .../recipes-support/dropwatch/dropwatch_1.5.4.bb            | 1 -
 .../recipes-support/ettercap/ettercap_0.8.3.1.bb            | 1 -
 meta-networking/recipes-support/geoip/geoip-perl_1.51.bb    | 1 -
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb       | 2 --
 .../recipes-support/http-parser/http-parser_2.9.4.bb        | 1 -
 meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb | 1 -
 meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb      | 1 -
 meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb     | 1 -
 meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb  | 1 -
 .../recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb     | 1 -
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb        | 1 -
 meta-networking/recipes-support/mctp/mctp_2.1.bb            | 1 -
 .../recipes-support/mdio-tools/mdio-netlink_1.3.1.bb        | 1 -
 .../recipes-support/mdio-tools/mdio-tools_1.3.1.bb          | 1 -
 meta-networking/recipes-support/mtr/mtr_0.95.bb             | 1 -
 meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb    | 1 -
 meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb    | 1 -
 meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb      | 1 -
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb      | 1 -
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb        | 1 -
 meta-networking/recipes-support/netperf/netperf_git.bb      | 1 -
 .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb        | 1 -
 meta-networking/recipes-support/nis/yp-tools_4.2.3.bb       | 1 -
 meta-networking/recipes-support/ntimed/ntimed_git.bb        | 1 -
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb          | 1 -
 meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb      | 1 -
 meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb         | 1 -
 .../recipes-support/open-isns/open-isns_0.102.bb            | 1 -
 meta-networking/recipes-support/phytool/phytool.bb          | 1 -
 meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb  | 1 -
 meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb      | 1 -
 meta-networking/recipes-support/spice/libcacard_2.8.1.bb    | 1 -
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb     | 1 -
 .../recipes-support/spice/spice-guest-vdagent_0.22.1.bb     | 1 -
 .../recipes-support/spice/spice-protocol_0.14.4.bb          | 1 -
 meta-networking/recipes-support/spice/spice_git.bb          | 1 -
 meta-networking/recipes-support/spice/usbredir_0.14.0.bb    | 1 -
 .../recipes-support/strongswan/strongswan_6.0.1.bb          | 1 -
 meta-networking/recipes-support/unbound/unbound_1.22.0.bb   | 1 -
 meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb    | 1 -
 .../recipes-support/wpan-tools/wpan-tools_0.10.bb           | 1 -
 .../meta-python/recipes-bsp/rwmem/rwmem_1.2.bb              | 1 -
 .../recipes-connectivity/netplan/netplan_1.1.2.bb           | 1 -
 .../thingsboard-gateway/thingsboard-gateway_3.7.4.bb        | 1 -
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb          | 1 -
 .../meta-python/recipes-devtools/nanopb/nanopb.inc          | 1 -
 .../meta-python/recipes-extended/lcdproc/lcdproc_git.bb     | 1 -
 .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb       | 1 -
 .../meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb    | 1 -
 .../recipes-graphics/taisei/taisei_1.4.2.bb                 | 1 -
 .../perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb | 1 -
 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb        | 1 -
 meta-oe/recipes-benchmark/fio/fio_3.39.bb                   | 1 -
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb            | 1 -
 meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb             | 1 -
 meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb      | 1 -
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb | 1 -
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb         | 1 -
 meta-oe/recipes-benchmark/mbw/mbw_2.0.bb                    | 1 -
 meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb             | 1 -
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb            | 1 -
 .../recipes-benchmark/stressapptest/stressapptest_1.0.11.bb | 1 -
 meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb       | 1 -
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb  | 1 -
 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb        | 1 -
 meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb                      | 1 -
 meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb              | 1 -
 meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb        | 2 --
 .../dediprog-flasher/dediprog-flasher_1.14.20.bb            | 1 -
 meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb            | 1 -
 meta-oe/recipes-bsp/firmwared/firmwared_git.bb              | 1 -
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb                   | 1 -
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb                    | 1 -
 meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb                   | 1 -
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb           | 2 --
 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb          | 1 -
 meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb  | 1 -
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb         | 1 -
 meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb         | 1 -
 meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb        | 1 -
 meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb      | 1 -
 meta-oe/recipes-connectivity/libnet/libnet_1.3.bb           | 1 -
 meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb        | 1 -
 .../recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb   | 1 -
 .../libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb     | 1 -
 .../recipes-connectivity/libtorrent/libtorrent_0.14.0.bb    | 1 -
 .../modemmanager/modemmanager_1.22.0.bb                     | 1 -
 .../recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb  | 1 -
 .../paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb                    | 1 -
 .../recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb | 1 -
 .../recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb    | 1 -
 meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb    | 1 -
 meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb  | 1 -
 .../recipes-connectivity/transmission/transmission_4.0.6.bb | 1 -
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb         | 1 -
 meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb        | 1 -
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb             | 1 -
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb          | 1 -
 meta-oe/recipes-core/emlog/emlog_git.bb                     | 2 --
 meta-oe/recipes-core/glfw/glfw_3.3.8.bb                     | 1 -
 meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb              | 1 -
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb                   | 1 -
 meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb         | 2 --
 meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb           | 1 -
 meta-oe/recipes-core/ndctl/ndctl_v79.bb                     | 1 -
 meta-oe/recipes-core/opencl/clpeak_1.1.4.bb                 | 1 -
 meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 1 -
 meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb      | 1 -
 meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb        | 1 -
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 1 -
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb    | 1 -
 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb     | 1 -
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb  | 1 -
 meta-oe/recipes-core/pim435/pim435_git.bb                   | 1 -
 .../recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb    | 1 -
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb           | 1 -
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb | 1 -
 meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb    | 1 -
 meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb                  | 1 -
 meta-oe/recipes-dbs/mysql/mariadb.inc                       | 2 --
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb               | 1 -
 .../recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb    | 1 -
 meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb       | 1 -
 .../android-tools/android-tools_5.1.1.r37.bb                | 1 -
 meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb          | 1 -
 meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb    | 1 -
 meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb              | 1 -
 .../recipes-devtools/concurrencykit/concurrencykit_git.bb   | 1 -
 meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb     | 1 -
 meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb      | 1 -
 .../recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb   | 1 -
 meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb          | 1 -
 meta-oe/recipes-devtools/exprtk/exprtk_git.bb               | 1 -
 meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb   | 1 -
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb         | 1 -
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb               | 1 -
 meta-oe/recipes-devtools/glade/glade_3.36.0.bb              | 6 ------
 meta-oe/recipes-devtools/guider/guider_3.9.9.bb             | 1 -
 meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb       | 1 -
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb         | 1 -
 .../json-schema-validator/json-schema-validator_2.2.0.bb    | 1 -
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb           | 1 -
 meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb           | 1 -
 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb           | 1 -
 .../kconfig-frontends/kconfig-frontends_4.11.0.1.bb         | 1 -
 meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb              | 1 -
 meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb     | 1 -
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb       | 1 -
 meta-oe/recipes-devtools/libubox/libubox_git.bb             | 1 -
 meta-oe/recipes-devtools/lshw/lshw_02.20.bb                 | 1 -
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb               | 1 -
 meta-oe/recipes-devtools/luajit/luajit_git.bb               | 1 -
 meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb         | 1 -
 meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb             | 1 -
 .../recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb   | 1 -
 meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb         | 1 -
 meta-oe/recipes-devtools/musl/musl-nscd_git.bb              | 1 -
 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb | 1 -
 .../recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb  | 3 ---
 .../packagegroups/packagegroup-sdk-target.bb                | 1 -
 meta-oe/recipes-devtools/pahole/pahole_1.29.bb              | 1 -
 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb               | 1 -
 meta-oe/recipes-devtools/perl/exiftool_12.89.bb             | 1 -
 meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb         | 1 -
 meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb       | 1 -
 meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb        | 1 -
 meta-oe/recipes-devtools/ply/ply_git.bb                     | 1 -
 meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb         | 1 -
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb       | 1 -
 meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb        | 1 -
 meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb        | 1 -
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb         | 1 -
 meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb   | 1 -
 meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb          | 1 -
 meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb       | 1 -
 .../squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb            | 1 -
 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb             | 1 -
 meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb  | 1 -
 .../unattended-upgrades/unattended-upgrades_2.9.1.bb        | 1 -
 meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb         | 1 -
 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb                | 1 -
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                 | 1 -
 meta-oe/recipes-devtools/yasm/yasm_git.bb                   | 1 -
 meta-oe/recipes-extended/7zip/7zip_24.09.bb                 | 1 -
 meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb                | 1 -
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb       | 1 -
 meta-oe/recipes-extended/brotli/brotli_1.1.0.bb             | 1 -
 meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb  | 1 -
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb   | 1 -
 meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb       | 1 -
 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb      | 1 -
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb                 | 1 -
 meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb | 1 -
 meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb          | 1 -
 meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb       | 1 -
 meta-oe/recipes-extended/hexedit/hexedit_1.6.bb             | 1 -
 meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb           | 1 -
 meta-oe/recipes-extended/iotop/iotop_1.30.bb                | 1 -
 meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb     | 1 -
 meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb   | 1 -
 meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb          | 1 -
 meta-oe/recipes-extended/libcec/libcec_7.0.0.bb             | 1 -
 .../recipes-extended/libdivecomputer/libdivecomputer_git.bb | 2 --
 meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb | 1 -
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb   | 1 -
 .../recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb   | 1 -
 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb | 1 -
 meta-oe/recipes-extended/libleak/libleak_0.3.6.bb           | 1 -
 meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb     | 1 -
 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb      | 1 -
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb | 1 -
 meta-oe/recipes-extended/libreport/libreport_2.17.15.bb     | 1 -
 meta-oe/recipes-extended/libuio/libuio_0.2.1.bb             | 1 -
 meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb            | 2 --
 meta-oe/recipes-extended/libyang/libyang_3.12.2.bb          | 1 -
 meta-oe/recipes-extended/md5deep/md5deep_git.bb             | 1 -
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb    | 1 -
 meta-oe/recipes-extended/mraa/mraa_git.bb                   | 1 -
 meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb       | 1 -
 meta-oe/recipes-extended/p8platform/p8platform_git.bb       | 1 -
 meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb        | 1 -
 meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb     | 1 -
 meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb            | 1 -
 meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb               | 1 -
 meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb                 | 1 -
 .../recipes-extended/properties-cpp/properties-cpp_git.bb   | 1 -
 meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb               | 1 -
 .../redis-plus-plus/redis-plus-plus_1.3.11.bb               | 1 -
 meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb           | 1 -
 meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb    | 1 -
 meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb          | 1 -
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb        | 1 -
 meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb           | 1 -
 meta-oe/recipes-extended/sedutil/sedutil_git.bb             | 1 -
 meta-oe/recipes-extended/snappy/snappy_1.1.10.bb            | 1 -
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb         | 1 -
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb     | 1 -
 meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb        | 1 -
 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb   | 1 -
 meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb            | 1 -
 meta-oe/recipes-extended/tipcutils/tipcutils_git.bb         | 1 -
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb               | 1 -
 meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb   | 1 -
 meta-oe/recipes-extended/upm/upm_git.bb                     | 1 -
 meta-oe/recipes-extended/valkey/valkey_8.1.1.bb             | 1 -
 meta-oe/recipes-extended/wipe/wipe_0.24.bb                  | 1 -
 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb            | 1 -
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb                | 1 -
 meta-oe/recipes-extended/zram/zram_0.2.bb                   | 1 -
 meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb                   | 1 -
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb                 | 1 -
 meta-oe/recipes-graphics/aml/aml_git.bb                     | 1 -
 meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb                 | 1 -
 meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb       | 1 -
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb     | 1 -
 meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb              | 1 -
 meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb                 | 1 -
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb                 | 1 -
 meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb         | 1 -
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb            | 1 -
 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb     | 1 -
 .../recipes-graphics/libvncserver/libvncserver_0.9.14.bb    | 1 -
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb         | 1 -
 meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb           | 1 -
 meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb           | 1 -
 meta-oe/recipes-graphics/openbox/obconf_git.bb              | 1 -
 .../panel-mipi-dbi/panel-mipi-dbi-native_git.bb             | 1 -
 meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb            | 1 -
 .../parallel-deqp-runner/parallel-deqp-runner_git.bb        | 1 -
 meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb         | 1 -
 meta-oe/recipes-graphics/surf/surf_2.1.bb                   | 1 -
 meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb  | 1 -
 meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb       | 1 -
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb        | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb  | 1 -
 .../recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb   | 1 -
 .../ttf-fonts/ttf-ubuntu-font-family_0.83.bb                | 1 -
 .../unclutter-xfixes/unclutter-xfixes_1.6.bb                | 1 -
 meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb              | 1 -
 meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb             | 1 -
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc          | 1 -
 meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc       | 1 -
 .../recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb | 1 -
 meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb  | 1 -
 meta-oe/recipes-graphics/yad/yad_6.0.bb                     | 1 -
 meta-oe/recipes-graphics/ydotool/ydotool_git.bb             | 1 -
 meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb      | 1 -
 meta-oe/recipes-kernel/blktests/blktests.bb                 | 1 -
 .../broadcom-bt-firmware_12.0.1.1105_p3.bb                  | 1 -
 meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb  | 1 -
 meta-oe/recipes-kernel/crash/crash.inc                      | 1 -
 meta-oe/recipes-kernel/crash/crash_8.0.6.bb                 | 1 -
 meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb          | 1 -
 meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb          | 1 -
 meta-oe/recipes-kernel/kpatch/kpatch.inc                    | 1 -
 meta-oe/recipes-kernel/kpatch/kpatch_git.bb                 | 1 -
 meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb       | 1 -
 .../recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb   | 1 -
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb         | 1 -
 meta-oe/recipes-kernel/turbostat/turbostat.bb               | 2 --
 meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb            | 1 -
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb           | 1 -
 meta-oe/recipes-multimedia/jack/a2jmidid_9.bb               | 1 -
 meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb     | 1 -
 meta-oe/recipes-multimedia/jack/jack_1.9.22.bb              | 1 -
 meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb    | 1 -
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb     | 1 -
 meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb         | 1 -
 meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb            | 1 -
 meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb         | 1 -
 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb  | 1 -
 meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb                | 1 -
 .../kernel-hardening-checker_0.6.10.bb                      | 1 -
 meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb         | 2 --
 .../spectre-meltdown-checker_0.46.bb                        | 1 -
 meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb                 | 1 -
 .../ace-cloud-editor/ace-cloud-editor_git.bb                | 1 -
 meta-oe/recipes-support/bcu/bcu_1.1.115.bb                  | 1 -
 meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb                | 1 -
 meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb       | 1 -
 meta-oe/recipes-support/btop/btop_1.4.3.bb                  | 1 -
 meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb    | 1 -
 meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb  | 1 -
 meta-oe/recipes-support/composefs/composefs_1.0.8.bb        | 1 -
 meta-oe/recipes-support/consolation/consolation_0.0.9.bb    | 1 -
 meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb        | 1 -
 meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb          | 1 -
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb            | 1 -
 meta-oe/recipes-support/crucible/crucible_2023.11.02.bb     | 1 -
 meta-oe/recipes-support/ctre/ctre_3.9.0.bb                  | 1 -
 meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb            | 1 -
 meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb                | 1 -
 meta-oe/recipes-support/daemonize/daemonize_git.bb          | 1 -
 meta-oe/recipes-support/dc/double-conversion_3.3.1.bb       | 2 --
 meta-oe/recipes-support/devmem2/devmem2_2.0.bb              | 1 -
 meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb          | 1 -
 meta-oe/recipes-support/dool/dool_1.3.4.bb                  | 2 --
 meta-oe/recipes-support/driverctl/driverctl_0.115.bb        | 1 -
 meta-oe/recipes-support/edid-decode/edid-decode_git.bb      | 1 -
 meta-oe/recipes-support/eject/eject_2.1.5.bb                | 1 -
 meta-oe/recipes-support/emacs/emacs_29.1.bb                 | 5 -----
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb            | 1 -
 meta-oe/recipes-support/fbset/fbset_2.1.bb                  | 1 -
 meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb           | 1 -
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb           | 1 -
 meta-oe/recipes-support/function2/function2_4.2.4.bb        | 1 -
 meta-oe/recipes-support/gd/gd_2.3.3.bb                      | 1 -
 meta-oe/recipes-support/gflags/gflags_2.2.2.bb              | 1 -
 meta-oe/recipes-support/glog/glog_0.7.1.bb                  | 1 -
 meta-oe/recipes-support/gnulib/gnulib_202401.bb             | 1 -
 .../googlebenchmark/googlebenchmark_1.9.4.bb                | 1 -
 meta-oe/recipes-support/gperftools/gperftools_2.16.bb       | 1 -
 meta-oe/recipes-support/gpm/gpm_git.bb                      | 1 -
 meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb       | 1 -
 meta-oe/recipes-support/htop/htop_3.3.0.bb                  | 1 -
 meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb   | 1 -
 meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb          | 1 -
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb | 1 -
 .../recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb | 1 -
 meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb          | 1 -
 meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb     | 1 -
 meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb            | 1 -
 meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb     | 1 -
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb        | 1 -
 meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb      | 1 -
 .../recipes-support/libcyusbserial/libcyusbserial_git.bb    | 1 -
 meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb          | 1 -
 meta-oe/recipes-support/libfann/libfann_git.bb              | 1 -
 meta-oe/recipes-support/libharu/libharu_2.4.5.bb            | 1 -
 meta-oe/recipes-support/libiio/libiio_0.26.bb               | 1 -
 meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb  | 1 -
 .../recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb   | 1 -
 meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb  | 1 -
 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb      | 1 -
 meta-oe/recipes-support/libnvme/libnvme_1.12.bb             | 1 -
 meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb       | 1 -
 meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb | 1 -
 meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb     | 1 -
 meta-oe/recipes-support/libp11/libp11_0.4.13.bb             | 1 -
 meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb      | 1 -
 meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb  | 2 --
 meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb              | 1 -
 meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb            | 1 -
 meta-oe/recipes-support/libssh/libssh_0.11.1.bb             | 1 -
 meta-oe/recipes-support/libteam/libteam_1.32.bb             | 1 -
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb      | 1 -
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb   | 1 -
 meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb      | 1 -
 meta-oe/recipes-support/liburing/liburing_2.9.bb            | 1 -
 meta-oe/recipes-support/libusbg/libusbg_git.bb              | 1 -
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb            | 1 -
 meta-oe/recipes-support/mcelog/mce-inject_git.bb            | 1 -
 meta-oe/recipes-support/mcelog/mce-test_git.bb              | 1 -
 meta-oe/recipes-support/mcelog/mcelog_204.bb                | 1 -
 meta-oe/recipes-support/md4c/md4c_0.5.2.bb                  | 2 --
 meta-oe/recipes-support/mg/mg_20230501.bb                   | 1 -
 .../multipath-tools/multipath-tools_0.11.1.bb               | 1 -
 meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb       | 1 -
 meta-oe/recipes-support/opencv/ade_0.1.2.bb                 | 1 -
 meta-oe/recipes-support/opencv/opencv_4.11.0.bb             | 2 --
 meta-oe/recipes-support/opensc/opensc_0.26.1.bb             | 1 -
 meta-oe/recipes-support/p910nd/p910nd_0.97.bb               | 2 --
 meta-oe/recipes-support/pcp/pcp.inc                         | 1 -
 meta-oe/recipes-support/pcp/pcp_6.3.7.bb                    | 1 -
 meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb      | 1 -
 meta-oe/recipes-support/picocom/picocom_2024.bb             | 1 -
 meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb     | 1 -
 meta-oe/recipes-support/pidgin/icyque_git.bb                | 1 -
 .../recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb  | 1 -
 meta-oe/recipes-support/poco/poco_1.13.3.bb                 | 1 -
 meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb   | 1 -
 meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb        | 1 -
 meta-oe/recipes-support/re2/re2_2024.03.01.bb               | 1 -
 meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb      | 1 -
 meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb             | 1 -
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb          | 1 -
 meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb      | 1 -
 meta-oe/recipes-support/sdmon/sdmon_git.bb                  | 1 -
 meta-oe/recipes-support/serial/serial_1.2.1.bb              | 1 -
 meta-oe/recipes-support/smarty/smarty_5.4.5.bb              | 1 -
 meta-oe/recipes-support/snapper/snapper_0.11.2.bb           | 1 -
 meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb       | 1 -
 meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb             | 1 -
 meta-oe/recipes-support/spitools/spitools_git.bb            | 2 --
 .../recipes-support/switchtec-user/switchtec-user_4.2.bb    | 1 -
 meta-oe/recipes-support/synergy/synergy_git.bb              | 1 -
 .../systemd-netlogd/systemd-netlogd_1.4.4.bb                | 1 -
 meta-oe/recipes-support/tbb/tbb_2022.1.0.bb                 | 3 ---
 meta-oe/recipes-support/tio/tio_3.9.bb                      | 1 -
 meta-oe/recipes-support/usbids/usbids_2025.04.01.bb         | 1 -
 meta-oe/recipes-support/uthash/uthash_2.3.0.bb              | 1 -
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb          | 1 -
 meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb    | 1 -
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb        | 1 -
 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb          | 1 -
 meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb             | 1 -
 meta-oe/recipes-test/bats/bats_1.12.0.bb                    | 1 -
 meta-oe/recipes-test/catch2/catch2_3.8.1.bb                 | 1 -
 meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb                 | 1 -
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb               | 1 -
 meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb               | 1 -
 meta-oe/recipes-test/evtest/evtest_1.35.bb                  | 1 -
 meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb                | 1 -
 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb      | 1 -
 .../recipes-test/linux-serial-test/linux-serial-test_git.bb | 1 -
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb                     | 1 -
 meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb               | 1 -
 meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb         | 1 -
 meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb    | 1 -
 meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb  | 2 --
 meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb    | 1 -
 .../libmodule/libmodule-build-tiny-perl_0.048.bb            | 1 -
 .../recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb  | 1 -
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb  | 1 -
 .../telepathy/telepathy-python3_0.15.19.bb                  | 1 -
 .../recipes-devtools/python/python3-asgiref_3.8.1.bb        | 1 -
 meta-python/recipes-devtools/python/python3-astor_0.8.1.bb  | 1 -
 .../python/python3-aws-iot-device-sdk-python_1.5.2.bb       | 1 -
 meta-python/recipes-devtools/python/python3-behave_1.2.6.bb | 1 -
 .../recipes-devtools/python/python3-betamax_0.9.0.bb        | 1 -
 .../recipes-devtools/python/python3-binwalk_2.3.4.bb        | 1 -
 meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb | 1 -
 .../recipes-devtools/python/python3-covdefaults_2.3.0.bb    | 1 -
 .../recipes-devtools/python/python3-crypt-r_3.13.1.bb       | 1 -
 meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb | 1 -
 meta-python/recipes-devtools/python/python3-dasbus_1.7.bb   | 1 -
 meta-python/recipes-devtools/python/python3-dbussy_1.3.bb   | 1 -
 meta-python/recipes-devtools/python/python3-gcovr_8.3.bb    | 1 -
 .../recipes-devtools/python/python3-inflection_0.5.1.bb     | 1 -
 meta-python/recipes-devtools/python/python3-inotify_git.bb  | 1 -
 .../recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb  | 1 -
 .../python/python3-keras-applications_1.0.8.bb              | 1 -
 meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb   | 1 -
 .../recipes-devtools/python/python3-linux-procfs_0.7.3.bb   | 1 -
 .../recipes-devtools/python/python3-monotonic_1.6.bb        | 1 -
 .../recipes-devtools/python/python3-pillow_11.2.1.bb        | 1 -
 meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb  | 1 -
 .../recipes-devtools/python/python3-pyatspi_2.46.1.bb       | 1 -
 .../recipes-devtools/python/python3-pybind11_2.13.6.bb      | 1 -
 .../recipes-devtools/python/python3-pydantic_2.11.3.bb      | 1 -
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb | 1 -
 .../recipes-devtools/python/python3-pyhsslms_2.0.0.bb       | 1 -
 meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb | 1 -
 .../recipes-devtools/python/python3-pyruvate_1.2.1.bb       | 1 -
 .../recipes-devtools/python/python3-pyyaml-include_2.2.bb   | 1 -
 meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb    | 1 -
 .../recipes-devtools/python/python3-schedutils_0.6.bb       | 1 -
 meta-python/recipes-devtools/python/python3-systemd_235.bb  | 1 -
 .../recipes-devtools/python/python3-tomli-w_1.2.0.bb        | 1 -
 .../recipes-devtools/python/python3-uefi-firmware_1.12.bb   | 1 -
 meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb | 1 -
 meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb   | 2 --
 .../python3-piccata/python3-piccata_2.0.3.bb                | 1 -
 .../python-blivet/python3-blivetgui_2.6.0.bb                | 1 -
 .../recipes-extended/python-cson/python3-cson_git.bb        | 1 -
 meta-python/recipes-extended/python-meh/python3-meh_0.52.bb | 1 -
 meta-python/recipes-extended/tuna/tuna_0.19.bb              | 1 -
 .../recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb        | 1 -
 .../recipes-httpd/apache-mod/apache-websocket_git.bb        | 1 -
 meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb    | 1 -
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb      | 1 -
 meta-webserver/recipes-support/fcgi/fcgi_git.bb             | 1 -
 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb      | 1 -
 .../xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb   | 1 -
 meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb  | 1 -
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb      | 1 -
 .../packagegroups/packagegroup-xfce-extended.bb             | 1 -
 661 files changed, 703 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
index 06051d8013..a5138b9553 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://github.com/prasad-joshi/logfsprogs.git;branch=master;protocol=h
            "
 SRCREV = "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
 
-
 EXTRA_OEMAKE = "CC="${CC}" LD="${LD}" AR="${AR}""
 
 do_install () {
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
index 890c8aecc0..bfa155bbc2 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://github.com/owfs/owfs;branch=master;protocol=https \
            file://owserver \
            "
 
-
 inherit autotools-brokensep update-rc.d pkgconfig systemd
 
 EXTRA_OECONF = " \
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index 97c7ad396e..1ffa3d9cf4 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -27,5 +27,4 @@ SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=m
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libsecret] = "--with-libsecret=yes,--with-libsecret=no,libsecret"
 
-
 LDFLAGS:append:libc-musl = " -lexecinfo"
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
index fc474e3238..23de13710c 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
@@ -14,5 +14,4 @@ SRCREV = "773f1853b043eeb64b7459f903a2c65bd096f9d9"
 DEPENDS = "fuse3"
 RDEPENDS:${PN} = "bash"
 
-
 inherit cmake pkgconfig
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index d30309a95a..af00fce319 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -25,7 +25,6 @@ SRCREV = "68030683543cccb4d942e3fedbcad1dc267e261c"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 CFLAGS:append = " -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
index cf56cca84c..5416fb8031 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
            file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch \
 "
 
-
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
 # define a do_compile function.
 # That's why we opt for module-base, also this prevents module splitting.
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 913b2c1d32..249e040189 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -21,7 +21,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 PV = "4.9+git"
 
-
 export HOSTCC = "${BUILD_CC}"
 do_configure:prepend() {
    # Replace sbin,bin paths with bitbake environment
diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
index eda41010a9..1e3e4460b9 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
@@ -10,5 +10,4 @@ RDEPENDS:${PN} = "fuse"
 SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master;tag=${PV}"
 SRCREV = "a276dbe66faaf7af02d967a648f7598589bf5c5b"
 
-
 inherit autotools pkgconfig gettext
diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
index 645e38ca49..0777bd0b58 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
 
 RDEPENDS:${PN} = "bash btrfs-tools"
 
-
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index a60fbec821..1a4d8e7602 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -18,7 +18,6 @@ SRC_URI = " \
 
 SRCREV = "46da6c398e70635a296245851fcedbc56c35e824"
 
-
 inherit autotools pkgconfig ptest
 
 # Otherwise these tools will be detected from build host and
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
index 68727b008e..878b71e465 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-
 inherit pkgconfig autotools
 
 BBCLASSEXTEND = "native"
diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
index bdde0d311a..c9e929b4bd 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
@@ -15,5 +15,4 @@ SRC_URI = "git://github.com/Gregwar/fatcat.git;branch=master;protocol=https \
 
 SRCREV = "99cb99fc86eb1601ac7ae27f5bba23add04d2543"
 
-
 inherit cmake
diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index 7f90bfd666..ae9e6abbcc 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branc
           "
 SRCREV = "12da22087de2ec43f0fe5af1237389e94619c483"
 
-
 DEPENDS = "parted"
 
 inherit autotools pkgconfig
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
index 708bbfcf02..23af14f7de 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
@@ -11,7 +11,6 @@ SRC_URI = "\
 
 SRCREV = "7a4a0c4f2c6c86aa46a40e3468e394fd4a237491"
 
-
 inherit meson pkgconfig
 
 DEPENDS:append:libc-musl = " fts"
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
index a22e54e24c..22a279dd75 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=htt
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
 
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__ -D_GNU_SOURCE"
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
index 9e86b77c5e..3a15613b22 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;ta
            file://0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch \
            "
 
-
 # brokensep because m4/package_globals.m4 calls ". ./VERSION" (and that's not the only issue)
 inherit autotools-brokensep useradd pkgconfig
 
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
index 032532456d..acb1f8f426 100644
--- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
@@ -20,7 +20,6 @@ SRC_URI = " \
 "
 SRCREV = "a0763a246a81188f60b0f9810143e49224dc752f"
 
-
 do_install:append() {
   install -d ${D}${datadir}/applications
   install -m644 ${UNPACKDIR}/polkit-gnome-authentication-agent-1.desktop \
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
index 414f9c5203..d540245a38 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
@@ -63,7 +63,6 @@ SRC_URI += "file://0001-meson.build-dont-check-for-lgi.patch"
 SRC_URI += "file://0001-meson.build-require-iso-codes-native.patch"
 SRCREV = "c1901c5be644ab8dcaf779b1f383bf5370bc90c6"
 
-
 PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"
 PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
 PACKAGECONFIG[appdata-test] = "-Dappdata-test=enabled,-Dappdata-test=disabled,appstream-native"
diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
index b64e91a765..7945de87cb 100644
--- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -19,7 +19,6 @@ SRCREV = "2768251dacce3939136c839aeca413f4aa4241d0"
 
 PV = "1.6.1"
 
-
 EXTRA_AUTORECONF += "-I m4"
 
 do_configure:append() {
diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
index 32a69a0707..8c91f66616 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "Configuration editor for dconf"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-
 DEPENDS = " \
     dconf \
     desktop-file-utils-native \
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
index c5c45a0264..e3645cd9f3 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
@@ -7,7 +7,6 @@ SRC_URI[archive.sha256sum] = "cf7f22a4c9200421d8d3325c5c1b8b93a36843650c9f95d645
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
-
 inherit gnomebase bash-completion vala
 
 # I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
index 2bbf73dffc..8f443ca131 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/dsalt/devilspie2;branch=master;protocol=https \
     file://devilspie2.desktop \
 "
 
-
 inherit features_check pkgconfig gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta-gnome/recipes-gnome/eog/eog_47.0.bb b/meta-gnome/recipes-gnome/eog/eog_47.0.bb
index a82cd60cc9..668427ec8a 100644
--- a/meta-gnome/recipes-gnome/eog/eog_47.0.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_47.0.bb
@@ -16,7 +16,6 @@ DEPENDS = " \
     lcms \
 "
 
-
 inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg features_check gtk-icon-cache
 
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
diff --git a/meta-gnome/recipes-gnome/evince/evince_48.0.bb b/meta-gnome/recipes-gnome/evince/evince_48.0.bb
index 31345542f2..0e19f78f81 100644
--- a/meta-gnome/recipes-gnome/evince/evince_48.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_48.0.bb
@@ -25,7 +25,6 @@ DEPENDS = " \
     zlib \
 "
 
-
 inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection gettext mime-xdg gi-docgen features_check gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index c3c4e3eae5..e738bd8221 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -50,7 +50,6 @@ PACKAGECONFIG[kerberos]    = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
 PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
 PACKAGECONFIG[weather] = "-DENABLE_WEATHER=ON,-DENABLE_WEATHER=OFF,libgweather4"
 
-
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
 
diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
index 050f6803c7..b2f68f7b55 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
@@ -2,7 +2,6 @@ SUMMARY = "An archive manager utility for the  GNOME Environment"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-
 DEPENDS = " \
     desktop-file-utils-native \
     glib-2.0-native \
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
index 92ddc143f6..2dcaad1f87 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
@@ -18,7 +18,6 @@ DEPENDS = " \
 REQUIRED_DISTRO_FEATURES = "x11 systemd pam polkit gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
 SRC_URI += "file://a3e0aca75e16aeafc171751028406b54f5ed8397.patch"
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
index 91b2221d7a..fd08164fe2 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
@@ -3,7 +3,6 @@ SECTION = "x11/gnome"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
-
 DEPENDS = " \
     appstream-glib-native \
     desktop-file-utils-native \
diff --git a/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb b/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
index f29ddbb6fd..f1a600511b 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_46.2.bb
@@ -2,7 +2,6 @@ SUMMARY = "GHex - a hex editor for GNOME"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-
 DEPENDS = " \
     desktop-file-utils-native  \
     glib-2.0-native \
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
index 55bd38c97c..719acf1508 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.84.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "Javascript bindings for GNOME"
 LICENSE = "MIT & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8dcea832f6acf45d856abfeb2d51ec48"
 
-
 DEPENDS = "mozjs-128 cairo"
 
 inherit gnomebase gobject-introspection gettext features_check upstream-version-is-even pkgconfig multilib_script
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
index 6f910c4c13..2ea777976f 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
@@ -16,7 +16,6 @@ DEPENDS = " \
     xz \
 "
 
-
 inherit gnomebase gsettings gtk-icon-cache gettext features_check mime-xdg
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb
index e8d51a12df..b8b9556797 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb
@@ -10,7 +10,6 @@ DEPENDS = " \
     libadwaita \
 "
 
-
 inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
index 81c3c65a48..aa036e89c7 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -25,7 +25,6 @@ DEPENDS = " \
 
 RDEPENDS:${PN} = "localsearch"
 
-
 inherit gnomebase gettext gnome-help features_check
 
 def gnome_verdir(v):
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
index 3bb1cb1651..de128da218 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
@@ -14,7 +14,6 @@ DEPENDS = " \
     systemd \
 "
 
-
 inherit gnomebase gettext gsettings upstream-version-is-even features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit systemd pam gobject-introspection-data"
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb
index 9a2948d432..44ff9c0673 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_48.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "Window navigation construction toolkit"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
index 1a0f89b6fc..17c1cc6ca6 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "GNOME Shell is the graphical shell of the GNOME desktop environment"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-
 DEPENDS = " \
     libxml2-native \
     gtk4 \
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb
index db07eaa27a..2a02c6ea93 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb
@@ -17,7 +17,6 @@ DEPENDS = " \
     libhandy \
 "
 
-
 inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check gettext
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.1.bb
index 317d082940..c9d42d8ace 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "A simple text editor"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
-
 DEPENDS = " \
     desktop-file-utils-native \
     libadwaita \
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
index a8d6a2ad69..107137d6ab 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libhandy"
 
-
 inherit gnomebase gtk-icon-cache gobject-introspection features_check
 
 # same as gnome-shell
diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
index 3b087c148d..a7cb5c3e19 100644
--- a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "This is gnome-user-share 43.0, a system for easy sharing of user file
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-
 DEPENDS = " \
     glib-2.0-native \
     glib-2.0 \
diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
index 6a50c22c73..5380e82b8b 100644
--- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
@@ -7,7 +7,6 @@ DEPENDS = " \
     libcanberra \
 "
 
-
 VALA_MESON_OPTION = "enable_vala"
 
 inherit gnomebase gettext gobject-introspection vala
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
index 7076214a4d..661ca1f460 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
@@ -18,7 +18,6 @@ PNAME = "gtksourceview"
 
 S = "${UNPACKDIR}/${PNAME}-${PV}"
 
-
 inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-cache gobject-introspection vala
 
 REQUIRED_DISTRO_FEATURES = "opengl"
diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index b7c587d25f..fffe1a107e 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -10,4 +10,3 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRCREV = "941560af497148588783db991e8135f52a82574d"
 SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https"
 
-
diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
index f52c210ed4..8c996f4e7f 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
@@ -33,4 +33,3 @@ do_compile:append() {
               libxklavier.pc
 }
 
-
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
index 32f0801706..a5d6a4ab26 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
@@ -17,7 +17,6 @@ DEPENDS = " \
     libxpresent \
 "
 
-
 # depends on startup-notification which depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb b/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
index 6f799ad57a..ecd80faf6f 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
@@ -24,7 +24,6 @@ DEPENDS = " \
     xwayland \
 "
 
-
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
 SRC_URI[archive.sha256sum] = "9ca177fd5851a4077f17f6a888c45447b7d1163c9879580597a1fd837f47e57d"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
index f867cd14d1..d3af6d3fad 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_48.2.bb
@@ -4,7 +4,6 @@ SECTION = "x11/gnome"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
-
 DEPENDS = " \
     appstream-glib-native \
     desktop-file-utils-native \
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
index 0483d3070d..553a8b96d5 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://wiki.gnome.org/Projects/Librest"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-
 DEPENDS = " \
     glib-2.0 \
     glib-2.0-native \
diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
index f4d027ebf7..6f40d74f6e 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
@@ -18,7 +18,6 @@ DEPENDS = " \
 
 inherit meson gobject-introspection gettext features_check pkgconfig
 
-
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SRC_URI = "git://gitlab.gnome.org/swilmet/tepl;protocol=https;branch=main"
 SRCREV = "16ab2567257a053bd957699f89080fafd0999035"
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb b/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
index ffea1f76b3..6f13c9f666 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
@@ -11,7 +11,6 @@ DEPENDS = " \
     zlib \
 "
 
-
 inherit gnomebase gsettings gobject-introspection vala bash-completion features_check
 
 SRC_URI:append = " \
@@ -74,7 +73,6 @@ EXTRA_OEMESON += " \
     -Dsystemd_user_services_dir=${systemd_user_unitdir} \
 "
 
-
 FILES:${PN} += " \
     ${datadir} \
     ${libdir}/localsearch-3.0 \
diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index 14986f2650..64bf7a2a54 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -28,7 +28,6 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
 PACKAGECONFIG[soup2] = "--with-webkit2gtk-4-0,,"
 PACKAGECONFIG[soup3] = ",--with-webkit2gtk-4-0,"
 
-
 do_configure:prepend() {
     export ITSTOOL=${STAGING_BINDIR_NATIVE}/itstool
 }
diff --git a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index a3c274240a..f97c6cbd3f 100644
--- a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Clutter package groups"
 
-
 # clutter-1.0 gets debian renamed to libclutter-1.0-0
 # clutter-gtk-1.0 gets debian renamed to libclutter-gtk-1.0-0
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
index bbd7c866e1..1ba92ed0d8 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -8,7 +8,6 @@ DEPENDS = "gtk+3 gobject-introspection-native \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f18f9c6d8b4cfcc7d7804a243a4c0b4"
 
-
 SRCREV = "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
 PV = "3.0+git"
 SRC_URI = "git://github.com/engla/keybinder.git;branch=keybinder-3.0;protocol=https \
diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
index f816cdf239..45f5a6baa0 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
@@ -15,7 +15,6 @@ DEPENDS = " \
     libgudev \
 "
 
-
 inherit meson pkgconfig
 
 EXTRA_OEMESON = " \
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
index d59b357dc1..7d92431daf 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
@@ -18,7 +18,6 @@ DEPENDS:append:libc-musl = " fts"
 
 inherit bash-completion pkgconfig
 
-
 EXTRA_OECONF = "--prefix=${prefix} \
                 --libdir=${nonarch_libdir} \
                 --datadir=${datadir} \
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index 461d75e625..c185ab8471 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
              file://0001-make-Add-compiler-includes-in-cflags.patch \
              "
 
-
 EXTRA_OECONF += "--disable-tests --without-jffs --without-ubifs"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 2df53ff38e..b223b59af0 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -61,7 +61,6 @@ SRC_URI:append:aarch64 = " file://arm64_kexec-image-header.h-add-missing-le64toh
 
 SRC_URI:append:powerpc = " file://powerpc-purgatory-Makefile-remove-unknown-flags.patch"
 
-
 EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
 
 # fix purgatory/printf.c:2:10: fatal error: limits.h: No such file or directory
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
index 7d9b8a477f..4f3aa4c9ef 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
@@ -10,7 +10,6 @@ inherit gnomebase pkgconfig vala gobject-introspection
 SRC_URI[archive.sha256sum] = "c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3dae2891e311a993a574f5a04f"
 SRC_URI += "file://0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch"
 
-
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 
 gupnp_sysroot_preprocess () {
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
index 5a42fc760c..eaeceb4c5f 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
@@ -12,7 +12,6 @@ SRCREV = "c540ce2431bdeac73359029d4592b45790e1d154"
 SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x \
           "
 
-
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--enable-reuseaddr"
diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
index 37431dca05..36005a2973 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
@@ -9,7 +9,6 @@ DEPENDS = "libusb1 openssl pcsc-lite"
 SRCREV = "190d6dee96ca70f8b614932b1498332b1504632b"
 SRC_URI = "git://repo.or.cz/oscam.git;protocol=https;nobranch=1"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DDEFAULT_CS_CONFDIR=${sysconfdir} -DCMAKE_BUILD_TYPE=Debug"
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 6a7f6c3f5d..1460e4735a 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -16,7 +16,6 @@ SRCREV = "cc602833684953fc3e6f1c89d4f08f6dfef179e3"
 PV = "4.3+git"
 PKGV = "4.3+git${GITPKGV}"
 
-
 EXTRA_OECONF += "--arch=${TARGET_ARCH} \
                  --disable-hdhomerun_static \
                  --disable-ffmpeg_static \
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
index 4b439e2ca5..7c68c3570c 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "git://github.com/Matroska-Org/libebml.git;branch=v1.x;protocol=https"
 SRCREV = "1878e784321673561039a6a37076b2736f4dc98f"
 
-
 inherit pkgconfig cmake dos2unix
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
index d38366a735..1d4e2a66b4 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
@@ -8,7 +8,6 @@ DEPENDS = "libebml"
 SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https"
 SRCREV = "f5315fddda2d434e47035c038549a808d8b8eac7"
 
-
 inherit pkgconfig cmake
 
 #Static library enabled by default. It has been added in case you want to use it dynamically.
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
index 72baf58cf0..a89e87dbae 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
@@ -9,7 +9,6 @@ SRCREV = "10aece4157eb79315da205f39e19bf6ab3ee30d0"
 SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV} \
            file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch"
 
-
 inherit cmake pkgconfig
 
 DEPENDS = " nasm-native"
diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
index 162a51284e..31ae408929 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
@@ -21,7 +21,6 @@ SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master \
 
 SRCREV = "959573c2cccef5cf074f5b2fa7941abbd699c5f4"
 
-
 PACKAGECONFIG ??= "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[a2dpconf] = "--enable-a2dpconf,--disable-a2dpconf"
 PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,fdk-aac"
diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
index d600e3b5e3..9235381e5d 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8055cfe7548dfdaa3a6dc45d8793669"
 SRC_URI = "git://code.videolan.org/videolan/dav1d.git;protocol=https;nobranch=1"
 SRCREV = "42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa"
 
-
 DEPENDS:append:x86 = " nasm-native"
 DEPENDS:append:x86-64 = " nasm-native"
 
diff --git a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
index a330d769c5..7117be351a 100644
--- a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/foo86/dcadec.git;protocol=https;branch=master \
            file://0001-define-BASELIB-make-variable.patch \
           "
 
-
 inherit lib_package
 
 EXTRA_OEMAKE = "CONFIG_SHARED=1 PREFIX=${prefix} BASELIB=${baselib}"
diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
index 97196bbcf2..8c7466b888 100644
--- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"
 SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=https;branch=master"
 SRCREV = "801f67f671929311e0c9952c5f92d6e147c7b003"
 
-
 SRC_URI[md5sum] = "fef453b5d6ee28ff302c600b8cded3e7"
 SRC_URI[sha256sum] = "07c2a64b098eb48b2e9d729d5e778c08f7d22f28adc8da7c3f92c58da1cbbd8e"
 
diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
index af543af80e..ebae9c6c5f 100644
--- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
+++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
@@ -13,7 +13,6 @@ SRC_URI += "file://0001-Remove-defining-const-as-nothing.patch"
 
 SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
 
-
 EXTRA_OECONF += "--enable-shared"
 
 do_configure:append() {
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
index b8396209c5..b33c03e012 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
@@ -13,7 +13,6 @@ SRC_URI = " \
 "
 SRCREV = "9f2edaa3cbd456997cb420fb68b6f960faaafd12"
 
-
 inherit cmake pkgconfig lib_package
 
 EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
index 6348f25a57..2acbf6755f 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master"
 SRCREV = "870dd32d42f626dc2246d34b2224ffb6fd73e205"
 
-
 DEPENDS = "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp libnsl2"
 
 SYSTEMD_SERVICE:${PN} = "gerbera.service"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
index e1c903f6ed..3872a0f054 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
@@ -19,7 +19,6 @@ SRC_URI = " \
     file://0001-tracers-Fix-buffer-overflow.patch \
 "
 
-
 EXTRA_OECONF += " \
     --disable-graphviz \
     --enable-gtk-doc=no \
diff --git a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
index 69d33c9f6a..b776df5617 100644
--- a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/Avnu/libavtp.git;branch=master;protocol=https"
 SRC_URI:append:libc-musl = " file://0001-provide-64bit-host-to-network-conversion-macros.patch"
 SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
 
-
 inherit meson pkgconfig
 
 EXTRA_OEMESON = "-Dtests=disabled"
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
index c7fe631a43..2617661057 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
@@ -18,7 +18,6 @@ SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
 
 PE = "1"
 
-
 DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
index a509337894..b150eb0015 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https"
 SRCREV = "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
 
-
 inherit cmake pkgconfig
 
 PACKAGECONFIG ?= "libsdl"
diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
index 93bdc63b56..b437a18aba 100644
--- a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://code.videolan.org/videolan/libdvbcsa.git;protocol=https;branch=
            file://libdvbcsa.pc \
 "
 
-
 inherit autotools lib_package pkgconfig
 
 do_install:append() {
diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
index d7325abd7a..db57881834 100644
--- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
+++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/OpenELEC/libsquish.git;protocol=https;branch=master
            file://0001-Add-support-for-variable-libdir.patch \
           "
 
-
 EXTRA_OEMAKE = "INSTALL_DIR=${D}${prefix} LIBDIR_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
                 ${@bb.utils.contains('TUNE_FEATURES', 'altivec', 'USE_ALTIVEC=1', '', d)}"
 
diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
index 10e64e9878..facfe6edd8 100644
--- a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
@@ -9,5 +9,4 @@ DEPENDS = "libusb jpeg"
 SRC_URI = "git://github.com/libuvc/libuvc.git;branch=master;protocol=https"
 SRCREV = "68d07a00e11d1944e27b7295ee69673239c00b4b"
 
-
 inherit cmake pkgconfig
diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index b9093d19bb..326ece7ed2 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -27,5 +27,4 @@ SRC_URI = "git://github.com/MycroftAI/mimic1.git;branch=master;protocol=https \
 
 inherit autotools pkgconfig
 
-
 CPPFLAGS:append = " -Wno-error"
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index cb2a1865e8..d07117c9a8 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -15,7 +15,6 @@ SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
            file://0001-Add-compatibility-with-FFMPEG-7.0.patch \
            "
 
-
 # This remove "--exclude=autopoint" option from autoreconf argument to avoid
 # configure.ac:30: error: required file './ABOUT-NLS' not found
 EXTRA_AUTORECONF = ""
diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 1ae43e8aef..953adde042 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git;branch=master;protocol
            file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_request_.patch \
            "
 
-
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE:append:class-target = " -DIMPORT_EXECUTABLES=${STAGING_LIBDIR_NATIVE}/cmake/${BPN}/ImportExecutables.cmake"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
index d1dd4d7442..b7a232f426 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
@@ -23,7 +23,6 @@ SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
            "
 SRCREV = "063abb31a68f7ee92a246256eec4234ab8b7ed8b"
 
-
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)} \
     -Dadplug=disabled \
     -Dsndio=disabled \
diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index bdc4d7280c..325ffb0f4e 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -20,7 +20,6 @@ SRC_URI = "git://github.com/MycroftAI/mycroft-core.git;branch=master;protocol=ht
            file://mycroft.service \
           "
 
-
 inherit systemd features_check
 
 # Mycroft installs itself on the host
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
index 4204017c20..0d4be34780 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
@@ -10,7 +10,6 @@ DEPENDS = "zlib libsndfile1"
 SRCREV = "dc7d7054a5b4f3bec1dc23a42fd616a0847af948"
 SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master"
 
-
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pipewire pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "-DALSOFT_BACKEND_ALSA=ON,-DALSOFT_BACKEND_ALSA=OFF,alsa-lib"
 PACKAGECONFIG[oss] = "-DALSOFT_BACKEND_OSS=ON,-DALSOFT_BACKEND_OSS=OFF"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
index e41cfd221c..f0dab4d0f4 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
@@ -16,7 +16,6 @@ SRCREV = "83ada1e086f8fa49bf9652df2edd9ccee5efa48b"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https"
 
-
 inherit meson pkgconfig systemd gettext useradd
 
 USERADD_PACKAGES = "${PN}"
diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
index c02b45054f..64636f4789 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
@@ -13,7 +13,6 @@ SRC_URI = " \
     git://git.ffmpeg.org/rtmpdump;branch=master \
 "
 
-
 CVE_STATUS_GROUPS += "CVES_2015"
 CVES_2015 = "CVE-2015-8270 CVE-2015-8271 CVE-2015-8272"
 CVES_2015[status] = "fixed-version: patched in current git hash"
diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
index 9993837f19..cd94b4ea0f 100644
--- a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
@@ -28,7 +28,6 @@ SRC_URI = "\
 # https://lists.openembedded.org/g/openembedded-devel/message/109325
 SRCREV = "df1282eb9af538ab1aadb6d66146e258451d4fe4"
 
-
 inherit autotools
 
 PACKAGECONFIG ?= ""
diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
index 8965c8ee75..5f72d20d57 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
@@ -10,7 +10,6 @@ PV .= "+git"
 SRCREV = "f78ed25aced2dfea743867b8205a787bfb091340"
 SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https"
 
-
 inherit meson
 
 # tinyalsa is built as a static library. Enable PIC to avoid relocation
diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index f195a4a654..0e3cea8ebb 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https;branch=master \
 "
 SRCREV = "7c30a66346199f3f09017a09567c6c8a3a0eedc8"
 
-
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-shared"
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.bb
index 8e50378bfd..42baa985fd 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.bb
@@ -16,7 +16,6 @@ SRC_URI = " \
     file://90-OE-disable-session-dbus-dependent-features.lua \
 "
 
-
 inherit meson pkgconfig gobject-introspection systemd
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
index 811a876885..363c1ab5f3 100644
--- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
+++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
@@ -11,7 +11,6 @@ SRCREV = "ca1bf4b810e2d188d04cb6286f957008ee1b7681"
 SRC_URI = "git://github.com/graeme-hill/crossguid;protocol=https;branch=master \
            file://0001-include-missing-cstdint.patch"
 
-
 inherit cmake
 
 do_install:append() {
diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
index b3953cf5c3..949b32a841 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
@@ -10,7 +10,6 @@ PV = "0.3.1+git"
 
 SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;branch=master"
 
-
 inherit vala meson pkgconfig
 
 FILES:${PN}-staticdev += "${libdir}/gstreamer-1.0/*a"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
index c5d497c468..8655b0ae56 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
 
-
 inherit gnomebase gobject-introspection vala features_check
 
 SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
index 9130b290b9..24928b0160 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 SRC_URI = "git://github.com/cisco/libsrtp.git;branch=main;protocol=https"
 SRCREV = "a566a9cfcd619e8327784aa7cff4a1276dc1e895"
 
-
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[nss] = "-Dcrypto-library=nss,, nss,,, openssl"
 PACKAGECONFIG[openssl] = "-Dcrypto-library=openssl,, openssl,,, nss"
diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
index 2f15abbcfd..31c2991c0a 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
@@ -8,7 +8,6 @@ SRCREV = "8e88e3590a19006362ea8b8dfdc18bb88b3cb3b5"
 
 SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;protocol=https;branch=master"
 
-
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 17ef3c99cb..b80b9a6c3b 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -40,7 +40,6 @@ EXTRA_OEMAKE += 'CC="${CC}" CFLAGS="${CFLAGS}" LDDLL="${CCLD} ${LDFLAGS}" LD="${
                  ${@ "STATICLIB=no" if d.getVar('DISABLE_STATIC') != "" else "" } \
 '
 
-
 do_install() {
 	install -d ${D}/${bindir} ${D}/${libdir} ${D}/${includedir}
 	install -m 0755 ${B}/build/brssl ${D}/${bindir}
diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index e1f01de8a0..eefc0b5aea 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https;branch=master \
            file://0001-bluepy-Fix-username-issue-with-tarballs.patch \
           "
 
-
 inherit setuptools3 pkgconfig
 
 RDEPENDS:${PN} = "bluez5"
diff --git a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
index ab9cebaf38..ae3cc9447b 100644
--- a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
+++ b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
@@ -17,7 +17,6 @@ SRC_URI = "\
 "
 SRCREV = "f65321736475429316f07ee94ec0deac8e46ec4a"
 
-
 inherit autotools pkgconfig
 
 RDEPENDS:${PN} = "bluez5"
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
index 835f33055a..e2a60f8d24 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
@@ -11,6 +11,5 @@ LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit cmake
 
-
 PACKAGECONFIG ??= "lksctp-tools"
 PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index 06d78b9328..63255ff8e5 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "
 
-
 # civetweb supports building with make or cmake (although cmake lacks few features)
 inherit cmake
 
diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
index 23a439a989..25d7cacc07 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
@@ -14,5 +14,4 @@ SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
 
 SRCREV = "434f205cbd45de0961cc42e541b5bf54569e912a"
 
-
 FILES:${PN} += "${libdir}/daq/*.so"
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index 1dff38f0d5..fbe37675dc 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/tomaszmrugalski/dibbler;branch=master;protocol=https
            "
 PV = "1.0.1+1.0.2RC1+git${SRCREV}"
 
-
 PACKAGECONFIG ??= "debug bind-reuse resolvconf dns-update"
 
 PACKAGECONFIG[debug] = "--enable-debug,,,"
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
index fea4d858ed..6b732b0a60 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
@@ -48,7 +48,6 @@ CVE_STATUS[CVE-2011-4966] = "fixed-version: The CPE in the NVD database doesn't
 
 PARALLEL_MAKE = ""
 
-
 LDFLAGS:append:powerpc = " -latomic"
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:armv5 = " -latomic"
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
index f79121b142..6fec047571 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
@@ -10,7 +10,6 @@ SRCREV = "3dfbe889b1f65077efe579da34fc1d6819fcb7f3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
 
-
 inherit autotools multilib_script pkgconfig
 
 DEPENDS += "libcheck"
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index cfded66e41..82e8ff0fc6 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -20,7 +20,6 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
 "
 
-
 inherit cmake pkgconfig python3-dir python3native siteinfo
 
 EXTRA_OECMAKE = " \
diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
index 8dce6c5c4a..23aff50998 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
@@ -12,7 +12,6 @@ SECTION = "libs/networking"
 SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master"
 SRCREV = "fc3f684a80151a3319446fc96083a9ff384ee4fe"
 
-
 inherit cmake pkgconfig
 
 # nanomsg documentation generation requires asciidoctor,
diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
index 8d681f495e..ced1437ab3 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 SRC_URI = "git://github.com/nanomsg/nng.git;branch=main;protocol=https"
 SRCREV = "85fbe7f9e4642b554d0d97f2e3ff2aa12978691a"
 
-
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DNNG_ENABLE_NNGCAT=ON"
diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
index aac26966f1..d061df359b 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
@@ -9,5 +9,4 @@ PV = "1.3.0"
 
 SRC_URI = "git://github.com/cwzx/nngpp;branch=master;protocol=https"
 
-
 inherit cmake
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
index b8c6a936ad..e097bf7d84 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
@@ -47,7 +47,6 @@ SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',
 
 SRCREV = "995a28fa1ccc54ad22e794294c3c6783cc3f30ed"
 
-
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
 NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
 
@@ -122,7 +121,6 @@ PACKAGECONFIG[wwan] = ",,"
 # The following PACKAGECONFIG is used to determine whether NM is managing /etc/resolv.conf itself or not
 PACKAGECONFIG[man-resolv-conf] = ",,"
 
-
 PACKAGES =+ " \
     libnm \
     ${PN}-adsl \
@@ -144,7 +142,6 @@ INITSCRIPT_PACKAGES = "${PN}-daemon"
 NETWORKMANAGER_PLUGINDIR = "${libdir}/NetworkManager/${PV}"
 NETWORKMANAGER_DISPATCHERDIR = "${nonarch_libdir}/NetworkManager/dispatcher.d"
 
-
 SUMMARY:libnm = "Libraries for adding NetworkManager support to applications"
 FILES:libnm = "\
     ${libdir}/libnm.so.* \
@@ -276,7 +273,6 @@ ALTERNATIVE:${PN}-daemon = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-con
 ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','${sysconfdir}/resolv.conf','',d)}"
 
-
 # The networkmanager package is an empty meta package which weakly depends on all the compiled features.
 # Install this package to get all plugins and related dependencies installed. Alternatively just install
 # plugins and related dependencies e.g. by installing networkmanager-wifi or networkmanager-wwan
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
index e1027747b6..b49c149b01 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
@@ -21,7 +21,6 @@ PACKAGECONFIG[libproxy]  = "--with-libproxy,--without-libproxy,libproxy,"
 # not config defaults
 PACKAGECONFIG[pcsc-lite] = "--with-libpcsclite,--without-libpcsclite,pcsc-lite,"
 
-
 inherit autotools pkgconfig bash-completion
 
 EXTRA_OECONF += "--with-vpnc-script=${sysconfdir}/vpnc/vpnc-script \
diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
index 9823d772a3..5b0c6c7076 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
@@ -12,7 +12,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[resolvconf] = "--with-resolvconf=${base_sbindir}/resolvconf --enable-resolvconf,--with-resolvconf=DISABLED,,"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir},--without-systemdsystemunitdir,,"
 
-
 inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = " \
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
index 009a6ef88c..c512906915 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -14,7 +14,6 @@ PV = "0.1+git"
 SRC_URI = "git://github.com/openthread/openthread.git;protocol=https;branch=main \
            "
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DOT_DAEMON=ON \
diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index 9c64872917..860240d20b 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -19,7 +19,6 @@ SRC_URI = "gitsm://github.com/openthread/wpantund.git;protocol=https;branch=mast
            file://basename.patch \
            "
 
-
 inherit pkgconfig perlnative autotools
 
 # There has not been a wpantund release as of yet that includes these fixes.
diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 17745da806..002a283bac 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -12,7 +12,6 @@ PV = "0.0.1+git"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit cmake
 
 CFLAGS:append:toolchain-clang = " -Wno-error=gnu-variable-sized-type-not-at-end"
diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
index faaf393529..42afe7eb97 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
@@ -4,14 +4,12 @@ SECTION = "comm"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later "
 LIC_FILES_CHKSUM = "file://sethdlc.c;endline=10;md5=90f936879e9f8b755a138aeb348782eb"
 
-
 SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BP}.tar.gz \
            file://sethdlc-fix-host-contamination.patch \
 "
 SRC_URI[md5sum] = "9016878156a5eadb06c0bae71cc5c9ab"
 SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6ab6b04e"
 
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
 
@@ -22,7 +20,6 @@ do_compile:prepend () {
     oe_runmake clean
 }
 
-
 do_install() {
     install -d ${D}/${bindir}
     install sethdlc ${D}/${bindir}/
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
index e9169a050f..d47d039b12 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
 
 SRCREV = "6a11279883a8584e06ad9ab2df162c639961cd61"
 
-
 PACKAGES =+ "${PN}-scripts"
 
 inherit cmake pkgconfig
diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index c479eefba0..fb56b9e169 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -38,7 +38,6 @@ RRECOMMENDS:${PN} = " \
                      kernel-module-nf-recent \
 "
 
-
 do_configure:prepend() {
     if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
         sed -i -e 's|/lib|${nonarch_base_libdir}|' ${S}/setup.py
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 5d9d2634a0..019ef1c026 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -29,7 +29,6 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 PACKAGES =+ "${PN}-script"
 
-
 inherit perlnative pkgconfig
 
 #EXTRA_OEMAKE = "-e MAKEFLAGS="
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index af591cfd7a..9f72a9ae50 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -20,7 +20,6 @@ SRC_URI = " \
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"
 
-
 inherit autotools ptest
 
 EXTRA_OECONF += "--enable-certreq --enable-dtls --enable-opensslextra --enable-certext --enable-certgen"
diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
index eca004302b..317b2b1cd4 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://git.code.sf.net/p/atftp/code;branch=master;protocol=https \
            file://atftpd.service \
 "
 
-
 inherit autotools update-rc.d systemd
 
 PACKAGECONFIG ??= "tcp-wrappers"
@@ -23,7 +22,6 @@ INITSCRIPT_PACKAGES = "${PN}d"
 INITSCRIPT_NAME:${PN}d = "atftpd"
 INITSCRIPT_PARAMS:${PN}d = "defaults 80"
 
-
 EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -std=gnu89'"
 
 do_install:append() {
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index ede4491309..6591a5648b 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -55,7 +55,6 @@ do_compile:prepend() {
     sed -i -e "s:-I/usr/include/pppd:-I=/usr/include/pppd:" ${S}/pppd/Makefile
 }
 
-
 do_install() {
     oe_runmake DESTDIR=${D} install
 
@@ -73,7 +72,6 @@ do_install() {
         ${D}/opt/${BPN}/test_procs.tcl
 }
 
-
 PACKAGES =+ "${PN}-test"
 
 FILES:${PN} += "${libdir}/pppd/${PPPD_VERSION}/ippool.so"
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
index db4a4313a4..5f5a738a40 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
@@ -43,7 +43,6 @@ EXTRA_OEMAKE = ' \
     SED=sed \
 '
 
-
 do_configure () {
     cd ${S}/iscsiuio ; autoreconf --install; ./configure ${EXTRA_OECONF}
 }
diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
index e7db8a948b..46de366b19 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
@@ -14,7 +14,6 @@ REQUIRED_DISTRO_FEATURES = "systemd gobject-introspection-data"
 SRCREV = "dfd26d72793914eb3da910ef8c71de6d7c8942a2"
 SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=https;nobranch=1"
 
-
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "networkd-dispatcher.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
index 65dd2f9561..13364b91ed 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;
            file://proftpd.service \
            "
 
-
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
 # patch releases have character after version
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index b5a2b9dae0..35df023242 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -12,7 +12,6 @@ LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://MCONFIG.in;beginline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
                     file://tftp/tftp.c;beginline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
 
-
 SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.tar.bz2 \
            file://tftp-0.40-remap.patch \
            file://tftp-0.42-tftpboot.patch \
@@ -92,7 +91,6 @@ ALTERNATIVE:${PN} = "tftp"
 ALTERNATIVE_TARGET[tftp] = "${bindir}/tftp-hpa"
 ALTERNATIVE_PRIORITY = "100"
 
-
 SYSTEMD_PACKAGES = "tftp-hpa-server"
 SYSTEMD_SERVICE:tftp-hpa-server = "tftpd-hpa.socket tftpd-hpa.service"
 SYSTEMD_AUTO_ENABLE:tftp-hpa-server = "enable"
diff --git a/meta-networking/recipes-daemons/vblade/vblade_25.bb b/meta-networking/recipes-daemons/vblade/vblade_25.bb
index f73e72442b..e6d441fa86 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_25.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_25.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/OpenAoE/vblade;branch=master;protocol=https \
            file://volatiles.99_vblade \
           "
 
-
 UPSTREAM_CHECK_URI = "https://github.com/OpenAoE/vblade/archive/"
 
 inherit update-rc.d systemd
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index 9b2be6236b..c6d90ee9a4 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -31,7 +31,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
                         file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
 SRC_URI[sha256sum] = "26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3"
 
-
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
 
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
index a4e5f5ca46..6fc994a90a 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
            "
 SRCREV = "7cf7465b784baded4de183290c547d582becfd28"
 
-
 inherit autotools manpages pkgconfig ptest
 
 DEPENDS += "ctags-native"
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
index fdef5473ef..eb70089c43 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
@@ -20,7 +20,6 @@ SRCREV = "f7a64114b35fd8ee63ce07290f8a2dffd52b215f"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https \
            file://run-ptest"
 
-
 UPSTREAM_CHECK_COMMITS = "1"
 
 inherit python_setuptools_build_meta ptest
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
index 06b2fa4d2d..9737bee31c 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
 
 inherit autotools pkgconfig
 
-
 # libknet/transport_udp.c:326:48: error: comparison of integers of different signs: 'unsigned long' and 'int' [-Werror,-Wsign-compare]
 # for (cmsg = CMSG_FIRSTHDR(&msg);cmsg; cmsg = CMSG_NXTHDR(&msg, cmsg)) {
 #                                                             ^~~~~~~~~~~~~~~~~~~~~~~
diff --git a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
index a110d556a3..fea4e07029 100644
--- a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
@@ -17,7 +17,6 @@ SRC_URI += "file://tgtd.init \
             file://tgtd \
 "
 
-
 CONFFILES:${PN} += "${sysconfdir}/tgt/targets.conf"
 
 inherit update-rc.d systemd
diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
index 20ba132fd0..f0634f31f4 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 SRCREV = "c8dfd85b9e8e453e279525f30c1e3184c092f036"
 SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https"
 
-
 inherit systemd
 
 do_install() {
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
index a6e6b9b153..bb119d9b63 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
@@ -9,5 +9,4 @@ SRCREV = "b0e4be94c0b8f68d4e912402b93a130063c34e17"
 
 SRC_URI = "git://git.netfilter.org/libnetfilter_log;branch=master"
 
-
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
index ccaa80f5ff..40153acf19 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
@@ -11,7 +11,6 @@ SRCREV = "2ff321690b8dafeca99ee8e9cafac71e36f292b9"
 SRC_URI = "git://git.netfilter.org/libnetfilter_queue;branch=master \
            "
 
-
 inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
index 2778185618..c7fd0cf8e1 100644
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
@@ -8,7 +8,6 @@ HOMEPAGE = "https://www.netfilter.org/projects/libnfnetlink/index.html"
 SECTION = "libs"
 LICENSE = "GPL-2.0-or-later"
 
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRC_URI = "https://www.netfilter.org/projects/libnfnetlink/files/${BPN}-${PV}.tar.bz2 \
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
index abcebceab8..e70b9efcbf 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${BP} \
            "
 SRCREV = "17190762f33f78090f5ff99a436c4cb866ac3ccd"
 
-
 inherit autotools pkgconfig ptest
 
 DEPENDS = "libmnl"
diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
index febcf5147c..7c77d33753 100644
--- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://git.netfilter.org/ulogd2;branch=master \
 "
 SRCREV = "79aa980f2df9dda0c097e8f883a62f414b9e5138"
 
-
 inherit autotools manpages pkgconfig systemd update-rc.d
 
 PACKAGECONFIG ?= "dbi json nfacct nfct nflog pcap sqlite3 ulog"
diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
index 7356115d53..49f1a4168e 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -9,7 +9,6 @@ SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https"
 
 SRCREV = "bf253640d33d03331310778e001fb6f5aba2989e"
 
-
 inherit autotools-brokensep pkgconfig
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
index d80bdd87ab..94d5c7996f 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
@@ -22,7 +22,6 @@ MODULES_INSTALL_TARGET = "module-install"
 RRECOMMENDS:${PN} = "kernel-module-xt-hashlimit"
 MODULE_NAME = "wireguard"
 
-
 # WireGuard has been merged into Linux kernel >= 5.6 and therefore this compatibility module is no longer required.
 # OE-core post dunfell has moved to use kernel 5.8 which now means we cant build this module in world builds
 # for reference machines e.g. qemu
diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb b/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
index cc69f1448a..4c383cad37 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
@@ -17,7 +17,6 @@ SRCREV = "3d61ea1e843e2c5f9706c74d1adad4e1d24d44b9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
 
-
 EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
 
 do_compile () {
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
index 89b2572c04..8b84676a4d 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
@@ -27,7 +27,6 @@ SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=mast
     file://0001-fixes-for-gcc-15.patch \
     "
 
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=868c059b6147748b1d621e500feeac4f"
 
diff --git a/meta-networking/recipes-protocols/frr/frr_10.3.bb b/meta-networking/recipes-protocols/frr/frr_10.3.bb
index f0f3f34ab3..bad07457e1 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.3.bb
@@ -9,7 +9,6 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"
 
-
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.3 \
            file://frr.pam \
            "
@@ -20,7 +19,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
 CVE_PRODUCT = "frrouting"
 
-
 inherit autotools-brokensep python3native pkgconfig useradd systemd
 
 DEPENDS:class-native = "bison-native elfutils-native"
diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb b/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
index b7f5112197..53ac161dd7 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
@@ -21,7 +21,6 @@ SRC_URI = " \
     file://0001-fix-build-do-not-install-git-files.patch \
 "
 
-
 inherit cmake python3native
 
 EXTRA_OECMAKE += "\
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 1588245f8a..a96915cfc1 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -37,7 +37,6 @@ EXTRA_OECONF += " \
                 "
 DEPENDS:append:libc-musl = " libexecinfo"
 
-
 inherit autotools-brokensep pkgconfig
 
 do_configure:prepend() {
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
index ad72b5cdde..b34fed40ce 100644
--- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "http://open-lldp.org/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
 
-
 inherit pkgconfig autotools
 inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index 42e9c4260f..e9610b2a40 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -4,7 +4,6 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
-
 SRC_URI = "https://downloads.uls.co.za/rp-pppoe/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index 8f21620584..a557e53e9f 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -6,7 +6,6 @@ SRCREV = "848eca82f92273af9a79687a90343a2ebcf3481d"
 SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
           "
 
-
 UPSTREAM_CHECK_COMMITS = "1"
 
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
index f854078004..fca88a98ec 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
@@ -26,7 +26,6 @@ COMPATIBLE_HOST:libc-musl = 'null'
 
 DEPENDS = "boost dlt-daemon googletest"
 
-
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DINSTALL_LIB_DIR:PATH=${baselib} \
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
index e1638bfa19..3bb57adc3e 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
@@ -15,7 +15,6 @@ SRCREV = "1ef2a025981223c1e16fc833bef226c86ff8c295"
 
 UPSTREAM_CHECK_URI = "https://github.com/xelerance/xl2tpd/releases"
 
-
 inherit update-rc.d
 
 do_compile () {
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index cb26699212..7ea5cdcf35 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
                     file://zeroconf.c;beginline=1;endline=13;md5=a5bada96e1e34b08eb7446b28e2630b2"
 SECTION = "net"
 
-
 SRC_URI = "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-${PV}.tar.gz \
            file://compilefix.patch \
            file://makefile-add-ldflags.patch \
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
index 59e3dbae5f..03b3501c9e 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -15,7 +15,6 @@ SRC_URI = "\
     file://0004-cleanup-includes.patch \
 "
 
-
 CVE_PRODUCT = "kernel:bridge-utils"
 
 inherit autotools-brokensep update-alternatives
diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
index a9a664c196..e58287687b 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -21,7 +21,6 @@ SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=htt
            file://0001-tests-Include-entcode.c-into-test-sources-to-provide.patch \
            "
 
-
 inherit pkgconfig autotools-brokensep
 
 PACKAGECONFIG:class-native = ""
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index 25ea1fdefb..92fac91be3 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https \
 
 SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
 
-
 inherit cmake pkgconfig binconfig
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
index 4c520e8c78..9dcb3c0386 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
@@ -18,7 +18,6 @@ SRCREV_drbd-headers = "94f4472513f351efba5788f783feba6ac6efe9fc"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
-
 UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
 
 SYSTEMD_SERVICE:${PN} = "drbd.service"
diff --git a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
index badeed8e82..69eeb22080 100644
--- a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
+++ b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/nhorman/dropwatch.git;protocol=https;nobranch=1 \
 "
 SRCREV = "1e7e487a019a7c02f1f429c4d3a4647fa3787a13"
 
-
 DEPENDS = "binutils libnl libpcap readline"
 
 inherit pkgconfig autotools
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index d5dc10a889..a83468c28c 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -25,7 +25,6 @@ SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https \
 
 SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
 
-
 EXTRA_OECMAKE = " \
     -DCMAKE_SKIP_RPATH=TRUE \
     -DBUNDLED_LIBS=ON \
diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index 9c2535b95b..5879c26646 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -20,7 +20,6 @@ inherit cpan ptest
 
 EXTRA_CPANFLAGS = "LIBS='-L${STAGING_LIBDIR}' INC='-I${STAGING_INCDIR}'"
 
-
 # perl scripts and some special small data files
 #
 do_install_ptest () {
diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 7482dba64a..133caba822 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -36,7 +36,6 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad \
                     file://LICENSE;md5=0388276749a542b0d611601fa7c1dcc8 "
 
-
 inherit autotools
 
 EXTRA_OECONF = "--disable-static               \
@@ -84,7 +83,6 @@ do_configure_ptest() {
         ${S}/test/test-geoip-region.c
 }
 
-
 do_install_ptest() {
     oe_runmake -C test DESTDIR=${D}  install-testPROGRAMS
     install ${S}/test/*.txt ${D}${PTEST_PATH}/tests
diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
index 7def915db5..f7e9380cf7 100644
--- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778"
 SRC_URI = "git://github.com/nodejs/http-parser.git;branch=master;protocol=https"
 SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
 
-
 EXTRA_OEMAKE = "PLATFORM=linux"
 
 do_configure[noexec] = "1"
diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
index bc0975ecc1..edd9c73880 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253
 SRCREV = "62e60904afbe58fda0c7104fdad1c4f618266ba6"
 SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
 
-
 do_install() {
     install -m 0755 -D ${S}/debian/ifenslave.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/ifenslave
     install -m 0755 -D ${S}/debian/ifenslave.if-post-down ${D}${sysconfdir}/network/if-post-down.d/ifenslave
diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
index 18970751c3..4d435790d9 100644
--- a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
@@ -9,5 +9,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
 SRCREV = "c341e55be386649c0a5347eefeae410753c4e753"
 
-
 inherit meson
diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb b/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
index 03cd877901..d038cfd686 100644
--- a/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
+++ b/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
@@ -11,7 +11,6 @@ DEPENDS = "curl openssl"
 SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=1.11.x"
 SRCREV = "bb01c8db702fb41e5497aee9c0559ddf4bf13749"
 
-
 inherit cmake
 
 # building tests is currently using FetchContent for mongoose
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
index 50f83221c0..b3310ec519 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/libesmtp/libESMTP.git;branch=master;protocol=https \
            file://0001-Add-build-option-for-NTLM-support.patch"
 SRCREV = "1d0af244310a66943ab400be56b15a9087f181eb"
 
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742 \
                     file://COPYING.GPL;md5=393a5ca445f6965873eca0259a17f833"
 
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
index 407194792f..77e6759346 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
@@ -17,7 +17,6 @@ SRC_URI = " \
     file://v6test.sh \
 "
 
-
 BBCLASSEXTEND = "native"
 
 inherit autotools-brokensep pkgconfig binconfig ptest
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index b442fb9f56..f05204f1f3 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/linux-wpan/lowpan-tools;branch=master;protocol=https
            "
 SRCREV = "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
 
-
 inherit autotools python3-dir pkgconfig
 
 CACHED_CONFIGUREVARS += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR}/lowpan-tools"
diff --git a/meta-networking/recipes-support/mctp/mctp_2.1.bb b/meta-networking/recipes-support/mctp/mctp_2.1.bb
index 04fecf7aca..9b6d694693 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.1.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.1.bb
@@ -10,7 +10,6 @@ SRCREV = "dd944cf5b5a8b834f3685bcb2017190258dbcd0b"
 SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https \
            file://0001-mctp-bench-Adjust-headers.patch"
 
-
 inherit meson pkgconfig systemd
 
 EXTRA_OEMESON = " \
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
index 52e7e53c32..d2877d62e9 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
@@ -3,7 +3,6 @@ require mdio-tools.inc
 DEPENDS += "virtual/kernel libmnl"
 # This module requires Linux 5.6 higher
 
-
 inherit module
 
 EXTRA_OEMAKE = "-C kernel/ KDIR=${STAGING_KERNEL_DIR}"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
index 2c8f9b8c37..a08532b9e9 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
@@ -2,7 +2,6 @@ require mdio-tools.inc
 
 DEPENDS += "virtual/kernel libmnl"
 
-
 inherit pkgconfig autotools
 
 RRECOMMENDS:${PN} = "kernel-module-mdio-netlink"
diff --git a/meta-networking/recipes-support/mtr/mtr_0.95.bb b/meta-networking/recipes-support/mtr/mtr_0.95.bb
index ac8b48e4e5..e991b313e4 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.95.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.95.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRCREV = "852e5617fbf331cf292723702161f0ac9afe257c"
 SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https"
 
-
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--without-gtk"
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
index 1c9db1e956..55f620dd4c 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
            file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch"
 SRCREV = "6c02c6a469d62a047f230b0ccf03f72328312d2b"
 
-
 DEPENDS = "curl xz e2fsprogs zlib"
 
 # autotools-brokensep is needed as nbdkit does not support build in external directory
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
index 9e7bdc9966..1261694e2a 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v
            "
 SRCREV = "2d0f232b590f4001881dd0819f55af72b88c4b2f"
 
-
 DEPENDS = "curl xz e2fsprogs zlib"
 
 # autotools-brokensep is needed as nbdkit does not support build in external directory
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
index 6931c64d4a..7152380def 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-Remove-use-of-variables-indicating-buildtime-informa.patch \
            "
 
-
 DEPENDS = "coreutils-native"
 
 inherit autotools gettext
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index fd36aadd7e..28ca1c0e74 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -2,7 +2,6 @@ require netcat.inc
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
            file://obsolete_autoconf_macros.patch \
            file://netcat-locale_h.patch \
diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index cddb0ead2f..e13f420724 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -18,7 +18,6 @@ DEPENDS += "augeas libnl libxslt libxml2"
 
 do_configure[depends] += "${MLPREFIX}gnulib:do_populate_sysroot"
 
-
 inherit gettext autotools perlnative pkgconfig systemd
 
 EXTRA_OECONF:append:class-target = " --with-driver=redhat"
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index 4043da5621..96f3cdbff1 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -21,7 +21,6 @@ SRC_URI = "git://github.com/HewlettPackard/netperf.git;branch=master;protocol=ht
 
 SRCREV = "3bc455b23f901dae377ca0a558e1e32aa56b31c4"
 
-
 inherit update-rc.d autotools texinfo systemd
 
 # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
index 58ace6263d..b2e151ede7 100644
--- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
+++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
@@ -10,7 +10,6 @@ SRC_URI = " \
 	file://0001-Cmds-automatically-create-folder.patch \
 	"
 
-
 inherit pkgconfig
 
 EXTRA_OEMAKE += " TERM='' "
diff --git a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
index 54fd68ed43..ce3b46c37c 100644
--- a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://github.com/thkukuk/yp-tools;branch=master;protocol=https \
            file://domainname.service \
            "
 
-
 DEPENDS = "libtirpc libnsl2 virtual/crypt"
 
 inherit autotools systemd
diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-networking/recipes-support/ntimed/ntimed_git.bb
index 36fba5f57b..6f9eb902aa 100644
--- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
+++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/bsdphk/Ntimed;branch=master;protocol=https \
 PV = "0.0+git"
 SRCREV = "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
 
-
 # use adjtimex on musl
 CFLAGS:append:libc-musl = " -Dntp_adjtime=adjtimex"
 
diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
index f0175167a4..60d0052c5d 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.2-stable;protocol=https \
            file://0001-autogen.sh-not-generate-configure.patch \
            "
 
-
 inherit autotools-brokensep pkgconfig
 
 CPPFLAGS += "${SELECTED_OPTIMIZATION}"
diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
index 014706893a..729d57fad1 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
@@ -23,7 +23,6 @@ SRC_URI = "git://github.com/ntop/ntopng.git;protocol=https;branch=5.2-stable \
            file://ntopng.service \
            "
 
-
 # don't use the lua under thirdparty as it supports cross compiling badly
 export LUA_LIB = "${STAGING_LIBDIR}/liblua.a"
 
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index 33d19a696a..d545d27c31 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -54,7 +54,6 @@ CVE_STATUS_NTP = " \
     CVE-2016-9311 \
 "
 
-
 inherit autotools update-rc.d useradd systemd pkgconfig
 
 # For some reason this recipe reconfigures the nested configure.ac files in
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
index 5c38f6b5dc..cd06be3b76 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/open-iscsi/open-isns;branch=master;protocol=https \
 
 SRCREV = "c0e6d9fedc5a7041260de477fe1a8455fa074113"
 
-
 inherit systemd autotools-brokensep update-rc.d
 
 EXTRA_OECONF = " --prefix=${prefix} --enable-shared"
diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
index 6471f46c28..83f831f242 100644
--- a/meta-networking/recipes-support/phytool/phytool.bb
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -6,7 +6,6 @@ PV = "2+git"
 SRCREV = "8882328c08ba2efb13c049812098f1d0cb8adf0c"
 SRC_URI = "git://github.com/wkz/phytool.git;branch=master;protocol=https"
 
-
 # The Makefile has "$PREFIX/bin" hardcoded into it, hence not using $bindir here
 do_install() {
     install -d ${D}${prefix}/bin
diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
index bb12d7a907..4773684612 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
@@ -8,5 +8,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "b315d06ddb0dad16a52fe91e5831b4030ce37010"
 SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https"
 
-
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
index 12fe3ececa..bab7e8585d 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
@@ -18,7 +18,6 @@ DEPENDS = "\
 SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master"
 SRCREV = "dad1033640f249fa4994f976cf6ee96826c15702"
 
-
 inherit cmake pkgconfig
 
 PACKAGECONFIG ?= "\
diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
index 1a2d9dc9c4..2731271183 100644
--- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
@@ -8,7 +8,6 @@ SRCREV = "7b07684ea6698d4885ff2062350ad8798a04de42"
 
 SRC_URI = "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master"
 
-
 inherit meson pkgconfig
 
 do_configure:prepend() {
diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 3588d674f7..9290e96865 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -14,7 +14,6 @@ SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=https;bra
 
 CVE_STATUS[CVE-2012-4425] = "fixed-version: fixed since 0.15.3"
 
-
 DEPENDS = " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland wayland-native wayland-protocols', '', d)} \
diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
index b13dd5d148..4baf0a618d 100644
--- a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
+++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
@@ -7,7 +7,6 @@ SRCREV = "aa08162f036840d3e33502dc0a836b03b9cec97c"
 
 SRC_URI = "git://gitlab.freedesktop.org/spice/linux/vd_agent.git;protocol=https;branch=master"
 
-
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl x11"
 
diff --git a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
index 7f08eebee7..a42e4f2c4a 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
@@ -12,7 +12,6 @@ SRCREV = "6f453a775d87087c6ba59fc180c1a1e466631a47"
 
 SRC_URI = "git://gitlab.freedesktop.org/spice/spice-protocol.git;protocol=https;branch=master"
 
-
 inherit meson pkgconfig
 
 ALLOW_EMPTY:${PN} = "1"
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index c9418a1765..1a7a1a5c6a 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -19,7 +19,6 @@ SRCREV = "0c2c1413a8b387ea597a95b6c867470a7c56c8ab"
 
 SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice;branch=master;protocol=https"
 
-
 CVE_STATUS[CVE-2016-0749] = "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2016-2150] = "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2018-10893] = "fixed-version: patched already, caused by inaccurate CPE in the NVD database."
diff --git a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
index 81c7fdf0c8..970950fe91 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
@@ -11,7 +11,6 @@ SRCREV = "2d373432e604960c1dcc14fb97098febe4d64025"
 
 SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https"
 
-
 inherit meson pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
index 771470f695..d53c73083e 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
@@ -65,7 +65,6 @@ PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
 # tpm needs meta-tpm layer
 PACKAGECONFIG[tpm2] = "--enable-tpm,--disable-tpm,,${PN}-plugin-tpm"
 
-
 # integraty configuration needs meta-integraty
 #imc 
 PACKAGECONFIG[tnc-imc] = "--enable-tnc-imc,--disable-tnc-imc,,  ${PN}-plugin-tnc-imc ${PN}-plugin-tnc-tnccs"
diff --git a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
index c35148b77e..fe174a9247 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
@@ -26,7 +26,6 @@ inherit autotools pkgconfig systemd update-rc.d ptest
 DEPENDS = "openssl libtool-native bison-native expat"
 RDEPENDS:${PN} = "bash openssl-bin daemonize"
 
-
 EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
                 --disable-rpath --with-ssl=${STAGING_EXECPREFIXDIR} \
                 --enable-largefile"
diff --git a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb b/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
index 4857c0af4f..73d2e00a4c 100644
--- a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
+++ b/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
@@ -22,6 +22,5 @@ EXTRA_OEMAKE = "\
     CC='${CC}' CFLAGS='${CFLAGS} -pthread -I${STAGING_INCDIR}/libnl3' \
 "
 
-
 # wavemon does not support using out-of-tree builds
 inherit autotools-brokensep pkgconfig
diff --git a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
index 2f5ebe53ae..4ed281a4a1 100644
--- a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
+++ b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
@@ -11,5 +11,4 @@ DEPENDS = "libnl"
 SRC_URI = "git://github.com/linux-wpan/wpan-tools;branch=master;protocol=https"
 SRCREV = "91b0f038aef2f62cb6a222d190b887fdfd6bc164"
 
-
 inherit autotools pkgconfig
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
index a32c9403c8..5f13096a07 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -20,7 +20,6 @@ SRCREV = "8416326777b2aada0706539b8f9f6acefa476b16"
 SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master \
            file://0001-include-missing-cstdint.patch"
 
-
 inherit meson pkgconfig python3native
 
 PACKAGECONFIG ?= "python static"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
index ef1945b4fe..c636faf658 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
@@ -22,7 +22,6 @@ SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined
 
 SRCREV = "01045f683b9419beb90119497cd1b2be44e83b8e"
 
-
 DEPENDS = "glib-2.0 libyaml util-linux-libuuid \
            systemd python3-cffi-native \
           "
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
index 57e162cabd..3cafbd9513 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
@@ -40,7 +40,6 @@ SRC_URI += "file://bacnet.json \
             file://thingsboard-gateway.service \
             "
 
-
 inherit systemd
 
 SYSTEMD_PACKAGES = "${PN}"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 23515d9fa8..0d202db3b7 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -48,7 +48,6 @@ SRC_URI:append:toolchain-clang = "\
            file://0001-asio-Dont-use-experimental-with-clang.patch \
            "
 
-
 CVE_STATUS[CVE-2014-8180] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
 CVE_STATUS[CVE-2017-2665] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
index 4fe3995cd5..ccae04aaa1 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 SRC_URI = "git://github.com/nanopb/nanopb.git;branch=maintenance_0.4;protocol=https"
 SRCREV = "cad3c18ef15a663e30e3e43e3a752b66378adec1"
 
-
 inherit cmake
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
index d4987acede..38d6ff1a40 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
@@ -13,7 +13,6 @@ PV = "0.5.9+git"
 SRCREV = "0e2ce9b9c46c47363436f9ee730f7c71bf455f0f"
 SRC_URI = "git://github.com/lcdproc/lcdproc;branch=master;protocol=https"
 
-
 inherit autotools pkgconfig update-rc.d
 
 LCD_DRIVERS ?= "all,!irman,!svga${SERIALVFD}"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
index 5d204d7d94..7f4a64d8f2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
@@ -20,7 +20,6 @@ PACKAGECONFIG[utils] += "-Dutils=true, -Dutils=false"
 
 DEPENDS += "libdrm libevdev fmt"
 
-
 inherit meson pkgconfig
 
 do_install:append() {
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
index cf2d54c07d..c1a8cccca1 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN} += "python3 python3-six python3-pyparsing python3-configshell-fb"
 SRCREV = "d323d5a3091af490502c5d025ec7361a3a2cfbd9"
 SRC_URI = "git://git.infradead.org/users/hch/nvmetcli.git;branch=master"
 
-
 do_install:append() {
     # Install example configuration scripts.
     install -d ${D}${datadir}/nvmet
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
index ee65f89ab7..01565a9fa1 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
@@ -38,7 +38,6 @@ SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=h
 
 SRCREV = "c098579d4fa0f004ccc204c5bc46eac3717cba28"
 
-
 inherit features_check meson mime mime-xdg pkgconfig python3native
 
 REQUIRED_DISTRO_FEATURES = "opengl"
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
index 301861de38..05ea730fc2 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
 
 SRCREV = "db0870edd2919f4f4d0101843136bcae92ab0743"
 
-
 DEPENDS = "libtraceevent"
 RDEPENDS:${BPN} = "perl perl-module-file-basename perl-module-file-find perl-module-file-spec perl-module-getopt-long \
 	perl-module-posix perl-module-file-glob libdbi-perl libdbd-sqlite-perl"
diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
index feda6599a8..bb0a768162 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/ssvb/cpuburn-arm.git;branch=master;protocol=https \
            file://0003-burn.S-Remove-.func-.endfunc.patch \
            "
 
-
 do_compile() {
 
     # If the arch is set to ARM 64-bit -  we only produce and ship burn-a53 version.
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
index 345c7f08e7..ad78b6d3b1 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
@@ -27,7 +27,6 @@ SRCREV = "a6e474c9e896e4ba1eb40066a03402afb040710a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "fio-(?P<pver>\d+(\.\d+)+)"
 
-
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 8bcb763f06..ebf947915d 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -21,7 +21,6 @@ SRC_URI = " \
 "
 SRCREV = "42e3d8fe3aa88743ef90348138f643f7b04a9237"
 
-
 inherit meson pkgconfig features_check
 
 ANY_OF_DISTRO_FEATURES = "opengl dispmanx"
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index 08f29937c0..d4b4d08892 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -20,7 +20,6 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
 
-
 inherit autotools
 
 PACKAGECONFIG ?= "openssl"
diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
index ae87262870..f434023dcd 100644
--- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
+++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://git.musl-libc.org/libc-bench;branch=master \
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_install () {
     install -d ${D}${bindir}
     install -m 0755 ${B}/libc-bench ${D}${bindir}
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index e688d6ede2..636684a096 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -28,7 +28,6 @@ SRC_URI = " \
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index acd4d6decf..15ef13dac4 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -10,7 +10,6 @@ inherit autotools-brokensep update-alternatives
 DEPENDS += "libtirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://lmbench-run \
            file://rename-line-binary.patch \
diff --git a/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb b/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
index 1fd95de038..bcebc59eda 100644
--- a/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
+++ b/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/raas/${BPN}.git;branch=master;protocol=https"
 
 SRCREV = "c3155b544a5065e8235508059c6512af6c46bd4d"
 
-
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${B}/mbw ${D}${bindir}
diff --git a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
index e034371604..8ac836b6a4 100644
--- a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
+++ b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
@@ -9,7 +9,6 @@ inherit autotools-brokensep
 SRCREV = "c706363815a38ff2c5cbc07b73e2cfaaa59bae0f"
 SRC_URI = "git://github.com/linux-rdma/qperf.git;protocol=https;branch=master"
 
-
 do_configure() {
   ./cleanup
   ./autogen.sh
diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index caefdb7b6b..e0b94ff5e2 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
 # upstream updates
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 # installing in /opt/S-suite since the package has
 # dependencies to the directory structure.
 do_install() {
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
index 2d450094b7..a9e9838202 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
@@ -18,5 +18,4 @@ GI_DATA_ENABLED:libc-musl:armv7a = "False"
 GI_DATA_ENABLED:libc-musl:armv7ve = "False"
 SRC_URI = "git://github.com/stressapptest/stressapptest;branch=master;protocol=https"
 
-
 inherit autotools
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
index 198552e5c6..b0a65c649c 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
@@ -13,7 +13,6 @@ inherit autotools-brokensep pkgconfig
 SRC_URI = "git://github.com/akopytov/sysbench.git;protocol=https;branch=master"
 SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"
 
-
 COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64).*-linux*"
 
 EXTRA_OECONF += "--enable-largefile --with-system-luajit --with-system-ck --without-gcc-arch --with-lib-prefix=no"
diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 8f65a6135c..e11f4ef2f2 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/ssvb/tinymembench.git;branch=master;protocol=https \
            file://0001-asm-Delete-.func-.endfunc-directives.patch \
            "
 
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index 98914836ed..dad112ac92 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-
 SRC_URI = "\
     http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${BP}.tar.gz \
     file://tiobench-makefile.patch \
diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
index ec3cdcaa75..e61f38d960 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
@@ -10,7 +10,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
 SRC_URI = "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=https;branch=master"
 SRCREV = "f03c50b22ae3fda26711ddabd91e2c5dd8103478"
 
-
 CVE_PRODUCT = "freedesktop:bolt"
 
 inherit cmake pkgconfig meson features_check
diff --git a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
index 515c009ead..e613075376 100644
--- a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
+++ b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
@@ -16,6 +16,5 @@ SRC_URI = "git://gitlab.com/pibox/con2fbmap.git;protocol=https;branch=master \
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit autotools
 
diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
index 9e23a4b67d..ff04b16b28 100644
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
@@ -19,8 +19,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 EXTRA_OEMAKE:append = " ${@['', 'NLS=false']['${USE_NLS}' == 'no']} "
 
-
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 EXTRA_OEMAKE = "V=1 CROSS=${TARGET_PREFIX} STRIPCMD=echo 'CP=cp'"
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
index e0041b58e6..8cfed09d6d 100644
--- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
@@ -16,7 +16,6 @@ EXTRA_OEMAKE = "NOSTRIP=1 DESTDIR=${D} PREFIX=${prefix}"
 
 PV = "1.0+${SRCPV}"
 
-
 do_install() {
     oe_runmake install
 }
diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
index 0d8f3c8a6b..0cef6a2d9f 100644
--- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
@@ -13,7 +13,6 @@ DEPENDS = " sysfsutils"
 SRCREV = "1c57818ecee186aa47af0342149577df5302c022"
 PV = "0.18+git"
 
-
 SRC_URI = "git://github.com/grondo/edac-utils;branch=master;protocol=https \
     file://make-init-script-be-able-to-automatically-load-EDAC-.patch \
     file://add-restart-to-initscript.patch \
diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
index 1542ee73d1..0e0edc93a7 100644
--- a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
+++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
@@ -16,7 +16,6 @@ SRCREV = "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 DEPENDS = "glib-2.0 systemd"
 
 inherit pkgconfig autotools systemd features_check
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
index a098bf8eea..6f4224dcd0 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
@@ -75,7 +75,6 @@ PACKAGECONFIG[sqlite] = "-Dsqlite=enabled,-Dsqlite=disabled,sqlite3"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
 
-
 # TODO plugins-all meta-option that expands to all plugin_*?
 PACKAGECONFIG[plugin_acpi_phat] = "-Dplugin_acpi_phat=enabled,-Dplugin_acpi_phat=disabled"
 PACKAGECONFIG[plugin_android_boot] = "-Dplugin_android_boot=enabled,-Dplugin_android_boot=disabled"
diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
index d3d08720a6..1600b39582 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -21,5 +21,4 @@ SRC_URI = "\
 "
 SRCREV = "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"
 
-
 inherit autotools
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
index ff3b29406b..ba50f00432 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
@@ -23,7 +23,6 @@ SRCREV = "b0edae14e8660b80ffe0384354038a9f62e2978d"
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 COMPATIBLE_HOST:libc-musl = "null"
 
-
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd', '', d)}"
 
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index af0f5a7999..933503a139 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -44,7 +44,6 @@ SYSTEMD_SERVICE:${PN}-fancontrol = "fancontrol.service"
 SYSTEMD_SERVICE:${PN}-sensord = "sensord.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-
 EXTRA_OEMAKE = 'EXLDFLAGS="${LDFLAGS}" \
         MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
         LIBDIR=${libdir} \
@@ -123,7 +122,6 @@ PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
 # isadump and isaset helper program
 PACKAGES =+ "${PN}-isatools ${PN}-isatools-doc"
 
-
 # libsensors files
 FILES:${PN}-libsensors = "${libdir}/libsensors.so.* ${sysconfdir}/sensors3.conf ${sysconfdir}/sensors.d"
 FILES:${PN}-libsensors-dev = "${libdir}/libsensors.so ${includedir}"
diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 0bdd8042f8..2f434a1980 100644
--- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "udev sysfsutils flex-native bison-native"
 RDEPENDS:${PN} = "udev module-init-tools"
 
-
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz \
            file://makefile_fix.patch \
            file://makefile_race.patch \
diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
index fc020695e3..3256c7051d 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
@@ -9,5 +9,4 @@ SRCREV = "21046ebc4a5475c14cea446715734c88fe33d276"
 
 DEPENDS = "openssl boost"
 
-
 inherit cmake
diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 06f0b5bf0a..0063c0b036 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/labapart/gattlib.git;branch=master;protocol=https \
 SRCBRANCH = "master"
 SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
 
-
 CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"
 
 PACKAGECONFIG[examples] = "-DGATTLIB_BUILD_EXAMPLES=ON,-DGATTLIB_BUILD_EXAMPLES=OFF"
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
index 9325b1e5dc..28b43d2b83 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
@@ -9,7 +9,6 @@ SRCREV = "e4dbb9687bd5e887fa98a4cdcec012ea85da1ef2"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-
 inherit autotools
 
 PACKAGECONFIG ??= "openssl tcp-wrappers"
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
index 693afe6c53..83be5233e7 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -13,7 +13,6 @@ SRC_URI = " \
     file://hostapd.service \
 "
 
-
 SRC_URI[sha256sum] = "2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e330219fe7aed1747a"
 
 inherit update-rc.d systemd pkgconfig features_check
diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
index 27d28d71cb..2041e2a8a2 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
@@ -14,7 +14,6 @@ inherit meson pkgconfig bash-completion gobject-introspection upstream-version-i
 SRCREV = "e10df4b6b3edfe6a46d93f7f5f5cab31c29a7091"
 SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
 
-
 EXTRA_OEMESON = " \
     -Dgtk_doc=false \
     -Dman=false \
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
index 0594b2485e..dc36d95a81 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/libnet/libnet.git;protocol=https;branch=master"
 SRC_URI[sha256sum] = "1e9e9054d688b059bcbaf878d8c4fbf69bfc0c9386cd4e7779fbb53339050d2e"
 SRCREV = "deaebdfe2743e8a6f04d3c307d9272afeeecfade"
 
-
 inherit autotools binconfig multilib_script
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/libnet-config"
 
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
index 8dc7ec3773..03138ff450 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
@@ -15,7 +15,6 @@ inherit meson pkgconfig bash-completion gobject-introspection upstream-version-i
 SRCREV = "3f07d6e5b4677558543b3b4484ea88ad92257e92"
 SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-34"
 
-
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,libgudev"
 PACKAGECONFIG[mbim] = "-Dmbim_qmux=true,-Dmbim_qmux=false,libmbim"
diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
index f195008650..f869cb3bc5 100644
--- a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
+++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib.git;protoc
 PV = "1.2.2+git"
 SRCREV = "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
 
-
 inherit meson pkgconfig gobject-introspection
 
 DEPENDS = "glib-2.0"
diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
index 6bfcbec25f..c84893043e 100644
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
@@ -13,7 +13,6 @@ SRCREV = "74bc93a37a5e31c78f0aa02037a68fb9ac5deb41"
 SRCREV_try_signal = "105cce59972f925a33aa6b1c3109e4cd3caf583d"
 SRCREV_FORMAT .= "_try_signal"
 
-
 inherit cmake pkgconfig python3targetconfig
 
 CVE_PRODUCT = "libtorrent"
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
index 220bb62c64..5cda75c572 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
@@ -13,7 +13,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_STATUS[CVE-2009-1760] = "backported-patch: patched in our product"
 
-
 CVE_PRODUCT = ""
 
 PACKAGECONFIG ??= "instrumentation aligned"
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
index 82cc1167e2..55aca95e73 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
@@ -14,7 +14,6 @@ DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 SRCREV = "03f786ce66360d67c669f4f122f8aa458e6f01ea"
 SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-22"
 
-
 # strict, permissive
 MODEMMANAGER_POLKIT_TYPE ??= "permissive"
 
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
index ad6637ed88..7e5ae79c60 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
@@ -19,7 +19,6 @@ SRCREV = "2150ba29d9df24ad1733c460eb099f292af84ee5"
 
 DEPENDS = "openssl"
 
-
 inherit cmake
 
 do_configure:prepend() {
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
index d1674403f0..f89e47889e 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master;t
 
 DEPENDS = "openssl paho-mqtt-c"
 
-
 inherit cmake
 
 EXTRA_OECMAKE += "-DPAHO_WITH_SSL=ON -DPAHO_BUILD_EXAMPLES=OFF"
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
index a04102aa42..e899cad201 100644
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master
           "
 SRCREV = "4af4b8b04e6d5dd40b8e69cc30c5c1f62e7fe368"
 
-
 inherit cmake
 
 PACKAGECONFIG ??= ""
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
index 4fd6302f2c..8d44e95955 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
@@ -7,7 +7,6 @@ SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
 "
 SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
 
-
 DEPENDS = "popt openssl"
 
 EXTRA_OECMAKE = "-DBUILD_EXAMPLES=OFF -DBUILD_TOOLS=ON -DBUILD_TOOLS_DOCS=OFF -DBUILD_API_DOCS=OFF"
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
index 02a97cd6e3..51b528d64d 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
@@ -8,7 +8,6 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https"
 SRCREV = "a88cab6d2e764e22cac232ef8d5af039d41b8280"
 
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
index e5a3f88867..ef4ea7df9e 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
@@ -13,7 +13,6 @@ SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084"
 
-
 S = "${UNPACKDIR}/${BPN}"
 
 EXTRA_OEMAKE += "LFLAGS='${LDFLAGS}'"
diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
index 5d0dd6a389..aa66ee047c 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
@@ -15,7 +15,6 @@ SRC_URI = " \
 # Transmission release 4.0.6
 SRCREV = "38c164933e9f77c110b48fe745861c3b98e3d83e"
 
-
 inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
 
 LDFLAGS:append:riscv32 = " -latomic"
diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 5a880ed6d2..51a8014d5b 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -14,7 +14,6 @@ PV = "1.1.2+git"
 SRCREV = "01c94c77f59404924f1c46d99c4e5e0c7817281b"
 SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https;branch=master"
 
-
 EXTRA_OECONF += "--without-preflight"
 
 FILES:${PN} += "${base_libdir}/udev/rules.d/"
diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
index e411e6efc0..55772eb388 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
@@ -8,7 +8,6 @@ SRCREV = "c94c20743ed7d4aa37835a5c46567ab0790d4acc"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master;protocol=https"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DCPPZMQ_BUILD_TESTS=OFF"
diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index 0908409e1e..54ac934331 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -12,7 +12,6 @@ DEPENDS = "libsigc++-3"
 
 RDEPENDS:${PN}:class-target = "${VIRTUAL-RUNTIME_dbus}"
 
-
 inherit pkgconfig cmake
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index e99bf28ce5..51ba25b86a 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/alban/dbus-daemon-proxy;branch=master;protocol=https
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit pkgconfig
 
 do_compile() {
diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index 3f3b5bc920..72938cd620 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -10,8 +10,6 @@ inherit update-rc.d
 
 INITSCRIPT_NAME = "${BPN}"
 
-
-
 do_compile() {
     oe_runmake nbcat
     oe_runmake mkemlog
diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
index 8abb13b580..3b35b5c970 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
@@ -14,7 +14,6 @@ PV .= "+git"
 SRCREV = "7482de6071d21db77a7236155da44c172a7f6c9e"
 SRC_URI = "git://github.com/glfw/glfw.git;branch=3.3-stable;protocol=https"
 
-
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_DOCS=OFF"
 
 CFLAGS += "-fPIC"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
index 7c7a3fafb7..86a953b04c 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
 
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
 
-
 inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
index 948d50b471..ba7f6fd2b8 100644
--- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
+++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=https;branch=maste
            "
 SRCREV = "28202692d0b441000f4ddb8f347f72d1355021aa"
 
-
 inherit autotools pkgconfig vala
 
 EXTRA_OECONF += "--enable-vala"
diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
index cf98c0cf2e..8755dcddc1 100644
--- a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master
 
 SRCREV = "55db144e03027b43263e5ebcb599bf0878ba58de"
 
-
 RCONFLICTS:${PN} += "minizip"
 
 DEPENDS = "xz openssl bzip2"
@@ -29,7 +28,6 @@ PACKAGECONFIG[zlib] = "-DMZ_ZLIB=ON,-DMZ_ZLIB=OFF, zlib"
 PACKAGECONFIG[zlib-ng] = "-DMZ_ZLIB=ON,-DMZ_ZLIB=OFF, zlib-ng"
 PACKAGECONFIG[test] = "-DMZ_BUILD_TESTS=ON -DMZ_BUILD_UNIT_TESTS=ON, -DMZ_BUILD_TESTS=OFF -DMZ_BUILD_UNIT_TESTS=OFF, googletest"
 
-
 do_install:append () {
     # remove absolute paths
     sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/minizip/minizip.cmake
diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
index a252a6b48e..c45a327c3f 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
@@ -2,7 +2,6 @@ SUMMARY = "Common GNOME build files for C++ bindings"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-
 inherit gnomebase
 
 # All the recipe does is stage python and shell script, some autotools files; nothing is compiled.
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v79.bb b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
index 4014e3bca6..d1c47a6276 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v79.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
@@ -18,7 +18,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
 
 DEPENDS = "kmod udev json-c keyutils iniparser libtraceevent libtracefs"
 
-
 EXTRA_OEMESON += "-Diniparserdir=${STAGING_INCDIR}/iniparser"
 
 PACKAGECONFIG ??= "tests ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
diff --git a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb b/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
index 59f807b7ae..3c76f7e953 100644
--- a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
+++ b/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRCREV = "527695de8393a3144863a0a07f9b92f1c734d1c4"
 
-
 inherit cmake
 
 DEPENDS += "opencl-clhpp virtual/opencl-icd"
diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
index 9e32242e31..b356f3089e 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https;branch=master"
 
 SRCREV = "fdde6677b21329432db8b481e2637cd10f7d3cb2"
 
-
 inherit autotools
 
 DEPENDS = "ruby-native"
diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
index 7335712d6f..c7e6cf5130 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
@@ -10,7 +10,6 @@ SRCREV = "c7b4aded1cab9560b226041dd962f63375a9a384"
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = " \
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
index c766a66640..7a5ddfa766 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
@@ -8,7 +8,6 @@ inherit pkgconfig cmake
 DEPENDS += "opencl-headers opencl-icd-loader"
 RDEPENDS:${PN} += "python3-core python3-io"
 
-
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
 	   file://0001-Ignore-Compiler-Warnings.patch"
 
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index 7cfc75f5ed..0eba1984d4 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -11,7 +11,6 @@ DEPENDS += "opencl-headers"
 PROVIDES = "virtual/opencl-icd"
 RPROVIDES:${PN} = "virtual-opencl-icd"
 
-
 SRCREV = "861b68b290e76d08e7241608479c16431f529945"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 324406c1ed..002ac8e7a0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -3,7 +3,6 @@
 
 SUMMARY = "Basic task to get a device online"
 
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index f6ddb1a352..acd9d4fcea 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Basic task to get a device booting"
 
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2055a0ff91..32218bfce0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -960,7 +960,6 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:riscv32 = "oprofile-ptest"
 RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:arm = "numactl-ptest"
 RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:libc-musl = "minicoredumper-ptest"
 
-
 RDEPENDS:packagegroup-meta-oe-fortran-packages = "\
     lapack \
     octave \
diff --git a/meta-oe/recipes-core/pim435/pim435_git.bb b/meta-oe/recipes-core/pim435/pim435_git.bb
index a18e889683..8396db03ca 100644
--- a/meta-oe/recipes-core/pim435/pim435_git.bb
+++ b/meta-oe/recipes-core/pim435/pim435_git.bb
@@ -15,7 +15,6 @@ SRCREV = "445ed623ec8d3ecbb1d566900b4ef3fb3031d689"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 DEPENDS = "i2c-tools"
 
 EXTRA_OEMAKE += "DESTDIR=${D}"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
index 9c39d40d23..46c954f9c0 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
@@ -55,7 +55,6 @@ CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
 
 EXTRA_OEMESON += "-Dstatic-libsystemd=pic"
 
-
 RDEPENDS:${PN}-dev = ""
 
 do_compile() {
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
index 62b30e9894..6d3cf68301 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
@@ -24,7 +24,6 @@ EXTRA_OECMAKE = "-DSDBUSCPP_BUILD_CODEGEN=OFF \
                  -DSDBUSCPP_BUILD_DOCS=ON \
                  -DSDBUSCPP_BUILD_DOXYGEN_DOCS=OFF"
 
-
 # Link libatomic on architectures without 64bit atomics fixes
 # libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'
 LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
index 840c04e52e..3d01f9c28a 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
 SRCREV = "2543e6e5037c0b1b448282c2793f8a6ce8b12d71"
 SRC_URI = "git://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git;branch=master"
 
-
 DEPENDS = "openssl"
 
 EXTRA_OEMAKE:append = " PREFIX=${prefix} LIBDIR=${libdir} USE_SHARED_LIB=1"
diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
index a9a147c35b..65e4d2b3d8 100644
--- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
@@ -21,7 +21,6 @@ SRC_URI = "git://github.com/libtom/libtomcrypt.git;protocol=https;branch=master
 
 SRCREV = "7e7eb695d581782f04b24dc444cbfde86af59853"
 
-
 inherit pkgconfig
 
 PACKAGECONFIG ??= "ltm"
diff --git a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
index 9623ef7f19..dc9f38a483 100644
--- a/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
+++ b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
@@ -1,4 +1,3 @@
 require ${PN}.inc
 
-
 SRC_URI[sha256sum] = "dafb6cdca524c628df832b6dd0bf8fabceb103248edb21762c02d3068fca4503"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 13e55ebacd..785d0d22dd 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -97,7 +97,6 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DMASK_LONGDOUBLE_EXITCODE=0 \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
-
 # With Ninja it fails with:
 # make: *** No rule to make target `install'.  Stop.
 OECMAKE_GENERATOR = "Unix Makefiles"
@@ -125,7 +124,6 @@ do_generate_toolchain_file:append:class-native () {
     sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cmake
 }
 
-
 do_compile:prepend:class-target () {
     # These need to be in-tree or make will think they need to be built,
     # and since we're cross-compiling that is disabled
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
index 5bbb010f8b..6600e390c3 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
@@ -29,7 +29,6 @@ SRC_URI:append:mips = " file://0001-replace-old-sync-with-new-atomic-builtin-equ
 SRC_URI:append:powerpc = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
 SRC_URI:remove:toolchain-clang:riscv32 = "file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
 
-
 inherit cmake ptest
 
 PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
index 4afbba963a..59868d69bd 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0002-abseil-ppc-fixes.patch \
            "
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
diff --git a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
index e027b8d4aa..94ea0eb965 100644
--- a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
+++ b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.gi
 "
 SRCREV = "9bd5e2c7886fca72f139cd8402488a2235957d41"
 
-
 DEPENDS = "bison-native"
 
 do_compile() {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index ff83b6c2ee..61d30917ef 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -61,7 +61,6 @@ SRC_URI = " \
     file://mkbootimg.mk;subdir=${BPN} \
 "
 
-
 B = "${WORKDIR}/${BPN}"
 
 # http://errors.yoctoproject.org/Errors/Details/133881/
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
index 244d9a3c6f..c4ca57d331 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
@@ -11,7 +11,6 @@ SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-Explicit-header-stdint.patch \
           "
 
-
 DEPENDS += "zlib libpng python3-native"
 
 inherit cmake
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
index 0e51289507..c6bbbe6f0c 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
@@ -102,7 +102,6 @@ PACKAGES =+ "${PN}-minidump-upload ${PN}-sym-upload"
 FILES:${PN}-minidump-upload = "${bindir}/minidump_upload"
 FILES:${PN}-sym-upload = "${bindir}/sym_upload"
 
-
 SYSROOT_PREPROCESS_FUNCS += "breakpad_populate_sysroot"
 breakpad_populate_sysroot() {
         sysroot_stage_dir ${D}/usr/include ${SYSROOT_DESTDIR}/usr/include
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index 33c8c28531..01c9b7c927 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
          "
 SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 
-
 inherit cmake pkgconfig ptest
 
 RDEPENDS:${PN}-ptest += "cmake"
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index ab4e6148e9..0bf59db289 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
            file://0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch \
            file://0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch"
 
-
 COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64|riscv32|riscv64).*-linux*"
 
 inherit autotools-brokensep
diff --git a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
index 6e709b6e7e..be602e0922 100644
--- a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
+++ b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
 SRC_URI = "git://github.com/rm5248/libcppgenerate.git;branch=master;protocol=https"
 SRCREV = "930c5503f76c877b72b9ff8546353d6f422bd010"
 
-
 inherit cmake
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
index 845a78da76..f953a41f99 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
@@ -17,7 +17,6 @@ inherit autotools-brokensep pkgconfig manpages
 SRCREV = "c06d333b3162660694b26604a364cdab89e2010e"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
-
 PACKAGECONFIG ??= " \
     readcmd \
     xml \
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
index bc558b7d62..222540af4e 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
@@ -10,7 +10,6 @@ SRC_URI:append:class-target = " file://oe-remote.repo.sample"
 
 inherit setuptools3-base
 
-
 do_install:append() {
     install -d ${D}${datadir}/dnf
     install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
index 512a63549e..d58c3184d6 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "\
 
 SRCREV = "cbe58f6237b2238c9af7f51c6b7afb8bbf52c866"
 
-
 UPSTREAM_CHECK_GITTAGREGEX = "Release_(?P<pver>\d+(\_\d+)+)"
 
 inherit cmake python3native
diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
index bdaa39b402..d4f086ab71 100644
--- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
+++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
@@ -7,7 +7,6 @@ SRCREV = "a4b17d543f072d2e3ba564e4bc5c3a0d2b05c338"
 
 SRC_URI = "git://github.com/ArashPartow/exprtk.git;branch=release;protocol=https"
 
-
 # other packages commonly reference the file directly as "exprtk.hpp"
 # create symlink to allow this usage
 do_install() {
diff --git a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
index 83e9383d4a..f320d370f4 100644
--- a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
+++ b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
@@ -7,7 +7,6 @@ DEPENDS = "openssl"
 SRC_URI = "git://git.pengutronix.de/git/extract-cert;protocol=https;branch=master;"
 SRCREV = "d652b4e8279aef2a85f58676ab472744bafeafc9"
 
-
 inherit meson pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
index c51a49ba01..451885e515 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -13,7 +13,6 @@ DEPENDS = "flatbuffers-native"
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-
 EXTRA_OECMAKE += " \
     -DFLATBUFFERS_BUILD_TESTS=OFF \    
     -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
index 2565e3b9bd..6275a0c38e 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -14,7 +14,6 @@ SRC_URI = " \
 "
 SRCREV = "1653ec964730ec7d9892a08a1695ada6d20f5196"
 
-
 inherit cmake
 
 # Enable installation for target
diff --git a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
index 3645de3cc3..f510eba62a 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
@@ -25,9 +25,3 @@ EXTRA_OECONF += "--disable-man-pages"
 
 FILES:${PN} += "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/modules/libgladegtk.so"
 
-
-
-
-
-
-
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.9.bb b/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
index 27f39ed1e1..0ac84e39af 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
@@ -10,7 +10,6 @@ PV = "3.9.9"
 SRC_URI = "git://github.com/iipeace/${BPN};branch=master;protocol=https;tag=versions/${PV}"
 SRCREV = "118ab61773463e56dedc78f5cf6723b97a4ad946"
 
-
 inherit setuptools3
 
 RDEPENDS:${PN} = "python3 python3-core \
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
index 3aca51ee3e..a2465da259 100644
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https;branch=master \
 
 SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
 
-
 inherit cmake
 
 EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index aa1f417604..f157579fd6 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -20,7 +20,6 @@ SRCREV = "630434bb0ac619f7beec927569782d924c459385"
 PV_LONG := "${PV}-171-g${SRCREV}"
 PV .= "+git"
 
-
 inherit autotools ptest
 
 EXTRA_AUTORECONF += "--exclude=autoheader"
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
index 241fd328d8..61ac3f265f 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=
 
 SRCREV = "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
 
-
 DEPENDS += "nlohmann-json"
 
 inherit cmake
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
index f68ffd2c0f..7503080fc7 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
@@ -16,7 +16,6 @@ PE = "1"
 SRCREV = "89e2973c754a9c02a49974d839779b151e95afd6"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https"
 
-
 inherit cmake
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_OBJECT_LIBS=OFF -DJSONCPP_WITH_TESTS=OFF"
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
index ae86e20a4a..4916ca3f6a 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp;branch=master;protocol=http
 
 SRCREV = "ec5ce12fc9c0299e1454cc002c70218b5a6f005b"
 
-
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[coverage] = "-DWITH_COVERAGE=YES,-DWITH_COVERAGE=NO,,"
 
diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
index 5ad953d260..256c78b422 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https
 
 SRCREV = "e71e0c2d584baff06925bbb3aad683f677e4d498"
 
-
 DEPENDS = "openssl"
 
 inherit cmake
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
index 43a61908f5..17d1b8d172 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
@@ -23,7 +23,6 @@ SRCREV = "f22fce3a308be1c7790ebefc6bbedb33c5f7c86a"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit autotools pkgconfig
 do_configure:prepend () {
 	mkdir -p ${S}/scripts/.autostuff/m4
diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
index 8a8491b76b..f16cd7c498 100644
--- a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
+++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/sqlite/sqlite;protocol=https;branch=branch-3.44"
 
 SRCREV = "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
 
-
 do_compile() {
     ${CC} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o lemon
 }
diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
index 3616eb519d..c36cc5f3b9 100644
--- a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
+++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
@@ -16,7 +16,6 @@ inherit autotools-brokensep pkgconfig
 # sombok-2.4.0
 SRCREV = "0098d85a037ef5c99a648a3669a077781a45e8cc"
 
-
 # Disable libthai support
 EXTRA_OECONF = "--disable-libthai"
 
diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 38786b79ed..051353d213 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -23,7 +23,6 @@ SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
 "
 SRCREV_FORMAT = "json_doctest"
 
-
 inherit cmake ptest
 
 EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index 394cf9c000..9d7374c33f 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -25,7 +25,6 @@ PV = "1.0.1+git"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit cmake pkgconfig
 
 DEPENDS = "json-c"
diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
index 95e2084255..eee9103089 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
@@ -18,7 +18,6 @@ SRC_URI = " \
     file://0001-disable-docbook2man.patch \
 "
 
-
 inherit pkgconfig
 
 DEPENDS = "gettext-native"
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index f84d989eef..b93cffc3e7 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -31,7 +31,6 @@ SRC_URI = "git://gitlab.com/cespedes/ltrace.git;protocol=https;branch=main \
            "
 SRC_URI:append:libc-musl = " file://add_ppc64le.patch"
 
-
 inherit autotools
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index f4a1345ab2..93205161c6 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
 PV = "2.1"
 SRCREV = "538a82133ad6fddfd0ca64de167c4aca3bc1a2da"
 
-
 inherit pkgconfig binconfig siteinfo
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb b/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
index 57c8417f44..041bddf735 100644
--- a/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
+++ b/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "\
 
 SRCREV = "09488c50c6bdc40aec8e3a9b23a539c5054a634c"
 
-
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
index 4590b49955..80c321f27a 100644
--- a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
+++ b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
@@ -11,5 +11,4 @@ DEPENDS = "libmodbus (>=3.1.4)"
 SRC_URI = "git://github.com/epsilonrt/mbpoll;protocol=https;branch=master"
 SRCREV = "a0bd6c08d3d15b086f2104477295c0705aed366a"
 
-
 inherit pkgconfig cmake
diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
index 2fbbf8f06a..bcd295fc00 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=main \
 "
 SRCREV = "a3534567187d2edc428efd3f13466ff75fe5805c"
 
-
 inherit cmake pkgconfig ptest
 
 # this is header-only library
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
index aa7629763c..e5dfbaf9b0 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master;protocol=https \
            "
 SRCREV = "8160ede5e20fd3019a77eea46d9c72cf6163f802"
 
-
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE += "-DMSGPACK_BUILD_TESTS=off" 
diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
index ef2553760d..919bb55dab 100644
--- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 inherit autotools-brokensep
 
-
 do_configure () {
     # no debug set -s flag
     sed -i -e 's/LDFLAGS_AUTO=-s/LDFLAGS_AUTO=/' ${S}/configure
diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
index ec87535ec7..c4a28fb3ce 100644
--- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -12,7 +12,6 @@ SRCREV = "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 # nlohmann-fifo is a header only C++ library, so the main package will be empty.
 
 RDEPENDS:${PN}-dev = ""
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
index 1dfcc6ad75..f942a2d79d 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
@@ -16,7 +16,6 @@ SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
 
 SRCREV_FORMAT .= "_json-test-data"
 
-
 inherit cmake ptest
 
 EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DJSON_BuildTests=ON -DJSON_TestDataDirectory=${PTEST_PATH}/json_test_data', '-DJSON_BuildTests=OFF', d)}"
@@ -28,7 +27,6 @@ RDEPENDS:${PN}-ptest = "perl locale-base-de-de"
 
 BBCLASSEXTEND = "native nativesdk"
 
-
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -r ${S}/json_test_data/ ${D}${PTEST_PATH}/
@@ -36,7 +34,6 @@ do_install_ptest () {
     rm -rf ${D}${PTEST_PATH}/json_test_data/.git
 }
 
-
 # other packages commonly reference the file directly as "json.hpp"
 # create symlink to allow this usage
 do_install:append() {
diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index ee7674a0c7..77c34c4779 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Packages required for a target (on-device) SDK"
 
-
 inherit packagegroup
 
 RPROVIDES:${PN} += "packagegroup-native-sdk"
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
index aca915bf32..fdf7a34d57 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
@@ -13,7 +13,6 @@ SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
            file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
 
-
 inherit cmake pkgconfig
 
 PACKAGECONFIG[python3] = ",,python3,python3-core"
diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
index 130980b0cd..3f082fbe80 100644
--- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
+++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/billfarrow/pcimem.git;branch=master;protocol=https"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_install() {
     install -D -m 0755 ${B}/pcimem ${D}${bindir}/pcimem
 }
diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb b/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
index 69a4f79815..edfd040dae 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
@@ -10,7 +10,6 @@ inherit cpan
 SRCREV = "e04534a40925354187e8432d44248229d774f34a"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
 
-
 RDEPENDS:${PN} = " \
     perl \
     perl-module-list-util \
diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
index 9cdb0a52cc..c8328ae9e7 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
@@ -12,7 +12,6 @@ DEPENDS = "perl"
 SRC_URI = "git://github.com/toddr/IPC-Run.git;branch=master;protocol=https"
 SRCREV = "ad56c3b5f5a211d32bbb8ac29f180d707ee58c1b"
 
-
 inherit cpan
 
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
index ded0dea0d1..813620d290 100644
--- a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
+++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/makamaka/JSON.git;protocol=https;branch=master"
 
 SRCREV = "39bc0e567c202762a575fed2844ebdb941c3ca09"
 
-
 inherit cpan
 
 RDEPENDS:${PN} += "perl"
diff --git a/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb b/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
index b0a20e3ece..2c4b20b3be 100644
--- a/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
+++ b/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
@@ -7,7 +7,6 @@ SRC_URI = "git://github.com/pistacheio/pistache.git;branch=master;protocol=https
 # SRCREV tagged 0.4.26
 SRCREV = "ddffda861aa49012dcda28f1362d0339e718cd52"
 
-
 DEPENDS = "rapidjson"
 
 inherit pkgconfig meson
diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
index 916ff29118..3f1259dfd8 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -10,7 +10,6 @@ PV = "2.4.0"
 SRC_URI = "git://github.com/iovisor/ply;branch=master;protocol=https"
 SRCREV = "282558cfa1c0f0e095354e3a6ec4486b524179dc"
 
-
 CACHED_CONFIGUREVARS = 'LD="${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"'
 
 inherit autotools-brokensep
diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
index f3ffccf626..70cbdbe7ad 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8cdfa87bc5e09bc07f8cf64135026d91"
 SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main"
 SRCREV = "8a3bdd7e0a43b44e3b32548543128d95e68a3802"
 
-
 inherit cmake
 
 CFLAGS += "-fPIC"
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
index 30c9e19b16..8227597d75 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
@@ -19,7 +19,6 @@ SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-
 
 SRCREV = "185beed28e65494be7505b30c1afeaf199e19b23"
 
-
 inherit autotools pkgconfig
 
 export PROTOC = "${STAGING_BINDIR_NATIVE}/protoc"
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
index 61aff1da28..519c1e2758 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
@@ -26,7 +26,6 @@ SRC_URI:append:mipsarcho32:toolchain-clang = " file://0001-Fix-build-on-mips-cla
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.(25\.(\d+)))"
 
-
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
 
 inherit cmake pkgconfig ptest
diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb b/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
index d5c440f413..14c7dec53b 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
@@ -7,7 +7,6 @@ SRC_URI = "git://salsa.debian.org/apt-team/python-apt.git;protocol=https;branch=
 
 SRCREV = "3252935b6224b3bd2e2250894b9559b47c61b2e1"
 
-
 inherit setuptools3
 
 DEPENDS += "apt"
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 724d329ee2..8fb91aedca 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -10,7 +10,6 @@ SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
 PV = "1.1.0+git"
 
-
 inherit cmake
 
 EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
index 672c46055d..145b355cce 100644
--- a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -9,7 +9,6 @@ SRC_URI = " \
 
 SRCREV = "45eb2ffa5378396e85432872833890b0a1cba872"
 
-
 inherit autotools
 
 DEPENDS:append:libc-musl = " argp-standalone"
diff --git a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
index 72ccd1d6b7..263b6fe4b3 100644
--- a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
+++ b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
@@ -7,5 +7,4 @@ BRANCH = "master"
 SRC_URI = "git://github.com/clarkwang/sexpect;branch=${BRANCH};protocol=https;tag=v${PV}"
 SRCREV = "d3645392424d47532be90fcbc0abf3148324785b"
 
-
 inherit cmake
diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
index ea4fc5d3dd..4d5a8d38a6 100644
--- a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
+++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
@@ -9,7 +9,6 @@ DEPENDS = "ncurses"
 SRC_URI = "git://github.com/ColinIanKing/smemstat.git;protocol=https;branch=master"
 SRCREV = "1edc560602aa116b96408110b8b9d66a4edef60e"
 
-
 inherit bash-completion
 
 do_compile () {
diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
index 966d14874e..c7b7d1f55c 100644
--- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
+++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=a709b68f1ce8a9f10aeea6401446c1f4 \
 SRCREV = "667faf69cc35215e33e747b4bffdcba3643c2629"
 SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https;branch=fixes-1.3.0"
 
-
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
index 7824ed1a68..de8116b79b 100644
--- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
 "
 SRCREV = "34b42992a43fda69c6ba2557b718601cafe16251"
 
-
 # coreutils provides fmt which is used in the Makefile
 DEPENDS = "i2c-tools coreutils-native"
 
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 8effd042fb..e4d4e2f076 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branc
            "
 SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
 
-
 DEPENDS = "cmake-native lapack gmp mpfr chrpath-native"
 
 PROVIDES = "mongoose graphblas"
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
index 3d92f59ff2..2391ef4e5a 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=m
 
 SRCREV = "5aff8fa2b5b60b7c11bbfb39c884477e72d11d02"
 
-
 inherit setuptools3_legacy
 
 DEPENDS += "apt intltool-native python3-distutils-extra-native"
diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
index 4e5f02746c..a2e790cf6f 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
 SRCREV = "4edda758546436462da479bb8c8514f8a95c35ad"
 
-
 inherit cmake
 
 PACKAGECONFIG ?= "boost"
diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
index 3e569859b7..4dee28746b 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/lloyd/yajl;nobranch=1;protocol=https"
 
 inherit cmake lib_package
 
-
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>1(\.\d+)+)"
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index e4434bee45..82502810d7 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
            "
 SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
-
 inherit cmake lib_package
 
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 68895a1697..137f16e72b 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-bitvect-fix-build-with-gcc-15.patch \
 "
 
-
 inherit autotools gettext python3native
 
 CACHED_CONFIGUREVARS = "CCLD_FOR_BUILD='${CC_FOR_BUILD}'"
diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
index 74e44c44e3..d48c38df20 100644
--- a/meta-oe/recipes-extended/7zip/7zip_24.09.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
@@ -14,7 +14,6 @@ SRCREV = "e5431fa6f5505e385c6f9367260717e9c47dc2ee"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
-
 # Support Yocto cross compiling
 CXXFLAGS:append:toolchain-clang = " -Wno-error=cast-qual -Wno-error=sign-conversion \
                                     -Wno-error=disabled-macro-expansion \
diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
index 033461d614..c975739d0b 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
@@ -32,7 +32,6 @@ SRCHASH_CPM = "c8cdc32c03816538ce22781ed72964dc864b2a34a310d3b7104812a5ca2d835d"
 TAG_CPM = "0.40.2"
 SRC_URI[sha256sum] = "${SRCHASH_CPM}"
 
-
 inherit cmake ptest
 
 DEPENDS = "7zip"
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index b2cfd9b874..d267e62a38 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -41,7 +41,6 @@ inherit gettext autotools pkgconfig features_check systemd
 
 REQUIRED_DISTRO_FEATURES += "opengl"
 
-
 EXTRA_OECONF += "\
     --enable-libraries \
     --enable-unicode \
diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
index 411f8a7610..887e043c24 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
 SRCREV = "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
 
-
 inherit cmake lib_package
 
 do_install:append () {
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
index 26c80195b0..0416017849 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;protocol=https;branch=ma
 
 SRCREV  = "e0760b2e9657907e691be4df384ca7617109635d"
 
-
 inherit cmake ptest
 
 EXTRA_OECMAKE += "-DBUILD_YOCTO=ON"
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 8b48d20aac..0de8f9eb70 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -23,7 +23,6 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            "
 SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
-
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
  dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console \
  udp-connection dlt-system dlt-filetransfer "
diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
index 71305cc35f..667c373857 100644
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -20,7 +20,6 @@ SRC_URI = "\
     git://github.com/docopt/docopt.cpp.git;protocol=https;branch=master \
 "
 
-
 inherit cmake
 
 PACKAGECONFIG ??= ""
diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
index c3a5a02a3f..10e2ad3f16 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
@@ -16,7 +16,6 @@ inherit cmake
 
 DEPENDS += "grpc protobuf cpprest grpc-native protobuf-native"
 
-
 EXTRA_OECONF += "-DCPPREST_EXCLUDE_WEBSOCKETS=ON"
 
 do_install:append() {
diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
index dd30543a41..43d0ddf049 100644
--- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
+++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
@@ -43,7 +43,6 @@ go_do_compile:prepend() {
     cd ${GO_INSTALL}
     ./build.sh
 
-
     # Lots of discussion in go community about how it sets packages to
     # read-only by default -> https://github.com/golang/go/issues/31481
     # etcd is going to need some upstream work to support it.
diff --git a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
index df7a4e2758..a06fe95bc3 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
@@ -7,7 +7,6 @@ SRC_URI = "git://github.com/flatpak/flatpak-xdg-utils.git;protocol=https;branch=
 
 SRCREV = "05abdd7421688be5835a6b12f2b068086c38d4aa"
 
-
 inherit meson pkgconfig
 
 DEPENDS = "glib-2.0"
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
index f99c8ac36a..3df17913a1 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
@@ -10,7 +10,6 @@ SRC_URI = " \
 
 SRCREV = "1440f4faa67ebf69c7559f31d2cab59e6ec6fe2b"
 
-
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
 
 REQUIRED_DISTRO_FEATURES = "polkit"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
index 05e4fd937f..99e4230890 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
@@ -32,7 +32,6 @@ SRC_URI:append:libc-musl = "\
 # prefix tag with "v" to avoid upgrade to random tags like "20220215"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-
 PACKAGECONFIG ??= "\
     aws \
     binary \
diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
index 2299d55b2b..e43bf3e610 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/pixel/hexedit.git;branch=master;protocol=https \
 
 SRCREV = "eab92dcaa34b66bc5182772afc9fda4ac8a27597"
 
-
 inherit autotools-brokensep update-alternatives
 
 ALTERNATIVE:${PN} = "hexedit"
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
index 8678447cf5..05f1484727 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
@@ -10,7 +10,6 @@ SRC_URI = " \
     "
 SRCREV = "60e5075d4ac77424809f855ba3e398df7aacefe8"
 
-
 inherit cmake ptest
 
 # 'testssl' is not enabled by default as redis recipe does not build with ssl support
diff --git a/meta-oe/recipes-extended/iotop/iotop_1.30.bb b/meta-oe/recipes-extended/iotop/iotop_1.30.bb
index 9fe774f9f2..3a6b41c098 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.30.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.30.bb
@@ -7,7 +7,6 @@ DEPENDS = "ncurses"
 SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https;tag=v${PV}"
 SRCREV = "c3366a8a235f9c8ddc4797625f22cfdf12ba2c36"
 
-
 inherit pkgconfig
 
 EXTRA_OEMAKE = "V=1 STRIP=true"
diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
index 7129d6ef8c..d13d51e35e 100644
--- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
+++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
@@ -7,7 +7,6 @@ PV = "2.3.6+git"
 SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=https;branch=master"
 SRCREV = "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
 
-
 do_compile() {
 	oe_runmake
 }
diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
index 6ca8569bc5..f68c2af2ad 100644
--- a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
+++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
@@ -16,7 +16,6 @@ SRCREV = "9ae4f4ae4481b1e69d38ed810980d33103544613"
 # The current PV is not a git tag but a README content
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit autotools
 
 EXTRA_OECONF += "--with-system-libunwind --enable-shared --disable-static"
diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
index 60c3c6fadd..e8652bbf47 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
 SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master"
 SRCREV = "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
 
-
 inherit cmake
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS:BOOL=ON"
diff --git a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb b/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
index 2def38d73f..0d00c3ad70 100644
--- a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release;protocol=https
            file://0001-Enhance-reproducibility.patch \
           "
 
-
 inherit cmake pkgconfig
 
 # default config is for RaspberryPi API, use the Linux 4.10+ API by default
diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
index 9f4b2a19d0..2894e33011 100644
--- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -14,5 +14,3 @@ SRCREV = "db9371cf9f38b5a3b2f6e4fae3f92eb052d2d929"
 SRC_URI = "git://github.com/libdivecomputer/libdivecomputer.git;protocol=https;branch=master \
           "
 
-
-
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 7f01962a97..d49903b8b8 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -11,7 +11,6 @@ inherit autotools pkgconfig python3native python3targetconfig
 SRCREV = "2117b8fdb6b4096455bd2041a63e59a028120136"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
-
 CVE_STATUS_GROUPS += "CVE_STATUS_LIBLIST"
 CVE_STATUS_LIBLIST[status] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS_LIBLIST = " \
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index e29ec88e06..8980fc1798 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -13,7 +13,6 @@ PV = "2.3.0+git"
 SRCREV = "2cd858c679d25633077ca78b67182a9b77653816"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
-
 CVE_STATUS_GROUPS += "CVE_STATUS_LIBLIST"
 CVE_STATUS_LIBLIST[status] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS_LIBLIST = " \
diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
index 7869fc1941..bbcf8eb6f7 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
@@ -11,5 +11,4 @@ PKGV = "${GITPKGVTAG}"
 SRCREV = "adf9c22b9010490e4b55eaeb14731991db1c172c"
 SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
 
-
 FILES:${PN} += "${base_libdir}/udev/rules.d/"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
index 76759fe69d..f3958aa59f 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
@@ -12,5 +12,4 @@ PV = "2.0.2+git"
 SRCREV = "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
 SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
 
-
 FILES:${PN} += "${base_libdir}/udev/rules.d/"
diff --git a/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb b/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
index 8021d8cf06..e546b75619 100644
--- a/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
+++ b/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
@@ -14,7 +14,6 @@ SRC_URI = "gitsm://github.com/WuBingzheng/libleak;protocol=https;branch=master \
            file://0001-respect-environment-variables.patch \
           "
 
-
 do_configure () {
 	:
 }
diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
index 89670d10ca..4d8645c719 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/rsyslog/liblognorm;branch=master;protocol=https \
            "
 SRCREV = "46c6ee4c8e5f827893e485a4ef1aff04ea881273"
 
-
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "testbench tools"
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
index ffbb3a8c8e..852f87dcd3 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https"
 SRCREV = "5190e5e141780ae481f24be16d7b39a5f3ad8f8f"
 
-
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= ""
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index 7ec01ecd3f..55b30f94fe 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/libpwquality/libpwquality;branch=master;protocol=htt
 "
 SRCREV = "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
 
-
 inherit autotools-brokensep gettext setuptools3-base
 
 do_configure:prepend() {
diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb b/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
index ba10f062ec..293132e6b1 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
@@ -21,7 +21,6 @@ SRCREV = "f6bb06a699617d078fcd4f8b71b4d063bf47b52b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "systemd"
 
diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
index d7e88f4fd0..e3115493d1 100644
--- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
@@ -11,7 +11,6 @@ PV .= "+0.2.2+git"
 
 inherit autotools
 
-
 PACKAGES += "${PN}-tools"
 
 FILES:${PN} = "${libdir}"
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
index c5411d53a1..7d7180871f 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
@@ -6,7 +6,6 @@ SECTION = "libs"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-
 DEPENDS:class-native = "freetype-native libpng-native jpeg-native"
 DEPENDS = "freetype libpng jpeg expat gtk+"
 
@@ -19,7 +18,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://github.com/caolanm/libwmf.git;protocol=https;branch=master"
 SRCREV = "9e4737f2293c0d127bda92e5b01896df10571424"
 
-
 do_install:append() {
     sed -i -e 's@${RECIPE_SYSROOT}@@g' ${D}${bindir}/libwmf-config ${D}${libdir}/pkgconfig/libwmf.pc
 }
diff --git a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb b/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
index 7fff0b96a1..eabb190e27 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=
            file://run-ptest \
            "
 
-
 # Main dependencies
 inherit cmake pkgconfig lib_package ptest multilib_header
 DEPENDS = "libpcre2"
diff --git a/meta-oe/recipes-extended/md5deep/md5deep_git.bb b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
index 4b7192290e..34571a474d 100644
--- a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
+++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
@@ -13,5 +13,4 @@ SRC_URI = "git://github.com/jessek/hashdeep.git;branch=master;protocol=https \
            file://0001-Fix-literal-and-identifier-spacing-as-dictated-by-C-.patch \
            "
 
-
 inherit autotools
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index ab08322805..f78b4c1702 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -58,7 +58,6 @@ SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765
 # libsodium: 1.0.19
 SRC_URI[libsodium.sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
 
-
 inherit pkgconfig cmake systemd
 
 DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip2 yaml-cpp zstd lz4"
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index b53be9803e..fb847f1e15 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0002-gpio-Include-limits.h-for-PATH_MAX.patch \
            "
 
-
 # CMakeLists.txt checks the architecture, only x86 and ARM supported for now
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index 970d7fb5fc..b1b05d4ce6 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -24,7 +24,6 @@ SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
            file://0001-Link-with-libm-for-floor-function.patch \
            "
 
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d4f53d4c6cf73b9d43186ce3be6dd0ba"
 
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index e69d544b66..8809dcedd1 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -9,7 +9,6 @@ PV = "2.1.0.1+git"
 SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
 SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
 
-
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir}"
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
index ab5a8ef342..4e59bd10cb 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://github.com/PADL/pam_ccreds;branch=master;protocol=https \
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit autotools
 
 EXTRA_OECONF += "--libdir=${base_libdir} "
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
index 2886137b7d..b28e27fecf 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
@@ -13,7 +13,6 @@ REQUIRED_DISTRO_FEATURES = "pam"
 SRCREV = "3e026863cad1fd45c760ee1bc93ef4f0606cc852"
 SRC_URI = "git://github.com/rmbreak/pam_ldapdb;branch=master;protocol=https"
 
-
 do_install () {
     oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
 }
diff --git a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
index 0e2199b066..1c761a0cdd 100644
--- a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
+++ b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 SRC_URI = "git://github.com/FreeRADIUS/pam_radius.git;protocol=https;branch=master"
 SRCREV = "b6442c3e0147f1019990520483fa3a30e4ccf059"
 
-
 DEPENDS = "libpam"
 
 inherit autotools-brokensep features_check
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
index 4d540d0180..4e42f54c0f 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
@@ -12,7 +12,6 @@ SRCREV = "be527327653e94b02e711f7eff59285ad13e1db0"
 
 inherit cmake ptest
 
-
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/src/test/pegtl/data
     install -m 0755 ${B}/src/test/pegtl/pegtl-test-* ${D}${PTEST_PATH}/src/test/pegtl
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
index 5aba331acc..8e7553ad6d 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
@@ -9,7 +9,6 @@ DEPENDS = "ndctl"
 # Required to have the fts.h header for musl
 DEPENDS:append:libc-musl = " fts"
 
-
 SRC_URI = "git://github.com/pmem/pmdk.git;branch=master;protocol=https"
 SRCREV = "0f0ab391d8e3db52f745f33c92b9d9a462bb3695"
 
diff --git a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
index 20b7f0a5bd..0e63ca0799 100644
--- a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
+++ b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/lib-cpp/${BPN}.git;branch=master;protocol=https"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_configure:prepend() {
     echo " " > ${S}/tests/CMakeLists.txt
 }
diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
index 00cae11c4e..4597b5c9ed 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master
 
 SRCREV = "4487f10e1bf258434fb8a39e4f59c29e31910ad0"
 
-
 inherit pkgconfig
 
 CFLAGS += " \
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
index d643c6f0b9..d1993fd489 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https
            file://0001-CMakeLists.txt-fix-substitution-for-static-libs.patch"
 SRCREV = "ad6baa121f4c6fbc7622d83d606210ac22549c78"
 
-
 inherit cmake
 
 # if ssl is enabled for redis-plus-plus it must also be enabled for hiredis
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
index 69c281bd92..9e183a35ea 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
@@ -13,7 +13,6 @@ SRC_URI = "\
     git://github.com/oetiker/rrdtool-1.x.git;protocol=https;branch=master \
 "
 
-
 inherit cpan autotools-brokensep gettext pkgconfig python3native python3-dir systemd
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
index f1235d7b96..987fd28afd 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=master
 
 SRCREV = "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
 
-
 CVE_PRODUCT = "rsyslog:libfastjson"
 
 inherit autotools
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index 3ccb87a9c5..089f7a04be 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
 
 SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
 
-
 CVE_PRODUCT = "rsyslog:librelp"
 
 inherit autotools pkgconfig ptest
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
index c4ddb72bcc..a14c4ca37f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
@@ -86,7 +86,6 @@ PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[valgrind] = ",--without-valgrind-testbench,valgrind,"
 PACKAGECONFIG[imhttp] = "--enable-imhttp,--disable-imhttp,civetweb,"
 
-
 TESTDIR = "tests"
 do_compile_ptest() {
     echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
index fe8592be39..c2135fac8b 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            "
 SRCREV = "70c268a07273da78a4aadd14c40ffb75138ccebe"
 
-
 CVE_STATUS[CVE-2012-5638] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 
 DEPENDS = "libaio util-linux"
diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
index e8987b2dd0..338330ed2f 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -14,5 +14,4 @@ SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git;branch=master;proto
            file://0001-Fix-build-on-big-endian-architectures.patch \
            "
 
-
 inherit autotools-brokensep
diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
index 2a49ba99b0..c526602c93 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
@@ -15,7 +15,6 @@ SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main \
 
 SRCREV = "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
 
-
 inherit cmake pkgconfig
 
 PACKAGECONFIG ??= ""
diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index 530e38ce21..9adb08f8d2 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https;branch=master"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit module
 
 EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 5dc41bcb93..98a2f86d34 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master \
 
 SRCREV = "01083a64ebf28cc716efe2d2fd51c141042ae34b"
 
-
 inherit cmake pkgconfig update-alternatives
 
 PACKAGES =+ " \
diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index b92b8086d6..314e61be2d 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=https;branch
 
 inherit update-alternatives
 
-
 inherit autotools pkgconfig
 
 # Busybox ip doesn't support can interface configuration, use the real thing
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
index 535f37f84c..6e29a75f67 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
@@ -9,7 +9,6 @@ SRCREV = "077def398ad303043d73339112968e5112d8d7c8"
 
 SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=https;branch=master"
 
-
 inherit autotools pkgconfig
 
 PACKAGECONFIG ?= ""
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
index b60f9c643c..3f26bf2f01 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
@@ -33,7 +33,6 @@ SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
 
 SRCREV_FORMAT = "sysdig_falco"
 
-
 EXTRA_OECMAKE = "\
                 -DBUILD_DRIVER=OFF \
                 -DMINIMAL_BUILD=ON \
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index a4bf3eaaca..25d66e2f4b 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -18,7 +18,6 @@ DEPENDS += "libdaemon"
 
 RDEPENDS:${PN} = "iproute2-tipc"
 
-
 do_configure:prepend() {
     ( cd ${S}; ${S}/bootstrap )
 }
diff --git a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
index 5fb28b0085..fe8e26dee6 100644
--- a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
+++ b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
@@ -12,5 +12,4 @@ SRC_URI = "\
 
 SRCREV = "5e00bfa5e137e76c81888727712ced2b3fd99f5b"
 
-
 inherit pkgconfig autotools
diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
index 1a453ebe10..308ea64bbf 100644
--- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
+++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
@@ -9,7 +9,6 @@ SRCREV = "44a173195986d0d853316cb02a58785ded66c12b"
 PV = "0.5.0+git"
 SRC_URI = "git://github.com/wertarbyte/${BPN}.git;branch=debian;protocol=https"
 
-
 inherit pkgconfig perlnative update-rc.d systemd
 
 PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 616f4ca09a..6e6dc40937 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -21,7 +21,6 @@ SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
 
 SRC_URI:append:toolchain-clang:x86 = " file://0001-nmea_gps-Link-with-latomic.patch "
 
-
 # Depends on mraa which only supports x86 and ARM for now
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb b/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
index 35b3d3c4a7..609da56a24 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
@@ -19,7 +19,6 @@ SRC_URI = " \
 "
 SRCREV = "fcd8bc3ee40f5d7841b7d5a8f3cd12252fec14e4"
 
-
 RPROVIDES:${PN} = "virtual-redis"
 
 inherit pkgconfig update-rc.d systemd useradd
diff --git a/meta-oe/recipes-extended/wipe/wipe_0.24.bb b/meta-oe/recipes-extended/wipe/wipe_0.24.bb
index ba3ed29d59..2709c28630 100644
--- a/meta-oe/recipes-extended/wipe/wipe_0.24.bb
+++ b/meta-oe/recipes-extended/wipe/wipe_0.24.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/berke/wipe.git;branch=master;protocol=https \
 "
 SRCREV = "796b62293e007546e051619bd03f5ba338ef28e5"
 
-
 EXTRA_OEMAKE = "linux"
 
 do_install() {
diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
index b901e8815a..c2da11752a 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
@@ -10,7 +10,6 @@ SRCREV = "493e9704dbc50f141d5fbd41c823311e79d7e8d3"
 SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https \
            file://0001-include-libgen.h-for-basename.patch"
 
-
 inherit meson pkgconfig systemd features_check
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} sqlite3 "
diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
index f450c2cf01..c5e9f2967e 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRCREV = "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
 SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https"
 
-
 inherit pkgconfig
 
 EXTRA_OEMAKE = "CC='${CC}' LD='${LD}' LIBRARY_PATH=${baselib}"
diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
index 2c894c0230..91977d87f4 100644
--- a/meta-oe/recipes-extended/zram/zram_0.2.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
@@ -8,7 +8,6 @@ RDEPENDS:${PN} = "kmod util-linux-swaponoff \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux-zramctl','',d)}"
 RRECOMMENDS:${PN} = "kernel-module-zram"
 
-
 SRC_URI = " \
            file://init \
            file://zram-swap-init \
diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
index bc637470f9..af3f3e602b 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 DEPENDS = "atk glibmm"
 
-
 inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
index cac6474e73..5000b90e4e 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
@@ -10,7 +10,6 @@ DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm gdk-pixbuf-native"
 
 BPN = "gtkmm"
 
-
 inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-graphics/aml/aml_git.bb
index a0b27bd256..18b278612b 100644
--- a/meta-oe/recipes-graphics/aml/aml_git.bb
+++ b/meta-oe/recipes-graphics/aml/aml_git.bb
@@ -10,7 +10,6 @@ SRCREV = "b83f3576ce4187d9285f06e9066ef43a691464d4"
 
 PV = "0.3.0+git"
 
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
 
diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb b/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
index b2673f1e9b..6b05d5e739 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
 # Tag v0.9.6
 SRCREV = "144d1e7c29b3b0c6dede7917a0476cc95248559c"
 
-
 PACKAGECONFIG[build_tests] = "-Dbuild_tests=true,-Dbuild_tests=false,"
 
 PACKAGECONFIG ?= ""
diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index 1018e0675e..ac1770124f 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/lucasdemarchi/dietsplash.git;branch=master;protocol=
 
 inherit autotools
 
-
 EXTRA_OECONF = " --with-systemdsystemunitdir=${systemd_unitdir}/system \
                  --disable-staticimages --with-rootdir=${root_prefix}"
 
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
index ef6dc14ca6..d85df82268 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=stable-2.x;protocol=
 
 SRCREV = "abbe08b7a487325182758d5285b54437a914207b"
 
-
 inherit cmake gettext pkgconfig python3-dir python3native setuptools3-base mime-xdg
 
 DEPENDS += "dnf python3 "
diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
index 810be40013..aaa85961ca 100644
--- a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
+++ b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
 SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
 SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
 
-
 inherit meson pkgconfig
 
 DEPENDS = "json-c libdrm"
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
index 959463e962..71a5e8fe06 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
@@ -41,7 +41,6 @@ SRC_URI = " \
 
 SRCREV = "7baf540e56fb1a3e91752acba872a88543529d46"
 
-
 inherit autotools gettext update-alternatives pkgconfig python3native perlnative features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
index e6fd0edd21..11dcfd3a68 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -20,7 +20,6 @@ SRC_URI = " \
 SRCREV = "efec5db081e3aad807d0731e172ac597f6a39447"
 PV .= "+0.9.9.9+git"
 
-
 inherit cmake
 
 do_install() {
diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index f26caf6940..776e997b68 100644
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -13,7 +13,6 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 
 inherit meson pkgconfig features_check
 
-
 PACKAGECONFIG ?= "\
   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '', d)} \
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 8122b88a68..df33fe9b7f 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -10,7 +10,6 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
-
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://libsdl-1.2.15-xdata32.patch \
            file://pkgconfig.patch \
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
index ac425f6ad2..b70388bcfb 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
@@ -9,7 +9,6 @@ DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp"
 SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.2.x"
 SRCREV = "11154afb7855293159588b245b446a4ef09e574f"
 
-
 inherit cmake pkgconfig
 
 FILES:${PN} += "${datadir}/licenses"
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index ff5df428e8..d4305bd024 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -47,7 +47,6 @@ inherit cmake
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https"
 SRCREV = "10e9eb75f73e973725dc75c373de5d89807af028"
 
-
 EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
 
 do_install:append() {
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
index ede5c16f3f..2f94837b6a 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
@@ -24,7 +24,6 @@ require lv-conf.inc
 
 inherit cmake
 
-
 do_configure:prepend() {
 	if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
 		# Add libsdl build dependency, SDL2_image has no cmake file
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
index 2b26ec57ae..a3418ffdec 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/any1/neatvnc;branch=v0.8;protocol=https"
 
 SRCREV = "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
 
-
 DEPENDS = "libdrm pixman aml zlib"
 
 PACKAGECONFIG ??= ""
diff --git a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb b/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
index c31ad985d9..e28835258e 100644
--- a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
+++ b/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
@@ -5,7 +5,6 @@ SECTION = "graphics"
 LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://src/nyancat.c;beginline=27;endline=49;md5=285f7ac87da4a631f348800687d845bd"
 
-
 SRCREV = "5ffb6c5c03d0e9156db8f360599d4f0449bb16b9"
 SRC_URI = " \
 	git://github.com/klange/nyancat;protocol=https;branch=master \
diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/recipes-graphics/openbox/obconf_git.bb
index 917492c982..ee241b0650 100644
--- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
+++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
@@ -16,7 +16,6 @@ SRC_URI = " \
     file://0001-Fix-function-protype-visibility.patch \
 "
 
-
 inherit autotools gettext pkgconfig mime mime-xdg features_check
 # depends on openbox, which is X11-only
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
index d3c96cd66f..9f09b10618 100644
--- a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
+++ b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
@@ -15,7 +15,6 @@ SRCREV = "1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e"
 
 SRC_URI = "git://github.com/notro/panel-mipi-dbi.git;protocol=https;branch=main"
 
-
 inherit native
 
 do_configure[noexec] = "1"
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb b/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
index 6f228b131e..d16a528778 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 DEPENDS = "mm-common cairomm glibmm pango"
 
-
 inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
index 88cdce26d1..fa12388a84 100644
--- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
@@ -10,5 +10,4 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/parallel-deqp-runner.git;protocol=h
 PV = "2020.06.15+git"
 SRCREV = "e1642fb691d29b1462504b58916f7f514a963e80"
 
-
 inherit pkgconfig meson
diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
index c794f41370..a3475deaa4 100644
--- a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
+++ b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SRCREV = "715e29fd4cd71b6e452ae0f4e36d917b43122ce8"
 SRC_URI = "git://github.com/fukuchi/libqrencode.git;branch=master;protocol=https"
 
-
 inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
index 258c78e509..4065eacc4e 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
            "
 SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'soup3', 'file://0001-config.mk-Fix-compiler-and-linker.patch file://0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch', '', d)}"
 
-
 inherit pkgconfig features_check
 
 PACKAGECONFIG_SOUP ?= "soup3"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
index f4923f3f00..e94d4d079c 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCREV = "4767ea922bcc460e70b87b1d303ebdfed0897da8"
 SRC_URI = "git://github.com/tesseract-ocr/tessdata.git;branch=main;protocol=https"
 
-
 inherit allarch
 
 do_install() {
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
index 4bc0f5b88f..f51ded61ab 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCREV = "3b7c70e34dea179549ed3e995872e2e019eb8477"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
 
-
 DEPENDS = "leptonica"
 
 EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index dd4f79c314..8b94e0fc6b 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -7,7 +7,6 @@ RDEPENDS:${PN} = "coreutils hicolor-icon-theme perl bash xkbcomp"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
-
 inherit autotools cmake features_check pkgconfig systemd
 
 REQUIRED_DISTRO_FEATURES = "x11 pam"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
index 92717da32f..7e91fb9c2c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
@@ -6,7 +6,6 @@ LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f96db970a9a46c5369142b99f530366b \
 "
 
-
 SRCREV = "4b0192046158094654e865245832c66d2104219e"
 SRC_URI = "git://github.com/liberationfonts/liberation-fonts.git;branch=main;protocol=https"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
index b5dae22a9d..be1370fb45 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
@@ -11,7 +11,6 @@ SRCREV = "aac7ccaa4d1dea4543453b96f7d6fc47066a57ff"
 PACKAGES = "${PN}-color ${PN}-regular"
 FONT_PACKAGES = "${PN}-color ${PN}-regular"
 
-
 FILES:${PN}-color = "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
 FILES:${PN}-regular = "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index ff89f7466a..ec0aa0b28d 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -9,7 +9,6 @@ SHA1SUM = "0cef8205"
 
 SRC_URI = "https://assets.ubuntu.com/v1/${SHA1SUM}-ubuntu-font-family-${PV}.zip"
 
-
 SRC_URI[sha256sum] = "61a2b342526fd552f19fef438bb9211a8212de19ad96e32a1209c039f1d68ecf"
 
 UPSTREAM_CHECK_URI = "https://repology.org/project/fonts:ubuntu/packages"
diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
index 5aea738c15..61be451d81 100644
--- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
+++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
@@ -14,7 +14,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "libev libx11 libxi libxfixes"
 
-
 do_install:append() {
     # LICENSE is installed to /usr/share/licenses but we don't want it in the package
     rm -rf ${D}${datadir}
diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
index 3ba561a54e..e2142c5d0a 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
@@ -8,7 +8,6 @@ DEPENDS = "virtual/libx11 libxext xorgproto"
 SRCREV = "79f1506a3307d3275b0fdfb2e110c173f68e6f78"
 SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau;branch=master"
 
-
 inherit features_check meson pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
index a7db743239..64af8a4b40 100644
--- a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
@@ -15,5 +15,4 @@ RDEPENDS:${PN} = "libvdpau"
 SRCREV = "d3c5bd63bf8878d59b22d618d2bb5116db392d28"
 SRC_URI = "git://anongit.freedesktop.org/vdpau/vdpauinfo;branch=master"
 
-
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 1cc2da7a49..821a781f6c 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -12,7 +12,6 @@ SRC_URI:append:toolchain-clang = "file://fix-clang-private-operator.patch"
 
 SRCREV_FORMAT = "vk-gl-cts"
 
-
 inherit pkgconfig cmake cmake-qemu features_check python3native
 
 UPSTREAM_CHECK_GITTAGREGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc b/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
index 042db48acb..edc4696215 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
@@ -10,4 +10,3 @@ SRC_URI = "${XORG_MIRROR}/individual/doc/${BPN}-${PV}.tar.${SRC_URI_EXT}"
 
 inherit autotools pkgconfig
 
-
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
index 8fd2ae2e84..2f98b589fa 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
@@ -9,5 +9,4 @@ DEPENDS += "virtual/libx11 libdrm xorgproto"
 SRCREV = "8bbdb2ae3bb8ef649999a8da33ddbe11a04763b8"
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc;branch=master"
 
-
 RDEPENDS:${PN} += "xserver-xorg-module-exa"
diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
index 073b3f0912..c79d2d1c5d 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
@@ -24,7 +24,6 @@ RDEPENDS:${PN} = " \
 
 inherit systemd perlnative pkgconfig gettext autotools-brokensep features_check
 
-
 EXTRA_OECONF += "--with-app-defaults=${datadir}/X11/app-defaults --libdir=${STAGING_LIBDIR} \
                  --includedir=${STAGING_INCDIR} --with-pam --with-login-manager"
 
diff --git a/meta-oe/recipes-graphics/yad/yad_6.0.bb b/meta-oe/recipes-graphics/yad/yad_6.0.bb
index 64c12f5904..be0921e35f 100644
--- a/meta-oe/recipes-graphics/yad/yad_6.0.bb
+++ b/meta-oe/recipes-graphics/yad/yad_6.0.bb
@@ -13,5 +13,4 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "gtk+3 glib-2.0-native intltool-native"
 
-
 FILES:${PN} += "${datadir}/icons/"
diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
index 7562271d90..111b286093 100644
--- a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -8,7 +8,6 @@ PV = "1.0.4+git"
 SRC_URI = "git://github.com/ReimuNotMoe/ydotool;protocol=https;branch=master"
 SRCREV = "0c295346d55afcc6aebaaee564333b3e1efabcbd"
 
-
 inherit cmake systemd
 
 EXTRA_OECMAKE = "\
diff --git a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
index 3bbfe4cf9f..814f681268 100644
--- a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
+++ b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git;protoc
 
 BBCLASSEXTEND = "native nativesdk"
 
-
 do_install () {
     install -d ${D}${bindir}
     install -m 0755 agent-proxy ${D}${bindir}
diff --git a/meta-oe/recipes-kernel/blktests/blktests.bb b/meta-oe/recipes-kernel/blktests/blktests.bb
index ded03a4de2..ab69812301 100644
--- a/meta-oe/recipes-kernel/blktests/blktests.bb
+++ b/meta-oe/recipes-kernel/blktests/blktests.bb
@@ -10,7 +10,6 @@ SRC_URI = " \
 	git://github.com/osandov/blktests.git;nobranch=1;protocol=https \
 	"
 
-
 inherit autotools-brokensep
 
 do_configure[noexec] = "1"
diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
index fe980e3e6f..fe09c22268 100644
--- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
@@ -14,7 +14,6 @@ SRCREV = "a0eb4805dbb232f02f156b9351a23790c1a4cec7"
 
 PE = "1"
 
-
 inherit allarch
 
 CLEANBROKEN = "1"
diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
index bafe56d2c4..458c600c59 100644
--- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
@@ -6,7 +6,6 @@ BPN = "crash"
 
 require crash.inc
 
-
 DEPENDS = "\
     nativesdk-ncurses \
     nativesdk-expat \
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 3c9a99ae4a..90dbd8d30d 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -44,7 +44,6 @@ COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:mipsarchn32 = "null"
 
-
 EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 GDB_TARGET="${TARGET_SYS}" \
                 GDB_HOST="${BUILD_SYS}" \
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb b/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
index 1af90978e0..9a49e459bc 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
@@ -1,6 +1,5 @@
 require crash.inc
 
-
 BBCLASSEXTEND = "native cross"
 
 EXTRA_OEMAKE:class-cross = 'RPMPKG="${PV}" \
diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
index b1ff8d4019..bd04a21ccb 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main;tag=v${PV}"
 SRCREV = "8209a147fb61deed38ca376d063bbff0343ca234"
 
-
 DEPENDS = "\
     autoconf-native \
     automake-native \
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index b5b8075fd7..8fc82a3e31 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -35,7 +35,6 @@ IANA_ENTERPRISE_NUMBERS ?= ""
 #IANA_ENTERPRISE_NUMBERS = "http://www.iana.org/assignments/enterprise-numbers.txt;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
 #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
 
-
 inherit autotools pkgconfig
 
 do_install:append() {
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
index b8ef092262..ee75ad5ff0 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -22,7 +22,6 @@ EXTRA_OEMAKE = " \
 	CC='${CC}' \
 	"
 
-
 do_install () {
 	oe_runmake install
 }
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
index 6521830b7a..49b858c597 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
@@ -6,5 +6,4 @@ SRCREV = "0c3c21930895f6582a5c9d9d797f7e11ff41ffb2"
 
 PV = "0.9.1"
 
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
index 1a90dcf998..65df447b06 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
@@ -14,7 +14,6 @@ SRC_URI = " \
 	file://0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch \
 	"
 
-
 inherit autotools-brokensep pkgconfig systemd
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index 4073381899..19d4cbc9b7 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -18,7 +18,6 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://0001-corestripper-Fix-uninitialized-warning.patch \
            "
 
-
 SYSTEMD_SERVICE:${PN} = "minicoredumper.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 6782dec228..7ba7558ec9 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;b
            file://0001-Do-not-emit-useless-rpath.patch"
 SRCREV = "18233e4c32857cb7ddd4960beeec8360ed834fc5"
 
-
 DEPENDS += "libtraceevent libtracefs zstd xmlto-native asciidoc-native swig-native bison-native flex-native"
 
 inherit pkgconfig bash-completion
diff --git a/meta-oe/recipes-kernel/turbostat/turbostat.bb b/meta-oe/recipes-kernel/turbostat/turbostat.bb
index f65699865e..6447c35417 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
@@ -33,7 +33,6 @@ DEPENDS = "libcap"
 #
 do_populate_lic[depends] = "${PN}:do_configure"
 
-
 EXTRA_OEMAKE = '\
                 CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}'  \
                '
@@ -63,7 +62,6 @@ do_configure:prepend() {
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
 }
 
-
 do_compile() {
 	sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
 	sed -i 's#<linux/compiler.h>#"compiler.h"#' build_bug.h
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
index 83fcaa248d..3c5b0822fc 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
@@ -12,5 +12,4 @@ PV .= "+git"
 SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https"
 SRCREV = "673a22a3c7c33e96e2ff7aae7c4d2bc190dfbf92"
 
-
 inherit cmake
diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 7ae262345b..f15a464881 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -4,7 +4,6 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "zlib"
 
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
            ${DEBIAN_MIRROR}/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-16.2.debian.tar.xz;name=patch;subdir=${BP} \
            file://acdefine.patch \
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
index 7f8988c3c3..a9bc1a47f8 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
@@ -16,7 +16,6 @@ SRC_URI = " \
     file://ppc_musl_ucontext.patch \
 "
 
-
 inherit meson pkgconfig
 
 EXTRA_OEMESON = "-Db_lto=false"
diff --git a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb b/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
index 58bbd8cac3..cba3d28985 100644
--- a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
+++ b/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
@@ -9,7 +9,6 @@ DEPENDS = "jack"
 SRC_URI = "git://github.com/jackaudio/jack-example-tools.git;branch=main;protocol=https"
 SRCREV = "33de8b4285fa5054af1b37fe0496c110604ed564"
 
-
 inherit meson pkgconfig
 
 PACKAGECONFIG ??= "alsa_in_out jack_rec"
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
index 3b3ea85349..91484e1ddd 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
@@ -24,7 +24,6 @@ SRCREV = "4f58969432339a250ce87fe855fb962c67d00ddb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-
 inherit waf pkgconfig
 
 PACKAGECONFIG ??= "alsa"
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
index 68a29dde91..80b0a0b6e1 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
@@ -9,7 +9,6 @@ SRCREV = "3188549fba13bbdf3a5a98de2a38c2e71f04e21e"
 
 inherit meson pkgconfig
 
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan opengl', d)} lcms"
 
 PACKAGECONFIG[vulkan] =  "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc spirv-shader-generator"
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
index 0a3b5d28b6..fbc2b9aee6 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
@@ -33,7 +33,6 @@ SRC_URI = "\
 
 SRCREV = "fc15e229d9d337e46d730f00647821adbbd58548"
 
-
 UPSTREAM_CHECK_GITTAGREGEX = "v4l-utils-(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OEMESON = "-Dudevdir=${base_libdir}/udev -Dv4l2-compliance-32=false -Dv4l2-ctl-32=false"
diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
index 651fbc4192..232b4171d2 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https \
 
 SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
 
-
 inherit cmake pkgconfig lib_package
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
index a7cd76e0c7..e38525d47b 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
@@ -12,7 +12,6 @@ SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=ma
            file://libvpx-configure-support-blank-prefix.patch \
            "
 
-
 # ffmpeg links with this and fails
 # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
 ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
index 48b2535a03..79646d8a9f 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branc
     file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.patch \
 "
 
-
 # Without this line, package is declared a library and named libgeoclue*
 AUTO_LIBNAME_PKGS = ""
 
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index bd15b0bda8..8e1dc41f7f 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -24,7 +24,6 @@ SRC_URI = " \
 
 UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
 
-
 inherit autotools pkgconfig useradd systemd
 
 EXTRA_OECONF += "--with-dblib=berkeley \
diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
index 8ed993aa78..2387c6d919 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
@@ -20,7 +20,6 @@ EXTRA_OECMAKE = ' \
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
 
-
 PACKAGECONFIG ?= "gnutls"
 PACKAGECONFIG[gnutls] = "-DREQUIRE_CRYPTO_GNUTLS=ON,-DREQUIRE_CRYPTO_OPENSSL=ON"
 
diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
index e7610ac785..fa52dcfa67 100644
--- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
+++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "git://github.com/a13xp0p0v/kernel-hardening-checker;protocol=https;branch=master"
 SRCREV = "f4dbe258ff3d37489962ea9cf210192ae7ff9280"
 
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
index 86f45656f6..55f54b1b14 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
@@ -26,7 +26,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git;p
            "
 SRCREV = "cb3bb194cca88211cbfcdde2f10c0f43c3fb8ec3"
 
-
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[manpages] = ""
 
@@ -53,7 +52,6 @@ do_install_ptest () {
     sed -i -e 's/OSDIST=Unknown/OSDIST=${DISTRO}/' ${D}${PTEST_PATH}/tests/prepare.inc.sh
 }
 
-
 RDEPENDS:${PN}-ptest += "bash file lsb-release make"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
index 48f9a738bb..3b2580fe94 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://spectre-meltdown-checker.sh;beginline=2;endline=2;md5
 SRC_URI = "git://github.com/speed47/spectre-meltdown-checker;protocol=https;branch=master"
 SRCREV = "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
 
-
 # binutils: readelf,objdump might be used for deeper analysis
 # coreutils: dd with iflag=skip_bytes oflag=seek_bytes in some cases
 # kernel-dev: /boot/config is used
diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
index 058fe6a7c4..6991a64a17 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
@@ -37,7 +37,6 @@ do_install:append () {
 
 FILES:${PN} += "${datadir}/emacs/site-lisp/csh-mode.el"
 
-
 pkg_postinst:${PN} () {
 #!/bin/sh -e
 echo /usr/bin/tcsh >> $D/etc/shells
diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
index 85443984a2..45accf0b62 100644
--- a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
+++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
@@ -11,7 +11,6 @@ SRCREV = "812e2c56aed246931a667f16c28b096e34597016"
 
 FILES:${PN} = "${datadir}/ace-builds"
 
-
 DEPENDS += "rsync-native"
 
 do_install () {
diff --git a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb b/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
index 260fba02a9..f47d818764 100644
--- a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
+++ b/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;branch=master \
            "
 SRCREV = "f081c69c26e330cf03ec790051c415c4716509d9"
 
-
 DEPENDS = "curl libyaml libusb1 openssl libftdi"
 
 inherit cmake pkgconfig
diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
index 3c8c41cc03..232b0988be 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
@@ -26,7 +26,6 @@ DEPENDS = "libatomic-ops"
 SRCREV = "ee59af3722e56de8404de6cd0c21c2493cc4d855"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https"
 
-
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--enable-cplusplus"
diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
index 0a2514237a..21b555526f 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
@@ -11,7 +11,6 @@ DEPENDS += "boost qemu-native"
 SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master"
 SRCREV = "cd3ef80206b71463de96d6b682cfdc99703ec147"
 
-
 inherit cmake
 
 # Building benchmarks takes a lot of time and requires additional headers (euml2.hpp)
diff --git a/meta-oe/recipes-support/btop/btop_1.4.3.bb b/meta-oe/recipes-support/btop/btop_1.4.3.bb
index 9a5a21c56d..e01a034aed 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.3.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.3.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main;tag
            "
 SRCREV = "3f1ccd9f6c455fef6d4d8cfbc8ed71b86961323d"
 
-
 inherit cmake
 
 FILES:${PN} += " \
diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
index 058ede614e..38f0587ceb 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88456d0a60de4c71ff4d787c212f253"
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master"
 SRCREV = "911e989fe41eb90c7df274cb54555346caf2a632"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
index 63500def05..0224bde784 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
@@ -8,7 +8,6 @@ DEPENDS = "libeigen glog"
 SRC_URI = "git://github.com/ceres-solver/ceres-solver.git;branch=master;protocol=https"
 SRCREV = "85331393dc0dff09f6fb9903ab0c4bfa3e134b01"
 
-
 inherit cmake
 
 do_configure:prepend() {
diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
index f2bae91f44..f66fb75979 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "\
 SRCREV = "858ce1b38e1534c2602eb431124b5dca706bc746"
 SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
 
-
 inherit meson
 
 DEPENDS = "openssl"
diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
index a1523be376..f137584033 100644
--- a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
+++ b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
@@ -17,7 +17,6 @@ DEPENDS = " \
 SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master"
 SRCREV = "5ef08f0cd6ede62de14de477b74fc3611108c676"
 
-
 inherit autotools pkgconfig systemd
 
 do_install:append() {
diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
index 4b8bf162fa..0ee70b0161 100644
--- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
+++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
@@ -16,7 +16,6 @@ SRC_URI = "\
     file://a53f123040998744602f190944464af0e159ea19.patch \
 "
 
-
 inherit cmake pkgconfig
 
 DEPENDS = "zlib boost openssl"
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
index ec7be4ad37..5b3ae39b2d 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
 # tag 2.10.19
 SRCREV = "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
 
-
 inherit cmake pkgconfig
 
 SKIP_RECIPE[cpprest] ?= "Needs websocketpp which does not yet work with boost >= 1.87"
diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
index 676028efa1..b42702488a 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/opsengine/cpulimit.git;protocol=https;branch=master
            file://0002-busy.c-Fix-incompatible-pointer-type-error.patch \
            "
 
-
 do_compile() {
     oe_runmake all
 }
diff --git a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
index 132395e023..97d63bd893 100644
--- a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
@@ -9,7 +9,6 @@ require ${BPN}-go-mods.inc
 
 SRCREV = "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
 
-
 GO_IMPORT = "github.com/usbarmory/crucible"
 GO_INSTALL = "\
     ${GO_IMPORT}/cmd/crucible \
diff --git a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb b/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
index 901763f0ad..4914b15a4d 100644
--- a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
+++ b/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e982d844baa4df1c80de75470e0c5cb"
 SRC_URI = "git://github.com/hanickadot/compile-time-regular-expressions.git;protocol=https;branch=main"
 SRCREV = "eb9577aae3515d14e6c5564f9aeb046d2e7c1124"
 
-
 inherit cmake
 
 PACKAGECONFIG ??= ""
diff --git a/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb b/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
index 7b0cc05979..9c53c11609 100644
--- a/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
+++ b/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8de00431559a76a1b43f6fd44f8f6689"
 SRC_URI = "git://github.com/jarro2783/cxxopts.git;protocol=https;branch=master"
 SRCREV = "44380e5a44706ab7347f400698c703eb2a196202"
 
-
 inherit cmake
 
 EXTRA_OECMAKE:append = " \
diff --git a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb b/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
index 5f33c27c52..f98d77eab0 100644
--- a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
+++ b/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
@@ -11,7 +11,6 @@ SRCREV = "07ff8654a270ec9b410acd3152b60de9e9f941af"
 
 SRC_URI = "git://github.com/tlsa/libcyaml.git;protocol=https;branch=main"
 
-
 inherit pkgconfig
 
 EXTRA_OEMAKE = "'PREFIX=""' 'DESTDIR=${D}' 'CFLAGS=${CFLAGS}' 'LIBDIR=${libdir}' 'INCLUDEDIR=${includedir}' 'VARIANT=release'"
diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index bae04ca7a3..4f0ea059ac 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -12,5 +12,4 @@ SRC_URI = " \
     file://0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch \
 "
 
-
 EXTRA_AUTORECONF += "--exclude=autoheader"
diff --git a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
index 31330faa17..6aa59085b3 100644
--- a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
+++ b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "https://github.com/google/double-conversion.git"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ea35644f0ec0d9767897115667e901f"
 
-
-
 SRC_URI = " \
         git://github.com/google/double-conversion.git;protocol=https;branch=master \
         file://run-ptest \
diff --git a/meta-oe/recipes-support/devmem2/devmem2_2.0.bb b/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
index e601755af4..3b4bdadcd7 100644
--- a/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
@@ -8,7 +8,6 @@ SRCREV = "5b395a946894eb4f4ef5d07c80a50a88573a541e"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
 
 do_compile() {
diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
index baddf42e6b..0097284e93 100644
--- a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
+++ b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
 
 SRCREV = "a162e63aad35358aab325388f3d5e88121606419"
 
-
 EXTRA_OEMAKE = "ds9097 ds9097u \
                 SYSTYPE='Linux' \
 "
diff --git a/meta-oe/recipes-support/dool/dool_1.3.4.bb b/meta-oe/recipes-support/dool/dool_1.3.4.bb
index d18f5c8b01..46a6ccbc23 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.4.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.4.bb
@@ -14,9 +14,7 @@ SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=http
 
 SRCREV = "5068abef0a960c173a91e84a45e7fea1b0a802c0"
 
-
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
 
-
diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
index 578a2b8d3b..cd9d3d23ae 100644
--- a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
+++ b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
@@ -10,7 +10,6 @@ RDEPENDS:${PN} += "bash bash-completion"
 SRC_URI = "git://gitlab.com/driverctl/driverctl.git;branch=master;protocol=https"
 SRCREV = "2ba60536eb20ca0a6a751bd8b6501dba84ec45d3"
 
-
 inherit pkgconfig systemd features_check
 
 do_install () {
diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
index fc8681ca44..f29b603290 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -13,7 +13,6 @@ PV = "0.0+git"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index aa0e86db12..9897208de0 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -17,7 +17,6 @@ SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e
 
 S = "${UNPACKDIR}/${BPN}"
 
-
 do_compile:prepend() {
     # PO subdir must be in build directory
     if [ ! ${S} = ${B} ]; then
diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 5cbe4551c0..d95b37a8e4 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -29,13 +29,11 @@ EXTRA_OECONF = " --with-x=no --with-dumping=none --disable-build-details"
 # Disable seccomp, as its a default dependency for gnutls but it doesnt work when cross-compiling emacs
 EXTRA_OECONF:append = " ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'ac_cv_have_decl_SECCOMP_FILTER_FLAG_TSYNC=no ac_cv_have_decl_SECCOMP_SET_MODE_FILTER=no', '', d)}"
 
-
 DEPENDS = "ncurses"
 DEPENDS:append:class-target = " emacs-native"
 
 inherit autotools mime-xdg pkgconfig
 
-
 # Create the required native tools for the target build
 do_compile:class-native (){
     cd ${B}/lib-src
@@ -58,7 +56,6 @@ do_compile:prepend:class-target () {
     export EMACSDATA=${S}/etc
 }
 
-
 do_install:prepend:class-target(){
     # export EMACS env variables for the native tools to use to allow calling bootstrap-emacs
     export EMACSLOADPATH=${S}/lisp
@@ -94,7 +91,6 @@ RPROVIDES:${PN}-base = "${PN}"
 RDEPENDS:${PN}-base:class-target = "${PN}-minimal"
 RDEPENDS:${PN}-full:class-target = "${PN}"
 
-
 # A minimal version of emacs that works
 # These are kept sorted in alphabetical order
 FILES:${PN}-minimal = " \
@@ -304,7 +300,6 @@ FILES:${PN}-base = " \
 FILES:${PN}-full = "${FILES:${PN}}"
 FILES:${PN}-full:append = " ${datadir}/icons"
 
-
 # The following does NOT build a native emacs.
 # It only builds some parts of it that are
 # required to by the build for target emacs.
diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index c80bf12ade..9ce413b1d8 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -15,7 +15,6 @@ S = "${UNPACKDIR}/espeak-${PV}-source"
 DEPENDS = "portaudio-v19 qemu-helper-native"
 inherit siteinfo qemu
 
-
 CXXFLAGS += "-DUSE_PORTAUDIO"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index e6f357fd4f..d1ee267c3e 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://fbset.c;endline=19;md5=bf326f82cdfcac391af208f019c560
 RRECOMMENDS:${PN} = "fbset-modes"
 DEPENDS = "bison-native flex-native"
 
-
 SRC_URI = "${DEBIAN_MIRROR}/main/f/fbset/fbset_2.1.orig.tar.gz \
            file://makefile.patch \
            file://fbset-2.1-fix-makefile-dep.patch \
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
index 284f61c137..823bc1c087 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
@@ -10,7 +10,6 @@ inherit pkgconfig cmake
 SRCREV = "eda5c99686e15327f2f37b9cadf307e852b96adf"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
 
-
 CVE_PRODUCT = "freerdp"
 
 PACKAGECONFIG ??= " \
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 18af3229d7..5fcbb36aa0 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -23,7 +23,6 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2024-32661.patch \
            "
 
-
 EXTRA_OECMAKE += " \
     -DWITH_FFMPEG=OFF \
     -DWITH_CUNIT=OFF \
diff --git a/meta-oe/recipes-support/function2/function2_4.2.4.bb b/meta-oe/recipes-support/function2/function2_4.2.4.bb
index 588e44deaa..45596263fc 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.4.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.4.bb
@@ -8,7 +8,6 @@ PV .= "+git"
 
 SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
 
-
 inherit cmake
 inherit ptest
 
diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
index ea5c487c52..e8bf89b2b0 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1;protocol=https \
 
 SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
 
-
 inherit autotools binconfig gettext pkgconfig
 
 EXTRA_OECONF += " --disable-rpath \
diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
index 8ea158eab3..8b8869003d 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 SRC_URI = "git://github.com/gflags/gflags.git;branch=master;protocol=https"
 SRCREV = "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTALL_DIR=${baselib}"
diff --git a/meta-oe/recipes-support/glog/glog_0.7.1.bb b/meta-oe/recipes-support/glog/glog_0.7.1.bb
index 570d9a7e5f..6c9cc4a1b7 100644
--- a/meta-oe/recipes-support/glog/glog_0.7.1.bb
+++ b/meta-oe/recipes-support/glog/glog_0.7.1.bb
@@ -12,7 +12,6 @@ SRC_URI = " \
 
 SRCREV = "7b134a5c82c0c0b5698bb6bf7a835b230c5638e4"
 
-
 inherit cmake
 
 PACKAGECONFIG ?= "shared unwind 64bit-atomics"
diff --git a/meta-oe/recipes-support/gnulib/gnulib_202401.bb b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
index f3fbb94ae8..97aab865bf 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_202401.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
@@ -16,7 +16,6 @@ SRCREV = "c99c8d491850dc3a6e0b8604a2729d8bc5c0eff1"
 SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=stable-${PV};protocol=https \
 "
 
-
 do_install () {
     install -d ${D}/${datadir}/gnulib
     cp --no-preserve=ownership --recursive ${S}/* ${D}/${datadir}/gnulib/
diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
index 4558aa13d6..f41f3091c4 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main;tag=v${PV}"
 SRCREV = "eddb0241389718a23a42db6af5f0164b6e0139af"
 
-
 EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=yes \
     -DBENCHMARK_ENABLE_TESTING=no \
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb b/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
index c0fe586f6d..ff6d1737c1 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
@@ -21,7 +21,6 @@ SRC_URI:append:libc-musl = " \
 
 inherit autotools
 
-
 # On mips, we have the following error.
 #   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
 #   Segmentation fault (core dumped)
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 155e56bdef..b0bcf742ae 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -20,7 +20,6 @@ SRC_URI = "git://github.com/telmich/gpm;protocol=https;branch=master \
            file://0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_Wge.patch \
            "
 
-
 inherit autotools-brokensep update-rc.d systemd texinfo
 
 INITSCRIPT_NAME = "gpm"
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index 5930a8c95c..96fc40351d 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -2,7 +2,6 @@ SUMMARY = "Hard disk temperature monitor daemon"
 SECTION = "console/network"
 LICENSE = "GPL-2.0-or-later"
 
-
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://hddtemp-no-nls-support.patch \
            file://hddtemp_0.3-beta15-52.diff \
diff --git a/meta-oe/recipes-support/htop/htop_3.3.0.bb b/meta-oe/recipes-support/htop/htop_3.3.0.bb
index efb89bf3ae..0d8d515aff 100644
--- a/meta-oe/recipes-support/htop/htop_3.3.0.bb
+++ b/meta-oe/recipes-support/htop/htop_3.3.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
 "
 SRCREV = "68c970c7ef4a0682760ed570b3d82388ae7ccf54"
 
-
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= " \
diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
index 7f6fba995c..bc97573b9c 100644
--- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
@@ -140,7 +140,6 @@ SRC_URI = "git://github.com/wooorm/dictionaries.git;branch=main;protocol=https"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_install() {
     for LANGUAGE in `ls -d1 ${S}/dictionaries/*` ; do
         LANGUAGE_DIR=`basename $LANGUAGE | sed 's:-:_:'`
diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
index 67a51f5c9f..b62b9ec5c0 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = " \
 SRCREV = "2969be996acad84b91ab3875b1816636fe61a40e"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
 
-
 inherit autotools pkgconfig gettext
 
 # ispellaff2myspell: A program to convert ispell affix tables to myspell format
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 10d2150998..a97ce95526 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -15,7 +15,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 
-
 inherit autotools pkgconfig update-alternatives
 export ac_cv_sys_file_offset_bits = "64"
 
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
index cb77dc81b0..32db50b3eb 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
@@ -9,7 +9,6 @@ SRCREV = "5c2ab772338bcbe516306bf8cf1059ddf2fa6bb7"
 SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
            "
 
-
 inherit autotools
 
 EXTRA_OECONF = "--disable-doxygen"
diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
index 314f67928a..6b7e226c24 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
 SRCREV = "64b9da1e9f15eeff4ec9d6bc856538db542118f2"
 
-
 inherit cmake
 
 PACKAGECONFIG ??= ""
diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index 89b2dff0ba..1822bcabd6 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://git.0pointer.net/libatasmart.git;protocol=http;branch=master \
            file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch \
 "
 
-
 inherit autotools lib_package pkgconfig
 
 do_install:append() {
diff --git a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
index 4a1052e75b..200b079172 100644
--- a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
+++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/libb64/libb64;protocol=https;branch=master \
            file://0001-examples-Use-proper-function-prototype-for-main.patch \
            "
 
-
 CFLAGS += "-fPIC"
 
 do_configure () {
diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
index ef2a6c76fb..24434f20f4 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
@@ -6,7 +6,6 @@ SECTION = "devel/lib"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
-
 SRCREV = "9da72b2732508b0ba0ceed27f5e50bc276ef31f2"
 SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https"
 
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 7d4a352a31..b8007e34ad 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -26,7 +26,6 @@ SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
            file://run-ptest \
 "
 
-
 inherit cmake pkgconfig ptest
 
 CXXFLAGS:append:toolchain-clang = " -Wno-error=c++11-narrowing-const-reference"
diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
index d825f8fdee..598bbe3164 100644
--- a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
@@ -21,7 +21,6 @@ inherit cmake
 
 EXTRA_OECMAKE = "-DCPPKAFKA_BUILD_SHARED=ON"
 
-
 do_install:append(){
     chrpath -d ${D}${libdir}/libcppkafka.so.${BASEPV}
     sed -i -e 's|${STAGING_INCDIR}|\$\{includedir\}|g' ${D}${datadir}/pkgconfig/cppkafka.pc
diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
index 939e7db24e..1a9f2ca4cf 100644
--- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/cyrozap/${BPN}.git;branch=master;protocol=https \
     file://0001-Fix-gcc-15-incompatible-pointer-types-error.patch \
 "
 
-
 inherit cmake
 
 PACKAGES =+ "${PN}-utils"
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
index f5f874941a..29ae6d0c4e 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;branch=3.4 \
 
 SRCREV = "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
 
-
 inherit cmake
 
 FILES:${PN}-dev += "${datadir}/eigen3/cmake"
diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/recipes-support/libfann/libfann_git.bb
index 2f68ea95a8..421259ff01 100644
--- a/meta-oe/recipes-support/libfann/libfann_git.bb
+++ b/meta-oe/recipes-support/libfann/libfann_git.bb
@@ -14,5 +14,4 @@ SRC_URI = "git://github.com/libfann/fann.git;branch=master;protocol=https \
 
 PV = "2.2.0+git"
 
-
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
diff --git a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb b/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
index 0ad4bd92c0..f6aa812b77 100644
--- a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
+++ b/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
@@ -11,5 +11,4 @@ DEPENDS += "libpng zlib"
 SRC_URI = "git://github.com/libharu/libharu.git;branch=master;protocol=https"
 SRCREV = "8fe5a738541a04642885fb7a75b2b5b9c5b416fa"
 
-
 inherit cmake
diff --git a/meta-oe/recipes-support/libiio/libiio_0.26.bb b/meta-oe/recipes-support/libiio/libiio_0.26.bb
index ecd9223600..a4a4ea42c4 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.26.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.26.bb
@@ -9,7 +9,6 @@ SRCREV = "a0eca0d2bf10326506fb762f0eec14255b27bef5"
 SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=libiio-v0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-
 SETUPTOOLS_SETUP_PATH ?= "${B}/bindings/python/"
 
 DEPENDS = " \
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
index f4e26a65fc..db5b671e87 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
@@ -7,7 +7,6 @@ SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main"
 
 SRCREV = "ab3f67fc4fad88cdf07b258c08e4164e06bf7506"
 
-
 JQUERYCOOKIEDIR = "${datadir}/javascript/jquery-cookie"
 JQUERYCOOKIEDOCDIR = "${docdir}/libjs-jquery-cookie"
 
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
index cbf5700a5b..472b08ac33 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
@@ -3,7 +3,6 @@ SECTION = "console/network"
 HOMEPAGE = "https://github.com/globalizejs/globalize"
 LICENSE = "MIT"
 
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4db68fb4d1d9986d736b35039f2ad9ea"
 
 SRCREV = "771061fb35f7fd8d7c2c37f5d5bb26115be382bc"
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
index 88fbc109ee..305501f7ae 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/fronteed/icheck.git;protocol=https;branch=${PV}"
 
 SRCREV = "c8c1af84e4b90b4aea31466aad09bf877619e943"
 
-
 do_install() {
         install -d ${D}${datadir}/javascript/jquery-icheck/
         install -m 0644 ${S}/icheck.js ${D}${datadir}/javascript/jquery-icheck/
diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
index a2de42d946..d5c606cd5b 100644
--- a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
+++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
@@ -16,7 +16,6 @@ SRC_URI += "git://github.com/LadislavSopko/mimetic/;branch=master;protocol=https
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 CXXFLAGS += "-Wno-narrowing -std=c++14"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
index 95d18a1ed0..2593329492 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
@@ -16,7 +16,6 @@ SRCREV = "5ec1f5284ecb0eda481f3d2d61236fbc5b46164f"
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master \
            file://0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch"
 
-
 inherit meson pkgconfig
 
 PACKAGECONFIG ??= "keyutils openssl"
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
index 2462786aae..d38c49500b 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
@@ -13,7 +13,6 @@ SRC_URI = " \
 
 SRCREV = "b505ef5161d2552102a743acd4ad83298d3d8f99"
 
-
 inherit meson pkgconfig gtk-doc gobject-introspection vala
 
 DEPENDS = "glib-2.0 libsoup libxslt"
diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
index ee75c39eee..194a5a8c9b 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://gitlab.com/libosinfo/osinfo-db-tools.git;branch=main;protocol=h
            "
 SRCREV = "e5564be303bfac49cc3490bd0fada342cd65566f"
 
-
 inherit meson pkgconfig
 
 do_configure:prepend () {
diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb b/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
index 33e17234ce..e9fce7e5fd 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://gitlab.com/libosinfo/osinfo-db.git;branch=main;protocol=https"
 
 SRCREV = "62f8adceb8ee88e643a134f2cfaf04fc11b9fc51"
 
-
 inherit allarch autotools-brokensep
 
 EXTRA_OEMAKE = "OSINFO_DB_TARGET='--dir ${datadir}/osinfo'"
diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb b/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
index 1731d350ae..51526e39c5 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
@@ -15,7 +15,6 @@ SRCREV = "6d669183c7b241ce47ecce28744837ad92814f5c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 
-
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-static"
diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
index 968094daff..b5f70b2e0a 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
@@ -16,7 +16,6 @@ DEPENDS = "zlib openssl zstd"
 
 inherit cmake
 
-
 FILES:${PN} += "${datadir}"
 
 EXTRA_OECMAKE += "-DRDKAFKA_BUILD_EXAMPLES=OFF -DRDKAFKA_BUILD_TESTS=OFF"
diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
index 31dce12155..7e2a75d871 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
@@ -9,10 +9,8 @@ SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=ht
 
 SRCREV = "093d80b4006042b75a433a5e63760ae9bebad142"
 
-
 inherit cmake
 
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 EXTRA_OECMAKE += "-DUNIX_LINUX=1"
 
-
diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
index 958f3cf5a1..d3e5367c5c 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
@@ -12,7 +12,6 @@ inherit autotools pkgconfig python3-dir
 SRCREV = "fd1ad6e7823fa76d8db0d3c5884faffa8ffddafb"
 SRC_URI = "git://github.com/jackmitch/libsoc.git;branch=master;protocol=https"
 
-
 BOARD ??= "devboard"
 
 PACKAGECONFIG ?= ""
diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
index c6bbd1716b..e09497eef1 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/DMTF/libspdm.git;branch=main;protocol=https \
            file://0001-Backport-API-introduced-in-openssl-3.5.0.patch"
 SRCREV = "1be116c7b7713fa9003e1bd53b53a34758549eb9"
 
-
 inherit cmake
 
 LIBSPDM_CFLAGS = "\
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb b/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
index bb2b0dc466..9aa3c33707 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
@@ -15,7 +15,6 @@ SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused
 
 SRCREV = "854795c654eda518ed6de6c1ebb4e2107fcb2e73"
 
-
 inherit cmake ptest
 
 PACKAGECONFIG ??= "gcrypt ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
diff --git a/meta-oe/recipes-support/libteam/libteam_1.32.bb b/meta-oe/recipes-support/libteam/libteam_1.32.bb
index 4686f4be5c..035dd05270 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.32.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.32.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://github.com/jpirko/libteam;branch=master;protocol=https \
            "
 SRCREV = "8b843e93cee1dab61fb79b01791201cdad45e1d1"
 
-
 inherit autotools pkgconfig ptest
 
 FILES:${PN} = "${libdir}/libteam${SOLIBS} \
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index b91a455aff..eeaede825f 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://readme.txt;md5=f8f366f3370dda889f60faa7db162cf4"
 SECTION = "libs"
 CVE_PRODUCT = "tinyxml"
 
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
            file://enforce-use-stl.patch \
            file://entity-encoding.patch \
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
index 89e6eca99b..2ba5cc062e 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
@@ -9,7 +9,6 @@ SRCREV = "9148bdf719e997d1f474be6bcc7943881046dba1"
 SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
            file://run-ptest"
 
-
 inherit meson ptest
 
 EXTRA_OEMESON += " \
diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb b/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
index 28c474e1dd..aa2b2fcea5 100644
--- a/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
+++ b/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/libtom/libtommath.git;protocol=https;branch=master"
 
 SRCREV = "95d80fd8229d05dd6cb4ec88bc8d4f5377ff00ef"
 
-
 EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' 'CFLAGS=${CFLAGS}'"
 
 do_compile() {
diff --git a/meta-oe/recipes-support/liburing/liburing_2.9.bb b/meta-oe/recipes-support/liburing/liburing_2.9.bb
index a645a8e4c4..34c8bbf663 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.9.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.9.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
            file://0001-test-Including-missing-string.h-for-memcpy.patch"
 SRCREV = "08468cc3830185c75f9e7edefd88aa01e5c2f8ab"
 
-
 DEPENDS:append:libc-musl = " libucontext"
 XCFLAGS = "-pthread"
 XCFLAGS:append:libc-musl = " -lucontext"
diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
index 84f97aab2c..c2763f2b8c 100644
--- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
+++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/libusbg/libusbg.git;branch=master;protocol=https \
            file://0001-Fix-out-of-tree-builds.patch \
           "
 
-
 ALTERNATIVE:${PN} = "gadget-acm-ecm show-gadgets"
 ALTERNATIVE_LINK_NAME[gadget-acm-ecm] = "${bindir}/gadget-acm-ecm"
 ALTERNATIVE_LINK_NAME[show-gadgets] = "${bindir}/show-gadgets"
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 7b12b911d8..4542d47a5a 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -18,7 +18,6 @@ SRC_URI = " \
     file://usbgx.service \
 "
 
-
 PACKAGECONFIG ??= "examples gadget-schemes libconfig"
 PACKAGECONFIG[libconfig] = "--with-libconfig=yes,--without-libconfig,libconfig"
 PACKAGECONFIG[examples] = "--enable-examples,--disable-examples"
diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index c8ffb65fa1..d2f6089cbf 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -15,7 +15,6 @@ DEPENDS = "bison-native"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=30;md5=94c18755082a2da9c9cf97cba3ad47d6"
 
-
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
 EXTRA_OEMAKE = "CFLAGS='${CFLAGS}'"
diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index 3b96210633..842383cd04 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN} = "mcelog mce-inject dialog bash"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-
 EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
 
 do_install:append(){
diff --git a/meta-oe/recipes-support/mcelog/mcelog_204.bb b/meta-oe/recipes-support/mcelog/mcelog_204.bb
index c3d082aa67..cb96042267 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_204.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_204.bb
@@ -15,7 +15,6 @@ SRCREV = "ad244c6b60fcbd08a5d73497bfb3487983801598"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-
 inherit ptest
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
diff --git a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb b/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
index 59f2e430aa..262f3b0666 100644
--- a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
+++ b/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "http://github.com/mity/md4c"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=383f39920f391605af6e8e46e60e2378"
 
-
-
 SRC_URI = " \
         git://github.com/mity/md4c.git;protocol=https;branch=master \
 "
diff --git a/meta-oe/recipes-support/mg/mg_20230501.bb b/meta-oe/recipes-support/mg/mg_20230501.bb
index 04811f1bdd..3979424fa1 100644
--- a/meta-oe/recipes-support/mg/mg_20230501.bb
+++ b/meta-oe/recipes-support/mg/mg_20230501.bb
@@ -14,7 +14,6 @@ SRC_URI:append:libc-musl = "\
            file://0001-Undefine-REGEX-for-musl-based-systems.patch \
            "
 
-
 # CFLAGS isn't in EXTRA_OEMAKE, as the makefile picks it up via ?=
 EXTRA_OEMAKE = "\
     'CC=${CC}' \
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
index 07bc84ce8b..5c9506b4db 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
@@ -53,7 +53,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
 
 SRCREV = "cb8de98b2cc3b62fd1a578ba479c0820778e9c02"
 
-
 inherit systemd pkgconfig
 
 SYSTEMD_SERVICE:${PN} = "multipathd.service"
diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
index 7390d83bcc..da9afcfc01 100644
--- a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
+++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/Oblomov/clinfo.git;protocol=https;branch=master"
 
 SRCREV = "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
 
-
 DEPENDS += "opencl-headers virtual/opencl-icd"
 
 do_install() {
diff --git a/meta-oe/recipes-support/opencv/ade_0.1.2.bb b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
index b54c28d624..dd24d7af1f 100644
--- a/meta-oe/recipes-support/opencv/ade_0.1.2.bb
+++ b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit cmake
 
-
 EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release"
 
 FILES:${PN}-dev += "${datadir}/${BPN}/*.cmake"
diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 826eff30ca..7001a526df 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -18,7 +18,6 @@ SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
 SRCREV_fastcv = "8d86e68dad8b80b8575a8d3cf401d3ee96c24148"
 
-
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg_fastcv"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=https \
            git://github.com/opencv/opencv_contrib.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/contrib;name=contrib;branch=4.x;protocol=https \
@@ -39,7 +38,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
-
 # OpenCV wants to download more files during configure.  We download these in
 # do_fetch and construct a source cache in the format it expects
 OPENCV_DLDIR = "${WORKDIR}/downloads"
diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
index 78258c965a..b2554c616a 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=0.26.1;protocol=https"
 
 CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"
 
-
 inherit autotools pkgconfig bash-completion
 
 EXTRA_OECONF = " \
diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
index 0b5740c161..9628a464bb 100644
--- a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
@@ -4,13 +4,11 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3d82780e8917b360cbee7b9ec3e40734"
 
-
 # v0.97
 SRCREV = "57ebc07ad8723ea4106090536c58c7f7160743e2"
 SRC_URI = "git://github.com/kenyapcomau/p910nd;protocol=https;branch=master \
            file://fix-var-lock.patch"
 
-
 inherit update-rc.d
 
 INITSCRIPT_NAME = "p910nd"
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index c54c054cf8..0cf54488a5 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/performancecopilot/pcp;branch=stable;protocol=https
 
 SRCREV = "d8d97b79ee47d9dfb076a3242564ed3cae04eba9"
 
-
 inherit setuptools3-base pkgconfig autotools-brokensep
 
 # Specify any options you want to pass to the configure script using EXTRA_OECONF:
diff --git a/meta-oe/recipes-support/pcp/pcp_6.3.7.bb b/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
index 65efac06be..2485341448 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
@@ -9,7 +9,6 @@ require pcp.inc
 DEPENDS += "perl-native bison-native flex-native python3-native python3-setuptools python3 \
 	pcp-native cairo zlib ncurses readline libx11 avahi openssl"
 
-
 SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
             file://pass-options-to-AR.patch \
             file://fix_parallel_make.patch \
diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
index 14ffab6128..633ad8bcf9 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
@@ -9,7 +9,6 @@ SRCREV = "778da3d86a59f5166443118c158e11ba4da9a5f1"
 
 inherit autotools pkgconfig
 
-
 DEPENDS = "pcsc-lite autoconf-archive-native"
 
 RDEPENDS:${PN} += " \
diff --git a/meta-oe/recipes-support/picocom/picocom_2024.bb b/meta-oe/recipes-support/picocom/picocom_2024.bb
index 37cf2d0a4c..b2d09e80f2 100644
--- a/meta-oe/recipes-support/picocom/picocom_2024.bb
+++ b/meta-oe/recipes-support/picocom/picocom_2024.bb
@@ -9,7 +9,6 @@ SRCREV = "7b6acbd421a2d4ca99376b7b427828dc1bcba4d8"
 SRC_URI = "git://gitlab.com/wsakernel/picocom;branch=master;protocol=https \
            "
 
-
 EXTRA_OEMAKE = "'CC=${CC}' 'LD=${CC}' 'VERSION=${PV}' \
 		'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}' "
 
diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
index c547b0532e..d92486aeb6 100644
--- a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
+++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
@@ -13,7 +13,6 @@ SRCREV = "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_compile() {
     oe_runmake CC="${CC}" CXX="${CXX}" EXTRA_INCLUDES="${TARGET_CFLAGS}" AR="${AR}";
 }
diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recipes-support/pidgin/icyque_git.bb
index e8b4a3c2c3..1211cdf2a9 100644
--- a/meta-oe/recipes-support/pidgin/icyque_git.bb
+++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
@@ -15,7 +15,6 @@ SRCREV = "513fc162d5d1a201c2b044e2b42941436d1069d5"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_compile() {
     oe_runmake;
 }
diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
index a403289cfc..2014d499cb 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
@@ -19,7 +19,6 @@ SRCREV = "8f6b94409d4872265076df310492da1e5f6abdf7"
 
 SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https"
 
-
 inherit meson pkgconfig
 
 # Overwrite default pkcs11 module path
diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
index e0f6c4169e..9103cc591c 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -18,7 +18,6 @@ SRCREV = "7f848d25aa0461d3beeff1189dc61b48ffe8e2f4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-
 inherit cmake ptest
 
 # By default the most commonly used poco components are built
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
index 4451e96307..cbd110776c 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -8,7 +8,6 @@ PV .= "+git"
 SRC_URI = "git://github.com/PortAudio/portaudio.git;branch=master;protocol=https"
 SRCREV = "929e2e8f7af281c5eb4fa07758930d542ec43d97"
 
-
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
index 65caa05a13..99b2de6341 100644
--- a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
+++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/ago/pps-tools.git;branch=master;protocol=https \
            file://0001-Use-lld-in-printf-for-64-bit-time_t.patch \
            "
 
-
 RDEPENDS:${PN} = "bash"
 
 do_install() {
diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
index 55a834fa42..a9b08ec5a4 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
           "
 
-
 DEPENDS = "abseil-cpp ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtest googlebenchmark', '', d)}"
 
 inherit cmake ptest
diff --git a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
index 4172de857c..2a84c06ea1 100644
--- a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
+++ b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 SRC_URI = "git://gitlab.com/postmarketOS/reboot-mode.git;protocol=http;branch=master"
 SRCREV = "84831b20512abd9033414ca5f5a023f333525335"
 
-
 # Upstream repo has not made releases/tags after 1.0.0
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb b/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
index 5f4ffcd657..cd023ad7bf 100644
--- a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
+++ b/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a0555028c71837623fa6dfa4cc45c0"
 SRC_URI = "git://github.com/nelhage/reptyr.git;protocol=https;branch=master"
 SRCREV = "1238097fc2cd15db058d2185cc4985daa87bcd41"
 
-
 inherit bash-completion github-releases manpages pkgconfig
 
 GITHUB_BASE_URI = "https://github.com/nelhage/${BPN}/releases/"
diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index 8c4183bae3..520c2591bb 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -29,7 +29,6 @@ SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=https \
            file://configure-fix-cmd_rsync.patch \
           "
 
-
 inherit autotools perlnative
 
 # Fix rsnapshot.conf.default:
diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb b/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
index 711d4696fd..1dcd030294 100644
--- a/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74274e8a218423e49eefdea80bc55038"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BPN}.git;protocol=https;branch=master"
 SRCREV = "61839777afedcc7bdb68ea4628c5ce5ca72c2ac8"
 
-
 EXTRA_OEMAKE = "DESTDIR=${D}"
 
 do_install() {
diff --git a/meta-oe/recipes-support/sdmon/sdmon_git.bb b/meta-oe/recipes-support/sdmon/sdmon_git.bb
index 8007ead6c6..b941eb95b3 100644
--- a/meta-oe/recipes-support/sdmon/sdmon_git.bb
+++ b/meta-oe/recipes-support/sdmon/sdmon_git.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/Ognian/sdmon;protocol=https;branch=master"
 PV = "0.9.0"
 SRCREV = "4dff9b690e8d4454fada6abfbb6b32fcb794968c"
 
-
 do_compile() {
 	oe_runmake -C ${S}/src CC="${CC}" CFLAGS="${CFLAGS} -D_REENTRANT -DVERSION=\"\\\"${PV}\\\"\"" LDFLAGS="${LDFLAGS}"
 }
diff --git a/meta-oe/recipes-support/serial/serial_1.2.1.bb b/meta-oe/recipes-support/serial/serial_1.2.1.bb
index 42151da532..a8410b2e40 100644
--- a/meta-oe/recipes-support/serial/serial_1.2.1.bb
+++ b/meta-oe/recipes-support/serial/serial_1.2.1.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
 SRCREV = "10ac4e1c25c2cda1dc0a32a8e12b87fd89f3bb4f"
 SRC_URI[sha256sum] = "c8cd235dda2ef7d977ba06dfcb35c35e42f45cfd9149ba3ad257756123d8ff96"
 
-
 inherit cmake
 
 # Work-around for https://github.com/wjwwood/serial/issues/135
diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
index 047f10589d..940d9f7268 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
@@ -14,7 +14,6 @@ SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;t
 
 SRCREV = "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
 
-
 INHIBIT_DEFAULT_DEPS = "1"
 
 # `make clean` removes files, they can't be rebuild with `make all`
diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
index 887615ef45..542eb3e39a 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -15,7 +15,6 @@ SRC_URI = " \
 "
 SRCREV = "6c603565f36e9996d85045c8012cd04aba5f3708"
 
-
 EXTRA_OECONF += "--disable-zypp"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'api-documentation systemd pam', d)}"
diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb b/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
index 9fef39216f..6f38fd9759 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
@@ -6,5 +6,4 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SRC_URI += "git://github.com/martinmoene/span-lite;branch=master;protocol=https"
 SRCREV = "50f55c59d1b66910837313c40d11328d03447a41"
 
-
 inherit cmake
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
index 25d8249917..27ea330f43 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
 
 DEPENDS += "fmt"
 
-
 inherit cmake
 
 # no need to build example & tests & benchmarks on pure yocto
diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index e313685d95..743d5caf8a 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 PV = "1.0.2"
 SRCREV = "1748e092425a4a0ff693aa347062a57fc1ffdd00"
 
-
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https;branch=master"
 
-
 inherit autotools
diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
index bba2507e14..be9f6b211d 100644
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
@@ -10,7 +10,6 @@ SRCREV = "e7c351c6c722336b3c79b79cd002c7c2986eefb0"
 SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master"
 SRC_URI[sha256sum] = "a715e46d8498418dbb8a2519318ba0714ee148151d7e4a7fa5e27770a2f6888f"
 
-
 inherit autotools-brokensep pkgconfig
 
 EXTRA_OEMAKE = "DESTDIR='${D}' PREFIX='${prefix}' LDCONFIG='true' LIBDIR='${D}${libdir}'"
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index e215c62620..6b0174389a 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -16,7 +16,6 @@ SRC_URI += "file://CVE-2020-15117.patch"
 SRCREV ?= "1b4c076127687aceac931d269e898beaac1cad9f"
 PV = "1.10.1+git"
 
-
 inherit cmake features_check
 
 EXTRA_OECMAKE += "-DSYNERGY_BUILD_LEGACY_GUI=OFF"
diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
index 019098fdf7..4a5d1e322e 100644
--- a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
+++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
@@ -11,7 +11,6 @@ inherit meson systemd pkgconfig useradd features_check
 REQUIRED_DISTRO_FEATURES = "systemd"
 COMPATIBLE_HOST:libc-musl = "null"
 
-
 DEPENDS += "systemd"
 DEPENDS += "openssl"
 DEPENDS += "gperf-native"
diff --git a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
index 937cf6a0b9..15009d790d 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
@@ -17,7 +17,6 @@ SRCREV = "45587e94dfb6dfe00220c5f520020a5bc745e92f"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
           "
 
-
 inherit cmake pkgconfig
 
 # test build fails, error: 'mallinfo mallinfo()' is deprecated
@@ -53,11 +52,9 @@ LDFLAGS:append:libc-musl = " -lucontext"
 # The latest version of oneTBB does not support PPC
 COMPATIBLE_MACHINE:powerpc = "(!.*ppc).*"
 
-
 do_install:append:class-target() {
     # fix for qa check buildpaths
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/TBB/TBBTargets.cmake
 }
 
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/tio/tio_3.9.bb b/meta-oe/recipes-support/tio/tio_3.9.bb
index 67107e2924..a95986e759 100644
--- a/meta-oe/recipes-support/tio/tio_3.9.bb
+++ b/meta-oe/recipes-support/tio/tio_3.9.bb
@@ -9,7 +9,6 @@ SRCREV = "bdfe87e1cbf6e3bfd48324a25ea026fcd3cc47e9"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;branch=master;tag=v${PV}"
 
-
 inherit meson pkgconfig
 
 RDEPENDS:${PN} += " lua"
diff --git a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
index aa884419f8..3718d1bdfb 100644
--- a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
 # April 1, 2025
 SRCREV = "635738b64eb52d376c5d1756c265de67236c8934"
 
-
 do_install() {
 	install -d ${D}${datadir}
 	install -m0644 ${S}/usb.ids ${D}${datadir}
diff --git a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb b/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
index 357ddfdbca..58cc19459b 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "\
     file://run-ptest \
 "
 
-
 inherit ptest
 
 do_compile[noexec] = "1"
diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
index e42b19a8d0..c62c12a870 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -14,5 +14,4 @@ SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"
 
 PV = "1.0.6+git"
 
-
 PARALLEL_MAKE = ""
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
index 17b71411ca..81a585e3c2 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
@@ -25,7 +25,6 @@ RDEPENDS:${PN}-dev = ""
 # tag 0.8.2
 SRCREV = "56123c87598f8b1dd471be83ca841ceae07f95ba"
 
-
 inherit cmake
 
 PACKAGES =+ "${PN}-examples"
diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
index 533b0801cb..1f7db38415 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
@@ -16,7 +16,6 @@ SRCREV = "d463bad9639c910fadc2f30dac473c7688b11cfc"
 
 PV = "0.9.19"
 
-
 FILES:${PN} += "${libdir}/xorg/modules/*"
 
 require recipes-graphics/xorg-xserver/xserver-abi.inc
diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
index 09db5519ea..6ba656ae6c 100644
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
 SRCREV = "28f93bdec6387d42332220afa9558060c8016795"
 PV .= "+git"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DYAML_CPP_BUILD_TESTS=OFF -DYAML_BUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TOOLS=OFF"
diff --git a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb b/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
index 0655f225b4..244239747a 100644
--- a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
+++ b/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c8ae1b99922935413d4c596f50b59545"
 SRC_URI = "git://github.com/ibireme/yyjson.git;protocol=https;branch=master;tag=${PV}"
 SRCREV = "9e24d6bcead647231f81173cc5c6bb6c097c00e4"
 
-
 inherit cmake
 
 PACKAGECONFIG ??= "reader writer utils fast-fp-conv non-standard utf8-validation unaligned-memory-access"
diff --git a/meta-oe/recipes-test/bats/bats_1.12.0.bb b/meta-oe/recipes-test/bats/bats_1.12.0.bb
index 14a234c866..04c8de85f8 100644
--- a/meta-oe/recipes-test/bats/bats_1.12.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.12.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "\
 # v1.12.0
 SRCREV = "713504bc0224a19b3d7c7958c18dc07f64f54b44"
 
-
 # Numerous scripts assume ${baselib} == lib, which is not true.
 #
 do_configure:prepend() {
diff --git a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
index 6a7fc5ad47..375dea8fb2 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
 SRCREV = "2b60af89e23d28eefc081bc930831ee9d45ea58b"
 
-
 inherit cmake python3native
 
 do_install:append() {
diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
index 09afe36666..7e929ea5f3 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=st
            file://run-ptest \
           "
 
-
 inherit cmake ptest
 
 EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
index 5710585b6c..46d03af582 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ce5d5f1fe02bcd1343ced64a06fd4177"
 SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master"
 SRCREV = "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
 
-
 inherit cmake
 
 EXTRA_OECMAKE = "-DLONGLONG=ON \
diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb b/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
index ad545e627b..0e75172c2f 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=m
 
 SRCREV = "be56f653743cc0e68bef81ef35df7c50ff8919c4"
 
-
 RRECOMMENDS:${PN} = "libgpiod-tools"
 
 do_install () {
diff --git a/meta-oe/recipes-test/evtest/evtest_1.35.bb b/meta-oe/recipes-test/evtest/evtest_1.35.bb
index 9c42efcdab..9e4ea2e177 100644
--- a/meta-oe/recipes-test/evtest/evtest_1.35.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.35.bb
@@ -11,5 +11,4 @@ SRC_URI = "git://gitlab.freedesktop.org/libevdev/evtest.git;protocol=https;branc
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            "
 
-
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
index 98db76eda1..b614805f6a 100644
--- a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
+++ b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com//ponty/fb-test-app.git;branch=master;protocol=https"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 fb-test ${D}${bindir}
diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
index 3588e96847..877de5f31a 100644
--- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;protocol=https
            file://0001-Makefile-Detect-compiler-in-makefile.patch \
            "
 
-
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
 do_configure[noexec] = "1"
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index c617cf09a3..a884239e2c 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -11,5 +11,4 @@ SRCREV = "2ee61484167eab846f7b7c565284d7c350d738d3"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-
 inherit cmake
diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index d7e9618985..1b24bba388 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -15,7 +15,6 @@ SRC_URI = " \
     file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
 "
 
-
 CFLAGS += "-pthread"
 
 PATCHTOOL = "git"
diff --git a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
index 8d298e3c1d..fc6e97915f 100644
--- a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
+++ b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 SRC_URI = " git://github.com/kward/shunit2.git;branch=master;protocol=https"
 SRCREV = "080159b303537888c5d41910b4d47a5002638e30"
 
-
 do_install() {
     install -D -m 0755 ${S}/shunit2 ${D}${bindir}/shunit2
 }
diff --git a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb b/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
index 3f2f07c28f..38854874aa 100644
--- a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
+++ b/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SRC_URI = "git://github.com/rollbear/trompeloeil.git;branch=main;protocol=https"
 SRCREV = "ad9bc41b1e01ae92802de59a12d19cf7c8683d6d"
 
-
 inherit cmake
 
 # Header-only library
diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
index 7b28d59228..6e7373def3 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
@@ -9,7 +9,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
 
-
 DEPENDS += "perl"
 
 RDEPENDS:${PN} += " \
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
index 519c2ad54c..c486e01901 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
@@ -12,10 +12,8 @@ SRC_URI[sha256sum] = "adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c713
 
 S = "${UNPACKDIR}/HTML-Tagset-${PV}"
 
-
 inherit cpan ptest-perl
 
-
 RDEPENDS:${PN} += "perl-module-strict perl-module-vars"
 
 RDEPENDS:${PN}-ptest += "perl-module-test"
diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
index a2c3e8a46e..4c9cecca17 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
@@ -8,7 +8,6 @@ SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"
 
-
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.gz"
 SRC_URI[sha256sum] = "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6aaa8296ea41bf199d"
 
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
index f3c6e1a016..7914e7189d 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
@@ -27,7 +27,6 @@ do_install:append() {
     `find ${D}/usr/lib/perl5 -type f -name .packlist`
 }
 
-
 RDEPENDS:${PN} += " \
     libextutils-config-perl \
     libextutils-helpers-perl \
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index 108c965968..38fb8cb6df 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -19,7 +19,6 @@ SRCNAME = "Module-Pluggable"
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75c5a6df"
 
-
 UPSTREAM_CHECK_REGEX = "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"
 UPSTREAM_CHECK_URI = "https://metacpan.org/release/${SRCNAME}"
 
diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index 205775ef63..6e8618a3d1 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -14,5 +14,4 @@ RDEPENDS:${PN} += " \
 SRC_URI = "git://github.com/MostAwesomeDude/txWS.git;branch=master;protocol=https"
 SRCREV = "88cf6d9b9b685ffa1720644bd53c742afb10a414"
 
-
 inherit setuptools3
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
index a6395b9e47..f7df7e9ff6 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-python/telepathy-
            file://remove_duplicate_install.patch \
            file://telepathy-python_fix_for_automake_1.12.patch"
 
-
 S = "${UNPACKDIR}/telepathy-python-${PV}"
 
 inherit autotools python3native
diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
index 5d68b3e3f9..eee001ffdc 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-
 SRC_URI[sha256sum] = "c343bd80a0bec947a9860adb4c432ffa7db769836c64238fc34bdc3fec84d590"
 
 export BUILD_SYS
diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
index b2834568b7..2c39dc3e75 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
@@ -11,5 +11,4 @@ SRCREV ?= "c7553c79f9222e20783fe9bd8a553f932e918072"
 
 inherit setuptools3
 
-
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
index 4b4ff952ef..b5b4ce4e04 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/aws/aws-iot-device-sdk-python;branch=master;protocol
            file://0001-setup.py-Use-setuptools-instead-of-distutils.patch \
            "
 
-
 inherit setuptools3
 
 PYPI_PACKAGE = "AWSIoTPythonSDK"
diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
index 97b59358f7..5014d5d5cb 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -7,7 +7,6 @@ PV .= "+git${SRCREV}"
 SRCREV = "9520119376046aeff73804b5f1ea05d87a63f370"
 SRC_URI += "git://github.com/behave/behave;branch=master;protocol=https"
 
-
 inherit setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
index f88d43a21a..3c6fcc0c93 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
@@ -12,7 +12,6 @@ SRC_URI += " \
         file://0001-Drop-ptests-fixtures-and-recorde_modes.patch \
 "
 
-
 inherit setuptools3 ptest
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
index 288c4068cd..bbbe6c2a4a 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/ReFirmLabs/binwalk;protocol=https;branch=master"
 
 SRCREV = "cddfede795971045d99422bd7a9676c8803ec5ee"
 
-
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
index 4c534e1892..3ee2cd76de 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
@@ -8,7 +8,6 @@ PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;d
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest-asyncio \
 "
diff --git a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
index 16aa5c3477..dc38df852e 100644
--- a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
@@ -11,7 +11,6 @@ SRC_URI += " \
 
 SRCREV = "007f5aff5d1c817883385a5f61f742dd11776dc6"
 
-
 inherit setuptools3 ptest
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
index 6e6e3eba31..ddaa9242b9 100644
--- a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
@@ -6,5 +6,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 SRC_URI = "git://github.com/fedora-python/crypt_r.git;branch=main;protocol=https"
 SRCREV = "b20e21d9f24d6fa17a6781bbc9f272ce38246eef"
 
-
 inherit python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
index 78402d50f4..efb8d41025 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
@@ -7,7 +7,6 @@ SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https;branch=master"
 
 SRCREV = "3b718ee560b3b97d6255c55f0ed7f64cb4b72082"
 
-
 RDEPENDS:${PN} += "lapack suitesparse"
 DEPENDS += "lapack suitesparse"
 
diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
index 7c759613ee..1022a3b2cc 100644
--- a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/dasbus-project/dasbus.git;protocol=https;branch=mast
 "
 SRCREV = "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
 
-
 inherit setuptools3 ptest-python-pytest
 
 do_install_ptest:append () {
diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
index b72d7bd401..b23a449514 100644
--- a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/ldo/dbussy.git;branch=master;protocol=https \
 
 SRCREV = "37ede4242b48def73ada46c2747a4c5cae6abf45"
 
-
 inherit setuptools3
 
 RDEPENDS:${PN} += "\
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
index 4f0b6bb150..430a6453b3 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
@@ -10,7 +10,6 @@ SRC_URI = " \
 "
 SRCREV = "fe536afac4da31e86909191ef31708755ab8cf83"
 
-
 inherit python_hatchling
 
 DEPENDS += " \
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
index 368b9e49b7..0d556d5842 100644
--- a/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
@@ -12,7 +12,6 @@ do_install_ptest:append () {
 	cp -f ${S}/test_inflection.py ${D}${PTEST_PATH}/
 }
 
-
 RDEPENDS:${PN} += "python3-pytest"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b/meta-python/recipes-devtools/python/python3-inotify_git.bb
index e8d88250a3..df8f8a65c7 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
@@ -12,7 +12,6 @@ SRC_URI = " \
 
 SRCREV = "9be6a51d1660991562eefaaddefa757ca0e0e00f"
 
-
 inherit setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
index 99f583e717..04b069885b 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/explodinglabs/jsonrpcclient.git;branch=main;protocol
 
 inherit python_setuptools_build_meta
 
-
 RDEPENDS:${PN} += "\
     python3-json \
     python3-math \
diff --git a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
index ce965b3e43..7488a25d95 100644
--- a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
@@ -9,7 +9,6 @@ SRCREV ?= "3b180cb10eda683dda7913ecee2e6487288d292d"
 
 inherit setuptools3
 
-
 BBCLASSEXTEND = "native"
 
 RDEPENDS:${PN} = "python3-numpy \
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
index 4cdc773ba6..9838e4decf 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
@@ -17,7 +17,6 @@ SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
 
 SRCREV = "20d74dcd30f143abbd1aa94c76bafc5bd934d5bd"
 
-
 PACKAGES += "${PN}-examples"
 FILES:${PN}-examples = "/usr/share/kivy-examples"
 
diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
index 26da91b16b..9e103fea08 100644
--- a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6855782848d572347212f667a2d637"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git;branch=main"
 SRCREV = "59ecd1ba018141a02ffe59c16a9346991dfd0d48"
 
-
 inherit setuptools3
 
 RDEPENDS:${PN} += "python3-six"
diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
index b801c5d731..35e61f4732 100644
--- a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
@@ -8,5 +8,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 SRCREV = "80681f6604e136e513550342f977edb98f5fc5ad"
 SRC_URI = "git://github.com/atdt/monotonic.git;branch=master;protocol=https"
 
-
 inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
index b9b7a74e6e..b1be599bd2 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
@@ -60,7 +60,6 @@ RDEPENDS:${PN}-ptest += " \
 
 CVE_PRODUCT = "pillow"
 
-
 RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb b/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
index 53996cc231..813b336235 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
@@ -8,7 +8,6 @@ SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
 PV .= "+git"
 SRCREV = "e7780f743b03c5e6ecc651fdeb209fa94e0e0250"
 
-
 inherit python_setuptools_build_meta ptest-python-pytest
 
 PYPI_PACKAGE = "pyais"
diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
index cb9b61bd66..daf9152577 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
@@ -10,7 +10,6 @@ DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygob
 SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=master"
 SRCREV = "8c69016b38d0e4caaf4c986938ea3410fb7351b6"
 
-
 # Same restriction as gtk+
 inherit features_check setuptools3
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
index 7d71767297..f5c0ccfd09 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
@@ -12,7 +12,6 @@ SRC_URI = "\
     git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
 "
 
-
 inherit cmake python_setuptools_build_meta
 
 EXTRA_OECMAKE = "-DPYBIND11_TEST=OFF -DPYBIND11_USE_CROSSCOMPILING=ON"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
index 47c077853a..3bd7059ed2 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
@@ -15,7 +15,6 @@ SRCREV = "bce81efdeac1cbefd0196b478a32aa2586bd595a"
 PV .= "+git"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=main"
 
-
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 RECIPE_NO_UPDATE_REASON = "Must be updated in sync with python3-pydantic-core."
diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 5a1934383e..9c56a04fcc 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -14,7 +14,6 @@ SRC_URI = " \
 
 inherit ptest setuptools3
 
-
 RDEPENDS:${PN} = "python3-pygobject \
                   python3-io \
                   python3-logging"
diff --git a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
index 58f571be3f..903c03f730 100644
--- a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
@@ -10,7 +10,6 @@ inherit python_setuptools_build_meta
 SRC_URI = "git:///github.com/russhousley/pyhsslms.git;branch=master;protocol=https"
 SRCREV = "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
 
-
 RDEPENDS:${PN} += " \
     python3-core \
     python3-crypt \
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
index 04761471d3..7afcb50bd0 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
@@ -12,7 +12,6 @@ SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.3.x;protocol
 
 inherit python_setuptools_build_meta ptest
 
-
 RDEPENDS:${PN} += "\
     python3-astroid \
     python3-difflib \
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
index e05b63587f..a2c48e6a61 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
@@ -20,7 +20,6 @@ SRCREV = "57db64c9f65ced05c71b8d786c1cedfaa2991597"
 
 SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libsystemd-0.5.0/"
 
-
 inherit python_setuptools3_rust cargo-update-recipe-crates
 
 # crossbeam-* -> std::sync::atomic AtomicI64, AtomicU64
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
index 41ebe44dbd..63bbeecf16 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
@@ -9,7 +9,6 @@ SRC_URI = " \
             git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
           "
 
-
 inherit python_setuptools_build_meta ptest-python-pytest
 
 do_compile:prepend() {
diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb b/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
index 2fb0bff29f..32d8fe0551 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
@@ -24,7 +24,6 @@ ALTERNATIVE_LINK_NAME[pyrsa-sign] = "${bindir}/pyrsa-sign"
 ALTERNATIVE_LINK_NAME[pyrsa-verify] = "${bindir}/pyrsa-verify"
 ALTERNATIVE_PRIORITY = "30"
 
-
 RDEPENDS:${PN} += "\
     python3-compression \
     python3-crypt \
diff --git a/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
index dba3bcace7..48b9eeaf54 100644
--- a/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
@@ -7,5 +7,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/python/python-schedutils/python-schedutils.git;branch=main"
 SRCREV = "46469f425f9844f355f6496785ee1ce993b58747"
 
-
 inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 3abea5f5f2..0e923bc35c 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/systemd/python-systemd"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
 
-
 PYPI_PACKAGE = "systemd-python"
 SRC_URI:append:libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
 SRC_URI[sha256sum] = "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a"
diff --git a/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
index ea364ae8f6..811113402c 100644
--- a/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
@@ -8,7 +8,6 @@ PYPI_SRC_URI = "git://github.com/hukkin/tomli-w.git;protocol=https;branch=master
 
 inherit pypi python_flit_core ptest-python-pytest
 
-
 RDEPENDS:${PN}-ptest += " \
         python3-tomli \
 "
diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
index 09732fc865..9c6c598182 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
@@ -11,7 +11,6 @@ SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch
 
 SRCREV = "0c5fb74bcecc0e5c80625c38130fe948c2a3656e"
 
-
 inherit setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
index 3a187f9386..c0bee7c9ce 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
@@ -12,7 +12,6 @@ SRCREV = "bcc1f26b2fe8fc962f5033c3a3a773425500789a"
 SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=master \
 "
 
-
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
 	python3-misc \
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index 4707e31854..12ba2c82f3 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=00ea1e843a43c20d9b63a8112239b0d1"
 
 SRC_URI[sha256sum] = "f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef274d0c88"
 
-
 SRC_URI = "git://github.com/python-excel/xlrd.git;branch=master;protocol=https \
 "
 SRCREV = "b8d573e11ec149da695d695c81a156232b89a949"
 
-
 inherit ptest-python-pytest setuptools3
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
index af231ca908..1ae5b292a0 100644
--- a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
+++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e664eb75e2791c2e505e6e1c274e6d4f"
 SRCREV = "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
 SRC_URI = "git://github.com/NordicSemiconductor/piccata.git;protocol=https;branch=master"
 
-
 inherit setuptools3
 
 RDEPENDS:${PN} += "python3-core python3-datetime python3-io python3-logging python3-math"
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
index 79bee63d08..1346c55371 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https"
 SRCREV = "7cec4bd48af4c8f7beb1a74bac751c3d520dedf1"
 
-
 inherit features_check setuptools3
 REQUIRED_DISTRO_FEATURES = "x11 systemd gobject-introspection-data"
 
diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index 4ffe68aab6..73df5691b2 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -12,7 +12,6 @@ SRCREV = "69090778bccc5ed124342ba288597fbb2bfa9f39"
 SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https \
            file://0001-setup.py-Do-not-poke-at-git-describe-to-find-version.patch"
 
-
 RDEPENDS:${PN} = "python3-json"
 
 inherit setuptools3
diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
index 80f9881b58..81775d693f 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit setuptools3_legacy
 
-
 SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master"
 
 SRCREV = "f0fcc3ce1943dce9cf958f4a2f7398daff619c9f"
diff --git a/meta-python/recipes-extended/tuna/tuna_0.19.bb b/meta-python/recipes-extended/tuna/tuna_0.19.bb
index 643e3a09ff..66810493a1 100644
--- a/meta-python/recipes-extended/tuna/tuna_0.19.bb
+++ b/meta-python/recipes-extended/tuna/tuna_0.19.bb
@@ -7,7 +7,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main"
 
 SRCREV = "b972b8ce386c29bcbcd45029a617db3db9e5b6ca"
 
-
 RDEPENDS:${PN} += " \
     python3-io \
     python3-linux-procfs \
diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
index f0653006a3..1601dd891a 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
@@ -16,7 +16,6 @@ SRCREV = "3c7e281d97fd3e70b25f7ff4a001eabd56e375d7"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-
 do_install() {
     install -d ${D}${localstatedir}/www/openapi/static
     cp -r ${S}/dist/* ${D}${localstatedir}/www/openapi/static
diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index b93fa2d186..d44a741fa4 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -17,7 +17,6 @@ SRCREV = "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
 
 PV = "0.1.2+git"
 
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 EXTRA_OECONF = "APACHECTL=${STAGING_DIR_TARGET}${sbindir}/apachectl"
diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
index aca6d598f8..0b9247c82a 100644
--- a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
@@ -8,7 +8,6 @@ DEPENDS = "apache2 avahi"
 SRC_URI = "git://git.0pointer.net/mod_dnssd.git;protocol=https;branch=master"
 SRCREV = "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
 
-
 EXTRA_OECONF = "--disable-lynx"
 
 inherit autotools pkgconfig
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 9ff1772531..c6a0e855e9 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -16,7 +16,6 @@ SRC_URI = "git://github.com/blueness/${BPN};branch=master;protocol=https \
 UPSTREAM_CHECK_URI = "https://github.com/blueness/sthttpd/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
 
-
 inherit autotools update-rc.d systemd update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
index 03425c53c9..e77ed60d7a 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
@@ -9,7 +9,6 @@ PV = "2.4.2"
 SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master \
           "
 
-
 inherit autotools
 
 PARALLEL_MAKE = ""
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
index 61a94f7bf4..b344802b38 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
@@ -10,7 +10,6 @@ DEPENDS = "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
 SRC_URI = "git://github.com/ib/xarchiver.git;branch=master;protocol=https"
 SRCREV = "55f923ebc623bcc8f53368543847350a23688189"
 
-
 inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
index 308da40c34..63c7301413 100644
--- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=htt
 "
 SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
 
-
 inherit gettext meson features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "systemd x11"
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
index 59de3b3a08..9fabd38ef9 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
@@ -22,7 +22,6 @@ SRC_URI = "git://gitlab.com/tagoh/imsettings.git;protocol=https;branch=main \
           "
 SRCREV = "27d84c88831ef76397a15891ba0738ce9a83902a"
 
-
 do_configure:prepend() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
 }
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
index b2dd9dfa79..abb70381b0 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.1.bb
@@ -24,7 +24,6 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[gladeui2] = "--enable-gladeui2,--disable-gladeui2,glade"
 PACKAGECONFIG[x11] = "--enable-startup-notification,--disable-startup-notification,libepoxy libice libsm startup-notification"
 
-
 PACKAGES += "${PN}-glade"
 FILES:${PN}-glade = " \
     ${libdir}/glade \
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 500719a8f6..d0e731b374 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -1,7 +1,6 @@
 SUMMARY = "All packages for full XFCE installation"
 SECTION = "x11/wm"
 
-
 inherit packagegroup features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.43.0


