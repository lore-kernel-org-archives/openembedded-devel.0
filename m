Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AED1C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 19:17:52 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.1210.1708024663555116658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 11:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=auCmSnZX;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5639c8cc449so1643366a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 11:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708024661; x=1708629461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gugH4JyU976ya1FJB0PpV9jtyZM+Xdgt21mUC1q8woo=;
        b=auCmSnZX0zC6Q7C5xZ6Pwz3zW6P9+LLqq0yk8nW3l2B7ZhLzbblPt2RHGP2obf89QD
         m3Wf2uD5rRByStCUcA6EXIpq9x/Fhap0o5S4uTyv+90EIMQJ2MfjBtp9PJUP5ZszSPvX
         DMXey6CPQpbmeXUCv8s6DvydIUpDZecEyw4YeWw8+19rwyluFtLaUQDwFHPVvvBmNlSd
         +NxzY5v5qLvEe1Zyqavgpgi5Gi0wvcvho0j6T4g6HW5Eeh424VChxUbGAQAKCl/bmUS3
         gxGXsEhgquc4Fs+WgJC2DKaPVSkXs0CMxlH8hfLcvP/IGOmqfqZ7UqkJ5dYeQPfAy/lM
         /ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708024661; x=1708629461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gugH4JyU976ya1FJB0PpV9jtyZM+Xdgt21mUC1q8woo=;
        b=f5rNjt2XoVVdVI72URtQ9iYd4Pa1aHz7cuxC+TdNWajrie0TKX/xxz7DLoZpKKHOZ4
         U9GHJ/B5iRkt6ENAlEo5m/JgJ2Qw/2RMXksKdwr56QxeEQwrL5SDnfYV0RhMDjG71E0b
         vyNe5vEfLKIkwZI1zH+5YRVzMWGz5ysY/DCgNcKQiQnOgZ8TcDJf4E0dok5KqCWam0CD
         BNwQk6EJTSuXp/U0CANogzW9hbIflCNdtjxWDjnfReNcP8mKG9lBD5AX1bbJYH28gGx0
         C6WgUY7Gjt3F1Wgo1BefjoIiq27eLWQe1H4r0rQxAk9f/QthqxDk82nyxVGndOsAhpzM
         ZmAA==
X-Gm-Message-State: AOJu0Yze81X+Y5rBSPvFcA11DC5J+L4sPZXnuzzqoGwqQQfVlHT9FQ9Z
	mRxaBOv32olsAWB95p3Z6eQ6VVu67kP39GcJoZ+J7mx7KrlAneBW/osgQeI9
X-Google-Smtp-Source: AGHT+IFZUJAK7KAO2ClD181fmhhYjYawnNF7kgIEYfXKrgnP0ZLjBON8fQqBHv7dd41My4MPs7UXDg==
X-Received: by 2002:a50:ef0c:0:b0:55f:39d3:6d5e with SMTP id m12-20020a50ef0c000000b0055f39d36d5emr1675232eds.39.1708024661154;
        Thu, 15 Feb 2024 11:17:41 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id z9-20020aa7c649000000b00563819d224esm820920edr.21.2024.02.15.11.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 11:17:40 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH v3 2/2] libusbgx: uprev to the latest commit
Date: Thu, 15 Feb 2024 20:17:00 +0100
Message-ID: <20240215191700.213060-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240215191700.213060-1-max.oss.09@gmail.com>
References: <20240215191700.213060-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 19:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108759

From: Max Krummenacher <max.krummenacher@toradex.com>

Uprev libusbgx to ec0b01c to get following fixes:
```
ec0b01c Merge pull request #83 from mgrzeschik/uac2-controls
cbf1750 uac2: add additional configuration controls
81d7c05 load libcomposite kernel module
caad244 Fix: Memory leak config label
51abbfd Automake: fix distclean of tests
3cc5af7 Added printer function header to installed headers
adc45af Added missing extern C closing brace
```

