Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AAECB74B83
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:24 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c10so26068901pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gU/FbkJlwCZUc+ObxGo7KZ2xm7SlLhwGGtR6I+PM4xM=;
	b=eIQK91vYf+8/OZ4Wqdio6C9Nxc7rZE92kTMFoXqJrIpq+OBDZDVZfXiJ1PmFZMiGf/
	14XoCY1N9uwcItKPvuAvg4TdqxPBBqgPzhmFvA40s/v+zU/3rGzX0hCrJmrr6g8lFuPD
	v3Qx3+uXZ2+PQoTMulN+r/CaqMaesnuFbN4RzA1R/MIJtDfjWSz9XxKn7S+dqT0vmhfa
	BG+R0aeYd1rd2sUz8wf8R0qYHUr5EmLlj1tZxhwdkXHWIxH/KGy7nqn1WCymvIloq+FV
	ftsFQsch7ecHvj+VW/Hw1ZFPnlNpjnGwhmWpXSg4OXLLniTu9h4Ul//ash7J2Uw0VaiF
	wgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gU/FbkJlwCZUc+ObxGo7KZ2xm7SlLhwGGtR6I+PM4xM=;
	b=Eq7t/iQ738cZwyQK27+NjqW75snFXPsDNJB8gx0BJMQRNlbZC2uFUV6Y0GIySzY4tf
	UCEFRP4QEio9EoYFgQhUMYVq3++VEzf6obLzYXRDzyRISyHTl9WfPkhlV42Ga4+DJq5n
	PDxQq5OeNQecBWQ8Ck+hX7q2j68UCS1RSGido/Vwh/7hzcTqTxRewq08rgVbr7TBfLh4
	Jny68er6wyyv9C5OivlMPAMeWpEtqvJdIY5qhUtGMa53IROxGAIy6HhlMaKFP6n3dWYt
	iVNf+zdqg4KlSTT5h2/Ga3B/81oYH3Abba4Wr8YVs1BrGHdfve5lkqfj2OVtPo8AYO0c
	t6Ng==
X-Gm-Message-State: ALQs6tBaxZgOWVXzMvZQlt4yyiKipW9KmomUAT3usRjSTbYjiQqB50Cu
	Sj+Xyj0OJaRKhuhC7wItjr0NPg==
X-Google-Smtp-Source: AB8JxZoDWisLfA6zqJ3EZW97eBH7aLqcUwQ6z+qlJKxZN9OANzvAAss0wIqRrjj81N9jnupgJGtX6A==
X-Received: by 2002:a65:508c:: with SMTP id
	r12-v6mr36341323pgp.185.1525892424889; 
	Wed, 09 May 2018 12:00:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:01 -0700
Message-Id: <20180509190011.30006-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/16] ippool: Adjust for glibc dropping rpc support
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
X-List-Received-Date: Wed, 09 May 2018 19:00:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ippool/ippool/0003-musl-fixes.patch       | 231 ++----------------
 .../recipes-daemons/ippool/ippool_1.3.bb      |   8 +-
 2 files changed, 16 insertions(+), 223 deletions(-)

diff --git a/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch b/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch
index 3cd5259fa6..952e4f0d04 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch
+++ b/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 208 insertions(+), 6 deletions(-)
  create mode 100644 net/ppp_defs.h
 
-diff --git a/cli/cli_readline.c b/cli/cli_readline.c
-index 2812e6e..542935c 100644
---- a/cli/cli_readline.c
-+++ b/cli/cli_readline.c
+Index: ippool-1.3/cli/cli_readline.c
+===================================================================
+--- ippool-1.3.orig/cli/cli_readline.c
++++ ippool-1.3/cli/cli_readline.c
 @@ -17,13 +17,14 @@
   *  Boston, MA 02110-1301 USA
   *
@@ -33,7 +33,7 @@ index 2812e6e..542935c 100644
  #include <signal.h>
  
  #include <readline/readline.h>
