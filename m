Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242E5C369DC
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:56:51 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.7490.1745668602040034263
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vtr2N8x6;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso5958156a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745668600; x=1746273400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGfOpZCMhK6F7IJHNkXwK2ms7Velpn1xKmaLZBFIkJ4=;
        b=Vtr2N8x6GVqNB6Pl+/ESegOXiOk9jFY+uTUq0PF9MzaKYba5Q1oQv/3N8Bzm9XpNfu
         5ccB/2ZuquXoIAkvgr2qf/OLhVPS3mvnBlSjW3kRWyWXbHCqrvdCPVgWOecWIiNrLkmZ
         Tk0MgYUn/4AUkSxn5ibiqaLMqvNP6VgxtyzZ2OCde7adQyB5h6mER1cKiFbNh/lT6Fd2
         DVRFT6HQIMhN2Qyupdj3Aj/1/qwcve964D29PoKeYBWhwqX46H5fIXV0C9toVwJZAoDf
         ALc6151i6riyVOXAGQbNvKOCXJWRyAiAFp8y+DF2tqr6FFdKVD5N1fHrSzg1X7wGGJka
         UhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745668600; x=1746273400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGfOpZCMhK6F7IJHNkXwK2ms7Velpn1xKmaLZBFIkJ4=;
        b=Umt1+y9qAZESV9s6U8dk7ExkUmY1KCk091fwiKX89I7GAtBIm3o3GVK7dK3nPjLTH7
         HdkYEgtlSeLD/YuStcCZprSMZ2sYvUi7biEgBHl3wEbu/b9i026IqECzan3PYnDdv9HS
         8AyQa7SSuNE2G49RCK4EgLuUCUlYfIZ4luTvYCXNALit/JdRKIb9pucAYiXQKlh+Cf+m
         CCWhHDzu5WTGfG/xh4NlkDeWAdr8hI4JPcke0gVgWVCF/0G0iClAgekftmVTPoV+Uonj
         Vucg0/tzc/pGh5vu14f3JXrKE5i7sBEFULK2XFjQYr2xLUOIRQYlRuYFT8UG3CM6FV5m
         8/qA==
X-Gm-Message-State: AOJu0Yw6u0ap8lfE2nYkqMoDt7m/zrAQskHwHQvu8igjVNZEu4D4IJBt
	sh8hENrLHlPD9FaBzeJvAdu8qvfPUQNo4N2iC613x+4KlvcpyT/BBb73iuMG
X-Gm-Gg: ASbGncuYvAHf4mB2CjjmSc3XCxihtdrqiYlYJQnMaAOIiQQf5ZAKAbzdCkaExojUKHE
	x+KcQnNe0KC4Ba+RUc2p8KxeE30z6ZxkleeKppgbx9y3cS1nRMtV1eeBcMT/Ga3q7GBAbJ3A+oC
	5Awrvu81wmKdfuRIov5rkU396539tHyw+nYY0FrnTGeM6GQOG1Vsn/dtgwdBOj389E2PMr4KDqz
	Tk9RvUmdLGMPlOtDKOa83sUvgZ3Am3vXMk3LeBcIWLa2KPV2gIsRzp0Gth7mnrgBNk8o2m1Ga3f
	1OjZECDfYi+/ar44wM7t56CdfGFUubjn/6n9pPS6IK11YcEKHq/cKn5W85RrrOMi+3fuvl+7mv+
	fZnnS17ry
X-Google-Smtp-Source: AGHT+IFpmoHos+GispivC0zBWMVlrwE8Yu8F5T1yfJazdBhm104kYhmDcwaBb4iDA8hC9ze8maCCnA==
X-Received: by 2002:a05:6402:42ca:b0:5e5:3610:8b7a with SMTP id 4fb4d7f45d1cf-5f73960e462mr2059308a12.17.1745668600003;
        Sat, 26 Apr 2025 04:56:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f7016f6424sm2629375a12.42.2025.04.26.04.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:56:39 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/8] snort: Fix build with gcc-15
Date: Sat, 26 Apr 2025 13:56:17 +0200
Message-ID: <20250426115623.2732743-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426115623.2732743-1-martin.jansa@gmail.com>
References: <20250426115623.2732743-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117143

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/852983/

../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp_PDF.c:1062:13: error: conflicting types for 'File_Decomp_PDF'; have 'fd_status_t(struct fd_session_s *)' {aka 'enum fd_status(struct fd_session_s *)'}
 1062 | fd_status_t File_Decomp_PDF( fd_session_p_t SessionPtr )
      |             ^~~~~~~~~~~~~~~
In file included from ../../../../../snort-2.9.20/src/preprocessors/HttpInspect/include/file_decomp.h:59,
                 from ../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp_PDF.c:31:
../../../../../snort-2.9.20/src/preprocessors/HttpInspect/include/file_decomp_PDF.h:83:13: note: previous declaration of 'File_Decomp_PDF' with type 'fd_status_t(void)' {aka 'enum fd_status(void)'}
   83 | fd_status_t File_Decomp_PDF();
      |             ^~~~~~~~~~~~~~~
