Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8950CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:00:56 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7032.1761642047321123794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 02:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N9WPSwff;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761642048; x=1793178048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DEl5khXq4c5+2u72BjkrFEBr4S2tH8RAjgofCz8uP1E=;
  b=N9WPSwffr/YlJI4Xplr4Wo+S0ruqzfqPDQtxk9d30I7jVQHBdOiOpzWu
   OAZP8WlK6zDIGJbwPbMZVMVD9QuxpVuaAwXgmtBjZPCNymdmlQrTfH8dH
   toLI6K+7AtZjESWByd01CPcNDxI+lKtiomAeMF3a3uFft9DjZMmRTyltD
   HxjluAxoCpIRd/j9XEzjixy1kOCd4z9zUAaXLVrCHpPM5yf8AMfHcLhoZ
   nfU5k8SjolDmML4XOXlM8iBtg9z+6GNx4JGOzucawqh/ToiPDyYol9fHO
   Z8mYAS9sUMSGp0tVOp+LY6Fjus7mUpnCU6O8BHHLx0ymC5x1roM6SfGBp
   Q==;
X-CSE-ConnectionGUID: FhpoWUC9Rk6BfNVJOGzqQQ==
X-CSE-MsgGUID: C4miCP6nTz66xQENgWsTYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217315391"
X-IronPort-AV: E=Sophos;i="6.19,261,1754924400"; 
   d="scan'208";a="217315391"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 18:00:46 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4EDB91C1C70B
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:00:45 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0B36714003B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:00:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 9129140550E;
	Tue, 28 Oct 2025 09:00:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] modify test cases
Date: Tue, 28 Oct 2025 17:00:31 +0800
Message-ID: <20251028090037.143-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121067

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tests/acpid_reload.sh_bak                 |  71 ------------
 .../Functional.at/tests/atd_syslog.sh_bak     |  49 ---------
 .../Functional.bgpd/tests/bgpd_logfile.sh     |  69 ------------
 .../Functional.bgpd/tests/bgpd_syslog.sh_bak  |  73 ------------
 .../tests/bind_chroot_syslog-ng.sh_bak        |  59 ----------
 .../tests/bind_named_syslog.sh_bak            |  70 ------------
 .../tests/busybox_logger.sh_bak               |  19 ----
 .../tests/busybox_rpm.sh_bak                  |  22 ----
 .../tests/busybox_rpm2cpio.sh_bak             |  20 ----
 .../tests/busybox_setkeycodes.sh_bak          |  24 ----
 .../tests/busybox_telnet.sh-bak               |  35 ------
 .../Functional.demo/tests/demo_mdadm.sh       |  70 ------------
 .../tests/demo_opensafd.sh_bak                |  71 ------------
 .../Functional.demo/tests/demo_smartd.sh_bak  |  51 ---------
 .../tests/dhcrelay_syslog.sh_bak              |  80 --------------
 .../tests/dovecot_logfile.sh_bak              |  79 -------------
 .../Functional.glibc/glibc_tests.tar.gz-bak   | Bin 17814 -> 0 bytes
 .../tests/initscripts_ifdown-ifup.sh_bak      |  29 -----
 .../tests/interactive_crda.sh                 |  16 ---
 .../Functional.kbd/tests/chvt.sh_bak          |  30 -----
 .../Functional.kbd/tests/kbdrate1.sh_bak      |  13 ---
 .../Functional.kbd/tests/kbdrate2.sh_bak      |  13 ---
 .../Functional.logd/tests/logd_syslog.sh_bak  |  56 ----------
 .../tests/logwatch_detail.sh_bak              |  40 -------
 .../tests/logwatch_mailto.sh_bak              |  62 -----------
 .../tests/openssh-server_sshd.sh_bak          |  35 ------
 .../Functional.misc/tests/telnetd.sh-bak      |  12 --
 .../tests/multipathd_syslog.sh_bak            |  72 ------------
 .../tests/snmpd_syslog.sh_bak                 |  55 ---------
 .../tests/snmpd_syslog_ip.sh_bak              |  63 -----------
 .../tests/snmptrapd_coldstart.sh_bak          |  60 ----------
 .../tests/snmptrapd_syslog.sh_bak             |  54 ---------
 .../tests/snmptrapd_warmstart.sh_bak          |  61 ----------
 .../tests/net-tools_netstat2.sh-bak           |  17 ---
 .../tests/nfsserver_syslog.sh_bak             |  90 ---------------
 .../Functional.nscd/tests/nscd_syslog.sh_bak  |  52 ---------
 .../Functional.ntp/tests/ntp_ntptime.sh_bak   |  28 -----
 .../Functional.ntp/tests/ntp_pid.sh           |  57 ----------
 .../Functional.ntp/tests/ntp_syslog.sh_bak    |  55 ---------
 .../tests/openssh_pidfile.sh_bak              |  61 ----------
 .../tests/openssh_syslog.sh_bak               |  49 ---------
 .../Functional.openvpn/tests/openvpn_pid.sh   |  31 ------
 .../tests/openvpn_pid.sh-old                  |  31 ------
 .../tests/openvpn_syslog-ng.sh_bak            |  42 -------
 .../tests/openwsmand_syslog.sh_bak            |  60 ----------
 .../Functional.ospf6d/tests/ospf6d_logfile.sh |  72 ------------
 .../tests/ospf6d_syslog.sh_bak                |  73 ------------
 .../Functional.ospfd/tests/ospfd_logfile.sh   |  72 ------------
 .../tests/ospfd_syslog.sh_bak                 |  75 -------------
 .../tests/pcscd_syslog.sh_bak                 |  57 ----------
 .../tests/postfix_logfile.sh_bak              |  63 -----------
 .../Functional.ptpd/tests/ptpd_syslog.sh_bak  |  57 ----------
 .../tests/radvd_logfile.sh_bak                |  65 -----------
 .../tests/regression_chkconfig.sh             |  15 ---
 .../tests/regression_crda.sh                  |  15 ---
 .../tests/regression_eggdbus-binding-tool.sh  |  13 ---
 .../tests/regression_execstack.sh             |  13 ---
 .../tests/regression_genrandom.sh             |  15 ---
 .../tests/regression_in.telnetd.sh-bak        |  15 ---
 .../tests/regression_iwpriv.sh                |  15 ---
 .../tests/regression_mip6d.sh                 |  15 ---
 .../tests/regression_omshell.sh               |  15 ---
 .../tests/regression_rsh.sh-bak               |  15 ---
 .../tests/regression_syslog-ng.sh             |  13 ---
 .../tests/regression_uim-xim.sh               |  13 ---
 .../tests/regression_wish8.6.sh               |  15 ---
 .../tests/regression_xinetd.sh                |  15 ---
 .../Functional.ripd/tests/ripd_logfile.sh     | 104 ------------------
 .../Functional.ripd/tests/ripd_syslog.sh_bak  | 101 -----------------
 .../Functional.ripngd/tests/ripngd_logfile.sh | 103 -----------------
 .../tests/ripngd_syslog.sh_bak                | 101 -----------------
 .../tests/test_samba06_host.sh-bak            |  22 ----
 .../tests/samhain_check.sh_bak                |  64 -----------
 .../tests/samhain_init.sh_bak                 |  49 ---------
 .../tests/sysklogd_syslogd.sh_bak             |  17 ---
 .../Functional.sysstat/tests/sysstat_sadc.sh  |  15 ---
 .../tests/sysstat_sadc.sh_bak                 |  15 ---
 .../tests/trousers_start.sh_bak               |  18 ---
 .../tests/utillinux_logger.sh_bak             |  15 ---
 .../Functional.zebra/tests/zebra_logfile.sh   |  75 -------------
 .../tests/zebra_syslog.sh_bak                 |  73 ------------
 fuego-core-ubinux/fuego-core/bgpd_ps.sh       |  50 +++++++++
 fuego-core-ubinux/fuego-core/dool_test.sh     |   4 +
 fuego-core-ubinux/fuego-core/ethtool_show.sh  |  23 ++++
 fuego-core-ubinux/fuego-core/ethtool_test.sh  |   4 +
 .../fuego-core/initscripts_ifdown-ifup.sh     |  51 +++++++++
 fuego-core-ubinux/fuego-core/ospf6d_ps.sh     |  45 ++++++++
 fuego-core-ubinux/fuego-core/ospfd_ps.sh      |  45 ++++++++
 fuego-core-ubinux/fuego-core/s-nail_test.sh   |   4 +
 fuego-core-ubinux/fuego-core/test.yaml        |  26 +++++
 .../fuego-core/vixie_cron_test.sh             |   7 ++
 fuego-core-ubinux/fuego-core/zebra_ps.sh      |  54 +++++++++
 92 files changed, 313 insertions(+), 3614 deletions(-)
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.acpid/tests/acpid_reload.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.at/tests/atd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.bgpd/tests/bgpd_logfile.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.bgpd/tests/bgpd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.bind/tests/bind_chroot_syslog-ng.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.bind/tests/bind_named_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_logger.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_rpm.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_rpm2cpio.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_setkeycodes.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_telnet.sh-bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_mdadm.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_opensafd.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_smartd.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.dhcrelay/tests/dhcrelay_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.dovecot/tests/dovecot_logfile.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.glibc/glibc_tests.tar.gz-bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.initscripts/tests/initscripts_ifdown-ifup.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.interactive/tests/interactive_crda.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.kbd/tests/chvt.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.kbd/tests/kbdrate1.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.kbd/tests/kbdrate2.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.logd/tests/logd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.logwatch/tests/logwatch_detail.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.logwatch/tests/logwatch_mailto.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.misc/tests/openssh-server_sshd.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.misc/tests/telnetd.sh-bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.multipathd/tests/multipathd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmpd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmpd_syslog_ip.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_coldstart.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_warmstart.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.net-tools/tests/net-tools_netstat2.sh-bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.nfs/tests/nfsserver_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.nscd/tests/nscd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_ntptime.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_pid.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.openssh/tests/openssh_pidfile.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.openssh/tests/openssh_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_pid.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_pid.sh-old
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_syslog-ng.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.openwsmand/tests/openwsmand_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ospf6d/tests/ospf6d_logfile.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ospf6d/tests/ospf6d_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ospfd/tests/ospfd_logfile.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ospfd/tests/ospfd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.pcscd/tests/pcscd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.postfix/tests/postfix_logfile.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ptpd/tests/ptpd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.radvd/tests/radvd_logfile.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_chkconfig.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_crda.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_eggdbus-binding-tool.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_execstack.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_genrandom.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_in.telnetd.sh-bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_iwpriv.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_mip6d.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_omshell.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_rsh.sh-bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_syslog-ng.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_uim-xim.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_wish8.6.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_xinetd.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ripd/tests/ripd_logfile.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ripd/tests/ripd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ripngd/tests/ripngd_logfile.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.ripngd/tests/ripngd_syslog.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.samba/tests/test_samba06_host.sh-bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.samhain/tests/samhain_check.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.samhain/tests/samhain_init.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.sysklogd/tests/sysklogd_syslogd.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.sysstat/tests/sysstat_sadc.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.sysstat/tests/sysstat_sadc.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.trousers/tests/trousers_start.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.utillinux/tests/utillinux_logger.sh_bak
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.zebra/tests/zebra_logfile.sh
 delete mode 100644 fuego-core-ubinux/fuego-core/Functional.zebra/tests/zebra_syslog.sh_bak
 create mode 100755 fuego-core-ubinux/fuego-core/bgpd_ps.sh
 create mode 100755 fuego-core-ubinux/fuego-core/dool_test.sh
 create mode 100755 fuego-core-ubinux/fuego-core/ethtool_show.sh
 create mode 100755 fuego-core-ubinux/fuego-core/ethtool_test.sh
 create mode 100755 fuego-core-ubinux/fuego-core/initscripts_ifdown-ifup.sh
 create mode 100755 fuego-core-ubinux/fuego-core/ospf6d_ps.sh
 create mode 100755 fuego-core-ubinux/fuego-core/ospfd_ps.sh
 create mode 100755 fuego-core-ubinux/fuego-core/s-nail_test.sh
 create mode 100755 fuego-core-ubinux/fuego-core/test.yaml
 create mode 100755 fuego-core-ubinux/fuego-core/vixie_cron_test.sh
 create mode 100755 fuego-core-ubinux/fuego-core/zebra_ps.sh

