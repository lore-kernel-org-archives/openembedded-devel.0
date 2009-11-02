Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N4ufv-00023U-TC
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 12:02:19 +0100
Received: (qmail 25789 invoked by uid 813007); 2 Nov 2009 11:01:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Nov 2009 11:01:02 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Nov 2009 12:04:20 +0100
Message-Id: <1257159860-9024-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] linux-bug: bump SRCREV, enable more modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Nov 2009 11:02:19 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/linux/linux-bug/defconfig   |  223 +++++++++++++++++++++++++++++-----
 recipes/linux/linux-bug_2.6.27.2.bb |    4 +-
 2 files changed, 192 insertions(+), 35 deletions(-)

diff --git a/recipes/linux/linux-bug/defconfig b/recipes/linux/linux-bug/defconfig
index c0b2990..2a82b58 100644
--- a/recipes/linux/linux-bug/defconfig
+++ b/recipes/linux/linux-bug/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.27.2
-# Wed Oct  7 15:10:57 2009
+# Mon Nov  2 11:40:05 2009
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -343,6 +343,7 @@ CONFIG_INET_TCP_DIAG=y
 CONFIG_TCP_CONG_CUBIC=y
 CONFIG_DEFAULT_TCP_CONG="cubic"
 # CONFIG_TCP_MD5SIG is not set
+# CONFIG_IP_VS is not set
 CONFIG_IPV6=m
 # CONFIG_IPV6_PRIVACY is not set
 # CONFIG_IPV6_ROUTER_PREF is not set
@@ -363,7 +364,138 @@ CONFIG_IPV6_TUNNEL=m
 # CONFIG_IPV6_MULTIPLE_TABLES is not set
 # CONFIG_IPV6_MROUTE is not set
 # CONFIG_NETWORK_SECMARK is not set
-# CONFIG_NETFILTER is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+CONFIG_NETFILTER_NETLINK=m
+CONFIG_NETFILTER_NETLINK_QUEUE=m
+CONFIG_NETFILTER_NETLINK_LOG=m
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_CT_ACCT=y
+CONFIG_NF_CONNTRACK_MARK=y
+CONFIG_NF_CONNTRACK_EVENTS=y
+CONFIG_NF_CT_PROTO_DCCP=m
+CONFIG_NF_CT_PROTO_GRE=m
+CONFIG_NF_CT_PROTO_SCTP=m
+CONFIG_NF_CT_PROTO_UDPLITE=m
+CONFIG_NF_CONNTRACK_AMANDA=m
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_H323=m
+CONFIG_NF_CONNTRACK_IRC=m
+CONFIG_NF_CONNTRACK_NETBIOS_NS=m
+CONFIG_NF_CONNTRACK_PPTP=m
+CONFIG_NF_CONNTRACK_SANE=m
+CONFIG_NF_CONNTRACK_SIP=m
+CONFIG_NF_CONNTRACK_TFTP=m
+CONFIG_NF_CT_NETLINK=m
+CONFIG_NETFILTER_XTABLES=m
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_MARK=m
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
+CONFIG_NETFILTER_XT_TARGET_NFLOG=m
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+CONFIG_NETFILTER_XT_TARGET_RATEEST=m
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+CONFIG_NETFILTER_XT_MATCH_COMMENT=m
+CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
+CONFIG_NETFILTER_XT_MATCH_DCCP=m
+CONFIG_NETFILTER_XT_MATCH_DSCP=m
+CONFIG_NETFILTER_XT_MATCH_ESP=m
+CONFIG_NETFILTER_XT_MATCH_HELPER=m
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
+CONFIG_NETFILTER_XT_MATCH_LENGTH=m
+CONFIG_NETFILTER_XT_MATCH_LIMIT=m
+CONFIG_NETFILTER_XT_MATCH_MAC=m
+CONFIG_NETFILTER_XT_MATCH_MARK=m
+CONFIG_NETFILTER_XT_MATCH_OWNER=m
+CONFIG_NETFILTER_XT_MATCH_POLICY=m
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
+CONFIG_NETFILTER_XT_MATCH_QUOTA=m
+CONFIG_NETFILTER_XT_MATCH_RATEEST=m
+CONFIG_NETFILTER_XT_MATCH_REALM=m
+CONFIG_NETFILTER_XT_MATCH_SCTP=m
+CONFIG_NETFILTER_XT_MATCH_STATE=m
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
+CONFIG_NETFILTER_XT_MATCH_STRING=m
+CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
+CONFIG_NETFILTER_XT_MATCH_TIME=m
+CONFIG_NETFILTER_XT_MATCH_U32=m
+CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+CONFIG_IP_NF_QUEUE=m
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_RECENT=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_MATCH_ADDRTYPE=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_LOG=m
+CONFIG_IP_NF_TARGET_ULOG=m
+CONFIG_NF_NAT=m
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_NF_NAT_SNMP_BASIC=m
+CONFIG_NF_NAT_PROTO_DCCP=m
+CONFIG_NF_NAT_PROTO_GRE=m
+CONFIG_NF_NAT_PROTO_UDPLITE=m
+CONFIG_NF_NAT_PROTO_SCTP=m
+CONFIG_NF_NAT_FTP=m
+CONFIG_NF_NAT_IRC=m
+CONFIG_NF_NAT_TFTP=m
+CONFIG_NF_NAT_AMANDA=m
+CONFIG_NF_NAT_PPTP=m
+CONFIG_NF_NAT_H323=m
+CONFIG_NF_NAT_SIP=m
+CONFIG_IP_NF_MANGLE=m
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_TARGET_CLUSTERIP=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+
+#
+# IPv6: Netfilter Configuration
+#
+CONFIG_NF_CONNTRACK_IPV6=m
+CONFIG_IP6_NF_QUEUE=m
+CONFIG_IP6_NF_IPTABLES=m
+CONFIG_IP6_NF_MATCH_RT=m
+CONFIG_IP6_NF_MATCH_OPTS=m
+CONFIG_IP6_NF_MATCH_FRAG=m
+CONFIG_IP6_NF_MATCH_HL=m
+CONFIG_IP6_NF_MATCH_IPV6HEADER=m
+CONFIG_IP6_NF_MATCH_AH=m
+CONFIG_IP6_NF_MATCH_MH=m
+CONFIG_IP6_NF_MATCH_EUI64=m
+CONFIG_IP6_NF_FILTER=m
+CONFIG_IP6_NF_TARGET_LOG=m
+CONFIG_IP6_NF_TARGET_REJECT=m
+CONFIG_IP6_NF_MANGLE=m
+CONFIG_IP6_NF_TARGET_HL=m
+CONFIG_IP6_NF_RAW=m
 # CONFIG_IP_DCCP is not set
 # CONFIG_IP_SCTP is not set
 # CONFIG_TIPC is not set
