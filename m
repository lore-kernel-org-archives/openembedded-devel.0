Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326F7C43217
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:33 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.4978.1646383828847614482
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gYGxQnfB;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id cx5so6844367pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aLR3kiy+I7I1DT3ldPVUC+jghdWDF0hyjAlrwoX0yxA=;
        b=gYGxQnfB8I8LDg42PIy8UeE0qPDtlic446YLFONGRq+dcuhMI/DpD7PX8uNJmiDsV/
         ef6TMsAPk4JXv3hWcWW0/kwU/izQY5R2ncMl+FCeu7T/ag7ryTnL0PaWkuabKUr8S4HQ
         WJLnO0iGpjn1wbuGTTN9L0gDJnb5iGz2vLB7dKf2yp2FM4zrJdPlNuKU++ZlOQYPKhrj
         DUmz3zSIyLxCTiOtza1io178JQ4gsHlXX15r0RyLIx3AsWJCB5HsJvvEA4upj5EhTHHe
         d6EtcZYVJAwhF3ggIO3hG8zKW5TPEy0VMnWWTxoSCYJ5B/toqFSOvW+0W5BUp9WMqSL1
         n9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aLR3kiy+I7I1DT3ldPVUC+jghdWDF0hyjAlrwoX0yxA=;
        b=w6/IgwH9yBSl9S0CWvtEZ6xnXXKVE2ijYI+2MuQ+aj2/FaRF6mWqvUkGgoFnHIlj7l
         ffM/FAdQkEOn4BEYTKdBIys5a04YQRscTT8o3hNqMRtsIyZiyTzSWVwwZ2RFGPeZNTrY
         zU1T9pF17OMUFZwRFPBjRpG2bJKJYGRGyCG29w9dfShYIRryRPX8P2MZQoRe8r4G6/Pe
         DY8ktJhwR1EpjcV/ony7leWPMtXpMEt+cfrEbpDaIwnJk7mUpFrM5sJf9pnQKrmrUimV
         O5mVdFU7AQrh0VUhk5g1Prp5rAFQmsvme2R5vkXx3zPdSDvbybPJPdevfziOtdPFnVgx
         Ki6w==
X-Gm-Message-State: AOAM532ouloJ8B2jIBsP1ItEQqexxJ/jKckgO4+6fCjkcB1zqoAOhCru
	AuX3im3pKzEdjGRMKLE2PBrfdWBulhuflQ==
X-Google-Smtp-Source: 
 ABdhPJwldp3dyO8BZV7DWv33lk3K+xB98oU4c6vxam8uepYL+DmmNju2lQEkwYdxMW/LGfuKg4h5RQ==
X-Received: by 2002:a17:902:dad2:b0:151:a546:db2 with SMTP id
 q18-20020a170902dad200b00151a5460db2mr9397843plx.0.1646383826646;
        Fri, 04 Mar 2022 00:50:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/10] recipes: Update LICENSE variable to
 use SPDX license identifiers
