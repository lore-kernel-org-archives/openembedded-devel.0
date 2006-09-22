Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GQhUR-0002Hx-Fm for openembedded-devel@lists.openembedded.org;
	Fri, 22 Sep 2006 11:38:36 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 6DBDF401B45; Fri, 22 Sep 2006 02:10:36 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060922091036.6DBDF401B45@tinman.treke.net>
Date: Fri, 22 Sep 2006 02:10:36 -0700 (PDT)
Subject: [Bug 1432] New: gpe-image fails to find glibc-localedata-i18n
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2006 09:38:36 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1432

           Summary: gpe-image fails to find glibc-localedata-i18n
           Product: Openembedded
           Version: Angstrom
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: liam.girdwood@wolfsonmicro.com
         QAContact: tinderbox-oe@gmx.net


gpe-image is failing as it can't find some locale data.

Is it possible some deps need rebuilt ?

NOTE: package gpe-image-1.0: started
NOTE: package gpe-image-1.0-r20: task do_rootfs: started
ERROR: function do_rootfs failed
ERROR: log data follows
(/home/liam/oe/imx21ads/work/mx21ads-linux-gnueabi/gpe-image-1.0-r20/temp/log.do_rootfs.18700)
| + rm -rf /home/liam/oe/imx21ads/rootfs
| + '[' 0 '!=' 1 ']'
| + mkdir -p /home/liam/oe/imx21ads/rootfs/dev
| + for devtable in
/home/liam/oe/org.openembedded.dev/files/device_table-minimal.txt
| + makedevs -r /home/liam/oe/imx21ads/rootfs -D
/home/liam/oe/org.openembedded.dev/files/device_table-minimal.txt
| + real_do_rootfs
| + set -x
| + mkdir -p /home/liam/oe/imx21ads/rootfs/dev
| + '[' -z '' ']'
| + touch /home/liam/oe/imx21ads/deploy/glibc/ipk/Packages
| + ipkg-make-index -r /home/liam/oe/imx21ads/deploy/glibc/ipk/Packages -p
/home/liam/oe/imx21ads/deploy/glibc/ipk/Packages -l
/home/liam/oe/imx21ads/deploy/glibc/ipk/Packages.filelist -m
/home/liam/oe/imx21ads/deploy/glibc/ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/gpesyncd-dbg_0.0+cvs-20060922-r0_armv5te.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/gpesyncd_0.0+cvs-20060922-r0_armv5te.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-dev_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-image-2.6.16.13-ezx6_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-aes_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-af-key_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ah4_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ah6_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-anubis_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-arc4_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-arp-tables_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-arpt-mangle_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-arptable-filter_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-bcm203x_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-bfusb_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-blowfish_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-bluetooth_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-bnep_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-bpa10x_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-bsd-comp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-cast5_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-cast6_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-cfi-cmdset-0001_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-cfi-probe_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-cfi-util_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-chipreg_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-cn_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-configfs_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-cramfs_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-crc-ccitt_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-crc16_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-crc32c_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-crypto-null_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-deflate_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-diskonchip_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-dm-crypt_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-dm-mod_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-doc2001plus_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-docecc_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-docprobe_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-esp4_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-esp6_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-exportfs_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-fat_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-firmware-class_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ftl_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-gen-probe_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-hci-uart_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-hci-usb_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-hci-vhci_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-hidp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ieee80211-crypt-ccmp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ieee80211-crypt-wep_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ieee80211-crypt_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ieee80211_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-inet-diag_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-inftl_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-intermodule_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack-amanda_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack-ftp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack-irc_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack-netbios-ns_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack-netlink_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack-pptp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack-proto-sctp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack-tftp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-conntrack_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-nat-amanda_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-nat-ftp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-nat-irc_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-nat-pptp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-nat-snmp-basic_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-nat-tftp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-nat_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip-tables_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6-tables_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6-tunnel_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-ah_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-dst_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-esp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-eui64_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-frag_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-hbh_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-hl_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-ipv6header_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-log_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-multiport_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-owner_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-policy_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-reject_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6t-rt_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6table-filter_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6table-mangle_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ip6table-raw_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipcomp6_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipcomp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-addrtype_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-ah_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-dscp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-ecn_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-esp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-hashlimit_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-iprange_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-log_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-masquerade_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-multiport_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-netmap_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-owner_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-policy_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-recent_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-redirect_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-reject_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-same_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-tcpmss_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-tos_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-ttl_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipt-ulog_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-iptable-filter_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-iptable-mangle_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-iptable-nat_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-iptable-raw_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ipv6_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-jedec-probe_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-khazad_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-l2cap_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-lcd_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-libcrc32c_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-libusual_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-loop_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-md4_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-michael-mic_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-msdos_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-mtd-blkdevs_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-mtdblock_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-mtdchar_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-mtdcore_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-mtdpart_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nand-ecc_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nand-ids_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nand_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nfnetlink-log_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nfnetlink-queue_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nfnetlink_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nfsd_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nftl_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-nls-base_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ohci-hcd_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-pcap-emu_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ppp-async_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ppp-deflate_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ppp-generic_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ppp-mppe_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-pxa27x_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-reed-solomon_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-relayfs_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-rfcomm_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-rfd-ftl_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-romfs_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-sco_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-serio_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-serpent_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-sha1_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-sha256_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-sha512_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-slhc_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-spi-bitbang_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-tcp-diag_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-tcrypt_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-tea_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-tgr192_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ts-bm_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ts-fsm_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-ts-kmp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-tsdev_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-twofish_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-usbcore_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-usbmon_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-vfat_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-wp512_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-x-tables_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xfrm-user_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xfrm4-tunnel_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xfrm6-tunnel_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-classify_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-comment_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-conntrack_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-dccp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-helper_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-length_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-limit_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-mac_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-mark_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-nfqueue_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-notrack_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-pkttype_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-realm_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-sctp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-state_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-string_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-tcpmss_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-xt-tcpudp_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-zlib-deflate_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-module-zlib-inflate_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel-modules_2.6-ezx7-r1_e680.ipk
|   extracting control.tar.gz from
/home/liam/oe/imx21ads/deploy/glibc/ipk/kernel_2.6-ezx7-r1_e680.ipk
|
| + mkdir -p
/home/liam/oe/imx21ads/work/mx21ads-linux-gnueabi/gpe-image-1.0-r20/temp
| + echo 'src oe file:/home/liam/oe/imx21ads/deploy/glibc/ipk'
| + ipkgarchs='all any noarch arm armv5te mx21ads'
| + priority=1
| + for arch in '$ipkgarchs'
| + echo 'arch all 1'
| ++ expr 1 + 5
| + priority=6
| + for arch in '$ipkgarchs'
| + echo 'arch any 6'
| ++ expr 6 + 5
| + priority=11
| + for arch in '$ipkgarchs'
| + echo 'arch noarch 11'
| ++ expr 11 + 5
| + priority=16
| + for arch in '$ipkgarchs'
| + echo 'arch arm 16'
| ++ expr 16 + 5
| + priority=21
| + for arch in '$ipkgarchs'
| + echo 'arch armv5te 21'
| ++ expr 21 + 5
| + priority=26
| + for arch in '$ipkgarchs'
| + echo 'arch mx21ads 26'
| ++ expr 26 + 5
| + priority=31
| + ipkg-cl -f
/home/liam/oe/imx21ads/work/mx21ads-linux-gnueabi/gpe-image-1.0-r20/temp/ipkg.conf
-o /home/liam/oe/imx21ads/rootfs update
| Downloading file:/home/liam/oe/imx21ads/deploy/glibc/ipk/Packages
| Updated list of available packages in
/home/liam/oe/imx21ads/rootfs//usr/lib/ipkg/lists/oe
| Successfully terminated.
| + '[' '!' -z 'locale-base-de-de locale-base-fr-fr locale-base-en-gb' ']'
| + ipkg-cl -f
/home/liam/oe/imx21ads/work/mx21ads-linux-gnueabi/gpe-image-1.0-r20/temp/ipkg.conf
-o /home/liam/oe/imx21ads/rootfs install glibc-localedata-i18n| Nothing to be
done
| An error ocurred, return value: 4.
| Collected errors:
| Cannot find package glibc-localedata-i18n.
| Check the spelling or perhaps run 'ipkg update'
NOTE: Task failed:
/home/liam/oe/imx21ads/work/mx21ads-linux-gnueabi/gpe-image-1.0-r20/temp/log.do_rootfs.18700
NOTE: package gpe-image-1.0-r20: task do_rootfs: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gpe-image-1.0: failed
ERROR: Build of gpe-image failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