make[5]: *** [Makefile:374: file_decomp_PDF.o] Error 1
make[5]: *** Waiting for unfinished jobs....
../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp.c: In function 'Process_Decompression':
../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp.c:245:24: error: too many arguments to function 'File_Decomp_PDF'; expected 0, have 1
  245 |             Ret_Code = File_Decomp_PDF( SessionPtr );
      |                        ^~~~~~~~~~~~~~~  ~~~~~~~~~~
In file included from ../../../../../snort-2.9.20/src/preprocessors/HttpInspect/include/file_decomp.h:59,
                 from ../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp.c:34:
../../../../../snort-2.9.20/src/preprocessors/HttpInspect/include/file_decomp_PDF.h:83:13: note: declared here
   83 | fd_status_t File_Decomp_PDF();
      |             ^~~~~~~~~~~~~~~

  http://errors.yoctoproject.org/Errors/Details/852992/
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: In function 'DCE2_InitGlobal':
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:348:25: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
  348 |         size_t memcap = DCE2_GetReloadSafeMemcap(dce2_config);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
  163 | static uint32_t DCE2_GetReloadSafeMemcap();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: In function 'DCE2_ReloadGlobal':
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1291:25: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
 1291 |         size_t memcap = DCE2_GetReloadSafeMemcap(dce2_swap_config);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
  163 | static uint32_t DCE2_GetReloadSafeMemcap();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: In function 'DCE2_ReloadVerify':
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1436:35: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
 1436 |     uint32_t current_memcap     = DCE2_GetReloadSafeMemcap(dce2_config);
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
  163 | static uint32_t DCE2_GetReloadSafeMemcap();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1437:35: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
 1437 |     uint32_t new_memcap         = DCE2_GetReloadSafeMemcap(dce2_swap_config);
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
  163 | static uint32_t DCE2_GetReloadSafeMemcap();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: In function 'DCE2_ReloadSwap':
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1535:26: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
 1535 |         current_memcap = DCE2_GetReloadSafeMemcap(dce2_config);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
  163 | static uint32_t DCE2_GetReloadSafeMemcap();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1538:26: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
 1538 |         swap_memcap    = DCE2_GetReloadSafeMemcap(dce2_swap_config);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
  163 | static uint32_t DCE2_GetReloadSafeMemcap();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: At top level:
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1673:17: error: conflicting types for 'DCE2_GetReloadSafeMemcap'; have 'uint32_t(tSfPolicyUserContext *)' {aka 'unsigned int(tSfPolicyUserContext *)'}
 1673 | static uint32_t DCE2_GetReloadSafeMemcap(tSfPolicyUserContextId pConfig)
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: previous declaration of 'DCE2_GetReloadSafeMemcap' with type 'uint32_t(void)' {aka 'unsigned int(void)'}
  163 | static uint32_t DCE2_GetReloadSafeMemcap();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../snort/0001-Fix-build-with-gcc-15.patch    | 110 ++++++++++++++++++
 .../snort/snort_2.9.20.bb                     |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/0001-Fix-build-with-gcc-15.patch

