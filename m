Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7B1CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 08:40:44 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.59969.1756197642639688647
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 01:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TPhhviJk;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb78fb04cso736712966b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756197641; x=1756802441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVZIEDq8KWIq8yb7dZOp7/Fpjjee+PUqvgZc1cWj0rY=;
        b=TPhhviJkEXNh5aEBM67XKXPbH8ARzmaaUfO9mDO6uaUDe/3Rf3bfDaRDyEFSU4rwbZ
         3BxLVFsIaLgBopD9oC0mO8QsmUGNi8ibUCTvJ7fzlLfk0H1ObJPe7BmmgycBtoRYDVL1
         V3XK5xWVWSAgcCnfAX59DyYt2rb8Xjgtr7xxtHcJIXo37+WmFBw997spsvk3p7MyfsrN
         WmshYEfn81Mwq1sSJXLVYvBKL4omm9PT5kAYbvKKweSxtPVkgdObEapvS8d72Cy2Yi64
         ZSDeGxfPWBSUwlvU4bXpz30L0RdU9FgAtrtzHuty+ZqH6U3FWFuimTNkbB+jWvj4erVh
         B7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756197641; x=1756802441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVZIEDq8KWIq8yb7dZOp7/Fpjjee+PUqvgZc1cWj0rY=;
        b=NpEFnOU0iBdC6P+EwOJHH1HV58FrgxSnHbnB3DwWHKm1ChL96Yo0X5DwhQ69zTGKjO
         Oai8a94Syh05uDI6EWGzS2yr+7xiJC7f3PbFaCLrg7dShZ2o3QEELNm28U2tEP6s01zF
         AT5G+uw7eZMGPvBqnR8S6X4H5scgyFxj2VukQJuuxaTf4IaST8/co/LHr1JdWG7OJ4NX
         eX/DoBykTV9ymbVS77uRVscWImxL70lpfbNe4Mq4TqM1Y3deJNOUVKLcNb+qachVR2pQ
         Rp506SweDwXRu0neo6E84PfzeAyPYGcuuYg3w/90UziQkrpJcv5/NuUUnxPmcOr/ozeU
         8ZVQ==
X-Gm-Message-State: AOJu0YzZeHdsey5Q+e+hFYN+ePnBN+7jJwJKIW8Vzkik8S8Ar6vymUSN
	HXrsLhCcZm5DwKBJePgk7UQxE5SUOKVDXWIdFoLFW6C0j45u865KrBFOQ+/PetaX
X-Gm-Gg: ASbGncvlXlPyiGs7PSiCR0Ajau5foa+7ONQWZZIZQZhzhlTG6ezBUlDSsHH5UkOzkUm
	x6DAtIkLf2iTdNi9RA+KWzlE9ncvYJ23CjaDeiBOpUHkI3xu9HP7aettqQgNkG5WXO41nnn09oO
	Fi7iIKwp3PafOvA+/ubrWGemm0JYngeKgCfCeiPq5WEPb5HUBqcQsOnVGspUS2cBOb0JXhaC/76
	A7SR+ZlcDlHCsUXiwwO7Vw6u9+a7J646DzN6RYz7K8KuX5Z3cXpMc9qDbI+ZKEB3t1WE1bV47DQ
	oXGeSNUrvdOPF6zrQoEjdlkbJhepGaP5YaVn9BF/sQZDB/OW5bkOJGf00P3aO+XTgh8bL11HRuq
	YMO/SJfn6jtXPxpg1j0ci+m2abkx+waeoPzM6ybsidfQUnIOAhA==
X-Google-Smtp-Source: AGHT+IFWYeFClAxWD6e3oLPJbEOMypKjBL6dwLx3oPJ7y1VoHlC4m23fgclkRvC7hGHB5trHbHK9eA==
X-Received: by 2002:a17:907:940a:b0:ae8:4776:fbb1 with SMTP id a640c23a62f3a-afe28fd3a7dmr1610130066b.11.1756197640516;
        Tue, 26 Aug 2025 01:40:40 -0700 (PDT)