Refresh 0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...-overflow-in-usbg_f_foo_attr_val-pro.patch | 34 +++++++++----------
 .../recipes-support/libusbgx/libusbgx_git.bb  |  2 +-
 2 files changed, 18 insertions(+), 18 deletions(-)

V2:
- added the changed patch file to commit

V3:
- really added the changed patch file to commit, this is not my day

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch b/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
index 1ab3494e1..24a2760d1 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
@@ -1,4 +1,4 @@
-From fc7855891c66599487265701294963bb0772bb80 Mon Sep 17 00:00:00 2001
+From 421b366cafdf954b7e1cd2bbb78b55e04d73c082 Mon Sep 17 00:00:00 2001
 From: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
 Date: Mon, 28 Nov 2022 08:29:54 +0100
 Subject: [PATCH] fix: stack-buffer-overflow in usbg_f_foo_attr_val processing.
@@ -386,11 +386,11 @@ index b0409f1..06cee30 100644
  
  #ifdef __cplusplus
 diff --git a/include/usbg/function/uac2.h b/include/usbg/function/uac2.h
-index c1bbb14..1ea55dc 100644
+index 6fc4d24..80918ef 100644
 --- a/include/usbg/function/uac2.h
 +++ b/include/usbg/function/uac2.h
-@@ -53,9 +53,6 @@ union usbg_f_uac2_attr_val {
- 	int p_ssize;
+@@ -110,9 +110,6 @@ union usbg_f_uac2_attr_val {
+ 	const char * function_name;
  };
  
 -#define USBG_F_UAC2_INT_TO_ATTR_VAL(WHAT)			\
@@ -399,7 +399,7 @@ index c1bbb14..1ea55dc 100644
  /**
   * @brief Cast from generic function to uac2 function
   * @param[in] f function to be converted to uac2 funciton.
-@@ -115,7 +112,7 @@ int usbg_f_uac2_get_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
+@@ -172,7 +169,7 @@ int usbg_f_uac2_get_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
   * @return 0 on success usbg_error if error occurred.
   */
  int usbg_f_uac2_set_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
@@ -408,7 +408,7 @@ index c1bbb14..1ea55dc 100644
  
  /**
   * @brief Get the capture channel mask of UAC2 adapter
-@@ -137,8 +134,8 @@ static inline int usbg_f_uac2_get_c_chmask(usbg_f_uac2 *af, int *c_chmask)
+@@ -194,8 +191,8 @@ static inline int usbg_f_uac2_get_c_chmask(usbg_f_uac2 *af, int *c_chmask)
   */
  static inline int usbg_f_uac2_set_c_chmask(usbg_f_uac2 *af, int c_chmask)
  {
@@ -419,7 +419,7 @@ index c1bbb14..1ea55dc 100644
  }
  
  /**
-@@ -161,8 +158,8 @@ static inline int usbg_f_uac2_get_c_srate(usbg_f_uac2 *af, int *c_srate)
+@@ -218,8 +215,8 @@ static inline int usbg_f_uac2_get_c_srate(usbg_f_uac2 *af, int *c_srate)
   */
  static inline int usbg_f_uac2_set_c_srate(usbg_f_uac2 *af, int c_srate)
  {
@@ -430,7 +430,7 @@ index c1bbb14..1ea55dc 100644
  }
  
  /**
-@@ -185,8 +182,8 @@ static inline int usbg_f_uac2_get_c_ssize(usbg_f_uac2 *af, int *c_ssize)
+@@ -242,8 +239,8 @@ static inline int usbg_f_uac2_get_c_ssize(usbg_f_uac2 *af, int *c_ssize)
   */
  static inline int usbg_f_uac2_set_c_ssize(usbg_f_uac2 *af, int c_ssize)
  {
@@ -441,7 +441,7 @@ index c1bbb14..1ea55dc 100644
  }
  
  /**
-@@ -209,8 +206,8 @@ static inline int usbg_f_uac2_get_p_chmask(usbg_f_uac2 *af, int *p_chmask)
+@@ -266,8 +263,8 @@ static inline int usbg_f_uac2_get_p_chmask(usbg_f_uac2 *af, int *p_chmask)
   */
  static inline int usbg_f_uac2_set_p_chmask(usbg_f_uac2 *af, int p_chmask)
  {
@@ -452,7 +452,7 @@ index c1bbb14..1ea55dc 100644
  }
  
  /**
-@@ -233,8 +230,8 @@ static inline int usbg_f_uac2_get_p_srate(usbg_f_uac2 *af, int *p_srate)
+@@ -290,8 +287,8 @@ static inline int usbg_f_uac2_get_p_srate(usbg_f_uac2 *af, int *p_srate)
   */
  static inline int usbg_f_uac2_set_p_srate(usbg_f_uac2 *af, int p_srate)
  {
@@ -463,7 +463,7 @@ index c1bbb14..1ea55dc 100644
  }
  
  /**
-@@ -257,8 +254,8 @@ static inline int usbg_f_uac2_get_p_ssize(usbg_f_uac2 *af, int *p_ssize)
+@@ -314,8 +311,8 @@ static inline int usbg_f_uac2_get_p_ssize(usbg_f_uac2 *af, int *p_ssize)
   */
  static inline int usbg_f_uac2_set_p_ssize(usbg_f_uac2 *af, int p_ssize)
  {
@@ -536,7 +536,7 @@ index 634209f..ac97bc8 100644
  libusbgx_la_CFLAGS = $(LIBCONFIG_CFLAGS)
  AM_CPPFLAGS=-I$(top_srcdir)/include/ -I$(top_builddir)/include/usbg
 diff --git a/src/function/ether.c b/src/function/ether.c
-index ab91af9..d7dcd5d 100644
+index a9eaf33..a1d20f1 100644
 --- a/src/function/ether.c
 +++ b/src/function/ether.c
 @@ -124,7 +124,7 @@ static int ether_libconfig_import(struct usbg_function *f,
@@ -702,10 +702,10 @@ index 519b012..5cdd814 100644
  
  int usbg_f_ms_get_lun_file_s(usbg_f_ms *mf, int lun_id,
 diff --git a/src/function/uac2.c b/src/function/uac2.c
-index f2c1a49..38a9b0f 100644
+index 9ca8b66..fc06c1d 100644
 --- a/src/function/uac2.c
 +++ b/src/function/uac2.c
-@@ -89,7 +89,7 @@ static int uac2_libconfig_import(struct usbg_function *f,
+@@ -125,7 +125,7 @@ static int uac2_libconfig_import(struct usbg_function *f,
  		if (ret < 0)
  			break;
  
@@ -714,7 +714,7 @@ index f2c1a49..38a9b0f 100644
  		if (ret)
  			break;
  	}
-@@ -174,8 +174,8 @@ int usbg_f_uac2_set_attrs(usbg_f_uac2 *af,
+@@ -210,8 +210,8 @@ int usbg_f_uac2_set_attrs(usbg_f_uac2 *af,
  
  	for (i = USBG_F_UAC2_ATTR_MIN; i < USBG_F_UAC2_ATTR_MAX; ++i) {
  		ret = usbg_f_uac2_set_attr_val(af, i,
@@ -725,7 +725,7 @@ index f2c1a49..38a9b0f 100644
  						+ uac2_attr[i].offset));
  		if (ret)
  			break;
-@@ -193,8 +193,8 @@ int usbg_f_uac2_get_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
+@@ -229,8 +229,8 @@ int usbg_f_uac2_get_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
  }
  
  int usbg_f_uac2_set_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
@@ -792,5 +792,5 @@ index 5f7f4e5..7234649 100644
  	char str_addr[USBG_MAX_STR_LENGTH];
  
 -- 
-2.25.1
+2.42.0
 
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 484110561..a20ff4eea 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 PV = "0.2.0+git"
-SRCREV = "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
+SRCREV = "ec0b01c03fdc7893997b7b32ec1c12c6103f62f3"
 SRCBRANCH = "master"
 SRC_URI = " \
     git://github.com/libusbgx/libusbgx.git;branch=${SRCBRANCH};protocol=https \
-- 
2.42.0


