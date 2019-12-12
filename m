Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 883DC7DC1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 20:23:01 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id az3so10021plb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 12:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OS7i6A48cPz+caGDJKz/PmO+8c/xJEDkktwZyGw96es=;
	b=Sl6PVCfhqGij1XFaWZBWAXv/GkMmZIPhLf0DibSmYyTEwXV1gTIv9VZomwAdHoFWbV
	n+dm/m/xcwxXKDJObKIUgYeNdo0gQq+TH8JK9Q4uERBZczMKJRLD8i9pghHrNqNssBFK
	U+MjrHD0BiUHXBkcd4Zx0rPrO9RWVta2WjH1takPhKKESfHSw5bTqUAkTlBcfV5jxvkM
	mz8RlFZobl10ShBuWYXvbcgc4buSocLyH0tIsnDxjV0fYlK3qa63JpAWsh2bF947SFHt
	HTewimlOdel7tPtpPEiMJP7GdOvbhz82/I/g5Dh5GXtjzWJd/aQNxmHmttMeqHWpCF0b
	wxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OS7i6A48cPz+caGDJKz/PmO+8c/xJEDkktwZyGw96es=;
	b=YyCAhe+t/f18fzlFOUOobU13QIglBAKA0iiZ3Rgq81Q7teXDNT/3HxgLVLiFMMuTAX
	oYMIkYpo2XiAnDSzDsvK4roYJNyfstZh2W1K5LiCsRjjcaPKILs6mXfVUg9pv1vWAifG
	UNDtRBQAH2Ho9vmrQEkKOkucXmhitP//kQPEWHMe3X69L6r/T2SKM2SmKutSrhykFgyQ
	PaWGRWMfPzUGfPhbwsoPkWYQNw5qjzyjLgRedDJyuTfoDUUaW+3TBi5zjgedqZqrQwMX
	LwSDEcMgokzm4/5CvQfzxGXA2OTbyrJF58tIaHESNLTd5E9Pj724GrsKOuXZi3jOc7Da
	rKKw==
X-Gm-Message-State: APjAAAVvs2Zu0GEbcq8qtp+0PRosx/vdzuUB1YDQeLzDHpEObWRFemhR
	j93isxLNIZvX2MlMGoCYjR1Pu27Lb9Q=
X-Google-Smtp-Source: APXvYqzVWGmO9+i42h405x2ct8f2p6UemMJWXK6x7JVVPLVbdHesYIihnkkgcufbXn7/VPaIu8KbYw==
X-Received: by 2002:a17:90a:a798:: with SMTP id
	f24mr12325026pjq.27.1576182182033; 
	Thu, 12 Dec 2019 12:23:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3552])
	by smtp.gmail.com with ESMTPSA id
	r66sm8730732pfc.74.2019.12.12.12.23.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 12:23:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Dec 2019 12:22:51 -0800
Message-Id: <20191212202252.2786262-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191212202252.2786262-1-raj.khem@gmail.com>
References: <20191212202252.2786262-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Todd Cunningham <tcunningham07@gmail.com>,
	Todd Cunningham <todd.cunningham@opengear.com>
Subject: [meta-networking][PATCH] libnftnl: upgrade 1.1.4 -> 1.1.5
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
X-List-Received-Date: Thu, 12 Dec 2019 20:23:01 -0000
Content-Transfer-Encoding: 8bit

From: Todd Cunningham <todd.cunningham@opengear.com>

Remove obselete patch:
    0001-Move-exports-before-symbol-definition.patch
Refresh patch:
    0002-avoid-naming-local-function-as-one-of-printf-family.patch
Add one new file in this patch:
    src/obj/synproxy.c