diff --git a/fuego-core-ubinux/fuego-core/Functional.acpid/tests/acpid_reload.sh_bak b/fuego-core-ubinux/fuego-core/Functional.acpid/tests/acpid_reload.sh_bak
deleted file mode 100644
index 51778ee..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.acpid/tests/acpid_reload.sh_bak
+++ /dev/null
@@ -1,71 +0,0 @@
-#!/bin/sh
-
-# If the target start the acpid.
-# Add the action file and event file to /etc/acpid to reload acpid.
-# Check the log file.
-
-test="reload"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-if [ ! -f /etc/acpi/actions ]
-then
-    mkdir -p /etc/acpi/actions
-fi
-
-if [ ! -f /etc/acpi/events/testhkey ]
-then
-    touch /etc/acpi/events/testhkey
-fi
-
-if [ ! -f /etc/acpi/actions/test_action.sh ]
-then
-    touch /etc/acpi/actions/test_action.sh
-fi
-
-cp data/testhkey /etc/acpi/events/testhkey
-cp data/test_action.sh /etc/acpi/actions/test_action.sh
-
-chmod +x /etc/acpi/actions/test_action.sh
-if [ -f /var/log/acpid ]
-then
-    rm -f /var/log/acpid
-fi
-
-exec_service_on_target $logger_service stop
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-sleep 5
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target acpid restart
-then
-    echo " -> restart of acpid succeeded."
-else
-    echo " -> restart of acpid failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-sleep 5
-
-if tail /var/log/syslog | grep "starting up"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-exec_service_on_target acpid stop
-rm -f /etc/acpi/events/testhkey
-rm -f /etc/acpi/actions/test_action.sh
-if [ -e /var/log/syslog_bak ]
-then
-    mv /var/log/syslog_bak /var/log/syslog
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.at/tests/atd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.at/tests/atd_syslog.sh_bak
deleted file mode 100644
index 0f87a17..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.at/tests/atd_syslog.sh_bak
+++ /dev/null
@@ -1,49 +0,0 @@
-#!/bin/sh
-
-#  In the target start atd, add job and verify job completion.
-#  Check the syslog string "fuego autotest".
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-logger_service=$(detect_logger_service)
-
-exec_service_on_target $logger_service stop
-exec_service_on_target atd stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target atd start
-then
-    echo " -> start atd succeeded."
-else
-    echo " -> start atd failed."
-fi
-
-mkdir test_dir
-cp data/test_add.sh test_dir/
-
-at -f test_dir/test_add.sh now + 1 minutes
-
-echo "sleep 60s"
-sleep 60
-
-if cat /var/log/syslog | grep "hello fuego autotest"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-rm -fr test_dir
-
-at -d $(at -l | cut -b 1-2)
-exec_service_on_target atd stop
-exec_service_on_target $logger_service stop
diff --git a/fuego-core-ubinux/fuego-core/Functional.bgpd/tests/bgpd_logfile.sh b/fuego-core-ubinux/fuego-core/Functional.bgpd/tests/bgpd_logfile.sh
deleted file mode 100644
index dccf8c0..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.bgpd/tests/bgpd_logfile.sh
+++ /dev/null
@@ -1,69 +0,0 @@
-#!/bin/sh
-
-#  In the target start bgpd and zebra, then confirm the log file.
-#  check the /var/log/quagga/bgpd.log file.
-
-test="logfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target bgpd stop
-exec_service_on_target zebra stop
-
-if [ ! -f /var/log/quagga/bgpd.log ]
-then
-   mkdir /var/log/quagga
-   chown -R quagga:quagga /var/log/quagga
-fi
-
-mv /var/log/quagga/bgpd.log /var/log/quagga/bgpd.log.bck
-
-#Backup the config file
-mv /etc/quagga/bgpd.conf /etc/quagga/bgpd.conf.bck
-mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf.bck
-
-cp data/bgpd.conf /etc/quagga/bgpd.conf
-cp data/zebra.conf /etc/quagga/zebra.conf
-chown quagga:quagga /etc/quagga/*.conf
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target bgpd start
-then
-    echo " -> start of bgpd succeeded."
-else
-    echo " -> start of bgpd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if ls /var/log/quagga/bgpd.log
-then
-    echo " -> get log file of bgpd."
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get log file of bgpd."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-exec_service_on_target bgpd stop
-exec_service_on_target zebra stop
-
-#Restore the config file
-mv /etc/quagga/bgpd.conf.bck /etc/quagga/bgpd.conf
-mv /etc/quagga/zebra.conf.bck /etc/quagga/zebra.conf
-
-if [ -f /var/log/quagga/bgpd.log.bck ]
-then
-    mv /var/log/quagga/bgpd.log.bck /var/log/quagga/bgpd.log
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.bgpd/tests/bgpd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.bgpd/tests/bgpd_syslog.sh_bak
deleted file mode 100644
index 13d33bf..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.bgpd/tests/bgpd_syslog.sh_bak
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/sh
-
-#  In the target start bgpd and zebra.
-#  At the same time, start syslog-ng and check the keyword "bgpd" in syslog.
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target bgpd stop
-exec_service_on_target zebra stop
-exec_service_on_target syslog-ng stop
-
-rm -f /var/run/quagga/bgpd.pid
-#Backup the config file
-mv /etc/quagga/bgpd.conf /etc/quagga/bgpd.conf.bck
-mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf.bck
-#Backup the syslog file
-mv /var/log/syslog /var/log/syslog.bck
-
-cp data/bgpd.conf /etc/quagga/bgpd.conf
-cp data/zebra.conf /etc/quagga/zebra.conf
-chown quagga:quagga /etc/quagga/*.conf
-
-if exec_service_on_target syslog-ng restart
-then
-    echo " -> restart of syslog-ng succeeded."
-else
-    echo " -> restart of syslog-ng failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target bgpd start
-then
-    echo " -> start of bgpd succeeded."
-else
-    echo " -> start of bgpd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "bgpd"
-then
-    echo " -> get the syslog of bgpd."
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the syslog of bgpd."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-exec_service_on_target bgpd stop
-exec_service_on_target zebra stop
-
-#Restore the config file
-mv /etc/quagga/bgpd.conf.bck /etc/quagga/bgpd.conf
-mv /etc/quagga/zebra.conf.bck /etc/quagga/zebra.conf
-#Restore the syslog file
-mv /var/log/syslog.bck /var/log/syslog
diff --git a/fuego-core-ubinux/fuego-core/Functional.bind/tests/bind_chroot_syslog-ng.sh_bak b/fuego-core-ubinux/fuego-core/Functional.bind/tests/bind_chroot_syslog-ng.sh_bak
deleted file mode 100644
index dc25016..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.bind/tests/bind_chroot_syslog-ng.sh_bak
+++ /dev/null
@@ -1,59 +0,0 @@
-#!/bin/sh
-
-#  Launch named chroot with the target and check if syslogis exist.
-
-test="chroot_syslog-ng"
-
-named_status=$(get_service_status named)
-dnsmasq_status=$(get_service_status dnsmasq)
-killall -9 named
-exec_service_on_target dnsmasq stop
-
-if [ -d /var/named/ ]
-then
-    mv /var/named /var/named_bak
-fi
-
-exec_service_on_target syslog-ng stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-mkdir -p /var/named/chroot/etc/bind
-cp -f /etc/bind/* /var/named/chroot/etc/bind/
-mkdir -p /var/named/chroot/var/named
-mkdir -p /var/named/chroot/var/cache/bind
-mkdir -p /var/named/chroot/var/run/named
-
-exec_service_on_target syslog-ng restart
-
-named -t /var/named/chroot
-
-sleep 10
-
-if cat /var/log/syslog | grep "BIND"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-killall -9 named
-rm -rf /var/named
-if [ -d /var/named_bak ]
-then
-    mv /var/named_bak /var/named
-fi
-if [ -f /var/log/syslog_bak ]
-then
-    mv /var/log/syslog_bak /var/log/syslog
-fi
-if [ "$named_status" = "active" -o "$named_status" = "unknown" ]
-then
-    exec_service_on_target named start
-fi
-if [ "$dnsmasq_status" = "active" -o "$dnsmasq_status" = "unknown" ]
-then
-    exec_service_on_target dnsmasq start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.bind/tests/bind_named_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.bind/tests/bind_named_syslog.sh_bak
deleted file mode 100644
index cc04717..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.bind/tests/bind_named_syslog.sh_bak
+++ /dev/null
@@ -1,70 +0,0 @@
-#!/bin/sh
-
-# Start the named on target.
-# Check the log of named.
-
-test="named_syslog"
-
-logger_service=$(detect_logger_service)
-
-named_status=$(get_service_status named)
-dnsmasq_status=$(get_service_status dnsmasq)
-exec_service_on_target dnsmasq stop
-
-if [ -f /etc/bind/rndc.key ]
-then
-    rm -f /etc/bind/rndc.key
-fi
-
-exec_service_on_target named stop
-exec_service_on_target syslog.socket stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-exec_service_on_target $logger_service restart
-sleep 5
-
-if exec_service_on_target named start
-then
-    echo " -> start of named succeeded."
-else
-    echo " -> start of named failed."
-    echo " -> $test: TEST-FAIL"
-    if [ "$dnsmasq_status" = "active" -o "$dnsmasq_status" = "unknown" ]
-    then
-        exec_service_on_target dnsmasq start
-    fi
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-    exit
-fi
-
-sleep 5
-
-if cat /var/log/syslog | grep "BIND"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> log is not generated."
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$named_status" = "active" -o "$named_status" = "unknown" ]
-then
-    exec_service_on_target named start
-fi
-if [ "$dnsmasq_status" = "active" -o "$dnsmasq_status" = "unknown" ]
-then
-    exec_service_on_target dnsmasq start
-fi
-
-if [ -f /var/log/syslog_bak ]
-then
-    mv /var/log/syslog_bak /var/log/syslog
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_logger.sh_bak b/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_logger.sh_bak
deleted file mode 100644
index e485c85..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_logger.sh_bak
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/sh
-
-#  The testscript checks the following options of the command logger
-#  1) Option none
-
-test="logger"
-
-msg="This is a test message $(date)"
-busybox logger "$msg"
-
-sleep 1
-
-if grep "$msg" /var/log/syslog
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo "  Didn't find test string in log"
-    echo " -> $test: TEST-FAIL"
-fi;
diff --git a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_rpm.sh_bak b/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_rpm.sh_bak
deleted file mode 100644
index 9914d50..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_rpm.sh_bak
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/sh
-
-#  The testscript checks the following options of the command rpm
-#  1) Option -qpi/-qpl
-
-test="rpm"
-
-test_rpm="test-manual-1.2.3.noarch.rpm"
-
-if busybox rpm -qpi $test_rpm | grep "1.2.3"
-then
-    echo " -> $test: check rpm info success"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if busybox rpm -qpl $test_rpm | grep "text1.txt"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_rpm2cpio.sh_bak b/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_rpm2cpio.sh_bak
deleted file mode 100644
index 12043cd..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_rpm2cpio.sh_bak
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-#  The testscript checks the following options of the command rpm2cpio
-#  1) Option none
-
-test="rpm2cpio"
-
-test_rpm="test-manual-1.2.3.noarch.rpm"
-output_file="output_file"
-
-busybox rpm2cpio $test_rpm > $output_file
-
-if file $output_file | grep "cpio"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-rm -f $output_file
\ No newline at end of file
diff --git a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_setkeycodes.sh_bak b/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_setkeycodes.sh_bak
deleted file mode 100644
index 9d16110..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_setkeycodes.sh_bak
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh
-
-#  The testscript checks the following options of the command setkeycodes
-#  1) Option none
-
-test="setkeycodes"
-
-test_addr=$(getkeycodes | grep "e0 " | grep "    0" | head -1 | cut -d':' -f1 | cut -b 1-2,4-5)
-test_value="122"
-if getkeycodes | grep $test_value
-then
-    test_value=$(($test_value+1))
-fi
-
-busybox setkeycodes $test_addr $test_value
-
-if getkeycodes | grep $test_value
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-setkeycodes $test_addr 0
diff --git a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_telnet.sh-bak b/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_telnet.sh-bak
deleted file mode 100644
index 13b0391..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.busybox/tests/busybox_telnet.sh-bak
+++ /dev/null
@@ -1,35 +0,0 @@
-#!/bin/sh
-
-#  The testscript checks the following options of the command telnet
-#  1) Option none
-
-test="telnet"
-
-expect <<-EOF
-spawn busybox telnet 127.0.0.1
-expect {
- -re ".*login:.*" {
-           send "$name\n"
-          }
- default { send_user "Can not log into the board. Name error.\n"
-           send_user " -> $test: TEST-FAIL\n"
-           send "exit\n"}  }
-expect {
- -re ".*Password:.*" {
-           send "$passwd\n"
-          }
- default { send_user "Can not log into the board. Passwd error. $passwd\n"
-           send_user " -> $test: TEST-FAIL\n"
-           send "exit\n"}  }
-
-expect {
- -re ".*" {
-           send_user " -> $test: TEST-PASS\n"
-          }
- default {
-            send_user " -> can't login.\n"
-            send_user " -> $test: TEST-FAIL\n"}  }
-send "exit\n"
-
-expect eof
-EOF
diff --git a/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_mdadm.sh b/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_mdadm.sh
deleted file mode 100644
index 57a4a93..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_mdadm.sh
+++ /dev/null
@@ -1,70 +0,0 @@
-#!/bin/sh
-
-#  In the target start mdadm, and confirm the process condition by command ps.
-
-test="mdadm"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-service_status=$(exec_service_on_target mdmonitor is-active)
-
-exec_service_on_target mdmonitor stop
-
-if [ -f /etc/mdadm.conf ]
-then
-    cp /etc/mdadm.conf /etc/mdadm.conf_bak
-fi
-
-echo "MAILADDR root@mydomain.tld" >> /etc/mdadm.conf
-
-restore_target() {
-    if [ -f /etc/mdadm.conf_bak ]
-    then
-        mv /etc/mdadm.conf_bak /etc/mdadm.conf
-    else
-        rm -f /etc/mdadm.conf
-    fi
-}
-
-if exec_service_on_target mdmonitor start
-then
-    echo " -> start of mdmonitor succeeded."
-else
-    echo " -> start of mdmonitor failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if ps aux | grep "[/]sbin/mdadm"
-then
-    echo " -> get the process of mdadm."
-else
-    echo " -> can't get the process of mdadm."
-    echo " -> $test: TEST-FAIL"
-    exec_service_on_target mdmonitor stop
-    restore_target
-    if [ "$service_status" = "active" ]
-    then
-        exec_service_on_target mdmonitor start
-    fi
-    exit
-fi
-
-exec_service_on_target mdmonitor stop
-
-if ps aux | grep "[/]sbin/mdadm"
-then
-    echo " -> $test: TEST-FAIL"
-else
-    echo " -> $test: TEST-PASS"
-fi
-restore_target
-if [ "$service_status" = "active" ]
-then
-    exec_service_on_target mdmonitor start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_opensafd.sh_bak b/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_opensafd.sh_bak
deleted file mode 100644
index b08f9fc..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_opensafd.sh_bak
+++ /dev/null
@@ -1,71 +0,0 @@
-#!/bin/sh
-
-#  In the target start opensafd, and confirm the process condition by command ps.
-
-test="opensafd"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target opensafd stop
-
-cp /etc/opensaf/nid.conf /etc/opensaf/nid.conf_bak cp 
-/etc/opensaf/dtmd.conf /etc/opensaf/dtmd.conf_bak cp 
-/etc/opensaf/node_name /etc/opensaf/node_name_bak cp /etc/plmcd.conf 
-/etc/plmcd.conf_bak
-
-sed -i 's/REBOOT_TIMEOUT=60/REBOOT_TIMEOUT=0/g' /etc/opensaf/nid.conf 
-sed -i 's/GROUP=opensaf/GROUP=root/g' /etc/opensaf/nid.conf sed -i 
-'s/USER=opensaf/USER=root/g' /etc/opensaf/nid.conf
-
-sed -i 's/10.130.100.114/$test_target/g' /etc/opensaf/dtmd.conf
-
-echo $hostname > /etc/opensaf/node_name
-
-cd /usr/share/opensaf/immxml/; ./immxml-clustersize -s 1 sed -i 's/1 
-SC-1/1 $test_host_name/g' nodes.cfg rm imm.xml.* ./immxml-configure; cp 
-imm.xml.* /etc/opensaf/imm.xml
-
-sed -i 's/0020f/safEE=SC-1,safDomain=domain_1/g' /etc/plmcd.conf sed -i 
-'s/10.105.1.3/$test_target/g' /etc/plmcd.conf sed -i 
-'s/10.105.1.6/$test_target/g' /etc/plmcd.conf sed -i 
-'s/1;os;Fedora;2.6.31/1;os;SUSE;2.6/g' /etc/plmcd.conf
-
-restore_target() {
-    mv /etc/opensaf/nid.conf_bak /etc/opensaf/nid.conf
-    mv /etc/opensaf/dtmd.conf_bak /etc/opensaf/dtmd.conf
-    mv /etc/opensaf/node_name_bak /etc/opensaf/node_name
-    mv /etc/plmcd.conf_bak /etc/plmcd.conf
-    rm -rf /usr/share/opensaf/immxml/imm.xml.* /etc/opensaf/imm.xml 
-/usr/share/opensaf/immxml/nodes.cfg
- }
-
-if exec_service_on_target opensafd start then
-    echo " -> start of opensafd succeeded."
-else
-    echo " -> start of opensafd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-sleep 5
-
-if ps aux | grep -v grep | grep "opensaf"
-then
-    echo " -> get the process of opensafd."
-else
-    echo " -> can't get the process of opensafd."
-    echo " -> $test: TEST-FAIL"
-    exec_service_on_target opensafd stop
-    exit
-fi
-
-exec_service_on_target opensafd stop
-
-if ps aux | grep -v grep | grep "opensaf"
-then
-    echo " -> $test: TEST-FAIL"
-else
-    echo " -> $test: TEST-PASS"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_smartd.sh_bak b/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_smartd.sh_bak
deleted file mode 100644
index 082d498..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.demo/tests/demo_smartd.sh_bak
+++ /dev/null
@@ -1,51 +0,0 @@
-#!/bin/sh
-
-#  In the target start smartd, and confirm the process condition by command ps.
-
-test="smartd"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-service_status=$(exec_service_on_target smartd is-active)
-
-exec_service_on_target smartd stop
-
-if exec_service_on_target smartd start
-then
-    echo " -> start of smartd succeeded."
-else
-    echo " -> start of smartd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-sleep 5
-
-if ps aux | grep "[/]usr/sbin/smartd"
-then
-    echo " -> get the process of smartd."
-else
-    echo " -> can't get the process of smartd."
-    echo " -> $test: TEST-FAIL"
-    if [ "$service_status" != "active" ]
-    then
-        exec_service_on_target smartd stop
-    fi
-    exit
-fi
-
-exec_service_on_target smartd stop
-
-if ps aux | grep "[/]usr/sbin/smartd"
-then
-    echo " -> $test: TEST-FAIL"
-else
-    echo " -> $test: TEST-PASS"
-fi
-
-if [ "$service_status" = "active" ]
-then
-    exec_service_on_target smartd start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.dhcrelay/tests/dhcrelay_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.dhcrelay/tests/dhcrelay_syslog.sh_bak
deleted file mode 100644
index a4e0f87..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.dhcrelay/tests/dhcrelay_syslog.sh_bak
+++ /dev/null
@@ -1,80 +0,0 @@
-#!/bin/sh
-
-#  In the target start dhcpd6, and check the messages of /var/log/syslog.
-#  check the keyword "dhcpd".
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-dhcrelay_status=$(exec_service_on_target dhcrelay is-active)
-dnsmasq_status=$(exec_service_on_target dnsmasq is-active)
-
-remote_ifeth=$(ifconfig | cut -d' ' -f1 | sed -n 1p)
-exec_service_on_target dhcrelay stop
-exec_service_on_target dnsmasq stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-if [ -f /etc/default/dhcp-relay ]
-then
-    cp /etc/default/dhcp-relay /etc/default/dhcp-relay_bak
-fi
-
-restore_target() {
-    if [ -f /etc/default/dhcp-relay_bak ]
-    then
-        mv /etc/default/dhcp-relay_bak /etc/default/dhcp-relay
-    fi
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-echo "SERVERS=\"192.168.246.100\"" >  /etc/default/dhcp-relay
-echo "INTERFACES=\"$remote_ifeth\"" >> /etc/default/dhcp-relay
-echo "OPTIONS=\"\"" >> /etc/default/dhcp-relay
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target dhcrelay start
-then
-    echo " -> start of dhcrelay succeeded."
-else
-    echo " -> start of dhcrelay failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    if [ "$dnsmasq_status" = "active" ]
-    then
-        exec_service_on_target dnsmasq start
-    fi
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "DHCP Relay"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-exec_service_on_target dhcrelay stop
-restore_target
-
-if [ "$dhcrelay_status" = "active" ]
-then
-    exec_service_on_target dhcrelay start
-fi
-if [ "$dnsmasq_status" = "active" ]
-then
-    exec_service_on_target dnsmasq start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.dovecot/tests/dovecot_logfile.sh_bak b/fuego-core-ubinux/fuego-core/Functional.dovecot/tests/dovecot_logfile.sh_bak
deleted file mode 100644
index a262915..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.dovecot/tests/dovecot_logfile.sh_bak
+++ /dev/null
@@ -1,79 +0,0 @@
-#!/bin/sh
-
-#  In the target to start dovecot dovecot, to confirm the acquisition of the log.
-#  check the keyword "dovecot".
-
-test="logfile"
-
-dovecot_status=$(get_service_status dovecot)
-logger_service=$(detect_logger_service)
-postfix_status=$(get_service_status postfix)
-
-exec_service_on_target postfix stop
-exec_service_on_target dovecot stop
-
-if [ -f /var/log/mail.log ]
-then
-    mv /var/log/mail.log /var/log/mail.log_bak
-fi
-
-if [ -f /var/log/messages ]
-then
-    mv /var/log/messages /var/log/messages_bak
-fi
-
-restore_target() {
-    if [ "$postfix_status" = "inactive" ]
-    then
-        exec_service_on_target postfix stop
-    fi
-    if [ -f /var/log/messages_bak ]
-    then
-        mv /var/log/messages_bak /var/log/messages
-    fi
-    if [ -f /var/log/mail.log_bak ]
-    then
-        mv /var/log/mail.log_bak /var/log/mail.log
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-sleep 3
-
-exec_service_on_target postfix start
-
-if exec_service_on_target dovecot start
-then
-    echo " -> start of dovecot succeeded."
-else
-    echo " -> start of dovecot failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 3
-
-if grep "dovecot" /var/log/mail.log
-then
-    echo " -> grep dovecto from mail.log"
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't grep dovecot from mail.log"
-    if grep "dovecot" /var/log/messages
-    then
-        echo " -> grep dovecto from messages"
-        echo " -> $test: TEST-PASS"
-    else
-        echo " -> can't grep dovecot from messages"
-        echo " -> $test: TEST-FAIL"
-    fi
-fi
-
-exec_service_on_target dovecot stop
-restore_target
-if [ "$dovecot_status" = "active" -o "$dovecot_status" = "unknown" ]
-then
-    exec_service_on_target dovecot start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.glibc/glibc_tests.tar.gz-bak b/fuego-core-ubinux/fuego-core/Functional.glibc/glibc_tests.tar.gz-bak
deleted file mode 100644
index c8cda284d78c450e4b2912bd37aa9e545d98e2b4..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 17814
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

diff --git a/fuego-core-ubinux/fuego-core/Functional.initscripts/tests/initscripts_ifdown-ifup.sh_bak b/fuego-core-ubinux/fuego-core/Functional.initscripts/tests/initscripts_ifdown-ifup.sh_bak
deleted file mode 100644
index ed1d2eb..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.initscripts/tests/initscripts_ifdown-ifup.sh_bak
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh
-
-# In target, run command ifdown/ifup.
-# option: none
-
-test="ifdown/ifup"
-
-if [ ! -f /etc/sysconfig/network-scripts/ifcfg-lo ]
-then
-    echo " -> $test: ifcfg file is not exist."
-    echo " -> $test: TEST-SKIP"
-    exit 0
-fi
-
-if ifdown lo
-then
-    echo " -> $test: ifdown lo succeeded."
-else
-    echo " -> $test: ifdown lo  failed."
-    echo " -> $test: TEST-FAIL"
-    exit 0
-fi
-
-if ifup lo
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.interactive/tests/interactive_crda.sh b/fuego-core-ubinux/fuego-core/Functional.interactive/tests/interactive_crda.sh
deleted file mode 100644
index b2994cc..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.interactive/tests/interactive_crda.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-#  The testscript checks the command crda.
-#  option: -h
-
-test="crda"
-
-crda -h > log 2>&1
-if cat log | grep "Usage"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
-
diff --git a/fuego-core-ubinux/fuego-core/Functional.kbd/tests/chvt.sh_bak b/fuego-core-ubinux/fuego-core/Functional.kbd/tests/chvt.sh_bak
deleted file mode 100644
index 7bdeaf0..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.kbd/tests/chvt.sh_bak
+++ /dev/null
@@ -1,30 +0,0 @@
-#!/bin/sh
-
-#  In the target to execute command chvt and confirm the result.
-
-test="chvt"
-
-if tty | grep "^not" ; then
-    echo " -> $test: test script not running in a changable tty"
-    echo " -> $test: TEST-SKIP"
-    exit 0
-fi
-
-tty_path=$(tty)
-# use shell variable sub-string removal to isolate the tty number
-anum=${tty_path##*/}
-if [ $anum -eq 1 ]
-then
-    bnum=$(($anum+1))
-else
-    bnum=$(($anum-1))
-fi
-echo "$test: Changing to VT $bnum"
-if chvt $bnum
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi;
-echo "$test: Changing back to VT $bnum"
-chvt $anum
diff --git a/fuego-core-ubinux/fuego-core/Functional.kbd/tests/kbdrate1.sh_bak b/fuego-core-ubinux/fuego-core/Functional.kbd/tests/kbdrate1.sh_bak
deleted file mode 100644
index 6c8ba8b..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.kbd/tests/kbdrate1.sh_bak
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-#  In the target to execute command kbdrate and confirm the result.
-#  option: -V
-
-test="kbdrate1"
-
-if kbdrate | grep "Typematic"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.kbd/tests/kbdrate2.sh_bak b/fuego-core-ubinux/fuego-core/Functional.kbd/tests/kbdrate2.sh_bak
deleted file mode 100644
index 33d3b37..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.kbd/tests/kbdrate2.sh_bak
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-#  In the target to execute command kbdrate and confirm the result.
-#  option : -r
-
-test="kbdrate2"
-
-if kbdrate -r 15 -d 250
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.logd/tests/logd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.logd/tests/logd_syslog.sh_bak
deleted file mode 100644
index d54ab92..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.logd/tests/logd_syslog.sh_bak
+++ /dev/null
@@ -1,56 +0,0 @@
-#!/bin/sh
-
-#  In the target start logd, and check the messages of /var/log/syslog.
-#  check the keyword "logd".
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-logd_status=$(exec_service_on_target logd is-active)
-
-exec_service_on_target logd stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-restore_target(){
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target logd start
-then
-    echo " -> start of logd succeeded."
-else
-    echo " -> start of logd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "logd"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-exec_service_on_target logd stop
-restore_target
-if [ "$logd_status" = "active" ]
-then
-    exec_service_on_target logd start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.logwatch/tests/logwatch_detail.sh_bak b/fuego-core-ubinux/fuego-core/Functional.logwatch/tests/logwatch_detail.sh_bak
deleted file mode 100644
index 4d7073a..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.logwatch/tests/logwatch_detail.sh_bak
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-
-#  Run logwatch and print the log to standard output.
-#  option: --detail
-
-test="detail"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-service_status=$(get_service_status $logger_service)
-
-exec_service_on_target $logger_service stop
-
-exec_service_on_target $logger_service restart
-cp /usr/share/logwatch/default.conf/services/*.conf /etc/logwatch/conf/services
-
-mv /etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf_bak
-cp data/logwatch.conf /etc/logwatch/conf/logwatch.conf
-
-mkdir test_dir
-logwatch --detail 10 --service kernel > test_dir/test.log
-
-if cat test_dir/test.log | grep "Kernel"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-rm -fr test_dir
-rm -f /etc/logwatch/conf/services/*.conf
-
-if [ "$service_status" = "inactive" ]
-then
-    exec_service_on_target $logger_service stop
-fi
-mv /etc/logwatch/conf/logwatch.conf_bak /etc/logwatch/conf/logwatch.conf
diff --git a/fuego-core-ubinux/fuego-core/Functional.logwatch/tests/logwatch_mailto.sh_bak b/fuego-core-ubinux/fuego-core/Functional.logwatch/tests/logwatch_mailto.sh_bak
deleted file mode 100644
index dca35ff..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.logwatch/tests/logwatch_mailto.sh_bak
+++ /dev/null
@@ -1,62 +0,0 @@
-#!/bin/sh
-
-#  Run logwatch and print the log to standard output.
-#  option: --mailto
-
-test="mailto"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-syslog_status=$(get_service_status $logger_service)
-postfix_status=$(get_service_status postfix)
-exec_service_on_target $logger_service stop
-exec_service_on_target postfix stop
-
-exec_service_on_target $logger_service restart
-cp /usr/share/logwatch/default.conf/services/*.conf /etc/logwatch/conf/services
-
-mv /etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf_bak
-cp data/logwatch.conf /etc/logwatch/conf/logwatch.conf
-
-mv /etc/postfix/main.cf /etc/postfix/main.cf_bak
-cp data/main.cf /etc/postfix/main.cf
-
-exec_service_on_target postfix restart
-
-if [ -f /var/spool/mail/$USER ]
-then
-    mv /var/spool/mail/$USER /var/spool/mail/"$USER"_bak
-fi
-
-logwatch --mailto $USER
-
-postqueue -f
-
-sleep 3
-
-if tail /var/spool/mail/$USER | grep "Logwatch"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$syslog_status" = "inactive" ]
-then
-    exec_service_on_target $logger_service stop
-fi
-if [ "$postfix_status" = "inactive" ]
-then
-    exec_service_on_target postfix stop
-fi
-mv /etc/logwatch/conf/logwatch.conf_bak /etc/logwatch/conf/logwatch.conf
-mv /etc/postfix/main.cf_bak /etc/postfix/main.cf
-if [ ! -f /var/spool/mail/"$USER"_bak ]
-then
-    rm /var/spool/mail/$USER
-else
-    mv /var/spool/mail/"$USER"_bak /var/spool/mail/$USER
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.misc/tests/openssh-server_sshd.sh_bak b/fuego-core-ubinux/fuego-core/Functional.misc/tests/openssh-server_sshd.sh_bak
deleted file mode 100644
index fb5d2aa..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.misc/tests/openssh-server_sshd.sh_bak
+++ /dev/null
@@ -1,35 +0,0 @@
-#!/bin/sh
-
-#  In target, run comannd sshd.
-
-test="sshd"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target sshd stop
-if ps aux | grep "[s]shd"
-then
-    echo " -> stop sshd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-else
-    echo " -> stop sshd succeeded."
-fi
-
-if exec_service_on_target sshd start
-then
-    echo " -> start of sshd succeeded."
-else
-    echo " -> start of sshd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if ps aux | grep "[s]shd"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.misc/tests/telnetd.sh-bak b/fuego-core-ubinux/fuego-core/Functional.misc/tests/telnetd.sh-bak
deleted file mode 100644
index fb11ca5..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.misc/tests/telnetd.sh-bak
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-
-#  In target, check if telnetd is exist.
-
-test="telnetd"
-
-if ls /etc/xinetd.d/ | grep "telnet"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.multipathd/tests/multipathd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.multipathd/tests/multipathd_syslog.sh_bak
deleted file mode 100644
index afe1ca8..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.multipathd/tests/multipathd_syslog.sh_bak
+++ /dev/null
@@ -1,72 +0,0 @@
-#!/bin/sh
-
-#  In the target start multipathd, and check the messages of /var/log/syslog.
-#  check the keyword "multipathd".
-
-test="syslog"
-
-logger_service=$(detect_logger_service)
-
-service_status=$(get_service_status multipathd)
-
-exec_service_on_target multipathd stop
-exec_service_on_target $logger_service stop
-
-if [ -f /etc/multipath.conf ]
-then
-    cp /etc/multipath.conf /etc/multipath.conf_bak
-fi
-
-if [ -f /etc/multipath.conf.example ]
-then
-    cp /etc/multipath.conf.example /etc/multipath.conf
-fi
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-restore_target() {
-    if [ -f /etc/multipath.conf_bak ]
-    then
-        mv /etc/multipath.conf_bak /etc/multipath.conf
-    else
-        rm -f /etc/multipath.conf
-    fi
-
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-sleep 2
-
-if exec_service_on_target multipathd start
-then
-    echo " -> start of multipathd succeeded."
-else
-    echo " -> start of multipathd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "multipath"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-exec_service_on_target multipathd stop
-restore_target
-if [ "$service_status" = "active" -o "$service_status" = "unknown" ]
-then
-    exec_service_on_target multipathd start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmpd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmpd_syslog.sh_bak
deleted file mode 100644
index 6d2c38a..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmpd_syslog.sh_bak
+++ /dev/null
@@ -1,55 +0,0 @@
-#!/bin/sh
-
-#  In the target start snmpd.
-# Check the log of snmpd.
-
-test="snmpd_syslog"
-
-logger_service=$(detect_logger_service)
-
-snmpd_status=$(get_service_status snmpd)
-snmpd_logfile=$(get_service_logfile)
-
-exec_service_on_target snmpd stop
-exec_service_on_target $logger_service stop
-
-if [ -f $snmpd_logfile ]
-then
-    mv $snmpd_logfile $snmpd_logfile"_bak"
-fi
-
-restore_target() {
-    if [ -f $snmpd_logfile"_bak" ]
-    then
-        mv $snmpd_logfile"_bak" $snmpd_logfile
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-sleep 2
-
-if exec_service_on_target snmpd start
-then
-    echo " -> start of snmpd succeeded."
-else
-    echo " -> start of snmpd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 3
-
-if cat $snmpd_logfile | grep "snmpd"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$snmpd_status" = "inactive" ]
-then
-    exec_service_on_target snmpd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmpd_syslog_ip.sh_bak b/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmpd_syslog_ip.sh_bak
deleted file mode 100644
index 0b9b7e6..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmpd_syslog_ip.sh_bak
+++ /dev/null
@@ -1,63 +0,0 @@
-#!/bin/sh
-
-#  In the target start snmpd.
-# Check the log of IP address.
-
-test="snmpd_syslog_ip"
-
-logger_service=$(detect_logger_service)
-
-snmpd_status=$(get_service_status snmpd)
-snmpd_logfile=$(get_service_logfile)
-exec_service_on_target snmpd stop
-exec_service_on_target $logger_service stop
-
-if [ -f $snmpd_logfile ]
-then
-    mv $snmpd_logfile $snmpd_logfile"_bak"
-fi
-
-mv /etc/hosts /etc/hosts_bak
-cp data/bind9/hosts /etc/hosts
-mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf_bak
-cp data/net-snmp/snmpd.conf /etc/snmp/snmpd.conf
-
-restore_target() {
-    mv /etc/hosts_bak /etc/hosts
-    mv /etc/snmp/snmpd.conf_bak /etc/snmp/snmpd.conf
-    if [ -f $snmpd_logfile"_bak" ]
-    then
-        mv $snmpd_logfile"_bak" $snmpd_logfile
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-sleep 2
-
-if exec_service_on_target snmpd start
-then
-    echo " -> start of snmpd succeeded."
-else
-    echo " -> start of snmpd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-snmpget -v1 -c RWIINCOM -M /usr/share/snmp/mibs localhost system.sysDescr.0
-
-sleep 3
-
-if cat $snmpd_logfile | grep "127.0.0.1"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$snmpd_status" = "inactive" ]
-then
-    exec_service_on_target snmpd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_coldstart.sh_bak b/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_coldstart.sh_bak
deleted file mode 100644
index 914bc06..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_coldstart.sh_bak
+++ /dev/null
@@ -1,60 +0,0 @@
-#!/bin/sh
-
-#  In the target start snmptrapd, and check the syslog.
-#  check the keyword "SNMPv2-MIB::coldStart".
-
-test="snmptrapd_coldstart.sh"
-
-snmptrapd_status=$(get_service_status snmptrapd)
-snmptrapd_logfile=$(get_service_logfile)
-logger_service=$(detect_logger_service)
-
-exec_service_on_target snmptrapd stop
-exec_service_on_target $logger_service stop
-
-mv /etc/snmp/snmptrapd.conf /etc/snmp/snmptrapd.conf_bak
-cp data/net-snmp/snmptrapd.conf /etc/snmp/snmptrapd.conf
-
-restore_target() {
-    mv /etc/snmp/snmptrapd.conf_bak /etc/snmp/snmptrapd.conf
-    if [ -f $snmptrapd_logfile"_bak" ]
-    then
-        mv $snmptrapd_logfile"_bak" $snmptrapd_logfile
-    fi
-}
-
-if [ -f $snmptrapd_logfile ]
-then
-    mv $snmptrapd_logfile $snmptrapd_logfile"_bak"
-fi
-
-exec_service_on_target $logger_service restart
-
-sleep 2
-
-if exec_service_on_target snmptrapd start
-then
-    echo " -> start of snmptrapd succeeded."
-else
-    echo " -> start of snmptrapd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-snmptrap -v2c -c "" -M /usr/share/snmp/mibs localhost "" SNMPv2-MIB::coldStart
-
-sleep 3
-
-if cat $snmptrapd_logfile | grep "SNMPv2-MIB::coldStart"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$snmptrapd_status" = "inactive" ]
-then
-    exec_service_on_target snmptrapd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_syslog.sh_bak
deleted file mode 100644
index 8882416..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_syslog.sh_bak
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh
-
-#  In the target start snmptrapd, and check if the $snmptrapd_logfile
-#  check the keyword "snmptrapd".
-
-test="snmptrapd_syslog"
-
-logger_service=$(detect_logger_service)
-
-snmptrapd_status=$(get_service_status snmptrapd)
-snmptrapd_logfile=$(get_service_logfile)
-exec_service_on_target snmptrapd stop
-exec_service_on_target $logger_service stop
-
-if [ -f $snmptrapd_logfile ]
-then
-    mv $snmptrapd_logfile $snmptrapd_logfile"_bak"
-fi
-
-restore_target() {
-    if [ -f $snmptrapd_logfile"_bak" ]
-    then
-        mv $snmptrapd_logfile"_bak" $snmptrapd_logfile
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-sleep 3
-
-if exec_service_on_target snmptrapd start
-then
-    echo " -> start of snmptrapd succeeded."
-else
-    echo " -> start of snmptrapd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 3
-
-if cat $snmptrapd_logfile | grep "snmptrapd"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$snmptrapd_status" = "inactive" ]
-then
-    exec_service_on_target snmptrapd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_warmstart.sh_bak b/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_warmstart.sh_bak
deleted file mode 100644
index 1cc9ffe..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.net-snmp/tests/snmptrapd_warmstart.sh_bak
+++ /dev/null
@@ -1,61 +0,0 @@
-#!/bin/sh
-
-#  In the target start snmptrapd, and check the syslog.
-#  check the keyword "SNMPv2-MIB::warmStart".
-
-test="snmptrapd_warmstart"
-
-snmptrapd_status=$(get_service_status snmptrapd)
-snmptrapd_logfile=$(get_service_logfile)
-logger_service=$(detect_logger_service)
-
-exec_service_on_target snmptrapd stop
-exec_service_on_target $logger_service stop
-
-mv /etc/snmp/snmptrapd.conf /etc/snmp/snmptrapd.conf_bak
-cp data/net-snmp/snmptrapd.conf /etc/snmp/snmptrapd.conf
-
-restore_target() {
-    mv /etc/snmp/snmptrapd.conf_bak /etc/snmp/snmptrapd.conf
-    if [ -f $snmptrapd_logfile"_bak" ]
-    then
-        mv $snmptrapd_logfile"_bak" $snmptrapd_logfile
-    fi
-}
-
-
-if [ -f $snmptrapd_logfile ]
-then
-    mv $snmptrapd_logfile $snmptrapd_logfile"_bak"
-fi
-
-exec_service_on_target $logger_service restart
-
-sleep 2
-
-if exec_service_on_target snmptrapd start
-then
-    echo " -> start of snmptrapd succeeded."
-else
-    echo " -> start of snmptrapd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-snmptrap -v2c -c "" -M /usr/share/snmp/mibs localhost "" SNMPv2-MIB::warmStart
-
-sleep 3
-
-if cat $snmptrapd_logfile | grep "SNMPv2-MIB::warmStart"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$snmptrapd_status" = "inactive" ]
-then
-    exec_service_on_target snmptrapd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.net-tools/tests/net-tools_netstat2.sh-bak b/fuego-core-ubinux/fuego-core/Functional.net-tools/tests/net-tools_netstat2.sh-bak
deleted file mode 100644
index 6870860..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.net-tools/tests/net-tools_netstat2.sh-bak
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/sh
-
-#  In target, run command netstat to display listening socket information.
-#  option: -a
-
-test="netstat2"
-
-mkdir test_dir
-netstat -a > test_dir/netstat.log
-
-if cat test_dir/netstat.log | grep telnet
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi;
-rm -fr test_dir
diff --git a/fuego-core-ubinux/fuego-core/Functional.nfs/tests/nfsserver_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.nfs/tests/nfsserver_syslog.sh_bak
deleted file mode 100644
index c1359c2..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.nfs/tests/nfsserver_syslog.sh_bak
+++ /dev/null
@@ -1,90 +0,0 @@
-#!/bin/sh
-
-#  In the target start nfs-server, and check the messages of /var/log/syslog.
-#  check the keyword "dhcpd".
-
-test="nfsserver_syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-if [ "$init_manager" = "systemd" ]
-then
-    service_name="nfs-server"
-else
-    service_name="nfsserver"
-fi
-
-nfs_status=$(get_service_status $service_name)
-rpcbind_status=$(get_service_status rpcbind)
-
-exec_service_on_target rpcbind stop
-exec_service_on_target $service_name stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-if [ -f /etc/exports ]
-then
-    mv /etc/exports /etc/exports_bak
-fi
-
-touch /etc/exports
-
-restore_target() {
-    if [ -f /etc/exports_bak ]
-    then
-        mv /etc/exports_bak /etc/exports
-    else
-        rm -f /etc/exports
-    fi
-
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-exec_service_on_target rpcbind start
-if exec_service_on_target $service_name start
-then
-    echo " -> start of nfs-server succeeded."
-else
-    echo " -> start of nfs-server failed."
-    echo " -> $test: TEST-FAIL"
-    if [ "$rpcbind_status" = "inactive" ]
-    then
-        exec_service_on_target rpcbind stop
-    fi
-    restore_target
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep  "NFS"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-exec_service_on_target rpcbind stop
-exec_service_on_target $service_name stop
-restore_target
-
-if [ "$nfs_status" = "active" -o "$nfs_status" = "unknown" ]
-then
-    exec_service_on_target $service_name start
-fi
-
-if [ "$rpcbind_status" = "active" -o "$rpcbind_status" = "unknown" ]
-then
-    exec_service_on_target rpcbind start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.nscd/tests/nscd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.nscd/tests/nscd_syslog.sh_bak
deleted file mode 100644
index 548960c..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.nscd/tests/nscd_syslog.sh_bak
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/bin/sh
-
-#  In the target start nscd, and check the messages of /var/log/syslog.
-#  check the keyword "nscd".
-
-test="syslog"
-
-logger_service=$(detect_logger_service)
-
-nscd_status=$(exec_service_on_target nscd status)
-
-exec_service_on_target nscd stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-restore_target(){
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target nscd start
-then
-    echo " -> start of nscd succeeded."
-else
-    echo " -> start of nscd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "starting up"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$nscd_status" = "inactive" ]
-then
-    exec_service_on_target nscd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_ntptime.sh_bak b/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_ntptime.sh_bak
deleted file mode 100644
index 4d5f961..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_ntptime.sh_bak
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/sh
-
-#  In target, run command ntptime.
-#  option: none
-
-test="ntptime"
-
-service_status=$(get_service_status ntpd)
-
-if exec_service_on_target ntpd restart
-then
-    echo " -> $test: ntpd restart succeeded."
-else
-    echo " -> $test: ntpd restart failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if ntptime | grep OK
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi;
-if [ "$service_status" = "inactive" ]
-then
-    exec_service_on_target ntpd stop
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_pid.sh b/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_pid.sh
deleted file mode 100644
index 61e5a9a..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_pid.sh
+++ /dev/null
@@ -1,57 +0,0 @@
-#!/bin/sh
-
-#  In target start ntpd and verify the process of creating the process ID file by ntpd.
-#  option: none.
-
-test="pid"
-
-service_status=$(get_service_status ntpd)
-
-exec_service_on_target ntpd stop
-
-if [ -f /var/run/ntpd.pid ]
-then
-   rm -f /var/run/ntpd.pid
-fi
-
-if exec_service_on_target ntpd start
-then
-    echo " -> $test: ntpd start succeeded."
-else
-    echo " -> $test: ntpd start failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if ls /var/run/ntpd.pid
-then
-    echo " -> $test: ntpd pid is exist."
-else
-    echo " -> $test: ntpd pid is not exist."
-    echo " -> $test: TEST-FAIL"
-    if [ "$service_status" = "inactive" ]
-    then
-        exec_service_on_target ntpd stop
-    fi
-    exit
-fi
-
-if exec_service_on_target ntpd stop
-then
-    echo " -> $test: ntpd stop succeeded."
-else
-    echo " -> $test: ntpd stop failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if test ! -f /var/run/ntpd.pid
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-if [ "$service_status" = "active" -o "$service_status" = "unknown" ]
-then
-    exec_service_on_target ntpd start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_syslog.sh_bak
deleted file mode 100644
index 41134c2..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ntp/tests/ntp_syslog.sh_bak
+++ /dev/null
@@ -1,55 +0,0 @@
-#!/bin/sh
-
-#  In target, start ntpd and verify the ntpd syslog.
-#  option: none
-
-test="syslog"
-
-service_status=$(get_service_status ntpd)
-logger_service=$(detect_logger_service)
-
-ntpd_logfile=$(get_service_logfile)
-
-exec_service_on_target ntpd stop
-exec_service_on_target $logger_service stop
-
-if [ -f $ntpd_logfile ]
-then
-    mv $ntpd_logfile $ntpd_logfile"_bak"
-fi
-
-restore_target() {
-    if [ -f $ntpd_logfile ]
-    then
-        mv $ntpd_logfile $ntpd_logfile"_bak"
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-sleep 3
-
-if exec_service_on_target ntpd start
-then
-    echo " -> $test: ntpd start succeeded."
-else
-    echo " -> $test: ntpd start failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 10
-
-if cat $ntpd_logfile | grep "ntpd"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$service_status" = "inactive" ]
-then
-    exec_service_on_target ntpd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.openssh/tests/openssh_pidfile.sh_bak b/fuego-core-ubinux/fuego-core/Functional.openssh/tests/openssh_pidfile.sh_bak
deleted file mode 100644
index d30df75..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.openssh/tests/openssh_pidfile.sh_bak
+++ /dev/null
@@ -1,61 +0,0 @@
-#!/bin/sh
-
-#  In the target start sshd, and check if the /var/run/sshd.pid is exist.
-
-test="pidfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-service_status=$(exec_service_on_target sshd is-active)
-
-exec_service_on_target sshd.socket stop
-
-exec_service_on_target sshdgenkeys restart
-
-if exec_service_on_target sshd.socket start
-then
-    echo " -> start sshd succeeded."
-else
-    echo " -> start sshd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-sleep 5
-
-if ls /var/run/sshd.pid
-then
-    echo " -> /var/run/sshd.pid is exist."
-else
-    echo " -> /var/run/sshd.pid is not exist."
-    echo " -> $test: TEST-FAIL"
-    if [ $service_status != "active" ]
-    then
-        exec_service_on_target sshd.socket stop
-    fi
-    exit
-fi
-
-if exec_service_on_target sshd.socket stop
-then
-    echo " -> stop sshd succeeded."
-else
-    echo " -> stop sshd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-sleep 5
-
-if test ! -f /var/run/sshd.pid
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-if [ $service_status = "active" ]
-then
-    exec_service_on_target sshd.socket start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.openssh/tests/openssh_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.openssh/tests/openssh_syslog.sh_bak
deleted file mode 100644
index a0897ce..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.openssh/tests/openssh_syslog.sh_bak
+++ /dev/null
@@ -1,49 +0,0 @@
-#!/bin/sh
-
-#  In the target start sshd, and check the messages of /var/log/syslog.
-#  check the keyword "sshd".
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-exec_service_on_target sshd.socket stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-restore_target(){
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target sshd.socket start
-then
-    echo " -> start of sshd succeeded."
-else
-    echo " -> start of sshd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if cat /var/log/syslog | grep "starting up"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_pid.sh b/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_pid.sh
deleted file mode 100644
index dbcb61a..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_pid.sh
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/bin/sh
-
-#  In the target, run openvpn and check the pidfile.
-
-test="pid_$1"
-
-test_type=$1
-
-setup_routine $test_type
-
-if exec_service_on_target $service_name start
-then
-    echo " -> $test: service start succeeded."
-else
-    echo " -> $test: service start failed."
-    echo " -> $test: TEST-FAIL"
-    restore_routine
-    exit
-fi
-
-if [ -f $pid_file ]
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-if [ "$service_status" = "inactive" ]
-then
-    exec_service_on_target $service_name stop
-fi
-restore_routine
diff --git a/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_pid.sh-old b/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_pid.sh-old
deleted file mode 100644
index dbcb61a..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_pid.sh-old
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/bin/sh
-
-#  In the target, run openvpn and check the pidfile.
-
-test="pid_$1"
-
-test_type=$1
-
-setup_routine $test_type
-
-if exec_service_on_target $service_name start
-then
-    echo " -> $test: service start succeeded."
-else
-    echo " -> $test: service start failed."
-    echo " -> $test: TEST-FAIL"
-    restore_routine
-    exit
-fi
-
-if [ -f $pid_file ]
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-if [ "$service_status" = "inactive" ]
-then
-    exec_service_on_target $service_name stop
-fi
-restore_routine
diff --git a/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_syslog-ng.sh_bak b/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_syslog-ng.sh_bak
deleted file mode 100644
index 8dd84ee..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.openvpn/tests/openvpn_syslog-ng.sh_bak
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/sh
-
-#  In the target, run openvpn and check the message of syslog-ng.
-
-test="syslog-ng_$1"
-
-test_type=$1
-
-setup_routine $test_type
-logger_service=$(detect_logger_service)
-openvpn_logfile=$(get_service_logfile)
-
-exec_service_on_target $logger_service stop
-
-if [ -f $openvpn_logfile ]
-then
-    mv $openvpn_logfile $openvpn_logfile"_bak"
-fi
-
-exec_service_on_target $logger_service restart
-
-sleep 2
-
-exec_service_on_target $service_name start
-
-sleep 5
-
-if cat $openvpn_logfile | grep OpenVPN
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-exec_service_on_target $service_name stop
-
-restore_routine
-
-if [ "$service_status" = "active" -o "$service_status" = "unknown" ]
-then
-    exec_service_on_target $service_name start
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.openwsmand/tests/openwsmand_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.openwsmand/tests/openwsmand_syslog.sh_bak
deleted file mode 100644
index f1044f4..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.openwsmand/tests/openwsmand_syslog.sh_bak
+++ /dev/null
@@ -1,60 +0,0 @@
-#!/bin/sh
-
-#  In the target start openwsmand, and check the messages of /var/log/syslog.
-#  check the keyword "openwsmand".
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-openwsmand_status=$(exec_service_on_target openwsmand is-active)
-
-exec_service_on_target openwsmand stop
-exec_service_on_target $logger_service stop
-
-cp /etc/openwsman/ssleay.cnf /etc/openwsman/ssleay.cnf_bak
-
-sed -i 's/random/urandom/g' /etc/openwsman/ssleay.cnf
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-restore_target(){
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-    mv /etc/openwsman/ssleay.cnf_bak /etc/openwsman/ssleay.cnf
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target openwsmand start
-then
-    echo " -> start of openwsmand succeeded."
-else
-    echo " -> start of openwsmand failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "openwsman"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$openwsmand_status" != "active" ]
-then
-    exec_service_on_target openwsmand stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.ospf6d/tests/ospf6d_logfile.sh b/fuego-core-ubinux/fuego-core/Functional.ospf6d/tests/ospf6d_logfile.sh
deleted file mode 100644
index a9c7c17..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ospf6d/tests/ospf6d_logfile.sh
+++ /dev/null
@@ -1,72 +0,0 @@
-#!/bin/sh
-
-#  In the target start ospf6d and zebra, then confirm the log file.
-#  check the /var/log/quagga/ospf6d.log file.
-
-test="logfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target ospf6d stop
-exec_service_on_target zebra stop
-
-if [ ! -d /var/log/quagga ]
-then
-   mkdir /var/log/quagga
-   chown -R quagga:quagga /var/log/quagga
-fi
-
-if [ -f /var/log/quagga/ospf6d.log ]
-then
-   mv /var/log/quagga/ospf6d.log /var/log/quagga/ospf6d.log.bck
-fi
-
-#Backup the config file
-mv /etc/quagga/ospf6d.conf /etc/quagga/ospf6d.conf.bck
-mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf.bck
-
-cp data/ospf6d.conf /etc/quagga/ospf6d.conf
-cp data/zebra.conf /etc/quagga/zebra.conf
-chown quagga:quagga /etc/quagga/*.conf
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target ospf6d start
-then
-    echo " -> start of ospf6d succeeded."
-else
-    echo " -> start of ospf6d failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if ls /var/log/quagga/ospf6d.log
-then
-    echo " -> get log file of ospf6d."
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get log file of ospf6d."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-exec_service_on_target ospf6d stop
-exec_service_on_target zebra stop
-
-#Restore the config file
-mv /etc/quagga/ospf6d.conf.bck /etc/quagga/ospf6d.conf
-mv /etc/quagga/zebra.conf.bck /etc/quagga/zebra.conf
-
-if [ -f /var/log/quagga/ospf6d.log.bck ]
-then
-    mv /var/log/quagga/ospf6d.log.bck /var/log/quagga/ospf6d.log
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.ospf6d/tests/ospf6d_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.ospf6d/tests/ospf6d_syslog.sh_bak
deleted file mode 100644
index ff61a96..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ospf6d/tests/ospf6d_syslog.sh_bak
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/sh
-
-#  In the target start ospf6d and zebra.
-#  At the same time, start syslog-ng and check the keyword "ospf6d" in syslog.
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target ospf6d stop
-exec_service_on_target zebra stop
-exec_service_on_target syslog-ng stop
-
-rm -f /var/run/quagga/ospf6d.pid
-#Backup the config file
-mv /etc/quagga/ospf6d.conf /etc/quagga/ospf6d.conf.bck
-mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf.bck
-#Backup the config file
-mv /var/log/syslog /var/log/syslog.bck
-
-cp data/ospf6d.conf /etc/quagga/ospf6d.conf
-cp data/zebra.conf /etc/quagga/zebra.conf
-chown quagga:quagga /etc/quagga/*.conf
-
-if exec_service_on_target syslog-ng restart
-then
-    echo " -> restart of syslog-ng succeeded."
-else
-    echo " -> restart of syslog-ng failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target ospf6d start
-then
-    echo " -> start of ospf6d succeeded."
-else
-    echo " -> start of ospf6d failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "ospf6d"
-then
-    echo " -> get the syslog of ospf6d."
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the syslog of ospf6d."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-exec_service_on_target ospf6d stop
-exec_service_on_target zebra stop
-
-#Restore the config file
-mv /etc/quagga/ospf6d.conf.bck /etc/quagga/ospf6d.conf
-mv /etc/quagga/zebra.conf.bck /etc/quagga/zebra.conf
-#Restore the config file
-mv /var/log/syslog.bck /var/log/syslog
diff --git a/fuego-core-ubinux/fuego-core/Functional.ospfd/tests/ospfd_logfile.sh b/fuego-core-ubinux/fuego-core/Functional.ospfd/tests/ospfd_logfile.sh
deleted file mode 100644
index d7ebc9d..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ospfd/tests/ospfd_logfile.sh
+++ /dev/null
@@ -1,72 +0,0 @@
-#!/bin/sh
-
-#  In the target start ospfd and zebra, then confirm the log file.
-#  check the /var/log/quagga/ospfd.log file.
-
-test="logfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target ospfd stop
-exec_service_on_target zebra stop
-
-if [ ! -d /var/log/quagga ]
-then
-   mkdir /var/log/quagga
-   chown -R quagga:quagga /var/log/quagga
-fi
-
-if [ -f /var/log/quagga/ospfd.log ]
-then
-   mv /var/log/quagga/ospfd.log /var/log/quagga/ospfd.log.bck
-fi
-
-#Backup the config file
-mv /etc/quagga/ospfd.conf /etc/quagga/ospfd.conf.bck
-mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf.bck
-
-cp data/ospfd.conf /etc/quagga/ospfd.conf
-cp data/zebra.conf /etc/quagga/zebra.conf
-chown quagga:quagga /etc/quagga/*.conf
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target ospfd start
-then
-    echo " -> start of ospfd succeeded."
-else
-    echo " -> start of ospfd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if ls /var/log/quagga/ospfd.log
-then
-    echo " -> get log file of ospfd."
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get log file of ospfd."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-exec_service_on_target ospfd stop
-exec_service_on_target zebra stop
-
-#Restore the config file
-mv /etc/quagga/ospfd.conf.bck /etc/quagga/ospfd.conf
-mv /etc/quagga/zebra.conf.bck /etc/quagga/zebra.conf
-
-if [ -f /var/log/quagga/ospfd.log.bck ]
-then
-    mv /var/log/quagga/ospfd.log.bck /var/log/quagga/ospfd.log
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.ospfd/tests/ospfd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.ospfd/tests/ospfd_syslog.sh_bak
deleted file mode 100644
index 2cec54a..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ospfd/tests/ospfd_syslog.sh_bak
+++ /dev/null
@@ -1,75 +0,0 @@
-#!/bin/sh
-
-#  In the target start ospfd and zebra.
-#  At the same time, start syslog-ng and check the keyword "ospfd" in syslog.
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target ospfd stop
-exec_service_on_target zebra stop
-exec_service_on_target syslog-ng stop
-
-rm -f /var/run/quagga/ospfd.pid
-#Backup the config file
-mv /etc/quagga/ospfd.conf /etc/quagga/ospfd.conf.bck
-mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf.bck
-
-#Backup the syslog file
-mv /var/log/syslog /var/log/syslog.bck
-
-cp data/ospfd.conf /etc/quagga/ospfd.conf
-cp data/zebra.conf /etc/quagga/zebra.conf
-chown quagga:quagga /etc/quagga/*.conf
-
-if exec_service_on_target syslog-ng restart
-then
-    echo " -> restart of syslog-ng succeeded."
-else
-    echo " -> restart of syslog-ng failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-if exec_service_on_target ospfd start
-then
-    echo " -> start of ospfd succeeded."
-else
-    echo " -> start of ospfd failed."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-sleep 5
-
-if cat /var/log/syslog | grep "OSPF"
-then
-    echo " -> get the syslog of ospfd."
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the syslog of ospfd."
-    echo " -> $test: TEST-FAIL"
-    exit
-fi
-
-exec_service_on_target ospfd stop
-exec_service_on_target zebra stop
-
-#Restore the config file
-mv /etc/quagga/ospfd.conf.bck /etc/quagga/ospfd.conf
-mv /etc/quagga/zebra.conf.bck /etc/quagga/zebra.conf
-
-#Restore the syslog file
-mv /var/log/syslog.bck /var/log/syslog
diff --git a/fuego-core-ubinux/fuego-core/Functional.pcscd/tests/pcscd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.pcscd/tests/pcscd_syslog.sh_bak
deleted file mode 100644
index e9825f2..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.pcscd/tests/pcscd_syslog.sh_bak
+++ /dev/null
@@ -1,57 +0,0 @@
-#!/bin/sh
-
-#  In the target start pcscd, and check the messages of /var/log/syslog.
-#  check the keyword "pcscd".
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-pcscd_status=$(exec_service_on_target pcscd is-active)
-
-exec_service_on_target pcscd stop
-exec_service_on_target $logger_service stop
-
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-restore_target(){
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target pcscd start
-then
-    echo " -> start of pcscd succeeded."
-else
-    echo " -> start of pcscd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "pcscd"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$pcscd_status" != "active" ]
-then
-    exec_service_on_target pcscd stop
-fi
-
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.postfix/tests/postfix_logfile.sh_bak b/fuego-core-ubinux/fuego-core/Functional.postfix/tests/postfix_logfile.sh_bak
deleted file mode 100644
index 11bb970..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.postfix/tests/postfix_logfile.sh_bak
+++ /dev/null
@@ -1,63 +0,0 @@
-#!/bin/sh
-
-#  In the target to start postfix postfix, to confirm the acquisition of the log.
-#  check the keyword "postfix".
-
-test="logfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-postfix_status=$(get_service_status postfix)
-syslog_status=$(get_service_status $logger_service)
-
-exec_service_on_target postfix stop
-
-mv /etc/postfix/main.cf /etc/postfix/main.cf_bak
-cp data/main.cf /etc/postfix/main.cf
-if [ -f /var/log/mailog ]
-then
-    mv /var/log/mail.log /var/log/maillong_bak
-fi
-
-restore_target() {
-    if [ "$postfix_status" = "inactive" ]
-    then
-        exec_service_on_target postfix stop
-    fi
-    if [ "$logger_service_status" = "inactive" ]
-    then
-        exec_service_on_target $logger_service stop
-    fi
-
-    mv /etc/postfix/main.cf_bak /etc/postfix/main.cf
-    if [ -f /var/log/mail.log_bak ]
-    then
-        mv /var/log/mail.log_bak /var/log/mail.log
-    else
-        rm /var/log/mail.log
-    fi
-}
-
-exec_service_on_target $logger_service stop
-
-exec_service_on_target $logger_service restart
-if exec_service_on_target postfix start
-then
-    echo " -> start of postfix succeeded."
-else
-    echo " -> start of postfix failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-if tail /var/log/mail.log | grep "postfix"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.ptpd/tests/ptpd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.ptpd/tests/ptpd_syslog.sh_bak
deleted file mode 100644
index 20d51ba..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ptpd/tests/ptpd_syslog.sh_bak
+++ /dev/null
@@ -1,57 +0,0 @@
-#!/bin/sh
-
-#  In the target start ptpd, and check the messages of /var/log/syslog.
-#  check the keyword "ptpd".
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-ptpd_status=$(exec_service_on_target ptpd is-active)
-
-exec_service_on_target ptpd stop
-exec_service_on_target $logger_service stop
-
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-restore_target(){
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target ptpd start
-then
-    echo " -> start of ptpd succeeded."
-else
-    echo " -> start of ptpd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "ptpd"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$ptpd_status" != "active" ]
-then
-    exec_service_on_target ptpd stop
-fi
-
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.radvd/tests/radvd_logfile.sh_bak b/fuego-core-ubinux/fuego-core/Functional.radvd/tests/radvd_logfile.sh_bak
deleted file mode 100644
index 01bda64..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.radvd/tests/radvd_logfile.sh_bak
+++ /dev/null
@@ -1,65 +0,0 @@
-#!/bin/sh
-
-#  In the target to start radvd radvd, to confirm the acquisition of the log.
-#  check the keyword "radvd".
-
-test="logfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-service_status=$(get_service_status radvd)
-
-exec_service_on_target radvd stop
-
-echo 0 > /proc/sys/net/ipv6/conf/all/accept_ra
-if [ -f /etc/radvd.conf ]
-then
-    mv /etc/radvd.conf /etc/radvd.conf_bak
-fi
-cp data/radvd.conf /etc/radvd.conf
-
-exec_service_on_target $logger_service stop
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-restore_target() {
-    if [ -f /etc/radvd.conf_bak ]
-    then
-        mv /etc/radvd.conf_bak /etc/radvd.conf
-    fi
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-    echo 1 > /proc/sys/net/ipv6/conf/all/accept_ra
-}
-
-exec_service_on_target $logger_service restart
-if exec_service_on_target radvd start
-then
-    echo " -> start of radvd succeeded."
-else
-    echo " -> start of radvd failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if cat /var/log/syslog | grep "radvd"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$service_status" = "inactive" ]
-then
-    exec_service_on_target radvd stop
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_chkconfig.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_chkconfig.sh
deleted file mode 100644
index 3ca6142..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_chkconfig.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command chkconfig.
-#  option: --help
-
-test="chkconfig"
-
-chkconfig --help > log 2>&1
-if cat log | grep usage
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_crda.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_crda.sh
deleted file mode 100644
index 5b04e3e..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_crda.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command crda.
-#  option: --help
-
-test="crda"
-
-crda --help > log 2>&1
-if cat log | grep Usage
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_eggdbus-binding-tool.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_eggdbus-binding-tool.sh
deleted file mode 100644
index 300f20e..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_eggdbus-binding-tool.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-#  In target, run command eggdbus-binding-tool.
-#  option: --help
-
-test="eggdbus-binding-tool"
-
-if eggdbus-binding-tool --help | grep Usage
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_execstack.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_execstack.sh
deleted file mode 100644
index 39dc4d6..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_execstack.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-#  In target, run command execstack.
-#  option: --help
-
-test="execstack"
-
-if execstack --help | grep "Usage"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_genrandom.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_genrandom.sh
deleted file mode 100644
index 616c293..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_genrandom.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command genrandom.
-#  option: none
-
-test="genrandom"
-
-genrandom > log 2>&1
-if cat log | grep usage
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_in.telnetd.sh-bak b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_in.telnetd.sh-bak
deleted file mode 100644
index 0681ff6..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_in.telnetd.sh-bak
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command in.telnetd.
-#  option: h
-
-test="in_telnetd"
-
-in.telnetd h > log 2>&1
-if cat log | grep "Usage"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_iwpriv.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_iwpriv.sh
deleted file mode 100644
index 02f82a3..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_iwpriv.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command iwpriv.
-#  option: --help
-
-test="iwpriv"
-
-iwpriv --help > log 2>&1
-if cat log | grep "Usage"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_mip6d.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_mip6d.sh
deleted file mode 100644
index df177cb..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_mip6d.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command mip6d.
-#  option: --help
-
-test="mip6d"
-
-mip6d --help > log 2>&1
-if cat log | grep "Usage"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_omshell.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_omshell.sh
deleted file mode 100644
index f22777a..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_omshell.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command omshell.
-#  option: --help
-
-test="omshell"
-
-omshell --help > log 2>&1
-if cat log | grep Usage
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_rsh.sh-bak b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_rsh.sh-bak
deleted file mode 100644
index a1a2dd5..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_rsh.sh-bak
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command rsh.
-#  option: none
-
-test="rsh"
-
-rsh > log 2>&1
-if cat log | grep "usage"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_syslog-ng.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_syslog-ng.sh
deleted file mode 100644
index 5592056..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_syslog-ng.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-#  In target, run command syslog-ng.
-#  option: --help
-
-test="syslog-ng"
-
-if syslog-ng --help | grep "Usage"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_uim-xim.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_uim-xim.sh
deleted file mode 100644
index 128e653..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_uim-xim.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-#  In target, run command uim-xim.
-#  option: --help
-
-test="uim-xim"
-
-if uim-xim --help | grep "uim <-> XIM bridge. Supporting multiple locales"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_wish8.6.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_wish8.6.sh
deleted file mode 100644
index 9d29832..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_wish8.6.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command wish8.6.
-#  option: -h
-
-test="wish8_6"
-
-wish8.6 -h > log 2>&1
-if cat log | grep "application"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_xinetd.sh b/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_xinetd.sh
deleted file mode 100644
index 3ac28a4..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.regression/tests/regression_xinetd.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command xinetd.
-#  option: -version
-
-test="xinetd"
-
-xinetd -version > log 2>&1
-if cat log | grep "Version"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-rm log
diff --git a/fuego-core-ubinux/fuego-core/Functional.ripd/tests/ripd_logfile.sh b/fuego-core-ubinux/fuego-core/Functional.ripd/tests/ripd_logfile.sh
deleted file mode 100644
index ee3f156..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ripd/tests/ripd_logfile.sh
+++ /dev/null
@@ -1,104 +0,0 @@
-#!/bin/sh
-
-#  In the target start ripd, and confirm the ripd log.
-
-test="logfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-ripd_status=$(exec_service_on_target ripd is-active)
-zebra_status=$(exec_service_on_target zebra is-active)
-
-exec_service_on_target ripd stop
-exec_service_on_target zebra stop
-
-if [ ! -d /var/log/quagga ]
-then
-   mkdir /var/log/quagga
-   chown -R quagga:quagga /var/log/quagga
-fi
-
-if [ -f /var/log/quagga/ripd.log ]
-then
-    mv /var/log/quagga/ripd.log /var/log/quagga/ripd.log_bak
-fi
-
-if [ -f /etc/quagga/zebra.conf ]
-then
-    mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf_bak
-fi
-cp data/zebra.conf /etc/quagga/zebra.conf
-
-if [ -f /etc/quagga/ripd.conf ]
-then
-    mv /etc/quagga/ripd.conf /etc/quagga/ripd.conf_bak
-fi
-cp data/ripd.conf /etc/quagga/ripd.conf
-
-chown quagga:quagga /etc/quagga/*.conf
-
-restore_target() {
-    if [ -f /etc/quagga/zebra.conf_bak ]
-    then
-        mv /etc/quagga/zebra.conf_bak /etc/quagga/zebra.conf
-    else
-        rm /etc/quagga/zebra.conf
-    fi
-    if [ -f /etc/quagga/ripd.conf_bak ]
-    then
-        mv /etc/quagga/ripd.conf_bak /etc/quagga/ripd.conf
-    else
-        rm /etc/quagga/ripd.conf
-    fi
-    if [ -f /var/log/quagga/ripd.log_bak ]
-    then
-        mv /var/log/quagga/ripd.log_bak /var/log/quagga/ripd.log
-    fi
-}
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-if exec_service_on_target ripd start
-then
-    echo " -> start of ripd succeeded."
-else
-    echo " -> start of ripd failed."
-    echo " -> $test: TEST-FAIL"
-    if [ "$zebra_status" != "active" ]
-    then
-        exec_service_on_target zebra stop
-    fi
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if [ -f /var/log/quagga/ripd.log ]
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the logfile of ripd."
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$ripd_status" != "active" ]
-then
-    exec_service_on_target ripd stop
-fi
-
-if [ "$zebra_status" != "active" ]
-then
-    exec_service_on_target zebra stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.ripd/tests/ripd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.ripd/tests/ripd_syslog.sh_bak
deleted file mode 100644
index 0e492e8..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ripd/tests/ripd_syslog.sh_bak
+++ /dev/null
@@ -1,101 +0,0 @@
-#!/bin/sh
-
-#  In the target start ripd, and confirm the log file.
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-ripd_status=$(exec_service_on_target ripd is-active)
-zebra_status=$(exec_service_on_target zebra is-active)
-
-exec_service_on_target ripd stop
-exec_service_on_target zebra stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-if [ -f /etc/quagga/zebra.conf ]
-then
-    mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf_bak
-fi
-cp data/zebra.conf /etc/quagga/zebra.conf
-
-if [ -f /etc/quagga/ripd.conf ]
-then
-    mv /etc/quagga/ripd.conf /etc/quagga/ripd.conf_bak
-fi
-cp data/ripd.conf /etc/quagga/ripd.conf
-
-chown quagga:quagga /etc/quagga/*.conf
-
-restore_target() {
-    if [ -f /etc/quagga/zebra.conf_bak ]
-    then
-        mv /etc/quagga/zebra.conf_bak /etc/quagga/zebra.conf
-    else
-        rm /etc/quagga/zebra.conf
-    fi
-    if [ -f /etc/quagga/ripd.conf_bak ]
-    then
-        mv /etc/quagga/ripd.conf_bak /etc/quagga/ripd.conf
-    else
-        rm /etc/quagga/ripd.conf
-    fi
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-if exec_service_on_target ripd start
-then
-    echo " -> start of ripd succeeded."
-else
-    echo " -> start of ripd failed."
-    echo " -> $test: TEST-FAIL"
-    if [ "$zebra_status" != "active" ]
-    then
-        exec_service_on_target zebra stop
-    fi
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if tail /var/log/syslog | grep "zebra"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the syslog of zebra."
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$ripd_status" != "active" ]
-then
-    exec_service_on_target ripd stop
-fi
-if [ "$zebra_status" != "active" ]
-then
-    exec_service_on_target zebra stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.ripngd/tests/ripngd_logfile.sh b/fuego-core-ubinux/fuego-core/Functional.ripngd/tests/ripngd_logfile.sh
deleted file mode 100644
index b415182..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ripngd/tests/ripngd_logfile.sh
+++ /dev/null
@@ -1,103 +0,0 @@
-#!/bin/sh
-
-#  In the target start ripngd, and confirm the ripngd log.
-
-test="logfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-ripngd_status=$(exec_service_on_target ripngd is-active)
-zebra_status=$(exec_service_on_target zebra is-active)
-
-exec_service_on_target ripngd stop
-exec_service_on_target zebra stop
-
-if [ ! -d /var/log/quagga ]
-then
-   mkdir /var/log/quagga
-   chown -R quagga:quagga /var/log/quagga
-fi
-
-if [ -f /var/log/quagga/ripngd.log ]
-then
-    mv /var/log/quagga/ripngd.log /var/log/quagga/ripngd.log_bak
-fi
-
-if [ -f /etc/quagga/zebra.conf ]
-then
-    mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf_bak
-fi
-cp data/zebra.conf /etc/quagga/zebra.conf
-
-if [ -f /etc/quagga/ripngd.conf ]
-then
-    mv /etc/quagga/ripngd.conf /etc/quagga/ripngd.conf_bak
-fi
-cp data/ripngd.conf /etc/quagga/ripngd.conf
-
-chown quagga:quagga /etc/quagga/*.conf
-
-restore_target() {
-    if [ -f /etc/quagga/zebra.conf_bak ]
-    then
-        mv /etc/quagga/zebra.conf_bak /etc/quagga/zebra.conf
-    else
-        rm /etc/quagga/zebra.conf
-    fi
-    if [ -f /etc/quagga/ripngd.conf_bak ]
-    then
-        mv /etc/quagga/ripngd.conf_bak /etc/quagga/ripngd.conf
-    else
-        rm /etc/quagga/ripngd.conf
-    fi
-    if [ -f /var/log/quagga/ripngd.log_bak ]
-    then
-        mv /var/log/quagga/ripngd.log_bak /var/log/quagga/ripngd.log
-    fi
-}
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-if exec_service_on_target ripngd start
-then
-    echo " -> start of ripngd succeeded."
-else
-    echo " -> start of ripngd failed."
-    echo " -> $test: TEST-FAIL"
-    if [ "$zebra_status" != "active" ]
-    then
-        exec_service_on_target zebra stop
-    fi
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if [ -f /var/log/quagga/ripngd.log ]
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the logfile of ripngd."
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$zebra_status" != "active" ]
-then
-    exec_service_on_target zebra stop
-fi
-if [ "$ripngd_status" != "active" ]
-then
-    exec_service_on_target ripngd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.ripngd/tests/ripngd_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.ripngd/tests/ripngd_syslog.sh_bak
deleted file mode 100644
index b200c3e..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.ripngd/tests/ripngd_syslog.sh_bak
+++ /dev/null
@@ -1,101 +0,0 @@
-#!/bin/sh
-
-#  In the target start ripngd, and confirm the log file.
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-ripngd_status=$(exec_service_on_target ripngd is-active)
-zebra_status=$(exec_service_on_target zebra is-active)
-
-exec_service_on_target ripngd stop
-exec_service_on_target zebra stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-if [ -f /etc/quagga/zebra.conf ]
-then
-    mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf_bak
-fi
-cp data/zebra.conf /etc/quagga/zebra.conf
-
-if [ -f /etc/quagga/ripngd.conf ]
-then
-    mv /etc/quagga/ripngd.conf /etc/quagga/ripngd.conf_bak
-fi
-cp data/ripngd.conf /etc/quagga/ripngd.conf
-
-chown quagga:quagga /etc/quagga/*.conf
-
-restore_target() {
-    if [ -f /etc/quagga/zebra.conf_bak ]
-    then
-        mv /etc/quagga/zebra.conf_bak /etc/quagga/zebra.conf
-    else
-        rm /etc/quagga/zebra.conf
-    fi
-    if [ -f /etc/quagga/ripngd.conf_bak ]
-    then
-        mv /etc/quagga/ripngd.conf_bak /etc/quagga/ripngd.conf
-    else
-        rm /etc/quagga/ripngd.conf
-    fi
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-if exec_service_on_target ripngd start
-then
-    echo " -> start of ripngd succeeded."
-else
-    echo " -> start of ripngd failed."
-    echo " -> $test: TEST-FAIL"
-    if [ "$zebra_status" != "active" ]
-    then
-        exec_service_on_target zebra stop
-    fi
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if tail /var/log/syslog | grep "zebra"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the syslog of zebra."
-    echo " -> $test: TEST-FAIL"
-fi
-
-if [ "$zebra_status" != "active" ]
-then
-    exec_service_on_target zebra stop
-fi
-if [ "$ripngd_status" != "active" ]
-then
-    exec_service_on_target ripngd stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.samba/tests/test_samba06_host.sh-bak b/fuego-core-ubinux/fuego-core/Functional.samba/tests/test_samba06_host.sh-bak
deleted file mode 100644
index e04dac3..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.samba/tests/test_samba06_host.sh-bak
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/sh
-
-# Access the samba server on the target from the host
-
-test="samba06"
-expect <<-EOF
-spawn sh
-expect ".*"
-send "smbclient //$1/test -N\r"
-expect {
- -re ".*smb:.*" {
-           send "ls\r"
-          }
- default { send_user "Can't connect to the board"\n"}  }
-expect {
- -re ".*test1.*" {
-           send_user " -> $test: TEST-PASS\n"
-          }
- default { send_user " -> $test: TEST-FAIL\n"}  }
-send "exit\n"
-expect eof
-EOF
diff --git a/fuego-core-ubinux/fuego-core/Functional.samhain/tests/samhain_check.sh_bak b/fuego-core-ubinux/fuego-core/Functional.samhain/tests/samhain_check.sh_bak
deleted file mode 100644
index b94263c..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.samhain/tests/samhain_check.sh_bak
+++ /dev/null
@@ -1,64 +0,0 @@
-#!/bin/sh
-
-#  In target, run command samhain.
-#  Check the filesystem against the database of file signatures.
-#  option: -t
-
-test="check"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-cp /etc/samhainrc /etc/samhainrc_bak
-sed -i "s%dir = 99/usr%dir = 99$board/fuego.$testdir/test_dir/samhain_test%" /etc/samhainrc
-
-rm -fr /var/samhain/* /var/lib/samhain/*
-
-exec_service_on_target $logger_service stop
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-exec_service_on_target $logger_service restart
-
-sleep 1
-
-mkdir -p test_dir/samhain_test/
-touch test_dir/samhain_test/test.txt
-
-samhain -t init -p info > /dev/null 2&> 1
-
-sleep 1
-
-echo test > test_dir/samhain_test/test.txt
-
-sleep 1
-
-if samhain -t check
-then
-    echo " -> samhain -t check succeeded."
-else
-    echo " -> $test: TEST-FAIL"
-    rm -fr test_dir
-    mv /etc/samhainrc_bak /etc/samhainrc
-    exit
-fi
-
-sleep 10
-
-if cat /var/log/syslog | grep "test_dir/samhain_test"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-rm -fr test_dir
-mv /etc/samhainrc_bak /etc/samhainrc
-if [ -f /var/log/syslog_bak ]
-then
-    mv /var/log/syslog_bak /var/log/syslog
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.samhain/tests/samhain_init.sh_bak b/fuego-core-ubinux/fuego-core/Functional.samhain/tests/samhain_init.sh_bak
deleted file mode 100644
index b15297d..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.samhain/tests/samhain_init.sh_bak
+++ /dev/null
@@ -1,49 +0,0 @@
-#!/bin/sh
-
-#  In target, run command samhain.
-#  Initialize the database of file signatures.
-#  option: -t
-
-test="init"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-cp /etc/samhainrc /etc/samhainrc_bak
-sed -i "s%dir = 99/usr%dir = 99$board/fuego.$testdir/test_dir/samhain_test%" /etc/samhainrc
-
-rm -fr /var/samhain/* /var/lib/samhain/*
-
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-exec_service_on_target $logger_service restart
-
-sleep 1
-
-mkdir -p test_dir/samhain_test/
-touch test_dir/samhain_test/test.txt
-
-samhain -t init -p info > /dev/null 2&> 1
-
-sleep 1
-
-if cat /var/log/syslog | grep "ALRT.*-.*-.*T.*:.*:.*msg=\"EXIT\""
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
-
-rm -fr test_dir
-mv /etc/samhainrc_bak /etc/samhainrc
-if [ -f /var/log/syslog_bak ]
-then
-    mv /var/log/syslog_bak /var/log/syslog
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.sysklogd/tests/sysklogd_syslogd.sh_bak b/fuego-core-ubinux/fuego-core/Functional.sysklogd/tests/sysklogd_syslogd.sh_bak
deleted file mode 100644
index fd534dd..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.sysklogd/tests/sysklogd_syslogd.sh_bak
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/sh
-
-#  In target, run command syslogd.
-
-test="syslogd"
-
-msg="This is a test message $(date)"
-logger "$msg"
-
-sleep 5
-
-if grep "$msg" /var/log/syslog
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.sysstat/tests/sysstat_sadc.sh b/fuego-core-ubinux/fuego-core/Functional.sysstat/tests/sysstat_sadc.sh
deleted file mode 100644
index b583d3c..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.sysstat/tests/sysstat_sadc.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In the target run the command sadc to collect system activity data.
-
-test="sadc"
-
-if /usr/lib/sa/sadc 1 10 test_sa000
-then
-    echo " -> collect system data succeeded."
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> collect system data failed."
-    echo " -> $test: TEST-FAIL"
-fi
-rm test_sa000
diff --git a/fuego-core-ubinux/fuego-core/Functional.sysstat/tests/sysstat_sadc.sh_bak b/fuego-core-ubinux/fuego-core/Functional.sysstat/tests/sysstat_sadc.sh_bak
deleted file mode 100644
index b583d3c..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.sysstat/tests/sysstat_sadc.sh_bak
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In the target run the command sadc to collect system activity data.
-
-test="sadc"
-
-if /usr/lib/sa/sadc 1 10 test_sa000
-then
-    echo " -> collect system data succeeded."
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> collect system data failed."
-    echo " -> $test: TEST-FAIL"
-fi
-rm test_sa000
diff --git a/fuego-core-ubinux/fuego-core/Functional.trousers/tests/trousers_start.sh_bak b/fuego-core-ubinux/fuego-core/Functional.trousers/tests/trousers_start.sh_bak
deleted file mode 100644
index d85c532..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.trousers/tests/trousers_start.sh_bak
+++ /dev/null
@@ -1,18 +0,0 @@
-#!/bin/sh
-
-#  In target, start the service tcsd.
-
-test="start"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-exec_service_on_target tcsd stop
-
-if exec_service_on_target tcsd start
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> $test: TEST-FAIL"
-fi
diff --git a/fuego-core-ubinux/fuego-core/Functional.utillinux/tests/utillinux_logger.sh_bak b/fuego-core-ubinux/fuego-core/Functional.utillinux/tests/utillinux_logger.sh_bak
deleted file mode 100644
index 453fb0f..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.utillinux/tests/utillinux_logger.sh_bak
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-#  In target, run command logger.
-
-test="logger"
-
-mgs="This is a test message $(date)"
-logger "$msg"
-if grep "$msg" /var/log/syslog
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo "  Didn't find test string in log"
-    echo " -> $test: TEST-FAIL"
-fi;
diff --git a/fuego-core-ubinux/fuego-core/Functional.zebra/tests/zebra_logfile.sh b/fuego-core-ubinux/fuego-core/Functional.zebra/tests/zebra_logfile.sh
deleted file mode 100644
index 241c5ad..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.zebra/tests/zebra_logfile.sh
+++ /dev/null
@@ -1,75 +0,0 @@
-#!/bin/sh
-
-#  In the target start zebra, and confirm the zebra log.
-
-test="logfile"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-
-zebra_status=0
-if exec_service_on_target zebra status | grep "running"
-then
-    zebra_status=1
-fi
-
-exec_service_on_target zebra stop
-
-if [ ! -d /var/log/quagga ]
-then
-   mkdir /var/log/quagga
-   chown -R quagga:quagga /var/log/quagga
-fi
-
-if [ -f /var/log/quagga/zebra.log ]
-then
-    mv /var/log/quagga/zebra.log /var/log/quagga/zebra.log_bak
-fi
-
-if [ -f /etc/quagga/zebra.conf ]
-then
-    mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf_bak
-fi
-cp data/zebra.conf /etc/quagga/zebra.conf
-
-chown quagga:quagga /etc/quagga/*.conf
-
-restore_target() {
-    if [ -f /etc/quagga/zebra.conf_bak ]
-    then
-        mv /etc/quagga/zebra.conf_bak /etc/quagga/zebra.conf
-    else
-        rm /etc/quagga/zebra.conf
-    fi
-    if [ -f /var/log/quagga/zebra.log_bak ]
-    then
-        mv /var/log/quagga/zebra.log_bak /var/log/quagga/zebra.log
-    fi
-}
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if [ -f /var/log/quagga/zebra.log ]
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the logfile of zebra."
-    echo " -> $test: TEST-FAIL"
-fi
-
-if $zebra_status=0
-then
-    exec_service_on_target zebra stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/Functional.zebra/tests/zebra_syslog.sh_bak b/fuego-core-ubinux/fuego-core/Functional.zebra/tests/zebra_syslog.sh_bak
deleted file mode 100644
index 8e86f8a..0000000
--- a/fuego-core-ubinux/fuego-core/Functional.zebra/tests/zebra_syslog.sh_bak
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/sh
-
-#  In the target start zebra, and confirm the log file.
-
-test="syslog"
-
-. ./fuego_board_function_lib.sh
-
-set_init_manager
-logger_service=$(detect_logger_service)
-
-zebra_status=0
-if exec_service_on_target zebra status | grep "running"
-then
-    zebra_status=1
-fi
-
-exec_service_on_target zebra stop
-exec_service_on_target $logger_service stop
-
-if [ -f /var/log/syslog ]
-then
-    mv /var/log/syslog /var/log/syslog_bak
-fi
-
-if [ -f /etc/quagga/zebra.conf ]
-then
-    mv /etc/quagga/zebra.conf /etc/quagga/zebra.conf_bak
-fi
-cp data/zebra.conf /etc/quagga/zebra.conf
-
-chown quagga:quagga /etc/quagga/*.conf
-
-restore_target() {
-    if [ -f /etc/quagga/zebra.conf_bak ]
-    then
-        mv /etc/quagga/zebra.conf_bak /etc/quagga/zebra.conf
-    else
-        rm /etc/quagga/zebra.conf
-    fi
-    if [ -f /var/log/syslog_bak ]
-    then
-        mv /var/log/syslog_bak /var/log/syslog
-    fi
-}
-
-exec_service_on_target $logger_service restart
-
-if exec_service_on_target zebra start
-then
-    echo " -> start of zebra succeeded."
-else
-    echo " -> start of zebra failed."
-    echo " -> $test: TEST-FAIL"
-    restore_target
-    exit
-fi
-
-sleep 5
-
-if tail /var/log/syslog | grep "zebra"
-then
-    echo " -> $test: TEST-PASS"
-else
-    echo " -> can't get the syslog of zebra."
-    echo " -> $test: TEST-FAIL"
-fi
-
-if $zebra_status=0
-then
-    exec_service_on_target zebra stop
-fi
-restore_target
diff --git a/fuego-core-ubinux/fuego-core/bgpd_ps.sh b/fuego-core-ubinux/fuego-core/bgpd_ps.sh
new file mode 100755
index 0000000..562ade6
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/bgpd_ps.sh
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+#  In the target start bgpd and zebra, then confirm the process condition by command ps.
+#  check the keyword "quagga/bgpd".
+
+test="ps"
+
+. ./fuego_board_function_lib.sh
+
+set_init_manager
+
+frr_status=0
+if exec_service_on_target frr status | grep "running"
+then
+    frr_status=1
+fi
+
+exec_service_on_target frr stop
+
+if exec_service_on_target frr start
+then
+    echo " -> start of frr succeeded."
+else
+    echo " -> start of frr failed."
+    echo " -> $test: TEST-FAIL"
+    exit
+fi
+
+if ps -N a | grep "[/]usr/libexec/frr/bgpd"
+then
+    echo " -> get the pid of bgpd."
+else
+    echo " -> can't get the pid of bgpd."
+    echo " -> $test: TEST-FAIL"
+    exit
+fi
+
+exec_service_on_target frr stop
+
+if ps -N a | grep "[/]usr/libexec/frr/bgpd"
+then
+    echo " -> $test: TEST-FAIL"
+else
+    echo " -> $test: TEST-PASS"
+fi
+
+if $frr_status=1
+then
+    exec_service_on_target frr start
+fi
diff --git a/fuego-core-ubinux/fuego-core/dool_test.sh b/fuego-core-ubinux/fuego-core/dool_test.sh
new file mode 100755
index 0000000..dd5ce37
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/dool_test.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+for i in tests/*.sh; do
+    sh $i
+done
diff --git a/fuego-core-ubinux/fuego-core/ethtool_show.sh b/fuego-core-ubinux/fuego-core/ethtool_show.sh
new file mode 100755
index 0000000..e56a4ac
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/ethtool_show.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+#  In target, run command ethtool.
+#  option: none
+
+test="show"
+
+. ./fuego_board_function_lib.sh
+
+ETHERNET_DEVICE_NAME=$(detect_active_eth_device)
+
+if [ "${ETHERNET_DEVICE_NAME}x" = "have no Ethernet devicex" ]
+then
+    echo " -> $test: TEST-FAIL"
+    exit 1
+fi
+
+if ethtool $ETHERNET_DEVICE_NAME | grep "Settings for"
+then
+    echo " -> $test: TEST-PASS"
+else
+    echo " -> $test: TEST-FAIL"
+fi
diff --git a/fuego-core-ubinux/fuego-core/ethtool_test.sh b/fuego-core-ubinux/fuego-core/ethtool_test.sh
new file mode 100755
index 0000000..dd5ce37
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/ethtool_test.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+for i in tests/*.sh; do
+    sh $i
+done
diff --git a/fuego-core-ubinux/fuego-core/initscripts_ifdown-ifup.sh b/fuego-core-ubinux/fuego-core/initscripts_ifdown-ifup.sh
new file mode 100755
index 0000000..700c9e1
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/initscripts_ifdown-ifup.sh
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+# In target, run command ifdown/ifup.
+# option: none
+
+test="ifdown_ifup"
+
+# pattern for detecting loopback network device
+LO_PAT="^lo[: ]"
+
+#if [ ! -f /etc/sysconfig/network-scripts/ifcfg-lo ]
+#then
+#    echo " -> $test: ifcfg file does not exist."
+#    echo " -> $test: TEST-SKIP"
+#    exit 0
+#fi
+
+if ! ifconfig | grep -q "$LO_PAT" ;
+then
+    echo " -> $test: 'lo' not found in ifconfig output on test start"
+    echo " -> $test: TEST-SKIP"
+fi
+
+if ifdown lo
+then
+    echo " -> $test: ifdown lo succeeded."
+else
+    echo " -> $test: ifdown lo  failed."
+    echo " -> $test: TEST-FAIL"
+    exit 0
+fi
+
+if ifconfig | grep -q "$LO_PAT" ;
+then
+    echo " -> $test: 'lo' was found in ifconfig output after 'ifdown lo'"
+    echo " -> $test: TEST-FAIL"
+fi
+
+if ! ifup lo ;
+then
+    echo " -> $test: error $? running 'ifup lo'"
+    echo " -> $test: TEST-FAIL"
+fi
+
+if ifconfig | grep -q "$LO_PAT" ; 
+then
+    echo " -> $test: TEST-PASS"
+else
+    echo " -> $test: 'lo' was not found in ifconfig output after 'ifup lo'"
+    echo " -> $test: TEST-FAIL"
+fi
diff --git a/fuego-core-ubinux/fuego-core/ospf6d_ps.sh b/fuego-core-ubinux/fuego-core/ospf6d_ps.sh
new file mode 100755
index 0000000..d9cdded
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/ospf6d_ps.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+#  In the target start ospf6d and zebra, then confirm the process condition by command ps.
+#  check the keyword "quagga/ospf6d".
+
+test="ps"
+
+. ./fuego_board_function_lib.sh
+
+set_init_manager
+frr_status=$(exec_service_on_target frr is-active)
+
+exec_service_on_target frr stop
+
+if exec_service_on_target frr start
+then
+    echo " -> start of frr succeeded."
+else
+    echo " -> start of frr failed."
+    echo " -> $test: TEST-FAIL"
+    exit
+fi
+
+if ps -N a | grep "[/]usr/libexec/frr/ospf6d"
+then
+    echo " -> get the pid of ospf6d."
+else
+    echo " -> can't get the pid of ospf6d."
+    echo " -> $test: TEST-FAIL"
+    exit
+fi
+
+exec_service_on_target frr stop
+
+if ps -N a | grep "[/]usr/libexec/frr/ospf6d"
+then
+    echo " -> $test: TEST-FAIL"
+else
+    echo " -> $test: TEST-PASS"
+fi
+
+if [ "$frr_status" = "active" ]
+then
+    exec_service_on_target frr start
+fi
diff --git a/fuego-core-ubinux/fuego-core/ospfd_ps.sh b/fuego-core-ubinux/fuego-core/ospfd_ps.sh
new file mode 100755
index 0000000..da73061
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/ospfd_ps.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+#  In the target start ospfd and zebra, then confirm the process condition by command ps.
+#  check the keyword "quagga/ospfd".
+
+test="ps"
+
+. ./fuego_board_function_lib.sh
+
+set_init_manager
+frr_status=$(exec_service_on_target frr is-active)
+
+exec_service_on_target frr stop
+
+if exec_service_on_target frr start
+then
+    echo " -> start of frr succeeded."
+else
+    echo " -> start of frr failed."
+    echo " -> $test: TEST-FAIL"
+    exit
+fi
+
+if ps -N a | grep "[/]usr/libexec/frr/ospfd"
+then
+    echo " -> get the pid of ospfd."
+else
+    echo " -> can't get the pid of ospfd."
+    echo " -> $test: TEST-FAIL"
+    exit
+fi
+
+exec_service_on_target frr stop
+
+if ps -N a | grep "[/]usr/libexec/frr/ospfd"
+then
+    echo " -> $test: TEST-FAIL"
+else
+    echo " -> $test: TEST-PASS"
+fi
+
+if [ "$frr_status" = "active" ]
+then
+    exec_service_on_target frr start
+fi
diff --git a/fuego-core-ubinux/fuego-core/s-nail_test.sh b/fuego-core-ubinux/fuego-core/s-nail_test.sh
new file mode 100755
index 0000000..dd5ce37
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/s-nail_test.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+for i in tests/*.sh; do
+    sh $i
+done
diff --git a/fuego-core-ubinux/fuego-core/test.yaml b/fuego-core-ubinux/fuego-core/test.yaml
new file mode 100755
index 0000000..f5c0654
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/test.yaml
@@ -0,0 +1,26 @@
+fuego_package_version: 1
+name: Functional.ospfd
+description: |
+      ospfd is an Open Shortest Path First (OSPF) daemon which manages
+      routing tables.  This implementation supports OSPF version 2, thus
+      it is only capable of maintaining IPv4 routing tables.
+      This is a simple test to examine whether ospfd can start
+      successfully and obtain the log. And zebra is the pre-service of ospfd.
+license: BSD-3-Clause
+author: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+maintainer: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+version: 1.00
+fuego_release: 1
+type: Functional
+tags: ['router']
+params:
+    - IFETH:
+        description: eth interface in your target board, defined in board file
+        example: eth0
+data_files:
+ - ospfd_test.sh
+ - data
+ - fuego_test.sh
+ - parser.py
+ - spec.json
+ - tests
diff --git a/fuego-core-ubinux/fuego-core/vixie_cron_test.sh b/fuego-core-ubinux/fuego-core/vixie_cron_test.sh
new file mode 100755
index 0000000..95c34db
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/vixie_cron_test.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+. ./fuego_board_function_lib.sh
+set_init_manager
+
+for i in tests/*.sh; do
+    source $i
+done
diff --git a/fuego-core-ubinux/fuego-core/zebra_ps.sh b/fuego-core-ubinux/fuego-core/zebra_ps.sh
new file mode 100755
index 0000000..25b8dbe
--- /dev/null
+++ b/fuego-core-ubinux/fuego-core/zebra_ps.sh
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+#  In the target start zebra, and confirm the process condition by command ps.
+
+test="ps"
+
+. ./fuego_board_function_lib.sh
+
+set_init_manager
+
+frr_status=0
+if exec_service_on_target frr status | grep "running"
+then
+    frr_status=1
+fi
+
+exec_service_on_target frr stop
+
+if exec_service_on_target frr start
+then
+    echo " -> start of frr succeeded."
+else
+    echo " -> start of frr failed."
+    echo " -> $test: TEST-FAIL"
+    exit
+fi
+
+sleep 5
+
+if ps aux | grep "[/]usr/libexec/frr/zebra"
+then
+    echo " -> get the process of zebra."
+else
+    echo " -> can't get the process of zebra."
+    echo " -> $test: TEST-FAIL"
+    if $frr_status=0
+    then
+        exec_service_on_target frr stop
+    fi
+    exit
+fi
+
+exec_service_on_target frr stop
+
+if ps aux | grep "[/]usr/libexec/frr/zebra"
+then
+    echo " -> $test: TEST-FAIL"
+else
+    echo " -> $test: TEST-PASS"
+fi
+if $frr_status=1
+then
+    exec_service_on_target frr start
+fi
-- 
2.34.1


