Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6937CCAC5BE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.18526.1758896372239949420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=an2dZFah;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso3999893a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896370; x=1759501170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=to4fCuQA5TiWcq9SRKnS1Gix3AmS7iQU7iEU5ilAB9s=;
        b=an2dZFah//+mjqN7rWYZkt0DIxWteHzHCHriBn+hrVt172lz2sXiG5/CEcQ8IcNMm5
         NYnG+bB4P7c9y3O3znVZbxDnjd3D6Wg62egUvD5+z/FKLSfe0CoZewnY+W1+vmjKnk9O
         PRzLW6O4cBxSy5/a3mnY1PPof6NB+o3LuPS5Co1YTlQYuhUVf6d3ltjRbH/bjrSm8hfT
         xIcdqLAPN5HvEn+Fbl2jRXv79efXlQe75ligmHm0eFOGqL0ELAnR9fYk2aNaJwd4aNbO
         uOwTMyHbbtmCUOuKU+2Jt/TmY2Cz1vSPNodH2NAVClSeWpRSrWSP/tBmGB3J6wl+V5/F
         IiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896370; x=1759501170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=to4fCuQA5TiWcq9SRKnS1Gix3AmS7iQU7iEU5ilAB9s=;
        b=bIR4rLPTLZ0Vu+vCD3Xii+l91tmLAFClRaEvsA9bxPrpXR7k5AyRPAzWnpBh+liT1a
         P2ww1HOw22RU0NU5JUNezX/SMAUZuUp/bnTPGQfK3Nzn4Bs/q7OHUMx7BnMHKgWjea3H
         uS0J9pBjpwi61YniTy+HRl7Rw8iq+UohiZz/wiRTg5zD1ILKKtSifDqDiIQNxJNxOQaV
         KpkNDFAAc/NTTXnVN2h4HThBTnd7dDqW/orSO7IqL8kvB0zqrOLfrDBr4ko49zWi9DKK
         7kERmnbpP0hjOR1akEcrGUAThSJ5nzrdo8AbjfBDxIsPyazyvKb9AjZRMbWJHHUkWerh
         DlNg==
X-Gm-Message-State: AOJu0Yyu172zoFG4m/5u3G8kC5vI32HJdfyv8wj2Pj4YQd4YgWu2N473
	3vZqI6iDIs6H5ld8pVW0KvyyrdZfjgxiavczL+IOT+Ez5GtIsDKV3ZczYDlEHQ==
X-Gm-Gg: ASbGnctQyva0ZqfCv8C3p67SB0EbRFgYklVp+KU5I8H4rjYWbLGVSYOSH1JajpPnpHQ
	qMeDP8VW0TJyO6NIfgVqQ2S3mTLsuV6hm37LitPuz4J8zWXd5CUx6/UmLKfZ3ud+M48dvEwMY2u
	Jj4Ib5dy8H9b+oet1O1tp3lVTUrv2OeNF8UpFUu8qXH1WgVz/daP4EOpXqdh/jztLDOK0ytH3XE
	qPznHLIbQy/yQGyFmx6EdyO0zQDfyk8GjRfEExfY/Lyn/sfdZHXtXX8cDIf6KV0paw/C70gZnmu
	25PQiUSle8gvziSNosuc9lQbnpdlS8WJL9A+IaJFJyh2UGiE4MGmRE+pHeDB5mkd9xLo59VYyxI
	1RPErcsnPdPehxyddzIvs
X-Google-Smtp-Source: AGHT+IFjC0I1OPYeG8RDZW4Zlm9vpERuLdddFpojqwRXQjACn9yw3U5+l8ScJRsh2C7kfStdvfKHcw==
X-Received: by 2002:a05:6402:42cb:b0:632:7471:5d43 with SMTP id 4fb4d7f45d1cf-6349fa74711mr7931025a12.22.1758896370338;
        Fri, 26 Sep 2025 07:19:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 09/20] libnftnl: upgrade 1.2.2 -> 1.2.3
Date: Fri, 26 Sep 2025 16:19:08 +0200
Message-ID: <20250926141919.2010846-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119918

From: Yi Zhao <yi.zhao@windriver.com>

