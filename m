Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D965720C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 02:07:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAI272LK027103
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 18:07:03 -0800 (PST)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 17 Nov 2014 18:07:02 -0800
Message-ID: <546AA9C5.7080303@windriver.com>
Date: Tue, 18 Nov 2014 10:07:01 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1416222008-9218-2-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1416222008-9218-2-git-send-email-lixin.fnst@cn.fujitsu.com>
Subject: Re: [PATCH 1/5] rarpd : add recipe
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
X-List-Received-Date: Tue, 18 Nov 2014 02:07:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2014年11月17日 19:00, Li xin wrote:
> RARP (Reverse Address Resolution Protocol) is a protocol which
> allows individual devices on an IP network to get their own IP
> addresses from the RARP server. Some machines (e.g. SPARC boxes)
> use this protocol instead of e.g. DHCP to query their IP addresses
> during network bootup.
>
> Linux kernels up to 2.2 used to provide a kernel daemon for this
> service,but since 2.3 kernels it is served by this userland daemon.
> You should install rarpd if you want to set up a RARP server on your
> network.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>   meta-oe/recipes-extended/nicstat/nicstat_1.95.bb   |  31 ++
>   .../rarpd/files/1000rarpd-ss981107.patch           | 592 +++++++++++++++++++++
>   .../rarpd/files/1001rarpd-norun.patch              |  13 +
>   .../rarpd/files/1002rarpd-initscript.patch         |  77 +++
>   .../rarpd/files/1003rarpd-fd-leak.patch            |  25 +
>   .../rarpd/files/1004rarpd-sprintf.patch            |  31 ++
>   .../rarpd/files/1005rarpd-initLSB.patch            |  85 +++
>   .../rarpd/files/1006rarpd-configurableInit.patch   |  23 +
>   meta-oe/recipes-extended/rarpd/files/ethers.sample |   1 +
>   meta-oe/recipes-extended/rarpd/files/rarpd.service |  14 +
>   meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |  50 ++
>   11 files changed, 942 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/1000rarpd-ss981107.patch
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/1001rarpd-norun.patch
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/1002rarpd-initscript.patch
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/1003rarpd-fd-leak.patch
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/1004rarpd-sprintf.patch
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/1005rarpd-initLSB.patch
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/1006rarpd-configurableInit.patch
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/ethers.sample
>   create mode 100644 meta-oe/recipes-extended/rarpd/files/rarpd.service
>   create mode 100644 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
>
> diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
> new file mode 100644
> index 0000000..31a015a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "nicstat is a Solaris and Linux command-line that prints out network \
> +statistics for all network interface cards (NICs), including packets, kilobytes \
> +per second, average packet sizes and more."
> +HOMEPAGE = "http://nicstat.sourceforge.net"
> +
> +LICENSE = "Artistic-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4a94da2a1f918b217ef5156634fc9e0"
> +
> +SRC_URI = "http://softlayer-sng.dl.sourceforge.net/project/nicstat/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "9a0b87bbc670c1e738e5b40c7afd184d"
> +SRC_URI[sha256sum] = "c4cc33f8838f4523f27c3d7584eedbe59f4c587f0821612f5ac2201adc18b367"
> +
> +
> +do_compile() {
> +	${CC} ${CFLAGS} ${LDFLAGS} -o nicstat nicstat.c
> +}
> +
> +do_install() {
> +        install -d ${D}/${bindir}/
> +        install -d ${D}/${mandir}/
> +     	install -m 0755 ${S}/nicstat ${D}${bindir}/
> +	install -m 0644 ${S}/nicstat.1 ${D}/${mandir}/
> +}
> +
> +
> +
> +
> +
> +
> +

Remove these blank line



> diff --git a/meta-oe/recipes-extended/rarpd/files/1000rarpd-ss981107.patch b/meta-oe/recipes-extended/rarpd/files/1000rarpd-ss981107.patch
> new file mode 100644
> index 0000000..181ff42
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/1000rarpd-ss981107.patch
> @@ -0,0 +1,592 @@


All patches should have the patch header, which include
Upstream-Status, Sign-off-by

-Roy

