Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3586A720C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:40:02 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so9675961wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nj3iqt4uWbGPuPOgRXKQZGW3Gt3n+occrmjmiz8eeAA=;
	b=yuDh3bouoBDWrDiraMy1EZCbRk/wrRv9s8qJRcFuJ3Lvoz4if1oHuFQ/Wc/ZC/Q8rN
	R9gsxrIpusVhJKkosAp7DU5gKFucksUaBsBF4mjOdzPJTfqt2HjlNuYGe2UtpsxjNbl/
	vCF0ubCEsI+SKj4bz8H3uCp7a4Gzr/p0qLOf236FlPTdtVLGkgjfqINYjF9UrGWTH1U8
	xEj1pBJDI1wd/DRr0Kh2CFJ1lpycExkv7VGL29mDfRQkNdWeBs2fhLgGiuMkVAfGDzD2
	hmspPodLgc0VfyekaBLm5oA1+SaPLqu12k2dzUr6jsQJ6YiW1gNJGRoqQae7hXM/2qdg
	4u8Q==
X-Received: by 10.194.248.195 with SMTP id yo3mr57552463wjc.60.1416408002062; 
	Wed, 19 Nov 2014 06:40:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j2sm2544705wjs.28.2014.11.19.06.40.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:40:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:40:02 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119144002.GI3315@jama>
References: <546AA9C5.7080303@windriver.com>
	<1416304558-12255-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416304558-12255-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] rarpd : add new recipe
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
X-List-Received-Date: Wed, 19 Nov 2014 14:40:05 -0000
X-Groupsio-MsgNum: 52934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uJWb33pM2TcUAXIl"
Content-Disposition: inline

--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2014 at 05:55:58PM +0800, Li xin wrote:
> RARP (Reverse Address Resolution Protocol) is a protocol which allows
> individual devices on an IP network to get their own IP addresses from
> the RARP server. Some machines (e.g. SPARC boxes) use this protocol
> instead of e.g. DHCP to query their IP addresses during network bootup.
>=20
> Linux kernels up to 2.2 used to provide a kernel daemon for this
> service,but since 2.3 kernels it is served by this userland daemon.
> You should install rarpd if you want to set up a RARP server on your
> network.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../rarpd/files/0001-rarpd.8-add-man-file.patch    |  89 +++++++
>  .../0002-Makefile-modify-compile-parameters.patch  |  26 ++
>  .../rarpd/files/0003-rarpd.c-bug-fix.patch         | 263 +++++++++++++++=
++++++
>  .../files/0004-rarpd.init-add-new-init-file.patch  | 116 +++++++++
>  .../rarpd/files/0005-ethernet.c-remove-it.patch    | 244 +++++++++++++++=
++++
>  meta-oe/recipes-extended/rarpd/files/ethers.sample |   1 +
>  meta-oe/recipes-extended/rarpd/files/rarpd.service |  14 ++
>  meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |  48 ++++
>  8 files changed, 801 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/rarpd/files/0001-rarpd.8-add=
-man-file.patch
>  create mode 100644 meta-oe/recipes-extended/rarpd/files/0002-Makefile-mo=
dify-compile-parameters.patch
>  create mode 100644 meta-oe/recipes-extended/rarpd/files/0003-rarpd.c-bug=
-fix.patch
>  create mode 100644 meta-oe/recipes-extended/rarpd/files/0004-rarpd.init-=
add-new-init-file.patch
>  create mode 100644 meta-oe/recipes-extended/rarpd/files/0005-ethernet.c-=
remove-it.patch
>  create mode 100644 meta-oe/recipes-extended/rarpd/files/ethers.sample
>  create mode 100644 meta-oe/recipes-extended/rarpd/files/rarpd.service
>  create mode 100644 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb

Use files -> rarpd for slightly faster lookup.

