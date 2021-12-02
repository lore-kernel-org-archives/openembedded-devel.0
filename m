Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61312C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 12:19:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.7452.1638447551305118548
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KlFxGwgd;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so2308724pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qyhl0P8s96n1/zf+JjBS5MXOVqE8tp5rsbrkiitKAxw=;
        b=KlFxGwgdnL3oHmr4IipGQEyMyYnhixKzYCgMEcFg40YpBXW1jJfu92sidzEpB2HMQN
         9GTznwTzcoXAcVO0t2MzvfBuwtU9qx+l7m17CYrGvFIPF9YJa2TQR0RgMDwsbiIjQvw3
         lUhnSCfunqDxaA4JWBDBrJSXTIau/0xsAzwb2Q3HRB95cF56HgsTFKKyUORO1WSjr5Np
         j/++Ialezo24ws0pz+MBLIE2pNUfVnclYU6vTqCoO2wvhTnbZFs+1WQfx8lAgRD9Euyp
         7GcKR5+NiRn0uHcyCv/XOADGz82T9igB3OqtxHu1lT9xZNjBHBuqY0pK5NWFpgZrMQPb
         LaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qyhl0P8s96n1/zf+JjBS5MXOVqE8tp5rsbrkiitKAxw=;
        b=EMikKppoN+bP9AH17uyzZqCh/s8V1io71Gs8bKezX2FZL6laHVsi3Z8F4qgvviF3eG
         Z4A0sONbS4yj22FHICaLYPGiLzHAFybGBq0baId+svEgCrPHfUaBNjHCs/u5HS05VDwB
         2dd1gdSGQtKJ5K9VLsIZkjYm5hcZSPPC07HGeQjqOl9386eFK7nq6l82IpMnlVPHua9k
         G+qcRklS8NJeyYQVhgwQ0tE6HDfBnQXQ0D+IVKsSONu7jhrN0hWbBl9GOk5+cDKcrCuJ
         fBq4jamzwkiP34hfZ4zvKVtAO5QN7pgImSBa1qw3qT+EIed23zeLFDiX7VnoRQo/4dtT
         ERhQ==
X-Gm-Message-State: AOAM531kmQJlOc+yJkGHjeKy9/bUxRUPTBwbK588dLGMSUQYYcoIlaJ5
	tK0B9naW2u7yljNMknyk9cfGBhBEhW8=
X-Google-Smtp-Source: 
 ABdhPJwxhsa05JvoWSVCAZUb6Oyo9lZDP5iO3TAYy4X0GS7lQdJiGbyl90OMHnruYKrDP63pPzqB4Q==
X-Received: by 2002:a17:902:d505:b0:141:f5f7:848e with SMTP id
 b5-20020a170902d50500b00141f5f7848emr14969356plg.72.1638447550076;
        Thu, 02 Dec 2021 04:19:10 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:9b75:b57e:d1aa:6e39])
        by smtp.gmail.com with ESMTPSA id
 d2sm3396881pfj.42.2021.12.02.04.19.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 04:19:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/5] Patch review Dec 2
Date: Thu,  2 Dec 2021 04:19:00 -0800
Message-Id: <cover.1638447451.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 12:19:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94179

Please have comments back by Saturday.