> +--- rarpd/Makefile.jj	Sat Nov  7 15:29:54 1998
> ++++ rarpd/Makefile	Fri Apr  7 10:40:29 2000
> +@@ -1,7 +1,7 @@
> + CC=gcc
> + CFLAGS=-O2 -Wall -g $(DEFINES)
> +
> +-OBJ=rarpd.o ethernet.o
> ++OBJ=rarpd.o
> +
> + all: rarpd
> +
> +--- rarpd/ethernet.c.jj	Fri Nov  6 16:17:42 1998
> ++++ rarpd/ethernet.c	Thu Jan  1 01:00:00 1970
> +@@ -1,224 +0,0 @@
> +-/*
> +- * Copyright (c) 1990, 1993 The Regents of the University of California.
> +- * All rights reserved.
> +- *
> +- * Redistribution and use in source and binary forms, with or without
> +- * modification, are permitted provided that: (1) source code distributions
> +- * retain the above copyright notice and this paragraph in its entirety, (2)
> +- * distributions including binary code include the above copyright notice and
> +- * this paragraph in its entirety in the documentation or other materials
> +- * provided with the distribution, and (3) all advertising materials mentioning
> +- * features or use of this software display the following acknowledgement:
> +- * ``This product includes software developed by the University of California,
> +- * Lawrence Berkeley Laboratory and its contributors.'' Neither the name of
> +- * the University nor the names of its contributors may be used to endorse
> +- * or promote products derived from this software without specific prior
> +- * written permission.
> +- * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED
> +- * WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
> +- * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> +- */
> +-#ifndef lint
> +-static char rcsid[] =
> +-    "@(#) $Header: etherent.c,v 1.4 96/06/14 20:34:25 leres Exp $ (LBL)";
> +-#endif
> +-
> +-#include <sys/types.h>
> +-#include <sys/stat.h>
> +-#include <sys/time.h>
> +-
> +-#include <ctype.h>
> +-#include <stdio.h>
> +-#include <string.h>
> +-
> +-#ifndef ETHERS_FILE
> +-#define ETHERS_FILE "/etc/ethers"
> +-#endif
> +-
> +-struct etherent {
> +-        u_char addr[6];
> +-        char name[122];
> +-};
> +-
> +-static FILE *ether_fp = NULL;
> +-
> +-
> +-/* Hex digit to integer. */
> +-static inline int
> +-xdtoi(c)
> +-	int c;
> +-{
> +-
> +-	if (isdigit(c))
> +-		return c - '0';
> +-	else if (islower(c))
> +-		return c - 'a' + 10;
> +-	else
> +-		return c - 'A' + 10;
> +-}
> +-
> +-static inline int
> +-skip_space(f)
> +-	FILE *f;
> +-{
> +-	int c;
> +-
> +-	do {
> +-		c = getc(f);
> +-	} while (isspace(c) && c != '\n');
> +-
> +-	return c;
> +-}
> +-
> +-static inline int
> +-skip_line(f)
> +-	FILE *f;
> +-{
> +-	int c;
> +-
> +-	do
> +-		c = getc(f);
> +-	while (c != '\n' && c != EOF);
> +-
> +-	return c;
> +-}
> +-
> +-static struct etherent *
> +-next_etherent(fp)
> +-	FILE *fp;
> +-{
> +-	register int c, d, i;
> +-	char *bp;
> +-	static struct etherent e;
> +-	static int nline = 1;
> +- top:
> +-	while (nline) {
> +-		/* Find addr */
> +-		c = skip_space(fp);
> +-		if (c == '\n')
> +-			continue;
> +-		/* If this is a comment, or first thing on line
> +-		   cannot be etehrnet address, skip the line. */
> +-		else if (!isxdigit(c))
> +-			c = skip_line(fp);
> +-		else {
> +-			/* must be the start of an address */
> +-			for (i = 0; i < 6; i += 1) {
> +-				d = xdtoi(c);
> +-				c = getc(fp);
> +-				if (c != ':') {
> +-					d <<= 4;
> +-					d |= xdtoi(c);
> +-					c = getc(fp);
> +-				}
> +-				e.addr[i] = d;
> +-				if (c != ':')
> +-					break;
> +-				c = getc(fp);
> +-			}
> +-			nline = 0;
> +-		}
> +-		if (c == EOF)
> +-			return NULL;
> +-	}
> +-	
> +-	/* If we started a new line, 'c' holds the char past the ether addr,
> +-	   which we assume is white space.  If we are continuing a line,
> +-	   'c' is garbage.  In either case, we can throw it away. */
> +-	
> +-	c = skip_space(fp);
> +-	if (c == '\n') {
> +-		nline = 1;
> +-		goto top;
> +-	}
> +-	else if (c == '#') {
> +-		(void)skip_line(fp);
> +-		nline = 1;
> +-		goto top;
> +-	}
> +-	else if (c == EOF)
> +-		return NULL;
> +-	
> +-	/* Must be a name. */
> +-	bp = e.name;
> +-	/* Use 'd' to prevent buffer overflow. */
> +-	d = sizeof(e.name) - 1;
> +-	do {
> +-		*bp++ = c;
> +-		c = getc(fp);
> +-	} while (!isspace(c) && c != EOF && --d > 0);
> +-	*bp = '\0';
> +-	if (c == '\n')
> +-		nline = 1;
> +-
> +-	return &e;
> +-}
> +-
> +-/* Open/rewind the ethers files; returns 1 if file was reopened */
> +-int
> +-ether_rewind()
> +-{
> +-	struct stat st;
> +-	static long mtime = 0, ctime = 0;
> +-
> +-	if (ether_fp != NULL) {
> +-		if (fstat(fileno(ether_fp), &st) < 0 ||
> +-		    mtime != st.st_mtime || ctime != st.st_ctime ||
> +-		    fseek(ether_fp, 0L, SEEK_SET) < 0) {
> +-			fclose(ether_fp);
> +-			ether_fp = NULL;
> +-		}
> +-	}
> +-	if (ether_fp == NULL) {
> +-		ether_fp = fopen(ETHERS_FILE, "r");
> +-		if (ether_fp == NULL)
> +-			return (-1);
> +-		if (fstat(fileno(ether_fp), &st) < 0) {
> +-			fclose(ether_fp);
> +-			ether_fp = NULL;
> +-			return (-1);
> +-		}
> +-		mtime = st.st_mtime;
> +-		ctime = st.st_ctime;
> +-		return (1);
> +-	}
> +-	return (0);
> +-}
> +-
> +-/* Map an ethernet address to a name; returns 0 on success, else 1. */
> +-int
> +-ether_ntohost(name, ea)
> +-	register char *name;
> +-	register u_char *ea;
> +-{
> +-	register struct etherent *ep;
> +-
> +-	if (ether_rewind() < 0)
> +-		return (1);
> +-
> +-	while ((ep = next_etherent(ether_fp)) != NULL)
> +-		if (bcmp(ep->addr, ea, 6) == 0) {
> +-			strcpy(name, ep->name);
> +-			return (0);
> +-		}
> +-	return (1);
> +-}
> +-
> +-/* Map an ethernet name to an address; returns 0 on success, else 1. */
> +-int
> +-ether_hostton(name, ea)
> +-	register char *name;
> +-	register u_char *ea;
> +-{
> +-	register struct etherent *ep;
> +-
> +-	if (ether_rewind() < 0)
> +-		return (1);
> +-
> +-	while ((ep = next_etherent(ether_fp)) != NULL)
> +-		if (strcmp(ep->name, name) == 0) {
> +-			bcopy(ep->addr, ea, 6);
> +-			return (0);
> +-		}
> +-	return (1);
> +-}
> +--- rarpd/rarpd.8.jj	Thu Jan  1 01:00:00 1970
> ++++ rarpd/rarpd.8	Fri Apr  7 10:47:16 2000
> +@@ -0,0 +1,69 @@
> ++.TH RARP 8 "7 April 2000" "rarpd" "Linux Programmer's Manual"
> ++.SH NAME
> ++rarpd \- Reverse Address Resolution Protocol (RARP) daemon
> ++.SH SYNOPSIS
> ++.B "rarpd [-aAvde] [-b bootdir ] [ interface ]"
> ++.SH DESCRIPTION
> ++.B Rarpd
> ++is a daemon which responds to RARP requests.
> ++RARP is used by some machines at boot time to discover their IP address.
> ++They provide their Ethernet address and
> ++.B rarpd
> ++responds with their IP address if it finds it in the ethers database
> ++(either
> ++.I /etc/ethers
> ++file or NIS+ lookup) and using DNS lookup if ethers database
> ++contains a hostname and not an IP address.
> ++By default
> ++.B rarpd
> ++also checks if a bootable image with a name starting with the IP address
> ++in hexadecimal uppercase letters is present in the TFTP boot directory
> ++(usually
> ++.I /tftpboot
> ++) before it decides to respond to the RARP request.
> ++.SH OPTIONS
> ++.TP
> ++.B \-a
> ++Do not bind to the interface.
> ++.TP
> ++.B \-A
> ++Respond to ARP as well as RARP requests.
> ++.TP
> ++.B \-v
> ++Tell the user what is going on by being verbose.
> ++.TP
> ++.B \-d
> ++Debugging mode. Do not detach from the tty.
> ++.TP
> ++.B \-e
> ++Skip the check for bootable image in the TFTP boot directory. If not
> ++present, then even if the Ethernet address is present in
> ++the ethers database but the bootable image for the resolved IP does not exist,
> ++.B rarpd
> ++will not respond to the request.
> ++.TP
> ++.B "\-b bootdir"
> ++Use
> ++.I bootdir
> ++instead of the default
> ++.I /tftpboot
> ++as the TFTP boot directory for bootable image checks.
> ++.SH OBSOLETES
> ++This
> ++.B rarpd
> ++obsoletes kernel
> ++.B rarp
> ++daemon present in Linux kernels up to 2.2 which was controlled by the
> ++rarp(8) command.
> ++.SH FILES
> ++.I /etc/ethers,
> ++.br
> ++.I /etc/nsswitch.conf,
> ++.br
> ++.I /tftpboot
> ++.SH SEE ALSO
> ++ethers(5)
> ++.SH AUTHORS
> ++Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
> ++.br
> ++Jakub Jelinek, <jakub@redhat.com>
> +--- rarpd/rarpd.c.jj	Sat Nov  7 15:48:40 1998
> ++++ rarpd/rarpd.c	Fri Apr  7 15:35:44 2000
> +@@ -7,6 +7,7 @@
> +  *		2 of the License, or (at your option) any later version.
> +  *
> +  * Authors:	Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
> ++ *		Jakub Jelinek, <jakub@redhat.com>
> +  */
> +
> + #include <stdio.h>
> +@@ -26,6 +27,8 @@
> + #include <net/if.h>
> + #include <net/if_arp.h>
> + #include <netinet/in.h>
> ++#include <netinet/ether.h>
> ++#include <asm/types.h>
> + #include <linux/if_packet.h>
> + #include <linux/filter.h>
> +
> +@@ -39,27 +42,26 @@
> + int all_ifaces;
> + int listen_arp;
> + char *ifname;
> +-char *tftp_dir = "/etc/tftpboot";
> ++char *tftp_dir = "/tftpboot";
> +
> +-extern int ether_ntohost(char *name, unsigned char *ea);
> + void usage(void) __attribute__((noreturn));
> +
> +-struct iflink
> ++struct rarpiflink
> + {
> +-	struct iflink	*next;
> +-	int	       	index;
> +-	int		hatype;
> +-	unsigned char	lladdr[16];
> +-	unsigned char	name[IFNAMSIZ];
> +-	struct ifaddr 	*ifa_list;
> ++	struct rarpiflink	*next;
> ++	int	       		index;
> ++	int			hatype;
> ++	unsigned char		lladdr[16];
> ++	unsigned char		name[IFNAMSIZ];
> ++	struct rarpifaddr 	*ifa_list;
> + } *ifl_list;
> +
> +-struct ifaddr
> ++struct rarpifaddr
> + {
> +-	struct ifaddr 	*next;
> +-	__u32		prefix;
> +-	__u32		mask;
> +-	__u32		local;
> ++	struct rarpifaddr 	*next;
> ++	__u32			prefix;
> ++	__u32			mask;
> ++	__u32			local;
> + };
> +
> + struct rarp_map
> +@@ -87,8 +89,8 @@
> + {
> + 	int fd;
> + 	struct ifreq *ifrp, *ifend;
> +-	struct iflink *ifl;
> +-	struct ifaddr *ifa;
> ++	struct rarpiflink *ifl;
> ++	struct rarpifaddr *ifa;
> + 	struct ifconf ifc;
> + 	struct ifreq ibuf[256];
> +
> +@@ -144,7 +146,7 @@
> + 				continue;
> + 			}
> +
> +-			ifl = (struct iflink*)malloc(sizeof(*ifl));
> ++			ifl = (struct rarpiflink*)malloc(sizeof(*ifl));
> + 			if (ifl == NULL)
> + 				continue;
> + 			memset(ifl, 0, sizeof(*ifl));
> +@@ -154,6 +156,7 @@
> + 			ifl->hatype = ifrp->ifr_hwaddr.sa_family;
> + 			memcpy(ifl->lladdr, ifrp->ifr_hwaddr.sa_data, 14);
> + 			strncpy(ifl->name, ifrp->ifr_name, IFNAMSIZ);
> ++			ifl->name[IFNAMSIZ-1] = 0;
> + 			p = strchr(ifl->name, ':');
> + 			if (p)
> + 				*p = 0;
> +@@ -179,7 +182,7 @@
> + 		if (ifa == NULL) {
> + 			if (mask == 0 || prefix == 0)
> + 				continue;
> +-			ifa = (struct ifaddr*)malloc(sizeof(*ifa));
> ++			ifa = (struct rarpifaddr*)malloc(sizeof(*ifa));
> + 			memset(ifa, 0, sizeof(*ifa));
> + 			ifa->local = addr;
> + 			ifa->prefix = prefix;
> +@@ -235,10 +238,10 @@
> + 	return dent != NULL;
> + }
> +
> +-struct ifaddr *select_ipaddr(int ifindex, __u32 *sel_addr, __u32 **alist)
> ++struct rarpifaddr *select_ipaddr(int ifindex, __u32 *sel_addr, __u32 **alist)
> + {
> +-	struct iflink *ifl;
> +-	struct ifaddr *ifa;
> ++	struct rarpiflink *ifl;
> ++	struct rarpifaddr *ifa;
> + 	int retry = 0;
> + 	int i;
> +
> +@@ -294,7 +297,7 @@
> +
> + 	if (r == NULL) {
> + 		if (hatype == ARPHRD_ETHER && halen == 6) {
> +-			struct ifaddr *ifa;
> ++			struct rarpifaddr *ifa;
> + 			struct hostent *hp;
> + 			char ename[256];
> + 			static struct rarp_map emap = {
> +@@ -304,7 +307,7 @@
> + 				6,
> + 			};
> +
> +-			if (ether_ntohost(ename, lladdr) != 0 ||
> ++			if (ether_ntohost(ename, (struct ether_addr *)lladdr) != 0 ||
> + 			    (hp = gethostbyname(ename)) == NULL) {
> + 				if (verbose)
> + 					syslog(LOG_INFO, "not found in /etc/ethers");
> +@@ -345,7 +348,7 @@
> +
> + int put_mylladdr(unsigned char **ptr_p, int ifindex, int alen)
> + {
> +-	struct iflink *ifl;
> ++	struct rarpiflink *ifl;
> +
> + 	for (ifl=ifl_list; ifl; ifl = ifl->next)
> + 		if (ifl->index == ifindex)
> +@@ -362,8 +365,8 @@
> + int put_myipaddr(unsigned char **ptr_p, int ifindex, __u32 hisipaddr)
> + {
> + 	__u32 laddr = 0;
> +-	struct iflink *ifl;
> +-	struct ifaddr *ifa;
> ++	struct rarpiflink *ifl;
> ++	struct rarpifaddr *ifa;
> +
> + 	for (ifl=ifl_list; ifl; ifl = ifl->next)
> + 		if (ifl->index == ifindex)
> +@@ -388,7 +391,7 @@
> + 	int fd;
> + 	struct arpreq req;
> + 	struct sockaddr_in *sin;
> +-	struct iflink *ifl;
> ++	struct rarpiflink *ifl;
> +
> + 	for (ifl=ifl_list; ifl; ifl = ifl->next)
> + 		if (ifl->index == ifindex)
> +@@ -421,6 +424,10 @@
> + 	struct rarp_map *rmap;
> + 	unsigned char *ptr;
> + 	int n;
> ++	int i;
> ++	char tmpbuf[16*3];
> ++	char tmpname[IFNAMSIZ];
> ++	struct rarpiflink *ifl;
> +
> + 	n = recvfrom(fd, buf, sizeof(buf), MSG_DONTWAIT, (struct sockaddr*)&sll, &sll_len);
> + 	if (n<0) {
> +@@ -447,20 +454,25 @@
> + 	if (a->ar_op != htons(ARPOP_RREQUEST))
> + 		return;
> +
> +-	if (verbose) {
> +-		int i;
> +-		char tmpbuf[16*3];
> +-		char *ptr = tmpbuf;
> +-		for (i=0; i<sll.sll_halen; i++) {
> +-			if (i) {
> +-				sprintf(ptr, ":%02x", sll.sll_addr[i]);
> +-				ptr++;
> +-			} else
> +-				sprintf(ptr, "%02x", sll.sll_addr[i]);
> +-			ptr += 2;
> +-		}
> +-		syslog(LOG_INFO, "RARP request from %s on if%d", tmpbuf, sll.sll_ifindex);
> ++	ptr = tmpbuf;
> ++	for (i=0; i<sll.sll_halen; i++) {
> ++		if (i) {
> ++			sprintf(ptr, ":%02x", sll.sll_addr[i]);
> ++			ptr++;
> ++		} else
> ++			sprintf(ptr, "%02x", sll.sll_addr[i]);
> ++		ptr += 2;
> + 	}
> ++	
> ++	for (ifl=ifl_list; ifl; ifl = ifl->next)
> ++		if (ifl->index == sll.sll_ifindex)
> ++			break;
> ++	if (ifl) {
> ++		strncpy(tmpname, ifl->name, IFNAMSIZ);
> ++		tmpname[IFNAMSIZ-1] = 0;
> ++	} else
> ++		sprintf(tmpname, "if%d", sll.sll_ifindex);
> ++	syslog(LOG_INFO, "RARP request from %s on %s", tmpbuf, tmpname);
> +
> + 	/* Sanity checks */
> +
> +@@ -526,6 +538,8 @@
> + 	ptr += rmap->lladdr_len;
> + 	memcpy(ptr, &rmap->ipaddr, 4);
> + 	ptr += 4;
> ++	syslog(LOG_INFO, "RARP response to %s %s on %s", tmpbuf,
> ++	       inet_ntoa(*(struct in_addr *)&rmap->ipaddr), tmpname);
> +
> + 	/* Update our ARP cache. Probably, this guy
> + 	   will not able to make ARP (if it is broken)
> +@@ -613,7 +627,7 @@
> +         if (ifname) {
> + 		struct ifreq ifr;
> + 		memset(&ifr, 0, sizeof(ifr));
> +-		strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
> ++		strncpy(ifr.ifr_name, ifname, IFNAMSIZ-1);
> + 		if (ioctl(pset[0].fd, SIOCGIFINDEX, &ifr)) {
> + 			perror("ioctl(SIOCGIFINDEX)");
> + 			usage();
> +--- rarpd/rarpd.init.jj	Thu Jan  1 01:00:00 1970
> ++++ rarpd/rarpd.init	Fri Apr  7 15:42:38 2000
> +@@ -0,0 +1,53 @@
> ++#!/bin/bash
> ++#
> ++#	/etc/init.d/rarpd
> ++#
> ++# Starts the rarpd daemon
> ++#
> ++# chkconfig: 345 82 16
> ++# description: Servers Reverse Address Resolution Protocol requests.
> ++# processname: rarpd
> ++
> ++# Source function library.
> ++. /etc/init.d/functions
> ++
> ++test -x /usr/sbin/rarpd -a -f /etc/ethers || exit 0
> ++
> ++RETVAL=0
> ++
> ++#
> ++#	See how we were called.
> ++#
> ++case "$1" in
> ++  start)
> ++	# Check if rarpd is already running
> ++	if [ ! -f /var/lock/subsys/rarpd ]; then
> ++	    echo -n 'Starting at daemon: '
> ++	    daemon /usr/sbin/rarpd
> ++	    RETVAL=$?
> ++	    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/rarpd
> ++	    echo
> ++	fi
> ++	;;
> ++  stop)
> ++	echo -n 'Stopping at daemon: '
> ++	killproc /usr/sbin/rarpd
> ++	RETVAL=$?
> ++	[ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/rarpd
> ++	echo
> ++	;;
> ++  reload|restart)
> ++	$0 stop
> ++	$0 start
> ++	RETVAL=$?
> ++	;;
> ++  status)
> ++	status /usr/sbin/rarpd
> ++	RETVAL=$?
> ++	;;
> ++  *)
> ++	echo "Usage: /etc/init.d/rarpd {start|stop|restart|reload|status}"
> ++	exit 1
> ++esac
> ++
> ++exit $RETVAL
> diff --git a/meta-oe/recipes-extended/rarpd/files/1001rarpd-norun.patch b/meta-oe/recipes-extended/rarpd/files/1001rarpd-norun.patch
> new file mode 100644
> index 0000000..55e6dfd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/1001rarpd-norun.patch
> @@ -0,0 +1,13 @@
> +--- rarpd/rarpd.init.foo	Fri Jun 16 16:29:01 2000
> ++++ rarpd/rarpd.init	Fri Jun 16 16:29:13 2000
> +@@ -4,8 +4,8 @@
> + #
> + # Starts the rarpd daemon
> + #
> +-# chkconfig: 345 82 16
> +-# description: Servers Reverse Address Resolution Protocol requests.
> ++# chkconfig: - 82 16
> ++# description: Server Reverse Address Resolution Protocol requests.
> + # processname: rarpd
> +
> + # Source function library.
> diff --git a/meta-oe/recipes-extended/rarpd/files/1002rarpd-initscript.patch b/meta-oe/recipes-extended/rarpd/files/1002rarpd-initscript.patch
> new file mode 100644
> index 0000000..b08eaac
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/1002rarpd-initscript.patch
> @@ -0,0 +1,77 @@
> +--- rarpd/rarpd.init.initscript	Thu Mar 15 16:44:18 2001
> ++++ rarpd/rarpd.init	Thu Mar 15 16:46:16 2001
> +@@ -9,44 +9,60 @@
> + # processname: rarpd
> +
> + # Source function library.
> +-. /etc/init.d/functions
> ++. /etc/init.d/functions
> +
> + test -x /usr/sbin/rarpd -a -f /etc/ethers || exit 0
> +
> + RETVAL=0
> ++prog="rarpd"
> +
> +-#
> +-#	See how we were called.
> +-#
> +-case "$1" in
> +-  start)
> ++start() {
> + 	# Check if rarpd is already running
> + 	if [ ! -f /var/lock/subsys/rarpd ]; then
> +-	    echo -n 'Starting at daemon: '
> ++	    echo -n $"Starting $prog: "
> + 	    daemon /usr/sbin/rarpd
> + 	    RETVAL=$?
> + 	    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/rarpd
> + 	    echo
> + 	fi
> +-	;;
> +-  stop)
> +-	echo -n 'Stopping at daemon: '
> ++	return $RETVAL
> ++}
> ++
> ++stop() {
> ++	echo -n $"Stopping $prog: "
> + 	killproc /usr/sbin/rarpd
> + 	RETVAL=$?
> + 	[ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/rarpd
> + 	echo
> ++	return $RETVAL
> ++}
> ++
> ++#
> ++#	See how we were called.
> ++#
> ++case "$1" in
> ++  start)
> ++	start
> ++	;;
> ++  stop)
> ++	stop
> + 	;;
> +   reload|restart)
> +-	$0 stop
> +-	$0 start
> +-	RETVAL=$?
> ++        stop
> ++	start
> ++	;;
> ++  condrestart)
> ++	if [ -f /var/lock/subsys/rarpd ]; then
> ++	    stop
> ++	    start
> ++	fi
> + 	;;
> +   status)
> + 	status /usr/sbin/rarpd
> + 	RETVAL=$?
> + 	;;
> +   *)
> +-	echo "Usage: /etc/init.d/rarpd {start|stop|restart|reload|status}"
> ++	echo $"Usage: $0 {start|stop|restart|condrestart|reload|status}"
> + 	exit 1
> + esac
> +
> diff --git a/meta-oe/recipes-extended/rarpd/files/1003rarpd-fd-leak.patch b/meta-oe/recipes-extended/rarpd/files/1003rarpd-fd-leak.patch
> new file mode 100644
> index 0000000..7ca7ee5
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/1003rarpd-fd-leak.patch
> @@ -0,0 +1,25 @@
> +--- rarpd/rarpd.c.leak	2005-04-25 08:13:26.000000000 -0400
> ++++ rarpd/rarpd.c	2005-04-27 13:28:22.000000000 -0400
> +@@ -210,6 +210,7 @@
> + 			}
> + 		}
> + 	}
> ++	close(fd);
> + }
> +
> + void configure()
> +@@ -228,12 +229,13 @@
> + 	d = opendir(tftp_dir);
> + 	if (d == NULL) {
> + 		syslog(LOG_ERR, "opendir: %m");
> +-		return 0;
> ++		goto done_bootable;
> + 	}
> + 	while ((dent = readdir(d)) != NULL) {
> + 		if (strncmp(dent->d_name, name, 8) == 0)
> + 			break;
> + 	}
> ++done_bootable:
> + 	closedir(d);
> + 	return dent != NULL;
> + }
> diff --git a/meta-oe/recipes-extended/rarpd/files/1004rarpd-sprintf.patch b/meta-oe/recipes-extended/rarpd/files/1004rarpd-sprintf.patch
> new file mode 100644
> index 0000000..382e16f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/1004rarpd-sprintf.patch
> @@ -0,0 +1,31 @@
> +--- rarpd/rarpd.c.sprintf	2005-07-26 18:14:47.000000000 +0200
> ++++ rarpd/rarpd.c	2005-07-26 18:18:42.000000000 +0200
> +@@ -11,6 +11,7 @@
> +  */
> +
> + #include <stdio.h>
> ++#include <stdlib.h>
> + #include <syslog.h>
> + #include <dirent.h>
> + #include <malloc.h>
> +@@ -457,15 +458,12 @@
> + 		return;
> +
> + 	ptr = tmpbuf;
> +-	for (i=0; i<sll.sll_halen; i++) {
> +-		if (i) {
> +-			sprintf(ptr, ":%02x", sll.sll_addr[i]);
> +-			ptr++;
> +-		} else
> +-			sprintf(ptr, "%02x", sll.sll_addr[i]);
> +-		ptr += 2;
> ++        snprintf(tmpbuf, 2, "%02x", sll.sll_addr[0]);
> ++	for (ptr=tmpbuf+2, i=1; i<sll.sll_halen; i++) {
> ++		snprintf(ptr, 3, ":%02x", sll.sll_addr[i]);
> ++		ptr += 3;
> + 	}
> +-	
> ++
> + 	for (ifl=ifl_list; ifl; ifl = ifl->next)
> + 		if (ifl->index == sll.sll_ifindex)
> + 			break;
> diff --git a/meta-oe/recipes-extended/rarpd/files/1005rarpd-initLSB.patch b/meta-oe/recipes-extended/rarpd/files/1005rarpd-initLSB.patch
> new file mode 100644
> index 0000000..396a4a7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/1005rarpd-initLSB.patch
> @@ -0,0 +1,85 @@
> +Only in rarpd_patchedinit/: debugfiles.list
> +Only in rarpd_patchedinit/: debugsources.list
> +Only in rarpd_patchedinit/: rarpd
> +diff -urp rarpd/rarpd.init rarpd_patchedinit/rarpd.init
> +--- rarpd/rarpd.init	2007-07-23 14:26:36.000000000 +0200
> ++++ rarpd_patchedinit/rarpd.init	2007-07-23 14:22:09.000000000 +0200
> +@@ -8,17 +8,32 @@
> + # description: Server Reverse Address Resolution Protocol requests.
> + # processname: rarpd
> +
> ++### BEGIN INIT INFO
> ++# Provides: rarpd
> ++# Required-Start: $syslog $network
> ++# Required-Stop:  $syslog $network
> ++# Default-Start:
> ++# Default-Stop: 0 1 2 3 4 5 6
> ++# Short-Description: start and stop rarpd
> ++# Description: RARP (Reverse Address Resolution Protocol) is a protocol \
> ++#              which allows individual devices on an IP network to get \
> ++#              their own IP addresses from the RARP server. \
> ++### END INIT INFO
> ++
> + # Source function library.
> + . /etc/init.d/functions
> +
> +-test -x /usr/sbin/rarpd -a -f /etc/ethers || exit 0
> +-
> + RETVAL=0
> + prog="rarpd"
> +
> ++
> + start() {
> ++    #if these files don't exist rarpd can't work
> ++    test -x /usr/sbin/rarpd -a -f /etc/ethers || exit 6
> + 	# Check if rarpd is already running
> +-	if [ ! -f /var/lock/subsys/rarpd ]; then
> ++	#if [ ! -f /var/lock/subsys/rarpd ]; then
> ++    status rarpd;
> ++    if [ $? -ne 0 ]; then
> + 	    echo -n $"Starting $prog: "
> + 	    daemon /usr/sbin/rarpd
> + 	    RETVAL=$?
> +@@ -36,6 +51,9 @@ stop() {
> + 	echo
> + 	return $RETVAL
> + }
> ++reload() {
> ++    RETVAL=3
> ++}
> +
> + #
> + #	See how we were called.
> +@@ -47,8 +65,11 @@ case "$1" in
> +   stop)
> + 	stop
> + 	;;
> +-  reload|restart)
> +-        stop
> ++  reload)
> ++    reload
> ++    ;;
> ++  force-reload|restart)
> ++    stop
> + 	start
> + 	;;
> +   condrestart)
> +@@ -58,12 +79,13 @@ case "$1" in
> + 	fi
> + 	;;
> +   status)
> +-	status /usr/sbin/rarpd
> ++	status rarpd
> + 	RETVAL=$?
> + 	;;
> +   *)
> +-	echo $"Usage: $0 {start|stop|restart|condrestart|reload|status}"
> +-	exit 1
> ++	echo $"Usage: $0 {start|stop|restart|condrestart|reload|status|force-reload}"
> ++	RETVAL=2
> ++
> + esac
> +
> + exit $RETVAL
> +Only in rarpd_patchedinit/: rarpd.init~
> +Only in rarpd_patchedinit/: rarpd.o
> diff --git a/meta-oe/recipes-extended/rarpd/files/1006rarpd-configurableInit.patch b/meta-oe/recipes-extended/rarpd/files/1006rarpd-configurableInit.patch
> new file mode 100644
> index 0000000..9950dd1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/1006rarpd-configurableInit.patch
> @@ -0,0 +1,23 @@
> +--- rarpd/rarpd.init	2007-07-30 11:53:35.000000000 +0200
> ++++ rarpd_configurable/rarpd.init	2007-07-30 11:45:20.000000000 +0200
> +@@ -23,6 +23,11 @@
> + # Source function library.
> + . /etc/init.d/functions
> +
> ++# Read the config file if exists
> ++if [ -f /etc/sysconfig/rarpd ]; then
> ++ . /etc/sysconfig/rarpd
> ++fi
> ++
> + RETVAL=0
> + prog="rarpd"
> +
> +@@ -35,7 +40,7 @@ start() {
> +     status rarpd;
> +     if [ $? -ne 0 ]; then
> + 	    echo -n $"Starting $prog: "
> +-	    daemon /usr/sbin/rarpd
> ++	    daemon /usr/sbin/rarpd $OPTIONS $INTERFACE
> + 	    RETVAL=$?
> + 	    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/rarpd
> + 	    echo
> diff --git a/meta-oe/recipes-extended/rarpd/files/ethers.sample b/meta-oe/recipes-extended/rarpd/files/ethers.sample
> new file mode 100644
> index 0000000..249ca6b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/ethers.sample
> @@ -0,0 +1 @@
> +# see man ethers for syntax
> diff --git a/meta-oe/recipes-extended/rarpd/files/rarpd.service b/meta-oe/recipes-extended/rarpd/files/rarpd.service
> new file mode 100644
> index 0000000..137710e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/rarpd.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Reverse Address Resolution Protocol Requests Server
> +Requires=network.target
> +After=syslog.target network.target
> +
> +[Service]
> +Type=forking
> +EnvironmentFile=-/etc/sysconfig/rarpd
> +ExecStart=/usr/sbin/rarpd $OPTIONS $INTERFACE
> +StandardError=syslog
> +
> +[Install]
> +WantedBy=multi-user.target
> +
> diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> new file mode 100644
> index 0000000..df705e0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> @@ -0,0 +1,50 @@
> +SUMMARY = "The RARP daemon."
> +DESCRIPTION = "RARP (Reverse Address Resolution Protocol) is a protocol which \
> +allows individual devices on an IP network to get their own IP addresses from \
> +the RARP server. Some machines (e.g. SPARC boxes) use this protocol instead \
> +of e.g. DHCP to query their IP addresses during network bootup. \
> +Linux kernels up to 2.2 used to provide a kernel daemon for this service, \
> +but since 2.3 kernels it is served by this userland daemon. \
> +You should install rarpd if you want to set up a RARP server on your \
> +network."
> +SECTION = "System Environment/Daemons"
> +
> +SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${PN}-${PV}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${PN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "be2a88f8ccddf2a40ac484cb3294fedc"
> +SRC_URI[sha256sum] = "4d6145d435a5d8b567b9798620f57f9b0a464078a1deba267958f168fbe776e6"
> +
> +SRC_URI += "file://1000rarpd-ss981107.patch \
> +            file://1001rarpd-norun.patch \
> +            file://1002rarpd-initscript.patch \
> +            file://1003rarpd-fd-leak.patch \
> +            file://1004rarpd-sprintf.patch \
> +            file://1005rarpd-initLSB.patch \
> +            file://1006rarpd-configurableInit.patch \
> +            file://ethers.sample \
> +            file://rarpd.service \
> +           "
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://rarpd.c;md5=199b20b172ea93121bc613a9c77b6931"
> +
> +S = "${WORKDIR}/${PN}"
> +
> +do_install() {
> +        install -d ${D}${sysconfdir}/init.d
> +        install -d ${D}${sbindir}
> +        install -d ${D}${mandir}/man8
> +        install -m 755 rarpd.init ${D}${sysconfdir}/init.d/rarpd
> +        install -m 755 rarpd ${D}${sbindir}/rarpd
> +        install -m 644 rarpd.8 ${D}${mandir}/man8/rarpd.8
> +        install -m 644 ${WORKDIR}/ethers.sample ${D}${sysconfdir}/ethers
> +
> +        if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +	    install -d ${D}${systemd_unitdir}/system
> +	    install -m 0644 ${WORKDIR}/rarpd.service ${D}${systemd_unitdir}/system/
> +        fi
> +}
> +
> +inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE_${PN} = "rarpd.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
>

-- 
Best Reagrds,
Roy | RongQing Li

