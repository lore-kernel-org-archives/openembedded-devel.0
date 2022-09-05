Return-Path: <sergio.prado@e-labworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC0BECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:28:42 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.23516.1662377318587394085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 04:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e-labworks-com.20210112.gappssmtp.com header.s=20210112
 header.b=fiZKS/BG;
 spf=pass (domain: e-labworks.com, ip: 209.85.218.41,
 mailfrom: sergio.prado@e-labworks.com)
Received: by mail-ej1-f41.google.com with SMTP id fc24so7453157ejc.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=e-labworks-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ZECYvPr1IJfjqYB4OBOlG+x53cr23Alw0GTvAOLsm04=;
        b=fiZKS/BGs2evao5m1zcFCXRB5vo/1lZ72Pq0x73C4TaDaQelAIfeTBTU3PaLOaEqAy
         Mpvd7pg0CaRB0y6cynJEkR7Xjg7pRMo1bXB45QuTdtNDw1Wv/+Tu79Dl4gMey+P3rYHB
         xTdRSUGa0DVkUaCt19iFLIOga5eh/YozxtCih4BxD3ndKyWu2bpSUkXwxgpvYzmss0tm
         U3k6acbz2Q7QLV8Ntxex/jHpkm4J98+DbvrUQgHitC/3NQ2tHd+gmKHYupma2d2PXzzH
         YRZK1rzaTHqrXXm+6B9FsZ5RIXq7ah9Y4oPyJeEXfTu+DQgnOw9ixSRfwBbAZG0mgN1v
         +Zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ZECYvPr1IJfjqYB4OBOlG+x53cr23Alw0GTvAOLsm04=;
        b=ASRb5my6eFCfDmhYs9UlkEc0Il75JiTCIrAZaiaqb71MSTRnAi5fujc2sprS01CW6S
         0umjBNwJ7KBpeRy4RFqOCHwjDgXKa82rTG8DJx1vCv5ijAy1q1uAHizbBiv78vDpmwjV
         ty8nmO3nziVvELkjzAMiwA27PEgSTLFNziQKOUvWe8Z3iuogz149uCUy/9TazCCiDS9Z
         aUnbd61rKmLevpAf3fI0wlWEowkeDBBsFCJ6mpzoax9BaMKfK9LjR2WDBWq5w34bCj7S
         O0aoAxQ2Uu5PYzWIbbVWBRyybTljsDI6XbmdX3V3A1l/nX3zvJEU05SY8UVKJOdaORx2
         kpMQ==
X-Gm-Message-State: ACgBeo36jXYKWTyD5VX7mFMT+Ckjgf7aCctsi7HWvIokHyX53eoWyGII
	kLRo9mJD91g8jVBjbKBIsNlvKQxw0Xa+og==
X-Google-Smtp-Source: 
 AA6agR7TaihIoyXr7W43h8RfyeyvzwaY2jirU3ZCLunphTRlwXV7cuNp45jB+RJp8BkobT5akKdUgQ==
X-Received: by 2002:a17:907:760b:b0:73d:b5bc:feb6 with SMTP id
 jx11-20020a170907760b00b0073db5bcfeb6mr35540853ejc.407.1662377316891;
        Mon, 05 Sep 2022 04:28:36 -0700 (PDT)
Received: from sprado-office.spo.virtua.com.br ([2804:14c:46:297c::32fd])
        by smtp.gmail.com with ESMTPSA id
 x68-20020a50baca000000b0044bfdbd8a33sm6322657ede.88.2022.09.05.04.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 04:28:36 -0700 (PDT)
From: sergio.prado@e-labworks.com
To: openembedded-devel@lists.openembedded.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [meta-oe][kirkstone][PATCH] polkit: refresh patch to fix warning
Date: Mon,  5 Sep 2022 08:28:08 -0300
Message-Id: <20220905112808.2708833-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 11:28:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98665

From: Sergio Prado <sergio.prado@e-labworks.com>

Fix the following warning:

WARNING: polkit-0.119-r0 do_patch: Fuzz detected:

