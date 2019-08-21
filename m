Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E63BF7BD72
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 02:56:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="73980014"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Aug 2019 10:56:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 081DE4CE03E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 10:56:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 21 Aug 2019 10:56:40 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Aug 2019 11:56:02 +0900
Message-ID: <20190821025602.110572-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 081DE4CE03E7.A1925
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] libnftnl: upgrade 1.1.3 -> 1.1.4
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
X-List-Received-Date: Wed, 21 Aug 2019 02:56:42 -0000
Content-Type: text/plain

Refresh patch:
    0002-avoid-naming-local-function-as-one-of-printf-family.patch
Add two new file in this patch:
    src/expr/synproxy.c
    src/obj/ct_expect.c

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 ...cal-function-as-one-of-printf-family.patch | 54 ++++++++++++++-----
 .../{libnftnl_1.1.3.bb => libnftnl_1.1.4.bb}  |  2 +-
 2 files changed, 41 insertions(+), 15 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.3.bb => libnftnl_1.1.4.bb} (90%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
index 561f0e554..e64091b50 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
@@ -1,6 +1,6 @@
-From 9e2c810ebc3c917ea7483205178416e9eaf952fe Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Wed, 7 Nov 2018 19:41:54 +0000
+From 373e13e28e34b4d415fc096e1c7175f4ecfbf0da Mon Sep 17 00:00:00 2001
+From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
+Date: Wed, 21 Aug 2019 11:18:56 +0900
 Subject: [PATCH] avoid naming local function as one of printf family
 
 Fixes build issues with clang
@@ -8,6 +8,8 @@ error: no member named '__builtin___snprintf_chk' in 'struct expr_ops'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
+Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
 ---
  include/expr_ops.h      | 2 +-
  include/obj.h           | 2 +-
@@ -44,11 +46,13 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/expr/reject.c       | 2 +-
  src/expr/rt.c           | 2 +-
  src/expr/socket.c       | 2 +-
+ src/expr/synproxy.c     | 2 +-
  src/expr/target.c       | 2 +-
  src/expr/tproxy.c       | 2 +-
  src/expr/tunnel.c       | 2 +-
  src/expr/xfrm.c         | 2 +-
  src/obj/counter.c       | 2 +-
+ src/obj/ct_expect.c     | 2 +-
  src/obj/ct_helper.c     | 2 +-
  src/obj/ct_timeout.c    | 2 +-
  src/obj/limit.c         | 2 +-
@@ -56,7 +60,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/obj/secmark.c       | 2 +-
  src/obj/tunnel.c        | 2 +-
  src/object.c            | 2 +-
- 47 files changed, 48 insertions(+), 48 deletions(-)
+ 49 files changed, 50 insertions(+), 50 deletions(-)
 
 diff --git a/include/expr_ops.h b/include/expr_ops.h
 index a7f1b9a..d2946de 100644
@@ -72,10 +76,10 @@ index a7f1b9a..d2946de 100644
  
  struct expr_ops *nftnl_expr_ops_lookup(const char *name);
 diff --git a/include/obj.h b/include/obj.h
-index 35b5c40..decd1ce 100644
+index 9394d79..08610d7 100644
 --- a/include/obj.h
 +++ b/include/obj.h
-@@ -92,7 +92,7 @@ struct obj_ops {
+@@ -99,7 +99,7 @@ struct obj_ops {
  	const void *(*get)(const struct nftnl_obj *e, uint16_t type, uint32_t *data_len);
  	int	(*parse)(struct nftnl_obj *e, struct nlattr *attr);
  	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_obj *e);
@@ -157,10 +161,10 @@ index 89a602e..a32a69e 100644
 +	.snprintf_	= nftnl_expr_counter_snprintf,
  };
 diff --git a/src/expr/ct.c b/src/expr/ct.c
-index b9ca2dc..6fbed1d 100644
+index 124de9d..7bde179 100644
 --- a/src/expr/ct.c
 +++ b/src/expr/ct.c
-@@ -272,5 +272,5 @@ struct expr_ops expr_ops_ct = {
+@@ -273,5 +273,5 @@ struct expr_ops expr_ops_ct = {
  	.get		= nftnl_expr_ct_get,
  	.parse		= nftnl_expr_ct_parse,
  	.build		= nftnl_expr_ct_build,
@@ -190,10 +194,10 @@ index 68115ba..6e43bb4 100644
 +	.snprintf_	= nftnl_expr_dynset_snprintf,
  };
 diff --git a/src/expr/exthdr.c b/src/expr/exthdr.c
-index bef453e..f2696d6 100644
+index e5f714b..e68792b 100644
 --- a/src/expr/exthdr.c
 +++ b/src/expr/exthdr.c
-@@ -271,5 +271,5 @@ struct expr_ops expr_ops_exthdr = {
+@@ -276,5 +276,5 @@ struct expr_ops expr_ops_exthdr = {
  	.get		= nftnl_expr_exthdr_get,
  	.parse		= nftnl_expr_exthdr_parse,
  	.build		= nftnl_expr_exthdr_build,
@@ -311,10 +315,10 @@ index 4fa74b2..249c6b5 100644
 +	.snprintf_	= nftnl_expr_match_snprintf,
  };
 diff --git a/src/expr/meta.c b/src/expr/meta.c
-index ffcc896..5eaeb68 100644
+index 73f6efa..35d5ec5 100644
 --- a/src/expr/meta.c
 +++ b/src/expr/meta.c
-@@ -222,5 +222,5 @@ struct expr_ops expr_ops_meta = {
+@@ -226,5 +226,5 @@ struct expr_ops expr_ops_meta = {
  	.get		= nftnl_expr_meta_get,
  	.parse		= nftnl_expr_meta_parse,
  	.build		= nftnl_expr_meta_build,
@@ -453,6 +457,17 @@ index 96550d5..2394dbf 100644
 -	.snprintf	= nftnl_expr_socket_snprintf,
 +	.snprintf_	= nftnl_expr_socket_snprintf,
  };
+diff --git a/src/expr/synproxy.c b/src/expr/synproxy.c
+index 245f4fb..9721029 100644
+--- a/src/expr/synproxy.c
++++ b/src/expr/synproxy.c
+@@ -166,5 +166,5 @@ struct expr_ops expr_ops_synproxy = {
+ 	.get		= nftnl_expr_synproxy_get,
+ 	.parse		= nftnl_expr_synproxy_parse,
+ 	.build		= nftnl_expr_synproxy_build,
+-	.snprintf	= nftnl_expr_synproxy_snprintf,
++	.snprintf_	= nftnl_expr_synproxy_snprintf,
+ };
 diff --git a/src/expr/target.c b/src/expr/target.c
 index 9100038..7180085 100644
 --- a/src/expr/target.c
@@ -508,6 +523,17 @@ index 1baba4e..3710bce 100644
 -	.snprintf	= nftnl_obj_counter_snprintf,
 +	.snprintf_	= nftnl_obj_counter_snprintf,
  };
+diff --git a/src/obj/ct_expect.c b/src/obj/ct_expect.c
+index c0bb5ba..953c08c 100644
+--- a/src/obj/ct_expect.c
++++ b/src/obj/ct_expect.c
+@@ -209,5 +209,5 @@ struct obj_ops obj_ops_ct_expect = {
+ 	.get		= nftnl_obj_ct_expect_get,
+ 	.parse		= nftnl_obj_ct_expect_parse,
+ 	.build		= nftnl_obj_ct_expect_build,
+-	.snprintf	= nftnl_obj_ct_expect_snprintf,
++	.snprintf_	= nftnl_obj_ct_expect_snprintf,
+ };
 diff --git a/src/obj/ct_helper.c b/src/obj/ct_helper.c
 index d91f636..2037461 100644
 --- a/src/obj/ct_helper.c
@@ -575,10 +601,10 @@ index 7ffade8..800eb3e 100644
 +	.snprintf_	= nftnl_obj_tunnel_snprintf,
  };
 diff --git a/src/object.c b/src/object.c
-index 5c8d183..d489cdd 100644
+index d8c87ee..5307d7e 100644
 --- a/src/object.c
 +++ b/src/object.c
-@@ -369,7 +369,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t size,
+@@ -370,7 +370,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t size,
  	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  
  	if (obj->ops) {
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.3.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.4.bb
similarity index 90%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.3.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.4.bb
index 00bf88dab..705b6a6c3 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.3.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "d819a832e0214a3bec3679345f542644596a2850"
+SRCREV = "7c19dc01a88dbcf9a45fa791cd27a51b563bcf29"
 SRC_URI = "git://git.netfilter.org/libnftnl \
            file://0001-Move-exports-before-symbol-definition.patch \
            file://0002-avoid-naming-local-function-as-one-of-printf-family.patch \
-- 
2.17.1