Received: from GEO-W5CG4492JHD.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7c2c7820sm411903066b.64.2025.08.26.01.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 01:40:40 -0700 (PDT)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [meta-oe][PATCH] libusbgx: upgrade to 0.3.0
Date: Tue, 26 Aug 2025 10:40:26 +0200
Message-ID: <20250826084026.133710-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 08:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119112

libusbgx version 0.3.0 has been released on 27/09/2024 [1].

Update recipe version to point to `libusbgx-v0.3.0` tag. Drop one patch as it
is already included in upstream, and refresh pending patch to match upstream.

Link: [1]: https://github.com/linux-usb-gadgets/libusbgx/releases/tag/libusbgx-v0.3.0
Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...-overflow-in-usbg_f_foo_attr_val-pro.patch | 129 +++++++++---------
 ...erface-name-for-NCM-Feature-Descript.patch |  52 -------
 .../recipes-support/libusbgx/libusbgx_git.bb  |   5 +-
 3 files changed, 70 insertions(+), 116 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch b/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
index 24a2760d11..7d535f42e3 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
@@ -1,4 +1,4 @@
-From 421b366cafdf954b7e1cd2bbb78b55e04d73c082 Mon Sep 17 00:00:00 2001
+From 3d785ec88d223800dc71a00fb699de34b4b6c883 Mon Sep 17 00:00:00 2001
 From: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
 Date: Mon, 28 Nov 2022 08:29:54 +0100
 Subject: [PATCH] fix: stack-buffer-overflow in usbg_f_foo_attr_val processing.
@@ -11,19 +11,18 @@ Signed-off-by: Ming Liu <liu.ming50@gmail.com>
 ---
  include/usbg/function/hid.h  | 28 ++++++++++++----------------
  include/usbg/function/midi.h | 35 +++++++++++++----------------------
- include/usbg/function/ms.h   | 30 +++++++++++-------------------
+ include/usbg/function/ms.h   | 34 +++++++++++++---------------------
  include/usbg/function/net.h  | 34 ++++++++++++++--------------------
  include/usbg/function/uac2.h | 29 +++++++++++++----------------
  include/usbg/usbg_internal.h | 10 +++++-----
- src/Makefile.am              |  2 +-
  src/function/ether.c         | 10 +++++-----
  src/function/hid.c           | 12 ++++++------
  src/function/midi.c          | 10 +++++-----
  src/function/ms.c            | 10 +++++-----
  src/function/uac2.c          | 10 +++++-----
- src/function/uvc.c           | 10 +++++-----
+ src/function/uvc.c           | 12 ++++++------
  src/usbg_common.c            |  2 +-
- 14 files changed, 101 insertions(+), 131 deletions(-)
+ 13 files changed, 103 insertions(+), 133 deletions(-)
 
 diff --git a/include/usbg/function/hid.h b/include/usbg/function/hid.h
 index 3463140..3b3907b 100644
@@ -202,11 +201,11 @@ index 39df047..b9d9d4f 100644
  
  #ifdef __cplusplus
 diff --git a/include/usbg/function/ms.h b/include/usbg/function/ms.h
-index 780464c..f52eb78 100644
+index 0715d38..b154aa4 100644
 --- a/include/usbg/function/ms.h
 +++ b/include/usbg/function/ms.h
