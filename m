Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2812C71BEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:02 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c198so144358pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MWQoaHMCX4IO46V4Cvp1F4sEuy7wrLw5/ViOA/QEVbQ=;
	b=OgHnV/gcyNQrA9Hd4c9pRCm9q97XE3joKWM/dmWr1u/HyzHVHMWzYeJAMgdfXSgSrk
	gL6vBiNrPt+9M02YwFDoD1G1VSPordN/tnko7NF4Q7qf2+TKNeimyM2GbKs0s+OjFMvE
	08cpPrlNZ208fa1V265tNhkpQDPGbg5XnNgph3ZbAO2gCJBP7IsNs5zAd8pu1PZZ8UNy
	WlB0FAm8ZedI6Im43Ejz2YTlvUGjvosHWWvuj/Kv3xTIB1wL8QPImHWvv56IybhCUNRG
	LsZW1Td8imN43wgzPi+A9sBgzFk23YlyOPkctHzuZqXqAelpYBRHoPS3vzJHv89vfZga
	pvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MWQoaHMCX4IO46V4Cvp1F4sEuy7wrLw5/ViOA/QEVbQ=;
	b=ty3886jyQNlzlbwAXpZQU8cDfb2BN+5GidV4Bo6emnDURcLxLbHOJ4mCcyWynGiUAK
	gDJS8IkOTg09rcLnOb2uMBxtCkyvV9fPyP7sO7wNKjwOEmI3aI7OXG/LZHyihio6wRCp
	AB/N+fWraoESXsOxMvOJrJ7vBhQYgEu+ydrguuhL7tOk9CACiBWL6Pg/0pGU73yYIqgC
	q8Ueyehgtx0hByczRm7o+jMJnXXr3PX0Pel6ALehXl+/n5Pis4r8CSLb6eweIeUgOAOX
	sekrRRK8Gt1mLLboUX2T2I8wPi64UZAslpE1rv0yhCrbdgZykbn8kaLvwYipNxTBHyCx
	hzcw==
X-Gm-Message-State: AN3rC/4hBq6XknsOLaATyI6XvJPRIfa47M49vfKGeM+L0a9C9Zk1uUHA
	vmRiHwL/xQQBmw==
X-Received: by 10.99.54.72 with SMTP id d69mr19305503pga.24.1492539723810;
	Tue, 18 Apr 2017 11:22:03 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:18 -0700
Message-Id: <20170418182142.27253-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-networking][ 08/32] libnetfilter-cthelper, libnetfilter-cttimeout: Backport patches to fix symbol visibility
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:03 -0000

These are needed for building it with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libnetfilter-cthelper-visibility-hidden.patch  | 385 +++++++++++++++++++++
 .../libnetfilter-cttimeout-visibility-hidden.patch | 264 ++++++++++++++
 .../libnetfilter/libnetfilter-cthelper_1.0.0.bb    |   4 +-
 .../libnetfilter/libnetfilter-cttimeout_1.0.0.bb   |   4 +-
 4 files changed, 655 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
 create mode 100644 meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cttimeout-visibility-hidden.patch

