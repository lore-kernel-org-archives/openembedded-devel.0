Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAA3C25B7A
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 22:49:16 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.64.1715813347569515615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 May 2024 15:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/wJFRnz;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b27999f889so3584001eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 15:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715813346; x=1716418146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9JacbjR5XzvPA96zlq69nLwsMlBK2WpLB/dxSum1C+0=;
        b=B/wJFRnzjqUj7A/2YClJe9xJ0U0x+EFmrFYWxk3AFoT6nmnXPMf+YtHo3wKIhniVZI
         MJFB5FypTJNxfiUUSDFbGfyczeZBS/dFjgDNq6r/Yhx7lMP4YtK4q5pj1GAoghKl9nrm
         Hbkd3wA1iy+VQf3TJqf6ceynYM7+IRt3Nr9ZAzetr58aqfU6MWtvMerrs7bAXIClfa+0
         Llq2OgtOBr014ih0nV5hcsGEjBOzadDD+9bV9lj0v8BDAgDGyt1qCQ73BbJdbV/9AxIp
         k5jS3Y1UXQhBBU+9jzlH9wJ0Xf0r9yxp2BnjKwawxtsuYZhqpxAw9jkzuHhdHY6x2xr6
         P+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715813346; x=1716418146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JacbjR5XzvPA96zlq69nLwsMlBK2WpLB/dxSum1C+0=;
        b=u3Zz28GnEswbz9rlXrqdBhQ6omgTsD9OvkyHALVsg4owLUs5HPpRz3p13cuYC1P7Ye
         LAWIhPRw/x7hgSZDS9MfcWixfV9/GMyR8ApT+JQJewLC3PeN1iWMw761IyFQNWvmSovN
         +bf0wvvS0eeQycFfPbE0V/hI05XFT0JAuZw21t11N5xvNs3hdhOcGovuIZYscgcq3TdZ
         1xkMebDa5kk0MTGbpNx4eUsuru+MY22yj/yrma8fdcXFxeaIfS//9q8Ak1QWbKsJyTDn
         ptgW1LmPotBaL1dhjHgAIn7m2Cd5ZveI13MXqY+nb9dm/J9gVpvqdSyrbJ4Vy4P2QS80
         KFhw==
X-Gm-Message-State: AOJu0YzsB6i3FmH4B6UUGUMtBW9XGrlbD3OWWmyu3OMXbCx76ehQVrtq
	xoHSpt0wCVnjVU5f/mXBupF5PfhJJrFkHjpGSmEFF2D9gGSmOS7JslVdyF5fgFs=
X-Google-Smtp-Source: AGHT+IGeHOG80swSyFIX/a1pa5FEDeKLUGLnA/lixWu+DIjXUw35RSGKxdEMxkqUbdMvOGPPYVCR4w==
X-Received: by 2002:a05:6359:4c99:b0:192:84cb:925d with SMTP id e5c5f4694b2df-193bb5173d7mr1624957555d.8.1715813344384;
        Wed, 15 May 2024 15:49:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6fff])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634103f80e4sm12090938a12.75.2024.05.15.15.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 15:49:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] recipes: Undergo WORKDIR -> UNPACKDIR transition
Date: Wed, 15 May 2024 15:48:58 -0700
Message-ID: <20240515224900.232825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 22:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110408

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/owfs/owfs_3.2p3.bb       |  4 ++--
 .../recipes-support/fuse/fuse_2.9.9.bb           |  2 +-
 .../recipes-utils/aufs-util/aufs-util_git.bb     |  2 +-
 .../xfstests/xfstests_2024.03.03.bb              |  8 ++++----
 .../recipes-gnome/devilspie/devilspie2_0.44.bb   |  4 ++--
 .../evolution-data-server.bb                     |  2 +-
 .../dvb-apps/dvb-apps_1.1.1.20140321.bb          |  2 +-
 .../libdvbcsa/libdvbcsa_1.1.0.bb                 |  2 +-
 .../recipes-multimedia/minidlna/minidlna.inc     |  4 ++--
 .../recipes-multimedia/musicpd/mpd_0.23.14.bb    |  2 +-
 .../recipes-multimedia/mycroft/mycroft_19.8.1.bb |  6 +++---
 .../firewalld/firewalld_1.3.2.bb                 |  2 +-
 .../dhcp/dhcp-relay_4.4.3p1.bb                   |  6 +++---
 .../freeradius/freeradius_3.2.3.bb               |  8 ++++----
 .../miniupnpd/miniupnpd_2.1.20191006.bb          |  2 +-
 .../mosquitto/mosquitto_2.0.18.bb                |  2 +-
 .../networkmanager/networkmanager_1.46.0.bb      |  6 +++---
 .../recipes-connectivity/samba/samba_4.19.6.bb   |  4 ++--
 .../recipes-connectivity/snort/snort_2.9.20.bb   |  8 ++++----
 .../recipes-connectivity/tayga/tayga_0.9.2.bb    |  4 ++--
 .../recipes-connectivity/vpnc/vpnc_0.5.3.bb      |  4 ++--
 .../recipes-daemons/atftp/atftp_0.8.0.bb         |  4 ++--
 .../recipes-daemons/ippool/ippool_1.3.bb         |  4 ++--
 .../iscsi-initiator-utils_2.1.8.bb               | 12 ++++++------
 .../recipes-daemons/lldpd/lldpd_1.0.18.bb        |  4 ++--
 .../recipes-daemons/openhpi/openhpi_3.8.0.bb     |  4 ++--
 .../recipes-daemons/postfix/postfix_3.8.6.bb     | 12 ++++++------
 .../recipes-daemons/proftpd/proftpd_1.3.7c.bb    |  6 +++---
 .../recipes-daemons/ptpd/ptpd_2.3.1.bb           |  4 ++--
 .../recipes-daemons/radvd/radvd_2.19.bb          | 10 +++++-----
 .../recipes-daemons/squid/squid_6.9.bb           |  4 ++--
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb     |  8 ++++----
 .../recipes-daemons/vblade/vblade_25.bb          | 10 +++++-----
 .../recipes-daemons/vsftpd/vsftpd_3.0.5.bb       | 12 ++++++------
 .../recipes-devtools/libcoap/libcoap_4.3.4.bb    |  2 +-
 .../recipes-extended/corosync/corosync_3.1.6.bb  |  2 +-
 .../recipes-extended/tgt/tgt_1.0.90.bb           |  6 +++---
 .../conntrack-tools/conntrack-tools_1.4.8.bb     |  6 +++---
 .../recipes-filter/ebtables/ebtables_2.0.11.bb   |  6 +++---
 .../recipes-filter/ulogd2/ulogd2_2.0.8.bb        |  4 ++--
 .../freediameter/freediameter_1.5.0.bb           | 10 +++++-----
 meta-networking/recipes-protocols/frr/frr_9.1.bb |  2 +-
 .../mdns/mdns_2200.100.94.0.2.bb                 |  2 +-
 .../recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 10 +++++-----
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb   |  2 +-
 .../pptp-linux/pptp-linux_1.10.0.bb              |  2 +-
 .../recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb  |  6 +++---
 .../recipes-protocols/zeroconf/zeroconf_0.9.bb   |  4 ++--
 .../recipes-support/arptables/arptables_git.bb   |  2 +-
 .../recipes-support/chrony/chrony_4.5.bb         |  4 ++--
 .../cim-schema/cim-schema-docs_2.40.0.bb         |  2 +-
 .../cim-schema/cim-schema-exper_2.50.0.bb        |  4 ++--
 .../cim-schema/cim-schema-final_2.40.0.bb        |  4 ++--
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb      | 16 ++++++++--------
 .../recipes-support/dovecot/dovecot_2.3.21.bb    |  2 +-
 .../recipes-support/geoip/geoip_1.6.12.bb        |  8 ++++----
 .../recipes-support/geoip/geoipupdate_2.5.0.bb   |  4 ++--
 .../lksctp-tools/lksctp-tools_1.0.19.bb          |  4 ++--
 .../recipes-support/netperf/netperf_git.bb       |  6 +++---
 .../recipes-support/nis/yp-tools_4.2.3.bb        |  2 +-
 .../recipes-support/ntopng/ntopng_5.2.1.bb       |  2 +-
 .../recipes-support/ntp/ntp_4.2.8p17.bb          | 12 ++++++------
 .../recipes-support/ntpsec/ntpsec_1.2.2a.bb      |  2 +-
 .../open-vm-tools/open-vm-tools_12.3.5.bb        |  6 +++---
 .../recipes-support/openipmi/openipmi_2.0.35.bb  |  4 ++--
 .../recipes-support/openvpn/openvpn_2.6.10.bb    |  2 +-
 .../recipes-support/pgpool2/pgpool2_4.5.1.bb     |  4 ++--
 .../tinyproxy/tinyproxy_1.11.1.bb                |  4 ++--
 .../recipes-connectivity/lirc/lirc_0.10.2.bb     | 10 +++++-----
 .../thingsboard-gateway_3.4.6.bb                 |  8 ++++----
 .../recipes-support/rasdaemon/rasdaemon_0.8.0.bb |  4 ++--
 .../android-tools-conf-configfs_1.0.bb           | 12 ++++++------
 .../android-tools/android-tools-conf_1.0.bb      |  2 +-
 .../android-tools/android-tools_29.0.6.r14.bb    |  2 +-
 meta-oe/recipes-benchmark/iozone3/iozone3_506.bb | 10 +++++-----
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb |  2 +-
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb  |  2 +-
 meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb |  2 +-
 meta-oe/recipes-bsp/firmwared/firmwared_git.bb   |  2 +-
 .../recipes-bsp/irda-utils/irda-utils_0.9.18.bb  |  2 +-
 .../recipes-bsp/lm_sensors/lmsensors_3.6.0.bb    |  4 ++--
 .../recipes-connectivity/gammu/gammu_1.42.0.bb   |  4 ++--
 .../recipes-connectivity/hostapd/hostapd_2.10.bb |  6 +++---
 meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb | 10 +++++-----
 .../linuxptp/linuxptp_4.1.bb                     |  6 +++---
 .../ser2net/ser2net_4.6.2.bb                     |  2 +-
 .../transmission/transmission_4.0.5.bb           |  4 ++--
 .../recipes-connectivity/zabbix/zabbix_6.2.7.bb  |  2 +-
 meta-oe/recipes-core/emlog/emlog_git.bb          |  2 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc            | 12 +++++-------
 meta-oe/recipes-dbs/postgresql/postgresql.inc    | 10 +++++-----
 .../android-tools-conf-configfs_1.0.bb           | 12 ++++++------
 .../android-tools/android-tools-conf_1.0.bb      |  2 +-
 .../android-tools/android-tools_5.1.1.r37.bb     |  4 ++--
 .../dnf-plugin-tui/dnf-plugin-tui_1.4.bb         |  2 +-
 .../recipes-devtools/iptraf/iptraf-ng_1.2.1.bb   |  2 +-
 meta-oe/recipes-devtools/php/php_8.2.18.bb       | 10 +++++-----
 meta-oe/recipes-extended/bitwise/bitwise_0.50.bb |  2 +-
 .../recipes-extended/collectd/collectd_5.12.0.bb |  4 ++--
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb    |  6 +++---
 .../inputattach-config/inputattach-config.bb     |  2 +-
 .../linuxconsole/linuxconsole_1.7.1.bb           |  8 ++++----
 .../minifi-cpp/minifi-cpp_0.15.0.bb              |  6 +++---
 meta-oe/recipes-extended/networking/mstpd_git.bb |  4 ++--
 .../openwsman/openwsman_2.7.2.bb                 |  2 +-
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb |  4 ++--
 meta-oe/recipes-extended/redis/redis_7.2.4.bb    |  6 +++---
 .../recipes-extended/rsyslog/rsyslog_8.2404.0.bb |  8 ++++----
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb               |  2 +-
 .../scsirastools/scsirastools_1.6.6.bb           |  2 +-
 .../smartmontools/smartmontools_7.4.bb           |  6 +++---
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb    |  2 +-
 meta-oe/recipes-extended/zram/zram_0.2.bb        | 10 +++++-----
 meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb      |  2 +-
 .../gnome-doc-utils-stub_1.0.bb                  |  2 +-
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb      |  8 ++++----
 .../gphoto2/libgphoto2_2.5.31.bb                 |  2 +-
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb |  2 +-
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb      |  4 ++--
 .../recipes-graphics/tigervnc/tigervnc_1.11.0.bb |  2 +-
 meta-oe/recipes-graphics/tslib/tslib_1.22.bb     |  4 ++--
 .../source-code-pro-fonts_2.030_1.050.bb         |  2 +-
 .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb  |  2 +-
 .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb  |  2 +-
 .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb  |  4 ++--
 .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb  |  4 ++--
 .../ttf-fonts/ttf-dejavu_2.37.bb                 |  2 +-
 .../ttf-fonts/ttf-inconsolata_20100526.bb        |  8 ++++----
 .../ttf-liberation-sans-narrow_1.07.4.bb         |  2 +-
 .../ttf-fonts/ttf-pt-sans_1.1.bb                 |  5 +++--
 .../recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb |  2 +-
 .../xorg-driver/xf86-input-tslib_1.1.1.bb        |  2 +-
 .../xscreensaver/xscreensaver_6.04.bb            |  2 +-
 .../kernel-selftest/kernel-selftest.bb           |  2 +-
 .../minicoredumper/minicoredumper_2.0.7.bb       |  4 ++--
 .../recipes-kernel/oprofile/oprofile_1.4.0.bb    |  2 +-
 .../recipes-kernel/turbostat/turbostat_3.4.bb    |  2 +-
 .../live555/live555_20210824.bb                  |  2 +-
 .../cyrus-sasl/cyrus-sasl_2.1.28.bb              |  4 ++--
 meta-oe/recipes-security/audit/audit_4.0.1.bb    |  4 ++--
 meta-oe/recipes-support/atop/atop_2.4.0.bb       |  4 ++--
 meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb  |  2 +-
 .../ctapi-common/ctapi-common_1.1-14.bb          |  6 +++---
 meta-oe/recipes-support/gpm/gpm_git.bb           |  4 ++--
 .../hddtemp/hddtemp_0.3-beta15.bb                |  4 ++--
 meta-oe/recipes-support/libee/libee.inc          |  2 +-
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb   |  2 +-
 .../recipes-support/libusbgx/libusbgx-config.bb  |  2 +-
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb |  8 ++++----
 meta-oe/recipes-support/links/links-x11_2.26.bb  |  4 ++--
 meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb     |  2 +-
 meta-oe/recipes-support/monit/monit_5.33.0.bb    |  4 ++--
 .../multipath-tools/multipath-tools_0.9.8.bb     |  4 ++--
 meta-oe/recipes-support/nspr/nspr_4.35.bb        |  2 +-
 meta-oe/recipes-support/nss/nss_3.98.bb          |  8 ++++----
 meta-oe/recipes-support/openct/openct_0.6.20.bb  |  8 ++++----
 .../recipes-support/openldap/openldap_2.6.7.bb   |  4 ++--
 meta-oe/recipes-support/pcp/pcp_6.0.5.bb         |  2 +-
 .../poppler/poppler-data_0.4.12.bb               |  2 +-
 .../recipes-support/syslog-ng/syslog-ng_4.6.0.bb | 10 +++++-----
 .../unicode-ucd/unicode-ucd_14.0.0.bb            |  4 ++--
 .../vboxguestdrivers/vboxguestdrivers_7.0.18.bb  | 10 +++++-----
 meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb      |  2 +-
 .../python/python3-cloudpickle_3.0.0.bb          |  2 +-
 .../python/python3-cmake_3.28.3.bb               |  2 +-
 .../python/python3-jstyleson_0.0.2.bb            |  2 +-
 .../python/python3-stopit_1.1.2.bb               |  4 ++--
 .../python/python3-supervisor_4.2.5.bb           |  4 ++--
 .../recipes-httpd/apache2/apache2_2.4.59.bb      |  8 ++++----
 .../recipes-httpd/hiawatha/hiawatha_10.12.bb     |  6 +++---
 .../recipes-httpd/monkey/monkey_1.6.9.bb         |  4 ++--
 meta-webserver/recipes-httpd/nginx/nginx.inc     | 12 ++++++------
 .../recipes-httpd/sthttpd/sthttpd_2.27.1.bb      |  6 +++---
 .../recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb   |  2 +-
 .../recipes-webadmin/netdata/netdata_1.44.3.bb   |  4 ++--
 .../recipes-webadmin/webmin/webmin_1.850.bb      |  4 ++--
 176 files changed, 402 insertions(+), 403 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
index b641e4c24e..7768a734d6 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
@@ -37,8 +37,8 @@ EXTRA_OECONF = " \
 do_install:prepend() {
     install -d ${D}${sysconfdir}/default/
     install -d ${D}${sysconfdir}/init.d/
