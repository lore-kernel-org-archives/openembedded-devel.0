Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 98D2F6C0BD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Nov 2018 18:48:32 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id d39so983516edb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Nov 2018 10:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dFtc4bQtj49XzzCdKz+bOIXfPr8OvPsuj7fkMYzM35Q=;
	b=U5KoXLGRaV2FNt9uvO6NihIYYzTsDlOWdy2kp5tAYltdwQwpH2i3oFfb8yIxjyP7bg
	rfV8nN7fJbgZiqdbLk56P8y7vB6PXoQ9NHtv9AJB3ne11FO136dB1OBGnMnsub0uq+ZM
	aRWCiSwnaSMOpjqJM9hOR3e1wthu1qktNtvM2v+2qP2Mj1qPkjXKm2IsPEFD88Im8b6W
	PyMp4n3qBioOxe8tvtBxb5Y9tWswn9vqxhva5+wOD1hUoxkSuv087ZYWephx2uu+pj44
	lS9Caa1q4SyWUOsjVKnN8ipFyjTqHmi2Rq4nApwHQjt/NNpcWIA7vniJsuf4L4qvnipE
	TJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dFtc4bQtj49XzzCdKz+bOIXfPr8OvPsuj7fkMYzM35Q=;
	b=XxIEZuJBLL+zvvIB/aEliUPsPwp0RLNd5prXA9MiW7nYq6H/jZBgTofG+zi0PaQirJ
	0cLmacf9iLkLJM/Qsb6S8C5Aj90BUNReJrDzsS/CBzFT9XA4YczNCdCM80g6NrClffdr
	CvRn7hb10yR1jU7a4ZtyFZP4Z8BwfSxlYvBuZ8Rxh1Cyxqzbm1I/WRbyUSehRzrEz5+L
	YatcANjHI//BrXSt/JmiWRef9HDBgbyb72YH91cp1C1/G9xqY5lodF1iBTWGUkK/dRTw
	WhU7X5xJ7xQZG5t8iWUH4N+g75Nv5hpxfEcI2tOyR4Uru4sEuHkzn1GQRKZk1WR2xTuL
	bYUg==
X-Gm-Message-State: AGRZ1gIEk7ZXu2y+lwuq0buzDZm+DoBdb16Hg+KSSPNXiMaUTuKi4uFU
	yCyTE6nujjwnhikqsRI6y4xIXO8yU9w=
X-Google-Smtp-Source: AJdET5dl2fWrqeWNlZqYa16qDfQVtUv4bKazBVTn6i1jJcPe2V1f0xFjcEn+vNTfo+/2/7ew0FncaA==
X-Received: by 2002:a50:d604:: with SMTP id
	x4-v6mr6518401edi.178.1541875711381; 
	Sat, 10 Nov 2018 10:48:31 -0800 (PST)
Received: from localhost.localdomain
	(ec2-52-17-69-150.eu-west-1.compute.amazonaws.com. [52.17.69.150])
	by smtp.gmail.com with ESMTPSA id
	g13-v6sm3052827edv.48.2018.11.10.10.48.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Nov 2018 10:48:30 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Joe MacDonald <joe@deserted.net>
