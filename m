Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA832C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:23 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.3707.1684914795428610489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qDD9MY9B;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-510d967249aso1429517a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914794; x=1687506794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxNtvbG2nL7fVcXdAVfKfT/oSHeflgAJ2rg7KKTVAlQ=;
        b=qDD9MY9BBcrDtnyXSR2egr8iKng1nYWbLMEyspl4GhGYIXQ2PdSpuYwdWlXZrr9/Tr
         UlKkR/wLLk5wcnqCXf4L7eF1Prcujo+6rDGo5Gt+sfQMow9UUJIRo5z1WT4pI1fss5YM
         zyRwez9ctcjzGOMQ5uhHqVUpR4fy6nbmRAfLN0NDZ5hZu4NVD5P3yIDsUDE4Q6BdC3sM
         XkN9ly19uTYvzHHeF47HHxTQlaHuBXL8GmyKi7hHcLh911WOBSmgQgcJd0/Fn+QWKeeA
         2HU/z7V7caLeiVCbs5iclowwOMz0l7Y64fY39OEgwq5yPsfGuzUySMCBGnKESa0itEnL
         p4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914794; x=1687506794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxNtvbG2nL7fVcXdAVfKfT/oSHeflgAJ2rg7KKTVAlQ=;
        b=aqMnA1Q8d4DwXqQ4DBSkbbj9uQQLf53HQJ2JrH51NYr/mOUSRhIlLarC5UF/lkj80D
         YSo0jofCPZ0J4FHmIJPOvRVU8U3gK2yXHbel47OKHufXozp+mi7L5hS2CjrbjJkgVDEt
         S1yBs9tPhBJC4sJACKCjaVkGCkZT4vV445TXreY7kztQjslFCb9oDtuNx4P7SbZTHtIw
         NSMPf7uqZhUAGBEqfgK1+/54vtIrAz2+r2RKoS9wqAZg28YEuvnTWiWSncErq1PFWm/p
         XeFDuSK+fP7yAcoSnyiIaPmDKaIOeGI4seeqZEX3NcrBLOjJu95KWcxYb54aqTQF1f9n
         JsDQ==
X-Gm-Message-State: AC+VfDzMnop/+zf7jFxF8G1mt50IAm6u1kO45F1imqYf4h1kfPmXppXY
	6Gd3fAr8YqPPTjzQM/ZZtMrAjGXEQUk=
X-Google-Smtp-Source: ACHHUZ6yn1wql/LEjEDaQOKP+4lDeOUWfJX2+J3pW3qi65Xm7HxnGwim7PHgAfw1lF2U8aMuN7QFcw==
X-Received: by 2002:a17:906:a855:b0:961:800b:3f1e with SMTP id dx21-20020a170906a85500b00961800b3f1emr12794818ejb.73.1684914793872;
        Wed, 24 May 2023 00:53:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b3-20020a1709064d4300b009545230e682sm5403940ejv.91.2023.05.24.00.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 18/20] tigervnc: remove unused patch file
Date: Wed, 24 May 2023 09:52:51 +0200
Message-Id: <20230524075253.1033593-18-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102772

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=f602e9f1e14ac2c9f0d094b9d8c7605aa6df9767

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-tigervnc-remove-includedir.patch     | 50 -------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch b/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
deleted file mode 100644
index f0056d6561..0000000000
--- a/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 47f175618a0b0817714ea557c9e93f22f327421e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 31 Jul 2018 16:39:52 +0800
-Subject: [PATCH 1/4] tigervnc: remove includedir
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
-
-It fixes host contamination
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- unix/xserver/hw/vnc/Makefile.am | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/unix/xserver/hw/vnc/Makefile.am b/unix/xserver/hw/vnc/Makefile.am
-index 470424b..ee18bf9 100644
---- a/unix/xserver/hw/vnc/Makefile.am
-+++ b/unix/xserver/hw/vnc/Makefile.am
-@@ -23,7 +23,7 @@ libvnccommon_la_SOURCES = $(HDRS) \
- 
- libvnccommon_la_CPPFLAGS = -DVENDOR_RELEASE="$(VENDOR_RELEASE)" -I$(TIGERVNC_SRCDIR)/unix/common \
- 	-DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_H \
--	-I$(TIGERVNC_SRCDIR)/unix/vncconfig $(XVNC_CPPFLAGS) ${XSERVERLIBS_CFLAGS} -I$(includedir) \
-+	-I$(TIGERVNC_SRCDIR)/unix/vncconfig $(XVNC_CPPFLAGS) ${XSERVERLIBS_CFLAGS} \
- 	-I$(top_srcdir)/include
- 
- bin_PROGRAMS = Xvnc
-@@ -43,7 +43,7 @@ Xvnc_CPPFLAGS = $(XVNC_CPPFLAGS) -DTIGERVNC -DNO_MODULE_EXTS \
- 	-UHAVE_CONFIG_H \
- 	-DXFree86Server -DVENDOR_RELEASE="$(VENDOR_RELEASE)" \
- 	-DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common -I$(TIGERVNC_SRCDIR)/unix/common \
--	-I$(top_srcdir)/include ${XSERVERLIBS_CFLAGS} -I$(includedir)
-+	-I$(top_srcdir)/include ${XSERVERLIBS_CFLAGS}
- 
- Xvnc_LDADD = $(XVNC_LIBS) libvnccommon.la $(COMMON_LIBS) \
- 	$(XSERVER_LIBS) $(XSERVER_SYS_LIBS) $(XVNC_SYS_LIBS) -lX11
-@@ -64,7 +64,7 @@ libvnc_la_CPPFLAGS = $(XVNC_CPPFLAGS) -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_
- 	-I$(top_srcdir)/hw/xfree86/os-support \
- 	-I$(top_srcdir)/hw/xfree86/os-support/bus \
- 	-I$(top_srcdir)/include \
--	${XSERVERLIBS_CFLAGS} -I$(includedir)
-+	${XSERVERLIBS_CFLAGS}
- 
- libvnc_la_LDFLAGS = -module -avoid-version -Wl,-z,now
- 
--- 
-2.7.4
-
-- 
2.40.1


