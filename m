Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A15ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:57:04 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.67685.1661756218055212429
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QY6yj6E+;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id c24so6872166pgg.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0WQDQg83fa0D+dSVqPo3UHz0d8hxTypR8n/U6RIIbnM=;
        b=QY6yj6E+I3s87DTfRiU57ZsSBu5cuk9Q36vPojUyc7xCrouWF8iWd+zos2bbt67uLw
         QTxkVoxYLGXPRjqZQ+PkIX0K0+rQa1aMTLFCaCKhP0DiOJPTcUeWUTUlFK2D5+iX1iC+
         eAUoPT3ttlagzATsyERAd9Gks1Nr77Uw43uo7KIG9HyiWYKpXNGUckdRvPTmlZ6YGe9A
         z4Bzy1ZErmoZsCZxEgSoAdrQYFQbqHbwSXwDX7F6vGwiDfFwsMzAPazwW4FBeyUmfnVV
         R7PyTxS5x668LZnb0PlXQ2/0cH3raJOT0JA5Jwgj02nsyHWScu+WuB0qUhxJdmYoGpP3
         rzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0WQDQg83fa0D+dSVqPo3UHz0d8hxTypR8n/U6RIIbnM=;
        b=dFeUuSn3iC7CFGKNPJPQ8ZVblByHih4tY+93elF47lSHfn1eD+vtWGwRMXjWHmV3+t
         T3PCPUOzRO3t6bcJrNou7EriVEXn6JpH6EFbtzuY81kKU5dPHvtosW7il/ctU9Ev1GOM
         0RhBCKpzJXu7aa9x/hJ4lpgttCuqhPVbynvvRed/Y/taHn/GKsQ1SA5tFazQmpaS/Won
         i8Xv2m7PDFywfd9C7p23xgYFBcw3LVClxBJ3oN82eP5paExtdnJ/KmRFtfe4sGJy5Nbm
         5JuZyS4NNoxZAs/p/LrF2G3O/Gg3CKg49oF1p15NImnpTiDtkeLoqLQT6rzTo/YLBaEo
         PFtw==
X-Gm-Message-State: ACgBeo0+snehnFkjb56WUHpuYnEsVAuapPwPawPqiDssIp7DfnSPGRjy
	EFROvgT0H9tZ3/s2XdKLMg1ubiC/eIOlUA==
X-Google-Smtp-Source: 
 AA6agR5vGSBS/97t+YlzPoQX4gt2HZi1PHqmLZFR+jkZBQmnxsCmJOqnoEECiym3+GIevSP/G0kP1g==
X-Received: by 2002:aa7:8a0b:0:b0:537:f5f1:fd91 with SMTP id
 m11-20020aa78a0b000000b00537f5f1fd91mr9239472pfa.41.1661756217159;
        Sun, 28 Aug 2022 23:56:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b0016d5b7fb02esm505489plf.60.2022.08.28.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:56:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/7] crda: Fix build with clang-15
Date: Sun, 28 Aug 2022 23:56:48 -0700
Message-Id: <20220829065649.808556-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829065649.808556-1-raj.khem@gmail.com>
References: <20220829065649.808556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98517

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-reglib-Remove-unused-variables.patch | 59 +++++++++++++++++++
 .../recipes-connectivity/crda/crda_3.18.bb    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-reglib-Remove-unused-variables.patch

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-reglib-Remove-unused-variables.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-reglib-Remove-unused-variables.patch
new file mode 100644
index 0000000000..c6c3c53f19
--- /dev/null
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-reglib-Remove-unused-variables.patch
@@ -0,0 +1,59 @@
+From 1bd6ff9d10c83afbc9954fc38b953e9167e6d4a9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 28 Aug 2022 14:01:55 -0700
+Subject: [PATCH] reglib: Remove unused variables
+
+These counters are not used anywhere therefore delete them
+Fixes
+reglib.c:1015:15: error: variable 'i' set but not used [-Werror,-Wunused-but-set-variable]
+        unsigned int i = 0;
+                     ^
+reglib.c:1062:15: error: variable 'lines' set but not used [-Werror,-Wunused-but-set-variable]
+        unsigned int lines = 0;
+                     ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ reglib.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/reglib.c b/reglib.c
+index 8565a0b..6c62c2c 100644
+--- a/reglib.c
++++ b/reglib.c
+@@ -1012,7 +1012,6 @@ static int reglib_find_next_country_stream(FILE *fp)
+ {
+ 	fpos_t prev_pos;
+ 	int r;
+-	unsigned int i = 0;
+ 
+ 	while(1) {
+ 		char line[1024];
+@@ -1030,7 +1029,6 @@ static int reglib_find_next_country_stream(FILE *fp)
+ 		line_p = fgets(line, sizeof(line), fp);
+ 		if (line_p == line) {
+ 			if (strspn(line, "\n") == strlen(line)) {
+-				i++;
+ 				continue;
+ 			}
+ 			if (strncmp(line, "country", 7) != 0)
+@@ -1059,7 +1057,6 @@ struct ieee80211_regdomain *reglib_parse_country(FILE *fp)
+ 
+ FILE *reglib_create_parse_stream(FILE *f)
+ {
+-	unsigned int lines = 0;
+ 	FILE *fp;
+ 
+ 	fp = tmpfile();
+@@ -1076,7 +1073,6 @@ FILE *reglib_create_parse_stream(FILE *f)
+ 		if (line_p == line) {
+ 			if (strchr(line, '#') == NULL) {
+ 				fputs(line, fp);
+-				lines++;
+ 			}
+ 			continue;
+ 		} else
+-- 
+2.37.2
+
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
index a616557e7c..2f4d4dac99 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://fix-issues-when-USE_OPENSSL-1.patch \
            file://crda-4.14-python-3.patch \
            file://0001-Make-alpha2-to-be-3-characters-long.patch \
+           file://0001-reglib-Remove-unused-variables.patch \
 "
 SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
-- 
2.37.2


