Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D7AF372154
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 09:57:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43559980"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Nov 2014 17:53:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAI9ubiY019477
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 17:56:37 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 18 Nov 2014 17:56:56 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Nov 2014 17:55:58 +0800
Message-ID: <1416304558-12255-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <546AA9C5.7080303@windriver.com>
References: <546AA9C5.7080303@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH v2] rarpd : add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Nov 2014 09:57:16 -0000
Content-Type: text/plain

RARP (Reverse Address Resolution Protocol) is a protocol which allows
individual devices on an IP network to get their own IP addresses from
the RARP server. Some machines (e.g. SPARC boxes) use this protocol
instead of e.g. DHCP to query their IP addresses during network bootup.

Linux kernels up to 2.2 used to provide a kernel daemon for this
service,but since 2.3 kernels it is served by this userland daemon.
You should install rarpd if you want to set up a RARP server on your
network.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../rarpd/files/0001-rarpd.8-add-man-file.patch    |  89 +++++++
 .../0002-Makefile-modify-compile-parameters.patch  |  26 ++
 .../rarpd/files/0003-rarpd.c-bug-fix.patch         | 263 +++++++++++++++++++++
 .../files/0004-rarpd.init-add-new-init-file.patch  | 116 +++++++++
 .../rarpd/files/0005-ethernet.c-remove-it.patch    | 244 +++++++++++++++++++
 meta-oe/recipes-extended/rarpd/files/ethers.sample |   1 +
 meta-oe/recipes-extended/rarpd/files/rarpd.service |  14 ++
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |  48 ++++
 8 files changed, 801 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rarpd/files/0001-rarpd.8-add-man-file.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/0002-Makefile-modify-compile-parameters.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/0003-rarpd.c-bug-fix.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/0004-rarpd.init-add-new-init-file.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/0005-ethernet.c-remove-it.patch
 create mode 100644 meta-oe/recipes-extended/rarpd/files/ethers.sample
 create mode 100644 meta-oe/recipes-extended/rarpd/files/rarpd.service
 create mode 100644 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb

