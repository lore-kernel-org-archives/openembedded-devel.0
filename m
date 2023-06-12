Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF34C88CB2
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 18:43:14 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.68073.1686595392946777428
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 11:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=V96rckTX;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-653bed78635so3218516b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686595392; x=1689187392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4mjgzISIVL27+Aaf44GVfOozrYD5R0LVzn0GvEys0A=;
        b=V96rckTXIqgKNMbv0wRfiMhv04MEGh2ribrJlKyhJIW63r1DHcGGqBbtE/53KAMGB1
         lPJC26+k493vjYiHwzSzuzbChnN9w4Whgiuuppgz/ghy5RYo3ayP5w7oyYoEkRVJP48V
         1HLoMVQxmSDlMZFDYfEEcWI6QnvOd4sU35JWWlLV8BUgZApXlDJkJrmxxPzghJDZ1S6q
         6mkJXg0wzHvmgZa224qnaJ3Dw/nI+kImr5bSfKmtZiDkV1ugCt2O2bEC11sqUVCspMM3
         PW7Q4r8Ozotd+MmuHVU5Kh782mCoO5jDlKa6Ir6b/HV8cyRhmbLD68b/bvJjNBJWMZ5H
         orYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686595392; x=1689187392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4mjgzISIVL27+Aaf44GVfOozrYD5R0LVzn0GvEys0A=;
        b=S2lAEGfmoZk8c3DJkToR10P999gW9n7Gu36Uz1zRSc/Xn2aglMsmX264kMklkUkYEs
         5HVUgxml2HcY5fnrCDU53XHxkXSNy7c3VywZBCPY84mh+tGIL86PnoUyu8bwUlPbZy0Y
         9otuiySUNx1nKtPWHQscZz6MblMpyjnu9ZTICUkP/ufbjtnU4mzP9XbdGEFZLLsx0D9t
         jgz02JaGXjKDyWba3HxAMEwnHCfWRWmtnUdctceYCWhoi/MWnmOUx3JEVHniokp/xG65
         +V5u/aWJ3cIQl1HUfv+T/Ir+qWJ0HXSJLBS+EUCsZF3sqEN3s/qhhYvl4vBhN+su275r
         e+hA==
X-Gm-Message-State: AC+VfDzsmCn6GPCbFQhPgf2oaadG/910hVxPAW9tTPBl6dVBRF+pXeSg
	anQE8gcs8RXpe9P47qgGBquRUfNNUms=
X-Google-Smtp-Source: ACHHUZ6S+m7c12WMMHXmJwFiHNuQO3Dx3ARhJXjy3dW0ylkh825qCG6nuzks30bGRTdmYTuts0DFiw==
X-Received: by 2002:a05:6a20:160d:b0:10b:d70d:f971 with SMTP id l13-20020a056a20160d00b0010bd70df971mr12627198pzj.3.1686595391882;
        Mon, 12 Jun 2023 11:43:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id s18-20020a63ff52000000b0054fa8539681sm520190pgk.34.2023.06.12.11.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:43:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] fwts: Fix build issues found with lld linker
Date: Mon, 12 Jun 2023 11:43:08 -0700
Message-ID: <20230612184309.1556169-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612184309.1556169-1-raj.khem@gmail.com>
References: <20230612184309.1556169-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 18:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103218

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...kefile.am-Add-missing-link-with-zlib.patch | 43 +++++++++++++++++++
 meta-oe/recipes-test/fwts/fwts_22.11.00.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-Makefile.am-Add-missing-link-with-zlib.patch

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Makefile.am-Add-missing-link-with-zlib.patch b/meta-oe/recipes-test/fwts/fwts/0001-Makefile.am-Add-missing-link-with-zlib.patch
new file mode 100644
index 0000000000..358f7c424d
--- /dev/null
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Makefile.am-Add-missing-link-with-zlib.patch
@@ -0,0 +1,43 @@
+From dd97e711b13af6f770db27abec316d5c9271c777 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Jun 2023 10:25:55 -0700
+Subject: [PATCH] Makefile.am: Add missing link with zlib
+
+It uses functions e.g. gzopen/gzclone/gzgets which are provided by zlib
+therefore add it to linker flags.
+
+Fixes
+| aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: gzgets
+| >>> referenced by ../src/lib/src/.libs/libfwts.so
+|
+| aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: gzopen
+| >>> referenced by ../src/lib/src/.libs/libfwts.so
+|
+| aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: gzclose
+| >>> referenced by ../src/lib/src/.libs/libfwts.so
+| clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
+| make[3]: *** [Makefile:2301: fwts] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
+index 76c48d4..45eea88 100644
+--- a/src/lib/src/Makefile.am
++++ b/src/lib/src/Makefile.am
+@@ -30,7 +30,7 @@ pkglib_LTLIBRARIES = libfwts.la
+ libfwts_la_LDFLAGS = -version-info 1:0:0
+ 
+ libfwts_la_LIBADD = 				\
+-	-lm -lpthread -lbsd				\
++	-lm -lpthread -lbsd -lz				\
+ 	@GIO_LIBS@					\
+ 	@GLIB_LIBS@
+ 
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-test/fwts/fwts_22.11.00.bb b/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
index f1028074d7..2448082620 100644
--- a/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=${BP} \
            file://0005-Undefine-PAGE_SIZE.patch \
            file://0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
            file://0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch \
+           file://0001-Makefile.am-Add-missing-link-with-zlib.patch \
            "
 SRC_URI[sha256sum] = "4af4e1e0f1ae9313297af722d744ba47a81c81bc5bdeab3f4f40837a39e4b808"
 
-- 
2.41.0


