Return-Path: <f_l_k@t-online.de>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6DFC7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:04:35 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.2451.1750431864611754779
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id 2D682B69
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 17:04:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.230.207]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uSalL-4bJLA90; Fri, 20 Jun 2025 14:22:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][PATCH] meta-openembedded: fix after S rework
Date: Fri, 20 Jun 2025 14:22:22 +0200
Message-ID: <20250620122222.1776639-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1750422151-CF7FC4D8-79139BC8/0/0 CLEAN NORMAL
X-TOI-MSGID: fdbeebb6-4881-4be3-900c-92e50dd16cbf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 15:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117972

In current oe-core master-next branch S is set to be in UNPACKDIR in
bitbake.conf. This leads to a number of changes in meta-openembedded

I used a quick and dirty script that handles the issues I
found so far. The result doesn't look that bad and at least this
fix was enough to make my image buildable again.

This patch was created with:

LAYER=3D$1
[ -z $LAYER ] && echo "Layer is needed as an argument" && exit 1
! [ -d $(basename $LAYER) ] && echo "$(basename $LAYER) not found in curr=
ent directory" && exit 1

for file in $(grep -r "S =3D \"\${WORKDIR}/git\"" $LAYER | cut -d : -f 1)=
; do
	sed -i -e '/S =3D \"\${WORKDIR}\/git"/d' $file
	sed -i "s|S =3D \"\${WORKDIR}\/git\/|S =3D \"\${UNPACKDIR}\/\${BP}\/|" $=
file
done

for file in $(grep -r "S =3D \"\${UNPACKDIR}/git\"" $LAYER | cut -d : -f =
1); do
        sed -i -e '/S =3D \"\${UNPACKDIR}\/git"/d' $file
done

for file in $(grep -r "S =3D \"\${WORKDIR}" $LAYER | cut -d : -f 1); do
	sed -i "s|S =3D \"\${WORKDIR}|S =3D \"\${UNPACKDIR}|" $file
done

for file in $(grep -r "S =3D \"\${UNPACKDIR}/sources\"" $LAYER | cut -d :=
 -f 1); do
	sed -i "s|S =3D \"\${UNPACKDIR}/sources|S =3D \"\${UNPACKDIR}/\${BP}|" $=
file
        sed -i -e '/UNPACKDIR =3D \"\${S}\"/d' $file
done

exit 0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb        | 2 +-
 .../recipes-filesystems/logfsprogs/logfsprogs_git.bb         | 1 -
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb         | 2 +-
 meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb      | 1 -
 .../recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb   | 1 -
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb             | 1 -
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb       | 1 -
 .../recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb     | 1 -
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb           | 1 -
 meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb        | 1 -
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb    | 1 -
 meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb        | 1 -
 .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb   | 1 -
 meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb      | 1 -
 .../recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb            | 1 -
 meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb        | 1 -
 meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb  | 1 -
 .../recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb      | 1 -
 .../recipes-utils/ufs-utils/ufs-utils_6.14.11.bb             | 1 -
 .../recipes-utils/xfstests/xfstests_2025.04.27.bb            | 1 -
 meta-gnome/classes/clutter.bbclass                           | 2 +-
 meta-gnome/recipes-connectivity/geary/geary_46.0.bb          | 1 -
 .../recipes-extended/polkit-gnome/polkit-gnome_0.105.bb      | 1 -
 meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb                   | 1 -
 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb            | 1 -
 meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb   | 1 -
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb        | 1 -
 meta-gnome/recipes-gnome/evince/evince_48.0.bb               | 4 ++--
 .../recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb | 3 +--
 meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb        | 1 -
 .../recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb    | 1 -
 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb             | 2 +-
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb | 2 +-
 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb     | 1 -
 meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb       | 2 +-
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb    | 1 -
 .../recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb  | 1 -
 .../gtksourceview/gtksourceview-classic-light_1.0.bb         | 3 +--
 .../recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb    | 2 +-
 .../recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb      | 2 +-
 .../recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb     | 2 +-
 .../recipes-gnome/libchamplain/libchamplain_0.12.21.bb       | 1 -
 meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb   | 2 +-
 meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb                  | 1 -
 meta-gnome/recipes-support/ibus/ibus.inc                     | 1 -
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb        | 1 -
 meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb        | 1 -
 .../webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb           | 1 -
 .../xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb      | 1 -
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb    | 3 +--
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb        | 1 -
 .../recipes-core/initrdscripts/initramfs-debug_1.0.bb        | 3 +--
 meta-initramfs/recipes-devtools/dracut/dracut_106.bb         | 1 -
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb         | 1 -
 meta-initramfs/recipes-devtools/klibc/klibc.inc              | 2 +-
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb | 1 -
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 1 -
 .../recipes-connectivity/libupnp/libupnp_1.14.18.bb          | 1 -
 meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb              | 1 -
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb       | 1 -
 meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb         | 1 -
 meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb | 1 -
 .../recipes-multimedia/alsa-equal/alsa-equal_0.6.bb          | 2 +-
 meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb         | 1 -
 .../recipes-multimedia/bluealsa/bluealsa_4.3.0.bb            | 1 -
 .../recipes-multimedia/cdparanoia/cdparanoia_10.2.bb         | 2 +-
 meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb      | 1 -
 meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb       | 1 -
 .../recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb | 1 -
 .../recipes-multimedia/dleyna/dleyna-core_0.6.0.bb           | 1 -
 .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb       | 1 -
 .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb         | 1 -
 .../recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb   | 2 +-
 meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb  | 1 -
 meta-multimedia/recipes-multimedia/flite/flite_2.2.bb        | 1 -
 .../recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb        | 1 -
 meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb  | 1 -
 .../recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb      | 1 -
 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb | 1 -
 meta-multimedia/recipes-multimedia/juce/projucer.inc         | 1 -
 meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb  | 1 -
 meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb  | 1 -
 .../recipes-multimedia/libcamera/libcamera_0.4.0.bb          | 1 -
 .../recipes-multimedia/libde265/libde265_1.0.15.bb           | 1 -
 .../recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb          | 1 -
 meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb | 1 -
 meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb    | 1 -
 .../recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb       | 2 +-
 .../recipes-multimedia/libsquish/libsquish_git.bb            | 1 -
 meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb    | 1 -
 meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb    | 1 -
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc     | 1 -
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb     | 1 -
 .../recipes-multimedia/musicpd/libmpdclient_2.22.bb          | 1 -
 meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb       | 1 -
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb     | 1 -
 meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb     | 1 -
 meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb | 1 -
 .../nv-codec-headers/nv-codec-headers_12.1.14.0.bb           | 1 -
 .../recipes-multimedia/openal/openal-soft_1.24.3.bb          | 1 -
 .../recipes-multimedia/openh264/openh264_2.6.0.bb            | 1 -
 .../recipes-multimedia/opus-tools/opus-tools_0.2.bb          | 2 +-
 .../pipewire/pipewire-media-session_0.4.2.bb                 | 1 -
 .../recipes-multimedia/pipewire/pipewire_1.4.5.bb            | 1 -
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb  | 1 -
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb  | 3 +--
 .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb   | 3 +--
 .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb   | 3 +--
 .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb  | 3 +--
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb         | 1 -
 meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb    | 1 -
 .../recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb            | 1 -
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 1 -
 .../webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb | 2 +-
 .../webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb | 2 +-
 .../recipes-multimedia/wireplumber/wireplumber_0.5.10.bb     | 1 -
 meta-multimedia/recipes-multimedia/x265/x265_4.1.bb          | 2 +-
 meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb | 1 -
 .../recipes-support/gst-instruments/gst-instruments_git.bb   | 1 -
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb     | 2 +-
 meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb     | 1 -
 meta-multimedia/recipes-support/srt/srt_1.4.4.bb             | 1 -
 .../xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb   | 1 -
 .../system-config-printer/system-config-printer_1.5.18.bb    | 1 -
 meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb    | 1 -
 meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb  | 1 -
 .../recipes-connectivity/blueman/blueman_2.4.4.bb            | 1 -
 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb    | 1 -
 .../recipes-connectivity/bluez-tools/bluez-tools_git.bb      | 1 -
 .../recipes-connectivity/cannelloni/cannelloni_1.1.0.bb      | 1 -
 .../recipes-connectivity/civetweb/civetweb_1.16.bb           | 1 -
 meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb    | 1 -
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb          | 2 +-
 meta-networking/recipes-connectivity/dibbler/dibbler_git.bb  | 1 -
 .../recipes-connectivity/freeradius/freeradius_3.2.7.bb      | 1 -
 .../recipes-connectivity/libdnet/libdnet_1.18.0.bb           | 1 -
 .../recipes-connectivity/libiec61850/libiec61850_1.5.3.bb    | 1 -
 .../recipes-connectivity/mbedtls/mbedtls_2.28.10.bb          | 1 -
 .../recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb          | 1 -
 .../recipes-connectivity/nanomsg/nanomsg_1.2.1.bb            | 1 -
 meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb    | 1 -
 meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb    | 1 -
 .../networkmanager/networkmanager-fortisslvpn_1.4.0.bb       | 2 +-
 .../networkmanager/networkmanager-openconnect_1.2.8.bb       | 2 +-
 .../networkmanager/networkmanager-openvpn_1.12.0.bb          | 2 +-
 .../networkmanager/networkmanager_1.52.0.bb                  | 1 -
 .../recipes-connectivity/openconnect/openconnect_9.12.bb     | 1 -
 .../recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb | 1 -
 .../recipes-connectivity/openthread/ot-br-posix_git.bb       | 1 -
 .../recipes-connectivity/openthread/ot-daemon_git.bb         | 1 -
 .../recipes-connectivity/openthread/wpantund_git.bb          | 1 -
 meta-networking/recipes-connectivity/relayd/relayd_git.bb    | 1 -
 .../recipes-connectivity/restinio/restinio_0.6.13.bb         | 2 +-
 meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb | 1 -
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb        | 2 +-
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb      | 1 -
 .../recipes-connectivity/wolfssl/wolfssl_5.8.0.bb            | 1 -
 meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb         | 1 -
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb    | 1 -
 .../networkd-dispatcher/networkd-dispatcher_2.2.4.bb         | 1 -
 meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb    | 2 +-
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb     | 1 -
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb           | 2 +-
 meta-networking/recipes-daemons/vblade/vblade_25.bb          | 1 -
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb    | 1 -
 .../recipes-devtools/python/python3-scapy_2.6.0.bb           | 1 -
 meta-networking/recipes-extended/dlm/dlm_4.2.0.bb            | 2 +-
 meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb | 1 -
 meta-networking/recipes-extended/tgt/tgt_1.0.90.bb           | 1 -
 .../arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb   | 1 -
 .../recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb   | 2 +-
 .../libnetfilter/libnetfilter-conntrack_1.1.0.bb             | 2 +-
 .../libnetfilter/libnetfilter-cthelper_1.0.1.bb              | 2 +-
 .../libnetfilter/libnetfilter-cttimeout_1.0.1.bb             | 2 +-
 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb    | 1 -
 .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb  | 1 -
 meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb    | 1 -
 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb        | 1 -
 meta-networking/recipes-irc/znc/znc_1.8.2.bb                 | 1 -
 meta-networking/recipes-kernel/wireguard/wireguard.inc       | 2 +-
 meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb    | 1 -
 .../recipes-protocols/freediameter/freediameter_1.5.0.bb     | 1 -
 meta-networking/recipes-protocols/frr/frr_10.3.bb            | 1 -
 meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb   | 1 -
 meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb  | 1 -
 meta-networking/recipes-protocols/openflow/openflow_git.bb   | 1 -
 meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb | 1 -
 .../recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb        | 2 +-
 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb  | 2 +-
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb     | 1 -
 meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb   | 1 -
 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb    | 1 -
 meta-networking/recipes-support/arptables/arptables_git.bb   | 1 -
 meta-networking/recipes-support/bmon/bmon_4.0.bb             | 1 -
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb       | 1 -
 meta-networking/recipes-support/celt051/celt051_git.bb       | 1 -
 meta-networking/recipes-support/cifs/cifs-utils_7.0.bb       | 1 -
 meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb       | 1 -
 meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb    | 1 -
 meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb | 1 -
 meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb | 1 -
 meta-networking/recipes-support/fping/fping_5.3.bb           | 2 +-
 meta-networking/recipes-support/geoip/geoip-perl_1.51.bb     | 1 -
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb        | 1 -
 .../recipes-support/http-parser/http-parser_2.9.4.bb         | 1 -
 meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb  | 1 -
 meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb       | 1 -
 meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb      | 1 -
 meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb   | 1 -
 meta-networking/recipes-support/libldb/libldb_2.8.1.bb       | 2 +-
 meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb | 2 +-
 meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb      | 2 +-
 .../recipes-support/libtevent/libtevent_0.16.2.bb            | 2 +-
 .../recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb      | 1 -
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb         | 1 -
 meta-networking/recipes-support/mctp/mctp_2.1.bb             | 1 -
 .../recipes-support/mdio-tools/mdio-netlink_1.3.1.bb         | 1 -
 .../recipes-support/mdio-tools/mdio-tools_1.3.1.bb           | 1 -
 meta-networking/recipes-support/mtr/mtr_0.95.bb              | 1 -
 meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb     | 1 -
 meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb     | 1 -
 meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb       | 1 -
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb         | 1 -
 meta-networking/recipes-support/netperf/netperf_git.bb       | 1 -
 .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb         | 1 -
 meta-networking/recipes-support/nis/yp-tools_4.2.3.bb        | 1 -
 meta-networking/recipes-support/ntimed/ntimed_git.bb         | 1 -
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb           | 1 -
 meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb       | 1 -
 meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb       | 3 +--
 meta-networking/recipes-support/open-isns/open-isns_0.102.bb | 1 -
 .../recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb    | 2 +-
 meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb  | 2 +-
 meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb     | 2 +-
 meta-networking/recipes-support/phytool/phytool.bb           | 1 -
 meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb  | 1 -
 meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb   | 1 -
 meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb       | 1 -
 meta-networking/recipes-support/spice/libcacard_2.8.1.bb     | 1 -
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb      | 1 -
 .../recipes-support/spice/spice-guest-vdagent_0.22.1.bb      | 1 -
 .../recipes-support/spice/spice-protocol_0.14.4.bb           | 1 -
 meta-networking/recipes-support/spice/spice_git.bb           | 1 -
 meta-networking/recipes-support/spice/usbredir_0.14.0.bb     | 1 -
 meta-networking/recipes-support/unbound/unbound_1.22.0.bb    | 1 -
 meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb     | 1 -
 .../recipes-support/wpan-tools/wpan-tools_0.10.bb            | 1 -
 meta-oe/classes/fitimage.bbclass                             | 3 +--
 .../recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb          | 1 -
 .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb | 1 -
 .../meta-python/recipes-bsp/rwmem/rwmem_1.2.bb               | 1 -
 .../recipes-connectivity/netplan/netplan_1.1.2.bb            | 1 -
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb           | 1 -
 .../meta-python/recipes-devtools/nanopb/nanopb.inc           | 1 -
 .../meta-python/recipes-extended/lcdproc/lcdproc_git.bb      | 1 -
 .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb        | 1 -
 .../meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb     | 1 -
 .../meta-python/recipes-support/smem/smem_1.5.bb             | 2 +-
 .../multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb | 1 -
 .../perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb  | 1 -
 .../android-tools/android-tools-conf-configfs_1.0.bb         | 3 +--
 .../recipes-devtool/android-tools/android-tools-conf_1.0.bb  | 3 +--
 .../android-tools/android-tools_29.0.6.r14.bb                | 1 -
 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb         | 1 -
 meta-oe/recipes-benchmark/fio/fio_3.39.bb                    | 1 -
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb             | 1 -
 meta-oe/recipes-benchmark/iozone3/iozone3_507.bb             | 2 +-
 meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb             | 2 +-
 meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb              | 1 -
 meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb       | 1 -
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb  | 1 -
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb             | 3 +--
 meta-oe/recipes-benchmark/mbw/mbw_2.0.bb                     | 1 -
 .../phoronix-test-suite/phoronix-test-suite_10.8.4.bb        | 2 +-
 meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb              | 1 -
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb             | 1 -
 .../recipes-benchmark/stressapptest/stressapptest_1.0.11.bb  | 1 -
 meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb        | 1 -
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb   | 1 -
 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb         | 3 +--
 meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb                       | 1 -
 meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb               | 1 -
 meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb         | 1 -
 .../recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb | 1 -
 meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb             | 1 -
 meta-oe/recipes-bsp/firmwared/firmwared_git.bb               | 1 -
 meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb               | 2 +-
 meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb                   | 1 -
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb                     | 1 -
 meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb                    | 1 -
 meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb       | 3 +--
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb            | 1 -
 meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb                    | 2 +-
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb                | 1 -
 meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb             | 3 +--
 meta-oe/recipes-connectivity/ace/ace_8.0.2.bb                | 2 +-
 meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb   | 1 -
 meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb    | 2 +-
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb          | 1 -
 meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb          | 1 -
 meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb             | 2 +-
 .../libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb     | 1 -
 .../libimobiledevice/libimobiledevice_git.bb                 | 1 -
 .../recipes-connectivity/libirecovery/libirecovery_1.2.1.bb  | 1 -
 meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb       | 1 -
 meta-oe/recipes-connectivity/libndp/libndp_1.9.bb            | 1 -
 meta-oe/recipes-connectivity/libnet/libnet_1.3.bb            | 1 -
 meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb          | 1 -
 meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb         | 1 -
 .../recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb    | 1 -
 .../libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb      | 1 -
 meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb | 1 -
 .../libwebsockets/libwebsockets_4.3.5.bb                     | 1 -
 .../recipes-connectivity/modemmanager/modemmanager_1.22.0.bb | 1 -
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb          | 2 +-
 meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb       | 2 +-
 .../recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb   | 1 -
 .../paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb                     | 1 -
 .../recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb  | 1 -
 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb | 1 -
 meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb     | 1 -
 meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb   | 2 +-
 .../recipes-connectivity/transmission/transmission_4.0.6.bb  | 1 -
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb          | 1 -
 .../wifi-test-suite/wifi-test-suite_10.10.1.bb               | 1 -
 meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb         | 1 -
 meta-oe/recipes-core/basu/basu_0.2.1.bb                      | 1 -
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb              | 1 -
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb           | 1 -
 meta-oe/recipes-core/emlog/emlog.inc                         | 1 -
 meta-oe/recipes-core/glfw/glfw_3.3.8.bb                      | 1 -
 meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb          | 1 -
 meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb          | 2 +-
 meta-oe/recipes-core/libnfc/libnfc_git.bb                    | 1 -
 meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb   | 2 +-
 meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb      | 2 +-
 meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb            | 2 +-
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb                    | 1 -
 meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb          | 1 -
 meta-oe/recipes-core/minizip/minizip_1.3.1.bb                | 2 +-
 meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb        | 1 -
 meta-oe/recipes-core/ndctl/ndctl_v79.bb                      | 1 -
 meta-oe/recipes-core/opencl/clpeak_1.1.4.bb                  | 1 -
 meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                 | 1 -
 meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb       | 1 -
 meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb         | 1 -
 meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb     | 1 -
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb  | 1 -
 meta-oe/recipes-core/pim435/pim435_git.bb                    | 1 -
 meta-oe/recipes-core/safec/safec_3.7.1.bb                    | 1 -
 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb | 1 -
 meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb      | 2 +-
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb            | 1 -
 meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb  | 1 -
 meta-oe/recipes-core/usleep/usleep_1.2.bb                    | 3 +--
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb  | 1 -
 meta-oe/recipes-crypto/botan/botan_3.7.1.bb                  | 2 +-
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb  | 1 -
 meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb            | 1 -
 meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb     | 1 -
 meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb        | 2 +-
 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb | 1 -
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb              | 1 -
 meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb                  | 1 -
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb                      | 2 +-
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb                | 1 -
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb | 1 -
 meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb        | 1 -
 .../android-tools/android-tools-conf-configfs_1.0.bb         | 3 +--
 .../recipes-devtools/android-tools/android-tools-conf_1.0.bb | 3 +--
 .../android-tools/android-tools_5.1.1.r37.bb                 | 1 -
 meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb           | 1 -
 meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb     | 1 -
 meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb        | 2 +-
 meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb         | 1 -
 meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb               | 1 -
 .../recipes-devtools/concurrencykit/concurrencykit_git.bb    | 1 -
 meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb      | 1 -
 meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb              | 1 -
 meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb       | 1 -
 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb  | 2 +-
 .../recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb    | 1 -
 meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb           | 1 -
 .../editorconfig/editorconfig-core-c_0.12.9.bb               | 1 -
 meta-oe/recipes-devtools/exprtk/exprtk_git.bb                | 1 -
 meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb    | 1 -
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb          | 1 -
 meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb  | 2 +-
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb                | 1 -
 meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb                 | 1 -
 meta-oe/recipes-devtools/guider/guider_3.9.9.bb              | 1 -
 meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb        | 1 -
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb          | 1 -
 .../json-schema-validator/json-schema-validator_2.2.0.bb     | 1 -
 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb     | 2 +-
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb            | 1 -
 meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb            | 1 -
 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb            | 1 -
 .../kconfig-frontends/kconfig-frontends_4.11.0.1.bb          | 1 -
 meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb             | 1 -
 meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb               | 1 -
 meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb      | 1 -
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb        | 1 -
 meta-oe/recipes-devtools/libubox/libubox_git.bb              | 1 -
 meta-oe/recipes-devtools/lshw/lshw_02.20.bb                  | 1 -
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb                | 1 -
 meta-oe/recipes-devtools/luajit/luajit_git.bb                | 1 -
 meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb         | 1 -
 meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb          | 1 -
 meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb              | 1 -
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb              | 2 +-
 meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb        | 2 +-
 .../recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb    | 1 -
 meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb          | 1 -
 meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb        | 2 +-
 meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb          | 2 +-
 meta-oe/recipes-devtools/musl/musl-nscd_git.bb               | 1 -
 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb  | 1 -
 .../recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb   | 1 -
 .../recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb  | 3 +--
 meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb            | 2 +-
 meta-oe/recipes-devtools/openocd/openocd_git.bb              | 1 -
 meta-oe/recipes-devtools/pahole/pahole_1.29.bb               | 1 -
 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb                | 1 -
 meta-oe/recipes-devtools/perfetto/perfetto.inc               | 1 -
 meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb            | 2 +-
 meta-oe/recipes-devtools/perl/exiftool_12.89.bb              | 1 -
 meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb          | 1 -
 meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb | 2 +-
 meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb           | 2 +-
 meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb   | 2 +-
 meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb         | 2 +-
 meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb        | 1 -
 meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb     | 2 +-
 meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb         | 2 +-
 meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb    | 2 +-
 meta-oe/recipes-devtools/php/php_8.4.6.bb                    | 2 +-
 meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb         | 1 -
 meta-oe/recipes-devtools/ply/ply_git.bb                      | 1 -
 meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb          | 1 -
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb        | 1 -
 meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb         | 1 -
 meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb         | 1 -
 .../recipes-devtools/python/python3-distutils-extra_2.39.bb  | 2 +-
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb          | 1 -
 meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb    | 1 -
 meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb           | 1 -
 meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb        | 1 -
 meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb        | 1 -
 .../squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb             | 1 -
 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb              | 1 -
 meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb   | 1 -
 .../recipes-devtools/systemd/nativesdk-systemd-systemctl.bb  | 3 +--
 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb                | 1 -
 meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb                 | 2 +-
 meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb                   | 2 +-
 meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb    | 1 -
 meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb             | 1 -
 .../unattended-upgrades/unattended-upgrades_2.9.1.bb         | 1 -
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb            | 2 +-
 meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb          | 1 -
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb         | 2 +-
 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb                 | 1 -
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                  | 1 -
 meta-oe/recipes-devtools/yasm/yasm_git.bb                    | 1 -
 meta-oe/recipes-extended/7zip/7zip_24.09.bb                  | 1 -
 meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb                 | 1 -
 meta-oe/recipes-extended/beep/beep_1.4.12.bb                 | 1 -
 meta-oe/recipes-extended/bitwise/bitwise_0.50.bb             | 2 +-
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb        | 1 -
 meta-oe/recipes-extended/brotli/brotli_1.1.0.bb              | 1 -
 meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb   | 1 -
 meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb              | 1 -
 .../recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb    | 1 -
 meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb       | 2 +-
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb    | 1 -
 meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb        | 1 -
 meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb        | 1 -
 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb       | 1 -
 meta-oe/recipes-extended/figlet/figlet_git.bb                | 1 -
 meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb  | 1 -
 meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb           | 1 -
 meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb        | 1 -
 meta-oe/recipes-extended/haveged/haveged_1.9.19.bb           | 1 -
 meta-oe/recipes-extended/hexedit/hexedit_1.6.bb              | 1 -
 meta-oe/recipes-extended/highway/highway_1.2.0.bb            | 1 -
 meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb            | 1 -
 .../inputattach-config/inputattach-config.bb                 | 3 +--
 meta-oe/recipes-extended/iotop/iotop_1.30.bb                 | 1 -
 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb        | 1 -
 meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb      | 1 -
 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb    | 1 -
 meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb    | 1 -
 meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb    | 1 -
 meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb           | 1 -
 meta-oe/recipes-extended/libcec/libcec_7.0.0.bb              | 1 -
 meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb       | 1 -
 .../recipes-extended/libdivecomputer/libdivecomputer_git.bb  | 1 -
 meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb  | 1 -
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb    | 1 -
 .../recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb    | 1 -
 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb  | 1 -
 meta-oe/recipes-extended/libleak/libleak_0.3.6.bb            | 1 -
 .../recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb  | 1 -
 meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb     | 2 +-
 meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb      | 1 -
 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb       | 1 -
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb  | 1 -
 meta-oe/recipes-extended/libreport/libreport_2.17.15.bb      | 1 -
 meta-oe/recipes-extended/libuio/libuio_0.2.1.bb              | 1 -
 meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb             | 1 -
 meta-oe/recipes-extended/libyang/libyang_3.12.2.bb           | 1 -
 meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb  | 2 +-
 meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb      | 1 -
 meta-oe/recipes-extended/md5deep/md5deep_git.bb              | 1 -
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb     | 1 -
 meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb          | 2 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb                    | 1 -
 meta-oe/recipes-extended/nana/nana_git.bb                    | 1 -
 meta-oe/recipes-extended/networking/mstpd_git.bb             | 1 -
 meta-oe/recipes-extended/newt/libnewt_0.52.25.bb             | 2 +-
 meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb        | 1 -
 meta-oe/recipes-extended/ostree/ostree_2024.10.bb            | 2 +-
 meta-oe/recipes-extended/p8platform/p8platform_git.bb        | 1 -
 meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb         | 1 -
 meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb      | 1 -
 meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb             | 1 -
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb    | 2 +-
 meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb                | 1 -
 meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb   | 2 +-
 meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb                  | 1 -
 meta-oe/recipes-extended/polkit/polkit_126.bb                | 1 -
 .../recipes-extended/properties-cpp/properties-cpp_git.bb    | 1 -
 meta-oe/recipes-extended/qad/qad_git.bb                      | 1 -
 meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb                | 1 -
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb             | 2 +-
 .../redis-plus-plus/redis-plus-plus_1.3.11.bb                | 1 -
 meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb            | 1 -
 meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb     | 1 -
 meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb           | 1 -
 meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb            | 1 -
 .../sblim-sfc-common/sblim-sfc-common_1.0.1.bb               | 2 +-
 meta-oe/recipes-extended/sedutil/sedutil_git.bb              | 1 -
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb             | 2 +-
 meta-oe/recipes-extended/snappy/snappy_1.1.10.bb             | 1 -
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb          | 1 -
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb      | 1 -
 meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb         | 1 -
 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb    | 1 -
 meta-oe/recipes-extended/socketcan/socketcand_git.bb         | 1 -
 meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb             | 1 -
 meta-oe/recipes-extended/tipcutils/tipcutils_git.bb          | 1 -
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb                | 1 -
 meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb    | 1 -
 .../recipes-extended/uml-utilities/uml-utilities_20040406.bb | 2 +-
 meta-oe/recipes-extended/upm/upm_git.bb                      | 1 -
 meta-oe/recipes-extended/valkey/valkey_8.1.1.bb              | 1 -
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb     | 2 +-
 meta-oe/recipes-extended/wipe/wipe_0.24.bb                   | 1 -
 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb             | 1 -
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb        | 1 -
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb                 | 1 -
 meta-oe/recipes-extended/zram/zram_0.2.bb                    | 3 +--
 meta-oe/recipes-extended/zsync/zsync-curl_git.bb             | 1 -
 meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb               | 2 +-
 meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb                     | 2 +-
 .../gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb         | 3 +--
 meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb          | 1 -
 meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb               | 1 -
 meta-oe/recipes-gnome/malcontent/malcontent.inc              | 1 -
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb                    | 1 -
 meta-oe/recipes-graphics/aml/aml_git.bb                      | 1 -
 meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb        | 2 +-
 meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb                  | 1 -
 meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb        | 1 -
 meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb | 2 +-
 meta-oe/recipes-graphics/directfb/directfb.inc               | 2 +-
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb      | 1 -
 meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb               | 1 -
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb                | 1 -
 meta-oe/recipes-graphics/fbida/fbida_git.bb                  | 1 -
 meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb     | 1 -
 meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb                  | 1 -
 meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb                  | 1 -
 meta-oe/recipes-graphics/glad/glad_2.0.8.bb                  | 1 -
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb                  | 1 -
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb             | 2 +-
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb          | 2 +-
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb                | 1 -
 meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb          | 1 -
 meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb      | 2 +-
 meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb          | 1 -
 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb         | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb       | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb       | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb          | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb         | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb       | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb       | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb         | 2 +-
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb             | 2 +-
 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb   | 2 +-
 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb      | 1 -
 meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb        | 2 +-
 meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb           | 2 +-
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb | 1 -
 meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb      | 2 +-
 meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb              | 2 +-
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb          | 1 -
 meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb                  | 1 -
 meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb            | 1 -
 meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb            | 1 -
 meta-oe/recipes-graphics/openbox/obconf_git.bb               | 1 -
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb          | 1 -
 .../panel-mipi-dbi/panel-mipi-dbi-native_git.bb              | 1 -
 meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb        | 2 +-
 .../parallel-deqp-runner/parallel-deqp-runner_git.bb         | 1 -
 meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb          | 1 -
 meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb         | 1 -
 meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb  | 1 -
 meta-oe/recipes-graphics/surf/surf_2.1.bb                    | 1 -
 meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb   | 1 -
 meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb        | 1 -
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb         | 1 -
 .../ttf-fonts/source-code-pro-fonts_2.030_1.050.bb           | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb   | 2 +-
 .../recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb  | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb        | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb          | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb       | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb        | 3 +--
 meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb   | 2 +-
 .../recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb   | 3 +--
 meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb      | 2 +-
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb           | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb   | 1 -
 .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb           | 3 +--
 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb       | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb          | 2 +-
 .../recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb    | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb       | 3 +--
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb  | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb    | 2 +-
 .../ttf-fonts/ttf-ubuntu-font-family_0.83.bb                 | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb  | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb  | 2 +-
 .../unclutter-xfixes/unclutter-xfixes_1.6.bb                 | 1 -
 meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb               | 1 -
 meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb              | 1 -
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc           | 1 -
 meta-oe/recipes-graphics/wayland/libei_1.4.1.bb              | 1 -
 meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb          | 1 -
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb             | 1 -
 .../recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb  | 1 -
 meta-oe/recipes-graphics/yad/yad_6.0.bb                      | 1 -
 meta-oe/recipes-graphics/ydotool/ydotool_git.bb              | 1 -
 meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb       | 1 -
 meta-oe/recipes-kernel/blktests/blktests.bb                  | 1 -
 .../broadcom-bt-firmware_12.0.1.1105_p3.bb                   | 1 -
 meta-oe/recipes-kernel/crash/crash.inc                       | 1 -
 meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb           | 1 -
 meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb           | 1 -
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb    | 5 ++---
 meta-oe/recipes-kernel/kpatch/kpatch.inc                     | 1 -
 meta-oe/recipes-kernel/kpatch/kpatch_git.bb                  | 1 -
 meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb        | 1 -
 meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb                | 2 +-
 meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb              | 2 +-
 meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb        | 1 -
 .../recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb    | 1 -
 meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb             | 1 -
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb          | 1 -
 meta-oe/recipes-kernel/turbostat/turbostat.bb                | 3 +--
 meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb            | 2 +-
 meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb             | 1 -
 meta-oe/recipes-multimedia/jack/a2jmidid_9.bb                | 1 -
 meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb      | 1 -
 meta-oe/recipes-multimedia/jack/jack_1.9.22.bb               | 1 -
 meta-oe/recipes-multimedia/libass/libass_0.17.4.bb           | 1 -
 meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb    | 2 +-
 meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb           | 1 -
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb          | 2 +-
 meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb          | 2 +-
 meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb    | 2 +-
 meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb            | 1 -
 meta-oe/recipes-multimedia/live555/live555_20210824.bb       | 2 +-
 meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb     | 1 -
 meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb             | 1 -
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb      | 1 -
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb             | 1 -
 meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb          | 1 -
 meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb             | 1 -
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb              | 2 +-
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb                | 2 +-
 meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb          | 1 -
 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb   | 1 -
 meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb                 | 1 -
 meta-oe/recipes-security/audit/audit_4.0.5.bb                | 1 -
 .../kernel-hardening-checker_0.6.10.bb                       | 1 -
 meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb          | 1 -
 .../spectre-meltdown-checker_0.46.bb                         | 1 -
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb  | 2 +-
 meta-oe/recipes-shells/mksh/mksh_59c.bb                      | 2 +-
 .../recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb | 1 -
 meta-oe/recipes-support/avro/avro-c++_1.11.3.bb              | 2 +-
 meta-oe/recipes-support/avro/avro-c_1.11.3.bb                | 2 +-
 meta-oe/recipes-support/bcu/bcu_1.1.115.bb                   | 1 -
 meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb                 | 1 -
 meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb     | 1 -
 meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb        | 1 -
 meta-oe/recipes-support/btop/btop_1.4.3.bb                   | 1 -
 meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb     | 1 -
 meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb   | 1 -
 meta-oe/recipes-support/cli11/cli11_2.3.2.bb                 | 1 -
 meta-oe/recipes-support/cmark/cmark_0.31.1.bb                | 1 -
 meta-oe/recipes-support/composefs/composefs_1.0.8.bb         | 1 -
 meta-oe/recipes-support/consolation/consolation_0.0.9.bb     | 1 -
 meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb         | 1 -
 meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb           | 1 -
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb             | 1 -
 meta-oe/recipes-support/crucible/crucible_2023.11.02.bb      | 1 -
 meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb  | 3 +--
 meta-oe/recipes-support/ctre/ctre_3.9.0.bb                   | 1 -
 meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb             | 1 -
 meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb                 | 1 -
 meta-oe/recipes-support/daemonize/daemonize_git.bb           | 1 -
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb      | 2 +-
 meta-oe/recipes-support/dc/double-conversion_3.3.1.bb        | 1 -
 meta-oe/recipes-support/devmem2/devmem2_2.0.bb               | 1 -
 meta-oe/recipes-support/dhex/dhex_0.69.bb                    | 2 +-
 meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb           | 1 -
 meta-oe/recipes-support/dool/dool_1.3.4.bb                   | 1 -
 meta-oe/recipes-support/driverctl/driverctl_0.115.bb         | 1 -
 meta-oe/recipes-support/edid-decode/edid-decode_git.bb       | 1 -
 meta-oe/recipes-support/eject/eject_2.1.5.bb                 | 2 +-
 meta-oe/recipes-support/epeg/epeg_git.bb                     | 1 -
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb             | 2 +-
 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb       | 1 -
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb                | 1 -
 meta-oe/recipes-support/fbset/fbset-modes.bb                 | 3 +--
 meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb            | 1 -
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb            | 1 -
 meta-oe/recipes-support/function2/function2_4.2.4.bb         | 1 -
 meta-oe/recipes-support/fuse/fuse3_3.16.2.bb                 | 2 +-
 meta-oe/recipes-support/gd/gd_2.3.3.bb                       | 1 -
 meta-oe/recipes-support/gflags/gflags_2.2.2.bb               | 1 -
 meta-oe/recipes-support/glog/glog_0.7.1.bb                   | 1 -
 meta-oe/recipes-support/gnulib/gnulib_202401.bb              | 1 -
 .../recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb | 1 -
 meta-oe/recipes-support/gperftools/gperftools_2.16.bb        | 1 -
 meta-oe/recipes-support/gpm/gpm_git.bb                       | 1 -
 meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb      | 2 +-
 meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb               | 2 +-
 meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb              | 1 -
 meta-oe/recipes-support/hstr/hstr_3.1.0.bb                   | 2 +-
 meta-oe/recipes-support/htop/htop_3.3.0.bb                   | 1 -
 meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb    | 1 -
 meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb           | 1 -
 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb | 1 -
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb  | 1 -
 meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb       | 1 -
 meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb             | 2 +-
 meta-oe/recipes-support/inih/libinih_58.bb                   | 1 -
 meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb         | 1 -
 .../recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb  | 1 -
 meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb           | 1 -
 meta-oe/recipes-support/lcms/lcms_2.16.bb                    | 2 +-
 meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb                 | 1 -
 meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb      | 1 -
 meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb             | 1 -
 meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb      | 1 -
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb         | 1 -
 meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb         | 2 +-
 meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb       | 1 -
 meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb | 1 -
 meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb           | 1 -
 meta-oe/recipes-support/libfann/libfann_git.bb               | 1 -
 meta-oe/recipes-support/libftdi/libftdi_1.5.bb               | 2 +-
 meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb             | 1 -
 meta-oe/recipes-support/libharu/libharu_2.4.5.bb             | 1 -
 meta-oe/recipes-support/libiio/libiio_0.26.bb                | 1 -
 meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb   | 1 -
 .../recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb    | 1 -
 meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb   | 1 -
 meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb          | 3 +--
 meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb        | 2 +-
 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb       | 1 -
 meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb             | 1 -
 meta-oe/recipes-support/libnvme/libnvme_1.12.bb              | 1 -
 meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb        | 1 -
 meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb  | 1 -
 meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb      | 1 -
 meta-oe/recipes-support/libp11/libp11_0.4.13.bb              | 1 -
 meta-oe/recipes-support/libraw/libraw_0.21.2.bb              | 1 -
 meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb       | 1 -
 meta-oe/recipes-support/librsync/librsync_2.3.4.bb           | 1 -
 .../recipes-support/libserialmodule/libserialmodule_1.0.8.bb | 1 -
 meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb   | 1 -
 meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb               | 1 -
 meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb        | 2 +-
 meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb             | 1 -
 meta-oe/recipes-support/libssh/libssh_0.11.1.bb              | 1 -
 meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb       | 1 -
 meta-oe/recipes-support/libtar/libtar_1.2.20.bb              | 2 +-
 meta-oe/recipes-support/libteam/libteam_1.32.bb              | 1 -
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb       | 2 +-
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb    | 1 -
 meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb       | 1 -
 meta-oe/recipes-support/liburing/liburing_2.9.bb             | 1 -
 meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb        | 1 -
 meta-oe/recipes-support/libusbg/libusbg_git.bb               | 1 -
 meta-oe/recipes-support/libusbgx/libusbgx-config.bb          | 3 +--
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb             | 1 -
 .../recipes-support/libutempter/libutempter_1.2.2-alt1.bb    | 2 +-
 meta-oe/recipes-support/links/links-x11_2.26.bb              | 2 +-
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb             | 2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                        | 1 -
 meta-oe/recipes-support/mcelog/mce-inject_git.bb             | 1 -
 meta-oe/recipes-support/mcelog/mce-test_git.bb               | 1 -
 meta-oe/recipes-support/mcelog/mcelog_204.bb                 | 1 -
 meta-oe/recipes-support/md4c/md4c_0.5.2.bb                   | 1 -
 meta-oe/recipes-support/mg/mg_20230501.bb                    | 1 -
 meta-oe/recipes-support/mime-support/mime-support_3.62.bb    | 2 +-
 .../multipath-tools/multipath-tools_0.11.1.bb                | 1 -
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb                   | 1 -
 meta-oe/recipes-support/nmon/nmon_16m.bb                     | 3 +--
 meta-oe/recipes-support/nspr/nspr_4.36.bb                    | 2 +-
 meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb        | 1 -
 meta-oe/recipes-support/opencv/ade_0.1.2.bb                  | 1 -
 meta-oe/recipes-support/opencv/opencv_4.11.0.bb              | 1 -
 meta-oe/recipes-support/opensc/opensc_0.26.1.bb              | 1 -
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb            | 2 +-
 .../opentelemetry/opentelemetry-cpp_1.20.0.bb                | 1 -
 meta-oe/recipes-support/p910nd/p910nd_0.97.bb                | 1 -
 meta-oe/recipes-support/pcp/pcp.inc                          | 1 -
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb         | 2 +-
 meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb       | 1 -
 meta-oe/recipes-support/picocom/picocom_2024.bb              | 1 -
 meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb      | 1 -
 meta-oe/recipes-support/pidgin/icyque_git.bb                 | 1 -
 meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb        | 1 -
 .../recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb   | 1 -
 meta-oe/recipes-support/poco/poco_1.13.3.bb                  | 1 -
 meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb    | 1 -
 meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb         | 1 -
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb              | 3 +--
 meta-oe/recipes-support/re2/re2_2024.03.01.bb                | 1 -
 meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb       | 1 -
 meta-oe/recipes-support/remmina/remmina_1.4.36.bb            | 1 -
 meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb              | 1 -
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb           | 1 -
 meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb       | 1 -
 meta-oe/recipes-support/rtkit/rtkit_0.13.bb                  | 1 -
 meta-oe/recipes-support/satyr/satyr_0.43.bb                  | 1 -
 meta-oe/recipes-support/sdmon/sdmon_git.bb                   | 1 -
 meta-oe/recipes-support/serial-utils/pty-forward-native.bb   | 2 +-
 meta-oe/recipes-support/serial-utils/serial-forward_git.bb   | 2 +-
 meta-oe/recipes-support/serial/serial_1.2.1.bb               | 1 -
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb          | 2 +-
 meta-oe/recipes-support/smarty/smarty_5.4.5.bb               | 1 -
 meta-oe/recipes-support/snapper/snapper_0.11.2.bb            | 1 -
 .../recipes-support/source-highlight/source-highlight_git.bb | 1 -
 meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb        | 1 -
 meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb              | 1 -
 meta-oe/recipes-support/spitools/spitools_git.bb             | 1 -
 meta-oe/recipes-support/srecord/srecord_1.65.0.bb            | 2 +-
 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb               | 2 +-
 meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb | 1 -
 meta-oe/recipes-support/synergy/synergy_git.bb               | 1 -
 .../recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb | 1 -
 meta-oe/recipes-support/tbb/tbb_2022.1.0.bb                  | 1 -
 meta-oe/recipes-support/tio/tio_3.9.bb                       | 1 -
 meta-oe/recipes-support/udisks/udisks2_2.10.1.bb             | 1 -
 meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb             | 1 -
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb    | 3 +--
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb          | 2 +-
 meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb | 1 -
 meta-oe/recipes-support/upower/upower_1.90.6.bb              | 2 +-
 meta-oe/recipes-support/usbids/usbids_2025.04.01.bb          | 1 -
 meta-oe/recipes-support/uthash/uthash_2.3.0.bb               | 1 -
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb           | 1 -
 meta-oe/recipes-support/utouch/utouch-frame_git.bb           | 1 -
 meta-oe/recipes-support/utouch/utouch-mtview_git.bb          | 1 -
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb       | 2 +-
 meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb     | 1 -
 meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb              | 2 +-
 .../recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb   | 1 -
 .../xdg-desktop-portal/xdg-desktop-portal_1.20.0.bb          | 1 -
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb         | 1 -
 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb           | 1 -
 meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb              | 1 -
 meta-oe/recipes-support/zbar/zbar_git.bb                     | 1 -
 meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb               | 1 -
 meta-oe/recipes-test/bats/bats_1.12.0.bb                     | 1 -
 meta-oe/recipes-test/catch2/catch2_3.8.1.bb                  | 1 -
 meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb                  | 1 -
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb                | 1 -
 meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb                | 1 -
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb                    | 2 +-
 meta-oe/recipes-test/evtest/evtest_1.35.bb                   | 1 -
 meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb                 | 1 -
 meta-oe/recipes-test/googletest/googletest_1.16.0.bb         | 1 -
 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb       | 1 -
 .../recipes-test/linux-serial-test/linux-serial-test_git.bb  | 1 -
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb                      | 1 -
 meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb                | 1 -
 meta-oe/recipes-test/testfloat/testfloat_3e.bb               | 3 +--
 meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb          | 1 -
 meta-perl/recipes-perl/adduser/adduser_3.118.bb              | 2 +-
 .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb | 2 +-
 .../recipes-perl/libauthen/libauthen-radius-perl_0.22.bb     | 2 +-
 .../recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb     | 2 +-
 .../recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb     | 2 +-
 meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb            | 2 +-
 .../libclass/libclass-method-modifiers-perl_2.15.bb          | 2 +-
 .../libcompress/libcompress-raw-bzip2-perl_2.213.bb          | 2 +-
 .../libcompress/libcompress-raw-lzma-perl_2.213.bb           | 2 +-
 .../libcompress/libcompress-raw-zlib-perl_2.213.bb           | 2 +-
 .../recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb  | 2 +-
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb  | 2 +-
 .../libcrypt/libcrypt-openssl-guess-perl_0.15.bb             | 2 +-
 .../libcrypt/libcrypt-openssl-random-perl_0.17.bb            | 2 +-
 .../recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb  | 2 +-
 meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb      | 2 +-
 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb  | 2 +-
 meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb      | 2 +-
 .../libdevel/libdevel-globaldestruction-perl_0.14.bb         | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb | 2 +-
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
 meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb            | 2 +-
 meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb     | 2 +-
 .../libextutils/libextutils-config-perl_0.008.bb             | 2 +-
 .../libextutils/libextutils-cppguess-perl_0.27.bb            | 2 +-
 .../libextutils/libextutils-helpers-perl_0.028.bb            | 2 +-
 .../libextutils/libextutils-installpaths-perl_0.012.bb       | 2 +-
 .../libextutils/libextutils-parsexs-perl_3.35.bb             | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb | 2 +-
 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb   | 2 +-
 meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb   | 2 +-
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb     | 2 +-
 .../recipes-perl/libimport/libimport-into-perl_1.002004.bb   | 2 +-
 .../recipes-perl/libio/libio-compress-lzma-perl_2.213.bb     | 2 +-
 meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb    | 2 +-
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb  | 2 +-
 meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb     | 2 +-
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb     | 2 +-
 .../recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb    | 2 +-
 .../recipes-perl/libmime/libmime-charset-perl_1.013.1.bb     | 2 +-
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb    | 2 +-
 .../libmodule/libmodule-build-tiny-perl_0.048.bb             | 2 +-
 .../recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb   | 2 +-
 .../recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb   | 2 +-
 meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb        | 2 +-
 .../recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb   | 2 +-
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb        | 2 +-
 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb    | 2 +-
 meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb     | 2 +-
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb       | 2 +-
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb     | 2 +-
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb     | 2 +-
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb     | 2 +-
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 2 +-
 meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb | 2 +-
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb | 2 +-
 .../libstrictures/libstrictures-perl_2.000006.bb             | 2 +-
 .../libsub/libsub-exporter-progressive-perl_0.001013.bb      | 2 +-
 meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb  | 2 +-
 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb  | 2 +-
 meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb    | 2 +-
 meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb  | 2 +-
 .../recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb     | 2 +-
 meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb     | 2 +-
 .../recipes-perl/libtext/libtext-charwidth-perl_0.04.bb      | 2 +-
 meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb     | 2 +-
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb     | 2 +-
 meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb | 2 +-
 .../libunicode/libunicode-linebreak-perl_2019.001.bb         | 2 +-
 meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb            | 2 +-
 .../libxml/libxml-filter-buffertext-perl_1.01.bb             | 2 +-
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb   | 2 +-
 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb | 2 +-
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb   | 1 -
 .../telepathy/telepathy-python3_0.15.19.bb                   | 2 +-
 meta-python/recipes-devtools/gyp/gyp_git.bb                  | 1 -
 .../recipes-devtools/python/python3-annotated-types_0.7.0.bb | 2 +-
 meta-python/recipes-devtools/python/python3-astor_0.8.1.bb   | 1 -
 .../python/python3-aws-iot-device-sdk-python_1.5.2.bb        | 1 -
 meta-python/recipes-devtools/python/python3-behave_1.2.6.bb  | 1 -
 meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb | 1 -
 meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb | 1 -
 meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb  | 1 -
 .../recipes-devtools/python/python3-covdefaults_2.3.0.bb     | 1 -
 .../recipes-devtools/python/python3-crypt-r_3.13.1.bb        | 1 -
 meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb  | 1 -
 meta-python/recipes-devtools/python/python3-dasbus_1.7.bb    | 1 -
 meta-python/recipes-devtools/python/python3-dbussy_1.3.bb    | 1 -
 .../recipes-devtools/python/python3-dirty-equals_0.9.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-gcovr_8.3.bb     | 1 -
 meta-python/recipes-devtools/python/python3-icu_2.15.2.bb    | 2 +-
 .../python/python3-importlib-metadata_8.7.0.bb               | 2 +-
 meta-python/recipes-devtools/python/python3-inotify_git.bb   | 1 -
 .../recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb   | 1 -
 .../python/python3-keras-applications_1.0.8.bb               | 1 -
 meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb    | 1 -
 meta-python/recipes-devtools/python/python3-lief_0.16.5.bb   | 1 -
 .../recipes-devtools/python/python3-linux-procfs_0.7.3.bb    | 1 -
 .../recipes-devtools/python/python3-lrparsing_1.0.17.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-monotonic_1.6.bb | 1 -
 meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb | 2 +-
 .../recipes-devtools/python/python3-multidict_6.4.4.bb       | 1 -
 .../recipes-devtools/python/python3-paho-mqtt_2.1.0.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb | 1 -
 meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb   | 1 -
 .../recipes-devtools/python/python3-ptyprocess_0.7.0.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb   | 1 -
 .../recipes-devtools/python/python3-pyatspi_2.46.1.bb        | 1 -
 .../recipes-devtools/python/python3-pybind11-json_0.2.15.bb  | 1 -
 .../recipes-devtools/python/python3-pybind11_2.13.6.bb       | 1 -
 .../recipes-devtools/python/python3-pydantic_2.11.3.bb       | 1 -
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb  | 1 -
 .../recipes-devtools/python/python3-pyhsslms_2.0.0.bb        | 1 -
 meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb  | 1 -
 .../recipes-devtools/python/python3-pymetno_0.13.0.bb        | 1 -
 .../recipes-devtools/python/python3-pyruvate_1.2.1.bb        | 1 -
 .../recipes-devtools/python/python3-pyyaml-include_2.2.bb    | 1 -
 .../recipes-devtools/python/python3-schedutils_0.6.bb        | 1 -
 .../recipes-devtools/python/python3-slip-dbus_0.6.5.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-smbus_4.3.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb | 1 -
 .../recipes-devtools/python/python3-uefi-firmware_1.12.bb    | 1 -
 meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb  | 1 -
 meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb    | 1 -
 .../python3-piccata/python3-piccata_2.0.3.bb                 | 1 -
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb  | 2 +-
 .../python-blivet/python3-blivetgui_2.6.0.bb                 | 1 -
 meta-python/recipes-extended/python-cson/python3-cson_git.bb | 1 -
 meta-python/recipes-extended/python-meh/python3-meh_0.52.bb  | 1 -
 .../python-pykickstart/python3-pykickstart_3.63.bb           | 1 -
 meta-python/recipes-extended/tuna/tuna_0.19.bb               | 1 -
 .../recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb         | 1 -
 .../recipes-httpd/apache-mod/apache-websocket_git.bb         | 1 -
 meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb     | 1 -
 meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb       | 2 +-
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb          | 1 -
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb       | 1 -
 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb    | 2 +-
 meta-webserver/recipes-support/fcgi/fcgi_git.bb              | 1 -
 meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb      | 1 -
 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb       | 1 -
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb        | 1 -
 .../xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb    | 1 -
 meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb        | 2 +-
 meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb   | 1 -
 .../closebutton/xfce4-closebutton-plugin_git.bb              | 1 -
 1055 files changed, 317 insertions(+), 1095 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.=
1.5.bb b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.=
bb
index 5dc3ea6632..2370633551 100644
--- a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
+++ b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
@@ -11,7 +11,7 @@ RDEPENDS:${PN} +=3D "fuse"
 SRC_URI +=3D "${SOURCEFORGE_MIRROR}/project/httpfs/httpfs2/httpfs2-${PV}=
.tar.gz"
 SRC_URI[sha256sum] =3D "01cb4bb38deb344f540da6f1464dc7edbdeb51213ad810b8=
c9c282c1e17e0fc1"
=20
-S =3D "${WORKDIR}/httpfs2-${PV}"
+S =3D "${UNPACKDIR}/httpfs2-${PV}"
=20
 do_compile() {
     oe_runmake -C ${S} httpfs2
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_g=
it.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
index 7d0a83609e..06051d8013 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
@@ -18,7 +18,6 @@ SRC_URI =3D "git://github.com/prasad-joshi/logfsprogs.g=
it;branch=3Dmaster;protocol=3Dh
            "
 SRCREV =3D "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "CC=3D"${CC}" LD=3D"${LD}" AR=3D"${AR}""
=20
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-=
3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-=
ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index be2a5245ce..4c7fff8ea9 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfs=
progs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfs=
progs_2022.10.3.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfsp=
rogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-h=
ost.patch \
            file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs=
.patch \
 "
-S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
+S =3D "${UNPACKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] =3D "f20e36ee68074b845e3629e6bced4706ad053804cbaf062f=
bae60738f854170c"
=20
 UPSTREAM_CHECK_URI =3D "https://www.tuxera.com/community/open-source-ntf=
s-3g/"
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb b/me=
ta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
index 7768a734d6..890c8aecc0 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/owfs/owfs;branch=3Dmaster=
;protocol=3Dhttps \
            file://owserver \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep update-rc.d pkgconfig systemd
=20
diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtp=
fs_0.4.0.bb b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mt=
pfs_0.4.0.bb
index b8399265cd..05a1004b65 100644
--- a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.=
0.bb
+++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.=
0.bb
@@ -11,4 +11,3 @@ inherit autotools pkgconfig
 SRC_URI =3D "git://github.com/phatina/simple-mtpfs.git;protocol=3Dhttps;=
branch=3Dmaster"
 SRCREV =3D "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.b=
b b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index 1f8357db00..97c7ad396e 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -27,6 +27,5 @@ SRC_URI =3D "git://smbnetfs.git.sourceforge.net/gitroot=
/smbnetfs/smbnetfs;branch=3Dm
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[libsecret] =3D "--with-libsecret=3Dyes,--with-libsecret=3D=
no,libsecret"
=20
-S =3D "${WORKDIR}/git"
=20
 LDFLAGS:append:libc-musl =3D " -lexecinfo"
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3=
.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.=
3.bb
index 569c7f6901..c3a00566ab 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/libfuse/sshfs;branch=3Dma=
ster;protocol=3Dhttps \
            file://a1d58ae1be99571a88b8439b027abe6349b74658.patch \
 "
 SRCREV =3D "c91eb9a9a992f1a36c49a8e6f1146e45b5e1c8e7"
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig ptest
=20
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fu=
se_3.4.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fus=
e_3.4.bb
index e8fda05365..fc474e3238 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.=
bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.=
bb
@@ -14,6 +14,5 @@ SRCREV =3D "773f1853b043eeb64b7459f903a2c65bd096f9d9"
 DEPENDS =3D "fuse3"
 RDEPENDS:${PN} =3D "bash"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git=
.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index ca5e3302b3..f7379d8935 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -25,7 +25,6 @@ SRCREV =3D "613a901a229e8a701c18f003dd0aee18453e0670"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 CFLAGS:append =3D " -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPE=
S"
 EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb b/meta=
-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
index 6fa9104236..cf56cca84c 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/openzfs/zfs;protocol=3Dht=
tps;branch=3Dzfs-2.2-release \
            file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_=
t.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
 # define a do_compile function.
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/=
meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 4d2b909809..913b2c1d32 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -21,7 +21,6 @@ UPSTREAM_CHECK_COMMITS =3D "1"
=20
 PV =3D "4.9+git"
=20
-S =3D "${WORKDIR}/git"
=20
 export HOSTCC =3D "${BUILD_CC}"
 do_configure:prepend() {
diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb b/meta=
-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
index 040cbc95bb..eda41010a9 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.18.0.bb
@@ -10,6 +10,5 @@ RDEPENDS:${PN} =3D "fuse"
 SRC_URI =3D "git://github.com/mpartel/bindfs;protocol=3Dhttps;branch=3Dm=
aster;tag=3D${PV}"
 SRCREV =3D "a276dbe66faaf7af02d967a648f7598589bf5c5b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig gettext
diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmainten=
ance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmainte=
nance_0.5.bb
index b4e5da6e20..645e38ca49 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.=
5.bb
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.=
5.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_REGEX =3D "${BPN}/releases/tag/v(?P<pver=
>\d+(?:\.\d+)*)"
=20
 RDEPENDS:${PN} =3D "bash btrfs-tools"
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/me=
ta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index d7e654babe..40c4f56650 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -18,7 +18,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "46da6c398e70635a296245851fcedbc56c35e824"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig ptest
=20
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.=
bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
index a51c2ef8bd..68727b008e 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/jaegeuk/f2fs-tools.git;
            "
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig autotools
=20
diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb b/meta=
-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
index 214b3f914c..bdde0d311a 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
@@ -15,6 +15,5 @@ SRC_URI =3D "git://github.com/Gregwar/fatcat.git;branch=
=3Dmaster;protocol=3Dhttps \
=20
 SRCREV =3D "99cb99fc86eb1601ac7ae27f5bba23add04d2543"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb =
b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index 6832634f61..7f90bfd666 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://salsa.debian.org/parted-team/fatresize=
.git;protocol=3Dhttps;branc
           "
 SRCREV =3D "12da22087de2ec43f0fe5af1237389e94619c483"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "parted"
=20
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v20=
24.07.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024=
.07.bb
index d11ee0c479..708bbfcf02 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.b=
b
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.b=
b
@@ -11,7 +11,6 @@ SRC_URI =3D "\
=20
 SRCREV =3D "7a4a0c4f2c6c86aa46a40e3468e394fd4a237491"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.b=
b b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
index d57b5be146..a22e54e24c 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/westerndigitalcorporation=
/ufs-utils.git;protocol=3Dhtt
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${CC}" CFLAGS=3D=
"${CFLAGS}""
=20
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.=
bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
index 2afa752b78..9e86b77c5e 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstes=
ts-dev.git;branch=3Dmaster;ta
            file://0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-b=
uil.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 # brokensep because m4/package_globals.m4 calls ". ./VERSION" (and that'=
s not the only issue)
 inherit autotools-brokensep useradd pkgconfig
diff --git a/meta-gnome/classes/clutter.bbclass b/meta-gnome/classes/clut=
ter.bbclass
index 24b53a13e4..6cf746261a 100644
--- a/meta-gnome/classes/clutter.bbclass
+++ b/meta-gnome/classes/clutter.bbclass
@@ -12,7 +12,7 @@ VERMINOR =3D "${@get_minor_dir("${PV}")}"
 REALNAME =3D "${@get_real_name("${BPN}")}"
=20
 SRC_URI =3D "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.t=
ar.xz;name=3Darchive"
-S =3D "${WORKDIR}/${REALNAME}-${PV}"
+S =3D "${UNPACKDIR}/${REALNAME}-${PV}"
=20
 CLUTTERBASEBUILDCLASS ??=3D "autotools"
 inherit ${CLUTTERBASEBUILDCLASS} pkgconfig gtk-doc gettext
diff --git a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_46.0.bb
index 81aa923c03..2012534993 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
@@ -41,7 +41,6 @@ SRC_URI =3D " \
 	file://0001-meson-Do-not-check-for-iso-xml-files-during-build.patch \
 "
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "46e93c0c0dafc381e8a308b1befb07e908121722"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.=
bb b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
index af1a7d8673..032532456d 100644
--- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome_0.105.bb
@@ -19,7 +19,6 @@ SRC_URI =3D " \
     file://polkit-gnome-authentication-agent-1.desktop \
 "
 SRCREV =3D "a0763a246a81188f60b0f9810143e49224dc752f"
-S =3D "${WORKDIR}/git"
=20
=20
 do_install:append() {
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.4.bb
index 32603af310..414f9c5203 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
@@ -63,7 +63,6 @@ SRC_URI +=3D "file://0001-meson.build-dont-check-for-lg=
i.patch"
 SRC_URI +=3D "file://0001-meson.build-require-iso-codes-native.patch"
 SRCREV =3D "c1901c5be644ab8dcaf779b1f383bf5370bc90c6"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
 PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gno=
me/recipes-gimp/mypaint/libmypaint_git.bb
index b0f9b82e42..b64e91a765 100644
--- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -19,7 +19,6 @@ SRCREV =3D "2768251dacce3939136c839aeca413f4aa4241d0"
=20
 PV =3D "1.6.1"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_AUTORECONF +=3D "-I m4"
=20
diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb b=
/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
index ca3912da88..b6b8ff8c1f 100644
--- a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
@@ -7,6 +7,5 @@ inherit autotools allarch
 SRC_URI =3D "git://github.com/mypaint/mypaint-brushes.git;protocol=3Dhtt=
ps;branch=3Dv1.3.x"
 SRCREV =3D "8a0124ac0675103eae8fa41fad533851768ae1ce"
 PV =3D "1.3.1"
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${datadir}/mypaint-data"
diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta=
-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
index 9e641daa5a..2bbf73dffc 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/dsalt/devilspie2;branch=3D=
master;protocol=3Dhttps \
     file://devilspie2.desktop \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit features_check pkgconfig gettext
=20
diff --git a/meta-gnome/recipes-gnome/evince/evince_48.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_48.0.bb
index 9f9de50acf..86d7d481bb 100644
--- a/meta-gnome/recipes-gnome/evince/evince_48.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_48.0.bb
@@ -46,8 +46,8 @@ RRECOMMENDS:${PN} =3D "adwaita-icon-theme"
 PACKAGES =3D+ "${PN}-nautilus-extension"
=20
 do_install:prepend() {
-    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/libvie=
w/ev-view-type-builtins.c
-    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/libdoc=
ument/ev-document-type-builtins.c
+    sed -i -e 's|${B}/|${TARGET_DBGSRC_DIR}|g' ${B}/libview/ev-view-type=
-builtins.c
+    sed -i -e 's|${B}/|${TARGET_DBGSRC_DIR}|g' ${B}/libdocument/ev-docum=
ent-type-builtins.c
 }
=20
 FILES:${PN} +=3D "${datadir}/dbus-1 \
diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme=
_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.=
3.bb
index 5db9457122..fc88eb7cc1 100644
--- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
=20
 inherit allarch gtk-icon-cache
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 SRC_URI =3D "https://storage.googleapis.com/google-code-archive-download=
s/v2/code.google.com/${BPN}/${BPN}_${PV}.zip"
 SRC_URI[sha256sum] =3D "d4486fda0413f8a81a87e0dd2329f50f2a8a7cb4147b48cf=
147f0160add8174a"
diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb b/meta=
-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
index 11da836ff4..c2e7dd67e9 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "glib-2.0 gtk+3"
 inherit meson pkgconfig gobject-introspection features_check gtk-doc
=20
 SRC_URI =3D "git://github.com/gedit-technology/libgedit-amtk.git;protoco=
l=3Dhttps;branch=3Dmain"
-S =3D "${WORKDIR}/git"
 SRCREV =3D "f6fbfd1c57de3d97cab2056a5c3088b0da49e8a4"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.=
1.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
index d66ce60802..4f21c3e569 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "glib-2.0 gtk+3 libxml2"
 inherit meson pkgconfig gobject-introspection features_check gtk-doc
=20
 SRC_URI =3D "git://github.com/gedit-technology/libgedit-gtksourceview.gi=
t;protocol=3Dhttps;branch=3Dmain"
-S =3D "${WORKDIR}/git"
 SRCREV =3D "eaafc892d033713c7c823d8ad602061e456b3c88"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb b/meta-gnom=
e/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
index c9307967de..4b6c3f173f 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN}-python3 =3D "${PN}"
 PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
 src_package_preprocess () {
         # Trim build paths from comments in generated sources to ensure =
reproducibility
-        sed -i -e "s,${B}/../${BPN}-${PV}/${BPN}/,,g" \
+        sed -i -e "s,${B}/,,g" \
             ${B}/gexiv2/gexiv2-enums.cpp
 }
=20
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.=
34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.=
5.bb
index 2a97263125..1ceff5ffcf 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
@@ -9,7 +9,7 @@ SECTION =3D "x11/gnome"
 DEPENDS =3D "udev gtk+3 libnotify libcanberra bluez5"
=20
 GNOMEBN =3D "gnome-bluetooth"
-S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb b/m=
eta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
index 0e41626e6d..3aa353748b 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
@@ -28,7 +28,6 @@ inherit meson pkgconfig gobject-introspection gtk-icon-=
cache vala features_check
=20
 GIR_MESON_OPTION =3D ""
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "b0bf5288438f74fcb455e1e49f855b4964a2c7cb"
=20
 FILES:${PN} +=3D "${datadir}"
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb b/met=
a-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
index 78606b8a2a..9e2a21d4cc 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "https://git.savannah.gnu.org/cgit/chess.git/=
snapshot/chess-${PV}.tar.
            file://0001-Remove-register-storage-class-classifier.patch"
 SRC_URI[sha256sum] =3D "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9=
d2e6a21f1b6fb9f5"
=20
-S =3D "${WORKDIR}/chess-${PV}"
+S =3D "${UNPACKDIR}/chess-${PV}"
=20
 inherit autotools gettext
=20
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.=
0.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
index cfbde967fd..332c2c5423 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
@@ -24,7 +24,6 @@ SRC_URI =3D " \
 	file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
 "
 SRCREV =3D "965cb9307713c618253918633416fcad86bcc5d2"
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[nautilus] =3D "-Dnautilus_extension=3Dtrue,-Dnautilus_exte=
nsion=3Dfalse,nautilus,nautilus"
diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_4=
7.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.=
bb
index 07d631bccb..3b087c148d 100644
--- a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
@@ -16,7 +16,6 @@ REQUIRED_DISTRO_FEATURES =3D "systemd"
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=3D=
https;branch=3Dmaster"
 SRC_URI +=3D "file://0001-build-Define-list-of-libc-feature-test-macros.=
patch"
 SRCREV =3D "77ecbaddab0ed2121859926acbfccc9cecdee0db"
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "modules"
 PACKAGECONFIG[httpd] =3D "-Dhttpd=3D${sbindir}/httpd,,,apache2 mod-dnssd=
"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic=
-light_1.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-clas=
sic-light_1.0.bb
index 9d46b43c42..fe1ae5c7cc 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_=
1.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_=
1.0.bb
@@ -6,8 +6,7 @@ inherit allarch
=20
 SRC_URI =3D "file://classic-light.xml"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     install -d ${D}${datadir}/gtksourceview-3.0/styles
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.1=
1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index d3fa032fcd..baf4c33d38 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "gtk+3 libxml2 glib-2.0-native"
=20
 PNAME =3D "gtksourceview"
=20
-S =3D "${WORKDIR}/${PNAME}-${PV}"
+S =3D "${UNPACKDIR}/${PNAME}-${PV}"
=20
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-int=
rospection upstream-version-is-even
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index 109050397c..b9ff4ef459 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "gtk+3 libxml2 glib-2.0-native"
=20
 PNAME =3D "gtksourceview"
=20
-S =3D "${WORKDIR}/${PNAME}-${PV}"
+S =3D "${UNPACKDIR}/${PNAME}-${PV}"
=20
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-int=
rospection vala
=20
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
index 939d053a75..7076214a4d 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
@@ -16,7 +16,7 @@ DEPENDS =3D " \
=20
 PNAME =3D "gtksourceview"
=20
-S =3D "${WORKDIR}/${PNAME}-${PV}"
+S =3D "${UNPACKDIR}/${PNAME}-${PV}"
=20
=20
 inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-=
cache gobject-introspection vala
diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.b=
b b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index a89ab8cc74..b7c587d25f 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -10,5 +10,4 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
 SRCREV =3D "941560af497148588783db991e8135f52a82574d"
 SRC_URI =3D "git://github.com/gnome/libchamplain.git;branch=3Dmaster;pro=
tocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb b=
/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
index 85bc21b5da..3d8a5ed33a 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 GNOMEBN =3D "libgweather"
-S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 inherit gnomebase gsettings gobject-introspection gettext gi-docgen vala=
 features_check
=20
diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb b/meta-gnome/rec=
ipes-gnome/tepl/tepl_6.8.0.bb
index 6c9c36f3ed..f4d027ebf7 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
@@ -22,7 +22,6 @@ inherit meson gobject-introspection gettext features_ch=
eck pkgconfig
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 SRC_URI =3D "git://gitlab.gnome.org/swilmet/tepl;protocol=3Dhttps;branch=
=3Dmain"
 SRCREV =3D "16ab2567257a053bd957699f89080fafd0999035"
-S =3D "${WORKDIR}/git"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipe=
s-support/ibus/ibus.inc
index 9dce2ce4f3..9ec1dfe578 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -17,7 +17,6 @@ SRC_URI =3D " \
     file://0001-src-Fix-declaration-errors-with-GCC-15.patch \
 "
 SRCREV =3D "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG[appindicator] =3D "--enable-appindicator,--disable-appindi=
cator,qtbase"
 PACKAGECONFIG[dconf] =3D "--enable-dconf,--disable-dconf,dconf"
diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta=
-gnome/recipes-support/keybinder/keybinder_3.0.bb
index 5365db270e..bbd7c866e1 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "gtk+3 gobject-introspection-native \
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1f18f9c6d8b4cfcc7d7804a243a4c=
0b4"
=20
-S =3D "${WORKDIR}/git"
=20
 SRCREV =3D "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
 PV =3D "3.0+git"
diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb b/meta=
-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
index 8f45221ad3..f816cdf239 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.8.0.bb
@@ -15,7 +15,6 @@ DEPENDS =3D " \
     libgudev \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-lo=
ader_0.2.7.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf=
-loader_0.2.7.bb
index 73f22a3d95..726139a6b3 100644
--- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.7.bb
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
2.7.bb
@@ -14,7 +14,6 @@ EXTRA_OEMESON =3D "-Dupdate_cache=3Dtrue"
=20
 SRC_URI =3D "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=3Dht=
tps;branch=3Dmainline"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "52232e4ba282b2fed68e8fcb4b5d45ed0eaa4ed3"
=20
 FILES:${PN} =3D " \
diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gtk_1.15.3.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gtk_1.15.3.bb
index 0f6a9291b8..5e83a07a4b 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gt=
k_1.15.3.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gt=
k_1.15.3.bb
@@ -17,7 +17,6 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
 SRC_URI =3D "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protoco=
l=3Dhttps;branch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "337202d4e7179857bc37b03c1a6d8c9d92e47c44"
=20
 PACKAGECONFIG ?=3D "wallpaper appchooser lockdown settings"
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb b/=
meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
index d8134b228c..30ea09d937 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md=
5=3D0835ade698e0bcf8506ecda
=20
 SRC_URI =3D "file://icon.xpm"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install:prepend () {
 echo '# /boot/boot.cfg - KEXECBOOT configuration file.
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta=
-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 2be9076726..00985c09c5 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -4,7 +4,6 @@ HOMEPAGE =3D "https://github.com/kexecboot/kexecboot/wiki=
"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
 PV =3D "0.6+git"
-S =3D "${WORKDIR}/git"
 SRC_URI =3D " \
     git://github.com/kexecboot/kexecboot.git;branch=3Dmaster;protocol=3D=
https \
     file://0001-Fix-argument-errors-in-gcc-15.patch \
diff --git a/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.=
0.bb b/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
index c2b3faddda..2dcbb95255 100644
--- a/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
+++ b/meta-initramfs/recipes-core/initrdscripts/initramfs-debug_1.0.bb
@@ -3,8 +3,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
 SRC_URI =3D "file://init-debug.sh"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
         install -m 0755 ${UNPACKDIR}/init-debug.sh ${D}/init
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb b/meta-=
initramfs/recipes-devtools/dracut/dracut_106.bb
index 871119521f..d59b357dc1 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
@@ -18,7 +18,6 @@ DEPENDS:append:libc-musl =3D " fts"
=20
 inherit bash-completion pkgconfig
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF =3D "--prefix=3D${prefix} \
                 --libdir=3D${nonarch_libdir} \
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-=
initramfs/recipes-devtools/grubby/grubby_git.bb
index ff18b0b190..60f68728e9 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D892f569a555b=
a9c07a568a7c0c4fa63a"
 DEPENDS =3D "popt util-linux rpm"
 DEPENDS:append:libc-musl =3D " libexecinfo argp-standalone"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "c01b0d5bb182bde35b464d14996acf354a3ada2e"
 SRC_URI =3D "git://github.com/rhboot/grubby.git;protocol=3Dhttps;;branch=
=3Dmain \
            file://0001-rename-grub2-editenv-to-grub-editenv.patch \
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initr=
amfs/recipes-devtools/klibc/klibc.inc
index 6093e19b7c..2af53b18e3 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -29,7 +29,7 @@ ARMPATCHES:arm =3D " \
                  "
 SRC_URI[sha256sum] =3D "d673a294f742d59368222ff5c38462d81098c55063799de6=
fb8a7ba3d4af0436"
=20
-S =3D "${WORKDIR}/klibc-${PV}"
+S =3D "${UNPACKDIR}/klibc-${PV}"
=20
 OPTFLAGS =3D "${TUNE_CCARGS} -Os -fcommon"
 OPTFLAGS:append =3D " ${DEBUG_PREFIX_MAP}"
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb=
 b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index 43ddb82a00..461d75e625 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "git://git.infradead.org/mtd-utils.git;bran=
ch=3Dmaster \
              file://0001-make-Add-compiler-includes-in-cflags.patch \
              "
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "--disable-tests --without-jffs --without-ubifs"
=20
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb=
 b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 363cdb9adf..2df53ff38e 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -61,7 +61,6 @@ SRC_URI:append:aarch64 =3D " file://arm64_kexec-image-h=
eader.h-add-missing-le64toh
=20
 SRC_URI:append:powerpc =3D " file://powerpc-purgatory-Makefile-remove-un=
known-flags.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "--without-zlib --without-lzma --without-xen"
=20
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18=
.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
index 326a754ce7..5a42fc760c 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
@@ -12,7 +12,6 @@ SRCREV =3D "c540ce2431bdeac73359029d4592b45790e1d154"
 SRC_URI =3D "git://github.com/pupnp/pupnp.git;protocol=3Dhttps;branch=3D=
branch-1.14.x \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb b/meta-multi=
media/recipes-dvb/oscam/oscam_1.20.bb
index e20358955a..37431dca05 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "libusb1 openssl pcsc-lite"
 SRCREV =3D "190d6dee96ca70f8b614932b1498332b1504632b"
 SRC_URI =3D "git://repo.or.cz/oscam.git;protocol=3Dhttps;nobranch=3D1"
=20
-S =3D "${UNPACKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/met=
a-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 2d79777001..6a7f6c3f5d 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -16,7 +16,6 @@ SRCREV =3D "cc602833684953fc3e6f1c89d4f08f6dfef179e3"
 PV =3D "4.3+git"
 PKGV =3D "4.3+git${GITPKGV}"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "--arch=3D${TARGET_ARCH} \
                  --disable-hdhomerun_static \
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb b/meta-=
multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
index 6803806063..4b439e2ca5 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3D4fbd65380=
cdd255951079008b364516c"
 SRC_URI =3D "git://github.com/Matroska-Org/libebml.git;branch=3Dv1.x;pro=
tocol=3Dhttps"
 SRCREV =3D "1878e784321673561039a6a37076b2736f4dc98f"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig cmake dos2unix
=20
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb=
 b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
index 16862e690e..d38366a735 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "libebml"
 SRC_URI =3D "git://github.com/Matroska-Org/libmatroska.git;branch=3Dv1.x=
;protocol=3Dhttps"
 SRCREV =3D "f5315fddda2d434e47035c038549a808d8b8eac7"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig cmake
=20
diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6=
.bb b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
index b5c8ddca11..92f7270972 100644
--- a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
@@ -15,7 +15,7 @@ SRC_URI =3D " \
 SRC_URI[md5sum] =3D "d2edc7710c72cbf3ab297c414e35ebda"
 SRC_URI[sha256sum] =3D "916e7d152added24617efc350142438a46099efe062bd878=
1d36dbf10b4e6ff0"
=20
-S =3D "${WORKDIR}/alsaequal"
+S =3D "${UNPACKDIR}/alsaequal"
=20
 EXTRA_OEMAKE =3D " \
     Q=3D'' \
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb b/meta-=
multimedia/recipes-multimedia/aom/aom_3.12.1.bb
index 94e3f4f14f..72baf58cf0 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
@@ -9,7 +9,6 @@ SRCREV =3D "10aece4157eb79315da205f39e19bf6ab3ee30d0"
 SRC_URI =3D "git://aomedia.googlesource.com/aom;protocol=3Dhttps;branch=3D=
main;tag=3Dv${PV} \
            file://0001-subpel_variance_neon-Provide-prototypes-for-missi=
ng-.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.b=
b b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
index f089e036e3..162a51284e 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/Arkq/bluez-alsa.git;proto=
col=3Dhttps;branch=3Dmaster \
=20
 SRCREV =3D "959573c2cccef5cf074f5b2fa7941abbd699c5f4"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURE=
S', 'systemd', d)}"
 PACKAGECONFIG[a2dpconf] =3D "--enable-a2dpconf,--disable-a2dpconf"
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.=
2.bb b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
index 0b844ee7d3..0928da1dbd 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] =3D "005db45ef4ee017f5c32ec124f913a0=
546e77014266c6a1c50df902a55
=20
 # Uppercase letters are not allowed in the recipe name, thus the recipe =
can not be named cdparanoia-III and
 # we need to add the path to the extracted sources explicitely:
-S =3D "${WORKDIR}/cdparanoia-III-${PV}"
+S =3D "${UNPACKDIR}/cdparanoia-III-${PV}"
=20
 # cdparanoia Makefile can not be used with several threads (because the =
static library target and the shared
 # library target use object files which are compiled in the same directo=
ry, the object files are just removed
diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
index 47341e2106..d600e3b5e3 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548df=
daa3a6dc45d8793669"
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;nobranch=3D1"
 SRCREV =3D "42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS:append:x86 =3D " nasm-native"
 DEPENDS:append:x86-64 =3D " nasm-native"
diff --git a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb b/met=
a-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
index ddd4c26efe..a330d769c5 100644
--- a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/foo86/dcadec.git;protocol=3D=
https;branch=3Dmaster \
            file://0001-define-BASELIB-make-variable.patch \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit lib_package
=20
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-d=
bus_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector=
-dbus_0.3.0.bb
index bed5af9bf3..21a6613622 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3=
.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3=
.0.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "glib-2.0 dbus dleyna-core"
=20
 SRC_URI =3D "git://github.com/01org/${BPN}.git;branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "de913c35e5c936e2d40ddbd276ee902cd802bd3a"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.=
bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
index 8aaab7893e..4f743b16f6 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
@@ -15,7 +15,6 @@ PV .=3D "+git"
=20
 SRC_URI =3D "git://github.com/01org/${BPN}.git;branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "1c6853f5bc697dc0a8774fd70dbc915c4dbe7c5b"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.=
6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.=
bb
index a385a50de7..3e55a212d4 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/01org/${BPN}.git;branch=3D=
master;protocol=3Dhttps \
            file://0001-add-gupnp-1.2-API-support.patch \
           "
 SRCREV =3D "50fd1ec9d51328e7dea98874129dc8d6fe3ea1dd"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.=
0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index b0a347f252..d60abd2082 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -14,7 +14,6 @@ RDEPENDS:${PN} =3D "dleyna-connector-dbus"
 PV .=3D "+git"
 SRC_URI =3D "git://github.com/01org/${BPN}.git;branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "eb895ae82715e9889a948ffa810c0f828b4f4c76"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.2=
0140321.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.2=
0140321.bb
index 833ec2a393..232130be0f 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321=
.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321=
.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "https://www.linuxtv.org/hg/dvb-apps/archiv=
e/3d43b280298c.tar.bz2;down
           file://0001-dvbdate-Remove-Obsoleted-stime-API-calls.patch \
           "
 SRC_URI[sha256sum] =3D "f39e2f0ebed7e32bce83522062ad4d414f67fccd5df1b647=
618524497e15e057"
-S =3D "${WORKDIR}/${BPN}-3d43b280298c"
+S =3D "${UNPACKDIR}/${BPN}-3d43b280298c"
=20
 inherit perlnative
=20
diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb =
b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
index 55475b40f1..97196bbcf2 100644
--- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://NOTICE;md5=3D5985e1e12f4af=
a710d64ed7bfd291875"
 SRC_URI =3D "git://github.com/mstorsjo/fdk-aac.git;protocol=3Dhttps;bran=
ch=3Dmaster"
 SRCREV =3D "801f67f671929311e0c9952c5f92d6e147c7b003"
=20
-S =3D "${WORKDIR}/git"
=20
 SRC_URI[md5sum] =3D "fef453b5d6ee28ff302c600b8cded3e7"
 SRC_URI[sha256sum] =3D "07c2a64b098eb48b2e9d729d5e778c08f7d22f28adc8da7c=
3f92c58da1cbbd8e"
diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta=
-multimedia/recipes-multimedia/flite/flite_2.2.bb
index bb9edfd5bf..af543af80e 100644
--- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
+++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
@@ -13,7 +13,6 @@ SRC_URI +=3D "file://0001-Remove-defining-const-as-noth=
ing.patch"
=20
 SRCREV =3D "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "--enable-shared"
=20
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4=
.5.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
index 62900011a1..b8396209c5 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
@@ -13,7 +13,6 @@ SRC_URI =3D " \
 "
 SRCREV =3D "9f2edaa3cbd456997cb420fb68b6f960faaafd12"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig lib_package
=20
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb =
b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
index c12be91664..6348f25a57 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D25cdec9afe3=
f1f26212ead6bd2f7fac8"
 SRC_URI =3D "git://github.com/gerbera/gerbera.git;protocol=3Dhttps;branc=
h=3Dmaster"
 SRCREV =3D "870dd32d42f626dc2246d34b2224ffb6fd73e205"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp =
libnsl2"
=20
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0=
.8.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.=
1.bb
index dc43bed63b..b87442c893 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
@@ -19,7 +19,6 @@ SRC_URI =3D " \
     file://0001-tracers-Fix-buffer-overflow.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D " \
     --disable-graphviz \
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb=
 b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 4720edf153..d068d66bb6 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -11,7 +11,6 @@ SRCBRANCH ?=3D "master"
 SRCREV =3D "dac03d5e4102080a8f3ef274a6a6583455962095"
 SRC_URI =3D "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=3Dhttps=
;branch=3D${SRCBRANCH} \
            file://0001-gstd-Remove-redundant-rpaths.patch"
-S =3D "${WORKDIR}/git"
=20
 # Remove the +really when upstream version is > 1.0
 PV =3D "1.0+really0.15.2"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-=
multimedia/recipes-multimedia/juce/projucer.inc
index b60cba1dd6..999891c232 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/WeAreROLI/JUCE.git;protoc=
ol=3Dhttps;branch=3D${BRANCH} \
            file://0001-StandardHeader-Include-utility-for-GCC-12-compati=
bil.patch \
            "
=20
-S =3D "${WORKDIR}/git"
 PV =3D "6.1.6"
=20
 JUCE_PROJUCER_BUILD_PATH =3D "${B}/extras/Projucer/Builds"
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb =
b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
index 885758b6a4..9a82cd86bb 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc528b75b07425b=
5c1d2e34de98c397b5"
=20
 SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;=
branch=3Dv1.0.x"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "d1c26facaf5a8a97919ceee06814d05d10e25622"
=20
 DEPENDS =3D "dav1d"
diff --git a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb =
b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
index 98f8e5b84d..69d33c9f6a 100644
--- a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/Avnu/libavtp.git;branch=3Dm=
aster;protocol=3Dhttps"
 SRC_URI:append:libc-musl =3D " file://0001-provide-64bit-host-to-network=
-conversion-macros.patch"
 SRCREV =3D "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
index 3d43b4f1da..c7fe631a43 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
@@ -18,7 +18,6 @@ SRCREV =3D "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
=20
 PE =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtba=
se-native', '', d)}"
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.=
bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
index e9d5107986..a509337894 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D695b556799ab=
b2435c97a113cdca512f"
 SRC_URI =3D "git://github.com/strukturag/libde265.git;branch=3Dmaster;pr=
otocol=3Dhttps"
 SRCREV =3D "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0=
.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
index bfa6de90d3..93bdc63b56 100644
--- a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://code.videolan.org/videolan/libdvbcsa.g=
it;protocol=3Dhttps;branch=3D
            file://libdvbcsa.pc \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools lib_package pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb=
 b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
index ac469fce87..a3f5f21406 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
@@ -8,7 +8,6 @@ COMPATIBLE_MACHINE:powerpc64le =3D "null"
=20
 SRC_URI =3D "git://github.com/strukturag/libheif.git;protocol=3Dhttps;br=
anch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "5e9deb19fe6b3768af0bb8e9e5e8438b15171bf3"
=20
 inherit cmake pkgconfig
diff --git a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb b/=
meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
index 7f531efc63..bcf91b5453 100644
--- a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
+++ b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI =3D "git://github.com/google/liblc3.git;protocol=3Dhttps;branch=3D=
main"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "1a5938ebaca4f13fe79ce074f5dee079783aa29f"
=20
 inherit pkgconfig meson
diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7=
.10.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.=
bb
index f59220d0da..613147598a 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://lib.openmpt.org/files/libopenmpt/s=
rc/libopenmpt-${PV}+release
           "
 SRC_URI[sha256sum] =3D "093713c1c1024f4f10c4779a66ceb2af51fb7c908a9e99fe=
b892d04019220ba1"
=20
-S =3D "${WORKDIR}/libopenmpt-${PV}+release.autotools"
+S =3D "${UNPACKDIR}/libopenmpt-${PV}+release.autotools"
=20
 inherit autotools pkgconfig ptest
=20
diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.b=
b b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
index 3d631ea0b6..d7325abd7a 100644
--- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
+++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/OpenELEC/libsquish.git;pr=
otocol=3Dhttps;branch=3Dmaster
            file://0001-Add-support-for-variable-libdir.patch \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "INSTALL_DIR=3D${D}${prefix} LIBDIR_SUFFIX=3D${@d.getVa=
r('baselib').replace('lib', '')} \
                 ${@bb.utils.contains('TUNE_FEATURES', 'altivec', 'USE_AL=
TIVEC=3D1', '', d)}"
diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb b/=
meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
index b1572b32ac..10e64e9878 100644
--- a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
@@ -9,6 +9,5 @@ DEPENDS =3D "libusb jpeg"
 SRC_URI =3D "git://github.com/libuvc/libuvc.git;branch=3Dmaster;protocol=
=3Dhttps"
 SRCREV =3D "68d07a00e11d1944e27b7295ee69673239c00b4b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/=
meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index 76f51196aa..b9093d19bb 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -27,6 +27,5 @@ SRC_URI =3D "git://github.com/MycroftAI/mimic1.git;bran=
ch=3Dmaster;protocol=3Dhttps \
=20
 inherit autotools pkgconfig
=20
-S =3D "${WORKDIR}/git"
=20
 CPPFLAGS:append =3D " -Wno-error"
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/m=
eta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index 170e676b24..cb2a1865e8 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -15,7 +15,6 @@ SRC_URI =3D "git://git.code.sf.net/p/minidlna/git;branc=
h=3Dmaster;module=3Dgit \
            file://0001-Add-compatibility-with-FFMPEG-7.0.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 # This remove "--exclude=3Dautopoint" option from autoreconf argument to=
 avoid
 # configure.ac:30: error: required file './ABOUT-NLS' not found
diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_=
git.bb
index 2b373d31e5..1ae43e8aef 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz=
.git;branch=3Dmaster;protocol
            file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_reque=
st_.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22=
.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
index 2746c6bb80..a9dae6073a 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
@@ -9,7 +9,6 @@ SRC_URI =3D " \
     git://github.com/MusicPlayerDaemon/libmpdclient;branch=3Dmaster;prot=
ocol=3Dhttps \
 "
 SRCREV =3D "7124a0ad4841a44db084bb785a6e7120bc8f0139"
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "tcp"
 PACKAGECONFIG[tcp] =3D "-Dtcp=3Dtrue,-Dtcp=3Dfalse"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb b/met=
a-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb
index 93df25ee2f..6f337febb3 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb
@@ -10,4 +10,3 @@ DEPENDS +=3D "libmpdclient"
 SRC_URI =3D "git://github.com/MusicPlayerDaemon/mpc;branch=3Dmaster;prot=
ocol=3Dhttps"
 SRCREV =3D "31c900b79b3a1cd7f2944e92f24223d12589fdaa"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
index 7250c22a68..d1dd4d7442 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
@@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;bra=
nch=3Dmaster;protocol=3Dhttps \
            "
 SRCREV =3D "063abb31a68f7ee92a246256eec4234ab8b7ed8b"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMESON +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
-Dsystemd=3Denabled -Dsystemd_system_unit_dir=3D${systemd_system_unitdir}=
 -Dsystemd_user_unit_dir=3D${systemd_system_unitdir}', '-Dsystemd=3Ddisab=
led', d)} \
     -Dadplug=3Ddisabled \
diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
index d93c054f45..626897aa3b 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
@@ -34,4 +34,3 @@ PACKAGECONFIG[chat_screen] =3D "-Dchat_screen=3Dtrue,-D=
chat_screen=3Dfalse"
=20
 SRC_URI =3D "git://github.com/MusicPlayerDaemon/ncmpc;branch=3Dmaster;pr=
otocol=3Dhttps"
 SRCREV =3D "f81f875fc5785383d24f54fb9bd3cf06efd915a4"
-S =3D "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb=
 b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index 8bedc693ba..bdc4d7280c 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/MycroftAI/mycroft-core.gi=
t;branch=3Dmaster;protocol=3Dht
            file://mycroft.service \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit systemd features_check
=20
diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec=
-headers_12.1.14.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-heade=
rs/nv-codec-headers_12.1.14.0.bb
index 36885f29e2..6ac74748be 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_12.1.14.0.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_12.1.14.0.bb
@@ -8,7 +8,6 @@ SRC_URI =3D " \
     file://0001-Makefile-add-clean-target.patch \
 "
 SRCREV =3D "1889e62e2d35ff7aa9baca2bceb14f053785e6f1"
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "PREFIX=3D${prefix} DESTDIR=3D${D} LIBDIR=3D${baselib}"
=20
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3=
.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
index d57c9b5c64..4204017c20 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
@@ -10,7 +10,6 @@ DEPENDS =3D "zlib libsndfile1"
 SRCREV =3D "dc7d7054a5b4f3bec1dc23a42fd616a0847af948"
 SRC_URI =3D "git://github.com/kcat/openal-soft.git;protocol=3Dhttps;bran=
ch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pipewire=
 pulseaudio', d)}"
 PACKAGECONFIG[alsa] =3D "-DALSOFT_BACKEND_ALSA=3DON,-DALSOFT_BACKEND_ALS=
A=3DOFF,alsa-lib"
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.b=
b b/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb
index 0226745bbc..b210454efd 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb
@@ -11,7 +11,6 @@ DEPENDS =3D " nasm-native"
=20
 inherit meson pkgconfig
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "19120fcb8f89b16126e9cfee096b2f0751554fdc"
 BRANCH =3D "openh264v${PV}"
 SRC_URI =3D "git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=
=3D${BRANCH} \
diff --git a/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2=
.bb b/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
index b76c5ba01d..92df308ce0 100644
--- a/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
+++ b/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "http://downloads.xiph.org/releases/opus/opus=
-tools-${PV}.tar.gz"
 SRC_URI[md5sum] =3D "ff2d0536e960cabbfb8ca7c8c1759b6c"
 SRC_URI[sha256sum] =3D "b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642=
259f6da28fa0ff86"
=20
-S =3D "${WORKDIR}/opus-tools-${PV}"
+S =3D "${UNPACKDIR}/opus-tools-${PV}"
=20
 DEPENDS =3D "libopus libopusenc flac opusfile"
=20
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession_0.4.2.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-me=
dia-session_0.4.2.bb
index 184ed45d2d..dde0039584 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.2.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/medi=
a-session.git;protocol=3Dhttp
            file://0001-pass-right-types-to-methods.patch \
            "
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "80dae7e24bec02b2befe09a72fbac6e2b38ccb5c"
=20
 inherit meson pkgconfig
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
index d4ae3381bd..e41cfd221c 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.5.bb
@@ -16,7 +16,6 @@ SRCREV =3D "83ada1e086f8fa49bf9652df2edd9ccee5efa48b"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig systemd gettext useradd
=20
diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb =
b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
index 9297641c88..c02b45054f 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
@@ -13,7 +13,6 @@ SRC_URI =3D " \
     git://git.ffmpeg.org/rtmpdump;branch=3Dmaster \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_STATUS_GROUPS +=3D "CVES_2015"
 CVES_2015 =3D "CVE-2015-8270 CVE-2015-8271 CVE-2015-8272"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbun=
ny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbu=
nny-1080p.bb
index 5eba4da207..50033eca75 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080=
p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080=
p.bb
@@ -9,8 +9,7 @@ SRC_URI[sha256sum] =3D "69fe2cfe7154a6e752688e3a0d7d6b07b=
1605bbaf75b56f6470dc7b4c2
=20
 inherit allarch
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     install -d ${D}${datadir}/movies
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbun=
ny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbun=
ny-480p.bb
index 29e60cb0a8..0a1f50791c 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p=
.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p=
.bb
@@ -9,8 +9,7 @@ SRC_URI[sha256sum] =3D "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea=
05b6679444864781299b24db0
=20
 inherit allarch
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     install -d ${D}${datadir}/movies
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbun=
ny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbun=
ny-720p.bb
index 50ea2e3c88..ed010ce639 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p=
.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p=
.bb
@@ -9,8 +9,7 @@ SRC_URI[sha256sum] =3D "b957d6e6212638441b52d3b620af157cc=
8d40c2a0342669294854a06ed
=20
 inherit allarch
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     install -d ${D}${datadir}/movies
diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofste=
el-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofst=
eel-1080p.bb
index ed3ff75ac0..fedb15d053 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080=
p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080=
p.bb
@@ -8,8 +8,7 @@ SRC_URI[sha256sum] =3D "bd2b5bc6c16d4085034f47ef7e4b3938a=
fe86b4eec4ac3cf2685367d3b
=20
 inherit allarch
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     install -d ${D}${datadir}/movies
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-=
multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 8607af64ed..90a7a85df8 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -41,7 +41,6 @@ SRC_URI =3D "git://git.code.sf.net/p/sox/code;protocol=3D=
https;branch=3Dmaster \
 # last release was in 2015, use latest hash from 2024-05-30
 PV .=3D "+git"
 SRCREV =3D "f3094754a7c2a7e55c35621d20fa9945736e72df"
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT:append =3D " libsox_project:libsox sound_exchange_project:so=
und_exchange"
=20
diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/=
meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
index f115553fd1..9993837f19 100644
--- a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
@@ -28,7 +28,6 @@ SRC_URI =3D "\
 # https://lists.openembedded.org/g/openembedded-devel/message/109325
 SRCREV =3D "df1282eb9af538ab1aadb6d66146e258451d4fe4"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.b=
b b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
index b513e959d3..8965c8ee75 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
@@ -10,7 +10,6 @@ PV .=3D "+git"
 SRCREV =3D "f78ed25aced2dfea743867b8205a787bfb091340"
 SRC_URI =3D "git://github.com/tinyalsa/tinyalsa;branch=3Dmaster;protocol=
=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson
=20
diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb=
 b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index f8ab1bf680..f195a4a654 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://gitlab.xiph.org/xiph/tremor.git;prot=
ocol=3Dhttps;branch=3Dmaster \
 "
 SRCREV =3D "7c30a66346199f3f09017a09567c6c8a3a0eedc8"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-1_1.3.bb b/meta-multimedia/recipes-multimedia/webr=
tc-audio-processing/webrtc-audio-processing-1_1.3.bb
index 15ddcdb04e..08104cbc62 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-1_1.3.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-1_1.3.bb
@@ -15,7 +15,7 @@ SRC_URI =3D " \
     file://0001-task_queue-fix-build-with-gcc-15.patch \
 "
 SRC_URI[sha256sum] =3D "2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0=
838ad6ec2e86f1b9"
-S =3D "${WORKDIR}/webrtc-audio-processing-${PV}"
+S =3D "${UNPACKDIR}/webrtc-audio-processing-${PV}"
=20
 LDFLAGS:append:libc-musl =3D " -lexecinfo"
=20
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-2_2.1.bb b/meta-multimedia/recipes-multimedia/webr=
tc-audio-processing/webrtc-audio-processing-2_2.1.bb
index 8eab2c4ff0..9aab57a089 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-2_2.1.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-2_2.1.bb
@@ -13,7 +13,7 @@ SRC_URI =3D " \
     file://e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch \
 "
 SRC_URI[sha256sum] =3D "ae9302824b2038d394f10213cab05312c564a038434269f1=
1dbf68f511f9f9fe"
-S =3D "${WORKDIR}/webrtc-audio-processing-${PV}"
+S =3D "${UNPACKDIR}/webrtc-audio-processing-${PV}"
=20
 LDFLAGS:append:libc-musl =3D " -lexecinfo"
 # | riscv32-yoe-linux-musl-ld.lld: error: undefined reference: __atomic_=
store_8
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.10.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5=
.10.bb
index 9140b724d1..8e50378bfd 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.b=
b
@@ -16,7 +16,6 @@ SRC_URI =3D " \
     file://90-OE-disable-session-dbus-dependent-features.lua \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig gobject-introspection systemd
=20
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-m=
ultimedia/recipes-multimedia/x265/x265_4.1.bb
index ae0f7758c1..dedc3aa4d3 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -13,7 +13,7 @@ SRC_URI =3D " \
     file://0001-json11.cpp-Include-cstdint.patch \
 "
 SRC_URI[sha256sum] =3D "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5e=
bf8a4379d7af8f29"
-S =3D "${WORKDIR}/x265_${PV}/source"
+S =3D "${UNPACKDIR}/x265_${PV}/source"
=20
 inherit lib_package cmake pkgconfig
=20
diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb=
 b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
index 5e680c4640..811a876885 100644
--- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
+++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
@@ -11,7 +11,6 @@ SRCREV =3D "ca1bf4b810e2d188d04cb6286f957008ee1b7681"
 SRC_URI =3D "git://github.com/graeme-hill/crossguid;protocol=3Dhttps;bra=
nch=3Dmaster \
            file://0001-include-missing-cstdint.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instrume=
nts_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instrume=
nts_git.bb
index 04d16ffe11..b3953cf5c3 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git=
.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git=
.bb
@@ -10,7 +10,6 @@ PV =3D "0.3.1+git"
=20
 SRC_URI =3D "git://github.com/kirushyk/gst-instruments.git;protocol=3Dht=
tps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit vala meson pkgconfig
=20
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_=
1.9.6.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.=
9.6.bb
index 376dd15d17..c5d497c468 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.b=
b
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.b=
b
@@ -13,7 +13,7 @@ inherit gnomebase gobject-introspection vala features_c=
heck
 SRC_URI =3D "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcf=
f93f62876a677f17"
=20
-S =3D "${WORKDIR}/libmediaart-${PV}"
+S =3D "${UNPACKDIR}/libmediaart-${PV}"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb b/m=
eta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
index d1cbe0f590..9130b290b9 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2909fcf6f09f=
fff8430463d91c08c4e1"
 SRC_URI =3D "git://github.com/cisco/libsrtp.git;branch=3Dmain;protocol=3D=
https"
 SRCREV =3D "a566a9cfcd619e8327784aa7cff4a1276dc1e895"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[nss] =3D "-Dcrypto-library=3Dnss,, nss,,, openssl"
diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb b/meta-mult=
imedia/recipes-support/srt/srt_1.4.4.bb
index d6cf36dfbe..91651fda8e 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/Haivision/srt;protocol=3D=
https;branch=3Dmaster \
            file://0001-don-t-install-srt-ffplay.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.7.0.bb b/meta-multimedia/recipes-support/xdg-desktop-=
portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
index 0b90bc0db9..c3056c9e86 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.7.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.7.0.bb
@@ -19,7 +19,6 @@ REQUIRED_DISTRO_FEATURES =3D "opengl wayland"
 SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;branch=3Dmaster \
            file://0001-screencast-Fix-build-with-older-mesa.patch"
=20
-S =3D "${WORKDIR}/git"
 PV .=3D "+git"
 SRCREV =3D "d9ada849aeca6137915de2df69beaef4e272cc1d"
=20
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/=
system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/d=
ynamic-layers/meta-python/recipes-printing/system-config-printer/system-c=
onfig-printer_1.5.18.bb
index 6cd25e346a..ac23182009 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 SRC_URI =3D "git://github.com/OpenPrinting/system-config-printer.git;pro=
tocol=3Dhttps;branch=3Dmaster"
=20
 SRCREV =3D "895d3dec50c93bfd4f142bac9bfcc13051bf84cb"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools gettext pkgconfig python3native features_check
=20
diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb b/=
meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
index c5dcccbac5..2f15abbcfd 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
@@ -8,7 +8,6 @@ SRCREV =3D "8e88e3590a19006362ea8b8dfdc18bb88b3cb3b5"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/realmd/adcli;protocol=3Dhttps;=
branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D23c2a5e0106b99d75238986559bb5=
fc6"
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb =
b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 39569e9d06..17ef3c99cb 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -40,7 +40,6 @@ EXTRA_OEMAKE +=3D 'CC=3D"${CC}" CFLAGS=3D"${CFLAGS}" LD=
DLL=3D"${CCLD} ${LDFLAGS}" LD=3D"${
                  ${@ "STATICLIB=3Dno" if d.getVar('DISABLE_STATIC') !=3D=
 "" else "" } \
 '
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
 	install -d ${D}/${bindir} ${D}/${libdir} ${D}/${includedir}
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
index 629e1bc8cd..4a2e3a3ba0 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
@@ -9,7 +9,6 @@ inherit meson gettext systemd gsettings pkgconfig python3=
native gtk-icon-cache f
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 SRC_URI =3D "git://github.com/blueman-project/blueman.git;protocol=3Dhtt=
ps;branch=3D2-4-stable"
-S =3D "${WORKDIR}/git"
 SRCREV =3D "bdacba8afe53066bc3a338997e26fee416af2261"
=20
 EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse \
diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/=
meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index 5b784d9a04..e1f01de8a0 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/IanHarvey/bluepy.git;prot=
ocol=3Dhttps;branch=3Dmaster \
            file://0001-bluepy-Fix-username-issue-with-tarballs.patch \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3 pkgconfig
=20
diff --git a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools=
_git.bb b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_gi=
t.bb
index 22005632c2..ab9cebaf38 100644
--- a/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
+++ b/meta-networking/recipes-connectivity/bluez-tools/bluez-tools_git.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "\
 "
 SRCREV =3D "f65321736475429316f07ee94ec0deac8e46ec4a"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1=
.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.=
0.bb
index dfa7437ba8..835f33055a 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d=
69f5fce4486a80fdaf4a4263"
=20
 inherit cmake
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "lksctp-tools"
 PACKAGECONFIG[lksctp-tools] =3D "-DSCTP_SUPPORT=3Dtrue, -DSCTP_SUPPORT=3D=
false, lksctp-tools"
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.=
bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index a7e81213c3..06d78b9328 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/civetweb/civetweb.git;bra=
nch=3Dmaster;protocol=3Dhttps \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch=
 \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 # civetweb supports building with make or cmake (although cmake lacks fe=
w features)
 inherit cmake
diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb b/=
meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
index a8436ea84d..23a439a989 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
@@ -14,6 +14,5 @@ SRC_URI =3D "git://github.com/snort3/libdaq.git;protoco=
l=3Dhttps;branch=3Dmaster \
=20
 SRCREV =3D "434f205cbd45de0961cc42e541b5bf54569e912a"
=20
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${libdir}/daq/*.so"
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1=
.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index e458321e6e..8a33feec21 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] =3D "0ac416bb55997ca8632174fd10737fd=
61cdb8dba2752160a335775bc21
 UPSTREAM_CHECK_URI =3D "http://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+\.\d+\.(\d+?))/"
=20
-S =3D "${WORKDIR}/dhcp-4.4.3-P1"
+S =3D "${UNPACKDIR}/dhcp-4.4.3-P1"
=20
 inherit autotools-brokensep systemd pkgconfig
=20
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb =
b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index cc36fbd4f0..1dff38f0d5 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/tomaszmrugalski/dibbler;b=
ranch=3Dmaster;protocol=3Dhttps
            "
 PV =3D "1.0.1+1.0.2RC1+git${SRCREV}"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "debug bind-reuse resolvconf dns-update"
=20
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3=
.2.7.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.=
7.bb
index 5abdd97594..fea4d858ed 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.7.bb
@@ -48,7 +48,6 @@ CVE_STATUS[CVE-2011-4966] =3D "fixed-version: The CPE i=
n the NVD database doesn't
=20
 PARALLEL_MAKE =3D ""
=20
-S =3D "${WORKDIR}/git"
=20
 LDFLAGS:append:powerpc =3D " -latomic"
 LDFLAGS:append:mipsarch =3D " -latomic"
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.=
bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
index 75aaf521c4..f79121b142 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
@@ -10,7 +10,6 @@ SRCREV =3D "3dfbe889b1f65077efe579da34fc1d6819fcb7f3"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "libdnet-(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools multilib_script pkgconfig
=20
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850=
_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_=
1.5.3.bb
index 0e1f50164a..cfded66e41 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.=
bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.=
bb
@@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/mz-automation/${BPN}.git;=
branch=3Dv1.5;protocol=3Dhttps
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInsta=
llD.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig python3-dir python3native siteinfo
=20
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10=
.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index b6938b2991..950c1ff52d 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -22,7 +22,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a=
6c2f1ef1630d341e026d"
=20
 SECTION =3D "libs"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "2fc8413bfcb51354c8e679141b17b3f1a5942561"
 SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmbedtls-2.28 \
            file://run-ptest \
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1=
.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
index 1e99f92306..0b64d661c4 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
@@ -22,7 +22,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a=
6c2f1ef1630d341e026d"
=20
 SECTION =3D "libs"
=20
-S =3D "${WORKDIR}/git"
 SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmain;tag=3Dv${PV} \
            file://run-ptest \
            "
diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.b=
b b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
index c250ea8779..8dce6c5c4a 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
@@ -12,7 +12,6 @@ SECTION =3D "libs/networking"
 SRC_URI =3D "git://github.com/nanomsg/nanomsg.git;protocol=3Dhttps;branc=
h=3Dmaster"
 SRCREV =3D "fc3f684a80151a3319446fc96083a9ff384ee4fe"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb b/=
meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
index 9ae3b89371..8d681f495e 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da41e579bb4=
326c21c774f8e51e41d8a3"
 SRC_URI =3D "git://github.com/nanomsg/nng.git;branch=3Dmain;protocol=3Dh=
ttps"
 SRCREV =3D "85fbe7f9e4642b554d0d97f2e3ff2aa12978691a"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb b/=
meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
index b52154025b..aac26966f1 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
@@ -9,6 +9,5 @@ PV =3D "1.3.0"
=20
 SRC_URI =3D "git://github.com/cwzx/nngpp;branch=3Dmaster;protocol=3Dhttp=
s"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-fortisslvpn_1.4.0.bb b/meta-networking/recipes-connectivity/networ=
kmanager/networkmanager-fortisslvpn_1.4.0.bb
index 48f50abaf1..026aea7777 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
fortisslvpn_1.4.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
fortisslvpn_1.4.0.bb
@@ -16,7 +16,7 @@ SRC_URI =3D " \
 "
 SRC_URI[sha256sum] =3D "b055e26349b516b23585798ab3ef57b436b014800e92a8ac=
732cfc8e76c5dafa"
=20
-S =3D "${WORKDIR}/NetworkManager-fortisslvpn-${PV}"
+S =3D "${UNPACKDIR}/NetworkManager-fortisslvpn-${PV}"
=20
 # meta-gnome in layers is required using gnome:
 PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome,gtk+3 libnma libs=
ecret,"
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-openconnect_1.2.8.bb b/meta-networking/recipes-connectivity/networ=
kmanager/networkmanager-openconnect_1.2.8.bb
index ee19afbd11..6369d8d0ef 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openconnect_1.2.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openconnect_1.2.8.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "${GNOME_MIRROR}/NetworkManager-openconnect=
/${@gnome_verdir("${PV}")}/
=20
 SRC_URI[sha256sum] =3D "5dedaa785d82d8e239ddd082bfac5250c691e964464be180=
7b6827263633cdcc"
=20
-S =3D "${WORKDIR}/NetworkManager-openconnect-${PV}"
+S =3D "${UNPACKDIR}/NetworkManager-openconnect-${PV}"
=20
 # meta-gnome in layers is required using gnome:
 PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome,gtk+3 gcr3 libnma=
 libsecret,"
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-openvpn_1.12.0.bb b/meta-networking/recipes-connectivity/networkma=
nager/networkmanager-openvpn_1.12.0.bb
index 2d2055ba65..9859d01463 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openvpn_1.12.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openvpn_1.12.0.bb
@@ -15,7 +15,7 @@ SRC_URI:append:libc-musl =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'ld-is-lld',
=20
 SRC_URI[sha256sum] =3D "903fd4c0aebd2aa7ac70c9d8c2bed8df922655d22d764514=
403566ae89b7e886"
=20
-S =3D "${WORKDIR}/NetworkManager-openvpn-${PV}"
+S =3D "${UNPACKDIR}/NetworkManager-openvpn-${PV}"
=20
 # meta-gnome in layers is required using gnome:
 PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome,gtk+3 libnma libs=
ecret"
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.52.0.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.52.0.bb
index dd894c0900..b8c6a936ad 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.52.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.52.0.bb
@@ -47,7 +47,6 @@ SRC_URI:append:libc-musl =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'ld-is-lld',
=20
 SRCREV =3D "995a28fa1ccc54ad22e794294c3c6783cc3f30ed"
=20
-S =3D "${WORKDIR}/git"
=20
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
 NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??=3D "auto"
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect=
_9.12.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_9=
.12.bb
index 7d0e5f2052..e1027747b6 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.b=
b
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.b=
b
@@ -21,7 +21,6 @@ PACKAGECONFIG[libproxy]  =3D "--with-libproxy,--without=
-libproxy,libproxy,"
 # not config defaults
 PACKAGECONFIG[pcsc-lite] =3D "--with-libpcsclite,--without-libpcsclite,p=
csc-lite,"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig bash-completion
=20
diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortiv=
pn_1.23.1.bb b/meta-networking/recipes-connectivity/openfortivpn/openfort=
ivpn_1.23.1.bb
index 4e964b3448..9823d772a3 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23=
.1.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23=
.1.bb
@@ -12,7 +12,6 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'systemd', d)}"
 PACKAGECONFIG[resolvconf] =3D "--with-resolvconf=3D${base_sbindir}/resol=
vconf --enable-resolvconf,--with-resolvconf=3DDISABLED,,"
 PACKAGECONFIG[systemd] =3D "--with-systemdsystemunitdir=3D${systemd_syst=
em_unitdir},--without-systemdsystemunitdir,,"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig systemd
=20
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_=
git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.=
bb
index 3bca9df5ab..576c316ec3 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "gitsm://github.com/openthread/ot-br-posix.=
git;protocol=3Dhttps;branch=3Dm
            file://0001-Musl-build-fix.patch;patchdir=3Dthird_party/opent=
hread/repo \
            "
=20
-S =3D "${WORKDIR}/git"
 SYSTEMD_SERVICE:${PN} =3D "otbr-agent.service"
=20
 inherit pkgconfig cmake systemd
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_gi=
t.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
index 4456835410..009a6ef88c 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -14,7 +14,6 @@ PV =3D "0.1+git"
 SRC_URI =3D "git://github.com/openthread/openthread.git;protocol=3Dhttps=
;branch=3Dmain \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git=
.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index 6a84897426..9c64872917 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "gitsm://github.com/openthread/wpantund.git=
;protocol=3Dhttps;branch=3Dmast
            file://basename.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig perlnative autotools
=20
diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/=
meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 871df69909..17745da806 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -12,7 +12,6 @@ PV =3D "0.0.1+git"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.1=
3.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
index 9239bd81c2..841f7d5cf8 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://github.com/Stiffstream/restinio/re=
leases/download/v.${PV}/${B
 SRC_URI[md5sum] =3D "37a4310e98912030a74bdd4ed789f33c"
 SRC_URI[sha256sum] =3D "b35d696e6fafd4563ca708fcecf9d0cf6705c846d417b500=
0f5252e0188848e7"
=20
-S =3D "${WORKDIR}/${BP}/dev"
+S =3D "${UNPACKDIR}/${BP}/dev"
=20
 inherit cmake
=20
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb=
 b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
index 54eef87a41..e9169a050f 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/snort3/snort3.git;protoco=
l=3Dhttps;branch=3Dmaster \
=20
 SRCREV =3D "6a11279883a8584e06ad9ab2df162c639961cd61"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGES =3D+ "${PN}-scripts"
=20
diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta=
-networking/recipes-connectivity/vlan/vlan_1.9.bb
index b478692e39..845c3cf53c 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D "3b8f0a1bf0d3642764e5f646e1f3bbc=
8b1eeec474a77392d9aeb486884
 UPSTREAM_CHECK_URI =3D "http://vlan.sourcearchive.com/"
 UPSTREAM_CHECK_REGEX =3D "/(?P<pver>\d+(\.\d+)+)/"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 inherit update-alternatives
=20
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/me=
ta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 5876b58273..5d9d2634a0 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -29,7 +29,6 @@ PACKAGECONFIG[openssl] =3D ",,openssl"
=20
 PACKAGES =3D+ "${PN}-script"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit perlnative pkgconfig
=20
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.b=
b b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index b420795cee..af591cfd7a 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -20,7 +20,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "b077c81eb635392e694ccedbab8b644297ec0285"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools ptest
=20
diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb b/meta-=
networking/recipes-daemons/atftp/atftp_0.8.0.bb
index 41b7cf0878..eca004302b 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://git.code.sf.net/p/atftp/code;branch=3D=
master;protocol=3Dhttps \
            file://atftpd.service \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools update-rc.d systemd
=20
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-=
initiator-utils_2.1.11.bb b/meta-networking/recipes-daemons/iscsi-initiat=
or-utils/iscsi-initiator-utils_2.1.11.bb
index 5f88aea5f2..db4a4313a4 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiat=
or-utils_2.1.11.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiat=
or-utils_2.1.11.bb
@@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/open-iscsi/open-iscsi;bra=
nch=3Dmaster;protocol=3Dhttps \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
            "
-S =3D "${WORKDIR}/git"
=20
 inherit update-rc.d systemd autotools pkgconfig
=20
diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd=
-dispatcher_2.2.4.bb b/meta-networking/recipes-daemons/networkd-dispatche=
r/networkd-dispatcher_2.2.4.bb
index 7f06e0ebf3..e7db8a948b 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispat=
cher_2.2.4.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispat=
cher_2.2.4.bb
@@ -14,7 +14,6 @@ REQUIRED_DISTRO_FEATURES =3D "systemd gobject-introspec=
tion-data"
 SRCREV =3D "dfd26d72793914eb3da910ef8c71de6d7c8942a2"
 SRC_URI =3D "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=3Dh=
ttps;nobranch=3D1"
=20
-S =3D "${WORKDIR}/git"
=20
 SYSTEMD_PACKAGES =3D "${PN}"
 SYSTEMD_SERVICE:${PN} =3D "networkd-dispatcher.service"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb b/=
meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
index a9a2163a2f..a85176d871 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
@@ -32,7 +32,7 @@ SRC_URI[sha256sum] =3D "75868db7a8ed252cd3a14c13a3ce383=
ddd42563160c02027d061202ee3
=20
 UPSTREAM_CHECK_REGEX =3D "postfix\-(?P<pver>3\.10(\.\d+)+).tar.gz"
=20
-S =3D "${WORKDIR}/postfix-${PV}"
+S =3D "${UNPACKDIR}/postfix-${PV}"
=20
 CLEANBROKEN =3D "1"
=20
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb b/m=
eta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
index c6782fcdd3..65dd2f9561 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/proftpd/proftpd.git;branc=
h=3D${BRANCH};protocol=3Dhttps;
            file://proftpd.service \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
=20
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-ne=
tworking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index f2c300855c..be0652dfbd 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -34,7 +34,7 @@ SRC_URI[sha256sum] =3D "0dbf54dd2c178bd9fe62481d2c37513=
ee36636d8bf137cfdad96891490
=20
 UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/ptpd/files/relea=
ses"
=20
-S =3D "${WORKDIR}/ptpd-${PV}"
+S =3D "${UNPACKDIR}/ptpd-${PV}"
=20
 EXTRA_OEMAKE =3D ""
=20
diff --git a/meta-networking/recipes-daemons/vblade/vblade_25.bb b/meta-n=
etworking/recipes-daemons/vblade/vblade_25.bb
index 54bb798344..f73e72442b 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_25.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_25.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/OpenAoE/vblade;branch=3Dm=
aster;protocol=3Dhttps \
            file://volatiles.99_vblade \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/OpenAoE/vblade/archive/"
=20
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb b/=
meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
index 2793b900fe..a4e5f5ca46 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/obgm/libcoap.git;branch=3D=
main;protocol=3Dhttps \
            "
 SRCREV =3D "7cf7465b784baded4de183290c547d582becfd28"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools manpages pkgconfig ptest
=20
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.=
bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
index ba21c46055..fdef5473ef 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
@@ -20,7 +20,6 @@ SRCREV =3D "f7a64114b35fd8ee63ce07290f8a2dffd52b215f"
 SRC_URI =3D "git://github.com/secdev/scapy.git;branch=3Dmaster;protocol=3D=
https \
            file://run-ptest"
=20
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb b/meta-net=
working/recipes-extended/dlm/dlm_4.2.0.bb
index 93d293493c..b7966d7f12 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_REGEX =3D "dlm-(?P<pver>\d+(\.\d+)+)"
 LICENSE =3D "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://README.license;md5=3D8f0bbcdd678df1bce98634=
92b6c8832d"
=20
-S =3D "${WORKDIR}/dlm-dlm-${PV}"
+S =3D "${UNPACKDIR}/dlm-dlm-${PV}"
=20
 DEPENDS +=3D "corosync"
=20
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb=
 b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
index cbd5e7a0fd..06b2fa4d2d 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_URI =3D "https://github.com/kronosnet/kr=
onosnet/releases"
=20
 inherit autotools pkgconfig
=20
-S =3D "${WORKDIR}/git"
=20
 # libknet/transport_udp.c:326:48: error: comparison of integers of diffe=
rent signs: 'unsigned long' and 'int' [-Werror,-Wsign-compare]
 # for (cmsg =3D CMSG_FIRSTHDR(&msg);cmsg; cmsg =3D CMSG_NXTHDR(&msg, cms=
g)) {
diff --git a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb b/meta-ne=
tworking/recipes-extended/tgt/tgt_1.0.90.bb
index e816b79e87..a110d556a3 100644
--- a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
@@ -17,7 +17,6 @@ SRC_URI +=3D "file://tgtd.init \
             file://tgtd \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 CONFFILES:${PN} +=3D "${sysconfdir}/tgt/targets.conf"
=20
diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-i=
ptables-firewall_2.1.2.bb b/meta-networking/recipes-filter/arno-iptables-=
firewall/arno-iptables-firewall_2.1.2.bb
index 940454c3ac..20ba132fd0 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables=
-firewall_2.1.2.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables=
-firewall_2.1.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://gpl_license.txt;md5=3D11c7b6=
5c4a4acb9d5175f7e9bf99c403"
 SRCREV =3D "c8dfd85b9e8e453e279525f30c1e3184c092f036"
 SRC_URI =3D "git://github.com/arno-iptables-firewall/aif;branch=3Dmaster=
;protocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit systemd
=20
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acc=
t_1.0.3.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acc=
t_1.0.3.bb
index d92c676fa9..880d962eb3 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3=
.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3=
.bb
@@ -12,6 +12,6 @@ SRC_URI =3D "http://ftp.netfilter.org/pub/libnetfilter_=
acct/libnetfilter_acct-1.0.
 SRC_URI[md5sum] =3D "814b2972b2f5c740ff87510bc109168b"
 SRC_URI[sha256sum] =3D "4250ceef3efe2034f4ac05906c3ee427db31b9b0a2df41b2=
744f4bf79a959a1a"
=20
-S =3D "${WORKDIR}/libnetfilter_acct-${PV}"
+S =3D "${UNPACKDIR}/libnetfilter_acct-${PV}"
=20
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-con=
ntrack_1.1.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilte=
r-conntrack_1.1.0.bb
index 83533832d4..08d3ab691c 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_=
1.1.0.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_=
1.1.0.bb
@@ -11,6 +11,6 @@ SRC_URI =3D "https://www.netfilter.org/projects/libnetf=
ilter_conntrack/files/libne
=20
 SRC_URI[sha256sum] =3D "67edcb4eb826c2f8dc98af08dabff68f3b3d0fe6fb7d9d0a=
c1ee7ecce0fe694e"
=20
-S =3D "${WORKDIR}/libnetfilter_conntrack-${PV}"
+S =3D "${UNPACKDIR}/libnetfilter_conntrack-${PV}"
=20
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cth=
elper_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter=
-cthelper_1.0.1.bb
index ebb0eb2329..9a0d6cabbd 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1=
.0.1.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1=
.0.1.bb
@@ -12,6 +12,6 @@ SRC_URI =3D "https://www.netfilter.org/projects/libnetf=
ilter_cthelper/files/libnet
 SRC_URI[md5sum] =3D "e59279645fe65d40dd7dfc82a797ca5b"
 SRC_URI[sha256sum] =3D "14073d5487233897355d3ff04ddc1c8d03cc5ba8d2356236=
aa88161a9f2dc912"
=20
-S =3D "${WORKDIR}/libnetfilter_cthelper-${PV}"
+S =3D "${UNPACKDIR}/libnetfilter_cthelper-${PV}"
=20
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-ctt=
imeout_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilte=
r-cttimeout_1.0.1.bb
index 5349e6e4b8..46576f4d32 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_=
1.0.1.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_=
1.0.1.bb
@@ -11,6 +11,6 @@ SRC_URI =3D "https://www.netfilter.org/projects/libnetf=
ilter_cttimeout/files/libne
 SRC_URI[md5sum] =3D "ac64b55952b79cb9910db95ce8883940"
 SRC_URI[sha256sum] =3D "0b59da2f3204e1c80cb85d1f6d72285fc07b01a2f5678abf=
5dccfbbefd650325"
=20
-S =3D "${WORKDIR}/libnetfilter_cttimeout-${PV}"
+S =3D "${UNPACKDIR}/libnetfilter_cttimeout-${PV}"
=20
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log=
_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_=
1.0.2.bb
index 699b096ae8..a6e6b9b153 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.=
bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.=
bb
@@ -9,6 +9,5 @@ SRCREV =3D "b0e4be94c0b8f68d4e912402b93a130063c34e17"
=20
 SRC_URI =3D "git://git.netfilter.org/libnetfilter_log;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-que=
ue_1.0.5.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-qu=
eue_1.0.5.bb
index 301dd86cf3..ccaa80f5ff 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.=
5.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.=
5.bb
@@ -11,7 +11,6 @@ SRCREV =3D "2ff321690b8dafeca99ee8e9cafac71e36f292b9"
 SRC_URI =3D "git://git.netfilter.org/libnetfilter_queue;branch=3Dmaster =
\
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb b/=
meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
index 4a5435a743..abcebceab8 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://git.netfilter.org/libnftnl;branch=3Dma=
ster;tag=3D${BP} \
            "
 SRCREV =3D "17190762f33f78090f5ff99a436c4cb866ac3ccd"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig ptest
=20
diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb b/meta=
-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
index 635fa6a408..febcf5147c 100644
--- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "git://git.netfilter.org/ulogd2;branch=3Dma=
ster \
 "
 SRCREV =3D "79aa980f2df9dda0c097e8f883a62f414b9e5138"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools manpages pkgconfig systemd update-rc.d
=20
diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networki=
ng/recipes-irc/znc/znc_1.8.2.bb
index 48a5426572..7356115d53 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "gitsm://github.com/znc/znc.git;branch=3Dmast=
er;protocol=3Dhttps"
=20
 SRCREV =3D "bf253640d33d03331310778e001fb6f5aba2989e"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep pkgconfig
=20
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/met=
a-networking/recipes-kernel/wireguard/wireguard.inc
index 5659a20bd2..9afe009bea 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -10,4 +10,4 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
=20
-S =3D "${WORKDIR}/git/src"
+S =3D "${UNPACKDIR}/${BP}/src"
diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb b/=
meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
index a799ad197e..cc69f1448a 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
@@ -17,7 +17,6 @@ SRCREV =3D "3d61ea1e843e2c5f9706c74d1adad4e1d24d44b9"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "babeld-(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE +=3D "CFLAGS=3D'${CFLAGS}'"
=20
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_=
1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.=
5.0.bb
index 15368a9a3d..89b2572c04 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.b=
b
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.b=
b
@@ -27,7 +27,6 @@ SRC_URI =3D "git://github.com/freeDiameter/freeDiameter=
;protocol=3Dhttps;branch=3Dmast
     file://0001-fixes-for-gcc-15.patch \
     "
=20
-S =3D "${WORKDIR}/git"
=20
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D868c059b6147748b1d621e500feea=
c4f"
diff --git a/meta-networking/recipes-protocols/frr/frr_10.3.bb b/meta-net=
working/recipes-protocols/frr/frr_10.3.bb
index be2d986fc3..f0f3f34ab3 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.3.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "frr-(?P<pver>\d+(\.\d+)=
+)$"
=20
 CVE_PRODUCT =3D "frrouting"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep python3native pkgconfig useradd systemd
=20
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb b=
/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
index b6efa528d4..f7c8f17800 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
@@ -27,7 +27,6 @@ SRCREV =3D "3a0deda2995d98243dae379bcec10e57928c15e8"
 #
 # We can't use the approach of setting ${S} to mDNSPosix as we need
 # DEBUG_PREFIX_MAP to cover files which come from the Clients directory =
too.
-S =3D "${WORKDIR}/git"
=20
 inherit github-releases manpages systemd update-rc.d
=20
diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb =
b/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
index 1fde165c4f..0bb838a6b7 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
@@ -21,7 +21,6 @@ SRC_URI =3D " \
     file://0001-fix-build-do-not-install-git-files.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake python3native
=20
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b=
/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 0061565f90..1588245f8a 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -37,7 +37,6 @@ EXTRA_OECONF +=3D " \
                 "
 DEPENDS:append:libc-musl =3D " libexecinfo"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep pkgconfig
=20
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb=
 b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
index 010cd5af84..ad72b5cdde 100644
--- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
@@ -5,7 +5,6 @@ HOMEPAGE =3D "http://open-lldp.org/start"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2bc283e65df398ced5f5b747e78=
162"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig autotools
 inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', ''=
, d)}
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10=
.0.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
index cabe18ef8a..a19b313cc3 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/sourceforge/pptpclie=
nt/pptp-${PV}.tar.gz \
 SRC_URI[md5sum] =3D "8d25341352fdae5ad5b36b9f18254908"
 SRC_URI[sha256sum] =3D "82492db8e487ce73b182ee7f444251d20c44f5c26d6e96c5=
53ec7093aefb5af4"
=20
-S =3D "${WORKDIR}/pptp-${PV}"
+S =3D "${UNPACKDIR}/pptp-${PV}"
=20
 EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
=20
diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb =
b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index 8099fa5c6e..2cbb025049 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -21,7 +21,7 @@ inherit autotools-brokensep
 LIBS:append:libc-musl =3D " -lssp_nonshared"
 LIBS:append:libc-glibc =3D " -lc_nonshared"
=20
-S =3D "${WORKDIR}/tsocks-1.8"
+S =3D "${UNPACKDIR}/tsocks-1.8"
=20
 FILES:${PN} =3D "${libdir}/* ${bindir}/tsocks"
 FILES:${PN}-dev =3D ""
diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/m=
eta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index 3769d5cab0..8f21620584 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -6,7 +6,6 @@ SRCREV =3D "848eca82f92273af9a79687a90343a2ebcf3481d"
 SRC_URI =3D "git://github.com/sctplab/usrsctp;protocol=3Dhttps;branch=3D=
master \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb b=
/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
index f227ab749b..6b61349a66 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
@@ -26,7 +26,6 @@ COMPATIBLE_HOST:libc-musl =3D 'null'
=20
 DEPENDS =3D "boost dlt-daemon googletest"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/=
meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
index 0b7887dacb..e1638bfa19 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
@@ -15,7 +15,6 @@ SRCREV =3D "1ef2a025981223c1e16fc833bef226c86ff8c295"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/xelerance/xl2tpd/releases"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit update-rc.d
=20
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b=
/meta-networking/recipes-support/arptables/arptables_git.bb
index f9dd66f605..be2cfb0816 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -14,7 +14,6 @@ SRC_URI =3D " \
 SRC_URI[arptables.md5sum] =3D "1d4ab05761f063b0751645d8f2b8f8e5"
 SRC_URI[arptables.sha256sum] =3D "e529fd465c67d69ad335299a043516e6b38cdc=
d337a5ed21718413e96073f928"
=20
-S =3D "${WORKDIR}/git"
 SYSTEMD_SERVICE:${PN} =3D "arptables.service"
=20
 inherit systemd
diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb b/meta-netw=
orking/recipes-support/bmon/bmon_4.0.bb
index c974d54fe8..f47069471a 100644
--- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
+++ b/meta-networking/recipes-support/bmon/bmon_4.0.bb
@@ -9,4 +9,3 @@ SRC_URI =3D "git://github.com/tgraf/bmon.git;branch=3Dmas=
ter;protocol=3Dhttps"
=20
 inherit autotools pkgconfig
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.=
7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.=
bb
index e213cd2c60..59e3dbae5f 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "\
     file://0004-cleanup-includes.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "kernel:bridge-utils"
=20
diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/met=
a-networking/recipes-support/celt051/celt051_git.bb
index 4842a0fbdf..a9a664c196 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "git://gitlab.xiph.org/xiph/celt.git;branch=
=3Dcompat-v0.5.1;protocol=3Dhtt
            file://0001-tests-Include-entcode.c-into-test-sources-to-prov=
ide.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig autotools-brokensep
=20
diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb b/met=
a-networking/recipes-support/cifs/cifs-utils_7.0.bb
index c78bbae7b8..e2918503be 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
 SRCREV =3D "316522036133d44ed02cd39ed2748e2b59c85b30"
 SRC_URI =3D "git://git.samba.org/cifs-utils.git;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
 DEPENDS +=3D "libtalloc"
=20
 PACKAGECONFIG ??=3D ""
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/met=
a-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index cacdc9773b..25ea1fdefb 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/jpbarrette/curlpp.git;bra=
nch=3Dmaster;protocol=3Dhttps \
=20
 SRCREV =3D "592552a165cc569dac7674cb7fc9de3dc829906f"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig binconfig
=20
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb b/=
meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
index ab515603f5..09dc517c85 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
@@ -18,7 +18,6 @@ SRCREV_drbd-headers =3D "94f4472513f351efba5788f783feba=
6ac6efe9fc"
=20
 SRCREV_FORMAT =3D "drbd-utils_drbd-headers"
=20
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/LINBIT/drbd-utils/releases"
=20
diff --git a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb=
 b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
index baa9398a18..badeed8e82 100644
--- a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
+++ b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/nhorman/dropwatch.git;pro=
tocol=3Dhttps;nobranch=3D1 \
 "
 SRCREV =3D "1e7e487a019a7c02f1f429c4d3a4647fa3787a13"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "binutils libnl libpcap readline"
=20
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb=
 b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 723d7c8f78..d5dc10a889 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -25,7 +25,6 @@ SRC_URI =3D "gitsm://github.com/Ettercap/ettercap;branc=
h=3Dmaster;protocol=3Dhttps \
=20
 SRCREV =3D "7281fbddb7da7478beb1d21e3cb105fff3778b31"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D " \
     -DCMAKE_SKIP_RPATH=3DTRUE \
diff --git a/meta-networking/recipes-support/fping/fping_5.3.bb b/meta-ne=
tworking/recipes-support/fping/fping_5.3.bb
index d5f77d7c5a..5f3ec67cfc 100644
--- a/meta-networking/recipes-support/fping/fping_5.3.bb
+++ b/meta-networking/recipes-support/fping/fping_5.3.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc6170fbadddf=
cd74f011515291d96901"
 SRC_URI =3D "http://www.fping.org/dist/fping-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "d57bd0141aea082e3adfc198bfc3db5dfd12a7014c7c2655=
e97f61cd54901d0e"
=20
-S =3D "${WORKDIR}/fping-${PV}"
+S =3D "${UNPACKDIR}/fping-${PV}"
=20
 inherit autotools
=20
diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/m=
eta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index 8e23b66c48..9c2535b95b 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -9,7 +9,6 @@ SECTION =3D "libdevel"
 LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4f3ea6e9b28af88dc0321190a1f8=
250"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "4cdfdc38eca237c19c22a8b90490446ce6d970fa"
 SRC_URI =3D "git://github.com/maxmind/geoip-api-perl.git;branch=3Dmain;p=
rotocol=3Dhttps \
     file://run-ptest \
diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta=
-networking/recipes-support/geoip/geoip_1.6.12.bb
index a054ef0147..7482dba64a 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -36,7 +36,6 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad \
                     file://LICENSE;md5=3D0388276749a542b0d611601fa7c1dcc=
8 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.=
4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
index 528289b7fd..7def915db5 100644
--- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-MIT;md5=3D9bfa835d=
048c194ab30487af8d7b3778"
 SRC_URI =3D "git://github.com/nodejs/http-parser.git;branch=3Dmaster;pro=
tocol=3Dhttps"
 SRCREV =3D "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "PLATFORM=3Dlinux"
=20
diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb =
b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
index b41eb78374..bc0975ecc1 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dacc89=
812938cf9ad6b1debc37cea0253
 SRCREV =3D "62e60904afbe58fda0c7104fdad1c4f618266ba6"
 SRC_URI =3D "git://salsa.debian.org/debian/ifenslave.git;protocol=3Dhttp=
s;branch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     install -m 0755 -D ${S}/debian/ifenslave.if-pre-up ${D}${sysconfdir}=
/network/if-pre-up.d/ifenslave
diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb b/met=
a-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
index 055c6e1432..18970751c3 100644
--- a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
@@ -9,6 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 SRC_URI =3D "git://gitlab.com/ipcalc/ipcalc.git;protocol=3Dhttps;branch=3D=
master"
 SRCREV =3D "c341e55be386649c0a5347eefeae410753c4e753"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson
diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb b/me=
ta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
index 93fdb78eba..8af763fee9 100644
--- a/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
+++ b/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
@@ -11,7 +11,6 @@ DEPENDS =3D "curl openssl"
 SRC_URI =3D "git://github.com/libcpr/cpr.git;protocol=3Dhttps;branch=3D1=
.10.x"
 SRCREV =3D "3b15fa82ea74739b574d705fea44959b58142eb8"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b=
/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
index 3d0764a3b9..50f83221c0 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/libesmtp/libESMTP.git;bra=
nch=3Dmaster;protocol=3Dhttps \
            file://0001-Add-build-option-for-NTLM-support.patch"
 SRCREV =3D "1d0af244310a66943ab400be56b15a9087f181eb"
=20
-S =3D "${WORKDIR}/git"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742 \
                     file://COPYING.GPL;md5=3D393a5ca445f6965873eca0259a1=
7f833"
diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb b/met=
a-networking/recipes-support/libldb/libldb_2.8.1.bb
index 2040d016e5..dbb27e6ba6 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
@@ -38,7 +38,7 @@ SRC_URI[sha256sum] =3D "b68ce6eb0ccd2870fa3c8c334f2028b=
5d16606fd41308696c17b71959f
=20
 inherit pkgconfig waf-samba ptest
=20
-S =3D "${WORKDIR}/ldb-${PV}"
+S =3D "${UNPACKDIR}/ldb-${PV}"
=20
 # Cross_compile cannot use preforked process, since fork process earlier=
 than point subproces.popen
 # to cross Popen
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb=
 b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
index c7f6f1fb31..ff36a61d15 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG[valgrind] =3D "--with-valgrind,--without-=
valgrind,valgrind"
=20
 SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://=
avoid-attr-unless-wanted.patch', d)}"
=20
-S =3D "${WORKDIR}/talloc-${PV}"
+S =3D "${UNPACKDIR}/talloc-${PV}"
=20
 # Cross_compile cannot use preforked process, since fork process earlier=
 than point subproces.popen
 # to cross Popen
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb b/me=
ta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
index 2f8be7fe61..7221130fe6 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[libbsd] =3D "--with-libbsd,--without-libb=
sd,libbsd"
 PACKAGECONFIG[libcap] =3D "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] =3D "--with-valgrind,--without-valgrind,valgrind=
"
=20
-S =3D "${WORKDIR}/tdb-${PV}"
+S =3D "${UNPACKDIR}/tdb-${PV}"
=20
 inherit waf-samba pkgconfig ptest
=20
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.2.b=
b b/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
index f38ca3a836..36364b8874 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG[valgrind] =3D "--with-valgrind,--without-=
valgrind,valgrind"
=20
 SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://=
avoid-attr-unless-wanted.patch', d)}"
=20
-S =3D "${WORKDIR}/tevent-${PV}"
+S =3D "${UNPACKDIR}/tevent-${PV}"
=20
 # Cross_compile cannot use preforked process, since fork process earlier=
 than point subproces.popen
 # to cross Popen
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.21.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.2=
1.bb
index 1300fc658d..407194792f 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
@@ -17,7 +17,6 @@ SRC_URI =3D " \
     file://v6test.sh \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 BBCLASSEXTEND =3D "native"
=20
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_gi=
t.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index f0b7e9184e..b442fb9f56 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/linux-wpan/lowpan-tools;b=
ranch=3Dmaster;protocol=3Dhttps
            "
 SRCREV =3D "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools python3-dir pkgconfig
=20
diff --git a/meta-networking/recipes-support/mctp/mctp_2.1.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.1.bb
index c76fc09af3..04fecf7aca 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.1.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.1.bb
@@ -10,7 +10,6 @@ SRCREV =3D "dd944cf5b5a8b834f3685bcb2017190258dbcd0b"
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https \
            file://0001-mctp-bench-Adjust-headers.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig systemd
=20
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.=
1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
index 9a00d66a52..52e7e53c32 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
@@ -3,7 +3,6 @@ require mdio-tools.inc
 DEPENDS +=3D "virtual/kernel libmnl"
 # This module requires Linux 5.6 higher
=20
-S =3D "${WORKDIR}/git"
=20
 inherit module
=20
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.=
bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
index 457064c019..2c8f9b8c37 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
@@ -2,7 +2,6 @@ require mdio-tools.inc
=20
 DEPENDS +=3D "virtual/kernel libmnl"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig autotools
=20
diff --git a/meta-networking/recipes-support/mtr/mtr_0.95.bb b/meta-netwo=
rking/recipes-support/mtr/mtr_0.95.bb
index 92f9c4bfc0..ac8b48e4e5 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.95.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.95.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
 SRCREV =3D "852e5617fbf331cf292723702161f0ac9afe257c"
 SRC_URI =3D "git://github.com/traviscross/mtr;branch=3Dmaster;protocol=3D=
https"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb b/m=
eta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
index cdf2677f13..1c9db1e956 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/libguestfs/nbdkit.git;pro=
tocol=3Dhttps;branch=3Dmaster \
            file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.pat=
ch"
 SRCREV =3D "6c02c6a469d62a047f230b0ccf03f72328312d2b"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "curl xz e2fsprogs zlib"
=20
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb b/m=
eta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
index 2a122ec282..9e7bdc9966 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://gitlab.com/nbdkit/nbdkit.git;protoco=
l=3Dhttps;branch=3Dmaster;tag=3Dv
            "
 SRCREV =3D "2d0f232b590f4001881dd0819f55af72b88c4b2f"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "curl xz e2fsprogs zlib"
=20
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb b/met=
a-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
index 21579d64c1..6931c64d4a 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://git.remlab.net/git/ndisc6.git;protoc=
ol=3Dhttp;branch=3Dmaster \
            file://0001-Remove-use-of-variables-indicating-buildtime-info=
rma.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "coreutils-native"
=20
diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-=
networking/recipes-support/netcf/netcf_0.2.8.bb
index c68974f9f0..cddb0ead2f 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -18,7 +18,6 @@ DEPENDS +=3D "augeas libnl libxslt libxml2"
=20
 do_configure[depends] +=3D "${MLPREFIX}gnulib:do_populate_sysroot"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit gettext autotools perlnative pkgconfig systemd
=20
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/met=
a-networking/recipes-support/netperf/netperf_git.bb
index 151f243c27..4043da5621 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/HewlettPackard/netperf.gi=
t;branch=3Dmaster;protocol=3Dht
=20
 SRCREV =3D "3bc455b23f901dae377ca0a558e1e32aa56b31c4"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit update-rc.d autotools texinfo systemd
=20
diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.=
8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
index 341eab015c..58ace6263d 100644
--- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
+++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
@@ -10,7 +10,6 @@ SRC_URI =3D " \
 	file://0001-Cmds-automatically-create-folder.patch \
 	"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb b/meta=
-networking/recipes-support/nis/yp-tools_4.2.3.bb
index 9b2c186873..54fd68ed43 100644
--- a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
@@ -18,7 +18,6 @@ SRC_URI =3D "git://github.com/thkukuk/yp-tools;branch=3D=
master;protocol=3Dhttps \
            file://domainname.service \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "libtirpc libnsl2 virtual/crypt"
=20
diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-=
networking/recipes-support/ntimed/ntimed_git.bb
index 955c03f42d..36fba5f57b 100644
--- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
+++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/bsdphk/Ntimed;branch=3Dma=
ster;protocol=3Dhttps \
 PV =3D "0.0+git"
 SRCREV =3D "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
=20
-S =3D "${WORKDIR}/git"
=20
 # use adjtimex on musl
 CFLAGS:append:libc-musl =3D " -Dntp_adjtime=3Dadjtimex"
diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-ne=
tworking/recipes-support/ntopng/ndpi_4.2.bb
index ae5139c948..f0175167a4 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/ntop/nDPI.git;branch=3D4.=
2-stable;protocol=3Dhttps \
            file://0001-autogen.sh-not-generate-configure.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep pkgconfig
=20
diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/met=
a-networking/recipes-support/ntopng/ntopng_5.2.1.bb
index 9bb93910f8..014706893a 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
@@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/ntop/ntopng.git;protocol=3D=
https;branch=3D5.2-stable \
            file://ntopng.service \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 # don't use the lua under thirdparty as it supports cross compiling badl=
y
 export LUA_LIB =3D "${STAGING_LIBDIR}/liblua.a"
diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/met=
a-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
index b02f775a55..5d346a4c67 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
@@ -18,8 +18,7 @@ SRC_URI =3D "http://nuttcp.net/${BPN}/beta/${BP}.c \
 SRC_URI[md5sum] =3D "d3c92c4d2f261221193c3726c1b9a42f"
 SRC_URI[sha256sum] =3D "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f25=
11ac2586d236c8a1"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_compile () {
     ${CC} ${CFLAGS} ${LDFLAGS} -o nuttcp nuttcp-${PV}.c
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb=
 b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
index 24c520901d..5c38f6b5dc 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/open-iscsi/open-isns;bran=
ch=3Dmaster;protocol=3Dhttps \
=20
 SRCREV =3D "c0e6d9fedc5a7041260de477fe1a8455fa074113"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit systemd autotools-brokensep update-rc.d
=20
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_=
12.5.0.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_1=
2.5.0.bb
index 0288a59458..fa26a759dc 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.=
bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.=
bb
@@ -53,7 +53,7 @@ SRC_URI:append:libc-musl =3D " file://0001-Add-resolv_c=
ompat.h-for-musl-builds.pat
=20
 SRCREV =3D "f2ca37ef3510543172657b82493d1eceefa9a134"
=20
-S =3D "${WORKDIR}/git/open-vm-tools"
+S =3D "${UNPACKDIR}/${BP}/open-vm-tools"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native util-linux libdnet procps libtirpc=
"
=20
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb =
b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
index 74c5ef220d..86b24c1795 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
@@ -32,7 +32,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${=
PV}.tar.gz \
            file://ipmi.service \
            "
=20
-S =3D "${WORKDIR}/OpenIPMI-${PV}"
+S =3D "${UNPACKDIR}/OpenIPMI-${PV}"
=20
 SRC_URI[sha256sum] =3D "a0403148fa5f7bed930c958a4d1c558047e273763a408b3a=
0368edc137cc55d9"
=20
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb b/m=
eta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
index 7b51fc558e..bdd715aacf 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "https://www.pgpool.net/mediawiki/images/pg=
pool-II-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] =3D "25ed340d7b7dc00c20e4ba763d3f9c07ba891b150d9d48af=
313a1351cafdd778"
=20
-S =3D "${WORKDIR}/pgpool-II-${PV}"
+S =3D "${UNPACKDIR}/pgpool-II-${PV}"
=20
 inherit autotools-brokensep systemd
=20
diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-ne=
tworking/recipes-support/phytool/phytool.bb
index b918e50c68..6471f46c28 100644
--- a/meta-networking/recipes-support/phytool/phytool.bb
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -6,7 +6,6 @@ PV =3D "2+git"
 SRCREV =3D "8882328c08ba2efb13c049812098f1d0cb8adf0c"
 SRC_URI =3D "git://github.com/wkz/phytool.git;branch=3Dmaster;protocol=3D=
https"
=20
-S =3D "${WORKDIR}/git"
=20
 # The Makefile has "$PREFIX/bin" hardcoded into it, hence not using $bin=
dir here
 do_install() {
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb =
b/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
index 0c204c109f..2555c43a85 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/linux-rdma/rdma-core.git;=
branch=3Dmaster;protocol=3Dhttp
            file://0001-librdmacm-Use-overloadable-function-attribute-wit=
h-c.patch \
 "
 SRCREV =3D "6cd09097ad2eebde9a7fa3d3bb09a2cea6e3c2d6"
-S =3D "${WORKDIR}/git"
=20
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/maste=
r/COPYING.md
 LICENSE =3D "BSD-2-Clause | GPL-2.0-only"
diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb b=
/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
index 950f6a2e21..bb12d7a907 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.7.bb
@@ -8,6 +8,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
 SRCREV =3D "b315d06ddb0dad16a52fe91e5831b4030ce37010"
 SRC_URI =3D "git://github.com/troglobit/smcroute.git;branch=3Dmaster;pro=
tocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb b/met=
a-networking/recipes-support/sngrep/sngrep_1.8.2.bb
index 518ca9e277..12fe3ececa 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
@@ -18,7 +18,6 @@ DEPENDS =3D "\
 SRC_URI =3D "git://github.com/irontec/sngrep.git;protocol=3Dhttps;branch=
=3Dmaster"
 SRCREV =3D "dad1033640f249fa4994f976cf6ee96826c15702"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/m=
eta-networking/recipes-support/spice/libcacard_2.8.1.bb
index 65f2f80ace..1a2d9dc9c4 100644
--- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
@@ -8,7 +8,6 @@ SRCREV =3D "7b07684ea6698d4885ff2062350ad8798a04de42"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3D=
https;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 4ef39f0904..3588d674f7 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice=
-gtk.git;protocol=3Dhttps;bra
=20
 CVE_STATUS[CVE-2012-4425] =3D "fixed-version: fixed since 0.15.3"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.=
22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.=
1.bb
index 3af973eed1..b13dd5d148 100644
--- a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
+++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
@@ -7,7 +7,6 @@ SRCREV =3D "aa08162f036840d3e33502dc0a836b03b9cec97c"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/spice/linux/vd_agent.git;proto=
col=3Dhttps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl x11"
diff --git a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.=
bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
index 3c8458baac..7f08eebee7 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
@@ -12,7 +12,6 @@ SRCREV =3D "6f453a775d87087c6ba59fc180c1a1e466631a47"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/spice/spice-protocol.git;proto=
col=3Dhttps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
index fc83be415e..c9418a1765 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -19,7 +19,6 @@ SRCREV =3D "0c2c1413a8b387ea597a95b6c867470a7c56c8ab"
=20
 SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;=
protocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_STATUS[CVE-2016-0749] =3D "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2016-2150] =3D "fixed-version: patched since 0.13.2"
diff --git a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb b/m=
eta-networking/recipes-support/spice/usbredir_0.14.0.bb
index 82f48ccdb8..81c7fdf0c8 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
@@ -11,7 +11,6 @@ SRCREV =3D "2d373432e604960c1dcc14fb97098febe4d64025"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/spice/usbredir;branch=3Dmain;p=
rotocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb b/=
meta-networking/recipes-support/unbound/unbound_1.22.0.bb
index c434ca181f..c35148b77e 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
@@ -26,7 +26,6 @@ inherit autotools pkgconfig systemd update-rc.d ptest
 DEPENDS =3D "openssl libtool-native bison-native expat"
 RDEPENDS:${PN} =3D "bash openssl-bin daemonize"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF =3D "--with-libexpat=3D${STAGING_EXECPREFIXDIR} \
                 --disable-rpath --with-ssl=3D${STAGING_EXECPREFIXDIR} \
diff --git a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb b/m=
eta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
index c3de38a6f8..4857c0af4f 100644
--- a/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
+++ b/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
@@ -22,7 +22,6 @@ EXTRA_OEMAKE =3D "\
     CC=3D'${CC}' CFLAGS=3D'${CFLAGS} -pthread -I${STAGING_INCDIR}/libnl3=
' \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 # wavemon does not support using out-of-tree builds
 inherit autotools-brokensep pkgconfig
diff --git a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.b=
b b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
index a0f9fb8b50..2f5ebe53ae 100644
--- a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
+++ b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
@@ -11,6 +11,5 @@ DEPENDS =3D "libnl"
 SRC_URI =3D "git://github.com/linux-wpan/wpan-tools;branch=3Dmaster;prot=
ocol=3Dhttps"
 SRCREV =3D "91b0f038aef2f62cb6a222d190b887fdfd6bc164"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.=
bbclass
index 76e7241820..63bc24f689 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -127,8 +127,7 @@ python __anonymous() {
             d.setVar('EXTERNAL_KERNEL_DEVICETREE', '${RECIPE_SYSROOT}/bo=
ot/devicetree')
 }
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
 B =3D "${WORKDIR}/build"
=20
 #
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-uti=
ls/spdm-utils_0.7.2.bb b/meta-oe/dynamic-layers/clang-layer/recipes-devto=
ols/spdm-utils/spdm-utils_0.7.2.bb
index 64cd1d928a..ba6ad09098 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm=
-utils_0.7.2.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm=
-utils_0.7.2.bb
@@ -16,7 +16,6 @@ SRC_URI +=3D "git://github.com/westerndigitalcorporatio=
n/spdm-utils.git;protocol=3Dh
 include spdm-utils-crates.inc
=20
 SRCREV =3D "f67ac9e00b79f603ecbbd29928a4ecc3dec5abd5"
-S =3D "${WORKDIR}/git"
=20
 # bindgen-cli comes from meta-clang and depends on libclang
 DEPENDS +=3D "libspdm udev bindgen-cli-native pciutils"
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-prov=
isioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/=
clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-too=
ls_1.1.0.bb
index a60ca11244..3ec7d486fa 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.1.0.bb
@@ -5,7 +5,6 @@ LICENSE =3D "GPL-3.0-only"
 SECTION =3D "devel"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
-S =3D "${WORKDIR}/git"
=20
 SRC_URI =3D " \
     git://github.com/jthornber/thin-provisioning-tools;branch=3Dmain;pro=
tocol=3Dhttps \
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1=
.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
index 90c9a7147c..a32c9403c8 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -20,7 +20,6 @@ SRCREV =3D "8416326777b2aada0706539b8f9f6acefa476b16"
 SRC_URI =3D "git://github.com/tomba/rwmem.git;protocol=3Dhttps;name=3Drw=
mem;branch=3Dmaster \
            file://0001-include-missing-cstdint.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig python3native
=20
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netp=
lan/netplan_1.1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connect=
ivity/netplan/netplan_1.1.2.bb
index 69c2165ab1..ef1945b4fe 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/net=
plan_1.1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/net=
plan_1.1.2.bb
@@ -22,7 +22,6 @@ SRC_URI:append:libc-musl =3D " file://0001-don-t-fail-i=
f-GLOB_BRACE-is-not-defined
=20
 SRCREV =3D "01045f683b9419beb90119497cd1b2be44e83b8e"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "glib-2.0 libyaml util-linux-libuuid \
            systemd python3-cffi-native \
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongo=
db_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongod=
b_git.bb
index cacf211034..23515d9fa8 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.=
bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.=
bb
@@ -48,7 +48,6 @@ SRC_URI:append:toolchain-clang =3D "\
            file://0001-asio-Dont-use-experimental-with-clang.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_STATUS[CVE-2014-8180] =3D "not-applicable-config: Not affecting our =
configuration so it can be safely ignored."
 CVE_STATUS[CVE-2017-2665] =3D "not-applicable-config: Not affecting our =
configuration so it can be safely ignored."
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/n=
anopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/na=
nopb.inc
index 371d66bdfe..4fe3995cd5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.i=
nc
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.i=
nc
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D9db4b73a55=
a3994384112efcdb37c01f"
 SRC_URI =3D "git://github.com/nanopb/nanopb.git;branch=3Dmaintenance_0.4=
;protocol=3Dhttps"
 SRCREV =3D "cad3c18ef15a663e30e3e43e3a752b66378adec1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/=
lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdp=
roc/lcdproc_git.bb
index c29c51a2ae..d4987acede 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc=
_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc=
_git.bb
@@ -13,7 +13,6 @@ PV =3D "0.5.9+git"
 SRCREV =3D "0e2ce9b9c46c47363436f9ee730f7c71bf455f0f"
 SRC_URI =3D "git://github.com/lcdproc/lcdproc;branch=3Dmaster;protocol=3D=
https"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig update-rc.d
=20
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/=
kmsxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsx=
x/kmsxx_git.bb
index f37c63d316..5d204d7d94 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_g=
it.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_g=
it.bb
@@ -20,7 +20,6 @@ PACKAGECONFIG[utils] +=3D "-Dutils=3Dtrue, -Dutils=3Dfa=
lse"
=20
 DEPENDS +=3D "libdrm libevdev fmt"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/=
nvmetcli_0.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/nvme=
tcli/nvmetcli_0.8.bb
index ad9873563f..cf2d54c07d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcl=
i_0.8.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcl=
i_0.8.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN} +=3D "python3 python3-six python3-pypars=
ing python3-configshell-fb"
 SRCREV =3D "d323d5a3091af490502c5d025ec7361a3a2cfbd9"
 SRC_URI =3D "git://git.infradead.org/users/hch/nvmetcli.git;branch=3Dmas=
ter"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install:append() {
     # Install example configuration scripts.
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem=
_1.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.=
5.bb
index 4e0afefde7..79a7f4095e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D "161131c686a6d9962a0e96912526dd4=
6308e022d62e3f8acaed5a56fda
 UPSTREAM_CHECK_URI =3D "https://selenic.com/repo/smem/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/${BPN}-${HG_CHANGESET}"
+S =3D "${UNPACKDIR}/${BPN}-${HG_CHANGESET}"
=20
 do_compile() {
         ${CC} ${CFLAGS} ${LDFLAGS} smemcap.c -o smemcap
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/tai=
sei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-gra=
phics/taisei/taisei_1.4.2.bb
index 7c90db9314..ee65f89ab7 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/tai=
sei_1.4.2.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/tai=
sei_1.4.2.bb
@@ -38,7 +38,6 @@ SRC_URI =3D "gitsm://github.com/taisei-project/taisei.g=
it;branch=3Dv1.4.x;protocol=3Dh
=20
 SRCREV =3D "c098579d4fa0f004ccc204c5bc46eac3717cba28"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit features_check meson mime mime-xdg pkgconfig python3native
=20
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/=
rasdaemon_0.8.3.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/ra=
sdaemon/rasdaemon_0.8.3.bb
index f21a3216af..301861de38 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaem=
on_0.8.3.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaem=
on_0.8.3.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/mchehab/rasdaemon.git;branc=
h=3Dmaster;protocol=3Dhttps \
=20
 SRCREV =3D "db0870edd2919f4f4d0101843136bcae92ab0743"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "libtraceevent"
 RDEPENDS:${BPN} =3D "perl perl-module-file-basename perl-module-file-fin=
d perl-module-file-spec perl-module-getopt-long \
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools-conf-configfs_1.0.bb b/meta-oe/dynamic-layers/selinux/reci=
pes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
index 86b0ce0778..78e84f4d71 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs_1.0.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs_1.0.bb
@@ -3,8 +3,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 SRC_URI =3D " \
     file://android-gadget-setup \
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools-conf_1.0.bb b/meta-oe/dynamic-layers/selinux/recipes-devto=
ol/android-tools/android-tools-conf_1.0.bb
index b98c70db77..de85d51df2 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf_1.0.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf_1.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md=
5=3D0835ade698e0bcf8506ecda
=20
 SRC_URI =3D "file://android-gadget-setup"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     install -d ${D}${bindir}
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-dev=
tool/android-tools/android-tools_29.0.6.r14.bb
index cd3c54e32e..cfcfa1d007 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools_29.0.6.r14.bb
@@ -55,7 +55,6 @@ SRC_URI +=3D " \
     file://0001-liblp-fix-building-with-GCC-14.patch \
 "
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/${BPN}"
=20
 # http://errors.yoctoproject.org/Errors/Details/1debian881/
diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-=
oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
index c58524aa64..feda6599a8 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/ssvb/cpuburn-arm.git;bran=
ch=3Dmaster;protocol=3Dhttps \
            file://0003-burn.S-Remove-.func-.endfunc.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 do_compile() {
=20
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-=
benchmark/fio/fio_3.39.bb
index 91bd23e50e..345c7f08e7 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
@@ -27,7 +27,6 @@ SRCREV =3D "a6e474c9e896e4ba1eb40066a03402afb040710a"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "fio-(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC =3D ""
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/r=
ecipes-benchmark/glmark2/glmark2_git.bb
index 0b61d6ed62..8bcb763f06 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -21,7 +21,6 @@ SRC_URI =3D " \
 "
 SRCREV =3D "42e3d8fe3aa88743ef90348138f643f7b04a9237"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig features_check
=20
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb b/meta-oe/r=
ecipes-benchmark/iozone3/iozone3_507.bb
index 8e229499b1..725b0af209 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "1e8087ada056f5d8018ee0bc76686d4=
16fc2251ed03038055dbd0af78d
=20
 UPSTREAM_CHECK_REGEX =3D "iozone3_(?P<pver>\d+).tar"
=20
-S =3D "${WORKDIR}/${BPN}_${PV}/src/current"
+S =3D "${UNPACKDIR}/${BPN}_${PV}/src/current"
=20
 #
 # All other arches can use the default OEMAKE except those
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/r=
ecipes-benchmark/iperf2/iperf2_2.2.1.bb
index c353ce02e1..3d965dac00 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.t=
ar.gz \
=20
 SRC_URI[sha256sum] =3D "754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc5=
36b61b51fefbd8fb"
=20
-S =3D "${WORKDIR}/iperf-${PV}"
+S =3D "${UNPACKDIR}/iperf-${PV}"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/re=
cipes-benchmark/iperf3/iperf3_3.18.bb
index 4a71e83b73..08f29937c0 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/esnet/iperf.git;branch=3D=
master;protocol=3Dhttps \
=20
 SRCREV =3D "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb b/met=
a-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
index df76067a44..ae87262870 100644
--- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
+++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://git.musl-libc.org/libc-bench;branch=3D=
master \
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install () {
     install -d ${D}${bindir}
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb =
b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index 6d96a13cd4..e688d6ede2 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -28,7 +28,6 @@ SRC_URI =3D " \
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux=
*"
=20
diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/r=
ecipes-benchmark/linpack/linpack_1.0.bb
index 735b5560e0..ac0787abc2 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -10,8 +10,7 @@ SRC_URI =3D "http://www.netlib.org/benchmark/linpackc.n=
ew;downloadfilename=3Dlinpack
           "
 SRC_URI[sha256sum] =3D "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae=
3af374d48745e97e"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} -DDP -o linpack_dp linpacknew.c -lm
diff --git a/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb b/meta-oe/recipes-b=
enchmark/mbw/mbw_2.0.bb
index bb8c4625d5..1fd95de038 100644
--- a/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
+++ b/meta-oe/recipes-benchmark/mbw/mbw_2.0.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/raas/${BPN}.git;branch=3Dma=
ster;protocol=3Dhttps"
=20
 SRCREV =3D "c3155b544a5065e8235508059c6512af6c46bd4d"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     install -d ${D}${bindir}
diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-=
suite_10.8.4.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-=
test-suite_10.8.4.bb
index 7ca80c02af..5f105c9f8e 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_1=
0.8.4.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_1=
0.8.4.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "http://www.phoronix-test-suite.com/release=
s/${BP}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "1f2092d536c0a3193efc53e4a50f3cee65c0ef1a78d31e54=
04f1c663fff7b7f4"
=20
-S =3D "${WORKDIR}/phoronix-test-suite"
+S =3D "${UNPACKDIR}/phoronix-test-suite"
=20
 inherit systemd allarch mime mime-xdg
=20
diff --git a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb b/meta-oe/re=
cipes-benchmark/qperf/qperf_0.4.11.bb
index b32f37153e..e034371604 100644
--- a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
+++ b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
@@ -9,7 +9,6 @@ inherit autotools-brokensep
 SRCREV =3D "c706363815a38ff2c5cbc07b73e2cfaaa59bae0f"
 SRC_URI =3D "git://github.com/linux-rdma/qperf.git;protocol=3Dhttps;bran=
ch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure() {
   ./cleanup
diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/r=
ecipes-benchmark/s-suite/s-suite_git.bb
index 2cfeb72416..caefdb7b6b 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/Algodev-github/S.git;prot=
ocol=3Dhttps;branch=3Dmaster"
 # upstream updates
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 # installing in /opt/S-suite since the package has
 # dependencies to the directory structure.
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11=
.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
index ba61ff971e..2d450094b7 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.11.bb
@@ -18,6 +18,5 @@ GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
 GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
 SRC_URI =3D "git://github.com/stressapptest/stressapptest;branch=3Dmaste=
r;protocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb b/meta=
-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
index 11e33fec55..198552e5c6 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
@@ -13,7 +13,6 @@ inherit autotools-brokensep pkgconfig
 SRC_URI =3D "git://github.com/akopytov/sysbench.git;protocol=3Dhttps;bra=
nch=3Dmaster"
 SRCREV =3D "ebf1c90da05dea94648165e4f149abc20c979557"
=20
-S =3D "${WORKDIR}/git"
=20
 COMPATIBLE_HOST =3D "(arm|aarch64|i.86|x86_64).*-linux*"
=20
diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b=
/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 200a0de849..8f65a6135c 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/ssvb/tinymembench.git;bra=
nch=3Dmaster;protocol=3Dhttps \
            file://0001-asm-Delete-.func-.endfunc-directives.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-=
oe/recipes-benchmark/whetstone/whetstone_1.2.bb
index fa80236022..0fbb3ecd1e 100644
--- a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/whetstone.c;beg=
inline=3D1;endline=3D52;md5=3Dc
 SRC_URI =3D "http://www.netlib.org/benchmark/whetstone.c"
 SRC_URI[sha256sum] =3D "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17=
bec1ea97c6f1efbf"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm
diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp=
/bolt/bolt_0.9.6.bb
index c278a0982a..ec3cdcaa75 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
@@ -10,7 +10,6 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 SRC_URI =3D "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=3Dhttps=
;branch=3Dmaster"
 SRCREV =3D "f03c50b22ae3fda26711ddabd91e2c5dd8103478"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "freedesktop:bolt"
=20
diff --git a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb b/meta-oe/rec=
ipes-bsp/con2fbmap/con2fbmap_git.bb
index b623d0525a..515c009ead 100644
--- a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
+++ b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://gitlab.com/pibox/con2fbmap.git;proto=
col=3Dhttps;branch=3Dmaster \
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-=
oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
index fbe9483740..9e23a4b67d 100644
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_COMMITS =3D "1"
 EXTRA_OEMAKE:append =3D " ${@['', 'NLS=3Dfalse']['${USE_NLS}' =3D=3D 'no=
']} "
=20
=20
-S =3D "${WORKDIR}/git"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.2=
0.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
index 42256a7afd..e0041b58e6 100644
--- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
@@ -16,7 +16,6 @@ EXTRA_OEMAKE =3D "NOSTRIP=3D1 DESTDIR=3D${D} PREFIX=3D$=
{prefix}"
=20
 PV =3D "1.0+${SRCPV}"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     oe_runmake install
diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/r=
ecipes-bsp/edac-utils/edac-utils_git.bb
index 6c80f4c81d..0d8f3c8a6b 100644
--- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
@@ -13,7 +13,6 @@ DEPENDS =3D " sysfsutils"
 SRCREV =3D "1c57818ecee186aa47af0342149577df5302c022"
 PV =3D "0.18+git"
=20
-S =3D "${WORKDIR}/git"
=20
 SRC_URI =3D "git://github.com/grondo/edac-utils;branch=3Dmaster;protocol=
=3Dhttps \
     file://make-init-script-be-able-to-automatically-load-EDAC-.patch \
diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/rec=
ipes-bsp/firmwared/firmwared_git.bb
index 2b7ed256eb..1542ee73d1 100644
--- a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
+++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
@@ -16,7 +16,6 @@ SRCREV =3D "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "glib-2.0 systemd"
=20
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb b/meta-oe/rec=
ipes-bsp/flashrom/flashrom_1.5.1.bb
index 9a8e81bae3..f7121e2503 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "https://download.flashrom.org/releases/flash=
rom-v${PV}.tar.xz \
=20
 SRC_URI[sha256sum] =3D "1f934b076ed49eace203655ec249fc7861a6b8e87fe4aef7=
32e47b6e485b6293"
=20
-S =3D "${WORKDIR}/flashrom-v${PV}"
+S =3D "${UNPACKDIR}/flashrom-v${PV}"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb b/meta-oe/recipes=
-bsp/fwupd/fwupd-efi_1.6.bb
index d72f2d9c53..bbf2b1fdac 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
@@ -6,7 +6,6 @@ SRC_URI =3D "git://github.com/fwupd/fwupd-efi;protocol=3D=
https;branch=3Dmain \
            file://0001-efi-generate_binary.py-Use-env-to-detect-python3.=
patch"
=20
 SRCREV =3D "58a2928f778278ab1f7f8fcddbab81ba587a8962"
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "gnu-efi python3-pefile-native"
=20
diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-b=
sp/i2cdev/i2cdev_git.bb
index 87a71efbe8..d3d08720a6 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -21,6 +21,5 @@ SRC_URI =3D "\
 "
 SRCREV =3D "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipes-=
bsp/ledmon/ledmon_0.97.bb
index 88a6e5bb30..ff3b29406b 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
@@ -23,7 +23,6 @@ SRCREV =3D "b0edae14e8660b80ffe0384354038a9f62e2978d"
 COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
 COMPATIBLE_HOST:libc-musl =3D "null"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-=
-enable-systemd', '', d)}"
=20
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb b/met=
a-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
index 6fad255c89..38ba1c776f 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
@@ -12,8 +12,7 @@ SRC_URI =3D "file://fancontrol \
            file://sensors.conf \
            file://sensord \
 "
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 PACKAGECONFIG ??=3D "sensord"
 PACKAGECONFIG[sensord] =3D ",,"
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/=
recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index 74a9b839c9..af0f5a7999 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -44,7 +44,6 @@ SYSTEMD_SERVICE:${PN}-fancontrol =3D "fancontrol.servic=
e"
 SYSTEMD_SERVICE:${PN}-sensord =3D "sensord.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
         MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} MANDIR=3D${mandir} \
diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb b/meta-oe/recipes-=
bsp/lsscsi/lsscsi_0.32.bb
index 127be8fbfa..9df6ee9efc 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
@@ -10,6 +10,6 @@ SRC_URI[sha256sum] =3D "0a800e9e94dca2ab702d65d72777ae8=
cae078e3d74d0bcbed64ba0849e
=20
 inherit autotools
=20
-S =3D "${WORKDIR}/lsscsi-${PV}"
+S =3D "${UNPACKDIR}/lsscsi-${PV}"
=20
 UPSTREAM_CHECK_REGEX =3D "lsscsi-(?P<pver>\d+(\.\d+)+)\.tgz"
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb b/meta-oe/reci=
pes-bsp/nvme-cli/nvme-cli_2.12.bb
index 7ab244f3cc..eae49b04ea 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "json-c libnvme"
 SRCREV =3D "71fa5d9310d6b41a69e844593423ac91b1453472"
=20
 SRC_URI =3D "git://github.com/linux-nvme/nvme-cli.git;branch=3Dmaster;pr=
otocol=3Dhttps"
-S =3D "${WORKDIR}/git"
=20
 inherit bash-completion meson pkgconfig systemd
=20
diff --git a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-oe/r=
ecipes-bsp/pointercal/pointercal_0.0.bb
index 20e870ccb2..581632c1ef 100644
--- a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4b5fcfc87fb615=
860d398b5e38685edf"
 SRC_URI =3D "file://pointercal \
            file://COPYING"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     # Only install file if it has a contents
diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/reci=
pes-connectivity/ace/ace_8.0.2.bb
index 05f4973aed..0fe41a7b92 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
@@ -20,7 +20,7 @@ CVE_STATUS[CVE-2009-1147] =3D "cpe-incorrect: this CVE =
is for vmware ace"
=20
 COMPATIBLE_HOST:libc-musl =3D "null"
=20
-S =3D "${WORKDIR}/ACE_wrappers"
+S =3D "${UNPACKDIR}/ACE_wrappers"
 B =3D "${WORKDIR}/ACE_wrappers/ace"
 export ACE_ROOT =3D "${WORKDIR}/ACE_wrappers"
=20
diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb b=
/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
index 3a02c714c1..fc020695e3 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.1.0.bb
@@ -9,6 +9,5 @@ SRCREV =3D "21046ebc4a5475c14cea446715734c88fe33d276"
=20
 DEPENDS =3D "openssl boost"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb b/=
meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
index 979199a1fa..52a0af810f 100644
--- a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
+++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
@@ -12,7 +12,7 @@ inherit pypi setuptools3 pkgconfig
 SRC_URI +=3D "file://0001-setup.py-StrictVersion-packaging.version.patch=
"
 SRC_URI[sha256sum] =3D "49fc70f01bc192c43ff3ec815e082df5261ea4c8d36a695e=
977734c4eb4df868"
=20
-S =3D "${WORKDIR}/python-gammu-${PV}"
+S =3D "${UNPACKDIR}/python-gammu-${PV}"
=20
 DEPENDS +=3D "gammu python3-packaging-native"
=20
diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-o=
e/recipes-connectivity/gattlib/gattlib_git.bb
index 0841dc2596..06f0b5bf0a 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/labapart/gattlib.git;bran=
ch=3Dmaster;protocol=3Dhttps \
 SRCBRANCH =3D "master"
 SRCREV =3D "33a8a275928b186381bb0aea0f9778e330e57ec3"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_STATUS[CVE-2019-6498] =3D "fixed-version: patch is already included =
in sources"
=20
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb b/meta-o=
e/recipes-connectivity/gensio/gensio_2.8.7.bb
index f4d0c09306..9325b1e5dc 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
@@ -9,7 +9,6 @@ SRCREV =3D "e4dbb9687bd5e887fa98a4cdcec012ea85da1ef2"
=20
 SRC_URI =3D "git://github.com/cminyard/gensio;protocol=3Dhttps;branch=3D=
master"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb b/meta-oe/r=
ecipes-connectivity/krb5/krb5_1.21.3.bb
index e500749025..c042dba5a7 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
@@ -40,7 +40,7 @@ SRC_URI[sha256sum] =3D "b7a4cd5ead67fb08b980b21abd150ff=
7217e85ea320c9ed0c6dadd3048
 CVE_PRODUCT =3D "kerberos"
 CVE_VERSION =3D "5-${PV}"
=20
-S =3D "${WORKDIR}/${BP}/src"
+S =3D "${UNPACKDIR}/${BP}/src"
=20
 DEPENDS =3D "bison-native ncurses util-linux e2fsprogs e2fsprogs-native =
openssl"
=20
diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobil=
edevice-glue_1.3.2.bb b/meta-oe/recipes-connectivity/libimobiledevice-glu=
e/libimobiledevice-glue_1.3.2.bb
index 977f34b574..8b7306b598 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice=
-glue_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice=
-glue_1.3.2.bb
@@ -11,5 +11,4 @@ DEPENDS =3D "libplist"
 SRCREV =3D "aef2bf0f5bfe961ad83d224166462d87b1df2b00"
 SRC_URI =3D "git://github.com/libimobiledevice/libimobiledevice-glue;pro=
tocol=3Dhttps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevi=
ce_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevic=
e_git.bb
index b8d7e8872b..3c93c9a37b 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.=
bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.=
bb
@@ -14,7 +14,6 @@ SRCREV =3D "860ffb707af3af94467d2ece4ad258dda957c6cd"
 SRC_URI =3D "git://github.com/libimobiledevice/libimobiledevice;protocol=
=3Dhttps;branch=3Dmaster \
            file://0001-include-unistd.h-for-usleep.patch"
=20
-S =3D "${WORKDIR}/git"
 inherit autotools pkgconfig
=20
 EXTRA_OECONF =3D " --without-cython "
diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1=
.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
index 818033243f..6049369290 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
@@ -11,5 +11,4 @@ DEPENDS =3D "libimobiledevice-glue libusb1 readline"
 SRCREV =3D "2fb767d784c01269a0ded5bacd5539aee3768c35"
 SRC_URI =3D "git://github.com/libimobiledevice/libirecovery;protocol=3Dh=
ttps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb b/met=
a-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
index a4174e06e3..27d28d71cb 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
@@ -14,7 +14,6 @@ inherit meson pkgconfig bash-completion gobject-introsp=
ection upstream-version-i
 SRCREV =3D "e10df4b6b3edfe6a46d93f7f5f5cab31c29a7091"
 SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;p=
rotocol=3Dhttps;branch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMESON =3D " \
     -Dgtk_doc=3Dfalse \
diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb b/meta-oe/=
recipes-connectivity/libndp/libndp_1.9.bb
index 69eecdd9fa..fdf5694e9f 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.9.bb
@@ -8,6 +8,5 @@ SRC_URI =3D "git://github.com/jpirko/libndp;branch=3Dmast=
er;protocol=3Dhttps \
            "
 # tag for v1.8
 SRCREV =3D "2730638bf88984b09531813974f9bd14e1a50165"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb b/meta-oe/=
recipes-connectivity/libnet/libnet_1.3.bb
index b4648832f1..0594b2485e 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.3.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/libnet/libnet.git;protoco=
l=3Dhttps;branch=3Dmaster"
 SRC_URI[sha256sum] =3D "1e9e9054d688b059bcbaf878d8c4fbf69bfc0c9386cd4e77=
79fbb53339050d2e"
 SRCREV =3D "deaebdfe2743e8a6f04d3c307d9272afeeecfade"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools binconfig multilib_script
 MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/libnet-config"
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-o=
e/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index 0d21a7e596..83f32d3a07 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/sahlberg/libnfs.git;protoco=
l=3Dhttps;branch=3Dmaster \
            file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-m=
ult.patch \
            "
 SRCREV =3D "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "gnutls"
=20
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-=
oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
index 94164a0b5a..8dc7ec3773 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
@@ -15,7 +15,6 @@ inherit meson pkgconfig bash-completion gobject-introsp=
ection upstream-version-i
 SRCREV =3D "3f07d6e5b4677558543b3b4484ea88ad92257e92"
 SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;pr=
otocol=3Dhttps;branch=3Dqmi-1-34"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "udev mbim"
 PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue,-Dudev=3Dfalse,libgudev"
diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.b=
b b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
index 3549cac568..f195008650 100644
--- a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
+++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadb=
and/libqrtr-glib.git;protoc
 PV =3D "1.2.2+git"
 SRCREV =3D "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig gobject-introspection
=20
diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent=
-rasterbar_2.0.10.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/=
libtorrent-rasterbar_2.0.10.bb
index f2de1f468d..8481af7374 100644
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-raster=
bar_2.0.10.bb
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-raster=
bar_2.0.10.bb
@@ -13,7 +13,6 @@ SRCREV =3D "74bc93a37a5e31c78f0aa02037a68fb9ac5deb41"
 SRCREV_try_signal =3D "105cce59972f925a33aa6b1c3109e4cd3caf583d"
 SRCREV_FORMAT .=3D "_try_signal"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig python3targetconfig
=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb=
 b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
index 912b002618..220bb62c64 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
@@ -13,7 +13,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 CVE_STATUS[CVE-2009-1760] =3D "backported-patch: patched in our product"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D ""
=20
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3=
.5.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
index 4d6ec3b7ea..0751cff178 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D382bfdf329e774=
859fd401eaf850d29b"
 DEPENDS =3D "zlib"
 DEPENDS:append:class-native =3D " libcap-native"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "ab9df9cfc39de7a49967f18387b6b76310947442"
 SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps=
;branch=3Dv4.3-stable \
            file://0001-sll_protocol-may-be-be16.patch \
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.=
0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
index 6b4336eb80..82cc1167e2 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
@@ -14,7 +14,6 @@ DEPENDS =3D "glib-2.0 libgudev libxslt-native dbus"
 SRCREV =3D "03f786ce66360d67c669f4f122f8aa458e6f01ea"
 SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.=
git;protocol=3Dhttps;branch=3Dmm-1-22"
=20
-S =3D "${WORKDIR}/git"
=20
 # strict, permissive
 MODEMMANAGER_POLKIT_TYPE ??=3D "permissive"
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-o=
e/recipes-connectivity/obex/openobex_1.7.2.bb
index fecf9b129c..be8482ab50 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D "158860aaea52f0fce0c8e4b64550daa=
ae06df2689e05834697b7e8c7d7
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/openobex/files/=
openobex/"
 UPSTREAM_CHECK_REGEX =3D "${BPN}/(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/${BP}-Source"
+S =3D "${UNPACKDIR}/${BP}-Source"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/met=
a-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
index a9a12f8e05..30326e89ef 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
@@ -27,7 +27,7 @@ PACKAGECONFIG[swig] =3D "-DENABLE_SWIG=3DON,-DENABLE_SW=
IG=3DOFF,swig"
=20
 DEPENDS:remove:class-native =3D "fuse-native"
=20
-S =3D "${WORKDIR}/${BP}-Source"
+S =3D "${UNPACKDIR}/${BP}-Source"
=20
 EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_RPATH=3DON \
                   -DENABLE_PERL=3DOFF -DENABLE_PYTHON=3DOFF \
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.=
bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
index b971851b90..ad6637ed88 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
@@ -19,7 +19,6 @@ SRCREV =3D "2150ba29d9df24ad1733c460eb099f292af84ee5"
=20
 DEPENDS =3D "openssl"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4=
.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
index 6f2efcda50..cfe5142312 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
@@ -18,7 +18,6 @@ PV .=3D "+git"
=20
 DEPENDS =3D "openssl paho-mqtt-c"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09=
.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
index 7979094a0b..a04102aa42 100644
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_24.09.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;p=
rotocol=3Dhttps;branch=3Dmaster
           "
 SRCREV =3D "4af4b8b04e6d5dd40b8e69cc30c5c1f62e7fe368"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb=
 b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
index 680174f005..4fd6302f2c 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/alanxz/rabbitmq-c.git;branc=
h=3Dmaster;protocol=3Dhttps \
 "
 SRCREV =3D "84b81cd97a1b5515d3d4b304796680da24c666d8"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "popt openssl"
=20
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb b/m=
eta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
index 4c963d9cc4..02a97cd6e3 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "autoconf-archive libsigc++-2.0 curl cppunit =
libtool libtorrent ncurse
 SRC_URI =3D "git://github.com/rakshasa/rtorrent;branch=3Dmaster;protocol=
=3Dhttps"
 SRCREV =3D "a88cab6d2e764e22cac232ef8d5af039d41b8280"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
=20
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb b=
/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
index 38dcb395b2..e5a3f88867 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "http://smstools3.kekekasvi.com/packages/${=
BP}.tar.gz \
 SRC_URI[sha256sum] =3D "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030=
cd4e4905f6a92084"
=20
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 EXTRA_OEMAKE +=3D "LFLAGS=3D'${LDFLAGS}'"
=20
diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6=
.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
index f86389998f..5d0dd6a389 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
@@ -15,7 +15,6 @@ SRC_URI =3D " \
 # Transmission release 4.0.6
 SRCREV =3D "38c164933e9f77c110b48fe745861c3b98e3d83e"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
=20
diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-o=
e/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 569d6a41cf..5a880ed6d2 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -14,7 +14,6 @@ PV =3D "1.1.2+git"
 SRCREV =3D "01c94c77f59404924f1c46d99c4e5e0c7817281b"
 SRC_URI =3D "git://github.com/libimobiledevice/usbmuxd;protocol=3Dhttps;=
branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "--without-preflight"
=20
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite=
_10.10.1.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suit=
e_10.10.1.bb
index c372b03072..9703c10452 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.=
1.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.=
1.bb
@@ -7,7 +7,6 @@ LICENSE  =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D0542427ed5c315ca34aa09ae7=
a85ed32"
 SECTION =3D "test"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "12e85fbeca8ca21a632d18e55089a8a7606d64aa"
 SRC_URI =3D "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.gi=
t;branch=3Dmaster;protocol=3Dhttps \
 	file://0001-Use-toolchain-from-environment-variables.patch \
diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb b/meta-=
oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
index 135121c5ba..e411e6efc0 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
@@ -8,7 +8,6 @@ SRCREV =3D "c94c20743ed7d4aa37835a5c46567ab0790d4acc"
=20
 SRC_URI =3D "git://github.com/zeromq/cppzmq.git;branch=3Dmaster;protocol=
=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-core/basu/basu_0.2.1.bb b/meta-oe/recipes-co=
re/basu/basu_0.2.1.bb
index 1b4d5a0fe5..330fe1c607 100644
--- a/meta-oe/recipes-core/basu/basu_0.2.1.bb
+++ b/meta-oe/recipes-core/basu/basu_0.2.1.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://git.sr.ht/~emersion/basu;protocol=3Dht=
tps;branch=3Dmaster"
=20
 DEPENDS +=3D "gperf-native"
=20
-S =3D "${WORKDIR}/git"
 PV =3D "0.2.1+git"
 SRCREV =3D "a08cf5a575325435040d35710dbac3d0c32b1676"
=20
diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/re=
cipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index 992a414009..0908409e1e 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -12,7 +12,6 @@ DEPENDS =3D "libsigc++-3"
=20
 RDEPENDS:${PN}:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig cmake
=20
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe=
/recipes-core/dbus/dbus-daemon-proxy_git.bb
index 086a37ca1c..e99bf28ce5 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/alban/dbus-daemon-proxy;b=
ranch=3Dmaster;protocol=3Dhttps
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/=
emlog/emlog.inc
index 713b012177..ff2a106c6e 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/nicupavel/emlog.git;protoco=
l=3Dhttps;branch=3Dmaster"
 SRC_URI +=3D "file://0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.=
patch"
 SRCREV =3D "a9bbf324fde131ff4cf064e32674086c4ced4dca"
 PV =3D "0.70+git"
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "nicupavel:emlog"
=20
diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb b/meta-oe/recipes-co=
re/glfw/glfw_3.3.8.bb
index 684355ef3e..8abb13b580 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
@@ -14,7 +14,6 @@ PV .=3D "+git"
 SRCREV =3D "7482de6071d21db77a7236155da44c172a7f6c9e"
 SRC_URI =3D "git://github.com/glfw/glfw.git;branch=3D3.3-stable;protocol=
=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLFW_BUILD_DOCS=3DOFF"
=20
diff --git a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb b/meta-o=
e/recipes-core/glib-2.0/glib-testing_0.1.1.bb
index ebcc2b267b..97a5592f94 100644
--- a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
 SRC_URI =3D "git://gitlab.gnome.org/pwithnall/libglib-testing.git;protoc=
ol=3Dhttps;branch=3Dmain"
=20
 PV =3D "0.1.1"
-S =3D "${WORKDIR}/git"
 SRCREV =3D "e326f73a7139c5e54fcf926896ae6e4cc899a1a7"
=20
 inherit  meson pkgconfig
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb b/meta-o=
e/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
index a45d31edc2..48a1a2a624 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
@@ -14,7 +14,7 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.get=
Var('PV').split('.')[1]}"
=20
 SRC_URI[archive.sha256sum] =3D "539b0a29e15a96676c4f0594541250566c5ca44d=
a5d4d87a3732fa2d07909e4a"
=20
-S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 FILES:${PN} =3D "${libdir}/lib*.so.*"
 FILES:${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/${BPN}/include/ ${li=
bdir}/${BPN}/proc/ ${libdir}/giomm-2.68/include/"
diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-=
core/libnfc/libnfc_git.bb
index a97a2841f7..ac3a0d85a4 100644
--- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
+++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
@@ -9,7 +9,6 @@ inherit autotools pkgconfig
=20
 PV =3D "1.8.0+git"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "f02ff51449240102c27a97173dc495e8e7789046"
 SRC_URI =3D "git://github.com/nfc-tools/libnfc.git;branch=3Dmaster;proto=
col=3Dhttps"
=20
diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb b=
/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
index 9a3ddfd15c..3496220fe1 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "a9dbee323351d109b7aee074a9cb89c=
a3e7bcf8ad8edef1851f4cf359b
 UPSTREAM_CHECK_URI =3D "https://download.gnome.org/sources/libsigc++/2.1=
2/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/libsigc++-${PV}"
+S =3D "${UNPACKDIR}/libsigc++-${PV}"
=20
 inherit meson
=20
diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb b/me=
ta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
index 38a80bbf3e..0bfe55fd93 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "c3d23b37dfd6e39f2e09f091b77b154=
1fbfa17c4f0b6bf5c89baef7229
 UPSTREAM_CHECK_URI =3D "https://download.gnome.org/sources/libsigc++/3.6=
/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/libsigc++-${PV}"
+S =3D "${UNPACKDIR}/libsigc++-${PV}"
=20
 inherit setuptools3 meson
=20
diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb b/meta-oe/=
recipes-core/libxml/libxml++-5.0_5.0.1.bb
index 0271602555..58c2697b9a 100644
--- a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
@@ -11,7 +11,7 @@ DEPENDS =3D "libxml2 glibmm"
 GNOMEBN =3D "libxml++"
 inherit gnomebase ptest
=20
-S =3D "${WORKDIR}/libxml++-${PV}"
+S =3D "${UNPACKDIR}/libxml++-${PV}"
=20
 SRC_URI[archive.sha256sum] =3D "15c38307a964fa6199f4da6683a599eb7e63cc89=
198545b36349b87cf9aa0098"
=20
diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-=
core/mdbus2/mdbus2_git.bb
index a7ac358f27..948d50b471 100644
--- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
+++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/freesmartphone/mdbus.git;=
protocol=3Dhttps;branch=3Dmaste
            "
 SRCREV =3D "28202692d0b441000f4ddb8f347f72d1355021aa"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig vala
=20
diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-o=
e/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
index a013d99ba1..cf98c0cf2e 100644
--- a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/zlib-ng/minizip-ng.git;pr=
otocol=3Dhttps;branch=3Dmaster
=20
 SRCREV =3D "55db144e03027b43263e5ebcb599bf0878ba58de"
=20
-S =3D "${WORKDIR}/git"
=20
 RCONFLICTS:${PN} +=3D "minizip"
=20
diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/reci=
pes-core/minizip/minizip_1.3.1.bb
index 0d36ffbcf6..56cd28c9ae 100644
--- a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
+++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://zip.h;beginline=3D14;endline=
=3D30;md5=3D8eaa8535a3a1a2296b3
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar.gz"
 UPSTREAM_CHECK_URI =3D "http://zlib.net/"
=20
-S =3D "${WORKDIR}/zlib-${PV}/contrib/minizip"
+S =3D "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
=20
 SRC_URI[sha256sum] =3D "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91=
eefb60f03b72df23"
=20
diff --git a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb b/meta=
-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
index fe3cf73e43..9c4db7efec 100644
--- a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
+++ b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
@@ -12,4 +12,3 @@ UPSTREAM_CHECK_COMMITS =3D "1"
=20
 inherit autotools
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v79.bb b/meta-oe/recipes-co=
re/ndctl/ndctl_v79.bb
index 1ad1476d93..4014e3bca6 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v79.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
@@ -18,7 +18,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>v\d+(\.\d+)*)"
=20
 DEPENDS =3D "kmod udev json-c keyutils iniparser libtraceevent libtracef=
s"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMESON +=3D "-Diniparserdir=3D${STAGING_INCDIR}/iniparser"
=20
diff --git a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb b/meta-oe/recipe=
s-core/opencl/clpeak_1.1.4.bb
index 8c05ad6d02..59f807b7ae 100644
--- a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
+++ b/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c=
9479bd8986968f4327"
=20
 SRCREV =3D "527695de8393a3144863a0a07f9b92f1c734d1c4"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recip=
es-core/opencl/ocl-icd_2.3.2.bb
index d43ea281ae..9e32242e31 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/OCL-dev/ocl-icd.git;protoco=
l=3Dhttps;branch=3Dmaster"
=20
 SRCREV =3D "fdde6677b21329432db8b481e2637cd10f7d3cb2"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb b/met=
a-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
index b815c22eec..7335712d6f 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
@@ -10,7 +10,6 @@ SRCREV =3D "c7b4aded1cab9560b226041dd962f63375a9a384"
=20
 SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=3Dh=
ttps;branch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb b/meta-=
oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
index e374ef1863..c766a66640 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
@@ -8,7 +8,6 @@ inherit pkgconfig cmake
 DEPENDS +=3D "opencl-headers opencl-icd-loader"
 RDEPENDS:${PN} +=3D "python3-core python3-io"
=20
-S =3D "${WORKDIR}/git"
=20
 SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=3Dhtt=
ps;branch=3Dmain;lfs=3D0 \
 	   file://0001-Ignore-Compiler-Warnings.patch"
diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb b/m=
eta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
index 412b573cb4..0ec2fe5f33 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
@@ -4,7 +4,6 @@ LICENSE  =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
 SECTION =3D "base"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "4ea6df132107e3b4b9407f903204b5522fdffcd6"
 SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=3Dm=
ain;protocol=3Dhttps \
            file://0001-Command-buffer-supported-queue-properties-265.pat=
ch \
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb =
b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index 38db7a2453..7cfc75f5ed 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -11,7 +11,6 @@ DEPENDS +=3D "opencl-headers"
 PROVIDES =3D "virtual/opencl-icd"
 RPROVIDES:${PN} =3D "virtual-opencl-icd"
=20
-S =3D "${WORKDIR}/git"
=20
 SRCREV =3D "861b68b290e76d08e7241608479c16431f529945"
 SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=3D=
main;protocol=3Dhttps"
diff --git a/meta-oe/recipes-core/pim435/pim435_git.bb b/meta-oe/recipes-=
core/pim435/pim435_git.bb
index 8fc8749a1f..a18e889683 100644
--- a/meta-oe/recipes-core/pim435/pim435_git.bb
+++ b/meta-oe/recipes-core/pim435/pim435_git.bb
@@ -15,7 +15,6 @@ SRCREV =3D "445ed623ec8d3ecbb1d566900b4ef3fb3031d689"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "i2c-tools"
=20
diff --git a/meta-oe/recipes-core/safec/safec_3.7.1.bb b/meta-oe/recipes-=
core/safec/safec_3.7.1.bb
index 9dd6f1c7cc..a2f66e9a1a 100644
--- a/meta-oe/recipes-core/safec/safec_3.7.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.7.1.bb
@@ -6,7 +6,6 @@ SECTION =3D "lib"
=20
 inherit autotools pkgconfig
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "f9add9245b97c7bda6e28cceb0ee37fb7e254fd8"
 SRC_URI =3D "git://github.com/rurban/safeclib.git;branch=3Dmaster;protoc=
ol=3Dhttps \
            file://0001-strpbrk_s-Remove-unused-variable-len.patch \
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb=
 b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
index ceb422325c..9c39d40d23 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_255.6.bb
@@ -55,7 +55,6 @@ CFLAGS:append:libc-musl =3D " -D__UAPI_DEF_ETHHDR=3D0 "
=20
 EXTRA_OEMESON +=3D "-Dstatic-libsystemd=3Dpic"
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN}-dev =3D ""
=20
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb b/me=
ta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
index c55c305611..0467c834b8 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
@@ -11,6 +11,6 @@ DEPENDS +=3D "expat"
 SRCREV =3D "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
 SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3Dv${PV};subpath=3Dtools"
=20
-S =3D "${WORKDIR}/tools"
+S =3D "${UNPACKDIR}/tools"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb b/meta-oe/=
recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
index f3799adb3c..62b30e9894 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
@@ -24,7 +24,6 @@ EXTRA_OECMAKE =3D "-DSDBUSCPP_BUILD_CODEGEN=3DOFF \
                  -DSDBUSCPP_BUILD_DOCS=3DON \
                  -DSDBUSCPP_BUILD_DOXYGEN_DOCS=3DOFF"
=20
-S =3D "${WORKDIR}/git"
=20
 # Link libatomic on architectures without 64bit atomics fixes
 # libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'
diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb =
b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
index 15b60af02e..92bebc5e35 100644
--- a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
+++ b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
@@ -16,7 +16,6 @@ SRCREV =3D "00a12c234e2506f5cab683460199575f13c454db"
 SRCBRANCH =3D "v257-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branc=
h=3D${SRCBRANCH}"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D " \
     cryptsetup-native \
diff --git a/meta-oe/recipes-core/usleep/usleep_1.2.bb b/meta-oe/recipes-=
core/usleep/usleep_1.2.bb
index e8b4a7fef9..b6e42018b9 100644
--- a/meta-oe/recipes-core/usleep/usleep_1.2.bb
+++ b/meta-oe/recipes-core/usleep/usleep_1.2.bb
@@ -3,8 +3,7 @@ SECTION =3D "base"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
 DEPENDS =3D "popt"
=20
 SRC_URI =3D "file://usleep.c \
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.1.0=
.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb
index d7c8c44aad..fb95a2de5c 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.1.0.bb
@@ -13,7 +13,6 @@ SRC_URI +=3D "git://github.com/uutils/coreutils.git;pro=
tocol=3Dhttps;branch=3Dmain \
 "
=20
 SRCREV =3D "18b963ed6f612ac30ebca92426280cf4c1451f6a"
-S =3D "${WORKDIR}/git"
=20
 require ${BPN}-crates.inc
=20
diff --git a/meta-oe/recipes-crypto/botan/botan_3.7.1.bb b/meta-oe/recipe=
s-crypto/botan/botan_3.7.1.bb
index a9d080c9a5..74f895cf3c 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.7.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.7.1.bb
@@ -7,7 +7,7 @@ SECTION =3D "libs"
 SRC_URI =3D "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "fc0620463461caaea8e60f06711d7e437a3ad1eebd6de4ac=
29c14bbd901ccd1b"
=20
-S =3D "${WORKDIR}/Botan-${PV}"
+S =3D "${UNPACKDIR}/Botan-${PV}"
=20
 inherit python3native siteinfo lib_package
=20
diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb =
b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
index b8ffa45947..840c04e52e 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbc974d217b52=
5ea216a336adb73e1220"
 SRCREV =3D "2543e6e5037c0b1b448282c2793f8a6ce8b12d71"
 SRC_URI =3D "git://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git=
;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "openssl"
=20
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/=
recipes-crypto/libkcapi/libkcapi_1.5.0.bb
index a34614dd9d..7d27081964 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://www.chronox.de/libkcapi/index.html"
 LICENSE =3D "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3d8a091d797491204567185a6efce=
70f"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "fc937358e71253a6efaa3ba74885364976b040ea"
 SRC_URI =3D "git://github.com/smuellerDD/libkcapi.git;branch=3Dmaster;pr=
otocol=3Dhttps \
           "
diff --git a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb b/m=
eta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
index 5479007d92..a9a147c35b 100644
--- a/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
+++ b/meta-oe/recipes-crypto/libtomcrypt/libtomcrypt_1.18.2.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/libtom/libtomcrypt.git;pr=
otocol=3Dhttps;branch=3Dmaster
=20
 SRCREV =3D "7e7eb695d581782f04b24dc444cbfde86af59853"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta=
-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
index 813c6ec4c8..a601d88e7c 100644
--- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
@@ -11,7 +11,7 @@ SRC_URI[sha512sum] =3D "bf275d4c53ff94af6cdc723a4e002e9=
f080f4d1436c86c76bb37870b34
=20
 MIRRORS =3D "https://.*/.* https://github.com/LoupVaillant/Monocypher/re=
leases/download/${PV}/${BPN}-${PV}.tar.gz "
=20
-S =3D "${WORKDIR}/${BPN}-${PV}"
+S =3D "${UNPACKDIR}/${BPN}-${PV}"
=20
 CFLAGS +=3D "-pedantic -Wall -Wextra -O3"
 EXTRA_OEMAKE =3D "'PREFIX=3D${prefix}' 'DESTDIR=3D${D}' 'CFLAGS=3D${CFLA=
GS}' 'LIBDIR=3D${libdir}'"
diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb=
 b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
index d3922cf79e..15d0aefc36 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
@@ -17,7 +17,6 @@ LIC_FILES_CHKSUM =3D " \
 "
 SRC_URI =3D "git://github.com/OpenSC/${BPN}.git;branch=3Dmaster;protocol=
=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
 # master
 SRCREV =3D "8bed16034f629a0361fa8ff89deed2b43dc45d8b"
 PV .=3D "+1.30.0+git"
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/re=
cipes-dbs/influxdb/influxdb_1.8.10.bb
index 2ad68d679a..8c0889eb28 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -16,7 +16,6 @@ require ${BPN}-go-mods.inc
=20
 SRCREV =3D "688e697c51fd5353725da078555adbeff0363d01"
=20
-S =3D "${WORKDIR}/git"
=20
 GO_IMPORT =3D "github.com/influxdata/influxdb"
 GO_INSTALL =3D "\
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb b/meta-oe/recipe=
s-dbs/leveldb/leveldb_1.23.bb
index 60b486df78..9cefc528ae 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "gitsm://github.com/google/${BPN}.git;branc=
h=3Dmain;protocol=3Dhttps \
 "
=20
 SRCREV =3D "068d5ee1a3ac40dabd00d211d5013af44be55bea"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
 PACKAGECONFIG ??=3D ""
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb b/meta-oe/recipes-db=
s/lmdb/lmdb_0.9.31.bb
index b2f1920f6b..065c8559ff 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
@@ -18,7 +18,7 @@ SRCREV =3D "ce201088de95d26fc0da36ba805bf2ddc2ba74ff"
=20
 inherit ptest
=20
-S =3D "${WORKDIR}/git/libraries/liblmdb"
+S =3D "${UNPACKDIR}/${BP}/libraries/liblmdb"
=20
 do_compile() {
     oe_runmake CC=3D"${CC}" SOEXT=3D".so.${PV}" LDFLAGS=3D"${LDFLAGS}" X=
CFLAGS=3D"${CFLAGS}"
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb b/meta-oe/reci=
pes-dbs/rocksdb/rocksdb_9.10.0.bb
index fefb6df8aa..5bbb010f8b 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
@@ -29,7 +29,6 @@ SRC_URI:append:mips =3D " file://0001-replace-old-sync-=
with-new-atomic-builtin-equ
 SRC_URI:append:powerpc =3D " file://0001-replace-old-sync-with-new-atomi=
c-builtin-equivalents.patch"
 SRC_URI:remove:toolchain-clang:riscv32 =3D "file://0001-replace-old-sync=
-with-new-atomic-builtin-equivalents.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb=
 b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
index 7d8b813e5f..4afbba963a 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D=
${BRANCH};protocol=3Dhttps \
            file://0002-abseil-ppc-fixes.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb b/meta=
-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
index 87c09f5118..e027b8d4aa 100644
--- a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
+++ b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/gong.chen/aer-inject.gi
 "
 SRCREV =3D "9bd5e2c7886fca72f139cd8402488a2235957d41"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "bison-native"
=20
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-co=
nfigfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf=
-configfs_1.0.bb
index f473d22849..a771b38595 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_=
1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_=
1.0.bb
@@ -3,8 +3,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 SRC_URI =3D " \
     file://android-gadget-setup \
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.=
0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
index abf21803e5..eb86e9dd77 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md=
5=3D0835ade698e0bcf8506ecda
=20
 SRC_URI =3D "file://android-gadget-setup"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r=
37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index fe915c3e30..f565007393 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -62,7 +62,6 @@ SRC_URI =3D " \
 "
=20
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/${BPN}"
=20
 # http://errors.yoctoproject.org/Errors/Details/133881/
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe=
/recipes-devtools/apitrace/apitrace_11.1.bb
index 48ba7dbaea..244d9a3c6f 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "gitsm://github.com/${BPN}/${BPN}.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://0001-Explicit-header-stdint.patch \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "zlib libpng python3-native"
=20
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/m=
eta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
index 3bf4371e85..2657f1ca0d 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
@@ -41,7 +41,6 @@ SRC_URI =3D "git://github.com/google/breakpad;name=3Dbr=
eakpad;branch=3Dmain;protocol=3Dh
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=3D=
src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=3Dsrc/third_party/lss =
\
 "
-S =3D "${WORKDIR}/git"
=20
 CXXFLAGS +=3D "-D_GNU_SOURCE"
 LDFLAGS:append:libc-musl =3D " -lucontext"
diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb b/meta=
-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
index 77bde79217..0ea243fd20 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/sandstorm-io/capnproto.git;=
branch=3Drelease-${PV};prot
            file://0001-Export-binaries-only-for-native-build.patch"
 SRCREV =3D "1a0e12c0a3ba1f0dbbad45ddfef555166e0a14fc"
=20
-S =3D "${WORKDIR}/git/c++"
+S =3D "${UNPACKDIR}/${BP}/c++"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb b/meta-=
oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
index eb8556ebc6..8a6337a0d2 100644
--- a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9741c346eef561=
31163e13b9db1241b3"
 SRC_URI +=3D "git://github.com/mozilla/cbindgen.git;protocol=3Dhttps;bra=
nch=3Dmaster \
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-lin=
ux-g.patch;patchdir=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.155"
 SRCREV =3D "bd78bbe59b10eda6ef1255e4acda95c56c6d0279"
-S =3D "${WORKDIR}/git"
=20
 inherit cargo pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/rec=
ipes-devtools/cjson/cjson_1.7.18.bb
index bdeab3055c..33c8c28531 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/DaveGamble/cJSON.git;branch=
=3Dmaster;protocol=3Dhttps \
          "
 SRCREV =3D "acc76239bee01d8e9c858ae2cab296704e52d916"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig ptest
=20
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.b=
b b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index 47a3d88853..ab4e6148e9 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/concurrencykit/ck.git;bra=
nch=3Dmaster;protocol=3Dhttps \
            file://0001-configure-Fix-compoiler-detection-logic-for-cross=
-co.patch \
            file://0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64=
.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 COMPATIBLE_HOST =3D "(arm|aarch64|i.86|x86_64|powerpc|powerpc64|riscv32|=
riscv64).*-linux*"
=20
diff --git a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb b/me=
ta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
index 961c94205f..6e709b6e7e 100644
--- a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
+++ b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa818a259cbed7=
ce8bc2a22d35a464fc"
 SRC_URI =3D "git://github.com/rm5248/libcppgenerate.git;branch=3Dmaster;=
protocol=3Dhttps"
 SRCREV =3D "930c5503f76c877b72b9ff8546353d6f422bd010"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta-oe/re=
cipes-devtools/cpuset/cpuset_1.6.2.bb
index b404d4131e..98419a8069 100644
--- a/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
+++ b/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
 SRC_URI =3D "git://github.com/SUSE/cpuset.git;protocol=3Dhttps;branch=3D=
master"
=20
 SRCREV =3D "4f80263208935f0df4f616cf9d8cb7285599a670"
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb b/met=
a-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
index 6f0fbff0b2..845a78da76 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250608.0.bb
@@ -17,7 +17,6 @@ inherit autotools-brokensep pkgconfig manpages
 SRCREV =3D "c06d333b3162660694b26604a364cdab89e2010e"
 SRC_URI =3D "git://github.com/universal-ctags/ctags;branch=3Dmaster;prot=
ocol=3Dhttps;tag=3Dp${PV}"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D " \
     readcmd \
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb =
b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
index 5fa71896b2..9287962ab7 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
@@ -13,7 +13,7 @@ SRC_URI  =3D "\
=20
 SRC_URI[sha256sum] =3D "232ec755f4b1f445f829996885846abba6f1b6fd55d04947=
6ab26ddd8c4b4e1b"
=20
-S =3D "${WORKDIR}/debootstrap"
+S =3D "${UNPACKDIR}/debootstrap"
=20
 DEPENDS =3D " \
     virtual/fakeroot-native \
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.b=
b b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
index 599675a345..bc558b7d62 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
@@ -10,7 +10,6 @@ SRC_URI:append:class-target =3D " file://oe-remote.repo=
.sample"
=20
 inherit setuptools3-base
=20
-S =3D "${WORKDIR}/git"
=20
 do_install:append() {
     install -d ${D}${datadir}/dnf
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-oe=
/recipes-devtools/doxygen/doxygen_1.14.0.bb
index 1c8b442eef..512a63549e 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "\
=20
 SRCREV =3D "cbe58f6237b2238c9af7f51c6b7afb8bbf52c866"
=20
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "Release_(?P<pver>\d+(\_\d+)+)"
=20
diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.=
12.9.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.=
9.bb
index b567f11f5c..c6db2ef38c 100644
--- a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.9.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38f617473e9f73=
73b5e79baf437accf8"
=20
 SRC_URI =3D "git://github.com/editorconfig/editorconfig-core-c.git;proto=
col=3Dhttps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "e082c947e7f7b14240195d55c060a6e1eda1b0a1"
=20
 inherit cmake
diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/reci=
pes-devtools/exprtk/exprtk_git.bb
index 74a14f4f08..bdaa39b402 100644
--- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
+++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
@@ -7,7 +7,6 @@ SRCREV =3D "a4b17d543f072d2e3ba564e4bc5c3a0d2b05c338"
=20
 SRC_URI =3D "git://github.com/ArashPartow/exprtk.git;branch=3Drelease;pr=
otocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 # other packages commonly reference the file directly as "exprtk.hpp"
 # create symlink to allow this usage
diff --git a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb b/=
meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
index a4cd7ad157..83e9383d4a 100644
--- a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
+++ b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
@@ -7,7 +7,6 @@ DEPENDS =3D "openssl"
 SRC_URI =3D "git://git.pengutronix.de/git/extract-cert;protocol=3Dhttps;=
branch=3Dmaster;"
 SRCREV =3D "d652b4e8279aef2a85f58676ab472744bafeafc9"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-o=
e/recipes-devtools/flatbuffers/flatbuffers.bb
index 3103fd0091..c51a49ba01 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -13,7 +13,6 @@ DEPENDS =3D "flatbuffers-native"
 RDEPENDS:${PN}-compiler =3D "${PN}"
 RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE +=3D " \
     -DFLATBUFFERS_BUILD_TESTS=3DOFF \   =20
diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb =
b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
index 1fab013580..feb206f27c 100644
--- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57"
=20
 require flatbuffers.inc
=20
-S =3D "${WORKDIR}/git/python"
+S =3D "${UNPACKDIR}/${BP}/python"
=20
 RDEPENDS:${PN} =3D "flatbuffers"
=20
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/reci=
pes-devtools/flatcc/flatcc_git.bb
index 2530dac526..2565e3b9bd 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -14,7 +14,6 @@ SRC_URI =3D " \
 "
 SRCREV =3D "1653ec964730ec7d9892a08a1695ada6d20f5196"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb b/meta-oe/recip=
es-devtools/grpc/grpc_1.71.0.bb
index 6b1a6e5453..53867b8fe6 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
@@ -23,7 +23,6 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${PN}-comp=
iler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
-S =3D "${WORKDIR}/git"
 SRCREV_grpc =3D "4e9357bca1408596663a218c0c608a4c0560a867"
 BRANCH =3D "v1.71.x"
 SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgr=
pc;branch=3D${BRANCH} \
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.9.bb b/meta-oe/re=
cipes-devtools/guider/guider_3.9.9.bb
index 9c956f0ed1..27f39ed1e1 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.9.bb
@@ -10,7 +10,6 @@ PV =3D "3.9.9"
 SRC_URI =3D "git://github.com/iipeace/${BPN};branch=3Dmaster;protocol=3D=
https;tag=3Dversions/${PV}"
 SRCREV =3D "118ab61773463e56dedc78f5cf6723b97a4ad946"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta=
-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
index 599fd2c373..3aca51ee3e 100644
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/KDE/heaptrack.git;protoco=
l=3Dhttps;branch=3Dmaster \
=20
 SRCREV =3D "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-o=
e/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index cc21c8beae..aa1f417604 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -20,7 +20,6 @@ SRCREV =3D "630434bb0ac619f7beec927569782d924c459385"
 PV_LONG :=3D "${PV}-171-g${SRCREV}"
 PV .=3D "+git"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools ptest
=20
diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-v=
alidator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-s=
chema-validator_2.2.0.bb
index 02dcdb2696..241fd328d8 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r_2.2.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validato=
r_2.2.0.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/pboettch/json-schema-vali=
dator;branch=3Dmain;protocol=3D
=20
 SRCREV =3D "6b17782d6a5d1dee5d2c4fc5d25ffb1123913431"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "nlohmann-json"
=20
diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/m=
eta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index d6e42c81d5..56ddaf59a5 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "file://json_spirit_v${PV}.zip \
            file://0001-Link-to-libatomic.patch \
 "
=20
-S =3D "${WORKDIR}/json_spirit_v${PV}"
+S =3D "${UNPACKDIR}/json_spirit_v${PV}"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb b/meta-oe/=
recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
index 28820baf48..f68ffd2c0f 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
@@ -16,7 +16,6 @@ PE =3D "1"
 SRCREV =3D "89e2973c754a9c02a49974d839779b151e95afd6"
 SRC_URI =3D "git://github.com/open-source-parsers/jsoncpp;branch=3Dmaste=
r;protocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb b/meta-oe/=
recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
index 75f2a53b10..ae86e20a4a 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/cinemast/libjson-rpc-cpp;=
branch=3Dmaster;protocol=3Dhttp
=20
 SRCREV =3D "ec5ce12fc9c0299e1454cc002c70218b5a6f005b"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[coverage] =3D "-DWITH_COVERAGE=3DYES,-DWITH_COVERAGE=3DNO,=
,"
diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb b/meta-oe/=
recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
index 57a9cbade1..5ad953d260 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/Thalhammer/jwt-cpp.git;bran=
ch=3Dmaster;protocol=3Dhttps
=20
 SRCREV =3D "e71e0c2d584baff06925bbb3aad683f677e4d498"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "openssl"
=20
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends=
_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-fronten=
ds_4.11.0.1.bb
index efa8c936b4..43a61908f5 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0=
.1.bb
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0=
.1.bb
@@ -23,7 +23,6 @@ SRCREV =3D "f22fce3a308be1c7790ebefc6bbedb33c5f7c86a"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
 do_configure:prepend () {
diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb b/meta-oe/r=
ecipes-devtools/lapack/lapack_3.12.1.bb
index 7cb6c097f3..63069b4b83 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
@@ -20,7 +20,6 @@ SRCREV =3D "5ebe92156143a341ab7b14bf76560d30093cfc54"
 SRC_URI =3D "git://github.com/Reference-LAPACK/lapack.git;protocol=3Dhtt=
ps;branch=3Dmaster \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest'=
, '', d)} \
           "
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[lapacke] =3D "-DLAPACKE=3DON,-DLAPACKE=3DOFF"
diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/rec=
ipes-devtools/lemon/lemon_3.44.2.bb
index 2904a454dc..8a8491b76b 100644
--- a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
+++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/sqlite/sqlite;protocol=3Dht=
tps;branch=3Dbranch-3.44"
=20
 SRCREV =3D "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
=20
-S =3D "${WORKDIR}/git"
=20
 do_compile() {
     ${CC} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o lemon
diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb b/me=
ta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
index 9b18269bcb..3616eb519d 100644
--- a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
+++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
@@ -16,7 +16,6 @@ inherit autotools-brokensep pkgconfig
 # sombok-2.4.0
 SRCREV =3D "0098d85a037ef5c99a648a3669a077781a45e8cc"
=20
-S =3D "${WORKDIR}/git"
=20
 # Disable libthai support
 EXTRA_OECONF =3D "--disable-libthai"
diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta=
-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 5b357e2492..c9d0c94740 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/ToruNiina/toml11;branch=3D=
main;protocol=3Dhttps \
 "
 SRCREV_FORMAT =3D "json_doctest"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/re=
cipes-devtools/libubox/libubox_git.bb
index 131929b30e..394cf9c000 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -25,7 +25,6 @@ PV =3D "1.0.1+git"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb b/meta-oe/recipe=
s-devtools/lshw/lshw_02.20.bb
index 0fb68d8684..95e2084255 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
@@ -18,7 +18,6 @@ SRC_URI =3D " \
     file://0001-disable-docbook2man.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_git.bb
index 58cfcb2f06..f84d989eef 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -31,7 +31,6 @@ SRC_URI =3D "git://gitlab.com/cespedes/ltrace.git;proto=
col=3Dhttps;branch=3Dmain \
            "
 SRC_URI:append:libc-musl =3D " file://add_ppc64le.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
index cbad79f3ae..f4a1345ab2 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protoc=
ol=3Dhttp;branch=3Dv2.1 \
 PV =3D "2.1"
 SRCREV =3D "538a82133ad6fddfd0ca64de167c4aca3bc1a2da"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig binconfig siteinfo
=20
diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb b/meta-=
oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
index 7fb0965813..59bc4dfcfe 100644
--- a/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
@@ -8,7 +8,6 @@ DEPENDS +=3D "lua-native lua virtual/crypt"
 SRC_URI =3D "git://github.com/luaposix/luaposix.git;branch=3Drelease-v36=
.2;protocol=3Dhttps \
 "
 SRCREV =3D "5a8d8c768fc3c51f42cb591e9523a60399efc6a1"
-S =3D "${WORKDIR}/git"
 LUA_VERSION =3D "5.4"
=20
 B =3D "${S}"
diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb b/meta-o=
e/recipes-devtools/makeself/makeself_2.5.0.bb
index f94025dd05..57c8417f44 100644
--- a/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
+++ b/meta-oe/recipes-devtools/makeself/makeself_2.5.0.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "\
=20
 SRCREV =3D "09488c50c6bdc40aec8e3a9b23a539c5054a634c"
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb b/meta-oe/re=
cipes-devtools/mbpoll/mbpoll_1.5.2.bb
index 028a8f9e46..4590b49955 100644
--- a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
+++ b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
@@ -11,6 +11,5 @@ DEPENDS =3D "libmodbus (>=3D3.1.4)"
 SRC_URI =3D "git://github.com/epsilonrt/mbpoll;protocol=3Dhttps;branch=3D=
master"
 SRCREV =3D "a0bd6c08d3d15b086f2104477295c0705aed366a"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig cmake
diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/re=
cipes-devtools/memstat/memstat_1.0.bb
index 502843c0d1..a65782d017 100644
--- a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -8,7 +8,7 @@ SECTION =3D "devtool"
=20
 LICENSE =3D "GPL-2.0-only"
=20
-S =3D "${WORKDIR}/memstattool"
+S =3D "${UNPACKDIR}/memstattool"
=20
 LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D87be186443b1ac2cfa46=
6f475e1ee0cb"
=20
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb b/meta=
-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
index 9331cd16fe..a312be4aa7 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
@@ -12,7 +12,7 @@ inherit python3native python3targetconfig
 SRC_URI =3D "https://www.mercurial-scm.org/release/${BP}.tar.gz"
 SRC_URI[sha256sum] =3D "f75d6a4a75823a1b7d713a4967eca2f596f466e58fc6bc06=
d72642932fd7e307"
=20
-S =3D "${WORKDIR}/mercurial-${PV}"
+S =3D "${UNPACKDIR}/mercurial-${PV}"
=20
 BBCLASSEXTEND =3D "native"
=20
diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.b=
b b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
index 8ba121d5ea..2fbbf8f06a 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/microsoft/GSL.git;protoco=
l=3Dhttps;branch=3Dmain \
 "
 SRCREV =3D "a3534567187d2edc428efd3f13466ff75fe5805c"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig ptest
=20
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb b/meta-o=
e/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
index 40d997a52c..aa7629763c 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/msgpack/msgpack-c;branch=3D=
c_master;protocol=3Dhttps \
            "
 SRCREV =3D "8160ede5e20fd3019a77eea46d9c72cf6163f802"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb b/meta=
-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
index ccbaf9cea7..3457964609 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_6.1.1.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "5fd555742e37bbd58d166199e669f01=
f743c7b3c6177191dd7b31fb0c3
 UPSTREAM_CHECK_URI =3D "https://github.com/msgpack/msgpack-c/releases"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/msgpack-cxx-${PV}"
+S =3D "${UNPACKDIR}/msgpack-cxx-${PV}"
=20
 DEPENDS +=3D "boost"
=20
diff --git a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb b/meta-o=
e/recipes-devtools/msr-tools/msr-tools_1.3.bb
index 51fb98ccc8..2183170ba6 100644
--- a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
+++ b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
@@ -7,7 +7,7 @@ SECTION =3D "devel"
 SRC_URI =3D "https://01.org/sites/default/files/downloads/msr-tools/msr-=
tools-${PV}.zip"
 SRC_URI[sha256sum] =3D "f9457b5340f5f274da4239a461f0db6b514142b40461559d=
9c6150f05aab1d1e"
=20
-S =3D "${WORKDIR}/msr-tools-master"
+S =3D "${UNPACKDIR}/msr-tools-master"
=20
 COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
=20
diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/rec=
ipes-devtools/musl/musl-nscd_git.bb
index 82e5c3bc5e..ef2553760d 100644
--- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_COMMITS =3D "1"
=20
 inherit autotools-brokensep
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure () {
     # no debug set -s flag
diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb =
b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
index 36e46021bb..ec87535ec7 100644
--- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -12,7 +12,6 @@ SRCREV =3D "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 # nlohmann-fifo is a header only C++ library, so the main package will b=
e empty.
=20
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.=
bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
index 58567a781e..4e0a34eb2e 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
@@ -16,7 +16,6 @@ SRCREV_json-test-data =3D "a1375cea09d27cc1c4cadb8d0047=
0375b421ac37"
=20
 SRCREV_FORMAT .=3D "_json-test-data"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
index d4b818f967..7d48717b1a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
@@ -8,8 +8,7 @@ SRC_URI =3D "\
=20
 inherit native
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 B =3D "${WORKDIR}/build"
=20
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_22.16.0.bb
index b29c83400a..4bc829f140 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -40,7 +40,7 @@ SRC_URI:append:toolchain-clang:powerpc64le =3D " \
            "
 SRC_URI[sha256sum] =3D "720894f323e5c1ac24968eb2676660c90730d715cb7f090b=
e71a668662a17c37"
=20
-S =3D "${WORKDIR}/node-v${PV}"
+S =3D "${UNPACKDIR}/node-v${PV}"
=20
 CVE_PRODUCT +=3D "node.js"
=20
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/re=
cipes-devtools/openocd/openocd_git.bb
index b1ce2ec168..0252a063ae 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -19,7 +19,6 @@ SRCREV_jimtcl =3D "fcbb4499a6b46ef69e7a95da53e30796e208=
17f0"
 SRCREV_libjaylink =3D "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
=20
 PV =3D "0.12+git"
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig autotools-brokensep gettext
=20
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/rec=
ipes-devtools/pahole/pahole_1.29.bb
index d5fa3b4746..aca915bf32 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
@@ -13,7 +13,6 @@ SRCREV =3D "b9cc7963051b2099795129450f9b70c81950d02f"
 SRC_URI =3D "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=
=3Dmaster \
            file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-p=
yth.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/reci=
pes-devtools/pcimem/pcimem_2.0.bb
index 52af9b99b1..130980b0cd 100644
--- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
+++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/billfarrow/pcimem.git;bra=
nch=3Dmaster;protocol=3Dhttps"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     install -D -m 0755 ${B}/pcimem ${D}${bindir}/pcimem
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/rec=
ipes-devtools/perfetto/perfetto.inc
index 3cd0cb91b8..1c7e9144cc 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -10,4 +10,3 @@ SRCREV_perfetto =3D "c74251226a8caa0b43377902ee06d2570f=
aa0c15"
 SRCREV_FORMAT =3D "perfetto"
 PV =3D "47.0"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb b/meta-oe/=
recipes-devtools/perl/dbd-mariadb_1.24.bb
index 3b686f7fdc..65f2ec232a 100644
--- a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
+++ b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "f977a25b4116a0a95a7c8a894fd3709=
7abe19af9a6a9ed4d800604ec17
=20
 RDEPENDS:${PN} =3D "libdbi-perl"
=20
-S =3D "${WORKDIR}/DBD-MariaDB-${PV}"
+S =3D "${UNPACKDIR}/DBD-MariaDB-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb b/meta-oe/re=
cipes-devtools/perl/exiftool_12.89.bb
index 3d745146f1..69a4f79815 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
@@ -10,7 +10,6 @@ inherit cpan
 SRCREV =3D "e04534a40925354187e8432d44248229d774f34a"
 SRC_URI =3D "git://github.com/exiftool/exiftool;protocol=3Dhttps;branch=3D=
master"
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} =3D " \
     perl \
diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb b/meta-o=
e/recipes-devtools/perl/ipc-run_20231003.0.bb
index e28b6ea018..9cdb0a52cc 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
@@ -12,7 +12,6 @@ DEPENDS =3D "perl"
 SRC_URI =3D "git://github.com/toddr/IPC-Run.git;branch=3Dmaster;protocol=
=3Dhttps"
 SRCREV =3D "ad56c3b5f5a211d32bbb8ac29f180d707ee58c1b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cpan
=20
diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb=
 b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
index 9171cbc89c..4886333f3a 100644
--- a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
+++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/T=
L/TLINDEN/${SRCNAME}-${PV}.
=20
 SRC_URI[sha256sum] =3D "473d65127b23dac0e8039c01e28bc4072cb9a6e93e81a1ea=
4893cea08c698db0"
=20
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 EXTRA_CPANFLAGS =3D "EXPATLIBPATH=3D${STAGING_LIBDIR} EXPATINCPATH=3D${S=
TAGING_INCDIR}"
=20
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe=
/recipes-devtools/perl/libdbi-perl_1.647.bb
index f70f737ba2..c128cb7154 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65f65488c774=
efe1da488e36ad6c4a36"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
 SRC_URI[sha256sum] =3D "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300=
ce50174ad867d9aa"
=20
-S =3D "${WORKDIR}/DBI-${PV}"
+S =3D "${UNPACKDIR}/DBI-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb b=
/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
index 21e46f5521..43614d55ac 100644
--- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "https://cpan.metacpan.org/modules/by-modul=
e/Devel/Devel-CheckLib-${PV
 "
 SRC_URI[sha256sum] =3D "869d38c258e646dcef676609f0dd7ca90f085f56cf6fd700=
1b019a5d5b831fca"
=20
-S =3D "${WORKDIR}/Devel-CheckLib-${PV}"
+S =3D "${UNPACKDIR}/Devel-CheckLib-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb b/meta-=
oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
index 6029b7aae9..1464a84d34 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.20.bb
@@ -7,7 +7,7 @@ SRC_URI =3D "http://www.cpan.org/modules/by-module/IO/IO-=
Tty-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "b15309fc85623893289cb9b2b88dfa9ed1e69156b75f2993=
8553a45be6d730af"
=20
-S =3D "${WORKDIR}/IO-Tty-${PV}"
+S =3D "${UNPACKDIR}/IO-Tty-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb b/meta=
-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
index 407ba39140..ded0dea0d1 100644
--- a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
+++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/makamaka/JSON.git;protoco=
l=3Dhttps;branch=3Dmaster"
=20
 SRCREV =3D "39bc0e567c202762a575fed2844ebdb941c3ca09"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cpan
=20
diff --git a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb b/m=
eta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
index b77a5c95a2..a7e05922d6 100644
--- a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
+++ b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "https://www.cpan.org/authors/id/W/WB/WBRAS=
WELL/Parse-Yapp-${PV}.tar.g
=20
 SRC_URI[sha256sum] =3D "3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a=
8b8e340ca65f13e5"
=20
-S =3D "${WORKDIR}/Parse-Yapp-${PV}"
+S =3D "${UNPACKDIR}/Parse-Yapp-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb b/meta-=
oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
index 1bdb332a75..3e4137a68c 100644
--- a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
+++ b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "5cc834438739bd6e4e837fb7e10bd8b=
efb809cd185ae6cf4b33e5fa916
 UPSTREAM_CHECK_URI =3D "https://cpan.metacpan.org/authors/id/W/WH/WHOM/"
 UPSTREAM_CHECK_REGEX =3D "pcsc-perl-(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/pcsc-perl-${PV}"
+S =3D "${UNPACKDIR}/pcsc-perl-${PV}"
=20
 inherit cpan pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb b/=
meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
index 4ce31d6fe6..981c946483 100644
--- a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
+++ b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "https://cpan.metacpan.org/authors/id/N/NW/=
NWCLARK/PerlIO-gzip-${PV}.t
=20
 SRC_URI[sha256sum] =3D "4848679a3f201e3f3b0c5f6f9526e602af52923ffa471a2a=
3657db786bd3bdc5"
=20
-S =3D "${WORKDIR}/PerlIO-gzip-${PV}"
+S =3D "${UNPACKDIR}/PerlIO-gzip-${PV}"
=20
 EXTRA_CPANFLAGS =3D "EXPATLIBPATH=3D${STAGING_LIBDIR} EXPATINCPATH=3D${S=
TAGING_INCDIR}"
=20
diff --git a/meta-oe/recipes-devtools/php/php_8.4.6.bb b/meta-oe/recipes-=
devtools/php/php_8.4.6.bb
index 1b8c019a5d..5118ddd6ab 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.6.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D " \
             file://php-fpm.service \
           "
=20
-S =3D "${WORKDIR}/php-${PV}"
+S =3D "${UNPACKDIR}/php-${PV}"
=20
 SRC_URI[sha256sum] =3D "9cf2734509b603f6589617ab52a9712a03e0fe059951cddd=
2d4623df4bf7c6c6"
=20
diff --git a/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb b/meta-=
oe/recipes-devtools/pistache/pistache_0.4.26.bb
index feffff623d..b0a20e3ece 100644
--- a/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
+++ b/meta-oe/recipes-devtools/pistache/pistache_0.4.26.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/pistacheio/pistache.git;bra=
nch=3Dmaster;protocol=3Dhttps
 # SRCREV tagged 0.4.26
 SRCREV =3D "ddffda861aa49012dcda28f1362d0339e718cd52"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "rapidjson"
=20
diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-de=
vtools/ply/ply_git.bb
index 5a39456b2d..916ff29118 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -10,7 +10,6 @@ PV =3D "2.4.0"
 SRC_URI =3D "git://github.com/iovisor/ply;branch=3Dmaster;protocol=3Dhtt=
ps"
 SRCREV =3D "282558cfa1c0f0e095354e3a6ec4486b524179dc"
=20
-S =3D "${WORKDIR}/git"
=20
 CACHED_CONFIGUREVARS =3D 'LD=3D"${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS}=
 ${HOST_LD_ARCH}"'
=20
diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
index 7b06d10526..f3ffccf626 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e0=
9bc07f8cf64135026d91"
 SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain"
 SRCREV =3D "8a3bdd7e0a43b44e3b32548543128d95e68a3802"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb b/meta=
-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
index 7640797771..30c9e19b16 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
@@ -19,7 +19,6 @@ SRC_URI:append:class-native =3D " file://0001-Makefile.=
am-do-not-compile-the-code-
=20
 SRCREV =3D "185beed28e65494be7505b30c1afeaf199e19b23"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
index 30b805e6b1..61aff1da28 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
@@ -26,7 +26,6 @@ SRC_URI:append:mipsarcho32:toolchain-clang =3D " file:/=
/0001-Fix-build-on-mips-cla
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.(25\.(\d+)))"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "google:protobuf protobuf:protobuf google-protobuf proto=
buf-cpp"
=20
diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb b/meta-=
oe/recipes-devtools/python/python3-apt_2.5.3.bb
index 1d54b9f6af..d5c440f413 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://salsa.debian.org/apt-team/python-apt.g=
it;protocol=3Dhttps;branch=3D
=20
 SRCREV =3D "3252935b6224b3bd2e2250894b9559b47c61b2e1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39=
.bb b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
index a98dfab6d9..d80eac7756 100644
--- a/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
+++ b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
@@ -10,6 +10,6 @@ SRC_URI[sha256sum] =3D "723f24f4d65fc8d99b33a002fbbb377=
1d4cc9d664c97085bf37f3997ae
=20
 inherit setuptools3
=20
-S =3D "${WORKDIR}/python-distutils-extra-${PV}"
+S =3D "${UNPACKDIR}/python-distutils-extra-${PV}"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-o=
e/recipes-devtools/rapidjson/rapidjson_git.bb
index 8519479c4d..724d329ee2 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -10,7 +10,6 @@ SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"
=20
 PV =3D "1.1.0+git"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/=
meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
index 29abfe1af5..672c46055d 100644
--- a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -9,7 +9,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "45eb2ffa5378396e85432872833890b0a1cba872"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb b/meta-oe=
/recipes-devtools/sexpect/sexpect_2.3.15.bb
index b97700e53d..72ccd1d6b7 100644
--- a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
+++ b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
@@ -7,6 +7,5 @@ BRANCH =3D "master"
 SRC_URI =3D "git://github.com/clarkwang/sexpect;branch=3D${BRANCH};proto=
col=3Dhttps;tag=3Dv${PV}"
 SRCREV =3D "d3645392424d47532be90fcbc0abf3148324785b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb b/meta=
-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
index bf5c52fe50..ea4fc5d3dd 100644
--- a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
+++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "ncurses"
 SRC_URI =3D "git://github.com/ColinIanKing/smemstat.git;protocol=3Dhttps=
;branch=3Dmaster"
 SRCREV =3D "1edc560602aa116b96408110b8b9d66a4edef60e"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit bash-completion
=20
diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb b/meta=
-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
index 17c24d5abf..ee203f83e2 100644
--- a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
+++ b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
@@ -12,7 +12,6 @@ SRC_URI =3D " \
     git://github.com/fnc12/sqlite_orm;protocol=3Dhttps;branch=3Dmaster \
     file://0001-fix-cstdint-error-with-gcc-15.0.1.patch \
 "
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE +=3D "-DSqliteOrm_BuildTests=3DOFF -DLIB_INSTALL_DIR=3D${l=
ibdir} \
                   -DCMAKE_INSTALL_DIR=3D${libdir}/cmake \
diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng=
_1.3.2.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_=
1.3.2.bb
index 10e0e27a20..966d14874e 100644
--- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.=
bb
+++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.=
bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3Da709b68f1=
ce8a9f10aeea6401446c1f4 \
 SRCREV =3D "667faf69cc35215e33e747b4bffdcba3643c2629"
 SRC_URI =3D "git://github.com/AgentD/squashfs-tools-ng.git;protocol=3Dht=
tps;branch=3Dfixes-1.3.0"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/re=
cipes-devtools/ssd1306/ssd1306_git.bb
index 2c01e126ff..7824ed1a68 100644
--- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
@@ -11,7 +11,6 @@ SRC_URI =3D " \
 "
 SRCREV =3D "34b42992a43fda69c6ba2557b718601cafe16251"
=20
-S =3D "${WORKDIR}/git"
=20
 # coreutils provides fmt which is used in the Makefile
 DEPENDS =3D "i2c-tools coreutils-native"
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b=
/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 7b194790a3..94fd271e3c 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/DrTimothyAldenDavis/SuiteSp=
arse;protocol=3Dhttps;branc
            "
 SRCREV =3D "538273cfd53720a10e34a3d80d3779b607e1ac26"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "cmake-native lapack gmp mpfr chrpath-native"
=20
diff --git a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl=
.bb b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
index 3360ccf357..84a77e6fd8 100644
--- a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
+++ b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
@@ -7,8 +7,7 @@ inherit nativesdk
=20
 SRC_URI =3D "file://systemctl"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
 	install -d ${D}${bindir}
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb b/meta-oe/reci=
pes-devtools/tclap/tclap_1.4.0.bb
index 60dbc7b422..6f452d3b93 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5c64b2e8cc50=
917b2744a90950faa7cd"
 SRCREV =3D "81b3d2a0c47895c22e9bb8c577f5ab521f76e5d2"
 SRC_URI =3D "git://git.code.sf.net/p/tclap/code;branch=3D1.4"
=20
-S =3D "${WORKDIR}/git"
 inherit cmake
=20
 ALLOW_EMPTY:${PN} =3D "1"
diff --git a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb b/meta-oe/recip=
es-devtools/tcltk/tk8_8.6.15.bb
index 8518fb8dfe..8cb9f6cb5e 100644
--- a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
@@ -29,7 +29,7 @@ SRC_URI[sha256sum] =3D "550969f35379f952b3020f3ab7b9dd5=
bfd11c1ef7c9b7c6a75f5c49aca
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX =3D "Tcl/(?P<pver>\d+(\.\d+)+)/"
=20
-S =3D "${WORKDIR}/tk${PV}"
+S =3D "${UNPACKDIR}/tk${PV}"
=20
 # Short version format: "8.6"
 VER =3D "${@os.path.splitext(d.getVar('PV'))[0]}"
diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes=
-devtools/tcltk/tk_9.0.1.bb
index 8701686b11..504b40927e 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] =3D "d6f01a4d598bfc6398be9584e1bab82=
8c907b0758db4bbb351a1429106
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX =3D "Tcl/(?P<pver>\d+(\.\d+)+)/"
=20
-S =3D "${WORKDIR}/${BPN}${PV}"
+S =3D "${UNPACKDIR}/${BPN}${PV}"
=20
 # Short version format: "8.6"
 VER =3D "${@os.path.splitext(d.getVar('PV'))[0]}"
diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb b/=
meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
index a6ec89a2ff..da8b1602be 100644
--- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
+++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;pro=
tocol=3Dhttps;branch=3Dmaster
=20
 PV =3D "3.4.0"
 SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "cmake-native"
=20
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb b/meta-oe/r=
ecipes-devtools/uftrace/uftrace_0.17.bb
index 8fecadb22f..776bb014f4 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
@@ -13,7 +13,6 @@ inherit autotools
 SRCREV =3D "b0d936107edcefb519abbc9c363ca40daaac23b3"
 SRC_URI =3D "git://github.com/namhyung/${BPN};branch=3Dmaster;protocol=3D=
https \
            file://0001-include-libgen.h-for-basename.patch"
-S =3D "${WORKDIR}/git"
=20
 LDFLAGS:append:libc-musl =3D " -largp"
=20
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgr=
ades_2.9.1.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-u=
pgrades_2.9.1.bb
index e37dbcd02f..3d92f59ff2 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.=
9.1.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.=
9.1.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/mvo5/unattended-upgrades.=
git;protocol=3Dhttps;branch=3Dm
=20
 SRCREV =3D "5aff8fa2b5b60b7c11bbfb39c884477e72d11d02"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3_legacy
=20
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/=
recipes-devtools/uw-imap/uw-imap_2007f.bb
index 54d33379da..877f1d57f6 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "https://fossies.org/linux/misc/old/imap-${=
PV}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b7719101=
31004eb520004a28"
=20
-S =3D "${WORKDIR}/imap-${PV}"
+S =3D "${UNPACKDIR}/imap-${PV}"
=20
 CVE_STATUS[CVE-2005-0198] =3D "fixed-version: The CPE in the NVD databas=
e doesn't reflect correctly the vulnerable versions."
=20
diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb b/meta-o=
e/recipes-devtools/valijson/valijson_1.0.6.bb
index 7f5d0b1416..4e5f02746c 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5c4583a434195e=
4f3b418e17c8ca2daf"
 SRC_URI =3D "git://github.com/tristanpenman/valijson.git;branch=3Dmaster=
;protocol=3Dhttps;tag=3Dv${PV}"
 SRCREV =3D "4edda758546436462da479bb8c8514f8a95c35ad"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-=
oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
index e9442697fa..3b923fb99e 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branc=
h=3Dmaster;protocol=3Dhttps \
            "
 SRCREV =3D "8ce36bce2438df9b02fcaafd19efa90a56426601"
=20
-S =3D "${WORKDIR}/git/advanced"
+S =3D "${UNPACKDIR}/${BP}/advanced"
=20
 inherit autotools-brokensep binconfig pkgconfig
=20
diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recip=
es-devtools/yajl/yajl_1.0.12.bb
index 186f2c8ed0..3e569859b7 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/lloyd/yajl;nobranch=3D1;p=
rotocol=3Dhttps"
=20
 inherit cmake lib_package
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')}"
=20
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipe=
s-devtools/yajl/yajl_2.1.0.bb
index c5b5e60027..e4434bee45 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/lloyd/yajl;branch=3Dmaste=
r;protocol=3Dhttps \
            "
 SRCREV =3D "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake lib_package
=20
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-=
devtools/yasm/yasm_git.bb
index de7eb45c1d..68895a1697 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/yasm/yasm.git;branch=3Dma=
ster;protocol=3Dhttps \
            file://0001-bitvect-fix-build-with-gcc-15.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools gettext python3native
=20
diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipe=
s-extended/7zip/7zip_24.09.bb
index 4b6c7a613c..74e44c44e3 100644
--- a/meta-oe/recipes-extended/7zip/7zip_24.09.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
@@ -14,7 +14,6 @@ SRCREV =3D "e5431fa6f5505e385c6f9367260717e9c47dc2ee"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/ip7z/7zip/releases/latest"
=20
-S =3D "${WORKDIR}/git"
=20
 # Support Yocto cross compiling
 CXXFLAGS:append:toolchain-clang =3D " -Wno-error=3Dcast-qual -Wno-error=3D=
sign-conversion \
diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb b/meta-oe/recip=
es-extended/7zip/bit7z_4.0.9.bb
index 645ea1a2ae..033461d614 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.9.bb
@@ -32,7 +32,6 @@ SRCHASH_CPM =3D "c8cdc32c03816538ce22781ed72964dc864b2a=
34a310d3b7104812a5ca2d835d"
 TAG_CPM =3D "0.40.2"
 SRC_URI[sha256sum] =3D "${SRCHASH_CPM}"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-extended/beep/beep_1.4.12.bb b/meta-oe/recip=
es-extended/beep/beep_1.4.12.bb
index a4bc10c366..a8d720d9dd 100644
--- a/meta-oe/recipes-extended/beep/beep_1.4.12.bb
+++ b/meta-oe/recipes-extended/beep/beep_1.4.12.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
 SRC_URI =3D "git://github.com/spkr-beep/beep.git;protocol=3Dhttps;branch=
=3Dmaster \
            file://0001-beep-library-Make-it-compatible-with-c99.patch"
 SRCREV =3D "11453a79f2cea81832329b06ca3a284aa7a0a52e"
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "prefix=3D'${prefix}' CFLAGS=3D'${CFLAGS}' LDFLAGS=3D'$=
{LDFLAGS}'"
=20
diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb b/meta-oe/r=
ecipes-extended/bitwise/bitwise_0.50.bb
index 4d560eb4b8..397829c87b 100644
--- a/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D "806271fa5bf31de0600315e8720004a=
8f529954480e991ca84a9868dc1
 UPSTREAM_CHECK_URI =3D "https://github.com/mellowcandle/bitwise/releases=
"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/${BPN}-v${PV}"
+S =3D "${UNPACKDIR}/${BPN}-v${PV}"
=20
 DEPENDS =3D "ncurses readline"
=20
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta=
-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index cfd134dd4f..b2cfd9b874 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -41,7 +41,6 @@ inherit gettext autotools pkgconfig features_check syst=
emd
=20
 REQUIRED_DISTRO_FEATURES +=3D "opengl"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "\
     --enable-libraries \
diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/re=
cipes-extended/brotli/brotli_1.1.0.bb
index 58214ea59c..411f8a7610 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D941ee9cd1=
609382f946352712a319b4b"
 SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dmaster;protocol=
=3Dhttps"
 SRCREV =3D "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake lib_package
=20
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb b=
/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
index dad8e8e8e2..26c80195b0 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.g=
it;protocol=3Dhttps;branch=3Dma
=20
 SRCREV  =3D "e0760b2e9657907e691be4df384ca7617109635d"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/re=
cipes-extended/cmatrix/cmatrix_2.0.bb
index 829e9588c8..e1a6af622b 100644
--- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
@@ -8,7 +8,6 @@ SRC_URI =3D " \
     file://0001-reproducibility-Prevent-configuration-from-reading-h.pat=
ch \
 "
 SRCREV =3D "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.b=
b b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
index e1f6c558df..da710eaedb 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/kkaempf/cmpi-bindings.git=
;protocol=3Dhttps;branch=3Dmain
            "
=20
 SRCREV =3D "49d6dcfc71ca421100fcf325e31625817c469fc9"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake python3targetconfig
=20
diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb b/met=
a-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
index f2dbe4029b..7c596371e5 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://invisible-mirror.net/archives/${BP=
N}/${BP}.tgz"
 SRC_URI[sha256sum] =3D "68406329827b783d0a8959cc20a94c6e1791ac861a27f854=
e06e9020541816dd"
=20
 # hardcoded here for use in dialog-static recipe
-S =3D "${WORKDIR}/dialog-${PV}"
+S =3D "${UNPACKDIR}/dialog-${PV}"
=20
 inherit autotools-brokensep pkgconfig
=20
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 888289b357..8b48d20aac 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/COVESA/${BPN}.git;protoco=
l=3Dhttps;branch=3Dmaster \
            "
 SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
 systemd systemd-watchdog systemd-journal ', '', d)} \
  dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console =
\
diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta=
-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
index ec0b4da935..71305cc35f 100644
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -20,7 +20,6 @@ SRC_URI =3D "\
     git://github.com/docopt/docopt.cpp.git;protocol=3Dhttps;branch=3Dmas=
ter \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb b/meta=
-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
index 310081b822..ad2aee4570 100644
--- a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
+++ b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5940d39995ea68=
57d01b8227109c2e9c"
=20
 SRCREV =3D "89c1502b9d40b5cb4a844498b14d74ba1dd559bf"
 SRC_URI =3D "git://github.com/Yelp/dumb-init;branch=3Dmaster;protocol=3D=
https"
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "CC=3D'${CC}' CFLAGS=3D'${CFLAGS} ${LDFLAGS}'"
=20
diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb b/met=
a-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
index 82f8366aeb..c3a5a02a3f 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
@@ -16,7 +16,6 @@ inherit cmake
=20
 DEPENDS +=3D "grpc protobuf cpprest grpc-native protobuf-native"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "-DCPPREST_EXCLUDE_WEBSOCKETS=3DON"
=20
diff --git a/meta-oe/recipes-extended/figlet/figlet_git.bb b/meta-oe/reci=
pes-extended/figlet/figlet_git.bb
index 9789ac16d4..d226806050 100644
--- a/meta-oe/recipes-extended/figlet/figlet_git.bb
+++ b/meta-oe/recipes-extended/figlet/figlet_git.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1688bcd97b2770=
4f1afcac7336409857"
 SRC_URI =3D "git://github.com/cmatsuoka/figlet.git;branch=3Dmaster;proto=
col=3Dhttps \
            file://0001-build-add-autotools-support-to-allow-easy-cross-c=
omp.patch"
 SRCREV =3D "5bbcd7383a8c3a531299b216b0c734e1495c6db3"
-S =3D "${WORKDIR}/git"
 PV =3D "2.2.5+git"
=20
 inherit autotools
diff --git a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb =
b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
index 5dfba25140..df7a4e2758 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/flatpak/flatpak-xdg-utils.g=
it;protocol=3Dhttps;branch=3D
=20
 SRCREV =3D "05abdd7421688be5835a6b12f2b068086c38d4aa"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.16.0.bb
index 6696d8347b..f99c8ac36a 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
@@ -10,7 +10,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "1440f4faa67ebf69c7559f31d2cab59e6ec6fe2b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check useradd
=20
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
index 4d82abc783..05e4fd937f 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
@@ -32,7 +32,6 @@ SRC_URI:append:libc-musl =3D "\
 # prefix tag with "v" to avoid upgrade to random tags like "20220215"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "\
     aws \
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb b/meta-oe=
/recipes-extended/haveged/haveged_1.9.19.bb
index 7dcc36080a..69de5628c4 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
 SRCREV =3D "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
 SRC_URI =3D "git://github.com/jirka-h/haveged.git;branch=3Dmaster;protoc=
ol=3Dhttps \
 "
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/jirka-h/haveged/releases"
=20
diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb b/meta-oe/re=
cipes-extended/hexedit/hexedit_1.6.bb
index d2b23b41b4..2299d55b2b 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/pixel/hexedit.git;branch=3D=
master;protocol=3Dhttps \
=20
 SRCREV =3D "eab92dcaa34b66bc5182772afc9fda4ac8a27597"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep update-alternatives
=20
diff --git a/meta-oe/recipes-extended/highway/highway_1.2.0.bb b/meta-oe/=
recipes-extended/highway/highway_1.2.0.bb
index e7dfc706bd..ea38310398 100644
--- a/meta-oe/recipes-extended/highway/highway_1.2.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/google/highway.git;protoc=
ol=3Dhttps;branch=3Dmaster \
            file://0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV=
.patch"
=20
 SRCREV =3D "457c891775a7397bdb0376bb1031e6e027af1c48"
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D "-DBUILD_TESTING=3D0 -DCMAKE_BUILD_TYPE=3DRelease"
=20
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/=
recipes-extended/hiredis/hiredis_1.2.0.bb
index dfabbb91a6..8678447cf5 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
@@ -10,7 +10,6 @@ SRC_URI =3D " \
     "
 SRCREV =3D "60e5075d4ac77424809f855ba3e398df7aacefe8"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-extended/inputattach-config/inputattach-conf=
ig.bb b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
index 9bb2e2f1f3..56359d797d 100644
--- a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
+++ b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.=
0-only;md5=3D801f80980d171d
=20
 SRC_URI =3D "file://inputattach.conf"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
diff --git a/meta-oe/recipes-extended/iotop/iotop_1.30.bb b/meta-oe/recip=
es-extended/iotop/iotop_1.30.bb
index 7d04a3b17b..9fe774f9f2 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.30.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.30.bb
@@ -7,7 +7,6 @@ DEPENDS =3D "ncurses"
 SRC_URI =3D "git://github.com/Tomas-M/iotop.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
 SRCREV =3D "c3366a8a235f9c8ddc4797625f22cfdf12ba2c36"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb b/meta=
-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
index 87fcf8cc61..fc94d2caab 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/rhinstaller/isomd5sum.git=
;branch=3Dmaster;protocol=3Dhtt
            file://0002-fix-parallel-error.patch \
 "
=20
-S =3D "${WORKDIR}/git"
 inherit python3native
=20
 EXTRA_OEMAKE +=3D " \
diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/me=
ta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
index bfa0e79d8f..7129d6ef8c 100644
--- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
+++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
@@ -7,7 +7,6 @@ PV =3D "2.3.6+git"
 SRC_URI =3D "git://github.com/snarlistic/jpnevulator.git;protocol=3Dhttp=
s;branch=3Dmaster"
 SRCREV =3D "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
=20
-S =3D "${WORKDIR}/git"
=20
 do_compile() {
 	oe_runmake
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/=
meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index bd3a8f2ff5..f3f70b8da3 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/rnovacek/konkretcmpi.git;=
branch=3Dmaster;protocol=3Dhttp
            "
=20
 SRCREV =3D "ad28225e6eceff88417a60c1ba8896c8e40f21a7"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake python3-dir
=20
diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/=
meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
index 0c2382fe85..6ca8569bc5 100644
--- a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
+++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
@@ -16,7 +16,6 @@ SRCREV =3D "9ae4f4ae4481b1e69d38ed810980d33103544613"
 # The current PV is not a git tag but a README content
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/=
meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
index b98942379e..37c514a219 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/storaged-project/libblock=
dev;branch=3D3.2.x-branch;pro
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.p=
atch \
            "
 SRCREV =3D "b829b60d9ff049abb190f09a3b9a5fac648cd5a3"
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
=20
diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb b/meta-oe=
/recipes-extended/libcbor/libcbor_0.12.0.bb
index 4c5eb8a640..60c3c6fadd 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D6f3b3881df6=
2ca763a02d359a6e94071"
 SRC_URI =3D "git://github.com/PJK/libcbor.git;protocol=3Dhttps;branch=3D=
master"
 SRCREV =3D "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb b/meta-oe/re=
cipes-extended/libcec/libcec_7.0.0.bb
index 532179a9bb..2def38d73f 100644
--- a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/Pulse-Eight/libcec.git;br=
anch=3Drelease;protocol=3Dhttps
            file://0001-Enhance-reproducibility.patch \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb b/met=
a-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
index e3de8aca62..6683c396e2 100644
--- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/ebiggers/libdeflate.git;p=
rotocol=3Dhttps;branch=3Dmaster
     file://0001-lib-arm-don-t-use-explicit-armv8.2-a-on-gcc-13.2-and.pat=
ch \
 "
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "275aa5141db6eda3587214e0f1d3a134768f557d"
=20
 inherit cmake pkgconfig
diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git=
.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
index 87778c6314..9f4b2a19d0 100644
--- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -14,6 +14,5 @@ SRCREV =3D "db9371cf9f38b5a3b2f6e4fae3f92eb052d2d929"
 SRC_URI =3D "git://github.com/libdivecomputer/libdivecomputer.git;protoc=
ol=3Dhttps;branch=3Dmaster \
           "
=20
-S =3D "${WORKDIR}/git"
=20
=20
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb =
b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 7278299a08..7f01962a97 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -11,7 +11,6 @@ inherit autotools pkgconfig python3native python3target=
config
 SRCREV =3D "2117b8fdb6b4096455bd2041a63e59a028120136"
 SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
 CVE_STATUS_LIBLIST[status] =3D "fixed-version: The CPE in the NVD databa=
se doesn't reflect correctly the vulnerable versions."
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/=
meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index bfd4af053c..e29ec88e06 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -13,7 +13,6 @@ PV =3D "2.3.0+git"
 SRCREV =3D "2cd858c679d25633077ca78b67182a9b77653816"
 SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
 CVE_STATUS_LIBLIST[status] =3D "fixed-version: The CPE in the NVD databa=
se doesn't reflect correctly the vulnerable versions."
diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.b=
b b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
index 5a7548a7e6..7869fc1941 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
@@ -11,6 +11,5 @@ PKGV =3D "${GITPKGVTAG}"
 SRCREV =3D "adf9c22b9010490e4b55eaeb14731991db1c172c"
 SRC_URI =3D "git://github.com/libimobiledevice/libusbmuxd;protocol=3Dhtt=
ps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${base_libdir}/udev/rules.d/"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb =
b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
index b9f5c34094..76759fe69d 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
@@ -12,6 +12,5 @@ PV =3D "2.0.2+git"
 SRCREV =3D "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
 SRC_URI =3D "git://github.com/libimobiledevice/libusbmuxd;protocol=3Dhtt=
ps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${base_libdir}/udev/rules.d/"
diff --git a/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb b/meta-oe/=
recipes-extended/libleak/libleak_0.3.6.bb
index e3e4c01acb..8021d8cf06 100644
--- a/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
+++ b/meta-oe/recipes-extended/libleak/libleak_0.3.6.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "gitsm://github.com/WuBingzheng/libleak;pro=
tocol=3Dhttps;branch=3Dmaster \
            file://0001-respect-environment-variables.patch \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure () {
 	:
diff --git a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2=
.bb b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
index 1d650ac63b..c310e0f527 100644
--- a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
+++ b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
@@ -12,4 +12,3 @@ SRC_URI =3D "git://github.com/Jacajack/liblightmodbus.g=
it;protocol=3Dhttps;branch=3Dma
           "
 SRCREV =3D "59d2b405f95701e5b04326589786dbb43ce49e81"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb b/m=
eta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
index b094337e90..99f23fef05 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfile/lib=
lockfile_1.17.orig.tar.gz \
 SRC_URI[sha256sum] =3D "6e937f3650afab4aac198f348b89b1ca42edceb17fb6bb09=
18f642143ccfd15e"
 SRC_URI[1.17-1.sha256sum] =3D "e3657c0e3facfeccb58900c0b48d56cd68ad5f9f2=
4d1b4c6eaa69c26490fb673"
=20
-S =3D "${WORKDIR}/${BP}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 inherit autotools-brokensep
=20
diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb b/me=
ta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
index 0cc128c8c4..89670d10ca 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/rsyslog/liblognorm;branch=
=3Dmaster;protocol=3Dhttps \
            "
 SRCREV =3D "46c6ee4c8e5f827893e485a4ef1aff04ea881273"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb b/met=
a-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
index 80644b0833..ffbb3a8c8e 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd653=
80cdd255951079008b364516c"
 SRC_URI =3D "git://github.com/stephane/libmodbus;branch=3Dmaster;protoco=
l=3Dhttps"
 SRCREV =3D "5190e5e141780ae481f24be16d7b39a5f3ad8f8f"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb =
b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index f08fea7de3..7ec01ecd3f 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/libpwquality/libpwquality=
;branch=3Dmaster;protocol=3Dhtt
 "
 SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep gettext setuptools3-base
=20
diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb b/me=
ta-oe/recipes-extended/libreport/libreport_2.17.15.bb
index 28c64a1614..ba10f062ec 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
@@ -21,7 +21,6 @@ SRCREV =3D "f6bb06a699617d078fcd4f8b71b4d063bf47b52b"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit features_check
 REQUIRED_DISTRO_FEATURES =3D "systemd"
diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/re=
cipes-extended/libuio/libuio_0.2.1.bb
index 6e6c8cc226..d7e88f4fd0 100644
--- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
@@ -11,7 +11,6 @@ PV .=3D "+0.2.2+git"
=20
 inherit autotools
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGES +=3D "${PN}-tools"
=20
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb b/meta-oe/r=
ecipes-extended/libwmf/libwmf_0.2.13.bb
index 7a82f6b4b6..c5411d53a1 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
@@ -19,7 +19,6 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
 SRC_URI =3D "git://github.com/caolanm/libwmf.git;protocol=3Dhttps;branch=
=3Dmaster"
 SRCREV =3D "9e4737f2293c0d127bda92e5b01896df10571424"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install:append() {
     sed -i -e 's@${RECIPE_SYSROOT}@@g' ${D}${bindir}/libwmf-config ${D}$=
{libdir}/pkgconfig/libwmf.pc
diff --git a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb b/meta-oe=
/recipes-extended/libyang/libyang_3.12.2.bb
index ea51f6cb14..7fff0b96a1 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/CESNET/libyang.git;branch=
=3Dmaster;protocol=3Dhttps;tag=3D
            file://run-ptest \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 # Main dependencies
 inherit cmake pkgconfig lib_package ptest multilib_header
diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb =
b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
index 53023b99a0..4911cebd16 100644
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "\
=20
 SRC_URI[sha256sum] =3D "bd4d4b7e37da02fc67e47ddf20b6f1243c0a7af7b02b918d=
5e72138ea8727547"
=20
-S =3D "${WORKDIR}/linuxconsoletools-${PV}"
+S =3D "${UNPACKDIR}/linuxconsoletools-${PV}"
=20
 inherit systemd pkgconfig
=20
diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb b/me=
ta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
index 4557ed0a80..6d5399c8d0 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
@@ -17,7 +17,6 @@ SRC_URI =3D " \
 "
=20
 SRCREV =3D "e046b69a3736d314fad813e159b1c192eaef92cd"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-extended/md5deep/md5deep_git.bb b/meta-oe/re=
cipes-extended/md5deep/md5deep_git.bb
index 5351a37db6..4b7192290e 100644
--- a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
+++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
@@ -13,6 +13,5 @@ SRC_URI =3D "git://github.com/jessek/hashdeep.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://0001-Fix-literal-and-identifier-spacing-as-dictated-by=
-C-.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/m=
eta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index 44daf94c98..ab08322805 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -58,7 +58,6 @@ SRC_URI[ossp-uuid.sha256sum] =3D "11a615225baa5f8bb6868=
24423f50e4427acd3f70d394765
 # libsodium: 1.0.19
 SRC_URI[libsodium.sha256sum] =3D "018d79fe0a045cca07331d37bd0cb57b2e838c=
51bc48fd837a1472e50068bbea"
=20
-S =3D "${UNPACKDIR}/git"
=20
 inherit pkgconfig cmake systemd
=20
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-128_128.5.2.bb
index c3804ec64d..ceb81d07e5 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] =3D "25d633eb81499cbda44b8c64fa1c1a5=
879d55024b864ef495d4997154d
 UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs128"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/firefox-${PV}"
+S =3D "${UNPACKDIR}/firefox-${PV}"
=20
 inherit pkgconfig perlnative python3native rust cargo
=20
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-=
extended/mraa/mraa_git.bb
index df487bd769..b53be9803e 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/eclipse/${BPN}.git;protoc=
ol=3Dhttps;branch=3Dmaster \
            file://0002-gpio-Include-limits.h-for-PATH_MAX.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 # CMakeLists.txt checks the architecture, only x86 and ARM supported for=
 now
 COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
diff --git a/meta-oe/recipes-extended/nana/nana_git.bb b/meta-oe/recipes-=
extended/nana/nana_git.bb
index d292bb8827..bad5a797a7 100644
--- a/meta-oe/recipes-extended/nana/nana_git.bb
+++ b/meta-oe/recipes-extended/nana/nana_git.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/pjmaker/nana;protocol=3Dh=
ttps;branch=3Dmaster \
     file://0001-Makefile.am-fix-build-with-separate-build-dir.patch \
     file://0002-man-Makefile.am-we-seem-not-to-need-the-work-around-.pat=
ch \
 "
-S =3D "${WORKDIR}/git"
=20
 LICENSE =3D "BSD-2-Clause"
=20
diff --git a/meta-oe/recipes-extended/networking/mstpd_git.bb b/meta-oe/r=
ecipes-extended/networking/mstpd_git.bb
index e6e1f9a3b2..b003b52d25 100644
--- a/meta-oe/recipes-extended/networking/mstpd_git.bb
+++ b/meta-oe/recipes-extended/networking/mstpd_git.bb
@@ -9,7 +9,6 @@ SRC_URI =3D " \
     file://mstpd.service \
 "
 SRCREV =3D "181c453fc1a00573e19f14960dcc54ad84beea7c"
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+){2,})"
=20
diff --git a/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb b/meta-oe/r=
ecipes-extended/newt/libnewt_0.52.25.bb
index aa6b120037..18a45a3342 100644
--- a/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
+++ b/meta-oe/recipes-extended/newt/libnewt_0.52.25.bb
@@ -24,7 +24,7 @@ SRC_URI =3D "https://releases.pagure.org/newt/newt-${PV=
}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087=
b30f3a426828de82"
=20
-S =3D "${WORKDIR}/newt-${PV}"
+S =3D "${UNPACKDIR}/newt-${PV}"
=20
 inherit autotools-brokensep python3native python3-dir python3targetconfi=
g
=20
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta=
-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index d8dda6d090..970d7fb5fc 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -24,7 +24,6 @@ SRC_URI =3D "git://github.com/Openwsman/openwsman.git;b=
ranch=3Dmain;protocol=3Dhttps \
            file://0001-Link-with-libm-for-floor-function.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd4f53d4c6cf73b9d43186ce3be6dd=
0ba"
diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb b/meta-oe/=
recipes-extended/ostree/ostree_2024.10.bb
index 0667fd670f..c33624987a 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
@@ -24,7 +24,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libostr=
ee-${PV}.tar.xz \
            "
 SRC_URI[sha256sum] =3D "54e3387dee1ff16031a0679aca2b60da90ab7f4a26c21182=
2333c7f23000abee"
=20
-S =3D "${WORKDIR}/libostree-${PV}"
+S =3D "${UNPACKDIR}/libostree-${PV}"
=20
 inherit autotools bash-completion gobject-introspection github-releases =
gtk-doc manpages pkgconfig ptest-gnome systemd
=20
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta=
-oe/recipes-extended/p8platform/p8platform_git.bb
index dc7280f099..e69d544b66 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -9,7 +9,6 @@ PV =3D "2.1.0.1+git"
 SRC_URI =3D "git://github.com/Pulse-Eight/platform.git;branch=3Dmaster;p=
rotocol=3Dhttps"
 SRCREV =3D "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-=
oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
index 1637389dba..ab5a8ef342 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
@@ -18,7 +18,6 @@ SRC_URI =3D "git://github.com/PADL/pam_ccreds;branch=3D=
master;protocol=3Dhttps \
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb b/me=
ta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
index d5137f80af..2886137b7d 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
@@ -13,7 +13,6 @@ REQUIRED_DISTRO_FEATURES =3D "pam"
 SRCREV =3D "3e026863cad1fd45c760ee1bc93ef4f0606cc852"
 SRC_URI =3D "git://github.com/rmbreak/pam_ldapdb;branch=3Dmaster;protoco=
l=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install () {
     oe_runmake install DESTDIR=3D${D} PAMDIR=3D${base_libdir}/security
diff --git a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb b/meta-oe/r=
ecipes-extended/pam/pam-radius_3.0.0.bb
index 6633656cea..0e2199b066 100644
--- a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
+++ b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcbbd794e2a0a=
289b9dfcc9f513d1996e"
 SRC_URI =3D "git://github.com/FreeRADIUS/pam_radius.git;protocol=3Dhttps=
;branch=3Dmaster"
 SRCREV =3D "b6442c3e0147f1019990520483fa3a30e4ccf059"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "libpam"
=20
diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/=
meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index 609d2902c0..d14a20609a 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -25,7 +25,7 @@ RDEPENDS:${PN} +=3D "openssh-misc"
=20
 # Kind of unfortunate to have underscores in the name.
 #
-S =3D "${WORKDIR}/pam_ssh_agent_auth-${PV}"
+S =3D "${UNPACKDIR}/pam_ssh_agent_auth-${PV}"
=20
 inherit autotools-brokensep perlnative
=20
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb b/meta-oe/reci=
pes-extended/pegtl/pegtl_3.2.8.bb
index 917cc694c7..4d540d0180 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
@@ -12,7 +12,6 @@ SRCREV =3D "be527327653e94b02e711f7eff59285ad13e1db0"
=20
 inherit cmake ptest
=20
-S =3D "${WORKDIR}/git"
=20
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/src/test/pegtl/data
diff --git a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb b=
/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
index eeb314fdd4..367aedd4c5 100644
--- a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
+++ b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "https://cpan.metacpan.org/authors/id/M/MJ/=
MJP/File-FnMatch-${PV}.tar.
=20
 SRC_URI[sha256sum] =3D "962454b8e86bea8b132bf8af35757d0c6a8f5d599015bd6a=
5d68cb7ae7a9e916"
=20
-S =3D "${WORKDIR}/File-FnMatch-${PV}"
+S =3D "${UNPACKDIR}/File-FnMatch-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb b/meta-oe/recipe=
s-extended/pmdk/pmdk_2.1.1.bb
index 7baa7945b5..5aba331acc 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "ndctl"
 # Required to have the fts.h header for musl
 DEPENDS:append:libc-musl =3D " fts"
=20
-S =3D "${WORKDIR}/git"
=20
 SRC_URI =3D "git://github.com/pmem/pmdk.git;branch=3Dmaster;protocol=3Dh=
ttps"
 SRCREV =3D "0f0ab391d8e3db52f745f33c92b9d9a462bb3695"
diff --git a/meta-oe/recipes-extended/polkit/polkit_126.bb b/meta-oe/reci=
pes-extended/polkit/polkit_126.bb
index c503ca9dc4..0438c4e464 100644
--- a/meta-oe/recipes-extended/polkit/polkit_126.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_126.bb
@@ -7,7 +7,6 @@ BUGTRACKER =3D "https://github.com/polkit-org/polkit/issu=
es"
=20
 SRC_URI =3D "git://github.com/polkit-org/polkit.git;protocol=3Dhttps;bra=
nch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "d627b0d1e1108563658dabe3fb8d2a065e64df10"
=20
 DEPENDS =3D "expat glib-2.0 duktape"
diff --git a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.b=
b b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
index 029ec2337e..20b7f0a5bd 100644
--- a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
+++ b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/lib-cpp/${BPN}.git;branch=
=3Dmaster;protocol=3Dhttps"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure:prepend() {
     echo " " > ${S}/tests/CMakeLists.txt
diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-ex=
tended/qad/qad_git.bb
index c68469fce5..189d2f9d15 100644
--- a/meta-oe/recipes-extended/qad/qad_git.bb
+++ b/meta-oe/recipes-extended/qad/qad_git.bb
@@ -17,7 +17,6 @@ SRCREV =3D "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
 PV =3D "0.0+git"
=20
 DEPENDS =3D "cjson libmicrohttpd libdrm libpng"
diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb b/meta-oe/reci=
pes-extended/qcbor/qcbor_1.4.1.bb
index b04d8df131..00cae11c4e 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.4.1.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/laurencelundblade/QCBOR;p=
rotocol=3Dhttps;branch=3Dmaster
=20
 SRCREV =3D "4487f10e1bf258434fb8a39e4f59c29e31910ad0"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/r=
ecipes-extended/rarpd/rarpd_ss981107.bb
index 2b09b6bcad..c7f320660f 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -24,7 +24,7 @@ SRC_URI +=3D "file://0001-rarpd.8-add-man-file.patch \
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://rarpd.c;md5=3D199b20b172ea93121bc613a9c77b6=
931"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
=20
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3=
.11.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.=
bb
index 3e757e6037..d643c6f0b9 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/sewenew/redis-plus-plus;b=
ranch=3Dmaster;protocol=3Dhttps
            file://0001-CMakeLists.txt-fix-substitution-for-static-libs.p=
atch"
 SRCREV =3D "ad6baa121f4c6fbc7622d83d606210ac22549c78"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb b/meta-oe/=
recipes-extended/rrdtool/rrdtool_1.9.0.bb
index 330647a210..69c281bd92 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "\
     git://github.com/oetiker/rrdtool-1.x.git;protocol=3Dhttps;branch=3Dm=
aster \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cpan autotools-brokensep gettext pkgconfig python3native python3=
-dir systemd
=20
diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/m=
eta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
index 967018ca1f..f1235d7b96 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/rsyslog/libfastjson.git;p=
rotocol=3Dhttps;branch=3Dmaster
=20
 SRCREV =3D "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "rsyslog:libfastjson"
=20
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe=
/recipes-extended/rsyslog/librelp_1.11.0.bb
index 343a2c2840..3ccb87a9c5 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/rsyslog/librelp.git;proto=
col=3Dhttps;branch=3Dstable \
=20
 SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "rsyslog:librelp"
=20
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb b/meta-oe/=
recipes-extended/sanlock/sanlock_4.0.0.bb
index 8da180ac05..fe8592be39 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "git://pagure.io/sanlock.git;protocol=3Dhtt=
p;branch=3Dmaster \
            "
 SRCREV =3D "70c268a07273da78a4aadd14c40ffb75138ccebe"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_STATUS[CVE-2012-5638] =3D "fixed-version: The CPE in the NVD databas=
e doesn't reflect correctly the vulnerable versions."
=20
diff --git a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1=
.0.1.bb b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.=
1.bb
index 29b01d5bf4..03d8d4940c 100644
--- a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
+++ b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
@@ -9,7 +9,7 @@ SECTION =3D "Development/Libraries"
=20
 DEPENDS =3D "cmpi-bindings"
=20
-S =3D "${WORKDIR}/sblim-sfcCommon-${PV}"
+S =3D "${UNPACKDIR}/sblim-sfcCommon-${PV}"
 SRC_URI =3D "http://downloads.sourceforge.net/sblim/sblim-sfcCommon-${PV=
}.tar.bz2"
 SRC_URI[sha256sum] =3D "b9b1037173d6ae0181c3bd5a316ddab5afd6a342ad0dbdc1=
8e940fc0ad2c3297"
=20
diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/re=
cipes-extended/sedutil/sedutil_git.bb
index 64d5111f45..e8987b2dd0 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -14,6 +14,5 @@ SRC_URI =3D "git://github.com/Drive-Trust-Alliance/sedu=
til.git;branch=3Dmaster;proto
            file://0001-Fix-build-on-big-endian-architectures.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep
diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/r=
ecipes-extended/sgpio/sgpio_1.2.0.10.bb
index 98e22f1164..1b3a484ccb 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/${BP=
N}/${BPN}-1.2-0.10-src.ta
            "
 SRC_URI[sha256sum] =3D "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4=
a7363d990fc0270b"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE_GPL;md5=3D393a5ca445f6965873eca0259=
a17f833"
diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb b/meta-oe/r=
ecipes-extended/snappy/snappy_1.1.10.bb
index bc3bc3aa47..2a49ba99b0 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "gitsm://github.com/google/snappy.git;proto=
col=3Dhttps;branch=3Dmain \
=20
 SRCREV =3D "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-o=
e/recipes-extended/socketcan/can-isotp_git.bb
index fa43c9de58..530e38ce21 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/hartkopp/can-isotp.git;prot=
ocol=3Dhttps;branch=3Dmaster"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit module
=20
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/me=
ta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 63c1e130ad..5dc41bcb93 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/linux-can/${BPN}.git;protoc=
ol=3Dhttps;branch=3Dmaster \
=20
 SRCREV =3D "01083a64ebf28cc716efe2d2fd51c141042ae34b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig update-alternatives
=20
diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-=
oe/recipes-extended/socketcan/canutils_4.0.6.bb
index 6989531c81..b92b8086d6 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://git.pengutronix.de/git/tools/canutil=
s.git;protocol=3Dhttps;branch
=20
 inherit update-alternatives
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb b/=
meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
index f45c2d750d..535f37f84c 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
@@ -9,7 +9,6 @@ SRCREV =3D "077def398ad303043d73339112968e5112d8d7c8"
=20
 SRC_URI =3D "git://git.pengutronix.de/git/tools/libsocketcan.git;protoco=
l=3Dhttps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta-=
oe/recipes-extended/socketcan/socketcand_git.bb
index 4e58c76460..ba69875c93 100644
--- a/meta-oe/recipes-extended/socketcan/socketcand_git.bb
+++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRC_URI =3D "git://github.com/linux-can/socketcand;branch=3Dmaster;proto=
col=3Dhttps"
 SRCREV =3D "998b0394d028e791aa97d549bfc686b4fbadf5ee"
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/r=
ecipes-extended/sysdig/sysdig_0.28.0.bb
index 9b95c14de0..a4f27f5e30 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
@@ -33,7 +33,6 @@ SRCREV_falco =3D "caa0e4d0044fdaaebab086592a97f0c7f32ae=
aa9"
=20
 SRCREV_FORMAT =3D "sysdig_falco"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D "\
                 -DBUILD_DRIVER=3DOFF \
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-o=
e/recipes-extended/tipcutils/tipcutils_git.bb
index 71b62cc513..a4bf3eaaca 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -18,7 +18,6 @@ DEPENDS +=3D "libdaemon"
=20
 RDEPENDS:${PN} =3D "iproute2-tipc"
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure:prepend() {
     ( cd ${S}; ${S}/bootstrap )
diff --git a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb b/meta-oe/reci=
pes-extended/tmate/tmate_2.4.0.bb
index 4e66d8d05a..5fb28b0085 100644
--- a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
+++ b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
@@ -12,6 +12,5 @@ SRC_URI =3D "\
=20
 SRCREV =3D "5e00bfa5e137e76c81888727712ced2b3fd99f5b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig autotools
diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb b/=
meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
index 5eb8e4d9aa..1a453ebe10 100644
--- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
+++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
@@ -9,7 +9,6 @@ SRCREV =3D "44a173195986d0d853316cb02a58785ded66c12b"
 PV =3D "0.5.0+git"
 SRC_URI =3D "git://github.com/wertarbyte/${BPN}.git;branch=3Ddebian;prot=
ocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig perlnative update-rc.d systemd
=20
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_2004040=
6.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 09797124c5..0e189b558f 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D "4f179b1db021ef15ac7e9b2eed57c52=
5db127a754c574f591c367460cd
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/user-mode-linux=
/files/tools/1/"
=20
-S =3D "${WORKDIR}/tools"
+S =3D "${UNPACKDIR}/tools"
=20
 inherit update-alternatives
=20
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-ex=
tended/upm/upm_git.bb
index 3aa766d0bd..616f4ca09a 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/eclipse/${BPN}.git;protoc=
ol=3Dhttps;branch=3Dmaster \
=20
 SRC_URI:append:toolchain-clang:x86 =3D " file://0001-nmea_gps-Link-with-=
latomic.patch "
=20
-S =3D "${WORKDIR}/git"
=20
 # Depends on mraa which only supports x86 and ARM for now
 COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb b/meta-oe/re=
cipes-extended/valkey/valkey_8.1.1.bb
index 1686e533af..35b3d3c4a7 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
@@ -19,7 +19,6 @@ SRC_URI =3D " \
 "
 SRCREV =3D "fcd8bc3ee40f5d7841b7d5a8f3cd12252fec14e4"
=20
-S =3D "${WORKDIR}/git"
=20
 RPROVIDES:${PN} =3D "virtual-redis"
=20
diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/m=
eta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index 92a9bbb499..01215a4b25 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "https://releases.pagure.org/volume_key/vol=
ume_key-${PV}.tar.xz \
 SRC_URI[sha256sum] =3D "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4=
aeb473a9cd77309b"
=20
 SRCNAME =3D "volume_key"
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 inherit autotools python3native python3targetconfig gettext pkgconfig
=20
diff --git a/meta-oe/recipes-extended/wipe/wipe_0.24.bb b/meta-oe/recipes=
-extended/wipe/wipe_0.24.bb
index ad32cb0e72..ba3ed29d59 100644
--- a/meta-oe/recipes-extended/wipe/wipe_0.24.bb
+++ b/meta-oe/recipes-extended/wipe/wipe_0.24.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/berke/wipe.git;branch=3Dm=
aster;protocol=3Dhttps \
 "
 SRCREV =3D "796b62293e007546e051619bd03f5ba338ef28e5"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "linux"
=20
diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/r=
ecipes-extended/wtmpdb/wtmpdb_0.11.0.bb
index d4a8b49e1d..b901e8815a 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
@@ -10,7 +10,6 @@ SRCREV =3D "493e9704dbc50f141d5fbd41c823311e79d7e8d3"
 SRC_URI =3D "git://github.com/thkukuk/wtmpdb.git;branch=3Dmain;protocol=3D=
https \
            file://0001-include-libgen.h-for-basename.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig systemd features_check
=20
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb b/meta=
-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 1ef707ca60..2cd154cab6 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -28,7 +28,6 @@ SRC_URI =3D "gitsm://github.com/wxWidgets/wxWidgets.git=
;branch=3D3.2;protocol=3Dhttps
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch =
\
            "
 SRCREV =3D "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/recip=
es-extended/zlog/zlog_1.2.16.bb
index b75802f09f..f450c2cf01 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
 SRCREV =3D "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
 SRC_URI =3D "git://github.com/HardySimpson/zlog;branch=3Dmaster;protocol=
=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-=
extended/zram/zram_0.2.bb
index e4522f89a1..7ec8847187 100644
--- a/meta-oe/recipes-extended/zram/zram_0.2.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
@@ -17,8 +17,7 @@ SRC_URI =3D " \
            file://dev-zram0.swap \
 "
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install () {
     # Install systemd related configuration file
diff --git a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb b/meta-oe/r=
ecipes-extended/zsync/zsync-curl_git.bb
index be658561e2..5227b834f9 100644
--- a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
+++ b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_COMMITS =3D "1"
=20
 inherit autotools
=20
-S =3D "${WORKDIR}/git"
 AUTOTOOLS_SCRIPT_PATH =3D "${S}/src"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb b/meta-oe/rec=
ipes-gnome/atk/atkmm-2.36_2.36.3.bb
index 62ca015309..23e2ff7811 100644
--- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
@@ -15,7 +15,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI[archive.sha256sum] =3D "6ec264eaa0c4de0adb7202c600170bde9a7fbe4d=
466bfbe940eaf7faaa6c5974"
=20
-S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 EXTRA_OEMESON =3D "-Dbuild-documentation=3Dfalse"
=20
diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb b/meta-oe/recipes-g=
nome/gcr/gcr3_3.41.2.bb
index 0fd30f7424..bb905265ee 100644
--- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
+++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "https://download.gnome.org/sources/gcr/3.4=
1/gcr-${PV}.tar.xz;name=3Darc
 SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agen=
t-opti.patch"
 SRC_URI[archive.sha256sum] =3D "bad10f3c553a0e1854649ab59c5b2434da22ca1a=
54ae6138f1f53961567e1ab7"
=20
-S =3D "${WORKDIR}/gcr-${PV}"
+S =3D "${UNPACKDIR}/gcr-${PV}"
=20
 PACKAGECONFIG ??=3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-s=
tub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-s=
tub_1.0.bb
index c929763763..650d344a1c 100644
--- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0=
.bb
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0=
.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/commo=
n-licenses/GPL-2.0-only;m
=20
 SRC_URI =3D "file://gnome-doc-utils.m4"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 PROVIDES =3D "gnome-doc-utils"
=20
diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb b/meta-o=
e/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
index b00b4a4679..70da55c137 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
@@ -10,7 +10,6 @@ inherit meson
=20
 SRC_URI =3D "git://github.com/lassekongo83/adw-gtk3.git;protocol=3Dhttps=
;branch=3Dmain;tag=3Dv${PV}"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "c2e74c9d2a5c3895b8025ac1d4b9e4cced71fbe9"
=20
 FILES:${PN} =3D "${datadir}/themes"
diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb b/meta-oe/rec=
ipes-gnome/libjcat/libjcat_0.2.3.bb
index 0e6f4a2ed1..6e31889b69 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "\
     file://run-ptest \
 "
 SRCREV =3D "f284d18a694ed98f49ddb06e6920265781a30125"
-S =3D "${WORKDIR}/git"
=20
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
=20
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/re=
cipes-gnome/malcontent/malcontent.inc
index 68523fa21e..10597f3308 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
@@ -1,4 +1,3 @@
 SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmain"
-S =3D "${WORKDIR}/git"
 SRCREV =3D "21f3ef7b6f984710a23b607d2298fe16e554f0c3"
 PV =3D "0.13.0"
diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb b/meta-oe/recipes-=
gnome/pyxdg/pyxdg_0.28.bb
index 0c9599a49c..b4dc739ec3 100644
--- a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
+++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.28.bb
@@ -9,4 +9,3 @@ SRC_URI =3D "git://anongit.freedesktop.org/xdg/pyxdg;bran=
ch=3Dmaster"
=20
 inherit setuptools3
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-gr=
aphics/aml/aml_git.bb
index 2633e0d215..a0b27bd256 100644
--- a/meta-oe/recipes-graphics/aml/aml_git.bb
+++ b/meta-oe/recipes-graphics/aml/aml_git.bb
@@ -10,7 +10,6 @@ SRCREV =3D "b83f3576ce4187d9285f06e9066ef43a691464d4"
=20
 PV =3D "0.3.0+git"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb b/meta=
-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
index a6872ef0cd..8a8e783309 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
@@ -10,7 +10,7 @@ DEPENDS +=3D "boost cairo libsigc++-3"
 SRC_URI =3D "https://www.cairographics.org/releases/cairomm-${PV}.tar.xz=
"
 SRC_URI[sha256sum] =3D "b81255394e3ea8e8aa887276d22afa8985fc8daef60692eb=
2407d23049f03cfb"
=20
-S =3D "${WORKDIR}/cairomm-${PV}"
+S =3D "${UNPACKDIR}/cairomm-${PV}"
=20
 FILES:${PN}-doc +=3D "${datadir}/devhelp"
 FILES:${PN}-dev +=3D "${libdir}/cairomm-*/"
diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb b/meta-oe/recipe=
s-graphics/cglm/cglm_0.9.6.bb
index cbcd6c0c6e..b2673f1e9b 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/recp/cglm;branch=3Dmaster=
;protocol=3Dhttps"
 # Tag v0.9.6
 SRCREV =3D "144d1e7c29b3b0c6dede7917a0476cc95248559c"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG[build_tests] =3D "-Dbuild_tests=3Dtrue,-Dbuild_tests=3Dfal=
se,"
=20
diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta=
-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index 1ee2657bd0..1018e0675e 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/lucasdemarchi/dietsplash.=
git;branch=3Dmaster;protocol=3D
=20
 inherit autotools
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF =3D " --with-systemdsystemunitdir=3D${systemd_unitdir}/syst=
em \
                  --disable-staticimages --with-rootdir=3D${root_prefix}"
diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb=
 b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index de91d027e5..f4a257ce89 100644
--- a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -14,7 +14,7 @@ SRC_URI =3D " \
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Decf6fd2b19915afc4da56043926ca=
18f"
=20
-S =3D "${WORKDIR}/DirectFB-examples-${PV}"
+S =3D "${UNPACKDIR}/DirectFB-examples-${PV}"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/rec=
ipes-graphics/directfb/directfb.inc
index 4d962ab5d9..0dc410b2cb 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -28,7 +28,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/mirror/s=
ources/DirectFB-${PV}.tar.g
            file://0001-libdirect-remove-use-of-keyword-register.patch \
            "
=20
-S =3D "${WORKDIR}/DirectFB-${PV}"
+S =3D "${UNPACKDIR}/DirectFB-${PV}"
=20
 LDFLAGS:append =3D " -lm"
=20
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb b/me=
ta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
index 50504caf9f..ef6dc14ca6 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/manatools/dnfdragora.git;=
branch=3Dstable-2.x;protocol=3D
=20
 SRCREV =3D "abbe08b7a487325182758d5285b54437a914207b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake gettext pkgconfig python3-dir python3native setuptools3-ba=
se mime-xdg
=20
diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/rec=
ipes-graphics/drm/drm-info_2.7.0.bb
index 9f1cbb47fb..810be40013 100644
--- a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
+++ b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D32fd56d355bd6a=
61017655d8da26b67c"
 SRC_URI =3D "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=3D=
master;protocol=3Dhttps"
 SRCREV =3D "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb b/meta-oe/reci=
pes-graphics/fbgrab/fbgrab_1.5.bb
index efcf5a9ea6..72187696e3 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
@@ -7,7 +7,6 @@ DEPENDS =3D "libpng zlib"
 SRC_URI =3D "git://github.com/GunnarMonell/fbgrab.git;protocol=3Dhttps;b=
ranch=3Dmaster"
=20
 SRCREV =3D "f43ce6d5ce48fb01360eaa7c4a92c2573a1d02f8"
-S =3D "${WORKDIR}/git"
=20
 do_configure:prepend() {
     sed \
diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipe=
s-graphics/fbida/fbida_git.bb
index 6c06748499..2736f61004 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -21,7 +21,6 @@ SRC_URI =3D "git://github.com/kraxel/fbida;protocol=3Dh=
ttps;branch=3Dmaster \
            file://0001-fbida-Include-missing-sys-types.h.patch \
 "
 SRCREV =3D "eb769e3d7f4a073d4c37ed524ebd5017c6a578f5"
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig features_check
=20
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/m=
eta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index d470ff12d4..af77ec913e 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -22,7 +22,6 @@ SRC_URI =3D "git://github.com/${BPN}/${BPN}.git;branch=3D=
master;protocol=3Dhttps \
            file://0001-Fix-Translations-containing-invalid-directives-hs=
.patch \
            file://CVE-2024-25081_CVE-2024-25082.patch \
 "
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D "-DENABLE_DOCS=3DOFF"
 PACKAGECONFIG =3D "readline"
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb b/meta-oe/recipe=
s-graphics/ftgl/ftgl_2.4.0.bb
index 4db453bc66..c5c547186f 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
@@ -17,4 +17,3 @@ PV .=3D "+git"
 SRC_URI =3D "git://github.com/HamzaM3/ftgl;protocol=3Dhttps;branch=3Dmas=
ter \
            file://0001-Fix-type-mismatch-with-latest-FreeType.patch"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb b/meta-oe/recipe=
s-graphics/fvwm/fvwm_2.7.0.bb
index fcf1bd9cae..959463e962 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
@@ -41,7 +41,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "7baf540e56fb1a3e91752acba872a88543529d46"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools gettext update-alternatives pkgconfig python3native pe=
rlnative features_check
 # depends on virtual/libx11
diff --git a/meta-oe/recipes-graphics/glad/glad_2.0.8.bb b/meta-oe/recipe=
s-graphics/glad/glad_2.0.8.bb
index 4065c27e6f..ea4ee6eac6 100644
--- a/meta-oe/recipes-graphics/glad/glad_2.0.8.bb
+++ b/meta-oe/recipes-graphics/glad/glad_2.0.8.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dae570f26774ac0=
96cff8f992091a223c"
=20
 SRC_URI =3D "git://github.com/Dav1dde/glad.git;protocol=3Dhttps;branch=3D=
glad2"
 SRCREV =3D "73db193f853e2ee079bf3ca8a64aa2eaf6459043"
-S =3D "${WORKDIR}/git"
=20
 inherit python_setuptools_build_meta
=20
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipe=
s-graphics/glm/glm_0.9.9.8.bb
index e313d7a192..e6fd0edd21 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -20,7 +20,6 @@ SRC_URI =3D " \
 SRCREV =3D "efec5db081e3aad807d0731e172ac597f6a39447"
 PV .=3D "+0.9.9.9+git"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/r=
ecipes-graphics/gtkperf/gtkperf_0.40.bb
index 16ab6d6fd4..ef9b194f9a 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX =3D "${BPN}_(?P<pver>\d+(\.\d+)+)"
=20
 DEPENDS =3D "gtk+"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 inherit features_check autotools binconfig pkgconfig gettext
=20
diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb b/meta-o=
e/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
index 43367aa415..f912686c41 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37=
968a99b631ef42722e"
=20
 SRC_URI =3D "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "6201b5f93dcaeafa92fc0ec4ad4baeaf60acf16fc8f019bb=
f061cf4ebf27938a"
-S =3D "${WORKDIR}/${BPN}-gtk3-${PV}"
+S =3D "${UNPACKDIR}/${BPN}-gtk3-${PV}"
=20
 DEPENDS =3D " \
     gperf-native \
diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/reci=
pes-graphics/imlib2/imlib2_git.bb
index 9c9bf10398..66e9f8a0c4 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -15,7 +15,6 @@ inherit autotools pkgconfig lib_package
 AUTO_LIBNAME_PKGS =3D ""
=20
 SRC_URI =3D "git://git.enlightenment.org/old/legacy-${BPN}.git;protocol=3D=
https;branch=3Dmaster"
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)}"
=20
diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb b/meta-o=
e/recipes-graphics/libdecor/libdecor_0.2.3.bb
index 9c6807d7e6..35deb8d2aa 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
@@ -12,7 +12,6 @@ DEPENDS =3D " \
     wayland-protocols \
 "
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "15afd30a6e23e949d022ff18f17dd7fdbd3361e4"
=20
 PACKAGECONFIG ?=3D "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', =
d)}"
diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb b/me=
ta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
index db648ec8c2..e59de6f0ca 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
@@ -18,7 +18,7 @@ inherit autotools features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
-S =3D "${WORKDIR}/xforms-${PV}"
+S =3D "${UNPACKDIR}/xforms-${PV}"
=20
 DEPENDS =3D "libxpm jpeg libx11 virtual/libgl"
 RDEPENDS:${PN} =3D "bash"
diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-o=
e/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index a737a735b7..f26caf6940 100644
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -13,7 +13,6 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 inherit meson pkgconfig features_check
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D "\
   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb b/meta-=
oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
index 4f702029d9..d707b6c9b4 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "dfb15ac5f8ce7a4952dc12d2aed9747=
518c5e6b335c0e31636d23f93c6
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/sdlgfx/files/"
=20
-S =3D "${WORKDIR}/SDL_gfx-${PV}"
+S =3D "${UNPACKDIR}/SDL_gfx-${PV}"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
index 01137bb0ca..29fb8cb4aa 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "http://www.libsdl.org/projects/SDL_image/r=
elease/SDL_image-${PV}.tar.
            file://configure.patch"
 SRC_URI[sha256sum] =3D "0b90722984561004de84847744d566809dbb9daf732a9e50=
3b91a1b5a84e5699"
=20
-S =3D "${WORKDIR}/SDL_image-${PV}"
+S =3D "${UNPACKDIR}/SDL_image-${PV}"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
index 35f278c890..d87c15aebc 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "http://www.libsdl.org/projects/SDL_mixer/r=
elease/SDL_mixer-${PV}.tar.
=20
 SRC_URI[sha256sum] =3D "1644308279a975799049e4826af2cfc787cad2abb11aa145=
62e402521f86992a"
=20
-S =3D "${WORKDIR}/SDL_mixer-${PV}"
+S =3D "${UNPACKDIR}/SDL_mixer-${PV}"
=20
 inherit autotools-brokensep pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb b/meta-o=
e/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
index 93466872ac..ef4d13ebb6 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
@@ -14,6 +14,6 @@ SRC_URI =3D " \
   file://am_foreign.patch \
 "
=20
-S =3D "${WORKDIR}/SDL_net-${PV}"
+S =3D "${UNPACKDIR}/SDL_net-${PV}"
=20
 SRC_URI[sha256sum] =3D "5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff02=
60411347714facb4"
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb b/meta-=
oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
index c104444319..2cf3e88f17 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "http://www.libsdl.org/projects/SDL_ttf/relea=
se/SDL_ttf-${PV}.tar.gz \
 "
 SRC_URI[sha256sum] =3D "724cd895ecf4da319a3ef164892b72078bd92632a5d81211=
1261cde248ebcdb7"
=20
-S =3D "${WORKDIR}/SDL_ttf-${PV}"
+S =3D "${UNPACKDIR}/SDL_ttf-${PV}"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
index d3dbf13ae7..c15e986dc3 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "tiff zlib libpng jpeg virtual/libsdl2 libweb=
p"
 SRC_URI =3D "http://www.libsdl.org/projects/SDL_image/release/SDL2_image=
-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "2213b56fdaff2220d0e38c8e420cbe1a83c87374190cba8c=
70af2156097ce30a"
=20
-S =3D "${WORKDIR}/SDL2_image-${PV}"
+S =3D "${UNPACKDIR}/SDL2_image-${PV}"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
index b24c8782cf..46e6ba0774 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f=
7cf6e8a13bcac1ef4d2455"
 SRC_URI =3D "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer=
-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "cb760211b056bfe44f4a1e180cc7cb201137e4d1572f2002=
cc1be728efd22660"
=20
-S =3D "${WORKDIR}/SDL2_mixer-${PV}"
+S =3D "${UNPACKDIR}/SDL2_mixer-${PV}"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb b/meta-=
oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
index d26a545f83..4a7ada94cb 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D68a088513d=
a90254b2fbe664f42af315"
 SRC_URI =3D " \
   https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz =
\
 "
-S =3D "${WORKDIR}/SDL2_net-${PV}"
+S =3D "${UNPACKDIR}/SDL2_net-${PV}"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/r=
ecipes-graphics/libsdl/libsdl_1.2.15.bb
index 35870c4814..8122b88a68 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -31,7 +31,7 @@ SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.ta=
r.gz \
=20
 UPSTREAM_CHECK_REGEX =3D "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-S =3D "${WORKDIR}/SDL-${PV}"
+S =3D "${UNPACKDIR}/SDL-${PV}"
=20
 SRC_URI[sha256sum] =3D "d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc=
108829d6474aad00"
=20
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
index 7e3a06f34f..3b17f350df 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D98241180=
d857fe975e4b60d44d6c01a5"
=20
 SRC_URI =3D "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "27e845b1b7dc0a91a85f1a1f18892ed205adb38caf767741=
eb258008d8264de0"
-S =3D "${WORKDIR}/sdl2-compat-${PV}"
+S =3D "${UNPACKDIR}/sdl2-compat-${PV}"
=20
 DEPENDS +=3D "libsdl3"
=20
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
index 8ef20521a9..ac425f6ad2 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp"
 SRC_URI =3D "git://github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x"
 SRCREV =3D "11154afb7855293159588b245b446a4ef09e574f"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb b/meta=
-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
index f914d1dcff..1f82f95d65 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "http://www.libsdl.org/projects/SDL_ttf/relea=
se/SDL3_ttf-${PV}.tar.gz
 "
 SRC_URI[sha256sum] =3D "63547d58d0185c833213885b635a2c0548201cc8f301e658=
7c0be1a67e1e045d"
=20
-S =3D "${WORKDIR}/SDL3_ttf-${PV}"
+S =3D "${UNPACKDIR}/SDL3_ttf-${PV}"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb b/meta-oe=
/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
index 7a2a37f69a..9579cb73a1 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D "\
=20
 SRC_URI =3D "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
=20
-S =3D "${WORKDIR}/SDL3-${PV}"
+S =3D "${UNPACKDIR}/SDL3-${PV}"
=20
 SRC_URI[sha256sum] =3D "6340e58879b2d15830c8460d2f589a385c444d1faa2a4828=
a9626c7322562be8"
=20
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb=
 b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index e518461d7d..ff5df428e8 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -47,7 +47,6 @@ inherit cmake
 SRC_URI =3D "git://github.com/LibVNC/libvncserver;branch=3Dmaster;protoc=
ol=3Dhttps"
 SRCREV =3D "10e9eb75f73e973725dc75c373de5d89807af028"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D "-DMAKE_INSTALL_LIBDIR=3D${libdir}"
=20
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb b/me=
ta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
index 4196449f3a..d7c96492b2 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-target =3D " file://0001-Fix-the-e=
rror-of-can-t-find-header-f
=20
 SRCREV =3D "e691b563262306a40a61bbf228839fa06e4f0516"
=20
-S =3D "${WORKDIR}/git/libyui-ncurses"
+S =3D "${UNPACKDIR}/${BP}/libyui-ncurses"
=20
 inherit cmake gettext pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb b/meta-oe/re=
cipes-graphics/libyui/libyui_4.6.2.bb
index 419a9522a4..d86aa4da91 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "git://github.com/libyui/libyui.git;branch=3D=
master;protocol=3Dhttps \
=20
 SRCREV =3D "e691b563262306a40a61bbf228839fa06e4f0516"
=20
-S =3D "${WORKDIR}/git/libyui"
+S =3D "${UNPACKDIR}/${BP}/libyui"
=20
 inherit cmake gettext pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
index 1228748701..f2995fb1bc 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
@@ -24,7 +24,6 @@ require lv-conf.inc
=20
 inherit cmake
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure:prepend() {
 	if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.2.2.bb
index 935e84ad23..28306a1101 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
@@ -17,7 +17,6 @@ SRCREV =3D "7f07a129e8d77f4984fff8e623fd5be18ff42e74"
 inherit cmake
=20
 EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=3D=
ON"
-S =3D "${WORKDIR}/git"
=20
 require lv-conf.inc
=20
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb b/meta-oe/=
recipes-graphics/neatvnc/neatvnc_0.8.1.bb
index 9065050c62..2b26ec57ae 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/any1/neatvnc;branch=3Dv0.8;=
protocol=3Dhttps"
=20
 SRCREV =3D "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "libdrm pixman aml zlib"
=20
diff --git a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb b/meta-oe/=
recipes-graphics/nyancat/nyancat_1.5.2.bb
index a44e79362d..c31ad985d9 100644
--- a/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
+++ b/meta-oe/recipes-graphics/nyancat/nyancat_1.5.2.bb
@@ -5,7 +5,6 @@ SECTION =3D "graphics"
 LICENSE =3D "NCSA"
 LIC_FILES_CHKSUM =3D "file://src/nyancat.c;beginline=3D27;endline=3D49;m=
d5=3D285f7ac87da4a631f348800687d845bd"
=20
-S =3D "${WORKDIR}/git"
=20
 SRCREV =3D "5ffb6c5c03d0e9156db8f360599d4f0449bb16b9"
 SRC_URI =3D " \
diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/rec=
ipes-graphics/openbox/obconf_git.bb
index 1210af70ea..917492c982 100644
--- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
+++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
@@ -16,7 +16,6 @@ SRC_URI =3D " \
     file://0001-Fix-function-protype-visibility.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools gettext pkgconfig mime mime-xdg features_check
 # depends on openbox, which is X11-only
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb b/meta-o=
e/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
index 231bf84573..6c383e3423 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/uclouvain/openjpeg.git;bran=
ch=3Dmaster;protocol=3Dhttps
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-ma=
ke-.patch \
            "
 SRCREV =3D "210a8a5690d0da66f02d49420d7176a21ef409dc"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-nativ=
e_git.bb b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_=
git.bb
index 0e88e84aff..d3c96cd66f 100644
--- a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.b=
b
+++ b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.b=
b
@@ -15,7 +15,6 @@ SRCREV =3D "1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e"
=20
 SRC_URI =3D "git://github.com/notro/panel-mipi-dbi.git;protocol=3Dhttps;=
branch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit native
=20
diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb b/meta=
-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
index 896195c57d..d99c6ceac0 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
@@ -12,7 +12,7 @@ inherit gnomebase features_check
 SRC_URI[archive.sha256sum] =3D "539f5aa60e9bdc6b955bb448e2a62cc14562744d=
f690258040fbb74bf885755d"
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 FILES:${PN} =3D "${libdir}/lib*.so.*"
 FILES:${PN}-dev +=3D "${libdir}/*/include/ ${libdir}/pangomm-*/"
diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-=
runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-de=
qp-runner_git.bb
index 2ec89bc05b..88cdce26d1 100644
--- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_=
git.bb
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_=
git.bb
@@ -10,6 +10,5 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/parallel=
-deqp-runner.git;protocol=3Dh
 PV =3D "2020.06.15+git"
 SRCREV =3D "e1642fb691d29b1462504b58916f7f514a963e80"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig meson
diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb b/meta-o=
e/recipes-graphics/qrencode/qrencode_4.1.1.bb
index 039816e4a0..c794f41370 100644
--- a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
+++ b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495=
befef8f17206a5b0a1"
 SRCREV =3D "715e29fd4cd71b6e452ae0f4e36d917b43122ce8"
 SRC_URI =3D "git://github.com/fukuchi/libqrencode.git;branch=3Dmaster;pr=
otocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb b/meta-=
oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
index 8aab26c824..c5a0cdc6aa 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.38.bb
@@ -8,7 +8,6 @@ SRCREV =3D "34c3c40787f440da9c2947cd63a41e6c4d1f95b9"
 SRC_URI =3D " \
     git://github.com/baldurk/${BPN}.git;protocol=3Dhttps;branch=3Dv1.x \
 "
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms"
=20
diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb =
b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
index bf3070701f..567f7a55e8 100644
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
@@ -4,7 +4,6 @@ LICENSE  =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
 SECTION =3D "graphics"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "f09ba2777714871bddb70d049878af34b94fa54d"
 SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=3Dmast=
er;protocol=3Dhttps"
 inherit cmake pkgconfig
diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-=
graphics/surf/surf_2.1.bb
index 4d9d4d3dd0..258c78e509 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://git.suckless.org/surf;branch=3Dsurf-=
webkit2 \
            "
 SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'soup3', 'file://000=
1-config.mk-Fix-compiler-and-linker.patch file://0001-config.ml-make-comp=
atible-with-webkitgtk-2.34.0.patch', '', d)}"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig features_check
=20
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb b=
/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
index 0d45ee765c..f4923f3f00 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
 SRCREV =3D "4767ea922bcc460e70b87b1d303ebdfed0897da8"
 SRC_URI =3D "git://github.com/tesseract-ocr/tessdata.git;branch=3Dmain;p=
rotocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit allarch
=20
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb b/meta=
-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
index 213dfada23..4bc0f5b88f 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
 SRCREV =3D "3b7c70e34dea179549ed3e995872e2e019eb8477"
 SRC_URI =3D "git://github.com/${BPN}-ocr/${BPN}.git;branch=3Dmain;protoc=
ol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "leptonica"
=20
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-=
oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 98777970b0..dd4f79c314 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -7,7 +7,6 @@ RDEPENDS:${PN} =3D "coreutils hicolor-icon-theme perl bas=
h xkbcomp"
=20
 LIC_FILES_CHKSUM =3D "file://LICENCE.TXT;md5=3D75b02c2872421380bbd47781d=
2bd75d3"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools cmake features_check pkgconfig systemd
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.0=
30_1.050.bb b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.=
030_1.050.bb
index 15449b216a..38a5126eea 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.05=
0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.05=
0.bb
@@ -12,7 +12,7 @@ SRC_URI =3D " \
     file://44-source-code-pro-fonts-fontconfig.conf \
 "
 SRC_URI[sha256sum] =3D "da2ac159497d31b0c6d9daa8fc390fb8252e75b4a9805ace=
6a2c9cccaed4932e"
-S =3D "${WORKDIR}/source-code-pro-2.030R-ro-1.050R-it"
+S =3D "${UNPACKDIR}/source-code-pro-2.030R-ro-1.050R-it"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/adobe-fonts/source-code-pro/t=
ags"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/(?P<pver>\d+\.\d+)R"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb b=
/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
index beb2cf2ff7..4a3b8e471e 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://OFL.txt;md5=3D6c56db018aa880=
3f8aff326829e3ce32"
=20
 SRCNAME =3D "AbyssinicaSIL"
 SRC_URI =3D "http://software.sil.org/downloads/r/abyssinica/${SRCNAME}-$=
{PV}.zip"
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 UPSTREAM_CHECK_URI =3D "https://software.sil.org/abyssinica/download/"
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216=
.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index ea734182de..82b2541a60 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -8,7 +8,7 @@ RPROVIDES:${PN} =3D "virtual-chinese-font"
 FONT_PACKAGES =3D "${PN}"
=20
 SRC_URI =3D "https://deb.debian.org/debian/pool/main/f/fonts-arphic-umin=
g/fonts-arphic-uming_0.2.${PV}.2.orig.tar.bz2"
-S =3D "${WORKDIR}/ttf-arphic-uming-0.2.20080216.2"
+S =3D "${UNPACKDIR}/ttf-arphic-uming-0.2.20080216.2"
=20
 require ttf.inc
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 90a11ca4d6..9dc23fc4c7 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -17,7 +17,7 @@ RDEPENDS:${PN}-common =3D ""
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2=
 \
            file://30-dejavu-aliases.conf"
=20
-S =3D "${WORKDIR}/dejavu-fonts-ttf-${PV}/ttf"
+S =3D "${UNPACKDIR}/dejavu-fonts-ttf-${PV}/ttf"
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/dejavu/files/de=
javu/"
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-o=
e/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index cc9213ec5b..06ab2a7921 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -9,7 +9,7 @@ PV =3D "0.1+git"
=20
 SRC_URI =3D "git://github.com/android/platform_frameworks_base.git;branc=
h=3Dmaster;protocol=3Dhttps"
=20
-S =3D "${WORKDIR}/git/data/fonts"
+S =3D "${UNPACKDIR}/${BP}/data/fonts"
=20
 do_install:append() {
     for f in Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf DroidSansThai.ttf \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/met=
a-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 84cd30d3c0..f50da65ddc 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://OFL;md5=3D33a5bf7b98a9c0ae87=
430760ba762295 \
=20
 SRC_URI =3D "https://archive.debian.org/debian/pool/main/t/ttf-gentium/t=
tf-gentium_${PV}.orig.tar.gz "
=20
-S =3D "${WORKDIR}/ttf-sil-gentium-${PV}"
+S =3D "${UNPACKDIR}/ttf-sil-gentium-${PV}"
=20
 do_install:append() {
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
index c142f1dd02..1d7488186e 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
@@ -23,8 +23,7 @@ SRC_URI =3D "git://github.com/google/fonts.git;protocol=
=3Dhttps;branch=3Dmain;subpath=3D
            git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasanscondensed;name=3Dfirasanscondensed \
            git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasansextracondensed;name=3Dfirasansextracondensed"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install:append() {
     install -d ${D}${datadir}/fonts/truetype/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb b=
/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
index 8101c7d7a0..373bdb4bde 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://../COPYRIGHT.TXT;md5=3D70d34=
478e38b1ad9995079f9921f9ef7
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
=20
-S =3D "${WORKDIR}/hunkyfonts-${PV}/TTF"
+S =3D "${UNPACKDIR}/hunkyfonts-${PV}/TTF"
=20
 PACKAGES =3D "ttf-hunky-sans ttf-hunky-serif"
 FONT_PACKAGES =3D "ttf-hunky-sans ttf-hunky-serif"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.=
bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 85a64000ee..af726f4082 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/OFL.txt;md5=3D9=
69851e3a70122069a4d9ee61dd5
 SRC_URI =3D "http://levien.com/type/myfonts/Inconsolata.otf \
     file://OFL.txt"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 FILES:${PN} =3D "${datadir}/fonts/truetype/Inconsolata.ttf \
     ${datadir}/doc/ttf-inconsolata/*"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb b/me=
ta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
index 89c48d5fe2..165ea7576a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "https://moji.or.jp/wp-content/ipafont/IPAf=
ont/IPAfont00303.zip "
=20
 SRC_URI[sha256sum] =3D "f755ed79a4b8e715bed2f05a189172138aedf93db0f465b4=
e20c344a02766fe5"
=20
-S =3D "${WORKDIR}/IPAfont00303"
+S =3D "${UNPACKDIR}/IPAfont00303"
=20
 PACKAGES =3D "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
 FONT_PACKAGES =3D "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narro=
w_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narr=
ow_1.07.4.bb
index ab7308e735..bb2930ae0b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.=
4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.=
4.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "https://releases.pagure.org/liberation-fon=
ts/liberation-fonts-ttf-${P
=20
 SRC_URI[sha256sum] =3D "61a7e2b6742a43c73e8762cdfeaf6dfcf9abdd2cfa0b099a=
9854d69bc4cfee5c"
=20
-S =3D "${WORKDIR}/liberation-fonts-ttf-${PV}"
+S =3D "${UNPACKDIR}/liberation-fonts-ttf-${PV}"
=20
 do_install:append () {
     install -d ${D}${datadir}/fonts/TTF/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb b=
/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
index 7b0828574c..92717da32f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
@@ -11,7 +11,6 @@ SRCREV =3D "4b0192046158094654e865245832c66d2104219e"
 SRC_URI =3D "git://github.com/liberationfonts/liberation-fonts.git;branc=
h=3Dmain;protocol=3Dhttps"
=20
 DEPENDS =3D "fontforge-native"
-S =3D "${WORKDIR}/git"
=20
 PACKAGES =3D "ttf-liberation-mono ttf-liberation-sans ttf-liberation-ser=
if"
 FONT_PACKAGES =3D "ttf-liberation-mono ttf-liberation-sans ttf-liberatio=
n-serif"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803=
cvs.fc24.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.2009080=
3cvs.fc24.bb
index 65d0f0bb35..00d0265aa5 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc2=
4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc2=
4.bb
@@ -10,8 +10,7 @@ SRC_URI[sha256sum] =3D "de5750f7048973f851961050f76b8b5=
8e9bda400d5007c3078d9317fbe
=20
 DEPENDS =3D "fontforge-native"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
 FONT_PACKAGES =3D "${PN}"
 FILES:${PN} =3D "${datadir}"
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb b/met=
a-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
index 8340cccbb4..43ec61772b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
@@ -11,7 +11,6 @@ SRCREV =3D "a403c9b7f509dad5e58dde85ef63b1c36fde3a21"
 SRC_URI =3D "git://github.com/pravins/lohit.git;branch=3Dmaster;protocol=
=3Dhttps"
=20
 DEPENDS =3D "fontforge-native"
-S =3D "${WORKDIR}/git"
 FONT_PACKAGES =3D "${PN}"
 FILES:${PN} =3D "${datadir}"
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-o=
e/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index 4adada04fa..1ae1d1a2b4 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE_E;md5=3Dac161e96eda0=
0db9a3aec7870b5d9658 \
                     file://LICENSE_J;md5=3Da120ca8d7c8e4a475d5277c9aeb95=
221 \
 "
 SRC_URI =3D "http://downloads.sourceforge.jp/mplus-fonts/6650/mplus-TEST=
FLIGHT-${PV}.tar.gz"
-S =3D "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
+S =3D "${UNPACKDIR}/mplus-TESTFLIGHT-${PV}"
=20
 PACKAGESPLITFUNCS:prepend =3D "split_ttf_mplus_packages "
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.b=
b b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
index 9d6a9a6c2e..b5dae22a9d 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
@@ -11,7 +11,6 @@ SRCREV =3D "aac7ccaa4d1dea4543453b96f7d6fc47066a57ff"
 PACKAGES =3D "${PN}-color ${PN}-regular"
 FONT_PACKAGES =3D "${PN}-color ${PN}-regular"
=20
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN}-color =3D "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
 FILES:${PN}-regular =3D "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf=
"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb b/met=
a-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
index 25ce8e930d..0320d30245 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c=
9479bd8986968f4327"
 SRC_URI =3D "https://github.com/google/roboto/releases/download/v${PV}/r=
oboto-android.zip"
 SRC_URI[sha256sum] =3D "c825453253f590cfe62557733e7173f9a421fff103b00f57=
d33c4ad28ae53baf"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 FILES:${PN} =3D "${datadir}/fonts/truetype/*.ttf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb =
b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 76016c57b9..b72307519c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3D97d739900be6e=
852830f55aa3c07d4a0"
 RPROVIDES:${PN} =3D "virtual-japanese-font"
=20
 SRC_URI =3D "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629=
.tar.bz2"
-S =3D "${WORKDIR}/sazanami-20040629"
+S =3D "${UNPACKDIR}/sazanami-20040629"
=20
 PACKAGES =3D "ttf-sazanami-gothic ttf-sazanami-mincho"
 FONT_PACKAGES =3D "ttf-sazanami-gothic ttf-sazanami-mincho"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb b/=
meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
index 156dc983d7..b224f46869 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://IPA_Font_License_Agreement=
_v1.0.txt;md5=3D6cd3351ba979c
 SRC_URI =3D "https://launchpad.net/takao-fonts/trunk/15.03/+download/Tak=
aoFonts_00303.01.tar.xz"
 SRC_URI[sha256sum] =3D "e9871f72ac69acb3e277aebbee7ca01fbebf54800733e29f=
afdc46133fc3552f"
=20
-S =3D "${WORKDIR}/TakaoFonts_00303.01"
+S =3D "${UNPACKDIR}/TakaoFonts_00303.01"
=20
 PACKAGES =3D "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-t=
akao-mincho"
 FONT_PACKAGES =3D "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho =
ttf-takao-mincho"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.=
83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index 8512b1fd19..ff89f7466a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D "61a2b342526fd552f19fef438bb9211=
a8212de19ad96e32a1209c039f1
 UPSTREAM_CHECK_URI =3D "https://repology.org/project/fonts:ubuntu/packag=
es"
 UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/ubuntu-font-family-${PV}"
+S =3D "${UNPACKDIR}/ubuntu-font-family-${PV}"
=20
 PACKAGES =3D "ttf-ubuntu-mono ttf-ubuntu-sans"
 FONT_PACKAGES =3D "ttf-ubuntu-mono ttf-ubuntu-sans"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb =
b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
index 4cc5afd4a7..c7be162b1b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://osdn.jp/dl/vlgothic/VLGothic-${PV}=
.tar.xz"
=20
 SRC_URI[sha256sum] =3D "297a3813675fbea12c5813b55a78091c9a5946515ecbf9fd=
e8b8102e01c579f4"
=20
-S =3D "${WORKDIR}/VLGothic"
+S =3D "${UNPACKDIR}/VLGothic"
=20
 do_install:append () {
     install -D -m644 ${S}/LICENSE_E.mplus ${D}${datadir}/licenses/${PN}/=
COPYING_MPLUS.txt
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb =
b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
index dc85617a9b..8d721d00ad 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "e4b7e306475bf9427d1757578f0e452=
8930c84c44eaa3f167d4c42f110
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/wqy/files/wqy-z=
enhei/"
 UPSTREAM_CHECK_REGEX =3D "wqy-zenhei/(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/wqy-zenhei"
+S =3D "${UNPACKDIR}/wqy-zenhei"
=20
 do_install:append () {
     sed -i -e '/<string>[^W]/d' ${S}/44-wqy-zenhei.conf
diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1=
.6.bb b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
index e80aebc89b..5aea738c15 100644
--- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
+++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
@@ -14,7 +14,6 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 DEPENDS =3D "libev libx11 libxi libxfixes"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install:append() {
     # LICENSE is installed to /usr/share/licenses but we don't want it i=
n the package
diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb b/meta-oe/rec=
ipes-graphics/vdpau/libvdpau_1.5.bb
index db3c045588..3ba561a54e 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "virtual/libx11 libxext xorgproto"
 SRCREV =3D "79f1506a3307d3275b0fdfb2e110c173f68e6f78"
 SRC_URI =3D "git://anongit.freedesktop.org/vdpau/libvdpau;branch=3Dmaste=
r"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit features_check meson pkgconfig
=20
diff --git a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb b/meta-oe/re=
cipes-graphics/vdpau/vdpauinfo_1.5.bb
index 3f44e537a4..a7db743239 100644
--- a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
@@ -15,6 +15,5 @@ RDEPENDS:${PN} =3D "libvdpau"
 SRCREV =3D "d3c5bd63bf8878d59b22d618d2bb5116db392d28"
 SRC_URI =3D "git://anongit.freedesktop.org/vdpau/vdpauinfo;branch=3Dmast=
er"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 02af1c6ed0..1cc2da7a49 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -12,7 +12,6 @@ SRC_URI:append:toolchain-clang =3D "file://fix-clang-pr=
ivate-operator.patch"
=20
 SRCREV_FORMAT =3D "vk-gl-cts"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig cmake cmake-qemu features_check python3native
=20
diff --git a/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb b/meta-oe/re=
cipes-graphics/wayland/libei_1.4.1.bb
index a2705785ae..764616906f 100644
--- a/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
+++ b/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
@@ -16,7 +16,6 @@ DEPENDS =3D " \
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libei.git;protocol=3D=
https;branch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "9e0413cbc7d3ae6656266890425f152589ddf74d"
=20
 inherit meson pkgconfig
diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-o=
e/recipes-graphics/wayland/waylandpp_1.0.0.bb
index c1f5f4ed8e..bb909a313a 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/NilsBrause/waylandpp.git;pr=
otocol=3Dhttps;branch=3Dmaste
 DEPENDS =3D "pugixml"
 DEPENDS:append:class-target =3D " waylandpp-native wayland virtual/egl v=
irtual/libgles2"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "4321ed5c7b4bffa41b8a2a13dc7f3ece1191f4f3"
=20
 inherit cmake pkgconfig features_check
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/r=
ecipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 74f80e1844..1493eed7af 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/LibVNC/x11vnc;branch=3Dma=
ster;protocol=3Dhttps \
            file://starting-fix.patch \
            file://CVE-2020-29074.patch \
            "
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "\
 	jpeg \
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1=
.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
index 8b4526fc5e..8fd2ae2e84 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
@@ -9,6 +9,5 @@ DEPENDS +=3D "virtual/libx11 libdrm xorgproto"
 SRCREV =3D "8bbdb2ae3bb8ef649999a8da33ddbe11a04763b8"
 SRC_URI =3D "git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc=
;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} +=3D "xserver-xorg-module-exa"
diff --git a/meta-oe/recipes-graphics/yad/yad_6.0.bb b/meta-oe/recipes-gr=
aphics/yad/yad_6.0.bb
index 9e46215fd8..64c12f5904 100644
--- a/meta-oe/recipes-graphics/yad/yad_6.0.bb
+++ b/meta-oe/recipes-graphics/yad/yad_6.0.bb
@@ -13,6 +13,5 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 DEPENDS =3D "gtk+3 glib-2.0-native intltool-native"
=20
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${datadir}/icons/"
diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/re=
cipes-graphics/ydotool/ydotool_git.bb
index 3acf70235e..7562271d90 100644
--- a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -8,7 +8,6 @@ PV =3D "1.0.4+git"
 SRC_URI =3D "git://github.com/ReimuNotMoe/ydotool;protocol=3Dhttps;branc=
h=3Dmaster"
 SRCREV =3D "0c295346d55afcc6aebaaee564333b3e1efabcbd"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake systemd
=20
diff --git a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb b/met=
a-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
index 0e17800c4b..3bbfe4cf9f 100644
--- a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
+++ b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/=
kgdb/agent-proxy.git;protoc
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install () {
     install -d ${D}${bindir}
diff --git a/meta-oe/recipes-kernel/blktests/blktests.bb b/meta-oe/recipe=
s-kernel/blktests/blktests.bb
index 2fb6db9184..ded03a4de2 100644
--- a/meta-oe/recipes-kernel/blktests/blktests.bb
+++ b/meta-oe/recipes-kernel/blktests/blktests.bb
@@ -10,7 +10,6 @@ SRC_URI =3D " \
 	git://github.com/osandov/blktests.git;nobranch=3D1;protocol=3Dhttps \
 	"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep
=20
diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firm=
ware_12.0.1.1105_p3.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broa=
dcom-bt-firmware_12.0.1.1105_p3.bb
index 4b6026ebc0..fe980e3e6f 100644
--- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12=
.0.1.1105_p3.bb
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12=
.0.1.1105_p3.bb
@@ -14,7 +14,6 @@ SRCREV =3D "a0eb4805dbb232f02f156b9351a23790c1a4cec7"
=20
 PE =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit allarch
=20
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-ker=
nel/crash/crash.inc
index 45fc9cd1fd..f3415a04ee 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -14,7 +14,6 @@ DEPENDS =3D "zlib readline coreutils-native ncurses-nat=
ive"
=20
 INC_PR =3D "r1"
=20
-S =3D "${WORKDIR}/git"
 SRC_URI =3D "git://github.com/crash-utility/${BPN}.git;branch=3Dmaster;p=
rotocol=3Dhttps \
            ${GNU_MIRROR}/gdb/gdb-10.2.tar.gz;name=3Dgdb;subdir=3Dgit \
            file://7001force_define_architecture.patch \
diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb b/meta-oe=
/recipes-kernel/drgn/python3-drgn_0.0.31.bb
index 035ccd58a7..b1ff8d4019 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c83d30e99508d=
6b790eacdd3abab846"
 SRC_URI =3D "git://github.com/osandov/drgn.git;protocol=3Dhttps;branch=3D=
main;tag=3Dv${PV}"
 SRCREV =3D "8209a147fb61deed38ca376d063bbff0343ca234"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "\
     autoconf-native \
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe=
/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index 5095dbb253..b5b8075fd7 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -35,7 +35,6 @@ IANA_ENTERPRISE_NUMBERS ?=3D ""
 #IANA_ENTERPRISE_NUMBERS =3D "http://www.iana.org/assignments/enterprise=
-numbers.txt;name=3Diana-enterprise-numbers;downloadfilename=3Diana-enter=
prise-numbers"
 #SRC_URI[iana-enterprise-numbers.sha256sum] =3D "cdd97fc08325667434b805e=
b589104ae63f7a9eb720ecea73cb55110b383934c"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/=
meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 3a058cd286..d4565091fb 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b=
2f4230826c0c6b8814"
=20
 DEPENDS =3D "rsync-native llvm-native"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 # for musl libc
 SRC_URI:append:libc-musl =3D "\
@@ -46,7 +45,7 @@ do_compile[depends] +=3D "virtual/kernel:do_install"
=20
 inherit linux-kernel-base module-base kernel-arch ptest siteinfo
=20
-S =3D "${WORKDIR}/${BP}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
=20
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-k=
ernel/kpatch/kpatch.inc
index 4d187200ec..b8ef092262 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -22,7 +22,6 @@ EXTRA_OEMAKE =3D " \
 	CC=3D'${CC}' \
 	"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install () {
 	oe_runmake install
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipe=
s-kernel/kpatch/kpatch_git.bb
index ba3983e6ff..6521830b7a 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
@@ -6,6 +6,5 @@ SRCREV =3D "0c3c21930895f6582a5c9d9d797f7e11ff41ffb2"
=20
 PV =3D "0.9.1"
=20
-S =3D "${WORKDIR}/git"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb b/meta=
-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
index ff54d72bca..1a90dcf998 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.0.0.bb
@@ -14,7 +14,6 @@ SRC_URI =3D " \
 	file://0002-tlshd-configure.ac-Use-AC_CHECK_HEADER-instead-of-AC.patch =
\
 	"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep pkgconfig systemd
=20
diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb b/meta-oe/reci=
pes-kernel/libbpf/libbpf_1.5.0.bb
index 45caca0114..36312c386b 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
@@ -17,7 +17,7 @@ SRCREV =3D "09b9e83102eb8ab9e540d36b4559c55f3bcdb95d"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_HOST =3D "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|=
mips64).*-linux"
=20
-S =3D "${WORKDIR}/git/src"
+S =3D "${UNPACKDIR}/${BP}/src"
=20
 EXTRA_OEMAKE +=3D "DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${incl=
udedir}"
 EXTRA_OEMAKE:append:class-native =3D " UAPIDIR=3D${includedir}"
diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb b/meta-oe/re=
cipes-kernel/libpfm/libpfm4_4.13.0.bb
index be0659ad2a..f87502930e 100644
--- a/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.13.0.bb
@@ -26,7 +26,7 @@ EXTRA_OEMAKE:append:powerpc64 =3D " ARCH=3D\"powerpc\" =
BITMODE=3D\"64\""
 EXTRA_OEMAKE:append:powerpc64le =3D " ARCH=3D\"powerpc\" BITMODE=3D\"64\=
""
 EXTRA_OEMAKE:append:aarch64 =3D " ARCH=3D\"arm64\""
=20
-S =3D "${WORKDIR}/libpfm-${PV}"
+S =3D "${UNPACKDIR}/libpfm-${PV}"
=20
 do_install () {
 	oe_runmake install
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb b/meta=
-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
index 66869b29a9..6b9e8b9b38 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.1.bb
@@ -13,7 +13,6 @@ SRCREV =3D "417c2e3aa21af670cc5c13db633dd35292f2d0fa"
 SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;b=
ranch=3D${BPN};protocol=3Dhttps \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.=
patch \
            "
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.b=
b b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index 90e847c137..4073381899 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -18,7 +18,6 @@ SRC_URI =3D "git://github.com/diamon/minicoredumper;pro=
tocol=3Dhttps;branch=3Dmaster \
            file://0001-corestripper-Fix-uninitialized-warning.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 SYSTEMD_SERVICE:${PN} =3D "minicoredumper.service"
 SYSTEMD_AUTO_ENABLE =3D "enable"
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb b/meta-oe/r=
ecipes-kernel/pm-graph/pm-graph_5.13.bb
index 037e30abc4..219629d4d7 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
@@ -9,7 +9,6 @@ SRCREV =3D "0987732b013936ad771334f51cba31c453c8a9c9"
 SRC_URI =3D "git://github.com/intel/pm-graph.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://0001-Makefile-fix-multilib-build-failure.patch \
 "
-S =3D "${WORKDIR}/git"
=20
 # Apart from the listed RDEPENDS, analyze-suspend depends on some featur=
es
 # provided by the kernel. These options are:
diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-o=
e/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 11c4037b23..6782dec228 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/rostedt/trace-cmd.git;b
            file://0001-Do-not-emit-useless-rpath.patch"
 SRCREV =3D "18233e4c32857cb7ddd4960beeec8360ed834fc5"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "libtraceevent libtracefs zstd xmlto-native asciidoc-native=
 swig-native bison-native flex-native"
=20
diff --git a/meta-oe/recipes-kernel/turbostat/turbostat.bb b/meta-oe/reci=
pes-kernel/turbostat/turbostat.bb
index 8ac15164d4..a163c4b64e 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
@@ -23,8 +23,7 @@ SRC_URI +=3D "\
             file://COPYING \
             "
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 DEPENDS =3D "libcap"
diff --git a/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb b/meta-oe/=
recipes-kernel/usbip-tools/usbip-tools.bb
index e7e4ca50af..aae17a9fd7 100644
--- a/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
+++ b/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
@@ -28,7 +28,7 @@ do_configure[depends] +=3D "virtual/kernel:do_shared_wo=
rkdir"
=20
 # We need to set S, for not being set to STAGING_KERNEL_DIR, and by that
 # be wiped when we prune dest below. We just set it to usbip-tools-1.0
-S =3D "${WORKDIR}/${BP}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 # Copy the source files from KERNEL/tools/usb/usbip to ${S}
 do_configure[prefuncs] +=3D "copy_usbip_source_from_kernel"
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb b/meta-oe/r=
ecipes-multimedia/faad2/faad2_2.11.2.bb
index 9a7ee412da..83fcaa248d 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
@@ -12,6 +12,5 @@ PV .=3D "+git"
 SRC_URI =3D "git://github.com/knik0/faad2.git;branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "673a22a3c7c33e96e2ff7aae7c4d2bc190dfbf92"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb b/meta-oe/reci=
pes-multimedia/jack/a2jmidid_9.bb
index da92a80ce0..7f8988c3c3 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
@@ -16,7 +16,6 @@ SRC_URI =3D " \
     file://ppc_musl_ucontext.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb b/me=
ta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
index a868a2969d..58bbd8cac3 100644
--- a/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
+++ b/meta-oe/recipes-multimedia/jack/jack-example-tools_4.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "jack"
 SRC_URI =3D "git://github.com/jackaudio/jack-example-tools.git;branch=3D=
main;protocol=3Dhttps"
 SRCREV =3D "33de8b4285fa5054af1b37fe0496c110604ed564"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb b/meta-oe/rec=
ipes-multimedia/jack/jack_1.9.22.bb
index d4e6447aad..3b3ea85349 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
@@ -24,7 +24,6 @@ SRCREV =3D "4f58969432339a250ce87fe855fb962c67d00ddb"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit waf pkgconfig
=20
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb b/meta-oe=
/recipes-multimedia/libass/libass_0.17.4.bb
index 297b7c01e8..3165736981 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "fontconfig freetype fribidi harfbuzz"
=20
 SRC_URI =3D "git://github.com/libass/libass.git;protocol=3Dhttps;branch=3D=
master"
 SRCREV =3D "bbb3c7f1570a4a021e52683f3fbdf74fe492ae84"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/=
meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 82db2f159e..23487329fb 100644
--- a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -21,6 +21,6 @@ UPSTREAM_CHECK_REGEX =3D "/projects/mad/files/libid3tag=
/(?P<pver>.*)/$"
=20
 SRC_URI[sha256sum] =3D "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a4=
6a86b03610e26151"
=20
-S =3D "${WORKDIR}/libid3tag-${PV}"
+S =3D "${UNPACKDIR}/libid3tag-${PV}"
=20
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb b/meta-oe=
/recipes-multimedia/libjxl/libjxl_0.10.3.bb
index 505fca4c8f..2405126e5c 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;proto=
col=3Dhttps;nobranch=3D1 \
            "
=20
 SRCREV =3D "4a3b22d2600f92d8706fb72d85d52bfee2acbd54"
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D " \
 	-DCMAKE_BUILD_TYPE=3DRelease \
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-o=
e/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 3f5a052906..0f89574b9a 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] =3D "bbfac3ed6bfbc2823d3775ebb931087=
371e142bb0e9bb1bee51a76a6e0
=20
 CVE_PRODUCT:append =3D " mad_libmad"
=20
-S =3D "${WORKDIR}/libmad-${PV}"
+S =3D "${UNPACKDIR}/libmad-${PV}"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb b/meta-o=
e/recipes-multimedia/libopus/libopus_1.5.2.bb
index 02958ef023..642f34f71d 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4b365c2155d6=
6e550e1447075d6744a5"
 SRC_URI =3D "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "65c1d2f78b9f2fb20082c38cbe47c951ad5839345876e469=
41612ee87f9a7ce1"
=20
-S =3D "${WORKDIR}/opus-${PV}"
+S =3D "${UNPACKDIR}/opus-${PV}"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb b/=
meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
index 6d941ae5d3..fb822d7a0e 100644
--- a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
+++ b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
@@ -14,6 +14,6 @@ UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.=
\d+)+)"
 SRC_URI =3D "https://ftp.osuosl.org/pub/xiph/releases/opus/libopusenc-${=
PV}.tar.gz"
 SRC_URI[sha256sum] =3D "8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1=
c19a564fe106cbb9"
=20
-S =3D "${WORKDIR}/libopusenc-${PV}"
+S =3D "${UNPACKDIR}/libopusenc-${PV}"
=20
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb b/meta-oe/=
recipes-multimedia/libxmp/libxmp_4.6.3.bb
index b8d916e70a..c302f65ed5 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
@@ -8,4 +8,3 @@ inherit cmake pkgconfig
 SRC_URI =3D "git://github.com/libxmp/libxmp.git;protocol=3Dhttps;branch=3D=
master;tag=3Dlibxmp-${PV}"
 SRCREV =3D "bed660f8e530d399c38f27a5a7732f4e79740585"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/met=
a-oe/recipes-multimedia/live555/live555_20210824.bb
index 80c770c3e3..1622a97fe1 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
@@ -18,7 +18,7 @@ MIRRORS +=3D "http://www.live555.com/liveMedia/public/ =
http://download.videolan.or
=20
 SRC_URI[sha256sum] =3D "ce95a1c79f6d18e959f9dc129b8529b711c60e76754acc28=
5e60946303b923ec"
=20
-S =3D "${WORKDIR}/live"
+S =3D "${UNPACKDIR}/live"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
                     file://COPYING.LESSER;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02 \
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb b/m=
eta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
index 272e293fd4..68a29dde91 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
@@ -9,7 +9,6 @@ SRCREV =3D "3188549fba13bbdf3a5a98de2a38c2e71f04e21e"
=20
 inherit meson pkgconfig
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan openg=
l', d)} lcms"
=20
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.40.0.bb
index 3d54bbb341..3223dd69d7 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
@@ -18,7 +18,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D570a9b37=
49dd0463a1778803b12a6dce"
=20
 SRCREV =3D "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
 SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/${@oe.utils.trim_version('${PV}', 2)};protocol=3Dhttps"
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig mime-xdg
=20
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
index afe217e1f3..0a3b5d28b6 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
@@ -33,7 +33,6 @@ SRC_URI =3D "\
=20
 SRCREV =3D "fc15e229d9d337e46d730f00647821adbbd58548"
=20
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v4l-utils-(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/r=
ecipes-multimedia/v4l2apps/yavta_git.bb
index 699b5608db..87dc7a7be6 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3D=
master;protocol=3Dhttps \
 SRCREV =3D "52c975e5542504ac10bed8b1d68df5c75951d202"
=20
 PV =3D "0.0"
-S =3D "${WORKDIR}/git"
=20
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb b/meta-o=
e/recipes-multimedia/wavpack/wavpack_5.6.0.bb
index 7384d2892f..651fbc4192 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/dbry/WavPack.git;branch=3D=
master;protocol=3Dhttps \
=20
 SRCREV =3D "e03e8e29dc618e08e7baba9636e57ba1254874ce"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig lib_package
=20
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb b/meta-oe/r=
ecipes-multimedia/webm/libvpx_1.15.2.bb
index f709541c20..a7cd76e0c7 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
@@ -12,7 +12,6 @@ SRC_URI +=3D "git://chromium.googlesource.com/webm/libv=
px;protocol=3Dhttps;branch=3Dma
            file://libvpx-configure-support-blank-prefix.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 # ffmpeg links with this and fails
 # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.te=
xt+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@=
GLIBC_2.4'
diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/re=
cipes-multimedia/xpext/xpext_1.0-5.bb
index 3d100b870c..5023e4e842 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddb043791349ba5=
7ad1169e1c92477cb6"
=20
 SRC_URI =3D "http://repository.maemo.org/pool/maemo/ossw/source/x/${BPN}=
/${BPN}_${PV}.tar.gz \
            file://auxdir.patch;striplevel=3D0"
-S =3D "${WORKDIR}/xpext-1.0"
+S =3D "${UNPACKDIR}/xpext-1.0"
=20
 inherit autotools pkgconfig features_check
 # depends on virtual/libx11
diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/reci=
pes-multimedia/xsp/xsp_1.0.0-8.bb
index 8b9247694c..5350cf1c65 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -7,7 +7,7 @@ SRC_URI =3D "http://repository.maemo.org/pool/maemo/ossw/=
source/x/xsp/${BPN}_${PV}
            file://xsp-fix-pc.patch \
            file://0001-fix-incompatible-pointer-types-build-error-in-gcc=
-15.patch \
 "
-S =3D "${WORKDIR}/Xsp"
+S =3D "${UNPACKDIR}/Xsp"
=20
 inherit autotools pkgconfig features_check
 # depends on virtual/libx11
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb b/meta-o=
e/recipes-navigation/geoclue/geoclue_2.7.2.bb
index db0142502f..48b2535a03 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.2.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "git://gitlab.freedesktop.org/geoclue/geocl=
ue.git;protocol=3Dhttps;branc
     file://0001-libgeoclue-don-t-try-to-use-g-ir-scanner-when-intros.pat=
ch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 # Without this line, package is declared a library and named libgeoclue*
 AUTO_LIBNAME_PKGS =3D ""
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b=
/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 40e51a6a43..bd15b0bda8 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -24,7 +24,6 @@ SRC_URI =3D " \
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/cyrusimap/cyrus-sasl/archives=
"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig useradd systemd
=20
diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb b/meta-oe/recip=
es-printing/qpdf/qpdf_12.2.0.bb
index e615681687..8ed993aa78 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
@@ -20,7 +20,6 @@ EXTRA_OECMAKE =3D ' \
 LDFLAGS:append:mipsarch =3D " -latomic"
 LDFLAGS:append:riscv32 =3D " -latomic"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D "gnutls"
 PACKAGECONFIG[gnutls] =3D "-DREQUIRE_CRYPTO_GNUTLS=3DON,-DREQUIRE_CRYPTO=
_OPENSSL=3DON"
diff --git a/meta-oe/recipes-security/audit/audit_4.0.5.bb b/meta-oe/reci=
pes-security/audit/audit_4.0.5.bb
index 6fa025abd4..58100b206d 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.5.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.5.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/linux-audit/${BPN}-usersp=
ace.git;branch=3Dmaster;proto
            file://auditd \
           "
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "97c4ec3d68b5b199f2796d1e126c2144506bd228"
=20
 inherit autotools python3targetconfig update-rc.d systemd
diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-har=
dening-checker_0.6.10.bb b/meta-oe/recipes-security/kernel-hardening-chec=
ker/kernel-hardening-checker_0.6.10.bb
index f4816e733b..e7610ac785 100644
--- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.10.bb
+++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-=
checker_0.6.10.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd32239bc=
b673463ab874e80d47fae504"
 SRC_URI =3D "git://github.com/a13xp0p0v/kernel-hardening-checker;protoco=
l=3Dhttps;branch=3Dmaster"
 SRCREV =3D "f4dbe258ff3d37489962ea9cf210192ae7ff9280"
=20
-S =3D "${UNPACKDIR}/git"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb b/meta-o=
e/recipes-security/keyutils/keyutils_1.6.3.bb
index 7b3d728216..86f45656f6 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
@@ -26,7 +26,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/dhowells/keyutils.git;p
            "
 SRCREV =3D "cb3bb194cca88211cbfcdde2f10c0f43c3fb8ec3"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[manpages] =3D ""
diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-me=
ltdown-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checke=
r/spectre-meltdown-checker_0.46.bb
index 40858258c3..48f9a738bb 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-=
checker_0.46.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-=
checker_0.46.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.s=
h;beginline=3D2;endline=3D2;md5
 SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=3D=
https;branch=3Dmaster"
 SRCREV =3D "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
=20
-S =3D "${UNPACKDIR}/git"
=20
 # binutils: readelf,objdump might be used for deeper analysis
 # coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cases
diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb =
b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
index 86acdc7aa1..f172168335 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
@@ -8,7 +8,7 @@ SECTION =3D "System Environment/Kernel"
 SRC_URI =3D "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910.=
tar.gz"
 SRC_URI[sha256sum] =3D "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42f=
d311c4022b78010a"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING.tomoyo;md5=3D751419260aa954499f7aba=
abaa882bbe"
diff --git a/meta-oe/recipes-shells/mksh/mksh_59c.bb b/meta-oe/recipes-sh=
ells/mksh/mksh_59c.bb
index e3a8ca8b5e..d27320cf1f 100644
--- a/meta-oe/recipes-shells/mksh/mksh_59c.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_59c.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX =3D "${BPN}-R(?P<pver>.*)\.tgz"
=20
 inherit update-alternatives
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 ALTERNATIVE:${PN} =3D "sh"
 ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_gi=
t.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
index 6d64ab71bf..85443984a2 100644
--- a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
+++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
@@ -11,7 +11,6 @@ SRCREV =3D "812e2c56aed246931a667f16c28b096e34597016"
=20
 FILES:${PN} =3D "${datadir}/ace-builds"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "rsync-native"
=20
diff --git a/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb b/meta-oe/re=
cipes-support/avro/avro-c++_1.11.3.bb
index 0ac1decccf..c1e8863fb3 100644
--- a/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
+++ b/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "git://github.com/apache/avro;branch=3D${BR=
ANCH};protocol=3Dhttps \
            file://0003-Update-CXX-standard-to-CXX14.patch \
           "
=20
-S =3D "${WORKDIR}/git/lang/c++"
+S =3D "${UNPACKDIR}/${BP}/lang/c++"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.3.bb b/meta-oe/reci=
pes-support/avro/avro-c_1.11.3.bb
index 37a12006ba..f7da323710 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
@@ -14,6 +14,6 @@ SRC_URI =3D " \
     file://0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch;patchdir=3D=
../.. \
     file://0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch;pa=
tchdir=3D../.. \
 "
-S =3D "${WORKDIR}/git/lang/c"
+S =3D "${UNPACKDIR}/${BP}/lang/c"
=20
 inherit cmake pkgconfig
diff --git a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb b/meta-oe/recipes=
-support/bcu/bcu_1.1.115.bb
index 897e7031ca..260fba02a9 100644
--- a/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
+++ b/meta-oe/recipes-support/bcu/bcu_1.1.115.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/nxp-imx/bcu;protocol=3Dht=
tps;branch=3Dmaster \
            "
 SRCREV =3D "f081c69c26e330cf03ec790051c415c4716509d9"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "curl libyaml libusb1 openssl libftdi"
=20
diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb b/meta-oe/recip=
es-support/bdwgc/bdwgc_8.2.8.bb
index fe51c1029d..3c8c41cc03 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
@@ -26,7 +26,6 @@ DEPENDS =3D "libatomic-ops"
 SRCREV =3D "ee59af3722e56de8404de6cd0c21c2493cc4d855"
 SRC_URI =3D "git://github.com/ivmai/bdwgc.git;branch=3Drelease-8_2;proto=
col=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb b/m=
eta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb
index 4f4f58def3..f49aa480da 100644
--- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De49f4652534a=
f377a713df3d9dec60cb"
=20
 SRC_URI =3D "git://github.com/embetrix/${BPN};branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "7489280a7a1247f23543343aba4e95bf2f2e8fa6"
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "libtinyxml2 libarchive"
 inherit cmake pkgconfig
diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb b/meta=
-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
index a4b5650c90..0a2514237a 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
@@ -11,7 +11,6 @@ DEPENDS +=3D "boost qemu-native"
 SRC_URI =3D "git://github.com/boost-ext/sml.git;protocol=3Dhttps;branch=3D=
master"
 SRCREV =3D "cd3ef80206b71463de96d6b682cfdc99703ec147"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/btop/btop_1.4.3.bb b/meta-oe/recipes=
-support/btop/btop_1.4.3.bb
index b0d74d49d7..9a5a21c56d 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.3.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.3.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/aristocratos/btop.git;proto=
col=3Dhttps;branch=3Dmain;tag
            "
 SRCREV =3D "3f1ccd9f6c455fef6d4d8cfbc8ed71b86961323d"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb b/m=
eta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
index f512111d66..058ede614e 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.3.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88456d0a60d=
e4c71ff4d787c212f253"
 SRC_URI =3D "git://github.com/vsergeev/c-periphery;protocol=3Dhttps;bran=
ch=3Dmaster"
 SRCREV =3D "911e989fe41eb90c7df274cb54555346caf2a632"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb b=
/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
index 18db0721de..63500def05 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "libeigen glog"
 SRC_URI =3D "git://github.com/ceres-solver/ceres-solver.git;branch=3Dmas=
ter;protocol=3Dhttps"
 SRCREV =3D "85331393dc0dff09f6fb9903ab0c4bfa3e134b01"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recip=
es-support/cli11/cli11_2.3.2.bb
index ef3c951bbf..346ccd6c69 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
@@ -11,7 +11,6 @@ SRC_URI +=3D "gitsm://github.com/CLIUtils/CLI11;branch=3D=
main;protocol=3Dhttps \
             file://0001-Do-not-download-the-catch-framework-during-confi=
gure.patch"
=20
 SRC_URI[sha256sum] =3D "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf=
4e24ee6b536bd9bc"
-S =3D "${WORKDIR}/git"
=20
 do_configure:prepend() {
     mkdir -p ${S}/tests/catch2
diff --git a/meta-oe/recipes-support/cmark/cmark_0.31.1.bb b/meta-oe/reci=
pes-support/cmark/cmark_0.31.1.bb
index 1edb95e455..bbbb36dace 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.31.1.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.31.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D81f9cae6293cc0=
345a9144b78152ab62"
=20
 SRC_URI =3D "git://github.com/commonmark/cmark.git;branch=3Dmaster;proto=
col=3Dhttps"
 SRCREV =3D "bb3678d7a73cb02d35c8876ecd097072636200a8"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake lib_package
=20
diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb b/meta-=
oe/recipes-support/composefs/composefs_1.0.8.bb
index c1df5dce03..f2bae91f44 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM =3D "\
 SRCREV =3D "858ce1b38e1534c2602eb431124b5dca706bc746"
 SRC_URI =3D "git://github.com/containers/composefs.git;protocol=3Dhttps;=
branch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson
=20
diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb b/m=
eta-oe/recipes-support/consolation/consolation_0.0.9.bb
index 17981b6e9b..a1523be376 100644
--- a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
+++ b/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
@@ -17,7 +17,6 @@ DEPENDS =3D " \
 SRC_URI =3D "git://salsa.debian.org/consolation-team/consolation.git;bra=
nch=3Dmaster"
 SRCREV =3D "5ef08f0cd6ede62de14de477b74fc3611108c676"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig systemd
=20
diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-=
oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
index 8b50cb0654..4b8bf162fa 100644
--- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
+++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "\
     file://a53f123040998744602f190944464af0e159ea19.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb b/meta-oe=
/recipes-support/cpprest/cpprest_2.10.19.bb
index 1444974b44..ec7be4ad37 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/Microsoft/cpprestsdk.git;=
protocol=3Dhttps;branch=3Dmaste
 # tag 2.10.19
 SRCREV =3D "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/r=
ecipes-support/cpulimit/cpulimit_0.2.bb
index ee2f91343e..676028efa1 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/opsengine/cpulimit.git;pr=
otocol=3Dhttps;branch=3Dmaster
            file://0002-busy.c-Fix-incompatible-pointer-type-error.patch =
\
            "
=20
-S =3D "${WORKDIR}/git"
=20
 do_compile() {
     oe_runmake all
diff --git a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb b/me=
ta-oe/recipes-support/crucible/crucible_2023.11.02.bb
index 8966194704..132395e023 100644
--- a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
@@ -9,7 +9,6 @@ require ${BPN}-go-mods.inc
=20
 SRCREV =3D "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
=20
-S =3D "${WORKDIR}/git"
=20
 GO_IMPORT =3D "github.com/usbarmory/crucible"
 GO_INSTALL =3D "\
diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb =
b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index ece30a598b..ef709b5715 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -8,8 +8,7 @@ SRC_URI =3D "https://archives.fedoraproject.org/pub/archi=
ve/fedora/linux/releases/
            https://archives.fedoraproject.org/pub/archive/fedora/linux/r=
eleases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=3D=
ctapi-common.README"
 SRC_URI[sha256sum] =3D "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab=
967fdf4137f5de91"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_compile() {
     install -pm 644 ${UNPACKDIR}/ctapi-common.LICENSE LICENSE
diff --git a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb b/meta-oe/recipes=
-support/ctre/ctre_3.9.0.bb
index 3a09fe743c..901763f0ad 100644
--- a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
+++ b/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2e982d844baa4d=
f1c80de75470e0c5cb"
 SRC_URI =3D "git://github.com/hanickadot/compile-time-regular-expression=
s.git;protocol=3Dhttps;branch=3Dmain"
 SRCREV =3D "eb9577aae3515d14e6c5564f9aeb046d2e7c1124"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb b/meta-oe/r=
ecipes-support/cxxopts/cxxopts_3.3.1.bb
index 8df707b86f..7b0cc05979 100644
--- a/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
+++ b/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8de00431559a76=
a1b43f6fd44f8f6689"
 SRC_URI =3D "git://github.com/jarro2783/cxxopts.git;protocol=3Dhttps;bra=
nch=3Dmaster"
 SRCREV =3D "44380e5a44706ab7347f400698c703eb2a196202"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb b/meta-oe/recip=
es-support/cyaml/cyaml_1.4.1.bb
index f63348a328..5f33c27c52 100644
--- a/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
+++ b/meta-oe/recipes-support/cyaml/cyaml_1.4.1.bb
@@ -11,7 +11,6 @@ SRCREV =3D "07ff8654a270ec9b410acd3152b60de9e9f941af"
=20
 SRC_URI =3D "git://github.com/tlsa/libcyaml.git;protocol=3Dhttps;branch=3D=
main"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe=
/recipes-support/daemonize/daemonize_git.bb
index b0712e521b..bae04ca7a3 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -12,6 +12,5 @@ SRC_URI =3D " \
     file://0001-fix-getopt.c-too-many-arguments-to-function-write-er.pat=
ch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/me=
ta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 1ef6a07d0d..cc83015e65 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -31,7 +31,7 @@ SRC_URI[sha256sum] =3D "a55535012b2be7a52dcd9eccabb9a19=
8b13be50d0384143bd3b32b8710
=20
 UPSTREAM_CHECK_URI =3D "http://cr.yp.to/daemontools/install.html"
=20
-S =3D "${WORKDIR}/admin/${BP}"
+S =3D "${UNPACKDIR}/admin/${BP}"
=20
 # http://errors.yoctoproject.org/Errors/Details/766886/
 # pathexec_run.c:19:17: error: passing argument 2 of 'execve' from incom=
patible pointer type [-Wincompatible-pointer-types]
diff --git a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb b/meta=
-oe/recipes-support/dc/double-conversion_3.3.1.bb
index 50a36a2c27..31330faa17 100644
--- a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
+++ b/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
@@ -6,7 +6,6 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ea35644f0ec0d9767897115667e9=
01f"
=20
=20
-S =3D "${WORKDIR}/git"
=20
 SRC_URI =3D " \
         git://github.com/google/double-conversion.git;protocol=3Dhttps;b=
ranch=3Dmaster \
diff --git a/meta-oe/recipes-support/devmem2/devmem2_2.0.bb b/meta-oe/rec=
ipes-support/devmem2/devmem2_2.0.bb
index 5d2e8463e2..e601755af4 100644
--- a/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2_2.0.bb
@@ -8,7 +8,6 @@ SRCREV =3D "5b395a946894eb4f4ef5d07c80a50a88573a541e"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 CFLAGS +=3D "-DFORCE_STRICT_ALIGNMENT"
=20
diff --git a/meta-oe/recipes-support/dhex/dhex_0.69.bb b/meta-oe/recipes-=
support/dhex/dhex_0.69.bb
index 14e6ec7112..f292cf8d4f 100644
--- a/meta-oe/recipes-support/dhex/dhex_0.69.bb
+++ b/meta-oe/recipes-support/dhex/dhex_0.69.bb
@@ -13,7 +13,7 @@ SRC_URI =3D " \
 "
 SRC_URI[sha256sum] =3D "52730bcd1cf16bd4dae0de42531be9a4057535ec61ca38c0=
804eb8246ea6c41b"
=20
-S =3D "${WORKDIR}/dhex_${PV}"
+S =3D "${UNPACKDIR}/dhex_${PV}"
=20
 EXTRA_OEMAKE +=3D "'CC=3D${CC}' 'LDFLAGS=3D${LDFLAGS}' 'CPPFLAGS=3D${CPP=
FLAGS}'"
=20
diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb b/meta-oe=
/recipes-support/digitemp/digitemp_3.7.2.bb
index 5272b8ea06..baddf42e6b 100644
--- a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
+++ b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
@@ -11,7 +11,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "a162e63aad35358aab325388f3d5e88121606419"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "ds9097 ds9097u \
                 SYSTYPE=3D'Linux' \
diff --git a/meta-oe/recipes-support/dool/dool_1.3.4.bb b/meta-oe/recipes=
-support/dool/dool_1.3.4.bb
index 25662a0271..d18f5c8b01 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.4.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.4.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/scottchiefbaker/dool.git;=
branch=3Dmaster;protocol=3Dhttp
=20
 SRCREV =3D "5068abef0a960c173a91e84a45e7fea1b0a802c0"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb b/meta-=
oe/recipes-support/driverctl/driverctl_0.115.bb
index 970844f982..578a2b8d3b 100644
--- a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
+++ b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
@@ -10,7 +10,6 @@ RDEPENDS:${PN} +=3D "bash bash-completion"
 SRC_URI =3D "git://gitlab.com/driverctl/driverctl.git;branch=3Dmaster;pr=
otocol=3Dhttps"
 SRCREV =3D "2ba60536eb20ca0a6a751bd8b6501dba84ec45d3"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig systemd features_check
=20
diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/met=
a-oe/recipes-support/edid-decode/edid-decode_git.bb
index 197e4b7184..fc8681ca44 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -13,7 +13,6 @@ PV =3D "0.0+git"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recip=
es-support/eject/eject_2.1.5.bb
index 3f6017977a..aa0e86db12 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "https://downloads.yoctoproject.org/mirror/=
sources/${BP}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7=
a34a67402e2ffe55"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
=20
 do_compile:prepend() {
diff --git a/meta-oe/recipes-support/epeg/epeg_git.bb b/meta-oe/recipes-s=
upport/epeg/epeg_git.bb
index e5277b1579..63c1455f25 100644
--- a/meta-oe/recipes-support/epeg/epeg_git.bb
+++ b/meta-oe/recipes-support/epeg/epeg_git.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/mattes/epeg.git;branch=3Dma=
ster;protocol=3Dhttps \
            file://0001-configure-Fix-checks-for-libjpeg-and-libexif.patc=
h \
            "
 SRCREV =3D "9a175cd67eaa61fe45413d8da82da72936567047"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/r=
ecipes-support/espeak/espeak_1.48.04.bb
index b4812d59d6..c80bf12ade 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "http://downloads.sourceforge.net/espeak/es=
peak-1.48.04-source.zip \
 "
 SRC_URI[sha256sum] =3D "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2e=
c612f09b207f0659"
=20
-S =3D "${WORKDIR}/espeak-${PV}-source"
+S =3D "${UNPACKDIR}/espeak-${PV}-source"
=20
 DEPENDS =3D "portaudio-v19 qemu-helper-native"
 inherit siteinfo qemu
diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/met=
a-oe/recipes-support/evemu-tools/evemu-tools_git.bb
index 491f10dda0..225d15cc7f 100644
--- a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
+++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
@@ -10,7 +10,6 @@ DEPENDS =3D "libevdev"
 SRCREV =3D "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
 SRC_URI =3D "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protoco=
l=3Dhttps;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
 PV =3D "2.7.0+git"
=20
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/reci=
pes-support/exiv2/exiv2_0.28.3.bb
index 3e33ab7953..c0fb32ab79 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -6,6 +6,5 @@ DEPENDS =3D "zlib expat brotli libinih"
=20
 SRC_URI =3D "git://github.com/Exiv2/exiv2.git;protocol=3Dhttps;branch=3D=
0.28.x"
 SRCREV =3D "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake gettext
diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recip=
es-support/fbset/fbset-modes.bb
index fcaf31795b..dd9c392d89 100644
--- a/meta-oe/recipes-support/fbset/fbset-modes.bb
+++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
@@ -7,8 +7,7 @@ PV =3D "0.1.0"
=20
 SRC_URI =3D "file://fb.modes"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     install -d ${D}${sysconfdir}
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/=
recipes-support/freerdp/freerdp3_3.5.1.bb
index 109b2b599b..284f61c137 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
@@ -10,7 +10,6 @@ inherit pkgconfig cmake
 SRCREV =3D "eda5c99686e15327f2f37b9cadf307e852b96adf"
 SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protoc=
ol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "freerdp"
=20
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/=
recipes-support/freerdp/freerdp_2.11.7.bb
index e200f59b05..18af3229d7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -23,7 +23,6 @@ SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branc=
h=3Dstable-2.0;protocol=3Dhttps
            file://CVE-2024-32661.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE +=3D " \
     -DWITH_FFMPEG=3DOFF \
diff --git a/meta-oe/recipes-support/function2/function2_4.2.4.bb b/meta-=
oe/recipes-support/function2/function2_4.2.4.bb
index 98d05f6e25..588e44deaa 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.4.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.4.bb
@@ -8,7 +8,6 @@ PV .=3D "+git"
=20
 SRC_URI +=3D "gitsm://github.com/Naios/function2;branch=3Dmaster;protoco=
l=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
 inherit ptest
diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recip=
es-support/fuse/fuse3_3.16.2.bb
index e75c88210c..5333c25a9c 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D " \
 SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "f797055d9296b275e981f5f62d4e32e089614fc253d1ef29=
85851025b8a0ce87"
=20
-S =3D "${WORKDIR}/fuse-${PV}"
+S =3D "${UNPACKDIR}/fuse-${PV}"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX =3D "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-sup=
port/gd/gd_2.3.3.bb
index cc2c1571e6..ea5c487c52 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "git://github.com/libgd/libgd.git;nobranch=3D=
1;protocol=3Dhttps \
=20
 SRCREV =3D "b5319a41286107b53daa0e08e402aa1819764bdc"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools binconfig gettext pkgconfig
=20
diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb b/meta-oe/rec=
ipes-support/gflags/gflags_2.2.2.bb
index 15efc8cb00..8ea158eab3 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dc80d1a3b62=
3f72bb85a4c75b556551df"
 SRC_URI =3D "git://github.com/gflags/gflags.git;branch=3Dmaster;protocol=
=3Dhttps"
 SRCREV =3D "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/glog/glog_0.7.1.bb b/meta-oe/recipes=
-support/glog/glog_0.7.1.bb
index 586afcad53..570d9a7e5f 100644
--- a/meta-oe/recipes-support/glog/glog_0.7.1.bb
+++ b/meta-oe/recipes-support/glog/glog_0.7.1.bb
@@ -12,7 +12,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "7b134a5c82c0c0b5698bb6bf7a835b230c5638e4"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/gnulib/gnulib_202401.bb b/meta-oe/re=
cipes-support/gnulib/gnulib_202401.bb
index 8f70cd7a09..f3fbb94ae8 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_202401.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
@@ -16,7 +16,6 @@ SRCREV =3D "c99c8d491850dc3a6e0b8604a2729d8bc5c0eff1"
 SRC_URI =3D "git://git.savannah.gnu.org/git/gnulib.git;branch=3Dstable-$=
{PV};protocol=3Dhttps \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 do_install () {
     install -d ${D}/${datadir}/gnulib
diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.=
4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
index 8fda2990d8..4558aa13d6 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
 SRC_URI =3D "git://github.com/google/benchmark.git;protocol=3Dhttps;bran=
ch=3Dmain;tag=3Dv${PV}"
 SRCREV =3D "eddb0241389718a23a42db6af5f0164b6e0139af"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D " \
     -DBUILD_SHARED_LIBS=3Dyes \
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb b/meta=
-oe/recipes-support/gperftools/gperftools_2.16.bb
index 2b0fb534b3..c0fe586f6d 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.16.bb
@@ -21,7 +21,6 @@ SRC_URI:append:libc-musl =3D " \
=20
 inherit autotools
=20
-S =3D "${WORKDIR}/git"
=20
 # On mips, we have the following error.
 #   do_page_fault(): sending SIGSEGV to ls for invalid read access from =
00000008
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-sup=
port/gpm/gpm_git.bb
index a379065912..155e56bdef 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -20,7 +20,6 @@ SRC_URI =3D "git://github.com/telmich/gpm;protocol=3Dht=
tps;branch=3Dmaster \
            file://0003-Add-incomplete-type-definition-for-WINDOW-in-Gpm_=
Wge.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep update-rc.d systemd texinfo
=20
diff --git a/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb b/me=
ta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
index 89119389fd..c0eb3e02d8 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D "2459290f367a47c8a1ce4ea2ec08359=
799ea33dc15ed4436439596ce88
=20
 UPSTREAM_CHECK_URI =3D "https://grsecurity.net/download"
=20
-S =3D "${WORKDIR}/gradm"
+S =3D "${UNPACKDIR}/gradm"
=20
 do_compile() {
     oe_runmake 'CC=3D${CC}'                               \
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb b/meta-oe/rec=
ipes-support/gsoap/gsoap_2.8.134.bb
index 5528e87e6c..0956eb121c 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
@@ -13,7 +13,7 @@ inherit autotools
=20
 BBCLASSEXTEND =3D "native"
=20
-S =3D "${WORKDIR}/${BPN}-2.8"
+S =3D "${UNPACKDIR}/${BPN}-2.8"
=20
 EXTRA_OECONF +=3D "--enable-ipv6 --enable-c-locale"
 PARALLEL_MAKE =3D ""
diff --git a/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb b/meta-oe/re=
cipes-support/hidapi/hidapi_0.15.0.bb
index 12823575f9..7d2c87d02d 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
@@ -12,4 +12,3 @@ inherit autotools pkgconfig
=20
 SRC_URI =3D "git://github.com/libusb/hidapi.git;protocol=3Dhttps;branch=3D=
master"
 SRCREV =3D "d6b2a974608dec3b76fb1e36c189f22b9cf3650c"
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/hstr/hstr_3.1.0.bb b/meta-oe/recipes=
-support/hstr/hstr_3.1.0.bb
index a641feef6f..0ee900ca3d 100644
--- a/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
+++ b/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "https://github.com/dvorka/hstr/releases/do=
wnload/3.1/hstr-${PV}-tarba
            file://0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch \
            file://0001-Use-OE-specific-checks-for-ncurses.patch"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 SRC_URI[sha256sum] =3D "4dabf61f045f022bac8bc909e5fd96041af6c53df56d97df=
a3cfbf49af4453a5"
=20
diff --git a/meta-oe/recipes-support/htop/htop_3.3.0.bb b/meta-oe/recipes=
-support/htop/htop_3.3.0.bb
index cd5b766f0f..efb89bf3ae 100644
--- a/meta-oe/recipes-support/htop/htop_3.3.0.bb
+++ b/meta-oe/recipes-support/htop/htop_3.3.0.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/htop-dev/htop.git;branch=3D=
main;protocol=3Dhttps \
 "
 SRCREV =3D "68c970c7ef4a0682760ed570b3d82388ae7ccf54"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/=
meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
index ed342d6757..7f6fba995c 100644
--- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
@@ -140,7 +140,6 @@ SRC_URI =3D "git://github.com/wooorm/dictionaries.git=
;branch=3Dmain;protocol=3Dhttps"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     for LANGUAGE in `ls -d1 ${S}/dictionaries/*` ; do
diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb b/meta-oe=
/recipes-support/hunspell/hunspell_1.7.2.bb
index afe75472a5..67a51f5c9f 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D " \
 SRCREV =3D "2969be996acad84b91ab3875b1816636fe61a40e"
 SRC_URI =3D "git://github.com/${BPN}/${BPN}.git;branch=3Dmaster;protocol=
=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig gettext
=20
diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb=
 b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
index 8218b08084..03eb7ccbf1 100644
--- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -13,5 +13,4 @@ PV =3D "1.0.1+git"
 SRCREV =3D "ecae6c6e8ca6b6bad080a1c73f10ffd0e67d75a7"
 SRC_URI =3D "git://github.com/libimobiledevice/idevicerestore;protocol=3D=
https;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb =
b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index a892a55844..10d2150998 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -15,7 +15,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>([0-9][\.|_|-]=
?)+)"
 SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;=
protocol=3Dhttps"
 SRCREV =3D "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig update-alternatives
 export ac_cv_sys_file_offset_bits =3D "64"
diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb b/met=
a-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
index 7b6ed6fdd9..f4905e3c0b 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
@@ -7,7 +7,6 @@ SRCREV =3D "72f7fa621357299bb6c8f5d29b4efbafcbd34bf7"
 SRC_URI =3D "git://github.com/lefcha/imapfilter;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV} \
            file://ldflags.patch \
 "
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "openssl lua libpcre2"
=20
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb b/meta-oe/r=
ecipes-support/imx-cst/imx-cst_3.4.0.bb
index 375c0b4e10..3b57f4ed81 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "\
=20
 SRC_URI[sha256sum] =3D "52ee3cee3bc500a42095f73c4584e223b4b9d2dfc1cd3e5d=
f965c5952eba8c8d"
=20
-S =3D "${WORKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
+S =3D "${UNPACKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
=20
 EXTRA_OEMAKE =3D 'CC=3D"${CC}" LD=3D"${CC}" AR=3D"${AR}" OBJCOPY=3D"${OB=
JCOPY}"'
=20
diff --git a/meta-oe/recipes-support/inih/libinih_58.bb b/meta-oe/recipes=
-support/inih/libinih_58.bb
index 2bcf2b4bd4..0ebeec6851 100644
--- a/meta-oe/recipes-support/inih/libinih_58.bb
+++ b/meta-oe/recipes-support/inih/libinih_58.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da7a95d2af9=
0376e85a05318794e6f202"
=20
 SRC_URI =3D "git://github.com/benhoyt/inih.git;protocol=3Dhttps;branch=3D=
master"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "5cc5e2c24642513aaa5b19126aad42d0e4e0923e"
=20
 inherit meson pkgconfig
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb b/meta-=
oe/recipes-support/iniparser/iniparser_4.2.6.bb
index aaabfaa085..9ab713ee92 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
@@ -7,7 +7,6 @@ SRCBRANCH =3D "main"
 SRCREV =3D "4bef811283e0ec1658c60e09950bd5a1ddc92e4b"
=20
 SRC_URI =3D "git://gitlab.com/iniparser/iniparser.git;protocol=3Dhttps;b=
ranch=3D${SRCBRANCH}"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0=
.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
index fdec940268..cb77dc81b0 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
@@ -9,7 +9,6 @@ SRCREV =3D "5c2ab772338bcbe516306bf8cf1059ddf2fa6bb7"
 SRC_URI =3D "git://github.com/${BPN}/${BPN};branch=3Dmaster;protocol=3Dh=
ttps \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb b/meta-oe=
/recipes-support/jsoncons/jsoncons_1.3.2.bb
index 781a0ef18f..314f67928a 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ee7f7ed2001e4=
cde4679fdb8926f820"
 SRC_URI =3D "git://github.com/danielaparker/jsoncons.git;protocol=3Dhttp=
s;branch=3Dmaster;tag=3Dv${PV}"
 SRCREV =3D "64b9da1e9f15eeff4ec9d6bc856538db542118f2"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/lcms/lcms_2.16.bb b/meta-oe/recipes-=
support/lcms/lcms_2.16.bb
index 8135f83a05..87b0979200 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.16.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.16.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "tiff"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-S =3D "${WORKDIR}/lcms2-${PV}"
+S =3D "${UNPACKDIR}/lcms2-${PV}"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb b/meta-oe/recip=
es-support/lgi/lua-lgi_0.9.2.bb
index 8b436668dc..344bf119b9 100644
--- a/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
+++ b/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
@@ -13,7 +13,6 @@ DEPENDS =3D " \
 	gobject-introspection-native \
 "
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "d7666f77e7ee33907c84f5efdef32aef2e1cc196"
 SRCPV =3D "${PV}+${SRCREV}"
=20
diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/me=
ta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index dfe63ddbcd..89b2dff0ba 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://git.0pointer.net/libatasmart.git;proto=
col=3Dhttp;branch=3Dmaster \
            file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patc=
h \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools lib_package pkgconfig
=20
diff --git a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb b/meta-oe/r=
ecipes-support/libb64/libb64_2.0.0.1.bb
index e0683b177b..4a1052e75b 100644
--- a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
+++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/libb64/libb64;protocol=3D=
https;branch=3Dmaster \
            file://0001-examples-Use-proper-function-prototype-for-main.p=
atch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 CFLAGS +=3D "-fPIC"
=20
diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb b/me=
ta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
index 214c2b2844..ef2a6c76fb 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
@@ -6,7 +6,6 @@ SECTION =3D "devel/lib"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc07cb499d259452f324bb90c3067d=
85c"
=20
-S =3D "${WORKDIR}/git"
=20
 SRCREV =3D "9da72b2732508b0ba0ceed27f5e50bc276ef31f2"
 SRC_URI =3D "git://github.com/storaged-project/libbytesize;branch=3Dmain=
;protocol=3Dhttps"
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-=
oe/recipes-support/libcereal/libcereal_1.3.2.bb
index c2ab0d61b8..7d4a352a31 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -26,7 +26,6 @@ SRC_URI =3D "git://github.com/USCiLab/cereal.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://run-ptest \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig ptest
=20
diff --git a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb b/meta-=
oe/recipes-support/libconfuse/libconfuse_3.3.bb
index 0e2f1f27b3..20966a535c 100644
--- a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
+++ b/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
@@ -10,6 +10,6 @@ SRC_URI +=3D "file://CVE-2022-40320.patch"
=20
 inherit autotools-brokensep pkgconfig gettext
=20
-S =3D "${WORKDIR}/confuse-${PV}"
+S =3D "${UNPACKDIR}/confuse-${PV}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/met=
a-oe/recipes-support/libcppkafka/libcppkafka_git.bb
index cf2d933169..d825f8fdee 100644
--- a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
@@ -21,7 +21,6 @@ inherit cmake
=20
 EXTRA_OECMAKE =3D "-DCPPKAFKA_BUILD_SHARED=3DON"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install:append(){
     chrpath -d ${D}${libdir}/libcppkafka.so.${BASEPV}
diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb=
 b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
index 32db913eff..939e7db24e 100644
--- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/cyrozap/${BPN}.git;branch=
=3Dmaster;protocol=3Dhttps \
     file://0001-Fix-gcc-15-incompatible-pointer-types-error.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe=
/recipes-support/libeigen/libeigen_3.4.0.bb
index 998a396af1..f5f874941a 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -19,7 +19,6 @@ SRC_URI =3D "git://gitlab.com/libeigen/eigen.git;protoc=
ol=3Dhttp;branch=3D3.4 \
=20
 SRCREV =3D "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/rec=
ipes-support/libfann/libfann_git.bb
index 40f91ac43d..2f68ea95a8 100644
--- a/meta-oe/recipes-support/libfann/libfann_git.bb
+++ b/meta-oe/recipes-support/libfann/libfann_git.bb
@@ -14,6 +14,5 @@ SRC_URI =3D "git://github.com/libfann/fann.git;branch=3D=
master;protocol=3Dhttps \
=20
 PV =3D "2.2.0+git"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')}"
diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/rec=
ipes-support/libftdi/libftdi_1.5.bb
index 1679f212b3..8c30eca0e7 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] =3D "7c7091e9c86196148bd41177b4590dc=
cb1510bfe6cea5bf7407ff19448
=20
 UPSTREAM_CHECK_URI =3D "http://www.intra2net.com/en/developer/libftdi/do=
wnload.php"
=20
-S =3D "${WORKDIR}/${BPN}1-${PV}"
+S =3D "${UNPACKDIR}/${BPN}1-${PV}"
=20
 inherit cmake binconfig pkgconfig python3native
=20
diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb b/meta-oe/r=
ecipes-support/libgusb/libgusb_0.4.9.bb
index 7f6bec3ea7..9007574fc6 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
@@ -16,6 +16,5 @@ GIDOCGEN_MESON_OPTION =3D 'docs'
=20
 SRC_URI =3D "git://github.com/hughsie/libgusb.git;branch=3Dmain;protocol=
=3Dhttps"
 SRCREV =3D "ed31c8134d80d006bd45450e84180be2a7c0742e"
-S =3D "${WORKDIR}/git"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb b/meta-oe/r=
ecipes-support/libharu/libharu_2.4.5.bb
index db8acd4532..0ad4bd92c0 100644
--- a/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
+++ b/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
@@ -11,6 +11,5 @@ DEPENDS +=3D "libpng zlib"
 SRC_URI =3D "git://github.com/libharu/libharu.git;branch=3Dmaster;protoc=
ol=3Dhttps"
 SRCREV =3D "8fe5a738541a04642885fb7a75b2b5b9c5b416fa"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
diff --git a/meta-oe/recipes-support/libiio/libiio_0.26.bb b/meta-oe/reci=
pes-support/libiio/libiio_0.26.bb
index e8e6d5f683..ecd9223600 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.26.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.26.bb
@@ -9,7 +9,6 @@ SRCREV =3D "a0eca0d2bf10326506fb762f0eec14255b27bef5"
 SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhtt=
ps;branch=3Dlibiio-v0"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 SETUPTOOLS_SETUP_PATH ?=3D "${B}/bindings/python/"
=20
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb b=
/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
index 38ffd032ab..f4e26a65fc 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/js-cookie/js-cookie.git;pro=
tocol=3Dhttps;branch=3Dmain"
=20
 SRCREV =3D "ab3f67fc4fad88cdf07b258c08e4164e06bf7506"
=20
-S =3D "${WORKDIR}/git"
=20
 JQUERYCOOKIEDIR =3D "${datadir}/javascript/jquery-cookie"
 JQUERYCOOKIEDOCDIR =3D "${docdir}/libjs-jquery-cookie"
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.b=
b b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
index b6147ffeb2..cbf5700a5b 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
@@ -3,7 +3,6 @@ SECTION =3D "console/network"
 HOMEPAGE =3D "https://github.com/globalizejs/globalize"
 LICENSE =3D "MIT"
=20
-S =3D "${WORKDIR}/git"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4db68fb4d1d9986d736b35039f2ad=
9ea"
=20
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b=
/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
index 63dfc6fa78..88fbc109ee 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/fronteed/icheck.git;protoco=
l=3Dhttps;branch=3D${PV}"
=20
 SRCREV =3D "c8c1af84e4b90b4aea31466aad09bf877619e943"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
         install -d ${D}${datadir}/javascript/jquery-icheck/
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb b/meta-o=
e/recipes-support/libjs/libjs-jquery_3.3.1.bb
index 68b5086701..4847d92b4a 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
@@ -13,8 +13,7 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
 JQUERYDIR =3D "${datadir}/javascript/jquery"
 JQUERYDOCDIR =3D "${docdir}/libjs-jquery"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_install() {
     install -d -m 0755 ${D}${JQUERYDIR}
diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb b/meta=
-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
index 3889b17a3c..ffd26d263c 100644
--- a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
+++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://MIT-LICENSE.txt;md5=3De43aa4=
37a6a1ba421653bd5034333bf9"
 SRC_URI =3D "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/=
sizzle_1.10.18.orig.tar.gz"
 SRC_URI[sha256sum] =3D "8e04ab84bb74b2e338dffc63cd2e52b007f1d8af01b3d25d=
a4d2e07f2b5890f8"
=20
-S =3D "${WORKDIR}/sizzle-${PV}"
+S =3D "${UNPACKDIR}/sizzle-${PV}"
=20
 SIZZLEDIR =3D "${S}/dist"
=20
diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/met=
a-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
index 4d4a5ff109..a2de42d946 100644
--- a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
+++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
@@ -16,7 +16,6 @@ SRC_URI +=3D "git://github.com/LadislavSopko/mimetic/;b=
ranch=3Dmaster;protocol=3Dhttps
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 CXXFLAGS +=3D "-Wno-narrowing -std=3Dc++14"
=20
diff --git a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb b/meta-oe/r=
ecipes-support/libmxml/libmxml_4.0.4.bb
index a271b697cd..d692774f08 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
@@ -6,7 +6,6 @@ BUGTRACKER =3D "https://github.com/michaelrsweet/mxml/iss=
ues"
=20
 SRC_URI =3D "git://github.com/michaelrsweet/mxml.git;branch=3Dmaster;pro=
tocol=3Dhttps"
 SRCREV =3D "0d5afc4278d7a336d554602b951c2979c3f8f296"
-S =3D "${WORKDIR}/git"
=20
 # Package does not support out of tree builds.
 inherit autotools-brokensep
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb b/meta-oe/re=
cipes-support/libnvme/libnvme_1.12.bb
index 1054f83487..95d18a1ed0 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
@@ -16,7 +16,6 @@ SRCREV =3D "5ec1f5284ecb0eda481f3d2d61236fbc5b46164f"
 SRC_URI =3D "git://github.com/linux-nvme/libnvme;protocol=3Dhttps;branch=
=3Dmaster \
            file://0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb b/meta=
-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
index edcebf522a..2462786aae 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
@@ -13,7 +13,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "b505ef5161d2552102a743acd4ad83298d3d8f99"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig gtk-doc gobject-introspection vala
=20
diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb =
b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
index 11de5e404b..ee75c39eee 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://gitlab.com/libosinfo/osinfo-db-tools=
.git;branch=3Dmain;protocol=3Dh
            "
 SRCREV =3D "e5564be303bfac49cc3490bd0fada342cd65566f"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb b/me=
ta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
index 5c5894da01..33e17234ce 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://gitlab.com/libosinfo/osinfo-db.git;b=
ranch=3Dmain;protocol=3Dhttps"
=20
 SRCREV =3D "62f8adceb8ee88e643a134f2cfaf04fc11b9fc51"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit allarch autotools-brokensep
=20
diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb b/meta-oe/re=
cipes-support/libp11/libp11_0.4.13.bb
index 74c70df180..1731d350ae 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
@@ -15,7 +15,6 @@ SRCREV =3D "6d669183c7b241ce47ecce28744837ad92814f5c"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "libp11-(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/re=
cipes-support/libraw/libraw_0.21.2.bb
index 6b1355fa37..01425c6db0 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D1501ae0aa3c8=
544e63f08d6f7bf88a6f"
=20
 SRC_URI =3D "git://github.com/LibRaw/LibRaw.git;branch=3D0.21-stable;pro=
tocol=3Dhttps"
 SRCREV =3D "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb b/met=
a-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
index 6148e7cb08..968094daff 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
@@ -16,7 +16,6 @@ DEPENDS =3D "zlib openssl zstd"
=20
 inherit cmake
=20
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${datadir}"
=20
diff --git a/meta-oe/recipes-support/librsync/librsync_2.3.4.bb b/meta-oe=
/recipes-support/librsync/librsync_2.3.4.bb
index 3cad665389..c8dfafa2aa 100644
--- a/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
+++ b/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c=
1cb29a1e3fd737b499"
=20
 SRC_URI =3D "git://github.com/librsync/librsync.git;branch=3Dmaster;prot=
ocol=3Dhttps"
 SRCREV =3D "e364852674780e43d578e4239128ff7014190ed3"
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "popt"
=20
diff --git a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.=
8.bb b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
index 7994907e13..245d501b8a 100644
--- a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
+++ b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6=
275cb4c2e75c517952ac7c"
 DEPENDS =3D "libsimplelog"
 SRC_URI =3D "git://git@github.com/thuanalg/libserialmodule.git;branch=3D=
main;protocol=3Dhttps;tag=3Dv${PV}"
 SRCREV =3D "f89f98ff0c9d0aaee2624d40addb0687a74c5d81"
-S =3D "${WORKDIR}/git"
 inherit cmake
 EXTRA_OECMAKE =3D "-DUNIX_LINUX=3D1 -DMETA_OPENEMBEDDED=3D1"
=20
diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb b=
/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
index b4a721b302..31dce12155 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.gi=
t;branch=3Dmain;protocol=3Dht
=20
 SRCREV =3D "093d80b4006042b75a433a5e63760ae9bebad142"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb b/meta-oe/rec=
ipes-support/libsoc/libsoc_0.8.2.bb
index 5969220a41..958f3cf5a1 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
@@ -12,7 +12,6 @@ inherit autotools pkgconfig python3-dir
 SRCREV =3D "fd1ad6e7823fa76d8db0d3c5884faffa8ffddafb"
 SRC_URI =3D "git://github.com/jackmitch/libsoc.git;branch=3Dmaster;proto=
col=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 BOARD ??=3D "devboard"
=20
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta=
-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 52e732b78d..cbc886a2cb 100644
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -44,7 +44,7 @@ SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc=
6cfb75ef7c5a034153df1413fa1
=20
 CVE_PRODUCT =3D "libsoup"
=20
-S =3D "${WORKDIR}/libsoup-${PV}"
+S =3D "${UNPACKDIR}/libsoup-${PV}"
=20
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introsp=
ection gtk-doc
=20
diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb b/meta-oe/r=
ecipes-support/libspdm/libspdm_3.7.0.bb
index e5915aa795..c6bbd1716b 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3D=
main;protocol=3Dhttps \
            file://0001-Backport-API-introduced-in-openssl-3.5.0.patch"
 SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb b/meta-oe/re=
cipes-support/libssh/libssh_0.11.1.bb
index 5f39c2d79c..bb2b0dc466 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.1.bb
@@ -15,7 +15,6 @@ SRC_URI:append:toolchain-clang =3D " file://0001-Compil=
erChecks.cmake-drop-Wunused
=20
 SRCREV =3D "854795c654eda518ed6de6c1ebb4e2107fcb2e73"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb b/met=
a-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb
index be2935a385..d462d3018f 100644
--- a/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb
+++ b/meta-oe/recipes-support/libstemmer/libstemmer_2.2.0.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/snowballstem/snowball.git;b=
ranch=3Dmaster;protocol=3Dhtt
            file://0001-Build-so-lib.patch \
            "
 SRCREV =3D "48a67a2831005f49c48ec29a5837640e23e54e6b"
-S =3D "${WORKDIR}/git"
=20
 LIBVER =3D "0.0.0"
=20
diff --git a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb b/meta-oe/re=
cipes-support/libtar/libtar_1.2.20.bb
index 9be5601967..a17509d2e5 100644
--- a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
+++ b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_$=
{PV}.orig.tar.gz \
            file://CVE-2013-4420.patch \
            "
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 SRC_URI[sha256sum] =3D "50f24c857a7ef1cb092e6508758b86d06f1188508f897f3e=
6b40c573e8879109"
=20
diff --git a/meta-oe/recipes-support/libteam/libteam_1.32.bb b/meta-oe/re=
cipes-support/libteam/libteam_1.32.bb
index 508cbb13bb..4686f4be5c 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.32.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.32.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/jpirko/libteam;branch=3Dm=
aster;protocol=3Dhttps \
            "
 SRCREV =3D "8b843e93cee1dab61fb79b01791201cdad45e1d1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig ptest
=20
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/met=
a-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index c99930f9e2..b91a455aff 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'=
${PV}'.replace('.', '_')}.t
 "
 SRC_URI[sha256sum] =3D "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb71=
9f9ba6d062645593"
=20
-S =3D "${WORKDIR}/tinyxml"
+S =3D "${UNPACKDIR}/tinyxml"
=20
 EXTRA_CXXFLAGS =3D "-I. -fPIC"
=20
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/=
meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
index e0b07deca3..89e6eca99b 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
@@ -9,7 +9,6 @@ SRCREV =3D "9148bdf719e997d1f474be6bcc7943881046dba1"
 SRC_URI =3D "git://github.com/leethomason/tinyxml2.git;branch=3Dmaster;p=
rotocol=3Dhttps \
            file://run-ptest"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson ptest
=20
diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb b/met=
a-oe/recipes-support/libtommath/libtommath_1.3.0.bb
index 4d6c06240d..28c474e1dd 100644
--- a/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
+++ b/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/libtom/libtommath.git;pro=
tocol=3Dhttps;branch=3Dmaster"
=20
 SRCREV =3D "95d80fd8229d05dd6cb4ec88bc8d4f5377ff00ef"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "'PREFIX=3D${prefix}' 'DESTDIR=3D${D}' 'LIBPATH=3D${lib=
dir}' 'CFLAGS=3D${CFLAGS}'"
=20
diff --git a/meta-oe/recipes-support/liburing/liburing_2.9.bb b/meta-oe/r=
ecipes-support/liburing/liburing_2.9.bb
index e17d829c3d..a645a8e4c4 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.9.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.9.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/axboe/liburing.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0001-test-Including-missing-string.h-for-memcpy.patch"
 SRCREV =3D "08468cc3830185c75f9e7edefd88aa01e5c2f8ab"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS:append:libc-musl =3D " libucontext"
 XCFLAGS =3D "-pthread"
diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb b/meta=
-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
index 57f1f54387..960f547f94 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
+++ b/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
@@ -28,7 +28,6 @@ SRC_URI =3D " \
     file://run-ptest \
 "
 SRCREV =3D "c497eff1ae8c4cfd4fdff370f04c78fa0584f4f3"
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/libusb/libusb-compat-0.1/rele=
ases"
=20
diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/rec=
ipes-support/libusbg/libusbg_git.bb
index 716d9c4ce4..84f97aab2c 100644
--- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
+++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/libusbg/libusbg.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://0001-Fix-out-of-tree-builds.patch \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 ALTERNATIVE:${PN} =3D "gadget-acm-ecm show-gadgets"
 ALTERNATIVE_LINK_NAME[gadget-acm-ecm] =3D "${bindir}/gadget-acm-ecm"
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb b/meta-o=
e/recipes-support/libusbgx/libusbgx-config.bb
index c79dd092cd..e558274d41 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT=
;md5=3D3da9cfbcb788c80a0384
=20
 SRC_URI =3D "file://usbgx.default"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_configure[noexec] =3D "1"
 do_compile[noexec] =3D "1"
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/r=
ecipes-support/libusbgx/libusbgx_git.bb
index 8d49bf55ba..7b12b911d8 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -18,7 +18,6 @@ SRC_URI =3D " \
     file://usbgx.service \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "examples gadget-schemes libconfig"
 PACKAGECONFIG[libconfig] =3D "--with-libconfig=3Dyes,--without-libconfig=
,libconfig"
diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.b=
b b/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
index 0d2cd135c6..cc28860b04 100644
--- a/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
+++ b/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "git://git.altlinux.org/people/ldv/packages=
/libutempter.git;branch=3Dmas
            file://0002-Proper-macro-path-generation.patch \
            "
=20
-S =3D "${WORKDIR}/git/${BPN}"
+S =3D "${UNPACKDIR}/${BP}/${BPN}"
=20
 CFLAGS +=3D "-DLIBEXECDIR=3D${libexecdir}"
=20
diff --git a/meta-oe/recipes-support/links/links-x11_2.26.bb b/meta-oe/re=
cipes-support/links/links-x11_2.26.bb
index 713919bca1..c1601ab7d9 100644
--- a/meta-oe/recipes-support/links/links-x11_2.26.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.26.bb
@@ -13,7 +13,7 @@ SRC_URI +=3D " file://links2.desktop \
 SRC_URI[sha256sum] =3D "f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f11=
1dfed049c004c9cb"
 SRC_URI[icon.sha256sum] =3D "eddcd8b8c8698aa621d1a453943892d77b72ed492e0=
d14e0dbac5c6a57e52f47"
=20
-S =3D "${WORKDIR}/links-${PV}"
+S =3D "${UNPACKDIR}/links-${PV}"
=20
 EXTRA_OECONF =3D "--enable-graphics \
                 --with-ssl=3D${STAGING_LIBDIR}/.. --with-libjpeg \
diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb b/meta-oe/r=
ecipes-support/log4cpp/log4cpp_1.1.4.bb
index 929b1d186b..d51e51387b 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "http://downloads.sourceforge.net/${BPN}/${BP=
}.tar.gz \
           "
 SRC_URI[sha256sum] =3D "696113659e426540625274a8b251052cc04306d8ee5c42a0=
c7639f39ca90c9d6"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
index 7a87baf5c3..0ff17aed5c 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -19,7 +19,6 @@ SRC_URI =3D "git://sourceware.org/git/lvm2.git;branch=3D=
main \
            "
=20
 SRCREV =3D "8817523c5682a7fd83770d3f58a99c436f7e73f7"
-S =3D "${WORKDIR}/git"
 PV =3D "2.03.32"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\_\d+)+)"
diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/r=
ecipes-support/mcelog/mce-inject_git.bb
index 6c1255772d..c8ffb65fa1 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -15,7 +15,6 @@ DEPENDS =3D "bison-native"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D30;md5=3D94c18755082a2da=
9c9cf97cba3ad47d6"
=20
-S =3D "${WORKDIR}/git"
=20
 COMPATIBLE_HOST =3D '(x86_64.*|i.86.*)-linux'
=20
diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/rec=
ipes-support/mcelog/mce-test_git.bb
index c1661b5ed4..3b96210633 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -22,7 +22,6 @@ RDEPENDS:${PN} =3D "mcelog mce-inject dialog bash"
=20
 COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE +=3D "CFLAGS=3D'${CFLAGS}'"
=20
diff --git a/meta-oe/recipes-support/mcelog/mcelog_204.bb b/meta-oe/recip=
es-support/mcelog/mcelog_204.bb
index b0d238361f..c3d082aa67 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_204.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_204.bb
@@ -15,7 +15,6 @@ SRCREV =3D "ad244c6b60fcbd08a5d73497bfb3487983801598"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit ptest
=20
diff --git a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb b/meta-oe/recipes=
-support/md4c/md4c_0.5.2.bb
index 6c409666fc..59f2e430aa 100644
--- a/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
+++ b/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
@@ -6,7 +6,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D383f39920f391605af6e8e46e6=
0e2378"
=20
=20
-S =3D "${WORKDIR}/git"
=20
 SRC_URI =3D " \
         git://github.com/mity/md4c.git;protocol=3Dhttps;branch=3Dmaster =
\
diff --git a/meta-oe/recipes-support/mg/mg_20230501.bb b/meta-oe/recipes-=
support/mg/mg_20230501.bb
index ee00003977..04811f1bdd 100644
--- a/meta-oe/recipes-support/mg/mg_20230501.bb
+++ b/meta-oe/recipes-support/mg/mg_20230501.bb
@@ -14,7 +14,6 @@ SRC_URI:append:libc-musl =3D "\
            file://0001-Undefine-REGEX-for-musl-based-systems.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 # CFLAGS isn't in EXTRA_OEMAKE, as the makefile picks it up via ?=3D
 EXTRA_OEMAKE =3D "\
diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.62.bb b/=
meta-oe/recipes-support/mime-support/mime-support_3.62.bb
index 46def2a23c..1c0aec13e3 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
@@ -12,7 +12,7 @@ RRECOMMENDS:${PN} =3D "file"
=20
 SRC_URI =3D "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}.tar=
.gz"
 SRC_URI[sha256sum] =3D "54e0a03e0cd63c7c9fe68a18ead0a2143fd3c327604215f9=
89d85484d0409f4a"
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 inherit update-alternatives
=20
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11=
.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
index 3443175d21..07bc84ce8b 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
@@ -53,7 +53,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ec28527f3d5=
44b51ceb0e1907d0bf3f"
=20
 SRCREV =3D "cb8de98b2cc3b62fd1a578ba479c0820778e9c02"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit systemd pkgconfig
=20
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes=
-support/ne10/ne10_1.2.1.bb
index 39ff7ab969..b4db0c0f64 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/projectNe10/Ne10.git;bran=
ch=3Dmaster;protocol=3Dhttps \
            "
 SRCREV =3D "18c4c982a595dad069cd8df4932aefb1d257591f"
=20
-S =3D "${WORKDIR}/git"
 PV .=3D "+git"
=20
 inherit cmake
diff --git a/meta-oe/recipes-support/nmon/nmon_16m.bb b/meta-oe/recipes-s=
upport/nmon/nmon_16m.bb
index 495afd164f..6f7d35eaf2 100644
--- a/meta-oe/recipes-support/nmon/nmon_16m.bb
+++ b/meta-oe/recipes-support/nmon/nmon_16m.bb
@@ -21,8 +21,7 @@ CFLAGS +=3D "-D JFS -D GETUSER -Wall -D LARGEMEM"
 LDFLAGS +=3D "-ltinfo -lncursesw -lm"
 ASNEEDED:pn-nmon =3D ""
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_compile() {
     ${CC} ${CFLAGS} ${LDFLAGS} lmon${PV}.c -o nmon
diff --git a/meta-oe/recipes-support/nspr/nspr_4.36.bb b/meta-oe/recipes-=
support/nspr/nspr_4.36.bb
index a717520666..c129362539 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.36.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.36.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] =3D "55dec317f1401cd2e5dba844d340b93=
0ab7547f818179a4002bce62e6f
=20
 CVE_PRODUCT =3D "netscape_portable_runtime"
=20
-S =3D "${WORKDIR}/nspr-${PV}/nspr"
+S =3D "${UNPACKDIR}/nspr-${PV}/nspr"
=20
 RDEPENDS:${PN}-dev +=3D "perl"
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb b/meta=
-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
index 6cacd3722c..7390d83bcc 100644
--- a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
+++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/Oblomov/clinfo.git;protoc=
ol=3Dhttps;branch=3Dmaster"
=20
 SRCREV =3D "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "opencl-headers virtual/opencl-icd"
=20
diff --git a/meta-oe/recipes-support/opencv/ade_0.1.2.bb b/meta-oe/recipe=
s-support/opencv/ade_0.1.2.bb
index 93b14ad4f3..b54c28d624 100644
--- a/meta-oe/recipes-support/opencv/ade_0.1.2.bb
+++ b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57"
=20
 inherit cmake
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE +=3D " -DCMAKE_BUILD_TYPE=3DRelease"
=20
diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.11.0.bb
index 3f90500784..dcea31daa9 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -39,7 +39,6 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3D=
opencv;branch=3D4.x;protocol=3Dht
            "
 SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.=
patch;patchdir=3Dcontrib"
=20
-S =3D "${WORKDIR}/git"
=20
 # OpenCV wants to download more files during configure.  We download the=
se in
 # do_fetch and construct a source cache in the format it expects
diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb b/meta-oe/re=
cipes-support/opensc/opensc_0.26.1.bb
index 9c9dfd5f45..78258c965a 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.26.1.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3D0.=
26.1;protocol=3Dhttps"
=20
 CVE_STATUS[CVE-2024-8443] =3D "fixed-version: this is fixed since 0.26.0=
"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig bash-completion
=20
diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/=
recipes-support/opensync/wbxml2_0.10.8.bb
index 2d87f13564..02815ec7ba 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/libwbxml/libwbxml-${=
PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "a057daa098f12838eb4e635bb28413027f1b73819872c3fb=
f64e3207790a3f7d"
=20
-S =3D "${WORKDIR}/libwbxml-${PV}"
+S =3D "${UNPACKDIR}/libwbxml-${PV}"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20=
.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
index e022b407a0..eb108c177c 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
@@ -10,7 +10,6 @@ DEPENDS =3D "nlohmann-json"
 SRC_URI =3D "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;pro=
tocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}"
 SRCREV =3D "6175aa0b213eea053247e43b4f35b8d201fa356e"
=20
-S =3D "${WORKDIR}/git"
 inherit cmake pkgconfig lib_package
=20
 LDFLAGS:append:riscv32 =3D " -latomic"
diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb b/meta-oe/reci=
pes-support/p910nd/p910nd_0.97.bb
index c6a3079ea2..0b5740c161 100644
--- a/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.97.bb
@@ -10,7 +10,6 @@ SRCREV =3D "57ebc07ad8723ea4106090536c58c7f7160743e2"
 SRC_URI =3D "git://github.com/kenyapcomau/p910nd;protocol=3Dhttps;branch=
=3Dmaster \
            file://fix-var-lock.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit update-rc.d
=20
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-suppor=
t/pcp/pcp.inc
index 4ab4f5502f..c54c054cf8 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/performancecopilot/pcp;br=
anch=3Dstable;protocol=3Dhttps
=20
 SRCREV =3D "d8d97b79ee47d9dfb076a3242564ed3cae04eba9"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3-base pkgconfig autotools-brokensep
=20
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb b/meta-=
oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
index d5a560a6a0..169630d319 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.3.bb
@@ -21,7 +21,7 @@ EXTRA_OECONF =3D " \
     --enable-usbdropdir=3D${libdir}/pcsc/drivers \
 "
=20
-S =3D "${WORKDIR}/pcsc-lite-${PV}"
+S =3D "${UNPACKDIR}/pcsc-lite-${PV}"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd polk=
it', d)} udev"
 PACKAGECONFIG:class-native ??=3D ""
diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb b/met=
a-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
index 1dfba7c716..14ffab6128 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
@@ -9,7 +9,6 @@ SRCREV =3D "778da3d86a59f5166443118c158e11ba4da9a5f1"
=20
 inherit autotools pkgconfig
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "pcsc-lite autoconf-archive-native"
=20
diff --git a/meta-oe/recipes-support/picocom/picocom_2024.bb b/meta-oe/re=
cipes-support/picocom/picocom_2024.bb
index c0c3e25de9..37cf2d0a4c 100644
--- a/meta-oe/recipes-support/picocom/picocom_2024.bb
+++ b/meta-oe/recipes-support/picocom/picocom_2024.bb
@@ -9,7 +9,6 @@ SRCREV =3D "7b6acbd421a2d4ca99376b7b427828dc1bcba4d8"
 SRC_URI =3D "git://gitlab.com/wsakernel/picocom;branch=3Dmaster;protocol=
=3Dhttps \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "'CC=3D${CC}' 'LD=3D${CC}' 'VERSION=3D${PV}' \
 		'CFLAGS=3D${CFLAGS}' 'LDFLAGS=3D${LDFLAGS}' "
diff --git a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb b/me=
ta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
index 9337ae5966..c547b0532e 100644
--- a/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
+++ b/meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
@@ -13,7 +13,6 @@ SRCREV =3D "fbbd9c591100aa00a0487738ec7b6acd3d924b3f"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_compile() {
     oe_runmake CC=3D"${CC}" CXX=3D"${CXX}" EXTRA_INCLUDES=3D"${TARGET_CF=
LAGS}" AR=3D"${AR}";
diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recip=
es-support/pidgin/icyque_git.bb
index b2f9944c16..e8b4a3c2c3 100644
--- a/meta-oe/recipes-support/pidgin/icyque_git.bb
+++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
@@ -15,7 +15,6 @@ SRCREV =3D "513fc162d5d1a201c2b044e2b42941436d1069d5"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_compile() {
     oe_runmake;
diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb b/meta=
-oe/recipes-support/pidgin/purple-skypeweb_git.bb
index 1981f1ee9c..421b1725ba 100644
--- a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
+++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
@@ -10,7 +10,6 @@ inherit pkgconfig
 SRC_URI =3D "git://github.com/EionRobb/skype4pidgin;branch=3Dmaster;prot=
ocol=3Dhttps"
 SRCREV =3D "b226d1c457d73900ae89b8a7469247fbe33677a6"
=20
-S =3D "${WORKDIR}/git"
 PV =3D "1.7+git"
=20
 do_compile() {
diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.=
bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
index 18a156286d..a403289cfc 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.0.bb
@@ -19,7 +19,6 @@ SRCREV =3D "8f6b94409d4872265076df310492da1e5f6abdf7"
=20
 SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipe=
s-support/poco/poco_1.13.3.bb
index 662caa27d7..e0f6c4169e 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -18,7 +18,6 @@ SRCREV =3D "7f848d25aa0461d3beeff1189dc61b48ffe8e2f4"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "poco-(?P<pver>\d+(\.\d+)+)"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/=
meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
index 2bf4d0a449..4451e96307 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -8,7 +8,6 @@ PV .=3D "+git"
 SRC_URI =3D "git://github.com/PortAudio/portaudio.git;branch=3Dmaster;pr=
otocol=3Dhttps"
 SRCREV =3D "929e2e8f7af281c5eb4fa07758930d542ec43d97"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb b/meta-=
oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
index 34b4bbf75a..65caa05a13 100644
--- a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
+++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/ago/pps-tools.git;branch=3D=
master;protocol=3Dhttps \
            file://0001-Use-lld-in-printf-for-64-bit-time_t.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} =3D "bash"
=20
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb b/meta-oe/re=
cipes-support/pxaregs/pxaregs_1.14.bb
index bdbe6e73ba..58d3d478d7 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
+++ b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
@@ -9,8 +9,7 @@ SRC_URI =3D "file://pxaregs.c \
            file://serial.patch \
            file://usb.patch "
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_compile() {
     ${CC} pxaregs.c -o pxaregs ${CFLAGS} ${LDFLAGS}
diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/reci=
pes-support/re2/re2_2024.03.01.bb
index 76d6f0c7a9..55a834fa42 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/google/re2.git;branch=3Dm=
ain;protocol=3Dhttps \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest'=
, '', d)} \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "abseil-cpp ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtes=
t googlebenchmark', '', d)}"
=20
diff --git a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb b/met=
a-oe/recipes-support/reboot-mode/reboot-mode_git.bb
index 5e0c6cd21c..4172de857c 100644
--- a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
+++ b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84dcc94da3adb5=
2b53ae4fa38fe49e5d"
 SRC_URI =3D "git://gitlab.com/postmarketOS/reboot-mode.git;protocol=3Dht=
tp;branch=3Dmaster"
 SRCREV =3D "84831b20512abd9033414ca5f5a023f333525335"
=20
-S =3D "${WORKDIR}/git"
=20
 # Upstream repo has not made releases/tags after 1.0.0
 UPSTREAM_CHECK_COMMITS =3D "1"
diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb b/meta-oe/=
recipes-support/remmina/remmina_1.4.36.bb
index 9d0b676386..aefd871354 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
@@ -27,7 +27,6 @@ LDFLAGS:append:libc-musl =3D " -lexecinfo"
=20
 SRCREV =3D "17cf7956b9f925fa788083a2db8d5e669f86bfaf"
 SRC_URI =3D "git://gitlab.com/Remmina/Remmina;protocol=3Dhttps;branch=3D=
master"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake features_check mime mime-xdg gtk-icon-cache pkgconfig
 REQUIRED_DISTRO_FEATURES =3D "x11"
diff --git a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb b/meta-oe/re=
cipes-support/reptyr/reptyr_0.10.0.bb
index 6889758224..5f4ffcd657 100644
--- a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
+++ b/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D25a0555028c718=
37623fa6dfa4cc45c0"
 SRC_URI =3D "git://github.com/nelhage/reptyr.git;protocol=3Dhttps;branch=
=3Dmaster"
 SRCREV =3D "1238097fc2cd15db058d2185cc4985daa87bcd41"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit bash-completion github-releases manpages pkgconfig
=20
diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe=
/recipes-support/rsnapshot/rsnapshot_git.bb
index 3cbd04bd5c..8c4183bae3 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -29,7 +29,6 @@ SRC_URI =3D "git://github.com/DrHyde/${BPN};branch=3Dma=
ster;protocol=3Dhttps \
            file://configure-fix-cmd_rsync.patch \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools perlnative
=20
diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb b/met=
a-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
index d65f5da859..711d4696fd 100644
--- a/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74274e8a218423=
e49eefdea80bc55038"
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BP=
N}.git;protocol=3Dhttps;branch=3Dmaster"
 SRCREV =3D "61839777afedcc7bdb68ea4628c5ce5ca72c2ac8"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
=20
diff --git a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb b/meta-oe/recipe=
s-support/rtkit/rtkit_0.13.bb
index 4f06e55e8e..b68820dfd6 100644
--- a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
+++ b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da8e768468b658b=
3ed44971b53d4a6716"
 SRC_URI =3D "git://github.com/heftig/rtkit.git;protocol=3Dhttps;branch=3D=
master"
=20
 SRCREV =3D "b9169402fe5e82d20efb754509eb0b191f214599"
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig features_check useradd
=20
diff --git a/meta-oe/recipes-support/satyr/satyr_0.43.bb b/meta-oe/recipe=
s-support/satyr/satyr_0.43.bb
index 9e6d701c7f..1976a929bd 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.43.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.43.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/abrt/satyr.git;branch=3Dm=
aster;protocol=3Dhttps \
            file://0002-fix-compile-failure-against-musl-C-library.patch =
\
            "
 SRCREV =3D "5891618d6a95afc4cde6757374485adf9bf0e9a5"
-S =3D "${WORKDIR}/git"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
diff --git a/meta-oe/recipes-support/sdmon/sdmon_git.bb b/meta-oe/recipes=
-support/sdmon/sdmon_git.bb
index 81c8033c15..8007ead6c6 100644
--- a/meta-oe/recipes-support/sdmon/sdmon_git.bb
+++ b/meta-oe/recipes-support/sdmon/sdmon_git.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/Ognian/sdmon;protocol=3Dhtt=
ps;branch=3Dmaster"
 PV =3D "0.9.0"
 SRCREV =3D "4dff9b690e8d4454fada6abfbb6b32fcb794968c"
=20
-S =3D "${WORKDIR}/git"
=20
 do_compile() {
 	oe_runmake -C ${S}/src CC=3D"${CC}" CFLAGS=3D"${CFLAGS} -D_REENTRANT -D=
VERSION=3D\"\\\"${PV}\\\"\"" LDFLAGS=3D"${LDFLAGS}"
diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b=
/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index 82994331ee..1d7e29ecc5 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -6,7 +6,7 @@ SRCREV =3D "00dbec2636ae0385ad028587e20e446272ff97ec"
 PV =3D "1.1+git"
=20
 SRC_URI =3D "git://github.com/freesmartphone/cornucopia.git;protocol=3Dh=
ttps;branch=3Dmaster"
-S =3D "${WORKDIR}/git/tools/serial_forward"
+S =3D "${UNPACKDIR}/${BP}/tools/serial_forward"
=20
 inherit autotools native
=20
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b=
/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 541ae84a93..05e965fc63 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -9,6 +9,6 @@ SRC_URI =3D "git://github.com/freesmartphone/cornucopia.g=
it;branch=3Dmaster;protocol
            file://0001-serial_forward-Disable-default-static-linking.pat=
ch;striplevel=3D3 \
            file://0001-correct-the-typo-in-include-file-name-string.h.pa=
tch;striplevel=3D3 \
           "
-S =3D "${WORKDIR}/git/tools/serial_forward"
+S =3D "${UNPACKDIR}/${BP}/tools/serial_forward"
=20
 inherit autotools
diff --git a/meta-oe/recipes-support/serial/serial_1.2.1.bb b/meta-oe/rec=
ipes-support/serial/serial_1.2.1.bb
index c3f13d1af5..42151da532 100644
--- a/meta-oe/recipes-support/serial/serial_1.2.1.bb
+++ b/meta-oe/recipes-support/serial/serial_1.2.1.bb
@@ -11,7 +11,6 @@ SRC_URI =3D " \
 SRCREV =3D "10ac4e1c25c2cda1dc0a32a8e12b87fd89f3bb4f"
 SRC_URI[sha256sum] =3D "c8cd235dda2ef7d977ba06dfcb35c35e42f45cfd9149ba3a=
d257756123d8ff96"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb b/meta-o=
e/recipes-support/sg3-utils/sg3-utils_1.48.bb
index 6c3d813983..4af20fe72a 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
@@ -17,6 +17,6 @@ SRC_URI[sha256sum] =3D "d62b6c3cf20390fa735704439008416=
6d25f1d932a1135c450b69fe5c2
=20
 inherit autotools-brokensep
=20
-S =3D "${WORKDIR}/sg3_utils-${PV}"
+S =3D "${UNPACKDIR}/sg3_utils-${PV}"
=20
 RDEPENDS:${PN} +=3D "bash"
diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/rec=
ipes-support/smarty/smarty_5.4.5.bb
index 37336ff5d7..047f10589d 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/smarty-php/smarty.git;pro=
tocol=3Dhttps;branch=3Dmaster;t
=20
 SRCREV =3D "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
=20
-S =3D "${UNPACKDIR}/git"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.11.2.bb
index 74181ad6ae..887615ef45 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -15,7 +15,6 @@ SRC_URI =3D " \
 "
 SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "--disable-zypp"
=20
diff --git a/meta-oe/recipes-support/source-highlight/source-highlight_gi=
t.bb b/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
index 109af2cfe9..8b0a38095f 100644
--- a/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
+++ b/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dff95bfe019feaf=
92f524b73dd79e76eb"
 SRCREV =3D "894cacd0799ca60afa359a63782729dec76cbb79"
 PV =3D "3.1.9+git"
 SRC_URI =3D "git://git.savannah.gnu.org/git/src-highlite.git;protocol=3D=
https;branch=3Dmaster"
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb b/meta=
-oe/recipes-support/span-lite/span-lite_0.11.0.bb
index 9dc393fd08..9fef39216f 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.11.0.bb
@@ -6,6 +6,5 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaec=
b14d942c71d31bef20d78c"
 SRC_URI +=3D "git://github.com/martinmoene/span-lite;branch=3Dmaster;pro=
tocol=3Dhttps"
 SRCREV =3D "50f55c59d1b66910837313c40d11328d03447a41"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb b/meta-oe/re=
cipes-support/spdlog/spdlog_1.15.0.bb
index 963de54f73..25d8249917 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/gabime/spdlog.git;protocol=3D=
https;branch=3Dv1.x"
=20
 DEPENDS +=3D "fmt"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/r=
ecipes-support/spitools/spitools_git.bb
index 929721b27d..e313685d95 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c16666ae6c159=
876a0ba63099614381"
 PV =3D "1.0.2"
 SRCREV =3D "1748e092425a4a0ff693aa347062a57fc1ffdd00"
=20
-S =3D "${WORKDIR}/git"
=20
 SRC_URI =3D "git://github.com/cpb-/spi-tools.git;protocol=3Dhttps;branch=
=3Dmaster"
=20
diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/=
recipes-support/srecord/srecord_1.65.0.bb
index b4294975bd..1797112a90 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
@@ -11,7 +11,7 @@ SRC_URI =3D " \
     file://0001-fix-build-failure-with-gcc-15-by-adding-cstdint-head.pat=
ch \
 "
 SRC_URI[sha256sum] =3D "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc=
41bd2311d1337644"
-S =3D "${WORKDIR}/${BP}-Source"
+S =3D "${UNPACKDIR}/${BP}-Source"
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/srecord/files/r=
eleases"
=20
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/rec=
ipes-support/ssiapi/ssiapi_1.3.0.bb
index 613a2199ca..d634ca1b6e 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -24,7 +24,7 @@ SRC_URI =3D "http://sourceforge.net/projects/irstessi/f=
iles/${BPN}.${PV}.tgz \
            "
 SRC_URI[sha256sum] =3D "59daab29363d6e9f07c524029c4239653cfbbee6b0e57fd7=
5df62499728dad8a"
=20
-S =3D "${WORKDIR}/${BPN}.${PV}"
+S =3D "${UNPACKDIR}/${BPN}.${PV}"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb=
 b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
index 17f54dcf4c..bba2507e14 100644
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
@@ -10,7 +10,6 @@ SRCREV =3D "e7c351c6c722336b3c79b79cd002c7c2986eefb0"
 SRC_URI =3D "git://github.com/Microsemi/switchtec-user.git;protocol=3Dht=
tps;branch=3Dmaster"
 SRC_URI[sha256sum] =3D "a715e46d8498418dbb8a2519318ba0714ee148151d7e4a7f=
a5e27770a2f6888f"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep pkgconfig
=20
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/rec=
ipes-support/synergy/synergy_git.bb
index 2717320886..e215c62620 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -16,7 +16,6 @@ SRC_URI +=3D "file://CVE-2020-15117.patch"
 SRCREV ?=3D "1b4c076127687aceac931d269e898beaac1cad9f"
 PV =3D "1.10.1+git"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake features_check
=20
diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.=
4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
index d88cad75cd..019098fdf7 100644
--- a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
+++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
@@ -11,7 +11,6 @@ inherit meson systemd pkgconfig useradd features_check
 REQUIRED_DISTRO_FEATURES =3D "systemd"
 COMPATIBLE_HOST:libc-musl =3D "null"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "systemd"
 DEPENDS +=3D "openssl"
diff --git a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb b/meta-oe/recipe=
s-support/tbb/tbb_2022.1.0.bb
index 967ace9075..937cf6a0b9 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
@@ -17,7 +17,6 @@ SRCREV =3D "45587e94dfb6dfe00220c5f520020a5bc745e92f"
 SRC_URI =3D "git://github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;bra=
nch=3D${BRANCH} \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
=20
diff --git a/meta-oe/recipes-support/tio/tio_3.9.bb b/meta-oe/recipes-sup=
port/tio/tio_3.9.bb
index ff9c552d02..67107e2924 100644
--- a/meta-oe/recipes-support/tio/tio_3.9.bb
+++ b/meta-oe/recipes-support/tio/tio_3.9.bb
@@ -9,7 +9,6 @@ SRCREV =3D "bdfe87e1cbf6e3bfd48324a25ea026fcd3cc47e9"
=20
 SRC_URI =3D "git://github.com/tio/tio;protocol=3Dhttps;branch=3Dmaster;t=
ag=3Dv${PV}"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
=20
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb b/meta-oe/r=
ecipes-support/udisks/udisks2_2.10.1.bb
index cb1cbe670d..85859cd968 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
@@ -22,7 +22,6 @@ SRC_URI =3D " \
 	file://0001-Makefile.am-Dont-include-buildpath.patch \
 "
 SRCREV =3D "18c9faf089e306ad6f3f51f5cb887a6b9aa08350"
-S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "udisks"
=20
diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb b/meta-oe/r=
ecipes-support/uhubctl/uhubctl_2.6.0.bb
index bf1103fb57..f4c2eaa63f 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.6.0.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 SRCREV =3D "352f5878e999c0a9d5a453b34110479b2056d7e7"
 SRC_URI =3D "git://github.com/mvp/${BPN};branch=3Dmaster;protocol=3Dhttp=
s"
-S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig
=20
diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/=
meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 02f952e528..efe074f514 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -12,8 +12,7 @@ SRC_URI[ucd-license.sha256sum] =3D "abf84f74dea2812799e=
1dbef7f0581adf7db244881e4fe
=20
 inherit allarch
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_configure[noexec] =3D "1"
=20
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-o=
e/recipes-support/unixodbc/unixodbc_2.3.12.bb
index 0927f5c904..389c3be903 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_REGEX =3D "unixODBC-(?P<pver>\d+(\.\d+)+=
)\.tar"
=20
 inherit autotools-brokensep multilib_header qemu
=20
-S =3D "${WORKDIR}/unixODBC-${PV}"
+S =3D "${UNPACKDIR}/unixODBC-${PV}"
=20
 EXTRA_OEMAKE +=3D "LIBS=3D-lltdl"
 EXTRA_OECONF +=3D "--enable-utf8ini"
diff --git a/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb=
 b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
index cc56e2ea8a..f9f7e86990 100644
--- a/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
+++ b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
@@ -18,7 +18,6 @@ EXTRA_OEMESON =3D "-Dtests=3Dfalse"
=20
 SRCREV =3D "5b4994c8a91290481bef87a5bae95391d0ec677f"
 SRC_URI =3D "git://gitlab.freedesktop.org/upower/power-profiles-daemon;b=
ranch=3Dmain;protocol=3Dhttps"
-S =3D "${WORKDIR}/git"
=20
 do_install:append() {
 	install -d ${D}${sysconfdir}/tmpfiles.d
diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/re=
cipes-support/upower/upower_1.90.6.bb
index 5bac85c57d..d2f58d5b22 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
+++ b/meta-oe/recipes-support/upower/upower_1.90.6.bb
@@ -13,7 +13,7 @@ DEPENDS =3D " \
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${P=
V}/${BPN}-v${PV}.tar.bz2"
 SRC_URI[sha256sum] =3D "aed4e42a21307512ad236ad58d7ee4e0196670c8524a168a=
0edccdc32964ea0c"
-S =3D "${WORKDIR}/${BPN}-v${PV}"
+S =3D "${UNPACKDIR}/${BPN}-v${PV}"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/t=
ags"
 UPSTREAM_CHECK_REGEX =3D "v(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb b/meta-o=
e/recipes-support/usbids/usbids_2025.04.01.bb
index bdb5807aa6..aa884419f8 100644
--- a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/usbids/usbids.git;branch=3D=
master;protocol=3Dhttps"
 # April 1, 2025
 SRCREV =3D "635738b64eb52d376c5d1756c265de67236c8934"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
 	install -d ${D}${datadir}
diff --git a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb b/meta-oe/rec=
ipes-support/uthash/uthash_2.3.0.bb
index ef15613586..357ddfdbca 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "\
     file://run-ptest \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit ptest
=20
diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe=
/recipes-support/utouch/utouch-evemu_git.bb
index bd69dbb11c..e42b19a8d0 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -14,6 +14,5 @@ SRCREV =3D "9752b50e922572e4cd214ac45ed95e4ee410fe24"
=20
 PV =3D "1.0.6+git"
=20
-S =3D "${WORKDIR}/git"
=20
 PARALLEL_MAKE =3D ""
diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe=
/recipes-support/utouch/utouch-frame_git.bb
index ddd27a7e30..44994cafe0 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -18,4 +18,3 @@ SRCREV =3D "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
=20
 PV =3D "1.1.2+git"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-o=
e/recipes-support/utouch/utouch-mtview_git.bb
index d964d7f263..eccaa81d18 100644
--- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -16,4 +16,3 @@ DEPENDS +=3D "mtdev utouch-frame utouch-evemu libx11"
=20
 PV =3D "1.1.7+git"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
index b03ed3cbb9..d11d4808fd 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] =3D "98efdf21c4cdca0fe0b73ab5a8cb520=
93b5aa52d9b1b016a93f71dbfa1
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
-S =3D "${WORKDIR}/webkitgtk-${PV}"
+S =3D "${UNPACKDIR}/webkitgtk-${PV}"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'w=
ayland', 'opengl', '', d)}"
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb b/m=
eta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
index 7b8097c80c..17b71411ca 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
@@ -25,7 +25,6 @@ RDEPENDS:${PN}-dev =3D ""
 # tag 0.8.2
 SRCREV =3D "56123c87598f8b1dd471be83ca841ceae07f95ba"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb b/meta-oe/re=
cipes-support/xdelta/xdelta3_3.1.0.bb
index 6b35d71a55..93692af682 100644
--- a/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f696=
5873eca0259a17f833"
=20
 SRC_URI =3D "git://github.com/jmacd/xdelta.git;branch=3Drelease3_1_apl;p=
rotocol=3Dhttps"
 SRCREV =3D "4b4aed71a959fe11852e45242bb6524be85d3709"
-S =3D "${WORKDIR}/git/xdelta3"
+S =3D "${UNPACKDIR}/${BP}/xdelta3"
=20
 inherit autotools
=20
diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.=
bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
index fa63196da2..43536f5d7b 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
@@ -13,7 +13,6 @@ inherit meson pkgconfig
=20
 SRC_URI =3D "git://github.com/flatpak/xdg-dbus-proxy.git;protocol=3Dhttp=
s;branch=3Dmain"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "1c1989e56f94b9eb3b7567f8a6e8a0aa16cba496"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.20.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.20.0.bb
index 800624bd90..440d836874 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.=
0.bb
@@ -31,7 +31,6 @@ SRC_URI =3D " \
 	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "85df26fb1c53334969fea3f15c2a06a14831094b"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb b/meta-=
oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
index cad5c07099..533b0801cb 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
@@ -16,7 +16,6 @@ SRCREV =3D "d463bad9639c910fadc2f30dac473c7688b11cfc"
=20
 PV =3D "0.9.19"
=20
-S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${libdir}/xorg/modules/*"
=20
diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb b/meta-oe=
/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
index 29e53fcf04..09db5519ea 100644
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/jbeder/yaml-cpp.git;branc=
h=3Dmaster;protocol=3Dhttps"
 SRCREV =3D "28f93bdec6387d42332220afa9558060c8016795"
 PV .=3D "+git"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb b/meta-oe/re=
cipes-support/yyjson/yyjson_0.11.1.bb
index 57966980e0..0655f225b4 100644
--- a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
+++ b/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc8ae1b99922935=
413d4c596f50b59545"
 SRC_URI =3D "git://github.com/ibireme/yyjson.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
 SRCREV =3D "9e24d6bcead647231f81173cc5c6bb6c097c00e4"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-s=
upport/zbar/zbar_git.bb
index 975779cd18..053e0161d7 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_git.bb
@@ -15,7 +15,6 @@ SRC_URI =3D "git://github.com/mchehab/zbar.git;branch=3D=
master;protocol=3Dhttps \
 "
 SRCREV =3D "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
=20
-S =3D "${WORKDIR}/git"
 PV =3D "0.23.1+git"
=20
 DEPENDS +=3D "xmlto-native"
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb b/meta-oe/rec=
ipes-support/zchunk/zchunk_1.5.1.bb
index a15540f968..9ef380005c 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf6e68539f564=
601a5a5869c31e5242"
 SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3D=
main"
=20
 SRCREV =3D "69dd7d6764e333413dd12848607d72cab310e406"
-S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "zstd"
 DEPENDS:append:libc-musl =3D " argp-standalone"
diff --git a/meta-oe/recipes-test/bats/bats_1.12.0.bb b/meta-oe/recipes-t=
est/bats/bats_1.12.0.bb
index ae59a27dc9..14a234c866 100644
--- a/meta-oe/recipes-test/bats/bats_1.12.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.12.0.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "\
 # v1.12.0
 SRCREV =3D "713504bc0224a19b3d7c7958c18dc07f64f54b44"
=20
-S =3D "${WORKDIR}/git"
=20
 # Numerous scripts assume ${baselib} =3D=3D lib, which is not true.
 #
diff --git a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb b/meta-oe/recipe=
s-test/catch2/catch2_3.8.1.bb
index f106b39de4..6a7fc5ad47 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaec=
b14d942c71d31bef20d78c"
 SRC_URI =3D "git://github.com/catchorg/Catch2.git;branch=3Ddevel;protoco=
l=3Dhttps"
 SRCREV =3D "2b60af89e23d28eefc081bc930831ee9d45ea58b"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake python3native
=20
diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipe=
s-test/cmocka/cmocka_1.1.7.bb
index 6c94e9e275..09afe36666 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://git.cryptomilk.org/projects/cmocka.g=
it;protocol=3Dhttps;branch=3Dst
            file://run-ptest \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
=20
diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/reci=
pes-test/cpputest/cpputest_4.0.bb
index 5536cf07b6..5710585b6c 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dce5d5f1fe02bcd=
1343ced64a06fd4177"
 SRC_URI =3D "git://github.com/cpputest/cpputest.git;protocol=3Dhttps;bra=
nch=3Dmaster"
 SRCREV =3D "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb b/meta-oe/reci=
pes-test/cukinia/cukinia_0.7.0.bb
index e3424d019e..ad545e627b 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/savoirfairelinux/cukinia.=
git;protocol=3Dhttps;branch=3Dm
=20
 SRCREV =3D "be56f653743cc0e68bef81ef35df7c50ff8919c4"
=20
-S =3D "${WORKDIR}/git"
=20
 RRECOMMENDS:${PN} =3D "libgpiod-tools"
=20
diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-=
test/cunit/cunit_2.1-3.bb
index b68f0edb3f..9aab617487 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -4,7 +4,7 @@ LICENSE =3D "LGPL-2.0-only"
 SECTION =3D "libs"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7734aa853b85d6f935466f081490d=
dbb"
=20
-S =3D "${WORKDIR}/CUnit-${PV}"
+S =3D "${UNPACKDIR}/CUnit-${PV}"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/cunit/CUnit/${PV}/CUnit-${PV}=
.tar.bz2 \
            file://fixup-install-docdir.patch \
diff --git a/meta-oe/recipes-test/evtest/evtest_1.35.bb b/meta-oe/recipes=
-test/evtest/evtest_1.35.bb
index 52f684ce5f..9c42efcdab 100644
--- a/meta-oe/recipes-test/evtest/evtest_1.35.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.35.bb
@@ -11,6 +11,5 @@ SRC_URI =3D "git://gitlab.freedesktop.org/libevdev/evte=
st.git;protocol=3Dhttps;branc
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch=
 \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb b/meta-oe/recip=
es-test/fbtest/fb-test_1.1.0.bb
index b19bba0156..98db76eda1 100644
--- a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
+++ b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com//ponty/fb-test-app.git;bran=
ch=3Dmaster;protocol=3Dhttps"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     install -d ${D}${bindir}
diff --git a/meta-oe/recipes-test/googletest/googletest_1.16.0.bb b/meta-=
oe/recipes-test/googletest/googletest_1.16.0.bb
index fe2f732a5d..55d670a428 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcbbd27594afd08=
9daa160d3a16dd515a"
=20
 PROVIDES +=3D "gmock gtest"
=20
-S =3D "${WORKDIR}/git"
 SRCREV =3D "6910c9d9165801d8827d628cb72eb7ea9dd538c5"
 SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dv1.16.x;pro=
tocol=3Dhttps \
     file://gtest-ciso646.patch \
diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/met=
a-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
index f13925ee18..3588e96847 100644
--- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
@@ -9,7 +9,6 @@ SRC_URI =3D "git://github.com/wolfcw/libfaketime.git;bran=
ch=3Dmaster;protocol=3Dhttps
            file://0001-Makefile-Detect-compiler-in-makefile.patch \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 CFLAGS:append:libc-musl =3D " -D_LARGEFILE64_SOURCE"
=20
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git=
.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 7346011158..c617cf09a3 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -11,6 +11,5 @@ SRCREV =3D "2ee61484167eab846f7b7c565284d7c350d738d3"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-te=
st/pm-qa/pm-qa_git.bb
index 482e5694f6..d7e9618985 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -15,7 +15,6 @@ SRC_URI =3D " \
     file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.pat=
ch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 CFLAGS +=3D "-pthread"
=20
diff --git a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb b/meta-oe/reci=
pes-test/shunit2/shunit2_2.1.8.bb
index 683600f712..8d298e3c1d 100644
--- a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
+++ b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a36=
4313df4b21ef20c29e"
 SRC_URI =3D " git://github.com/kward/shunit2.git;branch=3Dmaster;protoco=
l=3Dhttps"
 SRCREV =3D "080159b303537888c5d41910b4d47a5002638e30"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     install -D -m 0755 ${S}/shunit2 ${D}${bindir}/shunit2
diff --git a/meta-oe/recipes-test/testfloat/testfloat_3e.bb b/meta-oe/rec=
ipes-test/testfloat/testfloat_3e.bb
index f5aace4d33..3c25c2d4ff 100644
--- a/meta-oe/recipes-test/testfloat/testfloat_3e.bb
+++ b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
@@ -21,8 +21,7 @@ SRC_URI[SoftFloat.sha256sum] =3D "21130ce885d35c1fe73fc=
1e1bf2244178167e05c6747cad5
=20
 UPSTREAM_CHECK_URI =3D "http://www.jhauser.us/arithmetic/TestFloat.html"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/${BP}"
=20
 do_compile(){
     oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/
diff --git a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb b/meta-o=
e/recipes-test/trompeloeil/trompeloeil_v47.bb
index 788a15dba2..3f2f07c28f 100644
--- a/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
+++ b/meta-oe/recipes-test/trompeloeil/trompeloeil_v47.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224c=
caecb14d942c71d31bef20d78c"
 SRC_URI =3D "git://github.com/rollbear/trompeloeil.git;branch=3Dmain;pro=
tocol=3Dhttps"
 SRCREV =3D "ad9bc41b1e01ae92802de59a12d19cf7c8683d6d"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/=
recipes-perl/adduser/adduser_3.118.bb
index 431b41a2dd..9718a2ce9b 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/prim=
ary/+sourcefiles/adduser/${
=20
 SRC_URI[sha256sum] =3D "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d38e=
d417737ed3166ffc"
=20
-S =3D "${WORKDIR}/${BPN}"
+S =3D "${UNPACKDIR}/${BPN}"
=20
 inherit cpan-base update-alternatives
=20
diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1=
.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.=
bb
index cef17fb400..edecc8dbb0 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://lib/Algorithm/Diff.pm;begi=
nline=3D406;endline=3D409;md5=3Dd
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}=
.tar.gz"
 SRC_URI[sha256sum] =3D "aa848b75ad3ecc32d31e8651909551e851cceef74a32822c=
7a3cb35c259f5190"
=20
-S =3D "${WORKDIR}/Algorithm-Diff-${PV}"
+S =3D "${UNPACKDIR}/Algorithm-Diff-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.=
bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
index 835fd2f6cc..b36006acd3 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/M/MA/MANOWAR/Rad=
iusPerl-${PV}.tar.gz \
 "
 SRC_URI[sha256sum] =3D "3b276506986ccaa4949d92b13ce053a0017ad11562a991cc=
753364923fe81ca7"
=20
-S =3D "${WORKDIR}/Authen-Radius-${PV}"
+S =3D "${UNPACKDIR}/Authen-Radius-${PV}"
=20
 inherit cpan ptest
=20
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.=
bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
index e8ee641d9c..bcd155ff6f 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/E/EH/EHUELS/Auth=
en-SASL-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] =3D "0b03686bddbbf7d5c6548e468d079a4051c9b73851df740a=
e28cfd2db234e922"
=20
-S =3D "${WORKDIR}/Authen-SASL-${PV}"
+S =3D "${UNPACKDIR}/Authen-SASL-${PV}"
=20
 inherit cpan ptest
=20
diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.=
bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
index 7154a18788..efd78e20e2 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
@@ -17,7 +17,7 @@ SRCNAME =3D "Capture-Tiny"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.ta=
r.gz"
 SRC_URI[sha256sum] =3D "ca6e8d7ce7471c2be54e1009f64c367d7ee233a2894cacf5=
2ebe6f53b04e81e5"
=20
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb b/meta-per=
l/recipes-perl/libcgi/libcgi-perl_4.68.bb
index 59934fe36d..0c738b0b06 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEEJO/CGI-$=
{PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "12fb5a5b392032413571169257f98533488005550774bcbd=
0715be687a590cf2"
=20
-S =3D "${WORKDIR}/CGI-${PV}"
+S =3D "${UNPACKDIR}/CGI-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-pe=
rl_2.15.bb b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-pe=
rl_2.15.bb
index f6ed718239..93c186d2d5 100644
--- a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15=
.bb
+++ b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15=
.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd49d07ae038f=
38923335ac8cc301e1ba"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Class-Method-Modifiers=
-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "65cd85bfe475d066e9186f7a8cc636070985b30b0ebb1cde=
8681cf062c2e15fc"
=20
-S =3D "${WORKDIR}/Class-Method-Modifiers-${PV}"
+S =3D "${UNPACKDIR}/Class-Method-Modifiers-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-per=
l_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-per=
l_2.213.bb
index 5735bbba1e..409216fe69 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213=
.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213=
.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "8d75d3d366c9101ca18061b00d438d3=
da39478c06159147dea3c666770
=20
 DEPENDS +=3D "bzip2"
=20
-S =3D "${WORKDIR}/Compress-Raw-Bzip2-${PV}"
+S =3D "${UNPACKDIR}/Compress-Raw-Bzip2-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl=
_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_=
2.213.bb
index 2bc42cb941..6f18bae7dd 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.=
bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.=
bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "6b979a8347701ced3ac26123d428c1f=
202b7999850444da19c4aedbb7c
=20
 DEPENDS +=3D "xz"
=20
-S =3D "${WORKDIR}/Compress-Raw-Lzma-${PV}"
+S =3D "${UNPACKDIR}/Compress-Raw-Lzma-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl=
_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_=
2.213.bb
index 205e6a548e..0c6a1070cd 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.=
bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.=
bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] =3D "56b21c99cb3a3a7f7876a74dd05daa3=
f41fc9143ddd4dc98f8e46710a1
=20
 DEPENDS +=3D "zlib"
=20
-S =3D "${WORKDIR}/Compress-Raw-Zlib-${PV}"
+S =3D "${UNPACKDIR}/Compress-Raw-Zlib-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.=
30.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
index f232c3585b..73694bb95f 100644
--- a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
+++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab27c3cedbdb=
0eb6e656a8722476191a"
=20
 RDEPENDS:${PN} +=3D "perl"
=20
-S =3D "${WORKDIR}/Config-Tiny-${PV}"
+S =3D "${UNPACKDIR}/Config-Tiny-${PV}"
=20
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tg=
z"
=20
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.3=
19.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index 8331a1d4af..086b2ff32e 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -33,7 +33,7 @@ RDEPENDS:${PN} +=3D "perl-module-text-parsewords"
 RDEPENDS:${PN} +=3D "perl-module-warnings"
 RRECOMMENDS:${PN} +=3D "libfile-slurper-perl"
=20
-S =3D "${WORKDIR}/Config-AutoConf-${PV}"
+S =3D "${UNPACKDIR}/Config-AutoConf-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_=
0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.1=
5.bb
index dd6cd8041f..09c145e7cd 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN} =3D "\
=20
 EXTRA_CPANFLAGS =3D "INC=3D'-I${STAGING_INCDIR}' LIBS=3D'-L${STAGING_LIB=
DIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
=20
-S =3D "${WORKDIR}/Crypt-OpenSSL-Guess-${PV}"
+S =3D "${UNPACKDIR}/Crypt-OpenSSL-Guess-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl=
_0.17.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0=
.17.bb
index c55f7f7680..982d604eaa 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.b=
b
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.b=
b
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9e876d4149406d=
88b4ff1b37645363ad"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/R/RU/RURBAN/Crypt-OpenSSL-Random-=
${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "a571b24181baaa76c96704e92acffc6934ff593e380dade2=
74db4e43c140ad51"
=20
-S =3D "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
+S =3D "${UNPACKDIR}/Crypt-OpenSSL-Random-${PV}"
=20
 DEPENDS +=3D " \
     openssl \
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.=
33.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
index 36f96d59cd..5b81cfa4a3 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} =3D " \
=20
 EXTRA_CPANFLAGS =3D "INC=3D'-I${STAGING_INCDIR}' LIBS=3D'-L${STAGING_LIB=
DIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
=20
-S =3D "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
+S =3D "${UNPACKDIR}/Crypt-OpenSSL-RSA-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb b/me=
ta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
index f440209860..e6fc3c8300 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/G/GI/GIRAFFED/Cu=
rses-${PV}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "84221e0013a2d64a0bae6a32bb44b1ae5734d2cb0465fb89=
af3e3abd6e05aeb2"
=20
-S =3D "${WORKDIR}/Curses-${PV}"
+S =3D "${UNPACKDIR}/Curses-${PV}"
=20
 EXTRA_CPANFLAGS =3D "INC=3D-I${STAGING_INCDIR} LIBS=3D-L${STAGING_LIBDIR=
} TEST_SYMS_OPTS=3D-v"
=20
diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb =
b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
index f52d0034f2..793889de6d 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/F/FT/FTASSIN/Dat=
a-HexDump-${PV}.tar.gz \
 "
 SRC_URI[sha256sum] =3D "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17=
454d03535cd9be70"
=20
-S =3D "${WORKDIR}/Data-HexDump-${PV}"
+S =3D "${UNPACKDIR}/Data-HexDump-${PV}"
=20
 inherit cpan ptest update-alternatives
=20
diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb b/me=
ta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
index 8425607eeb..e8bbf79b13 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D "0a33a7a935be63371071dbe600cfaef=
a67cd971b67580a917bbf6ebaf7
=20
 UPSTREAM_CHECK_REGEX =3D "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
=20
-S =3D "${WORKDIR}/DBD-SQLite-${PV}"
+S =3D "${UNPACKDIR}/DBD-SQLite-${PV}"
=20
 DEPENDS +=3D "libdbi-perl-native"
=20
diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-p=
erl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-=
perl_0.14.bb
index e8450c7ac8..1da94516eb 100644
--- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.1=
4.bb
+++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.1=
4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D53;endl=
ine=3D55;md5=3D935dadb9423774f535
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestructio=
n-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41=
fe5b53efab9154ab"
=20
-S =3D "${WORKDIR}/Devel-GlobalDestruction-${PV}"
+S =3D "${UNPACKDIR}/Devel-GlobalDestruction-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb=
 b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
index 5bbabf24de..bb19dfb415 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/A/AR/ARODLAND/Di=
gest-HMAC-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] =3D "215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a9=
92e87c4969fcdc7a"
=20
-S =3D "${WORKDIR}/Digest-HMAC-${PV}"
+S =3D "${UNPACKDIR}/Digest-HMAC-${PV}"
=20
 inherit cpan ptest
=20
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb=
 b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index c677e8ea59..350bad3ea2 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/G/GA/GAAS/Digest=
-SHA1-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] =3D "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ede=
df5b90296fb943cc"
=20
-S =3D "${WORKDIR}/Digest-SHA1-${PV}"
+S =3D "${UNPACKDIR}/Digest-SHA1-${PV}"
=20
 inherit cpan ptest
=20
diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-per=
l/recipes-perl/libenv/libenv-perl_1.04.bb
index f88a418a47..e2a7084061 100644
--- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/F/FL/FLORA/Env-$=
{PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7=
014ce1200251ebb0"
=20
-S =3D "${WORKDIR}/Env-${PV}"
+S =3D "${UNPACKDIR}/Env-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb b/m=
eta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
index cce79f807a..7b28d59228 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
@@ -35,7 +35,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/Err=
or-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "34d382276c0fb0d6b38355b94c96a30b12d834d5662eb53f=
088ee25e3e712924"
=20
-S =3D "${WORKDIR}/Error-${PV}"
+S =3D "${UNPACKDIR}/Error-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0=
.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.00=
8.bb
index b6e80cd888..401f607571 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1932ab4d8b84=
c25fd7967aa18088e57e"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.=
tar.gz"
 SRC_URI[sha256sum] =3D "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfd=
aa3ee749e62f1a8c"
=20
-S =3D "${WORKDIR}/ExtUtils-Config-${PV}"
+S =3D "${UNPACKDIR}/ExtUtils-Config-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl=
_0.27.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0=
.27.bb
index c7accb3171..f23d4e3eda 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.b=
b
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.b=
b
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D81;endl=
ine=3D84;md5=3D84c0390b90ea8c6702
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.=
tar.gz"
 SRC_URI[sha256sum] =3D "b2c7b581901054a32dfcea12536fda8626457ed0bfbc0260=
0bd354bde7e2a9b4"
=20
-S =3D "${WORKDIR}/ExtUtils-CppGuess-${PV}"
+S =3D "${UNPACKDIR}/ExtUtils-CppGuess-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_=
0.028.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.=
028.bb
index e03496d789..42c99ddf58 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.b=
b
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.b=
b
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc0280160e4f2=
6faafef507664884bf63"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}=
.tar.gz"
 SRC_URI[sha256sum] =3D "c8574875cce073e7dc5345a7b06d502e52044d68894f9160=
203fcaab379514fe"
=20
-S =3D "${WORKDIR}/ExtUtils-Helpers-${PV}"
+S =3D "${UNPACKDIR}/ExtUtils-Helpers-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-=
perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpat=
hs-perl_0.012.bb
index 25de3fc5d4..13d5a31d0b 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.=
012.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.=
012.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db6fa54d873ce=
6bcf4809ea88bdf97769"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-=
${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "84735e3037bab1fdffa3c2508567ad412a785c91599db3c1=
2593a50a1dd434ed"
=20
-S =3D "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
+S =3D "${UNPACKDIR}/ExtUtils-InstallPaths-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_=
3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.3=
5.bb
index c3a85f6f4f..f5b87ff896 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
@@ -16,7 +16,7 @@ SRCNAME =3D "ExtUtils-ParseXS"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.ta=
r.gz"
 SRC_URI[sha256sum] =3D "41def0511278a2a8ba9afa25ccab45b0453f75e7fd774e86=
44b5f9a57cc4ee1c"
=20
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb=
 b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
index a0dcacfaa4..d857f1316a 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -10,7 +10,7 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D37;endline=3D41;md5=3D25=
5fbd5f98a90d51d9908d31271ae4d4"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
=20
-S =3D "${WORKDIR}/File-Slurp-${PV}"
+S =3D "${UNPACKDIR}/File-Slurp-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb=
 b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
index 410ce80461..03001de45e 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN}-ptest +=3D "libtest-warnings-perl \
     perl-module-test-more \
     "
=20
-S =3D "${WORKDIR}/File-Slurper-${PV}"
+S =3D "${UNPACKDIR}/File-Slurper-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b=
/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index 64330ceeaa..bd6129e4f2 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/G/GA/GAAS/HTML-P=
arser-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02=
a3296a4bb92f608b"
=20
-S =3D "${WORKDIR}/HTML-Parser-${PV}"
+S =3D "${UNPACKDIR}/HTML-Parser-${PV}"
=20
 EXTRA_CPANFLAGS =3D "EXPATLIBPATH=3D${STAGING_LIBDIR} EXPATINCPATH=3D${S=
TAGING_INCDIR}"
=20
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b=
/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
index a0ce7c0b2e..519c2ad54c 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D62;endl=
ine=3D66;md5=3Daa91eed6adfe182d2a
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}.t=
ar.gz"
 SRC_URI[sha256sum] =3D "adb17dac9e36cd011f5243881c9739417fd102fce760f8de=
4e9be4c7131108e2"
=20
-S =3D "${WORKDIR}/HTML-Tagset-${PV}"
+S =3D "${UNPACKDIR}/HTML-Tagset-${PV}"
=20
=20
 inherit cpan ptest-perl
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/m=
eta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index 7bdebcd37c..77737f666d 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tr=
ee-${PV}.tar.gz \
 "
 SRC_URI[sha256sum] =3D "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec=
0387f01eefc2148f"
=20
-S =3D "${WORKDIR}/HTML-Tree-${PV}"
+S =3D "${UNPACKDIR}/HTML-Tree-${PV}"
=20
 inherit cpan_build
=20
diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.00200=
4.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
index c16c358fcf..76e4d3bbf1 100644
--- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
+++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D209;end=
line=3D223;md5=3D3cf363f1e405dea6
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.tar.=
gz"
 SRC_URI[sha256sum] =3D "decb259bc2ff015fe3dac85e4a287d4128e9b0506a0b2c5f=
a7244836a68b1084"
=20
-S =3D "${WORKDIR}/Import-Into-${PV}"
+S =3D "${UNPACKDIR}/Import-Into-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.=
bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
index f6733ad02d..b2da8a903f 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Com=
press-Lzma-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "daa63c3fa1f7708aa55b97a4d189820f5e849f8e4583dc24=
b5cceebd06a493eb"
=20
-S =3D "${WORKDIR}/IO-Compress-Lzma-${PV}"
+S =3D "${UNPACKDIR}/IO-Compress-Lzma-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb b/=
meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
index 4e0a0be4f0..ce764334f1 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Com=
press-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "ae4d01ae574e4568c5f2fb0573e74631e2720b71ad3bc5a3=
ffe9480f1cb9a851"
=20
-S =3D "${WORKDIR}/IO-Compress-${PV}"
+S =3D "${UNPACKDIR}/IO-Compress-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb =
b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
index ce3097cb63..58d099043d 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.090.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN} +=3D "\
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.ta=
r.gz"
 SRC_URI[sha256sum] =3D "fdda17888df9f88251b62856f17fcac8f144858c72d7e01d=
1c4b437d23383d97"
=20
-S =3D "${WORKDIR}/IO-Socket-SSL-${PV}"
+S =3D "${UNPACKDIR}/IO-Socket-SSL-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/m=
eta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
index 5c5ccf7db2..a2c3e8a46e 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D01406e4ff2e6=
0d88d42ef1caebdd0011"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.=
gz"
 SRC_URI[sha256sum] =3D "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6a=
aa8296ea41bf199d"
=20
-S =3D "${WORKDIR}/IO-stringy-${PV}"
+S =3D "${UNPACKDIR}/IO-stringy-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/m=
eta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index 43a6ff6527..84fcca8da5 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -8,7 +8,7 @@ SECTION =3D "libs"
 LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D16;endline=3D18;md5=3Df3=
6550f59a0ae5e6e3b0be6a4da60d26"
=20
-S =3D "${WORKDIR}/IPC-Signal-${PV}"
+S =3D "${UNPACKDIR}/IPC-Signal-${PV}"
=20
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.g=
z"
=20
diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07=
.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
index 9774ac55d1..7c23619cde 100644
--- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
+++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Loc=
ale-gettext-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "909d47954697e7c04218f972915b787bd1244d75e3bd0162=
0bc167d5bbc49c15"
=20
-S =3D "${WORKDIR}/Locale-gettext-${PV}"
+S =3D "${UNPACKDIR}/Locale-gettext-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.=
bb b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
index a390818511..b7b287c399 100644
--- a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/MIME=
-Charset-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "1bb7a6e0c0d251f23d6e60bf84c9adefc5b74eec58475bfe=
e4d39107e60870f0"
=20
-S =3D "${WORKDIR}/MIME-Charset-${PV}"
+S =3D "${UNPACKDIR}/MIME-Charset-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb b/=
meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
index d8203f4353..043e1549af 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME=
-Types-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] =3D "7099cb5133401acc92d8fb0fd398cac682140be0680e7dfc=
b4aaf40315a2dfca"
=20
-S =3D "${WORKDIR}/MIME-Types-${PV}"
+S =3D "${UNPACKDIR}/MIME-Types-${PV}"
=20
 inherit cpan ptest
=20
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0=
.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.04=
8.bb
index bab9c5c95d..f3c6e1a016 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
@@ -17,7 +17,7 @@ DEPENDS =3D "libextutils-config-perl-native libextutils=
-helpers-perl-native libext
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV=
}.tar.gz"
 SRC_URI[sha256sum] =3D "79a73e506fb7badabdf79137a45c6c5027daaf6f9ac3dcfb=
9d4ffcce92eb36bd"
=20
-S =3D "${WORKDIR}/Module-Build-Tiny-${PV}"
+S =3D "${UNPACKDIR}/Module-Build-Tiny-${PV}"
=20
 inherit cpan_build ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.=
2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index fac74ba97e..108c965968 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] =3D "b3f2ad45e4fd10b3fb90d912d78d8b7=
95ab295480db56dc64e86b9fa75
 UPSTREAM_CHECK_REGEX =3D "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"
 UPSTREAM_CHECK_URI =3D "https://metacpan.org/release/${SRCNAME}"
=20
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.01=
6.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
index 0ed61ac3a4..4526def40a 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] =3D "68302ec646833547d410be28e09676d=
b75006f4aa58a11f3bdb44ffe99
=20
 UPSTREAM_CHECK_REGEX =3D "Module\-Runtime\-(?P<pver>(\d+\.\d+)).tar"
=20
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb b/meta=
-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
index e92d793d9c..bbb8d9868f 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D742;end=
line=3D787;md5=3D74f4de483dce5aa4
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "fb5a2952649faed07373f220b78004a9c6aba38773913374=
0c1770e9b1f4b108"
=20
-S =3D "${WORKDIR}/Moo-${PV}"
+S =3D "${UNPACKDIR}/Moo-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_2025060=
2.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
index b5f980e646..d5c7db4764 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D32;endl=
ine=3D39;md5=3D51e666dce556490a11
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "adeac0752440b2da094e8036bab6c857e22172457658868f=
5ac364f0c7b35481"
=20
-S =3D "${WORKDIR}/Mozilla-CA-${PV}"
+S =3D "${UNPACKDIR}/Mozilla-CA-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb b/meta=
-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
index c7c0e381a6..05027f693c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "c660500b9d96e5aa2b16d9f4260b6f9=
f05b5602d3c4bea0ca39b45bcd0
=20
 UPSTREAM_CHECK_REGEX =3D "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
=20
-S =3D "${WORKDIR}/Net-DNS-${PV}"
+S =3D "${UNPACKDIR}/Net-DNS-${PV}"
=20
 EXTRA_CPANFLAGS =3D "EXPATLIBPATH=3D${STAGING_LIBDIR} EXPATINCPATH=3D${S=
TAGING_INCDIR}"
=20
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/=
meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
index ba79922bac..ee365f9328 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
@@ -12,7 +12,7 @@ DEPENDS +=3D "openssl"
=20
 UPSTREAM_CHECK_REGEX =3D "Net\-DNS\-SEC\-(?P<pver>(\d+\.\d+))(?!_\d+).ta=
r"
=20
-S =3D "${WORKDIR}/Net-DNS-SEC-${PV}"
+S =3D "${UNPACKDIR}/Net-DNS-SEC-${PV}"
=20
 EXTRA_CPANFLAGS =3D "INC=3D'-I${STAGING_INCDIR}' LIBS=3D'-L${STAGING_LIB=
DIR} -lssl -L${STAGING_BASELIBDIR} -lcrypto'"
=20
diff --git a/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb b/m=
eta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
index 7f33fd2b1f..dd53bebf4c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/C/CF/CFAERBER/Ne=
t-IDN-Encode-${PV}.tar.gz \
 "
 SRC_URI[sha256sum] =3D "55453633e3ff24ce325b34bc2c8157b9859962a31ab5cf28=
bf7ccc1c9b3a3eaa"
=20
-S =3D "${WORKDIR}/Net-IDN-Encode-${PV}"
+S =3D "${UNPACKDIR}/Net-IDN-Encode-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/met=
a-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index a7793200a5..c620485123 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/pe=
rl-ldap-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "e2f389fe3e7a9e4b61488692919ad723b98f3b479b5288f6=
10daa8c27995b351"
=20
-S =3D "${WORKDIR}/perl-ldap-${PV}"
+S =3D "${UNPACKDIR}/perl-ldap-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/m=
eta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index f56b5a26e4..8f029492b1 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -19,7 +19,7 @@ SRC_URI +=3D "file://libidn-wr-cross-compile.patch"
=20
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D42;endline=3D92;md5=3D33=
74ea0369ca3ead6047520477a43147"
=20
-S =3D "${WORKDIR}/Net-LibIDN-${PV}"
+S =3D "${UNPACKDIR}/Net-LibIDN-${PV}"
=20
 EXTRA_CPANFLAGS =3D "--with-libidn=3D${STAGING_LIBDIR} --with-libidn-inc=
=3D${STAGING_INCDIR} --compiler=3D'${CC}'"
 EXTRA_CPANFLAGS +=3D "--disable-tld"
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/m=
eta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index d09f756fbb..daf07baa22 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -29,7 +29,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/M/MI/MIKEM/Net-S=
SLeay-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] =3D "9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f=
1a6814549927b0c8"
=20
-S =3D "${WORKDIR}/Net-SSLeay-${PV}"
+S =3D "${UNPACKDIR}/Net-SSLeay-${PV}"
=20
 inherit cpan ptest
=20
diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/m=
eta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index 2e79a3b1cd..3d05a3d7a3 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D4;endli=
ne=3D7;md5=3De94ab3b72335e3cdadd6
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar=
.gz"
 SRC_URI[sha256sum] =3D "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d=
923bd6283796a743"
=20
-S =3D "${WORKDIR}/Net-Telnet-${PV}"
+S =3D "${UNPACKDIR}/Net-Telnet-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb=
 b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index d9424ed4d6..8478441211 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D21;endl=
ine=3D23;md5=3Df36550f59a0ae5e6e3
=20
 RDEPENDS:${PN} +=3D "perl libipc-signal-perl"
=20
-S =3D "${WORKDIR}/Proc-WaitStat-${PV}"
+S =3D "${UNPACKDIR}/Proc-WaitStat-${PV}"
=20
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.ta=
r.gz"
=20
diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb=
 b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
index 8ccd269e6d..69d84a6edf 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D197;end=
line=3D234;md5=3D26df7e7c20551fb1
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz=
"
 SRC_URI[sha256sum] =3D "d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa8=
45dcb44d9a242b45"
=20
-S =3D "${WORKDIR}/Role-Tiny-${PV}"
+S =3D "${UNPACKDIR}/Role-Tiny-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb=
 b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index 6b1c4e8c0f..be52caacf2 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -30,7 +30,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Arti=
stic-1.0;md5=3Dcda03bbdc3c195
=20
 SRC_URI[sha256sum] =3D "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b8=
37745f3ea61d6afa"
=20
-S =3D "${WORKDIR}/Unix-Statgrab-${PV}"
+S =3D "${UNPACKDIR}/Unix-Statgrab-${PV}"
=20
 export LD =3D "${CCLD}"
=20
diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.00=
0006.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.00000=
6.bb
index 5a779a6733..426ba68ab8 100644
--- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
@@ -31,7 +31,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D246;end=
line=3D262;md5=3D43be558cf4f19823
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.g=
z"
 SRC_URI[sha256sum] =3D "09d57974a6d1b2380c802870fed471108f51170da81458e2=
751859f2714f8d57"
=20
-S =3D "${WORKDIR}/strictures-${PV}"
+S =3D "${UNPACKDIR}/strictures-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-pe=
rl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressiv=
e-perl_0.001013.bb
index 10f0fa2044..5ffc3eaef9 100644
--- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.00=
1013.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.00=
1013.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D003fa9706623=
59a43ac2c2961108b0f1"
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressiv=
e-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "d535b7954d64da1ac1305b1fadf98202769e3599376854b2=
ced90c382beac056"
=20
-S =3D "${WORKDIR}/Sub-Exporter-Progressive-${PV}"
+S =3D "${UNPACKDIR}/Sub-Exporter-Progressive-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb =
b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
index 7487712a93..084d55ee60 100644
--- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DA/${CPAN_AUTH=
OR}/${CPAN_PACKAGE}-${PV}.t
=20
 SRC_URI[sha256sum] =3D "b4f3f63b80f680a421332d8851ddbe5a8e72fcaa74d5d1d9=
8f3c8cc4a3ece293"
=20
-S =3D "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
+S =3D "${UNPACKDIR}/${CPAN_PACKAGE}-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb =
b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
index 3f184badf5..889b6b655b 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/Term=
ReadKey-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd=
22e105a856a47290"
=20
-S =3D "${WORKDIR}/TermReadKey-${PV}"
+S =3D "${UNPACKDIR}/TermReadKey-${PV}"
=20
 UPSTREAM_CHECK_URI =3D "https://metacpan.org/release/TermReadKey"
 UPSTREAM_CHECK_REGEX =3D "TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar=
.gz"
diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb b/=
meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
index 7fbddad7fc..414f0efe3d 100644
--- a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] =3D "42781e9943a7a215e662c4973b9feaf=
dc019fd16469bdb849a8537ee58
=20
 UPSTREAM_CHECK_REGEX =3D "Test\-Deep\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
=20
-S =3D "${WORKDIR}/Test-Deep-${PV}"
+S =3D "${UNPACKDIR}/Test-Deep-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb =
b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
index 24b6806bc6..0af38719c7 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] =3D "79b6acdc444f1924cd4c2e9ed868bdc=
6e09580021aca8ff078ede2ffef
=20
 UPSTREAM_CHECK_REGEX =3D "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).ta=
r"
=20
-S =3D "${WORKDIR}/Test-Harness-${PV}"
+S =3D "${UNPACKDIR}/Test-Harness-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.=
bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
index fe178b46ca..23f339bcda 100644
--- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
@@ -29,7 +29,7 @@ SRC_URI[sha256sum] =3D "638a57658cb119af1fe5b15e73d47c2=
544dcfef84af0c6b1b2e97f0820
=20
 RDEPENDS:${PN} +=3D "perl-module-test-builder perl-module-test-more perl=
-module-test-tester"
=20
-S =3D "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
+S =3D "${UNPACKDIR}/${CPAN_PACKAGE}-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb b/m=
eta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
index 0f0816df9b..6536787623 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/B/BI/${CPAN_AUTH=
OR}/${CPAN_PACKAGE}-${PV}.t
=20
 SRC_URI[sha256sum] =3D "98ca32e7f2f5ea89b8bfb9a0609977f3d153e242e2e51705=
126cb954f1a06b57"
=20
-S =3D "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
+S =3D "${UNPACKDIR}/${CPAN_PACKAGE}-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.b=
b b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
index 8f16aa1ec0..15f8b3f81e 100644
--- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text=
-CharWidth-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "abded5f4fdd9338e89fd2f1d8271c44989dae5bf50aece41=
b6179d8e230704f8"
=20
-S =3D "${WORKDIR}/Text-CharWidth-${PV}"
+S =3D "${UNPACKDIR}/Text-CharWidth-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/m=
eta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
index 9c473d15a2..90bd555403 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-D=
iff-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] =3D "a67f50a48e313c1680cc662109ce5f913ea71454db355d0c=
f4db87ac89d2d2fa"
=20
-S =3D "${WORKDIR}/Text-Diff-${PV}"
+S =3D "${UNPACKDIR}/Text-Diff-${PV}"
=20
 inherit cpan ptest
 RDEPENDS:${PN}-ptest +=3D "perl-module-test perl-module-test-more"
diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/m=
eta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index 80c976561a..2d0242d878 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/M/MP/MPIOTR/Text=
-Iconv-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bce=
e383d029e7d2d5c3"
=20
-S =3D "${WORKDIR}/Text-Iconv-${PV}"
+S =3D "${UNPACKDIR}/Text-Iconv-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb=
 b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
index 7bc2e234ac..025bcc2873 100644
--- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text=
-WrapI18N-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "4bd29a17f0c2c792d12c1005b3c276f2ab0fae39c00859ae=
1741d7941846a488"
=20
-S =3D "${WORKDIR}/Text-WrapI18N-${PV}"
+S =3D "${UNPACKDIR}/Text-WrapI18N-${PV}"
=20
 DEPENDS =3D "libtext-charwidth-perl"
=20
diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_=
2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl=
_2019.001.bb
index ae922d9dda..6b552d9502 100644
--- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.00=
1.bb
+++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.00=
1.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unic=
ode-LineBreak-${PV}.tar.gz"
=20
 SRC_URI[sha256sum] =3D "486762e4cacddcc77b13989f979a029f84630b8175e7fef1=
7989e157d4b6318a"
=20
-S =3D "${WORKDIR}/Unicode-LineBreak-${PV}"
+S =3D "${UNPACKDIR}/Unicode-LineBreak-${PV}"
=20
 DEPENDS =3D "libsombok3 libmime-charset-perl"
=20
diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb b/meta-per=
l/recipes-perl/liburi/liburi-perl_5.32.bb
index 604b046f0d..7c42a7e4a4 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI=
-${PV}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "9632067d34e14e0dae2da94631c4f25a387fcc48d06fa293=
30e8b3c04c4e913d"
=20
-S =3D "${WORKDIR}/URI-${PV}"
+S =3D "${UNPACKDIR}/URI-${PV}"
=20
 EXTRA_CPANFLAGS =3D "EXPATLIBPATH=3D${STAGING_LIBDIR} EXPATINCPATH=3D${S=
TAGING_INCDIR}"
=20
diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_=
1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.0=
1.bb
index 4393fbd91a..6dc2a19e0b 100644
--- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D "8fd2126d3beec554df852919f4739e6=
89202cbba6a17506e9b66ea1658
=20
 LIC_FILES_CHKSUM =3D "file://BufferText.pm;beginline=3D88;endline=3D90;m=
d5=3D497aa6d79cc84c3d769a2a0016bee928"
=20
-S =3D "${WORKDIR}/XML-Filter-BufferText-${PV}"
+S =3D "${UNPACKDIR}/XML-Filter-BufferText-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b=
/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index e0ed6e7c3e..6450111da9 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -34,7 +34,7 @@ LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D64e=
da1bc135f0ece1d1187f2a8ac82c1
 SRC_URI[libxml.md5sum] =3D "dce687dd8b7e82d1c359fd74b1852f64"
 SRC_URI[libxml.sha256sum] =3D "f0bca4d0c2da35d879fee4cd13f352014186cedab=
27ab5e191f39b5d7d4f46cf"
=20
-S =3D "${WORKDIR}/XML-LibXML-${PV}"
+S =3D "${UNPACKDIR}/XML-LibXML-${PV}"
=20
 inherit cpan ptest-perl
=20
diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb=
 b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index d4a027e6d8..b66cbc3945 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D "3d61d07ef43b0126f5b4de4f415a256=
fa859fa88dc4fdabaad70b7be7c
=20
 LIC_FILES_CHKSUM =3D "file://README;beginline=3D45;endline=3D46;md5=3Dd4=
1d8cd98f00b204e9800998ecf8427e"
=20
-S =3D "${WORKDIR}/XML-SAX-Writer-${PV}"
+S =3D "${UNPACKDIR}/XML-SAX-Writer-${PV}"
=20
 inherit cpan
=20
diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.=
9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.=
bb
index 2d77c32945..205775ef63 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -14,6 +14,5 @@ RDEPENDS:${PN} +=3D " \
 SRC_URI =3D "git://github.com/MostAwesomeDude/txWS.git;branch=3Dmaster;p=
rotocol=3Dhttps"
 SRCREV =3D "88cf6d9b9b685ffa1720644bd53c742afb10a414"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3=
_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python=
3_0.15.19.bb
index cf2b7fa15e..a6395b9e47 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.1=
9.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.1=
9.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "http://telepathy.freedesktop.org/releases/=
telepathy-python/telepathy-
            file://telepathy-python_fix_for_automake_1.12.patch"
=20
=20
-S =3D "${WORKDIR}/telepathy-python-${PV}"
+S =3D "${UNPACKDIR}/telepathy-python-${PV}"
=20
 inherit autotools python3native
=20
diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/re=
cipes-devtools/gyp/gyp_git.bb
index 6ac4228a8b..668aaa5340 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://chromium.googlesource.com/external/gyp=
;protocol=3Dhttps;branch=3Dma
            "
 SRCREV =3D "a03d7413becefc8d55c8aa3df58b55b9bd0e9052"
=20
-S =3D "${WORKDIR}/git"
 PV =3D "0.1+git"
=20
 inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_=
0.7.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.=
7.0.bb
index 79e26e7ae3..cf579c74fe 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.b=
b
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc6afb13fdc2204=
97ee5cded1e717ed67"
=20
 SRC_URI[sha256sum] =3D "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790=
723543408344ce89"
=20
-S =3D "${WORKDIR}/annotated_types-${PV}"
+S =3D "${UNPACKDIR}/annotated_types-${PV}"
 PYPI_PACKAGE =3D "annotated_types"
=20
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b=
/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
index bc3315f751..b2834568b7 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
@@ -11,6 +11,5 @@ SRCREV ?=3D "c7553c79f9222e20783fe9bd8a553f932e918072"
=20
 inherit setuptools3
=20
-S =3D "${WORKDIR}/git"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-s=
dk-python_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-=
device-sdk-python_1.5.2.bb
index bdadf7c774..4b4ff952ef 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-pyth=
on_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-pyth=
on_1.5.2.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/aws/aws-iot-device-sdk-py=
thon;branch=3Dmaster;protocol
            file://0001-setup.py-Use-setuptools-instead-of-distutils.patc=
h \
            "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb =
b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
index da4f3047f9..97b59358f7 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -7,7 +7,6 @@ PV .=3D "+git${SRCREV}"
 SRCREV =3D "9520119376046aeff73804b5f1ea05d87a63f370"
 SRC_URI +=3D "git://github.com/behave/behave;branch=3Dmaster;protocol=3D=
https"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb=
 b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
index 68572d98b1..f88d43a21a 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
@@ -12,7 +12,6 @@ SRC_URI +=3D " \
         file://0001-Drop-ptests-fixtures-and-recorde_modes.patch \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3 ptest
=20
diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb=
 b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
index 45b1ff5145..288c4068cd 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://github.com/ReFirmLabs/binwalk;protoc=
ol=3Dhttps;branch=3Dmaster"
=20
 SRCREV =3D "cddfede795971045d99422bd7a9676c8803ec5ee"
=20
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb =
b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
index 47b3bcc62f..25c2d09990 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.3.bb
@@ -8,7 +8,6 @@ PYPI_SRC_URI =3D "git://github.com/hbldh/bleak.git;protoc=
ol=3Dhttps;branch=3Ddevelop"
=20
 inherit pypi python_poetry_core ptest-python-pytest
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN}-ptest +=3D " \
 	python3-pytest-asyncio \
diff --git a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.=
0.bb b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
index 7391c3ae2e..16aa5c3477 100644
--- a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
@@ -11,7 +11,6 @@ SRC_URI +=3D " \
=20
 SRCREV =3D "007f5aff5d1c817883385a5f61f742dd11776dc6"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3 ptest
=20
diff --git a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.b=
b b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
index 8710b59a95..6e6e3eba31 100644
--- a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
@@ -6,6 +6,5 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfcf6b249c26415=
40219a727f35d8d2c2"
 SRC_URI =3D "git://github.com/fedora-python/crypt_r.git;branch=3Dmain;pr=
otocol=3Dhttps"
 SRCREV =3D "b20e21d9f24d6fa17a6781bbc9f272ce38246eef"
=20
-S =3D "${UNPACKDIR}/git"
=20
 inherit python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb =
b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
index ab24870a2a..78402d50f4 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://github.com/cvxopt/cvxopt;protocol=3Dht=
tps;branch=3Dmaster"
=20
 SRCREV =3D "3b718ee560b3b97d6255c55f0ed7f64cb4b72082"
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} +=3D "lapack suitesparse"
 DEPENDS +=3D "lapack suitesparse"
diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/=
meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
index 141e6bfbaf..7c759613ee 100644
--- a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/dasbus-project/dasbus.git;p=
rotocol=3Dhttps;branch=3Dmast
 "
 SRCREV =3D "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3 ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb b/=
meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
index 59da4545aa..b72d7bd401 100644
--- a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/ldo/dbussy.git;branch=3Dmas=
ter;protocol=3Dhttps \
=20
 SRCREV =3D "37ede4242b48def73ada46c2747a4c5cae6abf45"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-dirty-equals_0.9=
.0.bb b/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
index f944d75e97..5fa86e1d8f 100644
--- a/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dirty-equals_0.9.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab599c188b4a=
314d2856b3a55030c75c"
=20
 SRC_URI[sha256sum] =3D "17f515970b04ed7900b733c95fd8091f4f85e52f1fb5f268=
757f25c858eb1f7b"
=20
-S =3D "${WORKDIR}/dirty_equals-${PV}"
+S =3D "${UNPACKDIR}/dirty_equals-${PV}"
=20
 inherit pypi python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb b/m=
eta-python/recipes-devtools/python/python3-gcovr_8.3.bb
index a9b29a4458..4f0b6bb150 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
@@ -10,7 +10,6 @@ SRC_URI =3D " \
 "
 SRCREV =3D "fe536afac4da31e86909191ef31708755ab8cf83"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit python_hatchling
=20
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb b/=
meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
index d265a20975..8331f9175a 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
@@ -18,4 +18,4 @@ SRC_URI +=3D "file://0001-Fix-host-contamination-of-inc=
lude-files.patch \
 inherit pkgconfig pypi python_setuptools_build_meta
=20
 # it's lowercase pyicu instead of ${PYPI_PACKAGE} in this version
-S =3D "${WORKDIR}/pyicu-${PV}"
+S =3D "${UNPACKDIR}/pyicu-${PV}"
diff --git a/meta-python/recipes-devtools/python/python3-importlib-metada=
ta_8.7.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metad=
ata_8.7.0.bb
index 7f5da81376..af716ffeb6 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.=
0.bb
@@ -10,7 +10,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 SRC_URI[sha256sum] =3D "d13b81ad223b890aa16c5471f2ac3056cf76c5f10f82d6f9=
292f0b415f389000"
=20
-S =3D "${WORKDIR}/importlib_metadata-${PV}"
+S =3D "${UNPACKDIR}/importlib_metadata-${PV}"
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
 RDEPENDS:${PN} +=3D "python3-zipp"
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b=
/meta-python/recipes-devtools/python/python3-inotify_git.bb
index f7df716654..e8d88250a3 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
@@ -12,7 +12,6 @@ SRC_URI =3D " \
=20
 SRCREV =3D "9be6a51d1660991562eefaaddefa757ca0e0e00f"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3 ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.=
0.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.=
bb
index 459726199e..99f583e717 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/explodinglabs/jsonrpcclient=
.git;branch=3Dmain;protocol
=20
 inherit python_setuptools_build_meta
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} +=3D "\
     python3-json \
diff --git a/meta-python/recipes-devtools/python/python3-keras-applicatio=
ns_1.0.8.bb b/meta-python/recipes-devtools/python/python3-keras-applicati=
ons_1.0.8.bb
index ba1819979b..ce965b3e43 100644
--- a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.=
8.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.=
8.bb
@@ -9,7 +9,6 @@ SRCREV ?=3D "3b180cb10eda683dda7913ecee2e6487288d292d"
=20
 inherit setuptools3
=20
-S =3D "${WORKDIR}/git"
=20
 BBCLASSEXTEND =3D "native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/=
meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
index 83dc97955c..4cdc773ba6 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3D=
https;branch=3Dstable \
=20
 SRCREV =3D "20d74dcd30f143abbd1aa94c76bafc5bd934d5bd"
=20
-S =3D "${WORKDIR}/git"
=20
 PACKAGES +=3D "${PN}-examples"
 FILES:${PN}-examples =3D "/usr/share/kivy-examples"
diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb b=
/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
index 2166e3257f..8a0e30133c 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
@@ -13,7 +13,6 @@ SRC_URI =3D " \
 SRCREV =3D "abcf929efb748c7846dd59007cbb807e108db311"
 PV .=3D "+git"
=20
-S =3D "${WORKDIR}/git"
 PEP517_SOURCE_PATH =3D "${S}/api/python"
=20
 export LIEF_BUILD_DIR =3D "${B}"
diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7=
.3.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
index 8c53d38ce3..26da91b16b 100644
--- a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6855782848d5=
72347212f667a2d637"
 SRC_URI =3D "git://git.kernel.org/pub/scm/libs/python/python-linux-procf=
s/python-linux-procfs.git;branch=3Dmain"
 SRCREV =3D "59ecd1ba018141a02ffe59c16a9346991dfd0d48"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17=
.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
index f52f0f8970..1022724814 100644
--- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} =3D " \
=20
 inherit setuptools3
=20
-S =3D "${WORKDIR}/lrparsing-${PV}"
+S =3D "${UNPACKDIR}/lrparsing-${PV}"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb=
 b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
index aacc32a6d6..b801c5d731 100644
--- a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
@@ -8,6 +8,5 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907=
fdace235a619d80314"
 SRCREV =3D "80681f6604e136e513550342f977edb98f5fc5ad"
 SRC_URI =3D "git://github.com/atdt/monotonic.git;branch=3Dmaster;protoco=
l=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb=
 b/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
index 433bfc4965..514eafb1b2 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
=20
 SRC_URI[sha256sum] =3D "988f264c330a17d63219c49dd2365bdaff97156be3ab6c5e=
aa204b45dca621e8"
=20
-S =3D "${WORKDIR}/moteus-${PV}"
+S =3D "${UNPACKDIR}/moteus-${PV}"
=20
 RDEPENDS:${PN} +=3D "\
     python3-can \
diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.4.4.=
bb b/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
index da8403af40..463d06338a 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
@@ -10,7 +10,6 @@ PV .=3D "+git"
=20
 SRCREV =3D "e77793a006e8c27ee96ae8b638a38c6413f87b9c"
 PYPI_SRC_URI =3D "git://github.com/aio-libs/multidict;branch=3Dmaster;pr=
otocol=3Dhttps"
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN}-ptest +=3D " \
     python3-objgraph \
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.=
bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index 0c3e6e9266..88a07f20ee 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "12d6e7511d4137555a3f6ea167ae846=
af2c7357b10bc6fa4f7c3968fc1
=20
 PYPI_SRC_URI =3D "https://files.pythonhosted.org/packages/39/15/0a6214e7=
6d4d32e7f663b109cf71fb22561c2be0f701d67f93950cd40542/paho_mqtt-${PV}.tar.=
gz"
=20
-S =3D "${WORKDIR}/paho_mqtt-${PV}"
+S =3D "${UNPACKDIR}/paho_mqtt-${PV}"
=20
 DEPENDS +=3D "python3-pytest-runner-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb=
 b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
index 4de3687c8f..b9b7a74e6e 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
@@ -60,7 +60,6 @@ RDEPENDS:${PN}-ptest +=3D " \
=20
 CVE_PRODUCT =3D "pillow"
=20
-S =3D "${WORKDIR}/git"
=20
 RPROVIDES:${PN} +=3D "python3-imaging"
=20
diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b=
/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index a4732993f8..c5f4c1c395 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -7,7 +7,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1475481f9ec754d758859bd2c75f6=
f6f"
=20
-S =3D "${WORKDIR}/git"
 B =3D "${S}"
=20
 SRCREV =3D "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0=
.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index f16fddf36f..1f372d49ba 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] =3D "5c5d0a3b48ceee0b48485e0c26037c0=
acd7d29765ca3fbb5cb3831d347
=20
 inherit pypi python_flit_core ptest-python-pytest
=20
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 RDEPENDS:${PN} =3D "\
     python3-core \
diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb b=
/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
index a661606b80..53996cc231 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.9.4.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "git://github.com/M0r13n/pyais;protocol=3Dhtt=
ps;branch=3Dmaster"
 PV .=3D "+git"
 SRCREV =3D "e7780f743b03c5e6ecc651fdeb209fa94e0e0250"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit python_setuptools_build_meta ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.b=
b b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
index 2b6a6c2c0e..cb9b61bd66 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
@@ -10,7 +10,6 @@ DEPENDS =3D "python3-dbus-native glib-2.0 dbus-glib lib=
xml2 atk gtk+ python3-pygob
 SRC_URI =3D "git://github.com/GNOME/pyatspi2.git;protocol=3Dhttps;branch=
=3Dmaster"
 SRCREV =3D "8c69016b38d0e4caaf4c986938ea3410fb7351b6"
=20
-S =3D "${WORKDIR}/git"=20
=20
 # Same restriction as gtk+
 inherit features_check setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.=
2.15.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.1=
5.bb
index bb2ccae794..fa4a74f925 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
@@ -9,6 +9,5 @@ SRC_URI =3D "git://github.com/pybind/pybind11_json;branch=
=3Dmaster;protocol=3Dhttps \
 DEPENDS +=3D "nlohmann-json python3-pybind11"
=20
 EXTRA_OECMAKE +=3D "-DPYBIND11_USE_CROSSCOMPILING=3DON"
-S =3D "${WORKDIR}/git"
=20
 inherit cmake python3native python3targetconfig
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.=
bb b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
index e853bb33d8..7d71767297 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "\
     git://github.com/pybind/pybind11.git;branch=3Dstable;protocol=3Dhttp=
s \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit cmake python_setuptools_build_meta
=20
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.=
bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
index c323534e12..47c077853a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
@@ -15,7 +15,6 @@ SRCREV =3D "bce81efdeac1cbefd0196b478a32aa2586bd595a"
 PV .=3D "+git"
 SRC_URI =3D "git://github.com/pydantic/pydantic;protocol=3Dhttps;branch=3D=
main"
=20
-S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb =
b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index cfdacf53bb..5a1934383e 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -14,7 +14,6 @@ SRC_URI =3D " \
=20
 inherit ptest setuptools3
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} =3D "python3-pygobject \
                   python3-io \
diff --git a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.b=
b b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
index 310366325e..58f571be3f 100644
--- a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
@@ -10,7 +10,6 @@ inherit python_setuptools_build_meta
 SRC_URI =3D "git:///github.com/russhousley/pyhsslms.git;branch=3Dmaster;=
protocol=3Dhttps"
 SRCREV =3D "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} +=3D " \
     python3-core \
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb =
b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
index 073e0cdb1c..04761471d3 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
@@ -12,7 +12,6 @@ SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=
=3Dmaintenance/3.3.x;protocol
=20
 inherit python_setuptools_build_meta ptest
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} +=3D "\
     python3-astroid \
diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.b=
b b/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
index 1937606642..a9d06c6f1f 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.13.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d503272f52c35=
147ec960cb56a03bf4"
=20
 SRC_URI =3D "git://github.com/Danielhiversen/pyMetno.git;protocol=3Dhttp=
s;branch=3Dmaster"
 SRCREV =3D "921812ddad3f147489916c3c7ab7fb7a80d8c646"
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.b=
b b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
index 297eecad0e..e05b63587f 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
@@ -20,7 +20,6 @@ SRCREV =3D "57db64c9f65ced05c71b8d786c1cedfaa2991597"
=20
 SRC_URI:append:mips =3D " file://0001-check-for-mips-targets-for-stat.st=
_dev-definitions.patch;patchdir=3D${UNPACKDIR}/cargo_home/bitbake/libsyst=
emd-0.5.0/"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit python_setuptools3_rust cargo-update-recipe-crates
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2=
.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
index 5a3b2f0ab2..41ebe44dbd 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
@@ -9,7 +9,6 @@ SRC_URI =3D " \
             git://github.com/tanbro/pyyaml-include;protocol=3Dhttps;bran=
ch=3Dmain \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit python_setuptools_build_meta ptest-python-pytest
=20
diff --git a/meta-python/recipes-devtools/python/python3-schedutils_0.6.b=
b b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
index 50868b9c40..dba3bcace7 100644
--- a/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
@@ -7,6 +7,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c23=
36e835926c2166c28b"
 SRC_URI =3D "git://git.kernel.org/pub/scm/libs/python/python-schedutils/=
python-schedutils.git;branch=3Dmain"
 SRCREV =3D "46469f425f9844f355f6496785ee1ce993b58747"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.=
bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
index b6680568b4..b706db8d49 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "https://github.com/nphilipp/${SRCNAME}/rel=
eases/download/${SRCNAME}-$
           "
 SRC_URI[sha256sum] =3D "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e=
3f5b25d9f8d4d10b"
=20
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
=20
 do_compile:prepend() {
     sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb b/m=
eta-python/recipes-devtools/python/python3-smbus_4.3.bb
index b305a128a2..4eb2037c5b 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D "eec464e42301d93586cbeca3845ed61bf=
f40f560670e5b35baec57301d
=20
 DEPENDS +=3D "i2c-tools"
=20
-S =3D "${WORKDIR}/i2c-tools-${PV}"
+S =3D "${UNPACKDIR}/i2c-tools-${PV}"
=20
 inherit setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
index 55b56616db..aa1281483a 100644
--- a/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
@@ -8,7 +8,6 @@ PYPI_SRC_URI =3D "git://github.com/hukkin/tomli-w.git;pro=
tocol=3Dhttps;branch=3Dmaster
=20
 inherit pypi python_flit_core ptest-python-pytest
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN}-ptest +=3D " \
         python3-tomli \
diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.=
12.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
index e9e799e168..09732fc865 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "git://github.com/theopolis/uefi-firmware-p=
arser;protocol=3Dhttps;branch
=20
 SRCREV =3D "0c5fb74bcecc0e5c80625c38130fe948c2a3656e"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb =
b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
index ace11be8e5..3a187f9386 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
@@ -12,7 +12,6 @@ SRCREV =3D "bcc1f26b2fe8fc962f5033c3a3a773425500789a"
 SRC_URI +=3D "git://github.com/GrahamDumpleton/wrapt;protocol=3Dhttps;br=
anch=3Dmaster \
 "
=20
-S =3D "${WORKDIR}/git"
=20
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest +=3D " \
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/=
meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index f8b7c9b5ff..4707e31854 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/python-excel/xlrd.git;bra=
nch=3Dmaster;protocol=3Dhttps \
 "
 SRCREV =3D "b8d573e11ec149da695d695c81a156232b89a949"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit ptest-python-pytest setuptools3
=20
diff --git a/meta-python/recipes-devtools/python3-piccata/python3-piccata=
_2.0.3.bb b/meta-python/recipes-devtools/python3-piccata/python3-piccata_=
2.0.3.bb
index fadcc32c24..af231ca908 100644
--- a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.=
bb
+++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.=
bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De664eb75e2791c=
2e505e6e1c274e6d4f"
 SRCREV =3D "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
 SRC_URI =3D "git://github.com/NordicSemiconductor/piccata.git;protocol=3D=
https;branch=3Dmaster"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
=20
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4=
.2.2.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.=
2.bb
index bed660ced4..dc57c864e4 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
@@ -18,7 +18,7 @@ SRC_URI +=3D "file://add-back-option-build-base.patch \
            "
 SRC_URI[sha256sum] =3D "5dbcb0650f67fdc2c5965795a255ffaa3d7b09fb149aa8da=
2d0d9aa44e38e2ba"
=20
-S =3D "${WORKDIR}/wxPython-${PV}"
+S =3D "${UNPACKDIR}/wxPython-${PV}"
=20
 inherit pypi setuptools3 pkgconfig features_check
=20
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui=
_2.6.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_=
2.6.0.bb
index b615ff2c92..79bee63d08 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.=
bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.=
bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 SRC_URI =3D "git://github.com/storaged-project/blivet-gui.git;branch=3Dm=
ain;protocol=3Dhttps"
 SRCREV =3D "7cec4bd48af4c8f7beb1a74bac751c3d520dedf1"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit features_check setuptools3
 REQUIRED_DISTRO_FEATURES =3D "x11 systemd gobject-introspection-data"
diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb=
 b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index 489733c767..4ffe68aab6 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -12,7 +12,6 @@ SRCREV =3D "69090778bccc5ed124342ba288597fbb2bfa9f39"
 SRC_URI =3D "git://github.com/gt3389b/python-cson.git;branch=3Dmaster;pr=
otocol=3Dhttps \
            file://0001-setup.py-Do-not-poke-at-git-describe-to-find-vers=
ion.patch"
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} =3D "python3-json"
=20
diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb =
b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
index 266b94c9d8..80f9881b58 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 inherit setuptools3_legacy
=20
-S =3D "${WORKDIR}/git"
=20
 SRC_URI =3D "git://github.com/rhinstaller/python-meh.git;protocol=3Dhttp=
s;branch=3Dmaster"
=20
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pyki=
ckstart_3.63.bb b/meta-python/recipes-extended/python-pykickstart/python3=
-pykickstart_3.63.bb
index c701e361b7..830e46a63c 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.63.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart=
_3.63.bb
@@ -37,4 +37,3 @@ SRCREV =3D "6e0d1238cb4696a9040072a5a28a706e5775c552"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
=20
-S =3D "${WORKDIR}/git"
diff --git a/meta-python/recipes-extended/tuna/tuna_0.19.bb b/meta-python=
/recipes-extended/tuna/tuna_0.19.bb
index ea0f157921..643e3a09ff 100644
--- a/meta-python/recipes-extended/tuna/tuna_0.19.bb
+++ b/meta-python/recipes-extended/tuna/tuna_0.19.bb
@@ -7,7 +7,6 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/tuna/tuna=
.git;branch=3Dmain"
=20
 SRCREV =3D "b972b8ce386c29bcbcd45029a617db3db9e5b6ca"
=20
-S =3D "${WORKDIR}/git"
=20
 RDEPENDS:${PN} +=3D " \
     python3-io \
diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2=
.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
index 0998643b2a..f0653006a3 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.18.2.bb
@@ -16,7 +16,6 @@ SRCREV =3D "3c7e281d97fd3e70b25f7ff4a001eabd56e375d7"
=20
 CVE_STATUS[CVE-2016-1000229] =3D "fixed-version: fixed since 2.2.1"
=20
-S =3D "${WORKDIR}/git"
=20
 do_install() {
     install -d ${D}${localstatedir}/www/openapi/static
diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git=
.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index 4dbf595c19..b93fa2d186 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -17,7 +17,6 @@ SRCREV =3D "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
=20
 PV =3D "0.1.2+git"
=20
-S =3D "${WORKDIR}/git"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
=20
diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb b/m=
eta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
index 6f2a2330ae..aca6d598f8 100644
--- a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "apache2 avahi"
 SRC_URI =3D "git://git.0pointer.net/mod_dnssd.git;protocol=3Dhttps;branc=
h=3Dmaster"
 SRCREV =3D "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
=20
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF =3D "--disable-lynx"
=20
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
index 9ef8c13b79..2b4ae41d95 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target =3D " \
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb4=
1c3"
 SRC_URI[sha256sum] =3D "88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b=
95f58f32f94c46ab"
=20
-S =3D "${WORKDIR}/httpd-${PV}"
+S =3D "${UNPACKDIR}/httpd-${PV}"
=20
 inherit autotools update-rc.d pkgconfig systemd multilib_script multilib=
_header
=20
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.6.9.bb
index cdb6fb605c..d593b7092b 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/monkey/monkey;branch=3D1.=
6;protocol=3Dhttps \
            file://monkey.init"
=20
 SRCREV =3D "7999b487fded645381d387ec0e057e92407b0d2c"
-S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/monkey/monkey/releases"
 UPSTREAM_CHECK_REGEX =3D "v(?P<pver>\d+(\.\d+)+).tar.gz"
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/met=
a-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index ec188cc482..9ff1772531 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -16,7 +16,6 @@ SRC_URI =3D "git://github.com/blueness/${BPN};branch=3D=
master;protocol=3Dhttps \
 UPSTREAM_CHECK_URI =3D "https://github.com/blueness/sthttpd/releases/"
 UPSTREAM_CHECK_REGEX =3D "v(?P<pver>\d+(\.\d+)+).tar.gz"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools update-rc.d systemd update-alternatives
=20
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb b/=
meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
index b896f4409a..f0e8b749aa 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "f881819a3b11e653b0212afaf0cc105=
db85c767715cb3f5852670f7fc3
 UPSTREAM_CHECK_URI =3D "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX =3D "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages=
.tar.xz"
=20
-S =3D "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
+S =3D "${UNPACKDIR}/phpMyAdmin-${PV}-all-languages"
=20
 inherit allarch
=20
diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webse=
rver/recipes-support/fcgi/fcgi_git.bb
index 61ef6073e0..03425c53c9 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
@@ -9,7 +9,6 @@ PV =3D "2.4.2"
 SRC_URI =3D "git://github.com/FastCGI-Archives/fcgi2.git;protocol=3Dhttp=
s;branch=3Dmaster \
           "
=20
-S =3D "${WORKDIR}/git"
=20
 inherit autotools
=20
diff --git a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb b/me=
ta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
index a9a8ce0541..7aa28885e4 100644
--- a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
+++ b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
@@ -13,7 +13,6 @@ SRC_URI =3D "git://github.com/gnosek/fcgiwrap.git;proto=
col=3Dhttps;branch=3D${BRANCH}
 BRANCH =3D "master"
 SRCREV =3D "99c942c90063c73734e56bacaa65f947772d9186"
=20
-S =3D "${WORKDIR}/git"
 CFLAGS =3D+ "-I${B}"
 EXTRA_OEMAKE =3D "VPATH=3D${S}"
=20
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb b/met=
a-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
index 4822f0cada..61a94f7bf4 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
@@ -10,7 +10,6 @@ DEPENDS =3D "gtk+3 glib-2.0 xfce4-dev-tools-native intl=
tool-native"
 SRC_URI =3D "git://github.com/ib/xarchiver.git;branch=3Dmaster;protocol=3D=
https"
 SRCREV =3D "55f923ebc623bcc8f53368543847350a23688189"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-x=
dg
=20
diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb b/meta=
-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
index 3e3301f748..880e73849c 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
@@ -11,4 +11,3 @@ SRC_URI =3D " \
     git://github.com/ncopa/${BPN}.git;branch=3Dmaster;protocol=3Dhttps \
 "
 SRCREV =3D "6d3282cc1734c305850d48f5bf4b4d94e88885e9"
-S =3D "${WORKDIR}/git"
diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-=
setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-dat=
etime-setter_3.32.2.bb
index 6bcfc4ba43..308da40c34 100644
--- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_=
3.32.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_=
3.32.2.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "git://github.com/schnitzeltony/xfce4-datet=
ime-setter.git;protocol=3Dhtt
 "
 SRCREV =3D "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
=20
-S =3D "${WORKDIR}/git"
=20
 inherit gettext meson features_check pkgconfig
=20
diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb b/meta=
-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
index 4b2071eb3f..8ba962fbd4 100644
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
@@ -9,7 +9,7 @@ inherit allarch gtk-icon-cache
 SRC_URI =3D "https://mirrors.dotsrc.org/mirrors/exherbo/111343-OpenZone-=
${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "db6fa6d0798aceb56998ce81382fa2246c77911d56b3b06e=
6aadee4cf5b4816e"
=20
-S =3D "${WORKDIR}/OpenZone"
+S =3D "${UNPACKDIR}/OpenZone"
=20
 do_compile() {
 }
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb b=
/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
index b2d74a3015..59de3b3a08 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.10.bb
@@ -22,7 +22,6 @@ SRC_URI =3D "git://gitlab.com/tagoh/imsettings.git;prot=
ocol=3Dhttps;branch=3Dmain \
           "
 SRCREV =3D "27d84c88831ef76397a15891ba0738ce9a83902a"
=20
-S =3D "${WORKDIR}/git"
=20
 do_configure:prepend() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutto=
n-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-close=
button-plugin_git.bb
index 2384682ecb..f2a5e544d5 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugi=
n_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugi=
n_git.bb
@@ -11,7 +11,6 @@ PV =3D "4.16.0"
=20
 SRC_URI =3D "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git=
;branch=3Dmaster;protocol=3Dhttps"
 SRCREV =3D "538f9acfc5d5019f5cde734d056bcc0c95da9b4c"
-S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D "--enable-maintainer-mode"
=20
--=20
2.49.0