diff --git a/meta-oe/recipes-extended/rarpd/files/0001-rarpd.8-add-man-file.patch b/meta-oe/recipes-extended/rarpd/files/0001-rarpd.8-add-man-file.patch
new file mode 100644
index 0000000..77c75b4
--- /dev/null
+++ b/meta-oe/recipes-extended/rarpd/files/0001-rarpd.8-add-man-file.patch
@@ -0,0 +1,89 @@
+From d91161eb163c16408202a91b4325a3381ab33752 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 18 Nov 2014 17:55:31 +0900
+Subject: [PATCH 1/5] rarpd.8 : add man file
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ rarpd.8 | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 69 insertions(+)
+ create mode 100644 rarpd.8
+
+diff --git a/rarpd.8 b/rarpd.8
+new file mode 100644
+index 0000000..ce7bd70
+--- /dev/null
++++ b/rarpd.8
+@@ -0,0 +1,69 @@
++.TH RARP 8 "7 April 2000" "rarpd" "Linux Programmer's Manual"
++.SH NAME
++rarpd \- Reverse Address Resolution Protocol (RARP) daemon
++.SH SYNOPSIS
++.B "rarpd [-aAvde] [-b bootdir ] [ interface ]"
++.SH DESCRIPTION
++.B Rarpd
++is a daemon which responds to RARP requests.
++RARP is used by some machines at boot time to discover their IP address.
++They provide their Ethernet address and
++.B rarpd
++responds with their IP address if it finds it in the ethers database
++(either
++.I /etc/ethers
++file or NIS+ lookup) and using DNS lookup if ethers database
++contains a hostname and not an IP address.
++By default
++.B rarpd
++also checks if a bootable image with a name starting with the IP address
++in hexadecimal uppercase letters is present in the TFTP boot directory
++(usually
++.I /tftpboot
++) before it decides to respond to the RARP request.
++.SH OPTIONS
++.TP
++.B \-a
++Do not bind to the interface.
++.TP
++.B \-A
++Respond to ARP as well as RARP requests.
++.TP
++.B \-v
++Tell the user what is going on by being verbose.
++.TP
++.B \-d
++Debugging mode. Do not detach from the tty.
++.TP
++.B \-e
++Skip the check for bootable image in the TFTP boot directory. If not
++present, then even if the Ethernet address is present in
++the ethers database but the bootable image for the resolved IP does not exist,
++.B rarpd
++will not respond to the request.
++.TP
++.B "\-b bootdir"
++Use
++.I bootdir
++instead of the default
++.I /tftpboot
++as the TFTP boot directory for bootable image checks.
++.SH OBSOLETES
++This
++.B rarpd
++obsoletes kernel
++.B rarp
++daemon present in Linux kernels up to 2.2 which was controlled by the
++rarp(8) command.
++.SH FILES
++.I /etc/ethers,
++.br
++.I /etc/nsswitch.conf,
++.br
++.I /tftpboot
++.SH SEE ALSO
++ethers(5)
++.SH AUTHORS
++Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
++.br
++Jakub Jelinek, <jakub@redhat.com>
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/rarpd/files/0002-Makefile-modify-compile-parameters.patch b/meta-oe/recipes-extended/rarpd/files/0002-Makefile-modify-compile-parameters.patch
new file mode 100644
index 0000000..0b3ebc4
--- /dev/null
+++ b/meta-oe/recipes-extended/rarpd/files/0002-Makefile-modify-compile-parameters.patch
@@ -0,0 +1,26 @@
+From d23b13bd959204824070433d954c5dfbfc421bb7 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 18 Nov 2014 18:05:27 +0900
+Subject: [PATCH 2/5] Makefile : modify compile parameters
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 19966b4..86a8169 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,7 @@
+ CC=gcc
+ CFLAGS=-O2 -Wall -g $(DEFINES)
+ 
+-OBJ=rarpd.o ethernet.o
++OBJ=rarpd.o
+ 
+ all: rarpd
+ 
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/rarpd/files/0003-rarpd.c-bug-fix.patch b/meta-oe/recipes-extended/rarpd/files/0003-rarpd.c-bug-fix.patch
new file mode 100644
index 0000000..7ce1279
--- /dev/null
+++ b/meta-oe/recipes-extended/rarpd/files/0003-rarpd.c-bug-fix.patch
@@ -0,0 +1,263 @@
+From b49c8e6e66801406520d1bff791c66dff7b1cddb Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 18 Nov 2014 18:10:20 +0900
+Subject: [PATCH 3/5] rarpd.c : bug fix
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ rarpd.c | 98 +++++++++++++++++++++++++++++++++++++----------------------------
+ 1 file changed, 56 insertions(+), 42 deletions(-)
+
+diff --git a/rarpd.c b/rarpd.c
+index 335d2d2..d45300e 100644
+--- a/rarpd.c
++++ b/rarpd.c
+@@ -7,9 +7,11 @@
+  *		2 of the License, or (at your option) any later version.
+  *
+  * Authors:	Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
++ *		Jakub Jelinek, <jakub@redhat.com>
+  */
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <syslog.h>
+ #include <dirent.h>
+ #include <malloc.h>
+@@ -26,6 +28,8 @@
+ #include <net/if.h>
+ #include <net/if_arp.h>
+ #include <netinet/in.h>
++#include <netinet/ether.h>
++#include <asm/types.h>
+ #include <linux/if_packet.h>
+ #include <linux/filter.h>
+ 
+@@ -39,27 +43,26 @@ int only_ethers;
+ int all_ifaces;
+ int listen_arp;
+ char *ifname;
+-char *tftp_dir = "/etc/tftpboot";
++char *tftp_dir = "/tftpboot";
+ 
+-extern int ether_ntohost(char *name, unsigned char *ea);
+ void usage(void) __attribute__((noreturn));
+ 
+-struct iflink
++struct rarpiflink
+ {
+-	struct iflink	*next;
+-	int	       	index;
+-	int		hatype;
+-	unsigned char	lladdr[16];
+-	unsigned char	name[IFNAMSIZ];
+-	struct ifaddr 	*ifa_list;
++	struct rarpiflink	*next;
++	int	       		index;
++	int			hatype;
++	unsigned char		lladdr[16];
++	unsigned char		name[IFNAMSIZ];
++	struct rarpifaddr 	*ifa_list;
+ } *ifl_list;
+ 
+-struct ifaddr
++struct rarpifaddr
+ {
+-	struct ifaddr 	*next;
+-	__u32		prefix;
+-	__u32		mask;
+-	__u32		local;
++	struct rarpifaddr 	*next;
++	__u32			prefix;
++	__u32			mask;
++	__u32			local;
+ };
+ 
+ struct rarp_map
+@@ -87,8 +90,8 @@ void load_if()
+ {
+ 	int fd;
+ 	struct ifreq *ifrp, *ifend;
+-	struct iflink *ifl;
+-	struct ifaddr *ifa;
++	struct rarpiflink *ifl;
++	struct rarpifaddr *ifa;
+ 	struct ifconf ifc;
+ 	struct ifreq ibuf[256];
+ 
+@@ -144,7 +147,7 @@ void load_if()
+ 				continue;
+ 			}
+ 
+-			ifl = (struct iflink*)malloc(sizeof(*ifl));
++			ifl = (struct rarpiflink*)malloc(sizeof(*ifl));
+ 			if (ifl == NULL)
+ 				continue;
+ 			memset(ifl, 0, sizeof(*ifl));
+@@ -154,6 +157,7 @@ void load_if()
+ 			ifl->hatype = ifrp->ifr_hwaddr.sa_family;
+ 			memcpy(ifl->lladdr, ifrp->ifr_hwaddr.sa_data, 14);
+ 			strncpy(ifl->name, ifrp->ifr_name, IFNAMSIZ);
++			ifl->name[IFNAMSIZ-1] = 0;
+ 			p = strchr(ifl->name, ':');
+ 			if (p)
+ 				*p = 0;
+@@ -179,7 +183,7 @@ void load_if()
+ 		if (ifa == NULL) {
+ 			if (mask == 0 || prefix == 0)
+ 				continue;
+-			ifa = (struct ifaddr*)malloc(sizeof(*ifa));
++			ifa = (struct rarpifaddr*)malloc(sizeof(*ifa));
+ 			memset(ifa, 0, sizeof(*ifa));
+ 			ifa->local = addr;
+ 			ifa->prefix = prefix;
+@@ -207,6 +211,7 @@ void load_if()
+ 			}
+ 		}
+ 	}
++	close(fd);
+ }
+ 
+ void configure()
+@@ -225,20 +230,21 @@ int bootable(__u32 addr)
+ 	d = opendir(tftp_dir);
+ 	if (d == NULL) {
+ 		syslog(LOG_ERR, "opendir: %m");
+-		return 0;
++		goto done_bootable;
+ 	}
+ 	while ((dent = readdir(d)) != NULL) {
+ 		if (strncmp(dent->d_name, name, 8) == 0)
+ 			break;
+ 	}
++done_bootable:
+ 	closedir(d);
+ 	return dent != NULL;
+ }
+ 
+-struct ifaddr *select_ipaddr(int ifindex, __u32 *sel_addr, __u32 **alist)
++struct rarpifaddr *select_ipaddr(int ifindex, __u32 *sel_addr, __u32 **alist)
+ {
+-	struct iflink *ifl;
+-	struct ifaddr *ifa;
++	struct rarpiflink *ifl;
++	struct rarpifaddr *ifa;
+ 	int retry = 0;
+ 	int i;
+ 
+@@ -294,7 +300,7 @@ struct rarp_map *rarp_lookup(int ifindex, int hatype,
+ 
+ 	if (r == NULL) {
+ 		if (hatype == ARPHRD_ETHER && halen == 6) {
+-			struct ifaddr *ifa;
++			struct rarpifaddr *ifa;
+ 			struct hostent *hp;
+ 			char ename[256];
+ 			static struct rarp_map emap = {
+@@ -304,7 +310,7 @@ struct rarp_map *rarp_lookup(int ifindex, int hatype,
+ 				6,
+ 			};
+ 
+-			if (ether_ntohost(ename, lladdr) != 0 ||
++			if (ether_ntohost(ename, (struct ether_addr *)lladdr) != 0 ||
+ 			    (hp = gethostbyname(ename)) == NULL) {
+ 				if (verbose)
+ 					syslog(LOG_INFO, "not found in /etc/ethers");
+@@ -345,7 +351,7 @@ static int load_arp_bpflet(int fd)
+ 
+ int put_mylladdr(unsigned char **ptr_p, int ifindex, int alen)
+ {
+-	struct iflink *ifl;
++	struct rarpiflink *ifl;
+ 
+ 	for (ifl=ifl_list; ifl; ifl = ifl->next)
+ 		if (ifl->index == ifindex)
+@@ -362,8 +368,8 @@ int put_mylladdr(unsigned char **ptr_p, int ifindex, int alen)
+ int put_myipaddr(unsigned char **ptr_p, int ifindex, __u32 hisipaddr)
+ {
+ 	__u32 laddr = 0;
+-	struct iflink *ifl;
+-	struct ifaddr *ifa;
++	struct rarpiflink *ifl;
++	struct rarpifaddr *ifa;
+ 
+ 	for (ifl=ifl_list; ifl; ifl = ifl->next)
+ 		if (ifl->index == ifindex)
+@@ -388,7 +394,7 @@ void arp_advise(int ifindex, unsigned char *lladdr, int lllen, __u32 ipaddr)
+ 	int fd;
+ 	struct arpreq req;
+ 	struct sockaddr_in *sin;
+-	struct iflink *ifl;
++	struct rarpiflink *ifl;
+ 
+ 	for (ifl=ifl_list; ifl; ifl = ifl->next)
+ 		if (ifl->index == ifindex)
+@@ -421,6 +427,10 @@ void serve_it(int fd)
+ 	struct rarp_map *rmap;
+ 	unsigned char *ptr;
+ 	int n;
++	int i;
++	char tmpbuf[16*3];
++	char tmpname[IFNAMSIZ];
++	struct rarpiflink *ifl;
+ 
+ 	n = recvfrom(fd, buf, sizeof(buf), MSG_DONTWAIT, (struct sockaddr*)&sll, &sll_len);
+ 	if (n<0) {
+@@ -447,21 +457,23 @@ void serve_it(int fd)
+ 	if (a->ar_op != htons(ARPOP_RREQUEST))
+ 		return;
+ 
+-	if (verbose) {
+-		int i;
+-		char tmpbuf[16*3];
+-		char *ptr = tmpbuf;
+-		for (i=0; i<sll.sll_halen; i++) {
+-			if (i) {
+-				sprintf(ptr, ":%02x", sll.sll_addr[i]);
+-				ptr++;
+-			} else
+-				sprintf(ptr, "%02x", sll.sll_addr[i]);
+-			ptr += 2;
+-		}
+-		syslog(LOG_INFO, "RARP request from %s on if%d", tmpbuf, sll.sll_ifindex);
++	ptr = tmpbuf;
++        snprintf(tmpbuf, 2, "%02x", sll.sll_addr[0]);
++	for (ptr=tmpbuf+2, i=1; i<sll.sll_halen; i++) {
++		snprintf(ptr, 3, ":%02x", sll.sll_addr[i]);
++		ptr += 3;
+ 	}
+ 
++	for (ifl=ifl_list; ifl; ifl = ifl->next)
++		if (ifl->index == sll.sll_ifindex)
++			break;
++	if (ifl) {
++		strncpy(tmpname, ifl->name, IFNAMSIZ);
++		tmpname[IFNAMSIZ-1] = 0;
++	} else
++		sprintf(tmpname, "if%d", sll.sll_ifindex);
++	syslog(LOG_INFO, "RARP request from %s on %s", tmpbuf, tmpname);
++
+ 	/* Sanity checks */
+ 
+ 	/* 1. IP only -> pln==4 */
+@@ -526,6 +538,8 @@ void serve_it(int fd)
+ 	ptr += rmap->lladdr_len;
+ 	memcpy(ptr, &rmap->ipaddr, 4);
+ 	ptr += 4;
++	syslog(LOG_INFO, "RARP response to %s %s on %s", tmpbuf,
++	       inet_ntoa(*(struct in_addr *)&rmap->ipaddr), tmpname);
+ 
+ 	/* Update our ARP cache. Probably, this guy
+ 	   will not able to make ARP (if it is broken)
+@@ -613,7 +627,7 @@ int main(int argc, char **argv)
+         if (ifname) {
+ 		struct ifreq ifr;
+ 		memset(&ifr, 0, sizeof(ifr));
+-		strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
++		strncpy(ifr.ifr_name, ifname, IFNAMSIZ-1);
+ 		if (ioctl(pset[0].fd, SIOCGIFINDEX, &ifr)) {
+ 			perror("ioctl(SIOCGIFINDEX)");
+ 			usage();
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/rarpd/files/0004-rarpd.init-add-new-init-file.patch b/meta-oe/recipes-extended/rarpd/files/0004-rarpd.init-add-new-init-file.patch
new file mode 100644
index 0000000..3ba11ff
--- /dev/null
+++ b/meta-oe/recipes-extended/rarpd/files/0004-rarpd.init-add-new-init-file.patch
@@ -0,0 +1,116 @@
+From 0ef1a95b220c7e110da950e5cc544c50c25b1bc6 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 18 Nov 2014 18:11:56 +0900
+Subject: [PATCH 4/5] rarpd.init : add new init file
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ rarpd.init | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 96 insertions(+)
+ create mode 100644 rarpd.init
+
+diff --git a/rarpd.init b/rarpd.init
+new file mode 100644
+index 0000000..efcf825
+--- /dev/null
++++ b/rarpd.init
+@@ -0,0 +1,96 @@
++#!/bin/bash
++#
++#	/etc/init.d/rarpd
++#
++# Starts the rarpd daemon
++#
++# chkconfig: - 82 16
++# description: Server Reverse Address Resolution Protocol requests.
++# processname: rarpd
++
++### BEGIN INIT INFO
++# Provides: rarpd
++# Required-Start: $syslog $network
++# Required-Stop:  $syslog $network
++# Default-Start:
++# Default-Stop: 0 1 2 3 4 5 6
++# Short-Description: start and stop rarpd
++# Description: RARP (Reverse Address Resolution Protocol) is a protocol \
++#              which allows individual devices on an IP network to get \
++#              their own IP addresses from the RARP server. \
++### END INIT INFO
++
++# Source function library.
++. /etc/init.d/functions
++
++# Read the config file if exists
++if [ -f /etc/sysconfig/rarpd ]; then
++ . /etc/sysconfig/rarpd
++fi
++
++RETVAL=0
++prog="rarpd"
++
++
++start() {
++    #if these files don't exist rarpd can't work
++    test -x /usr/sbin/rarpd -a -f /etc/ethers || exit 6
++	# Check if rarpd is already running
++	#if [ ! -f /var/lock/subsys/rarpd ]; then
++    status rarpd;
++    if [ $? -ne 0 ]; then
++	    echo -n $"Starting $prog: "
++	    daemon /usr/sbin/rarpd $OPTIONS $INTERFACE
++	    RETVAL=$?
++	    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/rarpd
++	    echo
++	fi
++	return $RETVAL
++}
++
++stop() {
++	echo -n $"Stopping $prog: "
++	killproc /usr/sbin/rarpd
++	RETVAL=$?
++	[ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/rarpd
++	echo
++	return $RETVAL
++}
++reload() {
++    RETVAL=3
++}
++
++#
++#	See how we were called.
++#
++case "$1" in
++  start)
++	start
++	;;
++  stop)
++	stop
++	;;
++  reload)
++    reload
++    ;;
++  force-reload|restart)
++    stop
++	start
++	;;
++  condrestart)
++	if [ -f /var/lock/subsys/rarpd ]; then
++	    stop
++	    start
++	fi
++	;;
++  status)
++	status rarpd
++	RETVAL=$?
++	;;
++  *)
++	echo $"Usage: $0 {start|stop|restart|condrestart|reload|status|force-reload}"
++	RETVAL=2
++    
++esac
++
++exit $RETVAL
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/rarpd/files/0005-ethernet.c-remove-it.patch b/meta-oe/recipes-extended/rarpd/files/0005-ethernet.c-remove-it.patch
new file mode 100644
index 0000000..c77c806
--- /dev/null
+++ b/meta-oe/recipes-extended/rarpd/files/0005-ethernet.c-remove-it.patch
@@ -0,0 +1,244 @@
+From abe15ba10ddc3548c528ccb088097d7abf5be48b Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 18 Nov 2014 18:14:07 +0900
+Subject: [PATCH 5/5] ethernet.c : remove it
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ ethernet.c | 224 -------------------------------------------------------------
+ 1 file changed, 224 deletions(-)
+ delete mode 100644 ethernet.c
+
+diff --git a/ethernet.c b/ethernet.c
+deleted file mode 100644
+index d682b63..0000000
+--- a/ethernet.c
++++ /dev/null
+@@ -1,224 +0,0 @@
+-/*
+- * Copyright (c) 1990, 1993 The Regents of the University of California.
+- * All rights reserved.
+- *
+- * Redistribution and use in source and binary forms, with or without
+- * modification, are permitted provided that: (1) source code distributions
+- * retain the above copyright notice and this paragraph in its entirety, (2)
+- * distributions including binary code include the above copyright notice and
+- * this paragraph in its entirety in the documentation or other materials
+- * provided with the distribution, and (3) all advertising materials mentioning
+- * features or use of this software display the following acknowledgement:
+- * ``This product includes software developed by the University of California,
+- * Lawrence Berkeley Laboratory and its contributors.'' Neither the name of
+- * the University nor the names of its contributors may be used to endorse
+- * or promote products derived from this software without specific prior
+- * written permission.
+- * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED
+- * WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
+- * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+- */
+-#ifndef lint
+-static char rcsid[] =
+-    "@(#) $Header: etherent.c,v 1.4 96/06/14 20:34:25 leres Exp $ (LBL)";
+-#endif
+-
+-#include <sys/types.h>
+-#include <sys/stat.h>
+-#include <sys/time.h>
+-
+-#include <ctype.h>
+-#include <stdio.h>
+-#include <string.h>
+-
+-#ifndef ETHERS_FILE
+-#define ETHERS_FILE "/etc/ethers"
+-#endif
+-
+-struct etherent {
+-        u_char addr[6];
+-        char name[122];
+-};
+-
+-static FILE *ether_fp = NULL;
+-
+-
+-/* Hex digit to integer. */
+-static inline int
+-xdtoi(c)
+-	int c;
+-{
+-
+-	if (isdigit(c))
+-		return c - '0';
+-	else if (islower(c))
+-		return c - 'a' + 10;
+-	else
+-		return c - 'A' + 10;
+-}
+-
+-static inline int
+-skip_space(f)
+-	FILE *f;
+-{
+-	int c;
+-
+-	do {
+-		c = getc(f);
+-	} while (isspace(c) && c != '\n');
+-
+-	return c;
+-}
+-
+-static inline int
+-skip_line(f)
+-	FILE *f;
+-{
+-	int c;
+-
+-	do
+-		c = getc(f);
+-	while (c != '\n' && c != EOF);
+-
+-	return c;
+-}
+-
+-static struct etherent *
+-next_etherent(fp)
+-	FILE *fp;
+-{
+-	register int c, d, i;
+-	char *bp;
+-	static struct etherent e;
+-	static int nline = 1;
+- top:
+-	while (nline) {
+-		/* Find addr */
+-		c = skip_space(fp);
+-		if (c == '\n')
+-			continue;
+-		/* If this is a comment, or first thing on line
+-		   cannot be etehrnet address, skip the line. */
+-		else if (!isxdigit(c))
+-			c = skip_line(fp);
+-		else {
+-			/* must be the start of an address */
+-			for (i = 0; i < 6; i += 1) {
+-				d = xdtoi(c);
+-				c = getc(fp);
+-				if (c != ':') {
+-					d <<= 4;
+-					d |= xdtoi(c);
+-					c = getc(fp);
+-				}
+-				e.addr[i] = d;
+-				if (c != ':')
+-					break;
+-				c = getc(fp);
+-			}
+-			nline = 0;
+-		}
+-		if (c == EOF)
+-			return NULL;
+-	}
+-	
+-	/* If we started a new line, 'c' holds the char past the ether addr,
+-	   which we assume is white space.  If we are continuing a line,
+-	   'c' is garbage.  In either case, we can throw it away. */
+-	   
+-	c = skip_space(fp);
+-	if (c == '\n') {
+-		nline = 1;
+-		goto top;
+-	}
+-	else if (c == '#') {
+-		(void)skip_line(fp);
+-		nline = 1;
+-		goto top;
+-	}
+-	else if (c == EOF)
+-		return NULL;
+-	
+-	/* Must be a name. */
+-	bp = e.name;
+-	/* Use 'd' to prevent buffer overflow. */
+-	d = sizeof(e.name) - 1;
+-	do {
+-		*bp++ = c;
+-		c = getc(fp);
+-	} while (!isspace(c) && c != EOF && --d > 0);
+-	*bp = '\0';
+-	if (c == '\n')
+-		nline = 1;
+-
+-	return &e;
+-}
+-
+-/* Open/rewind the ethers files; returns 1 if file was reopened */
+-int
+-ether_rewind()
+-{
+-	struct stat st;
+-	static long mtime = 0, ctime = 0;
+-
+-	if (ether_fp != NULL) {
+-		if (fstat(fileno(ether_fp), &st) < 0 ||
+-		    mtime != st.st_mtime || ctime != st.st_ctime ||
+-		    fseek(ether_fp, 0L, SEEK_SET) < 0) {
+-			fclose(ether_fp);
+-			ether_fp = NULL;
+-		}
+-	}
+-	if (ether_fp == NULL) {
+-		ether_fp = fopen(ETHERS_FILE, "r");
+-		if (ether_fp == NULL)
+-			return (-1);
+-		if (fstat(fileno(ether_fp), &st) < 0) {
+-			fclose(ether_fp);
+-			ether_fp = NULL;
+-			return (-1);
+-		}
+-		mtime = st.st_mtime;
+-		ctime = st.st_ctime;
+-		return (1);
+-	}
+-	return (0);
+-}
+-
+-/* Map an ethernet address to a name; returns 0 on success, else 1. */
+-int
+-ether_ntohost(name, ea)
+-	register char *name;
+-	register u_char *ea;
+-{
+-	register struct etherent *ep;
+-
+-	if (ether_rewind() < 0)
+-		return (1);
+-
+-	while ((ep = next_etherent(ether_fp)) != NULL)
+-		if (bcmp(ep->addr, ea, 6) == 0) {
+-			strcpy(name, ep->name);
+-			return (0);
+-		}
+-	return (1);
+-}
+-
+-/* Map an ethernet name to an address; returns 0 on success, else 1. */
+-int
+-ether_hostton(name, ea)
+-	register char *name;
+-	register u_char *ea;
+-{
+-	register struct etherent *ep;
+-
+-	if (ether_rewind() < 0)
+-		return (1);
+-
+-	while ((ep = next_etherent(ether_fp)) != NULL)
+-		if (strcmp(ep->name, name) == 0) {
+-			bcopy(ep->addr, ea, 6);
+-			return (0);
+-		}
+-	return (1);
+-}
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-extended/rarpd/files/ethers.sample b/meta-oe/recipes-extended/rarpd/files/ethers.sample
new file mode 100644
index 0000000..249ca6b
--- /dev/null
+++ b/meta-oe/recipes-extended/rarpd/files/ethers.sample
@@ -0,0 +1 @@
+# see man ethers for syntax
diff --git a/meta-oe/recipes-extended/rarpd/files/rarpd.service b/meta-oe/recipes-extended/rarpd/files/rarpd.service
new file mode 100644
index 0000000..137710e
--- /dev/null
+++ b/meta-oe/recipes-extended/rarpd/files/rarpd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Reverse Address Resolution Protocol Requests Server
+Requires=network.target
+After=syslog.target network.target
+
+[Service]
+Type=forking
+EnvironmentFile=-/etc/sysconfig/rarpd
+ExecStart=/usr/sbin/rarpd $OPTIONS $INTERFACE
+StandardError=syslog
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
new file mode 100644
index 0000000..b9b4bd7
--- /dev/null
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -0,0 +1,48 @@
+SUMMARY = "The RARP daemon."
+DESCRIPTION = "RARP (Reverse Address Resolution Protocol) is a protocol which \
+allows individual devices on an IP network to get their own IP addresses from \
+the RARP server. Some machines (e.g. SPARC boxes) use this protocol instead \
+of e.g. DHCP to query their IP addresses during network bootup. \
+Linux kernels up to 2.2 used to provide a kernel daemon for this service, \
+but since 2.3 kernels it is served by this userland daemon. \
+You should install rarpd if you want to set up a RARP server on your \
+network."
+SECTION = "System Environment/Daemons"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${PN}-${PV}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "be2a88f8ccddf2a40ac484cb3294fedc"
+SRC_URI[sha256sum] = "4d6145d435a5d8b567b9798620f57f9b0a464078a1deba267958f168fbe776e6"
+
+SRC_URI += "file://0001-rarpd.8-add-man-file.patch \
+            file://0002-Makefile-modify-compile-parameters.patch \
+            file://0003-rarpd.c-bug-fix.patch \
+            file://0004-rarpd.init-add-new-init-file.patch \
+            file://0005-ethernet.c-remove-it.patch \
+            file://ethers.sample \
+            file://rarpd.service \
+           "
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://rarpd.c;md5=199b20b172ea93121bc613a9c77b6931"
+
+S = "${WORKDIR}/${PN}"
+
+do_install() {
+        install -d ${D}${sysconfdir}/init.d
+        install -d ${D}${sbindir}
+        install -d ${D}${mandir}/man8
+        install -m 755 rarpd.init ${D}${sysconfdir}/init.d/rarpd
+        install -m 755 rarpd ${D}${sbindir}/rarpd
+        install -m 644 rarpd.8 ${D}${mandir}/man8/rarpd.8
+        install -m 644 ${WORKDIR}/ethers.sample ${D}${sysconfdir}/ethers
+
+        if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	    install -d ${D}${systemd_unitdir}/system
+	    install -m 0644 ${WORKDIR}/rarpd.service ${D}${systemd_unitdir}/system/
+        fi
+}
+
+inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "rarpd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.8.4.2