Signed-off-by: Todd Cunningham <tcunningham07@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ove-exports-before-symbol-definition.patch | 294 ------------------
 ...al-function-as-one-of-printf-family.patch} |  19 +-
 .../{libnftnl_1.1.4.bb => libnftnl_1.1.5.bb}  |   5 +-
 3 files changed, 18 insertions(+), 300 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
 rename meta-networking/recipes-filter/libnftnl/libnftnl/{0002-avoid-naming-local-function-as-one-of-printf-family.patch => 0001-avoid-naming-local-function-as-one-of-printf-family.patch} (97%)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.4.bb => libnftnl_1.1.5.bb} (64%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
deleted file mode 100644
index 699d0d922b..0000000000
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
+++ /dev/null
@@ -1,294 +0,0 @@
-From 6b76c76e6b3f93c422d666f49ee68df9d5426078 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Wed, 7 Nov 2018 21:19:53 +0000
-Subject: [PATCH] Move exports before symbol definition
-
-Based on 7966020 ("src: Fix exporting symbols with clang"), when
-EXPORT_SYMBOL is located after function definition, clang won't properly
-export the function, resulting in a library with no symbols when built with
-clang.
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/flowtable.c | 54 ++++++++++++++++++++++++-------------------------
- 1 file changed, 27 insertions(+), 27 deletions(-)
-
-diff --git a/src/flowtable.c b/src/flowtable.c
-index 1f7ba30..80de952 100644
---- a/src/flowtable.c
-+++ b/src/flowtable.c
-@@ -34,12 +34,13 @@ struct nftnl_flowtable {
- 	uint32_t		flags;
- };
- 
-+EXPORT_SYMBOL(nftnl_flowtable_alloc);
- struct nftnl_flowtable *nftnl_flowtable_alloc(void)
- {
- 	return calloc(1, sizeof(struct nftnl_flowtable));
- }
--EXPORT_SYMBOL(nftnl_flowtable_alloc);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_free);
- void nftnl_flowtable_free(const struct nftnl_flowtable *c)
- {
- 	int i;
-@@ -56,14 +57,14 @@ void nftnl_flowtable_free(const struct nftnl_flowtable *c)
- 	}
- 	xfree(c);
- }
--EXPORT_SYMBOL(nftnl_flowtable_free);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_is_set);
- bool nftnl_flowtable_is_set(const struct nftnl_flowtable *c, uint16_t attr)
- {
- 	return c->flags & (1 << attr);
- }
--EXPORT_SYMBOL(nftnl_flowtable_is_set);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_unset);
- void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
- {
- 	int i;
-@@ -95,7 +96,6 @@ void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
- 
- 	c->flags &= ~(1 << attr);
- }
--EXPORT_SYMBOL(nftnl_flowtable_unset);
- 
- static uint32_t nftnl_flowtable_validate[NFTNL_FLOWTABLE_MAX + 1] = {
- 	[NFTNL_FLOWTABLE_HOOKNUM]	= sizeof(uint32_t),
-@@ -104,6 +104,7 @@ static uint32_t nftnl_flowtable_validate[NFTNL_FLOWTABLE_MAX + 1] = {
- 	[NFTNL_FLOWTABLE_FLAGS]		= sizeof(uint32_t),
- };
- 
-+EXPORT_SYMBOL(nftnl_flowtable_set_data);
- int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
- 			     const void *data, uint32_t data_len)
- {
-@@ -169,32 +170,32 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
- 	c->flags |= (1 << attr);
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_flowtable_set_data);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_set);
- void nftnl_flowtable_set(struct nftnl_flowtable *c, uint16_t attr, const void *data)
- {
- 	nftnl_flowtable_set_data(c, attr, data, nftnl_flowtable_validate[attr]);
- }
--EXPORT_SYMBOL(nftnl_flowtable_set);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_set_u32);
- void nftnl_flowtable_set_u32(struct nftnl_flowtable *c, uint16_t attr, uint32_t data)
- {
- 	nftnl_flowtable_set_data(c, attr, &data, sizeof(uint32_t));
- }
--EXPORT_SYMBOL(nftnl_flowtable_set_u32);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_set_s32);
- void nftnl_flowtable_set_s32(struct nftnl_flowtable *c, uint16_t attr, int32_t data)
- {
- 	nftnl_flowtable_set_data(c, attr, &data, sizeof(int32_t));
- }
--EXPORT_SYMBOL(nftnl_flowtable_set_s32);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_set_str);
- int nftnl_flowtable_set_str(struct nftnl_flowtable *c, uint16_t attr, const char *str)
- {
- 	return nftnl_flowtable_set_data(c, attr, str, strlen(str) + 1);
- }
--EXPORT_SYMBOL(nftnl_flowtable_set_str);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_get_data);
- const void *nftnl_flowtable_get_data(const struct nftnl_flowtable *c,
- 				     uint16_t attr, uint32_t *data_len)
- {
-@@ -228,21 +229,21 @@ const void *nftnl_flowtable_get_data(const struct nftnl_flowtable *c,
- 	}
- 	return NULL;
- }
--EXPORT_SYMBOL(nftnl_flowtable_get_data);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_get);
- const void *nftnl_flowtable_get(const struct nftnl_flowtable *c, uint16_t attr)
- {
- 	uint32_t data_len;
- 	return nftnl_flowtable_get_data(c, attr, &data_len);
- }
--EXPORT_SYMBOL(nftnl_flowtable_get);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_get_str);
- const char *nftnl_flowtable_get_str(const struct nftnl_flowtable *c, uint16_t attr)
- {
- 	return nftnl_flowtable_get(c, attr);
- }
--EXPORT_SYMBOL(nftnl_flowtable_get_str);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_get_u32);
- uint32_t nftnl_flowtable_get_u32(const struct nftnl_flowtable *c, uint16_t attr)
- {
- 	uint32_t data_len = 0;
-@@ -252,8 +253,8 @@ uint32_t nftnl_flowtable_get_u32(const struct nftnl_flowtable *c, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_flowtable_get_u32);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_get_s32);
- int32_t nftnl_flowtable_get_s32(const struct nftnl_flowtable *c, uint16_t attr)
- {
- 	uint32_t data_len = 0;
-@@ -263,8 +264,8 @@ int32_t nftnl_flowtable_get_s32(const struct nftnl_flowtable *c, uint16_t attr)
- 
- 	return val ? *val : 0;
- }
--EXPORT_SYMBOL(nftnl_flowtable_get_s32);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_nlmsg_build_payload);
- void nftnl_flowtable_nlmsg_build_payload(struct nlmsghdr *nlh,
- 					 const struct nftnl_flowtable *c)
- {
-@@ -300,7 +301,6 @@ void nftnl_flowtable_nlmsg_build_payload(struct nlmsghdr *nlh,
- 	if (c->flags & (1 << NFTNL_FLOWTABLE_SIZE))
- 		mnl_attr_put_u32(nlh, NFTA_FLOWTABLE_SIZE, htonl(c->size));
- }
--EXPORT_SYMBOL(nftnl_flowtable_nlmsg_build_payload);
- 
- static int nftnl_flowtable_parse_attr_cb(const struct nlattr *attr, void *data)
- {
-@@ -415,6 +415,7 @@ static int nftnl_flowtable_parse_hook(struct nlattr *attr, struct nftnl_flowtabl
- 	return 0;
- }
- 
-+EXPORT_SYMBOL(nftnl_flowtable_nlmsg_parse);
- int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtable *c)
- {
- 	struct nlattr *tb[NFTA_FLOWTABLE_MAX + 1] = {};
-@@ -463,7 +464,6 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nftnl_flowtable_nlmsg_parse);
- 
- static const char *nftnl_hooknum2str(int family, int hooknum)
- {
-@@ -516,14 +516,15 @@ static inline int nftnl_str2hooknum(int family, const char *hook)
- 	return -1;
- }
- 
-+EXPORT_SYMBOL(nftnl_flowtable_parse);
- int nftnl_flowtable_parse(struct nftnl_flowtable *c, enum nftnl_parse_type type,
- 			  const char *data, struct nftnl_parse_err *err)
- {
- 	errno = EOPNOTSUPP;
- 	return -1;
- }
--EXPORT_SYMBOL(nftnl_flowtable_parse);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_parse_file);
- int nftnl_flowtable_parse_file(struct nftnl_flowtable *c,
- 			       enum nftnl_parse_type type,
- 			       FILE *fp, struct nftnl_parse_err *err)
-@@ -531,7 +532,6 @@ int nftnl_flowtable_parse_file(struct nftnl_flowtable *c,
- 	errno = EOPNOTSUPP;
- 	return -1;
- }
--EXPORT_SYMBOL(nftnl_flowtable_parse_file);
- 
- static int nftnl_flowtable_snprintf_default(char *buf, size_t size,
- 					    const struct nftnl_flowtable *c)
-@@ -587,6 +587,7 @@ static int nftnl_flowtable_cmd_snprintf(char *buf, size_t size,
- 	return offset;
- }
- 
-+EXPORT_SYMBOL(nftnl_flowtable_snprintf);
- int nftnl_flowtable_snprintf(char *buf, size_t size, const struct nftnl_flowtable *c,
- 			 uint32_t type, uint32_t flags)
- {
-@@ -596,7 +597,6 @@ int nftnl_flowtable_snprintf(char *buf, size_t size, const struct nftnl_flowtabl
- 	return nftnl_flowtable_cmd_snprintf(buf, size, c, nftnl_flag2cmd(flags),
- 					    type, flags);
- }
--EXPORT_SYMBOL(nftnl_flowtable_snprintf);
- 
- static int nftnl_flowtable_do_snprintf(char *buf, size_t size, const void *c,
- 				   uint32_t cmd, uint32_t type, uint32_t flags)
-@@ -604,18 +604,19 @@ static int nftnl_flowtable_do_snprintf(char *buf, size_t size, const void *c,
- 	return nftnl_flowtable_snprintf(buf, size, c, type, flags);
- }
- 
-+EXPORT_SYMBOL(nftnl_flowtable_fprintf);
- int nftnl_flowtable_fprintf(FILE *fp, const struct nftnl_flowtable *c,
- 			    uint32_t type, uint32_t flags)
- {
- 	return nftnl_fprintf(fp, c, NFTNL_CMD_UNSPEC, type, flags,
- 			   nftnl_flowtable_do_snprintf);
- }
--EXPORT_SYMBOL(nftnl_flowtable_fprintf);
- 
- struct nftnl_flowtable_list {
- 	struct list_head list;
- };
- 
-+EXPORT_SYMBOL(nftnl_flowtable_list_alloc);
- struct nftnl_flowtable_list *nftnl_flowtable_list_alloc(void)
- {
- 	struct nftnl_flowtable_list *list;
-@@ -628,8 +629,8 @@ struct nftnl_flowtable_list *nftnl_flowtable_list_alloc(void)
- 
- 	return list;
- }
--EXPORT_SYMBOL(nftnl_flowtable_list_alloc);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_list_free);
- void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
- {
- 	struct nftnl_flowtable *s, *tmp;
-@@ -640,34 +641,34 @@ void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
- 	}
- 	xfree(list);
- }
--EXPORT_SYMBOL(nftnl_flowtable_list_free);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_list_is_empty);
- int nftnl_flowtable_list_is_empty(const struct nftnl_flowtable_list *list)
- {
- 	return list_empty(&list->list);
- }
--EXPORT_SYMBOL(nftnl_flowtable_list_is_empty);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_list_add);
- void nftnl_flowtable_list_add(struct nftnl_flowtable *s,
- 			      struct nftnl_flowtable_list *list)
- {
- 	list_add(&s->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_flowtable_list_add);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_list_add_tail);
- void nftnl_flowtable_list_add_tail(struct nftnl_flowtable *s,
- 				   struct nftnl_flowtable_list *list)
- {
- 	list_add_tail(&s->head, &list->list);
- }
--EXPORT_SYMBOL(nftnl_flowtable_list_add_tail);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_list_del);
- void nftnl_flowtable_list_del(struct nftnl_flowtable *s)
- {
- 	list_del(&s->head);
- }
--EXPORT_SYMBOL(nftnl_flowtable_list_del);
- 
-+EXPORT_SYMBOL(nftnl_flowtable_list_foreach);
- int nftnl_flowtable_list_foreach(struct nftnl_flowtable_list *flowtable_list,
- 				 int (*cb)(struct nftnl_flowtable *t, void *data), void *data)
- {
-@@ -681,4 +682,3 @@ int nftnl_flowtable_list_foreach(struct nftnl_flowtable_list *flowtable_list,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nftnl_flowtable_list_foreach);
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
similarity index 97%
rename from meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
rename to meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
index e64091b50b..f49ef2a78c 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
@@ -1,6 +1,6 @@
-From 373e13e28e34b4d415fc096e1c7175f4ecfbf0da Mon Sep 17 00:00:00 2001
-From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
-Date: Wed, 21 Aug 2019 11:18:56 +0900
+From e03b003610a176d608da9a02e433e7ded7e4b75f Mon Sep 17 00:00:00 2001
+From: Todd Cunningham <tcunningham07@gmail.com>
+Date: Wed, 11 Dec 2019 10:18:56 +1000
 Subject: [PATCH] avoid naming local function as one of printf family
 
 Fixes build issues with clang
@@ -10,6 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 
 Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
+Signed-off-by: Todd Cunningham <tcunningham07@gmail.com>
 ---
  include/expr_ops.h      | 2 +-
  include/obj.h           | 2 +-
@@ -58,6 +59,7 @@ Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
  src/obj/limit.c         | 2 +-
  src/obj/quota.c         | 2 +-
  src/obj/secmark.c       | 2 +-
+ src/obj/synproxy.c      | 2 +-
  src/obj/tunnel.c        | 2 +-
  src/object.c            | 2 +-
  49 files changed, 50 insertions(+), 50 deletions(-)
@@ -613,6 +615,17 @@ index d8c87ee..5307d7e 100644
  					 obj);
  		SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  	}
+diff --git a/src/obj/synproxy.c b/src/obj/synproxy.c
+index 56ebc85..6b5380f 100644
+--- a/src/obj/synproxy.c
++++ b/src/obj/synproxy.c
+@@ -157,5 +157,5 @@ struct obj_ops obj_ops_synproxy = {
+ 	.get		= nftnl_obj_synproxy_get,
+ 	.parse		= nftnl_obj_synproxy_parse,
+ 	.build		= nftnl_obj_synproxy_build,
+-	.snprintf	= nftnl_obj_synproxy_snprintf,
++	.snprintf_	= nftnl_obj_synproxy_snprintf,
+ };
 -- 
 2.17.1
 
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.4.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.5.bb
similarity index 64%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.4.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.5.bb
index 705b6a6c34..e1c2720da8 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.4.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.5.bb
@@ -4,10 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "7c19dc01a88dbcf9a45fa791cd27a51b563bcf29"
+SRCREV = "a71599dc0ae1a808e970e96850ea83d77f452994"
 SRC_URI = "git://git.netfilter.org/libnftnl \
-           file://0001-Move-exports-before-symbol-definition.patch \
-           file://0002-avoid-naming-local-function-as-one-of-printf-family.patch \
+           file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.24.1


