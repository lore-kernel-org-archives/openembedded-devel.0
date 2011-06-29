Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Qc2gg-0007sk-Rf
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 23:52:47 +0200
Received: by gwb11 with SMTP id 11so688835gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tFvjOHzJyza1POw4jQ8+8bThIlVgM8/VAh2lQfHxRf0=;
	b=S5C/A8jEk5+45Ybw3kcuDGYSvlAYUp1u6PXFiOjIG/EYxZMDn523pB1cF6oThfbLr2
	tbhvYFSr1myG3Av5WJMYdsh+BJKO9H18w2jBCHovbVlrns+OVERyiXwifg9DH6YNk+aR
	OUL5cTtL22iNmi6PrRZUQ8tuPpB3BozI/lTxA=
Received: by 10.101.46.12 with SMTP id y12mr1128937anj.63.1309384142824;
	Wed, 29 Jun 2011 14:49:02 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v16sm1413508ann.13.2011.06.29.14.48.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 14:49:01 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jun 2011 16:48:53 -0500
Message-Id: <1309384133-9730-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] softap-udhcpd-config: add recipe for udhcpd config files
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
X-List-Received-Date: Wed, 29 Jun 2011 21:52:47 -0000

* Install udhcpd.conf file for setting up networking for Soft AP.
* Allow machine specific versions of the configuration file.
* Default configuration file is from the samples/udhcp.conf file
  in the base udhcpd package.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../udhcp/softap-udhcpd-config/omap3/udhcpd.conf   |  116 ++++++++++++++++++++
 .../softap-udhcpd-config/omapl138/udhcpd.conf      |  116 ++++++++++++++++++++
 recipes/udhcp/softap-udhcpd-config/udhcpd.conf     |  116 ++++++++++++++++++++
 recipes/udhcp/softap-udhcpd-config_1.0.bb          |   19 +++
 4 files changed, 367 insertions(+), 0 deletions(-)
 create mode 100644 recipes/udhcp/softap-udhcpd-config/omap3/udhcpd.conf
 create mode 100644 recipes/udhcp/softap-udhcpd-config/omapl138/udhcpd.conf
 create mode 100644 recipes/udhcp/softap-udhcpd-config/udhcpd.conf
 create mode 100644 recipes/udhcp/softap-udhcpd-config_1.0.bb