Date: Fri,  4 Mar 2022 00:50:14 -0800
Message-Id: <20220304085018.1255075-6-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/95773

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb | 2 +-
 .../recipes-connectivity/blueman/blueman_2.2.3.bb         | 2 +-
 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb | 2 +-
 .../recipes-connectivity/cannelloni/cannelloni_1.0.0.bb   | 2 +-
 meta-networking/recipes-connectivity/daq/daq_2.0.7.bb     | 2 +-
 .../recipes-connectivity/dibbler/dibbler_git.bb           | 2 +-
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb                   | 2 +-
 .../recipes-connectivity/firewalld/firewalld_0.9.4.bb     | 2 +-
 .../recipes-connectivity/freeradius/freeradius_3.0.21.bb  | 2 +-
 meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb   | 2 +-
 .../recipes-connectivity/libiec61850/libiec61850_1.5.0.bb | 2 +-
 .../recipes-connectivity/nanomsg/nanomsg_1.1.5.bb         | 2 +-
 .../recipes-connectivity/netplan/netplan_0.104.bb         | 2 +-
 .../networkmanager/networkmanager-openvpn_1.8.16.bb       | 2 +-
 .../recipes-connectivity/openconnect/openconnect_8.20.bb  | 2 +-
 meta-networking/recipes-connectivity/rdate/rdate_1.5.bb   | 2 +-
 meta-networking/recipes-connectivity/relayd/relayd_git.bb | 2 +-
 .../recipes-connectivity/samba/samba_4.14.12.bb           | 2 +-
 .../recipes-connectivity/sethdlc/sethdlc_1.18.bb          | 2 +-
 .../recipes-connectivity/snort/snort_2.9.19.bb            | 2 +-
 meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb    | 2 +-
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb     | 2 +-
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb   | 2 +-
 .../recipes-connectivity/wolfssl/wolfssl_5.2.0.bb         | 2 +-
 meta-networking/recipes-daemons/atftp/atftp_0.7.5.bb      | 2 +-
 meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb    | 2 +-
 .../recipes-daemons/igmpproxy/igmpproxy_0.3.bb            | 2 +-
 meta-networking/recipes-daemons/ippool/ippool_1.3.bb      | 2 +-
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb  | 2 +-
 .../recipes-daemons/keepalived/keepalived_2.2.2.bb        | 2 +-
 .../networkd-dispatcher/networkd-dispatcher_2.1.bb        | 2 +-
 .../recipes-daemons/opensaf/opensaf_5.22.01.bb            | 2 +-
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb | 2 +-
 .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb         | 2 +-
 meta-networking/recipes-daemons/squid/squid_4.15.bb       | 2 +-
 meta-networking/recipes-daemons/vblade/vblade_25.bb       | 2 +-
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb    | 2 +-
 .../recipes-devtools/python/python3-ldap_3.4.0.bb         | 2 +-
 .../recipes-devtools/python/python3-scapy_2.4.5.bb        | 2 +-
 meta-networking/recipes-extended/dlm/dlm_4.0.9.bb         | 2 +-
 .../recipes-extended/kronosnet/kronosnet_1.22.bb          | 2 +-
 .../arno-iptables-firewall_2.1.1.bb                       | 2 +-
 .../conntrack-tools/conntrack-tools_1.4.6.bb              | 2 +-
 .../recipes-filter/ebtables/ebtables_2.0.11.bb            | 2 +-
 meta-networking/recipes-filter/ipset/ipset_7.15.bb        | 2 +-
 .../libnetfilter/libnetfilter-acct_1.0.3.bb               | 2 +-
 .../libnetfilter/libnetfilter-conntrack_1.0.8.bb          | 2 +-
 .../libnetfilter/libnetfilter-cthelper_1.0.0.bb           | 2 +-
 .../libnetfilter/libnetfilter-cttimeout_1.0.0.bb          | 2 +-
 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb | 2 +-
 .../libnetfilter/libnetfilter-queue_1.0.5.bb              | 2 +-
 .../recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb     | 2 +-
 meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb | 2 +-
 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb     | 2 +-
 meta-networking/recipes-filter/nftables/nftables_1.0.1.bb | 2 +-
 meta-networking/recipes-irc/weechat/weechat_3.4.bb        | 2 +-
 meta-networking/recipes-irc/znc/znc_1.8.2.bb              | 2 +-
 meta-networking/recipes-kernel/wireguard/wireguard.inc    | 2 +-
 .../recipes-protocols/nopoll/nopoll_0.4.6.b400.bb         | 2 +-
 meta-networking/recipes-protocols/openflow/openflow.inc   | 2 +-
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb            | 2 +-
 .../recipes-protocols/openlldp/openlldp_1.0.1.bb          | 2 +-
 .../recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb     | 2 +-
 meta-networking/recipes-protocols/quagga/quagga.inc       | 2 +-
 .../recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb           | 2 +-
 .../recipes-protocols/tsocks/tsocks_1.8beta5.bb           | 2 +-
 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb | 2 +-
 .../recipes-protocols/zeroconf/zeroconf_0.9.bb            | 2 +-
 meta-networking/recipes-support/aoetools/aoetools_36.bb   | 2 +-
 .../recipes-support/arptables/arptables_git.bb            | 2 +-
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb    | 2 +-
 meta-networking/recipes-support/chrony/chrony_4.2.bb      | 2 +-
 meta-networking/recipes-support/cifs/cifs-utils_6.14.bb   | 2 +-
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc       | 2 +-
 meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb | 2 +-
 meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb | 2 +-
 meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb     | 2 +-
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb        | 2 +-
 .../recipes-support/ettercap/ettercap_0.8.3.1.bb          | 2 +-
 .../recipes-support/fetchmail/fetchmail_6.4.23.bb         | 2 +-
 meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb   | 2 +-
 meta-networking/recipes-support/geoip/geoip-perl_1.51.bb  | 2 +-
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb     | 2 +-
 .../recipes-support/geoip/geoipupdate_2.5.0.bb            | 2 +-
 meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb  | 2 +-
 .../recipes-support/ifenslave/ifenslave_2.13.bb           | 2 +-
 meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb  | 2 +-
 meta-networking/recipes-support/iftop/iftop_1.0pre4.bb    | 2 +-
 meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb    | 2 +-
 meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb   | 2 +-
 .../recipes-support/libesmtp/libesmtp_1.1.0.bb            | 2 +-
 meta-networking/recipes-support/libldb/libldb_2.3.2.bb    | 2 +-
 .../recipes-support/libtalloc/libtalloc_2.3.3.bb          | 2 +-
 meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb    | 2 +-
 .../recipes-support/libtevent/libtevent_0.10.2.bb         | 2 +-
 .../recipes-support/linux-atm/linux-atm_2.5.2.bb          | 2 +-
 .../recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb   | 2 +-
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb      | 2 +-
 .../recipes-support/macchanger/macchanger_1.7.0.bb        | 2 +-
 meta-networking/recipes-support/mctp/mctp_git.bb          | 2 +-
 meta-networking/recipes-support/mtr/mtr_0.95.bb           | 2 +-
 meta-networking/recipes-support/nbd/nbd_3.20.bb           | 2 +-
 meta-networking/recipes-support/ncp/libowfat_0.32.bb      | 2 +-
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb          | 2 +-
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb      | 2 +-
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb    | 2 +-
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb      | 2 +-
 .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb      | 2 +-
 meta-networking/recipes-support/nis/nis.inc               | 2 +-
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb        | 2 +-
 meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb    | 2 +-
 meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb    | 2 +-
 .../recipes-support/open-isns/open-isns_0.101.bb          | 2 +-
 .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb | 8 ++++----
 .../recipes-support/openipmi/openipmi_2.0.32.bb           | 2 +-
 meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb  | 2 +-
 meta-networking/recipes-support/phytool/phytool.bb        | 2 +-
 .../recipes-support/rdma-core/rdma-core_39.0.bb           | 2 +-
 meta-networking/recipes-support/ruli/ruli_0.36.bb         | 2 +-
 .../recipes-support/smcroute/smcroute_2.5.4.bb            | 2 +-
 meta-networking/recipes-support/spice/spice_git.bb        | 2 +-
 meta-networking/recipes-support/spice/usbredir_0.9.0.bb   | 2 +-
 meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb       | 2 +-
 .../recipes-support/strongswan/strongswan_5.9.4.bb        | 2 +-
 meta-networking/recipes-support/stunnel/stunnel_5.59.bb   | 2 +-
 .../recipes-support/tcpreplay/tcpreplay_4.4.1.bb          | 2 +-
 .../recipes-support/tinyproxy/tinyproxy_1.11.0.bb         | 2 +-
 .../recipes-support/traceroute/traceroute_2.1.0.bb        | 2 +-
 meta-networking/recipes-support/tunctl/tunctl.inc         | 2 +-
 meta-networking/recipes-support/uftp/uftp_5.0.bb          | 2 +-
 meta-networking/recipes-support/vnstat/vnstat_2.6.bb      | 2 +-
 .../recipes-support/wireshark/wireshark_3.4.11.bb         | 2 +-
 132 files changed, 135 insertions(+), 135 deletions(-)

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
index 074292b43b..b9fefa8589 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master \
 
 S = "${WORKDIR}/git"
 
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit autotools xmlcatalog
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.2.3.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.2.3.bb
index df496c3683..a16bcf77a5 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.2.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.2.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index 9bf2eed78b..ba5d9ac0e6 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python interface to Bluetooth LE on Linux"
 HOMEPAGE = "https://github.com/IanHarvey/bluepy"
 SECTION = "devel/python"
-LICENSE = "GPLv2 & PD"
+LICENSE = "GPL-2.0-only & PD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=59e0d45ea684dda215889aa1b5acd001"
 DEPENDS = "glib-2.0"
 SRCREV = "7ad565231a97c304c0eff45f2649cd005e69db09"
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
index 86b6577721..f34c73c173 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "a SocketCAN over Ethernet tunnel"
 HOMEPAGE = "https://github.com/mguentner/cannelloni"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master"
 SRCREV = "0bd7e27db35bdef361226882ae04205504f7b2f4"
diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
index 8e5ee66a2a..14d809f518 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The dump DAQ test the various inline mode features "
 HOMEPAGE = "http://www.snort.org"
 SECTION = "libs"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
 
 PARALLEL_MAKE = ""
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
index 8c74c3954e..bdda35a24b 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dibbler DHCPv6 client"
 DESCRIPTION = "Dibbler is a portable DHCPv6 implementation. It supports stateful as well as stateless autoconfiguration for IPv6."
 HOMEPAGE = "http://klub.com.pl/dhcpv6"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7236695bb6d4461c105d685a8b61c4e3"
 
 SRCREV = "a7c6cf58a88a510cb00841351e75030ce78d36bf"
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
index 51e220c9e7..8648f2e0e6 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "daemon that sends updates when your IP changes"
 HOMEPAGE = "http://sourceforge.net/projects/ez-ipupdate/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7783169b4be06b54e86730eb01bc3a31"
 
 SRC_URI = "http://sourceforge.net/projects/ez-ipupdate/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
index 7d29bf1ed0..1dea339535 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dynamic firewall daemon with a D-Bus interface"
 HOMEPAGE = "https://firewalld.org/"
 BUGTRACKER = "https://github.com/firewalld/firewalld/issues"
 UPSTREAM_CHECK_URI = "https://github.com/firewalld/firewalld/releases"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index 3e5cca6405..da7e60419e 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -9,7 +9,7 @@ done when adding or deleting new users."
 SUMMARY = "High-performance and highly configurable RADIUS server"
 HOMEPAGE = "http://www.freeradius.org/"
 SECTION = "System/Servers"
-LICENSE = "GPLv2 & LGPLv2+"
+LICENSE = "GPL-2.0-only & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
 
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
index 9b64388a0f..bf3e18dce7 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "LFTP is a sophisticated file transfer program with \
                FISH, SFTP, HTTPS and FTPS protocols"
 HOMEPAGE = "http://lftp.yar.ru/"
 SECTION = "console/network"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
index fa42be62a2..13e0250fa6 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
@@ -10,7 +10,7 @@ library for the IEC 61850/MMS, IEC 61850/GOOSE and IEC \
 written in C. It is available under the GPLv3 license."
 HOMEPAGE = "http://libiec61850.com"
 SECTION = "console/network"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
 SRCREV = "fcefc746fea286aeaa40d2f62240216da81c85e5"
diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
index 3c2ab980e5..005ad726f3 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
@@ -4,7 +4,7 @@ communication patterns. It aims to make the networking layer fast, scalable, \
 and easy to use. Implemented in C, it works on a wide range of operating \
 systems with no further dependencies."
 HOMEPAGE = "https://nanomsg.org/"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 
 SECTION = "libs/networking"
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
index e26649744c..e19fceb4ae 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
@@ -7,7 +7,7 @@ tool."
 HOMEPAGE = "https://netplan.io"
 SECTION = "net/misc"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
index 19cac13458..8951d9cd17 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.16.bb
@@ -1,7 +1,7 @@
 SUMMARY = "NetworkManager-openvpn-plugin"
 SECTION = "net/misc"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100d5a599bead70ddcd70dcd73f2e29c"
 
 DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native glib-2.0-native"
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
index d204481164..022ba85a26 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Open client for Cisco AnyConnect VPN"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=8c2e1ec1540fb3e0beb68361344cba7e"
 
 SRC_URI = " \
diff --git a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
index cd4db12c08..67e7c1c615 100644
--- a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
+++ b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
@@ -8,7 +8,7 @@ DESCRIPTION = "The rdate utility retrieves the date and time from \
 HOMEPAGE= "https://www.aelius.com/njh/rdate/"
 SECTION = "Applications/System"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "https://www.aelius.com/njh/${BPN}/${BP}.tar.gz \
diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 1dd50f6e12..1da18d7ca0 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Layer 3 relay daemon"
 SECTION = "console/network"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab2"
 
 DEPENDS = "libubox"
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
index 84eee44195..dc6e4b5e16 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "https://www.samba.org/"
 SECTION = "console/network"
 
-LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
+LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://${COREBASE}/meta/files/common-licenses/LGPL-3.0-or-later;md5=c51d3eef3be114124d11349ca0d7e117 \
                     file://${COREBASE}/meta/files/common-licenses/GPL-2.0-or-later;md5=fed54355545ffd980b814dab4a3b312c"
diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
index 744e782064..4e3c157713 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "set Linux HDLC packet radio modem driver port information"
 HOMEPAGE = "https://www.kernel.org/pub/linux/utils/net/hdlc"
 SECTION = "comm"
-LICENSE = "GPLv2 & GPLv2+ "
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later "
 LIC_FILES_CHKSUM = "file://sethdlc.c;endline=10;md5=90f936879e9f8b755a138aeb348782eb"
 
 
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.19.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.19.bb
index 9c479d2200..26b335dbd5 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.19.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.19.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "snort - a free lightweight network intrusion detection system for UNIX and Windows."
 HOMEPAGE = "http://www.snort.org/"
 SECTION = "net"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
 DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native libtirpc bison-native"
diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index c6beedf02c..c427e4ffde 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -5,7 +5,7 @@ managing a netfilter firewall. It provides a command line interface and aims \
 to be uncomplicated and easy to use."
 HOMEPAGE = "https://launchpad.net/ufw"
 SECTION = "net"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "https://launchpad.net/ufw/0.36/0.36.1/+download/ufw-0.36.1.tar.gz \
diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
index 8f899e62de..035d4946f1 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -1,7 +1,7 @@
 SUMMARY = "VLAN provides vconfig utility"
 HOMEPAGE = "http://www.candelatech.com/~greear/vlan.html"
 SECTION = "misc"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://vconfig.c;beginline=1;endline=19;md5=094ca47de36c20c598b15b32c270ce0a"
 
 SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/vlan/1.9-3ubuntu10.6/${BPN}_${PV}.orig.tar.gz \
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 421ebaa969..adc2a72eeb 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "A client for the Cisco3000 VPN Concentrator"
 HOMEPAGE = "http://www.unix-ag.uni-kl.de/~massar/vpnc/"
 AUTHOR = "Maurice Massar vpnc@unix-ag.uni-kl.de"
 SECTION = "net"
-LICENSE = "GPL-2.0+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
 
 DEPENDS += "libgcrypt"
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb
index a597fb3ccd..78a24bcddd 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "wolfSSL, formerly CyaSSL, is a lightweight SSL library written \
 HOMEPAGE = "https://www.wolfssl.com/products/wolfssl"
 BUGTRACKER = "https://github.com/wolfssl/wolfssl/issues"
 SECTION = "libs"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PROVIDES += "cyassl"
diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.7.5.bb b/meta-networking/recipes-daemons/atftp/atftp_0.7.5.bb
index 59905b54fe..f893a4d6dc 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.7.5.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.7.5.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Advanced TFTP server and client"
 SECTION = "net"
 HOMEPAGE = "http://packages.debian.org/atftp"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f65159f73e603f89d6867d43191900e5"
 
 SRCREV = "00921e75728e3681b051c2e48c59e36c6cfa2e97"
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
index c41d0e6b93..1f87bddbee 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Kernel based automounter for linux"
 SECTION = "utils"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ee9324a6f564bb2376b63878ac396798"
 
 DEPENDS += "libtirpc flex-native bison-native e2fsprogs openssl libxml2 util-linux cyrus-sasl libnsl2"
diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb
index 119475f25f..e8567ccebf 100644
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "simple dynamic multicast routing daemon that only uses IGMP signalling"
 HOMEPAGE = "http://sourceforge.net/projects/igmpproxy/"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=432040ff3a55670c1dec0c32b209ad69"
 
 SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/${BP}.tar.gz"
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 3ed1767a01..b91ca53682 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -9,7 +9,7 @@ addresses from ippoold. \
 "
 HOMEPAGE = "http://www.openl2tp.org/"
 SECTION = "console/network"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
            file://runtest.sh \
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb
index e85fdd7856..921f7d4883 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb
@@ -5,7 +5,7 @@ provides the server daemon for the iSCSI protocol, as well as the utility \
 programs used to manage it. iSCSI is a protocol for distributed \
 disk access using SCSI commands sent over Internet Protocol networks."
 HOMEPAGE = "http://www.open-iscsi.com/"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 SECTION = "net"
 DEPENDS = "openssl flex-native bison-native open-isns util-linux kmod"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
index d04b73876d..204d2fd116 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
@@ -7,7 +7,7 @@ Server (IPVS) kernel module providing Layer4 loadbalancing \
 "
 HOMEPAGE = "http://www.keepalived.org/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
index 5159cf51e4..e929534c3f 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
@@ -4,7 +4,7 @@ more limited in the types of events it supports due to the limited nature of \
 systemd-networkd(8)."
 AUTHOR = "Clayton Craft and others"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 inherit features_check systemd
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
index b4ee3ed4bd..8ce324d306 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
@@ -11,7 +11,7 @@ Foundation was founded on January 22nd 2008 with Emerson Network Power, \
 Ericsson, Nokia Siemens Networks, HP and Sun Microsystems as founding members."
 HOMEPAGE = "http://www.opensaf.org"
 SECTION = "admin"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
 
 DEPENDS = "libxml2 python3"
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
index cdebd24af1..32faeab4da 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Secure and configurable FTP server"
 SECTION = "net"
 HOMEPAGE = "http://www.proftpd.org"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
 SRCREV = "715eadc1aa4f6b07d69f9d09558e9cb471e51d87"
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
index e29d0633ad..edc2af3a34 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
@@ -2,7 +2,7 @@ SUMMARY = "FTP Server with a strong focus on software security"
 DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and standard-conformant FTP server."
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
-LICENSE = "BSD-0-Clause"
+LICENSE = "0BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a4496a14dea009df36c612707d455d02"
 
 DEPENDS = "libcap virtual/crypt"
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index 5af00d6269..a1122a3cd4 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -7,7 +7,7 @@ enabled by default for simpler installation and high performance. \
 "
 HOMEPAGE = "http://www.squid-cache.org"
 SECTION = "web"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
 MIN_VER = "${@oe.utils.trim_version("${PV}", 2)}"
diff --git a/meta-networking/recipes-daemons/vblade/vblade_25.bb b/meta-networking/recipes-daemons/vblade/vblade_25.bb
index 688add53f5..7c37fc1676 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_25.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_25.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Virtual EtherDrive blade AoE target"
 SECTION = "admin"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/aoetools/files/vblade/"
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index 08238c1a3c..cce3e66adc 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Very Secure FTP server"
 HOMEPAGE = "https://security.appspot.com/vsftpd.html"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
 
 DEPENDS = "libcap openssl"
diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
index 42f113d5f8..4299058315 100644
--- a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "This module provides access to the LDAP \
 instead of C API. The module mainly acts as a wrapper for the \
 OpenLDAP 2.x libraries. Errors will appear as exceptions."
 HOMEPAGE = "http://www.python-ldap.org/"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
 
 DEPENDS = "python3 openldap cyrus-sasl"
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
index 3a1f102dc9..53c2ce3d8e 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
@@ -9,7 +9,7 @@ well at a lot of other specific tasks that most other tools can't handle, like \
 sending invalid frames, injecting your own 802.11 frames, combining technics \
 (VLAN hopping+ARP cache poisoning, VOIP decoding on WEP encrypted channel, ...), etc."
 SECTION = "security"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
index b99c30cc9e..3e699d2ff6 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "d59142e067cbd603aaf66151a04e9fa34330219680b8827c953d20821b
 UPSTREAM_CHECK_URI = "https://pagure.io/dlm/releases"
 UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
 
-LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
+LICENSE = "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
 
 S = "${WORKDIR}/dlm-dlm-${PV}"
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
index 28d740cb41..ad0a00e78a 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
@@ -5,7 +5,7 @@ SUMMARY = "Kronosnet, often referred to as knet, is a network abstraction layer
            designed for High Availability use cases, where redundancy, security, \
            fault tolerance and fast fail-over are the core requirements of your application."
 HOMEPAGE = "https://kronosnet.org/"
-LICENSE = "GPL-2.0+ & LGPL-2.1"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.libraries;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "libs"
diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
index 8b78433d73..bba11a8c64 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "IPTables based firewall scripts"
 HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&view=article&id=45&Itemid=63"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
 SRCREV = "a96b81da4a9b619e4045805f5f13a1e982c95663"
diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
index 0e009da029..de6a72e78a 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Connection tracking userspace tools for Linux"
 SECTION = "net"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 DEPENDS = "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeout \
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index fd837629b5..d522b514f6 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "Filtering tool for a Linux-based bridging firewall"
 HOMEPAGE = "http://sourceforge.net/projects/ebtables/"
 DESCRIPTION = "Utility for basic Ethernet frame filtering on a Linux bridge, \
                advanced logging, MAC DNAT/SNAT and brouting."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
 SECTION = "net"
 
diff --git a/meta-networking/recipes-filter/ipset/ipset_7.15.bb b/meta-networking/recipes-filter/ipset/ipset_7.15.bb
index 7af7dea7a1..0e928a30f8 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.15.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.15.bb
@@ -3,7 +3,7 @@
 
 DESCRIPTION = "Administration tool for IP sets"
 HOMEPAGE = "http://ipset.netfilter.org"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "base"
 
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
index 974035ccc7..d92c676fa9 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "libnetfilter_acct accounting infrastructure."
 DESCRIPTION = "libnetfilter_acct is the userspace library providing interface to extended accounting infrastructure."
 HOMEPAGE = "http://netfilter.org/projects/libnetfilter_acct/index.html"
 SECTION = "libs"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "libnfnetlink libmnl"
 
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb
index cd89433938..180f076039 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Netfilter connection tracking library"
 DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter connection tracking state table"
 HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_conntrack/index.html"
 SECTION = "libs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
