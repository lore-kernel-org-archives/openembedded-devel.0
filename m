Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89875C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 16:14:08 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.336.1636820047056776312
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nrc2cVzS;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id l8so11443498qtk.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p+/usi+hScnQghz+EOJxSr1iDGWLDSKUETUnRsKQu8o=;
        b=Nrc2cVzSTWI2PxRIKV31ul2J7bpI6w8qjwbRWuF3N7avCKMtEqpumI2SUEx9Xg8M7B
         gTXuabn/cAaNhb90q1OyV+sJfTanQm2vAViJ/ZG2WGOziOjYhvYQH0QTwyJBs5DYFihD
         1juyPO3z4WWlgo0ve+uJGz+F6dhD6iXjTr5e8tWaUUdFXZ+KMkgwaXERlOptwp50+dYk
         2shOO871C2MPB/MsFcfZRx0xe2bzLN0N0SOKvWTaCq61NTPzWIrllJibP5E8KQju8isr
         DKbaZgB6iMg5soA3nJd62JS++kokz0YQvptIgfYOuehkwAV1vemEtVnIt24+0YrPZU7f
         LiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p+/usi+hScnQghz+EOJxSr1iDGWLDSKUETUnRsKQu8o=;
        b=l03vkZFnCz7TFeEGvIpYRwDQxzHhsJzPsvly2tQQas9iXEWOQOdcvo4WqGZ58SNres
         TIf4WUqZZvFIXMeGNW04v6F6ESB2+mfygMqtqvG4/bR/M7p0nSJ7zloNAtITUdrl6yTU
         V11Ygjv1gOrlaFtMMsJcsJDkOPlPu9m9091JX6XaP/NWPmEjrB5hBJ+SVg6Yfadz2vcF
         CKl04iS+WDHgF1jac3DBi9ICRMW8Lzwu6lepAVmefZviFzU0YOkQh8I/mkhEavH9PL3F
         DJp0j0joZAiBCEs8iyA2hMUXo3gR2ejxlmhX9eOeNgGzVAVLnUC9yHaqYtrZ9Sxe314W
         oMTQ==
X-Gm-Message-State: AOAM5316zGgwJkMdJ/cYE01B02eootuKF61VgyaPyuM3LJVeCdJ0Qbol
	ucnuGlgUEuCuZKAxIdqSCa8XbzVVcYHm3Vvwb2NRHzhV
X-Google-Smtp-Source: 
 ABdhPJxo4ho5t2bps/X2ZF7HF+OgfnxVsO55Yz1SD4CfsxDi1d7pQ4B9v8th6JmNoP9lM3qG7oe1ZRDo6viBd/NrZew=
X-Received: by 2002:ac8:5786:: with SMTP id v6mr13250913qta.225.1636820045705;
 Sat, 13 Nov 2021 08:14:05 -0800 (PST)
MIME-Version: 1.0
References: <18455b70-5668-5847-b392-4418d33ad11a@gmail.com>
In-Reply-To: <18455b70-5668-5847-b392-4418d33ad11a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Nov 2021 08:13:39 -0800
Message-ID: 
 <CAMKF1soSb4p3icmMzXCkbAC6v+Spc7Df7CbG460qdD4Ui53q7g@mail.gmail.com>
Subject: Re: honister merge request: Nov 13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 16:14:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93929

