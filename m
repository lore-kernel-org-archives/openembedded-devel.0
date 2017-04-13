Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9F54F77E78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:23 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c198so12686498pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r8QPxVHS25nh9d0b0JpCYu5UFOl2lSYcgMgUp9mAdss=;
	b=aIvQDGbseLg1TGE/paEe3nUYEaRHGLIgt/r3kAf0Txhd9Ieyr/ZStS3wIUc46OwFRU
	GZQ1ETXv/MFYHJiYf82Nn0dTX41PqWRKa2ZJ9rJlD9DSpdM7iYlF9Sq6zPbiwveQOti9
	HQg6rr9OTv3dRPXWsggb5ewZAHhZMuC2/gv2sKMCmkdNDEqezJy/KVFZE3lKsArkzQDk
	TcIcQfEiWffO8ILrL57DT1sZuXB7pbOvGlpZ+uO1/66HEQWi2YkatZLpkGhb4y6hMzAT
	SB2ATZ7XABIr2ZMn5iIUmbEdp21jdNu0Rb6Ac0hxwBd3DZOqg95G02I37h0+fLE2vMqN
	nS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r8QPxVHS25nh9d0b0JpCYu5UFOl2lSYcgMgUp9mAdss=;
	b=q23LHRoHQv19jZ5WikEp2jDz5iGXeZfL1P/hUbMHvEYM9fh+gn0niyybD6hQ06Nwau
	Pdlc5XeVDUPCGxEAHZiMZdcltar/INaSDUEwUkZggojq5D3JNfm8u6oyMN3vsJuiKoaH
	zFERwj3eSFR8H1dBDcqQh9LcF6Ynzy66S8TmCzRJXBd38wpdk4R9GFBmpvLRx0GXunkx
	WOHy2akNf+oAkuazpkFXXFOmkgwUr6VzxI4J3zCYe8YPyfkWUsa036YEJsFKy5p25IKn
	AaqItfkfLHs1jxiW8MGJI1bhJE9QWnvNjn8S5T8sQnmYubThiOAOJ+bDbj0m7awKVmQk
	LD6g==
X-Gm-Message-State: AN3rC/70mA0+Scfo6QLqZLOIOuE37NrvOWpdYLSO/zy90PeUc6RR9D0o
	/tcsjf8iqYwMmA==
X-Received: by 10.98.133.78 with SMTP id u75mr4170119pfd.261.1492116084074;
	Thu, 13 Apr 2017 13:41:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:42 -0700
Message-Id: <20170413204106.30679-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-networking][ 05/29] libnetfilter-acct: Fix build with clang
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-the-define-visivility-attribute-together.patch | 255 +++++++++++++++++++++
 .../libnetfilter/libnetfilter-acct_1.0.3.bb        |   4 +-
 2 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch

diff --git a/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch b/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch
new file mode 100644
index 000000000..9e0b420e0
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch
@@ -0,0 +1,255 @@
+From f3e3e8fa703e88b76b22c5486277dfca3c85a24b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Apr 2017 14:56:18 -0700
+Subject: [PATCH] Declare the define visivility attribute together
+
+clang ignores the visibility attribute if its not
+defined before the definition. As a result these
+symbols become hidden and consumers of this library
+fail to link due to these missing symbols
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doxygen.cfg.in          |  2 +-
+ src/internal.h          |  5 ++---
+ src/libnetfilter_acct.c | 41 ++++++++++++++---------------------------
+ 3 files changed, 17 insertions(+), 31 deletions(-)
+
+diff --git a/doxygen.cfg.in b/doxygen.cfg.in
+index 7f4bd04..fe64d48 100644
+--- a/doxygen.cfg.in
++++ b/doxygen.cfg.in
+@@ -72,7 +72,7 @@ RECURSIVE              = YES
+ EXCLUDE                = 
+ EXCLUDE_SYMLINKS       = NO
+ EXCLUDE_PATTERNS       = */.git/* .*.d
+-EXCLUDE_SYMBOLS        = EXPORT_SYMBOL nfacct
++EXCLUDE_SYMBOLS        = nfacct
+ EXAMPLE_PATH           = 
+ EXAMPLE_PATTERNS       = 
+ EXAMPLE_RECURSIVE      = NO
+diff --git a/src/internal.h b/src/internal.h
+index f0cc2e1..e5c5ffd 100644
+--- a/src/internal.h
++++ b/src/internal.h
+@@ -3,10 +3,9 @@
+ 
+ #include "config.h"
+ #ifdef HAVE_VISIBILITY_HIDDEN
+-#	define __visible	__attribute__((visibility("default")))
+-#	define EXPORT_SYMBOL(x)	typeof(x) (x) __visible
++#	define __EXPORT	__attribute__((visibility("default")))
+ #else
+-#	define EXPORT_SYMBOL
++#	define __EXPORT
+ #endif
+ 
+ #include <endian.h>
+diff --git a/src/libnetfilter_acct.c b/src/libnetfilter_acct.c
+index b0bcf67..0220d14 100644
+--- a/src/libnetfilter_acct.c
++++ b/src/libnetfilter_acct.c
+@@ -76,21 +76,19 @@ struct nfacct {
+  * In case of success, this function returns a valid pointer, otherwise NULL
+  * s returned and errno is appropriately set.
+  */
+-struct nfacct *nfacct_alloc(void)
++struct nfacct __EXPORT *nfacct_alloc(void)
+ {
+ 	return calloc(1, sizeof(struct nfacct));
+ }
+-EXPORT_SYMBOL(nfacct_alloc);
+ 
+ /**
+  * nfacct_free - release one accounting object
+  * \param nfacct pointer to the accounting object
+  */
+-void nfacct_free(struct nfacct *nfacct)
++void __EXPORT nfacct_free(struct nfacct *nfacct)
+ {
+ 	free(nfacct);
+ }
+-EXPORT_SYMBOL(nfacct_free);
+ 
+ /**
+  * nfacct_attr_set - set one attribute of the accounting object
+@@ -98,7 +96,7 @@ EXPORT_SYMBOL(nfacct_free);
+  * \param type attribute type you want to set
+  * \param data pointer to data that will be used to set this attribute
+  */
+-void
++void __EXPORT
+ nfacct_attr_set(struct nfacct *nfacct, enum nfacct_attr_type type,
+ 		const void *data)
+ {
+@@ -126,7 +124,6 @@ nfacct_attr_set(struct nfacct *nfacct, enum nfacct_attr_type type,
+ 		break;
+ 	}
+ }
+-EXPORT_SYMBOL(nfacct_attr_set);
+ 
+ /**
+  * nfacct_attr_set_str - set one attribute the accounting object
+@@ -134,13 +131,12 @@ EXPORT_SYMBOL(nfacct_attr_set);
+  * \param type attribute type you want to set
+  * \param name string that will be used to set this attribute
+  */
+-void
++void __EXPORT
+ nfacct_attr_set_str(struct nfacct *nfacct, enum nfacct_attr_type type,
+ 		    const char *name)
+ {
+ 	nfacct_attr_set(nfacct, type, name);
+ }
+-EXPORT_SYMBOL(nfacct_attr_set_str);
+ 
+ /**
+  * nfacct_attr_set_u64 - set one attribute the accounting object
+@@ -148,20 +144,19 @@ EXPORT_SYMBOL(nfacct_attr_set_str);
+  * \param type attribute type you want to set
+  * \param value unsigned 64-bits integer
+  */
+-void
++void __EXPORT
+ nfacct_attr_set_u64(struct nfacct *nfacct, enum nfacct_attr_type type,
+ 		    uint64_t value)
+ {
+ 	nfacct_attr_set(nfacct, type, &value);
+ }
+-EXPORT_SYMBOL(nfacct_attr_set_u64);
+ 
+ /**
+  * nfacct_attr_unset - unset one attribute the accounting object
+  * \param nfacct pointer to the accounting object
+  * \param type attribute type you want to set
+  */
+-void
++void __EXPORT
+ nfacct_attr_unset(struct nfacct *nfacct, enum nfacct_attr_type type)
+ {
+ 	switch(type) {
+@@ -182,7 +177,6 @@ nfacct_attr_unset(struct nfacct *nfacct, enum nfacct_attr_type type)
+ 		break;
+ 	}
+ }
+-EXPORT_SYMBOL(nfacct_attr_unset);
+ 
+ /**
+  * nfacct_attr_get - get one attribute the accounting object
+@@ -192,7 +186,7 @@ EXPORT_SYMBOL(nfacct_attr_unset);
+  * This function returns a valid pointer to the attribute data. If a
+  * unsupported attribute is used, this returns NULL.
+  */
+-const void *nfacct_attr_get(struct nfacct *nfacct, enum nfacct_attr_type type)
++const void __EXPORT *nfacct_attr_get(struct nfacct *nfacct, enum nfacct_attr_type type)
+ {
+ 	const void *ret = NULL;
+ 
+@@ -220,7 +214,6 @@ const void *nfacct_attr_get(struct nfacct *nfacct, enum nfacct_attr_type type)
+ 	}
+ 	return ret;
+ }
+-EXPORT_SYMBOL(nfacct_attr_get);
+ 
+ /**
+  * nfacct_attr_get_str - get one attribute the accounting object
+@@ -230,12 +223,11 @@ EXPORT_SYMBOL(nfacct_attr_get);
+  * This function returns a valid pointer to the beginning of the string.
+  * If the attribute is unsupported, this returns NULL.
+  */
+-const char *
++const char __EXPORT *
+ nfacct_attr_get_str(struct nfacct *nfacct, enum nfacct_attr_type type)
+ {
+ 	return nfacct_attr_get(nfacct, type);
+ }
+-EXPORT_SYMBOL(nfacct_attr_get_str);
+ 
+ /**
+  * nfacct_attr_get_u64 - get one attribute the accounting object
+@@ -245,12 +237,11 @@ EXPORT_SYMBOL(nfacct_attr_get_str);
+  * This function returns a unsigned 64-bits integer. If the attribute is
+  * unsupported, this returns NULL.
+  */
+-uint64_t nfacct_attr_get_u64(struct nfacct *nfacct, enum nfacct_attr_type type)
++uint64_t __EXPORT nfacct_attr_get_u64(struct nfacct *nfacct, enum nfacct_attr_type type)
+ {
+ 	const void *ret = nfacct_attr_get(nfacct, type);
+ 	return ret ? *((uint64_t *)ret) : 0;
+ }
+-EXPORT_SYMBOL(nfacct_attr_get_u64);
+ 
+ static int
+ nfacct_snprintf_plain(char *buf, size_t rem, struct nfacct *nfacct,
+@@ -424,8 +415,8 @@ err:
+  * This function returns -1 in case that some mandatory attributes are
+  * missing. On sucess, it returns 0.
+  */
+-int nfacct_snprintf(char *buf, size_t size, struct nfacct *nfacct,
+-		    uint16_t type, uint16_t flags)
++int __EXPORT nfacct_snprintf(char *buf, size_t size, struct nfacct *nfacct,
++		             uint16_t type, uint16_t flags)
+ {
+ 	int ret = 0;
+ 
+@@ -445,7 +436,6 @@ int nfacct_snprintf(char *buf, size_t size, struct nfacct *nfacct,
+ 	}
+ 	return ret;
+ }
+-EXPORT_SYMBOL(nfacct_snprintf);
+ 
+ /**
+  * @}
+@@ -484,7 +474,7 @@ EXPORT_SYMBOL(nfacct_snprintf);
+  * - Command NFNL_MSG_ACCT_DEL, to delete one specific nfacct object (if
+  *   unused, otherwise you hit EBUSY).
+  */
+-struct nlmsghdr *
++struct nlmsghdr __EXPORT *
+ nfacct_nlmsg_build_hdr(char *buf, uint8_t cmd, uint16_t flags, uint32_t seq)
+ {
+ 	struct nlmsghdr *nlh;
+@@ -502,14 +492,13 @@ nfacct_nlmsg_build_hdr(char *buf, uint8_t cmd, uint16_t flags, uint32_t seq)
+ 
+ 	return nlh;
+ }
+-EXPORT_SYMBOL(nfacct_nlmsg_build_hdr);
+ 
+ /**
+  * nfacct_nlmsg_build_payload - build payload from accounting object
+  * \param nlh: netlink message that you want to use to add the payload.
+  * \param nfacct: pointer to a accounting object
+  */
+-void nfacct_nlmsg_build_payload(struct nlmsghdr *nlh, struct nfacct *nfacct)
++void __EXPORT nfacct_nlmsg_build_payload(struct nlmsghdr *nlh, struct nfacct *nfacct)
+ {
+ 	if (nfacct->bitset & (1 << NFACCT_ATTR_NAME))
+ 		mnl_attr_put_strz(nlh, NFACCT_NAME, nfacct->name);
+@@ -526,7 +515,6 @@ void nfacct_nlmsg_build_payload(struct nlmsghdr *nlh, struct nfacct *nfacct)
+ 	if (nfacct->bitset & (1 << NFACCT_ATTR_QUOTA))
+ 		mnl_attr_put_u64(nlh, NFACCT_QUOTA, htobe64(nfacct->quota));
+ }
+-EXPORT_SYMBOL(nfacct_nlmsg_build_payload);
+ 
+ static int nfacct_nlmsg_parse_attr_cb(const struct nlattr *attr, void *data)
+ {
+@@ -563,7 +551,7 @@ static int nfacct_nlmsg_parse_attr_cb(const struct nlattr *attr, void *data)
+  * This function returns -1 in case that some mandatory attributes are
+  * missing. On sucess, it returns 0.
+  */
+-int
++int __EXPORT
+ nfacct_nlmsg_parse_payload(const struct nlmsghdr *nlh, struct nfacct *nfacct)
+ {
+ 	struct nlattr *tb[NFACCT_MAX+1] = {};
+@@ -589,7 +577,6 @@ nfacct_nlmsg_parse_payload(const struct nlmsghdr *nlh, struct nfacct *nfacct)
+ 
+ 	return 0;
+ }
+-EXPORT_SYMBOL(nfacct_nlmsg_parse_payload);
+ 
+ /**
+  * @}
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
index 0d713033c..974035ccc 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-acct_1.0.3.bb
@@ -6,7 +6,9 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "libnfnetlink libmnl"
 
-SRC_URI = "http://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2"
+SRC_URI = "http://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2 \
+           file://0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch \
+"
 SRC_URI[md5sum] = "814b2972b2f5c740ff87510bc109168b"
 SRC_URI[sha256sum] = "4250ceef3efe2034f4ac05906c3ee427db31b9b0a2df41b2744f4bf79a959a1a"
 
-- 
2.12.2