-    install -m 0755 ${WORKDIR}/owhttpd ${D}${sysconfdir}/init.d/owhttpd
-    install -m 0755 ${WORKDIR}/owserver ${D}${sysconfdir}/init.d/owserver
+    install -m 0755 ${UNPACKDIR}/owhttpd ${D}${sysconfdir}/init.d/owhttpd
+    install -m 0755 ${UNPACKDIR}/owserver ${D}${sysconfdir}/init.d/owserver
 }
 
 PACKAGES =+ "owftpd owhttpd owserver owshell libowcapi libow libownet owmon owtap"
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index cee4879eee..6f613e9cd1 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -68,7 +68,7 @@ do_install:append() {
     # Install systemd related configuration file
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/modules-load.d
-        install -m 0644 ${WORKDIR}/fuse.conf ${D}${sysconfdir}/modules-load.d
+        install -m 0644 ${UNPACKDIR}/fuse.conf ${D}${sysconfdir}/modules-load.d
     fi
 }
 
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index ad846af470..4d2b909809 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -33,7 +33,7 @@ do_configure:prepend() {
 
 do_configure:append () {
     install -d ${S}/include/linux/
-    cp ${WORKDIR}/aufs_type.h ${S}/include/linux/
+    cp ${UNPACKDIR}/aufs_type.h ${S}/include/linux/
     sed -i -e 's;__user;;' ${S}/include/linux/aufs_type.h
 }
 
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
index c8a80523dd..9e82b0f749 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
@@ -58,10 +58,10 @@ do_install() {
 
     unionmount_target_dir=${D}${prefix}/xfstests/unionmount-testsuite
     install -d $unionmount_target_dir/tests
-    install ${WORKDIR}/unionmount-testsuite/tests/* -t $unionmount_target_dir/tests
-    install ${WORKDIR}/unionmount-testsuite/*.py -t $unionmount_target_dir
-    install ${WORKDIR}/unionmount-testsuite/run -t $unionmount_target_dir
-    install ${WORKDIR}/unionmount-testsuite/README -t $unionmount_target_dir
+    install ${UNPACKDIR}/unionmount-testsuite/tests/* -t $unionmount_target_dir/tests
+    install ${UNPACKDIR}/unionmount-testsuite/*.py -t $unionmount_target_dir
+    install ${UNPACKDIR}/unionmount-testsuite/run -t $unionmount_target_dir
+    install ${UNPACKDIR}/unionmount-testsuite/README -t $unionmount_target_dir
 }
 
 FILES:${PN} += "${prefix}/xfstests"
diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
index 90c12efadf..9e641daa5a 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
@@ -29,7 +29,7 @@ do_compile() {
 do_install() {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" install
     install -d ${D}/${sysconfdir}/devilspie2
-    install -m 644 ${WORKDIR}/default.lua ${D}/${sysconfdir}/devilspie2
+    install -m 644 ${UNPACKDIR}/default.lua ${D}/${sysconfdir}/devilspie2
     install -d ${D}/${sysconfdir}/xdg/autostart
-    install -m 644 ${WORKDIR}/devilspie2.desktop ${D}/${sysconfdir}/xdg/autostart
+    install -m 644 ${UNPACKDIR}/devilspie2.desktop ${D}/${sysconfdir}/xdg/autostart
 }
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index 103bad1b68..fc19253142 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -58,7 +58,7 @@ LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
 GI_DATA_ENABLED:libc-musl="False"
 
 do_configure:append () {
-    cp ${WORKDIR}/iconv-detect.h ${S}/src
+    cp ${UNPACKDIR}/iconv-detect.h ${S}/src
     # avoid writing perl-native path into csv2vcard shebang
     sed -i "s|@PERL@|${bindir}/perl|" ${S}/src/tools/addressbook-export/csv2vcard.in
 }
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
index 542ad3487b..f9115d819b 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
@@ -33,7 +33,7 @@ do_install() {
     chmod a+rx ${D}/${libdir}/*.so*
     cp -R --no-dereference --preserve=mode,links ${S}/util/szap/channels-conf* ${D}/${docdir}/dvb-apps/szap/
     cp -R --no-dereference --preserve=mode,links ${S}/util/szap/README   ${D}/${docdir}/dvb-apps/szap/
-    cp -R --no-dereference --preserve=mode,links ${WORKDIR}/dvb-scan-table/* ${D}/usr/share/dvb
+    cp -R --no-dereference --preserve=mode,links ${UNPACKDIR}/dvb-scan-table/* ${D}/usr/share/dvb
 }
 
 PACKAGES =+ "dvb-evtest dvb-evtest-dbg \
diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
index 5de717c281..1e5381bb2c 100644
--- a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
@@ -15,5 +15,5 @@ inherit autotools lib_package pkgconfig
 
 do_install:append() {
     install -D -m 0644 ${S}/src/dvbcsa/dvbcsa.h ${D}${includedir}/dvbcsa/dvbcsa.h
-    install -D -m 0644 ${WORKDIR}/libdvbcsa.pc ${D}${libdir}/pkgconfig/libdvbcsa.pc
+    install -D -m 0644 ${UNPACKDIR}/libdvbcsa.pc ${D}${libdir}/pkgconfig/libdvbcsa.pc
 }
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index 4959a3c8d7..aabf81dce0 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -28,11 +28,11 @@ do_install:append(){
 
 # Systemd script
     install -d ${D}${nonarch_base_libdir}/systemd/system
-    install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonarch_base_libdir}/systemd/system
+    install -m 0755 ${UNPACKDIR}/minidlna.service ${D}${nonarch_base_libdir}/systemd/system
 
 # Sysvinit script
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/init.d/minidlna
+    install -m 0755 ${UNPACKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/init.d/minidlna
 
 }
 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
index f30fffebeb..33155da7d2 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
@@ -76,7 +76,7 @@ do_install:append() {
         ${D}/${localstatedir}/lib/mpd/music
 
     install -d ${D}/${sysconfdir}
-    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
+    install -m 644 ${UNPACKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
     sed -i \
         -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
         -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|' \
diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index 444bc1cf39..8bedc693ba 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -33,17 +33,17 @@ do_install() {
     rm -r ${D}${libdir}/mycroft/.git
 
     # Install the dev opts so it doesn't ask us on initial setup.
-    install -m 644 ${WORKDIR}/dev_opts.json ${D}${libdir}/mycroft/.dev_opts.json
+    install -m 644 ${UNPACKDIR}/dev_opts.json ${D}${libdir}/mycroft/.dev_opts.json
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/mycroft-setup.service ${D}${systemd_unitdir}/system
+        install -m 644 ${UNPACKDIR}/mycroft-setup.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@LIBDIR@,${libdir},g' ${D}${systemd_unitdir}/system/mycroft-setup.service
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/mycroft.service ${D}${systemd_unitdir}/system
+        install -m 644 ${UNPACKDIR}/mycroft.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@LIBDIR@,${libdir},g' ${D}${systemd_unitdir}/system/mycroft.service
     fi
 }
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.2.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.2.bb
index 52157cf9a8..12cc6645b5 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.2.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.3.2.bb
@@ -146,7 +146,7 @@ do_install:append() {
         # firewalld ships an init script but it contains Red Hat-isms, replace it with our own
         rm -rf ${D}${sysconfdir}/rc.d/
         install -d ${D}${sysconfdir}/init.d
-        install -m0755 ${WORKDIR}/firewalld.init ${D}${sysconfdir}/init.d/firewalld
+        install -m0755 ${UNPACKDIR}/firewalld.init ${D}${sysconfdir}/init.d/firewalld
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'false', 'true', d)}; then
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index e5f7e0334f..e458321e6e 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -53,16 +53,16 @@ do_configure:prepend () {
 }
 
 do_install:append () {
-    install -Dm 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
+    install -Dm 0644 ${UNPACKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
     else
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
+        install -m 0755 ${UNPACKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
     fi
 }
 
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
index 7ea63a65d3..8397380c1d 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
@@ -169,14 +169,14 @@ do_install() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0755 ${WORKDIR}/freeradius ${D}/etc/init.d/radiusd
-        install -m 0644 ${WORKDIR}/volatiles.58_radiusd ${D}${sysconfdir}/default/volatiles/58_radiusd
+        install -m 0755 ${UNPACKDIR}/freeradius ${D}/etc/init.d/radiusd
+        install -m 0644 ${UNPACKDIR}/volatiles.58_radiusd ${D}${sysconfdir}/default/volatiles/58_radiusd
     fi
 
     # For systemd
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/radiusd.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/radiusd.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
             -e 's,@SBINDIR@,${sbindir},g' \
             -e 's,@STATEDIR@,${localstatedir},g' \
@@ -184,7 +184,7 @@ do_install() {
             ${D}${systemd_unitdir}/system/radiusd.service
 
         install -d ${D}${sysconfdir}/tmpfiles.d/
-        install -m 0644 ${WORKDIR}/radiusd-volatiles.conf ${D}${sysconfdir}/tmpfiles.d/radiusd.conf
+        install -m 0644 ${UNPACKDIR}/radiusd-volatiles.conf ${D}${sysconfdir}/tmpfiles.d/radiusd.conf
     fi
 
     oe_multilib_header freeradius/autoconf.h
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
index 468569eef1..1c2f030f83 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
@@ -44,7 +44,7 @@ do_install() {
     install ${S}/linux/miniupnpd.init.d.script ${D}/${sysconfdir}/init.d/miniupnpd
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/miniupnpd.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${UNPACKDIR}/miniupnpd.service ${D}${systemd_unitdir}/system/
 }
 
 SYSTEMD_SERVICE:${PN} = "miniupnpd.service"
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
index ea9eb4857b..4ef0654102 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
@@ -46,7 +46,7 @@ do_install:append() {
     install -m 0644 ${S}/service/systemd/mosquitto.service.notify ${D}${systemd_unitdir}/system/mosquitto.service
 
     install -d ${D}${sysconfdir}/init.d/
-    install -m 0755 ${WORKDIR}/mosquitto.init ${D}${sysconfdir}/init.d/mosquitto
+    install -m 0755 ${UNPACKDIR}/mosquitto.init ${D}${sysconfdir}/init.d/mosquitto
     sed -i -e 's,@SBINDIR@,${sbindir},g' \
         -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
         -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
index 3c9570d927..487ef08475 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
@@ -301,7 +301,7 @@ RRECOMMENDS:${PN} += "\
 "
 
 do_install:append() {
-    install -Dm 0755 ${WORKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/network-manager
+    install -Dm 0755 ${UNPACKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/network-manager
 
     rm -rf ${D}/run ${D}${localstatedir}/run
 
@@ -315,11 +315,11 @@ do_install:append() {
 
     # Enable iwd if compiled
     if ${@bb.utils.contains('PACKAGECONFIG','iwd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/enable-iwd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-iwd.conf
+        install -Dm 0644 ${UNPACKDIR}/enable-iwd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-iwd.conf
     fi
 
     # Enable dhcpd if compiled
     if ${@bb.utils.contains('PACKAGECONFIG','dhcpcd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/enable-dhcpcd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
+        install -Dm 0644 ${UNPACKDIR}/enable-dhcpcd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
     fi
 }
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
index bd0309934b..7bdcfd35c0 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
@@ -173,8 +173,8 @@ do_install:append() {
 
     install -d ${D}${sysconfdir}/samba
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
-    install -m644 ${WORKDIR}/smb.conf ${D}${sysconfdir}/samba/smb.conf
-    install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
+    install -m644 ${UNPACKDIR}/smb.conf ${D}${sysconfdir}/samba/smb.conf
+    install -D -m 644 ${UNPACKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
 
     install -d ${D}${sysconfdir}/default
     install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/default/samba
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
index 8b9092b418..9bc14fc56f 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
@@ -76,18 +76,18 @@ do_install:append() {
 
     cp ${S}/preproc_rules/*.rules ${D}${sysconfdir}/snort/preproc_rules/
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -m 755 ${WORKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
+        install -m 755 ${UNPACKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}/${systemd_system_unitdir}
-        install -m 644 ${WORKDIR}/snort.service ${D}/${systemd_system_unitdir}
+        install -m 644 ${UNPACKDIR}/snort.service ${D}/${systemd_system_unitdir}
         # Install default environment file
         install -d ${D}/${sysconfdir}/default
-        install -m 0644 ${WORKDIR}/snort.default ${D}${sysconfdir}/default/snort
+        install -m 0644 ${UNPACKDIR}/snort.default ${D}${sysconfdir}/default/snort
     fi
     install -d ${D}${sysconfdir}/default/volatiles
-    install -m 0644 ${WORKDIR}/volatiles.99_snort ${D}${sysconfdir}/default/volatiles/99_snort
+    install -m 0644 ${UNPACKDIR}/volatiles.99_snort ${D}${sysconfdir}/default/volatiles/99_snort
 
     sed -i -e 's|-ffile-prefix-map[^ ]*||g; s|-fdebug-prefix-map[^ ]*||g; s|-fmacro-prefix-map[^ ]*||g; s|${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
 }
diff --git a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
index 36d35e6dee..f6b58559d4 100644
--- a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
@@ -13,9 +13,9 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "tayga.service"
 
 do_install:append() {
-  install -m 0644 ${WORKDIR}/tayga.conf ${D}${sysconfdir}/tayga.conf
+  install -m 0644 ${UNPACKDIR}/tayga.conf ${D}${sysconfdir}/tayga.conf
   install -d ${D}${systemd_unitdir}/system/
-  install -m 0644 ${WORKDIR}/tayga.service ${D}${systemd_unitdir}/system/
+  install -m 0644 ${UNPACKDIR}/tayga.service ${D}${systemd_unitdir}/system/
 }
 
 inherit autotools systemd
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index fe9c038f5c..5876b58273 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -38,14 +38,14 @@ inherit perlnative pkgconfig
 do_configure:append () {
     # Make sure we use our nativeperl wrapper
     sed -i "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/*.pl
-    cp ${WORKDIR}/long-help ${S}
+    cp ${UNPACKDIR}/long-help ${S}
 }
 
 do_install () {
     sed -i s:m600:m\ 600:g Makefile
     oe_runmake 'DESTDIR=${D}' 'PREFIX=/usr' install
     rm -f ${D}${sysconfdir}/vpnc/vpnc.conf #This file is useless
-    install ${WORKDIR}/default.conf ${D}${sysconfdir}/vpnc/default.conf
+    install ${UNPACKDIR}/default.conf ${D}${sysconfdir}/vpnc/default.conf
 }
 
 SYSROOT_PREPROCESS_FUNCS += "vpnc_sysroot_preprocess"
diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
index 507621795f..41b7cf0878 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.0.bb
@@ -29,14 +29,14 @@ EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -std=gnu89'"
 
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftpd
+    install -m 0755 ${UNPACKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftpd
 
     install -d ${D}/srv/tftp
 
     rm ${D}${sbindir}/in.tftpd
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/atftpd.service ${D}${systemd_unitdir}/system
 }
 
 PACKAGES =+ "${PN}d"
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 36ea289945..7947ffe457 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -65,14 +65,14 @@ do_install() {
     oe_runmake DESTDIR=${D} install
 
     install -D -m 0755 ${S}/debian/init.d ${D}${sysconfdir}/init.d/ippoold
-    install -D -m 0644 ${WORKDIR}/ippool.service ${D}${systemd_system_unitdir}/ippool.service
+    install -D -m 0644 ${UNPACKDIR}/ippool.service ${D}${systemd_system_unitdir}/ippool.service
     sed -i -e 's:@SBINDIR@:${sbindir}:g' ${D}${systemd_system_unitdir}/ippool.service
 
     # install self test
     install -d ${D}/opt/${BPN}
     install ${S}/test/all.tcl  ${S}/test/ippool.test \
         ${S}/test/test_procs.tcl ${D}/opt/${BPN}
-    install ${WORKDIR}/runtest.sh ${D}/opt/${BPN}
+    install ${UNPACKDIR}/runtest.sh ${D}/opt/${BPN}
     # fix the ../ippoolconfig in test_procs.tcl
     sed -i -e "s:../ippoolconfig:ippoolconfig:" \
         ${D}/opt/${BPN}/test_procs.tcl
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
index 2caddbb54a..0f9f34f1f2 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
@@ -78,7 +78,7 @@ do_install () {
     cp -dR ${S}/libopeniscsiusr/libopeniscsiusr.so* ${D}${libdir}
     install -p -m 644 ${S}/doc/iscsiadm.8 ${S}/doc/iscsid.8 ${D}/${mandir}/man8
     install -p -m 644 ${S}/etc/iscsid.conf ${D}${sysconfdir}/iscsi
-    install -p -m 755 ${WORKDIR}/initd.debian ${D}${sysconfdir}/init.d/iscsid
+    install -p -m 755 ${UNPACKDIR}/initd.debian ${D}${sysconfdir}/init.d/iscsid
 
     sed -i -e "s:= /sbin/iscsid:= ${sbindir}/iscsid:" ${D}${sysconfdir}/iscsi/iscsid.conf
 
@@ -87,17 +87,17 @@ do_install () {
         echo "d /run/${BPN}/lock - - - -" \
                      > ${D}${sysconfdir}/tmpfiles.d/iscsi.conf
         install -d ${D}/etc/default/
-        install -p -m 755 ${WORKDIR}/iscsi-initiator ${D}${sysconfdir}/default/
+        install -p -m 755 ${UNPACKDIR}/iscsi-initiator ${D}${sysconfdir}/default/
 
         install -d ${D}${systemd_unitdir}/system/
-        install -m 0644 ${WORKDIR}/iscsi-initiator.service \
-                        ${WORKDIR}/iscsi-initiator-targets.service \
+        install -m 0644 ${UNPACKDIR}/iscsi-initiator.service \
+                        ${UNPACKDIR}/iscsi-initiator-targets.service \
                         ${D}${systemd_unitdir}/system/
         install -d ${D}${nonarch_libdir}/iscsi
-        install -m 0755 ${WORKDIR}/set_initiatorname ${D}${nonarch_libdir}/iscsi
+        install -m 0755 ${UNPACKDIR}/set_initiatorname ${D}${nonarch_libdir}/iscsi
     else
         install -d ${D}/etc/default/volatiles
-        install -m 0644 ${WORKDIR}/99_iscsi-initiator-utils ${D}/etc/default/volatiles
+        install -m 0644 ${UNPACKDIR}/99_iscsi-initiator-utils ${D}/etc/default/volatiles
     fi
 }
 
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
index 370465e141..4deab153c4 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
@@ -48,8 +48,8 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_SERVICE:${PN} = "lldpd.service"
 
 do_install:append() {
-    install -Dm 0755 ${WORKDIR}/lldpd.init.d ${D}${sysconfdir}/init.d/lldpd
-    install -Dm 0644 ${WORKDIR}/lldpd.default ${D}${sysconfdir}/default/lldpd
+    install -Dm 0755 ${UNPACKDIR}/lldpd.init.d ${D}${sysconfdir}/init.d/lldpd
+    install -Dm 0644 ${UNPACKDIR}/lldpd.default ${D}${sysconfdir}/default/lldpd
     # Make an empty configuration file
     touch ${D}${sysconfdir}/lldpd.conf
 }
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index 32c4783cf7..ac13d7a196 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -75,10 +75,10 @@ do_install:append () {
     install -m 0600 ${S}/openhpi.conf.example ${D}${sysconfdir}/${BPN}/openhpi.conf
     install -m 0644 ${S}/simulation.data.example ${D}${sysconfdir}/${BPN}/simulation.data
     install -m 0644 ${S}/test_agent.data.example ${D}${sysconfdir}/${BPN}/test_agent.data
-    install -m 0755 ${WORKDIR}/openhpi.init ${D}${sysconfdir}/init.d/openhpid
+    install -m 0755 ${UNPACKDIR}/openhpi.init ${D}${sysconfdir}/init.d/openhpid
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/openhpid.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/openhpid.service ${D}${systemd_unitdir}/system
     sed -i -e "s,@SBINDIR@,${sbindir},g" -e "s,@SYSCONFDIR@,${sysconfdir},g" \
         ${D}${systemd_unitdir}/system/openhpid.service
 }
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
index 3ec7f22ad3..d48e9145f8 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
@@ -136,21 +136,21 @@ do_install () {
     mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/${MLPREFIX}sample-main.cf
     install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
     install -d ${D}${sysconfdir}/init.d
-    install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
+    install -m 644 ${UNPACKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
     sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main.cf
 
-    install -m 755 ${WORKDIR}/check_hostname.sh ${D}${sbindir}/
+    install -m 755 ${UNPACKDIR}/check_hostname.sh ${D}${sbindir}/
 
-    install -m 755 ${WORKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
-    install -m 644 ${WORKDIR}/internal_recipient ${D}${sysconfdir}/postfix/internal_recipient
+    install -m 755 ${UNPACKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
+    install -m 644 ${UNPACKDIR}/internal_recipient ${D}${sysconfdir}/postfix/internal_recipient
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/postfix.service ${D}${systemd_unitdir}/system
     sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/postfix.service
     sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/postfix.service
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/postfix.service
 
-    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}/postfix
+    install -m 0755 ${UNPACKDIR}/aliasesdb ${D}${libexecdir}/postfix
 
     install -m 770 -d ${D}${localstatedir}/spool/postfix
     chown postfix:postfix ${D}${localstatedir}/spool/postfix
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index ecd2777247..aa8d5fabd6 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -82,14 +82,14 @@ do_install () {
     sed -i '/ *User[ \t]*/s/ftp/${FTPUSER}/' ${D}${sysconfdir}/proftpd.conf
     sed -i '/ *Group[ \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.conf
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/proftpd-basic.init ${D}${sysconfdir}/init.d/proftpd
+    install -m 0755 ${UNPACKDIR}/proftpd-basic.init ${D}${sysconfdir}/init.d/proftpd
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/proftpd
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/proftpd
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/proftpd
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/proftpd
 
     install -d ${D}${sysconfdir}/default
-    install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/proftpd
+    install -m 0755 ${UNPACKDIR}/default ${D}${sysconfdir}/default/proftpd
 
     # create the pub directory
     mkdir -p ${D}/home/${FTPUSER}/pub/
@@ -105,7 +105,7 @@ do_install () {
     fi
 
     install -d ${D}/${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/proftpd.service ${D}/${systemd_unitdir}/system
+    install -m 644 ${UNPACKDIR}/proftpd.service ${D}/${systemd_unitdir}/system
     sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
         -e 's,@SBINDIR@,${sbindir},g' \
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index d1eb6e28fc..f2c300855c 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -47,13 +47,13 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/ptpd.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/ptpd.service ${D}${systemd_unitdir}/system
 
         sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/ptpd.service
         sed -i -e 's#@BINDIR@#${bindir}#g' ${D}${systemd_unitdir}/system/ptpd.service
 
         install -d ${D}${sysconfdir}/default/
-        install -m 0644 ${WORKDIR}/ptpd.conf ${D}${sysconfdir}/default/ptpd
+        install -m 0644 ${UNPACKDIR}/ptpd.conf ${D}${sysconfdir}/default/ptpd
     fi
 }
 
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
index a9b5f79424..a8a116cbe5 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
@@ -34,30 +34,30 @@ do_install:append () {
                        ${D}${sysconfdir}/default/volatiles \
                        ${D}${docdir}/radvd
     # Install init script and volatiles
-    install -m 0755 ${WORKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd
+    install -m 0755 ${UNPACKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/radvd
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/radvd
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/radvd
 
-    install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/03_radvd
+    install -m 0644 ${UNPACKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/03_radvd
 
     # Install systemd service files
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/radvd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/radvd.service ${D}${systemd_unitdir}/system
     sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' \
            -e 's#@SBINDIR@#${sbindir}#g' \
            -e 's#@BASE_BINDIR@#${base_bindir}#g' ${D}${systemd_unitdir}/system/radvd.service
 
     # Install default environment file
-    install -m 0644 ${WORKDIR}/radvd.default ${D}${sysconfdir}/default/radvd
+    install -m 0644 ${UNPACKDIR}/radvd.default ${D}${sysconfdir}/default/radvd
 
     # Documentation
     for i in radvd.conf.example README; do \
         install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
     done
 
-    install -m 0644 ${WORKDIR}/radvd.conf ${D}${sysconfdir}/radvd.conf
+    install -m 0644 ${UNPACKDIR}/radvd.conf ${D}${sysconfdir}/radvd.conf
 }
 
 USERADD_PACKAGES = "${PN}"
diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.9.bb
index f0663a5e04..2aae763107 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
@@ -117,7 +117,7 @@ do_install:append() {
     fi
 
     install -d ${D}${sysconfdir}/default/volatiles
-    install -m 0644 ${WORKDIR}/volatiles.03_squid ${D}${sysconfdir}/default/volatiles/03_squid
+    install -m 0644 ${UNPACKDIR}/volatiles.03_squid ${D}${sysconfdir}/default/volatiles/03_squid
 
     rmdir "${D}${localstatedir}/run/${BPN}"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}/run"
@@ -127,7 +127,7 @@ do_install:append() {
 
     # Install NetworkManager dispatcher reload hooks
     install -d ${D}${libdir}/NetworkManager/dispatcher.d
-    install -m 0755 ${WORKDIR}/squid.nm ${D}${libdir}/NetworkManager/dispatcher.d/20-squid
+    install -m 0755 ${UNPACKDIR}/squid.nm ${D}${libdir}/NetworkManager/dispatcher.d/20-squid
 }
 
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 565f493ce2..b5a2b9dae0 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -58,18 +58,18 @@ do_install() {
 
     install -m 755 -d ${D}${localstatedir}/lib/tftpboot/
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/tftpd-hpa
+    install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/tftpd-hpa
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/tftpd-hpa
 
     install -d ${D}${sysconfdir}/default
-    install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/tftpd-hpa
+    install -m 0644 ${UNPACKDIR}/default ${D}${sysconfdir}/default/tftpd-hpa
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/tftpd-hpa.socket ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/tftpd-hpa.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/tftpd-hpa.socket ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/tftpd-hpa.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tftpd-hpa.service
 }
 
diff --git a/meta-networking/recipes-daemons/vblade/vblade_25.bb b/meta-networking/recipes-daemons/vblade/vblade_25.bb
index 7c37fc1676..7f20e927c6 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_25.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_25.bb
@@ -27,22 +27,22 @@ do_install() {
     install -D -m 0755 ${S}/vbladed ${D}/${sbindir}/vbladed
     install -D -m 0644 ${S}/vblade.8 ${D}/${mandir}/man8/vblade.8
 
-    install -D -m 0644 ${WORKDIR}/${BPN}.conf ${D}/${sysconfdir}/${BPN}.conf
-    install -D -m 0755 ${WORKDIR}/${BPN}.init ${D}/${sysconfdir}/init.d/${BPN}
+    install -D -m 0644 ${UNPACKDIR}/${BPN}.conf ${D}/${sysconfdir}/${BPN}.conf
+    install -D -m 0755 ${UNPACKDIR}/${BPN}.init ${D}/${sysconfdir}/init.d/${BPN}
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}/${sysconfdir}/default/volatiles
-        install -m 0755 ${WORKDIR}/volatiles.99_vblade ${D}/${sysconfdir}/default/volatiles/99_vblade
+        install -m 0755 ${UNPACKDIR}/volatiles.99_vblade ${D}/${sysconfdir}/default/volatiles/99_vblade
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}/${bindir}
-        install -m 0755 ${WORKDIR}/${BPN}.init ${D}/${bindir}/
+        install -m 0755 ${UNPACKDIR}/${BPN}.init ${D}/${bindir}/
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /var/run/${BPN} 0755 root root -" > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
 
         install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/vblade.service ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/vblade.service ${D}${systemd_system_unitdir}
         sed -e 's,@BINDIR@,${bindir},g' -i ${D}${systemd_system_unitdir}/*.service
     fi
 
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index 0ae52c8ddc..4a843bd800 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -65,14 +65,14 @@ do_install() {
     install -d ${D}${mandir}/man5
     oe_runmake 'DESTDIR=${D}' install
     install -d ${D}${sysconfdir}
-    install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
+    install -m 600 ${UNPACKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
     install -d ${D}${sysconfdir}/init.d/
-    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
+    install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
     install -d ${D}/${sysconfdir}/default/volatiles
-    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
+    install -m 644 ${UNPACKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
 
-    install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
-    install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
+    install -m 600 ${UNPACKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
+    install -m 600 ${UNPACKDIR}/vsftpd.user_list ${D}${sysconfdir}/
     if ! test -z "${PAMLIB}" ; then
         install -d ${D}${sysconfdir}/pam.d/
         cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
@@ -87,7 +87,7 @@ do_install() {
 
     # Install systemd unit files
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/vsftpd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/vsftpd.service ${D}${systemd_unitdir}/system
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/vsftpd.service
 }
 
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 98f0f02fb8..2f5d192a77 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -51,7 +51,7 @@ do_compile:prepend() {
 
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}
-	install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+	install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
 	install -m 0755 ${B}/tests/testdriver ${D}${PTEST_PATH}/testdriver
 }
 
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
index 8fca576614..cbbbbc70cd 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
@@ -40,7 +40,7 @@ EXTRA_OEMAKE = "tmpfilesdir_DATA="
 #}
 
 do_install:append() {
-    install -D -m 0644 ${WORKDIR}/corosync.conf ${D}${sysconfdir}/corosync/corosync.conf.example
+    install -D -m 0644 ${UNPACKDIR}/corosync.conf ${D}${sysconfdir}/corosync/corosync.conf.example
     install -d ${D}${sysconfdir}/sysconfig/
     install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
     install -m 0644 ${S}/tools/corosync-notifyd.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync-notifyd
diff --git a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
index 35995f7876..e816b79e87 100644
--- a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
@@ -39,12 +39,12 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/tgtd.init ${D}${sysconfdir}/init.d/tgtd
+        install -m 0755 ${UNPACKDIR}/tgtd.init ${D}${sysconfdir}/init.d/tgtd
     elif ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/tgtd.service ${D}${systemd_unitdir}/system/tgtd.service
+        install -m 0644 ${UNPACKDIR}/tgtd.service ${D}${systemd_unitdir}/system/tgtd.service
         install -d ${D}${sysconfdir}/sysconfig
-        install -m 0644 ${WORKDIR}/tgtd ${D}${sysconfdir}/sysconfig/tgtd
+        install -m 0644 ${UNPACKDIR}/tgtd ${D}${sysconfdir}/sysconfig/tgtd
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tgtd.service
         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/tgtd.service
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/tgtd.service
diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb
index 07e01845d7..524718d56c 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb
@@ -34,8 +34,8 @@ do_install:append() {
 	install -d ${D}/${sysconfdir}/conntrackd
 	install -d ${D}/${sysconfdir}/init.d
 	install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
-	install -m 0755 ${WORKDIR}/conntrack-failover ${D}/${sysconfdir}/init.d/conntrack-failover
-	install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd
+	install -m 0755 ${UNPACKDIR}/conntrack-failover ${D}/${sysconfdir}/init.d/conntrack-failover
+	install -m 0755 ${UNPACKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd
 
 	# Fix hardcoded paths in scripts
 	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd
@@ -45,7 +45,7 @@ do_install:append() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}/${systemd_system_unitdir}
-		install -m 644 ${WORKDIR}/conntrackd.service ${D}/${systemd_system_unitdir}
+		install -m 644 ${UNPACKDIR}/conntrackd.service ${D}/${systemd_system_unitdir}
 	fi
 }
 
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index d522b514f6..8918936e14 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -29,14 +29,14 @@ do_install:append () {
 	# Replace upstream ebtables-save perl script with Fedora bash based rewrite
 	# http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
 	rm -f ${D}${sbindir}/ebtables-legacy-save
-	install -m 0755 ${WORKDIR}/ebtables-legacy-save ${D}${sbindir}/ebtables-legacy-save
+	install -m 0755 ${UNPACKDIR}/ebtables-legacy-save ${D}${sbindir}/ebtables-legacy-save
 
 	# Install systemd service files
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
+		install -m 0644 ${UNPACKDIR}/ebtables.service ${D}${systemd_unitdir}/system
 		sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
-		install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.common
+		install -m 0755 ${UNPACKDIR}/ebtables.common ${D}${sbindir}/ebtables.common
 	fi
 
 	install -d ${D}${base_sbindir}
diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
index d075ec4788..635fa6a408 100644
--- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
@@ -42,11 +42,11 @@ do_install:append () {
 	install -m 0644 ${S}/ulogd.8 ${D}${mandir}/man8/ulogd.8
 
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/ulogd.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/ulogd.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/ulogd.service
 
 	install -d ${D}${sysconfdir}/init.d
-	install -m 755 ${WORKDIR}/ulogd.init ${D}${sysconfdir}/init.d/ulogd
+	install -m 755 ${UNPACKDIR}/ulogd.init ${D}${sysconfdir}/init.d/ulogd
 }
 
 PACKAGES += "${PN}-plugins"
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
index b3282d273b..c7c329a5d4 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
@@ -78,18 +78,18 @@ do_install:append() {
     mv ${D}${sysconfdir}/${fd_pkgname}/freediameter.conf.sample \
        ${D}${sysconfdir}/${fd_pkgname}/freeDiameter.conf.sample
     install -d ${D}${sysconfdir}/freeDiameter
-	 install ${WORKDIR}/freeDiameter.conf ${D}${sysconfdir}/${fd_pkgname}/freeDiameter.conf
+	 install ${UNPACKDIR}/freeDiameter.conf ${D}${sysconfdir}/${fd_pkgname}/freeDiameter.conf
 
     # install daemon init related files
     install -d -m 0755 ${D}${sysconfdir}/default
     install -d -m 0755 ${D}${sysconfdir}/init.d
     install -m 0644 ${S}/contrib/debian/freediameter-daemon.default \
       ${D}${sysconfdir}/default/${BPN}
-    install -m 0755 ${WORKDIR}/freediameter.init ${D}${sysconfdir}/init.d/${BPN}
+    install -m 0755 ${UNPACKDIR}/freediameter.init ${D}${sysconfdir}/init.d/${BPN}
 
     # install for systemd
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/freediameter.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/freediameter.service ${D}${systemd_system_unitdir}
     sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/*.service
 
     cat >> ${D}${sysconfdir}/freeDiameter/freeDiameter.conf <<EOF
@@ -108,14 +108,14 @@ EOF
     openssl req -x509 -config ${STAGING_DIR_NATIVE}/etc/ssl/openssl.cnf -newkey rsa:4096 -sha256 -nodes -out ${D}${sysconfdir}/freeDiameter/${FD_PEM} -keyout ${D}${sysconfdir}/freeDiameter/${FD_KEY} -days 3650 -subj '/CN=${FD_HOSTNAME}.${FD_REALM}'
     openssl dhparam -out ${D}${sysconfdir}/freeDiameter/${FD_DH_PEM} 1024
 
-    find ${B} \( -name "*.c" -o -name "*.h" \) -exec sed -i -e 's#${WORKDIR}##g' {} \;
+    find ${B} \( -name "*.c" -o -name "*.h" \) -exec sed -i -e 's#${UNPACKDIR}##g' {} \;
 }
 
 do_install_ptest() {
     mv ${D}${PTEST_PATH}-tests/* ${D}${PTEST_PATH}/
     rmdir ${D}${PTEST_PATH}-tests
     install -m 0644 ${B}/tests/CTestTestfile.cmake ${D}${PTEST_PATH}/
-    sed -i -e 's#${WORKDIR}##g' ${D}${PTEST_PATH}/CTestTestfile.cmake
+    sed -i -e 's#${UNPACKDIR}##g' ${D}${PTEST_PATH}/CTestTestfile.cmake
     sed -i "/^set_tests_properties/d" ${D}${PTEST_PATH}/CTestTestfile.cmake
 }
 
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index eea6d62f5f..b1c9153bec 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -104,7 +104,7 @@ do_install:append:class-target () {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
         install -d ${D}/${sysconfdir}/pam.d
-        install -m 644 ${WORKDIR}/frr.pam ${D}/${sysconfdir}/pam.d/frr
+        install -m 644 ${UNPACKDIR}/frr.pam ${D}/${sysconfdir}/pam.d/frr
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb
index 183f05ebc3..ff7b0447bb 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb
@@ -104,7 +104,7 @@ do_install () {
 	install -m 0644 libnss_mdns.8 ${D}${mandir}/man8
 
 	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/mdns.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/mdns.service ${D}${systemd_system_unitdir}
 
 	install -d ${D}${INIT_D_DIR}
 	install mdnsd.sh ${D}${INIT_D_DIR}/mdns
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 395b02df00..75b3d9e8c6 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -116,12 +116,12 @@ do_configure:append() {
 do_install:append() {
     install -d ${D}${sysconfdir}/snmp
     install -d ${D}${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
-    install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
-    install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
+    install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/snmpd
+    install -m 644 ${UNPACKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
+    install -m 644 ${UNPACKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/snmpd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
     sed -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 183c0066df..f64c7340d1 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -74,7 +74,7 @@ do_install:append () {
     install -m 0755 ${S}/etc/sysconfig/openl2tpd ${D}${sysconfdir}/default/openl2tpd
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -D -m 0644 ${WORKDIR}/openl2tpd.service ${D}${systemd_system_unitdir}/openl2tpd.service
+        install -D -m 0644 ${UNPACKDIR}/openl2tpd.service ${D}${systemd_system_unitdir}/openl2tpd.service
         sed -i -e 's,@STATEDIR@,${localstatedir},g' \
                -e 's,@SYSCONFDIR@,${sysconfdir},g' \
                -e 's,@SBINDIR@,${sbindir},g' \
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
index 0d26c338b9..cabe18ef8a 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
@@ -26,7 +26,7 @@ do_install() {
     install -d ${D}${sbindir} ${D}${sysconfdir}/ppp ${D}${mandir}/man8
     install -m 555 pptp ${D}${sbindir}
     install -m 644 pptp.8 ${D}${mandir}/man8
-    install -m 644 ${WORKDIR}/options.pptp ${D}${sysconfdir}/ppp
+    install -m 644 ${UNPACKDIR}/options.pptp ${D}${sysconfdir}/ppp
 }
 
 RDEPENDS:${PN} = "ppp"
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index 4dfdb8fc21..c8e1767114 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -29,7 +29,7 @@ CFLAGS += "-D_GNU_SOURCE"
 
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/pppoe-server.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/pppoe-server.service ${D}${systemd_unitdir}/system
     sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
     install -d ${D}${datadir}/doc/${PN}
@@ -41,8 +41,8 @@ do_install:append() {
 do_install() {
     # Install init script and default settings
     install -m 0755 -d ${D}${sysconfdir}/default ${D}${sysconfdir}/init.d
-    install -m 0644 ${WORKDIR}/pppoe-server.default ${D}${sysconfdir}/default/pppoe-server
-    install -m 0755 ${WORKDIR}/pppoe-server.init ${D}${sysconfdir}/init.d/pppoe-server
+    install -m 0644 ${UNPACKDIR}/pppoe-server.default ${D}${sysconfdir}/default/pppoe-server
+    install -m 0755 ${UNPACKDIR}/pppoe-server.init ${D}${sysconfdir}/init.d/pppoe-server
     # Install
     oe_runmake -C ${S} DESTDIR=${D} docdir=${docdir} install
     chmod 4755 ${D}${sbindir}/pppoe
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index 61f6b79dd7..cb26699212 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -32,6 +32,6 @@ do_install () {
     install -d ${D}${sysconfdir}/network/if-up.d
     install -d ${D}${sysconfdir}/default
     install -c -m 755 ${S}/zeroconf ${D}${sbindir}/zeroconf
-    install -c -m 755 ${WORKDIR}/debian-zeroconf ${D}${sysconfdir}/network/if-up.d/zeroconf
-    install -c ${WORKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf
+    install -c -m 755 ${UNPACKDIR}/debian-zeroconf ${D}${sysconfdir}/network/if-up.d/zeroconf
+    install -c ${UNPACKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf
 }
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index 949794bf30..f9dd66f605 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -25,7 +25,7 @@ do_install() {
     oe_runmake install DESTDIR=${D}
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
+        install -m 644 ${UNPACKDIR}/arptables.service ${D}${systemd_unitdir}/system
     fi
 }
 
diff --git a/meta-networking/recipes-support/chrony/chrony_4.5.bb b/meta-networking/recipes-support/chrony/chrony_4.5.bb
index ed26e59879..0681a34393 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.5.bb
@@ -90,7 +90,7 @@ do_install() {
 
     # Config file
     install -d ${D}${sysconfdir}
-    install -m 644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}
+    install -m 644 ${UNPACKDIR}/chrony.conf ${D}${sysconfdir}
     if ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'true', 'false', d)}; then
         echo "# Define user to drop to after dropping root privileges" >> ${D}${sysconfdir}/chrony.conf
         echo "user chronyd" >> ${D}${sysconfdir}/chrony.conf
@@ -98,7 +98,7 @@ do_install() {
 
     # System V init script
     install -d ${D}${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/chronyd ${D}${sysconfdir}/init.d
+    install -m 755 ${UNPACKDIR}/chronyd ${D}${sysconfdir}/init.d
 
     # systemd unit configuration file
     install -d ${D}${systemd_unitdir}/system
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
index 62daf3279d..86f6a0df5d 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_$
           "
 SRC_URI[md5sum] = "3d01940bc1085c6c42184c25fb61f739"
 SRC_URI[sha256sum] = "3174cf0f8657b19d80dc59e184778d8e553da424728cb2966fe9d5428dd84267"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
 
 do_install() {
         install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}-docs
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
index 7d51bc1c91..45eee8f1b6 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
@@ -9,12 +9,12 @@ SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2500/cim_schema_$
 "
 SRC_URI[md5sum] = "ee4ad6441a2b65ca60a3abc53e3ec629"
 SRC_URI[sha256sum] = "a44d67881325e267ef46b72eabe0c69f90470b1033b1ce7c26d9ba99072adb50"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
 
 do_install() {
     install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
     install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
-    install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
+    install -m 644 ${UNPACKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
     cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/
     chown -R root:root ${D}${datadir}/mof/cimv${PV}
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
index 32bd8acbb9..d046622df5 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
@@ -9,12 +9,12 @@ SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_$
 "
 SRC_URI[md5sum] = "a9bdf17c7374e3b5b7adeaac4842c4ad"
 SRC_URI[sha256sum] = "dbfa3064ea427acd71a4bebbc172ca2dc44b0b09a6d83b0945b9ffa988a9058a"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
 
 do_install() {
     install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
     install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
-    install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
+    install -m 644 ${UNPACKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
     cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/
     chown -R root:root ${D}${datadir}/mof/cimv${PV}/
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 38fa271dc3..be74759d5e 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -81,20 +81,20 @@ do_install () {
                "MANDIR=${D}${mandir}" \
                install-i18n
     install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d
-    install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
-    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
+    install -m 644 ${UNPACKDIR}/dnsmasq.conf ${D}${sysconfdir}/
+    install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
 
     install -d ${D}${systemd_unitdir}/system
 
     if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
-        install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
+        install -m 0644 ${UNPACKDIR}/dnsmasq-resolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     else
-        install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
+        install -m 0644 ${UNPACKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     fi
 
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
         install -d ${D}${sysconfdir}/systemd/resolved.conf.d/
-        install -m 0644 ${WORKDIR}/dnsmasq-resolved.conf ${D}${sysconfdir}/systemd/resolved.conf.d/
+        install -m 0644 ${UNPACKDIR}/dnsmasq-resolved.conf ${D}${sysconfdir}/systemd/resolved.conf.d/
     fi
 
     if [ "${@bb.utils.filter('PACKAGECONFIG', 'dhcp', d)}" ]; then
@@ -113,11 +113,11 @@ do_install () {
 
     if [ "${@bb.utils.filter('PACKAGECONFIG', 'resolvconf', d)}" ]; then
         install -d ${D}${sysconfdir}/resolvconf/update.d/
-        install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
+        install -m 0755 ${UNPACKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
 
         install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
-        install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}
+        install -m 0644 ${UNPACKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
+        install -m 0755 ${UNPACKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}
     fi
 }
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
index 17fbd789b6..2f887e6018 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
@@ -52,7 +52,7 @@ do_install:append () {
     install -d 755 ${D}/etc/dovecot
     touch 644 ${D}/etc/dovecot/dovecot.conf
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
-        install -m 0644 ${WORKDIR}/dovecot.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/dovecot.service ${D}${systemd_unitdir}/system
         sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/dovecot.service
         sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/dovecot.service
     fi
diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 429cd69d6d..b247823cd4 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -46,10 +46,10 @@ EXTRA_OECONF = "--disable-static               \
 do_install() {
     make DESTDIR=${D} install
     install -d ${D}/${datadir}/GeoIP
-    install ${WORKDIR}/GeoIP.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIP.dat
-    install ${WORKDIR}/GeoIPv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIPv6.dat
-    install ${WORKDIR}/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCity.dat
-    install ${WORKDIR}/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
+    install ${UNPACKDIR}/GeoIP.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIP.dat
+    install ${UNPACKDIR}/GeoIPv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIPv6.dat
+    install ${UNPACKDIR}/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCity.dat
+    install ${UNPACKDIR}/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
     ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
 }
 
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
index 9a0292eacc..e4dc9dee47 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
@@ -28,6 +28,6 @@ inherit autotools
 do_install:append() {
     install -d ${D}/${sysconfdir}
     install -d ${D}/${sysconfdir}/cron.d
-    install ${WORKDIR}/GeoIP.conf ${D}/${sysconfdir}/
-    install ${WORKDIR}/geoipupdate.cron ${D}/${sysconfdir}/cron.d/
+    install ${UNPACKDIR}/GeoIP.conf ${D}/${sysconfdir}/
+    install ${UNPACKDIR}/geoipupdate.cron ${D}/${sysconfdir}/cron.d/
 }
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
index 3f945eeeee..0243f2a1db 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
@@ -27,8 +27,8 @@ BBCLASSEXTEND = "native"
 inherit autotools-brokensep pkgconfig binconfig ptest
 
 do_install_ptest () {
-    install -m 0755 ${WORKDIR}/v4test.sh ${D}${PTEST_PATH}
-    install -m 0755 ${WORKDIR}/v6test.sh ${D}${PTEST_PATH}
+    install -m 0755 ${UNPACKDIR}/v4test.sh ${D}${PTEST_PATH}
+    install -m 0755 ${UNPACKDIR}/v6test.sh ${D}${PTEST_PATH}
     for testcase in `find ${B}/src/apps/.libs ${B}/src/func_tests/.libs -maxdepth 1 -type f -executable`; do
         install $testcase ${D}${PTEST_PATH}
     done
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index 6e459eeeb4..579a04b86f 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -42,14 +42,14 @@ do_configure:prepend() {
 }
 
 do_install() {
-    sed -e 's#/usr/sbin/#${sbindir}/#g' -i ${WORKDIR}/init
+    sed -e 's#/usr/sbin/#${sbindir}/#g' -i ${UNPACKDIR}/init
     install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d ${D}${systemd_system_unitdir}
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        sed -e 's#/usr/sbin/#${sbindir}/#g' ${WORKDIR}/netserver.service > ${D}${systemd_system_unitdir}/netserver.service
+        sed -e 's#/usr/sbin/#${sbindir}/#g' ${UNPACKDIR}/netserver.service > ${D}${systemd_system_unitdir}/netserver.service
     fi
     install -m 4755 src/netperf ${D}${bindir}
     install -m 4755 src/netserver ${D}${sbindir}
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/netperf
+    install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/netperf
 
     # man
     install -d ${D}${mandir}/man1/
diff --git a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
index d2535487b4..9b2c186873 100644
--- a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
@@ -43,5 +43,5 @@ FILES:${PN}-staticdev += " ${libdir}/yp-nis/*.a"
 
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/domainname.service ${D}${systemd_unitdir}/system
 }
diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
index 110ca36866..a9ace9b412 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
@@ -34,7 +34,7 @@ inherit autotools-brokensep gettext pkgconfig systemd
 
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/ntopng.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/ntopng.service ${D}${systemd_unitdir}/system
 }
 
 FILES:${PN} += "\
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
index 4ed58cd6a4..5fa8db9eeb 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
@@ -90,8 +90,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d
-    install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
-    install -m 755 ${WORKDIR}/ntpd ${D}${sysconfdir}/init.d
+    install -m 644 ${UNPACKDIR}/ntp.conf ${D}${sysconfdir}
+    install -m 755 ${UNPACKDIR}/ntpd ${D}${sysconfdir}/init.d
 
     install -m 755 -d ${D}${NTP_USER_HOME}
     chown ntp:ntp ${D}${NTP_USER_HOME}
@@ -109,14 +109,14 @@ do_install:append() {
     sed -i '/use/i use warnings;' ${D}${sbindir}/calc_tickadj
 
     install -d ${D}/${sysconfdir}/default
-    install -m 0644 ${WORKDIR}/sntp ${D}${sysconfdir}/default/
+    install -m 0644 ${UNPACKDIR}/sntp ${D}${sysconfdir}/default/
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${UNPACKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${UNPACKDIR}/sntp.service ${D}${systemd_unitdir}/system/
 
     install -d ${D}${systemd_unitdir}/ntp-units.d
-    install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
+    install -m 0644 ${UNPACKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
 
     # Remove the empty libexecdir and bindir.
     rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
index 9ad97e7689..872d1ce4f7 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
@@ -81,7 +81,7 @@ do_install:append() {
 	install -m 755 ${S}/etc/rc/ntpd ${D}${sysconfdir}/init.d
 	cp -r ${S}/etc/ntp.d ${D}${sysconfdir}
 
-	sed -e 's:@NTP_USER_HOME@:${NTP_USER_HOME}:g' ${WORKDIR}/volatiles.ntpsec >${T}/volatiles.ntpsec
+	sed -e 's:@NTP_USER_HOME@:${NTP_USER_HOME}:g' ${UNPACKDIR}/volatiles.ntpsec >${T}/volatiles.ntpsec
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		cp ${B}/main/etc/* ${D}${systemd_system_unitdir}
 		awk '{print $1, $5, $4, $2, $3, "-"}' ${T}/volatiles.ntpsec >${T}/tmpfiles.ntpsec
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
index 82aab051f1..7e3fe5601f 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
@@ -97,12 +97,12 @@ do_install:append() {
     install -d ${D}${sysconfdir}/vmware-tools
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
+        install -m 644 ${UNPACKDIR}/*.service ${D}${systemd_unitdir}/system
     else
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/vmtoolsd.init ${D}${sysconfdir}/init.d/vmtoolsd
+        install -m 0755 ${UNPACKDIR}/vmtoolsd.init ${D}${sysconfdir}/init.d/vmtoolsd
     fi
-    install -m 0644 ${WORKDIR}/tools.conf ${D}${sysconfdir}/vmware-tools/tools.conf
+    install -m 0644 ${UNPACKDIR}/tools.conf ${D}${sysconfdir}/vmware-tools/tools.conf
 }
 
 do_configure:prepend() {
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb
index 1209c064f5..c7c7573677 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb
@@ -102,10 +102,10 @@ do_install:append () {
  
     # for systemd
     install -d ${D}${systemd_unitdir}/system
-    install -m 0664 ${WORKDIR}/ipmi.service ${D}${systemd_unitdir}/system
+    install -m 0664 ${UNPACKDIR}/ipmi.service ${D}${systemd_unitdir}/system
     sed -i -e "s,@LIBEXECDIR@,${libexecdir},g" ${D}${systemd_unitdir}/system/ipmi.service
     install -d ${D}${libexecdir}
-    install -m 0755 ${WORKDIR}/openipmi-helper ${D}${libexecdir}
+    install -m 0755 ${UNPACKDIR}/openipmi-helper ${D}${libexecdir}
 }
 
 INITSCRIPT_NAME = "ipmi"
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
index f8de78ff74..ba53d40f47 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
@@ -44,7 +44,7 @@ PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 do_install:append() {
     install -d ${D}/${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
+    install -m 755 ${UNPACKDIR}/openvpn ${D}/${sysconfdir}/init.d
 
     install -d ${D}/${sysconfdir}/openvpn
     install -d ${D}/${sysconfdir}/openvpn/server
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
index ffb879952c..ddcad46beb 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
@@ -43,8 +43,8 @@ do_configure:append() {
 
 do_install:append() {
     install -d ${D}${sysconfdir}/pgpool-II
-    install -D -m 0644 ${WORKDIR}/pgpool.sysconfig  ${D}${sysconfdir}/pgpool-II/pgpool.conf
+    install -D -m 0644 ${UNPACKDIR}/pgpool.sysconfig  ${D}${sysconfdir}/pgpool-II/pgpool.conf
     install -D -m 0644 ${S}/src/sample/pcp.conf.sample ${D}${sysconfdir}/pgpool-II/pcp.conf
     install -D -m 0644 ${S}/src/sample/pool_hba.conf.sample ${D}${sysconfdir}/pgpool-II/pool_hba.conf
-    install -Dm 0644 ${WORKDIR}/pgpool.service ${D}${systemd_system_unitdir}/pgpool.service
+    install -Dm 0644 ${UNPACKDIR}/pgpool.service ${D}${systemd_system_unitdir}/pgpool.service
 }
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
index 999deff4de..4f52ee2ba6 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
@@ -36,7 +36,7 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 do_install:append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${systemd_system_unitdir}
-		install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_system_unitdir}
+		install -m 0644 ${UNPACKDIR}/tinyproxy.service ${D}${systemd_system_unitdir}
 	fi
-	install -m 0644 ${WORKDIR}/tinyproxy.conf ${D}${sysconfdir}/tinyproxy.conf
+	install -m 0644 ${UNPACKDIR}/tinyproxy.conf ${D}${sysconfdir}/tinyproxy.conf
 }
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index d348ef8be9..17a1d3c947 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -70,13 +70,13 @@ do_install:append() {
 
     install -m 0755 -d ${D}${sysconfdir}
     install -m 0755 -d ${D}${sysconfdir}/lirc
-    install -m 0644 ${WORKDIR}/lircd.conf ${D}${sysconfdir}/lirc/
-    install -m 0644 ${WORKDIR}/lirc_options.conf ${D}${sysconfdir}/lirc/
+    install -m 0644 ${UNPACKDIR}/lircd.conf ${D}${sysconfdir}/lirc/
+    install -m 0644 ${UNPACKDIR}/lirc_options.conf ${D}${sysconfdir}/lirc/
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -m 0755 -d ${D}${systemd_unitdir}/system ${D}${libdir}/tmpfiles.d
-        install -m 0644 ${WORKDIR}/lircd.service ${D}${systemd_unitdir}/system/
-        install -m 0755 ${WORKDIR}/lircexec.init ${D}${systemd_unitdir}/system/
-        install -m 0644 ${WORKDIR}/lirc.tmpfiles ${D}${libdir}/tmpfiles.d/lirc.conf
+        install -m 0644 ${UNPACKDIR}/lircd.service ${D}${systemd_unitdir}/system/
+        install -m 0755 ${UNPACKDIR}/lircexec.init ${D}${systemd_unitdir}/system/
+        install -m 0644 ${UNPACKDIR}/lirc.tmpfiles ${D}${libdir}/tmpfiles.d/lirc.conf
     else
         rm -rf ${D}/lib
     fi
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb
index 0d0f6fea48..246cdfe3f0 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb
@@ -55,13 +55,13 @@ do_install:append(){
 
     install -d ${D}${sysconfdir}/thingsboard-gateway/config
 
-    for file in $(find ${WORKDIR} -maxdepth 1 -type f -name *.json); do
+    for file in $(find ${UNPACKDIR} -maxdepth 1 -type f -name *.json); do
         install -m 0644 "$file" ${D}${sysconfdir}/thingsboard-gateway/config
     done
 
-    install -m 0644 ${WORKDIR}/tb_gateway.yaml ${D}${sysconfdir}/thingsboard-gateway/config
-    install -m 0644 ${WORKDIR}/logs.conf ${D}${sysconfdir}/thingsboard-gateway/config
+    install -m 0644 ${UNPACKDIR}/tb_gateway.yaml ${D}${sysconfdir}/thingsboard-gateway/config
+    install -m 0644 ${UNPACKDIR}/logs.conf ${D}${sysconfdir}/thingsboard-gateway/config
 
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/thingsboard-gateway.service     ${D}${systemd_system_unitdir}/thingsboard-gateway.service
+    install -m 0644 ${UNPACKDIR}/thingsboard-gateway.service ${D}${systemd_system_unitdir}/thingsboard-gateway.service
 }
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb
index c083a3a37a..a7a3bf12c5 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.0.bb
@@ -34,9 +34,9 @@ LDFLAGS:append:libc-musl = " -largp"
 
 do_install:append() {
 	install -d ${D}${sysconfdir}/init.d
-	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rasdaemon
+	install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/rasdaemon
 	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/rasdaemon.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${UNPACKDIR}/rasdaemon.service ${D}${systemd_unitdir}/system
 }
 
 FILES:${PN} += "${sbindir}/rasdaemon \
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
index 1c26c7207b..35b3a5c08b 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
@@ -14,17 +14,17 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
-    install -m 0755 ${WORKDIR}/android-gadget-start ${D}${bindir}
-    install -m 0755 ${WORKDIR}/android-gadget-cleanup ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
 
-    if [ -r ${WORKDIR}/android-gadget-setup.machine ] ; then
+    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
 	install -d ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
+	install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
     fi
 
     install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
-    install -m 0644 ${WORKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
+    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
 }
 
 FILES:${PN} += " \
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
index b63ccbb080..cb2ff672e3 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "file://android-gadget-setup"
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
 }
 
 python () {
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index fbad5e1368..f63b5c04b3 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -153,7 +153,7 @@ do_install() {
     fi
 
     # Outside the if statement to avoid errors during do_package
-    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
+    install -D -p -m0644 ${UNPACKDIR}/android-tools-adbd.service \
       ${D}${systemd_unitdir}/system/android-tools-adbd.service
 
     install -d  ${D}${libdir}/android/
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
index 5a1306b6fe..6ab1121efb 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
@@ -37,8 +37,8 @@ do_install() {
 
     install -m 0755 ${S}/iozone ${D}${bindir}
     install -m 0755 ${S}/fileop ${D}${bindir}
-    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/iozone.1 ${D}${mandir}/man1/
-    install -m 0644 ${WORKDIR}/copyright.txt ${D}${datadir}/doc/${BPN}/
+    install -m 0644 ${S}/../../docs/iozone.1 ${D}${mandir}/man1/
+    install -m 0644 ${UNPACKDIR}/copyright.txt ${D}${datadir}/doc/${BPN}/
 
     install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${BPN}/examples
     install -m 0644 ${S}/client_list ${D}${datadir}/doc/${BPN}/examples
@@ -48,9 +48,9 @@ do_install() {
     install -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${BPN}/examples
     install -m 0755 ${S}/report.pl ${D}${datadir}/doc/${BPN}/examples
 
-    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/Iozone_ps.gz ${D}${datadir}/doc/${BPN}/
-    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/IOzone_msword_98.pdf ${D}${datadir}/doc/${BPN}/
-    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/Run_rules.doc ${D}${datadir}/doc/${BPN}/
+    install -m 0644 ${S}/../../docs/Iozone_ps.gz ${D}${datadir}/doc/${BPN}/
+    install -m 0644 ${S}/../../docs/IOzone_msword_98.pdf ${D}${datadir}/doc/${BPN}/
+    install -m 0644 ${S}/../../docs/Run_rules.doc ${D}${datadir}/doc/${BPN}/
 }
 
 FILES:${PN} += "${datadir}/doc/${PN}/copyright.txt"
diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
index 603004ddd5..b49951cc27 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point com
 SUMMARY = "LINPACK is a software library for performing numerical linear algebra on digital computers"
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM ="file://${WORKDIR}/linpacknew.c;beginline=1;endline=23;md5=aa025e3bc44190c71e4c5e3b084fed87"
+LIC_FILES_CHKSUM ="file://${UNPACKDIR}/linpacknew.c;beginline=1;endline=23;md5=aa025e3bc44190c71e4c5e3b084fed87"
 
 SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c \
            file://0001-linpack-Define-DP-only-when-SP-is-not-defined.patch \
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 57f73eedc7..6729e81fa5 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -75,7 +75,7 @@ do_install () {
             DESTDIR="${D}" \
             -C src install
     mv ${D}${bindir}/line ${D}${bindir}/lm_line
-    install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
+    install -m 0755 ${UNPACKDIR}/lmbench-run ${D}${bindir}/
     install -m 0755 ${S}/bin/${TARGET_SYS}/cache ${D}${bindir}/
     sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${BPN},;' \
            -e 's,^CONFIG=.*$,CONFIG=`$SCRIPTSDIR/config`,;' \
diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
index 03076cbc60..6c80f4c81d 100644
--- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
@@ -48,7 +48,7 @@ RDEPENDS:${PN}:append = " \
 
 do_install:append() {
 	install -d ${D}${systemd_unitdir}/system
-	install -m 644 ${WORKDIR}/edac.service ${D}/${systemd_unitdir}/system
+	install -m 644 ${UNPACKDIR}/edac.service ${D}/${systemd_unitdir}/system
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}/${systemd_unitdir}/system/edac.service
 }
 
diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
index 0a041835e1..f3760a40e6 100644
--- a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
+++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
@@ -29,6 +29,6 @@ do_configure:prepend() {
 
 do_install:append() {
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/firmwared.service ${D}${systemd_system_unitdir}
     sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/firmwared.service
 }
diff --git a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
index fa1bb928ca..22bb30a504 100644
--- a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
+++ b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
@@ -60,5 +60,5 @@ do_install () {
 	done
 
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index aba5ab5878..f956224e18 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -70,11 +70,11 @@ do_install() {
     install -d ${D}${INIT_D_DIR}
 
     # Install fancontrol init script
-    install -m 0755 ${WORKDIR}/fancontrol.init ${D}${INIT_D_DIR}/fancontrol
+    install -m 0755 ${UNPACKDIR}/fancontrol.init ${D}${INIT_D_DIR}/fancontrol
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
         # Install sensord init script
-        install -m 0755 ${WORKDIR}/sensord.init ${D}${INIT_D_DIR}/sensord
+        install -m 0755 ${UNPACKDIR}/sensord.init ${D}${INIT_D_DIR}/sensord
     fi
 
     # Insall sensord service script
diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
index aa52f62572..e6ec9c3573 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
@@ -22,8 +22,8 @@ do_install:append() {
     rm -rf ${D}/usr/share/gammu
     #install default configuration files
     install -d ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/gammurc ${D}${sysconfdir}/gammurc
-    install -m 0644 ${WORKDIR}/gammu-smsdrc ${D}${sysconfdir}/gammu-smsdrc
+    install -m 0644 ${UNPACKDIR}/gammurc ${D}${sysconfdir}/gammurc
+    install -m 0644 ${UNPACKDIR}/gammu-smsdrc ${D}${sysconfdir}/gammu-smsdrc
 }
 
 EXTRA_OECONF = " \
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
index dbdc5c1bdf..e547462bbc 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -29,7 +29,7 @@ SYSTEMD_SERVICE:${PN} = "hostapd.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 
 do_configure:append() {
-    install -m 0644 ${WORKDIR}/defconfig ${B}/.config
+    install -m 0644 ${UNPACKDIR}/defconfig ${B}/.config
 }
 
 do_compile() {
@@ -43,8 +43,8 @@ do_install() {
     install -m 0644 ${B}/hostapd.conf ${D}${sysconfdir}
     install -m 0755 ${B}/hostapd ${D}${sbindir}
     install -m 0755 ${B}/hostapd_cli ${D}${sbindir}
-    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
-    install -m 0644 ${WORKDIR}/hostapd.service ${D}${systemd_unitdir}/system/
+    install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/hostapd
+    install -m 0644 ${UNPACKDIR}/hostapd.service ${D}${systemd_unitdir}/system/
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/hostapd.service
 }
 
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb
index 7af33e4e7e..ed12fee94c 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb
@@ -74,8 +74,8 @@ do_install:append() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
-        install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/${sysconfdir}/init.d
-        install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/default
+        install -m 0755 ${UNPACKDIR}/etc/init.d/* ${D}/${sysconfdir}/init.d
+        install -m 0644 ${UNPACKDIR}/etc/default/* ${D}/${sysconfdir}/default
 
         mkdir -p ${D}/${sysconfdir}/default/volatiles
         echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
@@ -90,11 +90,11 @@ do_install:append() {
               > ${D}${sysconfdir}/tmpfiles.d/krb5.conf
 
         mkdir -p ${D}/${sysconfdir}/default
-        install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/default
+        install -m 0644 ${UNPACKDIR}/etc/default/* ${D}/${sysconfdir}/default
 
         install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/krb5-admin-server.service ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/krb5-kdc.service ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/krb5-admin-server.service ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/krb5-kdc.service ${D}${systemd_system_unitdir}
     fi
 
     sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
index 9a5c9b5204..d1a73841a1 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
@@ -46,10 +46,10 @@ do_install() {
     install -d ${D}/${systemd_unitdir}/system/
     for service in ${LINUXPTP_SYSTEMD_SERVICES}; do
         sed -i -e 's,@SBINDIR@,${sbindir},g' \
-            ${WORKDIR}/systemd/$service.in
+            ${UNPACKDIR}/systemd/$service.in
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-            ${WORKDIR}/systemd/$service.in
-        install -m 644 ${WORKDIR}/systemd/$service.in \
+            ${UNPACKDIR}/systemd/$service.in
+        install -m 644 ${UNPACKDIR}/systemd/$service.in \
             ${D}/${systemd_unitdir}/system/$service
     done
 }
diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb
index 21066b10f1..f23692816c 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb
@@ -24,7 +24,7 @@ CONFFILES:${PN} += "${sysconfdir}/ser2net/ser2net.yaml"
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/ser2net.service ${D}${systemd_unitdir}/system/
+        install -m 0644 ${UNPACKDIR}/ser2net.service ${D}${systemd_unitdir}/system/
         sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/ser2net.service
     fi
 }
diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb
index cbba31edbe..b9ed3d925d 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb
@@ -32,9 +32,9 @@ TRANSMISSION_GROUP ??= "root"
 
 do_install:append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-		sed -i '/USERNAME=/c\USERNAME=${TRANSMISSION_USER}' ${WORKDIR}/transmission-daemon
+		sed -i '/USERNAME=/c\USERNAME=${TRANSMISSION_USER}' ${UNPACKDIR}/transmission-daemon
 		install -d ${D}${sysconfdir}/init.d
-		install -m 0744 ${WORKDIR}/transmission-daemon ${D}${sysconfdir}/init.d/
+		install -m 0744 ${UNPACKDIR}/transmission-daemon ${D}${sysconfdir}/init.d/
 		chown ${TRANSMISSION_USER}:${TRANSMISSION_GROUP} ${D}${sysconfdir}/init.d/transmission-daemon
 	fi
 
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
index 8708852ce7..46c09a02a5 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
@@ -68,7 +68,7 @@ do_configure:prepend() {
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/zabbix-agent.service ${D}${systemd_unitdir}/system/
+        install -m 0644 ${UNPACKDIR}/zabbix-agent.service ${D}${systemd_unitdir}/system/
         sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/zabbix-agent.service
     fi
 }
diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index 6331f618fc..3f3b5bc920 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -18,7 +18,7 @@ do_compile() {
 }
 
 do_install() {
-   install -Dm 0755 ${WORKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/${BPN}
+   install -Dm 0755 ${UNPACKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/${BPN}
    install -Dm 0755 ${S}/nbcat ${D}${bindir}/nbcat
    install -Dm 0755 ${S}/mkemlog ${D}${bindir}/mkemlog
 }
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 33da32fb28..bbfad1e478 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -31,8 +31,6 @@ SRC_URI[sha256sum] = "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076b6ffe25811
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
-S = "${WORKDIR}/mariadb-${PV}"
-
 BINCONFIG_GLOB = "mysql_config"
 
 inherit cmake gettext binconfig update-rc.d systemd multilib_script pkgconfig
@@ -163,18 +161,18 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install
 
     install -d ${D}/${sysconfdir}/init.d
-    install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
-    install -m 0755 ${WORKDIR}/install_db ${D}/${sysconfdir}/init.d/
+    install -m 0644 ${UNPACKDIR}/my.cnf ${D}/${sysconfdir}/
+    install -m 0755 ${UNPACKDIR}/install_db ${D}/${sysconfdir}/init.d/
     mv ${D}/${sysconfdir}/init.d/mysql ${D}/${sysconfdir}/init.d/mysqld
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/mysqld.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/install_db.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/mysqld.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/install_db.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@BINDIR@,${bindir},g' -e 's,@PREFIX@,${prefix},g' ${D}${systemd_unitdir}/system/mysqld.service \
                                                                    ${D}${systemd_unitdir}/system/install_db.service
 
     install -d ${D}${bindir}
-    install -m 755 ${WORKDIR}/mysql-systemd-start ${D}${bindir}
+    install -m 755 ${UNPACKDIR}/mysql-systemd-start ${D}${bindir}
     install -d ${D}${datadir}/doc/${PN}
     if [ -f ${D}${datadir}/doc/README ]; then
         mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index e29a5bef77..2dd7dd6fda 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -198,24 +198,24 @@ do_install:append() {
 
     # install dirs and server init
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/${BPN}.init ${D}${sysconfdir}/init.d/${BPN}-server
+    install -m 0755 ${UNPACKDIR}/${BPN}.init ${D}${sysconfdir}/init.d/${BPN}-server
     sed -i -e "s/^PGVERSION=.*$/PGVERSION=${PV}/g" ${D}${sysconfdir}/init.d/${BPN}-server
-    install -m 0755 ${WORKDIR}/${BPN}-setup ${D}${bindir}/${BPN}-setup
+    install -m 0755 ${UNPACKDIR}/${BPN}-setup ${D}${bindir}/${BPN}-setup
     install -d -m 700 ${D}${localstatedir}/lib/${BPN}/data
     install -d -m 700 ${D}${localstatedir}/lib/${BPN}/backups
-    install -m 644 ${WORKDIR}/${BPN}-profile ${D}${localstatedir}/lib/${BPN}/.profile
+    install -m 644 ${UNPACKDIR}/${BPN}-profile ${D}${localstatedir}/lib/${BPN}/.profile
     chown -R postgres:postgres ${D}${localstatedir}/lib/${BPN}
     # multiple server config directory
     install -d -m 700 ${D}${sysconfdir}/default/${BPN}
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/pam.d
-        install -m 644 ${WORKDIR}/postgresql.pam ${D}${sysconfdir}/pam.d/postgresql
+        install -m 644 ${UNPACKDIR}/postgresql.pam ${D}${sysconfdir}/pam.d/postgresql
     fi
 
     # Install systemd unit files
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/postgresql.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/postgresql.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@BINDIR@,${bindir},g' \
         ${D}${systemd_unitdir}/system/postgresql.service
     # Remove the build path
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
index 3f9d49a2d2..430b53c4d0 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
@@ -14,17 +14,17 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
-    install -m 0755 ${WORKDIR}/android-gadget-start ${D}${bindir}
-    install -m 0755 ${WORKDIR}/android-gadget-cleanup ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
 
-    if [ -r ${WORKDIR}/android-gadget-setup.machine ] ; then
+    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
 	install -d ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
+	install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
     fi
 
     install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
-    install -m 0644 ${WORKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
+    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
 }
 
 FILES:${PN} += " \
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
index 34b1a9bdd2..f73be8dbbf 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
@@ -9,7 +9,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
 }
 
 python () {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 1c66ea4997..da5a17a869 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -88,7 +88,7 @@ TOOLS:class-native = "fastboot ext4_utils mkbootimg"
 TOOLS:class-nativesdk = "fastboot ext4_utils mkbootimg"
 
 do_compile() {
-    cp ${WORKDIR}/gitignore ${S}/.gitignore
+    cp ${UNPACKDIR}/gitignore ${S}/.gitignore
 
     # Setting both variables below causing our makefiles to not work with
     # implicit make rules
@@ -151,7 +151,7 @@ do_install() {
     fi
 
     # Outside the if statement to avoid errors during do_package
-    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
+    install -D -p -m0644 ${UNPACKDIR}/android-tools-adbd.service \
       ${D}${systemd_unitdir}/system/android-tools-adbd.service
 
     if echo ${TOOLS} | grep -q "fastboot" ; then
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
index 479b98d44d..599675a345 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
@@ -24,7 +24,7 @@ do_install:append() {
 
 do_install:append:class-target() {
     install -d ${D}${sysconfdir}/yum.repos.d
-    install -m 0644 ${WORKDIR}/oe-remote.repo.sample ${D}${sysconfdir}/yum.repos.d
+    install -m 0644 ${UNPACKDIR}/oe-remote.repo.sample ${D}${sysconfdir}/yum.repos.d
 }
 
 do_install:append:class-nativesdk() {
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
index 0f6bbb4d54..f9e2c7873c 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
@@ -42,7 +42,7 @@ do_compile() {
 do_install() {
     oe_runmake DESTDIR=${D} install
     install -D -m 0644 -p ${S}/iptraf-ng-logrotate.conf ${D}${sysconfdir}/logrotate.d/iptraf-ng
-    install -Dm 0644 ${WORKDIR}/iptraf-ng-tmpfiles.conf ${D}${libdir}/tmpfiles.d/iptraf-ng-tmpfiles.conf
+    install -Dm 0644 ${UNPACKDIR}/iptraf-ng-tmpfiles.conf ${D}${libdir}/tmpfiles.d/iptraf-ng-tmpfiles.conf
 }
 
 FILES:${PN} += "${libdir}/tmpfiles.d"
diff --git a/meta-oe/recipes-devtools/php/php_8.2.18.bb b/meta-oe/recipes-devtools/php/php_8.2.18.bb
index da04ffba62..e662f6806e 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.18.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.18.bb
@@ -182,19 +182,19 @@ do_install:append:class-target() {
     rm -rf ${D}/.[a-z]*
     rm -rf ${D}/var
     rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
-    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
+    install -m 0644 ${UNPACKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.conf
     install -d ${D}/${sysconfdir}/apache2/conf.d
-    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
+    install -m 0644 ${UNPACKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
     install -d ${D}${sysconfdir}/init.d
     sed -i 's:=/usr/sbin:=${sbindir}:g' ${B}/sapi/fpm/init.d.php-fpm
     sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
     sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
     install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
-    install -m 0644 ${WORKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
+    install -m 0644 ${UNPACKDIR}/php-fpm-apache.conf ${D}/${sysconfdir}/apache2/conf.d/php-fpm.conf
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
         install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/php-fpm.service ${D}${systemd_system_unitdir}/php-fpm.service
+        install -m 0644 ${UNPACKDIR}/php-fpm.service ${D}${systemd_system_unitdir}/php-fpm.service
         sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_system_unitdir}/php-fpm.service
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/php-fpm.service
         sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/php-fpm.service
@@ -203,7 +203,7 @@ do_install:append:class-target() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/apache2/modules.d
         install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
-        install -m 644  ${WORKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${D}${sysconfdir}/apache2/modules.d
+        install -m 644  ${UNPACKDIR}/70_mod_php${PHP_MAJOR_VERSION}.conf ${D}${sysconfdir}/apache2/modules.d
         sed -i s,lib/,${libexecdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php${PHP_MAJOR_VERSION}.conf
         cat ${S}/php.ini-production | \
             sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
index 5cd20c5b1c..178a5eb0b5 100644
--- a/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
@@ -27,6 +27,6 @@ inherit autotools ptest
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}
-    install -m 0644 ${WORKDIR}/ptest.out.expected ${D}${PTEST_PATH}/ptest.out.expected
+    install -m 0644 ${UNPACKDIR}/ptest.out.expected ${D}${PTEST_PATH}/ptest.out.expected
 }
 
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index 02f1fcb420..df36b64695 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -63,7 +63,7 @@ EXTRA_OECONF = " \
 
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/collectd.init ${D}${sysconfdir}/init.d/collectd
+    install -m 0755 ${UNPACKDIR}/collectd.init ${D}${sysconfdir}/init.d/collectd
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/collectd
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/collectd
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/collectd
@@ -77,7 +77,7 @@ do_install:append() {
 
     # Install systemd unit files
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/collectd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/collectd.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@SBINDIR@,${sbindir},g' \
         ${D}${systemd_unitdir}/system/collectd.service
 }
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index fe5e5c067d..a293048a21 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -50,14 +50,14 @@ EXTRA_OECONF = " \
 "
 
 do_compile:prepend() {
-    install -m 0644 ${WORKDIR}/qtplot-0.2/qtopia.trm ${S}/term/
+    install -m 0644 ${UNPACKDIR}/qtplot-0.2/qtopia.trm ${S}/term/
 }
 
 do_install:append:class-target() {
     install -d ${D}${datadir}/applications/
-    install -m 0644 ${WORKDIR}/gnuplot.desktop ${D}${datadir}/applications/
+    install -m 0644 ${UNPACKDIR}/gnuplot.desktop ${D}${datadir}/applications/
     install -d ${D}${datadir}/pixmaps/
-    install -m 0644 ${WORKDIR}/gnuplot.png ${D}${datadir}/pixmaps/
+    install -m 0644 ${UNPACKDIR}/gnuplot.png ${D}${datadir}/pixmaps/
 }
 
 PACKAGES =+ "${PN}-x11"
diff --git a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
index 84ed3b052b..fb1aefad61 100644
--- a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
+++ b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
@@ -8,5 +8,5 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
 do_install() {
-    install -Dm 0644 ${WORKDIR}/inputattach.conf ${D}${sysconfdir}/inputattach.conf
+    install -Dm 0644 ${UNPACKDIR}/inputattach.conf ${D}${sysconfdir}/inputattach.conf
 }
diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
index 5716817e95..a2a420ced8 100644
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
@@ -50,11 +50,11 @@ do_compile() {
 do_install() {
     oe_runmake install
 
-    install -Dm 0644 ${WORKDIR}/51-these-are-not-joysticks-rm.rules ${D}${nonarch_base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules
-    install -Dm 0644 ${WORKDIR}/60-joystick.rules ${D}${nonarch_base_libdir}/udev/rules.d/60-joystick.rules
+    install -Dm 0644 ${UNPACKDIR}/51-these-are-not-joysticks-rm.rules ${D}${nonarch_base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules
+    install -Dm 0644 ${UNPACKDIR}/60-joystick.rules ${D}${nonarch_base_libdir}/udev/rules.d/60-joystick.rules
 
-    install -Dm 0644 ${WORKDIR}/inputattach.service ${D}${systemd_system_unitdir}/inputattach.service
-    install -Dm 0755 ${WORKDIR}/inputattachctl ${D}${bindir}/inputattachctl
+    install -Dm 0644 ${UNPACKDIR}/inputattach.service ${D}${systemd_system_unitdir}/inputattach.service
+    install -Dm 0755 ${UNPACKDIR}/inputattachctl ${D}${bindir}/inputattachctl
 }
 
 PACKAGES += "inputattach joystick-jscal joystick"
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
index beb247c254..c9b369f0a6 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
@@ -47,7 +47,7 @@ SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_cxxopts_gsl-lite_date_asio_
 SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
 SRC_URI[libsodium.sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/git"
 
 inherit pkgconfig cmake systemd
 
@@ -162,7 +162,7 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -m 755 -d ${D}${sysconfdir}/tmpfiles.d
-        install -m 644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/minifi.conf
+        install -m 644 ${UNPACKDIR}/systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/minifi.conf
         sed -i "s|@MINIFI_LOG@|${MINIFI_LOG}|g" ${D}${sysconfdir}/tmpfiles.d/minifi.conf
 
         install -m 755 -d ${D}${systemd_system_unitdir}
@@ -174,7 +174,7 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/sysvinit-volatile.conf ${D}${sysconfdir}/default/volatiles/99_minifi
+        install -m 0644 ${UNPACKDIR}/sysvinit-volatile.conf ${D}${sysconfdir}/default/volatiles/99_minifi
 
         sed -i "s|@MINIFI_LOG@|${MINIFI_LOG}|g" ${D}${sysconfdir}/default/volatiles/99_minifi
     fi
diff --git a/meta-oe/recipes-extended/networking/mstpd_git.bb b/meta-oe/recipes-extended/networking/mstpd_git.bb
index b2043ef062..e6e1f9a3b2 100644
--- a/meta-oe/recipes-extended/networking/mstpd_git.bb
+++ b/meta-oe/recipes-extended/networking/mstpd_git.bb
@@ -26,8 +26,8 @@ do_install:append() {
     rmdir ${D}${libdir} || true
 
     install -d -m 0755 ${D}${sbindir}
-    install -m 0755 ${WORKDIR}/bridge-stp ${D}${sbindir}
+    install -m 0755 ${UNPACKDIR}/bridge-stp ${D}${sbindir}
 
     install -d -m 0755 ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/mstpd.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/mstpd.service ${D}${systemd_system_unitdir}
 }
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index 1c68b5f432..5437ea13e8 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -57,7 +57,7 @@ do_install:append() {
     chmod 755 ${D}/${sysconfdir}/openwsman/owsmangencert.sh
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/openwsmand.service ${D}/${systemd_unitdir}/system
+        install -m 644 ${UNPACKDIR}/openwsmand.service ${D}/${systemd_unitdir}/system
 
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/openwsmand.service
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/openwsmand.service
diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
index 7359c12544..2934312456 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -36,10 +36,10 @@ do_install() {
     install -m 755 rarpd.init ${D}${sysconfdir}/init.d/rarpd
     install -m 755 rarpd ${D}${sbindir}/rarpd
     install -m 644 rarpd.8 ${D}${mandir}/man8/rarpd.8
-    install -m 644 ${WORKDIR}/ethers.sample ${D}${sysconfdir}/ethers
+    install -m 644 ${UNPACKDIR}/ethers.sample ${D}${sysconfdir}/ethers
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/rarpd.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${UNPACKDIR}/rarpd.service ${D}${systemd_unitdir}/system/
 }
 
 inherit systemd
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.4.bb b/meta-oe/recipes-extended/redis/redis_7.2.4.bb
index 5d64e9ba78..f23eabe3b5 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.4.bb
@@ -46,14 +46,14 @@ do_install() {
     export PREFIX=${D}/${prefix}
     oe_runmake install
     install -d ${D}/${sysconfdir}/redis
-    install -m 0644 ${WORKDIR}/redis.conf ${D}/${sysconfdir}/redis/redis.conf
+    install -m 0644 ${UNPACKDIR}/redis.conf ${D}/${sysconfdir}/redis/redis.conf
     install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init-redis-server ${D}/${sysconfdir}/init.d/redis-server
+    install -m 0755 ${UNPACKDIR}/init-redis-server ${D}/${sysconfdir}/init.d/redis-server
     install -d ${D}/var/lib/redis/
     chown redis.redis ${D}/var/lib/redis/
 
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/redis.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/redis.service ${D}${systemd_system_unitdir}
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_system_unitdir}/redis.service
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb
index 5152984249..ac1645f671 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb
@@ -137,9 +137,9 @@ do_install_ptest() {
 do_install:append() {
     install -d "${D}${sysconfdir}/init.d"
     install -d "${D}${sysconfdir}/logrotate.d"
-    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
-    install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
-    install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
+    install -m 755 ${UNPACKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
+    install -m 644 ${UNPACKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
+    install -m 644 ${UNPACKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
     sed -i -e "s#@BINDIR@#${bindir}#g" ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'imjournal', 'true', 'false', d)}; then
@@ -152,7 +152,7 @@ do_install:append() {
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_system_unitdir}
-        install -m 644 ${WORKDIR}/rsyslog.service ${D}${systemd_system_unitdir}
+        install -m 644 ${UNPACKDIR}/rsyslog.service ${D}${systemd_system_unitdir}
         sed -i -e "s,@sbindir@,${sbindir},g" ${D}${systemd_system_unitdir}/rsyslog.service
     fi
 }
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 2a7cf2285e..5089397916 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -64,7 +64,7 @@ do_install() {
     oe_runmake DESTDIR=${D} install
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/sfcb.service ${D}${systemd_unitdir}/system/sblim-sfcb.service
+    install -m 0644 ${UNPACKDIR}/sfcb.service ${D}${systemd_unitdir}/system/sblim-sfcb.service
 
     install -d ${D}${sysconfdir}/init.d
     mv ${D}${sysconfdir}/init.d/sfcb ${D}${sysconfdir}/init.d/sblim-sfcb
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index 4fefd5169b..999d2b9e95 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -24,7 +24,7 @@ EXTRA_OEMAKE += "CC='${CC}' CFLAGS='${CFLAGS} -D_LARGEFILE64_SOURCE=1' sbindir=$
 
 do_configure:append() {
 	oe_runmake -C mdadm.d mdadm-1.3.0
-	patch -p0 < ${WORKDIR}/mdadm.patch
+	patch -p0 < ${UNPACKDIR}/mdadm.patch
 }
 INITSCRIPT_PACKAGES = "${PN}-diskmon ${PN}-raidmon"
 INITSCRIPT_NAME:${PN}-diskmon = "sgdisk"
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb
index f387147412..bd92b16299 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb
@@ -33,13 +33,13 @@ SYSTEMD_AUTO_ENABLE = "disable"
 do_install:append () {
     #install the init.d/smartd
     install -d ${D}${sysconfdir}/init.d
-    install -p -m 0755 ${WORKDIR}/initd.smartd ${D}${sysconfdir}/init.d/smartd
+    install -p -m 0755 ${UNPACKDIR}/initd.smartd ${D}${sysconfdir}/init.d/smartd
     install -d ${D}${sysconfdir}/default
-    install -p -m 0644 ${WORKDIR}/smartmontools.default ${D}${sysconfdir}/default/smartmontools
+    install -p -m 0644 ${UNPACKDIR}/smartmontools.default ${D}${sysconfdir}/default/smartmontools
 
     #install systemd service file
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/smartd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/smartd.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
         -e 's,@SBINDIR@,${sbindir},g' \
diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
index 455bda1d76..1a75922277 100644
--- a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
+++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
@@ -50,7 +50,7 @@ do_configure () {
 do_install:append () {
     if [ ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', '', d)} = yes ]; then
         install -d -m 0755 ${D}/${sysconfdir}/pam.d
-        install -m 0644 ${WORKDIR}/vlock_pam ${D}${sysconfdir}/pam.d/vlock
+        install -m 0644 ${UNPACKDIR}/vlock_pam ${D}${sysconfdir}/pam.d/vlock
     fi
 }
 
diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
index b4b3a27b2b..800dd6b7c4 100644
--- a/meta-oe/recipes-extended/zram/zram_0.2.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
@@ -21,17 +21,17 @@ do_install () {
     # Install systemd related configuration file
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
+        install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/zram
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${libexecdir}
-        install -m 0755 ${WORKDIR}/zram-swap-init ${D}${libexecdir}
-        install -m 0755 ${WORKDIR}/zram-swap-deinit ${D}${libexecdir}
+        install -m 0755 ${UNPACKDIR}/zram-swap-init ${D}${libexecdir}
+        install -m 0755 ${UNPACKDIR}/zram-swap-deinit ${D}${libexecdir}
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/zram-swap.service ${D}${systemd_unitdir}/system/zram-swap.service
+        install -m 0644 ${UNPACKDIR}/zram-swap.service ${D}${systemd_unitdir}/system/zram-swap.service
         sed -i -e "s,@LIBEXECDIR@,${libexecdir},g" ${D}${systemd_unitdir}/system/zram-swap.service
-        install -m 0644 ${WORKDIR}/dev-zram0.swap ${D}${systemd_unitdir}/system/dev-zram0.swap
+        install -m 0644 ${UNPACKDIR}/dev-zram0.swap ${D}${systemd_unitdir}/system/dev-zram0.swap
     fi
 }
 
diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
index f51451d971..54b37912b2 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
@@ -19,5 +19,5 @@ export ac_cv_have_iconv_detect_h="yes"
 export ac_cv_sys_file_offset_bits="64"
 
 do_configure:append () {
-    cp ${WORKDIR}/iconv-detect.h ${S}
+    cp ${UNPACKDIR}/iconv-detect.h ${S}
 }
diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
index db55f22398..1cfd9c1cba 100644
--- a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
@@ -11,7 +11,7 @@ PROVIDES = "gnome-doc-utils"
 
 do_install:append() {
         install -d ${D}${datadir}/aclocal/
-        install ${WORKDIR}/gnome-doc-utils.m4 ${D}${datadir}/aclocal/
+        install ${UNPACKDIR}/gnome-doc-utils.m4 ${D}${datadir}/aclocal/
 }
 
 FILES:${PN} += "${datadir}"
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
index dd520b245e..e313d7a192 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -29,10 +29,10 @@ do_install() {
     cp -R --no-dereference --preserve=mode,links ${S}/glm ${D}${includedir}
     cp -R --no-dereference --preserve=mode,links ${S}/doc ${D}${docdir}/glm
     rm ${D}${includedir}/glm/CMakeLists.txt
-    sed "s/@VERSION@/${PV}/" ${WORKDIR}/glmConfigVersion.cmake.in > ${D}${libdir}/cmake/glm/glmConfigVersion.cmake
-    sed "s/@VERSION@/${PV}/" ${WORKDIR}/glmConfig.cmake.in > ${D}${libdir}/cmake/glm/glmConfig.cmake
-    sed "s/@VERSION@/${PV}/" ${WORKDIR}/glm.pc.in > ${D}${libdir}/pkgconfig/glm.pc
-    install -Dm644 ${WORKDIR}/glmTargets.cmake ${D}${libdir}/cmake/glm/glmTargets.cmake
+    sed "s/@VERSION@/${PV}/" ${UNPACKDIR}/glmConfigVersion.cmake.in > ${D}${libdir}/cmake/glm/glmConfigVersion.cmake
+    sed "s/@VERSION@/${PV}/" ${UNPACKDIR}/glmConfig.cmake.in > ${D}${libdir}/cmake/glm/glmConfig.cmake
+    sed "s/@VERSION@/${PV}/" ${UNPACKDIR}/glm.pc.in > ${D}${libdir}/pkgconfig/glm.pc
+    install -Dm644 ${UNPACKDIR}/glmTargets.cmake ${D}${libdir}/cmake/glm/glmTargets.cmake
 
 }
 
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
index cc42b6a9c6..1d0b37826d 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
@@ -38,7 +38,7 @@ do_configure:append() {
 
 do_install:append() {
     install -d ${D}${sysconfdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 }
 
 PACKAGES =+ "libgphotoport libgphoto2-camlibs"
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index a70d31fed0..30964a1b9a 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 do_configure:prepend () {
     rm -f ${S}/m4/init.m4
-    cp -f ${WORKDIR}/Makevars ${S}/po/
+    cp -f ${UNPACKDIR}/Makevars ${S}/po/
 }
 
 do_install:append () {
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index adf9cb597c..ae45258297 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -61,12 +61,12 @@ do_compile:append() {
 
 do_install:append() {
     install -d ${D}${localstatedir}/lib/lxdm
-    install -m 644 ${WORKDIR}/lxdm.conf ${D}${localstatedir}/lib/lxdm
+    install -m 644 ${UNPACKDIR}/lxdm.conf ${D}${localstatedir}/lib/lxdm
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
         # ArchLinux version of pam config has the following advantages:
         # * simple setup of passwordless login
         # * in XFCE powerdown/restart enabled in logoff dialog
-        install -m 644 ${WORKDIR}/${@bb.utils.contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)} ${D}${sysconfdir}/pam.d/lxdm
+        install -m 644 ${UNPACKDIR}/${@bb.utils.contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)} ${D}${sysconfdir}/pam.d/lxdm
     fi
 }
 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 5cde7c9fb4..668ca79ddd 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
 XORG_PN ?= "xorg-server"
 XORG_PV ?= "1.20.6"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.bz2;name=xorg"
-XORG_S = "${WORKDIR}/${XORG_PN}-${XORG_PV}"
+XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
 SRC_URI[xorg.md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
 SRC_URI[xorg.sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
 
diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
index 01da03a473..cc7e44eff2 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
@@ -53,12 +53,12 @@ PACKAGECONFIG[one-wire-ts-input] = "--enable-one-wire-ts-input,--disable-one-wir
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 
 do_install:prepend() {
-    install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
+    install -m 0644 ${UNPACKDIR}/ts.conf ${S}/etc/ts.conf
 }
 
 do_install:append() {
     install -d ${D}${sysconfdir}/profile.d/
-    install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
+    install -m 0755 ${UNPACKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
 }
 
 RPROVIDES:tslib-conf = "libts-0.0-conf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
index 3402d0d46a..e7ec004059 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/source-code-pro-2.030R-ro-1.050R-it"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${WORKDIR}/44-source-code-pro-fonts-fontconfig.conf ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${UNPACKDIR}/44-source-code-pro-fonts-fontconfig.conf ${D}${sysconfdir}/fonts/conf.d/
 
     install -d ${D}${datadir}/fonts/truetype/
     find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
index b4a598527e..ee22113978 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/SourceHanSansCN"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${WORKDIR}/44-source-han-sans-cn.conf ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${UNPACKDIR}/44-source-han-sans-cn.conf ${D}${sysconfdir}/fonts/conf.d/
 
     install -d ${D}${datadir}/fonts/truetype/
     find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
index 6a4509048f..8be19dde4a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/SourceHanSansJP"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${WORKDIR}/44-source-han-sans-jp.conf ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${UNPACKDIR}/44-source-han-sans-jp.conf ${D}${sysconfdir}/fonts/conf.d/
 
     install -d ${D}${datadir}/fonts/truetype/
     find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
index 5ab5057d86..639f9ced78 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
@@ -17,11 +17,11 @@ SRC_URI = " \
 SRC_URI[md5sum] = "f8d1bd6c87d8575afdb25e2f46bd81d4"
 SRC_URI[sha256sum] = "38fd15c80f9980492faaa1af39ff873d8a38e45027023fb17d5b10d4b4b0e6af"
 
-S = "${WORKDIR}/SourceHanSansKR"
+S = "${UNPACKDIR}/branches"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${WORKDIR}/44-source-han-sans-kr.conf ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${UNPACKDIR}/44-source-han-sans-kr.conf ${D}${sysconfdir}/fonts/conf.d/
 
     install -d ${D}${datadir}/fonts/truetype/
     find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
index a2b3fff079..ebd540a5c3 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
@@ -17,11 +17,11 @@ SRC_URI = " \
 SRC_URI[md5sum] = "6533b71b31c19e548768f0fc963202f3"
 SRC_URI[sha256sum] = "92ba161921c5cdec5a8f8d5711676f0865b50cee071c25eb4bd4125b5af59fd0"
 
-S = "${WORKDIR}/SourceHanSansTW"
+S = "${UNPACKDIR}/SourceHanSansTW"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${WORKDIR}/44-source-han-sans-tw.conf ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${UNPACKDIR}/44-source-han-sans-tw.conf ${D}${sysconfdir}/fonts/conf.d/
 
     install -d ${D}${datadir}/fonts/truetype/
     find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 43a387b818..54aeb318a4 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -23,7 +23,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/dejavu/files/dejavu/"
 
 do_install:append () {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${WORKDIR}/30-dejavu-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${UNPACKDIR}/30-dejavu-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
 }
 
 PACKAGES = "\
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 2ae1d619c0..5a8fe4c320 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -3,23 +3,23 @@ require ttf.inc
 SUMMARY = "Inconsolata font - TTF Version"
 HOMEPAGE = "http://www.levien.com/type/myfonts/inconsolata.html"
 LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://../OFL.txt;md5=969851e3a70122069a4d9ee61dd5a2ed"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/OFL.txt;md5=969851e3a70122069a4d9ee61dd5a2ed"
 
 SRC_URI = "http://levien.com/type/myfonts/Inconsolata.otf \
     file://OFL.txt"
 
-S = "${WORKDIR}/ttf-inconsolata-${PV}"
+S = "${UNPACKDIR}/ttf-inconsolata-${PV}"
 
 FILES:${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \
     ${datadir}/doc/ttf-inconsolata/*"
 
 do_configure() {
-    cp -fr ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
+    cp -fr ${UNPACKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
 }
 
 do_install:append() {
     install -d ${D}${datadir}/doc/ttf-inconsolata/
-    install -m 0644 ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/
+    install -m 0644 ${UNPACKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/
 }
 
 SRC_URI[md5sum] = "0fbe014c1f0fb5e3c71140ff0dc63edf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
index f386d6ec58..a0fb7b6a79 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -22,7 +22,7 @@ do_install:append () {
     install -d ${D}${datadir}/fonts/TTF/
     install -d ${D}${sysconfdir}/fonts/conf.d/
     install -m 0644 LiberationSansNarrow*.ttf ${D}${datadir}/fonts/TTF/
-    install -D -m 0644 ${WORKDIR}/30-0-liberation-sans-narrow.conf ${D}${sysconfdir}/conf.avail/30-${PN}-sans.conf
+    install -D -m 0644 ${UNPACKDIR}/30-0-liberation-sans-narrow.conf ${D}${sysconfdir}/conf.avail/30-${PN}-sans.conf
     install -D -m 0644 ${S}/License.txt ${D}${datadir}/licenses/${PN}/LICENSE
     # normal liberation fonts come from ttf-liberation recipe so delete here
     rm -rf ${D}${datadir}/fonts/truetype
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
index e9aa5721f7..fce76418f9 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.paratype.com/public/"
 SECTION = "x11/fonts"
 
 LICENSE = "ParaTypeFFL-1.3"
-LIC_FILES_CHKSUM = "file://../PT%20Free%20Font%20License_eng.txt;md5=d720f3a281ed81c3f4cfc465e11b1d0d"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/PT%20Free%20Font%20License_eng.txt;md5=d720f3a281ed81c3f4cfc465e11b1d0d"
 
 inherit allarch fontcache
 
@@ -16,9 +16,10 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/paratype-pt-sans-fonts/PTSans
 SRC_URI[md5sum] = "c3f5a0e20a75cf628387510a720924a7"
 SRC_URI[sha256sum] = "0164f824e03c32c99e8a225853ec168893a04a09ade132e93a674e85ae033b2e"
 
+S = "${UNPACKDIR}"
+
 do_install () {
     install -d ${D}${datadir}/fonts/X11/TTF/
-    cd ..
     for i in *.ttf; do
         install -m 0644 $i ${D}${prefix}/share/fonts/X11/TTF/${i}
     done
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
index 461e3def78..0131a62eef 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
@@ -3,7 +3,7 @@ require ttf.inc
 SUMMARY = "Thai Linux Working Group Fonts"
 HOMEPAGE = "http://linux.thai.net/projects/fonts-tlwg"
 LICENSE = "GPL-2.0-only & TLWG"
-LIC_FILES_CHKSUM = "file://../fonts-tlwg-${PV}/COPYING;md5=3d20cd7eadf4afd5460c0adb32e387fd"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/fonts-tlwg-${PV}/COPYING;md5=3d20cd7eadf4afd5460c0adb32e387fd"
 
 SRC_URI = "http://linux.thai.net/pub/ThaiLinux/software/fonts-tlwg/fonts-tlwg-${PV}.tar.xz;name=source \
            http://linux.thai.net/pub/ThaiLinux/software/ttf-tlwg/ttf-tlwg-${PV}.tar.xz;name=ttf"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
index 9f445ff265..8c26bf798c 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "b596168c4ed2f1023212dc828ce49cbe82a0bbd1aac3c5e2958154d788
 
 do_install:append() {
     install -d ${D}${nonarch_base_libdir}/udev/rules.d
-    install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}${nonarch_base_libdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/99-xf86-input-tslib.rules ${D}${nonarch_base_libdir}/udev/rules.d/
 }
 
 FILES:${PN} += "${nonarch_base_libdir}/udev"
diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
index dc909ed78c..c06c9e96b3 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
@@ -38,7 +38,7 @@ CONFIGUREOPTS:remove = "--disable-silent-rules --disable-dependency-tracking ${@
 EXTRA_OECONF:remove = "--disable-static"
 
 do_install:append() {
-    install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
+    install -D ${UNPACKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
     for f in xscreensaver-getimage-file xscreensaver-getimage-video webcollage xscreensaver-text vidwhacker
     do
         sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native/perl|/usr/bin/perl|g" ${D}/${libexecdir}/${PN}/$f
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 01f185adba..e64482c579 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -120,7 +120,7 @@ do_install() {
 }
 
 do_configure() {
-    install -D -m 0644 ${WORKDIR}/COPYING ${S}/COPYING
+    install -D -m 0644 ${UNPACKDIR}/COPYING ${S}/COPYING
 }
 
 do_patch[prefuncs] += "copy_kselftest_source_from_kernel remove_unrelated"
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index 726aa60ce7..90e847c137 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -36,9 +36,9 @@ do_install:append() {
     cp -rf ${S}/etc/* ${D}/${sysconfdir}/
 
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/minicoredumper.service ${D}${systemd_system_unitdir}
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
+    install -m 0755 ${UNPACKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
 
     # correct path of minicoredumper
     sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${sysconfdir}/init.d/minicoredumper
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index c4c89e5750..45f70aa381 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -43,7 +43,7 @@ inherit autotools pkgconfig ptest
 
 EXTRA_OECONF = "--with-kernel=${STAGING_DIR_HOST}${prefix} --without-x ac_cv_prog_XSLTPROC="
 do_configure () {
-	cp ${WORKDIR}/acinclude.m4 ${S}/
+	cp ${UNPACKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
 }
 
diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index bdc37c0382..5885e82c7e 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -50,7 +50,7 @@ do_configure:prepend() {
 		cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
 	fi
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
-	cp -r ${WORKDIR}/COPYING ${S}
+	cp -r ${UNPACKDIR}/COPYING ${S}
 }
 
 
diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
index a899049b77..80c770c3e3 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_configure() {
-    cp ${WORKDIR}/config.linux-cross .
+    cp ${UNPACKDIR}/config.linux-cross .
     echo "COMPILE_OPTS+=" -fPIC -DXLOCALE_NOT_USED"" >> config.linux-cross
     ./genMakefiles linux-cross
 }
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index d85ef20577..a6703ecf8d 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -58,7 +58,7 @@ do_compile:prepend () {
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/saslauthd.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/saslauthd.service ${D}${systemd_unitdir}/system
 
         sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/saslauthd.service
         sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/saslauthd.service
@@ -68,7 +68,7 @@ do_install:append() {
         echo "d /run/saslauthd/ - - - -" > ${D}${sysconfdir}/tmpfiles.d/saslauthd.conf
 
         install -d ${D}${sysconfdir}/default/
-        install -m 0644 ${WORKDIR}/saslauthd.conf ${D}${sysconfdir}/default/saslauthd
+        install -m 0644 ${UNPACKDIR}/saslauthd.conf ${D}${sysconfdir}/default/saslauthd
         sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${sysconfdir}/default/saslauthd
     fi
 }
diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb b/meta-oe/recipes-security/audit/audit_4.0.1.bb
index a37ae3bb84..c189cfea55 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
@@ -90,11 +90,11 @@ do_install:append() {
     install -m 0640 ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -D -m 0644 ${WORKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/audit.conf
+        install -D -m 0644 ${UNPACKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/audit.conf
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
+        install -D -m 0755 ${UNPACKDIR}/auditd ${D}/etc/init.d/auditd
         rm -rf ${D}${libdir}/systemd
     fi
 
diff --git a/meta-oe/recipes-support/atop/atop_2.4.0.bb b/meta-oe/recipes-support/atop/atop_2.4.0.bb
index bb1f53624a..4b0e74227b 100644
--- a/meta-oe/recipes-support/atop/atop_2.4.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.4.0.bb
@@ -35,12 +35,12 @@ do_install() {
         make DESTDIR=${D} VERS=${PV} SYSDPATH=${systemd_system_unitdir} \
             PMPATHD=${systemd_unitdir}/system-sleep systemdinstall
         install -d ${D}${sysconfdir}/tmpfiles.d
-        install -m 644 ${WORKDIR}/volatiles.atop.conf ${D}${sysconfdir}/tmpfiles.d/atop.conf
+        install -m 644 ${UNPACKDIR}/volatiles.atop.conf ${D}${sysconfdir}/tmpfiles.d/atop.conf
         rm -f ${D}${systemd_system_unitdir}/atopacct.service
     else
         make DESTDIR=${D} VERS=${PV} sysvinstall
         install -d ${D}${sysconfdir}/default/volatiles
-        install -m 644 ${WORKDIR}/volatiles.99_atop ${D}${sysconfdir}/default/volatiles/99_atop
+        install -m 644 ${UNPACKDIR}/volatiles.99_atop ${D}${sysconfdir}/default/volatiles/99_atop
         rm -f ${D}${sysconfdir}/init.d/atopacct
     fi
 
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
index 2d91ac1731..d0f5b30eb7 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
@@ -20,7 +20,7 @@ EXTRA_OECMAKE = "-DCARES_STATIC=${@ 'ON' if d.getVar('DISABLE_STATIC') == '' els
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}
 	install -m 0755 ${B}/bin/arestest ${D}${PTEST_PATH}
-	install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
+	install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}
 }
 
 PACKAGE_BEFORE_PN = "${PN}-utils"
diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index 0e994d8b09..90db08544d 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -2,15 +2,15 @@ SUMMARY = "Common files and packaging infrastructure for CT-API modules"
 HOMEPAGE = "http://fedoraproject.org/"
 SECTION = "System Environment/Libraries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://../ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
 
 SRC_URI = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.LICENSE \
            https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
 SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
 
 do_compile() {
-    install -pm 644 ${WORKDIR}/ctapi-common.LICENSE LICENSE
-    install -pm 644 ${WORKDIR}/ctapi-common.README README
+    install -pm 644 ${UNPACKDIR}/ctapi-common.LICENSE LICENSE
+    install -pm 644 ${UNPACKDIR}/ctapi-common.README README
     echo ${libdir}/ctapi > ctapi.conf
 }
 
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 31503e9c62..25e5414a35 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -30,8 +30,8 @@ do_configure:prepend() {
 
 do_install:append () {
     install -d ${D}${systemd_system_unitdir}
-    sed 's:@bindir@:${sbindir}:' < ${WORKDIR}/gpm.service.in >${D}${systemd_system_unitdir}/gpm.service
-    install -D -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/gpm
+    sed 's:@bindir@:${sbindir}:' < ${UNPACKDIR}/gpm.service.in >${D}${systemd_system_unitdir}/gpm.service
+    install -D -m 0755 ${UNPACKDIR}/init ${D}${INIT_D_DIR}/gpm
     ln -s libgpm.so.2 ${D}${libdir}/libgpm.so
 }
 
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index b204ea4dd6..384a19c4fa 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -25,9 +25,9 @@ FILES:${PN} += "/usr/share/misc/hddtemp.db"
 
 do_install:append() {
     install -d ${D}/usr/share/misc/
-    install -m 0644 ${WORKDIR}/hddtemp.db ${D}/usr/share/misc/hddtemp.db
+    install -m 0644 ${UNPACKDIR}/hddtemp.db ${D}/usr/share/misc/hddtemp.db
     install -d ${D}${sysconfdir}/init.d
-    install -m 0644 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hddtemp
+    install -m 0644 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/hddtemp
 }
 
 INITSCRIPT_NAME = "hddtemp"
diff --git a/meta-oe/recipes-support/libee/libee.inc b/meta-oe/recipes-support/libee/libee.inc
index 16fe557f76..592109b951 100644
--- a/meta-oe/recipes-support/libee/libee.inc
+++ b/meta-oe/recipes-support/libee/libee.inc
@@ -35,5 +35,5 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}
     install -m 0755 ${B}/${TESTDIR}/genfile ${D}${PTEST_PATH}
     install -m 0755 ${B}/${TESTDIR}/.libs/ezapi1 ${D}${PTEST_PATH}
-    install -m 0755 ${WORKDIR}/ezapi1.sh ${D}${PTEST_PATH}
+    install -m 0755 ${UNPACKDIR}/ezapi1.sh ${D}${PTEST_PATH}
 }
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 822b7ffc2b..73aeb55393 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF:class-target = "ac_cv_path_SH=/bin/sh ac_cv_path_WGET=${bindir}/wge
 
 do_install:append () {
     install -d ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/smi.conf ${D}${sysconfdir}/smi.conf
+    install -m 0644 ${UNPACKDIR}/smi.conf ${D}${sysconfdir}/smi.conf
 }
 
 PACKAGES += "${PN}-mibs ${PN}-pibs ${PN}-yang"
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
index b269e33c44..4e9e6bcdfd 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx-config.bb
@@ -8,5 +8,5 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
 do_install() {
-    install -Dm 0644 ${WORKDIR}/usbgx.default ${D}${sysconfdir}/default/usbgx
+    install -Dm 0644 ${UNPACKDIR}/usbgx.default ${D}${sysconfdir}/default/usbgx
 }
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index a20ff4eeab..bc40f029cd 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -38,17 +38,17 @@ INITSCRIPT_PARAMS = "defaults"
 INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '1', '0', d)}"
 
 do_install:append() {
-    install -Dm 0755 ${WORKDIR}/gadget-start ${D}${bindir}/gadget-start
+    install -Dm 0755 ${UNPACKDIR}/gadget-start ${D}${bindir}/gadget-start
     sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-start
-    install -m 0755 ${WORKDIR}/gadget-start ${D}${bindir}/gadget-stop
+    install -m 0755 ${UNPACKDIR}/gadget-start ${D}${bindir}/gadget-stop
     sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-stop
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/usbgx.service ${D}${systemd_system_unitdir}/usbgx.service
+        install -Dm 0644 ${UNPACKDIR}/usbgx.service ${D}${systemd_system_unitdir}/usbgx.service
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -Dm 0755 ${WORKDIR}/usbgx.initd ${D}${sysconfdir}/init.d/usbgx
+        install -Dm 0755 ${UNPACKDIR}/usbgx.initd ${D}${sysconfdir}/init.d/usbgx
     fi
 }
 
diff --git a/meta-oe/recipes-support/links/links-x11_2.26.bb b/meta-oe/recipes-support/links/links-x11_2.26.bb
index 4c8d935ccf..713919bca1 100644
--- a/meta-oe/recipes-support/links/links-x11_2.26.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.26.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = "--enable-graphics \
 
 do_install:append() {
     install -d ${D}/${datadir}/applications
-    install -m 0644 ${WORKDIR}/links2.desktop ${D}/${datadir}/applications
+    install -m 0644 ${UNPACKDIR}/links2.desktop ${D}/${datadir}/applications
     install -d ${D}/${datadir}/pixmaps
-    install -m 0644 ${WORKDIR}/links2.png ${D}/${datadir}/pixmaps
+    install -m 0644 ${UNPACKDIR}/links2.png ${D}/${datadir}/pixmaps
 }
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
index c675d3ded8..200457c693 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
@@ -17,7 +17,7 @@ CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
 do_install:append() {
     # Install machine specific configuration file
     install -d ${D}${sysconfdir}/lvm
-    install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
+    install -m 0644 ${UNPACKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
     # We don't want init scripts/systemd units for native SDK utilities
     if [ "${PN}" != "nativesdk-lvm2" ]; then
diff --git a/meta-oe/recipes-support/monit/monit_5.33.0.bb b/meta-oe/recipes-support/monit/monit_5.33.0.bb
index 66d4079a94..9d7b358381 100644
--- a/meta-oe/recipes-support/monit/monit_5.33.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.33.0.bb
@@ -45,12 +45,12 @@ do_configure:prepend() {
 do_install:append() {
 
     # Configuration file
-    install -Dm 0600 ${WORKDIR}/monitrc ${D}${sysconfdir}/monitrc
+    install -Dm 0600 ${UNPACKDIR}/monitrc ${D}${sysconfdir}/monitrc
 
     # SystemD
     install -Dm 0644 ${S}/system/startup/monit.service.in ${D}${systemd_system_unitdir}/monit.service
     sed -i -e 's,@prefix@,${exec_prefix},g' ${D}${systemd_unitdir}/system/monit.service
 
     # SysV
-    install -Dm 0755 ${WORKDIR}/monit ${D}${sysconfdir}/init.d/monit
+    install -Dm 0755 ${UNPACKDIR}/monit ${D}${sysconfdir}/init.d/monit
 }
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
index e9f01bd1fe..374cda3b4e 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
@@ -91,14 +91,14 @@ do_install() {
     #
     if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)};then
         install -d ${D}${sysconfdir}/init.d
-        cp ${WORKDIR}/multipathd.oe ${D}${sysconfdir}/init.d/multipathd
+        cp ${UNPACKDIR}/multipathd.oe ${D}${sysconfdir}/init.d/multipathd
     fi
 
     sed -i "s:/usr/lib/udev/kpartx_id:${nonarch_base_libdir}/udev/kpartx_id:g" \
         ${D}${nonarch_base_libdir}/udev/rules.d/11-dm-mpath.rules
 
     install -d ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/multipath.conf.example \
+    install -m 0644 ${UNPACKDIR}/multipath.conf.example \
     ${D}${sysconfdir}/multipath.conf.example
 }
 
diff --git a/meta-oe/recipes-support/nspr/nspr_4.35.bb b/meta-oe/recipes-support/nspr/nspr_4.35.bb
index f8d329398b..abd750b138 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.35.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.35.bb
@@ -171,7 +171,7 @@ do_compile:append() {
 }
 
 do_install:append() {
-    install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
+    install -D ${UNPACKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
     sed -i  \
     -e 's:NSPRVERSION:${PV}:g' \
     -e 's:OEPREFIX:${prefix}:g' \
diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
index 01501362e2..0ceefb5e3e 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -224,7 +224,7 @@ do_install:append() {
     done
 
     install -d ${D}${libdir}/pkgconfig/
-    sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
+    sed 's/%NSS_VERSION%/${PV}/' ${UNPACKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
     sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
     sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
     sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
@@ -239,9 +239,9 @@ do_install:append:class-target() {
     # databases by:
     # certutil -N -d sql:/database/path/ --empty-password
     install -d ${D}${sysconfdir}/pki/nssdb/
-    install -m 0644 ${WORKDIR}/blank-cert9.db ${D}${sysconfdir}/pki/nssdb/cert9.db
-    install -m 0644 ${WORKDIR}/blank-key4.db ${D}${sysconfdir}/pki/nssdb/key4.db
-    install -m 0644 ${WORKDIR}/system-pkcs11.txt ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
+    install -m 0644 ${UNPACKDIR}/blank-cert9.db ${D}${sysconfdir}/pki/nssdb/cert9.db
+    install -m 0644 ${UNPACKDIR}/blank-key4.db ${D}${sysconfdir}/pki/nssdb/key4.db
+    install -m 0644 ${UNPACKDIR}/system-pkcs11.txt ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
 }
 
 PACKAGE_WRITE_DEPS += "nss-native"
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 4a1a0f568d..e4b99089f5 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -62,7 +62,7 @@ do_install () {
     install -d ${D}${sysconfdir}
     # fix up hardcoded paths
     sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
-        ${WORKDIR}/openct.service ${WORKDIR}/openct.init
+        ${UNPACKDIR}/openct.service ${UNPACKDIR}/openct.init
 
     oe_runmake install DESTDIR=${D}
     install -dm 755 ${D}${libdir}/ctapi/
@@ -70,11 +70,11 @@ do_install () {
     install -Dpm 644 etc/openct.udev ${D}${nonarch_libdir}/udev/rules.d/60-openct.rules
     install -pm 644 etc/openct.conf ${D}${sysconfdir}/openct.conf
 
-    install -Dpm 755 ${WORKDIR}/openct.init ${D}${sysconfdir}/init.d/openct
-    install -Dpm 644 ${WORKDIR}/openct.sysconfig ${D}${sysconfdir}/sysconfig/openct
+    install -Dpm 755 ${UNPACKDIR}/openct.init ${D}${sysconfdir}/init.d/openct
+    install -Dpm 644 ${UNPACKDIR}/openct.sysconfig ${D}${sysconfdir}/sysconfig/openct
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/openct.service ${D}${systemd_unitdir}/system
+    install -m 644 ${UNPACKDIR}/openct.service ${D}${systemd_unitdir}/system
 
     so=$(find ${D} -name \*.so | sed "s|^${D}||")
     sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.7.bb b/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
index e807fdef16..c229667d68 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
@@ -160,7 +160,7 @@ FILES:${PN}-dbg += "${libexecdir}/openldap/.debug"
 
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d
-    cat ${WORKDIR}/initscript > ${D}${sysconfdir}/init.d/openldap
+    cat ${UNPACKDIR}/initscript > ${D}${sysconfdir}/init.d/openldap
     chmod 755 ${D}${sysconfdir}/init.d/openldap
     # This is duplicated in /etc/openldap and is for slapd
     rm -f ${D}${localstatedir}/openldap-data/DB_CONFIG.example
@@ -177,7 +177,7 @@ do_install:append() {
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/slapd.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${UNPACKDIR}/slapd.service ${D}${systemd_unitdir}/system/
     sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*.service
 
     # Uses mdm as the database
diff --git a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
index 6a93b2ec90..10545b65ea 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
@@ -52,7 +52,7 @@ RDEPENDS:${PN}-testsuite += "${PN} bash perl"
 RDEPENDS:python3-${PN} += "${PN} python3"
 
 do_configure:prepend () {
-    cp ${WORKDIR}/config.linux ${B}
+    cp ${UNPACKDIR}/config.linux ${B}
     rm -rf ${S}/include/pcp/configsz.h
     rm -rf ${S}/include/pcp/platformsz.h
     export SED=${TMPDIR}/hosttools/sed
diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
index eed21ad54a..5433659af4 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
@@ -30,7 +30,7 @@ do_compile() {
 do_install() {
     oe_runmake install DESTDIR=${D} prefix=${prefix} datadir=${datadir}
     install -d ${D}${datadir}/poppler/cMap
-    install -m644 ${WORKDIR}/Identity-* ${D}${datadir}/poppler/cMap/
+    install -m644 ${UNPACKDIR}/Identity-* ${D}${datadir}/poppler/cMap/
 }
 
 FILES:${PN} += "${datadir}"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
index 2c6cc79ddb..ab4a8d1825 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
@@ -77,12 +77,12 @@ do_configure:prepend() {
 do_install:append() {
     install -d ${D}${sysconfdir}/${BPN}
     install -d ${D}${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
+    install -m 755 ${UNPACKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
 
     install -d ${D}${sysconfdir}/default/volatiles/
-    install -m 644 ${WORKDIR}/volatiles.03_syslog-ng ${D}${sysconfdir}/default/volatiles/03_syslog-ng
+    install -m 644 ${UNPACKDIR}/volatiles.03_syslog-ng ${D}${sysconfdir}/default/volatiles/03_syslog-ng
     install -d ${D}${sysconfdir}/tmpfiles.d/
-    install -m 644 ${WORKDIR}/syslog-ng-tmp.conf ${D}${sysconfdir}/tmpfiles.d/syslog-ng.conf
+    install -m 644 ${UNPACKDIR}/syslog-ng-tmp.conf ${D}${sysconfdir}/tmpfiles.d/syslog-ng.conf
 
     install -d ${D}${localstatedir}/lib/${BPN}
     # Remove /var/run as it is created on startup
@@ -94,7 +94,7 @@ do_install:append() {
 
     # support for systemd
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -m 644 ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
+        install -m 644 ${UNPACKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
 
         install -d ${D}${systemd_unitdir}/system/
         install -m 644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
@@ -107,7 +107,7 @@ do_install:append() {
         install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
         ln -sf ../${BPN}@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/${BPN}@default.service
     else
-        install -m 644 ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
+        install -m 644 ${UNPACKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
     fi
 
     oe_multilib_header syslog-ng/syslog-ng-config.h
diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 7970cd953f..0c8a10e0ef 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=4b11b5cbb0a24df9f4e7db63db98f22f"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/license.txt;md5=4b11b5cbb0a24df9f4e7db63db98f22f"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
@@ -16,7 +16,7 @@ do_configure[noexec] = "1"
 
 do_install() {
     install -d ${D}${datadir}/unicode
-    cp -rf ${WORKDIR}/ucd ${D}${datadir}/unicode
+    cp -rf ${UNPACKDIR}/ucd ${D}${datadir}/unicode
 }
 
 FILES:${PN} = "${datadir}/unicode/ucd"
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
index eebbe202fc..47f616e990 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
@@ -1,7 +1,7 @@
 SUMMARY = "VirtualBox Linux Guest Drivers"
 SECTION = "core"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/${VBOX_NAME}/COPYING;md5=fff5fe1c81dd6dc3d522e7862e44881e"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/${VBOX_NAME}/COPYING;md5=fff5fe1c81dd6dc3d522e7862e44881e"
 
 DEPENDS = "virtual/kernel"
 
@@ -33,14 +33,14 @@ do_export_sources[depends] += "virtual/kernel:do_shared_workdir"
 
 do_export_sources() {
     mkdir -p "${S}"
-    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh ${T}/vbox_modules.tar.gz
+    ${UNPACKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh ${T}/vbox_modules.tar.gz
     tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
 
     # add a mount utility to use shared folder from VBox Addition Source Code
     mkdir -p "${S}/utils"
-    install ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/mount.vboxsf.c ${S}/utils
-    install ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/vbsfmount.c ${S}/utils
-    install ${S}/../Makefile.utils ${S}/utils/Makefile
+    install ${UNPACKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/mount.vboxsf.c ${S}/utils
+    install ${UNPACKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/vbsfmount.c ${S}/utils
+    install ${UNPACKDIR}/Makefile.utils ${S}/utils/Makefile
 
     # some kernel versions have issues with stdarg.h and compatibility with
     # the sysroot and libc-headers/uapi. If we include the file directly from
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
index b839a68294..c1b75e6138 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
@@ -66,7 +66,7 @@ do_install:append() {
 	install -d ${D}${sysconfdir}/sysconfig/xrdp
 	install -m 0644 ${S}/instfiles/*.ini ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/keygen/openssl.conf ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${WORKDIR}/xrdp.sysconfig ${D}${sysconfdir}/sysconfig/xrdp/
+	install -m 0644 ${UNPACKDIR}/xrdp.sysconfig ${D}${sysconfdir}/sysconfig/xrdp/
 	chown xrdp:xrdp ${D}${sysconfdir}/xrdp
 }
 
diff --git a/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb b/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb
index 25c379590f..fce5a5b408 100644
--- a/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb
@@ -8,7 +8,7 @@ data."
 HOMEPAGE = "https://github.com/cloudpipe/cloudpickle"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE.cloudpickle;md5=b4d59aa5e2cc777722aac17841237931"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE.cloudpickle;md5=b4d59aa5e2cc777722aac17841237931"
 
 inherit pypi python_flit_core
 
diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb b/meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb
index 6b31d0b4f5..a6c3e139b8 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb
@@ -22,7 +22,7 @@ addtask do_patchbuild after do_patch before do_configure
 
 do_patchbuild () {
 	rm -f ${S}/CMakeLists.txt
-	cp ${WORKDIR}/CMakeLists.txt ${S}/
+	cp ${UNPACKDIR}/CMakeLists.txt ${S}/
 }
 
 do_install:append () {
diff --git a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
index 237713bf12..ff9d7dd552 100644
--- a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/linjackson78/jstyleson"
 SRC_URI += " file://LICENSE "
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=d97b96c7337934ee448ffd4392f32079"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=d97b96c7337934ee448ffd4392f32079"
 
 PYPI_PACKAGE_EXT = "tar.gz"
 
diff --git a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
index e119a0f11a..a952722619 100644
--- a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 
 SRC_URI += " file://LICENSE "
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=497c556f42b1355b64190da2f3d88f93"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=497c556f42b1355b64190da2f3d88f93"
 
 SRC_URI[sha256sum] = "f7f39c583fd92027bd9d06127b259aee7a5b7945c1f1fa56263811e1e766996d"
 
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += "\
     python3-setuptools \
     "
 
-BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
index 06b08e78a3..e104e1c0ce 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
@@ -28,6 +28,6 @@ do_install:append() {
 	install -d ${D}${sysconfdir}/supervisor
 	install -d ${D}${systemd_system_unitdir}
 
-	install -m 0644 ${WORKDIR}/supervisord.conf ${D}${sysconfdir}/supervisor
-	install -m 0644 ${WORKDIR}/supervisor.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${UNPACKDIR}/supervisord.conf ${D}${sysconfdir}/supervisor
+	install -m 0644 ${UNPACKDIR}/supervisor.service ${D}${systemd_system_unitdir}
 }
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
index b96e8b4e17..14891ea89b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
@@ -86,7 +86,7 @@ do_configure:prepend() {
 do_install:append:class-target() {
     install -d ${D}/${sysconfdir}/init.d
 
-    cat ${WORKDIR}/init | \
+    cat ${UNPACKDIR}/init | \
         sed -e 's,/usr/sbin/,${sbindir}/,g' \
             -e 's,/usr/bin/,${bindir}/,g' \
             -e 's,/usr/lib/,${libdir}/,g' \
@@ -130,15 +130,15 @@ do_install:append:class-target() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d/
-        install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0644 ${UNPACKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/apache2.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
     elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
+        install -m 0644 ${UNPACKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
     rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index 2e848eaf56..1111ef6f56 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -37,9 +37,9 @@ EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
 
 do_install:append() {
     # Copy over init script and sed in the correct sbin path
-    sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
+    sed -i 's,sed_sbin_path,${sbindir},' ${UNPACKDIR}/hiawatha-init
     mkdir -p ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
+    install -m 0755 ${UNPACKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
 
     # configure php-fcgi to have a working configuration
     # by default if php is installed
@@ -47,7 +47,7 @@ do_install:append() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
+        install -m 644 ${UNPACKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
     fi
 
     # /var/log/hiawatha and /var/lib/hiawatha needs to be created in runtime.
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index ee5dc16198..5bf6373a81 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -46,7 +46,7 @@ do_configure:append() {
 do_install:append() {
     rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/run ${D}${localstatedir}/log
     rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
-    install -Dm 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
+    install -Dm 0755 ${UNPACKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
     # Create /var/log/monkey in runtime.
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
         install -d ${D}${nonarch_libdir}/tmpfiles.d
@@ -57,7 +57,7 @@ do_install:append() {
         echo "d ${BPN} ${BPN} 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -Dm 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system/monkey.service
+        install -Dm 644 ${UNPACKDIR}/monkey.service ${D}/${systemd_unitdir}/system/monkey.service
     fi
 }
 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 83ae90c40c..2714c3d22f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -108,24 +108,24 @@ do_install () {
     chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
 
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
+    install -m 0755 ${UNPACKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
     sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${sysconfdir}/init.d/nginx
     sed -i 's,/etc/,${sysconfdir}/,g'  ${D}${sysconfdir}/init.d/nginx
 
     install -d ${D}${sysconfdir}/nginx
-    install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
+    install -m 0644 ${UNPACKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
     sed -i 's,/etc/,${sysconfdir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
     sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
     sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/nginx.conf
-    install -Dm 0644 ${WORKDIR}/default_server.site ${D}${sysconfdir}/nginx/sites-available/default_server
+    install -Dm 0644 ${UNPACKDIR}/default_server.site ${D}${sysconfdir}/nginx/sites-available/default_server
     sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/sites-available/default_server
     install -d ${D}${sysconfdir}/nginx/sites-enabled
     ln -s ../sites-available/default_server ${D}${sysconfdir}/nginx/sites-enabled/
 
-    install -m 0644 ${WORKDIR}/proxy_params ${D}${sysconfdir}/nginx/proxy_params
+    install -m 0644 ${UNPACKDIR}/proxy_params ${D}${sysconfdir}/nginx/proxy_params
 
     install -d ${D}${sysconfdir}/default/volatiles
-    install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
+    install -m 0644 ${UNPACKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
     sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatiles/99_nginx
     sed -i 's,@NGINX_USER@,${NGINX_USER},g' ${D}${sysconfdir}/default/volatiles/99_nginx
 
@@ -140,7 +140,7 @@ do_install () {
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/system/
+        install -m 0644 ${UNPACKDIR}/nginx.service ${D}${systemd_unitdir}/system/
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
             -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
             -e 's,@SBINDIR@,${sbindir},g' \
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 601ec7bcd1..ec188cc482 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -37,14 +37,14 @@ do_configure:prepend () {
 
 do_install:append () {
     install -d ${D}${sysconfdir}/init.d
-    install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/thttpd
-    install -c -m 755 ${WORKDIR}/thttpd.conf ${D}${sysconfdir}
+    install -c -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/thttpd
+    install -c -m 755 ${UNPACKDIR}/thttpd.conf ${D}${sysconfdir}
     sed -i -e 's,@@CONFFILE,${sysconfdir}/thttpd.conf,g' ${D}${sysconfdir}/init.d/thttpd
     sed -i -e 's,@@SRVDIR,${SRV_DIR},g' ${D}${sysconfdir}/thttpd.conf
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/thttpd
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/thttpd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/thttpd.service ${D}${systemd_unitdir}/system
     sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
     sed -i 's!/var/!${localstatedir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
     sed -i -e 's,@@CONFFILE,${sysconfdir}/thttpd.conf,g' ${D}${systemd_unitdir}/system/thttpd.service
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
index 34b710e885..7c3810154f 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
@@ -28,7 +28,7 @@ do_install() {
     rm -rf ${D}${datadir}/${BPN}/patches
 
     install -d ${D}${sysconfdir}/apache2/conf.d
-    install -m 0644 ${WORKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf
+    install -m 0644 ${UNPACKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf
 
     # Remove a few scripts that explicitly require bash (!)
     rm -f ${D}${datadir}/phpmyadmin/libraries/transformations/*.sh
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
index 700c6b2346..b06a5df314 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
@@ -55,13 +55,13 @@ do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         # Install systemd unit files
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/netdata.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/netdata.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@@datadir,${datadir_native},g' ${D}${systemd_unitdir}/system/netdata.service
     fi
 
     # Install default netdata.conf
     install -d ${D}${sysconfdir}/netdata
-    install -m 0644 ${WORKDIR}/netdata.conf ${D}${sysconfdir}/netdata/
+    install -m 0644 ${UNPACKDIR}/netdata.conf ${D}${sysconfdir}/netdata/
     sed -i -e 's,@@sysconfdir,${sysconfdir},g' ${D}${sysconfdir}/netdata/netdata.conf
     sed -i -e 's,@@libdir,${libexecdir},g' ${D}${sysconfdir}/netdata/netdata.conf
     sed -i -e 's,@@datadir,${datadir},g' ${D}${sysconfdir}/netdata/netdata.conf
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index 35ec09daea..bbc59443c7 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -82,7 +82,7 @@ do_install() {
     install -m 0755 webmin-init ${D}${sysconfdir}/init.d/webmin
 
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/webmin.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${UNPACKDIR}/webmin.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
            ${D}${systemd_unitdir}/system/webmin.service
 
@@ -117,7 +117,7 @@ do_install() {
     export atboot=1
     export no_pam=1
     mkdir -p $tempdir
-    ${S}/../setup.sh
+    ${UNPACKDIR}/setup.sh
 
     # Ensure correct PERLLIB path
     sed -i -e 's#${D}##g' ${D}${sysconfdir}/webmin/start
-- 
2.45.1