-@@ -630,7 +631,7 @@ static void cli_rl_uninstall_signal_handlers(void)
+@@ -630,7 +631,7 @@ static void cli_rl_uninstall_signal_hand
  
  static int cli_rl_install_signal_handlers(void)
  {
@@ -42,11 +42,11 @@ index 2812e6e..542935c 100644
  
  	rl_catch_signals = 0;
  	rl_clear_signals();
-diff --git a/ippool_api.c b/ippool_api.c
-index 2c10c47..d1127a9 100644
---- a/ippool_api.c
-+++ b/ippool_api.c
-@@ -181,10 +181,13 @@ int ippool_api_rpc_check_request(SVCXPRT *xprt)
+Index: ippool-1.3/ippool_api.c
+===================================================================
+--- ippool-1.3.orig/ippool_api.c
++++ ippool-1.3/ippool_api.c
+@@ -181,10 +181,13 @@ int ippool_api_rpc_check_request(SVCXPRT
  	 * non-loopback interface, reject the request.
  	 */
  	if ((!ippool_opt_remote_rpc) &&
@@ -63,210 +63,10 @@ index 2c10c47..d1127a9 100644
  		}
  		svcerr_auth(xprt, AUTH_TOOWEAK);
  		return -EPERM;
-diff --git a/net/ppp_defs.h b/net/ppp_defs.h
-new file mode 100644
-index 0000000..b06eda5
---- /dev/null
-+++ b/net/ppp_defs.h
-@@ -0,0 +1,194 @@
-+/*	$Id: ppp_defs.h,v 1.17 2002/12/06 09:49:15 paulus Exp $	*/
-+
-+/*
-+ * ppp_defs.h - PPP definitions.
-+ *
-+ * Copyright (c) 1984 Paul Mackerras. All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ *
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ *
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in
-+ *    the documentation and/or other materials provided with the
-+ *    distribution.
-+ *
-+ * 3. The name(s) of the authors of this software must not be used to
-+ *    endorse or promote products derived from this software without
-+ *    prior written permission.
-+ *
-+ * 4. Redistributions of any form whatsoever must retain the following
-+ *    acknowledgment:
-+ *    "This product includes software developed by Paul Mackerras
-+ *     <paulus@samba.org>".
-+ *
-+ * THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
-+ * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
-+ * AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
-+ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-+ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
-+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-+ */
-+
-+#ifndef _PPP_DEFS_H_
-+#define _PPP_DEFS_H_
-+
-+/*
-+ * The basic PPP frame.
-+ */
-+#define PPP_HDRLEN	4	/* octets for standard ppp header */
-+#define PPP_FCSLEN	2	/* octets for FCS */
-+
-+/*
-+ * Packet sizes
-+ *
-+ * Note - lcp shouldn't be allowed to negotiate stuff outside these
-+ *	  limits.  See lcp.h in the pppd directory.
-+ * (XXX - these constants should simply be shared by lcp.c instead
-+ *	  of living in lcp.h)
-+ */
-+#define	PPP_MTU		1500	/* Default MTU (size of Info field) */
-+#define PPP_MAXMTU	65535 - (PPP_HDRLEN + PPP_FCSLEN)
-+#define PPP_MINMTU	64
-+#define PPP_MRU		1500	/* default MRU = max length of info field */
-+#define PPP_MAXMRU	65000	/* Largest MRU we allow */
-+#define PPP_MINMRU	128
-+
-+#define PPP_ADDRESS(p)	(((u_char *)(p))[0])
-+#define PPP_CONTROL(p)	(((u_char *)(p))[1])
-+#define PPP_PROTOCOL(p)	((((u_char *)(p))[2] << 8) + ((u_char *)(p))[3])
-+
-+/*
-+ * Significant octet values.
-+ */
-+#define	PPP_ALLSTATIONS	0xff	/* All-Stations broadcast address */
-+#define	PPP_UI		0x03	/* Unnumbered Information */
-+#define	PPP_FLAG	0x7e	/* Flag Sequence */
-+#define	PPP_ESCAPE	0x7d	/* Asynchronous Control Escape */
-+#define	PPP_TRANS	0x20	/* Asynchronous transparency modifier */
-+
-+/*
-+ * Protocol field values.
-+ */
-+#define PPP_IP		0x21	/* Internet Protocol */
-+#define PPP_AT		0x29	/* AppleTalk Protocol */
-+#define PPP_IPX		0x2b	/* IPX protocol */
-+#define	PPP_VJC_COMP	0x2d	/* VJ compressed TCP */
-+#define	PPP_VJC_UNCOMP	0x2f	/* VJ uncompressed TCP */
-+#define PPP_IPV6	0x57	/* Internet Protocol Version 6 */
-+#define PPP_COMP	0xfd	/* compressed packet */
-+#define PPP_IPCP	0x8021	/* IP Control Protocol */
-+#define PPP_ATCP	0x8029	/* AppleTalk Control Protocol */
-+#define PPP_IPXCP	0x802b	/* IPX Control Protocol */
-+#define PPP_IPV6CP	0x8057	/* IPv6 Control Protocol */
-+#define PPP_CCP		0x80fd	/* Compression Control Protocol */
-+#define PPP_ECP		0x8053	/* Encryption Control Protocol */
-+#define PPP_LCP		0xc021	/* Link Control Protocol */
-+#define PPP_PAP		0xc023	/* Password Authentication Protocol */
-+#define PPP_LQR		0xc025	/* Link Quality Report protocol */
-+#define PPP_CHAP	0xc223	/* Cryptographic Handshake Auth. Protocol */
-+#define PPP_CBCP	0xc029	/* Callback Control Protocol */
-+#define PPP_EAP		0xc227	/* Extensible Authentication Protocol */
-+
-+/*
-+ * Values for FCS calculations.
-+ */
-+#define PPP_INITFCS	0xffff	/* Initial FCS value */
-+#define PPP_GOODFCS	0xf0b8	/* Good final FCS value */
-+#define PPP_FCS(fcs, c)	(((fcs) >> 8) ^ fcstab[((fcs) ^ (c)) & 0xff])
-+
-+/*
-+ * A 32-bit unsigned integral type.
-+ */
-+
-+#if !defined(__BIT_TYPES_DEFINED__) && !defined(_BITYPES) \
-+ && !defined(__FreeBSD__) && (NS_TARGET < 40)
-+#ifdef	UINT32_T
-+typedef UINT32_T	u_int32_t;
-+#else
-+typedef unsigned int	u_int32_t;
-+typedef unsigned short  u_int16_t;
-+#endif
-+#endif
-+
-+/*
-+ * Extended asyncmap - allows any character to be escaped.
-+ */
-+typedef u_int32_t	ext_accm[8];
-+
-+/*
-+ * What to do with network protocol (NP) packets.
-+ */
-+enum NPmode {
-+    NPMODE_PASS,		/* pass the packet through */
-+    NPMODE_DROP,		/* silently drop the packet */
-+    NPMODE_ERROR,		/* return an error */
-+    NPMODE_QUEUE		/* save it up for later. */
-+};
-+
-+/*
-+ * Statistics.
-+ */
-+struct pppstat	{
-+    unsigned int ppp_ibytes;	/* bytes received */
-+    unsigned int ppp_ipackets;	/* packets received */
-+    unsigned int ppp_ierrors;	/* receive errors */
-+    unsigned int ppp_obytes;	/* bytes sent */
-+    unsigned int ppp_opackets;	/* packets sent */
-+    unsigned int ppp_oerrors;	/* transmit errors */
-+};
-+
-+struct vjstat {
-+    unsigned int vjs_packets;	/* outbound packets */
-+    unsigned int vjs_compressed; /* outbound compressed packets */
-+    unsigned int vjs_searches;	/* searches for connection state */
-+    unsigned int vjs_misses;	/* times couldn't find conn. state */
-+    unsigned int vjs_uncompressedin; /* inbound uncompressed packets */
-+    unsigned int vjs_compressedin; /* inbound compressed packets */
-+    unsigned int vjs_errorin;	/* inbound unknown type packets */
-+    unsigned int vjs_tossed;	/* inbound packets tossed because of error */
-+};
-+
-+struct ppp_stats {
-+    struct pppstat p;		/* basic PPP statistics */
-+    struct vjstat vj;		/* VJ header compression statistics */
-+};
-+
-+struct compstat {
-+    unsigned int unc_bytes;	/* total uncompressed bytes */
-+    unsigned int unc_packets;	/* total uncompressed packets */
-+    unsigned int comp_bytes;	/* compressed bytes */
-+    unsigned int comp_packets;	/* compressed packets */
-+    unsigned int inc_bytes;	/* incompressible bytes */
-+    unsigned int inc_packets;	/* incompressible packets */
-+    unsigned int ratio;		/* recent compression ratio << 8 */
-+};
-+
-+struct ppp_comp_stats {
-+    struct compstat c;		/* packet compression statistics */
-+    struct compstat d;		/* packet decompression statistics */
-+};
-+
-+/*
-+ * The following structure records the time in seconds since
-+ * the last NP packet was sent or received.
-+ */
-+struct ppp_idle {
-+    time_t xmit_idle;		/* time since last NP packet sent */
-+    time_t recv_idle;		/* time since last NP packet received */
-+};
-+
-+#ifndef __P
-+#ifdef __STDC__
-+#define __P(x)	x
-+#else
-+#define __P(x)	()
-+#endif
-+#endif
-+
-+#endif /* _PPP_DEFS_H_ */
-diff --git a/usl/usl.h b/usl/usl.h
-index cdc16db..88d2714 100644
---- a/usl/usl.h
-+++ b/usl/usl.h
+Index: ippool-1.3/usl/usl.h
+===================================================================
+--- ippool-1.3.orig/usl/usl.h
++++ ippool-1.3/usl/usl.h
 @@ -38,6 +38,10 @@
  #include "usl_fsm.h"
  #include "usl_list.h"
@@ -278,6 +78,3 @@ index cdc16db..88d2714 100644
  #define USL_VERSION	"0.6"
  
  #ifdef DEBUG
--- 
-2.13.3
-
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 6e47483570..6fa46904b3 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -24,8 +24,6 @@ SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-$
            file://0001-read-returns-ssize_t.patch \
            file://0002-Mark-first-element-of-a-string-as-null.patch \
            file://0003-cli-Mark-return-of-strtol-as-long-int.patch \
-           "
-SRC_URI_append_libc-musl = "\
            file://0002-link-with-libtirpc.patch \
            file://0003-musl-fixes.patch \
            "
@@ -36,8 +34,7 @@ SRC_URI[sha256sum] = "d3eab7d6cad5da8ccc9d1e31d5303e27a39622c07bdb8fa3618eea3144
 
 inherit systemd
 
-DEPENDS = "readline ppp ncurses gzip-native"
-DEPENDS_append_libc-musl = " libtirpc"
+DEPENDS = "readline ppp ncurses gzip-native rpcsvc-proto-native libtirpc"
 RDEPENDS_${PN} = "rpcbind"
 
 EXTRA_OEMAKE = "CC='${CC}' AS='${AS}' LD='${LD}' AR='${AR}' NM='${NM}' STRIP='${STRIP}'"
@@ -45,8 +42,7 @@ EXTRA_OEMAKE += "PPPD_VERSION=${PPPD_VERSION} SYS_LIBDIR=${libdir}"
 # enable self tests
 EXTRA_OEMAKE += "IPPOOL_TEST=y"
 
-CPPFLAGS += "${SELECTED_OPTIMIZATION}"
-CPPFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+CPPFLAGS += "${SELECTED_OPTIMIZATION} -I${STAGING_INCDIR}/tirpc"
 
 SYSTEMD_SERVICE_${PN} = "ippool.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.17.0


