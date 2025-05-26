Return-Path: <kelefa.sane@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143FAC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:53:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.25467.1748253207934520026
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 02:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wQ4/crsq;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: kelefa.sane@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so16999605e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748253206; x=1748858006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcg8Tw88dy/SoKsnMZFFeReUSszl4MigfHmUh00K3+Y=;
        b=wQ4/crsqVR0+5KFJ95h8UQWDgTaMGxCQI7o3iAJ6rNIuo7/pzhhapFqLFXS36OYRjX
         WenFhpgySEyAsVdu59JGwKBvHcXWyL6v7a2gLD6BEz7VijBLZC7qsF222JX7HZabnKmD
         NTL2oCvkgOFbUtHst/wTP5VDUugisZl7AY3ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253206; x=1748858006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mcg8Tw88dy/SoKsnMZFFeReUSszl4MigfHmUh00K3+Y=;
        b=iSfgz9FM1Q1h9fTOr3BQTqpvQom+e1AmLBgniVIzk+1vFSyxr4703gxIe0+rQYbLHU
         Q7I1kqgP2SrKU3rv+S88JExHL3kFJG8NjbAdIq2v24II/3KQikA3TeKYHu7EQ3xsy/pL
         qQuNxXBpPSDJIHy6fKB/DRO2vZc5y4TnJhhUHI9LChCm751wAMJnvfz6rc4aKDEjLygu
         Y9z1sJcTzsxOzudZxR6rZ7Hz729EvKTVMerbrWQozA0QJMHEtNW3mvmhVcwcqIwzmSY9
         5yblDcmWU5aMPYU3nKPr/RKjvr/pl1ETa8gbHPuBxTslo/s142P/DOAavTHYXJz8s5MS
         dqxg==
X-Gm-Message-State: AOJu0YxL/0WfbrBMGbgMvjtrAx0seEMdl2tDu5kTTRgPesHsnRyMSuQn
	4AUMBau4JSOZo0qK1RFFgm5NqsWiiOalTT1LB05kxr9IG631/np7YRRcldWKBAKki4W/CdSfuQV
	FG5RK
X-Gm-Gg: ASbGncueGXxg58OxuNbB7EXs8flg5oTpXgvuiion3pBvb9/+II5kqIUO24WZ4REowDb
	BD871JJ3/lovt4tCW1weLXVIYl96r6RYt4gMRkPqmqiVqMit6WdIcVcPKArdZOwrieiyfbppuJ2
	WyAlZzFdw6oAn5iHGrw8JQYC5UGM8m45h7FUMzXwE6J7DjK5EiAITfGma8R14oVJ9FYGmqgL6SG
	81hGl9Cng29HgcSoni7WrkRxslx9K0J66K3Y/IIqoWhawcpHm5jpQvMAQwyJqpImJog9+m6Pbtf
	iCkt0dSqWPejSggqEtXxs1CCmF2zK/wEMkU3z1/c07P9y/5ki5ozOBAbn9Enz1bLzT1v6j2/N39
	e4EngMGo/4c2tCI2GMQarx28GCytZeXF5QTWkNSiSeJNJbr+S3WdD5Q==
X-Google-Smtp-Source: AGHT+IHFER0ZZ0Tux3K7d/baIa+P8a2FwGBik/oH1jeIPNLtT808SD9Eg77igmJ2ozEeZXgY3yHoTA==
X-Received: by 2002:a05:6000:2410:b0:3a4:d53d:be22 with SMTP id ffacd0b85a97d-3a4d53dbfdfmr3725386f8f.58.1748253205993;
        Mon, 26 May 2025 02:53:25 -0700 (PDT)
Received: from FRSMI24-OUB.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm35439277f8f.90.2025.05.26.02.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:53:25 -0700 (PDT)
From: kelefa.sane@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
Subject: [meta-oe][PATCH v2] crash: fix reproducibility
Date: Mon, 26 May 2025 11:53:18 +0200
Message-ID: <20250526095318.3160818-1-kelefa.sane@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 09:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117624

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

