Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2B1FF886D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:01:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8637.1777366872650706643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 02:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HhGa8tm/;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a40b2d268bso9071123e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777366870; x=1777971670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sunC0XEz3c/9aHbxD7hL46V1PmmSKd9GoXDWFQeTpNc=;
        b=HhGa8tm/7+ZO25nD0ri7E1DAt7nkv9FovuhjiCpw/Pv5TmjTjfUnK+auKINhYM6/ZH
         GkyzX5pCdy4dHWe80NQn6ll9KeCucMwCGbv53BU4n5xTzGcIPRB5qk2SvlVzQ5RzSmE/
         /x/l7iR/V2T62spgM/68rsHfsxfGO5eDHNTl7P8soQNMd8zF7DKKaUBQubNFL3FEmUAu
         vj8jAqXvzbDVrZ94GChCwE+60bYPKaVEvv9tlvxbrN5/1/0X0DM+sUe4vwsV0eHgFNX+
         v3kIRaKx5mloYJFjoWkFGHn9JvDn4mYvBVCPAxYZlADP+iAKfS70A1AdHHzMJK/4Ez0l
         laVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366870; x=1777971670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sunC0XEz3c/9aHbxD7hL46V1PmmSKd9GoXDWFQeTpNc=;
        b=nuvv+mlhy0DOcxG65iaFeDsKvj8GI6FKZ42x2uiS0mXQ3wnDcT8hTnG0pNhMNrXjiH
         Y29QBItTkUALZFvm6Zqz+vClWdwdtMl3L/+w7k523OTpIbwyZcMl0FCMHMOXQ3LaXL3N
         q6RmdXqKJqQs6DJGyYmI6rWk5tqgwCeFXWmtnVrAlCh/hhAmPzku/inC5bQ0zHEuBUST
         W8UAsTw4R2ylDEUEomh5gC5akQ9q1GAE+svTNFuZ4Rf4Gfp3G4jW1iRPSqk/QrNmoY/a
         JsiOilxz2lF7bMsZoOXOEID9ebEcdSZ8QZoLmqOVC66zWkbDabXplM1JgbTIUKw9yshq
         iIOg==
X-Gm-Message-State: AOJu0YzLb0mYJQjt6AxPmOky0pIkyBm3GCLK6XxZEwytRTphs+3FC8Lo
	zIdvhgAnUFiDqiwL8fmKpinDA1XG8VPtp5SwYk8NJ9GUBogI1Gc+J6nds3rXeqNNTFKsphCiAK+
	hJ7uu
X-Gm-Gg: AeBDieuFEHIJcL8ERuiH28MPFmxFF6+3wCBpDK6KwKsndywheheSgOi4w0KRizbjB2A
	amZsJAWeiQtdR3oikZeNz8gJ/4qtmhGfH436DBUINqP9ufLGBYwc7JKstwe1ZMOMfAq3Jjfgh2D
	YK0FEg89Ru9XXfBGSbpXTbCx/cQMRUNxjUf0TumvHQaxZvO5aJs4TRv9gRfeKJS0EduPhcuKsB6
	ixx6H58Krch4QT1ak+YzY3MrUTQ4nwn6FFy+prSASPKoVEz9xO1mJHCnWFs0SNjWODGa6YIp773
	bWdwrK0IkYDhUsLkB+gOJ6f9jVUaxoJKtfDRV6xMlghhuaaUA5aQVnHV/08MSJ8wnE0DHsqRare
	OD6pFDaq2gmMvs0hPHP2KYlydBxfE0o0fREEJhJypuuhXY6ecuOdAD9JBnYNAlB57Km0iFpLBCn
	xriEeRRXCRWr8n5RuE6parmZsewxcB6Y50o543t0eQe+i03zEP3AzNNl1zjVTjFNSuJpLRB6Pb
X-Received: by 2002:a05:6512:1253:b0:5a3:ff5a:d6c with SMTP id 2adb3069b0e04-5a74640c500mr918421e87.14.1777366869791;
        Tue, 28 Apr 2026 02:01:09 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462d61f7sm461938e87.35.2026.04.28.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:01:09 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][scarthgap][PATCH 1/2] onig: fix gcc 15 build
Date: Tue, 28 Apr 2026 12:00:52 +0300
Message-ID: <20260428090053.3401574-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126649

With backport from upstream 6.9.10.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...08dee4a01dee60c4cd67f2e2e46484ef50a5.patch | 138 ++++++++++++++++++
 meta-oe/recipes-support/onig/onig_6.9.9.bb    |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch

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