@@ -379,6 +511,7 @@ CONFIG_IPV6_TUNNEL=m
 # CONFIG_ECONET is not set
 # CONFIG_WAN_ROUTER is not set
 # CONFIG_NET_SCHED is not set
+CONFIG_NET_CLS_ROUTE=y
 
 #
 # Network testing
@@ -461,6 +594,7 @@ CONFIG_BLK_DEV_LOOP=y
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
 # CONFIG_MISC_DEVICES is not set
+CONFIG_EEPROM_93CX6=m
 CONFIG_HAVE_IDE=y
 # CONFIG_IDE is not set
 
@@ -542,16 +676,23 @@ CONFIG_LIBERTAS_GSPI=m
 CONFIG_LIBERTAS_BMI=m
 CONFIG_LIBERTAS_DEBUG=y
 CONFIG_USB_ZD1201=m
-# CONFIG_USB_NET_RNDIS_WLAN is not set
-# CONFIG_RTL8187 is not set
+CONFIG_USB_NET_RNDIS_WLAN=m
+CONFIG_RTL8187=m
 # CONFIG_MAC80211_HWSIM is not set
 # CONFIG_P54_COMMON is not set
 # CONFIG_IWLWIFI_LEDS is not set
 # CONFIG_HOSTAP is not set
 # CONFIG_B43 is not set
 # CONFIG_B43LEGACY is not set
-# CONFIG_ZD1211RW is not set
-# CONFIG_RT2X00 is not set
+CONFIG_ZD1211RW=m
+# CONFIG_ZD1211RW_DEBUG is not set
+CONFIG_RT2X00=m
+CONFIG_RT2X00_LIB=m
+CONFIG_RT2X00_LIB_USB=m
+CONFIG_RT2X00_LIB_FIRMWARE=y
+CONFIG_RT2500USB=m
+CONFIG_RT73USB=m
+# CONFIG_RT2X00_DEBUG is not set
 
 #
 # USB Network Adapters
@@ -566,9 +707,9 @@ CONFIG_USB_NET_CDCETHER=m
 CONFIG_USB_NET_DM9601=m
 # CONFIG_USB_NET_GL620A is not set
 # CONFIG_USB_NET_NET1080 is not set
-# CONFIG_USB_NET_PLUSB is not set
-# CONFIG_USB_NET_MCS7830 is not set
-# CONFIG_USB_NET_RNDIS_HOST is not set
+CONFIG_USB_NET_PLUSB=m
+CONFIG_USB_NET_MCS7830=m
+CONFIG_USB_NET_RNDIS_HOST=m
 # CONFIG_USB_NET_CDC_SUBSET is not set
 # CONFIG_USB_NET_ZAURUS is not set
 # CONFIG_WAN is not set
@@ -870,7 +1011,14 @@ CONFIG_FB_MXC_ASYNC_PANEL_IFC_16_BIT=y
 CONFIG_FB_BUG=y
 # CONFIG_FB_S1D13XXX is not set
 # CONFIG_FB_VIRTUAL is not set
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=m
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_ILI9320 is not set
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LCD_PLATFORM is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=m
+# CONFIG_BACKLIGHT_CORGI is not set
 
 #
 # Display device support
@@ -951,7 +1099,7 @@ CONFIG_USB_DEVICEFS=y
 # CONFIG_USB_OTG is not set
 # CONFIG_USB_OTG_WHITELIST is not set
 # CONFIG_USB_OTG_BLACKLIST_HUB is not set