On Sat, Nov 13, 2021 at 7:32 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit e886fc0cbac89998f675b70679d0cce6bcebfb7f:
>
>   Apache: Several CVE fixes (2021-10-26 12:47:10 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded honister-next
>
> for you to fetch changes up to ad52a41de8b4b7d619d1376d0a0090ebcfff56da:
>
>   recipes: remove tabs and spaces in SRC_URI (2021-11-10 07:04:55 -0800)
>
> ----------------------------------------------------------------
> Armin Kuster (2):
>       recipes: Update SRC_URI branch and protocols
>       recipes: remove tabs and spaces in SRC_URI
>
> Khem Raj (2):
>       mtr: Explicitly use branch= in SRC_URI
>       python3-kivy: Use branch parameter in SRC_URI
>
> Yi Zhao (1):
>       libssh: use https instead of git in SRC_URI
>\

merged thanks.

>  meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
> |  2 +-
>  meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
> |  2 +-
>  meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
> |  2 +-
>  meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.2.bb
> |  2 +-
>  meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
> |  2 +-
>  meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
> |  2 +-
>  meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
> |  2 +-
>  meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
> |  2 +-
>  meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
> |  2 +-
>  meta-gnome/recipes-support/ibus/ibus.inc
> |  2 +-
>  meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> |  2 +-
>  meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
> |  2 +-
>  meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
> |  2 +-
>  meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> |  2 +-
>  meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> |  2 +-
>  meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
> |  2 +-
>  meta-initramfs/recipes-devtools/grubby/grubby_git.bb
> |  2 +-
>  meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
> |  2 +-
>  meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> |  2 +-
>  meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
> |  2 +-
>  meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.19.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.9.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
> |  2 +-
>  meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> |  2 +-
>  meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
> |  2 +-
>  meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
> |  2 +-
>  meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
> |  2 +-
>  meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> |  2 +-
>  meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> |  2 +-
>  meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
> |  2 +-
>  meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> |  2 +-
>  meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
> |  2 +-
>  meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
> |  2 +-
>  meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
> |  2 +-
>  meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
> |  2 +-
>  meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
> |  2 +-
>  meta-networking/recipes-connectivity/nanomsg/nng_1.4.0.bb
> |  2 +-
>  meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
> |  2 +-
>  meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
> |  2 +-
>  meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb
> |  2 +-
>  meta-networking/recipes-connectivity/relayd/relayd_git.bb
> |  2 +-
>  meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> |  2 +-
>  meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.1.bb
> |  2 +-
>  meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
> |  2 +-
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> |  2 +-
>  .../recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.4.bb
> |  2 +-
>  meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> |  2 +-
>  meta-networking/recipes-daemons/vblade/vblade_25.bb
> |  2 +-
>  meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
> |  2 +-
>  .../recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
> |  2 +-
>  meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
> |  2 +-
>  meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.3.bb
> |  2 +-
>  meta-networking/recipes-filter/libnftnl/libnftnl_1.2.0.bb
> |  2 +-
>  meta-networking/recipes-irc/znc/znc_1.8.2.bb
> |  4 ++--
>  meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
> |  2 +-
>  meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210315.bb
> |  2 +-
>  meta-networking/recipes-protocols/babeld/babeld_1.10.bb
> |  2 +-
>  meta-networking/recipes-protocols/openflow/openflow.inc
> |  2 +-
>  meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
> |  2 +-
>  meta-networking/recipes-support/arptables/arptables_git.bb
> |  2 +-
>  meta-networking/recipes-support/bmon/bmon_2.1.0.bb
> |  2 +-
>  meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
> |  2 +-
>  meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> |  2 +-
>  meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
> |  4 ++--
>  meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
> |  2 +-
>  meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
> |  2 +-
>  meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> |  2 +-
>  meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
> |  2 +-
>  meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
> |  2 +-
>  meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
> |  2 +-
>  meta-networking/recipes-support/libconfuse/libconfuse_3.3.bb
> |  2 +-
>  meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
> |  2 +-
>  meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> |  2 +-
>  meta-networking/recipes-support/mtr/mtr_0.94.bb
> |  3 ++-
>  meta-networking/recipes-support/nbdkit/nbdkit_1.25.7.bb
> |  2 +-
>  meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> |  2 +-
>  meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> |  2 +-
>  meta-networking/recipes-support/netperf/netperf_git.bb
> |  2 +-
>  meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
> |  2 +-
>  meta-networking/recipes-support/ntimed/ntimed_git.bb
> |  2 +-
>  meta-networking/recipes-support/ntopng/ndpi_4.0.bb
> |  2 +-
>  meta-networking/recipes-support/ntopng/ntopng_5.0.bb
> |  2 +-
>  meta-networking/recipes-support/open-isns/open-isns_0.101.bb
> |  2 +-
>  meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.2.5.bb
> |  2 +-
>  meta-networking/recipes-support/phytool/phytool.bb
> |  2 +-
>  meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
> |  2 +-
>  meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
> |  2 +-
>  meta-networking/recipes-support/spice/spice-protocol_git.bb
> |  2 +-
>  meta-networking/recipes-support/spice/spice_git.bb
> |  4 ++--
>  meta-networking/recipes-support/spice/usbredir_0.9.0.bb
> |  2 +-
>  meta-networking/recipes-support/unbound/unbound_1.13.2.bb
> |  2 +-
>  meta-networking/recipes-support/wpan-tools/wpan-tools_0.9.bb
> |  2 +-
>  .../meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.3.bb
> |  2 +-
>  meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> |  2 +-
>  meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
> |  2 +-
>  meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
> |  2 +-
>  meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
> |  2 +-
>  .../dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.6.bb
> |  2 +-
>  meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.7.bb
> |  2 +-
>  meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> |  2 +-
>  meta-oe/recipes-benchmark/fio/fio_3.28.bb
> |  2 +-
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> |  2 +-
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
> |  2 +-
>  meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> |  2 +-
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> |  2 +-
>  meta-oe/recipes-benchmark/mbw/mbw_git.bb
> |  2 +-
>  meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
> |  2 +-
>  meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> |  2 +-
>  meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
> |  2 +-
>  meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
> |  2 +-
>  meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> |  2 +-
>  meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> |  2 +-
>  meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> |  2 +-
>  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> |  2 +-
>  meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb
> |  2 +-
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> |  2 +-
>  meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.3.0.bb
> |  2 +-
>  meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
> |  2 +-
>  meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
> |  2 +-
>  meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.8.bb
> |  2 +-
>  meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
> |  2 +-
>  meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> |  2 +-
>  meta-oe/recipes-connectivity/transmission/transmission_git.bb
> |  2 +-
>  meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
> |  2 +-
>  meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
> |  2 +-
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> |  2 +-
>  meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
> |  2 +-
>  meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> |  2 +-
>  meta-oe/recipes-core/emlog/emlog.inc
> |  2 +-
>  meta-oe/recipes-core/glfw/glfw_3.3.bb
> |  2 +-
>  meta-oe/recipes-core/libnfc/libnfc_git.bb
> |  2 +-
>  meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> |  2 +-
>  meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> |  2 +-
>  meta-oe/recipes-core/ndctl/ndctl_v69.bb
> |  2 +-
>  meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
> |  2 +-
>  meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> |  2 +-
>  meta-oe/recipes-core/opencl/opencl-headers_git.bb
> |  2 +-
>  meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
> |  2 +-
>  meta-oe/recipes-core/safec/safec_3.5.1.bb
> |  2 +-
>  meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
> |  2 +-
>  meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.4.bb
> |  2 +-
>  meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
> |  2 +-
>  meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
> |  2 +-
>  meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
> |  2 +-
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
> |  2 +-
>  meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> |  2 +-
>  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/boost-url/boost-url_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> |  8 ++++----
>  meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
> |  2 +-
>  meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/ctags/ctags_5.9.20210905.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> |  2 +-
>  meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
> |  2 +-
>  meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.1.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
> |  2 +-
>  meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/libubox/libubox_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
> |  2 +-
>  meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.2.bb
> |  2 +-
>  meta-oe/recipes-devtools/openocd/openocd_git.bb
> |  8 ++++----
>  meta-oe/recipes-devtools/pahole/pahole_1.22.bb
> |  2 +-
>  meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
> |  2 +-
>  meta-oe/recipes-devtools/perl/libjson-perl_4.03000.bb
> |  2 +-
>  meta-oe/recipes-devtools/ply/ply_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/pmtools/pmtools_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
> |  2 +-
>  meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> |  2 +-
>  meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
> |  2 +-
>  meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
> |  2 +-
>  meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> |  2 +-
>  meta-oe/recipes-devtools/uftrace/uftrace_0.10.bb
> |  2 +-
>  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> |  2 +-
>  meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
> |  2 +-
>  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> |  2 +-
>  meta-oe/recipes-devtools/yasm/yasm_git.bb
> |  2 +-
>  meta-oe/recipes-extended/beep/beep_1.4.9.bb
> |  2 +-
>  meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> |  2 +-
>  meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
> |  2 +-
>  meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> |  2 +-
>  meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> |  2 +-
>  meta-oe/recipes-extended/dumb-init/dumb-init_1.2.5.bb
> |  2 +-
>  meta-oe/recipes-extended/figlet/figlet_git.bb
> |  2 +-
>  meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
> |  2 +-
>  meta-oe/recipes-extended/hexedit/hexedit_1.5.bb
> |  2 +-
>  meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
> |  2 +-
>  meta-oe/recipes-extended/iotop/iotop_0.6.bb
> |  2 +-
>  meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
> |  2 +-
>  meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> |  2 +-
>  meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> |  2 +-
>  meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> |  2 +-
>  meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
> |  2 +-
>  meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
> |  2 +-
>  meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
> |  2 +-
>  meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
> |  2 +-
>  meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.0.2.bb
> |  2 +-
>  meta-oe/recipes-extended/libleak/libleak_git.bb
> |  2 +-
>  meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
> |  2 +-
>  meta-oe/recipes-extended/libqb/libqb_2.0.3.bb
> |  2 +-
>  meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
> |  2 +-
>  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> |  2 +-
>  meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> |  2 +-
>  meta-oe/recipes-extended/md5deep/md5deep_git.bb
> |  2 +-
>  meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
> |  2 +-
>  meta-oe/recipes-extended/mraa/mraa_git.bb
> |  2 +-
>  meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
> |  2 +-
>  meta-oe/recipes-extended/ostree/ostree_2021.3.bb
> |  2 +-
>  meta-oe/recipes-extended/p8platform/p8platform_git.bb
> |  2 +-
>  meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> |  2 +-
>  meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
> |  2 +-
>  meta-oe/recipes-extended/pmdk/pmdk_1.9.bb
> |  2 +-
>  meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> |  2 +-
>  meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.2.bb
> |  2 +-
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
> |  2 +-
>  meta-oe/recipes-extended/rsyslog/libfastjson_0.99.9.bb
> |  2 +-
>  meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
> |  2 +-
>  meta-oe/recipes-extended/sedutil/sedutil_git.bb
> |  2 +-
>  meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> |  2 +-
>  meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> |  2 +-
>  meta-oe/recipes-extended/socketcan/can-utils_git.bb
> |  2 +-
>  meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
> |  2 +-
>  meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb
> |  2 +-
>  meta-oe/recipes-extended/sysdig/sysdig_git.bb
> |  2 +-
>  meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> |  2 +-
>  meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
> |  2 +-
>  meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> |  2 +-
>  meta-oe/recipes-extended/upm/upm_git.bb
> |  2 +-
>  meta-oe/recipes-extended/wipe/wipe_0.24.bb
> |  2 +-
>  meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> |  2 +-
>  meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
> |  2 +-
>  meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> |  2 +-
>  meta-oe/recipes-gnome/libjcat/libjcat_0.1.8.bb
> |  2 +-
>  meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.2.bb
> |  2 +-
>  meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb
> |  2 +-
>  meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> |  2 +-
>  meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> |  2 +-
>  meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
> |  2 +-
>  meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
> |  2 +-
>  meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
> |  2 +-
>  meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> |  2 +-
>  meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> |  2 +-
>  meta-oe/recipes-graphics/jasper/jasper_2.0.26.bb
> |  2 +-
>  meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
> |  2 +-
>  meta-oe/recipes-graphics/libyui/libyui-ncurses_4.1.1.bb
> |  2 +-
>  meta-oe/recipes-graphics/libyui/libyui_4.1.1.bb
> |  2 +-
>  meta-oe/recipes-graphics/openbox/obconf_git.bb
> |  2 +-
>  meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
> |  2 +-
>  meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
> |  2 +-
>  meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
> |  2 +-
>  meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
> |  2 +-
>  meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
> |  2 +-
>  meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> |  2 +-
>  meta-oe/recipes-graphics/tesseract/tesseract_4.1.1.bb
> |  2 +-
>  meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
> |  2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> |  2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.92.1.bb
> |  2 +-
>  meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
> |  2 +-
>  meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
> |  2 +-
>  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> |  6 +++---
>  meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> |  2 +-
>  meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
> |  2 +-
>  meta-oe/recipes-graphics/yad/yad_6.0.bb
> |  2 +-
>  meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
> |  2 +-
>  .../recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
> |  2 +-
>  meta-oe/recipes-kernel/crash/crash_7.3.0.bb
> |  2 +-
>  meta-oe/recipes-kernel/kpatch/kpatch.inc
> |  2 +-
>  meta-oe/recipes-kernel/libbpf/libbpf_0.5.bb
> |  2 +-
>  meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
> |  2 +-
>  meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> |  2 +-
>  meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
> |  2 +-
>  meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
> |  2 +-
>  meta-oe/recipes-multimedia/jack/jack_1.19.19.bb
> |  2 +-
>  meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
> |  2 +-
>  meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> |  2 +-
>  meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
> |  2 +-
>  meta-oe/recipes-security/audit/audit_2.8.5.bb
> |  2 +-
>  meta-oe/recipes-security/audit/audit_3.0.5.bb
> |  2 +-
>  meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> |  2 +-
>  meta-oe/recipes-support/avro/avro-c_1.10.2.bb
> |  2 +-
>  meta-oe/recipes-support/bdwgc/bdwgc_8.0.6.bb
> |  2 +-
>  meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
> |  2 +-
>  meta-oe/recipes-support/c-periphery/c-periphery_2.3.1.bb
> |  2 +-
>  meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
> |  2 +-
>  meta-oe/recipes-support/cli11/cli11_1.9.1.bb
> |  2 +-
>  meta-oe/recipes-support/cmark/cmark_0.30.2.bb
> |  2 +-
>  meta-oe/recipes-support/consolation/consolation_0.0.8.bb
> |  2 +-
>  meta-oe/recipes-support/daemonize/daemonize_git.bb
> |  2 +-
>  meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
> |  2 +-
>  meta-oe/recipes-support/dstat/dstat_0.7.4.bb
> |  2 +-
>  meta-oe/recipes-support/epeg/epeg_git.bb
> |  2 +-
>  meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> |  2 +-
>  meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
> |  2 +-
>  meta-oe/recipes-support/function2/function2_4.2.0.bb
> |  2 +-
>  meta-oe/recipes-support/gd/gd_2.3.3.bb
> |  2 +-
>  meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> |  2 +-
>  meta-oe/recipes-support/glog/glog_0.5.0.bb
> |  2 +-
>  meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
> |  2 +-
>  meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
> |  2 +-
>  meta-oe/recipes-support/gpm/gpm_git.bb
> |  2 +-
>  meta-oe/recipes-support/hidapi/hidapi_git.bb
> |  2 +-
>  meta-oe/recipes-support/htop/htop_3.0.5.bb
> |  2 +-
>  meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> |  2 +-
>  meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
> |  2 +-
>  meta-oe/recipes-support/hwdata/hwdata_0.347.bb
> |  2 +-
>  meta-oe/recipes-support/iksemel/iksemel_1.5.bb
> |  2 +-
>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> |  2 +-
>  meta-oe/recipes-support/inih/libinih_git.bb
> |  2 +-
>  meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> |  2 +-
>  meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
> |  2 +-
>  meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> |  2 +-
>  meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
> |  2 +-
>  meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
> |  2 +-
>  meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
> |  2 +-
>  meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> |  2 +-
>  meta-oe/recipes-support/libfann/libfann_git.bb
> |  2 +-
>  meta-oe/recipes-support/libgusb/libgusb_0.3.7.bb
> |  2 +-
>  meta-oe/recipes-support/libharu/libharu_2.3.0.bb
> |  2 +-
>  meta-oe/recipes-support/libiio/libiio_git.bb
> |  2 +-
>  meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
> |  2 +-
>  meta-oe/recipes-support/libmxml/libmxml_3.2.bb
> |  2 +-
>  meta-oe/recipes-support/libp11/libp11_0.4.11.bb
> |  2 +-
>  meta-oe/recipes-support/libraw/libraw_0.20.2.bb
> |  2 +-
>  meta-oe/recipes-support/librdkafka/librdkafka_1.6.1.bb
> |  2 +-
>  meta-oe/recipes-support/librsync/librsync_2.3.2.bb
> |  2 +-
>  meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
> |  2 +-
>  meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> |  2 +-
>  meta-oe/recipes-support/libteam/libteam_1.31.bb
> |  2 +-
>  meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
> |  2 +-
>  meta-oe/recipes-support/libusb/libusb-compat_0.1.7.bb
> |  2 +-
>  meta-oe/recipes-support/libusbg/libusbg_git.bb
> |  2 +-
>  meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> |  2 +-
>  meta-oe/recipes-support/libutempter/libutempter.bb
> |  2 +-
>  meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> |  2 +-
>  meta-oe/recipes-support/mcelog/mce-inject_git.bb
> |  2 +-
>  meta-oe/recipes-support/mcelog/mce-test_git.bb
> |  2 +-
>  meta-oe/recipes-support/mcelog/mcelog_175.bb
> |  2 +-
>  meta-oe/recipes-support/mg/mg_20210609.bb
> |  2 +-
>  meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> |  2 +-
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> |  2 +-
>  meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb
> |  2 +-
>  meta-oe/recipes-support/opencv/ade_0.1.1f.bb
> |  2 +-
>  meta-oe/recipes-support/opencv/opencv_4.5.2.bb
> | 14 +++++++-------
>  meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> |  2 +-
>  meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
> |  2 +-
>  meta-oe/recipes-support/picocom/picocom_git.bb
> |  2 +-
>  meta-oe/recipes-support/pidgin/funyahoo-plusplus_git.bb
> |  2 +-
>  meta-oe/recipes-support/pidgin/icyque_git.bb
> |  2 +-
>  meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> |  2 +-
>  meta-oe/recipes-support/poco/poco_1.11.0.bb
> |  2 +-
>  meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> |  2 +-
>  meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
> |  2 +-
>  meta-oe/recipes-support/re2/re2_2020.11.01.bb
> |  2 +-
>  meta-oe/recipes-support/remmina/remmina_1.4.18.bb
> |  2 +-
>  meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> |  2 +-
>  meta-oe/recipes-support/sass/libsass_git.bb
> |  2 +-
>  meta-oe/recipes-support/sass/sassc_git.bb
> |  2 +-
>  meta-oe/recipes-support/satyr/satyr_0.38.bb
> |  2 +-
>  meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> |  2 +-
>  meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> |  2 +-
>  meta-oe/recipes-support/smarty/smarty_3.1.39.bb
> |  2 +-
>  meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
> |  2 +-
>  meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
> |  2 +-
>  meta-oe/recipes-support/spitools/spitools_git.bb
> |  2 +-
>  .../recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> |  2 +-
>  meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> |  2 +-
>  meta-oe/recipes-support/udisks/udisks2_2.9.3.bb
> |  2 +-
>  meta-oe/recipes-support/uhubctl/uhubctl_2.4.0.bb
> |  2 +-
>  meta-oe/recipes-support/uthash/uthash_2.3.0.bb
> |  2 +-
>  meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> |  2 +-
>  meta-oe/recipes-support/utouch/utouch-frame_git.bb
> |  2 +-
>  meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> |  2 +-
>  meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
> |  2 +-
>  meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
> |  2 +-
>  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> |  2 +-
>  meta-oe/recipes-support/xrdp/xrdp_0.9.16.bb
> |  2 +-
>  meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
> |  2 +-
>  meta-oe/recipes-support/zbar/zbar_git.bb
> |  2 +-
>  meta-oe/recipes-test/bats/bats_1.4.1.bb
> |  2 +-
>  meta-oe/recipes-test/catch2/catch2_2.13.7.bb
> |  2 +-
>  meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> |  2 +-
>  meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> |  2 +-
>  meta-oe/recipes-test/evtest/evtest_1.34.bb
> |  2 +-
>  meta-oe/recipes-test/fbtest/fb-test_git.bb
> |  2 +-
>  meta-oe/recipes-test/googletest/googletest_git.bb
> |  2 +-
>  meta-perl/recipes-perl/po4a/po4a_0.49.bb
> |  2 +-
>  meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
> |  2 +-
>  meta-python/recipes-devtools/gyp/gyp_git.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-dt-schema_git.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
> |  2 +-
>  meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
> |  2 +-
>  meta-python/recipes-extended/python-blivet/python3-blivet_3.4.0.bb
> |  2 +-
>  meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb
> |  2 +-
>  meta-python/recipes-extended/python-cson/python3-cson_git.bb
> |  2 +-
>  meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> |  2 +-
>  meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
> |  2 +-
>  meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> |  2 +-
>  meta-webserver/recipes-support/fcgi/fcgi_git.bb
> |  2 +-
>  meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
> |  2 +-
>  meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
> |  2 +-
>  meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> |  2 +-
>  meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> |  2 +-
>  meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
> |  2 +-
>  453 files changed, 471 insertions(+), 470 deletions(-)
>