index 92cb23d6e9..fea520d439 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Netfilter connection tracking helper library"
 DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter user-space helper infrastructure"
 HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_cthelper/index.html"
 SECTION = "libs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libmnl"
 
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
index ff32f3409d..dc87d9b123 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Netfilter connection tracking timeout library"
 DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter fine-grain connection tracking timeout infrastructure"
 SECTION = "libs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libmnl"
 
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
index 03c0af59ac..699b096ae8 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Netfilter logging library"
 DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter log message (NFLOG)"
 HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_log/index.html"
 SECTION = "libs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 SRCREV = "b0e4be94c0b8f68d4e912402b93a130063c34e17"
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
index f806b0747e..580c29e1ae 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Netfilter packet queue access library"
 DESCRIPTION = "Userspace library providing a programming interface (API) to access the Linux kernel netfilter packet queue"
 HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_queue/index.html"
 SECTION = "libs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
index f7951ff8dd..64271c74d3 100644
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
@@ -6,7 +6,7 @@ nfnetlink_queue, nfnetlink_conntrack) and their respective users and/or \
 management tools in userspace."
 HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
 SECTION = "libs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
index ec4619e7b9..44479638f1 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Library for low-level interaction with nftables Netlink's API over libmnl"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
index 3245455271..20a84121ee 100644
--- a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
+++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "nfacct is the command line tool to create/retrieve/delete accounting objects"
 HOMEPAGE = "http://netfilter.org/projects/nfacct/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.netfilter.org/pub/nfacct/"
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
index 91df1547d9..2c378e8fd9 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Netfilter Tables userspace utillites"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
 
 DEPENDS = "libmnl libnftnl bison-native \
diff --git a/meta-networking/recipes-irc/weechat/weechat_3.4.bb b/meta-networking/recipes-irc/weechat/weechat_3.4.bb
index ca404ebc87..edd88c063a 100644
--- a/meta-networking/recipes-irc/weechat/weechat_3.4.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_3.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Full-featured IRC plugin: multi-servers, proxy support, IPv6, SASL authentication, nicklist, DCC, and many other features"
 HOMEPAE = "https://weechat.org/"
 SECTION = "net"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "openssl zlib icu libgcrypt gnutls curl aspell"
diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
index 724ef0c0d2..1517384eca 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "ZNC, an advanced IRC bouncer"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl zlib icu"
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index a3a7867c23..6fac24e3bd 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -6,7 +6,7 @@ TLS-based solutions like OpenVPN, while being more secure, more performant, \
 and easier to use."
 SECTION = "networking"
 HOMEPAGE = "https://www.wireguard.io/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
