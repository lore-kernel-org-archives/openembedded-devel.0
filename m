Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D4DCCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:00:56 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7033.1761642049238663808
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 02:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NwLFWxPu;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761642049; x=1793178049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RMLTpy07Chiv9wd7ZeLdKQFA+9R3b0gL2+pCk/HGgN0=;
  b=NwLFWxPuIxG9lcuHEu+c5sTl/VeZ1DujzKZWKHGGsLmawWtKPYt2ZbIG
   2Xcy7TydJTxxDequqmEH2Qz7Wk51GKRbuC3f625e9NNRG0Y+0mJSj2bLf
   saGVelqPnCv66d0IY9VJ+RBPTzZTmhjuicRzsuqzGwFIM2RJ00GZv/NU5
   NbtEIwpmXfN4qpYM6wLxYpwggqIdfmlWEYJDRIh4ERd9QZq+9TebyBZX5
   G6zAmtGp1KdPT4FmO4ePncgMU2mL5sCIEOIBWRryCMVEMJaWrue+1rTwV
   hXBwnzvdyTQcc7jfCpe1mB35Rvsr8wD/NZi69dXiJyeTb3ikZH+JO+VZ9
   A==;
X-CSE-ConnectionGUID: TZYwq/s8S8umVCIOHt4lJg==
X-CSE-MsgGUID: +npPVtmMQpGjV/9PwM051g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196190745"
X-IronPort-AV: E=Sophos;i="6.19,261,1754924400"; 
   d="scan'208";a="196190745"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 18:00:47 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 4FA2FC000BE
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:00:47 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 03EC9C00227
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:00:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 7E7984041DB;
	Tue, 28 Oct 2025 09:00:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 1/5] modify the directory of test script
Date: Tue, 28 Oct 2025 17:00:32 +0800
Message-ID: <20251028090037.143-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251028090037.143-1-wangmy@fujitsu.com>
References: <20251028090037.143-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121068

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 fuego-core-ubinux/scripts/test_object         | 122 ------------------
 fuego-core-ubinux/scripts/test_script.sh      |  11 --
 .../scripts/{ => test_script}/target_setup.sh |  44 ++++---
 target_setup.sh                               |  62 ---------
 4 files changed, 26 insertions(+), 213 deletions(-)
 delete mode 100644 fuego-core-ubinux/scripts/test_object
 delete mode 100644 fuego-core-ubinux/scripts/test_script.sh
 rename fuego-core-ubinux/scripts/{ => test_script}/target_setup.sh (56%)
 delete mode 100755 target_setup.sh

diff --git a/fuego-core-ubinux/scripts/test_object b/fuego-core-ubinux/scripts/test_object
deleted file mode 100644
index 7669c71..0000000
--- a/fuego-core-ubinux/scripts/test_object
+++ /dev/null
@@ -1,122 +0,0 @@
-acl
-acpid
-at
-atmtcp
-bash
-batch
-bc
-bgpd
-bind
-bluez_utils
-bmaptool
-brctl
-busybox
-bzip2
-coreutils
-cpufreq-aperf
-cpufreq-info
-cpufreq-set
-cross_compilation
-cryptsetup
-curl
-demo
-dmidecode
-dmsetup
-dool
-dovecot
-dumpsexp
-ecryptfs_manager
-edac-util
-ethtool
-fbset
-fetchmail
-file
-fio
-fixesproto
-fontconfig
-gawk
-geoip
-hciattach
-hostapd
-initscripts
-interactive
-ipc-run
-iperf3_server
-iputils
-kbd
-keyctl
-kmod
-libesmtp
-libtool
-libxml
-lm_sensors
-logd
-logrotate
-logwatch
-ltrace
-lvm
-lynis
-mcelog
-m4
-misc
-module-init-tools
-monit
-multipathd
-net-snmp
-net-tools
-nfs
-nicstat
-nmap
-nscd
-nss
-ntp
-openct
-openhpid
-openssh
-openvpn
-openwsmand
-ospf6d
-ospfd
-pam
-parted
-passwd
-paxctl
-pcscd
-perl-xml-simple
-postfix
-powertop
-protobuf
-ptpd
-quota
-radvd
-regression
-ripd
-ripngd
-rpcbind
-rpm
-samba
-samhain
-schedutils
-setserial
-slapd
-s-nail
-sqlite
-strace
-stunnel
-sysklogd
-sysstat
-sysvinit
-tar
-tiptop
-trousers
-uftrace
-utillinux
-vconfig
-vixie_cron
-wpa_supplicant
-xdelta3
-xorg-macros
-xterm
-zabbix
-zebra
-auditd
diff --git a/fuego-core-ubinux/scripts/test_script.sh b/fuego-core-ubinux/scripts/test_script.sh
deleted file mode 100644
index 0e4347d..0000000
--- a/fuego-core-ubinux/scripts/test_script.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-
-rm /fuego-rw/result.csv
-
-for line in `cat test_object`
-do
-    rm /fuego-rw/logs/Functional.$line/flat_plot_data.txt
-#   rm -fr /fuego-rw/logs/Functional.$line/myboard.default.*
-    ftc run-test -b $1 -t Functional.$line -s default
-    cat /fuego-rw/logs/Functional.$line/flat_plot_data.txt |awk '{print $2,$7,$9}' | awk -F '[ .]' '{print $2,$4,$5}' |awk ' BEGIN{FS=" ";OFS=","}{$1=$1;print} '>> /fuego-rw/result.csv
-done
diff --git a/fuego-core-ubinux/scripts/target_setup.sh b/fuego-core-ubinux/scripts/test_script/target_setup.sh
similarity index 56%
rename from fuego-core-ubinux/scripts/target_setup.sh
rename to fuego-core-ubinux/scripts/test_script/target_setup.sh
index ca58bbc..fde9a71 100755
--- a/fuego-core-ubinux/scripts/target_setup.sh
+++ b/fuego-core-ubinux/scripts/test_script/target_setup.sh
@@ -4,32 +4,40 @@
 # Usage: ./target_setup.sh <board_name>
 
 # Verify argument count
