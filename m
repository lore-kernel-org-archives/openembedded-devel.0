Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EDAFF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 07:34:04 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6068.1777448037801432707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2026 00:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HyzWOSiV;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a01c80c34so120411741fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777448036; x=1778052836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dcvLOmTHCf7D4ajDmMxloO4k+M8kI6uAneMy+g0+YOs=;
        b=HyzWOSiVfXtTgFfqqDHH2ox7mQuCQiQqGC1/CS+RhXyiQMNMX6D4f9jVnEAKzbNP2q
         GZ/cEJM6o0H5w/fabME7eIM3HKCvRyHGLO9XBV1wnRd1nspTCuq31ulKpAea2ZZT4cXJ
         Ui6m9NkOtRs/7q9uZg9raIEG9ktts+0GvJ4p8GPOJyZ/MVU93uFdqnWLrFr6/q9aYCFS
         5yOsheC1OExZgWDmBnP9GcXCRhH3Eh/nyC5osXiv+LVOTYwYS58uebQ+OddLK/8bn2/P
         VnTeHSuhee1YXLC3YwRPe9AucyCaJlR04Gqg1CQdygWwz2mG6Lf7VGlKe9cN+Jz63Hdu
         MW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448036; x=1778052836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcvLOmTHCf7D4ajDmMxloO4k+M8kI6uAneMy+g0+YOs=;
        b=QFLlid7XOmT0s1C20W7/sdnvo+TTl8WrFhAULAT1nesKgda6NCkwFg7+KCWG343aON
         cnZl2sS2pesIPW3qcpxF7gzdcW7gv/C15+UL1jYquUAV/6OW8oLpyhpxfw0WN6d3AZuc
         JmzR+P6LGLiBH6ydyq75+2Nd3S+FAF3mNs5GqkjVBCgDWpSxvngC+hGbmh33cRMjjsF1
         /d0DqKYiLmRHqWxCNIDtDZjWSe6kYGJZVzMvsVka7gqOOjbx3fXvE0i8X3p+5RFRILi0
         oBN7hCaV3JWSUluTNlHihlBSO5c96PtnNsOlkyZXsUIk6YW17tsFfTPo2NgxspyOgbKC
         87Iw==
X-Gm-Message-State: AOJu0YzEIGr31aFYY81fwGCShMrmYQgBVC5wLcdW4FWCnaRhiTxBgwUv
	uGOUfyCdfpXMLkKdnx3PlmW0QZv3FhSezLx5fYQFDTQzKBRMtei7D62x+8DiSti8cVUZxjflgov
	R7Cg1
X-Gm-Gg: AeBDieu5S2/nNiM4TQcIT3Bn1YuKP4aPOGzSR9eBeNe/p+xAcommING/y1e51C6pFd+
	iIvJVil8sv98sa0ducA/onOZVv9KF/gW9Q29GoWAdoiCyqYQTcNo5/51ccYbP1OIuB+vJi7jH7x
	B/VHUkuBYhtAC+UGusWn29pmx+OOCckjEM/uDfbKNbySYYrgeQxWQTDR6Q96HW4KfxEZaMmEitc
	QgjcR9vWwveBXpGYwvH+PcuD3FjN8+DCe1dpp3vavmQs6p+iDXdYndfX21hNk0Zm0o2JfR/0TXJ
	qw/zcyJTBLv9Wexi/JTck+R9lIrrTA+MPvl87upxHi/b31d7R52WopU6D4GPkjNed7YF/lCyuwc
	U1rgVBM4qqr4kXPnwWRSRcsNnXNaX1+C5VMKLcsNdScGRL+bkLeKC1+GL/mkcsdg2QC661RZKWQ
	nTGJMFlhfFsVHx8DV9QGt3aIZoXMwrMtuRvd+QUcKtga/rxJTucn10qCqij+HkfZFWaH+vZW4Ii
	qWruA==
X-Received: by 2002:a05:651c:b0f:b0:38b:f0f0:e3a8 with SMTP id 38308e7fff4ca-39240cc9af4mr23373301fa.3.1777448035340;
        Wed, 29 Apr 2026 00:33:55 -0700 (PDT)