diff --git a/recipes/udhcp/softap-udhcpd-config/omap3/udhcpd.conf b/recipes/udhcp/softap-udhcpd-config/omap3/udhcpd.conf
new file mode 100644
index 0000000..eea948d
--- /dev/null
+++ b/recipes/udhcp/softap-udhcpd-config/omap3/udhcpd.conf
@@ -0,0 +1,116 @@
+# Sample udhcpd configuration file (/etc/udhcpd.conf)
+
+# The start and end of the IP lease block
+
+start 		192.168.0.20	#default: 192.168.0.20
+end		192.168.0.254	#default: 192.168.0.254
+
+
+# The interface that udhcpd will use
+
+interface	wlan0		#default: eth0
+
+
+# The maximim number of leases (includes addressesd reserved
+# by OFFER's, DECLINE's, and ARP conficts
+
+#max_leases	254		#default: 254
+
+
+# If remaining is true (default), udhcpd will store the time
+# remaining for each lease in the udhcpd leases file. This is
+# for embedded systems that cannot keep time between reboots.
+# If you set remaining to no, the absolute time that the lease
+# expires at will be stored in the dhcpd.leases file.
+
+#remaining	yes		#default: yes
+
+
+# The time period at which udhcpd will write out a dhcpd.leases
+# file. If this is 0, udhcpd will never automatically write a
+# lease file. (specified in seconds)
+
+#auto_time	7200		#default: 7200 (2 hours)
+
+
+# The amount of time that an IP will be reserved (leased) for if a
+# DHCP decline message is received (seconds).
+
+#decline_time	3600		#default: 3600 (1 hour)
+
+
+# The amount of time that an IP will be reserved (leased) for if an
+# ARP conflct occurs. (seconds
+
+#conflict_time	3600		#default: 3600 (1 hour)
+
+
+# How long an offered address is reserved (leased) in seconds
+
+#offer_time	60		#default: 60 (1 minute)
+
+# If a lease to be given is below this value, the full lease time is
+# instead used (seconds).
+
+#min_lease	60		#defult: 60
+
+
+# The location of the leases file
+
+#lease_file	/var/lib/misc/udhcpd.leases	#defualt: /var/lib/misc/udhcpd.leases
+
+# The location of the pid file
+#pidfile	/var/run/udhcpd.pid	#default: /var/run/udhcpd.pid
+
+# Everytime udhcpd writes a leases file, the below script will be called.
+# Useful for writing the lease file to flash every few hours.
+
+#notify_file				#default: (no script)
+
+#notify_file	dumpleases 	# <--- usefull for debugging
+
+# The following are bootp specific options, setable by udhcpd.
+
+#siaddr		192.168.0.22		#default: 0.0.0.0
+
+#sname		zorak			#default: (none)
+
+#boot_file	/var/nfs_root		#default: (none)
+
+# The remainer of options are DHCP options and can be specifed with the
+# keyword 'opt' or 'option'. If an option can take multiple items, such
+# as the dns option, they can be listed on the same line, or multiple
+# lines. The only option with a default is 'lease'.
+
+#Examles
+opt	dns	8.8.8.8 8.8.4.4 #public google dns servers
+option	subnet	255.255.255.0
+opt	router	192.168.0.1
+#opt	wins	192.168.10.10
+#option	dns	129.219.13.81	# appened to above DNS servers for a total of 3
+#option	domain	local
+option	lease	864000		# 10 days of seconds
+
+
+# Currently supported options, for more info, see options.c
+#subnet
+#timezone
+#router
+#timesvr
+#namesvr
+#dns
+#logsvr
+#cookiesvr
+#lprsvr
+#bootsize
+#domain
+#swapsvr
+#rootpath
+#ipttl
+#mtu
+#broadcast
+#wins
+#lease
+#ntpsrv
+#tftp
+#bootfile
diff --git a/recipes/udhcp/softap-udhcpd-config/omapl138/udhcpd.conf b/recipes/udhcp/softap-udhcpd-config/omapl138/udhcpd.conf
new file mode 100644
index 0000000..eea948d
--- /dev/null
+++ b/recipes/udhcp/softap-udhcpd-config/omapl138/udhcpd.conf
@@ -0,0 +1,116 @@
+# Sample udhcpd configuration file (/etc/udhcpd.conf)
+
+# The start and end of the IP lease block
+
+start 		192.168.0.20	#default: 192.168.0.20
+end		192.168.0.254	#default: 192.168.0.254
+
+
+# The interface that udhcpd will use
+
+interface	wlan0		#default: eth0
+
+
+# The maximim number of leases (includes addressesd reserved
+# by OFFER's, DECLINE's, and ARP conficts
+
+#max_leases	254		#default: 254
+
+
+# If remaining is true (default), udhcpd will store the time
+# remaining for each lease in the udhcpd leases file. This is
+# for embedded systems that cannot keep time between reboots.
+# If you set remaining to no, the absolute time that the lease
+# expires at will be stored in the dhcpd.leases file.
+
+#remaining	yes		#default: yes
+
+
+# The time period at which udhcpd will write out a dhcpd.leases
+# file. If this is 0, udhcpd will never automatically write a
+# lease file. (specified in seconds)
+
+#auto_time	7200		#default: 7200 (2 hours)
+
+
+# The amount of time that an IP will be reserved (leased) for if a
+# DHCP decline message is received (seconds).
+
+#decline_time	3600		#default: 3600 (1 hour)
+
+
+# The amount of time that an IP will be reserved (leased) for if an
+# ARP conflct occurs. (seconds
+
+#conflict_time	3600		#default: 3600 (1 hour)
+
+
+# How long an offered address is reserved (leased) in seconds
+
+#offer_time	60		#default: 60 (1 minute)
+
+# If a lease to be given is below this value, the full lease time is
+# instead used (seconds).
+
+#min_lease	60		#defult: 60
+
+
+# The location of the leases file
+
+#lease_file	/var/lib/misc/udhcpd.leases	#defualt: /var/lib/misc/udhcpd.leases
+
+# The location of the pid file
+#pidfile	/var/run/udhcpd.pid	#default: /var/run/udhcpd.pid
+
+# Everytime udhcpd writes a leases file, the below script will be called.
+# Useful for writing the lease file to flash every few hours.
+
+#notify_file				#default: (no script)
+
+#notify_file	dumpleases 	# <--- usefull for debugging
+
+# The following are bootp specific options, setable by udhcpd.
+
+#siaddr		192.168.0.22		#default: 0.0.0.0
+
+#sname		zorak			#default: (none)
+
+#boot_file	/var/nfs_root		#default: (none)
+
+# The remainer of options are DHCP options and can be specifed with the
+# keyword 'opt' or 'option'. If an option can take multiple items, such
+# as the dns option, they can be listed on the same line, or multiple
+# lines. The only option with a default is 'lease'.
+
+#Examles
+opt	dns	8.8.8.8 8.8.4.4 #public google dns servers
+option	subnet	255.255.255.0
+opt	router	192.168.0.1
+#opt	wins	192.168.10.10
+#option	dns	129.219.13.81	# appened to above DNS servers for a total of 3
+#option	domain	local
+option	lease	864000		# 10 days of seconds
+
+
+# Currently supported options, for more info, see options.c
+#subnet
+#timezone
+#router
+#timesvr
+#namesvr
+#dns
+#logsvr
+#cookiesvr
+#lprsvr
+#bootsize
+#domain
+#swapsvr
+#rootpath
+#ipttl
+#mtu
+#broadcast
+#wins
+#lease
+#ntpsrv
+#tftp
+#bootfile
diff --git a/recipes/udhcp/softap-udhcpd-config/udhcpd.conf b/recipes/udhcp/softap-udhcpd-config/udhcpd.conf
new file mode 100644
index 0000000..831a631
--- /dev/null
+++ b/recipes/udhcp/softap-udhcpd-config/udhcpd.conf
@@ -0,0 +1,116 @@
+# Sample udhcpd configuration file (/etc/udhcpd.conf)
+
+# The start and end of the IP lease block
+
+start 		192.168.0.20	#default: 192.168.0.20
+end		192.168.0.254	#default: 192.168.0.254
+
+
+# The interface that udhcpd will use
+
+interface	eth0		#default: eth0
+
+
+# The maximim number of leases (includes addressesd reserved
+# by OFFER's, DECLINE's, and ARP conficts
+
+#max_leases	254		#default: 254
+
+
+# If remaining is true (default), udhcpd will store the time
+# remaining for each lease in the udhcpd leases file. This is
+# for embedded systems that cannot keep time between reboots.
+# If you set remaining to no, the absolute time that the lease
+# expires at will be stored in the dhcpd.leases file.
+
+#remaining	yes		#default: yes
+
+
+# The time period at which udhcpd will write out a dhcpd.leases
+# file. If this is 0, udhcpd will never automatically write a
+# lease file. (specified in seconds)
+
+#auto_time	7200		#default: 7200 (2 hours)
+
+
+# The amount of time that an IP will be reserved (leased) for if a
+# DHCP decline message is received (seconds).
+
+#decline_time	3600		#default: 3600 (1 hour)
+
+
+# The amount of time that an IP will be reserved (leased) for if an
+# ARP conflct occurs. (seconds
+
+#conflict_time	3600		#default: 3600 (1 hour)
+
+
+# How long an offered address is reserved (leased) in seconds
+
+#offer_time	60		#default: 60 (1 minute)
+
+# If a lease to be given is below this value, the full lease time is
+# instead used (seconds).
+
+#min_lease	60		#defult: 60
+
+
+# The location of the leases file
+
+#lease_file	/var/lib/misc/udhcpd.leases	#defualt: /var/lib/misc/udhcpd.leases
+
+# The location of the pid file
+#pidfile	/var/run/udhcpd.pid	#default: /var/run/udhcpd.pid
+
+# Everytime udhcpd writes a leases file, the below script will be called.
+# Useful for writing the lease file to flash every few hours.
+
+#notify_file				#default: (no script)
+
+#notify_file	dumpleases 	# <--- usefull for debugging
+
+# The following are bootp specific options, setable by udhcpd.
+
+#siaddr		192.168.0.22		#default: 0.0.0.0
+
+#sname		zorak			#default: (none)
+
+#boot_file	/var/nfs_root		#default: (none)
+
+# The remainer of options are DHCP options and can be specifed with the
+# keyword 'opt' or 'option'. If an option can take multiple items, such
+# as the dns option, they can be listed on the same line, or multiple
+# lines. The only option with a default is 'lease'.
+
+#Examles
+opt	dns	192.168.10.2 192.168.10.10
+option	subnet	255.255.255.0
+opt	router	192.168.10.2
+opt	wins	192.168.10.10
+option	dns	129.219.13.81	# appened to above DNS servers for a total of 3
+option	domain	local
+option	lease	864000		# 10 days of seconds
+
+
+# Currently supported options, for more info, see options.c
+#subnet
+#timezone
+#router
+#timesvr
+#namesvr
+#dns
+#logsvr
+#cookiesvr
+#lprsvr
+#bootsize
+#domain
+#swapsvr
+#rootpath
+#ipttl
+#mtu
+#broadcast
+#wins
+#lease
+#ntpsrv
+#tftp
+#bootfile
\ No newline at end of file
diff --git a/recipes/udhcp/softap-udhcpd-config_1.0.bb b/recipes/udhcp/softap-udhcpd-config_1.0.bb
new file mode 100644
index 0000000..c3a7f2f
--- /dev/null
+++ b/recipes/udhcp/softap-udhcpd-config_1.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Configuration files for SoftAP with udhcpd"
+SECTION = "console/network"
+HOMEPAGE = "http://udhcp.busybox.net/"
+LICENSE = "GPLv2+"
+
+PR = "r0"
+
+S = ${WORKDIR}
+
+# Default configuration file is from the base udhcp package
+SRC_URI = "file://udhcpd.conf"
+
+do_install() {
+    install -d ${D}${sysconfdir}
+    install -m 0755 ${S}/udhcpd.conf ${D}${sysconfdir}
+}
+
+FILES_${PN} += "${sysconfdir}/udhcpd.conf"
+CONFFILES_${PN} += "${sysconfdir}/udhcpd.conf"
-- 
1.7.0.4