The following changes since commit 7889158dcd187546fc5e99fd81d0779cad3e8d17:

  python3-fasteners: update 0.15 -> 0.16.3 (2021-11-02 08:34:34 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Armin Kuster (1):
  recipes: Update SRC_URI branch and protocols

Marta Rybczynska (1):
  jansson: whitelist CVE-2020-36325

Martin Jansa (1):
  sdbus-c++: don't fetch googletest during do_configure

Ranjitsinh Rathod (1):
  nss: Fix CVE-2020-12403

lumag (1):
  lmsensors: do not depend on lmsensors-isatools on non-x86

 .../logfsprogs/logfsprogs_git.bb              |  2 +-
 .../recipes-filesystems/owfs/owfs_3.2p3.bb    |  2 +-
 .../sshfs-fuse/sshfs-fuse_3.7.0.bb            |  2 +-
 .../unionfs-fuse/unionfs-fuse_2.1.bb          |  2 +-
 .../f2fs-tools/f2fs-tools_1.13.0.bb           |  2 +-
 .../recipes-utils/fatcat/fatcat_1.1.0.bb      |  2 +-
 .../fatresize/fatresize_1.0.2.bb              |  2 +-
 .../recipes-utils/ufs-utils/ufs-utils_git.bb  |  2 +-
 .../libchamplain/libchamplain_0.12.20.bb      |  2 +-
 meta-gnome/recipes-support/ibus/ibus.inc      |  2 +-
 .../keybinder/keybinder_3.0.bb                |  2 +-
 .../recipes-support/libhandy/libhandy_git.bb  |  2 +-
 .../libstemmer/libstemmer_git.bb              |  2 +-
 .../recipes-support/libwacom/libwacom_0.33.bb |  2 +-
 .../recipes-bsp/kexecboot/kexecboot_git.bb    |  2 +-
 .../recipes-devtools/dracut/dracut_git.bb     |  2 +-
 .../recipes-devtools/grubby/grubby_8.40.bb    |  2 +-
 .../recipes-devtools/grubby/grubby_git.bb     |  2 +-
 .../mtd/ubi-utils-klibc_2.0.2.bb              |  2 +-
 .../kexec/kexec-tools-klibc_git.bb            |  2 +-
 .../libupnp/libupnp_git.bb                    |  2 +-
 .../recipes-dvb/tvheadend/tvheadend_git.bb    |  2 +-
 .../recipes-multimedia/dca/dcadec_0.2.0.bb    |  2 +-
 .../dleyna/dleyna-connector-dbus_0.3.0.bb     |  2 +-
 .../dleyna/dleyna-core_0.6.0.bb               |  2 +-
 .../dleyna/dleyna-renderer_0.6.0.bb           |  2 +-
 .../dleyna/dleyna-server_0.6.0.bb             |  2 +-
 .../fdk-aac/fdk-aac_2.0.1.bb                  |  2 +-
 .../fluidsynth/fluidsynth.inc                 |  2 +-
 .../recipes-multimedia/gerbera/gerbera_git.bb |  2 +-
 .../gstreamer-1.0/gst-shark_git.bb            |  2 +-
 .../recipes-multimedia/libcamera/libcamera.bb |  2 +-
 .../libdvbcsa/libdvbcsa_1.1.0.bb              |  2 +-
 .../libsquish/libsquish_git.bb                |  2 +-
 .../recipes-multimedia/mimic/mimic_1.2.0.2.bb |  2 +-
 .../musicbrainz/libmusicbrainz_git.bb         |  2 +-
 .../musicpd/libmpdclient_2.16.bb              |  2 +-
 .../recipes-multimedia/musicpd/mpc_0.31.bb    |  2 +-
 .../recipes-multimedia/musicpd/mpd_0.20.22.bb |  2 +-
 .../recipes-multimedia/musicpd/ncmpc_0.34.bb  |  2 +-
 .../mycroft/mycroft_19.8.1.bb                 |  2 +-
 .../openal/openal-soft_1.19.1.bb              |  2 +-
 .../rtmpdump/rtmpdump_2.4.bb                  |  2 +-
 .../recipes-multimedia/tinyalsa/tinyalsa.bb   |  2 +-
 .../tremor/tremor_20180319.bb                 |  2 +-
 .../recipes-support/crossguid/crossguid.bb    |  2 +-
 .../gst-instruments/gst-instruments_git.bb    |  2 +-
 .../cannelloni/cannelloni_git.bb              |  2 +-
 .../civetweb/civetweb_git.bb                  |  2 +-
 .../dibbler/dibbler_git.bb                    |  2 +-
 .../freeradius/freeradius_3.0.20.bb           |  2 +-
 .../libdnet/libdnet_1.12.bb                   |  2 +-
 .../nanomsg/nanomsg_1.1.5.bb                  |  2 +-
 .../recipes-connectivity/nanomsg/nng_1.2.5.bb |  2 +-
 .../netplan/netplan_0.98.bb                   |  2 +-
 .../openconnect/openconnect_8.03.bb           |  2 +-
 .../recipes-connectivity/relayd/relayd_git.bb |  2 +-
 .../recipes-connectivity/vpnc/vpnc_0.5.3.bb   |  2 +-
 .../wolfssl/wolfssl_4.4.0.bb                  |  2 +-
 .../recipes-daemons/atftp/atftp_0.7.2.bb      |  2 +-
 .../cyrus-sasl/cyrus-sasl_2.1.27.bb           |  2 +-
 .../iscsi-initiator-utils_2.1.3.bb            |  2 +-
 .../networkd-dispatcher_2.0.1.bb              |  2 +-
 .../arno-iptables-firewall_2.1.0.bb           |  2 +-
 .../libnetfilter/libnetfilter-log_1.0.1.bb    |  2 +-
 .../libnetfilter/libnetfilter-queue_1.0.3.bb  |  2 +-
 .../recipes-filter/libnftnl/libnftnl_1.1.7.bb |  2 +-
 meta-networking/recipes-irc/znc/znc_1.7.5.bb  |  4 +-
 .../wireguard-module_1.0.20200401.bb          |  2 +-
 .../wireguard/wireguard-tools_1.0.20200319.bb |  2 +-
 .../recipes-protocols/babeld/babeld_1.9.1.bb  |  2 +-
 .../recipes-protocols/openflow/openflow.inc   |  2 +-
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb |  2 +-
 .../arptables/arptables_git.bb                |  2 +-
 .../bridge-utils/bridge-utils_1.6.bb          |  2 +-
 .../recipes-support/cifs/cifs-utils_6.10.bb   |  2 +-
 .../recipes-support/curlpp/curlpp_0.8.1.bb    |  2 +-
 .../recipes-support/drbd/drbd-utils_9.12.0.bb |  4 +-
 .../recipes-support/geoip/geoip-perl_1.51.bb  |  2 +-
 .../recipes-support/geoip/geoip_1.6.12.bb     |  2 +-
 .../ifenslave/ifenslave_2.9.bb                |  2 +-
 .../recipes-support/ipcalc/ipcalc_0.2.3.bb    |  2 +-
 .../lksctp-tools/lksctp-tools_1.0.18.bb       |  2 +-
 .../lowpan-tools/lowpan-tools_git.bb          |  2 +-
 .../recipes-support/mtr/mtr_0.93.bb           |  2 +-
 .../recipes-support/nbdkit/nbdkit_git.bb      |  2 +-
 .../recipes-support/ndisc6/ndisc6_git.bb      |  2 +-
 .../recipes-support/netcf/netcf_0.2.8.bb      |  2 +-
 .../recipes-support/netperf/netperf_git.bb    |  2 +-
 .../recipes-support/nis/yp-tools_4.2.3.bb     |  2 +-
 .../recipes-support/ntimed/ntimed_git.bb      |  2 +-
 .../open-isns/open-isns_0.99.bb               |  2 +-
 .../recipes-support/phytool/phytool.bb        |  2 +-
 .../rdma-core/rdma-core_28.0.bb               |  2 +-
 .../smcroute/smcroute_2.4.4.bb                |  2 +-
 .../spice/spice-protocol_git.bb               |  2 +-
 .../recipes-support/spice/spice_git.bb        |  4 +-
 .../recipes-support/spice/usbredir_0.8.0.bb   |  2 +-
 .../recipes-support/unbound/unbound_1.9.4.bb  |  2 +-
 .../wpan-tools/wpan-tools_0.9.bb              |  2 +-
 .../speedtest-cli/speedtest-cli_2.1.2.bb      |  2 +-
 .../recipes-bsp/rwmem/rwmem_1.2.bb            |  2 +-
 .../recipes-dbs/mongodb/mongodb_git.bb        |  2 +-
 .../recipes-extended/lcdproc/lcdproc_git.bb   |  2 +-
 .../cpuburn/cpuburn-arm_git.bb                |  2 +-
 meta-oe/recipes-benchmark/fio/fio_3.17.bb     |  2 +-
 .../recipes-benchmark/glmark2/glmark2_git.bb  |  2 +-
 .../recipes-benchmark/iperf3/iperf3_3.7.bb    |  2 +-
 .../libc-bench/libc-bench_git.bb              |  2 +-
 .../libhugetlbfs/libhugetlbfs_git.bb          |  2 +-
 .../stressapptest/stressapptest_1.0.9.bb      |  2 +-
 .../tinymembench/tinymembench_git.bb          |  2 +-
 .../cpufrequtils/cpufrequtils_008.bb          |  2 +-
 .../recipes-bsp/edac-utils/edac-utils_git.bb  |  2 +-
 meta-oe/recipes-bsp/ledmon/ledmon_git.bb      |  2 +-
 .../recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  4 +-
 .../recipes-bsp/nvme-cli/nvme-cli_1.10.1.bb   |  2 +-
 .../gattlib/gattlib_git.bb                    |  2 +-
 .../gensio/gensio_1.5.3.bb                    |  2 +-
 meta-oe/recipes-connectivity/iwd/iwd_1.9.bb   |  2 +-
 .../libimobiledevice/libimobiledevice_git.bb  |  2 +-
 .../recipes-connectivity/libndp/libndp_1.7.bb |  2 +-
 .../libtorrent/libtorrent_git.bb              |  2 +-
 .../libuv/libuv_1.36.0.bb                     |  2 +-
 .../paho-mqtt-c/paho-mqtt-c_1.3.2.bb          |  2 +-
 .../rabbitmq-c/rabbitmq-c_0.10.0.bb           |  2 +-
 .../rtorrent/rtorrent_git.bb                  |  2 +-
 .../usbmuxd/usbmuxd_git.bb                    |  2 +-
 .../wifi-test-suite/wifi-test-suite_git.bb    |  2 +-
 .../recipes-connectivity/zeromq/cppzmq_git.bb |  2 +-
 .../dbus/dbus-daemon-proxy_git.bb             |  2 +-
 meta-oe/recipes-core/emlog/emlog.inc          |  2 +-
 meta-oe/recipes-core/glfw/glfw_3.3.bb         |  2 +-
 meta-oe/recipes-core/libnfc/libnfc_git.bb     |  2 +-
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb     |  2 +-
 meta-oe/recipes-core/ndctl/ndctl_v67.bb       |  2 +-
 .../opencl-headers/opencl-headers_git.bb      |  2 +-
 .../opencl-icd-loader_git.bb                  |  2 +-
 meta-oe/recipes-core/safec/safec_3.5.1.bb     |  2 +-
 ...d-googletest-in-the-system-before-do.patch | 96 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  2 +-
 .../recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb |  9 +-
 .../recipes-crypto/libkcapi/libkcapi_git.bb   |  2 +-
 .../pkcs11-helper/pkcs11-helper_1.26.bb       |  2 +-
 meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb   |  2 +-
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |  2 +-
 .../abseil-cpp/abseil-cpp_git.bb              |  2 +-
 .../bootchart/bootchart_git.bb                |  2 +-
 .../recipes-devtools/breakpad/breakpad_git.bb | 10 +-
 .../capnproto/capnproto_0.7.0.bb              |  2 +-
 .../recipes-devtools/cjson/cjson_1.7.13.bb    |  2 +-
 .../concurrencykit/concurrencykit_git.bb      |  2 +-
 .../dnf-plugin-tui/dnf-plugin-tui_git.bb      |  2 +-
 .../flatbuffers/flatbuffers_1.12.0.bb         |  2 +-
 meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb  |  2 +-
 .../recipes-devtools/guider/guider_3.9.7.bb   |  2 +-
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb |  2 +-
 .../recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb |  2 +-
 .../recipes-devtools/lapack/lapack_3.9.0.bb   |  2 +-
 .../libsombok3/libsombok3_2.4.0.bb            |  2 +-
 .../recipes-devtools/libubox/libubox_git.bb   |  2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  2 +-
 .../luaposix/luaposix_33.4.0.bb               |  2 +-
 .../msgpack/msgpack-c_3.2.1.bb                |  2 +-
 .../recipes-devtools/nanopb/nanopb_0.4.0.bb   |  2 +-
 .../nlohmann-fifo/nlohmann-fifo_git.bb        |  2 +-
 .../nlohmann-json/nlohmann-json_3.7.3.bb      |  2 +-
 .../recipes-devtools/openocd/openocd_git.bb   |  8 +-
 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb |  2 +-
 .../perl/ipc-run_20180523.0.bb                |  2 +-
 .../perl/libdbd-mysql-perl_4.050.bb           |  2 +-
 .../perl/libjson-perl_4.02000.bb              |  2 +-
 meta-oe/recipes-devtools/ply/ply_git.bb       |  2 +-
 .../recipes-devtools/pmtools/pmtools_git.bb   |  2 +-
 .../protobuf/protobuf-c_1.3.3.bb              |  2 +-
 .../protobuf/protobuf_3.11.4.bb               |  2 +-
 .../rapidjson/rapidjson_git.bb                |  2 +-
 .../serialcheck/serialcheck_1.0.0.bb          |  2 +-
 .../sqlite-orm/sqlite-orm_1.5.bb              |  2 +-
 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb |  2 +-
 .../recipes-devtools/uftrace/uftrace_0.9.4.bb |  2 +-
 .../recipes-devtools/valijson/valijson_git.bb |  2 +-
 .../xmlrpc-c/xmlrpc-c_1.51.03.bb              |  2 +-
 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb  |  2 +-
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  2 +-
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  2 +-
 .../recipes-extended/brotli/brotli_1.0.7.bb   |  2 +-
 .../cmpi-bindings/cmpi-bindings_1.0.1.bb      |  2 +-
 .../dlt-daemon/dlt-daemon_2.18.7.bb           |  2 +-
 .../docopt.cpp/docopt.cpp_git.bb              |  2 +-
 .../dumb-init/dumb-init_1.2.2.bb              |  2 +-
 meta-oe/recipes-extended/figlet/figlet_git.bb |  2 +-
 .../haveged/haveged_1.9.13.bb                 |  2 +-
 .../recipes-extended/hexedit/hexedit_1.4.2.bb |  2 +-
 .../hiredis/hiredis_0.14.0.bb                 |  2 +-
 meta-oe/recipes-extended/iotop/iotop_0.6.bb   |  2 +-
 .../isomd5sum/isomd5sum_1.2.3.bb              |  2 +-
 .../jansson/jansson_2.13.1.bb                 |  3 +
 .../jpnevulator/jpnevulator_git.bb            |  2 +-
 .../konkretcmpi/konkretcmpi_0.9.2.bb          |  2 +-
 .../libblockdev/libblockdev_2.24.bb           |  2 +-
 meta-oe/recipes-extended/libcec/libcec_git.bb |  2 +-
 .../libdivecomputer/libdivecomputer_git.bb    |  2 +-
 .../libimobiledevice/libplist_2.1.0.bb        |  2 +-
 .../libimobiledevice/libusbmuxd_git.bb        |  2 +-
 .../liblightmodbus/liblightmodbus_2.0.2.bb    |  2 +-
 .../libnss-nisplus/libnss-nisplus.bb          |  2 +-
 meta-oe/recipes-extended/libqb/libqb_1.0.5.bb |  2 +-
 .../libreport/libreport_2.10.0.bb             |  2 +-
 .../recipes-extended/libuio/libuio_0.2.1.bb   |  2 +-
 .../recipes-extended/md5deep/md5deep_git.bb   |  2 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  2 +-
 .../openwsman/openwsman_2.6.11.bb             |  2 +-
 .../recipes-extended/ostree/ostree_2020.3.bb  |  2 +-
 .../p8platform/p8platform_git.bb              |  2 +-
 .../pam/pam-plugin-ccreds_11.bb               |  2 +-
 .../pam/pam-plugin-ldapdb_1.3.bb              |  2 +-
 meta-oe/recipes-extended/pmdk/pmdk_1.7.bb     |  2 +-
 .../recipes-extended/rrdtool/rrdtool_1.7.2.bb |  2 +-
 .../rsyslog/libfastjson_0.99.8.bb             |  2 +-
 .../recipes-extended/rsyslog/librelp_1.5.0.bb |  2 +-
 .../recipes-extended/sanlock/sanlock_3.8.0.bb |  2 +-
 .../recipes-extended/sedutil/sedutil_git.bb   |  2 +-
 .../socketcan/can-isotp_git.bb                |  2 +-
 .../socketcan/can-utils_git.bb                |  2 +-
 .../socketcan/canutils_4.0.6.bb               |  2 +-
 .../socketcan/libsocketcan_0.0.11.bb          |  2 +-
 meta-oe/recipes-extended/sysdig/sysdig_git.bb |  2 +-
 .../tipcutils/tipcutils_git.bb                |  2 +-
 .../triggerhappy/triggerhappy_git.bb          |  2 +-
 meta-oe/recipes-extended/upm/upm_git.bb       |  2 +-
 meta-oe/recipes-extended/wipe/wipe_0.24.bb    |  2 +-
 .../wxwidgets/wxwidgets_git.bb                |  2 +-
 meta-oe/recipes-extended/zlog/zlog_1.2.14.bb  |  2 +-
 meta-oe/recipes-extended/zstd/zstd_1.4.5.bb   |  2 +-
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb     |  2 +-
 .../dietsplash/dietsplash_git.bb              |  2 +-
 .../dnfdragora/dnfdragora_git.bb              |  2 +-
 .../recipes-graphics/fbgrab/fbgrab_1.3.3.bb   |  2 +-
 .../fontforge/fontforge_20190801.bb           |  2 +-
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb   |  2 +-
 meta-oe/recipes-graphics/glm/glm_0.9.9.6.bb   |  2 +-
 .../graphviz/graphviz_2.40.1.bb               |  2 +-
 .../recipes-graphics/jasper/jasper_2.0.16.bb  |  2 +-
 .../libvncserver/libvncserver_0.9.12.bb       |  2 +-
 .../libyui/libyui-ncurses_2.52.0.bb           |  2 +-
 .../recipes-graphics/libyui/libyui_3.6.0.bb   |  2 +-
 .../openjpeg/openjpeg_2.3.1.bb                |  2 +-
 .../recipes-graphics/qrencode/qrencode_git.bb |  2 +-
 .../renderdoc/renderdoc_1.7.bb                |  2 +-
 .../spir/spirv-shader-generator_git.bb        |  2 +-
 .../recipes-graphics/spir/spirv-tools_git.bb  | 10 +-
 .../tesseract/tesseract-lang_4.0.0.bb         |  2 +-
 .../tesseract/tesseract_git.bb                |  2 +-
 .../tigervnc/tigervnc_1.10.1.bb               |  2 +-
 .../ttf-fonts/ttf-droid_git.bb                |  2 +-
 .../recipes-graphics/ttf-fonts/ttf-lohit_2.bb |  2 +-
 .../ttf-fonts/ttf-noto-emoji_20190815.bb      |  2 +-
 .../unclutter-xfixes/unclutter-xfixes_1.5.bb  |  2 +-
 .../recipes-graphics/vdpau/libvdpau_1.3.bb    |  2 +-
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  2 +-
 .../xorg-driver/xf86-video-armsoc_1.4.1.bb    |  2 +-
 meta-oe/recipes-graphics/yad/yad_6.0.bb       |  2 +-
 .../agent-proxy/agent-proxy_1.97.bb           |  2 +-
 .../broadcom-bt-firmware_git.bb               |  2 +-
 meta-oe/recipes-kernel/crash/crash_7.2.8.bb   |  2 +-
 meta-oe/recipes-kernel/kpatch/kpatch.inc      |  2 +-
 .../minicoredumper/minicoredumper_2.0.1.bb    |  2 +-
 .../recipes-kernel/pm-graph/pm-graph_5.5.bb   |  2 +-
 meta-oe/recipes-multimedia/jack/a2jmidid_9.bb |  2 +-
 .../recipes-multimedia/jack/jack_1.19.14.bb   |  2 +-
 .../libass/libass_0.14.0.bb                   |  2 +-
 .../recipes-multimedia/mplayer/mpv_0.32.0.bb  |  2 +-
 .../pipewire/pipewire-0.2_git.bb              |  2 +-
 .../pipewire/pipewire_git.bb                  |  2 +-
 .../recipes-multimedia/v4l2apps/yavta_git.bb  |  2 +-
 .../recipes-multimedia/webm/libvpx_1.8.2.bb   |  2 +-
 .../recipes-security/softhsm/softhsm_git.bb   |  2 +-
 .../ace-cloud-editor/ace-cloud-editor_git.bb  |  2 +-
 meta-oe/recipes-support/avro/avro-c_1.9.2.bb  |  2 +-
 meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb  |  2 +-
 .../recipes-support/c-ares/c-ares_1.16.1.bb   |  2 +-
 .../ceres-solver/ceres-solver_1.14.0.bb       |  2 +-
 meta-oe/recipes-support/cli11/cli11_1.8.0.bb  |  2 +-
 meta-oe/recipes-support/cmark/cmark_git.bb    |  2 +-
 .../daemonize/daemonize_git.bb                |  2 +-
 .../digitemp/digitemp_3.7.2.bb                |  2 +-
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb  |  2 +-
 meta-oe/recipes-support/epeg/epeg_git.bb      |  2 +-
 meta-oe/recipes-support/fmt/fmt_6.2.0.bb      |  2 +-
 .../recipes-support/freerdp/freerdp_git.bb    |  2 +-
 .../function2/function2_4.0.0.bb              |  2 +-
 meta-oe/recipes-support/gd/gd_2.3.0.bb        |  2 +-
 .../recipes-support/gflags/gflags_2.2.2.bb    |  2 +-
 meta-oe/recipes-support/glog/glog_0.3.5.bb    |  2 +-
 .../gnulib/gnulib_2018-03-07.03.bb            |  2 +-
 .../gperftools/gperftools_2.7.90.bb           |  2 +-
 meta-oe/recipes-support/gpm/gpm_git.bb        |  2 +-
 meta-oe/recipes-support/hidapi/hidapi_git.bb  |  2 +-
 .../hunspell/hunspell-dictionaries.bb         |  2 +-
 .../hunspell/hunspell_1.7.0.bb                |  2 +-
 meta-oe/recipes-support/hwdata/hwdata_git.bb  |  2 +-
 .../recipes-support/iksemel/iksemel_1.5.bb    |  2 +-
 .../imagemagick/imagemagick_7.0.9.bb          |  2 +-
 meta-oe/recipes-support/inih/libinih_git.bb   |  2 +-
 .../iniparser/iniparser_4.1.bb                |  2 +-
 .../inotify-tools/inotify-tools_git.bb        |  2 +-
 .../libatasmart/libatasmart_0.19.bb           |  2 +-
 .../libbytesize/libbytesize_2.2.bb            |  2 +-
 .../libcereal/libcereal_1.3.0.bb              |  2 +-
 .../libcyusbserial/libcyusbserial_git.bb      |  2 +-
 .../recipes-support/libfann/libfann_git.bb    |  2 +-
 .../recipes-support/libgit2/libgit2_0.28.4.bb |  2 +-
 .../recipes-support/libgusb/libgusb_git.bb    |  2 +-
 .../recipes-support/libharu/libharu_2.3.0.bb  |  2 +-
 meta-oe/recipes-support/libiio/libiio_git.bb  |  2 +-
 .../libmimetic/libmimetic_0.9.8.bb            |  2 +-
 .../recipes-support/libmxml/libmxml_3.1.bb    |  2 +-
 .../recipes-support/libp11/libp11_0.4.10.bb   |  2 +-
 .../librsync/librsync_2.3.1.bb                |  2 +-
 .../recipes-support/libsoc/libsoc_0.8.2.bb    |  2 +-
 .../recipes-support/libteam/libteam_1.30.bb   |  2 +-
 .../libtinyxml2/libtinyxml2_8.0.0.bb          |  2 +-
 .../recipes-support/libusbg/libusbg_git.bb    |  2 +-
 .../recipes-support/libusbgx/libusbgx_git.bb  |  2 +-
 .../libutempter/libutempter.bb                |  2 +-
 .../lio-utils/lio-utils_4.1.bb                |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
 .../recipes-support/mcelog/mce-inject_git.bb  |  2 +-
 .../recipes-support/mcelog/mce-test_git.bb    |  2 +-
 meta-oe/recipes-support/mcelog/mcelog_168.bb  |  2 +-
 .../multipath-tools/multipath-tools_0.8.4.bb  |  2 +-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb    |  2 +-
 .../nss/nss/CVE-2020-12403_1.patch            | 65 +++++++++++++
 .../nss/nss/CVE-2020-12403_2.patch            | 80 ++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |  2 +
 .../recipes-support/numactl/numactl_git.bb    |  2 +-
 .../open-vm-tools/open-vm-tools_11.0.1.bb     |  2 +-
 .../opencl/clinfo_2.2.18.04.06.bb             |  2 +-
 meta-oe/recipes-support/opencv/ade_0.1.1f.bb  |  2 +-
 .../recipes-support/opencv/opencv_4.1.0.bb    | 12 +--
 .../recipes-support/opensc/opensc_0.20.0.bb   |  2 +-
 .../recipes-support/picocom/picocom_git.bb    |  2 +-
 .../pidgin/funyahoo-plusplus_git.bb           |  2 +-
 meta-oe/recipes-support/pidgin/icyque_git.bb  |  2 +-
 .../pidgin/purple-skypeweb_git.bb             |  2 +-
 meta-oe/recipes-support/poco/poco_1.9.4.bb    |  2 +-
 .../pps-tools/pps-tools_1.0.2.bb              |  2 +-
 .../recipes-support/remmina/remmina_1.3.6.bb  |  2 +-
 .../rsnapshot/rsnapshot_git.bb                |  2 +-
 meta-oe/recipes-support/sass/libsass_3.6.3.bb |  2 +-
 meta-oe/recipes-support/sass/sassc_git.bb     |  2 +-
 meta-oe/recipes-support/satyr/satyr_0.28.bb   |  2 +-
 .../serial-utils/pty-forward-native.bb        |  2 +-
 .../serial-utils/serial-forward_git.bb        |  2 +-
 .../span-lite/span-lite_git.bb                |  2 +-
 .../recipes-support/spdlog/spdlog_1.5.0.bb    |  2 +-
 .../recipes-support/spitools/spitools_git.bb  |  2 +-
 .../thin-provisioning-tools_0.8.5.bb          |  2 +-
 .../toscoterm/toscoterm_git.bb                |  2 +-
 meta-oe/recipes-support/udisks/udisks2_git.bb |  2 +-
 .../recipes-support/uhubctl/uhubctl_2.1.0.bb  |  2 +-
 .../recipes-support/uthash/uthash_2.1.0.bb    |  2 +-
 .../utouch/utouch-evemu_git.bb                |  2 +-
 .../utouch/utouch-frame_git.bb                |  2 +-
 .../utouch/utouch-mtview_git.bb               |  2 +-
 .../websocketpp/websocketpp_0.8.2.bb          |  2 +-
 .../recipes-support/xdelta/xdelta3_3.1.0.bb   |  2 +-
 .../xorg-xrdp/xorgxrdp_0.2.5.bb               |  2 +-
 meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb   |  2 +-
 .../recipes-support/xxhash/xxhash_0.7.3.bb    |  2 +-
 meta-oe/recipes-support/zbar/zbar_git.bb      |  2 +-
 .../recipes-support/zchunk/zchunk_1.1.6.bb    |  2 +-
 meta-oe/recipes-test/bats/bats_1.1.0.bb       |  2 +-
 meta-oe/recipes-test/catch2/catch2_2.9.2.bb   |  2 +-
 meta-oe/recipes-test/evtest/evtest_1.34.bb    |  2 +-
 meta-oe/recipes-test/fbtest/fb-test_git.bb    |  2 +-
 .../recipes-test/googletest/googletest_git.bb |  2 +-
 meta-perl/recipes-perl/po4a/po4a_0.49.bb      |  2 +-
 .../python-txws/python3-txws_0.9.1.bb         |  2 +-
 meta-python/recipes-devtools/gyp/gyp.inc      |  2 +-
 .../python/python-feedformatter.inc           |  2 +-
 .../python/python3-absl_0.7.0.bb              |  2 +-
 .../python/python3-astor_0.8.1.bb             |  2 +-
 .../python/python3-dbussy_1.2.1.bb            |  2 +-
 .../python/python3-dt-schema_git.bb           |  2 +-
 .../python/python3-gast_0.2.2.bb              |  2 +-
 .../python/python3-h5py_2.9.0.bb              |  2 +-
 .../python/python3-imageio_2.6.0.bb           |  2 +-
 .../python3-keras-applications_1.0.8.bb       |  2 +-
 .../python3-keras-preprocessing_1.1.0.bb      |  2 +-
 .../python/python3-langtable_0.0.38.bb        |  2 +-
 .../python/python3-pillow_6.2.1.bb            |  2 +-
 .../python/python3-pkgconfig_1.4.0.bb         |  2 +-
 .../python/python3-prctl_1.7.bb               |  2 +-
 .../python/python3-wheel_0.33.6.bb            |  2 +-
 .../python-blivet/python3-blivet_3.1.4.bb     |  2 +-
 .../python-blivet/python3-blivetgui_2.1.10.bb |  2 +-
 .../python-cson/python3-cson_git.bb           |  2 +-
 .../python-pyparted/python-pyparted.inc       |  2 +-
 .../apache-mod/apache-websocket_git.bb        |  2 +-
 .../recipes-httpd/cherokee/cherokee_git.bb    |  2 +-
 .../recipes-httpd/sthttpd/sthttpd_2.27.1.bb   |  2 +-
 .../recipes-support/fcgi/fcgi_git.bb          |  2 +-
 .../recipes-webadmin/netdata/netdata_git.bb   |  2 +-
 .../recipes-apps/xarchiver/xarchiver_git.bb   |  2 +-
 .../xfce-polkit/xfce-polkit_0.3.bb            |  2 +-
 .../xfce4-datetime-setter_3.32.2.bb           |  2 +-
 .../xfce4-closebutton-plugin_git.bb           |  2 +-
 409 files changed, 675 insertions(+), 426 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12403_1.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch

-- 
2.25.1