Received: from nuoska.taservs.net (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924f971c94sm2973411fa.18.2026.04.29.00.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:33:55 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [scarthgap][PATCH v2 1/2] onig: fix gcc 15 build
Date: Wed, 29 Apr 2026 10:33:33 +0300
Message-ID: <20260429073334.3587116-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 07:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126665

With backport from upstream 6.9.10.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...08dee4a01dee60c4cd67f2e2e46484ef50a5.patch | 138 ++++++++++++++++++
 meta-oe/recipes-support/onig/onig_6.9.9.bb    |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch

v2: no changes

diff --git a/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch b/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch
new file mode 100644
index 0000000000..f0683c2ebd
--- /dev/null
+++ b/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch
@@ -0,0 +1,138 @@
+From 5f1408dee4a01dee60c4cd67f2e2e46484ef50a5 Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kkosako0@gmail.com>
+Date: Mon, 18 Nov 2024 00:18:12 +0900
+Subject: [PATCH] fix #312: Build failure with GCC 15 (C23)
+
+---
+ src/regparse.c | 44 ++++++++++++++++++++++++++++++++++++--------
+ src/st.h       |  9 +--------
+ 2 files changed, 37 insertions(+), 16 deletions(-)
+
+Upstream-Status: Backport [5f1408dee4a01dee60c4cd67f2e2e46484ef50a5]
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
+diff --git a/src/regparse.c b/src/regparse.c
+index 24bcbaac..9acdd6e2 100644
+--- a/src/regparse.c
++++ b/src/regparse.c
+@@ -793,8 +793,13 @@ onig_print_names(FILE* fp, regex_t* reg)
+ #endif /* ONIG_DEBUG */
+ 
+ static int
+-i_free_name_entry(UChar* key, NameEntry* e, void* arg ARG_UNUSED)
++i_free_name_entry(st_data_t akey, st_data_t ae, st_data_t arg ARG_UNUSED)
+ {
++  UChar* key;
++  NameEntry* e;
++
++  key = (UChar* )akey;
++  e = (NameEntry* )ae;
+   xfree(e->name);
+   if (IS_NOT_NULL(e->back_refs)) xfree(e->back_refs);
+   xfree(key);
+@@ -850,8 +855,14 @@ typedef struct {
+ } INamesArg;
+ 
+ static int
+-i_names(UChar* key ARG_UNUSED, NameEntry* e, INamesArg* arg)
++i_names(st_data_t key ARG_UNUSED, st_data_t ae, st_data_t aarg)
+ {
++  NameEntry* e;
++  INamesArg* arg;
++
++  e = (NameEntry* )ae;
++  arg = (INamesArg* )aarg;
++
+   int r = (*(arg->func))(e->name,
+                          e->name + e->name_len,
+                          e->back_num,
+@@ -883,9 +894,14 @@ onig_foreach_name(regex_t* reg,
+ }
+ 
+ static int
+-i_renumber_name(UChar* key ARG_UNUSED, NameEntry* e, GroupNumMap* map)
++i_renumber_name(st_data_t key ARG_UNUSED, st_data_t ae, st_data_t amap)
+ {
+   int i;
++  NameEntry* e;
++  GroupNumMap* map;
++
++  e = (NameEntry* )ae;
++  map = (GroupNumMap* )amap;
+ 
+   if (e->back_num > 1) {
+     for (i = 0; i < e->back_num; i++) {
+@@ -1374,9 +1390,14 @@ static int CalloutNameIDCounter;
+ #ifdef USE_ST_LIBRARY
+ 
+ static int
+-i_free_callout_name_entry(st_callout_name_key* key, CalloutNameEntry* e,
+-                          void* arg ARG_UNUSED)
++i_free_callout_name_entry(st_data_t akey, st_data_t ae, st_data_t arg ARG_UNUSED)
+ {
++  st_callout_name_key* key;
++  CalloutNameEntry* e;
++
++  key = (st_callout_name_key* )akey;
++  e = (CalloutNameEntry* )ae;
++
+   if (IS_NOT_NULL(e)) {
+     xfree(e->name);
+   }
+@@ -1870,10 +1891,14 @@ typedef intptr_t   CalloutTagVal;
+ #define CALLOUT_TAG_LIST_FLAG_TAG_EXIST     (1<<0)
+ 
+ static int
+-i_callout_callout_list_set(UChar* key, CalloutTagVal e, void* arg)
++i_callout_callout_list_set(st_data_t key ARG_UNUSED, st_data_t ae, st_data_t arg)
+ {
+   int num;
+-  RegexExt* ext = (RegexExt* )arg;
++  CalloutTagVal e;
++  RegexExt* ext;
++
++  e   = (CalloutTagVal )ae;
++  ext = (RegexExt* )arg;
+ 
+   num = (int )e - 1;
+   ext->callout_list[num].flag |= CALLOUT_TAG_LIST_FLAG_TAG_EXIST;
+@@ -1926,8 +1951,11 @@ onig_callout_tag_is_exist_at_callout_num(regex_t* reg, int callout_num)
+ }
+ 
+ static int
+-i_free_callout_tag_entry(UChar* key, CalloutTagVal e, void* arg ARG_UNUSED)
++i_free_callout_tag_entry(st_data_t akey, st_data_t e ARG_UNUSED, st_data_t arg ARG_UNUSED)
+ {
++  UChar* key;
++
++  key = (UChar* )akey;
+   xfree(key);
+   return ST_DELETE;
+ }
+diff --git a/src/st.h b/src/st.h
+index 5efee8bb..70798dc5 100644
+--- a/src/st.h
++++ b/src/st.h
+@@ -34,13 +34,6 @@ enum st_retval {ST_CONTINUE, ST_STOP, ST_DELETE, ST_CHECK};
+ #ifndef _
+ # define _(args) args
+ #endif
+-#ifndef ANYARGS
+-# ifdef __cplusplus
+-#   define ANYARGS ...
+-# else
+-#   define ANYARGS
+-# endif
+-#endif
+ 
+ st_table *st_init_table _((struct st_hash_type *));
+ st_table *st_init_table_with_size _((struct st_hash_type *, int));
+@@ -52,7 +45,7 @@ int st_delete _((st_table *, st_data_t *, st_data_t *));
+ int st_delete_safe _((st_table *, st_data_t *, st_data_t *, st_data_t));
+ int st_insert _((st_table *, st_data_t, st_data_t));
+ int st_lookup _((st_table *, st_data_t, st_data_t *));
+-int st_foreach _((st_table *, int (*)(ANYARGS), st_data_t));
++int st_foreach _((st_table *, int (*)(st_data_t, st_data_t, st_data_t), st_data_t));
+ void st_add_direct _((st_table *, st_data_t, st_data_t));
+ void st_free_table _((st_table *));
+ void st_cleanup_safe _((st_table *, st_data_t));
diff --git a/meta-oe/recipes-support/onig/onig_6.9.9.bb b/meta-oe/recipes-support/onig/onig_6.9.9.bb
index b29437db1e..b545fc7596 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.9.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.9.bb
@@ -11,6 +11,7 @@ SRC_URI = "\
     https://github.com/kkos/oniguruma/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-build-don-t-link-against-host-system-libraries.patch \
     file://0002-build-enable-serial-tests-automake-option-for-ptest.patch \
+    file://5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch \
     file://run-ptest \
 "
 
-- 
2.51.0


