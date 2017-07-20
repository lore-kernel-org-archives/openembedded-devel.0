Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 728EE78291
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 10:35:35 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v190so2443406pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MtvugyKm2kAwILkAS1604iIKQFFlLoRw5xt0c8m4Lc8=;
	b=mCXp+nN2cvYm/cbPjBZ3Vk90tuN33uyZhtSuya8+Y+x2KSovYvC6CbS1lQKg+IZs91
	pyOfpEnIzLs8Qi+lZcjtHOBNbfnKPYWxyLhSCtjfgrcEE+XfHSOvx8LZJSg9kLBmRgII
	jASm4OwUC0WF+Kpi8C0wEAsTf3LZd/epyiSYjtai7xYtmVeQZAjbzAdpSzJmrsw76GF/
	ED9ZOJoteY/CnaiKbMkZN50SMAzaMX5kP0f9yByfshQyFytmZnhdmfu8v1ZREIJjw/FO
	BzEh+NsoMkiwQ1YTQJftfZuCN3NmXp1qN8KZQjKaSEy4Er+MaGgCHMJCnFHzbgNNsZgS
	uA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MtvugyKm2kAwILkAS1604iIKQFFlLoRw5xt0c8m4Lc8=;
	b=ErRhnvh7eRYGSRSLJjhYSNKye6KVG9ChY9oaYJbPV/StiXmA/hNTee3MMUVAJmMYcV
	L4SxuvGgonzLTQ2Sg3yfdpYqtIAGhw155l04c5ENZRETsBLLujSSIudnq9QvQIGYArK8
	f3hs11LTTjnLymESfNdlKD0zGs0O8gUgMRlTusqiTWe8cewYG8hxHkRtxoirrjp5P1cI
	AIYPyXFdaZ2wJJ/pEiVQ5rKjGIjqfklBx/AvdtsjA4jrTivzikOvaseIJ38Ac5AMN0PT
	KRD/rnneoV7mX8ofDd9B7C4E5wboDlMAc3FAZMSqdVOexOx7X05YaEQZQBrQXQUrEwAT
	oEwQ==
X-Gm-Message-State: AIVw111mCHUvfxji+vRsoiYMQ6Rtu70Mym82UE2D/sfb5NjGa8WOkknJ
	Tr/R/1jfS+x1j7x4
X-Received: by 10.84.209.238 with SMTP id y101mr3835200plh.118.1500546936041; 
	Thu, 20 Jul 2017 03:35:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	f13sm4001708pgr.78.2017.07.20.03.35.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 03:35:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 03:35:26 -0700
Message-Id: <20170720103526.20065-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-networking][PATCH V2] ippool: Fix build errors found with hardening flags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jul 2017 10:35:35 -0000

Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v1 -> v2:
- Fix build on musl
- Respect env CPPFLAGS in makefiles

 .../ippool/0001-Respect-flags-from-env.patch       |  56 ++++
 ...timer-Check-for-return-value-of-write-API.patch |  28 ++
 .../ippool/ippool/0002-link-with-libtirpc.patch    |  30 +++
 .../ippool/ippool/0003-musl-fixes.patch            | 283 +++++++++++++++++++++
 .../recipes-daemons/ippool/ippool_1.3.bb           |  31 ++-
 5 files changed, 415 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0001-Respect-flags-from-env.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0002-link-with-libtirpc.patch
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch

diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-Respect-flags-from-env.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-Respect-flags-from-env.patch
new file mode 100644
index 000000000..e96762125
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-Respect-flags-from-env.patch
@@ -0,0 +1,56 @@
+From 4848b9e4d516a9203c08432901a7b40419e8f43c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Jul 2017 15:54:35 -0700
+Subject: [PATCH 1/3] Respect flags from env
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile      | 4 ++--
+ cli/Makefile  | 2 +-
+ pppd/Makefile | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a05a000..439a978 100644
+--- a/Makefile
++++ b/Makefile
+@@ -81,8 +81,8 @@ LIBS.dmalloc=		-ldmalloc
+ export USE_DMALLOC
+ endif
+ 
+-CPPFLAGS=		$(CPPFLAGS.ippooltest)
+-CFLAGS=			-I. -Iusl -Icli -MMD -Wall -g $(CPPFLAGS) $(CPPFLAGS.dmalloc)
++CPPFLAGS+=		$(CPPFLAGS.ippooltest)
++CFLAGS+=			-I. -Iusl -Icli -MMD -Wall -g $(CPPFLAGS) $(CPPFLAGS.dmalloc)
+ LDFLAGS.ippoold=	$(LDFLAGS) -Wl,-E -L. -Lusl -lusl -lnsl -ldl $(LIBS.dmalloc) -lc
+ LDFLAGS.ippoolconfig=	$(LDFLAGS) -Lcli -lcli -lreadline -lcurses -lnsl $(LIBS.dmalloc) -lc
+ 
+diff --git a/cli/Makefile b/cli/Makefile
+index 4b5dd59..56fbf2f 100644
+--- a/cli/Makefile
++++ b/cli/Makefile
+@@ -7,7 +7,7 @@ CLI_SRCS_TEST.o=	$(CLI_SRCS_TEST.c:%.c=%.o)
+ 
+ LDFLAGS.cli_test=	-L.. -L. $(READLINE_LDFLAGS) -lcli -lusl -lreadline -lcurses -lc
+ 
+-CFLAGS=			$(CFLAGS.optimize) -MMD -Wall -Werror -I.. $(READLINE_CFLAGS)
++CFLAGS=			$(CFLAGS.optimize) -MMD -Wall -Werror -I.. $(READLINE_CFLAGS) $(CPPFLAGS)
+ 
+ .PHONY:			all test clean
+ 
+diff --git a/pppd/Makefile b/pppd/Makefile
+index 106deca..7fd815f 100644
+--- a/pppd/Makefile
++++ b/pppd/Makefile
+@@ -10,7 +10,7 @@ endif
+ 
+ # END CONFIGURABLE SETTINGS
+ 
+-CFLAGS	+= -g -I.. -I/usr/include/pppd $(CFLAGS.pppd) -fPIC
++CFLAGS	+= -g -I.. -I=/usr/include/pppd $(CFLAGS.pppd) -fPIC
+ LDFLAGS	+= -shared
+ 
+ all:	ippool.so
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
new file mode 100644
index 000000000..6fb7cc5c4
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
@@ -0,0 +1,28 @@
+From 5d7f20c045b3c74dad2c53d65e30bd4840250082 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 15:17:19 -0700
+Subject: [PATCH] usl_timer: Check for return value of write() API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usl/usl_timer.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/usl/usl_timer.c b/usl/usl_timer.c
+index fda752b..d8414a6 100644
+--- a/usl/usl_timer.c
++++ b/usl/usl_timer.c
+@@ -94,7 +94,9 @@ void usl_timer_tick(void)
+ 
+ 	if (!usl_tick_pending) {
+ 		usl_tick_pending = 1;
+-		write(usl_tick_pipe[1], &msg, sizeof(msg));
++		if (write(usl_tick_pipe[1], &msg, sizeof(msg)) != sizeof(msg)) {
++			fprintf(stderr, "write to fd %i failed: %s\n", usl_tick_pipe[1], strerror(errno));
++		}
+ 	}
+ }
+ 
+-- 
+2.13.2
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0002-link-with-libtirpc.patch b/meta-networking/recipes-daemons/ippool/ippool/0002-link-with-libtirpc.patch
new file mode 100644
index 000000000..d80f7b436
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0002-link-with-libtirpc.patch
@@ -0,0 +1,30 @@
+From 47aef26198431f7ad568c2277dded158bda3e36f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Jul 2017 16:00:35 -0700
+Subject: [PATCH 2/3] link with libtirpc
+
+musl needs it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 439a978..ea821eb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -83,8 +83,8 @@ endif
+ 
+ CPPFLAGS+=		$(CPPFLAGS.ippooltest)
+ CFLAGS+=			-I. -Iusl -Icli -MMD -Wall -g $(CPPFLAGS) $(CPPFLAGS.dmalloc)
+-LDFLAGS.ippoold=	$(LDFLAGS) -Wl,-E -L. -Lusl -lusl -lnsl -ldl $(LIBS.dmalloc) -lc
+-LDFLAGS.ippoolconfig=	$(LDFLAGS) -Lcli -lcli -lreadline -lcurses -lnsl $(LIBS.dmalloc) -lc
++LDFLAGS.ippoold=	$(LDFLAGS) -Wl,-E -L. -Lusl -lusl -ldl $(LIBS.dmalloc) -lc -ltirpc
++LDFLAGS.ippoolconfig=	$(LDFLAGS) -Lcli -lcli -lreadline -lcurses $(LIBS.dmalloc) -lc -ltirpc
+ 
+ OPT_CFLAGS?=		-O
+ 
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch b/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch
new file mode 100644
index 000000000..3cd5259fa
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch
@@ -0,0 +1,283 @@
+From eb345047decba665e3f39908336a83f039e1ece2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Jul 2017 16:01:32 -0700
+Subject: [PATCH 3/3] musl fixes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cli/cli_readline.c |   7 +-
+ ippool_api.c       |   9 ++-
+ net/ppp_defs.h     | 194 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ usl/usl.h          |   4 ++
+ 4 files changed, 208 insertions(+), 6 deletions(-)
+ create mode 100644 net/ppp_defs.h
+
+diff --git a/cli/cli_readline.c b/cli/cli_readline.c
+index 2812e6e..542935c 100644
+--- a/cli/cli_readline.c
++++ b/cli/cli_readline.c
+@@ -17,13 +17,14 @@
+  *  Boston, MA 02110-1301 USA
+  *
+  *****************************************************************************/
+-
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/file.h>
+ #include <sys/stat.h>
+-#include <sys/errno.h>
++#include <fcntl.h>
++#include <errno.h>
+ #include <signal.h>
+ 
+ #include <readline/readline.h>
+@@ -630,7 +631,7 @@ static void cli_rl_uninstall_signal_handlers(void)
+ 
+ static int cli_rl_install_signal_handlers(void)
+ {
+-	__sighandler_t handler;
++	sighandler_t handler;
+ 
+ 	rl_catch_signals = 0;
+ 	rl_clear_signals();
+diff --git a/ippool_api.c b/ippool_api.c
+index 2c10c47..d1127a9 100644
+--- a/ippool_api.c
++++ b/ippool_api.c
+@@ -181,10 +181,13 @@ int ippool_api_rpc_check_request(SVCXPRT *xprt)
+ 	 * non-loopback interface, reject the request.
+ 	 */
+ 	if ((!ippool_opt_remote_rpc) &&
+-	    ((xprt->xp_raddr.sin_addr.s_addr != htonl(INADDR_LOOPBACK)) &&
+-	     (xprt->xp_raddr.sin_addr.s_addr != htonl(INADDR_ANY)))) {
++	    ((xprt->xp_raddr.sin6_addr.s6_addr != htonl(INADDR_LOOPBACK)) &&
++	     (xprt->xp_raddr.sin6_addr.s6_addr != htonl(INADDR_ANY)))) {
++		char straddr[INET6_ADDRSTRLEN];
++		inet_ntop(AF_INET6, &xprt->xp_raddr.sin6_addr, straddr, sizeof(straddr));
++
+ 		if (ippool_opt_debug) {
+-			ippool_log(LOG_ERR, "Rejecting RPC request from %s", inet_ntoa(xprt->xp_raddr.sin_addr));
++			ippool_log(LOG_ERR, "Rejecting RPC request from %s", straddr);
+ 		}
+ 		svcerr_auth(xprt, AUTH_TOOWEAK);
+ 		return -EPERM;
+diff --git a/net/ppp_defs.h b/net/ppp_defs.h
+new file mode 100644
+index 0000000..b06eda5
+--- /dev/null
++++ b/net/ppp_defs.h
+@@ -0,0 +1,194 @@
++/*	$Id: ppp_defs.h,v 1.17 2002/12/06 09:49:15 paulus Exp $	*/
++
++/*
++ * ppp_defs.h - PPP definitions.
++ *
++ * Copyright (c) 1984 Paul Mackerras. All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ *
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in
++ *    the documentation and/or other materials provided with the
++ *    distribution.
++ *
++ * 3. The name(s) of the authors of this software must not be used to
++ *    endorse or promote products derived from this software without
++ *    prior written permission.
++ *
++ * 4. Redistributions of any form whatsoever must retain the following
++ *    acknowledgment:
++ *    "This product includes software developed by Paul Mackerras
++ *     <paulus@samba.org>".
++ *
++ * THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
++ * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
++ * AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
++ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
++ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
++ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#ifndef _PPP_DEFS_H_
++#define _PPP_DEFS_H_
++
++/*
++ * The basic PPP frame.
++ */
++#define PPP_HDRLEN	4	/* octets for standard ppp header */
++#define PPP_FCSLEN	2	/* octets for FCS */
++
++/*
++ * Packet sizes
++ *
++ * Note - lcp shouldn't be allowed to negotiate stuff outside these
++ *	  limits.  See lcp.h in the pppd directory.
++ * (XXX - these constants should simply be shared by lcp.c instead
++ *	  of living in lcp.h)
++ */
++#define	PPP_MTU		1500	/* Default MTU (size of Info field) */
++#define PPP_MAXMTU	65535 - (PPP_HDRLEN + PPP_FCSLEN)
++#define PPP_MINMTU	64
++#define PPP_MRU		1500	/* default MRU = max length of info field */
++#define PPP_MAXMRU	65000	/* Largest MRU we allow */
++#define PPP_MINMRU	128
++
++#define PPP_ADDRESS(p)	(((u_char *)(p))[0])
++#define PPP_CONTROL(p)	(((u_char *)(p))[1])
++#define PPP_PROTOCOL(p)	((((u_char *)(p))[2] << 8) + ((u_char *)(p))[3])
++
++/*
++ * Significant octet values.
++ */
++#define	PPP_ALLSTATIONS	0xff	/* All-Stations broadcast address */
++#define	PPP_UI		0x03	/* Unnumbered Information */
++#define	PPP_FLAG	0x7e	/* Flag Sequence */
++#define	PPP_ESCAPE	0x7d	/* Asynchronous Control Escape */
++#define	PPP_TRANS	0x20	/* Asynchronous transparency modifier */
++
++/*
++ * Protocol field values.
++ */
++#define PPP_IP		0x21	/* Internet Protocol */
++#define PPP_AT		0x29	/* AppleTalk Protocol */
++#define PPP_IPX		0x2b	/* IPX protocol */
++#define	PPP_VJC_COMP	0x2d	/* VJ compressed TCP */
++#define	PPP_VJC_UNCOMP	0x2f	/* VJ uncompressed TCP */
++#define PPP_IPV6	0x57	/* Internet Protocol Version 6 */
++#define PPP_COMP	0xfd	/* compressed packet */
++#define PPP_IPCP	0x8021	/* IP Control Protocol */
++#define PPP_ATCP	0x8029	/* AppleTalk Control Protocol */
++#define PPP_IPXCP	0x802b	/* IPX Control Protocol */
++#define PPP_IPV6CP	0x8057	/* IPv6 Control Protocol */
++#define PPP_CCP		0x80fd	/* Compression Control Protocol */
++#define PPP_ECP		0x8053	/* Encryption Control Protocol */
++#define PPP_LCP		0xc021	/* Link Control Protocol */
++#define PPP_PAP		0xc023	/* Password Authentication Protocol */
++#define PPP_LQR		0xc025	/* Link Quality Report protocol */
++#define PPP_CHAP	0xc223	/* Cryptographic Handshake Auth. Protocol */
++#define PPP_CBCP	0xc029	/* Callback Control Protocol */
++#define PPP_EAP		0xc227	/* Extensible Authentication Protocol */
++
++/*
++ * Values for FCS calculations.
++ */
++#define PPP_INITFCS	0xffff	/* Initial FCS value */
++#define PPP_GOODFCS	0xf0b8	/* Good final FCS value */
++#define PPP_FCS(fcs, c)	(((fcs) >> 8) ^ fcstab[((fcs) ^ (c)) & 0xff])
++
++/*
++ * A 32-bit unsigned integral type.
++ */
++
++#if !defined(__BIT_TYPES_DEFINED__) && !defined(_BITYPES) \
++ && !defined(__FreeBSD__) && (NS_TARGET < 40)
++#ifdef	UINT32_T
++typedef UINT32_T	u_int32_t;
++#else
++typedef unsigned int	u_int32_t;
++typedef unsigned short  u_int16_t;
++#endif
++#endif
++
++/*
++ * Extended asyncmap - allows any character to be escaped.
++ */
++typedef u_int32_t	ext_accm[8];
++
++/*
++ * What to do with network protocol (NP) packets.
++ */
++enum NPmode {
++    NPMODE_PASS,		/* pass the packet through */
++    NPMODE_DROP,		/* silently drop the packet */
++    NPMODE_ERROR,		/* return an error */
++    NPMODE_QUEUE		/* save it up for later. */
++};
++
++/*
++ * Statistics.
++ */
++struct pppstat	{
++    unsigned int ppp_ibytes;	/* bytes received */
++    unsigned int ppp_ipackets;	/* packets received */
++    unsigned int ppp_ierrors;	/* receive errors */
++    unsigned int ppp_obytes;	/* bytes sent */
++    unsigned int ppp_opackets;	/* packets sent */
++    unsigned int ppp_oerrors;	/* transmit errors */
++};
++
++struct vjstat {
++    unsigned int vjs_packets;	/* outbound packets */
++    unsigned int vjs_compressed; /* outbound compressed packets */
++    unsigned int vjs_searches;	/* searches for connection state */
++    unsigned int vjs_misses;	/* times couldn't find conn. state */
++    unsigned int vjs_uncompressedin; /* inbound uncompressed packets */
++    unsigned int vjs_compressedin; /* inbound compressed packets */
++    unsigned int vjs_errorin;	/* inbound unknown type packets */
++    unsigned int vjs_tossed;	/* inbound packets tossed because of error */
++};
++
++struct ppp_stats {
++    struct pppstat p;		/* basic PPP statistics */
++    struct vjstat vj;		/* VJ header compression statistics */
++};
++
++struct compstat {
++    unsigned int unc_bytes;	/* total uncompressed bytes */
++    unsigned int unc_packets;	/* total uncompressed packets */
++    unsigned int comp_bytes;	/* compressed bytes */
++    unsigned int comp_packets;	/* compressed packets */
++    unsigned int inc_bytes;	/* incompressible bytes */
++    unsigned int inc_packets;	/* incompressible packets */
++    unsigned int ratio;		/* recent compression ratio << 8 */
++};
++
++struct ppp_comp_stats {
++    struct compstat c;		/* packet compression statistics */
++    struct compstat d;		/* packet decompression statistics */
++};
++
++/*
++ * The following structure records the time in seconds since
++ * the last NP packet was sent or received.
++ */
++struct ppp_idle {
++    time_t xmit_idle;		/* time since last NP packet sent */
++    time_t recv_idle;		/* time since last NP packet received */
++};
++
++#ifndef __P
++#ifdef __STDC__
++#define __P(x)	x
++#else
++#define __P(x)	()
++#endif
++#endif
++
++#endif /* _PPP_DEFS_H_ */
+diff --git a/usl/usl.h b/usl/usl.h
+index cdc16db..88d2714 100644
+--- a/usl/usl.h
++++ b/usl/usl.h
+@@ -38,6 +38,10 @@
+ #include "usl_fsm.h"
+ #include "usl_list.h"
+ 
++#ifndef WAIT_ANY
++#define WAIT_ANY (-1)
++#endif
++
+ #define USL_VERSION	"0.6"
+ 
+ #ifdef DEBUG
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 969f434cc..05921d536 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -11,16 +11,21 @@ HOMEPAGE = "http://www.openl2tp.org/"
 SECTION = "console/network"
 LICENSE = "GPLv2+"
 
-SRC_URI = "\
-        https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-        file://ippool_usl_timer.patch \
-        file://ippool_parallel_make_and_pic.patch \
-        file://ippool_init.d.patch \
-        file://always_syslog.patch \
-        file://makefile-add-ldflags.patch \
-        file://runtest.sh \
-        file://ippool.service \
-        "
+SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+           file://runtest.sh \
+           file://ippool.service \
+           file://ippool_usl_timer.patch \
+           file://ippool_parallel_make_and_pic.patch \
+           file://ippool_init.d.patch \
+           file://always_syslog.patch \
+           file://makefile-add-ldflags.patch \
+           file://0001-usl_timer-Check-for-return-value-of-write-API.patch \
+           file://0001-Respect-flags-from-env.patch \
+"
+SRC_URI_append_libc-musl = "\
+           file://0002-link-with-libtirpc.patch \
+           file://0003-musl-fixes.patch \
+           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
 SRC_URI[md5sum] = "e2401e65db26a3764585b97212888fae"
@@ -29,6 +34,7 @@ SRC_URI[sha256sum] = "d3eab7d6cad5da8ccc9d1e31d5303e27a39622c07bdb8fa3618eea3144
 inherit systemd
 
 DEPENDS = "readline ppp ncurses gzip-native"
+DEPENDS_append_libc-musl = " libtirpc"
 RDEPENDS_${PN} = "rpcbind"
 
 EXTRA_OEMAKE = "CC='${CC}' AS='${AS}' LD='${LD}' AR='${AR}' NM='${NM}' STRIP='${STRIP}'"
@@ -36,6 +42,8 @@ EXTRA_OEMAKE += "PPPD_VERSION=${PPPD_VERSION} SYS_LIBDIR=${libdir}"
 # enable self tests
 EXTRA_OEMAKE += "IPPOOL_TEST=y"
 
+CPPFLAGS += "${SELECTED_OPTIMIZATION}"
+CPPFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 
 SYSTEMD_SERVICE_${PN} = "ippool.service"
 SYSTEMD_AUTO_ENABLE = "disable"
@@ -48,9 +56,6 @@ do_compile_prepend() {
 
     sed -i -e "s:-I/usr/include/pppd:-I=/usr/include/pppd:" ${S}/pppd/Makefile
 
-    # ignore the OPT_CFLAGS?= in Makefile,
-    # it should be in CFLAGS from env
-    export OPT_CFLAGS=
 }
 
 
-- 
2.13.3