Applying patch 0004-Make-netgroup-support-optional.patch
patching file configure.ac
Hunk #1 succeeded at 117 with fuzz 2 (offset 17 lines).
patching file meson.build
patching file src/polkit/polkitidentity.c
patching file src/polkit/polkitunixnetgroup.c
patching file src/polkitbackend/polkitbackendinteractiveauthority.c
patching file src/polkitbackend/polkitbackendjsauthority.cpp
Hunk #1 succeeded at 1291 (offset -233 lines).
Hunk #2 succeeded at 1306 (offset -233 lines).
patching file test/polkit/polkitidentitytest.c
patching file test/polkit/polkitunixnetgrouptest.c
patching file test/polkitbackend/test-polkitbackendjsauthority.c

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 .../0004-Make-netgroup-support-optional.patch | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
index fa273d4503f3..09be3b728049 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
@@ -1,4 +1,4 @@
-From 7ef2621ab7adcedc099ed39acfb73c6fa835cbc3 Mon Sep 17 00:00:00 2001
+From 501e6df3468f5da05881fc38cf68740e153ab403 Mon Sep 17 00:00:00 2001
 From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
 Date: Sun, 15 May 2022 05:04:10 +0000
 Subject: [PATCH] Make netgroup support optional
@@ -37,12 +37,12 @@ Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
  9 files changed, 43 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 59858df..5a7fc11 100644
+index 18e422300bb7..0f87ea0e8a26 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -100,7 +100,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
- 	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
- AC_SUBST(EXPAT_LIBS)
+@@ -117,7 +117,7 @@ CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+ CC="$PTHREAD_CC"
+ AC_CHECK_FUNCS([pthread_condattr_setclock])
  
 -AC_CHECK_FUNCS(clearenv fdatasync)
 +AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
@@ -50,7 +50,7 @@ index 59858df..5a7fc11 100644
  if test "x$GCC" = "xyes"; then
    LDFLAGS="-Wl,--as-needed $LDFLAGS"
 diff --git a/meson.build b/meson.build
-index 733bbff..d840926 100644
+index 750623179750..2d9d67a23409 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -82,6 +82,7 @@ config_h.set('_GNU_SOURCE', true)
@@ -62,7 +62,7 @@ index 733bbff..d840926 100644
  
  foreach func: check_functions
 diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
-index 3aa1f7f..793f17d 100644
+index 3aa1f7f1c762..793f17d5d1fe 100644
 --- a/src/polkit/polkitidentity.c
 +++ b/src/polkit/polkitidentity.c
 @@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
@@ -105,7 +105,7 @@ index 3aa1f7f..793f17d 100644
    else
      {
 diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
-index 8a2b369..83f8d4a 100644
+index 8a2b36938ac5..83f8d4a13efd 100644
 --- a/src/polkit/polkitunixnetgroup.c
 +++ b/src/polkit/polkitunixnetgroup.c
 @@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
@@ -119,7 +119,7 @@ index 8a2b369..83f8d4a 100644
    return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
                                         "name", name,
 diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
-index 056d9a8..36c2f3d 100644
+index 056d9a8f27f8..36c2f3dc1a79 100644
 --- a/src/polkitbackend/polkitbackendinteractiveauthority.c
 +++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
 @@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
@@ -164,10 +164,10 @@ index 056d9a8..36c2f3d 100644
  }
  
 diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index 5027815..bcb040c 100644
+index 11e91c045da1..9ee0391b8c70 100644
 --- a/src/polkitbackend/polkitbackendjsauthority.cpp
 +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1524,6 +1524,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1291,6 +1291,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
  
@@ -175,7 +175,7 @@ index 5027815..bcb040c 100644
    JS::RootedString usrstr (authority->priv->cx);
    usrstr = args[0].toString();
    user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1538,6 +1539,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1305,6 +1306,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
      {
        is_in_netgroup =  true;
      }
@@ -184,7 +184,7 @@ index 5027815..bcb040c 100644
    ret = true;
  
 diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
-index e91967b..2635c4c 100644
+index e91967bec5b9..2635c4c4c64b 100644
 --- a/test/polkit/polkitidentitytest.c
 +++ b/test/polkit/polkitidentitytest.c
 @@ -145,11 +145,15 @@ struct ComparisonTestData comparison_test_data [] = {
@@ -219,7 +219,7 @@ index e91967b..2635c4c 100644
    add_comparison_tests ();
  
 diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
-index 3701ba1..e1d211e 100644
+index 3701ba1671b7..e1d211e47634 100644
 --- a/test/polkit/polkitunixnetgrouptest.c
 +++ b/test/polkit/polkitunixnetgrouptest.c
 @@ -69,7 +69,9 @@ int
@@ -233,7 +233,7 @@ index 3701ba1..e1d211e 100644
    return g_test_run ();
  }
 diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
-index f97e0e0..fc52149 100644
+index 2103b174d58d..b187a2ffee3e 100644
 --- a/test/polkitbackend/test-polkitbackendjsauthority.c
 +++ b/test/polkitbackend/test-polkitbackendjsauthority.c
 @@ -137,12 +137,14 @@ test_get_admin_identities (void)
-- 
2.25.1


