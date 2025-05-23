Return-Path: <kelefa.sane@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B109CC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 08:30:38 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.43605.1747989032538592339
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 01:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JQy1w8Tw;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: kelefa.sane@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso61481545e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 01:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747989031; x=1748593831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh7YQAt9snuy6otIARXBky0bmPCZMES0MTFu5bQ3gco=;
        b=JQy1w8TwvazTsklHkbCtLOC1o5AeEPKu7YKSTZ49s8yqAaP6+DNIlqpt5dTYEOoOhf
         NV6fajsuj77Mxz51q39K5d4YMOqjIPbijzUau79PrESFlWLyvj+hep9klhknIpXjdJJG
         E69qlZp9TkbVsO7ql2OJQy6DbGetXAa09iCJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989031; x=1748593831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zh7YQAt9snuy6otIARXBky0bmPCZMES0MTFu5bQ3gco=;
        b=ZmHUjswT2u8wc/nIcNegQRKnWJ41l50n8802TTLau9KM4RWWGK34Hg4q/UqWTXTrZV
         0XCXHcE8B/sl4UPuAKR6qgB7Kb2VTRVqC6yRU3/pJzkYGgvrDtvnCTtc0JQKL6jzDGeX
         u/sTecQEbaScbPbmqewUxJRSX3yLFVWKOmP4XVlyvrt3RAqbs9VuyGKC1FHRCglxLxAA
         TzFTQYfqOrWPy9Q6dzenapl4xnjRfpKyYVDKAzz7lg2xJDwhUwOy64rwUkQLcqdv5HPQ
         a9k5fIzKrpZFf3noxiAQggEJM66A5zetwQLQi9BFBABEFRVDiQkH5RomTJt78V5Qn5FK
         xzdw==
X-Gm-Message-State: AOJu0YyLVHMDy7vZvSoJCm0F5JaxsVsV6YlopMmoDGSqMiE56KAtN+ba
	rt75/A0+MsQAmJSBftAfxrm2Li7z/H3N0PtTklgLS3nXxrzjLv2HIE7UvvauGpPy+EZX7CIYmKH
	LvDxv
X-Gm-Gg: ASbGncs4Fg0byHZB4Zd+W/nd4iOiuZdpKciEhT7K68CKuLezQn+H4C1TmcB/jRKOkgs
	vZpvAJGHqiU7tdzPJP2UNyv5t2j8ZmUbt8KcJKBPPOjcjL131wXTJmqKlu7kK+oY1wkxINI8VTT
	78/F1o3UkCOOEs/CkintNaYNt6gnZ3CoA4v7CeyKr5Kz8jKvKEz7P2f/DQVY9ug3TywaM3zxlSi
	RmdbKgtlt6e+8C2XTBvrUwXYbh7io4HAyosNBp/IXUtXABJPW6XmO6CU33MY7NpsJov0LYFCJpf
	pJP+gmCTnkIxmB87ysD9S5CUONu1sro0enNaYHjmHQG0dBdUD59WVvixD+rE5EvJkC8Ui5BnJJ4
	hpj/8FF+exrglJavlHkLzCN5GZLAWGOVxMtKofC9FR4Rm6lewoemMmQ==
X-Google-Smtp-Source: AGHT+IEv7GVhkK0yxoHHqDHXDjSop5hoHFYebZDEBQ9HgE9s8JVhk0dRa7YfSBUE6lryMUGGH0UEwA==
X-Received: by 2002:a05:600c:4fc9:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442fd6271b6mr346302245e9.10.1747989030611;
        Fri, 23 May 2025 01:30:30 -0700 (PDT)
Received: from FRSMI24-OUB.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0554fsm130875025e9.9.2025.05.23.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:30:30 -0700 (PDT)
From: kelefa.sane@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
Subject: [meta-oe][PATCH] crash: fix reproducibility
Date: Fri, 23 May 2025 10:30:21 +0200
Message-ID: <20250523083021.7368-1-kelefa.sane@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 08:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117605

From: Kéléfa Sané <kelefa.sane@smile.fr>

Fix reproducibility issue by retrieving the compiler version from the CC
env variable, which define the compiler used in the build and not from
the native gcc compiler install in the host machine.

Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc    |  3 --
 meta-oe/recipes-kernel/crash/crash.inc        |  1 +
 ...e-CC-env-var-to-get-compiler-version.patch | 48 +++++++++++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index 894d7f330a..ae4fb1d194 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -7,9 +7,6 @@ KNOWN_NON_REPRO_META_OE = " \
     asio-ptest \
     asio-src \
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
index 0000000000..d51008886e
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
@@ -0,0 +1,48 @@
+From 31b789d1b21ed26315d08798d6044450e3545ddf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
+Date: Fri, 16 May 2025 16:18:28 +0200
+Subject: [PATCH] Use CC env var to get compiler version
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
+Upstream-Status: Submitted [https://lists.crash-utility.osci.io/archives/list/devel@lists.crash-utility.osci.io/thread/MIPWYZGF3EIC47FVNNYK77FI4ZJ3FHON/]
+
+Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
+---
+ configure.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/configure.c b/configure.c
+index 4668c9a..a20e174 100644
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
++		snprintf(compiler_version_cmd, sizeof(compiler_version_cmd)-1, "%s --version", cc_env);
++		fp3 = popen(compiler_version_cmd, "r");
++	}
+ 
+ 	if ((fp4 = fopen("build_data.c", "w")) == NULL) {
+ 		perror("build_data.c");

