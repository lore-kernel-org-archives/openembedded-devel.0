Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F57ACCA46F
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:29 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.21067.1759223962588105914
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TJN1NhXS;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-90a0b3ddebeso200150539f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223961; x=1759828761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Em29qcAHejK993ODYD+dZOyOQnfQwAfEZDbqnP6jkIA=;
        b=TJN1NhXSIAAY9rp28Q54IPSUcSDlqsLY5d4do3lnTr2F+Jr4D5qTwzf3Xz5CpfDSek
         4U77hpXkZeea9hTK7LfCRe/aICw/daeZE7VMUZC/8I+qnpzT7BELj7rVjdL0uDWFC1/t
         /i8l5OZegjMpR5ftGqdyWIJu2z+mriKZ8SvpfvZrog7owepiY6itWqgCt78K2hdk0Ntk
         teTb1IITG7o7nrpsovoyiYHanEZX4vRr2I6g6zL8cLEUowgZdKlFcdzDXwudbaf8Xpmh
         ersscSd+mti+H8t+Xt6kvWByflz0xvPu3A9OHWSyyzF1aIusXNOMZELe1FZiMgkKFHZ9
         SGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223961; x=1759828761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Em29qcAHejK993ODYD+dZOyOQnfQwAfEZDbqnP6jkIA=;
        b=l8PpRZm7X/y/n2JdVZjXstbFtMrPQjCYvFy2k6cgVqyrmlIrVluAJSIoIqJrS+1E2o
         VB16aPNSnyE9/FVQqBIfi320dTAIO3/MrH3wl2ur3BnWGsgr9oN3/agz8lJwflSuga3x
         5ZMhbPeggzJpaTVAxvBHjDd/I4oj+gkTLgsWsH6wGUGRMlXAQlfSQmqRYksAlth9sX/8
         ejZgxtwDb7SUXWOSZfIO7LCUQdtErnU/JajRa7PZyp2Xq+ycm2ezxPzv4zvbZsYfAGDJ
         uLwJW41wNasY+ivdnzERITymlVJ7pbZandhzDY/zvfX9LToeIQhmfmHecYedNU/jFw10
         mjRw==
X-Gm-Message-State: AOJu0YxeJpPbrYy9HVFcXkxJQz7ABBfQKaGqYvVvxJf/hWCbJ4nDJmK+
	ojgwgGpLl3Kjr4g+f/KXHPzdw+M1s0hfla7thhWmzbobWz0T59oKCOu8IC6La9ZV
X-Gm-Gg: ASbGncs3Ggo4NwEAR8NtUjKnISBoUVa615f/eAr2ODME2r4yZBoZYTDUyGr8+pT2qj9
	CZDHMzn8KF9QVUQt31o1vhPgc9usJK03/Rs6Syw4SSezgVKDNpcXOO01TMhoCa+4AHgskAMA8K+
	Oi+tmYSV1v+PxR4MpQ4P5djwbLBQx2rfw8CnetU8CktS3/VasVC0t7Z3FTu8pva6WIBcf7sYFOV
	8KS6hD3vAdz9A1NLAlTE+vAGRN3Mdd8w8LsfbaImrEFRZxTvCrK27lBcjDd2eipHfVyN9Tmtcpq
	NjAsp8fmlSWdpTyaYme4B5Y/Xi7cV5iDlv8rH+DA9ohzs9u/+BfllcMDgEdqYCQII53yJkYqrTI
	e5qyCzsSxl/C8IappsrsPRGEpYW20+wNMRvOP6G0RqPm/aK7PU8Mysk1HbftJGh43CbdxaaCkJ2
	JF3RY0YFWBqg==
X-Google-Smtp-Source: AGHT+IEMLidBRtNBHNyzWA8CPTMPgb2uGXvTcIbps97VNVk8UF9DjttysG8PBrw9Lp8POw0P6UR/8A==
X-Received: by 2002:a05:6602:1686:b0:8eb:13e6:aed9 with SMTP id ca18e2360f4ac-90162bb6fbbmr2920880339f.12.1759223961574;
        Tue, 30 Sep 2025 02:19:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:21 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 13/22] crash: fix reproducibility
Date: Tue, 30 Sep 2025 22:18:32 +1300
Message-ID: <20250930091841.1693131-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120065

From: Kéléfa Sané <kelefa.sane@smile.fr>

Fix reproducibility issue by retrieving the compiler version from the CC
env variable, which define the compiler used in the build and not from
the native gcc compiler install in the host machine.

Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit df7e1b55d5f40129ebffa1cb1b9c0dcd099b6eaa)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/conf/include/non-repro-meta-oe.inc    |  3 --
 meta-oe/recipes-kernel/crash/crash.inc        |  1 +
 ...e-CC-env-var-to-get-compiler-version.patch | 48 +++++++++++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index c8c628eea0..24e321f26f 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -7,9 +7,6 @@ KNOWN_NON_REPRO_META_OE = " \
     boinc-client-dev \
     cjson-ptest \
     cpuid-doc \
-    crash \
-    crash-dbg \
-    crash-src \
     dhrystone \
     dhrystone-dbg \
     dhrystone-dev \
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index aef77be1a0..45fc9cd1fd 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://0003-Fix-build-failure-in-readline-lib.patch \
            file://0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch \
            file://0005-Fix-build-failure-on-32bit-machine-i686.patch \
+           file://0001-Use-CC-env-var-to-get-compiler-version.patch \
            "
 SRCREV = "f13853cef53f5c5463a51021edbc81977e2b1405"
 
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
new file mode 100644
index 0000000000..773598def1
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
@@ -0,0 +1,48 @@
+From 6ad5e9302057e157ab701880a8543ca59058df2d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
+Date: Fri, 16 May 2025 16:18:28 +0200
+Subject: [PATCH v2] Use CC env var to get compiler version
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The source file build_data.c generated at compilation time define a
+variable compiler_version which is obtained by calling "gcc --version"
+cmd. This call retrieve the native gcc compiler install on host build
+machine but not necessarily the compiler use to build the project (ex:
+cross compilation).
+
+The CC env variable commonly used in Makefile project define the
+compiler to use at build, so this is the appropriate way to retrieve the
+compiler version, when the CC env var is define.
+
+Upstream-Status: Submitted [https://lists.crash-utility.osci.io/archives/list/devel@lists.crash-utility.osci.io/thread/V3G3QH3YW6WZWD56TVTFQIHYLZ33UIJL/]
+
+Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
+---
+ configure.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/configure.c b/configure.c
+index 4668c9a..4b65bd7 100644
+--- a/configure.c
++++ b/configure.c
+@@ -1362,7 +1362,17 @@ make_build_data(char *target)
+ 
+         fp1 = popen("date", "r");
+         fp2 = popen("id", "r");
+-	fp3 = popen("gcc --version", "r");
++
++	const char *cc_env = getenv("CC");
++	if(NULL == cc_env) {
++		fp3 = popen("gcc --version", "r");
++	}
++	else {
++		char compiler_version_cmd[512];
++
++		snprintf(compiler_version_cmd, sizeof(compiler_version_cmd), "%s --version", cc_env);
++		fp3 = popen(compiler_version_cmd, "r");
++	}
+ 
+ 	if ((fp4 = fopen("build_data.c", "w")) == NULL) {
+ 		perror("build_data.c");