-# CONFIG_USB_MON is not set
+CONFIG_USB_MON=y
 
 #
 # USB Host Controller Drivers
@@ -969,6 +1117,7 @@ CONFIG_USB_EHCI_ROOT_HUB_TT=y
 # CONFIG_USB_EHCI_TT_NEWSCHED is not set
 # CONFIG_USB_ISP116X_HCD is not set
 # CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_U132_HCD is not set
 # CONFIG_USB_SL811_HCD is not set
 # CONFIG_USB_R8A66597_HCD is not set
 # CONFIG_USB_GADGET_MUSB_HDRC is not set
@@ -1006,7 +1155,7 @@ CONFIG_USB_STORAGE=y
 #
 # USB Imaging devices
 #
-# CONFIG_USB_MDC800 is not set
+CONFIG_USB_MDC800=m
 # CONFIG_USB_MICROTEK is not set
 
 #
@@ -1059,26 +1208,30 @@ CONFIG_USB_SERIAL_SIERRAWIRELESS=m
 #
 # USB Miscellaneous drivers
 #
-# CONFIG_USB_EMI62 is not set
-# CONFIG_USB_EMI26 is not set
-# CONFIG_USB_ADUTUX is not set
-# CONFIG_USB_RIO500 is not set
-# CONFIG_USB_LEGOTOWER is not set
-# CONFIG_USB_LCD is not set
-# CONFIG_USB_BERRY_CHARGE is not set
-# CONFIG_USB_LED is not set
-# CONFIG_USB_CYPRESS_CY7C63 is not set
-# CONFIG_USB_CYTHERM is not set
-# CONFIG_USB_PHIDGET is not set
-# CONFIG_USB_IDMOUSE is not set
-# CONFIG_USB_FTDI_ELAN is not set
-# CONFIG_USB_APPLEDISPLAY is not set
-# CONFIG_USB_SISUSBVGA is not set
-# CONFIG_USB_LD is not set
-# CONFIG_USB_TRANCEVIBRATOR is not set
-# CONFIG_USB_IOWARRIOR is not set
-# CONFIG_USB_TEST is not set
-# CONFIG_USB_ISIGHTFW is not set
+CONFIG_USB_EMI62=m
+CONFIG_USB_EMI26=m
+CONFIG_USB_ADUTUX=m
+CONFIG_USB_RIO500=m
+CONFIG_USB_LEGOTOWER=m
+CONFIG_USB_LCD=m
+CONFIG_USB_BERRY_CHARGE=m
+CONFIG_USB_LED=m
+CONFIG_USB_CYPRESS_CY7C63=m
+CONFIG_USB_CYTHERM=m
+CONFIG_USB_PHIDGET=m
+CONFIG_USB_PHIDGETKIT=m
+CONFIG_USB_PHIDGETMOTORCONTROL=m
+CONFIG_USB_PHIDGETSERVO=m
+CONFIG_USB_IDMOUSE=m
+CONFIG_USB_FTDI_ELAN=m
+CONFIG_USB_APPLEDISPLAY=m
+CONFIG_USB_SISUSBVGA=m
+CONFIG_USB_SISUSBVGA_CON=y
+CONFIG_USB_LD=m
+CONFIG_USB_TRANCEVIBRATOR=m
+CONFIG_USB_IOWARRIOR=m
+CONFIG_USB_TEST=m
+CONFIG_USB_ISIGHTFW=m
 CONFIG_USB_GADGET=m
 # CONFIG_USB_GADGET_DEBUG is not set
 # CONFIG_USB_GADGET_DEBUG_FILES is not set
@@ -1599,9 +1752,13 @@ CONFIG_CRC_CCITT=m
 CONFIG_CRC_ITU_T=m
 CONFIG_CRC32=y
 # CONFIG_CRC7 is not set
-# CONFIG_LIBCRC32C is not set
+CONFIG_LIBCRC32C=m
 CONFIG_ZLIB_INFLATE=y
 CONFIG_ZLIB_DEFLATE=m
+CONFIG_TEXTSEARCH=y
+CONFIG_TEXTSEARCH_KMP=m
+CONFIG_TEXTSEARCH_BM=m
+CONFIG_TEXTSEARCH_FSM=m
 CONFIG_PLIST=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-bug_2.6.27.2.bb
index 8c83f9a..bb4d11f 100644
--- a/recipes/linux/linux-bug_2.6.27.2.bb
+++ b/recipes/linux/linux-bug_2.6.27.2.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Linux kernel for bug"
 
 PV_append = "+svnr${SRCREV}"
 KV = "2.6.27.2"
-PR = "r29"
+PR = "r30"
 
 COMPATIBLE_MACHINE = "bug"
 
 SVN_PRJ = "bug-linux-${KV}"
-SRCREV = "10199"
+SRCREV = "10371"
 
 SRC_URI = "svn://svn.buglabs.net/bug/branches/R1.4/qa;module=${SVN_PRJ};proto=svn \
            file://defconfig \
-- 
1.6.5





