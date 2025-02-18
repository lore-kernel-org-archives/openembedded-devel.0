Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06E4C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 05:43:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.13504.1739857429195077971
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 21:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QgitoDj/;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-221206dbd7eso32561525ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 21:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739857428; x=1740462228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWJdBy+wkddUwX9ZpFg5Q0YJNokGJnEQO1ShuW4yUuI=;
        b=QgitoDj/seDYbrSDWcZhlmnR1aC445rOkuxFALwyLOKUlkewxA41TllXgyiXc2Py1F
         vOdFGxvdgfk2m7NmbDzMcTyy191ANbwp/KCl6R27RgSV5ddgEILdz//8SXvX8tzz6jyS
         Imdof0H+nOFaQUQHb67OPKSSYPMRNf5k5Cc5pBtY0i3JMBevP78fhlD45KQHVVMJsyTp
         HMPyamuig0tJs3ohoUaHfAXhMj95Mw3UcmG5r5HrdoHyN7GdOmvJrip92kEGQXaoxAlj
         QfkCehWOi4xe6FYseOiqEAFJ6xP7dop3Bw5Htd24Z4FchI33ZMJkwaCNrQ9xJW29Y8AZ
         jvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739857428; x=1740462228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWJdBy+wkddUwX9ZpFg5Q0YJNokGJnEQO1ShuW4yUuI=;
        b=VUA5Sgh9d1yX6CVefvhivMK85r6V9yqduHzLLkeYLLhX0UlsFd8gre4d0JaCrHs2Oy
         tvs1sfr6LV+pecy1uOoM9zNyPjvgWUyZ1+9N2gqqpyuOaZEWGyNhy4ram840xgKr/c3K
         K/CI5DeMNPpaaMDMyK/yFuDY1ZQYaTh/iZ+86YM+vSzr2jjX359Lax2TOqLp/GGt0tl0
         ZDuMh8tQT5+gpaQL/mgvJimUPmPMj7sq9YGnc8Pw04bpRJT65Li6jJwlVPE/7l+oA4U5
         SBYDl9cITPqZILu1lk4bBrgHFyVBzcJw3ohahrJkTZkIV26gSKNtdZM9r+sT+6S0KPf7
         /vKA==
X-Gm-Message-State: AOJu0YyJlvUUSU4JCoygSFy1mYZDVDtSVSdl45sbMd7bEViZ2CETaYV2
	B87AraCigTuJ6W6YBBDmXqAYC0PV2Vg2zyDwHovwESiwbGlxYUZOzImjRn6+
X-Gm-Gg: ASbGncvonysydXmqoknSdkuKzy3z6a0FCS9AeutpB3XCqOCQCEFJbb9FboP4YNI7bWF
	8o3EI8vyePk1K9rioXjKOwaIPggb6PzUicEybOgJqi7wigkKC+C0YJRbAKCJLHRCBRzqA8EP/KZ
	5DMoDpWkrqVLq1vPfhsBLbfRyItr1YssBzPUfNEnsWQbOPizOEPJ6rojgQ4xs6n6i9u0aB3add8
	EvbA6+YfaPHpW1HSi3lx5uqLeIUUZqItQTk5A/Zz76FbM+CU7tN+tJfv3s/+Cld9iydCrYu4jlC
	fOKfP2o=
X-Google-Smtp-Source: AGHT+IE7pKZJBnov50SjvQNtUVbcFN74lMvGZKHRUYxoaR1v8aP28vbLZu8qR9/1MzR3lDMS6GM0pw==
X-Received: by 2002:a05:6a00:739d:b0:732:6248:8f5f with SMTP id d2e1a72fcca58-73262488fabmr12907436b3a.5.1739857428096;
        Mon, 17 Feb 2025 21:43:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::dd76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73285a7bfbfsm2276217b3a.154.2025.02.17.21.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 21:43:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] sblim-sfcb: Include string.h for memcpy
Date: Mon, 17 Feb 2025 21:43:43 -0800
Message-ID: <20250218054344.2476688-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218054344.2476688-1-raj.khem@gmail.com>
References: <20250218054344.2476688-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Feb 2025 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115518

Fixes build with latest musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-missing-system-headers.patch | 53 +++++++++++--------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-missing-system-headers.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-missing-system-headers.patch
index c16e393f49..f9083e7934 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-missing-system-headers.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-missing-system-headers.patch
@@ -18,8 +18,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  trace.h             | 3 ++-
  9 files changed, 12 insertions(+), 3 deletions(-)
 
-diff --git a/brokerEnc.c b/brokerEnc.c
-index 9115e71..889afcd 100644
 --- a/brokerEnc.c
 +++ b/brokerEnc.c
 @@ -25,6 +25,8 @@