index 8c57d29492..816e513a15 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
@@ -7,7 +7,7 @@ noPoll provides support for WebSocket (ws://) and TLS (secure) WebSocket (wss://
 allowing message based (handler notified) programming or stream oriented access."
 
 HOMEPAGE = "http://www.aspl.es/nopoll/"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
                    "
 DEPENDS = "openssl"
diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 7968a44382..15eb65ad32 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -7,7 +7,7 @@ control and forwarding planes of a software-defined networking architecture.\
 HOMEPAGE = "http://www.openflow.org"
 
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 6ce15a282b..15cebf40f1 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.openl2tp.org/"
 SECTION = "net"
 
 # cli and usl use license LGPL-2.1
-LICENSE = "GPL-2.0 & LGPL-2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585 \
                     file://LICENSE;md5=f8970abd5ea9be701a0deedf5afd77a5 \
                     file://cli/LICENSE;md5=9c1387a3c5213aa40671438af3e00793 \
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
index abfa713dc8..acde9c3659 100644
--- a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Open-LLDP"
 DESCRIPTION = "Link Layer Discovery Protocol for Linux that includes support for DCBX"
 HOMEPAGE = "http://open-lldp.org/start"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
 
 S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
index 71046ce24c..0d26c338b9 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "PPTP Client is a Linux, FreeBSD, NetBSD \
     cable and ADSL internet service providers."
 HOMEPAGE = "http://pptpclient.sourceforge.net"
 SECTION = "net"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit perlnative
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index b3574a7ff6..d368311d13 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.nongnu.org/quagga/"
 SECTION = "net"
 
 
-LICENSE = "GPL-2.0 & LGPL-2.0"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d \
                     file://COPYING.LIB;md5=01ef24401ded36cd8e5d18bfe947240c"
 
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
index 363eeeb56e..846abca032 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A user-mode PPPoE client and server suite for Linux"
 HOMEPAGE = "http://www.roaringpenguin.com/products/pppoe"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
 PR = "r10"
diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index 09699f3329..8099fa5c6e 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -6,7 +6,7 @@ make to establish network connections and negotating them through a \
 SOCKS server as necessary."
 HOMEPAGE = "http://sourceforge.net/projects/tsocks/"
 SECTION = "net"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
 SRC_URI = "http://downloads.sourceforge.net/tsocks/tsocks-${PV}.tar.gz \
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
index d96a28eac9..08bab4a338 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
@@ -5,7 +5,7 @@ DEPENDS = "ppp virtual/kernel"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/xelerance/xl2tpd.git;branch=master;protocol=https"
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index 753d832982..4f8d4f6c6e 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -9,7 +9,7 @@ Addresses are assigned randomly by each host and, in case of collision, \
 both hosts (are supposed to) renumber."
 AUTHOR = "Anand Kumria <wildfire@progsoc.uts.edu.au>"
 HOMEPAGE = "http://www.progsoc.org/~wildfire/zeroconf/"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
                     file://zeroconf.c;beginline=1;endline=13;md5=a5bada96e1e34b08eb7446b28e2630b2"
 SECTION = "net"
diff --git a/meta-networking/recipes-support/aoetools/aoetools_36.bb b/meta-networking/recipes-support/aoetools/aoetools_36.bb
index 676d2e567f..9c9e5ca7ad 100644
--- a/meta-networking/recipes-support/aoetools/aoetools_36.bb
+++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
@@ -6,7 +6,7 @@ The vblade program (storage target) exports a blockdevice using AoE. \
 "
 HOMEPAGE = "http://sourceforge.net/projects/${BPN}"
 SECTION = "admin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RRECOMMENDS:${PN} = "kernel-module-aoe"
 
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index a4eaa9ff34..898b69682d 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Administration tool for arp packet filtering"
 SECTION = "net"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 SRCREV = "efae8949e31f8b2eb6290f377a28384cecaf105a"
 PV = "0.0.5+git${SRCPV}"
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
index 85a7e59d57..cf0fc1c33d 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tools for ethernet bridging"
 HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
 
diff --git a/meta-networking/recipes-support/chrony/chrony_4.2.bb b/meta-networking/recipes-support/chrony/chrony_4.2.bb
index 609aaab880..57dd635dc3 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.2.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.2.bb
@@ -27,7 +27,7 @@ the client program only."
 
 HOMEPAGE = "https://chrony.tuxfamily.org/"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
index 7821a120eb..d4cdda0f81 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A a package of utilities for doing and managing mounts of the Linux CIFS filesystem."
 HOMEPAGE = "http://wiki.samba.org/index.php/LinuxCIFS_utils"
 SECTION = "otherosfs"
-LICENSE = "GPLv3 & LGPLv3"
+LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "8c06dce7d596e478c20bc54bdcec87ad97f80a1b"
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index cd51c07dc1..136c65d8fd 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -2,7 +2,7 @@ SUMMARY = "Lightweight, easy to configure DNS forwarder and DHCP server"
 HOMEPAGE = "http://www.thekelleys.org.uk/dnsmasq/doc.html"
 SECTION = "net"
 # GPLv3 was added in version 2.41 as license option
-LICENSE = "GPLv2 | GPLv3"
+LICENSE = "GPL-2.0-only | GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index 1017f16add..d8c483191f 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dovecot is an open source IMAP and POP3 email server"
 HOMEPAGE = "https://www.dovecot.org/"
 DESCRIPTION = "Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-like systems, written with security primarily in mind. Dovecot is an excellent choice for both small and large installations. It's fast, simple to set up, requires no special administration and it uses very little memory."
 SECTION = "mail"
-LICENSE = "LGPLv2.1 & MIT"
+LICENSE = "LGPL-2.1-only & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2956560272e5b31d9d64f03111732048"
 
 SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
index 4cfb0c8047..a246464b29 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
@@ -5,7 +5,7 @@ Think of it as networked raid 1. It is a building block for\
 setting up high availability (HA) clusters."
 HOMEPAGE = "http://www.drbd.org/"
 SECTION = "admin"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=${PV};protocol=https \
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
index 05d42c75ef..0766f7f4bd 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "DRBD is a block device which is designed to build high \
                block device via (a dedicated) network. You could see \
                it as a network raid-1."
 HOMEPAGE = "http://oss.linbit.com/drbd/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 DEPENDS = "virtual/kernel"
 
diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
index be4cfe3e29..e60e1edd1f 100644
--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -8,7 +8,7 @@ SECTION = "net"
 
 DEPENDS = "libesmtp"
 
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.bz2 \
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 6035ddfccd..99fcacd3ef 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A suite for man in the middle attacks"
 HOMEPAGE = "https://github.com/Ettercap/ettercap"
-LICENSE = "GPL-2.0+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit cmake
diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
index 9599837644..e4ad0a39e1 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
@@ -5,7 +5,7 @@ and forwarding utility intended to be used over on-demand TCP/IP links (such as
 connections). It supports every remote-mail protocol now in use on the Internet: POP2, POP3, \
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
-LICENSE = "GPLv2 & MIT"
+LICENSE = "GPL-2.0-only & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c3a05d9b9d3784c824c9b92a648e1353"
 
 DEPENDS = "openssl"
diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
index 2dfd8d5d4b..a35ec06795 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
@@ -1,6 +1,6 @@
 SUMMARY = "fwknop - Single Packet Authorization"
 HOMEPAGE = "http://www.cipherdyne.org/fwknop/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    "
 inherit autotools-brokensep
diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index 92051a8e70..d8288f9b49 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -6,7 +6,7 @@ SUMMARY = "GeoIP perl API library to access location database"
 DESCRIPTION = "perl library for country/city/organization to IP address or hostname mapping"
 HOMEPAGE = "http://www.maxmind.com/app/ip-location"
 SECTION = "libdevel"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4f3ea6e9b28af88dc0321190a1f8250"
 
 S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 8fe4fcbd24..429cd69d6d 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -31,7 +31,7 @@ SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c7428
 SRC_URI[GeoLiteCityv6-dat.md5sum] = "6734ccdc644fc0ba76eb276dce73d005"
 SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c95a9d2643b7f53d7abeed2114388870e13fbbad4653f450a49efa7e4b86aca4"
 
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad \
                     file://LICENSE;md5=0388276749a542b0d611601fa7c1dcc8 "
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
index 9494bd36ca..9a0292eacc 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.5.0/geoip
 SRC_URI[md5sum] = "28f633c49ec87ab01ad3c0fb0228a696"
 SRC_URI[sha256sum] = "5119fd0e338cd083e886228b26679c64bcbaade8a815be092aecf865a610ab26"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "\
 file://ChangeLog.md;md5=11d2e31df0de2be3ccc3e2286c4dafcb \
diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb b/meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb
index d9d726861a..156ea3c59b 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb
@@ -15,7 +15,7 @@ DESCRIPTION = "The  HTTP Time Protocol (HTP) is used to synchronize a computer's
 
 HOMEPAGE = "http://www.vervest.org/htp/"
 
-LICENSE = "GPL-2.0+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=d7018a4d2c5a6eab392709a05e5e168a"
 
 SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.xz \
diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb
index a2eb81fd5b..663685a3aa 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.13.bb
@@ -2,7 +2,7 @@ SUMMARY = "Configure network interfaces for parallel routing"
 HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bonding"
 SECTION = "net"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253"
 
 inherit manpages
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb b/meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb
index 4ee7c42a35..1e57a48970 100644
--- a/meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb
+++ b/meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Set routing metrics for a network interface"
 
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://0pointer.de/lennart/projects/ifmetric/ifmetric-${PV}.tar.gz \
diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
index c71ecb32e9..517d781281 100644
--- a/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.ex-parrot.com/pdw/iftop/"
 SECTION = "net"
 DEPENDS = "libpcap ncurses"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76498170798db0f4f0fb685a225f702f"
 
 SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz \
diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
index 1e6db5b7e4..efac3c86eb 100644
--- a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/nmav/ipcalc"
 
 SECTION = "net"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
index 8fb116f576..01bde4a68d 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
@@ -11,7 +11,7 @@ methods (NAT, tunneling, and direct routing), and eight load balancing algorithm
 locality-based  least-connection, locality-based least-connection with replication, \
 destination-hashing, and source-hashing)."
 SECTION = "net"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=40;endline=56;md5=b4e40069f15598d0e3fe2aa177e5ec77"
 
 DEPENDS += "libnl popt"
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
index 7d65133c5d..231c57260e 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "LibESMTP is a library to manage posting \
 (or submission of) electronic mail using SMTP to a \
 preconfigured Mail Transport Agent (MTA) such as Exim or PostFix."
 HOMEPAGE = "https://libesmtp.github.io/"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 SECTION = "libs"
 
 DEPENDS = "openssl"
diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.2.bb b/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
index d26acea408..a9c6794bf5 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "http://ldb.samba.org"
 SECTION = "libs"
-LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
+LICENSE = "LGPL-3.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
 
 DEPENDS += "libtdb libtalloc libtevent popt"
 RDEPENDS:pyldb += "python3"
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
index 9b207609fc..b3f8b2ce25 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "http://talloc.samba.org"
 SECTION = "libs"
-LICENSE = "LGPL-3.0+ & GPL-3.0+"
+LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
                     file://pytalloc.h;beginline=1;endline=18;md5=21ab13bd853679d7d47a1739cb3b7db6 \
                     "
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
index e7f7384025..2affcf754e 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The tdb library"
 HOMEPAGE = "http://tdb.samba.org/"
 SECTION = "libs"
-LICENSE = "LGPL-3.0+ & GPL-3.0+"
+LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c98f48018c4 \
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb b/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
index 78c0920955..732880e96c 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "http://tevent.samba.org"
 SECTION = "libs"
-LICENSE = "LGPLv3+"
+LICENSE = "LGPL-3.0-or-later"
 
 DEPENDS += "libtalloc libtirpc"
 RDEPENDS:python3-tevent = "python3"
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 538fca7843..effd7502ff 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Drivers and tools to support ATM networking under Linux"
 HOMEPAGE = "http://linux-atm.sourceforge.net/"
 SECTION = "libs"
-LICENSE = "GPL-2.0 & LGPL-2.0"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 
 DEPENDS = "flex flex-native"
 
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
index 5455560362..4a9d2f54d9 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
 HOMEPAGE = "http://lksctp.org"
 SECTION = "net"
-LICENSE = "LGPLv2.1 & GPLv2"
+LICENSE = "LGPL-2.1-only & GPL-2.0-only"
 
 LIC_FILES_CHKSUM = " \
     file://COPYING.lib;md5=0a1b79af951c42a9c8573533fbba9a92 \
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index cc6053ba96..baaff1f219 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utilities for managing the Linux LoWPAN stack"
 DESCRIPTION = "This is a set of utils to manage the Linux LoWPAN stack. \
 The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IEEE 802.15.4-2006) compatibility."
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "flex-native bison-native libnl python"
diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
index f2b7ce953a..f965c0db1b 100644
--- a/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
+++ b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tool to view/change network interface MAC addresses"
 DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
 HOMEPAGE = "https://github.com/alobbs/macchanger"
-LICENSE  = "GPLv3"
+LICENSE  = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "net"
 
diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_git.bb
index 350c2722be..602724da34 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Management Component Control Protocol utilities"
 HOMEPAGE = "http://www.github.com/CodeConstruct/mctp"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
diff --git a/meta-networking/recipes-support/mtr/mtr_0.95.bb b/meta-networking/recipes-support/mtr/mtr_0.95.bb
index b5e2fae506..92f9c4bfc0 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.95.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.95.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.bitwizard.nl/mtr/"
 SECTION = "net"
 DEPENDS = "ncurses"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
diff --git a/meta-networking/recipes-support/nbd/nbd_3.20.bb b/meta-networking/recipes-support/nbd/nbd_3.20.bb
index 589ac879c6..7b7f5cbfa2 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.20.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.20.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Network Block Device"
 HOMEPAGE = "http://nbd.sourceforge.net"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "glib-2.0"
diff --git a/meta-networking/recipes-support/ncp/libowfat_0.32.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
index 4e67f6c91b..94f36f904a 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.32.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "libowfat is a library of general purpose APIs extracted from Dan
 Bernstein's software (libdjb), reimplemented and covered by the GNU \
 General Public License Version 2 (no later versions)."
 HOMEPAGE = "http://www.fefe.de/libowfat"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz \
diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index a2f0ccc069..516beede5f 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "ncp is a utility for copying files in a LAN. It has absolutely no
 security or integrity checking, no throttling, no features, except \
 one: you don't have to type the coordinates of your peer."
 HOMEPAGE = "http://www.fefe.de/ncp"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libowfat"
 
diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index 69b774a8f8..f5467794e6 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package includes some useful diagnostics tools for \
 IPv6 networks, including ndisc6, rdisc6, tcptraceroute6 and traceroute6."
 SECTION = "net"
 HOMEPAGE = "http://www.remlab.net/ndisc6/"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 PV = "1.0.5"
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index fc09554975..54a4ea0b33 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -1,5 +1,5 @@
 require netcat.inc
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 PR = "r3"
diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index 3b6880a38d..f60bb9f104 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "netcf"
 DESCRIPTION = "netcf is a cross-platform network configuration library."
 HOMEPAGE = "https://pagure.io/netcf"
 SECTION = "libs"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 
diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
index 10e30044e8..004330e1b4 100644
--- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
+++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Netsniff-ng is a fast zero-copy analyzer, pcap capturing and replaying tool"
 HOMEPAGE = "http://netsniff-ng.org"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9dd40dfb621eed702c0775577fbb7011"
 DEPENDS = "libpcap"
 
diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
index 3ae0f7e95a..56b7ab0d69 100644
--- a/meta-networking/recipes-support/nis/nis.inc
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -6,7 +6,7 @@
 DESCRIPTION = "NIS Server and Tools"
 HOMEPAGE = "http://www.linux-nis.org/nis/"
 SECTION = "net"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 inherit autotools gettext pkgconfig
diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
index 352d2d2426..13c3398c2b 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -5,7 +5,7 @@ inspection. Based on OpenDPI it includes ntop extensions"
 SECTION = "libdevel"
 DEPENDS = "libpcap json-c"
 RDEPENDS:${PN} += " libpcap"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 SRCREV = "8b5c6af71b562549f8416b31803daae223e09f46"
diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
index 1c74845cc9..dca929b574 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
@@ -8,7 +8,7 @@ SECTION = "console/network"
 
 DEPENDS = "curl libmaxminddb libpcap lua mariadb ndpi json-c rrdtool zeromq"
 RDEPENDS:${PN} = "bash redis"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "d3ce78948e8d81dc1e2c5298ce556f9f2247aac1"
diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
index 677b031a9f..115b51e96c 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
@@ -6,7 +6,7 @@ across an interconnecting network to a destination system, either transferring \
 data for a specified time interval, or alternatively transferring a specified \
 number of bytes."
 HOMEPAGE = "http://www.nuttcp.net/Welcome%20Page.html"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 SECTION = "net"
 LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=496a7c0bb83c07ff528d226bf85e05c5"
 
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.101.bb b/meta-networking/recipes-support/open-isns/open-isns_0.101.bb
index b3d1bdcd0e..f2a084d635 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.101.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.101.bb
@@ -7,7 +7,7 @@ Storage Name Service (iSNS).  The distribution includes the iSNS server, \
 supporting persisten storage of registrations, isnsadm, a command line \
 utility for managing nodes, and isnsdd, a corresponding discovery daemon."
 HOMEPAGE = "http://github.com/gonzoleeman/open-isns/"
-LICENSE = "GPLv2+ & LGPLv2+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 SECTION = "net"
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index e37e9eee74..a3e090fbd5 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -17,12 +17,12 @@ for better management of and seamless user interactions with guests.\
 "
 SECTION = "vmware-tools"
 
-LICENSE = "LGPL-2.0 & GPL-2.0 & BSD & CDDL-1.0"
+LICENSE = "LGPL-2.0-only & GPL-2.0-only & BSD & CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=559317809c5444fb39ceaf6ac45c43ac"
 LICENSE:modules/freebsd/vmblock = "BSD"
-LICENSE:modules/freebsd/vmmemctl = "GPL-2.0"
-LICENSE:modules/freebsd/vmxnet = "GPL-2.0"
-LICENSE:modules/linux = "GPL-2.0"
+LICENSE:modules/freebsd/vmmemctl = "GPL-2.0-only"
+LICENSE:modules/freebsd/vmxnet = "GPL-2.0-only"
+LICENSE:modules/linux = "GPL-2.0-only"
 LICENSE:modules/solaris = "CDDL-1.0"
 
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=master \
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
index 99fa9ba770..c61303b81e 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     readline \
     "
 
-LICENSE = "GPLv2 & LGPLv2.1 & BSD-3-Clause"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only & BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
index 6c4514eb90..3e725ec418 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=377a495e6f12b2a3adcee797e59540b8"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
index 7fde88c447..c2c4335910 100644
--- a/meta-networking/recipes-support/phytool/phytool.bb
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -1,5 +1,5 @@
 SUMMARY = "PHY interface tool for Linux"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
 PV = "2+git${SRCPV}"
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb
index 48434aa584..5fb72c7acb 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb
@@ -10,7 +10,7 @@ SRCREV = "b2fedc4b1b891afd2c26ebfd21f9e440e83c28ff"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-LICENSE = "BSD-2-Clause | GPLv2"
+LICENSE = "BSD-2-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.BSD_FB;md5=0ec18bae1a9df92c8d6ae01f94a289ae \
 		   file://COPYING.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
index 90e7fec52d..9de4cc699a 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -2,7 +2,7 @@ SUMMARY = "RULI stands for Resolver User Layer Interface It's a library	built on
 
 HOMEPAGE = "http://www.nongnu.org/ruli/"
 
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "liboop"
diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb
index 21a3c44264..649e6d4e8e 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Static Multicast Routing Daemon"
 DESCRIPTION = "SMCRoute is a daemon and command line tool to manipulate the multicast routing table in the UNIX kernel."
 HOMEPAGE = "http://troglobit.github.io/smcroute.html"
 SECTION = "net"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "9b6e397595a154c84a329c55bed21e0c43e89ee6"
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index c9f95b0125..d9083bcbe8 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -10,7 +10,7 @@ environment - not only on its computer-server machine, but also from \
 anywhere on the Internet and using a wide variety of machine \
 architectures."
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 PV = "0.14.2+git${SRCPV}"
diff --git a/meta-networking/recipes-support/spice/usbredir_0.9.0.bb b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
index 5245f95f5c..452491023e 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "usbredir libraries and utilities"
 
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=4b54a1fd55a448865a0b32d41598759d \
 "
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
index decac0c2b3..b0e921d423 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -1,6 +1,6 @@
 SUMMARY = "extremely simple MTA to get mail off the system to a mail hub"
 HOMEPAGE = "http://packages.qa.debian.org/s/ssmtp.html"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 686cdb677e..babfe17d29 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -3,7 +3,7 @@ Linux operating system."
 SUMMARY = "strongSwan is an OpenSource IPsec implementation"
 HOMEPAGE = "http://www.strongswan.org"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.59.bb b/meta-networking/recipes-support/stunnel/stunnel_5.59.bb
index 9321070bc8..9e0169a7e7 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.59.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.59.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 # Note: Linking stunnel statically or dynamically with other modules is making
 # a combined work based on stunnel. Thus, the terms and conditions of the GNU
 # General Public License cover the whole combination.
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=223b26c62f5e7c5c8656d6c133edd5ec"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
index f65956b630..56db66b8eb 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://tcpreplay.appneta.com/"
 
 SECTION = "net"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
index f20013b192..388f7aecbb 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Lightweight http(s) proxy daemon"
 HOMEPAGE = "https://tinyproxy.github.io/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
index 82077db546..9cac204998 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
@@ -7,7 +7,7 @@ tool.  If you're having network connectivity problems, traceroute will \
 show you where the trouble is coming from along the route."
 SECTION = "net"
 HOMEPAGE = "http://traceroute.sourceforge.net/"
-LICENSE = "GPL-2.0+ & LGPL-2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta-networking/recipes-support/tunctl/tunctl.inc b/meta-networking/recipes-support/tunctl/tunctl.inc
index 1c11823dd5..07e6dc217d 100644
--- a/meta-networking/recipes-support/tunctl/tunctl.inc
+++ b/meta-networking/recipes-support/tunctl/tunctl.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Tool for controlling the Linux TUN/TAP driver"
 SECTION = "net"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://tunctl.c;beginline=1;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz \
diff --git a/meta-networking/recipes-support/uftp/uftp_5.0.bb b/meta-networking/recipes-support/uftp/uftp_5.0.bb
index 4eeb62d102..301e0fa607 100644
--- a/meta-networking/recipes-support/uftp/uftp_5.0.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Encrypted UDP based FTP with multicast"
 HOMEPAGE = "https://sourceforge.net/projects/uftp-multicast"
 SECTION = "libs/network"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
index a7e008e55e..cf3f41c5a1 100644
--- a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "vnStat is a console-based network traffic monitor for Linux and BSD that keeps a log of network traffic for the selected interface(s)."
 HOMEPAGE = "https://humdi.net/vnstat/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SECTION = "net"
 DEPENDS = "gd sqlite3"
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
index 6fee972b2c..f1dba227ac 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "wireshark - a popular network protocol analyzer"
 HOMEPAGE = "http://www.wireshark.org"
 SECTION = "net"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
 DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares"
-- 
2.35.1