Drop 0001-avoid-naming-local-function-as-one-of-printf-family.patch as
the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 333cdd80c6943fb37e7f5e338fa5c0222127dbfa)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...cal-function-as-one-of-printf-family.patch | 650 ------------------
 .../{libnftnl_1.2.2.bb => libnftnl_1.2.3.bb}  |  10 +-
 2 files changed, 4 insertions(+), 656 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.2.bb => libnftnl_1.2.3.bb} (89%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
deleted file mode 100644
index 68eb04a83e..0000000000
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
+++ /dev/null
@@ -1,650 +0,0 @@
-From e03b003610a176d608da9a02e433e7ded7e4b75f Mon Sep 17 00:00:00 2001
-From: Todd Cunningham <tcunningham07@gmail.com>
-Date: Wed, 11 Dec 2019 10:18:56 +1000
-Subject: [PATCH] avoid naming local function as one of printf family
-
-Fixes build issues with clang
-error: no member named '__builtin___snprintf_chk' in 'struct expr_ops'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
-Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
-Signed-off-by: Todd Cunningham <tcunningham07@gmail.com>
-
-Use wiggle to get the patch to apply for version 1.2.0.
-
-Add the same change in src/expr/last.c to make the patch apply for
-1.2.1. Also correct the patch to show the original author and metadata.
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
----
- include/expr_ops.h      | 2 +-
- include/obj.h           | 2 +-
- src/expr.c              | 4 ++--
- src/expr/bitwise.c      | 2 +-
- src/expr/byteorder.c    | 2 +-
- src/expr/cmp.c          | 2 +-
- src/expr/connlimit.c    | 2 +-
- src/expr/counter.c      | 2 +-
- src/expr/ct.c           | 2 +-
- src/expr/dup.c          | 2 +-
- src/expr/dynset.c       | 2 +-
- src/expr/exthdr.c       | 2 +-
- src/expr/fib.c          | 2 +-
- src/expr/flow_offload.c | 2 +-
- src/expr/fwd.c          | 2 +-
- src/expr/hash.c         | 2 +-
- src/expr/immediate.c    | 2 +-
- src/expr/last.c         | 2 +-
- src/expr/limit.c        | 2 +-
- src/expr/log.c          | 2 +-
- src/expr/lookup.c       | 2 +-
- src/expr/masq.c         | 2 +-
- src/expr/match.c        | 2 +-
- src/expr/meta.c         | 2 +-
- src/expr/nat.c          | 2 +-
- src/expr/numgen.c       | 2 +-
- src/expr/objref.c       | 2 +-
- src/expr/osf.c          | 2 +-
- src/expr/payload.c      | 2 +-
- src/expr/queue.c        | 2 +-
- src/expr/quota.c        | 2 +-
- src/expr/range.c        | 2 +-
- src/expr/redir.c        | 2 +-
- src/expr/reject.c       | 2 +-
- src/expr/rt.c           | 2 +-
- src/expr/socket.c       | 2 +-
- src/expr/synproxy.c     | 2 +-
- src/expr/target.c       | 2 +-
- src/expr/tproxy.c       | 2 +-
- src/expr/tunnel.c       | 2 +-
- src/expr/xfrm.c         | 2 +-
- src/obj/counter.c       | 2 +-
- src/obj/ct_expect.c     | 2 +-
- src/obj/ct_helper.c     | 2 +-
- src/obj/ct_timeout.c    | 2 +-
- src/obj/limit.c         | 2 +-
- src/obj/quota.c         | 2 +-
- src/obj/secmark.c       | 2 +-
- src/obj/synproxy.c      | 2 +-
- src/obj/tunnel.c        | 2 +-
- src/object.c            | 2 +-
- 51 files changed, 52 insertions(+), 52 deletions(-)
-
-diff --git a/include/expr_ops.h b/include/expr_ops.h
-index 7a6aa23..d3a2855 100644
---- a/include/expr_ops.h
-+++ b/include/expr_ops.h
-@@ -18,7 +18,7 @@ struct expr_ops {
- 	const void *(*get)(const struct nftnl_expr *e, uint16_t type, uint32_t *data_len);
- 	int 	(*parse)(struct nftnl_expr *e, struct nlattr *attr);
- 	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_expr *e);
--	int	(*snprintf)(char *buf, size_t len, uint32_t flags, const struct nftnl_expr *e);
-+	int	(*snprintf_)(char *buf, size_t len, uint32_t flags, const struct nftnl_expr *e);
- };
- 
- struct expr_ops *nftnl_expr_ops_lookup(const char *name);
-diff --git a/include/obj.h b/include/obj.h
-index 60dc853..1c1c3c1 100644
---- a/include/obj.h
-+++ b/include/obj.h
-@@ -109,7 +109,7 @@ struct obj_ops {
- 	const void *(*get)(const struct nftnl_obj *e, uint16_t type, uint32_t *data_len);
- 	int	(*parse)(struct nftnl_obj *e, struct nlattr *attr);
- 	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_obj *e);
--	int	(*snprintf)(char *buf, size_t len, uint32_t flags, const struct nftnl_obj *e);
-+	int	(*snprintf_)(char *buf, size_t len, uint32_t flags, const struct nftnl_obj *e);
- };
- 
- extern struct obj_ops obj_ops_counter;
-diff --git a/src/expr.c b/src/expr.c
-index 277bbde..2231b21 100644
---- a/src/expr.c
-+++ b/src/expr.c
-@@ -279,10 +279,10 @@ int nftnl_expr_snprintf(char *buf, size_t remain, const struct nftnl_expr *expr,
- 	if (remain)
- 		buf[0] = '\0';
- 
--	if (!expr->ops->snprintf || type != NFTNL_OUTPUT_DEFAULT)
-+	if (!expr->ops->snprintf_ || type != NFTNL_OUTPUT_DEFAULT)
- 		return 0;
- 
--	ret = expr->ops->snprintf(buf + offset, remain, flags, expr);
-+	ret = expr->ops->snprintf_(buf + offset, remain, flags, expr);
- 	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
- 
- 	return offset;
-diff --git a/src/expr/bitwise.c b/src/expr/bitwise.c
-index d0c7827..eded505 100644
---- a/src/expr/bitwise.c
-+++ b/src/expr/bitwise.c
-@@ -282,5 +282,5 @@ struct expr_ops expr_ops_bitwise = {
- 	.get		= nftnl_expr_bitwise_get,
- 	.parse		= nftnl_expr_bitwise_parse,
- 	.build		= nftnl_expr_bitwise_build,
--	.snprintf	= nftnl_expr_bitwise_snprintf,
-+	.snprintf_	= nftnl_expr_bitwise_snprintf,
- };
-diff --git a/src/expr/byteorder.c b/src/expr/byteorder.c
-index d299745..0068ab2 100644
---- a/src/expr/byteorder.c
-+++ b/src/expr/byteorder.c
-@@ -220,5 +220,5 @@ struct expr_ops expr_ops_byteorder = {
- 	.get		= nftnl_expr_byteorder_get,
- 	.parse		= nftnl_expr_byteorder_parse,
- 	.build		= nftnl_expr_byteorder_build,
--	.snprintf	= nftnl_expr_byteorder_snprintf,
-+	.snprintf_	= nftnl_expr_byteorder_snprintf,
- };
-diff --git a/src/expr/cmp.c b/src/expr/cmp.c
-index 6030693..7e548e6 100644
---- a/src/expr/cmp.c
-+++ b/src/expr/cmp.c
-@@ -202,5 +202,5 @@ struct expr_ops expr_ops_cmp = {
- 	.get		= nftnl_expr_cmp_get,
- 	.parse		= nftnl_expr_cmp_parse,
- 	.build		= nftnl_expr_cmp_build,
--	.snprintf	= nftnl_expr_cmp_snprintf,
-+	.snprintf_	= nftnl_expr_cmp_snprintf,
- };
-diff --git a/src/expr/connlimit.c b/src/expr/connlimit.c
-index 3b37587..39b7092 100644
---- a/src/expr/connlimit.c
-+++ b/src/expr/connlimit.c
-@@ -135,5 +135,5 @@ struct expr_ops expr_ops_connlimit = {
- 	.get		= nftnl_expr_connlimit_get,
- 	.parse		= nftnl_expr_connlimit_parse,
- 	.build		= nftnl_expr_connlimit_build,
--	.snprintf	= nftnl_expr_connlimit_snprintf,
-+	.snprintf_  = nftnl_expr_connlimit_snprintf,
- };
-diff --git a/src/expr/counter.c b/src/expr/counter.c
-index 1676d70..42c96d9 100644
---- a/src/expr/counter.c
-+++ b/src/expr/counter.c
-@@ -133,5 +133,5 @@ struct expr_ops expr_ops_counter = {
- 	.get		= nftnl_expr_counter_get,
- 	.parse		= nftnl_expr_counter_parse,
- 	.build		= nftnl_expr_counter_build,
--	.snprintf	= nftnl_expr_counter_snprintf,
-+	.snprintf_	= nftnl_expr_counter_snprintf,
- };
-diff --git a/src/expr/ct.c b/src/expr/ct.c
-index d5dfc81..8c15db1 100644
---- a/src/expr/ct.c
-+++ b/src/expr/ct.c
-@@ -258,5 +258,5 @@ struct expr_ops expr_ops_ct = {
- 	.get		= nftnl_expr_ct_get,
- 	.parse		= nftnl_expr_ct_parse,
- 	.build		= nftnl_expr_ct_build,
--	.snprintf	= nftnl_expr_ct_snprintf,
-+	.snprintf_	= nftnl_expr_ct_snprintf,
- };
-diff --git a/src/expr/dup.c b/src/expr/dup.c
-index f041b55..6238a43 100644
---- a/src/expr/dup.c
-+++ b/src/expr/dup.c
-@@ -138,5 +138,5 @@ struct expr_ops expr_ops_dup = {
- 	.get		= nftnl_expr_dup_get,
- 	.parse		= nftnl_expr_dup_parse,
- 	.build		= nftnl_expr_dup_build,
--	.snprintf	= nftnl_expr_dup_snprintf,
-+	.snprintf_	= nftnl_expr_dup_snprintf,
- };
-diff --git a/src/expr/dynset.c b/src/expr/dynset.c
-index 85d64bb..9afbb94 100644
---- a/src/expr/dynset.c
-+++ b/src/expr/dynset.c
-@@ -373,5 +373,5 @@ struct expr_ops expr_ops_dynset = {
- 	.get		= nftnl_expr_dynset_get,
- 	.parse		= nftnl_expr_dynset_parse,
- 	.build		= nftnl_expr_dynset_build,
--	.snprintf	= nftnl_expr_dynset_snprintf,
-+	.snprintf_	= nftnl_expr_dynset_snprintf,
- };
-diff --git a/src/expr/exthdr.c b/src/expr/exthdr.c
-index 1b813b1..25f1491 100644
---- a/src/expr/exthdr.c
-+++ b/src/expr/exthdr.c
-@@ -262,5 +262,5 @@ struct expr_ops expr_ops_exthdr = {
- 	.get		= nftnl_expr_exthdr_get,
- 	.parse		= nftnl_expr_exthdr_parse,
- 	.build		= nftnl_expr_exthdr_build,
--	.snprintf	= nftnl_expr_exthdr_snprintf,
-+	.snprintf_	= nftnl_expr_exthdr_snprintf,
- };
-diff --git a/src/expr/fib.c b/src/expr/fib.c
-index aaff52a..3916e18 100644
---- a/src/expr/fib.c
-+++ b/src/expr/fib.c
-@@ -198,5 +198,5 @@ struct expr_ops expr_ops_fib = {
- 	.get		= nftnl_expr_fib_get,
- 	.parse		= nftnl_expr_fib_parse,
- 	.build		= nftnl_expr_fib_build,
--	.snprintf	= nftnl_expr_fib_snprintf,
-+	.snprintf_	= nftnl_expr_fib_snprintf,
- };
-diff --git a/src/expr/flow_offload.c b/src/expr/flow_offload.c
-index a826202..c1ca678 100644
---- a/src/expr/flow_offload.c
-+++ b/src/expr/flow_offload.c
-@@ -120,5 +120,5 @@ struct expr_ops expr_ops_flow = {
- 	.get		= nftnl_expr_flow_get,
- 	.parse		= nftnl_expr_flow_parse,
- 	.build		= nftnl_expr_flow_build,
--	.snprintf	= nftnl_expr_flow_snprintf,
-+	.snprintf_	= nftnl_expr_flow_snprintf,
- };
-diff --git a/src/expr/fwd.c b/src/expr/fwd.c
-index 82e5a41..4e80687 100644
---- a/src/expr/fwd.c
-+++ b/src/expr/fwd.c
-@@ -158,5 +158,5 @@ struct expr_ops expr_ops_fwd = {
- 	.get		= nftnl_expr_fwd_get,
- 	.parse		= nftnl_expr_fwd_parse,
- 	.build		= nftnl_expr_fwd_build,
--	.snprintf	= nftnl_expr_fwd_snprintf,
-+	.snprintf_	= nftnl_expr_fwd_snprintf,
- };
-diff --git a/src/expr/hash.c b/src/expr/hash.c
-index 10b4a72..84ace31 100644
---- a/src/expr/hash.c
-+++ b/src/expr/hash.c
-@@ -226,5 +226,5 @@ struct expr_ops expr_ops_hash = {
- 	.get		= nftnl_expr_hash_get,
- 	.parse		= nftnl_expr_hash_parse,
- 	.build		= nftnl_expr_hash_build,
--	.snprintf	= nftnl_expr_hash_snprintf,
-+	.snprintf_	= nftnl_expr_hash_snprintf,
- };
-diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index 94b043c..a8a3c1f 100644
---- a/src/expr/immediate.c
-+++ b/src/expr/immediate.c
-@@ -229,5 +229,5 @@ struct expr_ops expr_ops_immediate = {
- 	.get		= nftnl_expr_immediate_get,
- 	.parse		= nftnl_expr_immediate_parse,
- 	.build		= nftnl_expr_immediate_build,
--	.snprintf	= nftnl_expr_immediate_snprintf,
-+	.snprintf_	= nftnl_expr_immediate_snprintf,
- };
-diff --git a/src/expr/last.c b/src/expr/last.c
-index e2a60c4..2f75464 100644
---- a/src/expr/last.c
-+++ b/src/expr/last.c
-@@ -134,5 +134,5 @@ struct expr_ops expr_ops_last = {
- 	.get		= nftnl_expr_last_get,
- 	.parse		= nftnl_expr_last_parse,
- 	.build		= nftnl_expr_last_build,
--	.snprintf	= nftnl_expr_last_snprintf,
-+	.snprintf_	= nftnl_expr_last_snprintf,
- };
-diff --git a/src/expr/limit.c b/src/expr/limit.c
-index 3dfd54a..f652df0 100644
---- a/src/expr/limit.c
-+++ b/src/expr/limit.c
-@@ -202,5 +202,5 @@ struct expr_ops expr_ops_limit = {
- 	.get		= nftnl_expr_limit_get,
- 	.parse		= nftnl_expr_limit_parse,
- 	.build		= nftnl_expr_limit_build,
--	.snprintf	= nftnl_expr_limit_snprintf,
-+	.snprintf_	= nftnl_expr_limit_snprintf,
- };
-diff --git a/src/expr/log.c b/src/expr/log.c
-index 86db548..d96b7ce 100644
---- a/src/expr/log.c
-+++ b/src/expr/log.c
-@@ -253,5 +253,5 @@ struct expr_ops expr_ops_log = {
- 	.get		= nftnl_expr_log_get,
- 	.parse		= nftnl_expr_log_parse,
- 	.build		= nftnl_expr_log_build,
--	.snprintf	= nftnl_expr_log_snprintf,
-+	.snprintf_	= nftnl_expr_log_snprintf,
- };
-diff --git a/src/expr/lookup.c b/src/expr/lookup.c
-index 83adce9..1fbace4 100644
---- a/src/expr/lookup.c
-+++ b/src/expr/lookup.c
-@@ -206,5 +206,5 @@ struct expr_ops expr_ops_lookup = {
- 	.get		= nftnl_expr_lookup_get,
- 	.parse		= nftnl_expr_lookup_parse,
- 	.build		= nftnl_expr_lookup_build,
--	.snprintf	= nftnl_expr_lookup_snprintf,
-+	.snprintf_	= nftnl_expr_lookup_snprintf,
- };
-diff --git a/src/expr/masq.c b/src/expr/masq.c
-index 684708c..1ce099c 100644
---- a/src/expr/masq.c
-+++ b/src/expr/masq.c
-@@ -163,5 +163,5 @@ struct expr_ops expr_ops_masq = {
- 	.get		= nftnl_expr_masq_get,
- 	.parse		= nftnl_expr_masq_parse,
- 	.build		= nftnl_expr_masq_build,
--	.snprintf	= nftnl_expr_masq_snprintf,
-+	.snprintf_	= nftnl_expr_masq_snprintf,
- };
-diff --git a/src/expr/match.c b/src/expr/match.c
-index 533fdf5..8561986 100644
---- a/src/expr/match.c
-+++ b/src/expr/match.c
-@@ -189,5 +189,5 @@ struct expr_ops expr_ops_match = {
- 	.get		= nftnl_expr_match_get,
- 	.parse		= nftnl_expr_match_parse,
- 	.build		= nftnl_expr_match_build,
--	.snprintf	= nftnl_expr_match_snprintf,
-+	.snprintf_	= nftnl_expr_match_snprintf,
- };
-diff --git a/src/expr/meta.c b/src/expr/meta.c
-index 34fbb9b..1ef79a4 100644
---- a/src/expr/meta.c
-+++ b/src/expr/meta.c
-@@ -216,5 +216,5 @@ struct expr_ops expr_ops_meta = {
- 	.get		= nftnl_expr_meta_get,
- 	.parse		= nftnl_expr_meta_parse,
- 	.build		= nftnl_expr_meta_build,
--	.snprintf	= nftnl_expr_meta_snprintf,
-+	.snprintf_	= nftnl_expr_meta_snprintf,
- };
-diff --git a/src/expr/nat.c b/src/expr/nat.c
-index 0a9cdd7..bc4a3fa 100644
---- a/src/expr/nat.c
-+++ b/src/expr/nat.c
-@@ -274,5 +274,5 @@ struct expr_ops expr_ops_nat = {
- 	.get		= nftnl_expr_nat_get,
- 	.parse		= nftnl_expr_nat_parse,
- 	.build		= nftnl_expr_nat_build,
--	.snprintf	= nftnl_expr_nat_snprintf,
-+	.snprintf_	= nftnl_expr_nat_snprintf,
- };
-diff --git a/src/expr/numgen.c b/src/expr/numgen.c
-index 159dfec..99bb442 100644
---- a/src/expr/numgen.c
-+++ b/src/expr/numgen.c
-@@ -180,5 +180,5 @@ struct expr_ops expr_ops_ng = {
- 	.get		= nftnl_expr_ng_get,
- 	.parse		= nftnl_expr_ng_parse,
- 	.build		= nftnl_expr_ng_build,
--	.snprintf	= nftnl_expr_ng_snprintf,
-+	.snprintf_	= nftnl_expr_ng_snprintf,
- };
-diff --git a/src/expr/objref.c b/src/expr/objref.c
-index a4b6470..1b2d387 100644
---- a/src/expr/objref.c
-+++ b/src/expr/objref.c
-@@ -205,5 +205,5 @@ struct expr_ops expr_ops_objref = {
- 	.get		= nftnl_expr_objref_get,
- 	.parse		= nftnl_expr_objref_parse,
- 	.build		= nftnl_expr_objref_build,
--	.snprintf	= nftnl_expr_objref_snprintf,
-+	.snprintf_	= nftnl_expr_objref_snprintf,
- };
-diff --git a/src/expr/osf.c b/src/expr/osf.c
-index 215a681..75a6b3c 100644
---- a/src/expr/osf.c
-+++ b/src/expr/osf.c
-@@ -147,5 +147,5 @@ struct expr_ops expr_ops_osf = {
- 	.get		= nftnl_expr_osf_get,
- 	.parse		= nftnl_expr_osf_parse,
- 	.build		= nftnl_expr_osf_build,
--	.snprintf	= nftnl_expr_osf_snprintf,
-+	.snprintf_	= nftnl_expr_osf_snprintf,
- };
-diff --git a/src/expr/payload.c b/src/expr/payload.c
-index 82747ec..e9130ec 100644
---- a/src/expr/payload.c
-+++ b/src/expr/payload.c
-@@ -259,5 +259,5 @@ struct expr_ops expr_ops_payload = {
- 	.get		= nftnl_expr_payload_get,
- 	.parse		= nftnl_expr_payload_parse,
- 	.build		= nftnl_expr_payload_build,
--	.snprintf	= nftnl_expr_payload_snprintf,
-+	.snprintf_	= nftnl_expr_payload_snprintf,
- };
-diff --git a/src/expr/queue.c b/src/expr/queue.c
-index 8f70977..6bc76ef 100644
---- a/src/expr/queue.c
-+++ b/src/expr/queue.c
-@@ -193,5 +193,5 @@ struct expr_ops expr_ops_queue = {
- 	.get		= nftnl_expr_queue_get,
- 	.parse		= nftnl_expr_queue_parse,
- 	.build		= nftnl_expr_queue_build,
--	.snprintf	= nftnl_expr_queue_snprintf,
-+	.snprintf_	= nftnl_expr_queue_snprintf,
- };
-diff --git a/src/expr/quota.c b/src/expr/quota.c
-index 8c841d8..1a5f2fa 100644
---- a/src/expr/quota.c
-+++ b/src/expr/quota.c
-@@ -147,5 +147,5 @@ struct expr_ops expr_ops_quota = {
- 	.get		= nftnl_expr_quota_get,
- 	.parse		= nftnl_expr_quota_parse,
- 	.build		= nftnl_expr_quota_build,
--	.snprintf	= nftnl_expr_quota_snprintf,
-+	.snprintf_	= nftnl_expr_quota_snprintf,
- };
-diff --git a/src/expr/range.c b/src/expr/range.c
-index f76843a..73a1930 100644
---- a/src/expr/range.c
-+++ b/src/expr/range.c
-@@ -213,5 +213,5 @@ struct expr_ops expr_ops_range = {
- 	.get		= nftnl_expr_range_get,
- 	.parse		= nftnl_expr_range_parse,
- 	.build		= nftnl_expr_range_build,
--	.snprintf	= nftnl_expr_range_snprintf,
-+	.snprintf_	= nftnl_expr_range_snprintf,
- };
-diff --git a/src/expr/redir.c b/src/expr/redir.c
-index 4f56cb4..51ec71c 100644
---- a/src/expr/redir.c
-+++ b/src/expr/redir.c
-@@ -167,5 +167,5 @@ struct expr_ops expr_ops_redir = {
- 	.get		= nftnl_expr_redir_get,
- 	.parse		= nftnl_expr_redir_parse,
- 	.build		= nftnl_expr_redir_build,
--	.snprintf	= nftnl_expr_redir_snprintf,
-+	.snprintf_	= nftnl_expr_redir_snprintf,
- };
-diff --git a/src/expr/reject.c b/src/expr/reject.c
-index 716d25c..acf32c2 100644
---- a/src/expr/reject.c
-+++ b/src/expr/reject.c
-@@ -134,5 +134,5 @@ struct expr_ops expr_ops_reject = {
- 	.get		= nftnl_expr_reject_get,
- 	.parse		= nftnl_expr_reject_parse,
- 	.build		= nftnl_expr_reject_build,
--	.snprintf	= nftnl_expr_reject_snprintf,
-+	.snprintf_	= nftnl_expr_reject_snprintf,
- };
-diff --git a/src/expr/rt.c b/src/expr/rt.c
-index 1ad9b2a..9f2fdf3 100644
---- a/src/expr/rt.c
-+++ b/src/expr/rt.c
-@@ -162,5 +162,5 @@ struct expr_ops expr_ops_rt = {
- 	.get		= nftnl_expr_rt_get,
- 	.parse		= nftnl_expr_rt_parse,
- 	.build		= nftnl_expr_rt_build,
--	.snprintf	= nftnl_expr_rt_snprintf,
-+	.snprintf_	= nftnl_expr_rt_snprintf,
- };
-diff --git a/src/expr/socket.c b/src/expr/socket.c
-index 02d86f8..49a126b 100644
---- a/src/expr/socket.c
-+++ b/src/expr/socket.c
-@@ -165,5 +165,5 @@ struct expr_ops expr_ops_socket = {
- 	.get		= nftnl_expr_socket_get,
- 	.parse		= nftnl_expr_socket_parse,
- 	.build		= nftnl_expr_socket_build,
--	.snprintf	= nftnl_expr_socket_snprintf,
-+	.snprintf_	= nftnl_expr_socket_snprintf,
- };
-diff --git a/src/expr/synproxy.c b/src/expr/synproxy.c
-index 630f3f4..b22ad2f 100644
---- a/src/expr/synproxy.c
-+++ b/src/expr/synproxy.c
-@@ -152,5 +152,5 @@ struct expr_ops expr_ops_synproxy = {
- 	.get		= nftnl_expr_synproxy_get,
- 	.parse		= nftnl_expr_synproxy_parse,
- 	.build		= nftnl_expr_synproxy_build,
--	.snprintf	= nftnl_expr_synproxy_snprintf,
-+	.snprintf_	= nftnl_expr_synproxy_snprintf,
- };
-diff --git a/src/expr/target.c b/src/expr/target.c
-index b7c595a..31a039c 100644
---- a/src/expr/target.c
-+++ b/src/expr/target.c
-@@ -189,5 +189,5 @@ struct expr_ops expr_ops_target = {
- 	.get		= nftnl_expr_target_get,
- 	.parse		= nftnl_expr_target_parse,
- 	.build		= nftnl_expr_target_build,
--	.snprintf	= nftnl_expr_target_snprintf,
-+	.snprintf_	= nftnl_expr_target_snprintf,
- };
-diff --git a/src/expr/tproxy.c b/src/expr/tproxy.c
-index d3ee8f8..1b01591 100644
---- a/src/expr/tproxy.c
-+++ b/src/expr/tproxy.c
-@@ -170,5 +170,5 @@ struct expr_ops expr_ops_tproxy = {
- 	.get		= nftnl_expr_tproxy_get,
- 	.parse		= nftnl_expr_tproxy_parse,
- 	.build		= nftnl_expr_tproxy_build,
--	.snprintf	= nftnl_expr_tproxy_snprintf,
-+	.snprintf_	= nftnl_expr_tproxy_snprintf,
- };
-diff --git a/src/expr/tunnel.c b/src/expr/tunnel.c
-index 1460fd2..6c2f653 100644
---- a/src/expr/tunnel.c
-+++ b/src/expr/tunnel.c
-@@ -145,5 +145,5 @@ struct expr_ops expr_ops_tunnel = {
- 	.get		= nftnl_expr_tunnel_get,
- 	.parse		= nftnl_expr_tunnel_parse,
- 	.build		= nftnl_expr_tunnel_build,
--	.snprintf	= nftnl_expr_tunnel_snprintf,
-+	.snprintf_	= nftnl_expr_tunnel_snprintf,
- };
-diff --git a/src/expr/xfrm.c b/src/expr/xfrm.c
-index c81d14d..e648ee5 100644
---- a/src/expr/xfrm.c
-+++ b/src/expr/xfrm.c
-@@ -196,5 +196,5 @@ struct expr_ops expr_ops_xfrm = {
- 	.get		= nftnl_expr_xfrm_get,
- 	.parse		= nftnl_expr_xfrm_parse,
- 	.build		= nftnl_expr_xfrm_build,
--	.snprintf	= nftnl_expr_xfrm_snprintf,
-+	.snprintf_	= nftnl_expr_xfrm_snprintf,
- };
-diff --git a/src/obj/counter.c b/src/obj/counter.c
-index ef0cd20..0c199f7 100644
---- a/src/obj/counter.c
-+++ b/src/obj/counter.c
-@@ -127,5 +127,5 @@ struct obj_ops obj_ops_counter = {
- 	.get		= nftnl_obj_counter_get,
- 	.parse		= nftnl_obj_counter_parse,
- 	.build		= nftnl_obj_counter_build,
--	.snprintf	= nftnl_obj_counter_snprintf,
-+	.snprintf_	= nftnl_obj_counter_snprintf,
- };
-diff --git a/src/obj/ct_expect.c b/src/obj/ct_expect.c
-index 8136ad9..b3e1d70 100644
---- a/src/obj/ct_expect.c
-+++ b/src/obj/ct_expect.c
-@@ -196,5 +196,5 @@ struct obj_ops obj_ops_ct_expect = {
- 	.get		= nftnl_obj_ct_expect_get,
- 	.parse		= nftnl_obj_ct_expect_parse,
- 	.build		= nftnl_obj_ct_expect_build,
--	.snprintf	= nftnl_obj_ct_expect_snprintf,
-+	.snprintf_	= nftnl_obj_ct_expect_snprintf,
- };
-diff --git a/src/obj/ct_helper.c b/src/obj/ct_helper.c
-index c52032a..12b783c 100644
---- a/src/obj/ct_helper.c
-+++ b/src/obj/ct_helper.c
-@@ -150,5 +150,5 @@ struct obj_ops obj_ops_ct_helper = {
- 	.get		= nftnl_obj_ct_helper_get,
- 	.parse		= nftnl_obj_ct_helper_parse,
- 	.build		= nftnl_obj_ct_helper_build,
--	.snprintf	= nftnl_obj_ct_helper_snprintf,
-+	.snprintf_	= nftnl_obj_ct_helper_snprintf,
- };
-diff --git a/src/obj/ct_timeout.c b/src/obj/ct_timeout.c
-index 1d4f8fb..0a12883 100644
---- a/src/obj/ct_timeout.c
-+++ b/src/obj/ct_timeout.c
-@@ -316,5 +316,5 @@ struct obj_ops obj_ops_ct_timeout = {
- 	.get		= nftnl_obj_ct_timeout_get,
- 	.parse		= nftnl_obj_ct_timeout_parse,
- 	.build		= nftnl_obj_ct_timeout_build,
--	.snprintf	= nftnl_obj_ct_timeout_snprintf,
-+	.snprintf_	= nftnl_obj_ct_timeout_snprintf,
- };
-diff --git a/src/obj/limit.c b/src/obj/limit.c
-index 8b40f9d..2f049b8 100644
---- a/src/obj/limit.c
-+++ b/src/obj/limit.c
-@@ -168,5 +168,5 @@ struct obj_ops obj_ops_limit = {
- 	.get		= nftnl_obj_limit_get,
- 	.parse		= nftnl_obj_limit_parse,
- 	.build		= nftnl_obj_limit_build,
--	.snprintf	= nftnl_obj_limit_snprintf,
-+	.snprintf_	= nftnl_obj_limit_snprintf,
- };
-diff --git a/src/obj/quota.c b/src/obj/quota.c
-index 8ab3300..8666334 100644
---- a/src/obj/quota.c
-+++ b/src/obj/quota.c
-@@ -144,5 +144,5 @@ struct obj_ops obj_ops_quota = {
- 	.get		= nftnl_obj_quota_get,
- 	.parse		= nftnl_obj_quota_parse,
- 	.build		= nftnl_obj_quota_build,
--	.snprintf	= nftnl_obj_quota_snprintf,
-+	.snprintf_	= nftnl_obj_quota_snprintf,
- };
-diff --git a/src/obj/secmark.c b/src/obj/secmark.c
-index 2ccc803..e96e06f 100644
---- a/src/obj/secmark.c
-+++ b/src/obj/secmark.c
-@@ -116,5 +116,5 @@ struct obj_ops obj_ops_secmark = {
- 	.get		= nftnl_obj_secmark_get,
- 	.parse		= nftnl_obj_secmark_parse,
- 	.build		= nftnl_obj_secmark_build,
--	.snprintf	= nftnl_obj_secmark_snprintf,
-+	.snprintf_	= nftnl_obj_secmark_snprintf,
- };
-diff --git a/src/obj/synproxy.c b/src/obj/synproxy.c
-index d689fee..d06cb6d 100644
---- a/src/obj/synproxy.c
-+++ b/src/obj/synproxy.c
-@@ -143,5 +143,5 @@ struct obj_ops obj_ops_synproxy = {
- 	.get		= nftnl_obj_synproxy_get,
- 	.parse		= nftnl_obj_synproxy_parse,
- 	.build		= nftnl_obj_synproxy_build,
--	.snprintf	= nftnl_obj_synproxy_snprintf,
-+	.snprintf_	= nftnl_obj_synproxy_snprintf,
- };
-diff --git a/src/obj/tunnel.c b/src/obj/tunnel.c
-index 5ede6bd..d3743ff 100644
---- a/src/obj/tunnel.c
-+++ b/src/obj/tunnel.c
-@@ -547,5 +547,5 @@ struct obj_ops obj_ops_tunnel = {
- 	.get		= nftnl_obj_tunnel_get,
- 	.parse		= nftnl_obj_tunnel_parse,
- 	.build		= nftnl_obj_tunnel_build,
--	.snprintf	= nftnl_obj_tunnel_snprintf,
-+	.snprintf_	= nftnl_obj_tunnel_snprintf,
- };
-diff --git a/src/object.c b/src/object.c
-index 46e208b..d321c50 100644
---- a/src/object.c
-+++ b/src/object.c
-@@ -396,7 +396,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t remain,
- 	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
- 
- 	if (obj->ops) {
--		ret = obj->ops->snprintf(buf + offset, remain, flags, obj);
-+		ret = obj->ops->snprintf_(buf + offset, remain, flags, obj);
- 		SNPRINTF_BUFFER_SIZE(ret, remain, offset);
- 	}
- 	ret = snprintf(buf + offset, remain, "]");
--- 
-2.33.1
-
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
similarity index 89%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
index 3eca92dcec..ab55767fee 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
@@ -2,28 +2,27 @@ SUMMARY = "Library for low-level interaction with nftables Netlink's API over li
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
-DEPENDS = "libmnl"
 
-SRCREV = "f6575131e60ab10f131ea3ff36f69af2b6c3f614"
 SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
-           file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
+SRCREV = "817c8b66f1ea8c223b7513d4cd7bff525d8a0a9f"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig ptest
 
+DEPENDS = "libmnl"
 RDEPENDS:${PN}-ptest += " bash python3-core make"
- 
+
 TESTDIR = "tests"
 
 do_compile_ptest() {
     cp -rf ${S}/build-aux .
     oe_runmake buildtest-TESTS
 }
- 
+
 do_install_ptest() {
     cp -rf ${B}/build-aux ${D}${PTEST_PATH}
     install -d ${D}${PTEST_PATH}/${TESTDIR}
@@ -38,4 +37,3 @@ do_install_ptest() {
     # other nonexistent paths before running the actual tests
     sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 }
-

