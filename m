Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAC3177E33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:08 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o123so18540814pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2WKoRmH6IcvjAhgf9wFxKnF1OHW2/EjOY7Z2ODWriXc=;
	b=pkAVCfEVYGg+sX/gUKnTORZUnDBxedlYyqTj0+tOJny4SLWMdPSMvOzPfmbrmtOJ9D
	9T6/BLsA4knk6vl2OMezM+PDnz5iL6yfzmD4vCimXUkoch+BWHa3nT9K2BuLXzPAYW6J
	SLAmBZV9PBmNX3Z6S5NL872r3UtKJ+bR8Ql0NNLjdfuKp+M16IbRqKnGtDsMM3UnZtei
	mnMSMXoWauB8MxPcbzCcHAJCQVnfFdO4Ul41Watlm1BlR2nB1a8ghcBHs8vfB/Yx61HM
	87fV9qANt6UBjUI+4ORBgd3AaSvX1rRH2tZGphyqnD/sWXdpC70MVxbsmJVMq1MaaUvc
	Cd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2WKoRmH6IcvjAhgf9wFxKnF1OHW2/EjOY7Z2ODWriXc=;
	b=V3GPQ14g1pf9fcnbx02XaM+2nF2Pfh8atRHAx0lKI8N+lC7KqwGUpEUEUuMCQyI1g9
	E+JJIyuTWxiEB+OXJmsw/b1ILsHR9dXjQd49lSfajfuyaslwNL5yilDLnGR+Y4AQBEzC
	MQ7SyFcBNcSMHf1Ao7nn+NLTJuN9TeYsw4Tt/C70hcB5BRdxOsXUvl+oHGuKf9UVusez
	TrjEWCSNlsqAJzLHx3qufDvUbjby4oeuJz8n3a+RaTSgXFc5KrLSl17e7mdQbI+jck+r
	Ubr80FoOAG37lN5gFomSBCgF45UnlcjK2RP+IC2PkucuXzLtqqKXsB9d/N8EmTEO9VzD
	sCCQ==
X-Gm-Message-State: AFeK/H1pq3hqv2hZjK9c0S4dFk/tuRlv7TCyub723QAKwADcCiaHoDfAnGYGOwax0/0LzA==
X-Received: by 10.99.137.66 with SMTP id v63mr4169339pgd.183.1490978590296;
	Fri, 31 Mar 2017 09:43:10 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:15 -0700
Message-Id: <20170331164247.5052-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/43] libnfnetlink: Backport patches to fix musl build
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:09 -0000

There are few upstream patches that are required for getting it
working with musl, backport these patches on top of 1.0.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-build-resolve-automake-1.12-warnings.patch |  28 ++
 ...rce-code-license-header-in-sync-with-curr.patch |  49 +++
 .../0003-configure-uclinux-is-also-linux.patch     |  27 ++
 ...k-initialize-attribute-padding-to-resolve.patch |  39 ++
 .../0005-include-Sync-with-kernel-headers.patch    | 110 ++++++
 .../0006-src-Use-stdint-types-everywhere.patch     | 403 +++++++++++++++++++++
 .../libnfnetlink/libnfnetlink_1.0.1.bb             |   9 +-
 7 files changed, 664 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0001-build-resolve-automake-1.12-warnings.patch
 create mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0002-src-get-source-code-license-header-in-sync-with-curr.patch
 create mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0003-configure-uclinux-is-also-linux.patch
 create mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch
 create mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0005-include-Sync-with-kernel-headers.patch
 create mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0006-src-Use-stdint-types-everywhere.patch

diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0001-build-resolve-automake-1.12-warnings.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0001-build-resolve-automake-1.12-warnings.patch
new file mode 100644
index 000000000..00d95cd79
--- /dev/null
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0001-build-resolve-automake-1.12-warnings.patch
@@ -0,0 +1,28 @@
+From 2e5f2b81fb8cbe0d1cd33e58caa19ac308e1f847 Mon Sep 17 00:00:00 2001
+From: Jan Engelhardt <jengelh@inai.de>
+Date: Tue, 9 Oct 2012 15:59:48 +0200
+Subject: [PATCH 1/6] build: resolve automake-1.12 warnings
+
+am/ltlibrary.am: warning: 'libnfnetlink.la': linking libtool libraries
+using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-off-by: Jan Engelhardt <jengelh@inai.de>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index ed549df..0926a1c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -7,6 +7,7 @@ AC_CANONICAL_HOST
+ 
+ AM_INIT_AUTOMAKE([-Wall foreign subdir-objects
+ 	tar-pax no-dist-gzip dist-bzip2 1.6])
++m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ 
+ dnl kernel style compile messages
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0002-src-get-source-code-license-header-in-sync-with-curr.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0002-src-get-source-code-license-header-in-sync-with-curr.patch
new file mode 100644
index 000000000..c2fb5e05a
--- /dev/null
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0002-src-get-source-code-license-header-in-sync-with-curr.patch
@@ -0,0 +1,49 @@
+From 5e6b6e23a8b04475c5a9de7eddb4c18103932fe5 Mon Sep 17 00:00:00 2001
+From: Pablo Neira Ayuso <pablo@netfilter.org>
+Date: Wed, 7 Aug 2013 20:53:57 +0200
+Subject: [PATCH 2/6] src: get source code license header in sync with current
+ licensing terms
+
+Since (3956761 license: upgrade to GPLv2+), we upgraded to GPLv2+,
+propagate that changes to src/iftable.c and src/rtnl.c
+
+Reported-by: Thomas Woerner <twoerner@redhat.com>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ src/iftable.c | 2 +-
+ src/rtnl.c    | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/iftable.c b/src/iftable.c
+index 0325335..5976ed8 100644
+--- a/src/iftable.c
++++ b/src/iftable.c
+@@ -3,7 +3,7 @@
+  * (C) 2004 by Astaro AG, written by Harald Welte <hwelte@astaro.com>
+  * (C) 2008 by Pablo Neira Ayuso <pablo@netfilter.org>
+  *
+- * This software is Free Software and licensed under GNU GPLv2. 
++ * This software is Free Software and licensed under GNU GPLv2+.
+  */
+ 
+ /* IFINDEX handling */
+diff --git a/src/rtnl.c b/src/rtnl.c
+index 5ccb272..7b4ac7d 100644
+--- a/src/rtnl.c
++++ b/src/rtnl.c
+@@ -1,10 +1,10 @@
+ /* rtnl - rtnetlink utility functions
+  *
+  * (C) 2004 by Astaro AG, written by Harald Welte <hwelte@astaro.com>
+- * 
++ *
+  * Adapted to nfnetlink by Eric Leblond <eric@inl.fr>
+  *
+- * This software is free software and licensed under GNU GPLv2. 
++ * This software is free software and licensed under GNU GPLv2+.
+  *
+  */
+ 
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0003-configure-uclinux-is-also-linux.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0003-configure-uclinux-is-also-linux.patch
new file mode 100644
index 000000000..6cb7ed6fa
--- /dev/null
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0003-configure-uclinux-is-also-linux.patch
@@ -0,0 +1,27 @@
+From b259fe13826414c1bd5328a25c8d6d60e20e65f2 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Sep 2013 16:23:29 -0300
+Subject: [PATCH 3/6] configure: uclinux is also linux
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0926a1c..b979772 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,7 +18,7 @@ AC_DISABLE_STATIC
+ AM_PROG_LIBTOOL
+ 
+ case "$host" in 
+-*-*-linux*) ;;
++*-*-linux* | *-*-uclinux*) ;;
+ *) AC_MSG_ERROR([Linux only, dude!]);;
+ esac
+ 
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch
new file mode 100644
index 000000000..cf3a84135
--- /dev/null
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch
@@ -0,0 +1,39 @@
+From b142da8d2c9e2e2dfbe4e89e680dd124f6064ac8 Mon Sep 17 00:00:00 2001
+From: Pablo Neira Ayuso <pablo@netfilter.org>
+Date: Mon, 3 Feb 2014 12:09:29 +0100
+Subject: [PATCH 4/6] libnfnetlink: initialize attribute padding to resolve
+ valgrind warnings
+
+==12195== Syscall param socketcall.sendto(msg) points to uninitialised byte(s)
+==12195==    at 0x51209C3: __sendto_nocancel (syscall-template.S:81)
+==12195==    by 0x53E4D12: nfnl_send (libnfnetlink.c:391)
+==12195==    by 0x53E6952: nfnl_query (libnfnetlink.c:1569)
+==12195==    by 0x4E344AF: __build_send_cfg_msg.isra.1 (libnetfilter_log.c:143)
+==12195==    by 0x4E34710: nflog_bind_group (libnetfilter_log.c:413)
+==12195==    by 0x400CB1: main (nfulnl_test.c:77)
+==12195==  Address 0x7fefff3e9 is on thread 1's stack
+
+This patch sets to zero the padding that is included to align the
+attribute payload.
+
+Reported-by: Ivan Homoliak <xhomol11@gmail.com>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ src/libnfnetlink.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libnfnetlink.c b/src/libnfnetlink.c
+index 4b2bcd0..398b7d7 100644
+--- a/src/libnfnetlink.c
++++ b/src/libnfnetlink.c
+@@ -809,6 +809,7 @@ int nfnl_addattr_l(struct nlmsghdr *n, int maxlen, int type, const void *data,
+ 	nfa->nfa_type = type;
+ 	nfa->nfa_len = len;
+ 	memcpy(NFA_DATA(nfa), data, alen);
++	memset((uint8_t *)nfa + nfa->nfa_len, 0, NFA_ALIGN(alen) - alen);
+ 	n->nlmsg_len = (NLMSG_ALIGN(n->nlmsg_len) + NFA_ALIGN(len));
+ 	return 0;
+ }
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0005-include-Sync-with-kernel-headers.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0005-include-Sync-with-kernel-headers.patch
new file mode 100644
index 000000000..383f0e8b3
--- /dev/null
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0005-include-Sync-with-kernel-headers.patch
@@ -0,0 +1,110 @@
+From b10c90a61a5fc46f2be5aeecb9c96e84178f7717 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 14:49:07 +0200
+Subject: [PATCH 5/6] include: Sync with kernel headers
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ include/libnfnetlink/linux_nfnetlink.h        | 44 ++++-----------------------
+ include/libnfnetlink/linux_nfnetlink_compat.h | 12 ++++----
+ 2 files changed, 12 insertions(+), 44 deletions(-)
+
+diff --git a/include/libnfnetlink/linux_nfnetlink.h b/include/libnfnetlink/linux_nfnetlink.h
+index 76a8550..44a38d6 100644
+--- a/include/libnfnetlink/linux_nfnetlink.h
++++ b/include/libnfnetlink/linux_nfnetlink.h
+@@ -25,9 +25,9 @@ enum nfnetlink_groups {
+ /* General form of address family dependent message.
+  */
+ struct nfgenmsg {
+-	u_int8_t  nfgen_family;		/* AF_xxx */
+-	u_int8_t  version;		/* nfnetlink version */
+-	u_int16_t    res_id;		/* resource id */
++	__u8  nfgen_family;		/* AF_xxx */
++	__u8  version;		/* nfnetlink version */
++	__be16    res_id;		/* resource id */
+ };
+ 
+ #define NFNETLINK_V0	0
+@@ -46,40 +46,8 @@ struct nfgenmsg {
+ #define NFNL_SUBSYS_CTNETLINK_EXP	2
+ #define NFNL_SUBSYS_QUEUE		3
+ #define NFNL_SUBSYS_ULOG		4
+-#define NFNL_SUBSYS_COUNT		5
++#define NFNL_SUBSYS_OSF			5
++#define NFNL_SUBSYS_IPSET		6
++#define NFNL_SUBSYS_COUNT		7
+ 
+-#ifdef __KERNEL__
+-
+-#include <linux/netlink.h>
+-#include <linux/capability.h>
+-#include <net/netlink.h>
+-
+-struct nfnl_callback
+-{
+-	int (*call)(struct sock *nl, struct sk_buff *skb, 
+-		struct nlmsghdr *nlh, struct nlattr *cda[]);
+-	const struct nla_policy *policy;	/* netlink attribute policy */
+-	const u_int16_t attr_count;		/* number of nlattr's */
+-};
+-
+-struct nfnetlink_subsystem
+-{
+-	const char *name;
+-	__u8 subsys_id;			/* nfnetlink subsystem ID */
+-	__u8 cb_count;			/* number of callbacks */
+-	const struct nfnl_callback *cb;	/* callback for individual types */
+-};
+-
+-extern int nfnetlink_subsys_register(const struct nfnetlink_subsystem *n);
+-extern int nfnetlink_subsys_unregister(const struct nfnetlink_subsystem *n);
+-
+-extern int nfnetlink_has_listeners(unsigned int group);
+-extern int nfnetlink_send(struct sk_buff *skb, u32 pid, unsigned group, 
+-			  int echo);
+-extern int nfnetlink_unicast(struct sk_buff *skb, u_int32_t pid, int flags);
+-
+-#define MODULE_ALIAS_NFNL_SUBSYS(subsys) \
+-	MODULE_ALIAS("nfnetlink-subsys-" __stringify(subsys))
+-
+-#endif	/* __KERNEL__ */
+ #endif	/* _NFNETLINK_H */
+diff --git a/include/libnfnetlink/linux_nfnetlink_compat.h b/include/libnfnetlink/linux_nfnetlink_compat.h
+index e145176..74b9e55 100644
+--- a/include/libnfnetlink/linux_nfnetlink_compat.h
++++ b/include/libnfnetlink/linux_nfnetlink_compat.h
+@@ -1,6 +1,8 @@
+ #ifndef _NFNETLINK_COMPAT_H
+ #define _NFNETLINK_COMPAT_H
+-#ifndef __KERNEL__
++
++#include <linux/types.h>
++
+ /* Old nfnetlink macros for userspace */
+ 
+ /* nfnetlink groups: Up to 32 maximum */
+@@ -18,10 +20,9 @@
+  * ! nfnetlink use the same attributes methods. - J. Schulist.
+  */
+ 
+-struct nfattr
+-{
+-	u_int16_t nfa_len;
+-	u_int16_t nfa_type;	/* we use 15 bits for the type, and the highest
++struct nfattr {
++	__u16 nfa_len;
++	__u16 nfa_type;	/* we use 15 bits for the type, and the highest
+ 				 * bit to indicate whether the payload is nested */
+ };
+ 
+@@ -57,5 +58,4 @@ struct nfattr
+         + NLMSG_ALIGN(sizeof(struct nfgenmsg))))
+ #define NFM_PAYLOAD(n)  NLMSG_PAYLOAD(n, sizeof(struct nfgenmsg))
+ 
+-#endif /* ! __KERNEL__ */
+ #endif /* _NFNETLINK_COMPAT_H */
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0006-src-Use-stdint-types-everywhere.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0006-src-Use-stdint-types-everywhere.patch
new file mode 100644
index 000000000..72c9987d1
--- /dev/null
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0006-src-Use-stdint-types-everywhere.patch
@@ -0,0 +1,403 @@
+From 5cb589e246c91331ee6b3926b15f5e6cfc8ad95e Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 14:59:57 +0200
+Subject: [PATCH 6/6] src: Use stdint types everywhere
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ include/libnfnetlink/libnfnetlink.h | 25 ++++++-------
+ src/iftable.c                       |  8 ++---
+ src/iftable.h                       |  4 +--
+ src/libnfnetlink.c                  | 72 ++++++++++++++++++-------------------
+ src/rtnl.c                          |  4 +--
+ src/rtnl.h                          |  2 +-
+ 6 files changed, 58 insertions(+), 57 deletions(-)
+
+diff --git a/include/libnfnetlink/libnfnetlink.h b/include/libnfnetlink/libnfnetlink.h
+index 1d8c49d..cd0be3d 100644
+--- a/include/libnfnetlink/libnfnetlink.h
++++ b/include/libnfnetlink/libnfnetlink.h
+@@ -15,6 +15,7 @@
+ #define aligned_u64 unsigned long long __attribute__((aligned(8)))
+ #endif
+ 
++#include <stdint.h>
+ #include <sys/socket.h>	/* for sa_family_t */
+ #include <linux/netlink.h>
+ #include <libnfnetlink/linux_nfnetlink.h>
+@@ -55,7 +56,7 @@ struct nfnlhdr {
+ struct nfnl_callback {
+ 	int (*call)(struct nlmsghdr *nlh, struct nfattr *nfa[], void *data);
+ 	void *data;
+-	u_int16_t attr_count;
++	uint16_t attr_count;
+ };
+ 
+ struct nfnl_handle;
+@@ -69,7 +70,7 @@ extern struct nfnl_handle *nfnl_open(void);
+ extern int nfnl_close(struct nfnl_handle *);
+ 
+ extern struct nfnl_subsys_handle *nfnl_subsys_open(struct nfnl_handle *, 
+-						   u_int8_t, u_int8_t, 
++						   uint8_t, uint8_t,
+ 						   unsigned int);
+ extern void nfnl_subsys_close(struct nfnl_subsys_handle *);
+ 
+@@ -88,8 +89,8 @@ extern int nfnl_sendiov(const struct nfnl_handle *nfnlh,
+ 			const struct iovec *iov, unsigned int num,
+ 			unsigned int flags);
+ extern void nfnl_fill_hdr(struct nfnl_subsys_handle *, struct nlmsghdr *,
+-			  unsigned int, u_int8_t, u_int16_t, u_int16_t,
+-			  u_int16_t);
++			  unsigned int, uint8_t, uint16_t, uint16_t,
++			  uint16_t);
+ extern __attribute__((deprecated)) int
+ nfnl_talk(struct nfnl_handle *, struct nlmsghdr *, pid_t,
+           unsigned, struct nlmsghdr *,
+@@ -103,8 +104,8 @@ nfnl_listen(struct nfnl_handle *,
+ /* receiving */
+ extern ssize_t nfnl_recv(const struct nfnl_handle *h, unsigned char *buf, size_t len);
+ extern int nfnl_callback_register(struct nfnl_subsys_handle *,
+-				  u_int8_t type, struct nfnl_callback *cb);
+-extern int nfnl_callback_unregister(struct nfnl_subsys_handle *, u_int8_t type);
++				  uint8_t type, struct nfnl_callback *cb);
++extern int nfnl_callback_unregister(struct nfnl_subsys_handle *, uint8_t type);
+ extern int nfnl_handle_packet(struct nfnl_handle *, char *buf, int len);
+ 
+ /* parsing */
+@@ -180,12 +181,12 @@ extern int nfnl_query(struct nfnl_handle *h, struct nlmsghdr *nlh);
+ 
+ /* nfnl attribute handling functions */
+ extern int nfnl_addattr_l(struct nlmsghdr *, int, int, const void *, int);
+-extern int nfnl_addattr8(struct nlmsghdr *, int, int, u_int8_t);
+-extern int nfnl_addattr16(struct nlmsghdr *, int, int, u_int16_t);
+-extern int nfnl_addattr32(struct nlmsghdr *, int, int, u_int32_t);
++extern int nfnl_addattr8(struct nlmsghdr *, int, int, uint8_t);
++extern int nfnl_addattr16(struct nlmsghdr *, int, int, uint16_t);
++extern int nfnl_addattr32(struct nlmsghdr *, int, int, uint32_t);
+ extern int nfnl_nfa_addattr_l(struct nfattr *, int, int, const void *, int);
+-extern int nfnl_nfa_addattr16(struct nfattr *, int, int, u_int16_t);
+-extern int nfnl_nfa_addattr32(struct nfattr *, int, int, u_int32_t);
++extern int nfnl_nfa_addattr16(struct nfattr *, int, int, uint16_t);
++extern int nfnl_nfa_addattr32(struct nfattr *, int, int, uint32_t);
+ extern int nfnl_parse_attr(struct nfattr **, int, struct nfattr *, int);
+ #define nfnl_parse_nested(tb, max, nfa) \
+ 	nfnl_parse_attr((tb), (max), NFA_DATA((nfa)), NFA_PAYLOAD((nfa)))
+@@ -197,7 +198,7 @@ extern int nfnl_parse_attr(struct nfattr **, int, struct nfattr *, int);
+ ({	(tail)->nfa_len = (void *) NLMSG_TAIL(nlh) - (void *) tail; })
+ 
+ extern void nfnl_build_nfa_iovec(struct iovec *iov, struct nfattr *nfa, 
+-				 u_int16_t type, u_int32_t len,
++				 uint16_t type, uint32_t len,
+ 				 unsigned char *val);
+ extern unsigned int nfnl_rcvbufsiz(const struct nfnl_handle *h, 
+ 				   unsigned int size);
+diff --git a/src/iftable.c b/src/iftable.c
+index 5976ed8..157f97b 100644
+--- a/src/iftable.c
++++ b/src/iftable.c
+@@ -27,10 +27,10 @@
+ struct ifindex_node {
+ 	struct list_head head;
+ 
+-	u_int32_t	index;
+-	u_int32_t	type;
+-	u_int32_t	alen;
+-	u_int32_t	flags;
++	uint32_t	index;
++	uint32_t	type;
++	uint32_t	alen;
++	uint32_t	flags;
+ 	char		addr[8];
+ 	char		name[16];
+ };
+diff --git a/src/iftable.h b/src/iftable.h
+index 8df7f24..655df6b 100644
+--- a/src/iftable.h
++++ b/src/iftable.h
+@@ -1,8 +1,8 @@
+ #ifndef _IFTABLE_H
+ #define _IFTABLE_H
+ 
+-int iftable_delete(u_int32_t dst, u_int32_t mask, u_int32_t gw, u_int32_t oif);
+-int iftable_insert(u_int32_t dst, u_int32_t mask, u_int32_t gw, u_int32_t oif);
++int iftable_delete(uint32_t dst, uint32_t mask, uint32_t gw, uint32_t oif);
++int iftable_insert(uint32_t dst, uint32_t mask, uint32_t gw, uint32_t oif);
+ 
+ int iftable_init(void);
+ void iftable_fini(void);
+diff --git a/src/libnfnetlink.c b/src/libnfnetlink.c
+index 398b7d7..df57533 100644
+--- a/src/libnfnetlink.c
++++ b/src/libnfnetlink.c
+@@ -72,9 +72,9 @@
+ 
+ struct nfnl_subsys_handle {
+ 	struct nfnl_handle 	*nfnlh;
+-	u_int32_t		subscriptions;
+-	u_int8_t		subsys_id;
+-	u_int8_t		cb_count;
++	uint32_t		subscriptions;
++	uint8_t			subsys_id;
++	uint8_t			cb_count;
+ 	struct nfnl_callback 	*cb;	/* array of callbacks */
+ };
+ 
+@@ -86,11 +86,11 @@ struct nfnl_handle {
+ 	int			fd;
+ 	struct sockaddr_nl	local;
+ 	struct sockaddr_nl	peer;
+-	u_int32_t		subscriptions;
+-	u_int32_t		seq;
+-	u_int32_t		dump;
+-	u_int32_t		rcv_buffer_size;	/* for nfnl_catch */
+-	u_int32_t		flags;
++	uint32_t		subscriptions;
++	uint32_t		seq;
++	uint32_t		dump;
++	uint32_t		rcv_buffer_size;	/* for nfnl_catch */
++	uint32_t		flags;
+ 	struct nlmsghdr 	*last_nlhdr;
+ 	struct nfnl_subsys_handle subsys[NFNL_MAX_SUBSYS+1];
+ };
+@@ -145,7 +145,7 @@ unsigned int nfnl_portid(const struct nfnl_handle *h)
+ static int recalc_rebind_subscriptions(struct nfnl_handle *nfnlh)
+ {
+ 	int i, err;
+-	u_int32_t new_subscriptions = nfnlh->subscriptions;
++	uint32_t new_subscriptions = nfnlh->subscriptions;
+ 
+ 	for (i = 0; i < NFNL_MAX_SUBSYS; i++)
+ 		new_subscriptions |= nfnlh->subsys[i].subscriptions;
+@@ -273,8 +273,8 @@ void nfnl_set_rcv_buffer_size(struct nfnl_handle *h, unsigned int size)
+  * a valid address that points to a nfnl_subsys_handle structure is returned.
+  */
+ struct nfnl_subsys_handle *
+-nfnl_subsys_open(struct nfnl_handle *nfnlh, u_int8_t subsys_id,
+-		 u_int8_t cb_count, u_int32_t subscriptions)
++nfnl_subsys_open(struct nfnl_handle *nfnlh, uint8_t subsys_id,
++		 uint8_t cb_count, uint32_t subscriptions)
+ {
+ 	struct nfnl_subsys_handle *ssh;
+ 
+@@ -435,10 +435,10 @@ int nfnl_sendiov(const struct nfnl_handle *nfnlh, const struct iovec *iov,
+  */
+ void nfnl_fill_hdr(struct nfnl_subsys_handle *ssh,
+ 		    struct nlmsghdr *nlh, unsigned int len, 
+-		    u_int8_t family,
+-		    u_int16_t res_id,
+-		    u_int16_t msg_type,
+-		    u_int16_t msg_flags)
++		    uint8_t family,
++		    uint16_t res_id,
++		    uint16_t msg_type,
++		    uint16_t msg_flags)
+ {
+ 	assert(ssh);
+ 	assert(nlh);
+@@ -815,7 +815,7 @@ int nfnl_addattr_l(struct nlmsghdr *n, int maxlen, int type, const void *data,
+ }
+ 
+ /**
+- * nfnl_nfa_addattr_l - Add variable length attribute to struct nfattr 
++ * nfnl_nfa_addattr_l - Add variable length attribute to struct nfattr
+  *
+  * @nfa: struct nfattr
+  * @maxlen: maximal length of nfattr buffer
+@@ -849,14 +849,14 @@ int nfnl_nfa_addattr_l(struct nfattr *nfa, int maxlen, int type,
+ }
+ 
+ /**
+- * nfnl_addattr8 - Add u_int8_t attribute to nlmsghdr
++ * nfnl_addattr8 - Add uint8_t attribute to nlmsghdr
+  *
+  * @n: netlink message header to which attribute is to be added
+  * @maxlen: maximum length of netlink message header
+  * @type: type of new attribute
+  * @data: content of new attribute
+  */
+-int nfnl_addattr8(struct nlmsghdr *n, int maxlen, int type, u_int8_t data)
++int nfnl_addattr8(struct nlmsghdr *n, int maxlen, int type, uint8_t data)
+ {
+ 	assert(n);
+ 	assert(maxlen > 0);
+@@ -866,7 +866,7 @@ int nfnl_addattr8(struct nlmsghdr *n, int maxlen, int type, u_int8_t data)
+ }
+ 
+ /**
+- * nfnl_nfa_addattr16 - Add u_int16_t attribute to struct nfattr 
++ * nfnl_nfa_addattr16 - Add uint16_t attribute to struct nfattr
+  *
+  * @nfa: struct nfattr
+  * @maxlen: maximal length of nfattr buffer
+@@ -875,7 +875,7 @@ int nfnl_addattr8(struct nlmsghdr *n, int maxlen, int type, u_int8_t data)
+  *
+  */
+ int nfnl_nfa_addattr16(struct nfattr *nfa, int maxlen, int type, 
+-		       u_int16_t data)
++		       uint16_t data)
+ {
+ 	assert(nfa);
+ 	assert(maxlen > 0);
+@@ -885,7 +885,7 @@ int nfnl_nfa_addattr16(struct nfattr *nfa, int maxlen, int type,
+ }
+ 
+ /**
+- * nfnl_addattr16 - Add u_int16_t attribute to nlmsghdr
++ * nfnl_addattr16 - Add uint16_t attribute to nlmsghdr
+  *
+  * @n: netlink message header to which attribute is to be added
+  * @maxlen: maximum length of netlink message header
+@@ -894,7 +894,7 @@ int nfnl_nfa_addattr16(struct nfattr *nfa, int maxlen, int type,
+  *
+  */
+ int nfnl_addattr16(struct nlmsghdr *n, int maxlen, int type,
+-		   u_int16_t data)
++		   uint16_t data)
+ {
+ 	assert(n);
+ 	assert(maxlen > 0);
+@@ -904,7 +904,7 @@ int nfnl_addattr16(struct nlmsghdr *n, int maxlen, int type,
+ }
+ 
+ /**
+- * nfnl_nfa_addattr32 - Add u_int32_t attribute to struct nfattr 
++ * nfnl_nfa_addattr32 - Add uint32_t attribute to struct nfattr
+  *
+  * @nfa: struct nfattr
+  * @maxlen: maximal length of nfattr buffer
+@@ -913,7 +913,7 @@ int nfnl_addattr16(struct nlmsghdr *n, int maxlen, int type,
+  *
+  */
+ int nfnl_nfa_addattr32(struct nfattr *nfa, int maxlen, int type, 
+-		       u_int32_t data)
++		       uint32_t data)
+ {
+ 	assert(nfa);
+ 	assert(maxlen > 0);
+@@ -923,7 +923,7 @@ int nfnl_nfa_addattr32(struct nfattr *nfa, int maxlen, int type,
+ }
+ 
+ /**
+- * nfnl_addattr32 - Add u_int32_t attribute to nlmsghdr
++ * nfnl_addattr32 - Add uint32_t attribute to nlmsghdr
+  *
+  * @n: netlink message header to which attribute is to be added
+  * @maxlen: maximum length of netlink message header
+@@ -932,7 +932,7 @@ int nfnl_nfa_addattr32(struct nfattr *nfa, int maxlen, int type,
+  *
+  */
+ int nfnl_addattr32(struct nlmsghdr *n, int maxlen, int type,
+-		   u_int32_t data)
++		   uint32_t data)
+ {
+ 	assert(n);
+ 	assert(maxlen > 0);
+@@ -980,7 +980,7 @@ int nfnl_parse_attr(struct nfattr *tb[], int max, struct nfattr *nfa, int len)
+  *
+  */ 
+ void nfnl_build_nfa_iovec(struct iovec *iov, struct nfattr *nfa, 
+-			  u_int16_t type, u_int32_t len, unsigned char *val)
++			  uint16_t type, uint32_t len, unsigned char *val)
+ {
+ 	assert(iov);
+ 	assert(nfa);
+@@ -1115,7 +1115,7 @@ struct nlmsghdr *nfnl_get_msg_next(struct nfnl_handle *h,
+  * appropiately.
+  */
+ int nfnl_callback_register(struct nfnl_subsys_handle *ssh,
+-			   u_int8_t type, struct nfnl_callback *cb)
++			   uint8_t type, struct nfnl_callback *cb)
+ {
+ 	assert(ssh);
+ 	assert(cb);
+@@ -1138,7 +1138,7 @@ int nfnl_callback_register(struct nfnl_subsys_handle *ssh,
+  * On sucess, 0 is returned. On error, -1 is returned and errno is
+  * set appropiately.
+  */
+-int nfnl_callback_unregister(struct nfnl_subsys_handle *ssh, u_int8_t type)
++int nfnl_callback_unregister(struct nfnl_subsys_handle *ssh, uint8_t type)
+ {
+ 	assert(ssh);
+ 
+@@ -1161,8 +1161,8 @@ int nfnl_check_attributes(const struct nfnl_handle *h,
+ 	assert(nfa);
+ 
+ 	int min_len;
+-	u_int8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
+-	u_int8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
++	uint8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
++	uint8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
+ 	const struct nfnl_subsys_handle *ssh;
+ 	struct nfnl_callback *cb;
+ 
+@@ -1212,8 +1212,8 @@ static int __nfnl_handle_msg(struct nfnl_handle *h, struct nlmsghdr *nlh,
+ 			     int len)
+ {
+ 	struct nfnl_subsys_handle *ssh;
+-	u_int8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
+-	u_int8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
++	uint8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
++	uint8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
+ 	int err = 0;
+ 
+ 	if (subsys_id > NFNL_MAX_SUBSYS)
+@@ -1243,7 +1243,7 @@ int nfnl_handle_packet(struct nfnl_handle *h, char *buf, int len)
+ {
+ 
+ 	while (len >= NLMSG_SPACE(0)) {
+-		u_int32_t rlen;
++		uint32_t rlen;
+ 		struct nlmsghdr *nlh = (struct nlmsghdr *)buf;
+ 
+ 		if (nlh->nlmsg_len < sizeof(struct nlmsghdr)
+@@ -1285,8 +1285,8 @@ static int nfnl_is_error(struct nfnl_handle *h, struct nlmsghdr *nlh)
+ static int nfnl_step(struct nfnl_handle *h, struct nlmsghdr *nlh)
+ {
+ 	struct nfnl_subsys_handle *ssh;
+-	u_int8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
+-	u_int8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
++	uint8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
++	uint8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
+ 
+ 	/* Is this an error message? */
+ 	if (nfnl_is_error(h, nlh)) {
+diff --git a/src/rtnl.c b/src/rtnl.c
+index 7b4ac7d..284eecd 100644
+--- a/src/rtnl.c
++++ b/src/rtnl.c
+@@ -30,7 +30,7 @@
+ #define rtnl_log(x, ...)
+ 
+ static inline struct rtnl_handler *
+-find_handler(struct rtnl_handle *rtnl_handle, u_int16_t type)
++find_handler(struct rtnl_handle *rtnl_handle, uint16_t type)
+ {
+ 	struct rtnl_handler *h;
+ 	for (h = rtnl_handle->handlers; h; h = h->next) {
+@@ -41,7 +41,7 @@ find_handler(struct rtnl_handle *rtnl_handle, u_int16_t type)
+ }
+ 
+ static int call_handler(struct rtnl_handle *rtnl_handle,
+-			u_int16_t type,
++			uint16_t type,
+ 			struct nlmsghdr *hdr)
+ {
+ 	struct rtnl_handler *h = find_handler(rtnl_handle, type);
+diff --git a/src/rtnl.h b/src/rtnl.h
+index 0c403dc..2cb22a8 100644
+--- a/src/rtnl.h
++++ b/src/rtnl.h
+@@ -7,7 +7,7 @@
+ struct rtnl_handler {
+ 	struct rtnl_handler *next;
+ 
+-	u_int16_t	nlmsg_type;
++	uint16_t	nlmsg_type;
+ 	int		(*handlefn)(struct nlmsghdr *h, void *arg);
+ 	void		*arg;
+ };
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
index edd0f866f..f7951ff8d 100644
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
@@ -11,7 +11,14 @@ LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=tar"
+SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=tar \
+           file://0001-build-resolve-automake-1.12-warnings.patch \
+           file://0002-src-get-source-code-license-header-in-sync-with-curr.patch \
+           file://0003-configure-uclinux-is-also-linux.patch \
+           file://0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch \
+           file://0005-include-Sync-with-kernel-headers.patch \
+           file://0006-src-Use-stdint-types-everywhere.patch \
+           "
 SRC_URI[tar.md5sum] = "98927583d2016a9fb1936fed992e2c5e"
 SRC_URI[tar.sha256sum] = "f270e19de9127642d2a11589ef2ec97ef90a649a74f56cf9a96306b04817b51a"
 
-- 
2.12.1


