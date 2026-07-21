Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF41C44520
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 00:27:23 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12280.1784593637153683593
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 17:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DrxcgkPv;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so8408983a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 17:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784593636; x=1785198436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5eJf2GFjw2OfoRZGlnWPGzoyTrsN2GpT7i98K8xTLzo=;
        b=DrxcgkPv8eMMvEiIxoKT+ZM2heP65WSwsqf7dL0fVIuGcljdiM2LbO+n5+Y/zDRVWK
         QZqFOy7cjDjm2fXn5KA22TtzjRDppmCX1/5BEX8Fz1Iit+1rKxqOHL5RGMBX5J2Ay/kq
         7DwCQYAhl7tl6WVd9n3w0IvglpU+cHhQx4dSOtc3px9Nx09fZ+s4E3IrS2idk8+OxHGm
         CdSEimCuBWdz/0/n+FQAu1cgOV65YjSpSXRR+VIAGPS2Z5KczkMUgIuHEYEO4sK8dv2p
         fMP47K8JP5VaJRdf3xv+bDsoiiKvav/v6xtPPRD+h8LEAIWlOEfxWcPfW+h9WsLbt7Mr
         37hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784593636; x=1785198436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eJf2GFjw2OfoRZGlnWPGzoyTrsN2GpT7i98K8xTLzo=;
        b=djOxwMhNsDIY+66eJVzo8YJg4P6ATdawFuoVh63gqlZNLEPE6pBsABimEApHVJyN8p
         8RpmpGqrdQiXLsm8jUibKf0Gy2mRCOB2jXhxeIfQTKDmtEaoNDxzEYpilA2Lxx2RZckU
         3ZRmPU7twxudHBY11mmzn1v1aCK8eOg6vS86ox9PpbNQYYmamBwGMvv09RGH8zzFCJkR
         UJqgKMiyyh2q3Opom/+MN81K41DWylfNt4BaIEp+Zyu3JDQVPe2+2PYThtYRfGFlUA5O
         HBC5eCAGd1JS3n+1uiYLEO3PDNgODS9x+1qGf9lk4vViHgQh0aEaBwK18j/9HsM8M6bW
         ze5g==
X-Gm-Message-State: AOJu0YyNohTQeLo8w0CKV5RPMBss6nNoYdrZuOTbNnn5GTohAmq8tUo1
	sH5n1Y02liXxv45+1HA5ADbfDOumDatKyZJxYn2EJ0A3HkxiyjFGevG9tbRNoQ==
X-Gm-Gg: AfdE7cmUevlONRlUnOavtsnuQ9hjysDeCt8uMraXZzXj4FXuBO1+1YHGDKIc+uKeMle
	/+/RQNoSjOE3+4uERl8zrtQE7MWnzjPNJFi93mVv0Q7wCAeGgFQW9XrULtEWo+qSAyrfxAOXDj1
	h4Bi0FdooorKbQY2TYZDs4J1uc/GrZAy5ZyrW7drVuDJTThz46dXKhbYMV3ckasfBPcTK3CVBh8
	0TVgrw8Y9ZX6Evr4A3n492fG+diRkVj2BFi2YuD00exaNq+IYH7F2Xt6LcLDUyBceIkIqp3wEq7
	NC7BE7vBw9BG5i58rWLvf2tO9nyMEaZdxCtTIuRyhfvTei4BKNI7wuec3t79G5ceaXYJS9eWbxm
	DmCy2P0cDC7RYtrmC5WyslNPS2JIwX2N5noeIGgTxr9+U+lHbUY2WcbD8n5xNDvXX45WuU852Ur
	4zUQ2lr2VT27g9BOWHa5g8wM4APya2QoHVXXDCNpaxj3d1S6X5PANnUXrzv8hNd/JQ7uXDuh08v
	cNB7BCaQTDpDvKwBTjSoMokCbwVyPi9Q+oFlUpIz3XOTnIqRDo97cmoLhd4qShFOUDZbH/tUzGF
	eB+lAPA+PzpNDkKEimM=
X-Received: by 2002:a05:6a21:4a81:b0:3c3:8298:da0c with SMTP id adf61e73a8af0-3c3ad972c12mr18390563637.41.1784593633507;
        Mon, 20 Jul 2026 17:27:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm35098515c88.15.2026.07.20.17.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 17:27:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][PATCH] recipes: Convert licenses to SPDX expressions
Date: Mon, 20 Jul 2026 17:27:07 -0700
Message-ID: <20260721002707.687866-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 00:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128335