Date: Sat, 10 Nov 2018 18:48:00 +0000
Message-Id: <1541875681-24701-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH 1/2] libnftnl: Upgrade to 1.1.1
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
X-List-Received-Date: Sat, 10 Nov 2018 18:48:33 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...-the-define-visivility-attribute-together.patch | 2949 --------------------
 ...001-Move-exports-before-symbol-definition.patch |  289 ++
 ...g-local-function-as-one-of-printf-family.patch} |  263 +-
 .../{libnftnl_1.0.7.bb => libnftnl_1.1.1.bb}       |    8 +-
 4 files changed, 441 insertions(+), 3068 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-Declare-the-define-visivility-attribute-together.patch
 create mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
 rename meta-networking/recipes-filter/libnftnl/libnftnl/{0001-avoid-naming-local-function-as-one-of-printf-family.patch => 0002-avoid-naming-local-function-as-one-of-printf-family.patch} (71%)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.0.7.bb => libnftnl_1.1.1.bb} (51%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Declare-the-define-visivility-attribute-together.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Declare-the-define-visivility-attribute-together.patch
deleted file mode 100644
index e82b23813f74..000000000000
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Declare-the-define-visivility-attribute-together.patch
+++ /dev/null
@@ -1,2949 +0,0 @@
-From bd01f785da5222d0662be3182fe2650e1c12f43e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Apr 2017 14:07:07 -0700
-Subject: [PATCH] Declare the define visivility attribute together
-
-clang ignores the visibility attribute if its not
-defined before the definition. As a result these
-symbols become hidden and consumers of this library
-fail to link due to these missing symbols
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- doxygen.cfg.in  |   2 +-
- include/utils.h |   5 +--
- src/batch.c     |  21 ++++-------
- src/chain.c     | 102 +++++++++++++++++---------------------------------
- src/common.c    |  21 ++++-------
- src/expr.c      |  51 +++++++++----------------
- src/gen.c       |  39 +++++++------------
- src/object.c    |  99 ++++++++++++++++--------------------------------
- src/rule.c      | 114 +++++++++++++++++++-------------------------------------
- src/ruleset.c   |  48 ++++++++----------------
- src/set.c       |  96 ++++++++++++++++-------------------------------
- src/set_elem.c  |  72 ++++++++++++-----------------------
- src/table.c     |  90 +++++++++++++++-----------------------------
- src/trace.c     |  27 +++++---------
- src/udata.c     |  48 ++++++++----------------
- 15 files changed, 279 insertions(+), 556 deletions(-)
-
-diff --git a/doxygen.cfg.in b/doxygen.cfg.in
-index 23fcad4..e49f28d 100644
---- a/doxygen.cfg.in
-+++ b/doxygen.cfg.in
-@@ -72,7 +72,7 @@ RECURSIVE              = YES
- EXCLUDE                = 
- EXCLUDE_SYMLINKS       = NO
- EXCLUDE_PATTERNS       = */.git/* .*.d
--EXCLUDE_SYMBOLS        = EXPORT_SYMBOL
-+EXCLUDE_SYMBOLS        =
- EXAMPLE_PATH           = 
- EXAMPLE_PATTERNS       = 
- EXAMPLE_RECURSIVE      = NO
-diff --git a/include/utils.h b/include/utils.h
-index 2f5cf34..ff8207e 100644
---- a/include/utils.h
-+++ b/include/utils.h
-@@ -9,10 +9,9 @@
- 
- #include "config.h"
- #ifdef HAVE_VISIBILITY_HIDDEN
--#	define __visible	__attribute__((visibility("default")))
--#	define EXPORT_SYMBOL(x)	typeof(x) (x) __visible;
-+#	define __EXPORTED	__attribute__((visibility("default")))
- #else
--#	define EXPORT_SYMBOL
-+#	define __EXPORT
- #endif
- 
- #define __noreturn	__attribute__((__noreturn__))
-diff --git a/src/batch.c b/src/batch.c
-index 5ee3fd7..3bedd26 100644
---- a/src/batch.c
-+++ b/src/batch.c
-@@ -57,7 +57,7 @@ static void nftnl_batch_add_page(struct nftnl_batch_page *page,
- 	list_add_tail(&page->head, &batch->page_list);
- }
- 
--struct nftnl_batch *nftnl_batch_alloc(uint32_t pg_size, uint32_t pg_overrun_size)
-+struct nftnl_batch __EXPORTED *nftnl_batch_alloc(uint32_t pg_size, uint32_t pg_overrun_size)
- {
- 	struct nftnl_batch *batch;
- 	struct nftnl_batch_page *page;
-@@ -80,9 +80,8 @@ err1:
- 	free(batch);
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_batch_alloc);
- 
--void nftnl_batch_free(struct nftnl_batch *batch)
-+void __EXPORTED nftnl_batch_free(struct nftnl_batch *batch)
- {
- 	struct nftnl_batch_page *page, *next;
- 
-@@ -94,9 +93,8 @@ void nftnl_batch_free(struct nftnl_batch *batch)
- 
- 	free(batch);
- }
--EXPORT_SYMBOL(nftnl_batch_free);
- 
--int nftnl_batch_update(struct nftnl_batch *batch)
-+int __EXPORTED nftnl_batch_update(struct nftnl_batch *batch)
- {
- 	struct nftnl_batch_page *page;
- 	struct nlmsghdr *last_nlh;
-@@ -119,21 +117,18 @@ int nftnl_batch_update(struct nftnl_batch *batch)
- err1:
- 	return -1;
- }
--EXPORT_SYMBOL(nftnl_batch_update);
- 
--void *nftnl_batch_buffer(struct nftnl_batch *batch)
-+void __EXPORTED *nftnl_batch_buffer(struct nftnl_batch *batch)
- {
- 	return mnl_nlmsg_batch_current(batch->current_page->batch);
- }
--EXPORT_SYMBOL(nftnl_batch_buffer);
- 
--uint32_t nftnl_batch_buffer_len(struct nftnl_batch *batch)
-+uint32_t __EXPORTED nftnl_batch_buffer_len(struct nftnl_batch *batch)
- {
- 	return mnl_nlmsg_batch_size(batch->current_page->batch);
- }
--EXPORT_SYMBOL(nftnl_batch_buffer_len);
- 
--int nftnl_batch_iovec_len(struct nftnl_batch *batch)
-+int __EXPORTED nftnl_batch_iovec_len(struct nftnl_batch *batch)
- {
- 	int num_pages = batch->num_pages;
- 
-@@ -143,9 +138,8 @@ int nftnl_batch_iovec_len(struct nftnl_batch *batch)
- 
- 	return num_pages;
- }
--EXPORT_SYMBOL(nftnl_batch_iovec_len);
- 
--void nftnl_batch_iovec(struct nftnl_batch *batch, struct iovec *iov,
-+void __EXPORTED nftnl_batch_iovec(struct nftnl_batch *batch, struct iovec *iov,
- 		       uint32_t iovlen)
- {
- 	struct nftnl_batch_page *page;
-@@ -160,4 +154,3 @@ void nftnl_batch_iovec(struct nftnl_batch *batch, struct iovec *iov,
- 		i++;
- 	}
- }
--EXPORT_SYMBOL(nftnl_batch_iovec);
-diff --git a/src/chain.c b/src/chain.c
-index 29860c5..362fa0d 100644
---- a/src/chain.c
-+++ b/src/chain.c
-@@ -87,13 +87,12 @@ static const char *nftnl_hooknum2str(int family, int hooknum)
- 	return "unknown";
- }
- 
--struct nftnl_chain *nftnl_chain_alloc(void)
-+struct nftnl_chain __EXPORTED *nftnl_chain_alloc(void)
- {
- 	return calloc(1, sizeof(struct nftnl_chain));
- }
--EXPORT_SYMBOL(nftnl_chain_alloc);
- 
--void nftnl_chain_free(const struct nftnl_chain *c)
-+void __EXPORTED nftnl_chain_free(const struct nftnl_chain *c)
- {
- 	if (c->flags & (1 << NFTNL_CHAIN_NAME))
- 		xfree(c->name);
-@@ -105,15 +104,13 @@ void nftnl_chain_free(const struct nftnl_chain *c)
- 		xfree(c->dev);
- 	xfree(c);
- }
--EXPORT_SYMBOL(nftnl_chain_free);
- 
--bool nftnl_chain_is_set(const struct nftnl_chain *c, uint16_t attr)
-+bool __EXPORTED nftnl_chain_is_set(const struct nftnl_chain *c, uint16_t attr)
- {
- 	return c->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_chain_is_set);
- 
--void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
-+void __EXPORTED nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
- {
- 	if (!(c->flags & (1 << attr)))
- 		return;
-@@ -147,7 +144,6 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
- 
- 	c->flags &= ~(1 << attr);
- }
--EXPORT_SYMBOL(nftnl_chain_unset);
- 
- static uint32_t nftnl_chain_validate[NFTNL_CHAIN_MAX + 1] = {
- 	[NFTNL_CHAIN_HOOKNUM]	= sizeof(uint32_t),
-@@ -159,7 +155,7 @@ static uint32_t nftnl_chain_validate[NFTNL_CHAIN_MAX + 1] = {
- 	[NFTNL_CHAIN_FAMILY]		= sizeof(uint32_t),
- };
- 
--int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
-+int __EXPORTED nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
- 			 const void *data, uint32_t data_len)
- {
- 	nftnl_assert_attr_exists(attr, NFTNL_CHAIN_MAX);
-@@ -226,45 +222,38 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
- 	c->flags |= (1 << attr);
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_chain_set_data);
- 
--void nftnl_chain_set(struct nftnl_chain *c, uint16_t attr, const void *data)
-+void __EXPORTED nftnl_chain_set(struct nftnl_chain *c, uint16_t attr, const void *data)
- {
- 	nftnl_chain_set_data(c, attr, data, nftnl_chain_validate[attr]);
- }
--EXPORT_SYMBOL(nftnl_chain_set);
- 
--void nftnl_chain_set_u32(struct nftnl_chain *c, uint16_t attr, uint32_t data)
-+void __EXPORTED nftnl_chain_set_u32(struct nftnl_chain *c, uint16_t attr, uint32_t data)
- {
- 	nftnl_chain_set_data(c, attr, &data, sizeof(uint32_t));
- }
--EXPORT_SYMBOL(nftnl_chain_set_u32);
- 
--void nftnl_chain_set_s32(struct nftnl_chain *c, uint16_t attr, int32_t data)
-+void __EXPORTED nftnl_chain_set_s32(struct nftnl_chain *c, uint16_t attr, int32_t data)
- {
- 	nftnl_chain_set_data(c, attr, &data, sizeof(int32_t));
- }
--EXPORT_SYMBOL(nftnl_chain_set_s32);
- 
--void nftnl_chain_set_u64(struct nftnl_chain *c, uint16_t attr, uint64_t data)
-+void __EXPORTED nftnl_chain_set_u64(struct nftnl_chain *c, uint16_t attr, uint64_t data)
- {
- 	nftnl_chain_set_data(c, attr, &data, sizeof(uint64_t));
- }
--EXPORT_SYMBOL(nftnl_chain_set_u64);
- 
--void nftnl_chain_set_u8(struct nftnl_chain *c, uint16_t attr, uint8_t data)
-+void __EXPORTED nftnl_chain_set_u8(struct nftnl_chain *c, uint16_t attr, uint8_t data)
- {
- 	nftnl_chain_set_data(c, attr, &data, sizeof(uint8_t));
- }
--EXPORT_SYMBOL(nftnl_chain_set_u8);
- 
--int nftnl_chain_set_str(struct nftnl_chain *c, uint16_t attr, const char *str)
-+int __EXPORTED nftnl_chain_set_str(struct nftnl_chain *c, uint16_t attr, const char *str)
- {
- 	return nftnl_chain_set_data(c, attr, str, strlen(str) + 1);
- }
--EXPORT_SYMBOL(nftnl_chain_set_str);
- 
--const void *nftnl_chain_get_data(const struct nftnl_chain *c, uint16_t attr,
-+const void __EXPORTED *nftnl_chain_get_data(const struct nftnl_chain *c, uint16_t attr,
- 				 uint32_t *data_len)
- {
- 	if (!(c->flags & (1 << attr)))
-@@ -310,22 +299,19 @@ const void *nftnl_chain_get_data(const struct nftnl_chain *c, uint16_t attr,
- 	}
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_chain_get_data);
- 
--const void *nftnl_chain_get(const struct nftnl_chain *c, uint16_t attr)
-+const void __EXPORTED *nftnl_chain_get(const struct nftnl_chain *c, uint16_t attr)
- {
- 	uint32_t data_len;
- 	return nftnl_chain_get_data(c, attr, &data_len);
- }
--EXPORT_SYMBOL(nftnl_chain_get);
- 
--const char *nftnl_chain_get_str(const struct nftnl_chain *c, uint16_t attr)
-+const char __EXPORTED *nftnl_chain_get_str(const struct nftnl_chain *c, uint16_t attr)
- {
- 	return nftnl_chain_get(c, attr);
- }
--EXPORT_SYMBOL(nftnl_chain_get_str);
- 
--uint32_t nftnl_chain_get_u32(const struct nftnl_chain *c, uint16_t attr)
-+uint32_t __EXPORTED nftnl_chain_get_u32(const struct nftnl_chain *c, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const uint32_t *val = nftnl_chain_get_data(c, attr, &data_len);
-@@ -334,9 +320,8 @@ uint32_t nftnl_chain_get_u32(const struct nftnl_chain *c, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_chain_get_u32);
- 
--int32_t nftnl_chain_get_s32(const struct nftnl_chain *c, uint16_t attr)
-+int32_t __EXPORTED nftnl_chain_get_s32(const struct nftnl_chain *c, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const int32_t *val = nftnl_chain_get_data(c, attr, &data_len);
-@@ -345,9 +330,8 @@ int32_t nftnl_chain_get_s32(const struct nftnl_chain *c, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_chain_get_s32);
- 
--uint64_t nftnl_chain_get_u64(const struct nftnl_chain *c, uint16_t attr)
-+uint64_t __EXPORTED nftnl_chain_get_u64(const struct nftnl_chain *c, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const uint64_t *val = nftnl_chain_get_data(c, attr, &data_len);
-@@ -356,9 +340,8 @@ uint64_t nftnl_chain_get_u64(const struct nftnl_chain *c, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_chain_get_u64);
- 
--uint8_t nftnl_chain_get_u8(const struct nftnl_chain *c, uint16_t attr)
-+uint8_t __EXPORTED nftnl_chain_get_u8(const struct nftnl_chain *c, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const uint8_t *val = nftnl_chain_get_data(c, attr, &data_len);
-@@ -367,9 +350,8 @@ uint8_t nftnl_chain_get_u8(const struct nftnl_chain *c, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_chain_get_u8);
- 
--void nftnl_chain_nlmsg_build_payload(struct nlmsghdr *nlh, const struct nftnl_chain *c)
-+void __EXPORTED nftnl_chain_nlmsg_build_payload(struct nlmsghdr *nlh, const struct nftnl_chain *c)
- {
- 	if (c->flags & (1 << NFTNL_CHAIN_TABLE))
- 		mnl_attr_put_strz(nlh, NFTA_CHAIN_TABLE, c->table);
-@@ -404,7 +386,6 @@ void nftnl_chain_nlmsg_build_payload(struct nlmsghdr *nlh, const struct nftnl_ch
- 	if (c->flags & (1 << NFTNL_CHAIN_TYPE))
- 		mnl_attr_put_strz(nlh, NFTA_CHAIN_TYPE, c->type);
- }
--EXPORT_SYMBOL(nftnl_chain_nlmsg_build_payload);
- 
- static int nftnl_chain_parse_attr_cb(const struct nlattr *attr, void *data)
- {
-@@ -529,7 +510,7 @@ static int nftnl_chain_parse_hook(struct nlattr *attr, struct nftnl_chain *c)
- 	return 0;
- }
- 
--int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
-+int __EXPORTED nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
- {
- 	struct nlattr *tb[NFTA_CHAIN_MAX+1] = {};
- 	struct nfgenmsg *nfg = mnl_nlmsg_get_payload(nlh);
-@@ -590,7 +571,6 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nftnl_chain_nlmsg_parse);
- 
- static inline int nftnl_str2hooknum(int family, const char *hook)
- {
-@@ -732,19 +712,17 @@ static int nftnl_chain_do_parse(struct nftnl_chain *c, enum nftnl_parse_type typ
- 	return ret;
- }
- 
--int nftnl_chain_parse(struct nftnl_chain *c, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_chain_parse(struct nftnl_chain *c, enum nftnl_parse_type type,
- 		    const char *data, struct nftnl_parse_err *err)
- {
- 	return nftnl_chain_do_parse(c, type, data, err, NFTNL_PARSE_BUFFER);
- }
--EXPORT_SYMBOL(nftnl_chain_parse);
- 
--int nftnl_chain_parse_file(struct nftnl_chain *c, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_chain_parse_file(struct nftnl_chain *c, enum nftnl_parse_type type,
- 			 FILE *fp, struct nftnl_parse_err *err)
- {
- 	return nftnl_chain_do_parse(c, type, fp, err, NFTNL_PARSE_FILE);
- }
--EXPORT_SYMBOL(nftnl_chain_parse_file);
- 
- static int nftnl_chain_export(char *buf, size_t size,
- 			      const struct nftnl_chain *c, int type)
-@@ -841,13 +819,12 @@ static int nftnl_chain_cmd_snprintf(char *buf, size_t size,
- 	return offset;
- }
- 
--int nftnl_chain_snprintf(char *buf, size_t size, const struct nftnl_chain *c,
-+int __EXPORTED nftnl_chain_snprintf(char *buf, size_t size, const struct nftnl_chain *c,
- 			 uint32_t type, uint32_t flags)
- {
- 	return nftnl_chain_cmd_snprintf(buf, size, c, nftnl_flag2cmd(flags), type,
- 				      flags);
- }
--EXPORT_SYMBOL(nftnl_chain_snprintf);
- 
- static int nftnl_chain_do_snprintf(char *buf, size_t size, const void *c,
- 				   uint32_t cmd, uint32_t type, uint32_t flags)
-@@ -855,19 +832,18 @@ static int nftnl_chain_do_snprintf(char *buf, size_t size, const void *c,
- 	return nftnl_chain_snprintf(buf, size, c, type, flags);
- }
- 
--int nftnl_chain_fprintf(FILE *fp, const struct nftnl_chain *c, uint32_t type,
-+int __EXPORTED nftnl_chain_fprintf(FILE *fp, const struct nftnl_chain *c, uint32_t type,
- 			uint32_t flags)
- {
- 	return nftnl_fprintf(fp, c, NFTNL_CMD_UNSPEC, type, flags,
- 			   nftnl_chain_do_snprintf);
- }
--EXPORT_SYMBOL(nftnl_chain_fprintf);
- 
- struct nftnl_chain_list {
- 	struct list_head list;
- };
- 
--struct nftnl_chain_list *nftnl_chain_list_alloc(void)
-+struct nftnl_chain_list __EXPORTED *nftnl_chain_list_alloc(void)
- {
- 	struct nftnl_chain_list *list;
- 
-@@ -879,9 +855,8 @@ struct nftnl_chain_list *nftnl_chain_list_alloc(void)
- 
- 	return list;
- }
--EXPORT_SYMBOL(nftnl_chain_list_alloc);
- 
--void nftnl_chain_list_free(struct nftnl_chain_list *list)
-+void __EXPORTED nftnl_chain_list_free(struct nftnl_chain_list *list)
- {
- 	struct nftnl_chain *r, *tmp;
- 
-@@ -891,33 +866,28 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
- 	}
- 	xfree(list);
- }
--EXPORT_SYMBOL(nftnl_chain_list_free);
- 
--int nftnl_chain_list_is_empty(const struct nftnl_chain_list *list)
-+int __EXPORTED nftnl_chain_list_is_empty(const struct nftnl_chain_list *list)
- {
- 	return list_empty(&list->list);
- }
--EXPORT_SYMBOL(nftnl_chain_list_is_empty);
- 
--void nftnl_chain_list_add(struct nftnl_chain *r, struct nftnl_chain_list *list)
-+void __EXPORTED nftnl_chain_list_add(struct nftnl_chain *r, struct nftnl_chain_list *list)
- {
- 	list_add(&r->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_chain_list_add);
- 
--void nftnl_chain_list_add_tail(struct nftnl_chain *r, struct nftnl_chain_list *list)
-+void __EXPORTED nftnl_chain_list_add_tail(struct nftnl_chain *r, struct nftnl_chain_list *list)
- {
- 	list_add_tail(&r->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_chain_list_add_tail);
- 
--void nftnl_chain_list_del(struct nftnl_chain *r)
-+void __EXPORTED nftnl_chain_list_del(struct nftnl_chain *r)
- {
- 	list_del(&r->head);
- }
--EXPORT_SYMBOL(nftnl_chain_list_del);
- 
--int nftnl_chain_list_foreach(struct nftnl_chain_list *chain_list,
-+int __EXPORTED nftnl_chain_list_foreach(struct nftnl_chain_list *chain_list,
- 			   int (*cb)(struct nftnl_chain *r, void *data),
- 			   void *data)
- {
-@@ -931,14 +901,13 @@ int nftnl_chain_list_foreach(struct nftnl_chain_list *chain_list,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_chain_list_foreach);
- 
- struct nftnl_chain_list_iter {
- 	const struct nftnl_chain_list	*list;
- 	struct nftnl_chain		*cur;
- };
- 
--struct nftnl_chain_list_iter *
-+struct nftnl_chain_list_iter __EXPORTED *
- nftnl_chain_list_iter_create(const struct nftnl_chain_list *l)
- {
- 	struct nftnl_chain_list_iter *iter;
-@@ -955,9 +924,8 @@ nftnl_chain_list_iter_create(const struct nftnl_chain_list *l)
- 
- 	return iter;
- }
--EXPORT_SYMBOL(nftnl_chain_list_iter_create);
- 
--struct nftnl_chain *nftnl_chain_list_iter_next(struct nftnl_chain_list_iter *iter)
-+struct nftnl_chain __EXPORTED *nftnl_chain_list_iter_next(struct nftnl_chain_list_iter *iter)
- {
- 	struct nftnl_chain *r = iter->cur;
- 
-@@ -971,10 +939,8 @@ struct nftnl_chain *nftnl_chain_list_iter_next(struct nftnl_chain_list_iter *ite
- 
- 	return r;
- }
--EXPORT_SYMBOL(nftnl_chain_list_iter_next);
- 
--void nftnl_chain_list_iter_destroy(struct nftnl_chain_list_iter *iter)
-+void __EXPORTED nftnl_chain_list_iter_destroy(struct nftnl_chain_list_iter *iter)
- {
- 	xfree(iter);
- }
--EXPORT_SYMBOL(nftnl_chain_list_iter_destroy);
-diff --git a/src/common.c b/src/common.c
-index a95883c..68bce2e 100644
---- a/src/common.c
-+++ b/src/common.c
-@@ -43,15 +43,14 @@ static struct nlmsghdr *__nftnl_nlmsg_build_hdr(char *buf, uint16_t type,
- 	return nlh;
- }
- 
--struct nlmsghdr *nftnl_nlmsg_build_hdr(char *buf, uint16_t type, uint16_t family,
-+struct nlmsghdr __EXPORTED *nftnl_nlmsg_build_hdr(char *buf, uint16_t type, uint16_t family,
- 				       uint16_t flags, uint32_t seq)
- {
- 	return __nftnl_nlmsg_build_hdr(buf, (NFNL_SUBSYS_NFTABLES << 8) | type,
- 				       family, flags, seq, 0);
- }
--EXPORT_SYMBOL(nftnl_nlmsg_build_hdr);
- 
--struct nftnl_parse_err *nftnl_parse_err_alloc(void)
-+struct nftnl_parse_err __EXPORTED *nftnl_parse_err_alloc(void)
- {
- 	struct nftnl_parse_err *err;
- 
-@@ -63,15 +62,13 @@ struct nftnl_parse_err *nftnl_parse_err_alloc(void)
- 
- 	return err;
- }
--EXPORT_SYMBOL(nftnl_parse_err_alloc);
- 
--void nftnl_parse_err_free(struct nftnl_parse_err *err)
-+void __EXPORTED nftnl_parse_err_free(struct nftnl_parse_err *err)
- {
- 	xfree(err);
- }
--EXPORT_SYMBOL(nftnl_parse_err_free);
- 
--int nftnl_parse_perror(const char *msg, struct nftnl_parse_err *err)
-+int __EXPORTED nftnl_parse_perror(const char *msg, struct nftnl_parse_err *err)
- {
- 	switch (err->error) {
- 	case NFTNL_PARSE_EBADINPUT:
-@@ -89,7 +86,6 @@ int nftnl_parse_perror(const char *msg, struct nftnl_parse_err *err)
- 		return fprintf(stderr, "%s: Undefined error\n", msg);
- 	}
- }
--EXPORT_SYMBOL(nftnl_parse_perror);
- 
- int nftnl_cmd_header_snprintf(char *buf, size_t size, uint32_t cmd, uint32_t type,
- 			    uint32_t flags)
-@@ -165,21 +161,19 @@ int nftnl_cmd_footer_fprintf(FILE *fp, uint32_t cmd, uint32_t type,
- 			   nftnl_cmd_footer_fprintf_cb);
- }
- 
--struct nlmsghdr *nftnl_batch_begin(char *buf, uint32_t seq)
-+struct nlmsghdr __EXPORTED *nftnl_batch_begin(char *buf, uint32_t seq)
- {
- 	return __nftnl_nlmsg_build_hdr(buf, NFNL_MSG_BATCH_BEGIN, AF_UNSPEC,
- 				       0, seq, NFNL_SUBSYS_NFTABLES);
- }
--EXPORT_SYMBOL(nftnl_batch_begin);
- 
--struct nlmsghdr *nftnl_batch_end(char *buf, uint32_t seq)
-+struct nlmsghdr __EXPORTED *nftnl_batch_end(char *buf, uint32_t seq)
- {
- 	return __nftnl_nlmsg_build_hdr(buf, NFNL_MSG_BATCH_END, AF_UNSPEC,
- 				       0, seq, NFNL_SUBSYS_NFTABLES);
- }
--EXPORT_SYMBOL(nftnl_batch_end);
- 
--int nftnl_batch_is_supported(void)
-+int __EXPORTED nftnl_batch_is_supported(void)
- {
- 	struct mnl_socket *nl;
- 	struct mnl_nlmsg_batch *b;
-@@ -236,4 +230,3 @@ err:
- 	mnl_nlmsg_batch_stop(b);
- 	return -1;
- }
--EXPORT_SYMBOL(nftnl_batch_is_supported);
-diff --git a/src/expr.c b/src/expr.c
-index 10ba2c4..c7eb2b4 100644
---- a/src/expr.c
-+++ b/src/expr.c
-@@ -24,7 +24,7 @@
- 
- #include <libnftnl/expr.h>
- 
--struct nftnl_expr *nftnl_expr_alloc(const char *name)
-+struct nftnl_expr __EXPORTED *nftnl_expr_alloc(const char *name)
- {
- 	struct nftnl_expr *expr;
- 	struct expr_ops *ops;
-@@ -43,24 +43,21 @@ struct nftnl_expr *nftnl_expr_alloc(const char *name)
- 
- 	return expr;
- }
--EXPORT_SYMBOL(nftnl_expr_alloc);
- 
--void nftnl_expr_free(const struct nftnl_expr *expr)
-+void __EXPORTED nftnl_expr_free(const struct nftnl_expr *expr)
- {
- 	if (expr->ops->free)
- 		expr->ops->free(expr);
- 
- 	xfree(expr);
- }
--EXPORT_SYMBOL(nftnl_expr_free);
- 
--bool nftnl_expr_is_set(const struct nftnl_expr *expr, uint16_t type)
-+bool __EXPORTED nftnl_expr_is_set(const struct nftnl_expr *expr, uint16_t type)
- {
- 	return expr->flags & (1 << type);
- }
--EXPORT_SYMBOL(nftnl_expr_is_set);
- 
--int nftnl_expr_set(struct nftnl_expr *expr, uint16_t type,
-+int __EXPORTED nftnl_expr_set(struct nftnl_expr *expr, uint16_t type,
- 		   const void *data, uint32_t data_len)
- {
- 	switch(type) {
-@@ -73,43 +70,37 @@ int nftnl_expr_set(struct nftnl_expr *expr, uint16_t type,
- 	expr->flags |= (1 << type);
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_expr_set);
- 
--void
-+void __EXPORTED
- nftnl_expr_set_u8(struct nftnl_expr *expr, uint16_t type, uint8_t data)
- {
- 	nftnl_expr_set(expr, type, &data, sizeof(uint8_t));
- }
--EXPORT_SYMBOL(nftnl_expr_set_u8);
- 
--void
-+void __EXPORTED
- nftnl_expr_set_u16(struct nftnl_expr *expr, uint16_t type, uint16_t data)
- {
- 	nftnl_expr_set(expr, type, &data, sizeof(uint16_t));
- }
--EXPORT_SYMBOL(nftnl_expr_set_u16);
- 
--void
-+void __EXPORTED
- nftnl_expr_set_u32(struct nftnl_expr *expr, uint16_t type, uint32_t data)
- {
- 	nftnl_expr_set(expr, type, &data, sizeof(uint32_t));
- }
--EXPORT_SYMBOL(nftnl_expr_set_u32);
- 
--void
-+void __EXPORTED
- nftnl_expr_set_u64(struct nftnl_expr *expr, uint16_t type, uint64_t data)
- {
- 	nftnl_expr_set(expr, type, &data, sizeof(uint64_t));
- }
--EXPORT_SYMBOL(nftnl_expr_set_u64);
- 
--int nftnl_expr_set_str(struct nftnl_expr *expr, uint16_t type, const char *str)
-+int __EXPORTED nftnl_expr_set_str(struct nftnl_expr *expr, uint16_t type, const char *str)
- {
- 	return nftnl_expr_set(expr, type, str, strlen(str) + 1);
- }
--EXPORT_SYMBOL(nftnl_expr_set_str);
- 
--const void *nftnl_expr_get(const struct nftnl_expr *expr,
-+const void __EXPORTED *nftnl_expr_get(const struct nftnl_expr *expr,
- 			      uint16_t type, uint32_t *data_len)
- {
- 	const void *ret;
-@@ -129,9 +120,8 @@ const void *nftnl_expr_get(const struct nftnl_expr *expr,
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nftnl_expr_get);
- 
--uint8_t nftnl_expr_get_u8(const struct nftnl_expr *expr, uint16_t type)
-+uint8_t __EXPORTED nftnl_expr_get_u8(const struct nftnl_expr *expr, uint16_t type)
- {
- 	const void *data;
- 	uint32_t data_len;
-@@ -145,9 +135,8 @@ uint8_t nftnl_expr_get_u8(const struct nftnl_expr *expr, uint16_t type)
- 
- 	return *((uint8_t *)data);
- }
--EXPORT_SYMBOL(nftnl_expr_get_u8);
- 
--uint16_t nftnl_expr_get_u16(const struct nftnl_expr *expr, uint16_t type)
-+uint16_t __EXPORTED nftnl_expr_get_u16(const struct nftnl_expr *expr, uint16_t type)
- {
- 	const void *data;
- 	uint32_t data_len;
-@@ -161,9 +150,8 @@ uint16_t nftnl_expr_get_u16(const struct nftnl_expr *expr, uint16_t type)
- 
- 	return *((uint16_t *)data);
- }
--EXPORT_SYMBOL(nftnl_expr_get_u16);
- 
--uint32_t nftnl_expr_get_u32(const struct nftnl_expr *expr, uint16_t type)
-+uint32_t __EXPORTED nftnl_expr_get_u32(const struct nftnl_expr *expr, uint16_t type)
- {
- 	const void *data;
- 	uint32_t data_len;
-@@ -177,9 +165,8 @@ uint32_t nftnl_expr_get_u32(const struct nftnl_expr *expr, uint16_t type)
- 
- 	return *((uint32_t *)data);
- }
--EXPORT_SYMBOL(nftnl_expr_get_u32);
- 
--uint64_t nftnl_expr_get_u64(const struct nftnl_expr *expr, uint16_t type)
-+uint64_t __EXPORTED nftnl_expr_get_u64(const struct nftnl_expr *expr, uint16_t type)
- {
- 	const void *data;
- 	uint32_t data_len;
-@@ -193,17 +180,15 @@ uint64_t nftnl_expr_get_u64(const struct nftnl_expr *expr, uint16_t type)
- 
- 	return *((uint64_t *)data);
- }
--EXPORT_SYMBOL(nftnl_expr_get_u64);
- 
--const char *nftnl_expr_get_str(const struct nftnl_expr *expr, uint16_t type)
-+const char __EXPORTED *nftnl_expr_get_str(const struct nftnl_expr *expr, uint16_t type)
- {
- 	uint32_t data_len;
- 
- 	return (const char *)nftnl_expr_get(expr, type, &data_len);
- }
--EXPORT_SYMBOL(nftnl_expr_get_str);
- 
--bool nftnl_expr_cmp(const struct nftnl_expr *e1, const struct nftnl_expr *e2)
-+bool __EXPORTED nftnl_expr_cmp(const struct nftnl_expr *e1, const struct nftnl_expr *e2)
- {
- 	if (e1->flags != e2->flags ||
- 	    strcmp(e1->ops->name, e2->ops->name) != 0)
-@@ -211,7 +196,6 @@ bool nftnl_expr_cmp(const struct nftnl_expr *e1, const struct nftnl_expr *e2)
- 
- 	return e1->ops->cmp(e1, e2);
- }
--EXPORT_SYMBOL(nftnl_expr_cmp);
- 
- void nftnl_expr_build_payload(struct nlmsghdr *nlh, struct nftnl_expr *expr)
- {
-@@ -275,7 +259,7 @@ err1:
- 	return NULL;
- }
- 
--int nftnl_expr_snprintf(char *buf, size_t size, const struct nftnl_expr *expr,
-+int __EXPORTED nftnl_expr_snprintf(char *buf, size_t size, const struct nftnl_expr *expr,
- 			uint32_t type, uint32_t flags)
- {
- 	int ret;
-@@ -289,4 +273,3 @@ int nftnl_expr_snprintf(char *buf, size_t size, const struct nftnl_expr *expr,
- 
- 	return offset;
- }
--EXPORT_SYMBOL(nftnl_expr_snprintf);
-diff --git a/src/gen.c b/src/gen.c
-index 213562e..8b45caa 100644
---- a/src/gen.c
-+++ b/src/gen.c
-@@ -29,25 +29,22 @@ struct nftnl_gen {
- 	uint32_t flags;
- };
- 
--struct nftnl_gen *nftnl_gen_alloc(void)
-+struct nftnl_gen __EXPORTED *nftnl_gen_alloc(void)
- {
- 	return calloc(1, sizeof(struct nftnl_gen));
- }
--EXPORT_SYMBOL(nftnl_gen_alloc);
- 
--void nftnl_gen_free(const struct nftnl_gen *gen)
-+void __EXPORTED nftnl_gen_free(const struct nftnl_gen *gen)
- {
- 	xfree(gen);
- }
--EXPORT_SYMBOL(nftnl_gen_free);
- 
--bool nftnl_gen_is_set(const struct nftnl_gen *gen, uint16_t attr)
-+bool __EXPORTED nftnl_gen_is_set(const struct nftnl_gen *gen, uint16_t attr)
- {
- 	return gen->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_gen_is_set);
- 
--void nftnl_gen_unset(struct nftnl_gen *gen, uint16_t attr)
-+void __EXPORTED nftnl_gen_unset(struct nftnl_gen *gen, uint16_t attr)
- {
- 	if (!(gen->flags & (1 << attr)))
- 		return;
-@@ -58,13 +55,12 @@ void nftnl_gen_unset(struct nftnl_gen *gen, uint16_t attr)
- 	}
- 	gen->flags &= ~(1 << attr);
- }
--EXPORT_SYMBOL(nftnl_gen_unset);
- 
- static uint32_t nftnl_gen_validate[NFTNL_GEN_MAX + 1] = {
- 	[NFTNL_GEN_ID]	= sizeof(uint32_t),
- };
- 
--int nftnl_gen_set_data(struct nftnl_gen *gen, uint16_t attr,
-+int __EXPORTED nftnl_gen_set_data(struct nftnl_gen *gen, uint16_t attr,
- 		       const void *data, uint32_t data_len)
- {
- 	nftnl_assert_attr_exists(attr, NFTNL_GEN_MAX);
-@@ -78,21 +74,18 @@ int nftnl_gen_set_data(struct nftnl_gen *gen, uint16_t attr,
- 	gen->flags |= (1 << attr);
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_gen_set_data);
- 
--int nftnl_gen_set(struct nftnl_gen *gen, uint16_t attr, const void *data)
-+int __EXPORTED nftnl_gen_set(struct nftnl_gen *gen, uint16_t attr, const void *data)
- {
- 	return nftnl_gen_set_data(gen, attr, data, nftnl_gen_validate[attr]);
- }
--EXPORT_SYMBOL(nftnl_gen_set);
- 
--void nftnl_gen_set_u32(struct nftnl_gen *gen, uint16_t attr, uint32_t val)
-+void __EXPORTED nftnl_gen_set_u32(struct nftnl_gen *gen, uint16_t attr, uint32_t val)
- {
- 	nftnl_gen_set_data(gen, attr, &val, sizeof(uint32_t));
- }
--EXPORT_SYMBOL(nftnl_gen_set_u32);
- 
--const void *nftnl_gen_get_data(const struct nftnl_gen *gen, uint16_t attr,
-+const void __EXPORTED *nftnl_gen_get_data(const struct nftnl_gen *gen, uint16_t attr,
- 			       uint32_t *data_len)
- {
- 	if (!(gen->flags & (1 << attr)))
-@@ -105,21 +98,18 @@ const void *nftnl_gen_get_data(const struct nftnl_gen *gen, uint16_t attr,
- 	}
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_gen_get_data);
- 
--const void *nftnl_gen_get(const struct nftnl_gen *gen, uint16_t attr)
-+const void __EXPORTED *nftnl_gen_get(const struct nftnl_gen *gen, uint16_t attr)
- {
- 	uint32_t data_len;
- 	return nftnl_gen_get_data(gen, attr, &data_len);
- }
--EXPORT_SYMBOL(nftnl_gen_get);
- 
--uint32_t nftnl_gen_get_u32(const struct nftnl_gen *gen, uint16_t attr)
-+uint32_t __EXPORTED nftnl_gen_get_u32(const struct nftnl_gen *gen, uint16_t attr)
- {
- 	const void *ret = nftnl_gen_get(gen, attr);
- 	return ret == NULL ? 0 : *((uint32_t *)ret);
- }
--EXPORT_SYMBOL(nftnl_gen_get_u32);
- 
- static int nftnl_gen_parse_attr_cb(const struct nlattr *attr, void *data)
- {
-@@ -140,7 +130,7 @@ static int nftnl_gen_parse_attr_cb(const struct nlattr *attr, void *data)
- 	return MNL_CB_OK;
- }
- 
--int nftnl_gen_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_gen *gen)
-+int __EXPORTED nftnl_gen_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_gen *gen)
- {
- 	struct nlattr *tb[NFTA_GEN_MAX + 1] = {};
- 	struct nfgenmsg *nfg = mnl_nlmsg_get_payload(nlh);
-@@ -154,7 +144,6 @@ int nftnl_gen_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_gen *gen)
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_gen_nlmsg_parse);
- 
- static int nftnl_gen_snprintf_default(char *buf, size_t size,
- 				      const struct nftnl_gen *gen)
-@@ -186,13 +175,12 @@ static int nftnl_gen_cmd_snprintf(char *buf, size_t size,
- 	return offset;
- }
- 
--int nftnl_gen_snprintf(char *buf, size_t size, const struct nftnl_gen *gen,
-+int __EXPORTED nftnl_gen_snprintf(char *buf, size_t size, const struct nftnl_gen *gen,
- 		       uint32_t type, uint32_t flags)
- {;
- 	return nftnl_gen_cmd_snprintf(buf, size, gen, nftnl_flag2cmd(flags), type,
- 				    flags);
- }
--EXPORT_SYMBOL(nftnl_gen_snprintf);
- 
- static int nftnl_gen_do_snprintf(char *buf, size_t size, const void *gen,
- 				 uint32_t cmd, uint32_t type, uint32_t flags)
-@@ -200,10 +188,9 @@ static int nftnl_gen_do_snprintf(char *buf, size_t size, const void *gen,
- 	return nftnl_gen_snprintf(buf, size, gen, type, flags);
- }
- 
--int nftnl_gen_fprintf(FILE *fp, const struct nftnl_gen *gen, uint32_t type,
-+int __EXPORTED nftnl_gen_fprintf(FILE *fp, const struct nftnl_gen *gen, uint32_t type,
- 		      uint32_t flags)
- {
- 	return nftnl_fprintf(fp, gen, NFTNL_CMD_UNSPEC, type, flags,
- 			   nftnl_gen_do_snprintf);
- }
--EXPORT_SYMBOL(nftnl_gen_fprintf);
-diff --git a/src/object.c b/src/object.c
-index e1a5ac4..d409c6d 100644
---- a/src/object.c
-+++ b/src/object.c
-@@ -39,13 +39,12 @@ static struct obj_ops *nftnl_obj_ops_lookup(uint32_t type)
- 	return obj_ops[type];
- }
- 
--struct nftnl_obj *nftnl_obj_alloc(void)
-+struct nftnl_obj __EXPORTED *nftnl_obj_alloc(void)
- {
- 	return calloc(1, sizeof(struct nftnl_obj));
- }
--EXPORT_SYMBOL(nftnl_obj_alloc);
- 
--void nftnl_obj_free(const struct nftnl_obj *obj)
-+void __EXPORTED nftnl_obj_free(const struct nftnl_obj *obj)
- {
- 	if (obj->flags & (1 << NFTNL_OBJ_TABLE))
- 		xfree(obj->table);
-@@ -54,20 +53,18 @@ void nftnl_obj_free(const struct nftnl_obj *obj)
- 
- 	xfree(obj);
- }
--EXPORT_SYMBOL(nftnl_obj_free);
- 
--bool nftnl_obj_is_set(const struct nftnl_obj *obj, uint16_t attr)
-+bool __EXPORTED nftnl_obj_is_set(const struct nftnl_obj *obj, uint16_t attr)
- {
- 	return obj->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_obj_is_set);
- 
- static uint32_t nftnl_obj_validate[NFTNL_OBJ_MAX + 1] = {
- 	[NFTNL_OBJ_FAMILY]	= sizeof(uint32_t),
- 	[NFTNL_OBJ_USE]		= sizeof(uint32_t),
- };
- 
--void nftnl_obj_set_data(struct nftnl_obj *obj, uint16_t attr,
-+void __EXPORTED nftnl_obj_set_data(struct nftnl_obj *obj, uint16_t attr,
- 			const void *data, uint32_t data_len)
- {
- 	if (attr < NFTNL_OBJ_MAX)
-@@ -100,45 +97,38 @@ void nftnl_obj_set_data(struct nftnl_obj *obj, uint16_t attr,
- 	}
- 	obj->flags |= (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_obj_set_data);
- 
--void nftnl_obj_set(struct nftnl_obj *obj, uint16_t attr, const void *data)
-+void __EXPORTED nftnl_obj_set(struct nftnl_obj *obj, uint16_t attr, const void *data)
- {
- 	nftnl_obj_set_data(obj, attr, data, nftnl_obj_validate[attr]);
- }
--EXPORT_SYMBOL(nftnl_obj_set);
- 
--void nftnl_obj_set_u8(struct nftnl_obj *obj, uint16_t attr, uint8_t val)
-+void __EXPORTED nftnl_obj_set_u8(struct nftnl_obj *obj, uint16_t attr, uint8_t val)
- {
- 	nftnl_obj_set_data(obj, attr, &val, sizeof(uint8_t));
- }
--EXPORT_SYMBOL(nftnl_obj_set_u8);
- 
--void nftnl_obj_set_u16(struct nftnl_obj *obj, uint16_t attr, uint16_t val)
-+void __EXPORTED nftnl_obj_set_u16(struct nftnl_obj *obj, uint16_t attr, uint16_t val)
- {
- 	nftnl_obj_set_data(obj, attr, &val, sizeof(uint16_t));
- }
--EXPORT_SYMBOL(nftnl_obj_set_u16);
- 
--void nftnl_obj_set_u32(struct nftnl_obj *obj, uint16_t attr, uint32_t val)
-+void __EXPORTED nftnl_obj_set_u32(struct nftnl_obj *obj, uint16_t attr, uint32_t val)
- {
- 	nftnl_obj_set_data(obj, attr, &val, sizeof(uint32_t));
- }
--EXPORT_SYMBOL(nftnl_obj_set_u32);
- 
--void nftnl_obj_set_u64(struct nftnl_obj *obj, uint16_t attr, uint64_t val)
-+void __EXPORTED nftnl_obj_set_u64(struct nftnl_obj *obj, uint16_t attr, uint64_t val)
- {
- 	nftnl_obj_set_data(obj, attr, &val, sizeof(uint64_t));
- }
--EXPORT_SYMBOL(nftnl_obj_set_u64);
- 
--void nftnl_obj_set_str(struct nftnl_obj *obj, uint16_t attr, const char *str)
-+void __EXPORTED nftnl_obj_set_str(struct nftnl_obj *obj, uint16_t attr, const char *str)
- {
- 	nftnl_obj_set_data(obj, attr, str, 0);
- }
--EXPORT_SYMBOL(nftnl_obj_set_str);
- 
--const void *nftnl_obj_get_data(struct nftnl_obj *obj, uint16_t attr,
-+const void __EXPORTED *nftnl_obj_get_data(struct nftnl_obj *obj, uint16_t attr,
- 			       uint32_t *data_len)
- {
- 	if (!(obj->flags & (1 << attr)))
-@@ -168,50 +158,43 @@ const void *nftnl_obj_get_data(struct nftnl_obj *obj, uint16_t attr,
- 	}
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_obj_get_data);
- 
--const void *nftnl_obj_get(struct nftnl_obj *obj, uint16_t attr)
-+const void __EXPORTED *nftnl_obj_get(struct nftnl_obj *obj, uint16_t attr)
- {
- 	uint32_t data_len;
- 	return nftnl_obj_get_data(obj, attr, &data_len);
- }
--EXPORT_SYMBOL(nftnl_obj_get);
- 
--uint8_t nftnl_obj_get_u8(struct nftnl_obj *obj, uint16_t attr)
-+uint8_t __EXPORTED nftnl_obj_get_u8(struct nftnl_obj *obj, uint16_t attr)
- {
- 	const void *ret = nftnl_obj_get(obj, attr);
- 	return ret == NULL ? 0 : *((uint8_t *)ret);
- }
--EXPORT_SYMBOL(nftnl_obj_get_u8);
- 
--uint16_t nftnl_obj_get_u16(struct nftnl_obj *obj, uint16_t attr)
-+uint16_t __EXPORTED nftnl_obj_get_u16(struct nftnl_obj *obj, uint16_t attr)
- {
- 	const void *ret = nftnl_obj_get(obj, attr);
- 	return ret == NULL ? 0 : *((uint16_t *)ret);
- }
--EXPORT_SYMBOL(nftnl_obj_get_u16);
- 
--uint32_t nftnl_obj_get_u32(struct nftnl_obj *obj, uint16_t attr)
-+uint32_t __EXPORTED nftnl_obj_get_u32(struct nftnl_obj *obj, uint16_t attr)
- {
- 	const void *ret = nftnl_obj_get(obj, attr);
- 	return ret == NULL ? 0 : *((uint32_t *)ret);
- }
--EXPORT_SYMBOL(nftnl_obj_get_u32);
- 
--uint64_t nftnl_obj_get_u64(struct nftnl_obj *obj, uint16_t attr)
-+uint64_t __EXPORTED nftnl_obj_get_u64(struct nftnl_obj *obj, uint16_t attr)
- {
- 	const void *ret = nftnl_obj_get(obj, attr);
- 	return ret == NULL ? 0 : *((uint64_t *)ret);
- }
--EXPORT_SYMBOL(nftnl_obj_get_u64);
- 
--const char *nftnl_obj_get_str(struct nftnl_obj *obj, uint16_t attr)
-+const char __EXPORTED *nftnl_obj_get_str(struct nftnl_obj *obj, uint16_t attr)
- {
- 	return nftnl_obj_get(obj, attr);
- }
--EXPORT_SYMBOL(nftnl_obj_get_str);
- 
--void nftnl_obj_nlmsg_build_payload(struct nlmsghdr *nlh,
-+void __EXPORTED nftnl_obj_nlmsg_build_payload(struct nlmsghdr *nlh,
- 				   const struct nftnl_obj *obj)
- {
- 	if (obj->flags & (1 << NFTNL_OBJ_TABLE))
-@@ -228,7 +211,6 @@ void nftnl_obj_nlmsg_build_payload(struct nlmsghdr *nlh,
- 		mnl_attr_nest_end(nlh, nest);
- 	}
- }
--EXPORT_SYMBOL(nftnl_obj_nlmsg_build_payload);
- 
- static int nftnl_obj_parse_attr_cb(const struct nlattr *attr, void *data)
- {
-@@ -258,7 +240,7 @@ static int nftnl_obj_parse_attr_cb(const struct nlattr *attr, void *data)
- 	return MNL_CB_OK;
- }
- 
--int nftnl_obj_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_obj *obj)
-+int __EXPORTED nftnl_obj_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_obj *obj)
- {
- 	struct nfgenmsg *nfg = mnl_nlmsg_get_payload(nlh);
- 	struct nlattr *tb[NFTA_OBJ_MAX + 1] = {};
-@@ -299,7 +281,6 @@ int nftnl_obj_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_obj *obj)
- 
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_obj_nlmsg_parse);
- 
- #ifdef JSON_PARSING
- static int nftnl_jansson_parse_obj(struct nftnl_obj *t, json_t *tree,
-@@ -377,19 +358,17 @@ static int nftnl_obj_do_parse(struct nftnl_obj *obj, enum nftnl_parse_type type,
- 	return ret;
- }
- 
--int nftnl_obj_parse(struct nftnl_obj *obj, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_obj_parse(struct nftnl_obj *obj, enum nftnl_parse_type type,
- 		      const char *data, struct nftnl_parse_err *err)
- {
- 	return nftnl_obj_do_parse(obj, type, data, err, NFTNL_PARSE_BUFFER);
- }
--EXPORT_SYMBOL(nftnl_obj_parse);
- 
--int nftnl_obj_parse_file(struct nftnl_obj *obj, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_obj_parse_file(struct nftnl_obj *obj, enum nftnl_parse_type type,
- 			   FILE *fp, struct nftnl_parse_err *err)
- {
- 	return nftnl_obj_do_parse(obj, type, fp, err, NFTNL_PARSE_FILE);
- }
--EXPORT_SYMBOL(nftnl_obj_parse_file);
- 
- static int nftnl_obj_export(char *buf, size_t size,
- 			    const struct nftnl_obj *obj,
-@@ -469,13 +448,12 @@ static int nftnl_obj_cmd_snprintf(char *buf, size_t size,
- 	return offset;
- }
- 
--int nftnl_obj_snprintf(char *buf, size_t size, const struct nftnl_obj *obj,
-+int __EXPORTED nftnl_obj_snprintf(char *buf, size_t size, const struct nftnl_obj *obj,
- 		       uint32_t type, uint32_t flags)
- {
- 	return nftnl_obj_cmd_snprintf(buf, size, obj, nftnl_flag2cmd(flags),
- 				      type, flags);
- }
--EXPORT_SYMBOL(nftnl_obj_snprintf);
- 
- static int nftnl_obj_do_snprintf(char *buf, size_t size, const void *obj,
- 				 uint32_t cmd, uint32_t type, uint32_t flags)
-@@ -483,19 +461,18 @@ static int nftnl_obj_do_snprintf(char *buf, size_t size, const void *obj,
- 	return nftnl_obj_snprintf(buf, size, obj, type, flags);
- }
- 
--int nftnl_obj_fprintf(FILE *fp, const struct nftnl_obj *obj, uint32_t type,
-+int __EXPORTED nftnl_obj_fprintf(FILE *fp, const struct nftnl_obj *obj, uint32_t type,
- 		      uint32_t flags)
- {
- 	return nftnl_fprintf(fp, obj, NFTNL_CMD_UNSPEC, type, flags,
- 			     nftnl_obj_do_snprintf);
- }
--EXPORT_SYMBOL(nftnl_obj_fprintf);
- 
- struct nftnl_obj_list {
- 	struct list_head list;
- };
- 
--struct nftnl_obj_list *nftnl_obj_list_alloc(void)
-+struct nftnl_obj_list __EXPORTED *nftnl_obj_list_alloc(void)
- {
- 	struct nftnl_obj_list *list;
- 
-@@ -507,9 +484,8 @@ struct nftnl_obj_list *nftnl_obj_list_alloc(void)
- 
- 	return list;
- }
--EXPORT_SYMBOL(nftnl_obj_list_alloc);
- 
--void nftnl_obj_list_free(struct nftnl_obj_list *list)
-+void __EXPORTED nftnl_obj_list_free(struct nftnl_obj_list *list)
- {
- 	struct nftnl_obj *r, *tmp;
- 
-@@ -519,34 +495,29 @@ void nftnl_obj_list_free(struct nftnl_obj_list *list)
- 	}
- 	xfree(list);
- }
--EXPORT_SYMBOL(nftnl_obj_list_free);
- 
--int nftnl_obj_list_is_empty(struct nftnl_obj_list *list)
-+int __EXPORTED nftnl_obj_list_is_empty(struct nftnl_obj_list *list)
- {
- 	return list_empty(&list->list);
- }
--EXPORT_SYMBOL(nftnl_obj_list_is_empty);
- 
--void nftnl_obj_list_add(struct nftnl_obj *r, struct nftnl_obj_list *list)
-+void __EXPORTED nftnl_obj_list_add(struct nftnl_obj *r, struct nftnl_obj_list *list)
- {
- 	list_add(&r->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_obj_list_add);
- 
--void nftnl_obj_list_add_tail(struct nftnl_obj *r,
-+void __EXPORTED nftnl_obj_list_add_tail(struct nftnl_obj *r,
- 			       struct nftnl_obj_list *list)
- {
- 	list_add_tail(&r->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_obj_list_add_tail);
- 
--void nftnl_obj_list_del(struct nftnl_obj *t)
-+void __EXPORTED nftnl_obj_list_del(struct nftnl_obj *t)
- {
- 	list_del(&t->head);
- }
--EXPORT_SYMBOL(nftnl_obj_list_del);
- 
--int nftnl_obj_list_foreach(struct nftnl_obj_list *table_list,
-+int __EXPORTED nftnl_obj_list_foreach(struct nftnl_obj_list *table_list,
- 			     int (*cb)(struct nftnl_obj *t, void *data),
- 			     void *data)
- {
-@@ -560,14 +531,13 @@ int nftnl_obj_list_foreach(struct nftnl_obj_list *table_list,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_obj_list_foreach);
- 
- struct nftnl_obj_list_iter {
- 	struct nftnl_obj_list	*list;
- 	struct nftnl_obj	*cur;
- };
- 
--struct nftnl_obj_list_iter *
-+struct nftnl_obj_list_iter __EXPORTED *
- nftnl_obj_list_iter_create(struct nftnl_obj_list *l)
- {
- 	struct nftnl_obj_list_iter *iter;
-@@ -584,9 +554,8 @@ nftnl_obj_list_iter_create(struct nftnl_obj_list *l)
- 
- 	return iter;
- }
--EXPORT_SYMBOL(nftnl_obj_list_iter_create);
- 
--struct nftnl_obj *nftnl_obj_list_iter_next(struct nftnl_obj_list_iter *iter)
-+struct nftnl_obj __EXPORTED *nftnl_obj_list_iter_next(struct nftnl_obj_list_iter *iter)
- {
- 	struct nftnl_obj *r = iter->cur;
- 
-@@ -600,10 +569,8 @@ struct nftnl_obj *nftnl_obj_list_iter_next(struct nftnl_obj_list_iter *iter)
- 
- 	return r;
- }
--EXPORT_SYMBOL(nftnl_obj_list_iter_next);
- 
--void nftnl_obj_list_iter_destroy(struct nftnl_obj_list_iter *iter)
-+void __EXPORTED nftnl_obj_list_iter_destroy(struct nftnl_obj_list_iter *iter)
- {
- 	xfree(iter);
- }
--EXPORT_SYMBOL(nftnl_obj_list_iter_destroy);
-diff --git a/src/rule.c b/src/rule.c
-index 6c22141..ad8609f 100644
---- a/src/rule.c
-+++ b/src/rule.c
-@@ -52,7 +52,7 @@ struct nftnl_rule {
- 	struct list_head expr_list;
- };
- 
--struct nftnl_rule *nftnl_rule_alloc(void)
-+struct nftnl_rule __EXPORTED *nftnl_rule_alloc(void)
- {
- 	struct nftnl_rule *r;
- 
-@@ -64,9 +64,8 @@ struct nftnl_rule *nftnl_rule_alloc(void)
- 
- 	return r;
- }
--EXPORT_SYMBOL(nftnl_rule_alloc);
- 
--void nftnl_rule_free(const struct nftnl_rule *r)
-+void __EXPORTED nftnl_rule_free(const struct nftnl_rule *r)
- {
- 	struct nftnl_expr *e, *tmp;
- 
-@@ -82,15 +81,13 @@ void nftnl_rule_free(const struct nftnl_rule *r)
- 
- 	xfree(r);
- }
--EXPORT_SYMBOL(nftnl_rule_free);
- 
--bool nftnl_rule_is_set(const struct nftnl_rule *r, uint16_t attr)
-+bool __EXPORTED nftnl_rule_is_set(const struct nftnl_rule *r, uint16_t attr)
- {
- 	return r->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_rule_is_set);
- 
--void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
-+void __EXPORTED nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
- {
- 	if (!(r->flags & (1 << attr)))
- 		return;
-@@ -116,7 +113,6 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
- 
- 	r->flags &= ~(1 << attr);
- }
--EXPORT_SYMBOL(nftnl_rule_unset);
- 
- static uint32_t nftnl_rule_validate[NFTNL_RULE_MAX + 1] = {
- 	[NFTNL_RULE_HANDLE]		= sizeof(uint64_t),
-@@ -127,7 +123,7 @@ static uint32_t nftnl_rule_validate[NFTNL_RULE_MAX + 1] = {
- 	[NFTNL_RULE_ID]			= sizeof(uint32_t),
- };
- 
--int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
-+int __EXPORTED nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
- 			const void *data, uint32_t data_len)
- {
- 	nftnl_assert_attr_exists(attr, NFTNL_RULE_MAX);
-@@ -183,33 +179,28 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
- 	r->flags |= (1 << attr);
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_rule_set_data);
- 
--int nftnl_rule_set(struct nftnl_rule *r, uint16_t attr, const void *data)
-+int __EXPORTED nftnl_rule_set(struct nftnl_rule *r, uint16_t attr, const void *data)
- {
- 	return nftnl_rule_set_data(r, attr, data, nftnl_rule_validate[attr]);
- }
--EXPORT_SYMBOL(nftnl_rule_set);
- 
--void nftnl_rule_set_u32(struct nftnl_rule *r, uint16_t attr, uint32_t val)
-+void __EXPORTED nftnl_rule_set_u32(struct nftnl_rule *r, uint16_t attr, uint32_t val)
- {
- 	nftnl_rule_set_data(r, attr, &val, sizeof(uint32_t));
- }
--EXPORT_SYMBOL(nftnl_rule_set_u32);
- 
--void nftnl_rule_set_u64(struct nftnl_rule *r, uint16_t attr, uint64_t val)
-+void __EXPORTED nftnl_rule_set_u64(struct nftnl_rule *r, uint16_t attr, uint64_t val)
- {
- 	nftnl_rule_set_data(r, attr, &val, sizeof(uint64_t));
- }
--EXPORT_SYMBOL(nftnl_rule_set_u64);
- 
--int nftnl_rule_set_str(struct nftnl_rule *r, uint16_t attr, const char *str)
-+int __EXPORTED nftnl_rule_set_str(struct nftnl_rule *r, uint16_t attr, const char *str)
- {
- 	return nftnl_rule_set_data(r, attr, str, strlen(str) + 1);
- }
--EXPORT_SYMBOL(nftnl_rule_set_str);
- 
--const void *nftnl_rule_get_data(const struct nftnl_rule *r, uint16_t attr,
-+const void __EXPORTED *nftnl_rule_get_data(const struct nftnl_rule *r, uint16_t attr,
- 				   uint32_t *data_len)
- {
- 	if (!(r->flags & (1 << attr)))
-@@ -246,22 +237,19 @@ const void *nftnl_rule_get_data(const struct nftnl_rule *r, uint16_t attr,
- 	}
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_rule_get_data);
- 
--const void *nftnl_rule_get(const struct nftnl_rule *r, uint16_t attr)
-+const void __EXPORTED *nftnl_rule_get(const struct nftnl_rule *r, uint16_t attr)
- {
- 	uint32_t data_len;
- 	return nftnl_rule_get_data(r, attr, &data_len);
- }
--EXPORT_SYMBOL(nftnl_rule_get);
- 
--const char *nftnl_rule_get_str(const struct nftnl_rule *r, uint16_t attr)
-+const char __EXPORTED *nftnl_rule_get_str(const struct nftnl_rule *r, uint16_t attr)
- {
- 	return nftnl_rule_get(r, attr);
- }
--EXPORT_SYMBOL(nftnl_rule_get_str);
- 
--uint32_t nftnl_rule_get_u32(const struct nftnl_rule *r, uint16_t attr)
-+uint32_t __EXPORTED nftnl_rule_get_u32(const struct nftnl_rule *r, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const uint32_t *val = nftnl_rule_get_data(r, attr, &data_len);
-@@ -270,9 +258,8 @@ uint32_t nftnl_rule_get_u32(const struct nftnl_rule *r, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_rule_get_u32);
- 
--uint64_t nftnl_rule_get_u64(const struct nftnl_rule *r, uint16_t attr)
-+uint64_t __EXPORTED nftnl_rule_get_u64(const struct nftnl_rule *r, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const uint64_t *val = nftnl_rule_get_data(r, attr, &data_len);
-@@ -281,9 +268,8 @@ uint64_t nftnl_rule_get_u64(const struct nftnl_rule *r, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_rule_get_u64);
- 
--uint8_t nftnl_rule_get_u8(const struct nftnl_rule *r, uint16_t attr)
-+uint8_t __EXPORTED nftnl_rule_get_u8(const struct nftnl_rule *r, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const uint8_t *val = nftnl_rule_get_data(r, attr, &data_len);
-@@ -292,9 +278,8 @@ uint8_t nftnl_rule_get_u8(const struct nftnl_rule *r, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_rule_get_u8);
- 
--void nftnl_rule_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_rule *r)
-+void __EXPORTED nftnl_rule_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_rule *r)
- {
- 	struct nftnl_expr *expr;
- 	struct nlattr *nest, *nest2;
-@@ -335,13 +320,11 @@ void nftnl_rule_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_rule *r)
- 	if (r->flags & (1 << NFTNL_RULE_ID))
- 		mnl_attr_put_u32(nlh, NFTA_RULE_ID, htonl(r->id));
- }
--EXPORT_SYMBOL(nftnl_rule_nlmsg_build_payload);
- 
--void nftnl_rule_add_expr(struct nftnl_rule *r, struct nftnl_expr *expr)
-+void __EXPORTED nftnl_rule_add_expr(struct nftnl_rule *r, struct nftnl_expr *expr)
- {
- 	list_add_tail(&expr->head, &r->expr_list);
- }
--EXPORT_SYMBOL(nftnl_rule_add_expr);
- 
- static int nftnl_rule_parse_attr_cb(const struct nlattr *attr, void *data)
- {
-@@ -441,7 +424,7 @@ static int nftnl_rule_parse_compat(struct nlattr *nest, struct nftnl_rule *r)
- 	return 0;
- }
- 
--int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
-+int __EXPORTED nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
- {
- 	struct nlattr *tb[NFTA_RULE_MAX+1] = {};
- 	struct nfgenmsg *nfg = mnl_nlmsg_get_payload(nlh);
-@@ -510,7 +493,6 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
- 
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_rule_nlmsg_parse);
- 
- #ifdef JSON_PARSING
- int nftnl_jansson_parse_rule(struct nftnl_rule *r, json_t *tree,
-@@ -658,19 +640,17 @@ static int nftnl_rule_do_parse(struct nftnl_rule *r, enum nftnl_parse_type type,
- 
- 	return ret;
- }
--int nftnl_rule_parse(struct nftnl_rule *r, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_rule_parse(struct nftnl_rule *r, enum nftnl_parse_type type,
- 		   const char *data, struct nftnl_parse_err *err)
- {
- 	return nftnl_rule_do_parse(r, type, data, err, NFTNL_PARSE_BUFFER);
- }
--EXPORT_SYMBOL(nftnl_rule_parse);
- 
--int nftnl_rule_parse_file(struct nftnl_rule *r, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_rule_parse_file(struct nftnl_rule *r, enum nftnl_parse_type type,
- 			FILE *fp, struct nftnl_parse_err *err)
- {
- 	return nftnl_rule_do_parse(r, type, fp, err, NFTNL_PARSE_FILE);
- }
--EXPORT_SYMBOL(nftnl_rule_parse_file);
- 
- static int nftnl_rule_export(char *buf, size_t size,
- 			     const struct nftnl_rule *r,
-@@ -819,13 +799,12 @@ static int nftnl_rule_cmd_snprintf(char *buf, size_t size,
- 	return offset;
- }
- 
--int nftnl_rule_snprintf(char *buf, size_t size, const struct nftnl_rule *r,
-+int __EXPORTED nftnl_rule_snprintf(char *buf, size_t size, const struct nftnl_rule *r,
- 			uint32_t type, uint32_t flags)
- {
- 	return nftnl_rule_cmd_snprintf(buf, size, r, nftnl_flag2cmd(flags), type,
- 				     flags);
- }
--EXPORT_SYMBOL(nftnl_rule_snprintf);
- 
- static int nftnl_rule_do_snprintf(char *buf, size_t size, const void *r,
- 				  uint32_t cmd, uint32_t type, uint32_t flags)
-@@ -833,15 +812,14 @@ static int nftnl_rule_do_snprintf(char *buf, size_t size, const void *r,
- 	return nftnl_rule_snprintf(buf, size, r, type, flags);
- }
- 
--int nftnl_rule_fprintf(FILE *fp, const struct nftnl_rule *r, uint32_t type,
-+int __EXPORTED nftnl_rule_fprintf(FILE *fp, const struct nftnl_rule *r, uint32_t type,
- 		       uint32_t flags)
- {
- 	return nftnl_fprintf(fp, r, NFTNL_CMD_UNSPEC, type, flags,
- 			   nftnl_rule_do_snprintf);
- }
--EXPORT_SYMBOL(nftnl_rule_fprintf);
- 
--int nftnl_expr_foreach(struct nftnl_rule *r,
-+int __EXPORTED nftnl_expr_foreach(struct nftnl_rule *r,
-                           int (*cb)(struct nftnl_expr *e, void *data),
-                           void *data)
- {
-@@ -855,7 +833,6 @@ int nftnl_expr_foreach(struct nftnl_rule *r,
-        }
-        return 0;
- }
--EXPORT_SYMBOL(nftnl_expr_foreach);
- 
- struct nftnl_expr_iter {
- 	const struct nftnl_rule	*r;
-@@ -873,7 +850,7 @@ static void nftnl_expr_iter_init(const struct nftnl_rule *r,
- 				       head);
- }
- 
--struct nftnl_expr_iter *nftnl_expr_iter_create(const struct nftnl_rule *r)
-+struct nftnl_expr_iter __EXPORTED *nftnl_expr_iter_create(const struct nftnl_rule *r)
- {
- 	struct nftnl_expr_iter *iter;
- 
-@@ -885,9 +862,8 @@ struct nftnl_expr_iter *nftnl_expr_iter_create(const struct nftnl_rule *r)
- 
- 	return iter;
- }
--EXPORT_SYMBOL(nftnl_expr_iter_create);
- 
--struct nftnl_expr *nftnl_expr_iter_next(struct nftnl_expr_iter *iter)
-+struct nftnl_expr __EXPORTED *nftnl_expr_iter_next(struct nftnl_expr_iter *iter)
- {
- 	struct nftnl_expr *expr = iter->cur;
- 
-@@ -901,15 +877,13 @@ struct nftnl_expr *nftnl_expr_iter_next(struct nftnl_expr_iter *iter)
- 
- 	return expr;
- }
--EXPORT_SYMBOL(nftnl_expr_iter_next);
- 
--void nftnl_expr_iter_destroy(struct nftnl_expr_iter *iter)
-+void __EXPORTED nftnl_expr_iter_destroy(struct nftnl_expr_iter *iter)
- {
- 	xfree(iter);
- }
--EXPORT_SYMBOL(nftnl_expr_iter_destroy);
- 
--bool nftnl_rule_cmp(const struct nftnl_rule *r1, const struct nftnl_rule *r2)
-+bool __EXPORTED nftnl_rule_cmp(const struct nftnl_rule *r1, const struct nftnl_rule *r2)
- {
- 	struct nftnl_expr_iter it1, it2;
- 	struct nftnl_expr *e1, *e2;
-@@ -938,13 +912,12 @@ bool nftnl_rule_cmp(const struct nftnl_rule *r1, const struct nftnl_rule *r2)
- 
- 	return eq;
- }
--EXPORT_SYMBOL(nftnl_rule_cmp);
- 
- struct nftnl_rule_list {
- 	struct list_head list;
- };
- 
--struct nftnl_rule_list *nftnl_rule_list_alloc(void)
-+struct nftnl_rule_list __EXPORTED *nftnl_rule_list_alloc(void)
- {
- 	struct nftnl_rule_list *list;
- 
-@@ -956,9 +929,8 @@ struct nftnl_rule_list *nftnl_rule_list_alloc(void)
- 
- 	return list;
- }
--EXPORT_SYMBOL(nftnl_rule_list_alloc);
- 
--void nftnl_rule_list_free(struct nftnl_rule_list *list)
-+void __EXPORTED nftnl_rule_list_free(struct nftnl_rule_list *list)
- {
- 	struct nftnl_rule *r, *tmp;
- 
-@@ -968,33 +940,28 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
- 	}
- 	xfree(list);
- }
--EXPORT_SYMBOL(nftnl_rule_list_free);
- 
--int nftnl_rule_list_is_empty(const struct nftnl_rule_list *list)
-+int __EXPORTED nftnl_rule_list_is_empty(const struct nftnl_rule_list *list)
- {
- 	return list_empty(&list->list);
- }
--EXPORT_SYMBOL(nftnl_rule_list_is_empty);
- 
--void nftnl_rule_list_add(struct nftnl_rule *r, struct nftnl_rule_list *list)
-+void __EXPORTED nftnl_rule_list_add(struct nftnl_rule *r, struct nftnl_rule_list *list)
- {
- 	list_add(&r->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_rule_list_add);
- 
--void nftnl_rule_list_add_tail(struct nftnl_rule *r, struct nftnl_rule_list *list)
-+void __EXPORTED nftnl_rule_list_add_tail(struct nftnl_rule *r, struct nftnl_rule_list *list)
- {
- 	list_add_tail(&r->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_rule_list_add_tail);
- 
--void nftnl_rule_list_del(struct nftnl_rule *r)
-+void __EXPORTED nftnl_rule_list_del(struct nftnl_rule *r)
- {
- 	list_del(&r->head);
- }
--EXPORT_SYMBOL(nftnl_rule_list_del);
- 
--int nftnl_rule_list_foreach(struct nftnl_rule_list *rule_list,
-+int __EXPORTED nftnl_rule_list_foreach(struct nftnl_rule_list *rule_list,
- 			  int (*cb)(struct nftnl_rule *r, void *data),
- 			  void *data)
- {
-@@ -1008,14 +975,13 @@ int nftnl_rule_list_foreach(struct nftnl_rule_list *rule_list,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_rule_list_foreach);
- 
- struct nftnl_rule_list_iter {
- 	const struct nftnl_rule_list	*list;
- 	struct nftnl_rule		*cur;
- };
- 
--struct nftnl_rule_list_iter *
-+struct nftnl_rule_list_iter __EXPORTED *
- nftnl_rule_list_iter_create(const struct nftnl_rule_list *l)
- {
- 	struct nftnl_rule_list_iter *iter;
-@@ -1032,15 +998,13 @@ nftnl_rule_list_iter_create(const struct nftnl_rule_list *l)
- 
- 	return iter;
- }
--EXPORT_SYMBOL(nftnl_rule_list_iter_create);
- 
--struct nftnl_rule *nftnl_rule_list_iter_cur(struct nftnl_rule_list_iter *iter)
-+struct nftnl_rule __EXPORTED *nftnl_rule_list_iter_cur(struct nftnl_rule_list_iter *iter)
- {
- 	return iter->cur;
- }
--EXPORT_SYMBOL(nftnl_rule_list_iter_cur);
- 
--struct nftnl_rule *nftnl_rule_list_iter_next(struct nftnl_rule_list_iter *iter)
-+struct nftnl_rule __EXPORTED *nftnl_rule_list_iter_next(struct nftnl_rule_list_iter *iter)
- {
- 	struct nftnl_rule *r = iter->cur;
- 
-@@ -1054,10 +1018,8 @@ struct nftnl_rule *nftnl_rule_list_iter_next(struct nftnl_rule_list_iter *iter)
- 
- 	return r;
- }
--EXPORT_SYMBOL(nftnl_rule_list_iter_next);
- 
--void nftnl_rule_list_iter_destroy(const struct nftnl_rule_list_iter *iter)
-+void __EXPORTED nftnl_rule_list_iter_destroy(const struct nftnl_rule_list_iter *iter)
- {
- 	xfree(iter);
- }
--EXPORT_SYMBOL(nftnl_rule_list_iter_destroy);
-diff --git a/src/ruleset.c b/src/ruleset.c
-index 6ef2956..10d48f6 100644
---- a/src/ruleset.c
-+++ b/src/ruleset.c
-@@ -55,13 +55,12 @@ struct nftnl_parse_ctx {
- 	uint16_t flags;
- };
- 
--struct nftnl_ruleset *nftnl_ruleset_alloc(void)
-+struct nftnl_ruleset __EXPORTED *nftnl_ruleset_alloc(void)
- {
- 	return calloc(1, sizeof(struct nftnl_ruleset));
- }
--EXPORT_SYMBOL(nftnl_ruleset_alloc);
- 
--void nftnl_ruleset_free(const struct nftnl_ruleset *r)
-+void __EXPORTED nftnl_ruleset_free(const struct nftnl_ruleset *r)
- {
- 	if (r->flags & (1 << NFTNL_RULESET_TABLELIST))
- 		nftnl_table_list_free(r->table_list);
-@@ -73,15 +72,13 @@ void nftnl_ruleset_free(const struct nftnl_ruleset *r)
- 		nftnl_rule_list_free(r->rule_list);
- 	xfree(r);
- }
--EXPORT_SYMBOL(nftnl_ruleset_free);
- 
--bool nftnl_ruleset_is_set(const struct nftnl_ruleset *r, uint16_t attr)
-+bool __EXPORTED nftnl_ruleset_is_set(const struct nftnl_ruleset *r, uint16_t attr)
- {
- 	return r->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_ruleset_is_set);
- 
--void nftnl_ruleset_unset(struct nftnl_ruleset *r, uint16_t attr)
-+void __EXPORTED nftnl_ruleset_unset(struct nftnl_ruleset *r, uint16_t attr)
- {
- 	if (!(r->flags & (1 << attr)))
- 		return;
-@@ -102,9 +99,8 @@ void nftnl_ruleset_unset(struct nftnl_ruleset *r, uint16_t attr)
- 	}
- 	r->flags &= ~(1 << attr);
- }
--EXPORT_SYMBOL(nftnl_ruleset_unset);
- 
--void nftnl_ruleset_set(struct nftnl_ruleset *r, uint16_t attr, void *data)
-+void __EXPORTED nftnl_ruleset_set(struct nftnl_ruleset *r, uint16_t attr, void *data)
- {
- 	switch (attr) {
- 	case NFTNL_RULESET_TABLELIST:
-@@ -128,9 +124,8 @@ void nftnl_ruleset_set(struct nftnl_ruleset *r, uint16_t attr, void *data)
- 	}
- 	r->flags |= (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_ruleset_set);
- 
--void *nftnl_ruleset_get(const struct nftnl_ruleset *r, uint16_t attr)
-+void __EXPORTED *nftnl_ruleset_get(const struct nftnl_ruleset *r, uint16_t attr)
- {
- 	if (!(r->flags & (1 << attr)))
- 		return NULL;
-@@ -148,9 +143,8 @@ void *nftnl_ruleset_get(const struct nftnl_ruleset *r, uint16_t attr)
- 		return NULL;
- 	}
- }
--EXPORT_SYMBOL(nftnl_ruleset_get);
- 
--void nftnl_ruleset_ctx_free(const struct nftnl_parse_ctx *ctx)
-+void __EXPORTED nftnl_ruleset_ctx_free(const struct nftnl_parse_ctx *ctx)
- {
- 	switch (ctx->type) {
- 	case NFTNL_RULESET_TABLE:
-@@ -171,15 +165,13 @@ void nftnl_ruleset_ctx_free(const struct nftnl_parse_ctx *ctx)
- 		break;
- 	}
- }
--EXPORT_SYMBOL(nftnl_ruleset_ctx_free);
- 
--bool nftnl_ruleset_ctx_is_set(const struct nftnl_parse_ctx *ctx, uint16_t attr)
-+bool __EXPORTED nftnl_ruleset_ctx_is_set(const struct nftnl_parse_ctx *ctx, uint16_t attr)
- {
- 	return ctx->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_ruleset_ctx_is_set);
- 
--void *nftnl_ruleset_ctx_get(const struct nftnl_parse_ctx *ctx, uint16_t attr)
-+void __EXPORTED *nftnl_ruleset_ctx_get(const struct nftnl_parse_ctx *ctx, uint16_t attr)
- {
- 	if (!(ctx->flags & (1 << attr)))
- 		return NULL;
-@@ -203,14 +195,12 @@ void *nftnl_ruleset_ctx_get(const struct nftnl_parse_ctx *ctx, uint16_t attr)
- 		return NULL;
- 	}
- }
--EXPORT_SYMBOL(nftnl_ruleset_ctx_get);
- 
--uint32_t nftnl_ruleset_ctx_get_u32(const struct nftnl_parse_ctx *ctx, uint16_t attr)
-+uint32_t __EXPORTED nftnl_ruleset_ctx_get_u32(const struct nftnl_parse_ctx *ctx, uint16_t attr)
- {
- 	const void *ret = nftnl_ruleset_ctx_get(ctx, attr);
- 	return ret == NULL ? 0 : *((uint32_t *)ret);
- }
--EXPORT_SYMBOL(nftnl_ruleset_ctx_get_u32);
- 
- #if defined(JSON_PARSING)
- static void nftnl_ruleset_ctx_set(struct nftnl_parse_ctx *ctx, uint16_t attr,
-@@ -593,22 +583,20 @@ nftnl_ruleset_do_parse(enum nftnl_parse_type type, const void *data,
- 	return ret;
- }
- 
--int nftnl_ruleset_parse_file_cb(enum nftnl_parse_type type, FILE *fp,
-+int __EXPORTED nftnl_ruleset_parse_file_cb(enum nftnl_parse_type type, FILE *fp,
- 			      struct nftnl_parse_err *err, void *data,
- 			      int (*cb)(const struct nftnl_parse_ctx *ctx))
- {
- 	return nftnl_ruleset_do_parse(type, fp, err, NFTNL_PARSE_FILE, data, cb);
- }
--EXPORT_SYMBOL(nftnl_ruleset_parse_file_cb);
- 
--int nftnl_ruleset_parse_buffer_cb(enum nftnl_parse_type type, const char *buffer,
-+int __EXPORTED nftnl_ruleset_parse_buffer_cb(enum nftnl_parse_type type, const char *buffer,
- 				struct nftnl_parse_err *err, void *data,
- 				int (*cb)(const struct nftnl_parse_ctx *ctx))
- {
- 	return nftnl_ruleset_do_parse(type, buffer, err, NFTNL_PARSE_BUFFER, data,
- 				    cb);
- }
--EXPORT_SYMBOL(nftnl_ruleset_parse_buffer_cb);
- 
- static int nftnl_ruleset_cb(const struct nftnl_parse_ctx *ctx)
- {
-@@ -671,19 +659,17 @@ static int nftnl_ruleset_cb(const struct nftnl_parse_ctx *ctx)
- 	return 0;
- }
- 
--int nftnl_ruleset_parse(struct nftnl_ruleset *r, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_ruleset_parse(struct nftnl_ruleset *r, enum nftnl_parse_type type,
- 		      const char *data, struct nftnl_parse_err *err)
- {
- 	return nftnl_ruleset_parse_buffer_cb(type, data, err, r, nftnl_ruleset_cb);
- }
--EXPORT_SYMBOL(nftnl_ruleset_parse);
- 
--int nftnl_ruleset_parse_file(struct nftnl_ruleset *rs, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_ruleset_parse_file(struct nftnl_ruleset *rs, enum nftnl_parse_type type,
- 			   FILE *fp, struct nftnl_parse_err *err)
- {
- 	return nftnl_ruleset_parse_file_cb(type, fp, err, rs, nftnl_ruleset_cb);
- }
--EXPORT_SYMBOL(nftnl_ruleset_parse_file);
- 
- static const char *nftnl_ruleset_o_opentag(uint32_t type)
- {
-@@ -928,7 +914,7 @@ static int nftnl_ruleset_cmd_snprintf(char *buf, size_t size,
- 	}
- }
- 
--int nftnl_ruleset_snprintf(char *buf, size_t size, const struct nftnl_ruleset *r,
-+int __EXPORTED nftnl_ruleset_snprintf(char *buf, size_t size, const struct nftnl_ruleset *r,
- 			 uint32_t type, uint32_t flags)
- {
- 	switch (type) {
-@@ -943,7 +929,6 @@ int nftnl_ruleset_snprintf(char *buf, size_t size, const struct nftnl_ruleset *r
- 		return -1;
- 	}
- }
--EXPORT_SYMBOL(nftnl_ruleset_snprintf);
- 
- static int nftnl_ruleset_fprintf_tables(FILE *fp, const struct nftnl_ruleset *rs,
- 				      uint32_t type, uint32_t flags)
-@@ -1157,10 +1142,9 @@ static int nftnl_ruleset_cmd_fprintf(FILE *fp, const struct nftnl_ruleset *rs,
- 	return len;
- }
- 
--int nftnl_ruleset_fprintf(FILE *fp, const struct nftnl_ruleset *rs, uint32_t type,
-+int __EXPORTED nftnl_ruleset_fprintf(FILE *fp, const struct nftnl_ruleset *rs, uint32_t type,
- 			uint32_t flags)
- {
- 	return nftnl_ruleset_cmd_fprintf(fp, rs, nftnl_flag2cmd(flags), type,
- 				       flags);
- }
--EXPORT_SYMBOL(nftnl_ruleset_fprintf);
-diff --git a/src/set.c b/src/set.c
-index cce5e63..33a6794 100644
---- a/src/set.c
-+++ b/src/set.c
-@@ -27,7 +27,7 @@
- #include <libnftnl/set.h>
- #include <libnftnl/expr.h>
- 
--struct nftnl_set *nftnl_set_alloc(void)
-+struct nftnl_set __EXPORTED *nftnl_set_alloc(void)
- {
- 	struct nftnl_set *s;
- 
-@@ -38,9 +38,8 @@ struct nftnl_set *nftnl_set_alloc(void)
- 	INIT_LIST_HEAD(&s->element_list);
- 	return s;
- }
--EXPORT_SYMBOL(nftnl_set_alloc);
- 
--void nftnl_set_free(const struct nftnl_set *s)
-+void __EXPORTED nftnl_set_free(const struct nftnl_set *s)
- {
- 	struct nftnl_set_elem *elem, *tmp;
- 
-@@ -55,15 +54,13 @@ void nftnl_set_free(const struct nftnl_set *s)
- 	}
- 	xfree(s);
- }
--EXPORT_SYMBOL(nftnl_set_free);
- 
--bool nftnl_set_is_set(const struct nftnl_set *s, uint16_t attr)
-+bool __EXPORTED nftnl_set_is_set(const struct nftnl_set *s, uint16_t attr)
- {
- 	return s->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_set_is_set);
- 
--void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
-+void __EXPORTED nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
- {
- 	if (!(s->flags & (1 << attr)))
- 		return;
-@@ -97,7 +94,6 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
- 
- 	s->flags &= ~(1 << attr);
- }
--EXPORT_SYMBOL(nftnl_set_unset);
- 
- static uint32_t nftnl_set_validate[NFTNL_SET_MAX + 1] = {
- 	[NFTNL_SET_FLAGS]		= sizeof(uint32_t),
-@@ -113,7 +109,7 @@ static uint32_t nftnl_set_validate[NFTNL_SET_MAX + 1] = {
- 	[NFTNL_SET_GC_INTERVAL]	= sizeof(uint32_t),
- };
- 
--int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
-+int __EXPORTED nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
- 		       uint32_t data_len)
- {
- 	nftnl_assert_attr_exists(attr, NFTNL_SET_MAX);
-@@ -186,33 +182,28 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
- 	s->flags |= (1 << attr);
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_set_set_data);
- 
--int nftnl_set_set(struct nftnl_set *s, uint16_t attr, const void *data)
-+int __EXPORTED nftnl_set_set(struct nftnl_set *s, uint16_t attr, const void *data)
- {
- 	return nftnl_set_set_data(s, attr, data, nftnl_set_validate[attr]);
- }
--EXPORT_SYMBOL(nftnl_set_set);
- 
--void nftnl_set_set_u32(struct nftnl_set *s, uint16_t attr, uint32_t val)
-+void __EXPORTED nftnl_set_set_u32(struct nftnl_set *s, uint16_t attr, uint32_t val)
- {
- 	nftnl_set_set(s, attr, &val);
- }
--EXPORT_SYMBOL(nftnl_set_set_u32);
- 
--void nftnl_set_set_u64(struct nftnl_set *s, uint16_t attr, uint64_t val)
-+void __EXPORTED nftnl_set_set_u64(struct nftnl_set *s, uint16_t attr, uint64_t val)
- {
- 	nftnl_set_set(s, attr, &val);
- }
--EXPORT_SYMBOL(nftnl_set_set_u64);
- 
--int nftnl_set_set_str(struct nftnl_set *s, uint16_t attr, const char *str)
-+int __EXPORTED nftnl_set_set_str(struct nftnl_set *s, uint16_t attr, const char *str)
- {
- 	return nftnl_set_set_data(s, attr, str, strlen(str) + 1);
- }
--EXPORT_SYMBOL(nftnl_set_set_str);
- 
--const void *nftnl_set_get_data(const struct nftnl_set *s, uint16_t attr,
-+const void __EXPORTED *nftnl_set_get_data(const struct nftnl_set *s, uint16_t attr,
- 			       uint32_t *data_len)
- {
- 	if (!(s->flags & (1 << attr)))
-@@ -267,22 +258,19 @@ const void *nftnl_set_get_data(const struct nftnl_set *s, uint16_t attr,
- 	}
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_set_get_data);
- 
--const void *nftnl_set_get(const struct nftnl_set *s, uint16_t attr)
-+const void __EXPORTED *nftnl_set_get(const struct nftnl_set *s, uint16_t attr)
- {
- 	uint32_t data_len;
- 	return nftnl_set_get_data(s, attr, &data_len);
- }
--EXPORT_SYMBOL(nftnl_set_get);
- 
--const char *nftnl_set_get_str(const struct nftnl_set *s, uint16_t attr)
-+const char __EXPORTED *nftnl_set_get_str(const struct nftnl_set *s, uint16_t attr)
- {
- 	return nftnl_set_get(s, attr);
- }
--EXPORT_SYMBOL(nftnl_set_get_str);
- 
--uint32_t nftnl_set_get_u32(const struct nftnl_set *s, uint16_t attr)
-+uint32_t __EXPORTED nftnl_set_get_u32(const struct nftnl_set *s, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const uint32_t *val = nftnl_set_get_data(s, attr, &data_len);
-@@ -291,9 +279,8 @@ uint32_t nftnl_set_get_u32(const struct nftnl_set *s, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_set_get_u32);
- 
--uint64_t nftnl_set_get_u64(const struct nftnl_set *s, uint16_t attr)
-+uint64_t __EXPORTED nftnl_set_get_u64(const struct nftnl_set *s, uint16_t attr)
- {
- 	uint32_t data_len;
- 	const uint64_t *val = nftnl_set_get_data(s, attr, &data_len);
-@@ -302,7 +289,6 @@ uint64_t nftnl_set_get_u64(const struct nftnl_set *s, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_set_get_u64);
- 
- struct nftnl_set *nftnl_set_clone(const struct nftnl_set *set)
- {
-@@ -351,7 +337,7 @@ nftnl_set_nlmsg_build_desc_payload(struct nlmsghdr *nlh, struct nftnl_set *s)
- 	mnl_attr_nest_end(nlh, nest);
- }
- 
--void nftnl_set_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_set *s)
-+void __EXPORTED nftnl_set_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_set *s)
- {
- 	if (s->flags & (1 << NFTNL_SET_TABLE))
- 		mnl_attr_put_strz(nlh, NFTA_SET_TABLE, s->table);
-@@ -383,7 +369,6 @@ void nftnl_set_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_set *s)
- 	if (s->flags & (1 << NFTNL_SET_USERDATA))
- 		mnl_attr_put(nlh, NFTA_SET_USERDATA, s->user.len, s->user.data);
- }
--EXPORT_SYMBOL(nftnl_set_nlmsg_build_payload);
- 
- static int nftnl_set_parse_attr_cb(const struct nlattr *attr, void *data)
- {
-@@ -463,7 +448,7 @@ static int nftnl_set_desc_parse(struct nftnl_set *s,
- 	return 0;
- }
- 
--int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
-+int __EXPORTED nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
- {
- 	struct nlattr *tb[NFTA_SET_MAX+1] = {};
- 	struct nfgenmsg *nfg = mnl_nlmsg_get_payload(nlh);
-@@ -546,7 +531,6 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
- 
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_set_nlmsg_parse);
- 
- #ifdef JSON_PARSING
- static int nftnl_jansson_parse_set_info(struct nftnl_set *s, json_t *tree,
-@@ -718,19 +702,17 @@ static int nftnl_set_do_parse(struct nftnl_set *s, enum nftnl_parse_type type,
- 
- 	return ret;
- }
--int nftnl_set_parse(struct nftnl_set *s, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_set_parse(struct nftnl_set *s, enum nftnl_parse_type type,
- 		  const char *data, struct nftnl_parse_err *err)
- {
- 	return nftnl_set_do_parse(s, type, data, err, NFTNL_PARSE_BUFFER);
- }
--EXPORT_SYMBOL(nftnl_set_parse);
- 
--int nftnl_set_parse_file(struct nftnl_set *s, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_set_parse_file(struct nftnl_set *s, enum nftnl_parse_type type,
- 		       FILE *fp, struct nftnl_parse_err *err)
- {
- 	return nftnl_set_do_parse(s, type, fp, err, NFTNL_PARSE_FILE);
- }
--EXPORT_SYMBOL(nftnl_set_parse_file);
- 
- static int nftnl_set_snprintf_json(char *buf, size_t size,
- 				   const struct nftnl_set *s,
-@@ -918,13 +900,12 @@ static int nftnl_set_cmd_snprintf(char *buf, size_t size,
- 	return offset;
- }
- 
--int nftnl_set_snprintf(char *buf, size_t size, const struct nftnl_set *s,
-+int __EXPORTED nftnl_set_snprintf(char *buf, size_t size, const struct nftnl_set *s,
- 		       uint32_t type, uint32_t flags)
- {
- 	return nftnl_set_cmd_snprintf(buf, size, s, nftnl_flag2cmd(flags), type,
- 				    flags);
- }
--EXPORT_SYMBOL(nftnl_set_snprintf);
- 
- static int nftnl_set_do_snprintf(char *buf, size_t size, const void *s,
- 				 uint32_t cmd, uint32_t type, uint32_t flags)
-@@ -932,25 +913,23 @@ static int nftnl_set_do_snprintf(char *buf, size_t size, const void *s,
- 	return nftnl_set_snprintf(buf, size, s, type, flags);
- }
- 
--int nftnl_set_fprintf(FILE *fp, const struct nftnl_set *s, uint32_t type,
-+int __EXPORTED nftnl_set_fprintf(FILE *fp, const struct nftnl_set *s, uint32_t type,
- 		      uint32_t flags)
- {
- 	return nftnl_fprintf(fp, s, NFTNL_CMD_UNSPEC, type, flags,
- 			   nftnl_set_do_snprintf);
- }
--EXPORT_SYMBOL(nftnl_set_fprintf);
- 
--void nftnl_set_elem_add(struct nftnl_set *s, struct nftnl_set_elem *elem)
-+void __EXPORTED nftnl_set_elem_add(struct nftnl_set *s, struct nftnl_set_elem *elem)
- {
- 	list_add_tail(&elem->head, &s->element_list);
- }
--EXPORT_SYMBOL(nftnl_set_elem_add);
- 
- struct nftnl_set_list {
- 	struct list_head list;
- };
- 
--struct nftnl_set_list *nftnl_set_list_alloc(void)
-+struct nftnl_set_list __EXPORTED *nftnl_set_list_alloc(void)
- {
- 	struct nftnl_set_list *list;
- 
-@@ -962,9 +941,8 @@ struct nftnl_set_list *nftnl_set_list_alloc(void)
- 
- 	return list;
- }
--EXPORT_SYMBOL(nftnl_set_list_alloc);
- 
--void nftnl_set_list_free(struct nftnl_set_list *list)
-+void __EXPORTED nftnl_set_list_free(struct nftnl_set_list *list)
- {
- 	struct nftnl_set *s, *tmp;
- 
-@@ -974,33 +952,28 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
- 	}
- 	xfree(list);
- }
--EXPORT_SYMBOL(nftnl_set_list_free);
- 
--int nftnl_set_list_is_empty(const struct nftnl_set_list *list)
-+int __EXPORTED nftnl_set_list_is_empty(const struct nftnl_set_list *list)
- {
- 	return list_empty(&list->list);
- }
--EXPORT_SYMBOL(nftnl_set_list_is_empty);
- 
--void nftnl_set_list_add(struct nftnl_set *s, struct nftnl_set_list *list)
-+void __EXPORTED nftnl_set_list_add(struct nftnl_set *s, struct nftnl_set_list *list)
- {
- 	list_add(&s->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_set_list_add);
- 
--void nftnl_set_list_add_tail(struct nftnl_set *s, struct nftnl_set_list *list)
-+void __EXPORTED nftnl_set_list_add_tail(struct nftnl_set *s, struct nftnl_set_list *list)
- {
- 	list_add_tail(&s->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_set_list_add_tail);
- 
--void nftnl_set_list_del(struct nftnl_set *s)
-+void __EXPORTED nftnl_set_list_del(struct nftnl_set *s)
- {
- 	list_del(&s->head);
- }
--EXPORT_SYMBOL(nftnl_set_list_del);
- 
--int nftnl_set_list_foreach(struct nftnl_set_list *set_list,
-+int __EXPORTED nftnl_set_list_foreach(struct nftnl_set_list *set_list,
- 			 int (*cb)(struct nftnl_set *t, void *data), void *data)
- {
- 	struct nftnl_set *cur, *tmp;
-@@ -1013,14 +986,13 @@ int nftnl_set_list_foreach(struct nftnl_set_list *set_list,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_set_list_foreach);
- 
- struct nftnl_set_list_iter {
- 	const struct nftnl_set_list	*list;
- 	struct nftnl_set		*cur;
- };
- 
--struct nftnl_set_list_iter *
-+struct nftnl_set_list_iter __EXPORTED *
- nftnl_set_list_iter_create(const struct nftnl_set_list *l)
- {
- 	struct nftnl_set_list_iter *iter;
-@@ -1037,16 +1009,14 @@ nftnl_set_list_iter_create(const struct nftnl_set_list *l)
- 
- 	return iter;
- }
--EXPORT_SYMBOL(nftnl_set_list_iter_create);
- 
--struct nftnl_set *
-+struct nftnl_set __EXPORTED *
- nftnl_set_list_iter_cur(const struct nftnl_set_list_iter *iter)
- {
- 	return iter->cur;
- }
--EXPORT_SYMBOL(nftnl_set_list_iter_cur);
- 
--struct nftnl_set *nftnl_set_list_iter_next(struct nftnl_set_list_iter *iter)
-+struct nftnl_set __EXPORTED *nftnl_set_list_iter_next(struct nftnl_set_list_iter *iter)
- {
- 	struct nftnl_set *s = iter->cur;
- 
-@@ -1060,13 +1030,11 @@ struct nftnl_set *nftnl_set_list_iter_next(struct nftnl_set_list_iter *iter)
- 
- 	return s;
- }
--EXPORT_SYMBOL(nftnl_set_list_iter_next);
- 
--void nftnl_set_list_iter_destroy(const struct nftnl_set_list_iter *iter)
-+void __EXPORTED nftnl_set_list_iter_destroy(const struct nftnl_set_list_iter *iter)
- {
- 	xfree(iter);
- }
--EXPORT_SYMBOL(nftnl_set_list_iter_destroy);
- 
- static struct nftnl_set *nftnl_set_lookup(const char *this_set_name,
- 				      struct nftnl_set_list *set_list)
-diff --git a/src/set_elem.c b/src/set_elem.c
-index 433b896..bd1e895 100644
---- a/src/set_elem.c
-+++ b/src/set_elem.c
-@@ -27,7 +27,7 @@
- #include <libnftnl/rule.h>
- #include <libnftnl/expr.h>
- 
--struct nftnl_set_elem *nftnl_set_elem_alloc(void)
-+struct nftnl_set_elem __EXPORTED *nftnl_set_elem_alloc(void)
- {
- 	struct nftnl_set_elem *s;
- 
-@@ -37,9 +37,8 @@ struct nftnl_set_elem *nftnl_set_elem_alloc(void)
- 
- 	return s;
- }
--EXPORT_SYMBOL(nftnl_set_elem_alloc);
- 
--void nftnl_set_elem_free(struct nftnl_set_elem *s)
-+void __EXPORTED nftnl_set_elem_free(struct nftnl_set_elem *s)
- {
- 	if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN))
- 		xfree(s->data.chain);
-@@ -55,15 +54,13 @@ void nftnl_set_elem_free(struct nftnl_set_elem *s)
- 
- 	xfree(s);
- }
--EXPORT_SYMBOL(nftnl_set_elem_free);
- 
--bool nftnl_set_elem_is_set(const struct nftnl_set_elem *s, uint16_t attr)
-+bool __EXPORTED nftnl_set_elem_is_set(const struct nftnl_set_elem *s, uint16_t attr)
- {
- 	return s->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_set_elem_is_set);
- 
--void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
-+void __EXPORTED nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
- {
- 	if (!(s->flags & (1 << attr)))
- 		return;
-@@ -94,9 +91,8 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
- 
- 	s->flags &= ~(1 << attr);
- }
--EXPORT_SYMBOL(nftnl_set_elem_unset);
- 
--int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
-+int __EXPORTED nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
- 		       const void *data, uint32_t data_len)
- {
- 	switch(attr) {
-@@ -147,27 +143,23 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
- 	s->flags |= (1 << attr);
- 	return -1;
- }
--EXPORT_SYMBOL(nftnl_set_elem_set);
- 
--void nftnl_set_elem_set_u32(struct nftnl_set_elem *s, uint16_t attr, uint32_t val)
-+void __EXPORTED nftnl_set_elem_set_u32(struct nftnl_set_elem *s, uint16_t attr, uint32_t val)
- {
- 	nftnl_set_elem_set(s, attr, &val, sizeof(uint32_t));
- }
--EXPORT_SYMBOL(nftnl_set_elem_set_u32);
- 
--void nftnl_set_elem_set_u64(struct nftnl_set_elem *s, uint16_t attr, uint64_t val)
-+void __EXPORTED nftnl_set_elem_set_u64(struct nftnl_set_elem *s, uint16_t attr, uint64_t val)
- {
- 	nftnl_set_elem_set(s, attr, &val, sizeof(uint64_t));
- }
--EXPORT_SYMBOL(nftnl_set_elem_set_u64);
- 
--int nftnl_set_elem_set_str(struct nftnl_set_elem *s, uint16_t attr, const char *str)
-+int __EXPORTED nftnl_set_elem_set_str(struct nftnl_set_elem *s, uint16_t attr, const char *str)
- {
- 	return nftnl_set_elem_set(s, attr, str, strlen(str) + 1);
- }
--EXPORT_SYMBOL(nftnl_set_elem_set_str);
- 
--const void *nftnl_set_elem_get(struct nftnl_set_elem *s, uint16_t attr, uint32_t *data_len)
-+const void __EXPORTED *nftnl_set_elem_get(struct nftnl_set_elem *s, uint16_t attr, uint32_t *data_len)
- {
- 	if (!(s->flags & (1 << attr)))
- 		return NULL;
-@@ -205,31 +197,27 @@ const void *nftnl_set_elem_get(struct nftnl_set_elem *s, uint16_t attr, uint32_t
- 	}
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_set_elem_get);
- 
--const char *nftnl_set_elem_get_str(struct nftnl_set_elem *s, uint16_t attr)
-+const char __EXPORTED *nftnl_set_elem_get_str(struct nftnl_set_elem *s, uint16_t attr)
- {
- 	uint32_t size;
- 
- 	return nftnl_set_elem_get(s, attr, &size);
- }
--EXPORT_SYMBOL(nftnl_set_elem_get_str);
- 
--uint32_t nftnl_set_elem_get_u32(struct nftnl_set_elem *s, uint16_t attr)
-+uint32_t __EXPORTED nftnl_set_elem_get_u32(struct nftnl_set_elem *s, uint16_t attr)
- {
- 	uint32_t size;
- 	uint32_t val = *((uint32_t *)nftnl_set_elem_get(s, attr, &size));
- 	return val;
- }
--EXPORT_SYMBOL(nftnl_set_elem_get_u32);
- 
--uint64_t nftnl_set_elem_get_u64(struct nftnl_set_elem *s, uint16_t attr)
-+uint64_t __EXPORTED nftnl_set_elem_get_u64(struct nftnl_set_elem *s, uint16_t attr)
- {
- 	uint32_t size;
- 	uint64_t val = *((uint64_t *)nftnl_set_elem_get(s, attr, &size));
- 	return val;
- }
--EXPORT_SYMBOL(nftnl_set_elem_get_u64);
- 
- struct nftnl_set_elem *nftnl_set_elem_clone(struct nftnl_set_elem *elem)
- {
-@@ -315,7 +303,7 @@ static struct nlattr *nftnl_set_elem_build(struct nlmsghdr *nlh,
- 	return nest2;
- }
- 
--void nftnl_set_elems_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_set *s)
-+void __EXPORTED nftnl_set_elems_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_set *s)
- {
- 	struct nftnl_set_elem *elem;
- 	struct nlattr *nest1;
-@@ -332,7 +320,6 @@ void nftnl_set_elems_nlmsg_build_payload(struct nlmsghdr *nlh, struct nftnl_set
- 
- 	mnl_attr_nest_end(nlh, nest1);
- }
--EXPORT_SYMBOL(nftnl_set_elems_nlmsg_build_payload);
- 
- static int nftnl_set_elem_parse_attr_cb(const struct nlattr *attr, void *data)
- {
-@@ -503,7 +490,7 @@ static int nftnl_set_elems_parse(struct nftnl_set *s, const struct nlattr *nest)
- 	return ret;
- }
- 
--int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
-+int __EXPORTED nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
- {
- 	struct nlattr *tb[NFTA_SET_ELEM_LIST_MAX+1] = {};
- 	struct nfgenmsg *nfg = mnl_nlmsg_get_payload(nlh);
-@@ -546,7 +533,6 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
- 
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_set_elems_nlmsg_parse);
- 
- static int nftnl_set_elem_json_parse(struct nftnl_set_elem *e, const void *json,
- 				   struct nftnl_parse_err *err,
-@@ -587,19 +573,17 @@ nftnl_set_elem_do_parse(struct nftnl_set_elem *e, enum nftnl_parse_type type,
- 
- 	return ret;
- }
--int nftnl_set_elem_parse(struct nftnl_set_elem *e, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_set_elem_parse(struct nftnl_set_elem *e, enum nftnl_parse_type type,
- 		       const char *data, struct nftnl_parse_err *err)
- {
- 	return nftnl_set_elem_do_parse(e, type, data, err, NFTNL_PARSE_BUFFER);
- }
--EXPORT_SYMBOL(nftnl_set_elem_parse);
- 
--int nftnl_set_elem_parse_file(struct nftnl_set_elem *e, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_set_elem_parse_file(struct nftnl_set_elem *e, enum nftnl_parse_type type,
- 			    FILE *fp, struct nftnl_parse_err *err)
- {
- 	return nftnl_set_elem_do_parse(e, type, fp, err, NFTNL_PARSE_FILE);
- }
--EXPORT_SYMBOL(nftnl_set_elem_parse_file);
- 
- static int nftnl_set_elem_snprintf_json(char *buf, size_t size,
- 					const struct nftnl_set_elem *e,
-@@ -719,14 +703,13 @@ static int nftnl_set_elem_cmd_snprintf(char *buf, size_t size,
- 	return offset;
- }
- 
--int nftnl_set_elem_snprintf(char *buf, size_t size,
-+int __EXPORTED nftnl_set_elem_snprintf(char *buf, size_t size,
- 			    const struct nftnl_set_elem *e,
- 			    uint32_t type, uint32_t flags)
- {
- 	return nftnl_set_elem_cmd_snprintf(buf, size, e, nftnl_flag2cmd(flags),
- 					 type, flags);
- }
--EXPORT_SYMBOL(nftnl_set_elem_snprintf);
- 
- static int nftnl_set_elem_do_snprintf(char *buf, size_t size, const void *e,
- 				      uint32_t cmd, uint32_t type,
-@@ -735,15 +718,14 @@ static int nftnl_set_elem_do_snprintf(char *buf, size_t size, const void *e,
- 	return nftnl_set_elem_snprintf(buf, size, e, type, flags);
- }
- 
--int nftnl_set_elem_fprintf(FILE *fp, struct nftnl_set_elem *se, uint32_t type,
-+int __EXPORTED nftnl_set_elem_fprintf(FILE *fp, struct nftnl_set_elem *se, uint32_t type,
- 			 uint32_t flags)
- {
- 	return nftnl_fprintf(fp, se, NFTNL_CMD_UNSPEC, type, flags,
- 			   nftnl_set_elem_do_snprintf);
- }
--EXPORT_SYMBOL(nftnl_set_elem_fprintf);
- 
--int nftnl_set_elem_foreach(struct nftnl_set *s,
-+int __EXPORTED nftnl_set_elem_foreach(struct nftnl_set *s,
- 			 int (*cb)(struct nftnl_set_elem *e, void *data),
- 			 void *data)
- {
-@@ -757,7 +739,6 @@ int nftnl_set_elem_foreach(struct nftnl_set *s,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_set_elem_foreach);
- 
- struct nftnl_set_elems_iter {
- 	const struct nftnl_set		*set;
-@@ -765,7 +746,7 @@ struct nftnl_set_elems_iter {
- 	struct nftnl_set_elem		*cur;
- };
- 
--struct nftnl_set_elems_iter *
-+struct nftnl_set_elems_iter __EXPORTED *
- nftnl_set_elems_iter_create(const struct nftnl_set *s)
- {
- 	struct nftnl_set_elems_iter *iter;
-@@ -784,16 +765,14 @@ nftnl_set_elems_iter_create(const struct nftnl_set *s)
- 
- 	return iter;
- }
--EXPORT_SYMBOL(nftnl_set_elems_iter_create);
- 
--struct nftnl_set_elem *
-+struct nftnl_set_elem __EXPORTED *
- nftnl_set_elems_iter_cur(const struct nftnl_set_elems_iter *iter)
- {
- 	return iter->cur;
- }
--EXPORT_SYMBOL(nftnl_set_elems_iter_cur);
- 
--struct nftnl_set_elem *nftnl_set_elems_iter_next(struct nftnl_set_elems_iter *iter)
-+struct nftnl_set_elem __EXPORTED *nftnl_set_elems_iter_next(struct nftnl_set_elems_iter *iter)
- {
- 	struct nftnl_set_elem *s = iter->cur;
- 
-@@ -806,13 +785,11 @@ struct nftnl_set_elem *nftnl_set_elems_iter_next(struct nftnl_set_elems_iter *it
- 
- 	return s;
- }
--EXPORT_SYMBOL(nftnl_set_elems_iter_next);
- 
--void nftnl_set_elems_iter_destroy(struct nftnl_set_elems_iter *iter)
-+void __EXPORTED nftnl_set_elems_iter_destroy(struct nftnl_set_elems_iter *iter)
- {
- 	xfree(iter);
- }
--EXPORT_SYMBOL(nftnl_set_elems_iter_destroy);
- 
- static bool nftnl_attr_nest_overflow(struct nlmsghdr *nlh,
- 				   const struct nlattr *from,
-@@ -831,7 +808,7 @@ static bool nftnl_attr_nest_overflow(struct nlmsghdr *nlh,
- 	return false;
- }
- 
--int nftnl_set_elems_nlmsg_build_payload_iter(struct nlmsghdr *nlh,
-+int __EXPORTED nftnl_set_elems_nlmsg_build_payload_iter(struct nlmsghdr *nlh,
- 					   struct nftnl_set_elems_iter *iter)
- {
- 	struct nftnl_set_elem *elem;
-@@ -861,4 +838,3 @@ int nftnl_set_elems_nlmsg_build_payload_iter(struct nlmsghdr *nlh,
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nftnl_set_elems_nlmsg_build_payload_iter);
-diff --git a/src/table.c b/src/table.c
-index a7d5a8f..0e99f3c 100644
---- a/src/table.c
-+++ b/src/table.c
-@@ -36,28 +36,25 @@ struct nftnl_table {
- 	uint32_t	flags;
- };
- 
--struct nftnl_table *nftnl_table_alloc(void)
-+struct nftnl_table __EXPORTED *nftnl_table_alloc(void)
- {
- 	return calloc(1, sizeof(struct nftnl_table));
- }
--EXPORT_SYMBOL(nftnl_table_alloc);
- 
--void nftnl_table_free(const struct nftnl_table *t)
-+void __EXPORTED nftnl_table_free(const struct nftnl_table *t)
- {
- 	if (t->flags & (1 << NFTNL_TABLE_NAME))
- 		xfree(t->name);
- 
- 	xfree(t);
- }
--EXPORT_SYMBOL(nftnl_table_free);
- 
--bool nftnl_table_is_set(const struct nftnl_table *t, uint16_t attr)
-+bool __EXPORTED nftnl_table_is_set(const struct nftnl_table *t, uint16_t attr)
- {
- 	return t->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_table_is_set);
- 
--void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
-+void __EXPORTED nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
- {
- 	if (!(t->flags & (1 << attr)))
- 		return;
-@@ -74,14 +71,13 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
- 	}
- 	t->flags &= ~(1 << attr);
- }
--EXPORT_SYMBOL(nftnl_table_unset);
- 
- static uint32_t nftnl_table_validate[NFTNL_TABLE_MAX + 1] = {
- 	[NFTNL_TABLE_FLAGS]	= sizeof(uint32_t),
- 	[NFTNL_TABLE_FAMILY]	= sizeof(uint32_t),
- };
- 
--int nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
-+int __EXPORTED nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
- 			 const void *data, uint32_t data_len)
- {
- 	nftnl_assert_attr_exists(attr, NFTNL_TABLE_MAX);
-@@ -109,33 +105,28 @@ int nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
- 	t->flags |= (1 << attr);
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_table_set_data);
- 
--void nftnl_table_set(struct nftnl_table *t, uint16_t attr, const void *data)
-+void __EXPORTED nftnl_table_set(struct nftnl_table *t, uint16_t attr, const void *data)
- {
- 	nftnl_table_set_data(t, attr, data, nftnl_table_validate[attr]);
- }
--EXPORT_SYMBOL(nftnl_table_set);
- 
--void nftnl_table_set_u32(struct nftnl_table *t, uint16_t attr, uint32_t val)
-+void __EXPORTED nftnl_table_set_u32(struct nftnl_table *t, uint16_t attr, uint32_t val)
- {
- 	nftnl_table_set_data(t, attr, &val, sizeof(uint32_t));
- }
--EXPORT_SYMBOL(nftnl_table_set_u32);
- 
--void nftnl_table_set_u8(struct nftnl_table *t, uint16_t attr, uint8_t val)
-+void __EXPORTED nftnl_table_set_u8(struct nftnl_table *t, uint16_t attr, uint8_t val)
- {
- 	nftnl_table_set_data(t, attr, &val, sizeof(uint8_t));
- }
--EXPORT_SYMBOL(nftnl_table_set_u8);
- 
--int nftnl_table_set_str(struct nftnl_table *t, uint16_t attr, const char *str)
-+int __EXPORTED nftnl_table_set_str(struct nftnl_table *t, uint16_t attr, const char *str)
- {
- 	return nftnl_table_set_data(t, attr, str, strlen(str) + 1);
- }
--EXPORT_SYMBOL(nftnl_table_set_str);
- 
--const void *nftnl_table_get_data(const struct nftnl_table *t, uint16_t attr,
-+const void __EXPORTED *nftnl_table_get_data(const struct nftnl_table *t, uint16_t attr,
- 				 uint32_t *data_len)
- {
- 	if (!(t->flags & (1 << attr)))
-@@ -157,43 +148,37 @@ const void *nftnl_table_get_data(const struct nftnl_table *t, uint16_t attr,
- 	}
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_table_get_data);
- 
--const void *nftnl_table_get(const struct nftnl_table *t, uint16_t attr)
-+const void __EXPORTED *nftnl_table_get(const struct nftnl_table *t, uint16_t attr)
- {
- 	uint32_t data_len;
- 	return nftnl_table_get_data(t, attr, &data_len);
- }
--EXPORT_SYMBOL(nftnl_table_get);
- 
--uint32_t nftnl_table_get_u32(const struct nftnl_table *t, uint16_t attr)
-+uint32_t __EXPORTED nftnl_table_get_u32(const struct nftnl_table *t, uint16_t attr)
- {
- 	const void *ret = nftnl_table_get(t, attr);
- 	return ret == NULL ? 0 : *((uint32_t *)ret);
- }
--EXPORT_SYMBOL(nftnl_table_get_u32);
- 
--uint8_t nftnl_table_get_u8(const struct nftnl_table *t, uint16_t attr)
-+uint8_t __EXPORTED nftnl_table_get_u8(const struct nftnl_table *t, uint16_t attr)
- {
- 	const void *ret = nftnl_table_get(t, attr);
- 	return ret == NULL ? 0 : *((uint8_t *)ret);
- }
--EXPORT_SYMBOL(nftnl_table_get_u8);
- 
--const char *nftnl_table_get_str(const struct nftnl_table *t, uint16_t attr)
-+const char __EXPORTED *nftnl_table_get_str(const struct nftnl_table *t, uint16_t attr)
- {
- 	return nftnl_table_get(t, attr);
- }
--EXPORT_SYMBOL(nftnl_table_get_str);
- 
--void nftnl_table_nlmsg_build_payload(struct nlmsghdr *nlh, const struct nftnl_table *t)
-+void __EXPORTED nftnl_table_nlmsg_build_payload(struct nlmsghdr *nlh, const struct nftnl_table *t)
- {
- 	if (t->flags & (1 << NFTNL_TABLE_NAME))
- 		mnl_attr_put_strz(nlh, NFTA_TABLE_NAME, t->name);
- 	if (t->flags & (1 << NFTNL_TABLE_FLAGS))
- 		mnl_attr_put_u32(nlh, NFTA_TABLE_FLAGS, htonl(t->table_flags));
- }
--EXPORT_SYMBOL(nftnl_table_nlmsg_build_payload);
- 
- static int nftnl_table_parse_attr_cb(const struct nlattr *attr, void *data)
- {
-@@ -219,7 +204,7 @@ static int nftnl_table_parse_attr_cb(const struct nlattr *attr, void *data)
- 	return MNL_CB_OK;
- }
- 
--int nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
-+int __EXPORTED nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
- {
- 	struct nlattr *tb[NFTA_TABLE_MAX+1] = {};
- 	struct nfgenmsg *nfg = mnl_nlmsg_get_payload(nlh);
-@@ -249,7 +234,6 @@ int nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
- 
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_table_nlmsg_parse);
- 
- #ifdef JSON_PARSING
- int nftnl_jansson_parse_table(struct nftnl_table *t, json_t *tree,
-@@ -330,19 +314,17 @@ static int nftnl_table_do_parse(struct nftnl_table *t, enum nftnl_parse_type typ
- 	return ret;
- }
- 
--int nftnl_table_parse(struct nftnl_table *t, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_table_parse(struct nftnl_table *t, enum nftnl_parse_type type,
- 		    const char *data, struct nftnl_parse_err *err)
- {
- 	return nftnl_table_do_parse(t, type, data, err, NFTNL_PARSE_BUFFER);
- }
--EXPORT_SYMBOL(nftnl_table_parse);
- 
--int nftnl_table_parse_file(struct nftnl_table *t, enum nftnl_parse_type type,
-+int __EXPORTED nftnl_table_parse_file(struct nftnl_table *t, enum nftnl_parse_type type,
- 			 FILE *fp, struct nftnl_parse_err *err)
- {
- 	return nftnl_table_do_parse(t, type, fp, err, NFTNL_PARSE_FILE);
- }
--EXPORT_SYMBOL(nftnl_table_parse_file);
- 
- static int nftnl_table_export(char *buf, size_t size,
- 			      const struct nftnl_table *t, int type)
-@@ -400,13 +382,12 @@ static int nftnl_table_cmd_snprintf(char *buf, size_t size,
- 	return offset;
- }
- 
--int nftnl_table_snprintf(char *buf, size_t size, const struct nftnl_table *t,
-+int __EXPORTED nftnl_table_snprintf(char *buf, size_t size, const struct nftnl_table *t,
- 			 uint32_t type, uint32_t flags)
- {
- 	return nftnl_table_cmd_snprintf(buf, size, t, nftnl_flag2cmd(flags), type,
- 				      flags);
- }
--EXPORT_SYMBOL(nftnl_table_snprintf);
- 
- static int nftnl_table_do_snprintf(char *buf, size_t size, const void *t,
- 				   uint32_t cmd, uint32_t type, uint32_t flags)
-@@ -414,19 +395,18 @@ static int nftnl_table_do_snprintf(char *buf, size_t size, const void *t,
- 	return nftnl_table_snprintf(buf, size, t, type, flags);
- }
- 
--int nftnl_table_fprintf(FILE *fp, const struct nftnl_table *t, uint32_t type,
-+int __EXPORTED nftnl_table_fprintf(FILE *fp, const struct nftnl_table *t, uint32_t type,
- 			uint32_t flags)
- {
- 	return nftnl_fprintf(fp, t, NFTNL_CMD_UNSPEC, type, flags,
- 			   nftnl_table_do_snprintf);
- }
--EXPORT_SYMBOL(nftnl_table_fprintf);
- 
- struct nftnl_table_list {
- 	struct list_head list;
- };
- 
--struct nftnl_table_list *nftnl_table_list_alloc(void)
-+struct nftnl_table_list __EXPORTED *nftnl_table_list_alloc(void)
- {
- 	struct nftnl_table_list *list;
- 
-@@ -438,9 +418,8 @@ struct nftnl_table_list *nftnl_table_list_alloc(void)
- 
- 	return list;
- }
--EXPORT_SYMBOL(nftnl_table_list_alloc);
- 
--void nftnl_table_list_free(struct nftnl_table_list *list)
-+void __EXPORTED nftnl_table_list_free(struct nftnl_table_list *list)
- {
- 	struct nftnl_table *r, *tmp;
- 
-@@ -450,33 +429,28 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
- 	}
- 	xfree(list);
- }
--EXPORT_SYMBOL(nftnl_table_list_free);
- 
--int nftnl_table_list_is_empty(const struct nftnl_table_list *list)
-+int __EXPORTED nftnl_table_list_is_empty(const struct nftnl_table_list *list)
- {
- 	return list_empty(&list->list);
- }
--EXPORT_SYMBOL(nftnl_table_list_is_empty);
- 
--void nftnl_table_list_add(struct nftnl_table *r, struct nftnl_table_list *list)
-+void __EXPORTED nftnl_table_list_add(struct nftnl_table *r, struct nftnl_table_list *list)
- {
- 	list_add(&r->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_table_list_add);
- 
--void nftnl_table_list_add_tail(struct nftnl_table *r, struct nftnl_table_list *list)
-+void __EXPORTED nftnl_table_list_add_tail(struct nftnl_table *r, struct nftnl_table_list *list)
- {
- 	list_add_tail(&r->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_table_list_add_tail);
- 
--void nftnl_table_list_del(struct nftnl_table *t)
-+void __EXPORTED nftnl_table_list_del(struct nftnl_table *t)
- {
- 	list_del(&t->head);
- }
--EXPORT_SYMBOL(nftnl_table_list_del);
- 
--int nftnl_table_list_foreach(struct nftnl_table_list *table_list,
-+int __EXPORTED nftnl_table_list_foreach(struct nftnl_table_list *table_list,
- 			   int (*cb)(struct nftnl_table *t, void *data),
- 			   void *data)
- {
-@@ -490,14 +464,13 @@ int nftnl_table_list_foreach(struct nftnl_table_list *table_list,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_table_list_foreach);
- 
- struct nftnl_table_list_iter {
- 	const struct nftnl_table_list	*list;
- 	struct nftnl_table		*cur;
- };
- 
--struct nftnl_table_list_iter *
-+struct nftnl_table_list_iter __EXPORTED *
- nftnl_table_list_iter_create(const struct nftnl_table_list *l)
- {
- 	struct nftnl_table_list_iter *iter;
-@@ -514,9 +487,8 @@ nftnl_table_list_iter_create(const struct nftnl_table_list *l)
- 
- 	return iter;
- }
--EXPORT_SYMBOL(nftnl_table_list_iter_create);
- 
--struct nftnl_table *nftnl_table_list_iter_next(struct nftnl_table_list_iter *iter)
-+struct nftnl_table __EXPORTED *nftnl_table_list_iter_next(struct nftnl_table_list_iter *iter)
- {
- 	struct nftnl_table *r = iter->cur;
- 
-@@ -530,10 +502,8 @@ struct nftnl_table *nftnl_table_list_iter_next(struct nftnl_table_list_iter *ite
- 
- 	return r;
- }
--EXPORT_SYMBOL(nftnl_table_list_iter_next);
- 
--void nftnl_table_list_iter_destroy(const struct nftnl_table_list_iter *iter)
-+void __EXPORTED nftnl_table_list_iter_destroy(const struct nftnl_table_list_iter *iter)
- {
- 	xfree(iter);
- }
--EXPORT_SYMBOL(nftnl_table_list_iter_destroy);
-diff --git a/src/trace.c b/src/trace.c
-index bd05d3c..4739ef9 100644
---- a/src/trace.c
-+++ b/src/trace.c
-@@ -52,14 +52,12 @@ struct nftnl_trace {
- 	uint32_t flags;
- };
- 
--EXPORT_SYMBOL(nftnl_trace_alloc);
--struct nftnl_trace *nftnl_trace_alloc(void)
-+struct nftnl_trace __EXPORTED *nftnl_trace_alloc(void)
- {
- 	return calloc(1, sizeof(struct nftnl_trace));
- }
- 
--EXPORT_SYMBOL(nftnl_trace_free);
--void nftnl_trace_free(const struct nftnl_trace *t)
-+void __EXPORTED nftnl_trace_free(const struct nftnl_trace *t)
- {
- 	xfree(t->chain);
- 	xfree(t->table);
-@@ -70,8 +68,7 @@ void nftnl_trace_free(const struct nftnl_trace *t)
- 	xfree(t);
- }
- 
--EXPORT_SYMBOL(nftnl_trace_is_set);
--bool nftnl_trace_is_set(const struct nftnl_trace *t, uint16_t attr)
-+bool __EXPORTED nftnl_trace_is_set(const struct nftnl_trace *t, uint16_t attr)
- {
- 	return t->flags & (1 << attr);
- }
-@@ -130,8 +127,7 @@ static int nftnl_trace_parse_attr_cb(const struct nlattr *attr, void *data)
- 	return MNL_CB_OK;
- }
- 
--EXPORT_SYMBOL(nftnl_trace_get_data);
--const void *nftnl_trace_get_data(const struct nftnl_trace *trace,
-+const void __EXPORTED *nftnl_trace_get_data(const struct nftnl_trace *trace,
- 				 uint16_t type, uint32_t *data_len)
- {
- 	enum nftnl_trace_attr attr = type;
-@@ -201,8 +197,7 @@ const void *nftnl_trace_get_data(const struct nftnl_trace *trace,
- 	return NULL;
- }
- 
--EXPORT_SYMBOL(nftnl_trace_get_str);
--const char *nftnl_trace_get_str(const struct nftnl_trace *trace, uint16_t type)
-+const char __EXPORTED *nftnl_trace_get_str(const struct nftnl_trace *trace, uint16_t type)
- {
- 	if (!nftnl_trace_is_set(trace, type))
- 		return NULL;
-@@ -216,8 +211,7 @@ const char *nftnl_trace_get_str(const struct nftnl_trace *trace, uint16_t type)
- 	return NULL;
- }
- 
--EXPORT_SYMBOL(nftnl_trace_get_u16);
--uint16_t nftnl_trace_get_u16(const struct nftnl_trace *trace, uint16_t type)
-+uint16_t __EXPORTED nftnl_trace_get_u16(const struct nftnl_trace *trace, uint16_t type)
- {
- 	const uint16_t *d;
- 	uint32_t dlen;
-@@ -229,8 +223,7 @@ uint16_t nftnl_trace_get_u16(const struct nftnl_trace *trace, uint16_t type)
- 	return 0;
- }
- 
--EXPORT_SYMBOL(nftnl_trace_get_u32);
--uint32_t nftnl_trace_get_u32(const struct nftnl_trace *trace, uint16_t type)
-+uint32_t __EXPORTED nftnl_trace_get_u32(const struct nftnl_trace *trace, uint16_t type)
- {
- 	const uint32_t *d;
- 	uint32_t dlen;
-@@ -242,8 +235,7 @@ uint32_t nftnl_trace_get_u32(const struct nftnl_trace *trace, uint16_t type)
- 	return 0;
- }
- 
--EXPORT_SYMBOL(nftnl_trace_get_u64);
--uint64_t nftnl_trace_get_u64(const struct nftnl_trace *trace, uint16_t type)
-+uint64_t __EXPORTED nftnl_trace_get_u64(const struct nftnl_trace *trace, uint16_t type)
- {
- 	const uint64_t *d;
- 	uint32_t dlen;
-@@ -323,9 +315,8 @@ static int nftnl_trace_parse_verdict(const struct nlattr *attr,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_trace_nlmsg_parse);
- 
--int nftnl_trace_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_trace *t)
-+int __EXPORTED nftnl_trace_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_trace *t)
- {
- 	struct nfgenmsg *nfg = mnl_nlmsg_get_payload(nlh);
- 	struct nlattr *tb[NFTA_TRACE_MAX+1] = {};
-diff --git a/src/udata.c b/src/udata.c
-index d679dd0..7e2de0f 100644
---- a/src/udata.c
-+++ b/src/udata.c
-@@ -16,7 +16,7 @@
- #include <stdint.h>
- #include <string.h>
- 
--struct nftnl_udata_buf *nftnl_udata_buf_alloc(uint32_t data_size)
-+struct nftnl_udata_buf __EXPORTED *nftnl_udata_buf_alloc(uint32_t data_size)
- {
- 	struct nftnl_udata_buf *buf;
- 
-@@ -28,47 +28,40 @@ struct nftnl_udata_buf *nftnl_udata_buf_alloc(uint32_t data_size)
- 
- 	return buf;
- }
--EXPORT_SYMBOL(nftnl_udata_buf_alloc);
- 
--void nftnl_udata_buf_free(const struct nftnl_udata_buf *buf)
-+void __EXPORTED nftnl_udata_buf_free(const struct nftnl_udata_buf *buf)
- {
- 	xfree(buf);
- }
--EXPORT_SYMBOL(nftnl_udata_buf_free);
- 
--uint32_t nftnl_udata_buf_len(const struct nftnl_udata_buf *buf)
-+uint32_t __EXPORTED nftnl_udata_buf_len(const struct nftnl_udata_buf *buf)
- {
- 	return (uint32_t)(buf->end - buf->data);
- }
--EXPORT_SYMBOL(nftnl_udata_buf_len);
- 
--void *nftnl_udata_buf_data(const struct nftnl_udata_buf *buf)
-+void __EXPORTED *nftnl_udata_buf_data(const struct nftnl_udata_buf *buf)
- {
- 	return (void *)buf->data;
- }
--EXPORT_SYMBOL(nftnl_udata_buf_data);
- 
--void nftnl_udata_buf_put(struct nftnl_udata_buf *buf, const void *data,
-+void __EXPORTED nftnl_udata_buf_put(struct nftnl_udata_buf *buf, const void *data,
- 			 uint32_t len)
- {
- 	memcpy(buf->data, data, len <= buf->size ? len : buf->size);
- 	buf->end = buf->data + len;
- }
--EXPORT_SYMBOL(nftnl_udata_buf_put);
- 
--struct nftnl_udata *nftnl_udata_start(const struct nftnl_udata_buf *buf)
-+struct nftnl_udata __EXPORTED *nftnl_udata_start(const struct nftnl_udata_buf *buf)
- {
- 	return (struct nftnl_udata *)buf->data;
- }
--EXPORT_SYMBOL(nftnl_udata_start);
- 
--struct nftnl_udata *nftnl_udata_end(const struct nftnl_udata_buf *buf)
-+struct nftnl_udata __EXPORTED *nftnl_udata_end(const struct nftnl_udata_buf *buf)
- {
- 	return (struct nftnl_udata *)buf->end;
- }
--EXPORT_SYMBOL(nftnl_udata_end);
- 
--bool nftnl_udata_put(struct nftnl_udata_buf *buf, uint8_t type, uint32_t len,
-+bool __EXPORTED nftnl_udata_put(struct nftnl_udata_buf *buf, uint8_t type, uint32_t len,
- 		     const void *value)
- {
- 	struct nftnl_udata *attr;
-@@ -85,55 +78,47 @@ bool nftnl_udata_put(struct nftnl_udata_buf *buf, uint8_t type, uint32_t len,
- 
- 	return true;
- }
--EXPORT_SYMBOL(nftnl_udata_put);
- 
--bool nftnl_udata_put_strz(struct nftnl_udata_buf *buf, uint8_t type,
-+bool __EXPORTED nftnl_udata_put_strz(struct nftnl_udata_buf *buf, uint8_t type,
- 			  const char *strz)
- {
- 	return nftnl_udata_put(buf, type, strlen(strz) + 1, strz);
- }
--EXPORT_SYMBOL(nftnl_udata_put_strz);
- 
--bool nftnl_udata_put_u32(struct nftnl_udata_buf *buf, uint8_t type,
-+bool __EXPORTED nftnl_udata_put_u32(struct nftnl_udata_buf *buf, uint8_t type,
- 			 uint32_t data)
- {
- 	return nftnl_udata_put(buf, type, sizeof(data), &data);
- }
--EXPORT_SYMBOL(nftnl_udata_put_u32);
- 
--uint8_t nftnl_udata_type(const struct nftnl_udata *attr)
-+uint8_t __EXPORTED nftnl_udata_type(const struct nftnl_udata *attr)
- {
- 	return attr->type;
- }
--EXPORT_SYMBOL(nftnl_udata_type);
- 
--uint8_t nftnl_udata_len(const struct nftnl_udata *attr)
-+uint8_t __EXPORTED nftnl_udata_len(const struct nftnl_udata *attr)
- {
- 	return attr->len;
- }
--EXPORT_SYMBOL(nftnl_udata_len);
- 
--void *nftnl_udata_get(const struct nftnl_udata *attr)
-+void __EXPORTED *nftnl_udata_get(const struct nftnl_udata *attr)
- {
- 	return (void *)attr->value;
- }
--EXPORT_SYMBOL(nftnl_udata_get);
- 
--uint32_t nftnl_udata_get_u32(const struct nftnl_udata *attr)
-+uint32_t __EXPORTED nftnl_udata_get_u32(const struct nftnl_udata *attr)
- {
- 	uint32_t *data = (uint32_t *)attr->value;
- 
- 	return *data;
- }
--EXPORT_SYMBOL(nftnl_udata_get_u32);
- 
--struct nftnl_udata *nftnl_udata_next(const struct nftnl_udata *attr)
-+struct nftnl_udata __EXPORTED *nftnl_udata_next(const struct nftnl_udata *attr)
- {
- 	return (struct nftnl_udata *)&attr->value[attr->len];
- }
--EXPORT_SYMBOL(nftnl_udata_next);
- 
--int nftnl_udata_parse(const void *data, uint32_t data_len, nftnl_udata_cb_t cb,
-+int __EXPORTED nftnl_udata_parse(const void *data, uint32_t data_len, nftnl_udata_cb_t cb,
- 		      void *cb_data)
- {
- 	int ret = 0;
-@@ -147,4 +132,3 @@ int nftnl_udata_parse(const void *data, uint32_t data_len, nftnl_udata_cb_t cb,
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nftnl_udata_parse);
--- 
-2.11.0 (Apple Git-81)
-
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
new file mode 100644
index 000000000000..995fd59a5362
--- /dev/null
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
@@ -0,0 +1,289 @@
+From 21eb59fbd071ebffb8495232766824944fb521a0 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Wed, 7 Nov 2018 21:19:53 +0000
+Subject: [PATCH] Move exports before symbol definition
+
+Based on 7966020 ("src: Fix exporting symbols with clang"), when
+EXPORT_SYMBOL is located after function definition, clang won't properly
+export the function, resulting in a library with no symbols when built with
+clang.
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/flowtable.c | 54 +++++++++++++++++++++++++++---------------------------
+ 1 file changed, 27 insertions(+), 27 deletions(-)
+
+diff --git a/src/flowtable.c b/src/flowtable.c
+index c1ddae4..d7434e3 100644
+--- a/src/flowtable.c
++++ b/src/flowtable.c
+@@ -34,12 +34,13 @@ struct nftnl_flowtable {
+ 	uint32_t		flags;
+ };
+ 
++EXPORT_SYMBOL(nftnl_flowtable_alloc);
+ struct nftnl_flowtable *nftnl_flowtable_alloc(void)
+ {
+ 	return calloc(1, sizeof(struct nftnl_flowtable));
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_alloc);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_free);
+ void nftnl_flowtable_free(const struct nftnl_flowtable *c)
+ {
+ 	int i;
+@@ -56,14 +57,14 @@ void nftnl_flowtable_free(const struct nftnl_flowtable *c)
+ 	}
+ 	xfree(c);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_free);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_is_set);
+ bool nftnl_flowtable_is_set(const struct nftnl_flowtable *c, uint16_t attr)
+ {
+ 	return c->flags & (1 << attr);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_is_set);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_unset);
+ void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
+ {
+ 	int i;
+@@ -96,7 +97,6 @@ void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
+ 
+ 	c->flags &= ~(1 << attr);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_unset);
+ 
+ static uint32_t nftnl_flowtable_validate[NFTNL_FLOWTABLE_MAX + 1] = {
+ 	[NFTNL_FLOWTABLE_HOOKNUM]	= sizeof(uint32_t),
+@@ -105,6 +105,7 @@ static uint32_t nftnl_flowtable_validate[NFTNL_FLOWTABLE_MAX + 1] = {
+ 	[NFTNL_FLOWTABLE_FLAGS]		= sizeof(uint32_t),
+ };
+ 
++EXPORT_SYMBOL(nftnl_flowtable_set_data);
+ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+ 			     const void *data, uint32_t data_len)
+ {
+@@ -170,32 +171,32 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+ 	c->flags |= (1 << attr);
+ 	return 0;
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_set_data);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_set);
+ void nftnl_flowtable_set(struct nftnl_flowtable *c, uint16_t attr, const void *data)
+ {
+ 	nftnl_flowtable_set_data(c, attr, data, nftnl_flowtable_validate[attr]);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_set);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_set_u32);
+ void nftnl_flowtable_set_u32(struct nftnl_flowtable *c, uint16_t attr, uint32_t data)
+ {
+ 	nftnl_flowtable_set_data(c, attr, &data, sizeof(uint32_t));
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_set_u32);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_set_s32);
+ void nftnl_flowtable_set_s32(struct nftnl_flowtable *c, uint16_t attr, int32_t data)
+ {
+ 	nftnl_flowtable_set_data(c, attr, &data, sizeof(int32_t));
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_set_s32);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_set_str);
+ int nftnl_flowtable_set_str(struct nftnl_flowtable *c, uint16_t attr, const char *str)
+ {
+ 	return nftnl_flowtable_set_data(c, attr, str, strlen(str) + 1);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_set_str);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_get_data);
+ const void *nftnl_flowtable_get_data(const struct nftnl_flowtable *c,
+ 				     uint16_t attr, uint32_t *data_len)
+ {
+@@ -229,21 +230,21 @@ const void *nftnl_flowtable_get_data(const struct nftnl_flowtable *c,
+ 	}
+ 	return NULL;
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_get_data);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_get);
+ const void *nftnl_flowtable_get(const struct nftnl_flowtable *c, uint16_t attr)
+ {
+ 	uint32_t data_len;
+ 	return nftnl_flowtable_get_data(c, attr, &data_len);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_get);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_get_str);
+ const char *nftnl_flowtable_get_str(const struct nftnl_flowtable *c, uint16_t attr)
+ {
+ 	return nftnl_flowtable_get(c, attr);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_get_str);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_get_u32);
+ uint32_t nftnl_flowtable_get_u32(const struct nftnl_flowtable *c, uint16_t attr)
+ {
+ 	uint32_t data_len;
+@@ -253,8 +254,8 @@ uint32_t nftnl_flowtable_get_u32(const struct nftnl_flowtable *c, uint16_t attr)
+ 
+ 	return val ? *val : 0;
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_get_u32);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_get_s32);
+ int32_t nftnl_flowtable_get_s32(const struct nftnl_flowtable *c, uint16_t attr)
+ {
+ 	uint32_t data_len;
+@@ -264,8 +265,8 @@ int32_t nftnl_flowtable_get_s32(const struct nftnl_flowtable *c, uint16_t attr)
+ 
+ 	return val ? *val : 0;
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_get_s32);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_nlmsg_build_payload);
+ void nftnl_flowtable_nlmsg_build_payload(struct nlmsghdr *nlh,
+ 					 const struct nftnl_flowtable *c)
+ {
+@@ -301,7 +302,6 @@ void nftnl_flowtable_nlmsg_build_payload(struct nlmsghdr *nlh,
+ 	if (c->flags & (1 << NFTNL_FLOWTABLE_SIZE))
+ 		mnl_attr_put_u32(nlh, NFTA_FLOWTABLE_SIZE, htonl(c->size));
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_nlmsg_build_payload);
+ 
+ static int nftnl_flowtable_parse_attr_cb(const struct nlattr *attr, void *data)
+ {
+@@ -412,6 +412,7 @@ static int nftnl_flowtable_parse_hook(struct nlattr *attr, struct nftnl_flowtabl
+ 	return 0;
+ }
+ 
++EXPORT_SYMBOL(nftnl_flowtable_nlmsg_parse);
+ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtable *c)
+ {
+ 	struct nlattr *tb[NFTA_FLOWTABLE_MAX + 1] = {};
+@@ -460,7 +461,6 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
+ 
+ 	return ret;
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_nlmsg_parse);
+ 
+ static const char *nftnl_hooknum2str(int family, int hooknum)
+ {
+@@ -612,20 +612,20 @@ static int nftnl_flowtable_do_parse(struct nftnl_flowtable *c,
+ 	return ret;
+ }
+ 
++EXPORT_SYMBOL(nftnl_flowtable_parse);
+ int nftnl_flowtable_parse(struct nftnl_flowtable *c, enum nftnl_parse_type type,
+ 			  const char *data, struct nftnl_parse_err *err)
+ {
+ 	return nftnl_flowtable_do_parse(c, type, data, err, NFTNL_PARSE_BUFFER);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_parse);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_parse_file);
+ int nftnl_flowtable_parse_file(struct nftnl_flowtable *c,
+ 			       enum nftnl_parse_type type,
+ 			       FILE *fp, struct nftnl_parse_err *err)
+ {
+ 	return nftnl_flowtable_do_parse(c, type, fp, err, NFTNL_PARSE_FILE);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_parse_file);
+ 
+ static int nftnl_flowtable_export(char *buf, size_t size,
+ 				  const struct nftnl_flowtable *c, int type)
+@@ -720,6 +720,7 @@ static int nftnl_flowtable_cmd_snprintf(char *buf, size_t size,
+ 	return offset;
+ }
+ 
++EXPORT_SYMBOL(nftnl_flowtable_snprintf);
+ int nftnl_flowtable_snprintf(char *buf, size_t size, const struct nftnl_flowtable *c,
+ 			 uint32_t type, uint32_t flags)
+ {
+@@ -729,7 +730,6 @@ int nftnl_flowtable_snprintf(char *buf, size_t size, const struct nftnl_flowtabl
+ 	return nftnl_flowtable_cmd_snprintf(buf, size, c, nftnl_flag2cmd(flags),
+ 					    type, flags);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_snprintf);
+ 
+ static int nftnl_flowtable_do_snprintf(char *buf, size_t size, const void *c,
+ 				   uint32_t cmd, uint32_t type, uint32_t flags)
+@@ -737,18 +737,19 @@ static int nftnl_flowtable_do_snprintf(char *buf, size_t size, const void *c,
+ 	return nftnl_flowtable_snprintf(buf, size, c, type, flags);
+ }
+ 
++EXPORT_SYMBOL(nftnl_flowtable_fprintf);
+ int nftnl_flowtable_fprintf(FILE *fp, const struct nftnl_flowtable *c,
+ 			    uint32_t type, uint32_t flags)
+ {
+ 	return nftnl_fprintf(fp, c, NFTNL_CMD_UNSPEC, type, flags,
+ 			   nftnl_flowtable_do_snprintf);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_fprintf);
+ 
+ struct nftnl_flowtable_list {
+ 	struct list_head list;
+ };
+ 
++EXPORT_SYMBOL(nftnl_flowtable_list_alloc);
+ struct nftnl_flowtable_list *nftnl_flowtable_list_alloc(void)
+ {
+ 	struct nftnl_flowtable_list *list;
+@@ -761,8 +762,8 @@ struct nftnl_flowtable_list *nftnl_flowtable_list_alloc(void)
+ 
+ 	return list;
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_list_alloc);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_list_free);
+ void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
+ {
+ 	struct nftnl_flowtable *s, *tmp;
+@@ -773,34 +774,34 @@ void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
+ 	}
+ 	xfree(list);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_list_free);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_list_is_empty);
+ int nftnl_flowtable_list_is_empty(const struct nftnl_flowtable_list *list)
+ {
+ 	return list_empty(&list->list);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_list_is_empty);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_list_add);
+ void nftnl_flowtable_list_add(struct nftnl_flowtable *s,
+ 			      struct nftnl_flowtable_list *list)
+ {
+ 	list_add(&s->head, &list->list);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_list_add);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_list_add_tail);
+ void nftnl_flowtable_list_add_tail(struct nftnl_flowtable *s,
+ 				   struct nftnl_flowtable_list *list)
+ {
+ 	list_add_tail(&s->head, &list->list);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_list_add_tail);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_list_del);
+ void nftnl_flowtable_list_del(struct nftnl_flowtable *s)
+ {
+ 	list_del(&s->head);
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_list_del);
+ 
++EXPORT_SYMBOL(nftnl_flowtable_list_foreach);
+ int nftnl_flowtable_list_foreach(struct nftnl_flowtable_list *flowtable_list,
+ 				 int (*cb)(struct nftnl_flowtable *t, void *data), void *data)
+ {
+@@ -814,4 +815,3 @@ int nftnl_flowtable_list_foreach(struct nftnl_flowtable_list *flowtable_list,
+ 	}
+ 	return 0;
+ }
+-EXPORT_SYMBOL(nftnl_flowtable_list_foreach);
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
similarity index 71%
rename from meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
rename to meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
index 06e68177cec9..e7e8f6fe91a2 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
@@ -1,51 +1,55 @@
-From f840cc0da571d98beb17855c177e9986bd096b72 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Apr 2017 11:46:09 -0700
+From 5ea9fa9d345005f2f53b1b598edb85f5f24ca9da Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Wed, 7 Nov 2018 19:41:54 +0000
 Subject: [PATCH] avoid naming local function as one of printf family
 
 Fixes build issues with clang
 error: no member named '__builtin___snprintf_chk' in 'struct expr_ops'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
- include/expr_ops.h   | 2 +-
- include/obj.h        | 2 +-
- src/buffer.c         | 2 +-
- src/expr.c           | 4 ++--
- src/expr/bitwise.c   | 2 +-
- src/expr/byteorder.c | 2 +-
- src/expr/cmp.c       | 2 +-
- src/expr/counter.c   | 2 +-
- src/expr/ct.c        | 2 +-
- src/expr/dup.c       | 2 +-
- src/expr/dynset.c    | 2 +-
- src/expr/exthdr.c    | 2 +-
- src/expr/fib.c       | 2 +-
- src/expr/fwd.c       | 2 +-
- src/expr/hash.c      | 2 +-
- src/expr/immediate.c | 2 +-
- src/expr/limit.c     | 2 +-
- src/expr/log.c       | 2 +-
- src/expr/lookup.c    | 2 +-
- src/expr/masq.c      | 2 +-
- src/expr/match.c     | 2 +-
- src/expr/meta.c      | 2 +-
- src/expr/nat.c       | 2 +-
- src/expr/numgen.c    | 2 +-
- src/expr/objref.c    | 2 +-
- src/expr/payload.c   | 2 +-
- src/expr/queue.c     | 2 +-
- src/expr/quota.c     | 2 +-
- src/expr/range.c     | 2 +-
- src/expr/redir.c     | 2 +-
- src/expr/reject.c    | 2 +-
- src/expr/rt.c        | 2 +-
- src/expr/target.c    | 2 +-
- src/obj/counter.c    | 2 +-
- src/obj/ct_helper.c  | 2 +-
- src/obj/quota.c      | 2 +-
- src/object.c         | 4 ++--
- 37 files changed, 39 insertions(+), 39 deletions(-)
+ include/expr_ops.h      | 2 +-
+ include/obj.h           | 2 +-
+ src/expr.c              | 4 ++--
+ src/expr/bitwise.c      | 2 +-
+ src/expr/byteorder.c    | 2 +-
+ src/expr/cmp.c          | 2 +-
+ src/expr/connlimit.c    | 2 +-
+ src/expr/counter.c      | 2 +-
+ src/expr/ct.c           | 2 +-
+ src/expr/dup.c          | 2 +-
+ src/expr/dynset.c       | 2 +-
+ src/expr/exthdr.c       | 2 +-
+ src/expr/fib.c          | 2 +-
+ src/expr/flow_offload.c | 2 +-
+ src/expr/fwd.c          | 2 +-
+ src/expr/hash.c         | 2 +-
+ src/expr/immediate.c    | 2 +-
+ src/expr/limit.c        | 2 +-
+ src/expr/log.c          | 2 +-
+ src/expr/lookup.c       | 2 +-
+ src/expr/masq.c         | 2 +-
+ src/expr/match.c        | 2 +-
+ src/expr/meta.c         | 2 +-
+ src/expr/nat.c          | 2 +-
+ src/expr/numgen.c       | 2 +-
+ src/expr/objref.c       | 2 +-
+ src/expr/payload.c      | 2 +-
+ src/expr/queue.c        | 2 +-
+ src/expr/quota.c        | 2 +-
+ src/expr/range.c        | 2 +-
+ src/expr/redir.c        | 2 +-
+ src/expr/reject.c       | 2 +-
+ src/expr/rt.c           | 2 +-
+ src/expr/socket.c       | 2 +-
+ src/expr/target.c       | 2 +-
+ src/obj/counter.c       | 2 +-
+ src/obj/ct_helper.c     | 2 +-
+ src/obj/limit.c         | 2 +-
+ src/obj/quota.c         | 2 +-
+ src/object.c            | 4 ++--
+ 40 files changed, 42 insertions(+), 42 deletions(-)
 
 diff --git a/include/expr_ops.h b/include/expr_ops.h
 index e639390..c4fe050 100644
@@ -61,10 +65,10 @@ index e639390..c4fe050 100644
  			      struct nftnl_parse_err *err);
  };
 diff --git a/include/obj.h b/include/obj.h
-index d90919f..772caff 100644
+index 4a728c8..4c20bd1 100644
 --- a/include/obj.h
 +++ b/include/obj.h
-@@ -47,7 +47,7 @@ struct obj_ops {
+@@ -55,7 +55,7 @@ struct obj_ops {
  	const void *(*get)(const struct nftnl_obj *e, uint16_t type, uint32_t *data_len);
  	int	(*parse)(struct nftnl_obj *e, struct nlattr *attr);
  	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_obj *e);
@@ -73,38 +77,25 @@ index d90919f..772caff 100644
  	int	(*json_parse)(struct nftnl_obj *e, json_t *data,
  			      struct nftnl_parse_err *err);
  };
-diff --git a/src/buffer.c b/src/buffer.c
-index f9d5a83..db656e2 100644
---- a/src/buffer.c
-+++ b/src/buffer.c
-@@ -206,7 +206,7 @@ int nftnl_buf_expr(struct nftnl_buf *b, int type, uint32_t flags,
- 	case NFTNL_OUTPUT_JSON:
- 		nftnl_buf_put(b, "{");
- 		nftnl_buf_str(b, type, expr->ops->name, TYPE);
--		ret = expr->ops->snprintf(b->buf + b->off, b->len, type, flags,
-+		ret = expr->ops->snprintf_(b->buf + b->off, b->len, type, flags,
- 					  expr);
- 		if (ret > 0)
- 			nftnl_buf_update(b, ret);
 diff --git a/src/expr.c b/src/expr.c
-index c7eb2b4..24f8f8c 100644
+index 62565e0..2489c30 100644
 --- a/src/expr.c
 +++ b/src/expr.c
-@@ -265,10 +265,10 @@ int __EXPORTED nftnl_expr_snprintf(char *buf, size_t size, const struct nftnl_ex
- 	int ret;
- 	unsigned int offset = 0, len = size;
+@@ -285,10 +285,10 @@ int nftnl_expr_snprintf(char *buf, size_t size, const struct nftnl_expr *expr,
+ 	if (size)
+ 		buf[0] = '\0';
  
 -	if (!expr->ops->snprintf)
 +	if (!expr->ops->snprintf_)
  		return 0;
  
--	ret = expr->ops->snprintf(buf+offset, len, type, flags, expr);
-+	ret = expr->ops->snprintf_(buf+offset, len, type, flags, expr);
- 	SNPRINTF_BUFFER_SIZE(ret, size, len, offset);
+-	ret = expr->ops->snprintf(buf + offset, remain, type, flags, expr);
++	ret = expr->ops->snprintf_(buf + offset, remain, type, flags, expr);
+ 	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  
  	return offset;
 diff --git a/src/expr/bitwise.c b/src/expr/bitwise.c
-index 0febc9d..9b48e79 100644
+index a89734b..f8360b1 100644
 --- a/src/expr/bitwise.c
 +++ b/src/expr/bitwise.c
 @@ -299,6 +299,6 @@ struct expr_ops expr_ops_bitwise = {
@@ -116,7 +107,7 @@ index 0febc9d..9b48e79 100644
  	.json_parse	= nftnl_expr_bitwise_json_parse,
  };
 diff --git a/src/expr/byteorder.c b/src/expr/byteorder.c
-index 3805307..079582f 100644
+index 47c04cf..61f733f 100644
 --- a/src/expr/byteorder.c
 +++ b/src/expr/byteorder.c
 @@ -314,6 +314,6 @@ struct expr_ops expr_ops_byteorder = {
@@ -128,7 +119,7 @@ index 3805307..079582f 100644
  	.json_parse	= nftnl_expr_byteorder_json_parse,
  };
 diff --git a/src/expr/cmp.c b/src/expr/cmp.c
-index 353e907..99b497c 100644
+index b26d0eb..522c7be 100644
 --- a/src/expr/cmp.c
 +++ b/src/expr/cmp.c
 @@ -284,6 +284,6 @@ struct expr_ops expr_ops_cmp = {
@@ -139,6 +130,18 @@ index 353e907..99b497c 100644
 +	.snprintf_	= nftnl_expr_cmp_snprintf,
  	.json_parse	= nftnl_expr_cmp_json_parse,
  };
+diff --git a/src/expr/connlimit.c b/src/expr/connlimit.c
+index 60965b5..4e41866 100644
+--- a/src/expr/connlimit.c
++++ b/src/expr/connlimit.c
+@@ -202,6 +202,6 @@ struct expr_ops expr_ops_connlimit = {
+ 	.get		= nftnl_expr_connlimit_get,
+ 	.parse		= nftnl_expr_connlimit_parse,
+ 	.build		= nftnl_expr_connlimit_build,
+-	.snprintf	= nftnl_expr_connlimit_snprintf,
++	.snprintf_	= nftnl_expr_connlimit_snprintf,
+ 	.json_parse	= nftnl_expr_connlimit_json_parse,
+ };
 diff --git a/src/expr/counter.c b/src/expr/counter.c
 index 21901e8..9fd7655 100644
 --- a/src/expr/counter.c
@@ -152,10 +155,10 @@ index 21901e8..9fd7655 100644
  	.json_parse	= nftnl_expr_counter_json_parse,
  };
 diff --git a/src/expr/ct.c b/src/expr/ct.c
-index cdd08e9..6ce5478 100644
+index 39e9be6..b363f7c 100644
 --- a/src/expr/ct.c
 +++ b/src/expr/ct.c
-@@ -356,6 +356,6 @@ struct expr_ops expr_ops_ct = {
+@@ -357,6 +357,6 @@ struct expr_ops expr_ops_ct = {
  	.get		= nftnl_expr_ct_get,
  	.parse		= nftnl_expr_ct_parse,
  	.build		= nftnl_expr_ct_build,
@@ -164,7 +167,7 @@ index cdd08e9..6ce5478 100644
  	.json_parse	= nftnl_expr_ct_json_parse,
  };
 diff --git a/src/expr/dup.c b/src/expr/dup.c
-index 9aa332b..2f491d8 100644
+index ed8e620..8d603e3 100644
 --- a/src/expr/dup.c
 +++ b/src/expr/dup.c
 @@ -206,6 +206,6 @@ struct expr_ops expr_ops_dup = {
@@ -176,7 +179,7 @@ index 9aa332b..2f491d8 100644
  	.json_parse	= nftnl_expr_dup_json_parse,
  };
 diff --git a/src/expr/dynset.c b/src/expr/dynset.c
-index f7b99ea..758f07c 100644
+index 160d0e1..a43f4da 100644
 --- a/src/expr/dynset.c
 +++ b/src/expr/dynset.c
 @@ -368,6 +368,6 @@ struct expr_ops expr_ops_dynset = {
@@ -188,10 +191,10 @@ index f7b99ea..758f07c 100644
  	.json_parse	= nftnl_expr_dynset_json_parse,
  };
 diff --git a/src/expr/exthdr.c b/src/expr/exthdr.c
-index d4f1665..a834782 100644
+index 75cafbc..89ea7f5 100644
 --- a/src/expr/exthdr.c
 +++ b/src/expr/exthdr.c
-@@ -356,6 +356,6 @@ struct expr_ops expr_ops_exthdr = {
+@@ -385,6 +385,6 @@ struct expr_ops expr_ops_exthdr = {
  	.get		= nftnl_expr_exthdr_get,
  	.parse		= nftnl_expr_exthdr_parse,
  	.build		= nftnl_expr_exthdr_build,
@@ -200,10 +203,10 @@ index d4f1665..a834782 100644
  	.json_parse	= nftnl_expr_exthdr_json_parse,
  };
 diff --git a/src/expr/fib.c b/src/expr/fib.c
-index f3be081..3c353b2 100644
+index b922b26..ece4645 100644
 --- a/src/expr/fib.c
 +++ b/src/expr/fib.c
-@@ -272,6 +272,6 @@ struct expr_ops expr_ops_fib = {
+@@ -274,6 +274,6 @@ struct expr_ops expr_ops_fib = {
  	.get		= nftnl_expr_fib_get,
  	.parse		= nftnl_expr_fib_parse,
  	.build		= nftnl_expr_fib_build,
@@ -211,11 +214,23 @@ index f3be081..3c353b2 100644
 +	.snprintf_	= nftnl_expr_fib_snprintf,
  	.json_parse	= nftnl_expr_fib_json_parse,
  };
+diff --git a/src/expr/flow_offload.c b/src/expr/flow_offload.c
+index a2001c9..9cdbc21 100644
+--- a/src/expr/flow_offload.c
++++ b/src/expr/flow_offload.c
+@@ -179,6 +179,6 @@ struct expr_ops expr_ops_flow = {
+ 	.get		= nftnl_expr_flow_get,
+ 	.parse		= nftnl_expr_flow_parse,
+ 	.build		= nftnl_expr_flow_build,
+-	.snprintf	= nftnl_expr_flow_snprintf,
++	.snprintf_	= nftnl_expr_flow_snprintf,
+ 	.json_parse	= nftnl_expr_flow_json_parse,
+ };
 diff --git a/src/expr/fwd.c b/src/expr/fwd.c
-index c30d494..f6e41f1 100644
+index 9021606..7178f43 100644
 --- a/src/expr/fwd.c
 +++ b/src/expr/fwd.c
-@@ -180,6 +180,6 @@ struct expr_ops expr_ops_fwd = {
+@@ -233,6 +233,6 @@ struct expr_ops expr_ops_fwd = {
  	.get		= nftnl_expr_fwd_get,
  	.parse		= nftnl_expr_fwd_parse,
  	.build		= nftnl_expr_fwd_build,
@@ -224,10 +239,10 @@ index c30d494..f6e41f1 100644
  	.json_parse	= nftnl_expr_fwd_json_parse,
  };
 diff --git a/src/expr/hash.c b/src/expr/hash.c
-index d870510..5acb66a 100644
+index 415537e..186c5b0 100644
 --- a/src/expr/hash.c
 +++ b/src/expr/hash.c
-@@ -332,6 +332,6 @@ struct expr_ops expr_ops_hash = {
+@@ -383,6 +383,6 @@ struct expr_ops expr_ops_hash = {
  	.get		= nftnl_expr_hash_get,
  	.parse		= nftnl_expr_hash_parse,
  	.build		= nftnl_expr_hash_build,
@@ -236,7 +251,7 @@ index d870510..5acb66a 100644
  	.json_parse	= nftnl_expr_hash_json_parse,
  };
 diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index 0b188cc..94bd6da 100644
+index b0570bd..91ccbdc 100644
 --- a/src/expr/immediate.c
 +++ b/src/expr/immediate.c
 @@ -316,6 +316,6 @@ struct expr_ops expr_ops_immediate = {
@@ -260,10 +275,10 @@ index 856ab18..e71fc2f 100644
  	.json_parse	= nftnl_expr_limit_json_parse,
  };
 diff --git a/src/expr/log.c b/src/expr/log.c
-index b642255..71dd83a 100644
+index 86d9651..5769c1c 100644
 --- a/src/expr/log.c
 +++ b/src/expr/log.c
-@@ -352,6 +352,6 @@ struct expr_ops expr_ops_log = {
+@@ -353,6 +353,6 @@ struct expr_ops expr_ops_log = {
  	.get		= nftnl_expr_log_get,
  	.parse		= nftnl_expr_log_parse,
  	.build		= nftnl_expr_log_build,
@@ -272,10 +287,10 @@ index b642255..71dd83a 100644
  	.json_parse	= nftnl_expr_log_json_parse,
  };
 diff --git a/src/expr/lookup.c b/src/expr/lookup.c
-index 861815f..6049913 100644
+index 5fcb81f..b2f0dd6 100644
 --- a/src/expr/lookup.c
 +++ b/src/expr/lookup.c
-@@ -293,6 +293,6 @@ struct expr_ops expr_ops_lookup = {
+@@ -292,6 +292,6 @@ struct expr_ops expr_ops_lookup = {
  	.get		= nftnl_expr_lookup_get,
  	.parse		= nftnl_expr_lookup_parse,
  	.build		= nftnl_expr_lookup_build,
@@ -308,10 +323,10 @@ index dd09e1e..f0d8868 100644
  	.json_parse 	= nftnl_expr_match_json_parse,
  };
 diff --git a/src/expr/meta.c b/src/expr/meta.c
-index 2c75841..907a677 100644
+index de82105..91f1ebb 100644
 --- a/src/expr/meta.c
 +++ b/src/expr/meta.c
-@@ -290,6 +290,6 @@ struct expr_ops expr_ops_meta = {
+@@ -291,6 +291,6 @@ struct expr_ops expr_ops_meta = {
  	.get		= nftnl_expr_meta_get,
  	.parse		= nftnl_expr_meta_parse,
  	.build		= nftnl_expr_meta_build,
@@ -320,10 +335,10 @@ index 2c75841..907a677 100644
  	.json_parse 	= nftnl_expr_meta_json_parse,
  };
 diff --git a/src/expr/nat.c b/src/expr/nat.c
-index 29bc3a2..d476283 100644
+index 9271303..427c282 100644
 --- a/src/expr/nat.c
 +++ b/src/expr/nat.c
-@@ -383,6 +383,6 @@ struct expr_ops expr_ops_nat = {
+@@ -384,6 +384,6 @@ struct expr_ops expr_ops_nat = {
  	.get		= nftnl_expr_nat_get,
  	.parse		= nftnl_expr_nat_parse,
  	.build		= nftnl_expr_nat_build,
@@ -332,10 +347,10 @@ index 29bc3a2..d476283 100644
  	.json_parse	= nftnl_expr_nat_json_parse,
  };
 diff --git a/src/expr/numgen.c b/src/expr/numgen.c
-index a15f03a..28ef741 100644
+index 5336fde..8e0479a 100644
 --- a/src/expr/numgen.c
 +++ b/src/expr/numgen.c
-@@ -264,6 +264,6 @@ struct expr_ops expr_ops_ng = {
+@@ -313,6 +313,6 @@ struct expr_ops expr_ops_ng = {
  	.get		= nftnl_expr_ng_get,
  	.parse		= nftnl_expr_ng_parse,
  	.build		= nftnl_expr_ng_build,
@@ -344,7 +359,7 @@ index a15f03a..28ef741 100644
  	.json_parse	= nftnl_expr_ng_json_parse,
  };
 diff --git a/src/expr/objref.c b/src/expr/objref.c
-index 4cfa3cb..c394290 100644
+index 64ee863..4504488 100644
 --- a/src/expr/objref.c
 +++ b/src/expr/objref.c
 @@ -278,6 +278,6 @@ struct expr_ops expr_ops_objref = {
@@ -368,10 +383,10 @@ index 91e1587..894ac08 100644
  	.json_parse	= nftnl_expr_payload_json_parse,
  };
 diff --git a/src/expr/queue.c b/src/expr/queue.c
-index 8a9deda..389af83 100644
+index a392a27..ee26c10 100644
 --- a/src/expr/queue.c
 +++ b/src/expr/queue.c
-@@ -276,6 +276,6 @@ struct expr_ops expr_ops_queue = {
+@@ -275,6 +275,6 @@ struct expr_ops expr_ops_queue = {
  	.get		= nftnl_expr_queue_get,
  	.parse		= nftnl_expr_queue_parse,
  	.build		= nftnl_expr_queue_build,
@@ -392,7 +407,7 @@ index 667e6e1..ff5d182 100644
  	.json_parse	= nftnl_expr_quota_json_parse,
  };
 diff --git a/src/expr/range.c b/src/expr/range.c
-index 8c8ce12..34d422b 100644
+index b2789ff..8910f8a 100644
 --- a/src/expr/range.c
 +++ b/src/expr/range.c
 @@ -283,6 +283,6 @@ struct expr_ops expr_ops_range = {
@@ -404,7 +419,7 @@ index 8c8ce12..34d422b 100644
  	.json_parse	= nftnl_expr_range_json_parse,
  };
 diff --git a/src/expr/redir.c b/src/expr/redir.c
-index 43538d5..8a21f93 100644
+index b2aa345..41b77ab 100644
 --- a/src/expr/redir.c
 +++ b/src/expr/redir.c
 @@ -242,6 +242,6 @@ struct expr_ops expr_ops_redir = {
@@ -428,10 +443,10 @@ index 11d8b20..b10e729 100644
  	.json_parse	= nftnl_expr_reject_json_parse,
  };
 diff --git a/src/expr/rt.c b/src/expr/rt.c
-index 5088e66..9f44b29 100644
+index c3c92c7..688a042 100644
 --- a/src/expr/rt.c
 +++ b/src/expr/rt.c
-@@ -238,6 +238,6 @@ struct expr_ops expr_ops_rt = {
+@@ -235,6 +235,6 @@ struct expr_ops expr_ops_rt = {
  	.get		= nftnl_expr_rt_get,
  	.parse		= nftnl_expr_rt_parse,
  	.build		= nftnl_expr_rt_build,
@@ -439,6 +454,17 @@ index 5088e66..9f44b29 100644
 +	.snprintf_	= nftnl_expr_rt_snprintf,
  	.json_parse	= nftnl_expr_rt_json_parse,
  };
+diff --git a/src/expr/socket.c b/src/expr/socket.c
+index db160a1..4c50011 100644
+--- a/src/expr/socket.c
++++ b/src/expr/socket.c
+@@ -204,5 +204,5 @@ struct expr_ops expr_ops_socket = {
+ 	.get		= nftnl_expr_socket_get,
+ 	.parse		= nftnl_expr_socket_parse,
+ 	.build		= nftnl_expr_socket_build,
+-	.snprintf	= nftnl_expr_socket_snprintf,
++	.snprintf_	= nftnl_expr_socket_snprintf,
+ };
 diff --git a/src/expr/target.c b/src/expr/target.c
 index ed4bf7d..2ef4078 100644
 --- a/src/expr/target.c
@@ -452,10 +478,10 @@ index ed4bf7d..2ef4078 100644
  	.json_parse	= nftnl_expr_target_json_parse,
  };
 diff --git a/src/obj/counter.c b/src/obj/counter.c
-index beadc93..8c4cc25 100644
+index 332bb2b..edeb7be 100644
 --- a/src/obj/counter.c
 +++ b/src/obj/counter.c
-@@ -179,6 +179,6 @@ struct obj_ops obj_ops_counter = {
+@@ -182,6 +182,6 @@ struct obj_ops obj_ops_counter = {
  	.get		= nftnl_obj_counter_get,
  	.parse		= nftnl_obj_counter_parse,
  	.build		= nftnl_obj_counter_build,
@@ -464,10 +490,10 @@ index beadc93..8c4cc25 100644
  	.json_parse	= nftnl_obj_counter_json_parse,
  };
 diff --git a/src/obj/ct_helper.c b/src/obj/ct_helper.c
-index d6d3111..4c7c88b 100644
+index 62569fe..69757ff 100644
 --- a/src/obj/ct_helper.c
 +++ b/src/obj/ct_helper.c
-@@ -205,6 +205,6 @@ struct obj_ops obj_ops_ct_helper = {
+@@ -208,6 +208,6 @@ struct obj_ops obj_ops_ct_helper = {
  	.get		= nftnl_obj_ct_helper_get,
  	.parse		= nftnl_obj_ct_helper_parse,
  	.build		= nftnl_obj_ct_helper_build,
@@ -475,11 +501,23 @@ index d6d3111..4c7c88b 100644
 +	.snprintf_	= nftnl_obj_ct_helper_snprintf,
  	.json_parse	= nftnl_obj_quota_json_parse,
  };
+diff --git a/src/obj/limit.c b/src/obj/limit.c
+index 7f8bcf7..25018b6 100644
+--- a/src/obj/limit.c
++++ b/src/obj/limit.c
+@@ -236,6 +236,6 @@ struct obj_ops obj_ops_limit = {
+ 	.get		= nftnl_obj_limit_get,
+ 	.parse		= nftnl_obj_limit_parse,
+ 	.build		= nftnl_obj_limit_build,
+-	.snprintf	= nftnl_obj_limit_snprintf,
++	.snprintf_	= nftnl_obj_limit_snprintf,
+ 	.json_parse	= nftnl_obj_limit_json_parse,
+ };
 diff --git a/src/obj/quota.c b/src/obj/quota.c
-index d5757b2..e959ff8 100644
+index 6d36784..ecaa8b1 100644
 --- a/src/obj/quota.c
 +++ b/src/obj/quota.c
-@@ -200,6 +200,6 @@ struct obj_ops obj_ops_quota = {
+@@ -203,6 +203,6 @@ struct obj_ops obj_ops_quota = {
  	.get		= nftnl_obj_quota_get,
  	.parse		= nftnl_obj_quota_parse,
  	.build		= nftnl_obj_quota_build,
@@ -488,11 +526,11 @@ index d5757b2..e959ff8 100644
  	.json_parse	= nftnl_obj_quota_json_parse,
  };
 diff --git a/src/object.c b/src/object.c
-index d409c6d..b938c97 100644
+index d8278f3..9654b7b 100644
 --- a/src/object.c
 +++ b/src/object.c
-@@ -389,7 +389,7 @@ static int nftnl_obj_export(char *buf, size_t size,
- 		nftnl_buf_u32(&b, type, obj->use, USE);
+@@ -429,7 +429,7 @@ static int nftnl_obj_export(char *buf, size_t size,
+ 		nftnl_buf_u64(&b, type, obj->handle, HANDLE);
  
  	if (obj->ops)
 -		ret = obj->ops->snprintf(buf + b.len, size - b.len, type,
@@ -500,15 +538,12 @@ index d409c6d..b938c97 100644
  					 flags, obj);
  
  	b.len += ret;
-@@ -410,7 +410,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t size,
- 	SNPRINTF_BUFFER_SIZE(ret, size, len, offset);
+@@ -450,7 +450,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t size,
+ 	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  
  	if (obj->ops) {
--		ret = obj->ops->snprintf(buf + offset, offset, type, flags, obj);
-+		ret = obj->ops->snprintf_(buf + offset, offset, type, flags, obj);
- 		SNPRINTF_BUFFER_SIZE(ret, size, len, offset);
+-		ret = obj->ops->snprintf(buf + offset, offset, type, flags,
++		ret = obj->ops->snprintf_(buf + offset, offset, type, flags,
+ 					 obj);
+ 		SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  	}
- 	ret = snprintf(buf + offset, offset, "]");
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.7.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.1.bb
similarity index 51%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.0.7.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.1.bb
index ca01c0a61134..77959a7309d5 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.7.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.1.bb
@@ -4,13 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 PV .= "+git${SRCPV}"
-SRCREV = "4b89c0cb0883f638ff1abbc2ff47c43cdc26aac5"
+SRCREV = "d379dfcb6c94dcb93a8f16896572d6e162138e0f"
 SRC_URI = "git://git.netfilter.org/libnftnl \
-           file://0001-Declare-the-define-visivility-attribute-together.patch \
-           file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
+           file://0001-Move-exports-before-symbol-definition.patch \
+           file://0002-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
-SRC_URI[md5sum] = "82183867168eb6644926c48b991b8aac"
-SRC_URI[sha256sum] = "9bb66ecbc64b8508249402f0093829f44177770ad99f6042b86b3a467d963982"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