@@ -31,8 +29,6 @@ index 9115e71..889afcd 100644
  extern const char *opGetClassNameChars(const CMPIObjectPath * cop);
  extern const char *opGetNameSpaceChars(const CMPIObjectPath * cop);
  extern CMPIConstClass *getConstClass(const char *ns, const char *cn);
-diff --git a/brokerOs.c b/brokerOs.c
-index 8d73a0b..b1427fd 100644
 --- a/brokerOs.c
 +++ b/brokerOs.c
 @@ -22,6 +22,7 @@
@@ -43,8 +39,6 @@ index 8d73a0b..b1427fd 100644
  
  static char    *
  resolveFileName(const char *filename)
-diff --git a/mlog.c b/mlog.c
-index a2d9eb7..6d9cd29 100644
 --- a/mlog.c
 +++ b/mlog.c
 @@ -26,6 +26,7 @@ const char     *_mlog_id =
@@ -55,8 +49,6 @@ index a2d9eb7..6d9cd29 100644
  #include <errno.h>
  #include <signal.h>
  #include "trace.h"              /* for setSignal() */
-diff --git a/mofc/backend_sfcb.c b/mofc/backend_sfcb.c
-index 614abcd..99d4061 100644
 --- a/mofc/backend_sfcb.c
 +++ b/mofc/backend_sfcb.c
 @@ -29,7 +29,7 @@
@@ -68,8 +60,6 @@ index 614abcd..99d4061 100644
  
  extern CMPIStatus sfcb_simpleArrayAdd(CMPIArray * array, CMPIValue * val, CMPIType type);
  extern CMPIObjectPath *getObjectPath(char *path, char **msg);
-diff --git a/sfcbdump.c b/sfcbdump.c
-index 8a9c335..aa8559c 100644
 --- a/sfcbdump.c
 +++ b/sfcbdump.c
 @@ -23,6 +23,7 @@
@@ -80,8 +70,6 @@ index 8a9c335..aa8559c 100644
  #include "objectImpl.h"
  
  #define BINARY_NAME argv[0]
-diff --git a/sfcbdumpP32onI32.c b/sfcbdumpP32onI32.c
-index ccf87dc..3540751 100644
 --- a/sfcbdumpP32onI32.c
 +++ b/sfcbdumpP32onI32.c
 @@ -22,6 +22,7 @@
@@ -92,8 +80,6 @@ index ccf87dc..3540751 100644
  #include <getopt.h>
  #include "objectImpl.h"
  #include <byteswap.h>
-diff --git a/sfcbsem.c b/sfcbsem.c
-index 3f8de7f..1e6358b 100644
 --- a/sfcbsem.c
 +++ b/sfcbsem.c
 @@ -21,6 +21,7 @@
@@ -104,8 +90,6 @@ index 3f8de7f..1e6358b 100644
  #include <getopt.h>
  #include <errno.h>
  
-diff --git a/trace.c b/trace.c
-index 23597e1..c4f8011 100644
 --- a/trace.c
 +++ b/trace.c
 @@ -25,6 +25,7 @@
@@ -125,8 +109,6 @@ index 23597e1..c4f8011 100644
  int             terminating = 0;
  int             colorTrace;
  
-diff --git a/trace.h b/trace.h
-index ea39850..52d408d 100644
 --- a/trace.h
 +++ b/trace.h
 @@ -25,6 +25,7 @@
@@ -137,7 +119,7 @@ index ea39850..52d408d 100644
  extern unsigned long _sfcb_trace_mask;
  /* use pointer indirect _sfcb_trace_mask to allow shared memory flag */
  extern unsigned long *_ptr_sfcb_trace_mask;
-@@ -162,7 +163,7 @@ extern sigHandler *setSignal(int sn, sigHandler * sh, int flags);
+@@ -162,7 +163,7 @@ extern sigHandler *setSignal(int sn, sig
  
  extern char    *processName;
  extern int      providerProcess;
@@ -146,6 +128,33 @@ index ea39850..52d408d 100644
  extern int      terminating;
  
  #endif
--- 
-2.37.3
-
+--- a/support.c
++++ b/support.c
+@@ -39,6 +39,7 @@
+ #include <err.h>
+ #endif
+ #include <errno.h>
++#include <string.h> /* memcpy */
+ #include "native.h"
+ #include "trace.h"
+ #include "control.h"
+--- a/qualifier.c
++++ b/qualifier.c
+@@ -19,6 +19,7 @@
+  *
+  */
+ 
++#include <string.h> /* memcpy */
+ #include "objectImpl.h"
+ #include "qualifier.h"
+ 
+--- a/objectImplSwapI32toP32.c
++++ b/objectImplSwapI32toP32.c
+@@ -24,6 +24,7 @@
+ #include <byteswap.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h> /* memcpy */
+ #include <sfcCommon/utilft.h>
+ #include <sys/utsname.h>
+ 

