Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2317CE73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:25:59 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h10so10536904ljg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=goaYUWcJo4wgzxzKi8vZJz0RJlPNnihDhWaCj72HgbE=;
	b=WGntIOM3yBUEdQuB8UWq9jk+rJorr4AS36VQIdNtUYBL2pxu685DXhjoxE19zjoTx0
	2J7+RqdsDZBXOEarWjOARBbLeZ0cQH/eQEKkF//CIOdl+EzBYYGfRSN0VWRIF5NZ1tYo
	U1WJAUn1poc8pznwCNT6jjMT4NG5L+onDFSqbWHHAN/B9SLO7lAjO3pWGt5yWcVGv+uo
	3IFxaNt0ScIBltQDDxtj6+Tsv3PLpKaNYt01IpDQcF+PZWFG+SqivGdrquyV9yhYwRbJ
	a13qBbUBXFxRAFi5aTlGZp4qyDgUBqGYFWARtCEz8RX+JcWgo/EX5p42ayWl3zrULq/j
	0rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=goaYUWcJo4wgzxzKi8vZJz0RJlPNnihDhWaCj72HgbE=;
	b=gzyTY9bFjl/26178/5mBH3LMaRa3MvEtiMmrUSLnLZrfJPYrW31e8GbrtVKlUXGRy8
	AYvG4OkhRj71y3xZGAtEI+dW1CF18lkIz7KJ3Br0GzwZe+kZM6bC5CH7ohFObyXTBYnE
	u6ZCFZKI9o/J1/4TNC5CBbXzMMx5jXgKNJMEThioTO5z5ZsHUyuF3ZzhVw/BZTsXmEq9
	uTCRPzpq0rUKRUBuCrXg8QIj0PA+/CJ7f8LC+HHxfx/U+RmvyDeOdlkAmvIeUOp8ykXk
	k3H0L0FdMd1QUhCpC1JjY/S1kiDY/ABj1GG/y1j1byQL0kOPL3sKUWkvEOxevInpmXoQ
	WhmQ==
X-Gm-Message-State: APjAAAWNh5jZiCPYbXvsIsS/Rst30IszvW1WepuVPmoyAT4beQPSa0k1
	lKQRWNWubz8TQTZD6NczMENC4GWS
X-Google-Smtp-Source: APXvYqw4Oo19WVLkOgAomxwd4zEjYb9FMxSs6UW2hQ/3FVWdTuRG9zDd6g0xQ4yLntD+KszYgdpQ0Q==
X-Received: by 2002:a2e:93cc:: with SMTP id p12mr7100571ljh.11.1562963159555; 
	Fri, 12 Jul 2019 13:25:59 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m17sm1228062lfj.22.2019.07.12.13.25.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 13:25:59 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 22:25:57 +0200
Message-Id: <20190712202557.13871-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] libnftnl: update to 1.1.3
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
X-List-Received-Date: Fri, 12 Jul 2019 20:26:00 -0000