-if [ $# -ne 1 ]; then
-  echo "Usage: $0 <board_name>"
-  echo "Example: ./target_setup.sh Myboard"
+if [ $# -ne 2 ]; then
+  echo "Usage: $0 <board_name> <ip_addr>"
+  echo "Example: ./target_setup.sh Myboard IP"
   exit 1
 fi
 
 BOARD=$1
-echo "=== Starting configuration for target board [$BOARD] ==="
+IP=$2
+PASSWORD="goodluck"
+echo "=== Starting configuration for target board [$BOARD] via SSH ==="
+
+run_cmd() {
+  sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no root@$IP "$1"
+}
+
+rm /root/.ssh/known_hosts
 
 # 1. Start DNSMasq service
 echo "Starting DNSMasq service..."
-ftc run-target -b $BOARD -- "systemctl start dnsmasq"
+run_cmd "systemctl start dnsmasq"
 
 # 2. Configure Postfix mail service
 echo "Configuring Postfix aliases and links..."
-ftc run-target -b $BOARD -- "touch /etc/aliases"
-ftc run-target -b $BOARD -- "cd /usr/sbin && unlink sendmail 2>/dev/null; ln -s sendmail.postfix sendmail"
-ftc run-target -b $BOARD -- "cd /usr/bin && unlink newaliases 2>/dev/null; ln -s newaliases.postfix newaliases"
-ftc run-target -b $BOARD -- "newaliases"
-ftc run-target -b $BOARD -- "postmap /etc/postfix/virtual"
-ftc run-target -b $BOARD -- "/etc/init.d/populate-volatile.sh"
-ftc run-target -b $BOARD -- "systemctl restart postfix"
+run_cmd "touch /etc/aliases"
+run_cmd "cd /usr/sbin && unlink sendmail 2>/dev/null; ln -s sendmail.postfix sendmail"
+run_cmd "cd /usr/bin && unlink newaliases 2>/dev/null; ln -s newaliases.postfix newaliases"
+run_cmd "newaliases"
+run_cmd "postmap /etc/postfix/virtual"
+run_cmd "/etc/init.d/populate-volatile.sh"
+run_cmd "systemctl restart postfix"
 
 # 3. Load required kernel modules (using current kernel version)
 echo "Loading kernel modules (using current kernel version)..."
-ftc run-target -b $BOARD -- 'KVER=$(uname -r);
+run_cmd 'KVER=$(uname -r);
      echo "Loading mac80211_hwsim.ko for kernel $KVER";
      insmod /lib/modules/$KVER/kernel/drivers/net/wireless/virtual/mac80211_hwsim.ko 2>/dev/null || true;
      echo "Loading cn.ko for kernel $KVER";
@@ -37,15 +45,15 @@ ftc run-target -b $BOARD -- 'KVER=$(uname -r);
 
 # 4. Configure mdadm mail notifications
 echo "Updating mdadm configuration..."
-ftc run-target -b $BOARD -- "sed -i 's/^#MAILADDR/MAILADDR/' /etc/mdadm.conf"
+run_cmd "sed -i 's/^#MAILADDR/MAILADDR/' /etc/mdadm.conf"
 
 # 5. Update ptpd network interface configuration
 echo "Updating PTPd network interface..."
-ftc run-target -b $BOARD -- "sed -i 's/eth0/eth1/g' /etc/default/ptpd"
+run_cmd "sed -i 's/eth0/eth1/g' /etc/default/ptpd"
 
 # 6. Enable FRR routing daemons
 echo "Enabling FRR routing daemons..."
-ftc run-target -b $BOARD -- "sed -i -e 's/^bgpd=no/bgpd=yes/' \
+run_cmd "sed -i -e 's/^bgpd=no/bgpd=yes/' \
                    -e 's/^ospfd=no/ospfd=yes/' \
                    -e 's/^ospf6d=no/ospf6d=yes/' \
                    -e 's/^ripd=no/ripd=yes/' \
@@ -54,8 +62,8 @@ ftc run-target -b $BOARD -- "sed -i -e 's/^bgpd=no/bgpd=yes/' \
 
 # 7. Configure journald persistent storage
 echo "Configuring systemd-journald for persistent logs..."
-ftc run-target -b $BOARD -- "sed -i 's/^#Storage=.*/Storage=persistent/' /etc/systemd/journald.conf"
-ftc run-target -b $BOARD -- "systemctl restart systemd-journald"
+run_cmd "sed -i 's/^#Storage=.*/Storage=persistent/' /etc/systemd/journald.conf"
+run_cmd "systemctl restart systemd-journald"
 
 echo "=== Target board [$BOARD] configuration completed successfully ==="
 echo "You may now run Fuego tests on the prepared target system"
diff --git a/target_setup.sh b/target_setup.sh
deleted file mode 100755
index ca58bbc..0000000
--- a/target_setup.sh
+++ /dev/null
@@ -1,62 +0,0 @@
-#!/bin/bash
-# ubinux_scripts/target_setup.sh
-# Target configuration script for Fuego tests
-# Usage: ./target_setup.sh <board_name>
-
-# Verify argument count
-if [ $# -ne 1 ]; then
-  echo "Usage: $0 <board_name>"
-  echo "Example: ./target_setup.sh Myboard"
-  exit 1
-fi
-
-BOARD=$1
-echo "=== Starting configuration for target board [$BOARD] ==="
-
-# 1. Start DNSMasq service
-echo "Starting DNSMasq service..."
-ftc run-target -b $BOARD -- "systemctl start dnsmasq"
-
-# 2. Configure Postfix mail service
-echo "Configuring Postfix aliases and links..."
-ftc run-target -b $BOARD -- "touch /etc/aliases"
-ftc run-target -b $BOARD -- "cd /usr/sbin && unlink sendmail 2>/dev/null; ln -s sendmail.postfix sendmail"
-ftc run-target -b $BOARD -- "cd /usr/bin && unlink newaliases 2>/dev/null; ln -s newaliases.postfix newaliases"
-ftc run-target -b $BOARD -- "newaliases"
-ftc run-target -b $BOARD -- "postmap /etc/postfix/virtual"
-ftc run-target -b $BOARD -- "/etc/init.d/populate-volatile.sh"
-ftc run-target -b $BOARD -- "systemctl restart postfix"
-
-# 3. Load required kernel modules (using current kernel version)
-echo "Loading kernel modules (using current kernel version)..."
-ftc run-target -b $BOARD -- 'KVER=$(uname -r);
-     echo "Loading mac80211_hwsim.ko for kernel $KVER";
-     insmod /lib/modules/$KVER/kernel/drivers/net/wireless/virtual/mac80211_hwsim.ko 2>/dev/null || true;
-     echo "Loading cn.ko for kernel $KVER";
-     insmod /lib/modules/$KVER/kernel/drivers/connector/cn.ko 2>/dev/null || true'
-
-# 4. Configure mdadm mail notifications
-echo "Updating mdadm configuration..."
-ftc run-target -b $BOARD -- "sed -i 's/^#MAILADDR/MAILADDR/' /etc/mdadm.conf"
-
-# 5. Update ptpd network interface configuration
-echo "Updating PTPd network interface..."
-ftc run-target -b $BOARD -- "sed -i 's/eth0/eth1/g' /etc/default/ptpd"
-
-# 6. Enable FRR routing daemons
-echo "Enabling FRR routing daemons..."
-ftc run-target -b $BOARD -- "sed -i -e 's/^bgpd=no/bgpd=yes/' \
-                   -e 's/^ospfd=no/ospfd=yes/' \
-                   -e 's/^ospf6d=no/ospf6d=yes/' \
-                   -e 's/^ripd=no/ripd=yes/' \
-                   -e 's/^ripngd=no/ripngd=yes/' \
-                   /etc/frr/daemons"
-
-# 7. Configure journald persistent storage
-echo "Configuring systemd-journald for persistent logs..."
-ftc run-target -b $BOARD -- "sed -i 's/^#Storage=.*/Storage=persistent/' /etc/systemd/journald.conf"
-ftc run-target -b $BOARD -- "systemctl restart systemd-journald"
-
-echo "=== Target board [$BOARD] configuration completed successfully ==="
-echo "You may now run Fuego tests on the prepared target system"
-exit 0
-- 
2.34.1


