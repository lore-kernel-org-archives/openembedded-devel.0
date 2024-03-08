Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA428C54798
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 01:24:43 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.10719.1709861073790540279
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 17:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hTMVHR9b;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-22008177fbeso770128fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 17:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709861073; x=1710465873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTj3TCAiBi/SGBz++J+RsfDp06NrV1ZSG27P+RHuBOk=;
        b=hTMVHR9bNzSCQMmgXmdbIogIrLISUqhya4Vw6saBPz1mG1YtWfu6JG//BDqnbUJdl3
         cDk1dGglLxwe9KwuEq+ouqq5nt0ZUSYeAx5XzZcAMwo3GazrZmkdIQnEAao+liBOAbRc
         fIZv3GX4ggm94wHQYnQzB6PHkFUgIIlux16ZWq5REdxyUJ8LZLT6xPrrX20qg/ktmnxg
         V1SK9KRMHFTSoyvmMOgYWwY47oFBtSUujnaLsiS3muzovE4ycQTZVwt3AIFocWs7zCZs
         wKd/C8XlI3y23wjzTemkzVwRWihDvwqqBYKi3wSXxSuh/c84Ni+0/Wl8KrOwndUqgmKv
         bWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709861073; x=1710465873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTj3TCAiBi/SGBz++J+RsfDp06NrV1ZSG27P+RHuBOk=;
        b=B+GBOPAiJ0r39fcLV028nO5Uiay36/rcpIDqv3V+2nZXIfZwtUf3NbfFbx4/orraIe
         u8dmYKLX6AWg3Rt/xEddUCg9SfbFCjfgtvL5BLIPH7OVajrXqSrj4H4iYc7a2nHtgQuo
         2sciHi++2jZqTdV88OLrgowEqTfg4cu5Fu48oAnRb5kyh+49DGD6hxVO1AMU4E2sZ3FZ
         BNpV9zIRoKBMOrz3iPVY++9qnaZEswbM5DrpevUP9/rUpfTfHVEiRd2qNSxzMpBy8tZX
         WCKGzBAYujHGlCY5aOi8HfQ91huJdsIjQpDnOfdRnCkRIkQKiXhJSu9XyowDNkUdzyM9
         y1Ig==
X-Gm-Message-State: AOJu0YyJgk0HKJh2XDf3kWRPqCIirRAUpYPhEJnPDBXCa0pjWKUmoleH
	dVVkN5BtvvmsvKI3akxb5G8MnN+9jdXPt4cAHIwGRcitMIreRspIPlI+VLKy
X-Google-Smtp-Source: AGHT+IEy3nqZyjqfmACqgtnTsW+ONO+YBQ2gPueEIJVfuHF8Rx0OoMskmIjpuKi6Gz+1hZ4eTymuvg==
X-Received: by 2002:a05:6870:2189:b0:21e:95dd:b212 with SMTP id l9-20020a056870218900b0021e95ddb212mr1640213oae.57.1709861072812;
        Thu, 07 Mar 2024 17:24:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id k4-20020aa79984000000b006e559bc3250sm10649731pfh.68.2024.03.07.17.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 17:24:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] xmlstarlet: Fix build with API breakage in libxml2 2.12
Date: Thu,  7 Mar 2024 17:24:24 -0800
Message-ID: <20240308012429.577792-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308012429.577792-1-raj.khem@gmail.com>
References: <20240308012429.577792-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 01:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109213

Fixes
|   300 |     xmlSetStructuredErrorFunc(&errorInfo, reportError);
|       |                                           ^~~~~~~~~~~
| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/xmlstarlet/1.6.1/recipe-sysroot/usr/lib/../include/libxml2/libxml/xmlerror.h:898:29: note: passing argument to parameter 'handler' here
|   898 |                                  xmlStructuredErrorFunc handler);
|       |                                                         ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Make-xmlError-struct-constant.patch  | 45 +++++++++++++++++++
 .../xmlstarlet/xmlstarlet_1.6.1.bb            |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/xmlstarlet/files/0001-Make-xmlError-struct-constant.patch

diff --git a/meta-oe/recipes-support/xmlstarlet/files/0001-Make-xmlError-struct-constant.patch b/meta-oe/recipes-support/xmlstarlet/files/0001-Make-xmlError-struct-constant.patch
new file mode 100644
index 0000000000..a9d98db69c
--- /dev/null
+++ b/meta-oe/recipes-support/xmlstarlet/files/0001-Make-xmlError-struct-constant.patch
@@ -0,0 +1,45 @@
+From f7a5ebc3a673b246a64c9a664df304c1520a3951 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Mar 2024 12:35:17 -0800
+Subject: [PATCH] Make xmlError struct constant
+
+In libxml2 commit v2.12.0~14 the API changed so that
+xmlGetLastError() returns pointer to a constant xmlError struct.
+Reflect this change in our code.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/xml.c     | 2 +-
+ src/xmlstar.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/xml.c b/src/xml.c
+index cf47cc2..e6f19c1 100644
+--- a/src/xml.c
++++ b/src/xml.c
+@@ -104,7 +104,7 @@ void reportGenericError(void* ctx, const char * msg, ...) {
+ /* by default all errors are reported */
+ static ErrorInfo errorInfo = { NULL, NULL, VERBOSE, CONTINUE };
+ 
+-void reportError(void *ptr, xmlErrorPtr error)
++void reportError(void *ptr, const xmlError *error)
+ {
+     ErrorInfo *errorInfo = (ErrorInfo*) ptr;
+     assert(errorInfo);
+diff --git a/src/xmlstar.h b/src/xmlstar.h
+index 3e1eed3..7e41ac4 100644
+--- a/src/xmlstar.h
++++ b/src/xmlstar.h
+@@ -32,7 +32,7 @@ typedef struct _errorInfo {
+     ErrorStop stop;
+ } ErrorInfo;
+ 
+-void reportError(void *ptr, xmlErrorPtr error);
++void reportError(void *ptr, const xmlError* error);
+ void suppressErrors(void);
+ 
+ typedef struct _gOptions {
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
index 930fbdd6c7..61eeaaa095 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
@@ -15,6 +15,7 @@ DEPENDS = "libxml2 libxslt"
 SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BP}.tar.gz \
            file://configure.ac.patch \
            file://0001-usage2c.awk-fix-wrong-basename-regexp.patch \
+           file://0001-Make-xmlError-struct-constant.patch \
            file://0001-Fix-hash_key_put-signature.patch"
 SRC_URI[sha256sum] = "15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed19e7ca"
 
-- 
2.44.0