>=20
> diff --git a/meta-oe/recipes-extended/rarpd/files/0001-rarpd.8-add-man-fi=
le.patch b/meta-oe/recipes-extended/rarpd/files/0001-rarpd.8-add-man-file.p=
atch
> new file mode 100644
> index 0000000..77c75b4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/0001-rarpd.8-add-man-file.patch
> @@ -0,0 +1,89 @@
> +From d91161eb163c16408202a91b4325a3381ab33752 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 18 Nov 2014 17:55:31 +0900
> +Subject: [PATCH 1/5] rarpd.8 : add man file
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + rarpd.8 | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
> + 1 file changed, 69 insertions(+)
> + create mode 100644 rarpd.8
> +
> +diff --git a/rarpd.8 b/rarpd.8
> +new file mode 100644
> +index 0000000..ce7bd70
> +--- /dev/null
> ++++ b/rarpd.8
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
> ++the ethers database but the bootable image for the resolved IP does not=
 exist,
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
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/rarpd/files/0002-Makefile-modify-co=
mpile-parameters.patch b/meta-oe/recipes-extended/rarpd/files/0002-Makefile=
-modify-compile-parameters.patch
> new file mode 100644
> index 0000000..0b3ebc4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/0002-Makefile-modify-compile-p=
arameters.patch
> @@ -0,0 +1,26 @@
> +From d23b13bd959204824070433d954c5dfbfc421bb7 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 18 Nov 2014 18:05:27 +0900
> +Subject: [PATCH 2/5] Makefile : modify compile parameters
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 19966b4..86a8169 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,7 +1,7 @@
> + CC=3Dgcc
> + CFLAGS=3D-O2 -Wall -g $(DEFINES)
> +=20
> +-OBJ=3Drarpd.o ethernet.o
> ++OBJ=3Drarpd.o
> +=20
> + all: rarpd
> +=20
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/rarpd/files/0003-rarpd.c-bug-fix.pa=
tch b/meta-oe/recipes-extended/rarpd/files/0003-rarpd.c-bug-fix.patch
> new file mode 100644
> index 0000000..7ce1279
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/0003-rarpd.c-bug-fix.patch
> @@ -0,0 +1,263 @@
> +From b49c8e6e66801406520d1bff791c66dff7b1cddb Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 18 Nov 2014 18:10:20 +0900
> +Subject: [PATCH 3/5] rarpd.c : bug fix
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + rarpd.c | 98 +++++++++++++++++++++++++++++++++++++---------------------=
-------
> + 1 file changed, 56 insertions(+), 42 deletions(-)
> +
> +diff --git a/rarpd.c b/rarpd.c
> +index 335d2d2..d45300e 100644
> +--- a/rarpd.c
> ++++ b/rarpd.c
> +@@ -7,9 +7,11 @@
> +  *		2 of the License, or (at your option) any later version.
> +  *
> +  * Authors:	Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
> ++ *		Jakub Jelinek, <jakub@redhat.com>
> +  */
> +=20
> + #include <stdio.h>
> ++#include <stdlib.h>
> + #include <syslog.h>
> + #include <dirent.h>
> + #include <malloc.h>
> +@@ -26,6 +28,8 @@
> + #include <net/if.h>
> + #include <net/if_arp.h>
> + #include <netinet/in.h>
> ++#include <netinet/ether.h>
> ++#include <asm/types.h>
> + #include <linux/if_packet.h>
> + #include <linux/filter.h>
> +=20
> +@@ -39,27 +43,26 @@ int only_ethers;
> + int all_ifaces;
> + int listen_arp;
> + char *ifname;
> +-char *tftp_dir =3D "/etc/tftpboot";
> ++char *tftp_dir =3D "/tftpboot";
> +=20
> +-extern int ether_ntohost(char *name, unsigned char *ea);
> + void usage(void) __attribute__((noreturn));
> +=20
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
> +=20
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
> +=20
> + struct rarp_map
> +@@ -87,8 +90,8 @@ void load_if()
> + {
> + 	int fd;
> + 	struct ifreq *ifrp, *ifend;
> +-	struct iflink *ifl;
> +-	struct ifaddr *ifa;
> ++	struct rarpiflink *ifl;
> ++	struct rarpifaddr *ifa;
> + 	struct ifconf ifc;
> + 	struct ifreq ibuf[256];
> +=20
> +@@ -144,7 +147,7 @@ void load_if()
> + 				continue;
> + 			}
> +=20
> +-			ifl =3D (struct iflink*)malloc(sizeof(*ifl));
> ++			ifl =3D (struct rarpiflink*)malloc(sizeof(*ifl));
> + 			if (ifl =3D=3D NULL)
> + 				continue;
> + 			memset(ifl, 0, sizeof(*ifl));
> +@@ -154,6 +157,7 @@ void load_if()
> + 			ifl->hatype =3D ifrp->ifr_hwaddr.sa_family;
> + 			memcpy(ifl->lladdr, ifrp->ifr_hwaddr.sa_data, 14);
> + 			strncpy(ifl->name, ifrp->ifr_name, IFNAMSIZ);
> ++			ifl->name[IFNAMSIZ-1] =3D 0;
> + 			p =3D strchr(ifl->name, ':');
> + 			if (p)
> + 				*p =3D 0;
> +@@ -179,7 +183,7 @@ void load_if()
> + 		if (ifa =3D=3D NULL) {
> + 			if (mask =3D=3D 0 || prefix =3D=3D 0)
> + 				continue;
> +-			ifa =3D (struct ifaddr*)malloc(sizeof(*ifa));
> ++			ifa =3D (struct rarpifaddr*)malloc(sizeof(*ifa));
> + 			memset(ifa, 0, sizeof(*ifa));
> + 			ifa->local =3D addr;
> + 			ifa->prefix =3D prefix;
> +@@ -207,6 +211,7 @@ void load_if()
> + 			}
> + 		}
> + 	}
> ++	close(fd);
> + }
> +=20
> + void configure()
> +@@ -225,20 +230,21 @@ int bootable(__u32 addr)
> + 	d =3D opendir(tftp_dir);
> + 	if (d =3D=3D NULL) {
> + 		syslog(LOG_ERR, "opendir: %m");
> +-		return 0;
> ++		goto done_bootable;
> + 	}
> + 	while ((dent =3D readdir(d)) !=3D NULL) {
> + 		if (strncmp(dent->d_name, name, 8) =3D=3D 0)
> + 			break;
> + 	}
> ++done_bootable:
> + 	closedir(d);
> + 	return dent !=3D NULL;
> + }
> +=20
> +-struct ifaddr *select_ipaddr(int ifindex, __u32 *sel_addr, __u32 **alis=
t)
> ++struct rarpifaddr *select_ipaddr(int ifindex, __u32 *sel_addr, __u32 **=
alist)
> + {
> +-	struct iflink *ifl;
> +-	struct ifaddr *ifa;
> ++	struct rarpiflink *ifl;
> ++	struct rarpifaddr *ifa;
> + 	int retry =3D 0;
> + 	int i;
> +=20
> +@@ -294,7 +300,7 @@ struct rarp_map *rarp_lookup(int ifindex, int hatype,
> +=20
> + 	if (r =3D=3D NULL) {
> + 		if (hatype =3D=3D ARPHRD_ETHER && halen =3D=3D 6) {
> +-			struct ifaddr *ifa;
> ++			struct rarpifaddr *ifa;
> + 			struct hostent *hp;
> + 			char ename[256];
> + 			static struct rarp_map emap =3D {
> +@@ -304,7 +310,7 @@ struct rarp_map *rarp_lookup(int ifindex, int hatype,
> + 				6,
> + 			};
> +=20
> +-			if (ether_ntohost(ename, lladdr) !=3D 0 ||
> ++			if (ether_ntohost(ename, (struct ether_addr *)lladdr) !=3D 0 ||
> + 			    (hp =3D gethostbyname(ename)) =3D=3D NULL) {
> + 				if (verbose)
> + 					syslog(LOG_INFO, "not found in /etc/ethers");
> +@@ -345,7 +351,7 @@ static int load_arp_bpflet(int fd)
> +=20
> + int put_mylladdr(unsigned char **ptr_p, int ifindex, int alen)
> + {
> +-	struct iflink *ifl;
> ++	struct rarpiflink *ifl;
> +=20
> + 	for (ifl=3Difl_list; ifl; ifl =3D ifl->next)
> + 		if (ifl->index =3D=3D ifindex)
> +@@ -362,8 +368,8 @@ int put_mylladdr(unsigned char **ptr_p, int ifindex,=
 int alen)
> + int put_myipaddr(unsigned char **ptr_p, int ifindex, __u32 hisipaddr)
> + {
> + 	__u32 laddr =3D 0;
> +-	struct iflink *ifl;
> +-	struct ifaddr *ifa;
> ++	struct rarpiflink *ifl;
> ++	struct rarpifaddr *ifa;
> +=20
> + 	for (ifl=3Difl_list; ifl; ifl =3D ifl->next)
> + 		if (ifl->index =3D=3D ifindex)
> +@@ -388,7 +394,7 @@ void arp_advise(int ifindex, unsigned char *lladdr, =
int lllen, __u32 ipaddr)
> + 	int fd;
> + 	struct arpreq req;
> + 	struct sockaddr_in *sin;
> +-	struct iflink *ifl;
> ++	struct rarpiflink *ifl;
> +=20
> + 	for (ifl=3Difl_list; ifl; ifl =3D ifl->next)
> + 		if (ifl->index =3D=3D ifindex)
> +@@ -421,6 +427,10 @@ void serve_it(int fd)
> + 	struct rarp_map *rmap;
> + 	unsigned char *ptr;
> + 	int n;
> ++	int i;
> ++	char tmpbuf[16*3];
> ++	char tmpname[IFNAMSIZ];
> ++	struct rarpiflink *ifl;
> +=20
> + 	n =3D recvfrom(fd, buf, sizeof(buf), MSG_DONTWAIT, (struct sockaddr*)&=
sll, &sll_len);
> + 	if (n<0) {
> +@@ -447,21 +457,23 @@ void serve_it(int fd)
> + 	if (a->ar_op !=3D htons(ARPOP_RREQUEST))
> + 		return;
> +=20
> +-	if (verbose) {
> +-		int i;
> +-		char tmpbuf[16*3];
> +-		char *ptr =3D tmpbuf;
> +-		for (i=3D0; i<sll.sll_halen; i++) {
> +-			if (i) {
> +-				sprintf(ptr, ":%02x", sll.sll_addr[i]);
> +-				ptr++;
> +-			} else
> +-				sprintf(ptr, "%02x", sll.sll_addr[i]);
> +-			ptr +=3D 2;
> +-		}
> +-		syslog(LOG_INFO, "RARP request from %s on if%d", tmpbuf, sll.sll_ifin=
dex);
> ++	ptr =3D tmpbuf;
> ++        snprintf(tmpbuf, 2, "%02x", sll.sll_addr[0]);
> ++	for (ptr=3Dtmpbuf+2, i=3D1; i<sll.sll_halen; i++) {
> ++		snprintf(ptr, 3, ":%02x", sll.sll_addr[i]);
> ++		ptr +=3D 3;
> + 	}
> +=20
> ++	for (ifl=3Difl_list; ifl; ifl =3D ifl->next)
> ++		if (ifl->index =3D=3D sll.sll_ifindex)
> ++			break;
> ++	if (ifl) {
> ++		strncpy(tmpname, ifl->name, IFNAMSIZ);
> ++		tmpname[IFNAMSIZ-1] =3D 0;
> ++	} else
> ++		sprintf(tmpname, "if%d", sll.sll_ifindex);
> ++	syslog(LOG_INFO, "RARP request from %s on %s", tmpbuf, tmpname);
> ++
> + 	/* Sanity checks */
> +=20
> + 	/* 1. IP only -> pln=3D=3D4 */
> +@@ -526,6 +538,8 @@ void serve_it(int fd)
> + 	ptr +=3D rmap->lladdr_len;
> + 	memcpy(ptr, &rmap->ipaddr, 4);
> + 	ptr +=3D 4;
> ++	syslog(LOG_INFO, "RARP response to %s %s on %s", tmpbuf,
> ++	       inet_ntoa(*(struct in_addr *)&rmap->ipaddr), tmpname);
> +=20
> + 	/* Update our ARP cache. Probably, this guy
> + 	   will not able to make ARP (if it is broken)
> +@@ -613,7 +627,7 @@ int main(int argc, char **argv)
> +         if (ifname) {
> + 		struct ifreq ifr;
> + 		memset(&ifr, 0, sizeof(ifr));
> +-		strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
> ++		strncpy(ifr.ifr_name, ifname, IFNAMSIZ-1);
> + 		if (ioctl(pset[0].fd, SIOCGIFINDEX, &ifr)) {
> + 			perror("ioctl(SIOCGIFINDEX)");
> + 			usage();
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/rarpd/files/0004-rarpd.init-add-new=
-init-file.patch b/meta-oe/recipes-extended/rarpd/files/0004-rarpd.init-add=
-new-init-file.patch
> new file mode 100644
> index 0000000..3ba11ff
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/0004-rarpd.init-add-new-init-f=
ile.patch
> @@ -0,0 +1,116 @@
> +From 0ef1a95b220c7e110da950e5cc544c50c25b1bc6 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 18 Nov 2014 18:11:56 +0900
> +Subject: [PATCH 4/5] rarpd.init : add new init file
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + rarpd.init | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
> + 1 file changed, 96 insertions(+)
> + create mode 100644 rarpd.init
> +
> +diff --git a/rarpd.init b/rarpd.init
> +new file mode 100644
> +index 0000000..efcf825
> +--- /dev/null
> ++++ b/rarpd.init
> +@@ -0,0 +1,96 @@
> ++#!/bin/bash
> ++#
> ++#	/etc/init.d/rarpd
> ++#
> ++# Starts the rarpd daemon
> ++#
> ++# chkconfig: - 82 16
> ++# description: Server Reverse Address Resolution Protocol requests.
> ++# processname: rarpd
> ++
> ++### BEGIN INIT INFO
> ++# Provides: rarpd
> ++# Required-Start: $syslog $network
> ++# Required-Stop:  $syslog $network
> ++# Default-Start:
> ++# Default-Stop: 0 1 2 3 4 5 6
> ++# Short-Description: start and stop rarpd
> ++# Description: RARP (Reverse Address Resolution Protocol) is a protocol=
 \
> ++#              which allows individual devices on an IP network to get \
> ++#              their own IP addresses from the RARP server. \
> ++### END INIT INFO
> ++
> ++# Source function library.
> ++. /etc/init.d/functions
> ++
> ++# Read the config file if exists
> ++if [ -f /etc/sysconfig/rarpd ]; then
> ++ . /etc/sysconfig/rarpd
> ++fi
> ++
> ++RETVAL=3D0
> ++prog=3D"rarpd"
> ++
> ++
> ++start() {
> ++    #if these files don't exist rarpd can't work
> ++    test -x /usr/sbin/rarpd -a -f /etc/ethers || exit 6
> ++	# Check if rarpd is already running
> ++	#if [ ! -f /var/lock/subsys/rarpd ]; then
> ++    status rarpd;
> ++    if [ $? -ne 0 ]; then
> ++	    echo -n $"Starting $prog: "
> ++	    daemon /usr/sbin/rarpd $OPTIONS $INTERFACE
> ++	    RETVAL=3D$?
> ++	    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/rarpd
> ++	    echo
> ++	fi
> ++	return $RETVAL
> ++}
> ++
> ++stop() {
> ++	echo -n $"Stopping $prog: "
> ++	killproc /usr/sbin/rarpd
> ++	RETVAL=3D$?
> ++	[ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/rarpd
> ++	echo
> ++	return $RETVAL
> ++}
> ++reload() {
> ++    RETVAL=3D3
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
> ++	;;
> ++  reload)
> ++    reload
> ++    ;;
> ++  force-reload|restart)
> ++    stop
> ++	start
> ++	;;
> ++  condrestart)
> ++	if [ -f /var/lock/subsys/rarpd ]; then
> ++	    stop
> ++	    start
> ++	fi
> ++	;;
> ++  status)
> ++	status rarpd
> ++	RETVAL=3D$?
> ++	;;
> ++  *)
> ++	echo $"Usage: $0 {start|stop|restart|condrestart|reload|status|force-r=
eload}"
> ++	RETVAL=3D2
> ++   =20
> ++esac
> ++
> ++exit $RETVAL
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/rarpd/files/0005-ethernet.c-remove-=
it.patch b/meta-oe/recipes-extended/rarpd/files/0005-ethernet.c-remove-it.p=
atch
> new file mode 100644
> index 0000000..c77c806
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/0005-ethernet.c-remove-it.patch
> @@ -0,0 +1,244 @@
> +From abe15ba10ddc3548c528ccb088097d7abf5be48b Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 18 Nov 2014 18:14:07 +0900
> +Subject: [PATCH 5/5] ethernet.c : remove it
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + ethernet.c | 224 ------------------------------------------------------=
-------
> + 1 file changed, 224 deletions(-)
> + delete mode 100644 ethernet.c
> +
> +diff --git a/ethernet.c b/ethernet.c
> +deleted file mode 100644
> +index d682b63..0000000
> +--- a/ethernet.c
> ++++ /dev/null
> +@@ -1,224 +0,0 @@
> +-/*
> +- * Copyright (c) 1990, 1993 The Regents of the University of California.
> +- * All rights reserved.
> +- *
> +- * Redistribution and use in source and binary forms, with or without
> +- * modification, are permitted provided that: (1) source code distribut=
ions
> +- * retain the above copyright notice and this paragraph in its entirety=
, (2)
> +- * distributions including binary code include the above copyright noti=
ce and
> +- * this paragraph in its entirety in the documentation or other materia=
ls
> +- * provided with the distribution, and (3) all advertising materials me=
ntioning
> +- * features or use of this software display the following acknowledgeme=
nt:
> +- * ``This product includes software developed by the University of Cali=
fornia,
> +- * Lawrence Berkeley Laboratory and its contributors.'' Neither the nam=
e of
> +- * the University nor the names of its contributors may be used to endo=
rse
> +- * or promote products derived from this software without specific prior
> +- * written permission.
> +- * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLI=
ED
> +- * WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
> +- * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> +- */
> +-#ifndef lint
> +-static char rcsid[] =3D
> +-    "@(#) $Header: etherent.c,v 1.4 96/06/14 20:34:25 leres Exp $ (LBL)=
";
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
> +-static FILE *ether_fp =3D NULL;
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
> +-		c =3D getc(f);
> +-	} while (isspace(c) && c !=3D '\n');
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
> +-		c =3D getc(f);
> +-	while (c !=3D '\n' && c !=3D EOF);
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
> +-	static int nline =3D 1;
> +- top:
> +-	while (nline) {
> +-		/* Find addr */
> +-		c =3D skip_space(fp);
> +-		if (c =3D=3D '\n')
> +-			continue;
> +-		/* If this is a comment, or first thing on line
> +-		   cannot be etehrnet address, skip the line. */
> +-		else if (!isxdigit(c))
> +-			c =3D skip_line(fp);
> +-		else {
> +-			/* must be the start of an address */
> +-			for (i =3D 0; i < 6; i +=3D 1) {
> +-				d =3D xdtoi(c);
> +-				c =3D getc(fp);
> +-				if (c !=3D ':') {
> +-					d <<=3D 4;
> +-					d |=3D xdtoi(c);
> +-					c =3D getc(fp);
> +-				}
> +-				e.addr[i] =3D d;
> +-				if (c !=3D ':')
> +-					break;
> +-				c =3D getc(fp);
> +-			}
> +-			nline =3D 0;
> +-		}
> +-		if (c =3D=3D EOF)
> +-			return NULL;
> +-	}
> +-=09
> +-	/* If we started a new line, 'c' holds the char past the ether addr,
> +-	   which we assume is white space.  If we are continuing a line,
> +-	   'c' is garbage.  In either case, we can throw it away. */
> +-	  =20
> +-	c =3D skip_space(fp);
> +-	if (c =3D=3D '\n') {
> +-		nline =3D 1;
> +-		goto top;
> +-	}
> +-	else if (c =3D=3D '#') {
> +-		(void)skip_line(fp);
> +-		nline =3D 1;
> +-		goto top;
> +-	}
> +-	else if (c =3D=3D EOF)
> +-		return NULL;
> +-=09
> +-	/* Must be a name. */
> +-	bp =3D e.name;
> +-	/* Use 'd' to prevent buffer overflow. */
> +-	d =3D sizeof(e.name) - 1;
> +-	do {
> +-		*bp++ =3D c;
> +-		c =3D getc(fp);
> +-	} while (!isspace(c) && c !=3D EOF && --d > 0);
> +-	*bp =3D '\0';
> +-	if (c =3D=3D '\n')
> +-		nline =3D 1;
> +-
> +-	return &e;
> +-}
> +-
> +-/* Open/rewind the ethers files; returns 1 if file was reopened */
> +-int
> +-ether_rewind()
> +-{
> +-	struct stat st;
> +-	static long mtime =3D 0, ctime =3D 0;
> +-
> +-	if (ether_fp !=3D NULL) {
> +-		if (fstat(fileno(ether_fp), &st) < 0 ||
> +-		    mtime !=3D st.st_mtime || ctime !=3D st.st_ctime ||
> +-		    fseek(ether_fp, 0L, SEEK_SET) < 0) {
> +-			fclose(ether_fp);
> +-			ether_fp =3D NULL;
> +-		}
> +-	}
> +-	if (ether_fp =3D=3D NULL) {
> +-		ether_fp =3D fopen(ETHERS_FILE, "r");
> +-		if (ether_fp =3D=3D NULL)
> +-			return (-1);
> +-		if (fstat(fileno(ether_fp), &st) < 0) {
> +-			fclose(ether_fp);
> +-			ether_fp =3D NULL;
> +-			return (-1);
> +-		}
> +-		mtime =3D st.st_mtime;
> +-		ctime =3D st.st_ctime;
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
> +-	while ((ep =3D next_etherent(ether_fp)) !=3D NULL)
> +-		if (bcmp(ep->addr, ea, 6) =3D=3D 0) {
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
> +-	while ((ep =3D next_etherent(ether_fp)) !=3D NULL)
> +-		if (strcmp(ep->name, name) =3D=3D 0) {
> +-			bcopy(ep->addr, ea, 6);
> +-			return (0);
> +-		}
> +-	return (1);
> +-}
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/rarpd/files/ethers.sample b/meta-oe=
/recipes-extended/rarpd/files/ethers.sample
> new file mode 100644
> index 0000000..249ca6b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/ethers.sample
> @@ -0,0 +1 @@
> +# see man ethers for syntax
> diff --git a/meta-oe/recipes-extended/rarpd/files/rarpd.service b/meta-oe=
/recipes-extended/rarpd/files/rarpd.service
> new file mode 100644
> index 0000000..137710e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/files/rarpd.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=3DReverse Address Resolution Protocol Requests Server
> +Requires=3Dnetwork.target
> +After=3Dsyslog.target network.target
> +
> +[Service]
> +Type=3Dforking
> +EnvironmentFile=3D-/etc/sysconfig/rarpd
> +ExecStart=3D/usr/sbin/rarpd $OPTIONS $INTERFACE
> +StandardError=3Dsyslog
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> +
> diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/r=
ecipes-extended/rarpd/rarpd_ss981107.bb
> new file mode 100644
> index 0000000..b9b4bd7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
> @@ -0,0 +1,48 @@
> +SUMMARY =3D "The RARP daemon."
> +DESCRIPTION =3D "RARP (Reverse Address Resolution Protocol) is a protoco=
l which \
> +allows individual devices on an IP network to get their own IP addresses=
 from \
> +the RARP server. Some machines (e.g. SPARC boxes) use this protocol inst=
ead \
> +of e.g. DHCP to query their IP addresses during network bootup. \
> +Linux kernels up to 2.2 used to provide a kernel daemon for this service=
, \
> +but since 2.3 kernels it is served by this userland daemon. \
> +You should install rarpd if you want to set up a RARP server on your \
> +network."
> +SECTION =3D "System Environment/Daemons"
> +
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${PN}-${PV}.t=
ar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${PN}-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "be2a88f8ccddf2a40ac484cb3294fedc"
> +SRC_URI[sha256sum] =3D "4d6145d435a5d8b567b9798620f57f9b0a464078a1deba26=
7958f168fbe776e6"
> +
> +SRC_URI +=3D "file://0001-rarpd.8-add-man-file.patch \
> +            file://0002-Makefile-modify-compile-parameters.patch \
> +            file://0003-rarpd.c-bug-fix.patch \
> +            file://0004-rarpd.init-add-new-init-file.patch \
> +            file://0005-ethernet.c-remove-it.patch \
> +            file://ethers.sample \
> +            file://rarpd.service \
> +           "
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://rarpd.c;md5=3D199b20b172ea93121bc613a9c77b6=
931"
> +
> +S =3D "${WORKDIR}/${PN}"
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
> +        if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d=
)}; then
> +	    install -d ${D}${systemd_unitdir}/system
> +	    install -m 0644 ${WORKDIR}/rarpd.service ${D}${systemd_unitdir}/sys=
tem/
> +        fi
> +}

Incorrect indentation again (I've fixed it when cherry-picking)

> +
> +inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','syste=
md','',d)}
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "rarpd.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uJWb33pM2TcUAXIl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsq8IACgkQN1Ujt2V2gByJwQCfYNPDIbTVdsPcOsGMKznYrsb8
mjgAn3CYOwMcDWmMDvAGyTZpj/PaRidL
=Wb9n
-----END PGP SIGNATURE-----

--uJWb33pM2TcUAXIl--