-@@ -56,14 +56,6 @@ union usbg_f_ms_lun_attr_val {
- 	const char *file;
+@@ -59,14 +59,6 @@ union usbg_f_ms_lun_attr_val {
+ 	const char *inquiry_string;
  };
  
 -#define USBG_F_MS_LUN_BOOL_TO_ATTR_VAL(WHAT)		\
@@ -220,7 +219,7 @@ index 780464c..f52eb78 100644
  /**
   * @brief Cast from generic function to mass storage function
   * @param[in] f function to be converted to ms funciton.
-@@ -157,7 +149,7 @@ int usbg_f_ms_get_lun_attr_val(usbg_f_ms *mf, int lun_id,
+@@ -162,7 +154,7 @@ int usbg_f_ms_get_lun_attr_val(usbg_f_ms *mf, int lun_id,
   */
  int usbg_f_ms_set_lun_attr_val(usbg_f_ms *mf, int lun_id,
  			       enum usbg_f_ms_lun_attr lattr,
@@ -229,7 +228,7 @@ index 780464c..f52eb78 100644
  
  /**
   * @brief Get the value which determines if lun is visible as a cdrom
-@@ -183,8 +175,8 @@ static inline int usbg_f_ms_get_lun_cdrom(usbg_f_ms *mf, int lun_id,
+@@ -188,8 +180,8 @@ static inline int usbg_f_ms_get_lun_cdrom(usbg_f_ms *mf, int lun_id,
  static inline int usbg_f_ms_set_lun_cdrom(usbg_f_ms *mf, int lun_id,
  					  bool cdrom)
  {
@@ -240,7 +239,7 @@ index 780464c..f52eb78 100644
  }
  
  /**
-@@ -209,8 +201,8 @@ static inline int usbg_f_ms_get_lun_ro(usbg_f_ms *mf, int lun_id, bool *ro)
+@@ -214,8 +206,8 @@ static inline int usbg_f_ms_get_lun_ro(usbg_f_ms *mf, int lun_id, bool *ro)
   */
  static inline int usbg_f_ms_set_lun_ro(usbg_f_ms *mf, int lun_id, bool ro)
  {
@@ -251,7 +250,7 @@ index 780464c..f52eb78 100644
  }
  
  /**
-@@ -239,8 +231,8 @@ static inline int usbg_f_ms_get_lun_nofua(usbg_f_ms *mf, int lun_id,
+@@ -244,8 +236,8 @@ static inline int usbg_f_ms_get_lun_nofua(usbg_f_ms *mf, int lun_id,
  static inline int usbg_f_ms_set_lun_nofua(usbg_f_ms *mf, int lun_id,
  				bool nofua)
  {
@@ -262,7 +261,7 @@ index 780464c..f52eb78 100644
  }
  
  /**
-@@ -267,8 +259,8 @@ static inline int usbg_f_ms_get_lun_removable(usbg_f_ms *mf, int lun_id,
+@@ -272,8 +264,8 @@ static inline int usbg_f_ms_get_lun_removable(usbg_f_ms *mf, int lun_id,
  static inline int usbg_f_ms_set_lun_removable(usbg_f_ms *mf, int lun_id,
  				bool removable)
  {
@@ -273,7 +272,7 @@ index 780464c..f52eb78 100644
  }
  
  /**
-@@ -313,8 +305,8 @@ int usbg_f_ms_get_lun_file_s(usbg_f_ms *mf, int lun_id,
+@@ -318,8 +310,8 @@ int usbg_f_ms_get_lun_file_s(usbg_f_ms *mf, int lun_id,
  static inline int usbg_f_ms_set_lun_file(usbg_f_ms *mf, int lun_id,
  			   const char *file)
  {
@@ -283,9 +282,20 @@ index 780464c..f52eb78 100644
 +	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_FILE, &val);
  }
  
+ /**
+@@ -349,8 +341,8 @@ static inline int usbg_f_ms_get_lun_inquiry_string(usbg_f_ms *mf, int lun_id,
+ static inline int usbg_f_ms_set_lun_inquiry_string(usbg_f_ms *mf, int lun_id,
+ 			   const char *inquiry_string)
+ {
+-	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_INQUIRY_STRING,
+-					  USBG_F_MS_LUN_CCHAR_PTR_TO_ATTR_VAL(inquiry_string));
++	union usbg_f_ms_lun_attr_val val = {.inquiry_string = inquiry_string};
++	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_INQUIRY_STRING, &val);
+ }
+ 
  /**
 diff --git a/include/usbg/function/net.h b/include/usbg/function/net.h
-index b0409f1..06cee30 100644
+index ee33a4d..3d8a77e 100644
 --- a/include/usbg/function/net.h
 +++ b/include/usbg/function/net.h
 @@ -56,12 +56,6 @@ union usbg_f_net_attr_val {
@@ -341,9 +351,9 @@ index b0409f1..06cee30 100644
  }
  
  /**
-@@ -226,8 +220,8 @@ static inline int usbg_f_net_get_qmult(usbg_f_net *nf, int *qmult)
+@@ -226,8 +220,8 @@ static inline int usbg_f_net_get_qmult(usbg_f_net *nf, unsigned int *qmult)
   */
- static inline int usbg_f_net_set_qmult(usbg_f_net *nf, int qmult)
+ static inline int usbg_f_net_set_qmult(usbg_f_net *nf, unsigned int qmult)
  {
 -	return usbg_f_net_set_attr_val(nf, USBG_F_NET_QMULT,
 -				       USBG_F_NET_INT_TO_ATTR_VAL(qmult));
@@ -386,10 +396,10 @@ index b0409f1..06cee30 100644
  
  #ifdef __cplusplus
 diff --git a/include/usbg/function/uac2.h b/include/usbg/function/uac2.h
-index 6fc4d24..80918ef 100644
+index 09accdc..1f9085b 100644
 --- a/include/usbg/function/uac2.h
 +++ b/include/usbg/function/uac2.h
-@@ -110,9 +110,6 @@ union usbg_f_uac2_attr_val {
+@@ -112,9 +112,6 @@ union usbg_f_uac2_attr_val {
  	const char * function_name;
  };
  
@@ -399,7 +409,7 @@ index 6fc4d24..80918ef 100644
  /**
   * @brief Cast from generic function to uac2 function
   * @param[in] f function to be converted to uac2 funciton.
-@@ -172,7 +169,7 @@ int usbg_f_uac2_get_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
+@@ -174,7 +171,7 @@ int usbg_f_uac2_get_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
   * @return 0 on success usbg_error if error occurred.
   */
  int usbg_f_uac2_set_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
@@ -408,7 +418,7 @@ index 6fc4d24..80918ef 100644
  
  /**
   * @brief Get the capture channel mask of UAC2 adapter
-@@ -194,8 +191,8 @@ static inline int usbg_f_uac2_get_c_chmask(usbg_f_uac2 *af, int *c_chmask)
+@@ -196,8 +193,8 @@ static inline int usbg_f_uac2_get_c_chmask(usbg_f_uac2 *af, int *c_chmask)
   */
  static inline int usbg_f_uac2_set_c_chmask(usbg_f_uac2 *af, int c_chmask)
  {
@@ -419,7 +429,7 @@ index 6fc4d24..80918ef 100644
  }
  
  /**
-@@ -218,8 +215,8 @@ static inline int usbg_f_uac2_get_c_srate(usbg_f_uac2 *af, int *c_srate)
+@@ -220,8 +217,8 @@ static inline int usbg_f_uac2_get_c_srate(usbg_f_uac2 *af, int *c_srate)
   */
  static inline int usbg_f_uac2_set_c_srate(usbg_f_uac2 *af, int c_srate)
  {
@@ -430,7 +440,7 @@ index 6fc4d24..80918ef 100644
  }
  
  /**
-@@ -242,8 +239,8 @@ static inline int usbg_f_uac2_get_c_ssize(usbg_f_uac2 *af, int *c_ssize)
+@@ -244,8 +241,8 @@ static inline int usbg_f_uac2_get_c_ssize(usbg_f_uac2 *af, int *c_ssize)
   */
  static inline int usbg_f_uac2_set_c_ssize(usbg_f_uac2 *af, int c_ssize)
  {
@@ -441,7 +451,7 @@ index 6fc4d24..80918ef 100644
  }
  
  /**
-@@ -266,8 +263,8 @@ static inline int usbg_f_uac2_get_p_chmask(usbg_f_uac2 *af, int *p_chmask)
+@@ -268,8 +265,8 @@ static inline int usbg_f_uac2_get_p_chmask(usbg_f_uac2 *af, int *p_chmask)
   */
  static inline int usbg_f_uac2_set_p_chmask(usbg_f_uac2 *af, int p_chmask)
  {
@@ -452,7 +462,7 @@ index 6fc4d24..80918ef 100644
  }
  
  /**
-@@ -290,8 +287,8 @@ static inline int usbg_f_uac2_get_p_srate(usbg_f_uac2 *af, int *p_srate)
+@@ -292,8 +289,8 @@ static inline int usbg_f_uac2_get_p_srate(usbg_f_uac2 *af, int *p_srate)
   */
  static inline int usbg_f_uac2_set_p_srate(usbg_f_uac2 *af, int p_srate)
  {
@@ -463,7 +473,7 @@ index 6fc4d24..80918ef 100644
  }
  
  /**
-@@ -314,8 +311,8 @@ static inline int usbg_f_uac2_get_p_ssize(usbg_f_uac2 *af, int *p_ssize)
+@@ -316,8 +313,8 @@ static inline int usbg_f_uac2_get_p_ssize(usbg_f_uac2 *af, int *p_ssize)
   */
  static inline int usbg_f_uac2_set_p_ssize(usbg_f_uac2 *af, int p_ssize)
  {
@@ -475,10 +485,10 @@ index 6fc4d24..80918ef 100644
  
  #ifdef __cplusplus
 diff --git a/include/usbg/usbg_internal.h b/include/usbg/usbg_internal.h
-index 1d8dfe2..d6a3e3a 100644
+index 0b86d11..7025e89 100644
 --- a/include/usbg/usbg_internal.h
 +++ b/include/usbg/usbg_internal.h
-@@ -322,7 +322,7 @@ void usbg_cleanup_function(struct usbg_function *f);
+@@ -325,7 +325,7 @@ void usbg_cleanup_function(struct usbg_function *f);
  	}
  
  typedef int (*usbg_attr_get_func)(const char *, const char *, const char *, void *);
@@ -487,7 +497,7 @@ index 1d8dfe2..d6a3e3a 100644
  
  static inline int usbg_get_dec(const char *path, const char *name,
  			   const char *attr, void *val)
-@@ -331,7 +331,7 @@ static inline int usbg_get_dec(const char *path, const char *name,
+@@ -334,7 +334,7 @@ static inline int usbg_get_dec(const char *path, const char *name,
  }
  
  static inline int usbg_set_dec(const char *path, const char *name,
@@ -496,7 +506,7 @@ index 1d8dfe2..d6a3e3a 100644
  {
  	return usbg_write_dec(path, name, attr, *((int *)val));
  }
-@@ -343,7 +343,7 @@ static inline int usbg_get_bool(const char *path, const char *name,
+@@ -346,7 +346,7 @@ static inline int usbg_get_bool(const char *path, const char *name,
  }
  
  static inline int usbg_set_bool(const char *path, const char *name,
@@ -505,7 +515,7 @@ index 1d8dfe2..d6a3e3a 100644
  {
  	return usbg_write_bool(path, name, attr, *((bool *)val));
  }
-@@ -355,7 +355,7 @@ static inline int usbg_get_string(const char *path, const char *name,
+@@ -358,7 +358,7 @@ static inline int usbg_get_string(const char *path, const char *name,
  }
  
  static inline int usbg_set_string(const char *path, const char *name,
@@ -514,7 +524,7 @@ index 1d8dfe2..d6a3e3a 100644
  {
  	return usbg_write_string(path, name, attr, *(char **)val);
  }
-@@ -364,7 +364,7 @@ int usbg_get_ether_addr(const char *path, const char *name, const char *attr,
+@@ -367,7 +367,7 @@ int usbg_get_ether_addr(const char *path, const char *name, const char *attr,
  			void *val);
  
  int usbg_set_ether_addr(const char *path, const char *name, const char *attr,
@@ -523,20 +533,8 @@ index 1d8dfe2..d6a3e3a 100644
  
  int usbg_get_dev(const char *path, const char *name, const char *attr,
  		 void *val);
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 634209f..ac97bc8 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -7,6 +7,6 @@ else
- libusbgx_la_SOURCES += usbg_schemes_none.c
- endif
- libusbgx_la_LDFLAGS = $(LIBCONFIG_LIBS)
--libusbgx_la_LDFLAGS += -version-info 2:0:0
-+libusbgx_la_LDFLAGS += -version-info 3:0:0
- libusbgx_la_CFLAGS = $(LIBCONFIG_CFLAGS)
- AM_CPPFLAGS=-I$(top_srcdir)/include/ -I$(top_builddir)/include/usbg
 diff --git a/src/function/ether.c b/src/function/ether.c
-index a9eaf33..a1d20f1 100644
+index 8745eec..7e6d146 100644
 --- a/src/function/ether.c
 +++ b/src/function/ether.c
 @@ -124,7 +124,7 @@ static int ether_libconfig_import(struct usbg_function *f,
@@ -575,7 +573,7 @@ index a9eaf33..a1d20f1 100644
  
  int usbg_f_net_get_ifname_s(usbg_f_net *nf, char *buf, int len)
 diff --git a/src/function/hid.c b/src/function/hid.c
-index 4d075cf..895c2c6 100644
+index 024cbc2..909605b 100644
 --- a/src/function/hid.c
 +++ b/src/function/hid.c
 @@ -69,9 +69,9 @@ static int hid_get_report(const char *path, const char *name, const char *attr,
@@ -623,7 +621,7 @@ index 4d075cf..895c2c6 100644
  }
  
 diff --git a/src/function/midi.c b/src/function/midi.c
-index 1cedb97..2318b49 100644
+index 601d845..6d060f0 100644
 --- a/src/function/midi.c
 +++ b/src/function/midi.c
 @@ -100,7 +100,7 @@ static int midi_libconfig_import(struct usbg_function *f,
@@ -660,10 +658,10 @@ index 1cedb97..2318b49 100644
  
  int usbg_f_midi_get_id_s(usbg_f_midi *mf, char *buf, int len)
 diff --git a/src/function/ms.c b/src/function/ms.c
-index 519b012..5cdd814 100644
+index 0523830..37ae9de 100644
 --- a/src/function/ms.c
 +++ b/src/function/ms.c
-@@ -207,7 +207,7 @@ static int ms_import_lun_attrs(struct usbg_f_ms *mf, int lun_id,
+@@ -210,7 +210,7 @@ static int ms_import_lun_attrs(struct usbg_f_ms *mf, int lun_id,
  		if (ret < 0)
  			break;
  
@@ -672,7 +670,7 @@ index 519b012..5cdd814 100644
  		if (ret)
  			break;
  	}
-@@ -605,8 +605,8 @@ int usbg_f_ms_set_lun_attrs(usbg_f_ms *mf, int lun_id,
+@@ -608,8 +608,8 @@ int usbg_f_ms_set_lun_attrs(usbg_f_ms *mf, int lun_id,
  
  	for (i = USBG_F_MS_LUN_ATTR_MIN; i < USBG_F_MS_LUN_ATTR_MAX; ++i) {
  		ret = usbg_f_ms_set_lun_attr_val(mf, lun_id, i,
@@ -683,7 +681,7 @@ index 519b012..5cdd814 100644
  						+ ms_lun_attr[i].offset));
  		if (ret)
  			break;
-@@ -633,7 +633,7 @@ int usbg_f_ms_get_lun_attr_val(usbg_f_ms *mf, int lun_id,
+@@ -636,7 +636,7 @@ int usbg_f_ms_get_lun_attr_val(usbg_f_ms *mf, int lun_id,
  
  int usbg_f_ms_set_lun_attr_val(usbg_f_ms *mf, int lun_id,
  			       enum usbg_f_ms_lun_attr lattr,
@@ -692,7 +690,7 @@ index 519b012..5cdd814 100644
  {
  	char lpath[USBG_MAX_PATH_LENGTH];
  	int ret;
-@@ -644,7 +644,7 @@ int usbg_f_ms_set_lun_attr_val(usbg_f_ms *mf, int lun_id,
+@@ -647,7 +647,7 @@ int usbg_f_ms_set_lun_attr_val(usbg_f_ms *mf, int lun_id,
  		return USBG_ERROR_PATH_TOO_LONG;
  
  	return 	ms_lun_attr[lattr].set(lpath, "",
@@ -702,7 +700,7 @@ index 519b012..5cdd814 100644
  
  int usbg_f_ms_get_lun_file_s(usbg_f_ms *mf, int lun_id,
 diff --git a/src/function/uac2.c b/src/function/uac2.c
-index 9ca8b66..fc06c1d 100644
+index 5bd26f0..7a469b1 100644
 --- a/src/function/uac2.c
 +++ b/src/function/uac2.c
 @@ -125,7 +125,7 @@ static int uac2_libconfig_import(struct usbg_function *f,
@@ -737,10 +735,19 @@ index 9ca8b66..fc06c1d 100644
 +				    uac2_attr[attr].name, val);
  }
 diff --git a/src/function/uvc.c b/src/function/uvc.c
-index f39594b..947b94e 100644
+index c78edfa..a3562a8 100644
 --- a/src/function/uvc.c
 +++ b/src/function/uvc.c
-@@ -303,7 +303,7 @@ int usbg_f_uvc_get_config_attr_val(usbg_f_uvc *uvcf, enum usbg_f_uvc_config_attr
+@@ -146,7 +146,7 @@ static inline int usbg_get_guid(const char *path, const char *name,
+ }
+ 
+ static inline int usbg_set_guid(const char *path, const char *name,
+-			      const char *attr, void *val)
++			      const char *attr, const void *val)
+ {
+ 	return usbg_write_guid(path, name, attr, *(char **)val);
+ }
+@@ -329,7 +329,7 @@ int usbg_f_uvc_get_config_attr_val(usbg_f_uvc *uvcf, enum usbg_f_uvc_config_attr
  }
  
  int usbg_f_uvc_set_config_attr_val(usbg_f_uvc *uvcf, enum usbg_f_uvc_config_attr iattr,
@@ -749,7 +756,7 @@ index f39594b..947b94e 100644
  {
  	char ipath[USBG_MAX_PATH_LENGTH];
  	int nmb;
-@@ -314,7 +314,7 @@ int usbg_f_uvc_set_config_attr_val(usbg_f_uvc *uvcf, enum usbg_f_uvc_config_attr
+@@ -340,7 +340,7 @@ int usbg_f_uvc_set_config_attr_val(usbg_f_uvc *uvcf, enum usbg_f_uvc_config_attr
  		return USBG_ERROR_PATH_TOO_LONG;
  
  	return uvc_config_attr[iattr].set(ipath, "",
@@ -758,7 +765,7 @@ index f39594b..947b94e 100644
  }
  
  int usbg_f_uvc_get_config_attrs(usbg_f_uvc *uvcf, struct usbg_f_uvc_config_attrs *iattrs)
-@@ -341,8 +341,8 @@ int usbg_f_uvc_set_config_attrs(usbg_f_uvc *uvcf, const struct usbg_f_uvc_config
+@@ -367,8 +367,8 @@ int usbg_f_uvc_set_config_attrs(usbg_f_uvc *uvcf, const struct usbg_f_uvc_config
  
  	for (i = USBG_F_UVC_FRAME_ATTR_MIN; i < USBG_F_UVC_FRAME_ATTR_MAX; ++i) {
  		ret = usbg_f_uvc_set_config_attr_val(uvcf, i,
@@ -769,7 +776,7 @@ index f39594b..947b94e 100644
  						+ uvc_config_attr[i].offset));
  		if (ret)
  			break;
-@@ -774,7 +774,7 @@ static int uvc_import_config(struct usbg_f_uvc *uvcf, config_setting_t *root)
+@@ -800,7 +800,7 @@ static int uvc_import_config(struct usbg_f_uvc *uvcf, config_setting_t *root)
  		if (ret < 0)
  			break;
  
@@ -779,10 +786,10 @@ index f39594b..947b94e 100644
  			break;
  	}
 diff --git a/src/usbg_common.c b/src/usbg_common.c
-index 5f7f4e5..7234649 100644
+index 0a55c2e..0f788ff 100644
 --- a/src/usbg_common.c
 +++ b/src/usbg_common.c
-@@ -337,7 +337,7 @@ int usbg_get_ether_addr(const char *path, const char *name,
+@@ -391,7 +391,7 @@ int usbg_get_ether_addr(const char *path, const char *name,
  }
  
  int usbg_set_ether_addr(const char *path, const char *name,
@@ -792,5 +799,5 @@ index 5f7f4e5..7234649 100644
  	char str_addr[USBG_MAX_STR_LENGTH];
  
 -- 
-2.42.0
+2.43.0
 
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch b/meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch
deleted file mode 100644
index cc122c844c..0000000000
--- a/meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4f3f2ad08e6ca132bd1dd388e02b57223bf4219d Mon Sep 17 00:00:00 2001
-From: Ming Liu <liu.ming50@gmail.com>
-Date: Sun, 11 Dec 2022 14:11:49 +0100
-Subject: [PATCH] libusbgx: Add interface name for NCM Feature Descriptors
-
-In commit: abf422bffca4a4767e7e242c44910dbf5ef7094f
-[
-Author: Stefan Agner <stefan.agner@toradex.com>
-Date:   Tue Jan 24 14:22:25 2017 -0800
-
-    libusbgx: Add interface name for Feature Descriptors
-
-    This adds interface name required for "Feature Descriptors". If
-    specified, we can assume that a Feature Descriptor with the
-    interface name of the specified string is understood by the
-    kernel (e.g. interface.rndis).
-]
-
-it only added Feature Descriptors for RNDIS, NCM also needs that, or
-else it could not be recognized by Windows systems.
-
-Add Feature Descriptors interface name for NCM.
-
-Upstream-Status: Submitted [https://github.com/linux-usb-gadgets/libusbgx/pull/73]
-
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- src/function/ether.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/function/ether.c b/src/function/ether.c
-index b1fe1d2..a9eaf33 100644
---- a/src/function/ether.c
-+++ b/src/function/ether.c
-@@ -184,8 +184,14 @@ struct usbg_function_type usbg_f_type_subset = {
- 	ETHER_FUNCTION_OPTS
- };
- 
-+static char *ncm_os_desc_ifnames[] = {
-+	"ncm",
-+	NULL
-+};
-+
- struct usbg_function_type usbg_f_type_ncm = {
- 	.name = "ncm",
-+	.os_desc_iname = ncm_os_desc_ifnames,
- 	ETHER_FUNCTION_OPTS
- };
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 7b12b911d8..ad8fe0226d 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-PV = "0.2.0+git"
-SRCREV = "ec0b01c03fdc7893997b7b32ec1c12c6103f62f3"
+PV = "0.3.0+git"
+SRCREV = "dbedf16f80c5b4e1807ea4f80cc89d1f15d36f0a"
 SRCBRANCH = "master"
 SRC_URI = " \
     git://github.com/libusbgx/libusbgx.git;branch=${SRCBRANCH};protocol=https \
-    file://0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch \
     file://0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch \
     file://gadget-start \
     file://gadget-stop \
-- 
2.43.0