diff --git a/meta-networking/recipes-connectivity/snort/snort/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-connectivity/snort/snort/0001-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..c221172cc8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/0001-Fix-build-with-gcc-15.patch
@@ -0,0 +1,110 @@
+From cc3724348c8e6371351e4370f158d17f28838e3b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Sat, 26 Apr 2025 11:40:45 +0200
+Subject: [PATCH] Fix build with gcc-15
+
+* fixes:
+  http://errors.yoctoproject.org/Errors/Details/852983/
+
+../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp_PDF.c:1062:13: error: conflicting types for 'File_Decomp_PDF'; have 'fd_status_t(struct fd_session_s *)' {aka 'enum fd_status(struct fd_session_s *)'}
+ 1062 | fd_status_t File_Decomp_PDF( fd_session_p_t SessionPtr )
+      |             ^~~~~~~~~~~~~~~
+In file included from ../../../../../snort-2.9.20/src/preprocessors/HttpInspect/include/file_decomp.h:59,
+                 from ../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp_PDF.c:31:
+../../../../../snort-2.9.20/src/preprocessors/HttpInspect/include/file_decomp_PDF.h:83:13: note: previous declaration of 'File_Decomp_PDF' with type 'fd_status_t(void)' {aka 'enum fd_status(void)'}
+   83 | fd_status_t File_Decomp_PDF();
+      |             ^~~~~~~~~~~~~~~
+make[5]: *** [Makefile:374: file_decomp_PDF.o] Error 1
+make[5]: *** Waiting for unfinished jobs....
+../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp.c: In function 'Process_Decompression':
+../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp.c:245:24: error: too many arguments to function 'File_Decomp_PDF'; expected 0, have 1
+  245 |             Ret_Code = File_Decomp_PDF( SessionPtr );
+      |                        ^~~~~~~~~~~~~~~  ~~~~~~~~~~
+In file included from ../../../../../snort-2.9.20/src/preprocessors/HttpInspect/include/file_decomp.h:59,
+                 from ../../../../../snort-2.9.20/src/preprocessors/HttpInspect/files/file_decomp.c:34:
+../../../../../snort-2.9.20/src/preprocessors/HttpInspect/include/file_decomp_PDF.h:83:13: note: declared here
+   83 | fd_status_t File_Decomp_PDF();
+      |             ^~~~~~~~~~~~~~~
+
+  http://errors.yoctoproject.org/Errors/Details/852992/
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: In function 'DCE2_InitGlobal':
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:348:25: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
+  348 |         size_t memcap = DCE2_GetReloadSafeMemcap(dce2_config);
+      |                         ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
+  163 | static uint32_t DCE2_GetReloadSafeMemcap();
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: In function 'DCE2_ReloadGlobal':
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1291:25: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
+ 1291 |         size_t memcap = DCE2_GetReloadSafeMemcap(dce2_swap_config);
+      |                         ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
+  163 | static uint32_t DCE2_GetReloadSafeMemcap();
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: In function 'DCE2_ReloadVerify':
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1436:35: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
+ 1436 |     uint32_t current_memcap     = DCE2_GetReloadSafeMemcap(dce2_config);
+      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
+  163 | static uint32_t DCE2_GetReloadSafeMemcap();
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1437:35: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
+ 1437 |     uint32_t new_memcap         = DCE2_GetReloadSafeMemcap(dce2_swap_config);
+      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
+  163 | static uint32_t DCE2_GetReloadSafeMemcap();
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: In function 'DCE2_ReloadSwap':
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1535:26: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
+ 1535 |         current_memcap = DCE2_GetReloadSafeMemcap(dce2_config);
+      |                          ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
+  163 | static uint32_t DCE2_GetReloadSafeMemcap();
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1538:26: error: too many arguments to function 'DCE2_GetReloadSafeMemcap'; expected 0, have 1
+ 1538 |         swap_memcap    = DCE2_GetReloadSafeMemcap(dce2_swap_config);
+      |                          ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: declared here
+  163 | static uint32_t DCE2_GetReloadSafeMemcap();
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c: At top level:
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:1673:17: error: conflicting types for 'DCE2_GetReloadSafeMemcap'; have 'uint32_t(tSfPolicyUserContext *)' {aka 'unsigned int(tSfPolicyUserContext *)'}
+ 1673 | static uint32_t DCE2_GetReloadSafeMemcap(tSfPolicyUserContextId pConfig)
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+../../../../snort-2.9.20/src/dynamic-preprocessors/dcerpc2/spp_dce2.c:163:17: note: previous declaration of 'DCE2_GetReloadSafeMemcap' with type 'uint32_t(void)' {aka 'unsigned int(void)'}
+  163 | static uint32_t DCE2_GetReloadSafeMemcap();
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [resolved in snort3 https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/dynamic-preprocessors/dcerpc2/spp_dce2.c            | 2 +-
+ src/preprocessors/HttpInspect/include/file_decomp_PDF.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dynamic-preprocessors/dcerpc2/spp_dce2.c b/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
+index 7fd78ee..150645f 100644
+--- a/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
++++ b/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
+@@ -160,7 +160,7 @@ static void DCE2_ReloadSwapFree(void *);
+ static void DCE2_AddPortsToPaf(struct _SnortConfig *, DCE2_Config *, tSfPolicyId);
+ static void DCE2_ScAddPortsToPaf(struct _SnortConfig *, void *);
+ static uint32_t max(uint32_t a, uint32_t b);
+-static uint32_t DCE2_GetReloadSafeMemcap();
++static uint32_t DCE2_GetReloadSafeMemcap(tSfPolicyUserContextId pConfig);
+ 
+ static bool dce2_file_cache_is_enabled = false;
+ static bool dce2_file_cache_was_enabled = false;
+diff --git a/src/preprocessors/HttpInspect/include/file_decomp_PDF.h b/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
+index 8d39185..0e624f7 100644
+--- a/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
++++ b/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
+@@ -80,6 +80,6 @@ fd_status_t File_Decomp_Init_PDF( fd_session_p_t SessionPtr );
+ 
+ fd_status_t File_Decomp_End_PDF( fd_session_p_t SessionPtr );
+ 
+-fd_status_t File_Decomp_PDF();
++fd_status_t File_Decomp_PDF( fd_session_p_t SessionPtr );
+ 
+ #endif /* FILE_DECOMP_PDF_H */
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
index 9bc14fc56f..7f1b779cc4 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://fix-host-contamination-when-enable-static-daq.patch \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
+    file://0001-Fix-build-with-gcc-15.patch \
 "
 SRC_URI[sha256sum] = "29400e13f53b1831e0b8b10ec1224a1cbaa6dc1533a5322a20dd80bb84b4981c"
 