diff --git a/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch b/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
new file mode 100644
index 000000000..9377f57cb
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cthelper-visibility-hidden.patch
@@ -0,0 +1,385 @@
+From f58c5b09fb59baf07c942d373fc4d522b27e73c6 Mon Sep 17 00:00:00 2001
+From: Kevin Cernekee <cernekee@chromium.org>
+Date: Wed, 4 Jan 2017 14:30:26 -0800
+Subject: Use __EXPORTED rather than EXPORT_SYMBOL
+
+clang is sensitive to the ordering of
+__attribute__((visibility("default"))) relative to the function
+body.  gcc is not.  So if we try to re-declare an existing function
+with default visibility, clang prints a warning and generates
+a broken .so file in which nfct_helper_* are not exported to library
+callers.
+
+Move the attribute up into the function definition to make clang happy.
+
+Signed-off-by: Kevin Cernekee <cernekee@chromium.org>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ doxygen.cfg.in              |  2 +-
+ src/internal.h              |  5 ++-
+ src/libnetfilter_cthelper.c | 83 ++++++++++++++++++---------------------------
+ 3 files changed, 36 insertions(+), 54 deletions(-)
+
+diff --git a/doxygen.cfg.in b/doxygen.cfg.in
+index cac9b05..190b7cd 100644
+--- a/doxygen.cfg.in
++++ b/doxygen.cfg.in
+@@ -72,7 +72,7 @@ RECURSIVE              = YES
+ EXCLUDE                = 
+ EXCLUDE_SYMLINKS       = NO
+ EXCLUDE_PATTERNS       = */.git/* .*.d
+-EXCLUDE_SYMBOLS        = EXPORT_SYMBOL
++EXCLUDE_SYMBOLS        = 
+ EXAMPLE_PATH           = 
+ EXAMPLE_PATTERNS       = 
+ EXAMPLE_RECURSIVE      = NO
+diff --git a/src/internal.h b/src/internal.h
+index 3a88d1a..5d78171 100644
+--- a/src/internal.h
++++ b/src/internal.h
+@@ -3,10 +3,9 @@
+ 
+ #include "config.h"
+ #ifdef HAVE_VISIBILITY_HIDDEN
+-#	define __visible	__attribute__((visibility("default")))
+-#	define EXPORT_SYMBOL(x)	typeof(x) (x) __visible
++#	define __EXPORTED	__attribute__((visibility("default")))
+ #else
+-#	define EXPORT_SYMBOL
++#	define __EXPORTED
+ #endif
+ 
+ #endif
+diff --git a/src/libnetfilter_cthelper.c b/src/libnetfilter_cthelper.c
+index f8f58e6..af543a1 100644
+--- a/src/libnetfilter_cthelper.c
++++ b/src/libnetfilter_cthelper.c
+@@ -99,17 +99,16 @@ struct nfct_helper {
+  * In case of success, this function returns a valid pointer, otherwise NULL
+  * s returned and errno is appropriately set.
+  */
+-struct nfct_helper *nfct_helper_alloc(void)
++struct nfct_helper __EXPORTED *nfct_helper_alloc(void)
+ {
+ 	return calloc(1, sizeof(struct nfct_helper));
+ }
+-EXPORT_SYMBOL(nfct_helper_alloc);
+ 
+ /**
+  * nfct_helper_free - release one helper object
+  * \param nfct_helper pointer to the helper object
+  */
+-void nfct_helper_free(struct nfct_helper *h)
++void __EXPORTED nfct_helper_free(struct nfct_helper *h)
+ {
+ 	int i;
+ 
+@@ -119,7 +118,6 @@ void nfct_helper_free(struct nfct_helper *h)
+ 	}
+ 	free(h);
+ }
+-EXPORT_SYMBOL(nfct_helper_free);
+ 
+ /**
+  * nfct_helper_policy_alloc - allocate a new helper policy object
+@@ -127,21 +125,19 @@ EXPORT_SYMBOL(nfct_helper_free);
+  * In case of success, this function returns a valid pointer, otherwise NULL
+  * s returned and errno is appropriately set.
+  */
+-struct nfct_helper_policy *nfct_helper_policy_alloc(void)
++struct nfct_helper_policy __EXPORTED *nfct_helper_policy_alloc(void)
+ {
+ 	return calloc(1, sizeof(struct nfct_helper_policy));
+ }
+-EXPORT_SYMBOL(nfct_helper_policy_alloc);
+ 
+ /**
+  * nfct_helper_free - release one helper policy object
+  * \param nfct_helper pointer to the helper object
+  */
+-void nfct_helper_policy_free(struct nfct_helper_policy *p)
++void __EXPORTED nfct_helper_policy_free(struct nfct_helper_policy *p)
+ {
+ 	free(p);
+ }
+-EXPORT_SYMBOL(nfct_helper_policy_free);
+ 
+ /**
+  * nfct_helper_policy_attr_set - set one attribute of the helper object
+@@ -149,7 +145,7 @@ EXPORT_SYMBOL(nfct_helper_policy_free);
+  * \param type attribute type you want to set
+  * \param data pointer to data that will be used to set this attribute
+  */
+-void
++void __EXPORTED
+ nfct_helper_policy_attr_set(struct nfct_helper_policy *p,
+ 			    enum nfct_helper_policy_attr_type type,
+ 			    const void *data)
+@@ -170,7 +166,6 @@ nfct_helper_policy_attr_set(struct nfct_helper_policy *p,
+ 		break;
+ 	}
+ }
+-EXPORT_SYMBOL(nfct_helper_policy_attr_set);
+ 
+ /**
+  * nfct_helper_attr_set_str - set one attribute the helper object
+@@ -178,23 +173,21 @@ EXPORT_SYMBOL(nfct_helper_policy_attr_set);
+  * \param type attribute type you want to set
+  * \param name string that will be used to set this attribute
+  */
+-void
++void __EXPORTED
+ nfct_helper_policy_attr_set_str(struct nfct_helper_policy *p,
+ 				enum nfct_helper_policy_attr_type type,
+ 				const char *name)
+ {
+ 	nfct_helper_policy_attr_set(p, type, name);
+ }
+-EXPORT_SYMBOL(nfct_helper_policy_attr_set_str);
+ 
+-void
++void __EXPORTED
+ nfct_helper_policy_attr_set_u32(struct nfct_helper_policy *p,
+ 				enum nfct_helper_policy_attr_type type,
+ 				uint32_t value)
+ {
+ 	nfct_helper_policy_attr_set(p, type, &value);
+ }
+-EXPORT_SYMBOL(nfct_helper_policy_attr_set_u32);
+ 
+ /**
+  * nfct_helper_attr_set - set one attribute of the helper object
+@@ -202,7 +195,7 @@ EXPORT_SYMBOL(nfct_helper_policy_attr_set_u32);
+  * \param type attribute type you want to set
+  * \param data pointer to data that will be used to set this attribute
+  */
+-void
++void __EXPORTED
+ nfct_helper_attr_set(struct nfct_helper *h,
+ 		     enum nfct_helper_attr_type type, const void *data)
+ {
+@@ -250,7 +243,6 @@ nfct_helper_attr_set(struct nfct_helper *h,
+ 		break;
+ 	}
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_set);
+ 
+ /**
+  * nfct_helper_attr_set_str - set one attribute the helper object
+@@ -258,44 +250,40 @@ EXPORT_SYMBOL(nfct_helper_attr_set);
+  * \param type attribute type you want to set
+  * \param name string that will be used to set this attribute
+  */
+-void
++void __EXPORTED
+ nfct_helper_attr_set_str(struct nfct_helper *nfct_helper, enum nfct_helper_attr_type type,
+ 		    const char *name)
+ {
+ 	nfct_helper_attr_set(nfct_helper, type, name);
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_set_str);
+ 
+-void
++void __EXPORTED
+ nfct_helper_attr_set_u8(struct nfct_helper *nfct_helper,
+ 			 enum nfct_helper_attr_type type, uint8_t value)
+ {
+ 	nfct_helper_attr_set(nfct_helper, type, &value);
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_set_u8);
+ 
+-void
++void __EXPORTED
+ nfct_helper_attr_set_u16(struct nfct_helper *nfct_helper,
+ 			 enum nfct_helper_attr_type type, uint16_t value)
+ {
+ 	nfct_helper_attr_set(nfct_helper, type, &value);
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_set_u16);
+ 
+-void
++void __EXPORTED
+ nfct_helper_attr_set_u32(struct nfct_helper *nfct_helper,
+ 			 enum nfct_helper_attr_type type, uint32_t value)
+ {
+ 	nfct_helper_attr_set(nfct_helper, type, &value);
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_set_u32);
+ 
+ /**
+  * nfct_helper_attr_unset - unset one attribute the helper object
+  * \param nfct_helper pointer to the helper object
+  * \param type attribute type you want to set
+  */
+-void
++void __EXPORTED
+ nfct_helper_attr_unset(struct nfct_helper *nfct_helper, enum nfct_helper_attr_type type)
+ {
+ 	switch(type) {
+@@ -307,7 +295,6 @@ nfct_helper_attr_unset(struct nfct_helper *nfct_helper, enum nfct_helper_attr_ty
+ 		break;
+ 	}
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_unset);
+ 
+ /**
+  * nfct_helper_attr_get - get one attribute the helper object
+@@ -317,8 +304,9 @@ EXPORT_SYMBOL(nfct_helper_attr_unset);
+  * This function returns a valid pointer to the attribute data. If a
+  * unsupported attribute is used, this returns NULL.
+  */
+-const void *nfct_helper_attr_get(struct nfct_helper *helper,
+-				 enum nfct_helper_attr_type type)
++const void __EXPORTED *
++nfct_helper_attr_get(struct nfct_helper *helper,
++		     enum nfct_helper_attr_type type)
+ {
+ 	const void *ret = NULL;
+ 
+@@ -358,7 +346,6 @@ const void *nfct_helper_attr_get(struct nfct_helper *helper,
+ 	}
+ 	return ret;
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_get);
+ 
+ /**
+  * nfct_helper_attr_get_str - get one attribute the helper object
+@@ -368,13 +355,12 @@ EXPORT_SYMBOL(nfct_helper_attr_get);
+  * This function returns a valid pointer to the beginning of the string.
+  * If the attribute is unsupported, this returns NULL.
+  */
+-const char *
++const char __EXPORTED *
+ nfct_helper_attr_get_str(struct nfct_helper *nfct_helper,
+ 			 enum nfct_helper_attr_type type)
+ {
+ 	return (const char *)nfct_helper_attr_get(nfct_helper, type);
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_get_str);
+ 
+ /**
+  * nfct_helper_attr_get_u8 - get one attribute the helper object
+@@ -384,12 +370,12 @@ EXPORT_SYMBOL(nfct_helper_attr_get_str);
+  * This function returns a unsigned 8-bits integer. If the attribute is
+  * unsupported, this returns NULL.
+  */
+-uint8_t nfct_helper_attr_get_u8(struct nfct_helper *nfct_helper,
+-				  enum nfct_helper_attr_type type)
++uint8_t __EXPORTED
++nfct_helper_attr_get_u8(struct nfct_helper *nfct_helper,
++			enum nfct_helper_attr_type type)
+ {
+ 	return *((uint8_t *)nfct_helper_attr_get(nfct_helper, type));
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_get_u8);
+ 
+ /**
+  * nfct_helper_attr_get_u16 - get one attribute the helper object
+@@ -399,12 +385,12 @@ EXPORT_SYMBOL(nfct_helper_attr_get_u8);
+  * This function returns a unsigned 16-bits integer. If the attribute is
+  * unsupported, this returns NULL.
+  */
+-uint16_t nfct_helper_attr_get_u16(struct nfct_helper *nfct_helper,
+-				  enum nfct_helper_attr_type type)
++uint16_t __EXPORTED
++nfct_helper_attr_get_u16(struct nfct_helper *nfct_helper,
++			 enum nfct_helper_attr_type type)
+ {
+ 	return *((uint16_t *)nfct_helper_attr_get(nfct_helper, type));
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_get_u16);
+ 
+ /**
+  * nfct_helper_attr_get_u32 - get one attribute the helper object
+@@ -414,12 +400,12 @@ EXPORT_SYMBOL(nfct_helper_attr_get_u16);
+  * This function returns a unsigned 32-bits integer. If the attribute is
+  * unsupported, this returns NULL.
+  */
+-uint32_t nfct_helper_attr_get_u32(struct nfct_helper *nfct_helper,
+-				  enum nfct_helper_attr_type type)
++uint32_t __EXPORTED
++nfct_helper_attr_get_u32(struct nfct_helper *nfct_helper,
++			 enum nfct_helper_attr_type type)
+ {
+ 	return *((uint32_t *)nfct_helper_attr_get(nfct_helper, type));
+ }
+-EXPORT_SYMBOL(nfct_helper_attr_get_u32);
+ 
+ /**
+  * nfct_helper_snprintf - print helper object into one buffer
+@@ -431,9 +417,10 @@ EXPORT_SYMBOL(nfct_helper_attr_get_u32);
+  * This function returns -1 in case that some mandatory attributes are
+  * missing. On sucess, it returns 0.
+  */
+-int nfct_helper_snprintf(char *buf, size_t size,
+-			 struct nfct_helper *helper,
+-			 unsigned int type, unsigned int flags)
++int __EXPORTED
++nfct_helper_snprintf(char *buf, size_t size,
++		     struct nfct_helper *helper,
++		     unsigned int type, unsigned int flags)
+ {
+ 	int ret;
+ 
+@@ -454,7 +441,6 @@ int nfct_helper_snprintf(char *buf, size_t size,
+ 
+ 	return ret;
+ }
+-EXPORT_SYMBOL(nfct_helper_snprintf);
+ 
+ /**
+  * @}
+@@ -490,7 +476,7 @@ EXPORT_SYMBOL(nfct_helper_snprintf);
+  * - Command NFNL_MSG_ACCT_DEL, to delete one specific nfct_helper object (if
+  *   unused, otherwise you hit EBUSY).
+  */
+-struct nlmsghdr *
++struct nlmsghdr __EXPORTED *
+ nfct_helper_nlmsg_build_hdr(char *buf, uint8_t cmd,
+ 			    uint16_t flags, uint32_t seq)
+ {
+@@ -509,7 +495,6 @@ nfct_helper_nlmsg_build_hdr(char *buf, uint8_t cmd,
+ 
+ 	return nlh;
+ }
+-EXPORT_SYMBOL(nfct_helper_nlmsg_build_hdr);
+ 
+ static void
+ nfct_helper_nlmsg_build_policy(struct nlmsghdr *nlh,
+@@ -530,7 +515,7 @@ nfct_helper_nlmsg_build_policy(struct nlmsghdr *nlh,
+  * \param nlh: netlink message that you want to use to add the payload.
+  * \param nfct_helper: pointer to a helper object
+  */
+-void
++void __EXPORTED
+ nfct_helper_nlmsg_build_payload(struct nlmsghdr *nlh, struct nfct_helper *h)
+ {
+ 	struct nlattr *nest;
+@@ -593,7 +578,6 @@ nfct_helper_nlmsg_build_payload(struct nlmsghdr *nlh, struct nfct_helper *h)
+ 	if (h->bitset & (1 << NFCTH_ATTR_STATUS))
+ 		mnl_attr_put_u32(nlh, NFCTH_STATUS, ntohl(h->status));
+ }
+-EXPORT_SYMBOL(nfct_helper_nlmsg_build_payload);
+ 
+ static int
+ nfct_helper_nlmsg_parse_tuple_cb(const struct nlattr *attr, void *data)
+@@ -795,7 +779,7 @@ nfct_helper_nlmsg_parse_attr_cb(const struct nlattr *attr, void *data)
+  * This function returns -1 in case that some mandatory attributes are
+  * missing. On sucess, it returns 0.
+  */
+-int
++int __EXPORTED
+ nfct_helper_nlmsg_parse_payload(const struct nlmsghdr *nlh,
+ 				struct nfct_helper *h)
+ {
+@@ -832,7 +816,6 @@ nfct_helper_nlmsg_parse_payload(const struct nlmsghdr *nlh,
+ 	}
+ 	return 0;
+ }
+-EXPORT_SYMBOL(nfct_helper_nlmsg_parse_payload);
+ 
+ /**
+  * @}
+-- 
+cgit v1.1
+
diff --git a/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cttimeout-visibility-hidden.patch b/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cttimeout-visibility-hidden.patch
new file mode 100644
index 000000000..2c606c832
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cttimeout-visibility-hidden.patch
@@ -0,0 +1,264 @@
+From d0c4e39d12f903e06db262656cff2e24d267bed7 Mon Sep 17 00:00:00 2001
+From: Kevin Cernekee <cernekee@chromium.org>
+Date: Wed, 4 Jan 2017 14:30:25 -0800
+Subject: Use __EXPORTED rather than EXPORT_SYMBOL
+
+clang is sensitive to the ordering of
+__attribute__((visibility("default"))) relative to the function
+body.  gcc is not.  So if we try to re-declare an existing function
+with default visibility, clang prints a warning and generates
+a broken .so file in which nfct_timeout_* are not exported to library
+callers.
+
+Move the attribute up into the function definition to make clang happy.
+
+Signed-off-by: Kevin Cernekee <cernekee@chromium.org>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+---
+ doxygen.cfg.in               |  2 +-
+ src/internal.h               |  5 ++---
+ src/libnetfilter_cttimeout.c | 44 +++++++++++++++++---------------------------
+ 3 files changed, 20 insertions(+), 31 deletions(-)
+
+diff --git a/doxygen.cfg.in b/doxygen.cfg.in
+index 8e5d449..09c3ce0 100644
+--- a/doxygen.cfg.in
++++ b/doxygen.cfg.in
+@@ -72,7 +72,7 @@ RECURSIVE              = YES
+ EXCLUDE                = 
+ EXCLUDE_SYMLINKS       = NO
+ EXCLUDE_PATTERNS       = */.git/* .*.d
+-EXCLUDE_SYMBOLS        = EXPORT_SYMBOL nfct_timeout _container_policy_cb
++EXCLUDE_SYMBOLS        = nfct_timeout _container_policy_cb
+ EXAMPLE_PATH           = 
+ EXAMPLE_PATTERNS       = 
+ EXAMPLE_RECURSIVE      = NO
+diff --git a/src/internal.h b/src/internal.h
+index 3a88d1a..5d78171 100644
+--- a/src/internal.h
++++ b/src/internal.h
+@@ -3,10 +3,9 @@
+ 
+ #include "config.h"
+ #ifdef HAVE_VISIBILITY_HIDDEN
+-#	define __visible	__attribute__((visibility("default")))
+-#	define EXPORT_SYMBOL(x)	typeof(x) (x) __visible
++#	define __EXPORTED	__attribute__((visibility("default")))
+ #else
+-#	define EXPORT_SYMBOL
++#	define __EXPORTED
+ #endif
+ 
+ #endif
+diff --git a/src/libnetfilter_cttimeout.c b/src/libnetfilter_cttimeout.c
+index 7844a1f..a0a7185 100644
+--- a/src/libnetfilter_cttimeout.c
++++ b/src/libnetfilter_cttimeout.c
+@@ -187,7 +187,7 @@ struct nfct_timeout {
+  * In case of success, this function returns a valid pointer, otherwise NULL
+  * s returned and errno is appropriately set.
+  */
+-struct nfct_timeout *nfct_timeout_alloc(void)
++struct nfct_timeout __EXPORTED *nfct_timeout_alloc(void)
+ {
+ 	struct nfct_timeout *t;
+ 
+@@ -197,19 +197,17 @@ struct nfct_timeout *nfct_timeout_alloc(void)
+ 
+ 	return t;
+ }
+-EXPORT_SYMBOL(nfct_timeout_alloc);
+ 
+ /**
+  * nfct_timeout_free - release one conntrack timeout object
+  * \param t pointer to the conntrack timeout object
+  */
+-void nfct_timeout_free(struct nfct_timeout *t)
++void __EXPORTED nfct_timeout_free(struct nfct_timeout *t)
+ {
+ 	if (t->timeout)
+ 		free(t->timeout);
+ 	free(t);
+ }
+-EXPORT_SYMBOL(nfct_timeout_free);
+ 
+ /**
+  * nfct_timeout_attr_set - set one attribute of the conntrack timeout object
+@@ -217,7 +215,7 @@ EXPORT_SYMBOL(nfct_timeout_free);
+  * \param type attribute type you want to set
+  * \param data pointer to data that will be used to set this attribute
+  */
+-int
++int __EXPORTED
+ nfct_timeout_attr_set(struct nfct_timeout *t, uint32_t type, const void *data)
+ {
+ 	switch(type) {
+@@ -236,7 +234,6 @@ nfct_timeout_attr_set(struct nfct_timeout *t, uint32_t type, const void *data)
+ 	t->attrset |= (1 << type);
+ 	return 0;
+ }
+-EXPORT_SYMBOL(nfct_timeout_attr_set);
+ 
+ /**
+  * nfct_timeout_attr_set_u8 - set one attribute of the conntrack timeout object
+@@ -244,12 +241,11 @@ EXPORT_SYMBOL(nfct_timeout_attr_set);
+  * \param type attribute type you want to set
+  * \param data pointer to data that will be used to set this attribute
+  */
+-int
++int __EXPORTED
+ nfct_timeout_attr_set_u8(struct nfct_timeout *t, uint32_t type, uint8_t data)
+ {
+ 	return nfct_timeout_attr_set(t, type, &data);
+ }
+-EXPORT_SYMBOL(nfct_timeout_attr_set_u8);
+ 
+ /**
+  * nfct_timeout_attr_set_u16 - set one attribute of the conntrack timeout object
+@@ -257,23 +253,21 @@ EXPORT_SYMBOL(nfct_timeout_attr_set_u8);
+  * \param type attribute type you want to set
+  * \param data pointer to data that will be used to set this attribute
+  */
+-int
++int __EXPORTED
+ nfct_timeout_attr_set_u16(struct nfct_timeout *t, uint32_t type, uint16_t data)
+ {
+ 	return nfct_timeout_attr_set(t, type, &data);
+ }
+-EXPORT_SYMBOL(nfct_timeout_attr_set_u16);
+ 
+ /**
+  * nfct_timeout_attr_unset - unset one attribute of the conntrack timeout object
+  * \param t pointer to the conntrack timeout object
+  * \param type attribute type you want to set
+  */
+-void nfct_timeout_attr_unset(struct nfct_timeout *t, uint32_t type)
++void __EXPORTED nfct_timeout_attr_unset(struct nfct_timeout *t, uint32_t type)
+ {
+ 	t->attrset &= ~(1 << type);
+ }
+-EXPORT_SYMBOL(nfct_timeout_attr_unset);
+ 
+ /**
+  * nfct_timeout_policy_attr_set_u32 - set one attribute of the policy
+@@ -281,7 +275,7 @@ EXPORT_SYMBOL(nfct_timeout_attr_unset);
+  * \param type attribute type you want to set
+  * \param data data that will be used to set this attribute
+  */
+-int
++int __EXPORTED
+ nfct_timeout_policy_attr_set_u32(struct nfct_timeout *t,
+ 				 uint32_t type, uint32_t data)
+ {
+@@ -319,18 +313,17 @@ nfct_timeout_policy_attr_set_u32(struct nfct_timeout *t,
+ 
+ 	return 0;
+ }
+-EXPORT_SYMBOL(nfct_timeout_policy_attr_set_u32);
+ 
+ /**
+  * nfct_timeout_policy_attr_unset - unset one attribute of the policy
+  * \param t pointer to the conntrack timeout object
+  * \param type attribute type you want to set
+  */
+-void nfct_timeout_policy_attr_unset(struct nfct_timeout *t, uint32_t type)
++void __EXPORTED
++nfct_timeout_policy_attr_unset(struct nfct_timeout *t, uint32_t type)
+ {
+ 	t->attrset &= ~(1 << type);
+ }
+-EXPORT_SYMBOL(nfct_timeout_policy_attr_unset);
+ 
+ /**
+  * nfct_timeout_policy_attr_to_name - get state name from protocol state number
+@@ -340,7 +333,8 @@ EXPORT_SYMBOL(nfct_timeout_policy_attr_unset);
+  * This function returns NULL if unsupported protocol or state number is passed.
+  * Otherwise, a pointer to valid string is returned.
+  */
+-const char *nfct_timeout_policy_attr_to_name(uint8_t l4proto, uint32_t state)
++const char __EXPORTED *
++nfct_timeout_policy_attr_to_name(uint8_t l4proto, uint32_t state)
+ {
+ 	if (timeout_protocol[l4proto].state_to_name == NULL) {
+ 		printf("no array state name\n");
+@@ -354,7 +348,6 @@ const char *nfct_timeout_policy_attr_to_name(uint8_t l4proto, uint32_t state)
+ 
+ 	return timeout_protocol[l4proto].state_to_name[state];
+ }
+-EXPORT_SYMBOL(nfct_timeout_policy_attr_to_name);
+ 
+ /**
+  * @}
+@@ -438,8 +431,9 @@ nfct_timeout_snprintf_default(char *buf, size_t size,
+  * This function returns -1 in case that some mandatory attributes are
+  * missing. On sucess, it returns 0.
+  */
+-int nfct_timeout_snprintf(char *buf, size_t size, const struct nfct_timeout *t,
+-			  unsigned int type, unsigned int flags)
++int __EXPORTED
++nfct_timeout_snprintf(char *buf, size_t size, const struct nfct_timeout *t,
++		      unsigned int type, unsigned int flags)
+ {
+ 	int ret = 0;
+ 
+@@ -454,7 +448,6 @@ int nfct_timeout_snprintf(char *buf, size_t size, const struct nfct_timeout *t,
+ 
+ 	return ret;
+ }
+-EXPORT_SYMBOL(nfct_timeout_snprintf);
+ 
+ /**
+  * @}
+@@ -477,7 +470,7 @@ EXPORT_SYMBOL(nfct_timeout_snprintf);
+  * - CTNL_MSG_TIMEOUT_GET: get conntrack timeout object.
+  * - CTNL_MSG_TIMEOUT_DEL: delete conntrack timeout object.
+  */
+-struct nlmsghdr *
++struct nlmsghdr __EXPORTED *
+ nfct_timeout_nlmsg_build_hdr(char *buf, uint8_t cmd,
+ 			     uint16_t flags, uint32_t seq)
+ {
+@@ -496,14 +489,13 @@ nfct_timeout_nlmsg_build_hdr(char *buf, uint8_t cmd,
+ 
+ 	return nlh;
+ }
+-EXPORT_SYMBOL(nfct_timeout_nlmsg_build_hdr);
+ 
+ /**
+  * nfct_timeout_nlmsg_build_payload - build payload from ct timeout object
+  * \param nlh: netlink message that you want to use to add the payload.
+  * \param t: pointer to a conntrack timeout object
+  */
+-void
++void __EXPORTED
+ nfct_timeout_nlmsg_build_payload(struct nlmsghdr *nlh,
+ 				 const struct nfct_timeout *t)
+ {
+@@ -532,7 +524,6 @@ nfct_timeout_nlmsg_build_payload(struct nlmsghdr *nlh,
+ 	}
+ 
+ }
+-EXPORT_SYMBOL(nfct_timeout_nlmsg_build_payload);
+ 
+ static int
+ timeout_nlmsg_parse_attr_cb(const struct nlattr *attr, void *data)
+@@ -629,7 +620,7 @@ timeout_parse_attr_data(struct nfct_timeout *t, const struct nlattr *nest)
+  * This function returns -1 in case that some mandatory attributes are
+  * missing. On sucess, it returns 0.
+  */
+-int
++int __EXPORTED
+ nfct_timeout_nlmsg_parse_payload(const struct nlmsghdr *nlh,
+ 				 struct nfct_timeout *t)
+ {
+@@ -654,7 +645,6 @@ nfct_timeout_nlmsg_parse_payload(const struct nlmsghdr *nlh,
+ 	}
+ 	return 0;
+ }
+-EXPORT_SYMBOL(nfct_timeout_nlmsg_parse_payload);
+ 
+ /**
+  * @}
+-- 
+cgit v1.1
+
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
index 3d3799726..92cb23d6e 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
@@ -6,7 +6,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libmnl"
 
-SRC_URI = "http://www.netfilter.org/projects/libnetfilter_cthelper/files/libnetfilter_cthelper-${PV}.tar.bz2;name=tar"
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_cthelper/files/libnetfilter_cthelper-${PV}.tar.bz2;name=tar \
+           file://libnetfilter-cthelper-visibility-hidden.patch \
+"
 SRC_URI[tar.md5sum] = "b2efab1a3a198a5add448960ba011acd"
 SRC_URI[tar.sha256sum] = "07618e71c4d9a6b6b3dc1986540486ee310a9838ba754926c7d14a17d8fccf3d"
 
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
index dcf748562..ff32f3409 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
@@ -5,7 +5,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libmnl"
 
-SRC_URI = "http://www.netfilter.org/projects/libnetfilter_cttimeout/files/libnetfilter_cttimeout-${PV}.tar.bz2;name=tar"
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_cttimeout/files/libnetfilter_cttimeout-${PV}.tar.bz2;name=tar \
+           file://libnetfilter-cttimeout-visibility-hidden.patch \
+"
 SRC_URI[tar.md5sum] = "7697437fc9ebb6f6b83df56a633db7f9"
 SRC_URI[tar.sha256sum] = "aeab12754f557cba3ce2950a2029963d817490df7edb49880008b34d7ff8feba"
 
-- 
2.12.2


