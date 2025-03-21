Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CA5C35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 09:37:59 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.17157.1742549870693533608
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 02:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5ravSzB;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7430e27b2so359290066b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 02:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742549869; x=1743154669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BONXw3nTP0x4AgtW8SLcEeGVni1iBRzkT3FOQFAu2pQ=;
        b=e5ravSzBYAygTxOkJwRR0JZdmNelJghtxTpZRzjqyngtjCdFnMXEUtVdkIHxrwMe77
         u6iIKQ3jhMR0ud7clIHoXjQKitg8/0vK0S0Y+kPHp7JVT7T6aW+06NPptd4R5Z7PMlFO
         yHz1tD2D0y07D6S9zi98neuDsUFmdnQA1s4IFdDJRWmmAgd+vOHxYydwsalfElOwAb5x
         FQFjEN/4RxshIh2Id1J2mH8xv4/HZc5qKkYlcH+zLNsCkT76rhgJLfwyUfq2mY4uJofV
         MMCIMJSXgykJVikC+2FVIo+i5RQJcnsXrZQwXGVif8ctAMxZIF+75jpjg28TfZK8ZOOd
         VrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742549869; x=1743154669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BONXw3nTP0x4AgtW8SLcEeGVni1iBRzkT3FOQFAu2pQ=;
        b=R5JhfUf1B0/+AaTx/eBvVxmH89DveYjuLuCrgvwLJo8mCG+F3J1fP/wu3N4DZTea8B
         Z/N249cL87jm7H8VwB8CDssroT9eqKXZWcHYphP9eZ3kg3RBc0QyB7TO2Rrk/cI/PONR
         +79cSikkFrjyzw/qTL+njuRWwHnA+2wnj0MwJX1jZa0UE7S5pAoXg3FFiumjgk18q8zW
         602mZ00iKZinGm/sRpkZq1oc2hdX1QCalU0ktzTh/YRJJwDSUF/bGKpeaXQoz8VeUaJM
         Bp7cYEUNC1AOePE8ck28PqS9xlY8rMlFaM93qdcfEu7D0W9DUJBWJEqV0B94k8BOCum7
         gvyQ==
X-Gm-Message-State: AOJu0YybizxMiyiZ2unpfOiNhK/DSx4tcqt8enKFzc1rkLxMle0rt2xP
	zS/ldIODT4R5GZsm00hQ2vXYY1bfRqeunYd5ljc3710hAfUBm0OsbJNozg==
X-Gm-Gg: ASbGnctGl5WnUIGuPZnntbprNRsY43warFznlGWli02bnm3B67wzhY1So+T2PABSzRd
	kLNZldPFvs1dt+pEtJXO9mFF5qT7YJpTmNfzggOmlSY+U9FRm86nxPaxZk+dG4ZiPo1IWjy/kJP
	CVGq1OkcY4cM4xE7aURhQ/2tWwDp07xP22dMrT9t6s1RbEUNVvaR+WIwT9Gnr7GtjX/vzgbPoQG
	LPOfGxOCmm3OBkO8K/6/4gBhm1TDJSxlZyt5gxbz5wzlEVOIo14GB8fUfSlBzCsES05hZKTRvC2
	pSL/ngR/X5bOZseMgCV/CNDYukfVC6ylB6qpzVpOvfMit1xmrtdG/3vvkE9xAie4F6NkJAV3Oec
	trA==
X-Google-Smtp-Source: AGHT+IECIQHPYCFt0e9gRc/W+eyREUFgqNaY/eHj5hT/gTj9VWsdMTmwq5N4VsOQiU/LPTRCWkaR5A==
X-Received: by 2002:a17:907:3f20:b0:abf:59e1:ad88 with SMTP id a640c23a62f3a-ac3f229c5cdmr195951766b.29.1742549868527;
        Fri, 21 Mar 2025 02:37:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3ef8e509dsm120034166b.68.2025.03.21.02.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 02:37:47 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] iftop: fix build with gcc-15
Date: Fri, 21 Mar 2025 10:37:42 +0100
Message-ID: <20250321093742.634012-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 09:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116176

From: Martin Jansa <martin.jansa@gmail.com>

fixes:
http://errors.yoctoproject.org/Errors/Details/848458/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-cfgfile-fix-build-with-gcc-15.patch  | 46 +++++++++++++++++++
 .../recipes-support/iftop/iftop_1.0pre4.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-support/iftop/iftop/0001-cfgfile-fix-build-with-gcc-15.patch

diff --git a/meta-networking/recipes-support/iftop/iftop/0001-cfgfile-fix-build-with-gcc-15.patch b/meta-networking/recipes-support/iftop/iftop/0001-cfgfile-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..73540e18c6
--- /dev/null
+++ b/meta-networking/recipes-support/iftop/iftop/0001-cfgfile-fix-build-with-gcc-15.patch
@@ -0,0 +1,46 @@
+From e579fbe1f73dc89e2bf81a5b6c949f8ae24f93b2 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 21 Mar 2025 09:31:05 +0000
+Subject: [PATCH] cfgfile: fix build with gcc-15
+
+* fix read_config declaration to match
+
+cfgfile.c:247:5: error: conflicting types for 'read_config'; have 'int(char *, int)'
+  247 | int read_config(char *file, int whinge_on_error) {
+      |     ^~~~~~~~~~~
+In file included from cfgfile.c:16:
+cfgfile.h:16:5: note: previous declaration of 'read_config' with type 'int(void)'
+   16 | int read_config();
+      |     ^~~~~~~~~~~
+make[2]: *** [Makefile:566: cfgfile.o] Error 1
+make[2]: *** Waiting for unfinished jobs....
+iftop.c: In function 'main':
+iftop.c:803:5: error: too many arguments to function 'read_config'; expected 0, have 2
+  803 |     read_config(options.config_file, options.config_file_specified);
+      |     ^~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~
+In file included from iftop.c:50:
+cfgfile.h:16:5: note: declared here
+   16 | int read_config();
+      |     ^~~~~~~~~~~
+
+Upstream-Status: Pending [last pre release was over 10 years ago and https://code.blinkace.com/pdw/iftop has last commit from 4 years ago]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+
+ cfgfile.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cfgfile.h b/cfgfile.h
+index 11ba475..a331b75 100644
+--- a/cfgfile.h
++++ b/cfgfile.h
+@@ -13,7 +13,7 @@ typedef struct {
+     int value;
+ } config_enumeration_type;
+ 
+-int read_config();
++int read_config(char *file, int whinge_on_error);
+ 
+ char *config_get_string(const char *directive);
+ int config_get_bool(const char *directive);
diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
index 517d781281..4d9fea58e0 100644
--- a/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76498170798db0f4f0fb685a225f702f"
 
 SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz \
            file://iftop-1.0-gcc10.patch \
+           file://0001-cfgfile-fix-build-with-gcc-15.patch \
           "
 SRC_URI[md5sum] = "7e6decb4958e8a4890cccac335239f24"
 SRC_URI[sha256sum] = "f733eeea371a7577f8fe353d86dd88d16f5b2a2e702bd96f5ffb2c197d9b4f97"