- Automatically convert all licenses to valid SPDX license expressions
  using convert-spdx-licenses.py

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ntfs-3g-ntfsprogs_2026.2.25.bb            |  2 +-
 .../recipes-filesystems/owfs/owfs_3.2p4.bb    |  2 +-
 .../recipes-support/fuse/fuse_2.9.9.bb        |  2 +-
 .../nilfs-utils/nilfs-utils_v2.2.11.bb        |  2 +-
 .../recipes-utils/xfsprogs/xfsprogs_7.0.1.bb  |  2 +-
 .../evolution-data-server.inc                 |  2 +-
 meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb    |  2 +-
 .../gnome-bluetooth3_3.34.5.bb                |  2 +-
 .../gnome-bluetooth/gnome-bluetooth_47.1.bb   |  2 +-
 .../gnome-desktop/gnome-desktop_44.4.bb       |  2 +-
 .../gnome-keyring/gnome-keyring_46.2.bb       |  2 +-
 .../gnome-menus/gnome-menus_3.38.1.bb         |  2 +-
 .../gnome-terminal/gnome-terminal_3.54.0.bb   |  2 +-
 .../gnome-tweaks/gnome-tweaks_40.10.bb        |  2 +-
 .../tracker/localsearch_3.11.1.bb             |  2 +-
 .../tracker/tinysparql_3.11.1.bb              |  2 +-
 .../recipes-gnome/yelp/yelp-xsl_42.1.bb       |  2 +-
 .../onboard/onboard_1.4.4-1.bb                |  2 +-
 .../recipes-devtools/klibc/klibc.inc          |  2 +-
 ...unhofer-FDK-AAC-Codec-Library-for-Android} |  0
 .../recipes-multimedia/aom/aom_3.13.1.bb      |  2 +-
 .../fdk-aac/fdk-aac_2.0.3.bb                  |  2 +-
 .../libavif/libavif_1.4.1.bb                  |  2 +-
 .../libcamera/libcamera_0.7.2.bb              |  2 +-
 .../libde265/libde265_1.0.18.bb               |  2 +-
 .../recipes-multimedia/mimic/mimic_1.3.0.1.bb | 18 +++++-----
 .../recipes-multimedia/minidlna/minidlna.inc  |  2 +-
 .../musicpd/libmpdclient_2.24.bb              |  2 +-
 .../opus-tools/opus-tools_0.2.bb              |  2 +-
 .../pipewire/pipewire_1.6.8.bb                |  2 +-
 .../schroedinger/schroedinger_1.0.11.bb       |  2 +-
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  2 +-
 .../tinycompress/tinycompress_1.2.13.bb       |  2 +-
 .../libmediaart/libmediaart-2.0_1.9.7.bb      |  2 +-
 .../autossh/autossh_1.4g.bb                   |  2 +-
 .../recipes-connectivity/bluepy/bluepy_git.bb |  2 +-
 .../freeradius/freeradius_3.2.10.bb           |  2 +-
 .../mbedtls/mbedtls_3.6.6.bb                  |  2 +-
 .../mosquitto/mosquitto_2.1.2.bb              |  2 +-
 .../networkmanager/networkmanager_1.56.0.bb   |  2 +-
 .../openthread/ot-br-posix_git.bb             |  2 +-
 .../openthread/ot-daemon_git.bb               |  2 +-
 .../openthread/wpantund_git.bb                |  2 +-
 .../samba/samba_4.23.8.bb                     |  2 +-
 .../sethdlc/sethdlc_1.18.bb                   |  2 +-
 .../tailscale/tailscale-licenses.inc          |  2 +-
 .../iscsi-initiator-utils_2.1.11.bb           |  2 +-
 .../recipes-daemons/postfix/postfix_3.11.5.bb |  2 +-
 .../libcoap/libcoap_4.3.5b.bb                 |  2 +-
 .../recipes-extended/dlm/dlm_4.3.0.bb         |  2 +-
 .../kronosnet/kronosnet_1.33.bb               |  2 +-
 .../recipes-protocols/frr/frr_10.6.1.bb       |  2 +-
 .../mdns/mdns_2881.120.11.bb                  |  2 +-
 .../net-snmp/net-snmp_5.9.5.2.bb              |  2 +-
 .../opcua/open62541_1.5.4.bb                  |  2 +-
 .../openl2tp/openl2tp_1.8.bb                  |  2 +-
 .../radiusclient-ng/radiusclient-ng_0.5.6.bb  |  2 +-
 .../recipes-support/cifs/cifs-utils_7.4.bb    |  2 +-
 .../cim-schema/cim-schema-docs_2.40.0.bb      |  2 +-
 .../cim-schema/cim-schema-exper_2.50.0.bb     |  2 +-
 .../cim-schema/cim-schema-final_2.40.0.bb     |  2 +-
 .../recipes-support/dnsmasq/dnsmasq_2.93.bb   |  2 +-
 .../recipes-support/dovecot/dovecot_2.4.4.bb  |  2 +-
 .../fetchmail/fetchmail_6.6.4.bb              |  2 +-
 .../recipes-support/fping/fping_5.5.bb        |  2 +-
 .../recipes-support/geoip/geoip-perl_1.51.bb  |  2 +-
 .../recipes-support/libldb/libldb_2.9.2.bb    |  2 +-
 .../libtalloc/libtalloc_2.4.4.bb              |  2 +-
 .../recipes-support/libtdb/libtdb_1.4.15.bb   |  2 +-
 .../linux-atm/linux-atm_2.5.2.bb              |  2 +-
 .../lksctp-tools/lksctp-tools_1.0.21.bb       |  2 +-
 .../recipes-support/ntpsec/ntpsec_1.2.4.bb    |  2 +-
 .../open-isns/open-isns_0.102.bb              |  2 +-
 .../open-vm-tools/open-vm-tools_13.0.10.bb    |  2 +-
 .../openipmi/openipmi_2.0.37.bb               |  2 +-
 .../rdma-core/rdma-core_62.0.bb               |  2 +-
 .../recipes-support/sngrep/sngrep_1.8.3.bb    |  2 +-
 .../recipes-support/spice/spice-gtk_0.42.bb   |  2 +-
 .../recipes-support/spice/usbredir_0.14.0.bb  |  2 +-
 .../traceroute/traceroute_2.1.6.bb            |  2 +-
 .../udpcast/udpcast_20250223.bb               |  2 +-
 .../recipes-dbs/mongodb/mongodb_git.bb        |  2 +-
 .../recipes-graphics/taisei/taisei_1.4.4.bb   |  2 +-
 .../coremark/coremark_git.bb                  |  2 +-
 .../dhrystone/dhrystone_2.1.bb                |  2 +-
 .../recipes-benchmark/glmark2/glmark2_git.bb  |  2 +-
 .../recipes-benchmark/iozone3/iozone3_508.bb  |  2 +-
 .../recipes-benchmark/linpack/linpack_1.0.bb  |  2 +-
 .../lmbench/lmbench_3.0-a9.bb                 |  2 +-
 .../nbench-byte/nbench-byte_2.2.3.bb          |  2 +-
 .../ramspeed/ramspeed_git.bb                  |  2 +-
 .../whetstone/whetstone_1.2.bb                |  2 +-
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb      |  2 +-
 .../recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  2 +-
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb |  2 +-
 meta-oe/recipes-connectivity/ace/ace_8.0.6.bb |  2 +-
 .../gattlib/gattlib_0.7.2.bb                  |  2 +-
 .../gensio/gensio_3.0.2.bb                    |  2 +-
 .../recipes-connectivity/libev/libev_4.33.bb  |  2 +-
 .../libimobiledevice_1.4.0.bb                 |  2 +-
 .../libmbim/libmbim_1.34.0.bb                 |  2 +-
 .../libnfs/libnfs_6.0.2.bb                    |  2 +-
 .../libqmi/libqmi_1.38.0.bb                   |  2 +-
 .../libwebsockets/libwebsockets_4.5.8.bb      |  2 +-
 .../modemmanager/modemmanager_1.24.2.bb       |  2 +-
 .../obex/openobex_1.7.2.bb                    |  2 +-
 .../obexftp/obexftp_0.24.2.bb                 |  2 +-
 .../paho-mqtt-c/paho-mqtt-c_1.3.16.bb         |  2 +-
 .../paho-mqtt-cpp/paho-mqtt-cpp_1.6.0.bb      |  2 +-
 .../transmission/transmission_4.1.1.bb        |  2 +-
 .../usbmuxd/usbmuxd_git.bb                    |  2 +-
 .../recipes-core/dbus-cxx/dbus-cxx_2.6.2.bb   |  2 +-
 .../glib-2.0/glibmm-2.68_2.88.0.bb            |  2 +-
 .../recipes-core/glib-2.0/glibmm_2.66.8.bb    |  2 +-
 meta-oe/recipes-core/ndctl/ndctl_v85.bb       |  2 +-
 meta-oe/recipes-core/safec/safec_3.9.1.bb     |  2 +-
 .../systemd/systemd-repart-native_257.6.bb    |  2 +-
 .../cryptsetup/cryptsetup_2.8.6.bb            |  2 +-
 .../leancrypto/leancrypto_1.7.2.bb            |  2 +-
 .../recipes-crypto/libkcapi/libkcapi_1.5.0.bb |  2 +-
 .../monocypher/monocypher_4.0.3.bb            |  2 +-
 .../pkcs11-helper/pkcs11-helper_1.31.0.bb     |  2 +-
 .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |  2 +-
 .../recipes-dbs/rocksdb/rocksdb_10.10.1.bb    |  2 +-
 .../android-libboringssl_14.0.0+r45.bb        |  2 +-
 .../android-tools/android-tools_35.0.2.bb     |  2 +-
 .../apitrace/apitrace_13.0.bb                 |  2 +-
 .../concurrencykit/concurrencykit_git.bb      |  2 +-
 meta-oe/recipes-devtools/fex/fex_2607.bb      |  2 +-
 .../geany/geany-plugins_2.0.bb                |  2 +-
 .../recipes-devtools/glade/glade_3.36.0.bb    |  2 +-
 meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb  |  2 +-
 .../gst-editing-services_1.22.12.bb           |  2 +-
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  2 +-
 .../recipes-devtools/lemon/lemon_3.44.2.bb    |  2 +-
 .../libabigail/libabigail_2.10.bb             |  2 +-
 .../libsombok3/libsombok3_2.4.0.bb            |  2 +-
 .../recipes-devtools/nodejs/nodejs_24.18.0.bb |  2 +-
 meta-oe/recipes-devtools/perfetto/perfetto.bb |  2 +-
 .../perl/ipc-run_20231003.0.bb                |  2 +-
 .../perl/libconfig-general-perl_2.67.bb       |  2 +-
 .../perl/libdbi-perl_1.650.bb                 |  2 +-
 .../perl/libdev-checklib-perl_1.16.bb         |  2 +-
 .../perl/libio-pty-perl_1.31.bb               |  2 +-
 .../perl/libjson-perl_4.05000.bb              |  2 +-
 .../perl/libparse-yapp-perl_1.21.bb           |  2 +-
 .../perl/libpcsc-perl_1.4.15.bb               |  2 +-
 .../perl/libperlio-gzip-perl_0.20.bb          |  2 +-
 .../protobuf/protobuf_6.33.6.bb               |  2 +-
 .../python/python3-apt_3.1.0.bb               |  2 +-
 .../spdm-utils/spdm-utils_0.7.2.bb            |  2 +-
 .../squashfs-tools-ng_1.3.2.bb                |  2 +-
 .../suitesparse/suitesparse_5.10.1.bb         |  2 +-
 .../xmlrpc-c/xmlrpc-c_1.64.0.bb               |  2 +-
 meta-oe/recipes-extended/7zip/7zip_26.02.bb   |  2 +-
 .../boinc/boinc-client_7.20.5.bb              |  2 +-
 meta-oe/recipes-extended/byacc/byacc.inc      |  2 +-
 .../recipes-extended/byacc/byacc_20260126.bb  |  2 +-
 .../collectd/collectd_5.12.0.bb               |  2 +-
 .../docopt.cpp/docopt.cpp_git.bb              |  2 +-
 .../recipes-extended/hwloc/hwloc_2.14.0.bb    |  2 +-
 .../recipes-extended/libidn/libidn_1.43.bb    |  4 +--
 .../libimobiledevice/libplist_2.7.0.bb        |  2 +-
 .../libimobiledevice/libplist_git.bb          |  2 +-
 .../liblockfile/liblockfile_1.17.bb           |  2 +-
 .../libx86-1/libx86-1_1.1.1.bb                |  2 +-
 meta-oe/recipes-extended/lprng/lprng_3.9.0.bb |  2 +-
 .../minifi-cpp/minifi-cpp_0.99.2.bb           |  2 +-
 .../pam/pam-ssh-agent-auth_0.10.3.bb          |  2 +-
 .../parallel/parallel_20260522.bb             |  2 +-
 .../perl/libfile-fnmatch-perl_0.02.bb         |  2 +-
 meta-oe/recipes-extended/qad/qad_git.bb       |  2 +-
 meta-oe/recipes-extended/redis/redis_8.8.0.bb |  2 +-
 .../rsyslog/rsyslog_8.2604.0.bb               |  2 +-
 .../recipes-extended/s-nail/s-nail_14.9.25.bb |  2 +-
 .../recipes-extended/sanlock/sanlock_5.1.0.bb |  2 +-
 .../simpleiot/simpleiot-licenses.inc          |  2 +-
 .../socketcan/can-utils_2025.01.bb            |  2 +-
 .../socketcan/socketcand_git.bb               |  2 +-
 .../recipes-extended/sysdig/sysdig_0.39.0.bb  |  2 +-
 .../wxwidgets/wxwidgets_3.2.8.1.bb            |  2 +-
 .../recipes-gnome/atk/atkmm-2.36_2.36.3.bb    |  2 +-
 meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb     |  2 +-
 .../gnome-doc-utils-stub_1.0.bb               |  2 +-
 meta-oe/recipes-gnome/gtk+/gtk+.inc           |  2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb   |  2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb   |  2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb    |  2 +-
 .../fontforge/fontforge_20251009.bb           |  2 +-
 .../libsdl3/libsdl3_3.4.12.bb                 |  2 +-
 .../recipes-graphics/libtsm/libtsm_4.6.0.bb   |  2 +-
 .../pango/pangomm-2.48_2.56.1.bb              |  2 +-
 .../recipes-graphics/pango/pangomm_2.46.4.bb  |  2 +-
 meta-oe/recipes-graphics/tslib/tslib_1.24.bb  |  2 +-
 .../ttf-fonts/ttf-arphic-uming_20080216.bb    |  2 +-
 .../ttf-fonts/ttf-pt-sans_1.1.bb              |  2 +-
 .../ttf-fonts/ttf-sazanami_20040629.bb        |  2 +-
 .../ttf-fonts/ttf-tlwg_0.6.1.bb               |  2 +-
 .../ttf-fonts/ttf-ubuntu-font-family_0.83.bb  |  2 +-
 .../ttf-fonts/ttf-vlgothic_20220612.bb        |  2 +-
 .../xcursorgen/xcursorgen_1.0.9.bb            |  2 +-
 .../xorg-driver/xf86-video-armsoc_1.4.1.bb    |  2 +-
 .../xorg-font/font-cursor-misc_1.0.4.bb       |  2 +-
 .../xorg-font/font-misc-misc_1.1.3.bb         |  2 +-
 .../broadcom-bt-firmware_12.0.1.1105_p3.bb    |  2 +-
 meta-oe/recipes-kernel/kpatch/kpatch.inc      |  2 +-
 .../libtracefs/libtracefs_1.8.3.bb            |  2 +-
 .../minicoredumper/minicoredumper_2.0.8.bb    |  2 +-
 .../recipes-kernel/oprofile/oprofile_1.4.0.bb |  2 +-
 .../trace-cmd/trace-cmd_3.1.5.bb              |  2 +-
 .../audiofile/audiofile_0.3.6.bb              |  2 +-
 .../recipes-multimedia/jack/jack_1.9.22.bb    |  2 +-
 .../libmodplug/libmodplug_0.8.9.0.bb          |  2 +-
 .../sound-theme-freedesktop_0.8.bb            |  2 +-
 .../v4l2apps/v4l-utils_1.32.0.bb              |  2 +-
 .../libspatialite/libspatialite_5.1.0.bb      |  2 +-
 meta-oe/recipes-security/audit/audit_4.1.4.bb |  2 +-
 .../keyutils/keyutils_1.6.3.bb                |  2 +-
 meta-oe/recipes-security/nmap/nmap_7.99.bb    |  2 +-
 .../recipes-security/softhsm/softhsm_2.7.0.bb |  2 +-
 meta-oe/recipes-shells/mksh/mksh_59c.bb       |  2 +-
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb       |  2 +-
 meta-oe/recipes-support/anthy/anthy_9100h.bb  |  2 +-
 .../canonical-multitouch/frame_2.5.0.bb       |  2 +-
 .../canonical-multitouch/geis_2.2.17.bb       |  2 +-
 .../canonical-multitouch/grail_3.1.1.bb       |  2 +-
 meta-oe/recipes-support/cmark/cmark_0.31.2.bb |  2 +-
 meta-oe/recipes-support/colord/colord.inc     |  2 +-
 .../composefs/composefs_1.0.8.bb              |  2 +-
 .../cpp-netlib/cpp-netlib_git.bb              |  2 +-
 .../crucible/crucible_2025.05.28.bb           |  2 +-
 .../daemontools/daemontools_0.76.bb           |  2 +-
 meta-oe/recipes-support/fltk/fltk.inc         |  2 +-
 meta-oe/recipes-support/fuse/fuse3_3.18.2.bb  |  2 +-
 .../recipes-support/gsoap/gsoap_2.8.142.bb    |  2 +-
 .../recipes-support/hidapi/hidapi_0.15.0.bb   |  2 +-
 .../hunspell/hunspell-dictionaries.bb         | 36 +++++++++----------
 .../hunspell/hunspell_1.7.3.bb                |  2 +-
 .../recipes-support/imx-cst/imx-cst_3.4.1.bb  |  2 +-
 .../recipes-support/libb64/libb64_2.0.0.1.bb  |  2 +-
 .../libcereal/libcereal_1.3.2.bb              |  2 +-
 .../libeigen/libeigen_3.4.1.bb                |  8 ++---
 .../recipes-support/libftdi/libftdi_1.5.bb    |  2 +-
 .../libgpiod/libgpiod_2.3.1.bb                |  2 +-
 .../libiodbc/libiodbc_3.52.16.bb              |  2 +-
 .../libjs/libjs-jquery_3.3.1.bb               |  2 +-
 .../libjs/libjs-sizzle_1.10.18.bb             |  2 +-
 .../recipes-support/libnice/libnice_0.1.23.bb |  2 +-
 .../recipes-support/libnvme/libnvme_1.16.2.bb |  2 +-
 .../libosinfo/libosinfo_1.12.0.bb             |  2 +-
 .../recipes-support/libraw/libraw_0.22.1.bb   |  2 +-
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |  2 +-
 .../recipes-support/liburing/liburing_2.12.bb |  2 +-
 .../recipes-support/libusbg/libusbg_git.bb    |  2 +-
 .../recipes-support/libusbgx/libusbgx_git.bb  |  2 +-
 .../libutempter/libutempter_1.2.2-alt1.bb     |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
 .../recipes-support/mailcap/mailcap_2.1.54.bb |  2 +-
 .../media-types/media-types_14.0.0.bb         |  2 +-
 meta-oe/recipes-support/mg/mg_20230501.bb     |  2 +-
 meta-oe/recipes-support/nspr/nspr_4.39.bb     |  2 +-
 meta-oe/recipes-support/nss/nss_3.125.bb      |  2 +-
 meta-oe/recipes-support/pcp/pcp.inc           |  2 +-
 .../pcsc-lite/pcsc-lite_2.5.0.bb              |  4 +--
 .../poppler/poppler-data_0.4.12.bb            |  2 +-
 .../recipes-support/procmail/procmail_3.24.bb |  2 +-
 .../recipes-support/raptor2/raptor2_2.0.16.bb |  2 +-
 .../read-edid/read-edid_3.0.2.bb              |  2 +-
 .../recipes-support/remmina/remmina_1.4.43.bb |  2 +-
 meta-oe/recipes-support/rtkit/rtkit_0.14.bb   |  2 +-
 .../sg3-utils/sg3-utils_1.48.bb               |  2 +-
 .../recipes-support/srecord/srecord_1.65.0.bb |  2 +-
 .../recipes-support/synergy/synergy_git.bb    |  2 +-
 .../syslog-ng/syslog-ng_4.12.0.bb             |  2 +-
 .../recipes-support/udisks/udisks2_2.10.2.bb  |  2 +-
 meta-oe/recipes-support/uim/uim_1.9.6.bb      |  2 +-
 .../uriparser/uriparser_1.0.2.bb              |  2 +-
 .../utf8proc/utf8proc_2.11.3.bb               |  2 +-
 .../webkitgtk/webkitgtk3_2.52.5.bb            |  2 +-
 .../xdp-tools/xdp-tools_1.6.3.bb              |  2 +-
 .../rtc-testbench/rtc-testbench_5.4.bb        |  2 +-
 .../cpan-requirements-dynamic_0.003.bb        |  2 +-
 .../libalgorithm-diff-perl_1.201.bb           |  2 +-
 .../libauthen/libauthen-sasl-perl_2.2000.bb   |  2 +-
 .../libcapture/libcapture-tiny-perl_0.50.bb   |  2 +-
 .../recipes-perl/libcgi/libcgi-perl_4.72.bb   |  2 +-
 .../libclass-method-modifiers-perl_2.15.bb    |  2 +-
 .../libcompress-raw-bzip2-perl_2.218.bb       |  2 +-
 .../libcompress-raw-lzma-perl_2.221.bb        |  2 +-
 .../libcompress-raw-zlib-perl_2.222.bb        |  2 +-
 .../libconfig-tiny-perl_2.30.bb               |  2 +-
 .../libconfig-autoconf-perl_0.320.bb          |  2 +-
 .../libcrypt-openssl-guess-perl_0.15.bb       |  2 +-
 .../libcrypt-openssl-random-perl_0.17.bb      |  2 +-
 .../libcrypt-openssl-rsa-perl_0.41.bb         |  2 +-
 .../libcurses/libcurses-perl_1.46.bb          |  2 +-
 .../libdb/libdbd-sqlite-perl_1.78.bb          |  2 +-
 .../libdevel-globaldestruction-perl_0.14.bb   |  2 +-
 .../libdigest/libdigest-hmac-perl_1.05.bb     |  2 +-
 .../libdigest/libdigest-sha1-perl_2.13.bb     |  2 +-
 .../recipes-perl/libenv/libenv-perl_1.04.bb   |  2 +-
 .../liberror/liberror-perl_0.17030.bb         |  2 +-
 .../libextutils-config-perl_0.010.bb          |  2 +-
 .../libextutils-cppguess-perl_0.27.bb         |  2 +-
 .../libextutils-helpers-perl_0.028.bb         |  2 +-
 .../libextutils-installpaths-perl_0.015.bb    |  2 +-
 .../libextutils-parsexs-perl_3.63.bb          |  2 +-
 .../libfile/libfile-slurp-perl_9999.32.bb     |  2 +-
 .../libfile/libfile-slurper-perl_0.014.bb     |  2 +-
 .../libhtml/libhtml-parser-perl_3.85.bb       |  2 +-
 .../libhtml/libhtml-tree-perl_5.07.bb         |  2 +-
 .../libimport/libimport-into-perl_1.002005.bb |  2 +-
 .../libio/libio-compress-lzma-perl_2.217.bb   |  2 +-
 .../libio/libio-compress-perl_2.223.bb        |  2 +-
 .../libio/libio-socket-ssl-perl_2.099.bb      |  2 +-
 .../libio/libio-stringy-perl_2.111.bb         |  2 +-
 .../libipc/libipc-signal-perl_1.00.bb         |  2 +-
 .../liblocale/liblocale-gettext-perl_1.07.bb  |  2 +-
 .../libmime/libmime-base32-perl_1.303.bb      |  2 +-
 .../libmime/libmime-charset-perl_1.013.1.bb   |  2 +-
 .../libmime/libmime-types-perl_2.30.bb        |  2 +-
 .../libmodule-build-tiny-perl_0.053.bb        |  2 +-
 .../libmodule/libmodule-pluggable-perl_6.3.bb |  2 +-
 .../libmodule/libmodule-runtime-perl_0.016.bb |  2 +-
 .../libmoo/libmoo-perl_2.005005.bb            |  2 +-
 .../libnet/libnet-idn-encode_2.500.bb         |  2 +-
 .../libnet/libnet-ldap-perl_0.68.bb           |  2 +-
 .../libnet/libnet-libidn-perl_0.12.bb         |  2 +-
 .../libnet/libnet-telnet-perl_3.05.bb         |  2 +-
 .../libproc/libproc-waitstat-perl_1.00.bb     |  2 +-
 .../librole/librole-tiny-perl_2.002005.bb     |  2 +-
 .../libstatgrab/libunix-statgrab_0.112.bb     |  2 +-
 .../libstrictures-perl_2.000006.bb            |  2 +-
 ...bsub-exporter-progressive-perl_0.001013.bb |  2 +-
 .../libsub/libsub-uplevel-perl_0.2800.bb      |  2 +-
 .../libterm/libterm-readkey-perl_2.38.bb      |  2 +-
 .../libtest/libtest-deep-perl_1.205.bb        |  2 +-
 .../libtest/libtest-harness-perl_3.52.bb      |  2 +-
 .../libtest/libtest-warn-perl_0.37.bb         |  2 +-
 .../libtext/libtext-charwidth-perl_0.04.bb    |  2 +-
 .../libtext/libtext-diff-perl_1.45.bb         |  2 +-
 .../libtext/libtext-iconv-perl_1.7.bb         |  2 +-
 .../libtext/libtext-wrapi18n-perl_0.06.bb     |  2 +-
 .../libunicode-linebreak-perl_2019.001.bb     |  2 +-
 .../recipes-perl/liburi/liburi-perl_5.35.bb   |  2 +-
 .../libxml-filter-buffertext-perl_1.01.bb     |  2 +-
 .../libxml/libxml-libxml-perl_2.0213.bb       |  2 +-
 .../libxml/libxml-sax-writer-perl_0.57.bb     |  2 +-
 ...python3-aws-iot-device-sdk-python_1.5.2.bb |  2 +-
 .../python/python3-cmake_4.4.0.bb             |  2 +-
 .../python/python3-contextlib2_21.6.0.bb      |  2 +-
 .../python/python3-crc32c_2.3.bb              |  2 +-
 .../python/python3-daemon_3.1.2.bb            |  2 +-
 .../python/python3-dateutil_2.9.0.bb          |  2 +-
 .../python/python3-flask-bootstrap_3.3.7.1.bb |  2 +-
 .../python/python3-gevent_26.5.0.bb           |  2 +-
 .../python/python3-gmpy2_2.3.1.bb             |  2 +-
 .../python/python3-greenlet_3.5.3.bb          |  2 +-
 .../python/python3-grpcio_1.78.0.bb           |  2 +-
 .../python/python3-libusb1_3.4.0.bb           |  2 +-
 .../python/python3-mypy_1.17.0.bb             |  2 +-
 .../python/python3-odfpy_1.4.1.bb             |  2 +-
 .../python/python3-outcome_1.3.0.post0.bb     |  2 +-
 .../python/python3-paho-mqtt_2.1.0.bb         |  2 +-
 .../python/python3-pocketsphinx_5.0.4.bb      |  2 +-
 .../python/python3-protobuf_6.33.6.bb         |  2 +-
 .../python/python3-pycurl_7.47.0.bb           |  2 +-
 .../python/python3-pyroute2_0.9.6.bb          |  2 +-
 .../python/python3-pyscaffold_4.6.bb          |  2 +-
 .../python/python3-sniffio_1.3.1.bb           |  2 +-
 .../python/python3-tqdm_4.68.4.bb             |  2 +-
 .../python/python3-trafaret-config_2.0.2.bb   |  2 +-
 .../python/python3-trio_0.33.0.bb             |  2 +-
 .../python/python3-uefi-firmware_1.16.bb      |  2 +-
 .../python/python3-ujson_5.13.0.bb            |  2 +-
 .../python/python3-uritemplate_4.2.0.bb       |  2 +-
 .../python3-xstatic-font-awesome_6.2.1.2.bb   |  2 +-
 .../python3-reedsolo_2.1.0b1.bb               |  2 +-
 .../python3-wxgtk4/python3-wxgtk4_4.2.5.bb    |  2 +-
 .../phpmyadmin/phpmyadmin_5.2.3.bb            |  2 +-
 .../recipes-php/xdebug/xdebug_3.5.3.bb        |  2 +-
 .../xfce4-screensaver_4.20.2.bb               |  2 +-
 .../recipes-xfce/garcon/garcon_4.21.0.bb      |  2 +-
 383 files changed, 412 insertions(+), 412 deletions(-)
 rename meta-multimedia/licenses/{Fraunhofer_FDK_AAC_Codec_Library_for_Android => Fraunhofer-FDK-AAC-Codec-Library-for-Android} (100%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb
index b3193d27b3..94ec32dba1 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS drive
 HOMEPAGE = "http://www.ntfs-3g.org/"
 DEPENDS = "fuse libgcrypt"
 PROVIDES = "ntfsprogs ntfs-3g"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
index 94379939de..924d774ae7 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "OWFS is an easy way to use the powerful 1-wire system of Dallas/M
 HOMEPAGE = "http://www.owfs.org/"
 SECTION = "console/network"

-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=628b867016631792781a8735a04760e5 \
                     file://COPYING.LIB;md5=9021b7435efdd9fb22beef8291134099"

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 094ed8c8ad..506291dab5 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
               "
 HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"

diff --git a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
index a09f01282f..b68f68a02e 100644
--- a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
+++ b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
@@ -1,7 +1,7 @@
 SUMMARY = "nilfs-utils is a set of utilities for managing the NILFS filesystem."
 HOMEPAGE = "https://nilfs.sourceforge.io/"

-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=385034ac639a62b8415db9814582ee98"
 SRC_URI = "git://github.com/nilfs-dev/nilfs-utils.git;protocol=https;branch=v2.2.y;tag=${PV} \
            file://0001-configure.ac-Add-knob-to-define-base-sbindir.patch"
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb
index 129b30583c..5116072701 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "XFS Filesystem Utilities"
 HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LICENSE:libhandle = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 4e91372c3a..31db864bcd 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -2,7 +2,7 @@ SUMMARY = "Evolution database backend server"
 HOMEPAGE = "http://www.gnome.org/projects/evolution/"
 BUGTRACKER = "https://bugzilla.gnome.org/"

-LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later"
+LICENSE = "LGPL-2.0-only AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                     file://src/camel/camel.h;endline=24;md5=4150eec6c74e359401d8ed7f266984b9 \
                     file://src/libedataserver/e-data-server-util.h;endline=20;md5=fa7fca32c1bf07f87a52094b414fe7a8 \
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
index c41fa6e93a..1330342426 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Javascript bindings for GNOME"
-LICENSE = "MIT & LGPL-2.0-or-later"
+LICENSE = "LGPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8dcea832f6acf45d856abfeb2d51ec48"


diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
index 8490e3d161..9c496af7fe 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME bluetooth manager"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
index 791e5752e8..ae72e6a115 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME bluetooth manager"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
index 2fe66b9e52..204c1f2cc9 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNOME library for reading .desktop files"
 SECTION = "x11/gnome"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
index b723a0dd71..fcff02a4b3 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/gnome"

-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.38.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.38.1.bb
index e5b7f3db07..6409541051 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.38.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.38.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNOME menus"
 SECTION = "x11/gnome"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
index 332c2c5423..489e1af7ce 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME terminal"
-LICENSE = "GPL-3.0-only & GFDL-1.3"
+LICENSE = "GFDL-1.3 AND GPL-3.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
     file://COPYING.GFDL;md5=a22d0be1ce2284b67950a4d1673dd1b0 \
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
index d0f00a85e6..6395a34f85 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME tweaks: Advanced options for GNOME 3 session"
-LICENSE = "GPL-3.0-only & CC0-1.0"
+LICENSE = "CC0-1.0 AND GPL-3.0-only"
 LIC_FILES_CHKSUM = " \
     file://LICENSES/CC0-1.0;md5=65d3616852dbf7b1a6d4b53b00626032 \
     file://LICENSES/GPL-3.0;md5=9eef91148a9b14ec7f9df333daebc746 \
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb b/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
index 48d5e6b39f..4353ff1373 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tracker miners and metadata extractors"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=ee31012bf90e7b8c108c69f197f3e3a4 \
     file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb b/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb
index 5ddc309293..a80d78047f 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.11.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tracker is a file search engine"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=ee31012bf90e7b8c108c69f197f3e3a4 \
     file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
index 5a8089e013..1ea4040490 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "XSL stylesheets for the yelp help browser"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=8ca13a5a6972ac1620a1e42a3dacd774 \
     file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb
index a069fb692e..14ccf59e27 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb
@@ -5,7 +5,7 @@ that cannot use a hardware keyboard. It has been designed with simplicity \
 in mind and can be used right away without the need of any configuration, \
 as it can read the keyboard layout from the X server."

-LICENSE = "GPL-3.0-or-later & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e \
                     file://COPYING.BSD3;md5=f56403ae5b2d6b82ad136d753c05a82e \
                    "
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 4e8710f7bb..24f5ee0c7b 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "klibc is intended to be a minimalistic libc subset for \
 use with initramfs.  It is deliberately written for small size, \
 minimal entaglement, and portability, not speed."
 SECTION = "libs"
-LICENSE = "BSD-3-Clause & GPL-2.0-only & MIT & Zlib"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND MIT AND Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 DEPENDS = "linux-libc-headers perl-native"

diff --git a/meta-multimedia/licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android b/meta-multimedia/licenses/Fraunhofer-FDK-AAC-Codec-Library-for-Android
similarity index 100%
rename from meta-multimedia/licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android
rename to meta-multimedia/licenses/Fraunhofer-FDK-AAC-Codec-Library-for-Android
diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
index b157dc79ec..e4875d2ced 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.13.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Alliance for Open Media - AV1 Codec Library"
 DESCRIPTION = "Alliance for Open Media AV1 codec library"

-LICENSE = "BSD-2-Clause & AOM-Patent-License-1.0"
+LICENSE = "BSD-2-Clause AND LicenseRef-AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=a111d47497d3bb49e04eef71377eb8ba \
                    "
diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb
index 0fb9d16a9b..1168161a93 100644
--- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb
@@ -7,7 +7,7 @@ for digital audio."

 HOMEPAGE = "https://www.iis.fraunhofer.de/en/ff/amm/impl.html"

-LICENSE = "Fraunhofer_FDK_AAC_Codec_Library_for_Android"
+LICENSE = "LicenseRef-Fraunhofer-FDK-AAC-Codec-Library-for-Android"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
index 0fc0b0dfc8..c4dde341b8 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "This library aims to be a friendly, portable C implementation of the
 HOMEPAGE = "https://github.com/AOMediaCodec/libavif"
 SECTION = "libs"
 # Most is the code is under BSD-2, but libyuv is under BSD-3, and iccjpeg is under IJG
-LICENSE = "BSD-2-Clause & BSD-3-Clause & IJG"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND IJG"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51549db0941829faeedcc86efec2f4c0"

 SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=main;tag=v${PV};name=libavif"
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
index c4ef575ff9..3199ad8a4f 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Linux libcamera framework"
 HOMEPAGE = "https://libcamera.org/"
 SECTION = "libs"

-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"

 LIC_FILES_CHKSUM = "\
     file://LICENSES/GPL-2.0-or-later.txt;md5=fed54355545ffd980b814dab4a3b312c \
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
index 00fc16c0ce..4d1795abb9 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
@@ -4,7 +4,7 @@ simple integration into other software."
 HOMEPAGE = "http://www.libde265.org/"
 SECTION = "libs/multimedia"

-LICENSE = "LGPL-3.0-only & MIT"
+LICENSE = "LGPL-3.0-only AND MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index b9093d19bb..93c19a1f34 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -4,15 +4,15 @@ HOMEPAGE = "https://mimic.mycroft.ai/"
 SECTION = "multimedia"

 # "Mimic is available under permissive BSD-like licenses"
-LICENSE = "MIT & \
-           PD & \
-           CMU-Tex & \
-           rateconv & \
-           BSD-2-Clause & \
-           BSD-3-Clause & \
-           flite & \
-           (flite & Sun) & \
-           BellBird & \
+LICENSE = "MIT AND \
+           PD AND \
+           CMU-Tex AND \
+           rateconv AND \
+           BSD-2-Clause AND \
+           BSD-3-Clause AND \
+           flite AND \
+           (flite AND Sun) AND \
+           BellBird AND \
            Apache-2.0 \
            "
 LIC_FILES_CHKSUM = "file://COPYING;md5=a2c2c7371b58b9cdeae0dc68846fe9f1"
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index 0dd297098c..f932418c22 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim of \
 being fully compliant with DLNA/UPnP-AV clients."
-LICENSE = "GPL-2.0-only|BSD-3-Clause"
+LICENSE = "GPL-2.0-only OR BSD-3-Clause"
 DEPENDS = "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag libvorbis"

 # because it depends on libav which has commercial flag
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
index 3b12efa2e3..2e59d7624d 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
@@ -1,5 +1,5 @@
 SUMMARY = "C client library for the Music Player Daemon"
-LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=63d6ee386b8aaba70b1bf15a79ca50f2 \
                     file://LICENSES/BSD-3-Clause.txt;md5=954f4d71a37096249f837652a7f586c0"
 HOMEPAGE = "https://www.musicpd.org/libs/libmpdclient/"
diff --git a/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb b/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
index 92df308ce0..30dcb40ed9 100644
--- a/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
+++ b/meta-multimedia/recipes-multimedia/opus-tools/opus-tools_0.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Opus Audio Tools"
 HOMEPAGE = "http://www.opus-codec.org/"

-LICENSE = "BSD-2-Clause & GPL-2.0-only"
+LICENSE = "BSD-2-Clause AND GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79f6fc2a6239fbe5f6e52f20ac76698c"

 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
index 7d1e801548..a3bd88cc7d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE    = "https://pipewire.org/"
 BUGTRACKER  = "https://gitlab.freedesktop.org/pipewire/pipewire/issues"
 SECTION     = "multimedia"

-LICENSE = "MIT & LGPL-2.1-or-later & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later AND MIT"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=2158739e172e58dc9ab1bdd2d6ec9c72 \
     file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
index e8f6df6348..ce79ead342 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Dirac compressed video encoder/decoder"
 HOMEPAGE = "http://schrodinger.sourceforge.net/"
-LICENSE = "MPL-1.1 | GPL-2.0-only | LGPL-2.0-only | MIT"
+LICENSE = "GPL-2.0-only OR LGPL-2.0-only OR MIT OR MPL-1.1"

 LIC_FILES_CHKSUM = "file://COPYING;md5=d91a46405fc074b88c963cc4f2a0aae9 \
                     file://COPYING.GPL;md5=e181e3b7c66f5f96921d813c1074f833 \
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 90a7a85df8..1bbb28b424 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -23,7 +23,7 @@ PACKAGECONFIG[id3tag] = "--with-id3tag,--without-id3tag,libid3tag,"
 PACKAGECONFIG[lame] = "--with-lame,--without-lame,lame,"
 PACKAGECONFIG[ao] = "--enable-ao,--disable-ao,libao,"

-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24"

diff --git a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb
index ae34624ebf..b46f72f9da 100644
--- a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb
+++ b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Tinycompress provides a minimal interface to interact \
 with compress offload capabilities in ALSA."
 HOMEPAGE = "https://github.com/alsa-project/tinycompress"

-LICENSE = "LGPL-2.1-only | BSD-3-Clause"
+LICENSE = "BSD-3-Clause OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf9105c1a2d4405cbe04bbe3367373a0"

 SRCREV = "ea5c7245beb0b6aec1565cfae0454d6ba374dfdd"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
index 4b588292f4..05f5135aec 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library tasked with managing, extracting and handling media art caches"

-LICENSE = "LGPL-2.0-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
                     file://libmediaart/extract.c;endline=18;md5=dff2b6328ab067b5baadc135f9876c36 \
                     file://tests/mediaarttest.c;endline=18;md5=067106eaa1f7a9d918759a096667f18e"
diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
index cddb5e89bd..7030551d6a 100644
--- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "autossh is a program to start a copy of ssh and monitor it, restarting it as necessary should it die or stop passing traffic"
 HOMEPAGE = "https://www.harding.motd.ca/autossh/"

-LICENSE = "BSD-1-Clause & BSD-4-Clause"
+LICENSE = "BSD-1-Clause AND BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://autossh.c;beginline=7;endline=22;md5=9ae0c9b04856148d77984ef58536732b \
                     file://daemon.h;beginline=7;endline=36;md5=839bb7bf781ff48da4a3fec2a62a1a47"

diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index e1f01de8a0..6f75e4d414 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python interface to Bluetooth LE on Linux"
 HOMEPAGE = "https://github.com/IanHarvey/bluepy"
 SECTION = "devel/python"
-LICENSE = "GPL-2.0-only & PD"
+LICENSE = "GPL-2.0-only AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=59e0d45ea684dda215889aa1b5acd001"
 DEPENDS = "glib-2.0"
 SRCREV = "7ad565231a97c304c0eff45f2649cd005e69db09"
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
index eef0e8f519..a2e4d4d88f 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
@@ -9,7 +9,7 @@ done when adding or deleting new users."
 SUMMARY = "High-performance and highly configurable RADIUS server"
 HOMEPAGE = "http://www.freeradius.org/"
 SECTION = "System/Servers"
-LICENSE = "GPL-2.0-only & LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
index 865c9c2b68..71d0a8d8a7 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
@@ -18,7 +18,7 @@ understand what the code does. It features:                          \
 HOMEPAGE = "https://www.trustedfirmware.org/projects/mbed-tls/"
 BUGTRACKER = "https://github.com/Mbed-TLS/mbedtls/issues"

-LICENSE = "Apache-2.0 | GPL-2.0-or-later"
+LICENSE = "Apache-2.0 OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"

 SECTION = "libs"
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
index 8bb6c9009d..a00452a64e 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
@@ -6,7 +6,7 @@ provides a lightweight method of carrying out messaging using a \
 publish/subscribe model. "
 HOMEPAGE = "http://mosquitto.org/"
 SECTION = "console/network"
-LICENSE = "EPL-2.0 | BSD-3-Clause"
+LICENSE = "BSD-3-Clause OR EPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6d64fd27a4071b14ef656a0e8a4f4cf \
                     file://edl-v10;md5=9f6accb1afcb570f8be65039e2fcd49e \
                     file://epl-v20;md5=2dd765ca47a05140be15ebafddbeadfe \
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
index 138d7118eb..a8f1a1673d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
@@ -13,7 +13,7 @@ for modem connections and certain types of VPN."
 HOMEPAGE = "https://wiki.gnome.org/Projects/NetworkManager"
 SECTION = "net/misc"

-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 "
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index ff8b103a9f..d1938e12a1 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -3,7 +3,7 @@
 # SPDX-License-Identifier: Apache-2.0
 SUMMARY = "OpenThread Border Router"
 SECTION = "net"
-LICENSE = "BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
                     file://third_party/cJSON/repo/LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0 \
                     file://third_party/cpp-httplib/repo/LICENSE;md5=1321bdf796c67e3a8ab8e352dd81474b \
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
index fdbc8d7a32..bc0d86b0e0 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -3,7 +3,7 @@
 # SPDX-License-Identifier: Apache-2.0
 SUMMARY = "OpenThread Daemon is an OpenThread POSIX build mode that runs OpenThread as a service."
 SECTION = "net"
-LICENSE = "BSD-3-Clause & Apache-2.0"
+LICENSE = "Apache-2.0 AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     file://third_party/mbedtls/repo/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d \
                     "
diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index 9c64872917..fc042a21e5 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -3,7 +3,7 @@
 # SPDX-License-Identifier: Apache-2.0
 SUMMARY = "wpantund, Userspace WPAN Network Daemon"
 SECTION = "net"
-LICENSE = "Apache-2.0 & MIT & BSL-1.0 & BSD-3-Clause"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND BSL-1.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7820bc7f7d1638a6b54fc2e8d7fb103 \
                     file://third_party/assert-macros/LICENSE;md5=cbf35ecdc8161026afe4da2906fab204 \
                     file://third_party/boost/LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
index fb00dd2ec1..3fc3df5471 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "https://www.samba.org/"
 SECTION = "console/network"

-LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://${COREBASE}/meta/files/common-licenses/LGPL-3.0-or-later;md5=c51d3eef3be114124d11349ca0d7e117 \
                     file://${COREBASE}/meta/files/common-licenses/GPL-2.0-or-later;md5=fed54355545ffd980b814dab4a3b312c"
diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
index faaf393529..9def039e88 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "set Linux HDLC packet radio modem driver port information"
 HOMEPAGE = "https://www.kernel.org/pub/linux/utils/net/hdlc"
 SECTION = "comm"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later "
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://sethdlc.c;endline=10;md5=90f936879e9f8b755a138aeb348782eb"


diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
index 54690f464e..91859870de 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc
@@ -4,7 +4,7 @@
 # Unknown licenses have been checked manually and completed.
 #

-LICENSE += "& Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT"
+LICENSE += "AND Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT"

 LIC_FILES_CHKSUM += "\
     file://pkg/mod/filippo.io/edwards25519@v1.2.0/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=BSD-3-Clause \
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
index db4a4313a4..f13982ed55 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
@@ -5,7 +5,7 @@ provides the server daemon for the iSCSI protocol, as well as the utility \
 programs used to manage it. iSCSI is a protocol for distributed \
 disk access using SCSI commands sent over Internet Protocol networks."
 HOMEPAGE = "http://www.open-iscsi.com/"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 SECTION = "net"
 DEPENDS = "openssl flex-native bison-native open-isns util-linux kmod"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb
index 66dc620a3a..60f1889a38 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb
@@ -11,7 +11,7 @@ DEPENDS = "db icu libpcre2 libnsl2 m4-native openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "

-LICENSE = "IPL-1.0 | EPL-2.0"
+LICENSE = "EPL-2.0 OR IPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b181651ad99a7dc4cc8c4ce2f491ed1a"

 SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index 7252be8b1e..e8864dcf34 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -4,7 +4,7 @@ devices that are constrained their resources such as computing power, \
 RF range, memory, bandwith, or network packet sizes."
 HOMEPAGE = "https://libcoap.net/"

-LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=05d17535846895e23ea4c79b16a9e904"

 SRC_URI = "git://github.com/obgm/libcoap.git;branch=release-4.3.5-patches;protocol=https;tag=v${PV} \
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
index 99a0149e38..118b628e7a 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "8dc23b97390236032a2fe19068c7dad23f82fb624732c9bff6898b6996
 UPSTREAM_CHECK_URI = "https://pagure.io/dlm/releases"
 UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"

-LICENSE = "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.license;md5=531f5086ad0f36f6e22cb6085e1c41d5"

 S = "${UNPACKDIR}/dlm-dlm-${PV}"
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb
index fa802d02bd..b9a797d500 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb
@@ -5,7 +5,7 @@ SUMMARY = "Kronosnet, often referred to as knet, is a network abstraction layer
            designed for High Availability use cases, where redundancy, security, \
            fault tolerance and fast fail-over are the core requirements of your application."
 HOMEPAGE = "https://kronosnet.org/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-only"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.libraries;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "libs"
diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
index 8f53cf68d5..c8ac622016 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
@@ -5,7 +5,7 @@ and VRRP, with alpha support for EIGRP and NHRP."
 HOMEPAGE = "https://frrouting.org/"
 SECTION = "net"

-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2881.120.11.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.120.11.bb
index 27bce6e484..d945d06d43 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2881.120.11.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.120.11.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Publishes & browses available services on a link according to the Zeroconf / Bonjour protocol"
 DESCRIPTION = "Bonjour, also known as zero-configuration networking, enables automatic discovery of computers, devices, and services on IP networks."
 HOMEPAGE = "https://developer.apple.com/bonjour/"
-LICENSE = "Apache-2.0 & BSD-3-Clause"
+LICENSE = "Apache-2.0 AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"

 DEPENDS:append:libc-musl = " musl-nscd"
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
index d5e2931969..00a7b50cdf 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Various tools relating to the Simple Network Management Protocol"
 HOMEPAGE = "http://www.net-snmp.org/"
 SECTION = "net"
-LICENSE = "BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND MIT"

 LIC_FILES_CHKSUM = "file://COPYING;md5=9d100a395a38584f2ec18a8275261687"

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb
index 9a39bb0e4f..2f4b763118 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "open62541 is an implementation of OPC UA (OPC Unified Architecture)"
 HOMEPAGE = "https://github.com/open62541/open62541.git"
-LICENSE = "MPL-2.0 & BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = "\
     file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad \
     file://deps/mdnsd/LICENSE;md5=3bb4047dc4095cd7336de3e2a9be94f0 \
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 1d11d374fc..789ffc86ce 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.openl2tp.org/"
 SECTION = "net"

 # cli and usl use license LGPL-2.1
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585 \
                     file://LICENSE;md5=f8970abd5ea9be701a0deedf5afd77a5 \
                     file://cli/LICENSE;md5=9c1387a3c5213aa40671438af3e00793 \
diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
index 6baa83e83e..5fbf7d9853 100644
--- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/universe/r/${BPN}/${BPN}_${PV}.

 SRC_URI[sha256sum] = "282a9f1355f190efbb06c0d7c4e062eaa652caf342ed3ad361ac595f72f09f14"

-LICENSE = "BSD-3-Clause & BSD-2-Clause & HPND"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND HPND"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3e47566c9271b786693d8a08792dbf41"

 inherit autotools-brokensep
diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
index d8ab2dacb1..23a08cb350 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A a package of utilities for doing and managing mounts of the Linux CIFS filesystem."
 HOMEPAGE = "http://wiki.samba.org/index.php/LinuxCIFS_utils"
 SECTION = "otherosfs"
-LICENSE = "GPL-3.0-only & LGPL-3.0-only"
+LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

 SRCREV = "edac7178bec9520fb57d14946e67f5dd33b82d43"
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
index 86f6a0df5d..ea4a480875 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
@@ -2,7 +2,7 @@ require cim-schema.inc

 SECTION = "doc"

-LICENSE = "DMTF"
+LICENSE = "LicenseRef-DMTF"

 SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-Doc.zip;subdir=${BP} \
            file://LICENSE \
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
index 45eee8f1b6..041702795d 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
@@ -1,6 +1,6 @@
 require cim-schema.inc

-LICENSE = "DMTF"
+LICENSE = "LicenseRef-DMTF"

 RCONFLICTS:${PN} = "cim-schema-final"

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
index d046622df5..21462ab11f 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
@@ -1,6 +1,6 @@
 require cim-schema.inc

-LICENSE = "DMTF"
+LICENSE = "LicenseRef-DMTF"

 RCONFLICTS:${PN} = "cim-schema-exper"

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
index 765287018b..e2e365e81e 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
@@ -2,7 +2,7 @@ SUMMARY = "Lightweight, easy to configure DNS forwarder and DHCP server"
 HOMEPAGE = "http://www.thekelleys.org.uk/dnsmasq/doc.html"
 SECTION = "net"
 # GPLv3 was added in version 2.41 as license option
-LICENSE = "GPL-2.0-only | GPL-3.0-only"
+LICENSE = "GPL-2.0-only OR GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504 \
                     "
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
index 6cac8de964..a0ac6d5f09 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
@@ -6,7 +6,7 @@ in mind. Dovecot is an excellent choice for both small and large \
 installations. It's fast, simple to set up, requires no special \
 administration and it uses very little memory."
 SECTION = "mail"
-LICENSE = "LGPL-2.1-only & MIT & Unicode-3.0 & BSD-3-Clause & PD"
+LICENSE = "BSD-3-Clause AND LGPL-2.1-only AND MIT AND Unicode-3.0 AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb805cc6bdb95ba8fc2398a55fd50877"

 SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb
index cd9e8dcee1..2556f97c4f 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.6.4.bb
@@ -5,7 +5,7 @@ and forwarding utility intended to be used over on-demand TCP/IP links (such as
 connections). It supports every remote-mail protocol now in use on the Internet: POP2, POP3, \
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
-LICENSE = "GPL-2.0-only & MIT"
+LICENSE = "GPL-2.0-only AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d97f83179a23f8039e1de1420382e4d"

 DEPENDS = "openssl"
diff --git a/meta-networking/recipes-support/fping/fping_5.5.bb b/meta-networking/recipes-support/fping/fping_5.5.bb
index 24618d1055..6c1926a908 100644
--- a/meta-networking/recipes-support/fping/fping_5.5.bb
+++ b/meta-networking/recipes-support/fping/fping_5.5.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.fping.org/"
 BUGTRACKER = "https://github.com/schweikert/fping/issues"
 SECTION = "net"

-LICENSE = "fping"
+LICENSE = "LicenseRef-fping"
 NO_GENERIC_LICENSE[fping] = "COPYING"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index 9c2535b95b..c5f856c283 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -6,7 +6,7 @@ SUMMARY = "GeoIP perl API library to access location database"
 DESCRIPTION = "perl library for country/city/organization to IP address or hostname mapping"
 HOMEPAGE = "http://www.maxmind.com/app/ip-location"
 SECTION = "libdevel"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4f3ea6e9b28af88dc0321190a1f8250"

 SRCREV = "4cdfdc38eca237c19c22a8b90490446ce6d970fa"
diff --git a/meta-networking/recipes-support/libldb/libldb_2.9.2.bb b/meta-networking/recipes-support/libldb/libldb_2.9.2.bb
index c473c15fff..a212b6d2ef 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.9.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.9.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "https://ldb.samba.org"
 SECTION = "libs"
-LICENSE = "LGPL-3.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
+LICENSE = "GPL-3.0-or-later AND LGPL-2.1-or-later AND LGPL-3.0-or-later"

 DEPENDS += "libtdb libtalloc libtevent popt cmocka"
 RDEPENDS:pyldb += "python3"
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb
index 41f1714184..3c694ea7e7 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "https://talloc.samba.org"
 SECTION = "libs"
-LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
+LICENSE = "GPL-3.0-or-later AND LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
                     file://pytalloc.h;beginline=1;endline=18;md5=21ab13bd853679d7d47a1739cb3b7db6 \
                     "
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.15.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.15.bb
index 976932ae39..b21eb4a217 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.15.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.15.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The tdb library"
 HOMEPAGE = "https://tdb.samba.org/"
 SECTION = "libs"
-LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
+LICENSE = "GPL-3.0-or-later AND LGPL-3.0-or-later"

 LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c98f48018c4 \
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index f87aa92932..5f9f355949 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Drivers and tools to support ATM networking under Linux"
 HOMEPAGE = "http://linux-atm.sourceforge.net/"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"

 DEPENDS = "flex flex-native"
 RRECOMMENDS:${PN} = "kernel-module-atm-tcp"
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
index 3ad436724d..f30b7439d5 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
 HOMEPAGE = "http://lksctp.org"
 SECTION = "net"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"

 LIC_FILES_CHKSUM = " \
     file://COPYING.lib;md5=0a1b79af951c42a9c8573533fbba9a92 \
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 9704e2d15e..3f78029bb5 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The Network Time Protocol suite, refactored"
 HOMEPAGE = "https://www.ntpsec.org/"

-LICENSE = "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND CC-BY-4.0 AND MIT AND NTP"
 LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=653830da7b770a32f6f50f6107e0b186 \
                     file://LICENSES/BSD-3-Clause.txt;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
                     file://LICENSES/CC-BY-4.0.txt;md5=2ab724713fdaf49e4523c4503bfd068d \
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
index 5c38f6b5dc..f51887e020 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
@@ -7,7 +7,7 @@ Storage Name Service (iSNS).  The distribution includes the iSNS server, \
 supporting persisten storage of registrations, isnsadm, a command line \
 utility for managing nodes, and isnsdd, a corresponding discovery daemon."
 HOMEPAGE = "http://github.com/gonzoleeman/open-isns/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 SECTION = "net"

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
index a48d1ce88d..088494c91b 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
@@ -17,7 +17,7 @@ for better management of and seamless user interactions with guests.\
 "
 SECTION = "vmware-tools"

-LICENSE = "LGPL-2.0-only & GPL-2.0-only & BSD-2-Clause & CDDL-1.0"
+LICENSE = "BSD-2-Clause AND CDDL-1.0 AND GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=559317809c5444fb39ceaf6ac45c43ac"
 LICENSE:modules/freebsd/vmblock = "BSD-2-Clause"
 LICENSE:modules/freebsd/vmmemctl = "GPL-2.0-only"
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
index db74b91f7e..c945428307 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     readline \
     "

-LICENSE = "GPL-2.0-only & LGPL-2.1-only & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND LGPL-2.1-only"

 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb
index 5a8640ad02..cf66a3fc70 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=http
 SRCREV = "31af04ec84378724cb6256814d4ffde359a7123b"

 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-LICENSE = "BSD-2-Clause | GPL-2.0-only"
+LICENSE = "BSD-2-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.BSD_FB;md5=0ec18bae1a9df92c8d6ae01f94a289ae \
 		   file://COPYING.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263"

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb
index c82db8c9aa..2ad532de9f 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Tool for displaying SIP calls message flows from terminal"
 HOMEPAGE = "https://github.com/irontec/sngrep"
 BUGTRACKER = "https://github.com/irontec/sngrep/issues"
 SECTION = "console/network"
-LICENSE = "GPL-3.0-or-later & OpenSSL"
+LICENSE = "GPL-3.0-or-later AND OpenSSL"
 LIC_FILES_CHKSUM = "\
     file://LICENSE;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.OpenSSL;md5=e39170c41c6f83de36426dbf49a03632 \
diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 127738a429..e8f9ddc5df 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A Gtk client and libraries for SPICE remote desktop servers."
 HOMEPAGE = "https://spice-space.org"
-LICENSE = "LGPL-2.1-only & BSD-3-Clause & GPL-2.0-only"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
 	file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 	file://subprojects/spice-common/COPYING;md5=4b54a1fd55a448865a0b32d41598759d \
diff --git a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
index 81c7fdf0c8..c4c091b0ff 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "usbredir libraries and utilities"

-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=4b54a1fd55a448865a0b32d41598759d \
 "
diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
index b72c375400..a7da23deea 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.6.bb
@@ -7,7 +7,7 @@ tool.  If you're having network connectivity problems, traceroute will \
 show you where the trouble is coming from along the route."
 SECTION = "net"
 HOMEPAGE = "http://traceroute.sourceforge.net/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"

diff --git a/meta-networking/recipes-support/udpcast/udpcast_20250223.bb b/meta-networking/recipes-support/udpcast/udpcast_20250223.bb
index b3861ce7c5..90fcce52fe 100644
--- a/meta-networking/recipes-support/udpcast/udpcast_20250223.bb
+++ b/meta-networking/recipes-support/udpcast/udpcast_20250223.bb
@@ -7,7 +7,7 @@ multicast abilities: it won't take longer to install 15 machines than it would \
 to install just 2."
 HOMEPAGE = "http://www.udpcast.linux.lu/"
 SECTION = "console/network"
-LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e3cf524a29c8476be354bb329d36ff80"

 SRC_URI = "http://www.udpcast.linux.lu/download/${BP}.tar.gz \
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 23515d9fa8..36bea146b4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "mongodb"
-LICENSE = "SSPL-1 & Apache-2.0 & Zlib"
+LICENSE = "Apache-2.0 AND Zlib AND LicenseRef-SSPL-1"
 LIC_FILES_CHKSUM = "file://LICENSE-Community.txt;md5=3a865f27f11f43ecbe542d9ea387dcf1 \
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
index 844e735b69..cc6031adf8 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Taisei Project is an open source fan-game set in the world of \
                mastery through practice."
 HOMEPAGE = "https://taisei-project.org"
 BUGTRACKER = "https://github.com/taisei-project/taisei/issues"
-LICENSE = "CC-BY-4.0 & CC0-1.0 & MIT"
+LICENSE = "CC-BY-4.0 AND CC0-1.0 AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1a11ffd7e1bdd1d3156cecec60a2846f"

 DEPENDS = "\
diff --git a/meta-oe/recipes-benchmark/coremark/coremark_git.bb b/meta-oe/recipes-benchmark/coremark/coremark_git.bb
index f4974b754f..b8b755ed56 100644
--- a/meta-oe/recipes-benchmark/coremark/coremark_git.bb
+++ b/meta-oe/recipes-benchmark/coremark/coremark_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "EEMBC CoreMark CPU benchmark"
 DESCRIPTION = "CoreMark is a CPU benchmark program"
 HOMEPAGE = "https://www.eembc.org/coremark/"
-LICENSE = "Apache-2.0 & LicenseRef-EEMBC-AUA"
+LICENSE = "Apache-2.0 AND LicenseRef-EEMBC-AUA"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a18b17ae63deaa8a595035f668aebe1"

 SRC_URI = "git://github.com/eembc/coremark.git;branch=main;protocol=https"
diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
index a8d750e885..819b076816 100644
--- a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Dhrystone CPU benchmark"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"

 SRC_URI = "http://www.netlib.org/benchmark/dhry-c;downloadfilename=dhry-c.shar \
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 8bcb763f06..8c31592640 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -4,7 +4,7 @@ It uses only the subset of the OpenGL 2.0 API that is compatible with OpenGL ES
 HOMEPAGE = "https://github.com/glmark2/glmark2"
 BUGTRACKER = "https://github.com/glmark2/glmark2/issues"

-LICENSE = "GPL-3.0-or-later & SGI-1"
+LICENSE = "GPL-3.0-or-later AND LicenseRef-SGI-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_508.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_508.bb
index 31cc72af53..8e67a095a6 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_508.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_508.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Filesystem and Disk Benchmarking Tool"
 HOMEPAGE = "http://www.iozone.org/"
 SECTION = "console/tests"
-LICENSE = "iozone3"
+LICENSE = "LicenseRef-iozone3"
 LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea735b5f4b \
     file://iozone.c;beginline=317;endline=323;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
 "
diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
index 6a500dbf01..fe45e496a3 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point computing power"
 SUMMARY = "LINPACK is a software library for performing numerical linear algebra on digital computers"

-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/linpacknew.c;beginline=1;endline=23;md5=aa025e3bc44190c71e4c5e3b084fed87"

 SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c \
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index acd4d6decf..2783bc1ca9 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tools for performance analysis"
 HOMEPAGE = "http://lmbench.sourceforge.net/"
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only & GPL-2.0-with-lmbench-restriction"
+LICENSE = "GPL-2.0-only AND LicenseRef-GPL-2.0-with-lmbench-restriction"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYING-2;md5=8e9aee2ccc75d61d107e43794a25cdf9"

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index 538ff24c0a..edc8a49e42 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "BYTE Magazine's native benchmarks (also called BYTEmark) \
 designed to expose the capabilities of a system's CPU, FPU, \
 and memory system."
 HOMEPAGE = "http://www.tux.org/~mayer/linux/"
-LICENSE = "nbench-byte"
+LICENSE = "LicenseRef-nbench-byte"
 LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
 SECTION = "console/utils"

diff --git a/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb b/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
index db5e16d8f6..2027a03a4b 100644
--- a/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
+++ b/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Cache and memory benchmarking tool"
 DESCRIPTION = "RAMspeed is a micro-benchmark for measuring cache and memory bandwidth"
 HOMEPAGE = "https://github.com/cruvolo/ramspeed"

-LICENSE = "Alasir"
+LICENSE = "LicenseRef-Alasir"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=92cffec6695a20eab8d0e4770f4e9353"
 LICENSE_FLAGS = "commercial"

diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
index 0c6661567b..cd2b2fab19 100644
--- a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Whetstone benchmark is a synthetic benchmark for evaluating the performance of computers"
 SUMMARY = "CPU benchmark to measure floating point performance"

-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"

 SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
index d3d08720a6..55959ae475 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "\
     utility lsi2c. \
 "
 HOMEPAGE = "https://github.com/costad2/i2cdev"
-LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=768997ba510a952bef1775c50bc22b00 \
     file://include/libi2cdev.h;beginline=12;endline=25;md5=72486a5e192d6ac5c7e55a4a95e380a6 \
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index d5cd2cd195..dec4fd879d 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Hardware health monitoring applications"
 HOMEPAGE = "https://hwmon.wiki.kernel.org/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
index 3fbe52020e..397537417e 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
@@ -1,7 +1,7 @@
 SUMMARY = "NVMe management command line interface"
 HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only & CC0-1.0 & MIT"
+LICENSE = "CC0-1.0 AND GPL-2.0-only AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.6.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.6.bb
index 4ca7f8b230..8250363efc 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.6.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.6.bb
@@ -1,7 +1,7 @@
 SUMMARY = "C++ framework for implementing distributed and networked applications"
 DESCRIPTION = "C++ network programming framework that implements many core \
 patterns for concurrent communication software"
-LICENSE = "ACE-TAO-CIAO"
+LICENSE = "LicenseRef-ACE-TAO-CIAO"
 HOMEPAGE = "http://www.dre.vanderbilt.edu/~schmidt/ACE.html"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
index 65b1e93468..82fec50b91 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Bluetooth library with attribute support"
 SECTION = "libs/network"

-LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
+LICENSE = "BSD-3-Clause OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=f44a9a14d37330e7cd454e694e714ab8"

 DEPENDS = "bluez5 glib-2.0 glib-2.0-native python3-packaging-native"
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb b/meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb
index da6b1961d3..8baf66b623 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A library to abstract stream I/O like serial port, TCP, telnet, etc"
 HOMEPAGE = "https://github.com/cminyard/gensio"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
diff --git a/meta-oe/recipes-connectivity/libev/libev_4.33.bb b/meta-oe/recipes-connectivity/libev/libev_4.33.bb
index 6d29900a48..3d05d32817 100644
--- a/meta-oe/recipes-connectivity/libev/libev_4.33.bb
+++ b/meta-oe/recipes-connectivity/libev/libev_4.33.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A full-featured and high-performance event loop that is loosely \
 modelled after libevent."
 HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
-LICENSE = "BSD-2-Clause | GPL-2.0-or-later"
+LICENSE = "BSD-2-Clause OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"

 SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.4.0.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.4.0.bb
index eeae93e261..77e1fb7cb5 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.4.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A protocol library to access an iPhone or iPod Touch in Linux"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.34.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.34.0.bb
index 847cb3dcfc..2224e15057 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.34.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.34.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "libmbim is library for talking to WWAN devices by MBIM protocol"
 DESCRIPTION = "libmbim is a glib-based library for talking to WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libmbim/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://LICENSES/GPL-2.0-or-later.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index 83f32d3a07..49617eaa29 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "NFS client library"
 HOMEPAGE = "https://github.com/sahlberg/libnfs"
-LICENSE = "LGPL-2.1-only & BSD-2-Clause & GPL-3.0-only"
+LICENSE = "BSD-2-Clause AND GPL-3.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"

 SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
index bf8c65ec97..44a1ad2f4f 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.38.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "libqmi is a library for talking to WWAN devices by QMI protocol"
 DESCRIPTION = "libqmi is a glib-based library for talking to WWAN modems and \
                devices which speak the Qualcomm MSM Interface (QMI) protocol"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libqmi"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index 3015b7d165..005729dcac 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Canonical libwebsockets.org websocket library"
 HOMEPAGE = "https://libwebsockets.org/"
-LICENSE = "MIT & Zlib & BSD-3-Clause & Apache-2.0 & OFL-1.1"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND MIT AND OFL-1.1 AND Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5d391cc7929bcba238f9ba6805f7574"

 DEPENDS = "zlib"
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
index 4e16436c98..9227c4b7f4 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "ModemManager is a daemon controlling broadband devices/connections"
 DESCRIPTION = "ModemManager is a DBus-activated daemon which controls mobile broadband (2G/3G/4G) devices and connections"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ModemManager/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index 1b8bd47e39..1c66054d53 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Openobex project is an open source implementation of the \
 Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
index dce7e72c8b..1ee52a44d1 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A tool for transfer files to/from any OBEX enabled device"
-LICENSE = "GPL-2.0-only & PD & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LGPL-2.1.txt;md5=4fbd65380cdd255951079008b364516c \
                     file://GPL-2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://License.txt;md5=fcbddc3c1debed80dd80da2d3e5f0dc1 \
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.16.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.16.bb
index a3ef667db7..607a44d9a4 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.16.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.16.bb
@@ -2,7 +2,7 @@ SUMMARY = "Paho MQTT - C libraries for the MQTT and MQTT-SN protocols"
 DESCRIPTION = "Client implementation of open and standard messaging protocols for Machine-to-Machine (M2M) and Internet of Things (IoT)."
 HOMEPAGE = "http://www.eclipse.org/paho/"
 SECTION = "console/network"
-LICENSE = "EPL-2.0 | EDL-1.0"
+LICENSE = "EPL-2.0 OR LicenseRef-EDL-1.0"

 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=fd3b896dadaeec3410d753ffaeadcfac \
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.6.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.6.0.bb
index 53c1d5770b..6a0b75fd2c 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.6.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.6.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Paho MQTT - C++ libraries for the MQTT and MQTT-SN protocols"
 DESCRIPTION = "Client implementation of open and standard messaging protocols for Machine-to-Machine (M2M) and Internet of Things (IoT)."
 HOMEPAGE = "http://www.eclipse.org/paho/"
 SECTION = "console/network"
-LICENSE = "EPL-2.0 | EDL-1.0"
+LICENSE = "EPL-2.0 OR LicenseRef-EDL-1.0"

 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=c0fa3a632eea67f4079c54df781d1441 \
diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
index a4b7856abe..4bf33d8330 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Transmission is a fast, easy, and free BitTorrent client"
 SECTION = "network"
 HOMEPAGE = "https://transmissionbt.com/"
-LICENSE = "MIT & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d54f298b276b8cc5f20168e43a0e8103"

 DEPENDS = "curl libevent libpsl gnutls openssl libtool intltool-native glib-2.0-native"
diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 5a880ed6d2..f2aaa6b234 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to an iPhone or iPod touch."
 HOMEPAGE = "https://github.com/libimobiledevice/usbmuxd"
-LICENSE = "GPL-3.0-only & GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND GPL-3.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504"

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.2.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.2.bb
index 569d12aaf9..6a2aa1440f 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "D-Bus implementation in C++"
 HOMEPAGE = "https://dbus-cxx.github.io/"
 BUGTRACKER = "https://github.com/dbus-cxx/dbus-cxx/issues"
 SECTION = "base"
-LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
+LICENSE = "BSD-3-Clause OR LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"

 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https;tag=${PV}"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb
index 94995ef284..051dd05abe 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "C++ bindings for the glib library"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
                     file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb
index e0e52f2032..2e7864852e 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb
@@ -1,7 +1,7 @@
 SUMMARY = "C++ bindings for the glib library"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v85.bb b/meta-oe/recipes-core/ndctl/ndctl_v85.bb
index eb4fca0ef5..2cd2921093 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v85.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v85.bb
@@ -5,7 +5,7 @@ The LIBNVDIMM subsystem provides support for three types of \
 NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
 simultaneously support both PMEM and BLK mode access."
 HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & MIT & CC0-1.0"
+LICENSE = "CC0-1.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"

 inherit meson pkgconfig bash-completion systemd
diff --git a/meta-oe/recipes-core/safec/safec_3.9.1.bb b/meta-oe/recipes-core/safec/safec_3.9.1.bb
index 3635476d1c..72e13efa8e 100644
--- a/meta-oe/recipes-core/safec/safec_3.9.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.9.1.bb
@@ -1,6 +1,6 @@
 SUMMARY  = "Safe C Library"

-LICENSE  = "safec"
+LICENSE  = "LicenseRef-safec"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
 SECTION = "lib"

diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
index 724d6fa049..8fb19b1b90 100644
--- a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
+++ b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
@@ -7,7 +7,7 @@ SUMMARY = "systemd-repart"
 DESCRIPTION = "systemd-repart grows and adds partitions to a partition table, based on the configuration files described in repart.d(5), or generates a Discoverable Disk Image (DDI) for a system extension (sysext, see systemd-sysext(8))."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"

-LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later"
 LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
index c754131e3f..6491ad4d55 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
@@ -6,7 +6,7 @@ and can hence offer more features than plain dm-crypt. On the other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION = "console"
-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception & Apache-2.0"
+LICENSE = "Apache-2.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later AND LicenseRef-GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326 \
                     file://docs/licenses/COPYING.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception;md5=32107dd283b1dfeb66c9b3e6be312326 \
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb
index 4c42b77490..5be6ba1945 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb
@@ -4,7 +4,7 @@ PQC-resistant cryptographic algorithms. It is lean, has minimal dependencies, \
 supports stack-only operation and provides optimized implementations for \
 ML-KEM (Kyber), ML-DSA (Dilithium), SLH-DSA (Sphincs+) and many more"
 HOMEPAGE = "https://leancrypto.org"
-LICENSE = "BSD-3-Clause | GPL-2.0-only"
+LICENSE = "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=4cc9ea7ae2518fb4fb0bbd9d1a60cbf4 \
     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
index 532c9e29df..742a50c3fe 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "https://www.chronox.de/libkcapi/index.html"
-LICENSE = "BSD-3-Clause | GPL-2.0-only"
+LICENSE = "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d8a091d797491204567185a6efce70f"

 SRCREV = "fc937358e71253a6efaa3ba74885364976b040ea"
diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
index 0c8f090cf5..d9cc5ffc67 100644
--- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Monocypher is an easy to use, easy to deploy, \
 auditable crypto library written in portable C. It approaches the size of TweetNaCl and the speed of libsodium."
 HOMEPAGE = "https://monocypher.org/"
 SECTION = "libs"
-LICENSE = "BSD-2-Clause | CC0-1.0"
+LICENSE = "BSD-2-Clause OR CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=ff30a1c41dfd9e6fa559a9e45ee98302"

 SRC_URI = "https://monocypher.org/download/${BPN}-${PV}.tar.gz"
diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
index 000218988b..3e776993f4 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
@@ -9,7 +9,7 @@ slot, supporting session expiration and much more all using a simple API."
 HOMEPAGE = "https://github.com/OpenSC/pkcs11-helper"
 SECTION = "Development/Libraries"

-LICENSE = "GPL-2.0-only & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=008a5b65f5d167bd0f646530ad3d3293 \
                     file://COPYING.GPL;md5=8a71d0475d08eee76d8b6d0c6dbec543 \
                     file://COPYING.BSD;md5=66b7a37c3c10483c1fd86007726104d7 \
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index d8279492ac..4ce8e3681c 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "InfluxDB is a time series database designed to handle high write and query loads."
 HOMEPAGE = "https://www.influxdata.com/products/influxdb-overview/"

-LICENSE = "MIT & ${GO_MOD_LICENSES}"
+LICENSE = "MIT AND ${GO_MOD_LICENSES}"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=f39a8d10930fb37bd59adabb3b9d0bd6"
 require ${BPN}-licenses.inc

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
index b810911b98..2d9dcf4a8d 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "RocksDB an embeddable, persistent key-value store"
 DESCRIPTION = "RocksDB is library that provides an embeddable, persistent key-value store for fast storage."
 HOMEPAGE = "http://rocksdb.org/"
-LICENSE = "(Apache-2.0 | GPL-2.0-only) & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND (Apache-2.0 OR GPL-2.0-only)"
 LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
diff --git a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
index 271a786e14..4da1c89dab 100644
--- a/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
+++ b/meta-oe/recipes-devtools/android-libboringssl/android-libboringssl_14.0.0+r45.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 # android-platform-tools source package.
 # BoringSSL is a fork of OpenSSL; new files carry ISC license, OpenSSL license
 # covers the forked parts.
-LICENSE = "OpenSSL & ISC"
+LICENSE = "ISC AND OpenSSL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ca501bc96ce9ed0814e2c592c3f9593"

 SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-external-boringssl/android-platform-external-boringssl_${PV}.orig.tar.xz \
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 31cc12ad78..0431bddcdf 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Various utilities from Android"
 SECTION = "console/utils"
-LICENSE = "Apache-2.0 & GPL-2.0-only & BSD-2-Clause & BSD-3-Clause"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND GPL-2.0-only"
 LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
     file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
index 2c07364835..436404c61d 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tools for tracing OpenGL, Direct3D, and other graphics APIs"
 HOMEPAGE = "http://apitrace.github.io/"
 SECTION = "console/tools"
-LICENSE = "MIT & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
                     file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index ab4e6148e9..dabf9c2c9e 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -3,7 +3,7 @@ safe memory reclamation mechanisms and non-blocking data structures \
 designed to aid in the design and implementation of high performance \
 concurrent systems."

-LICENSE = "BSD-2-Clause & Apache-2.0"
+LICENSE = "Apache-2.0 AND BSD-2-Clause"
 HOMEPAGE = "http://concurrencykit.org"
 SECTION = "base"

diff --git a/meta-oe/recipes-devtools/fex/fex_2607.bb b/meta-oe/recipes-devtools/fex/fex_2607.bb
index 387fb7e8eb..9d53babc0a 100644
--- a/meta-oe/recipes-devtools/fex/fex_2607.bb
+++ b/meta-oe/recipes-devtools/fex/fex_2607.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A fast usermode x86 and x86-64 emulator for Arm64 Linux"
 HOMEPAGE = "https://github.com/FEX-Emu/FEX"
-LICENSE = "MIT & BSL-1.0 & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND BSL-1.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=70d20d502833c35d6d5a4f0ef5d9efcc"
 LIC_FILES_CHKSUM += "file://External/range-v3/LICENSE.txt;md5=5dc23d5193abaedb6e42f05650004624"
 LIC_FILES_CHKSUM += "file://External/xxhash/LICENSE;md5=13be6b481ff5616f77dda971191bb29b"
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb b/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
index 9a19e5dc98..bd91a8056e 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A fast and lightweight IDE"
 HOMEPAGE = "http://plugins.geany.org/"

 LICENSE_DEFAULT = "GPL-2.0-only"
-LICENSE = "${LICENSE_DEFAULT} & BSD-2-Clause & GPL-3.0-only"
+LICENSE = "BSD-2-Clause AND GPL-3.0-only AND ${LICENSE_DEFAULT}"

 python () {
     for plugin in d.getVar('PLUGINS').split():
diff --git a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
index 3645de3cc3..57f0fe0aa8 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Glade - A User Interface Designer"
 HOMEPAGE = "https://glade.gnome.org"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.GPL;md5=4641e94ec96f98fabc56ff9cc48be14b \
                     file://COPYING.LGPL;md5=81227099add6b483afd7b1d4fc4e93b7"
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
index 2213331a3e..882cda24fb 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
@@ -3,7 +3,7 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
 (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
 HOMEPAGE = "https://github.com/grpc/grpc"
 SECTION = "libs"
-LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0 & MIT & BSD-2-Clause"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9 \
     file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c \
diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb
index 2d65ef6622..f0693740f3 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb
@@ -4,7 +4,7 @@
 SUMMARY = "Gstreamer editing services"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-editing-services/"

-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d"

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 7665ba2511..7b07bf0f99 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "jq is like sed for JSON data, you can use it to slice and \
 HOMEPAGE = "https://jqlang.github.io/jq/"
 BUGTRACKER = "https://github.com/jqlang/jq/issues"
 SECTION = "utils"
-LICENSE = "MIT & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf7fcb0a1def4a7ad62c028f7d0dca47"

 SRCREV = "4467af7068b1bcd7f882defff6e7ea674c5357f4"
diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
index 8a8491b76b..d4eb2e7ae9 100644
--- a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
+++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "The Lemon Parser Generator"
 HOMEPAGE = "https://sqlite.org/src/file/doc/lemon.html"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 SECTION = "devel"

 LIC_FILES_CHKSUM = "file://tool/lemon.c;endline=8;md5=c7551a78fa3fdecd96d1ad6761d205ee"
diff --git a/meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb b/meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb
index 5a84fd6848..4db379818f 100644
--- a/meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb
+++ b/meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The ABI Generic Analysis and Instrumentation Library"
 HOMEPAGE = "https://sourceware.org/libabigail/"

-LICENSE = "Apache-2.0-with-LLVM-exception"
+LICENSE = "Apache-2.0 WITH LLVM-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"

 SRC_URI = "http://mirrors.kernel.org/sourceware/${BPN}/${BP}.tar.xz \
diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
index 3616eb519d..8ce8bc050d 100644
--- a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
+++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
@@ -4,7 +4,7 @@ Unicode Standard Annex #14 (UAX #14).  East_Asian_Width informative \
 properties defined by Annex #11 (UAX #11) may be concerned to determin \
 breaking positions.  This package also implements "default" Grapheme \
 Cluster segmentation described in Annex #29 (UAX #29)."
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b122a36d0f6dc55279a0ebc69f3c60b"

 SRC_URI = "git://github.com/hatukanezumi/sombok.git;protocol=https;branch=master \
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb
index c411c115fd..a0d8926d34 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.18.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0 & BlueOak-1.0.0"
+LICENSE = "Apache-2.0 AND Artistic-2.0 AND BSD-2-Clause AND BSD-3-Clause AND BlueOak-1.0.0 AND ISC AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76c62fa4c329393e905512b36f8378b7"
 FILESEXTRAPATHS:prepend := "${THISDIR}/nodejs-24:"

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 52fb36ef40..0c5a3959d5 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -1,4 +1,4 @@
-LICENSE = "Apache-2.0 & BSD-3-Clause & MIT & Zlib"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND MIT AND Zlib"

 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0c9924c5c63b4834b8b1959816c8e3b \
                     file://buildtools/libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da3953 \
diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
index 9cdb0a52cc..77fcebd846 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
@@ -5,7 +5,7 @@ usages are supported and may be mixed. Likewise, functional and OO API \
 styles are both supported and may be mixed."
 HOMEPAGE = "https://metacpan.org/release/IPC-Run"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
 DEPENDS = "perl"

diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
index 4886333f3a..775246c648 100644
--- a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
+++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Config file parser module"
 HOMEPAGE = "http://search.cpan.org/dist/Config-General/"
-LICENSE = "Artistic-2.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-2.0 OR GPL-1.0-or-later"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://README;beginline=90;endline=90;md5=53fe13727e61798809ec5c160dc93e6e"

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb
index 47f9e06c90..fa1a727eea 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.650.bb
@@ -6,7 +6,7 @@ database interface independent of the actual database being used. \
 "
 HOMEPAGE = "https://metacpan.org/dist/DBI"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a1138dff61f77bbc3d8782caba6758d"

 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
index 43614d55ac..f312bb4dea 100644
--- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
@@ -4,7 +4,7 @@ and its headers are available, by attempting to compile a simple program and \
 link against it."
 HOMEPAGE = "https://metacpan.org/pod/Devel::CheckLib"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;md5=7911cdbb572d25c5f2e2ea17f669efc2"

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
index 37231b0ec0..804a5ba8a4 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Perl module for pseudo tty IO"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=11;endline=15;md5=1810a9b670f4c85932012bcc2275fc9d"

 SRC_URI = "https://cpan.metacpan.org/authors/id/T/TO/TODDR/IO-Tty-${PV}.tar.gz"
diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
index ded0dea0d1..e6609a77b0 100644
--- a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
+++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
@@ -4,7 +4,7 @@ The module implements JSON encode/decode."

 HOMEPAGE = "https://metacpan.org/pod/JSON"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=1171;endline=1176;md5=3be2cb8159d094768e67386c453e8bbe"

 DEPENDS += "perl"
diff --git a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
index a7e05922d6..10ece12393 100644
--- a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
+++ b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
@@ -5,7 +5,7 @@ with perl object oriented interface."

 HOMEPAGE = "http://search.cpan.org/dist/Parse-Yapp/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://lib/Parse/Yapp.pm;beginline=508;endline=521;md5=41a4542fcde97a600c9de0d782a90256"

diff --git a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
index 3e4137a68c..d6b1773640 100644
--- a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
+++ b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
@@ -4,7 +4,7 @@ together with some small examples. \
 The provided modules are Chipcard::PCSC and Chipcard::PCSC::Card."
 HOMEPAGE = "https://metacpan.org/dist/pcsc-perl"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

 SRC_URI = "https://cpan.metacpan.org/authors/id/W/WH/WHOM/pcsc-perl-${PV}.tar.bz2"
diff --git a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
index 981c946483..7d25ba3c4c 100644
--- a/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
+++ b/meta-oe/recipes-devtools/perl/libperlio-gzip-perl_0.20.bb
@@ -4,7 +4,7 @@ The module implements perlio layer for gzip."

 HOMEPAGE = "https://metacpan.org/pod/PerlIO::gzip"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=55;endline=61;md5=bc3da2dec1fbea59ac91172c5e0eb837"

 DEPENDS += "perl"
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
index 6aa858f2fc..2396ad719c 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
@@ -4,7 +4,7 @@ efficient yet extensible format. Google uses Protocol Buffers for almost \
 all of its internal RPC protocols and file formats."
 HOMEPAGE = "https://github.com/google/protobuf"
 SECTION = "console/tools"
-LICENSE = "BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
     file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c \
diff --git a/meta-oe/recipes-devtools/python/python3-apt_3.1.0.bb b/meta-oe/recipes-devtools/python/python3-apt_3.1.0.bb
index 09c4dfbf67..4f5266143f 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_3.1.0.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_3.1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python-apt is a wrapper to use features of apt from python."
-LICENSE = "GPL-2.0-only & FSFAP"
+LICENSE = "FSFAP AND GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://debian/copyright;md5=4ed7b6862ca422678b17e7d4ed592285"

diff --git a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
index 6b7c46ed3a..fc2e19cf5b 100644
--- a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
+++ b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Linux applications to manage, test and develop devices supporting DMTF Security Protocol and Data Model (SPDM) "
 HOMEPAGE = "https://github.com/westerndigitalcorporation/spdm-utils"
-LICENSE = "Apache-2.0 & MIT"
+LICENSE = "Apache-2.0 AND MIT"
 LIC_FILES_CHKSUM = "\
     file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
     file://LICENSE-APACHE;md5=22a53954e4e0ec258dfce4391e905dac \
diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
index 966d14874e..e5d67ea234 100644
--- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
+++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.3.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "New set of tools for working with SquashFS images"
 SECTION = "base"
-LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later & MIT & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND GPL-3.0-or-later AND LGPL-3.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=a709b68f1ce8a9f10aeea6401446c1f4 \
                     file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 8effd042fb..377801579e 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -1,4 +1,4 @@
-LICENSE = "GPL-2.0-only & GPL-3.0-only & BSD-3-Clause & LGPL-2.0-only & Apache-2.0"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND GPL-2.0-only AND GPL-3.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5fa987762101f748a6cdd951b64ffc6b"
 SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branch=stable \
            file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
index 3b923fb99e..fd86edce68 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "XML-RPC for C/C++ is programming libraries and related tools to h
 write an XML-RPC server or client in C or C++."

 HOMEPAGE = "http://xmlrpc-c.sourceforge.net/"
-LICENSE = "BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"

 SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
diff --git a/meta-oe/recipes-extended/7zip/7zip_26.02.bb b/meta-oe/recipes-extended/7zip/7zip_26.02.bb
index e3674d8410..1e29ad5d9c 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.02.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.02.bb
@@ -1,6 +1,6 @@
 SUMMARY = "7-zip is a commandline utility handling 7z archives."
 HOMEPAGE = "http://www.7-zip.org/"
-LICENSE = "LGPL-2.1-or-later & unRAR & PD & BSD-2-Clause & BSD-3-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND LGPL-2.1-or-later AND UnRAR AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c \
                     file://DOC/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de \
                     file://DOC/License.txt;md5=a4ae6e492874f0008c7600c2ef80daa4 \
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index 4cc0ed2da2..af4bf3a9a9 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -16,7 +16,7 @@ global warming, discover sources of gravitational waves, and many other types \
 of scientific and mathematical research."

 HOMEPAGE = "http://boinc.berkeley.edu/"
-LICENSE = "LGPL-2.0-or-later & GPL-3.0-only"
+LICENSE = "GPL-3.0-only AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 SECTION = "applications"
diff --git a/meta-oe/recipes-extended/byacc/byacc.inc b/meta-oe/recipes-extended/byacc/byacc.inc
index a3d9bfdb70..ac1be18fa5 100644
--- a/meta-oe/recipes-extended/byacc/byacc.inc
+++ b/meta-oe/recipes-extended/byacc/byacc.inc
@@ -4,7 +4,7 @@ DESCRIPTION = "A parser generator utility that reads a grammar specification fro
 parser for it.  The parsers consist of a set of LALR(1) parsing tables and a driver routine written in the C \
 programming language."
 SECTION = "devel"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"

 SRC_URI = "https://invisible-mirror.net/archives/byacc/byacc-${PV}.tgz \
            file://byacc-open.patch \
diff --git a/meta-oe/recipes-extended/byacc/byacc_20260126.bb b/meta-oe/recipes-extended/byacc/byacc_20260126.bb
index cf58f4025c..a8db64f0a1 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20260126.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20260126.bb
@@ -3,7 +3,7 @@
 # "I've found no reliable source which states that byacc must bear a UCB copyright."
 # Setting to PD as this is what the upstream has it as.

-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=0eedc51db8ab59ff33e74b4e8138035c"
 require byacc.inc

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index f310caf0f1..57c0c237c4 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Collects and summarises system performance statistics"
 DESCRIPTION = "collectd is a daemon which collects system performance statistics periodically and provides mechanisms to store the values in a variety of ways, for example in RRD files."
 HOMEPAGE = "https://collectd.org/"
-LICENSE = "GPL-2.0-only & MIT"
+LICENSE = "GPL-2.0-only AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"

 DEPENDS = "curl libpcap libxml2 yajl libgcrypt libtool lvm2"
diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
index cc13fd1067..55c5713ab9 100644
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -7,7 +7,7 @@ automatically generates a parser for the command line arguments."

 HOMEPAGE = "https://github.com/docopt/docopt.cpp"

-LICENSE = "MIT | BSL-1.0"
+LICENSE = "BSL-1.0 OR MIT"
 LIC_FILES_CHKSUM = "\
     file://LICENSE-Boost-1.0;md5=e4224ccaecb14d942c71d31bef20d78c \
     file://LICENSE-MIT;md5=4b242fd9ef20207e18286d73da8a6677 \
diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb
index aeff14fd20..f4da8dfca9 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.14.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The Portable Hardware Locality (hwloc) software package \
  architectures."
 HOMEPAGE = "https://www.open-mpi.org/software/hwloc/"
 SECTION = "base"
-LICENSE = "BSD-3-Clause & ISC"
+LICENSE = "BSD-3-Clause AND ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=883e49a2e0f7142a345f9b0c01a380e7"

 SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.14/downloads/${BP}.tar.bz2"
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.43.bb b/meta-oe/recipes-extended/libidn/libidn_1.43.bb
index 7c478a1495..a4d779c5f2 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.43.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.43.bb
@@ -2,7 +2,7 @@ SUMMARY = "Internationalized Domain Name support library"
 DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
-LICENSE = "(LGPL-2.1-or-later | LGPL-3.0-only) & GPL-3.0-or-later"
+LICENSE = "GPL-3.0-or-later AND (LGPL-2.1-or-later OR LGPL-3.0-only)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
                     file://COPYING.LESSERv2;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a4434
 PACKAGES =+ "idn"
 FILES:idn = "${bindir}/*"

-LICENSE:${PN} = "LGPL-2.1-or-later | LGPL-3.0-only"
+LICENSE:${PN} = "LGPL-2.1-or-later OR LGPL-3.0-only"
 LICENSE:idn = "GPL-3.0-or-later"

 EXTRA_OECONF = "--disable-csharp"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb
index 1f93e60d45..f0dc784e73 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A library to handle Apple Property List format whereas it's binary or XML"
 HOMEPAGE = "https://github.com/libimobiledevice/libplist"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7"

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index e29ec88e06..82ff08706e 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A library to handle Apple Property List format whereas it's binary or XML"
 HOMEPAGE = "https://github.com/libimobiledevice/libplist"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7"

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
index 99f23fef05..0588701863 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
@@ -1,7 +1,7 @@
 SUMMARY = "File locking library"
 HOMEPAGE = "http://packages.qa.debian.org/libl/liblockfile.html"
 SECTION = "libs"
-LICENSE = "LGPL-2.0-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f4ba6ad04fcb05cc30a4cfa5062c55a3"

 SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.17.orig.tar.gz \
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.1.bb
index 5ef7707a86..b58c7d923d 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A library to provide support for making real-mode calls x86 calls
 x86 hardware, vm86 mode is used. On other platforms, x86 emulation is \
 provided."
 HOMEPAGE = "http://www.codon.org.uk/~mjg59/libx86/"
-LICENSE = "MIT & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND MIT"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=633af6c02e6f624d4c472d970a2aca53"

diff --git a/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb b/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
index 0f427a7d05..f56c6a6cea 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "An Enhanced Printer Spooler"
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only | Artistic-1.0"
+LICENSE = "Artistic-1.0 OR GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6570d8d699af1883db9d0e733ac9bfb"

 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
index 1d3992aab3..88aa8adf69 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
@@ -4,7 +4,7 @@ data collection approach that supplements the core tenets of NiFi in dataflow \
 management, focusing on the collection of data at the source of its creation."
 HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
 SECTION = "console/network"
-LICENSE = "Apache-2.0 & MIT & BSD-2-Clause & BSD-3-Clause & BSL-1.0 & Zlib & ISC"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND ISC AND MIT AND Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cb72a6f151096df9e2f5f01b6bf9d735"

 SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=main \
diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index d14a20609a..0f2055c5ca 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "pam-ssh-agent-auth"
 DESCRIPTION = "A PAM module which permits authentication via ssh-agent."
 HOMEPAGE = "http://sourceforge.net/projects/pamsshagentauth/"
 SECTION = "libs"
-LICENSE = "OpenSSL & BSD-2-Clause & BSD-3-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND OpenSSL"
 LIC_FILES_CHKSUM = "file://LICENSE.OpenSSL;md5=8ab01146141ded59b75f8ba7811ed05a \
                     file://OPENSSH_LICENSE;md5=7ae09218173be1643c998a4b71027f9b \
 "
diff --git a/meta-oe/recipes-extended/parallel/parallel_20260522.bb b/meta-oe/recipes-extended/parallel/parallel_20260522.bb
index b055a9af2a..4ceffffbbc 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20260522.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20260522.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "GNU Parallel is a command-line tool for executing jobs in paralle
 It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks."

 HOMEPAGE = "https://www.gnu.org/software/parallel/"
-LICENSE = "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
+LICENSE = "CC-BY-SA-4.0 AND GFDL-1.3-or-later AND GPL-3.0-or-later"

 LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=7130783469368ceb248a4f03e89ea4b8 \
diff --git a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
index 367aedd4c5..2329f366df 100644
--- a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
+++ b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
@@ -6,7 +6,7 @@ are nonetheless useful and familiar to a large audience of end-users."

 HOMEPAGE = "http://search.cpan.org/dist/File-FnMatch/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;beginline=34;endline=37;md5=54fdfac62963b7cece5583ab38f2cf0d"

diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-extended/qad/qad_git.bb
index 4a80b6738f..7a50fbe334 100644
--- a/meta-oe/recipes-extended/qad/qad_git.bb
+++ b/meta-oe/recipes-extended/qad/qad_git.bb
@@ -5,7 +5,7 @@ intervention as Q.A.D allows inputs to be injected via http/https requests. \
 This both eliminates the need to physically interact with the rig and allows \
 for tasks to be carried out entirely automatically."

-LICENSE = "MIT & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=402cce7fbcb6ea9ab5a0378dd7f40806 \
                     file://openqa/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    "
diff --git a/meta-oe/recipes-extended/redis/redis_8.8.0.bb b/meta-oe/recipes-extended/redis/redis_8.8.0.bb
index 865ebd47b6..f9d297a16f 100644
--- a/meta-oe/recipes-extended/redis/redis_8.8.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.8.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Redis key-value store"
 DESCRIPTION = "Redis is an open source, advanced key-value store."
 HOMEPAGE = "http://redis.io"
 SECTION = "libs"
-LICENSE = "RSAL-2 | AGPL-3.0-only | SSPL-1"
+LICENSE = "AGPL-3.0-only OR LicenseRef-RSAL-2 OR LicenseRef-SSPL-1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f1da87999fb281d8a9e3e3b2d0403b4"
 DEPENDS = "readline lua ncurses"

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb
index d4e08fcd62..1019db69cb 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb
@@ -11,7 +11,7 @@ Rsyslog is an enhanced syslogd supporting, among others, MySQL,\

 DEPENDS = "zlib libestr libfastjson bison-native flex-native liblogging"
 HOMEPAGE = "http://www.rsyslog.com/"
-LICENSE = "GPL-3.0-only & LGPL-3.0-only & Apache-2.0"
+LICENSE = "Apache-2.0 AND GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
                     file://COPYING.LESSER;md5=cb7903f1e5c39ae838209e130dca270a \
                     file://COPYING.ASL20;md5=052f8a09206615ab07326ff8ce2d9d32\
diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.25.bb b/meta-oe/recipes-extended/s-nail/s-nail_14.9.25.bb
index 93a852a6df..c68d4390b6 100644
--- a/meta-oe/recipes-extended/s-nail/s-nail_14.9.25.bb
+++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.25.bb
@@ -2,7 +2,7 @@ SUMMARY = "Feature-rich BSD mail(1)"
 HOMEPAGE = "https://www.sdaoden.eu/code.html#s-mailx"
 SECTION = "console/network"

-LICENSE = "ISC & BSD-3-Clause & BSD-4-Clause"
+LICENSE = "BSD-3-Clause AND BSD-4-Clause AND ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87266591c81260f10221f1f38872d023"

 SRC_URI = "https://ftp.sdaoden.eu/${BP}.tar.xz \
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb
index 72242946c1..e5fadd63f2 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb
@@ -8,7 +8,7 @@ lease algorithms: delta leases and paxos leases."
 HOMEPAGE = "https://pagure.io/sanlock"
 SECTION = "utils"

-LICENSE = "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"

 SRC_URI = "git://codeberg.org/sanlock/sanlock.git;protocol=https;branch=master;tag=${BPN}-${PV} \
diff --git a/meta-oe/recipes-extended/simpleiot/simpleiot-licenses.inc b/meta-oe/recipes-extended/simpleiot/simpleiot-licenses.inc
index 105fcfd91b..30d1dcaed8 100644
--- a/meta-oe/recipes-extended/simpleiot/simpleiot-licenses.inc
+++ b/meta-oe/recipes-extended/simpleiot/simpleiot-licenses.inc
@@ -4,7 +4,7 @@
 # Do not modify it by hand, as the contents will be replaced when
 # running the update-modules task.

-LICENSE += "& Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT"
+LICENSE += "AND Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND ISC AND MIT"

 LIC_FILES_CHKSUM += "\
     file://pkg/mod/github.com/!wifx/gonetworkmanager/v2@v2.2.0/LICENSE;md5=6141b9302c8d2bf2b55e88f6b544aca4;spdx=MIT \
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 9d55f324bf..df4f91055d 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Linux CAN network development utilities"
 HOMEPAGE = "https://github.com/linux-can/can-utils"
-LICENSE = "GPL-2.0-only & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"

 DEPENDS = "libsocketcan"
diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
index ba69875c93..2732258b49 100644
--- a/meta-oe/recipes-extended/socketcan/socketcand_git.bb
+++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Socketcand, socketcan over tcp/ip"
-LICENSE = "GPL-2.0-only | BSD-3-Clause"
+LICENSE = "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = " \
     file://LICENSES/BSD-3-Clause;md5=4c00cf8b0a04a9441d8fa24850231d00 \
     file://LICENSES/GPL-2.0-only.txt;md5=f9d20a453221a1b7e32ae84694da2c37 \
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
index bea66ad17c..a59e7d296c 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
 system state and activity from a running Linux instance, then save, \
 filter and analyze."
 HOMEPAGE = "http://www.sysdig.org/"
-LICENSE = "Apache-2.0 & (MIT | GPL-2.0-only)"
+LICENSE = "Apache-2.0 AND (GPL-2.0-only OR MIT)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8fee3d59797546cffab04f3b88b2d44"

 inherit cmake pkgconfig
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
index a149134f5a..2f96662244 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://trac.wxwidgets.org/"
 # WXwindows licence is a modified version of LGPL explicitly allowing not
 # distributing the sources of an application using the library even in the
 # case of static linking.
-LICENSE = "WXwindows"
+LICENSE = "wxWindows"
 LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"

 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake', d)}
diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
index 23e2ff7811..9747de6f29 100644
--- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "C++ bindings for the atk"
 SECTION = "libs"

-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb
index 82e4d21f4e..6cfcb1147d 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "C++ bindings for the atk"
 SECTION = "libs"

-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"

diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
index f10537eca7..982ab0be95 100644
--- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Stub implementation of gnome-doc-utils"
 DESCRIPTION = "This recipe provides m4 macros from gnome-doc-utils project, so \
 that dependent recipes can build. Gnome-doc-utils itself is no longer packaged because \
 it requires libxml2 and python 2 at the same time, which can no longer be satisfied. "
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 \
                     file://${COREBASE}/meta/files/common-licenses/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"

diff --git a/meta-oe/recipes-gnome/gtk+/gtk+.inc b/meta-oe/recipes-gnome/gtk+/gtk+.inc
index f2af7c920e..41d4ce62d7 100644
--- a/meta-oe/recipes-gnome/gtk+/gtk+.inc
+++ b/meta-oe/recipes-gnome/gtk+/gtk+.inc
@@ -4,7 +4,7 @@ set of widgets, GTK+ is suitable for projects ranging from small one-off project
 HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"

-LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "LGPL-2.0-only AND LGPL-2.0-or-later AND LGPL-2.1-or-later"

 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
index b09d1150bb..cc1266dce6 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
@@ -2,7 +2,7 @@ SUMMARY = "C++ bindings for the GTK+ toolkit V3"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"

-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
index e0b91f02a9..4f1d30bcef 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "C++ bindings for the GTK+ toolkit V4"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"

-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
 	file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
 	file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce \
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
index 87b0f5e65d..b73ac5797c 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "C++ bindings for the GTK+ toolkit"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"

-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index 8d65f69354..313b57e366 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A font editor"
 HOMEPAGE = "http://fontforge.github.io/en-US/"
-LICENSE = "BSD-3-Clause & GPL-3.0-only"
+LICENSE = "BSD-3-Clause AND GPL-3.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING.gplv3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE;md5=d042f3d2a8fd7208b704a499168e3c89 \
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
index 07c542d3af..ed1e10e858 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"

 SECTION = "libs"

-LICENSE = "Zlib & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=036a54229112040a743509a86b30c80c \
                     file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077 \
                     file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f \
diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb
index 99c603f994..45ef8a4357 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb
@@ -13,7 +13,7 @@ BUGTRACKER = "https://github.com/kmscon/libtsm/issues"
 CVE_PRODUCT = "libtsm"
 SECTION = "libs"

-LICENSE = "MIT & LGPL-2.1-or-later"
+LICENSE = "LGPL-2.1-or-later AND MIT"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=69e8256cdc4e949f86fedf94b1b320b4 \
     file://LICENSE_htable;md5=2d5025d4aa3495befef8f17206a5b0a1 \
diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
index 6afcf08a16..c00e36ccf4 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "C++ bindings for the pango library"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb b/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
index 6f228b131e..fd921be650 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "C++ bindings for the pango library"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.24.bb b/meta-oe/recipes-graphics/tslib/tslib_1.24.bb
index 6f6e8fd565..8955ea40a2 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.24.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.24.bb
@@ -6,7 +6,7 @@ space interface to touchscreen functionality."
 HOMEPAGE = "http://tslib.org/"

 SECTION = "base"
-LICENSE = "LGPL-2.0-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=fc178bcd425090939a8b634d1d6a9594 \
     file://tests/COPYING;md5=a23a74b3f4caf9616230789d94217acb \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 82b2541a60..b1a32413e3 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Unicode Mingti (printed) TrueType Font"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/CJKUnifonts"
-LICENSE = "Arphic-Public-License"
+LICENSE = "LicenseRef-Arphic-Public-License"
 LIC_FILES_CHKSUM = "file://license/english/ARPHICPL.TXT;md5=4555ed88e9a72fc9562af379d07c3350"

 RPROVIDES:${PN} = "virtual-chinese-font"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
index 3c3207c672..7084a9d475 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.paratype.com/public/"

 SECTION = "x11/fonts"

-LICENSE = "ParaTypeFFL-1.3"
+LICENSE = "LicenseRef-ParaTypeFFL-1.3"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/PT%20Free%20Font%20License_eng.txt;md5=d720f3a281ed81c3f4cfc465e11b1d0d"

 inherit allarch fontcache
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index e14a85b92c..a1ffbea79f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -4,7 +4,7 @@ SUMMARY = "Sazanami Gothic/Mincho Japanese TrueType fonts"
 SUMMARY:ttf-sazanami-gothic = "Sazanami Gothic Japanese TrueType font"
 SUMMARY:ttf-sazanami-mincho = "Sazanami Mincho Japanese TrueType font"
 HOMEPAGE = "http://sourceforge.jp/projects/efont/"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"

 RPROVIDES:${PN} = "virtual-japanese-font"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
index 0131a62eef..c55a810af1 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
@@ -2,7 +2,7 @@ require ttf.inc

 SUMMARY = "Thai Linux Working Group Fonts"
 HOMEPAGE = "http://linux.thai.net/projects/fonts-tlwg"
-LICENSE = "GPL-2.0-only & TLWG"
+LICENSE = "GPL-2.0-only AND LicenseRef-TLWG"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/fonts-tlwg-${PV}/COPYING;md5=3d20cd7eadf4afd5460c0adb32e387fd"

 SRC_URI = "http://linux.thai.net/pub/ThaiLinux/software/fonts-tlwg/fonts-tlwg-${PV}.tar.xz;name=source \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index ff89f7466a..e5ac219938 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -2,7 +2,7 @@ require ttf.inc

 SUMMARY = "Ubuntu Font Family - TTF Version"
 HOMEPAGE = "http://font.ubuntu.com"
-LICENSE = "UFL"
+LICENSE = "LicenseRef-UFL"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=325a1a9029112a2405e743c7f816427b"

 SHA1SUM = "0cef8205"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
index dbc9e67406..0ff5628ed3 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
@@ -3,7 +3,7 @@ require ttf.inc
 SUMMARY = "Japanese TrueType fonts from Vine Linux"
 HOMEPAGE = "http://vlgothic.dicey.org/"

-LICENSE = "ttf-mplus & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND LicenseRef-ttf-mplus"
 LIC_FILES_CHKSUM = "file://LICENSE.en;md5=cc06b20e7a20bdf6c989624405378303 \
                     file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
 "
diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
index f8e5de7554..1287b09766 100644
--- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
@@ -1,4 +1,4 @@
-LICENSE = "ManishSingh"
+LICENSE = "LicenseRef-ManishSingh"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bd1fb9ee90eead85f7b171807b3ab4f2"

 DEPENDS = "libpng libxcursor"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
index d150457fc1..ebd83d7274 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
@@ -1,7 +1,7 @@
 require recipes-graphics/xorg-driver/xorg-driver-video.inc

 SUMMARY = "X.Org X server -- ARM SOC display driver"
-LICENSE = "MIT & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"

 DEPENDS += "virtual/libx11 libdrm xorgproto"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.4.bb
index 9ac3c19e0b..fa3b4ceb00 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.4.bb
@@ -3,7 +3,7 @@ require recipes-graphics/xorg-font/xorg-font-common.inc
 SUMMARY = "X.org cursor fonts"
 HOMEPAGE = "http://cgit.freedesktop.org/xorg/font/cursor-misc/"
 SECTION = "x11/font"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8b32ccac3ad25e75e68478deb7780265"

 DEPENDS = "util-macros-native font-util-native bdftopcf-native"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.3.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.3.bb
index 959a7c9795..2adfcf342f 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.3.bb
@@ -3,7 +3,7 @@ require recipes-graphics/xorg-font/xorg-font-common.inc
 SUMMARY = "X.org miscellaneous fonts"
 HOMEPAGE = "http://cgit.freedesktop.org/xorg/font/misc-misc/"
 SECTION = "x11/font"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=200c507f595ee97008c7c5c3e94ab9a8"

 DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
index fe980e3e6f..f6c1b0c60c 100644
--- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
@@ -5,7 +5,7 @@ SUMMARY = "Broadcom Bluetooth firmware files"
 DESCRIPTION = "Firmware for Broadcom Bluetooth devices. Note that in case of BT+WiFi devices, separate WiFi firmware might be needed."
 HOMEPAGE = "https://github.com/winterheart/broadcom-bt-firmware"

-LICENSE = "Firmware-Broadcom-WIDCOMM"
+LICENSE = "LicenseRef-Firmware-Broadcom-WIDCOMM"
 NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"

 LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
index b8ef092262..8ab0a28f9d 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Linux dynamic kernel patching infrastructure"
 DESCRIPTION = "kpatch is a Linux dynamic kernel patching infrastructure which allows you to patch a running kernel without rebooting or restarting any processes."
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 DEPENDS = "elfutils bash"

 SRC_URI = "git://github.com/dynup/kpatch.git;protocol=https;branch=master \
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
index 8f27db9bf0..117716dad2 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
@@ -3,7 +3,7 @@

 SUMMARY = "Library to parse raw trace event formats	"
 HOMEPAGE = "https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb
index ed8085b73a..c3a8c4b768 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb
@@ -1,7 +1,7 @@
 SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
 to allow minimal and customized crash dumps"
 HOMEPAGE = "https://www.linutronix.de/minicoredumper/"
-LICENSE = " LGPL-2.1-only & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=be36ac4e46b05b190e6b9d3ec415aa63 \
                     file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
                     file://COPYING.LGPLv2.1;md5=3254c7b4d4712a396bd036bfb211a908 \
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index 38bb957430..df1045e6df 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -4,7 +4,7 @@ of profiling all running code at low overhead."
 HOMEPAGE = "http://oprofile.sourceforge.net/news/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16191&atid=116191"

-LICENSE = "LGPL-2.1-or-later & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://libopagent/opagent.h;beginline=5;endline=26;md5=4f16f72c7a493d8a4704aa18d03d15c6 \
                    "
diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 6686f1ccd9..dbc44e1b22 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -1,7 +1,7 @@
 SUMMARY = "User-space front-end command-line tool for ftrace"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git"

-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index c837dad87c..4cc4eebe6b 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -4,7 +4,7 @@ WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
 Research, Amiga IFF/8SVX, and NIST SPHERE."
 HOMEPAGE = "http://www.68k.org/~michael/audiofile/"
 SECTION = "libs"
-LICENSE = "LGPL-2.0-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
index 3b3ea85349..e687514898 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
@@ -6,7 +6,7 @@ flow model and lock-free programming techniques for graph access have \
 been used to have a more dynamic and robust system."
 SECTION = "libs/multimedia"

-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://common/JackControlAPI.cpp;beginline=5;endline=19;md5=9d1921199e203163f160313243f853d6 \
     file://common/JackControlAPI.h;beginline=4;endline=18;md5=9d1921199e203163f160313243f853d6 \
diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
index e04e763776..ed1033f444 100644
--- a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
+++ b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Library for reading mod-like audio files"
 HOMEPAGE = "http://modplug-xmms.sf.net"

-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9182faa1f7c316f7b97d404bcbe3685"

 SRC_URI = "${SOURCEFORGE_MIRROR}/modplug-xmms/libmodplug-${PV}.tar.gz \
diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index ed9f561a5e..01720f7300 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Freedesktop sound theme"
 HOMEPAGE = "http://freedesktop.org/wiki/Specifications/sound-theme-spec"
-LICENSE = "GPL-2.0-or-later & CC-BY-3.0 & CC-BY-SA-3.0"
+LICENSE = "CC-BY-3.0 AND CC-BY-SA-3.0 AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://CREDITS;md5=3213e601ce34bb42ddc3498903ac4e69"

 # glib-2.0 for glib-gettext.m4 which provides AM_GLIB_GNU_GETTEXT
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.32.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.32.0.bb
index d19d518b80..9c24cd470c 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.32.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.32.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "v4l2 and IR applications"
 HOMEPAGE = "https://git.linuxtv.org/v4l-utils.git"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0ebceacbd7029b5e7051e9f529542b7c \
                     file://COPYING.libv4l;md5=88b8889c2c4329d4cf18ce5895e64c16"
 PROVIDES = "libv4l media-ctl"
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
index 0fe0bb1197..e4b9513cf5 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_5.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.gaia-gis.it/fossil/libspatialite/"
 SECTION = "libs"
 DEPENDS = "proj geos sqlite3 libxml2 zlib"

-LICENSE = "MPL-1.1 & GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later AND MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e92e1a36cc384b60f5b31dde0bdd39e"

 SRC_URI = "http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-${PV}.tar.gz \
diff --git a/meta-oe/recipes-security/audit/audit_4.1.4.bb b/meta-oe/recipes-security/audit/audit_4.1.4.bb
index e349ee76d0..363746ccf0 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.4.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.4.bb
@@ -4,7 +4,7 @@ storing and searching the audit records generated by the audit subsystem \
 in the Linux kernel."
 HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
 SECTION = "base"
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https;tag=v${PV} \
diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
index 2e7503cd42..e13d95acf3 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "\
 HOMEPAGE = "http://people.redhat.com/dhowells/keyutils"
 SECTION = "base"

-LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"

 LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
                     file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
diff --git a/meta-oe/recipes-security/nmap/nmap_7.99.bb b/meta-oe/recipes-security/nmap/nmap_7.99.bb
index 9958581187..ea792d30f6 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.99.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.99.bb
@@ -1,7 +1,7 @@
 SUMMARY = "network auditing tool"
 DESCRIPTION = "Nmap (Network Mapper) is a free and open source (license) utility for network discovery and security auditing.\nGui support via appending to IMAGE_FEATURES x11-base in local.conf"
 SECTION = "security"
-LICENSE = "NPSL"
+LICENSE = "LicenseRef-NPSL"

 LIC_FILES_CHKSUM = "file://LICENSE;md5=895af8527fe4bcb72f271fd1841fd2f6"

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb b/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
index 5d75cf0fb4..9c4d1251fd 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "PKCS#11 HSM/Token Emulator"
 HOMEPAGE = "https://www.opendnssec.org/softhsm/"
-LICENSE = "BSD-2-Clause & ISC"
+LICENSE = "BSD-2-Clause AND ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"

 DEPENDS = "sqlite3"
diff --git a/meta-oe/recipes-shells/mksh/mksh_59c.bb b/meta-oe/recipes-shells/mksh/mksh_59c.bb
index d27320cf1f..b475ac09a5 100644
--- a/meta-oe/recipes-shells/mksh/mksh_59c.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_59c.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The MirBSD Korn Shell - an enhanced version of the public domain
 HOMEPAGE = "http://www.mirbsd.org/mksh.htm"
 SECTION = "base/shell"

-LICENSE = "${@bb.utils.contains("TCLIBC", "glibc", "MirOS & ISC", "MirOS", d)}"
+LICENSE = "${@bb.utils.contains("TCLIBC", "glibc", "MirOS AND ISC", "MirOS", d)}"
 LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=26;md5=6efc2c249328e4d2bd3e595d5b1f9d31 \
                     file://strlcpy.c;beginline=1;endline=17;md5=d953f28f0c43ee29e238ec9bc15df2a0 \
                    "
diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
index 04225a24a2..331c92707d 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Zsh is a shell designed for interactive use, although it is also
 HOMEPAGE = "http://www.zsh.org"
 SECTION = "base/shell"

-LICENSE = "zsh"
+LICENSE = "LicenseRef-zsh"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=1a4c4cda3e8096d2fd483ff2f4514fec"

 DEPENDS = "ncurses bison-native libcap libpcre2 gdbm groff-native"
diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index 532829a53a..47edc4ae86 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Anthy is a system for Japanese input method. It converts Hiragana text to Kana Kanji mixed text."
 HOMEPAGE = "http://anthy.sourceforge.jp"

-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=11f384074d8e93e263b5664ef08a411a \
     file://alt-cannadic/COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b \
 "
diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
index 9d905cc22e..3afc9c0b31 100644
--- a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Frame handles simultaneous touches"

 HOMEPAGE = "https://launchpad.net/frame"

-LICENSE = "GPL-3.0-only & LGPL-3.0-only"
+LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02 \
     file://COPYING.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 2ac535d258..911dbe88a1 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -7,7 +7,7 @@ system-wide input gesture recognition mechanism."

 HOMEPAGE = "https://launchpad.net/geis"

-LICENSE = "GPL-3.0-only & LGPL-3.0-only"
+LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6 \
     file://COPYING.GPL;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 1a5900b78b..1727672cdd 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Gesture Recognition And Instantiation Library"

 HOMEPAGE = "https://launchpad.net/grail"

-LICENSE = "GPL-3.0-only & LGPL-3.0-only"
+LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02 \
     file://COPYING.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta-oe/recipes-support/cmark/cmark_0.31.2.bb b/meta-oe/recipes-support/cmark/cmark_0.31.2.bb
index b820d9fd65..dd3a01d5b4 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.31.2.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.31.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "CommonMark parsing and rendering library and program in C"
 HOMEPAGE = "https://github.com/commonmark/cmark"
-LICENSE = "BSD-2-Clause & MIT"
+LICENSE = "BSD-2-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"

 SRC_URI = "git://github.com/commonmark/cmark.git;branch=master;protocol=https;tag=${PV}"
diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index cafbaaa696..447531f312 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Making color management just work"
 HOMEPAGE = "https://www.freedesktop.org/software/colord/"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
index 3450f9a339..b3ccf038f6 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The composefs project combines several underlying Linux \
 features to provide a very flexible mechanism to support read-only mountable \
 filesystem trees, stacking on top of an underlying "lower" Linux filesystem."
 HOMEPAGE = "https://github.com/containers/composefs"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & Apache-2.0"
+LICENSE = "Apache-2.0 AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "\
     file://BSD-2-Clause.txt;md5=121c8a0a8fa5961a26b7863034ebcce8 \
     file://COPYING;md5=5cbca48090f7fe0169186a551a5bf78c \
diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
index 4b8bf162fa..08955f21d1 100644
--- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
+++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Modern C++ network programming libraries."
 # for most functionality.

 SECTION = "libs"
-LICENSE = "BSL-1.0 & MIT & Python-2.0"
+LICENSE = "BSL-1.0 AND MIT AND Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 PV = "0.13.0"

diff --git a/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb b/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
index 2f9c14e700..4bff47eb68 100644
--- a/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Utility that provides userspace support for reading and writing to the i.MX fuses"

-LICENSE = "BSD-3-Clause & ${GO_MOD_LICENSES}"
+LICENSE = "BSD-3-Clause AND ${GO_MOD_LICENSES}"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=201414b6610203caed355323b1ab3116"
 require ${BPN}-licenses.inc

diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index cc83015e65..4cc294c31e 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -13,7 +13,7 @@ data."
 SECTION = "System/Servers"

 LIC_FILES_CHKSUM = "file://src/prot.c;beginline=1;endline=1;md5=96964cadf07e8f8c1e2ffb3b507dd647"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"

 DEPENDS += "coreutils"

diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-support/fltk/fltk.inc
index 9d0eb549bd..ab4aea73b4 100644
--- a/meta-oe/recipes-support/fltk/fltk.inc
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -1,7 +1,7 @@
 SUMMARY = "FLTK is a cross-platform C++ GUI toolkit"
 HOMEPAGE = "https://www.fltk.org"
 SECTION = "libs"
-LICENSE = "LGPL-2.0-only & FLTK"
+LICENSE = "LGPL-2.0-only AND LicenseRef-FLTK"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"

 SRC_URI = " \
diff --git a/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
index 5a0c894e86..f901b30efe 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.18.2.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
               "
 HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = " \
     file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LGPL2.txt;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
index 974d99434a..ca2df394e2 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language binding \
 for the development of SOAP Web Services and clients."
 SECTION = "devel"
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "LicenseRef-GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
                     file://GPLv2_license.txt;md5=a33672dbe491b6517750a0389063508b"

diff --git a/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb b/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
index 7d2c87d02d..cfbe51840e 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A Simple library for communicating with USB and Bluetooth HID devices
 HOMEPAGE = "http://www.signal11.us/oss/hidapi/"
 SECTION = "libs"

-LICENSE = "BSD-3-Clause | GPL-3.0-only"
+LICENSE = "BSD-3-Clause OR GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077"

 DEPENDS = "libusb udev"
diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
index 7f6fba995c..9960e11357 100644
--- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
@@ -3,10 +3,10 @@ SUMMARY = "Hunspell dictionaries used by Maliit"
 #Provided by Titus Wormer (wooorm) https://github.com/wooorm/dictionaries

 LICENSE = "MIT"
-LICENSE:dictionaries/bg = "LGPL 2.1"
-LICENSE:dictionaries/br = "GPL 3.0"
-LICENSE:dictionaries/ca-valencia = "GPL 2.0 & LGPL-2.1-only"
-LICENSE:dictionaries/ca = "GPL 2.0 & LGPL-2.1-only"
+LICENSE:dictionaries/bg = "LGPL-2.1"
+LICENSE:dictionaries/br = "GPL-3.0"
+LICENSE:dictionaries/ca-valencia = "GPL-2.0 AND LGPL-2.1-only"
+LICENSE:dictionaries/ca = "GPL-2.0 AND LGPL-2.1-only"
 LICENSE:dictionaries/cs = "GPL-2.0-only"
 LICENSE:dictionaries/da = "GPL-2.0-only"
 LICENSE:dictionaries/de-AT = "GPL-3.0-only"
@@ -15,10 +15,10 @@ LICENSE:dictionaries/de = "GPL-3.0-only"
 LICENSE:dictionaries/el-polyton = "GPL-2.0-only"
 LICENSE:dictionaries/el = "GPL-2.0-only"
 LICENSE:dictionaries/en-AU = "LGPL-2.0-only"
-LICENSE:dictionaries/en-CA = "MIT & BSD"
+LICENSE:dictionaries/en-CA = "MIT AND LicenseRef-BSD"
 LICENSE:dictionaries/en-GB = "LGPL-2.0-only"
-LICENSE:dictionaries/en-US = "MIT & BSD"
-LICENSE:dictionaries/en-ZA = "LGPL 2.1"
+LICENSE:dictionaries/en-US = "MIT AND LicenseRef-BSD"
+LICENSE:dictionaries/en-ZA = "LGPL-2.1"
 LICENSE:dictionaries/eo = "GPL-2.0-only"
 LICENSE:dictionaries/es = "GPL-3.0-only"
 LICENSE:dictionaries/et = "LGPL-2.1-only"
@@ -37,12 +37,12 @@ LICENSE:dictionaries/hy-arevela = "GPL-2.0-only"
 LICENSE:dictionaries/hy-arevmda = "GPL-2.0-only"
 LICENSE:dictionaries/ia = "GPL-3.0-only"
 LICENSE:dictionaries/ie = "Apache-2.0"
-LICENSE:dictionaries/is = "CC BY-SA 3.0 & CC BY 4.0"
+LICENSE:dictionaries/is = "CC-BY-SA-3.0 AND CC-BY-4.0"
 LICENSE:dictionaries/it = "GPL-3.0-only"
-LICENSE:dictionaries/ko = "MPL-1.1 & GPL-2.0-only & LGPL-2.1-only"
+LICENSE:dictionaries/ko = "GPL-2.0-only AND LGPL-2.1-only AND MPL-1.1"
 LICENSE:dictionaries/la = "GPL-3.0-only"
 LICENSE:dictionaries/lb = "EUPL-1.1"
-LICENSE:dictionaries/lt = "Other"
+LICENSE:dictionaries/lt = "LicenseRef-Other"
 LICENSE:dictionaries/ltg = "LGPL-2.1-only"
 LICENSE:dictionaries/lv = "LGPL-2.1-only"
 LICENSE:dictionaries/mk = "GPL-3.0-only"
@@ -50,22 +50,22 @@ LICENSE:dictionaries/mn = "GPL-2.0-only"
 LICENSE:dictionaries/nb = "GPL-2.0-only"
 LICENSE:dictionaries/nds = "GPL-2.0-only"
 LICENSE:dictionaries/ne = "LGPL-2.1-only"
-LICENSE:dictionaries/nl = "BSD"
+LICENSE:dictionaries/nl = "LicenseRef-BSD"
 LICENSE:dictionaries/nn = "GPL-2.0-only"
 LICENSE:dictionaries/pl = "GPL-3.0-only"
-LICENSE:dictionaries/pt-BR = "LGPL 2.1"
+LICENSE:dictionaries/pt-BR = "LGPL-2.1"
 LICENSE:dictionaries/pt = "GPL-2.0-only"
 LICENSE:dictionaries/ro = "GPL-2.0-only"
-LICENSE:dictionaries/ru = "BSD"
+LICENSE:dictionaries/ru = "LicenseRef-BSD"
 LICENSE:dictionaries/rw = "GPL-3.0-only"
 LICENSE:dictionaries/sk = "GPL-2.0-only"
 LICENSE:dictionaries/sl = "GPL-2.0-only"
-LICENSE:dictionaries/sr-Latn = "LGPL 3.0"
-LICENSE:dictionaries/sr = "LGPL 3.0"
-LICENSE:dictionaries/sv = "LGPL 3.0"
+LICENSE:dictionaries/sr-Latn = "LGPL-3.0"
+LICENSE:dictionaries/sr = "LGPL-3.0"
+LICENSE:dictionaries/sv = "LGPL-3.0"
 LICENSE:dictionaries/tr = "MIT"
-LICENSE:dictionaries/uk = "GPL 2.0"
-LICENSE:dictionaries/vi = "GPL 3.0"
+LICENSE:dictionaries/uk = "GPL-2.0"
+LICENSE:dictionaries/vi = "GPL-3.0"
 LIC_FILES_CHKSUM = " \
     file://dictionaries/bg/license;md5=ab14e2ded1a43b84be9aba2be64b9814 \
     file://dictionaries/br/license;md5=2e046c64edc0a4e47fb3ea614e6c82c4 \
diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
index 28136ea104..23f6ac87d8 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A spell checker and morphological analyzer library"
 HOMEPAGE = "http://hunspell.github.io/"
-LICENSE = "GPL-2.0-only | LGPL-2.1-only"
+LICENSE = "GPL-2.0-only OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=75859989545e37968a99b631ef42722e \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
index 97117eb914..c9e73a83b4 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "i.MX code signing tool"
 DESCRIPTION = "Code signing support that integrates the HABv4 and AHAB library for i.MX processors"
-LICENSE = "BSD-3-Clause & Apache-2.0"
+LICENSE = "Apache-2.0 AND BSD-3-Clause"

 LIC_FILES_CHKSUM = "\
     file://LICENSE.bsd3;md5=14aba05f9fa6c25527297c8aac95fcf6 \
diff --git a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
index 4a1052e75b..3f2e0d260d 100644
--- a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
+++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "base64 encoding/decoding library - runtime library \
 libb64 is a library of ANSI C routines for fast encoding/decoding data into \
 and from a base64-encoded format"
 HOMEPAGE = "https://github.com/libb64"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=81296a564fa0621472714aae7c763d96"

 PV .= "+2.0.0.2+git"
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 914058b5d0..55caad8f6e 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://uscilab.github.io/cereal/"

 SECTION = "libs"

-LICENSE = "BSD-3-Clause & MIT & BSL-1.0"
+LICENSE = "BSD-3-Clause AND BSL-1.0 AND MIT"
 LIC_FILES_CHKSUM = "\
     file://LICENSE;md5=4921372a1fb38469e667c38b17a1c4b3 \
     file://include/cereal/external/rapidxml/license.txt;md5=d63ab70ba21ca0544b03284958324301 \
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
index 5cb7407608..6121d5eedd 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
 HOMEPAGE = "http://eigen.tuxfamily.org/"
-LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-2.0-only & Minpack"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND GPL-2.0-only AND MPL-2.0 AND Minpack"
 # The GPL code is only used for benchmark tests and does not affect what is installed.
-LICENSE:${PN} = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & Minpack"
-LICENSE:${PN}-dbg = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & Minpack"
-LICENSE:${PN}-dev = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & Minpack"
+LICENSE:${PN} = "Apache-2.0 AND BSD-3-Clause AND MPL-2.0 AND Minpack"
+LICENSE:${PN}-dbg = "Apache-2.0 AND BSD-3-Clause AND MPL-2.0 AND Minpack"
+LICENSE:${PN}-dev = "Apache-2.0 AND BSD-3-Clause AND MPL-2.0 AND Minpack"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
                     file://COPYING.APACHE;md5=8de23b8e93c63005353056b2475e9aa5 \
                     file://COPYING.BSD;md5=2dd0510ee95e59ca28834b875bc96596 \
diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index 6faab82ad5..7a2fa2d1d9 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -3,7 +3,7 @@ FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
 including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "\
     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
index 3af0edea2b..b3cb33ac89 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -2,7 +2,7 @@ require libgpiod.inc

 inherit meson systemd update-rc.d useradd gobject-introspection

-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
+LICENSE = "CC-BY-SA-4.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://LICENSES/GPL-2.0-or-later.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSES/LGPL-2.1-or-later.txt;md5=4b54a1fd55a448865a0b32d41598759d \
diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
index 0478ef3403..0e861971e6 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
@@ -7,7 +7,7 @@ royalties to other parties. \

 HOMEPAGE = "http://www.iodbc.org/"

-LICENSE = "LGPL-2.0-only | BSD-2-Clause"
+LICENSE = "BSD-2-Clause OR LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=8c0138a8701f0e1282f5c8b2c7d39114 \
                     file://LICENSE.BSD;md5=5b36348a404e1d65b57df8d33fd6e414 \
                     "
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
index be8a29d998..0e4a00bc2d 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery_3.3.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "JavaScript library for dynamic web applications"
 HOMEPAGE = "https://jquery.com/"
-LICENSE = "GPL-2.0-only | MIT"
+LICENSE = "GPL-2.0-only OR MIT"
 LIC_FILES_CHKSUM = "file://usr/share/doc/libjs-jquery/copyright;md5=04bfd6e5b918af29f2f79ce44527da62"

 SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/main/j/jquery/${BPN}_${PV}~dfsg-3_all.deb"
diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
index ffd26d263c..1f0320d5b6 100644
--- a/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
+++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.10.18.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pure-JavaScript CSS selector engine"
 HOMEPAGE = "https://github.com/jquery/sizzle/wiki"
-LICENSE = "GPL-2.0-only & MIT & AFL-2.1"
+LICENSE = "AFL-2.1 AND GPL-2.0-only AND MIT"
 LIC_FILES_CHKSUM = "file://MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9"

 SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/sizzle_1.10.18.orig.tar.gz"
diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.23.bb b/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
index 4411de955c..d670f49b5e 100644
--- a/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
@@ -2,7 +2,7 @@ SUMMARY = "Interactive Connectivity Establishment library"
 DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactive Connectivity Establishment standard (ICE)."
 HOMEPAGE = "http://nice.freedesktop.org/wiki/"

-LICENSE = "LGPL-2.1-only & MPL-1.1"
+LICENSE = "LGPL-2.1-only AND MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=963cc62096d5412ee9580043babb8b60 \
                     file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb b/meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
index aab4d03ed2..c12090a355 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
@@ -6,7 +6,7 @@ and decode commands and payloads, and utilities to connect, scan, and \
 manage nvme devices on a Linux system."
 HOMEPAGE = "https://github.com/linux-nvme/${BPN}"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only & CC0-1.0 & MIT"
+LICENSE = "CC0-1.0 AND LGPL-2.1-only AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
index 2462786aae..94286872b3 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "API for managing information about operating systems, hypervisors and the (virtual) hardware devices."
 HOMEPAGE = "https://libosinfo.org"

-LICENSE = "LGPL-2.1-only & GPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b0e9926530c269f5ae95560370195af"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"

diff --git a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb b/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
index e99f0e46b6..e134d93cbd 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "raw image decoder"
-LICENSE = "LGPL-2.1-only | CDDL-1.0"
+LICENSE = "CDDL-1.0 OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1d66195044cfbe4327c055d1c9c1a229"

 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.22-stable;protocol=https;tag=${PV}"
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 99d0939b34..ec26056b30 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A Library to Access SMI MIB Information"
 HOMEPAGE = "https://www.ibr.cs.tu-bs.de/projects/libsmi"

-LICENSE = "BSD-3-Clause & TCL"
+LICENSE = "BSD-3-Clause AND TCL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"

 SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
diff --git a/meta-oe/recipes-support/liburing/liburing_2.12.bb b/meta-oe/recipes-support/liburing/liburing_2.12.bb
index 2519d650a6..5a69731a8f 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.12.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.12.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/axboe/liburing"
 BUGTRACKER = "https://github.com/axboe/liburing/issues"
 SECTION = "libs"

-LICENSE = "LGPL-2.1-only | MIT"
+LICENSE = "LGPL-2.1-only OR MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"

 SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
index 84f97aab2c..3a9a0f619f 100644
--- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
+++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "USB Gadget Configfs Library"

-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 7b12b911d8..31453cf304 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "USB Gadget neXt Configfs Library"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"

diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb b/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
index cc28860b04..6d9746c9ad 100644
--- a/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
+++ b/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
@@ -4,7 +4,7 @@ This library provides interface for terminal emulators such as \
 screen and xterm to record user sessions to utmp and wtmp files."
 HOMEPAGE = "ftp://ftp.altlinux.org/pub/people/ldv/utempter"
 SECTION = "System Environment/Libraries"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-only & MIT"
+LICENSE = "GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.0-only AND MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"

 SRCREV = "63825e2244629d44dae21132b1065d7ecc0491c0"
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 675c33cedd..77dec89bbf 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -1,7 +1,7 @@
 HOMEPAGE = "https://www.sourceware.org/lvm2/"
 SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
index 8385b63543..4b47b3a9d4 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
@@ -13,7 +13,7 @@ by several applications e.g. to determine MIME types for filenames."

 SECTION = "System Environment/Base"

-LICENSE = "PD & MIT"
+LICENSE = "MIT AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8dce08227d135cfda1f19d4c0c6689de"

 SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
diff --git a/meta-oe/recipes-support/media-types/media-types_14.0.0.bb b/meta-oe/recipes-support/media-types/media-types_14.0.0.bb
index af91a584bd..0f28a7aca4 100644
--- a/meta-oe/recipes-support/media-types/media-types_14.0.0.bb
+++ b/meta-oe/recipes-support/media-types/media-types_14.0.0.bb
@@ -1,6 +1,6 @@
 SECTION = "base"
 SUMMARY = "MIME files 'mime.types'"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f3ace4a4ff8aa9e374be6080e41a822e"
 DEPENDS = "file"
 RDEPENDS:${PN} = "perl"
diff --git a/meta-oe/recipes-support/mg/mg_20230501.bb b/meta-oe/recipes-support/mg/mg_20230501.bb
index 04811f1bdd..9816e9d383 100644
--- a/meta-oe/recipes-support/mg/mg_20230501.bb
+++ b/meta-oe/recipes-support/mg/mg_20230501.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A portable version of the mg maintained by the OpenBSD team"
 HOMEPAGE = "http://homepage.boetes.org/software/mg/"
-LICENSE = "PD"
+LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://version.c;md5=a8e0b53d89d277bf3b40878ac568bedd"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
diff --git a/meta-oe/recipes-support/nspr/nspr_4.39.bb b/meta-oe/recipes-support/nspr/nspr_4.39.bb
index f28d5aaaf7..39083c2f66 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.39.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.39.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Netscape Portable Runtime Library"
 HOMEPAGE =  "http://www.mozilla.org/projects/nspr/"
-LICENSE = "GPL-2.0-only | MPL-2.0 | LGPL-2.1-only"
+LICENSE = "GPL-2.0-only OR LGPL-2.1-only OR MPL-2.0"
 LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=6;md5=90c2fdee38e45d6302abcfe475c8b5c5 \
                     file://Makefile.in;beginline=4;endline=38;md5=beda1dbb98a515f557d3e58ef06bca99"
 SECTION = "libs/network"
diff --git a/meta-oe/recipes-support/nss/nss_3.125.bb b/meta-oe/recipes-support/nss/nss_3.125.bb
index 4a9db7e6aa..75965be9c7 100644
--- a/meta-oe/recipes-support/nss/nss_3.125.bb
+++ b/meta-oe/recipes-support/nss/nss_3.125.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 DEPENDS = "sqlite3 nspr zlib nss-native"
 DEPENDS:class-native = "sqlite3-native nspr-native zlib-native"

-LICENSE = "(MPL-2.0 & MIT) | (MPL-2.0 & GPL-2.0-or-later & MIT) | (MPL-2.0 & LGPL-2.1-or-later & MIT)"
+LICENSE = "GPL-2.0-or-later AND MIT AND MPL-2.0 OR LGPL-2.1-or-later AND MIT AND MPL-2.0 OR MIT AND MPL-2.0"

 LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 07de1d5328..d80e700f2f 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -2,7 +2,7 @@ SUMMARY = "System-level performance monitoring and performance management"
 HOMEPAGE = "http://www.pcp.io"
 SECTION =  "Applications/System"

-LICENSE = "GPL-2.0-or-later & LGPL-2.1-only"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
index 83edca23e0..d6427d2eba 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "PC/SC Lite smart card framework and applications"
 HOMEPAGE = "https://pcsclite.apdu.fr/"
-LICENSE = "BSD-3-Clause & GPL-3.0-or-later"
+LICENSE = "BSD-3-Clause AND GPL-3.0-or-later"
 LICENSE:${PN} = "BSD-3-Clause"
 LICENSE:${PN}-lib = "BSD-3-Clause"
 LICENSE:${PN}-doc = "BSD-3-Clause"
 LICENSE:${PN}-dev = "BSD-3-Clause"
-LICENSE:${PN}-dbg = "BSD-3-Clause & GPL-3.0-or-later"
+LICENSE:${PN}-dbg = "BSD-3-Clause AND GPL-3.0-or-later"
 LICENSE:${PN}-spy = "GPL-3.0-or-later"
 LICENSE:${PN}-spy-dev = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9637dc508442c2f458df6444fca97e09"
diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
index 5433659af4..1f0190d054 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
@@ -2,7 +2,7 @@ SUMMARY = "Encoding files for Poppler"
 DESCRIPTION = "Encoding files for use with poppler that enable poppler to \
                correctly render CJK and Cyrrilic."
 HOMEPAGE = "https://poppler.freedesktop.org/"
-LICENSE = "BSD-3-Clause & GPL-2.0-only & GPL-3.0-or-later"
+LICENSE = "BSD-3-Clause AND GPL-2.0-only AND GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96287d49ec274d9c3222b5f966c132fd \
                     file://COPYING.adobe;md5=a790726a74164c30b5de1ef93fd69e99 \
                     file://COPYING.gpl2;md5=751419260aa954499f7abaabaa882bbe \
diff --git a/meta-oe/recipes-support/procmail/procmail_3.24.bb b/meta-oe/recipes-support/procmail/procmail_3.24.bb
index 01b48cd148..e5041d24c3 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.24.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.24.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/BuGlessRB/procmail;protocol=https;branch=master;tag=
            file://procmail-3.24-consolidated_fixes-1.patch \
           "

-LICENSE = "GPL-2.0-only & Artistic-1.0"
+LICENSE = "Artistic-1.0 AND GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a71e50e197a992c862379e576e669757 \
     file://Artistic;md5=505e00d03c3428cde21b17b2a386590e"

diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
index 1b77103a8d..fdadc3e064 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Library for parsing and serializing RDF syntaxes"
-LICENSE = "GPL-2.0-only | LGPL-2.1-only | Apache-2.0"
+LICENSE = "Apache-2.0 OR GPL-2.0-only OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.txt;md5=f7fed8b6ab9289b77f5c14f3f79572cc \
     file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
diff --git a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
index 86ea350d1d..1deb21660a 100644
--- a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
+++ b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "read-edid is a set of two tools - get-edid, which gets the raw \
 	       section."
 HOMEPAGE = "http://www.polypux.org/projects/read-edid/"
 SECTION = "console/utils"
-LICENSE = "read-edid"
+LICENSE = "LicenseRef-read-edid"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=292c42e2aedc4af636636bf7af0e2b26"

 SRC_URI = "http://polypux.org/projects/read-edid/read-edid-${PV}.tar.gz \
diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.43.bb b/meta-oe/recipes-support/remmina/remmina_1.4.43.bb
index 518c75a1a8..ab48dd7c89 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.43.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.43.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A feature rich Remote Desktop Application written in GTK+"
 HOMEPAGE = "https://remmina.org"
 SECTION = "Support"
-LICENSE = "GPL-2.0-only & OpenSSL"
+LICENSE = "GPL-2.0-only AND OpenSSL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"

 DEPENDS = " \
diff --git a/meta-oe/recipes-support/rtkit/rtkit_0.14.bb b/meta-oe/recipes-support/rtkit/rtkit_0.14.bb
index e63c786c95..b86d316d41 100644
--- a/meta-oe/recipes-support/rtkit/rtkit_0.14.bb
+++ b/meta-oe/recipes-support/rtkit/rtkit_0.14.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "REALTIMEKIT Realtime Policy and Watchdog Daemon"
 HOMEPAGE = "https://gitlab.freedesktop.org/pipewire/rtkit"
-LICENSE = "GPL-3.0-only & BSD-3-Clause"
+LICENSE = "BSD-3-Clause AND GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8e768468b658b3ed44971b53d4a6716"

 SRC_URI = "git://gitlab.freedesktop.org/pipewire/rtkit.git;protocol=https;branch=master"
diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
index 4af20fe72a..5e3b4138cc 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "This package contains low level utilities for devices that use th
 HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"

-LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f685699d3ac82f108aa880043fa3feb7"

 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
index 1797112a90..c8f286d723 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A collection of powerful tools for manipulating EPROM load files."
 SECTION = "devel"
-LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later"
+LICENSE = "GPL-3.0-or-later AND LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"

 SRC_URI = " \
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index e66c04b9fc..cf411b7c78 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Synergy - control multiple computers with one keyboard and mouse"
 HOMEPAGE = "http://synergy-project.org"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=54c1fc8d8bb6776ae501acfb1585e9d6"
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "LicenseRef-GPL-2.0-with-OpenSSL-exception"
 SECTION = "x11/utils"

 DEPENDS = "virtual/libx11 libxtst libxinerama curl openssl"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb
index 9ca1399ac3..32ec456f50 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb
@@ -9,7 +9,7 @@ ideal for firewalled environments. \
 "
 HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"

-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=924958cefc9f7de3e0b818832b8a1cec"

 # util-linux added to get libuuid
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
index 081b315b9b..d4c5385ae0 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.10.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"

 DEPENDS = " \
diff --git a/meta-oe/recipes-support/uim/uim_1.9.6.bb b/meta-oe/recipes-support/uim/uim_1.9.6.bb
index ac2e1118f4..8629bee4e8 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.6.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A multilingual user input method library"
 HOMEPAGE = "http://uim.freedesktop.org/"
-LICENSE = "BSD-3-Clause & LGPL-2.0-or-later"
+LICENSE = "BSD-3-Clause AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab2826b41ca0ff4030d38cc39791d1c8"
 SECTION = "inputmethods"

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
index d4be4b14c8..161073103d 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "RFC 3986 compliant URI parsing library"
 HOMEPAGE = "https://uriparser.github.io"

-LICENSE = "BSD-3-Clause & LGPL-2.1-or-later"
+LICENSE = "BSD-3-Clause AND LGPL-2.1-or-later"
 LICENSE:${PN} = "BSD-3-Clause"
 LICENSE:${PN}-ptest = "LGPL-2.1-or-later"

diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb b/meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb
index 4510eb9bf3..12649d984b 100644
--- a/meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb
+++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.11.3.bb
@@ -5,7 +5,7 @@ encoding, supporting Unicode version 16.0"
 HOMEPAGE = "https://juliastrings.github.io/utf8proc/"
 SECTION = "libs"

-LICENSE = "MIT & Unicode-3.0"
+LICENSE = "MIT AND Unicode-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=96d5a3ba306e0f24fb289427af484408"

 SRC_URI = "\
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb
index 622141a2a1..ba1ea3de6c 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.5.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "\
 HOMEPAGE = "https://www.webkitgtk.org/"
 BUGTRACKER = "https://bugs.webkit.org/"

-LICENSE = "BSD-2-Clause & LGPL-2.0-or-later"
+LICENSE = "BSD-2-Clause AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
                     file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
                     file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
index 09cfc72950..b0571c2754 100644
--- a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
@@ -5,7 +5,7 @@ with XDP eBPF programs in Linux, including tools for loading programs, packet \
 processing, monitoring, traffic generation, and benchmarking."

 HOMEPAGE = "https://github.com/xdp-project/xdp-tools"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-only & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=9ee53f8d06bbdb4c11b1557ecc4f8cd5 \
     file://LICENSES/GPL-2.0;md5=994331978b428511800bfbd17eea3001 \
diff --git a/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb b/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb
index 81a4d9d01b..18c65d7875 100644
--- a/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb
+++ b/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb
@@ -6,7 +6,7 @@ TSN-enabled Ethernet networks. It generates and mirrors cyclic traffic using \
 AF_PACKET or AF_XDP with eBPF, supporting protocols like PROFINET and OPC UA PubSub."

 HOMEPAGE = "https://github.com/Linutronix/RTC-Testbench"
-LICENSE = "BSD-2-Clause & (GPL-2.0-only | BSD-2-Clause)"
+LICENSE = "BSD-2-Clause AND (BSD-2-Clause OR GPL-2.0-only)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=f39e57686080f8752e19c4cd3e04e351 \
     file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
diff --git a/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.003.bb b/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.003.bb
index 89b62d7434..8716737c66 100644
--- a/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.003.bb
+++ b/meta-perl/recipes-extended/requirements-dynamic/cpan-requirements-dynamic_0.003.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dynamic prerequisites in meta files"
 DESCRIPTION = "This module implements a format for describing dynamic prerequisites \
 of a distribution.cts and (by default) mails MIME messages."
 HOMEPAGE = "https://metacpan.org/pod/CPAN::Requirements::Dynamic"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1bae8e4882b2dc386a0b72b7265c4a22"

 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/CPAN-Requirements-Dynamic-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.201.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.201.bb
index cd52a5d1b2..6ae1bba6b1 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.201.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.201.bb
@@ -9,7 +9,7 @@ differences. \
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/release/RJBS/Algorithm-Diff-1.201"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=1671;endline=1675;md5=f6b2fe8ca06ca6faefa4f265fc494c2c"

 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Algorithm-Diff-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
index 5b8699e88b..c30cfb66b1 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
@@ -5,7 +5,7 @@ protocols should be able to share."
 HOMEPAGE = "https://metacpan.org/dist/Authen-SASL/"
 SECTION = "libs"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Authen/SASL/Perl.pm;beginline=1;endline=3;md5=17123315bbcda19f484c07227594a609"

 DEPENDS = "perl"
diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
index efd78e20e2..e61523851c 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
@@ -10,7 +10,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/dist/Capture-Tiny"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc7698cd2954eda44d2b50be647784f8"

 SRCNAME = "Capture-Tiny"
diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb
index 7d6508e9a4..9eeb59b691 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb
@@ -4,7 +4,7 @@ submissions, file uploads, reading and writing cookies, query string generation
 and manipulation, and processing and preparing HTTP headers."
 HOMEPAGE = "https://metacpan.org/pod/CGI"
 SECTION = "libs"
-LICENSE = "Artistic-2.0 | GPL-2.0-only"
+LICENSE = "Artistic-2.0 OR GPL-2.0-only"

 LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"

diff --git a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
index 93c186d2d5..ea558cfc09 100644
--- a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
+++ b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.15.bb
@@ -6,7 +6,7 @@ SECTION = "libs"

 HOMEPAGE = "https://github.com/moose/Class-Method-Modifiers/"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d49d07ae038f38923335ac8cc301e1ba"

 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Class-Method-Modifiers-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb
index 9b2a5a689b..ddf7568e90 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb
@@ -3,7 +3,7 @@ DESCRIPTION = ""Compress::Raw::Bzip2" provides an interface to the in-memory \
 compression/uncompression functions from the bzip2 compression library."
 HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Bzip2"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=7b6eb3b7380815648e5067943ed15621"

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb
index c772885931..e854eec4bb 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This module provides a Perl interface to allow reading and \
 wrting of lzma, lzip and xz files/buffers."
 HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Lzma"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=dcf5ec9168367166aaeabb92ee5754e1"

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb
index 7b5dbd5475..8a4e309691 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb
@@ -4,7 +4,7 @@ to the zlib compression library (see 'AUTHOR' for details about where to \
 get zlib)."
 HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=ef65cee670356670f1663558bb46f16e"

diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
index 73694bb95f..e1b9027d83 100644
--- a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
+++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
@@ -6,7 +6,7 @@ memory overhead."
 HOMEPAGE = "https://metacpan.org/dist/Config-Tiny"
 SECTION = "libraries"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab27c3cedbdb0eb6e656a8722476191a"

 RDEPENDS:${PN} += "perl"
diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
index 5c233ed22d..d50d0757bf 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.320.bb
@@ -9,7 +9,7 @@ Shell developers."
 HOMEPAGE = "https://metacpan.org/release/Config-AutoConf"

 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf61"
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
index 59d66a93cf..03b65cced1 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Guess OpenSSL include path"
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Crypt::OpenSSL::Guess"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"

 SRC_URI = "${CPAN_MIRROR}/authors/id/A/AK/AKIYM/Crypt-OpenSSL-Guess-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
index 982d604eaa..e2a4031e07 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Crypt::OpenSSL::Random - OpenSSL/LibreSSL pseudo-random number generator access"
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Crypt::OpenSSL::Random"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://LICENSE;md5=9e876d4149406d88b4ff1b37645363ad"

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
index 4775d12b7f..ee0b88f4b9 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.41.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Crypt Openssl RSA cpan module"
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Crypt::OpenSSL::RSA"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=399bd4de06d233aa49afa7c47cea8117"

 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Crypt-OpenSSL-RSA-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.46.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.46.bb
index 18f62cefb2..96c37b49f8 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.46.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.46.bb
@@ -3,7 +3,7 @@ the curses library."

 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Curses"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=0b37356c5e9e28080a3422d82af8af09"

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.78.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.78.bb
index 1fbf2ef277..77b8352dae 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.78.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.78.bb
@@ -7,7 +7,7 @@ module, and nothing else. \
 HOMEPAGE = "https://metacpan.org/release/DBD-SQLite"

 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1726e2117494ba3e13e1c3d93f795360"

 SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
index 1541751d63..7741dcb057 100644
--- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
+++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
@@ -6,7 +6,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/Devel::GlobalDestruction/"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=53;endline=55;md5=935dadb9423774f53548e5cd5055d41a"

 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestruction-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
index bb19dfb415..a269a335c8 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.05.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Keyed-Hashing for Message Authentication"
 HOMEPAGE = "https://metacpan.org/pod/Digest::HMAC"
 SECTION = "libs"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=6;endline=9;md5=6321739e9ccbf74ee5dd2eb82c42d609"

 RDEPENDS:${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module-digest-md5"
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index 5742785f08..7ef855e7f9 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
 HOMEPAGE = "https://metacpan.org/pod/Digest::SHA1"
 SECTION = "libs"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"

 SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
index e2a7084061..ce776cb964 100644
--- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -5,7 +5,7 @@ variables to be treated as scalar or array variables."

 HOMEPAGE = "https://metacpan.org/dist/Env/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"

diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
index 7b28d59228..3dc456eac9 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17030.bb
@@ -5,7 +5,7 @@ Secondly Error is a base class for errors/exceptions that can \
 either be thrown, for subsequent catch, or can simply be recorded."
 HOMEPAGE = "https://github.com/shlomif/perl-error.pm"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.010.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.010.bb
index b40e0ffc5b..2e9f0bccff 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.010.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.010.bb
@@ -4,7 +4,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/dist/ExtUtils-Config"

-LICENSE = "Artistic-1.0-Perl | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0-Perl OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ddb4d526cd95b017e23486893490883e"

 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
index f23d4e3eda..34ad066682 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
@@ -8,7 +8,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/ExtUtils::CppGuess"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"

 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
index 42c99ddf58..e378805d08 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.028.bb
@@ -4,7 +4,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/ExtUtils::Helpers"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0280160e4f26faafef507664884bf63"

 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.015.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.015.bb
index b6c3a7a73a..c688fd6ef9 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.015.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.015.bb
@@ -5,7 +5,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/ExtUtils::InstallPaths"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4109085ee02c4453f25d919938e72e96"

 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb
index 73531a82e1..a1066bc5c7 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.63.bb
@@ -9,7 +9,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/release/SMUELLER/ExtUtils-ParseXS-3.35"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=120;endline=129;md5=eb858f0e3b1b0bee0c05b86a474ae2b6"

 SRCNAME = "ExtUtils-ParseXS"
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.32.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.32.bb
index 681d6e29ca..e12fc5b7e6 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.32.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.32.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "This module provides subroutines to read or write \
 "
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/dist/File-Slurp"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README.md;beginline=488;endline=493;md5=7ac91b9bf12fda89deba7383172cbefe"
 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CA/CAPOEIRAB/File-Slurp-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
index 7186d1a10f..7e12da3a24 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
@@ -4,7 +4,7 @@ All functions are optionally exported. All functions throw exceptions on \
 errors, write functions don't return any meaningful value."

 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 HOMEPAGE = "https://metacpan.org/release/File-Slurper"

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
index 88f95c2e4f..ccebd48962 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "This package contains the Parser.pm module with friends."
 HOMEPAGE = "https://metacpan.org/release/OALDERS/HTML-Parser-3.83"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;beginline=996;endline=1000;md5=68b329da9893e34099c7d8ad5cb9c940"

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
index e6c28578ae..5b2db6747e 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.07.bb
@@ -8,7 +8,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/release/KENTNL/HTML-Tree-5.06/source/README"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=88;endline=105;md5=260d31d31370658947ae050eef27aca9"

 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KE/KENTNL/HTML-Tree-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002005.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002005.bb
index ce4c1f2ad1..bf7087f450 100644
--- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002005.bb
+++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002005.bb
@@ -13,7 +13,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/Import::Into"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=209;endline=223;md5=3cf363f1e405dea6db2c6cd0ef23680c"

 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Import-Into-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb
index aab29ad57c..5879680e73 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.217.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This module provides a Perl interface to allow reading and \
 writing of lzma files/buffers."
 HOMEPAGE = "https://metacpan.org/release/IO-Compress-Lzma"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=dcf5ec9168367166aaeabb92ee5754e1"

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb
index 523cacd5af..24527ef1bc 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb
@@ -12,7 +12,7 @@ formats \
 "
 HOMEPAGE = "https://metacpan.org/release/IO-Compress"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=a05fdd79b87a410b6178b73126ffafdd"

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.099.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.099.bb
index cb63eacbcb..f157745262 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.099.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.099.bb
@@ -9,7 +9,7 @@ mod_perl."
 HOMEPAGE = "https://metacpan.org/dist/IO-Socket-SSL"
 SECTION = "libs"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=12;endline=12;md5=963ce28228347875ace682de56eef8e8"

 RDEPENDS:${PN} += "\
diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
index a2c3e8a46e..f9fe23e7b7 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
@@ -5,7 +5,7 @@ filehandles; in particular, IO::Scalar, IO::ScalarArray, and IO::Lines."

 HOMEPAGE = "http://www.zeegee.com/products/IO-stringy/"
 SECTION = "devel"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"


diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index 84fcca8da5..01bb25c4ec 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -5,7 +5,7 @@ dealing with signals."
 HOMEPAGE = "https://metacpan.org/release/ROSCH/IPC-Signal-1.00"
 SECTION = "libs"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=16;endline=18;md5=f36550f59a0ae5e6e3b0be6a4da60d26"

 S = "${UNPACKDIR}/IPC-Signal-${PV}"
diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
index 7c23619cde..2a1a1c601a 100644
--- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
+++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
@@ -6,7 +6,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/Locale::gettext"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=d028249c2d08dca6ca6c5bb43b56d926"

 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Locale-gettext-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb b/meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb
index 840bced030..905909afa3 100644
--- a/meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This module is for encoding/decoding data much the way that MIME:
 HOMEPAGE = "https://metacpan.org/release/REHSACK/MIME-Base32-1.303"
 SECTION = "libraries"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"

 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/MIME-Base32-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
index b7b287c399..21af44a1ee 100644
--- a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
@@ -4,7 +4,7 @@ messages on Internet."
 HOMEPAGE = "https://metacpan.org/release/NEZUMI/MIME-Charset-1.013.1"
 SECTION = "libs"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/MIME-Charset-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
index aa951a4c5a..e6a72577ba 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
@@ -8,7 +8,7 @@ one known mime type."
 HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.27"
 SECTION = "libraries"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=13;endline=13;md5=963ce28228347875ace682de56eef8e8"

 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
index 7b15ccf597..4597c9bbe8 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
@@ -9,7 +9,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/release/LEONT/Module-Build-Tiny-0.048"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3eab9a3cd580096821fd1e657e2f31d5"

 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb
index a9bebb4e21..a7751cf818 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.3.bb
@@ -12,7 +12,7 @@ SECTION = "libs"

 HOMEPAGE = "https://github.com/simonwistow/Module-Pluggable"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda25db0b38fcc41086"

 SRCNAME = "Module-Pluggable"
diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
index 4526def40a..e6ba6a940e 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
@@ -16,7 +16,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/dist/Module-Runtime"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=36;endline=44;md5=9416434672a57853d6181f3da9094963"

 SRCNAME = "Module-Runtime"
diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
index bbb8d9868f..cd1343f82f 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
@@ -6,7 +6,7 @@ SECTION = "libs"

 HOMEPAGE = "http://metapan.org/release/Moo/"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=74f4de483dce5aa45ed6da875f11258a"

 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb b/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
index dd53bebf4c..a9241a64d1 100644
--- a/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "This module provides an easy-to-use interface for encoding \

 SECTION = "libs"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ea5704cf65ca4ec6e9e167fb94f14dd"

 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CF/CFAERBER/Net-IDN-Encode-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index c620485123..1c7a1b8432 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -6,7 +6,7 @@ deleting or modifying entries."

 SECTION = "libs"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f6314d201d89e"

 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index 8f029492b1..f5c623991f 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -5,7 +5,7 @@ Domain Names according to IDNA (RFC 3490), in a way very much inspired by \
 Turbo Fredriksson's PHP-IDN. \
 "
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 HOMEPAGE = "https://metacpan.org/dist/Net-LibIDN/"
 DEPENDS += "libidn"
 # We must need glibc-gconvs to enable charset related functions,
diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index 3d05a3d7a3..41f38101ed 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -11,7 +11,7 @@ shell."
 HOMEPAGE = "https://metacpan.org/dist/Net-Telnet"
 SECTION = "Development/Libraries"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"

 SRC_URI = "${CPAN_MIRROR}/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index 8478441211..d4ea7601f2 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -5,7 +5,7 @@ on wait status values."
 HOMEPAGE = "https://metacpan.org/dist/Proc-WaitStat"
 SECTION = "libraries"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=21;endline=23;md5=f36550f59a0ae5e6e3b0be6a4da60d26"

 RDEPENDS:${PN} += "perl libipc-signal-perl"
diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002005.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002005.bb
index 10b063bf46..b404f59e28 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002005.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002005.bb
@@ -5,7 +5,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/Role::Tiny"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=197;endline=234;md5=26df7e7c20551fb1906e2286624f0b71"

 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index 7cf4875e14..1e59f83dd0 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -7,7 +7,7 @@ etc."

 HOMEPAGE = "https://metacpan.org/release/Unix-Statgrab"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later | LGPL-2.1-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later OR LGPL-2.1-or-later"
 DEPENDS += "libcapture-tiny-perl-native"
 DEPENDS += "libconfig-autoconf-perl-native"
 DEPENDS += "libstatgrab"
diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
index 426ba68ab8..5a28ea9d3a 100644
--- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
@@ -25,7 +25,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/strictures"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823cdd6af22135cf5f8"

 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
index 969a36e360..314453b899 100644
--- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
@@ -10,7 +10,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/pod/Sub::Exporter::Progressive/"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"

 SRC_URI = "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
index 1d6c8dc27d..63c5599759 100644
--- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
@@ -9,7 +9,7 @@ THIS IS NOT THE SORT OF THING YOU WANT TO DO EVERYDAY \
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/release/Sub-Uplevel"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f1207cd3108e4ade18448d81e6bcb6c"

 CPAN_PACKAGE = "Sub-Uplevel"
diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
index 889b6b655b..26ca37ea2c 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
@@ -9,7 +9,7 @@ working."
 HOMEPAGE = "https://metacpan.org/release/JSTOWE/TermReadKey-2.38"
 SECTION = "libraries"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=c275db663c8489a5709ebb22b185add5"

 SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
index 93b2e5a1f5..ff0f696177 100644
--- a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
@@ -22,7 +22,7 @@ SECTION = "libs"

 HOMEPAGE = "http://github.com/rjbs/Test-Deep/"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Test/Deep.pm;beginline=1817;endline=1826;md5=d3ed382cc19bae8ead6076df35a43cbf"

 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Deep-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.52.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.52.bb
index 67956748a3..47c6409bdc 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.52.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.52.bb
@@ -22,7 +22,7 @@ SECTION = "libs"

 HOMEPAGE = "http://testanything.org"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=d41d8cd98f00b204e9800998ecf8427e"

 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
index 5481ac7022..4638d16782 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
@@ -9,7 +9,7 @@ the time to go take a look. \
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/release/Test-Warn"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=73;endline=78;md5=42b423d91c92ba59c215835a2ee9b57a"

 CPAN_PACKAGE = "Test-Warn"
diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
index 15f8b3f81e..c54507b984 100644
--- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
@@ -12,7 +12,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/release/KUBOTA/Text-CharWidth-0.04"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=d8d54c8c500cbdd57a4c15911d9d96db"

 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-CharWidth-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb
index 0857996681..c54c1b6a70 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.45.bb
@@ -8,7 +8,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/release/NEILB/Text-Diff-1.45"

-LICENSE = "Artistic-1.0 | GPL-2.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9e795454c53c99fe48b8180eb5917b10"

 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEILB/Text-Diff-${PV}.tar.gz \
diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index 2d0242d878..e30593da8e 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -9,7 +9,7 @@ implementation-dependent. Valid values are specified in the system \
 documentation."
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Text::Iconv"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
 RRECOMMENDS:${PN}:append:libc-glibc = " glibc-gconvs"

diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
index 025bcc2873..0391075671 100644
--- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
@@ -13,7 +13,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/release/KUBOTA/Text-WrapI18N-0.06"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=080862e1e40cdcddef4393e137285858"

 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-WrapI18N-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
index 4560c28e5e..ae239c30d0 100644
--- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
+++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
@@ -7,7 +7,7 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/release/Unicode-LineBreak"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=5;endline=9;md5=b5e8b1099b86b86fbc315b50484231ab"

 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${PV}.tar.gz"
diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
index 4fb4c2a122..a0e18de756 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
@@ -4,7 +4,7 @@ The module implements the URI class. URI objects can be used to access \
 and manipulate the various components that make up these strings."
 HOMEPAGE = "https://metacpan.org/dist/URI"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"

 LIC_FILES_CHKSUM = "file://LICENSE;md5=a4fff76c97b0801ffb7096967487beac"

diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
index 6dc2a19e0b..86c5f298bf 100644
--- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
@@ -7,7 +7,7 @@ to, and most don't.  This filter does the trivial but oft-repeated task \
 of putting all characters into a single event. \
 "
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 HOMEPAGE = "https://metacpan.org/dist/XML-Filter-BufferText"
 DEPENDS += "libxml-sax-perl-native"
 RDEPENDS:${PN} += "libxml-sax-perl"
diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
index 07f589706a..b3d09629cb 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
@@ -8,7 +8,7 @@ your programs."

 HOMEPAGE = "https://metacpan.org/dist/XML-LibXML"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 DEPENDS += "libxml2 \
         libxml-sax-perl-native \
         zlib \
diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index b66cbc3945..13441de387 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -7,7 +7,7 @@ although it has been put to limited use in settings such as XML::LibXML and \
 the AxKit XML Application Server. \
 "
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 HOMEPAGE = "https://metacpan.org/dist/XML-SAX-Writer"
 DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS:${PN} += "libxml-filter-buffertext-perl"
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
index 4b4ff952ef..27aaf2d28f 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "SDK for connecting to AWS IoT using Python."
 HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
-LICENSE = "Apache-2.0 & (EPL-1.0 | EDL-1.0)"
+LICENSE = "Apache-2.0 AND (EPL-1.0 OR LicenseRef-EDL-1.0)"
 LICENSE:${PN}-examples = "Apache-2.0"
 LIC_FILES_CHKSUM = "\
     file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb b/meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb
index bd7722ccd5..acea3e4fdb 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "CMake is an open-source, cross-platform family of tools designed to build, test and package software"
-LICENSE = "BSD-3-Clause & Apache-2.0"
+LICENSE = "Apache-2.0 AND BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
 	file://LICENSE_BSD_3;md5=9134cb61aebbdd79dd826ccb9ae6afcd \
 	file://LICENSE_Apache_20;md5=19cbd64715b51267a47bf3750cc6a8a5 \
diff --git a/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb b/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
index 9d32cbba2c..42f06ff424 100644
--- a/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Backports and enhancements for the contextlib module"
 HOMEPAGE = "https://contextlib2.readthedocs.org/"
 SECTION = "devel/python"
-LICENSE = "PSF-2.0 & Apache-2.0"
+LICENSE = "Apache-2.0 AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d2b6be100f1002194122ec9bfee7b8b4"

 SRC_URI[sha256sum] = "ab1e2bfe1d01d968e1b7e8d9023bc51ef3509bba217bb730cee3827e1ee82869"
diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
index 0e0569ba5b..d3328733a1 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A python package implementing the crc32c algorithmin hardware and software"
 HOMEPAGE = "https://github.com/ICRAR/crc32c"

-LICENSE = "BSD-2-Clause & BSD-3-Clause & Zlib & LGPL-2.1-or-later"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause AND LGPL-2.1-or-later AND Zlib"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
     file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb b/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
index 8cf5697d10..6b76ba6cec 100644
--- a/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-daemon_3.1.2.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} = "python3-docutils \
                   python3-resource \
 "

-LICENSE = "Apache-2.0 & GPL-3.0-only"
+LICENSE = "Apache-2.0 AND GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55f76b1b31719284caf4bc3ecbb70d6f"

 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index 1f7a4a03fd..074f5fbeca 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Extensions to the standard Python datetime module"
 DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
 HOMEPAGE = "https://dateutil.readthedocs.org"
-LICENSE = "BSD-3-Clause & Apache-2.0"
+LICENSE = "Apache-2.0 AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"

 SRC_URI[sha256sum] = "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709"
diff --git a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
index 13a224a9d8..697c0b1850 100644
--- a/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
-LICENSE = "Apache-2.0 & MIT & BSD-3-Clause"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"

 SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
diff --git a/meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb b/meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb
index a1dbececdf..a36ca98d00 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A coroutine-based Python networking library"
 DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
 a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "https://www.gevent.org"
-LICENSE = "MIT & Python-2.0"
+LICENSE = "MIT AND Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
 DEPENDS += "python3-greenlet-native python3-greenlet libev libuv python3-cffi-native"

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb
index bf35e57076..9bb3c96fbe 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GMP/MPIR, MPFR, and MPC interface to Python 2.6+ and 3.x"
 SECTION = "devel/python"
 HOMEPAGE = "https://github.com/gmpy2/gmpy2"
-LICENSE = "GPL-3.0-only | LGPL-3.0-or-later"
+LICENSE = "GPL-3.0-only OR LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb
index a83f260946..e30159b8e8 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python lightweight in-process concurrent programming"
 HOMEPAGE = "https://greenlet.readthedocs.io/en/latest/"
-LICENSE = "MIT & PSF-2.0"
+LICENSE = "MIT AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
index 867c55096f..a5d77d952f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Google gRPC"
 HOMEPAGE = "https://www.grpc.io/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0 & MIT & BSD-2-Clause"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906 \
     file://third_party/utf8_range/utf8_validity.h;beginline=1;endline=5;md5=db08ddb5817e660489678e7c3653805a \
diff --git a/meta-python/recipes-devtools/python/python3-libusb1_3.4.0.bb b/meta-python/recipes-devtools/python/python3-libusb1_3.4.0.bb
index 1956e5fe54..4093a6e60c 100644
--- a/meta-python/recipes-devtools/python/python3-libusb1_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-libusb1_3.4.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pure-python wrapper for libusb-1.0"
 HOMEPAGE = "https://github.com/vpelletier/python-libusb1"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
index 419de2570a..07b6213102 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
 HOMEPAGE = "https://github.com/python/mypy"
-LICENSE = "MIT & Python-2.0"
+LICENSE = "MIT AND Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"

 inherit pypi python_setuptools_build_meta
diff --git a/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb b/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
index 9b470f11ac..69b0f4f2ad 100644
--- a/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
@@ -27,7 +27,7 @@ The source code is at https://github.com/eea/odfpy \
 Visit https://github.com/eea/odfpy/wiki for documentation and examples. \
 \
 The code at https://joinup.ec.europa.eu/software/odfpy/home is obsolete."
-LICENSE = "Apache-2.0 | (GPL-2.0-or-later & LGPL-2.0-or-later)"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later OR Apache-2.0"
 LIC_FILES_CHKSUM = " \
 	file://APACHE-LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 	file://GPL-LICENSE-2.txt;md5=751419260aa954499f7abaabaa882bbe \
diff --git a/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb b/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
index 308eb78a79..0d20ef0578 100644
--- a/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Capture the outcome of Python function calls."
 HOMEPAGE = "https://github.com/python-trio/outcome"
-LICENSE = "Apache-2.0 & MIT"
+LICENSE = "Apache-2.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa7b86389e58dd4087a8d2b833e5fe96 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=e62ba5042d5983462ad229f5aec1576c"
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index aa88711d69..fc8145303f 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "MQTT version 3.1/3.1.1 client library"
-LICENSE = "EPL-1.0 | EDL-1.0"
+LICENSE = "EPL-1.0 OR LicenseRef-EDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e5f264c6988aec56808a3a11e77b913 \
                     file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb
index 2276ea8571..3a53b6fc23 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python interface to Pocketsphinx libraries."
 DESCRIPTION = "Pythonsphinx is an Open source large vocabulary, speaker-independent continuous speech recognition engines."
 HOMEPAGE = "https://github.com/cmusphinx/pocketsphinx"
 SECTION = "devel/python"
-LICENSE = "BSD-2-Clause | BSD-3-Clause | MIT"
+LICENSE = "BSD-2-Clause OR BSD-3-Clause OR MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c4d720cdc9c6953091f65e8b01524bb4"

 SRC_URI += "file://0001-cython-Use-cythyon3-in-cmake-check.patch"
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
index e9af4c3cc6..f9aa69e9c5 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://developers.google.com/protocol-buffers/"
 SECTION = "devel/python"
 # MIT license is from utf8_range although it's packaged without this information
 # https://github.com/protocolbuffers/protobuf/blob/main/third_party/utf8_range/LICENSE
-LICENSE = "BSD-3-Clause & MIT"
+LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = " \
     file://PKG-INFO;beginline=9;endline=9;md5=53dbfa56f61b90215a9f8f0d527c043d \
     file://utf8_range/utf8_range.h;beginline=1;endline=2;md5=f05b3ef36cc354d7134597075a1af64f \
diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
index 5ed7b8e30d..97d66d6461 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
@@ -7,7 +7,7 @@ be used to fetch objects identified by a URL from a Python program \
 SECTION = "devel/python"
 HOMEPAGE = "http://pycurl.io/"

-LICENSE = "LGPL-2.1-only | MIT"
+LICENSE = "LGPL-2.1-only OR MIT"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
index 5f5b33704e..41318412a7 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A pure Python netlink and Linux network configuration library"
-LICENSE = "GPL-2.0-or-later | Apache-2.0"
+LICENSE = "Apache-2.0 OR GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.6.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.6.bb
index a8fa531a05..7ff9b1fa07 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.6.bb
@@ -5,7 +5,7 @@ used to create template Projects."

 HOMEPAGE = "https://github.com/pyscaffold/pyscaffold"
 SECTION = "devel/python"
-LICENSE = "0BSD & MIT"
+LICENSE = "0BSD AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"

diff --git a/meta-python/recipes-devtools/python/python3-sniffio_1.3.1.bb b/meta-python/recipes-devtools/python/python3-sniffio_1.3.1.bb
index 82c457c39f..00a7afd56e 100644
--- a/meta-python/recipes-devtools/python/python3-sniffio_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sniffio_1.3.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Sniff out which async library your code is running under"
 SECTION = "devel/python"
-LICENSE = "MIT | Apache-2.0"
+LICENSE = "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM = "\
     file://LICENSE;md5=fa7b86389e58dd4087a8d2b833e5fe96 \
     file://LICENSE.MIT;md5=e62ba5042d5983462ad229f5aec1576c \
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb
index c556741846..a8a657502b 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Fast, Extensible Progress Meter"
 HOMEPAGE = "https://tqdm.github.io/"
 SECTION = "devel/python"

-LICENSE = "MIT & MPL-2.0"
+LICENSE = "MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=9a9bed097dea538bf341c8623c8f8852"

 SRC_URI[sha256sum] = "19829c9673638f2a0b8617da4cdcb927e831cd88bcfcb6e78d42a4d1af131520"
diff --git a/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
index eee9ab88ba..d7a987aa3b 100644
--- a/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "This is a wrapper that loads yaml and checks config using trafaret while keeping track of actual lines of file where error has happened."

-LICENSE = "Apache-2.0 & MIT"
+LICENSE = "Apache-2.0 AND MIT"
 LIC_FILES_CHKSUM = "file://README.rst;beginline=98;endline=106;md5=a15308789c3b7d0f3ef36b69048423e4"

 SRC_URI[sha256sum] = "440b6b49e5e975f9a640a2519abb2feddd96eb2aeb1715f87f947a7a079f20be"
diff --git a/meta-python/recipes-devtools/python/python3-trio_0.33.0.bb b/meta-python/recipes-devtools/python/python3-trio_0.33.0.bb
index 8bb4514649..5db81fcfb0 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.33.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A friendly Python library for async concurrency and I/O"
 HOMEPAGE = "https://github.com/python-trio/trio"
-LICENSE = "Apache-2.0 & MIT"
+LICENSE = "Apache-2.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
index 178b83f399..8ad195d7ae 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
@@ -4,7 +4,7 @@ UEFI firmware parser is a simple module and set of scripts for parsing, \
 extracting, and recreating UEFI firmware volumes. This includes parsing \
 modules for BIOS, OptionROM, Intel ME and other formats too."
 HOMEPAGE = "https://github.com/theopolis/uefi-firmware-parser"
-LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://setup.py;md5=f3ddb5c3a389eada068ddcf6b89f62b2"

 SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=master;tag=v${PV}"
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
index 29fa9028e0..d68e1a674e 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
@@ -1,7 +1,7 @@
 SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
 DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."

-LICENSE = "BSD-3-Clause & TCL"
+LICENSE = "BSD-3-Clause AND TCL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"

 SRC_URI[sha256sum] = "d62e3d7625384c08082abad81a077af587fdef2761bb14c3822f4234b8d07d75"
diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_4.2.0.bb b/meta-python/recipes-devtools/python/python3-uritemplate_4.2.0.bb
index 43ba122407..48d9104a9c 100644
--- a/meta-python/recipes-devtools/python/python3-uritemplate_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uritemplate_4.2.0.bb
@@ -2,7 +2,7 @@
 # https://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/meta-openstack/recipes-devtools/python/python3-uritemplate_3.0.0.bb?h=master

 SUMMARY = "Simple python library to deal with URI Templates."
-LICENSE = "Apache-2.0 | BSD-3-Clause"
+LICENSE = "Apache-2.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6d769bdcfacac3c1a1ffa568937fe0"

 SRC_URI[sha256sum] = "480c2ed180878955863323eea31b0ede668795de182617fef9c6ca09e6ec9d0e"
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
index 6231125237..b8c02dc40b 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
-LICENSE = "OFL-1.0 & MIT & CC-BY-4.0"
+LICENSE = "CC-BY-4.0 AND MIT AND OFL-1.0"
 LIC_FILES_CHKSUM = "file://xstatic/pkg/font_awesome/data/LICENSE.txt;md5=57f9201afe70f877988912a7b233de47"

 PYPI_PACKAGE = "xstatic_font_awesome"
diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
index d161431e6d..f4f820f49a 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pure-Python Reed Solomon encoder/decoder"
 HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
-LICENSE = "MIT-0 | Unlicense"
+LICENSE = "MIT-0 OR Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"

 SRC_URI[sha256sum] = "e11528d63e75461d45b86c23f9db8260303d6ab6cae075fa9eddb44527ad8ece"
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
index 857d8e46fa..1ee6e5b93b 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python3 interface to the wxWidgets Cross-platform C++ GUI toolkit."
 HOMEPAGE = "https://www.wxpython.org"

-LICENSE = "LGPL-2.0-only & WXwindows & BSD-2-Clause"
+LICENSE = "BSD-2-Clause AND LGPL-2.0-only AND wxWindows"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=102f37a0d23aa258e59e4cc8b5380b35"

 DEPENDS = "python3-attrdict3-native python3-six-native wxwidgets-native \
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.3.bb
index 5b9f306a16..134ae3c67c 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Web-based MySQL administration interface"
 HOMEPAGE = "http://www.phpmyadmin.net"
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
-LICENSE = "GPL-2.0-only & LGPL-3.0-only & MIT"
+LICENSE = "GPL-2.0-only AND LGPL-3.0-only AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=06da7ef2f2b2874be8528063198fa994 \
                     file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
index 02bac6f23f..67f69c650f 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Debugging and profiling extension for PHP"
 HOMEPAGE = "https://xdebug.org/"
-LICENSE = "Xdebug"
+LICENSE = "LicenseRef-Xdebug"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=afd6ce4aa04fdc346e5b3c6e634bd75c"

 DEPENDS = "php re2c-native"
diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
index 2136892c4e..1e038813b2 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Xfce screensaver is a screen saver and locker that aims to have s
 HOMEPAGE = "https://git.xfce.org/apps/xfce4-screensaver/about/"
 SECTION = "x11/application"

-LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later "
+LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     "
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.21.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.21.0.bb
index 06ad0b9fbc..980f0e85dd 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.21.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.21.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Xfce Menu Library"
 HOMEPAGE = "https://docs.xfce.org/xfce/garcon/start"
 SECTION = "x11/libs"
-LICENSE = "LGPL-2.0-only & GFDL-1.1-no-invariants-only"
+LICENSE = "GFDL-1.1-no-invariants-only AND LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
 DEPENDS = "xfce4-dev-tools-native libxfce4ui intltool-native"