Updated libnftnl to 1.1.3 and refreshed patches.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ove-exports-before-symbol-definition.patch |  59 ++--
 ...cal-function-as-one-of-printf-family.patch | 307 ++++++++++--------
 .../{libnftnl_1.1.1.bb => libnftnl_1.1.3.bb}  |   4 +-
 3 files changed, 209 insertions(+), 161 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.1.bb => libnftnl_1.1.3.bb} (86%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
index 995fd59a5..699d0d922 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
@@ -1,4 +1,4 @@
-From 21eb59fbd071ebffb8495232766824944fb521a0 Mon Sep 17 00:00:00 2001
+From 6b76c76e6b3f93c422d666f49ee68df9d5426078 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Wed, 7 Nov 2018 21:19:53 +0000
 Subject: [PATCH] Move exports before symbol definition
@@ -10,11 +10,11 @@ clang.
 
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
- src/flowtable.c | 54 +++++++++++++++++++++++++++---------------------------
+ src/flowtable.c | 54 ++++++++++++++++++++++++-------------------------
  1 file changed, 27 insertions(+), 27 deletions(-)
 
 diff --git a/src/flowtable.c b/src/flowtable.c
-index c1ddae4..d7434e3 100644
+index 1f7ba30..80de952 100644
 --- a/src/flowtable.c
 +++ b/src/flowtable.c
 @@ -34,12 +34,13 @@ struct nftnl_flowtable {
@@ -49,7 +49,7 @@ index c1ddae4..d7434e3 100644
  void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
  {
  	int i;
-@@ -96,7 +97,6 @@ void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
+@@ -95,7 +96,6 @@ void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
  
  	c->flags &= ~(1 << attr);
  }
@@ -57,7 +57,7 @@ index c1ddae4..d7434e3 100644
  
  static uint32_t nftnl_flowtable_validate[NFTNL_FLOWTABLE_MAX + 1] = {
  	[NFTNL_FLOWTABLE_HOOKNUM]	= sizeof(uint32_t),
-@@ -105,6 +105,7 @@ static uint32_t nftnl_flowtable_validate[NFTNL_FLOWTABLE_MAX + 1] = {
+@@ -104,6 +104,7 @@ static uint32_t nftnl_flowtable_validate[NFTNL_FLOWTABLE_MAX + 1] = {
  	[NFTNL_FLOWTABLE_FLAGS]		= sizeof(uint32_t),
  };
  
@@ -65,7 +65,7 @@ index c1ddae4..d7434e3 100644
  int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
  			     const void *data, uint32_t data_len)
  {
-@@ -170,32 +171,32 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+@@ -169,32 +170,32 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
  	c->flags |= (1 << attr);
  	return 0;
  }
@@ -103,7 +103,7 @@ index c1ddae4..d7434e3 100644
  const void *nftnl_flowtable_get_data(const struct nftnl_flowtable *c,
  				     uint16_t attr, uint32_t *data_len)
  {
-@@ -229,21 +230,21 @@ const void *nftnl_flowtable_get_data(const struct nftnl_flowtable *c,
+@@ -228,21 +229,21 @@ const void *nftnl_flowtable_get_data(const struct nftnl_flowtable *c,
  	}
  	return NULL;
  }
@@ -127,8 +127,8 @@ index c1ddae4..d7434e3 100644
 +EXPORT_SYMBOL(nftnl_flowtable_get_u32);
  uint32_t nftnl_flowtable_get_u32(const struct nftnl_flowtable *c, uint16_t attr)
  {
- 	uint32_t data_len;
-@@ -253,8 +254,8 @@ uint32_t nftnl_flowtable_get_u32(const struct nftnl_flowtable *c, uint16_t attr)
+ 	uint32_t data_len = 0;
+@@ -252,8 +253,8 @@ uint32_t nftnl_flowtable_get_u32(const struct nftnl_flowtable *c, uint16_t attr)
  
  	return val ? *val : 0;
  }
@@ -137,8 +137,8 @@ index c1ddae4..d7434e3 100644
 +EXPORT_SYMBOL(nftnl_flowtable_get_s32);
  int32_t nftnl_flowtable_get_s32(const struct nftnl_flowtable *c, uint16_t attr)
  {
- 	uint32_t data_len;
-@@ -264,8 +265,8 @@ int32_t nftnl_flowtable_get_s32(const struct nftnl_flowtable *c, uint16_t attr)
+ 	uint32_t data_len = 0;
+@@ -263,8 +264,8 @@ int32_t nftnl_flowtable_get_s32(const struct nftnl_flowtable *c, uint16_t attr)
  
  	return val ? *val : 0;
  }
@@ -148,7 +148,7 @@ index c1ddae4..d7434e3 100644
  void nftnl_flowtable_nlmsg_build_payload(struct nlmsghdr *nlh,
  					 const struct nftnl_flowtable *c)
  {
-@@ -301,7 +302,6 @@ void nftnl_flowtable_nlmsg_build_payload(struct nlmsghdr *nlh,
+@@ -300,7 +301,6 @@ void nftnl_flowtable_nlmsg_build_payload(struct nlmsghdr *nlh,
  	if (c->flags & (1 << NFTNL_FLOWTABLE_SIZE))
  		mnl_attr_put_u32(nlh, NFTA_FLOWTABLE_SIZE, htonl(c->size));
  }
@@ -156,7 +156,7 @@ index c1ddae4..d7434e3 100644
  
  static int nftnl_flowtable_parse_attr_cb(const struct nlattr *attr, void *data)
  {
-@@ -412,6 +412,7 @@ static int nftnl_flowtable_parse_hook(struct nlattr *attr, struct nftnl_flowtabl
+@@ -415,6 +415,7 @@ static int nftnl_flowtable_parse_hook(struct nlattr *attr, struct nftnl_flowtabl
  	return 0;
  }
  
@@ -164,7 +164,7 @@ index c1ddae4..d7434e3 100644
  int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtable *c)
  {
  	struct nlattr *tb[NFTA_FLOWTABLE_MAX + 1] = {};
-@@ -460,7 +461,6 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
+@@ -463,7 +464,6 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
  
  	return ret;
  }
@@ -172,15 +172,16 @@ index c1ddae4..d7434e3 100644
  
  static const char *nftnl_hooknum2str(int family, int hooknum)
  {
-@@ -612,20 +612,20 @@ static int nftnl_flowtable_do_parse(struct nftnl_flowtable *c,
- 	return ret;
+@@ -516,14 +516,15 @@ static inline int nftnl_str2hooknum(int family, const char *hook)
+ 	return -1;
  }
  
 +EXPORT_SYMBOL(nftnl_flowtable_parse);
  int nftnl_flowtable_parse(struct nftnl_flowtable *c, enum nftnl_parse_type type,
  			  const char *data, struct nftnl_parse_err *err)
  {
- 	return nftnl_flowtable_do_parse(c, type, data, err, NFTNL_PARSE_BUFFER);
+ 	errno = EOPNOTSUPP;
+ 	return -1;
  }
 -EXPORT_SYMBOL(nftnl_flowtable_parse);
  
@@ -188,14 +189,15 @@ index c1ddae4..d7434e3 100644
  int nftnl_flowtable_parse_file(struct nftnl_flowtable *c,
  			       enum nftnl_parse_type type,
  			       FILE *fp, struct nftnl_parse_err *err)
- {
- 	return nftnl_flowtable_do_parse(c, type, fp, err, NFTNL_PARSE_FILE);
+@@ -531,7 +532,6 @@ int nftnl_flowtable_parse_file(struct nftnl_flowtable *c,
+ 	errno = EOPNOTSUPP;
+ 	return -1;
  }
 -EXPORT_SYMBOL(nftnl_flowtable_parse_file);
  
- static int nftnl_flowtable_export(char *buf, size_t size,
- 				  const struct nftnl_flowtable *c, int type)
-@@ -720,6 +720,7 @@ static int nftnl_flowtable_cmd_snprintf(char *buf, size_t size,
+ static int nftnl_flowtable_snprintf_default(char *buf, size_t size,
+ 					    const struct nftnl_flowtable *c)
+@@ -587,6 +587,7 @@ static int nftnl_flowtable_cmd_snprintf(char *buf, size_t size,
  	return offset;
  }
  
@@ -203,7 +205,7 @@ index c1ddae4..d7434e3 100644
  int nftnl_flowtable_snprintf(char *buf, size_t size, const struct nftnl_flowtable *c,
  			 uint32_t type, uint32_t flags)
  {
-@@ -729,7 +730,6 @@ int nftnl_flowtable_snprintf(char *buf, size_t size, const struct nftnl_flowtabl
+@@ -596,7 +597,6 @@ int nftnl_flowtable_snprintf(char *buf, size_t size, const struct nftnl_flowtabl
  	return nftnl_flowtable_cmd_snprintf(buf, size, c, nftnl_flag2cmd(flags),
  					    type, flags);
  }
@@ -211,7 +213,7 @@ index c1ddae4..d7434e3 100644
  
  static int nftnl_flowtable_do_snprintf(char *buf, size_t size, const void *c,
  				   uint32_t cmd, uint32_t type, uint32_t flags)
-@@ -737,18 +737,19 @@ static int nftnl_flowtable_do_snprintf(char *buf, size_t size, const void *c,
+@@ -604,18 +604,19 @@ static int nftnl_flowtable_do_snprintf(char *buf, size_t size, const void *c,
  	return nftnl_flowtable_snprintf(buf, size, c, type, flags);
  }
  
@@ -232,7 +234,7 @@ index c1ddae4..d7434e3 100644
  struct nftnl_flowtable_list *nftnl_flowtable_list_alloc(void)
  {
  	struct nftnl_flowtable_list *list;
-@@ -761,8 +762,8 @@ struct nftnl_flowtable_list *nftnl_flowtable_list_alloc(void)
+@@ -628,8 +629,8 @@ struct nftnl_flowtable_list *nftnl_flowtable_list_alloc(void)
  
  	return list;
  }
@@ -242,7 +244,7 @@ index c1ddae4..d7434e3 100644
  void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
  {
  	struct nftnl_flowtable *s, *tmp;
-@@ -773,34 +774,34 @@ void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
+@@ -640,34 +641,34 @@ void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
  	}
  	xfree(list);
  }
@@ -282,8 +284,11 @@ index c1ddae4..d7434e3 100644
  int nftnl_flowtable_list_foreach(struct nftnl_flowtable_list *flowtable_list,
  				 int (*cb)(struct nftnl_flowtable *t, void *data), void *data)
  {
-@@ -814,4 +815,3 @@ int nftnl_flowtable_list_foreach(struct nftnl_flowtable_list *flowtable_list,
+@@ -681,4 +682,3 @@ int nftnl_flowtable_list_foreach(struct nftnl_flowtable_list *flowtable_list,
  	}
  	return 0;
  }
 -EXPORT_SYMBOL(nftnl_flowtable_list_foreach);
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
index e7e8f6fe9..561f0e554 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0002-avoid-naming-local-function-as-one-of-printf-family.patch
@@ -1,4 +1,4 @@
-From 5ea9fa9d345005f2f53b1b598edb85f5f24ca9da Mon Sep 17 00:00:00 2001
+From 9e2c810ebc3c917ea7483205178416e9eaf952fe Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Wed, 7 Nov 2018 19:41:54 +0000
 Subject: [PATCH] avoid naming local function as one of printf family
@@ -35,6 +35,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/expr/nat.c          | 2 +-
  src/expr/numgen.c       | 2 +-
  src/expr/objref.c       | 2 +-
+ src/expr/osf.c          | 2 +-
  src/expr/payload.c      | 2 +-
  src/expr/queue.c        | 2 +-
  src/expr/quota.c        | 2 +-
@@ -44,44 +45,50 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/expr/rt.c           | 2 +-
  src/expr/socket.c       | 2 +-
  src/expr/target.c       | 2 +-
+ src/expr/tproxy.c       | 2 +-
+ src/expr/tunnel.c       | 2 +-
+ src/expr/xfrm.c         | 2 +-
  src/obj/counter.c       | 2 +-
  src/obj/ct_helper.c     | 2 +-
+ src/obj/ct_timeout.c    | 2 +-
  src/obj/limit.c         | 2 +-
  src/obj/quota.c         | 2 +-
- src/object.c            | 4 ++--
- 40 files changed, 42 insertions(+), 42 deletions(-)
+ src/obj/secmark.c       | 2 +-
+ src/obj/tunnel.c        | 2 +-
+ src/object.c            | 2 +-
+ 47 files changed, 48 insertions(+), 48 deletions(-)
 
 diff --git a/include/expr_ops.h b/include/expr_ops.h
-index e639390..c4fe050 100644
+index a7f1b9a..d2946de 100644
 --- a/include/expr_ops.h
 +++ b/include/expr_ops.h
-@@ -18,7 +18,7 @@ struct expr_ops {
+@@ -17,7 +17,7 @@ struct expr_ops {
  	const void *(*get)(const struct nftnl_expr *e, uint16_t type, uint32_t *data_len);
  	int 	(*parse)(struct nftnl_expr *e, struct nlattr *attr);
  	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_expr *e);
 -	int	(*snprintf)(char *buf, size_t len, uint32_t type, uint32_t flags, const struct nftnl_expr *e);
 +	int	(*snprintf_)(char *buf, size_t len, uint32_t type, uint32_t flags, const struct nftnl_expr *e);
- 	int	(*json_parse)(struct nftnl_expr *e, json_t *data,
- 			      struct nftnl_parse_err *err);
  };
+ 
+ struct expr_ops *nftnl_expr_ops_lookup(const char *name);
 diff --git a/include/obj.h b/include/obj.h
-index 4a728c8..4c20bd1 100644
+index 35b5c40..decd1ce 100644
 --- a/include/obj.h
 +++ b/include/obj.h
-@@ -55,7 +55,7 @@ struct obj_ops {
+@@ -92,7 +92,7 @@ struct obj_ops {
  	const void *(*get)(const struct nftnl_obj *e, uint16_t type, uint32_t *data_len);
  	int	(*parse)(struct nftnl_obj *e, struct nlattr *attr);
  	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_obj *e);
 -	int	(*snprintf)(char *buf, size_t len, uint32_t type, uint32_t flags, const struct nftnl_obj *e);
 +	int	(*snprintf_)(char *buf, size_t len, uint32_t type, uint32_t flags, const struct nftnl_obj *e);
- 	int	(*json_parse)(struct nftnl_obj *e, json_t *data,
- 			      struct nftnl_parse_err *err);
  };
+ 
+ extern struct obj_ops obj_ops_counter;
 diff --git a/src/expr.c b/src/expr.c
-index 62565e0..2489c30 100644
+index 80c4c36..b698a60 100644
 --- a/src/expr.c
 +++ b/src/expr.c
-@@ -285,10 +285,10 @@ int nftnl_expr_snprintf(char *buf, size_t size, const struct nftnl_expr *expr,
+@@ -275,10 +275,10 @@ int nftnl_expr_snprintf(char *buf, size_t size, const struct nftnl_expr *expr,
  	if (size)
  		buf[0] = '\0';
  
@@ -95,370 +102,351 @@ index 62565e0..2489c30 100644
  
  	return offset;
 diff --git a/src/expr/bitwise.c b/src/expr/bitwise.c
-index a89734b..f8360b1 100644
+index c9d40df..27d644b 100644
 --- a/src/expr/bitwise.c
 +++ b/src/expr/bitwise.c
-@@ -299,6 +299,6 @@ struct expr_ops expr_ops_bitwise = {
+@@ -219,5 +219,5 @@ struct expr_ops expr_ops_bitwise = {
  	.get		= nftnl_expr_bitwise_get,
  	.parse		= nftnl_expr_bitwise_parse,
  	.build		= nftnl_expr_bitwise_build,
 -	.snprintf	= nftnl_expr_bitwise_snprintf,
 +	.snprintf_	= nftnl_expr_bitwise_snprintf,
- 	.json_parse	= nftnl_expr_bitwise_json_parse,
  };
 diff --git a/src/expr/byteorder.c b/src/expr/byteorder.c
-index 47c04cf..61f733f 100644
+index efdfa2b..7ae9dfb 100644
 --- a/src/expr/byteorder.c
 +++ b/src/expr/byteorder.c
-@@ -314,6 +314,6 @@ struct expr_ops expr_ops_byteorder = {
+@@ -234,5 +234,5 @@ struct expr_ops expr_ops_byteorder = {
  	.get		= nftnl_expr_byteorder_get,
  	.parse		= nftnl_expr_byteorder_parse,
  	.build		= nftnl_expr_byteorder_build,
 -	.snprintf	= nftnl_expr_byteorder_snprintf,
 +	.snprintf_	= nftnl_expr_byteorder_snprintf,
- 	.json_parse	= nftnl_expr_byteorder_json_parse,
  };
 diff --git a/src/expr/cmp.c b/src/expr/cmp.c
-index b26d0eb..522c7be 100644
+index 86d7842..e3be442 100644
 --- a/src/expr/cmp.c
 +++ b/src/expr/cmp.c
-@@ -284,6 +284,6 @@ struct expr_ops expr_ops_cmp = {
+@@ -216,5 +216,5 @@ struct expr_ops expr_ops_cmp = {
  	.get		= nftnl_expr_cmp_get,
  	.parse		= nftnl_expr_cmp_parse,
  	.build		= nftnl_expr_cmp_build,
 -	.snprintf	= nftnl_expr_cmp_snprintf,
 +	.snprintf_	= nftnl_expr_cmp_snprintf,
- 	.json_parse	= nftnl_expr_cmp_json_parse,
  };
 diff --git a/src/expr/connlimit.c b/src/expr/connlimit.c
-index 60965b5..4e41866 100644
+index 53af93b..6c8bc40 100644
 --- a/src/expr/connlimit.c
 +++ b/src/expr/connlimit.c
-@@ -202,6 +202,6 @@ struct expr_ops expr_ops_connlimit = {
+@@ -149,5 +149,5 @@ struct expr_ops expr_ops_connlimit = {
  	.get		= nftnl_expr_connlimit_get,
  	.parse		= nftnl_expr_connlimit_parse,
  	.build		= nftnl_expr_connlimit_build,
 -	.snprintf	= nftnl_expr_connlimit_snprintf,
-+	.snprintf_	= nftnl_expr_connlimit_snprintf,
- 	.json_parse	= nftnl_expr_connlimit_json_parse,
++	.snprintf_  = nftnl_expr_connlimit_snprintf,
  };
 diff --git a/src/expr/counter.c b/src/expr/counter.c
-index 21901e8..9fd7655 100644
+index 89a602e..a32a69e 100644
 --- a/src/expr/counter.c
 +++ b/src/expr/counter.c
-@@ -200,6 +200,6 @@ struct expr_ops expr_ops_counter = {
+@@ -147,5 +147,5 @@ struct expr_ops expr_ops_counter = {
  	.get		= nftnl_expr_counter_get,
  	.parse		= nftnl_expr_counter_parse,
  	.build		= nftnl_expr_counter_build,
 -	.snprintf	= nftnl_expr_counter_snprintf,
 +	.snprintf_	= nftnl_expr_counter_snprintf,
- 	.json_parse	= nftnl_expr_counter_json_parse,
  };
 diff --git a/src/expr/ct.c b/src/expr/ct.c
-index 39e9be6..b363f7c 100644
+index b9ca2dc..6fbed1d 100644
 --- a/src/expr/ct.c
 +++ b/src/expr/ct.c
-@@ -357,6 +357,6 @@ struct expr_ops expr_ops_ct = {
+@@ -272,5 +272,5 @@ struct expr_ops expr_ops_ct = {
  	.get		= nftnl_expr_ct_get,
  	.parse		= nftnl_expr_ct_parse,
  	.build		= nftnl_expr_ct_build,
 -	.snprintf	= nftnl_expr_ct_snprintf,
 +	.snprintf_	= nftnl_expr_ct_snprintf,
- 	.json_parse	= nftnl_expr_ct_json_parse,
  };
 diff --git a/src/expr/dup.c b/src/expr/dup.c
-index ed8e620..8d603e3 100644
+index 2bb35e5..d9bd4b1 100644
 --- a/src/expr/dup.c
 +++ b/src/expr/dup.c
-@@ -206,6 +206,6 @@ struct expr_ops expr_ops_dup = {
+@@ -154,5 +154,5 @@ struct expr_ops expr_ops_dup = {
  	.get		= nftnl_expr_dup_get,
  	.parse		= nftnl_expr_dup_parse,
  	.build		= nftnl_expr_dup_build,
 -	.snprintf	= nftnl_expr_dup_snprintf,
 +	.snprintf_	= nftnl_expr_dup_snprintf,
- 	.json_parse	= nftnl_expr_dup_json_parse,
  };
 diff --git a/src/expr/dynset.c b/src/expr/dynset.c
-index 160d0e1..a43f4da 100644
+index 68115ba..6e43bb4 100644
 --- a/src/expr/dynset.c
 +++ b/src/expr/dynset.c
-@@ -368,6 +368,6 @@ struct expr_ops expr_ops_dynset = {
+@@ -288,5 +288,5 @@ struct expr_ops expr_ops_dynset = {
  	.get		= nftnl_expr_dynset_get,
  	.parse		= nftnl_expr_dynset_parse,
  	.build		= nftnl_expr_dynset_build,
 -	.snprintf	= nftnl_expr_dynset_snprintf,
 +	.snprintf_	= nftnl_expr_dynset_snprintf,
- 	.json_parse	= nftnl_expr_dynset_json_parse,
  };
 diff --git a/src/expr/exthdr.c b/src/expr/exthdr.c
-index 75cafbc..89ea7f5 100644
+index bef453e..f2696d6 100644
 --- a/src/expr/exthdr.c
 +++ b/src/expr/exthdr.c
-@@ -385,6 +385,6 @@ struct expr_ops expr_ops_exthdr = {
+@@ -271,5 +271,5 @@ struct expr_ops expr_ops_exthdr = {
  	.get		= nftnl_expr_exthdr_get,
  	.parse		= nftnl_expr_exthdr_parse,
  	.build		= nftnl_expr_exthdr_build,
 -	.snprintf	= nftnl_expr_exthdr_snprintf,
 +	.snprintf_	= nftnl_expr_exthdr_snprintf,
- 	.json_parse	= nftnl_expr_exthdr_json_parse,
  };
 diff --git a/src/expr/fib.c b/src/expr/fib.c
-index b922b26..ece4645 100644
+index 9475af4..8e7090d 100644
 --- a/src/expr/fib.c
 +++ b/src/expr/fib.c
-@@ -274,6 +274,6 @@ struct expr_ops expr_ops_fib = {
+@@ -213,5 +213,5 @@ struct expr_ops expr_ops_fib = {
  	.get		= nftnl_expr_fib_get,
  	.parse		= nftnl_expr_fib_parse,
  	.build		= nftnl_expr_fib_build,
 -	.snprintf	= nftnl_expr_fib_snprintf,
 +	.snprintf_	= nftnl_expr_fib_snprintf,
- 	.json_parse	= nftnl_expr_fib_json_parse,
  };
 diff --git a/src/expr/flow_offload.c b/src/expr/flow_offload.c
-index a2001c9..9cdbc21 100644
+index 6ccec9a..c2f2478 100644
 --- a/src/expr/flow_offload.c
 +++ b/src/expr/flow_offload.c
-@@ -179,6 +179,6 @@ struct expr_ops expr_ops_flow = {
+@@ -134,5 +134,5 @@ struct expr_ops expr_ops_flow = {
  	.get		= nftnl_expr_flow_get,
  	.parse		= nftnl_expr_flow_parse,
  	.build		= nftnl_expr_flow_build,
 -	.snprintf	= nftnl_expr_flow_snprintf,
 +	.snprintf_	= nftnl_expr_flow_snprintf,
- 	.json_parse	= nftnl_expr_flow_json_parse,
  };
 diff --git a/src/expr/fwd.c b/src/expr/fwd.c
-index 9021606..7178f43 100644
+index cff8235..bcd7d3f 100644
 --- a/src/expr/fwd.c
 +++ b/src/expr/fwd.c
-@@ -233,6 +233,6 @@ struct expr_ops expr_ops_fwd = {
+@@ -174,5 +174,5 @@ struct expr_ops expr_ops_fwd = {
  	.get		= nftnl_expr_fwd_get,
  	.parse		= nftnl_expr_fwd_parse,
  	.build		= nftnl_expr_fwd_build,
 -	.snprintf	= nftnl_expr_fwd_snprintf,
 +	.snprintf_	= nftnl_expr_fwd_snprintf,
- 	.json_parse	= nftnl_expr_fwd_json_parse,
  };
 diff --git a/src/expr/hash.c b/src/expr/hash.c
-index 415537e..186c5b0 100644
+index 2c801d2..a9f6e7e 100644
 --- a/src/expr/hash.c
 +++ b/src/expr/hash.c
-@@ -383,6 +383,6 @@ struct expr_ops expr_ops_hash = {
+@@ -241,5 +241,5 @@ struct expr_ops expr_ops_hash = {
  	.get		= nftnl_expr_hash_get,
  	.parse		= nftnl_expr_hash_parse,
  	.build		= nftnl_expr_hash_build,
 -	.snprintf	= nftnl_expr_hash_snprintf,
 +	.snprintf_	= nftnl_expr_hash_snprintf,
- 	.json_parse	= nftnl_expr_hash_json_parse,
  };
 diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index b0570bd..91ccbdc 100644
+index 47106ae..ea86c88 100644
 --- a/src/expr/immediate.c
 +++ b/src/expr/immediate.c
-@@ -316,6 +316,6 @@ struct expr_ops expr_ops_immediate = {
+@@ -235,5 +235,5 @@ struct expr_ops expr_ops_immediate = {
  	.get		= nftnl_expr_immediate_get,
  	.parse		= nftnl_expr_immediate_parse,
  	.build		= nftnl_expr_immediate_build,
 -	.snprintf	= nftnl_expr_immediate_snprintf,
 +	.snprintf_	= nftnl_expr_immediate_snprintf,
- 	.json_parse	= nftnl_expr_immediate_json_parse,
  };
 diff --git a/src/expr/limit.c b/src/expr/limit.c
-index 856ab18..e71fc2f 100644
+index 5872e27..0ce482f 100644
 --- a/src/expr/limit.c
 +++ b/src/expr/limit.c
-@@ -285,6 +285,6 @@ struct expr_ops expr_ops_limit = {
+@@ -216,5 +216,5 @@ struct expr_ops expr_ops_limit = {
  	.get		= nftnl_expr_limit_get,
  	.parse		= nftnl_expr_limit_parse,
  	.build		= nftnl_expr_limit_build,
 -	.snprintf	= nftnl_expr_limit_snprintf,
 +	.snprintf_	= nftnl_expr_limit_snprintf,
- 	.json_parse	= nftnl_expr_limit_json_parse,
  };
 diff --git a/src/expr/log.c b/src/expr/log.c
-index 86d9651..5769c1c 100644
+index bbe43d2..5506bc2 100644
 --- a/src/expr/log.c
 +++ b/src/expr/log.c
-@@ -353,6 +353,6 @@ struct expr_ops expr_ops_log = {
+@@ -267,5 +267,5 @@ struct expr_ops expr_ops_log = {
  	.get		= nftnl_expr_log_get,
  	.parse		= nftnl_expr_log_parse,
  	.build		= nftnl_expr_log_build,
 -	.snprintf	= nftnl_expr_log_snprintf,
 +	.snprintf_	= nftnl_expr_log_snprintf,
- 	.json_parse	= nftnl_expr_log_json_parse,
  };
 diff --git a/src/expr/lookup.c b/src/expr/lookup.c
-index 5fcb81f..b2f0dd6 100644
+index a495ac0..678868c 100644
 --- a/src/expr/lookup.c
 +++ b/src/expr/lookup.c
-@@ -292,6 +292,6 @@ struct expr_ops expr_ops_lookup = {
+@@ -221,5 +221,5 @@ struct expr_ops expr_ops_lookup = {
  	.get		= nftnl_expr_lookup_get,
  	.parse		= nftnl_expr_lookup_parse,
  	.build		= nftnl_expr_lookup_build,
 -	.snprintf	= nftnl_expr_lookup_snprintf,
 +	.snprintf_	= nftnl_expr_lookup_snprintf,
- 	.json_parse	= nftnl_expr_lookup_json_parse,
  };
 diff --git a/src/expr/masq.c b/src/expr/masq.c
-index 7c235d3..adec325 100644
+index f6f3ceb..88292a6 100644
 --- a/src/expr/masq.c
 +++ b/src/expr/masq.c
-@@ -228,6 +228,6 @@ struct expr_ops expr_ops_masq = {
+@@ -169,5 +169,5 @@ struct expr_ops expr_ops_masq = {
  	.get		= nftnl_expr_masq_get,
  	.parse		= nftnl_expr_masq_parse,
  	.build		= nftnl_expr_masq_build,
 -	.snprintf	= nftnl_expr_masq_snprintf,
 +	.snprintf_	= nftnl_expr_masq_snprintf,
- 	.json_parse	= nftnl_expr_masq_json_parse,
  };
 diff --git a/src/expr/match.c b/src/expr/match.c
-index dd09e1e..f0d8868 100644
+index 4fa74b2..249c6b5 100644
 --- a/src/expr/match.c
 +++ b/src/expr/match.c
-@@ -249,6 +249,6 @@ struct expr_ops expr_ops_match = {
+@@ -198,5 +198,5 @@ struct expr_ops expr_ops_match = {
  	.get		= nftnl_expr_match_get,
  	.parse		= nftnl_expr_match_parse,
  	.build		= nftnl_expr_match_build,
 -	.snprintf	= nftnl_expr_match_snprintf,
 +	.snprintf_	= nftnl_expr_match_snprintf,
- 	.json_parse 	= nftnl_expr_match_json_parse,
  };
 diff --git a/src/expr/meta.c b/src/expr/meta.c
-index de82105..91f1ebb 100644
+index ffcc896..5eaeb68 100644
 --- a/src/expr/meta.c
 +++ b/src/expr/meta.c
-@@ -291,6 +291,6 @@ struct expr_ops expr_ops_meta = {
+@@ -222,5 +222,5 @@ struct expr_ops expr_ops_meta = {
  	.get		= nftnl_expr_meta_get,
  	.parse		= nftnl_expr_meta_parse,
  	.build		= nftnl_expr_meta_build,
 -	.snprintf	= nftnl_expr_meta_snprintf,
 +	.snprintf_	= nftnl_expr_meta_snprintf,
- 	.json_parse 	= nftnl_expr_meta_json_parse,
  };
 diff --git a/src/expr/nat.c b/src/expr/nat.c
-index 9271303..427c282 100644
+index 6b7d50e..be4a579 100644
 --- a/src/expr/nat.c
 +++ b/src/expr/nat.c
-@@ -384,6 +384,6 @@ struct expr_ops expr_ops_nat = {
+@@ -279,5 +279,5 @@ struct expr_ops expr_ops_nat = {
  	.get		= nftnl_expr_nat_get,
  	.parse		= nftnl_expr_nat_parse,
  	.build		= nftnl_expr_nat_build,
 -	.snprintf	= nftnl_expr_nat_snprintf,
 +	.snprintf_	= nftnl_expr_nat_snprintf,
- 	.json_parse	= nftnl_expr_nat_json_parse,
  };
 diff --git a/src/expr/numgen.c b/src/expr/numgen.c
-index 5336fde..8e0479a 100644
+index 4e0d541..5995ee3 100644
 --- a/src/expr/numgen.c
 +++ b/src/expr/numgen.c
-@@ -313,6 +313,6 @@ struct expr_ops expr_ops_ng = {
+@@ -195,5 +195,5 @@ struct expr_ops expr_ops_ng = {
  	.get		= nftnl_expr_ng_get,
  	.parse		= nftnl_expr_ng_parse,
  	.build		= nftnl_expr_ng_build,
 -	.snprintf	= nftnl_expr_ng_snprintf,
 +	.snprintf_	= nftnl_expr_ng_snprintf,
- 	.json_parse	= nftnl_expr_ng_json_parse,
  };
 diff --git a/src/expr/objref.c b/src/expr/objref.c
-index 64ee863..4504488 100644
+index 7388b18..e673ffd 100644
 --- a/src/expr/objref.c
 +++ b/src/expr/objref.c
-@@ -278,6 +278,6 @@ struct expr_ops expr_ops_objref = {
+@@ -210,5 +210,5 @@ struct expr_ops expr_ops_objref = {
  	.get		= nftnl_expr_objref_get,
  	.parse		= nftnl_expr_objref_parse,
  	.build		= nftnl_expr_objref_build,
 -	.snprintf	= nftnl_expr_objref_snprintf,
 +	.snprintf_	= nftnl_expr_objref_snprintf,
- 	.json_parse	= nftnl_expr_objref_json_parse,
+ };
+diff --git a/src/expr/osf.c b/src/expr/osf.c
+index 98d0df9..618b46e 100644
+--- a/src/expr/osf.c
++++ b/src/expr/osf.c
+@@ -161,5 +161,5 @@ struct expr_ops expr_ops_osf = {
+ 	.get		= nftnl_expr_osf_get,
+ 	.parse		= nftnl_expr_osf_parse,
+ 	.build		= nftnl_expr_osf_build,
+-	.snprintf	= nftnl_expr_osf_snprintf,
++	.snprintf_	= nftnl_expr_osf_snprintf,
  };
 diff --git a/src/expr/payload.c b/src/expr/payload.c
-index 91e1587..894ac08 100644
+index 2192dad..37aacc4 100644
 --- a/src/expr/payload.c
 +++ b/src/expr/payload.c
-@@ -348,6 +348,6 @@ struct expr_ops expr_ops_payload = {
+@@ -266,5 +266,5 @@ struct expr_ops expr_ops_payload = {
  	.get		= nftnl_expr_payload_get,
  	.parse		= nftnl_expr_payload_parse,
  	.build		= nftnl_expr_payload_build,
 -	.snprintf	= nftnl_expr_payload_snprintf,
 +	.snprintf_	= nftnl_expr_payload_snprintf,
- 	.json_parse	= nftnl_expr_payload_json_parse,
  };
 diff --git a/src/expr/queue.c b/src/expr/queue.c
-index a392a27..ee26c10 100644
+index 051ef71..b06feff 100644
 --- a/src/expr/queue.c
 +++ b/src/expr/queue.c
-@@ -275,6 +275,6 @@ struct expr_ops expr_ops_queue = {
+@@ -207,5 +207,5 @@ struct expr_ops expr_ops_queue = {
  	.get		= nftnl_expr_queue_get,
  	.parse		= nftnl_expr_queue_parse,
  	.build		= nftnl_expr_queue_build,
 -	.snprintf	= nftnl_expr_queue_snprintf,
 +	.snprintf_	= nftnl_expr_queue_snprintf,
- 	.json_parse	= nftnl_expr_queue_json_parse,
  };
 diff --git a/src/expr/quota.c b/src/expr/quota.c
-index 667e6e1..ff5d182 100644
+index 39a92e6..41797be 100644
 --- a/src/expr/quota.c
 +++ b/src/expr/quota.c
-@@ -203,6 +203,6 @@ struct expr_ops expr_ops_quota = {
+@@ -161,5 +161,5 @@ struct expr_ops expr_ops_quota = {
  	.get		= nftnl_expr_quota_get,
  	.parse		= nftnl_expr_quota_parse,
  	.build		= nftnl_expr_quota_build,
 -	.snprintf	= nftnl_expr_quota_snprintf,
 +	.snprintf_	= nftnl_expr_quota_snprintf,
- 	.json_parse	= nftnl_expr_quota_json_parse,
  };
 diff --git a/src/expr/range.c b/src/expr/range.c
-index b2789ff..8910f8a 100644
+index d1d5083..b619cdf 100644
 --- a/src/expr/range.c
 +++ b/src/expr/range.c
-@@ -283,6 +283,6 @@ struct expr_ops expr_ops_range = {
+@@ -227,5 +227,5 @@ struct expr_ops expr_ops_range = {
  	.get		= nftnl_expr_range_get,
  	.parse		= nftnl_expr_range_parse,
  	.build		= nftnl_expr_range_build,
 -	.snprintf	= nftnl_expr_range_snprintf,
 +	.snprintf_	= nftnl_expr_range_snprintf,
- 	.json_parse	= nftnl_expr_range_json_parse,
  };
 diff --git a/src/expr/redir.c b/src/expr/redir.c
-index b2aa345..41b77ab 100644
+index 477659a..5c4ebeb 100644
 --- a/src/expr/redir.c
 +++ b/src/expr/redir.c
-@@ -242,6 +242,6 @@ struct expr_ops expr_ops_redir = {
+@@ -181,5 +181,5 @@ struct expr_ops expr_ops_redir = {
  	.get		= nftnl_expr_redir_get,
  	.parse		= nftnl_expr_redir_parse,
  	.build		= nftnl_expr_redir_build,
 -	.snprintf	= nftnl_expr_redir_snprintf,
 +	.snprintf_	= nftnl_expr_redir_snprintf,
- 	.json_parse	= nftnl_expr_redir_json_parse,
  };
 diff --git a/src/expr/reject.c b/src/expr/reject.c
-index 11d8b20..b10e729 100644
+index 141942e..a98990d 100644
 --- a/src/expr/reject.c
 +++ b/src/expr/reject.c
-@@ -200,6 +200,6 @@ struct expr_ops expr_ops_reject = {
+@@ -148,5 +148,5 @@ struct expr_ops expr_ops_reject = {
  	.get		= nftnl_expr_reject_get,
  	.parse		= nftnl_expr_reject_parse,
  	.build		= nftnl_expr_reject_build,
 -	.snprintf	= nftnl_expr_reject_snprintf,
 +	.snprintf_	= nftnl_expr_reject_snprintf,
- 	.json_parse	= nftnl_expr_reject_json_parse,
  };
 diff --git a/src/expr/rt.c b/src/expr/rt.c
-index c3c92c7..688a042 100644
+index 0fce72d..32ace19 100644
 --- a/src/expr/rt.c
 +++ b/src/expr/rt.c
-@@ -235,6 +235,6 @@ struct expr_ops expr_ops_rt = {
+@@ -177,5 +177,5 @@ struct expr_ops expr_ops_rt = {
  	.get		= nftnl_expr_rt_get,
  	.parse		= nftnl_expr_rt_parse,
  	.build		= nftnl_expr_rt_build,
 -	.snprintf	= nftnl_expr_rt_snprintf,
 +	.snprintf_	= nftnl_expr_rt_snprintf,
- 	.json_parse	= nftnl_expr_rt_json_parse,
  };
 diff --git a/src/expr/socket.c b/src/expr/socket.c
-index db160a1..4c50011 100644
+index 96550d5..2394dbf 100644
 --- a/src/expr/socket.c
 +++ b/src/expr/socket.c
-@@ -204,5 +204,5 @@ struct expr_ops expr_ops_socket = {
+@@ -174,5 +174,5 @@ struct expr_ops expr_ops_socket = {
  	.get		= nftnl_expr_socket_get,
  	.parse		= nftnl_expr_socket_parse,
  	.build		= nftnl_expr_socket_build,
@@ -466,79 +454,131 @@ index db160a1..4c50011 100644
 +	.snprintf_	= nftnl_expr_socket_snprintf,
  };
 diff --git a/src/expr/target.c b/src/expr/target.c
-index ed4bf7d..2ef4078 100644
+index 9100038..7180085 100644
 --- a/src/expr/target.c
 +++ b/src/expr/target.c
-@@ -249,6 +249,6 @@ struct expr_ops expr_ops_target = {
+@@ -198,5 +198,5 @@ struct expr_ops expr_ops_target = {
  	.get		= nftnl_expr_target_get,
  	.parse		= nftnl_expr_target_parse,
  	.build		= nftnl_expr_target_build,
 -	.snprintf	= nftnl_expr_target_snprintf,
 +	.snprintf_	= nftnl_expr_target_snprintf,
- 	.json_parse	= nftnl_expr_target_json_parse,
+ };
+diff --git a/src/expr/tproxy.c b/src/expr/tproxy.c
+index 3827b75..feabbbe 100644
+--- a/src/expr/tproxy.c
++++ b/src/expr/tproxy.c
+@@ -183,5 +183,5 @@ struct expr_ops expr_ops_tproxy = {
+ 	.get		= nftnl_expr_tproxy_get,
+ 	.parse		= nftnl_expr_tproxy_parse,
+ 	.build		= nftnl_expr_tproxy_build,
+-	.snprintf	= nftnl_expr_tproxy_snprintf,
++	.snprintf_	= nftnl_expr_tproxy_snprintf,
+ };
+diff --git a/src/expr/tunnel.c b/src/expr/tunnel.c
+index b2b8d72..1ed46d3 100644
+--- a/src/expr/tunnel.c
++++ b/src/expr/tunnel.c
+@@ -173,5 +173,5 @@ struct expr_ops expr_ops_tunnel = {
+ 	.get		= nftnl_expr_tunnel_get,
+ 	.parse		= nftnl_expr_tunnel_parse,
+ 	.build		= nftnl_expr_tunnel_build,
+-	.snprintf	= nftnl_expr_tunnel_snprintf,
++	.snprintf_	= nftnl_expr_tunnel_snprintf,
+ };
+diff --git a/src/expr/xfrm.c b/src/expr/xfrm.c
+index 8fe5438..b6b2772 100644
+--- a/src/expr/xfrm.c
++++ b/src/expr/xfrm.c
+@@ -239,5 +239,5 @@ struct expr_ops expr_ops_xfrm = {
+ 	.get		= nftnl_expr_xfrm_get,
+ 	.parse		= nftnl_expr_xfrm_parse,
+ 	.build		= nftnl_expr_xfrm_build,
+-	.snprintf	= nftnl_expr_xfrm_snprintf,
++	.snprintf_	= nftnl_expr_xfrm_snprintf,
  };
 diff --git a/src/obj/counter.c b/src/obj/counter.c
-index 332bb2b..edeb7be 100644
+index 1baba4e..3710bce 100644
 --- a/src/obj/counter.c
 +++ b/src/obj/counter.c
-@@ -182,6 +182,6 @@ struct obj_ops obj_ops_counter = {
+@@ -145,5 +145,5 @@ struct obj_ops obj_ops_counter = {
  	.get		= nftnl_obj_counter_get,
  	.parse		= nftnl_obj_counter_parse,
  	.build		= nftnl_obj_counter_build,
 -	.snprintf	= nftnl_obj_counter_snprintf,
 +	.snprintf_	= nftnl_obj_counter_snprintf,
- 	.json_parse	= nftnl_obj_counter_json_parse,
  };
 diff --git a/src/obj/ct_helper.c b/src/obj/ct_helper.c
-index 62569fe..69757ff 100644
+index d91f636..2037461 100644
 --- a/src/obj/ct_helper.c
 +++ b/src/obj/ct_helper.c
-@@ -208,6 +208,6 @@ struct obj_ops obj_ops_ct_helper = {
+@@ -166,5 +166,5 @@ struct obj_ops obj_ops_ct_helper = {
  	.get		= nftnl_obj_ct_helper_get,
  	.parse		= nftnl_obj_ct_helper_parse,
  	.build		= nftnl_obj_ct_helper_build,
 -	.snprintf	= nftnl_obj_ct_helper_snprintf,
 +	.snprintf_	= nftnl_obj_ct_helper_snprintf,
- 	.json_parse	= nftnl_obj_quota_json_parse,
+ };
+diff --git a/src/obj/ct_timeout.c b/src/obj/ct_timeout.c
+index e2e9991..a4f2dd2 100644
+--- a/src/obj/ct_timeout.c
++++ b/src/obj/ct_timeout.c
+@@ -330,5 +330,5 @@ struct obj_ops obj_ops_ct_timeout = {
+ 	.get		= nftnl_obj_ct_timeout_get,
+ 	.parse		= nftnl_obj_ct_timeout_parse,
+ 	.build		= nftnl_obj_ct_timeout_build,
+-	.snprintf	= nftnl_obj_ct_timeout_snprintf,
++	.snprintf_	= nftnl_obj_ct_timeout_snprintf,
  };
 diff --git a/src/obj/limit.c b/src/obj/limit.c
-index 7f8bcf7..25018b6 100644
+index 60b0159..538f37a 100644
 --- a/src/obj/limit.c
 +++ b/src/obj/limit.c
-@@ -236,6 +236,6 @@ struct obj_ops obj_ops_limit = {
+@@ -185,5 +185,5 @@ struct obj_ops obj_ops_limit = {
  	.get		= nftnl_obj_limit_get,
  	.parse		= nftnl_obj_limit_parse,
  	.build		= nftnl_obj_limit_build,
 -	.snprintf	= nftnl_obj_limit_snprintf,
 +	.snprintf_	= nftnl_obj_limit_snprintf,
- 	.json_parse	= nftnl_obj_limit_json_parse,
  };
 diff --git a/src/obj/quota.c b/src/obj/quota.c
-index 6d36784..ecaa8b1 100644
+index 1914037..585a088 100644
 --- a/src/obj/quota.c
 +++ b/src/obj/quota.c
-@@ -203,6 +203,6 @@ struct obj_ops obj_ops_quota = {
+@@ -161,5 +161,5 @@ struct obj_ops obj_ops_quota = {
  	.get		= nftnl_obj_quota_get,
  	.parse		= nftnl_obj_quota_parse,
  	.build		= nftnl_obj_quota_build,
 -	.snprintf	= nftnl_obj_quota_snprintf,
 +	.snprintf_	= nftnl_obj_quota_snprintf,
- 	.json_parse	= nftnl_obj_quota_json_parse,
+ };
+diff --git a/src/obj/secmark.c b/src/obj/secmark.c
+index e27b5fa..6241bee 100644
+--- a/src/obj/secmark.c
++++ b/src/obj/secmark.c
+@@ -133,5 +133,5 @@ struct obj_ops obj_ops_secmark = {
+ 	.get		= nftnl_obj_secmark_get,
+ 	.parse		= nftnl_obj_secmark_parse,
+ 	.build		= nftnl_obj_secmark_build,
+-	.snprintf	= nftnl_obj_secmark_snprintf,
++	.snprintf_	= nftnl_obj_secmark_snprintf,
+ };
+diff --git a/src/obj/tunnel.c b/src/obj/tunnel.c
+index 7ffade8..800eb3e 100644
+--- a/src/obj/tunnel.c
++++ b/src/obj/tunnel.c
+@@ -564,5 +564,5 @@ struct obj_ops obj_ops_tunnel = {
+ 	.get		= nftnl_obj_tunnel_get,
+ 	.parse		= nftnl_obj_tunnel_parse,
+ 	.build		= nftnl_obj_tunnel_build,
+-	.snprintf	= nftnl_obj_tunnel_snprintf,
++	.snprintf_	= nftnl_obj_tunnel_snprintf,
  };
 diff --git a/src/object.c b/src/object.c
-index d8278f3..9654b7b 100644
+index 5c8d183..d489cdd 100644
 --- a/src/object.c
 +++ b/src/object.c
-@@ -429,7 +429,7 @@ static int nftnl_obj_export(char *buf, size_t size,
- 		nftnl_buf_u64(&b, type, obj->handle, HANDLE);
- 
- 	if (obj->ops)
--		ret = obj->ops->snprintf(buf + b.len, size - b.len, type,
-+		ret = obj->ops->snprintf_(buf + b.len, size - b.len, type,
- 					 flags, obj);
- 
- 	b.len += ret;
-@@ -450,7 +450,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t size,
+@@ -369,7 +369,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t size,
  	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  
  	if (obj->ops) {
@@ -547,3 +587,6 @@ index d8278f3..9654b7b 100644
  					 obj);
  		SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  	}
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.1.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.3.bb
similarity index 86%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.1.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.3.bb
index 77959a730..00bf88dab 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.1.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.3.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
-PV .= "+git${SRCPV}"
-SRCREV = "d379dfcb6c94dcb93a8f16896572d6e162138e0f"
+
+SRCREV = "d819a832e0214a3bec3679345f542644596a2850"
 SRC_URI = "git://git.netfilter.org/libnftnl \
            file://0001-Move-exports-before-symbol-definition.patch \
            file://0002-avoid-naming-local-function-as-one-of-printf-family.patch \
-- 
2.17.1


