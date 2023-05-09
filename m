Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D34C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 04:26:10 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.24102.1683606365709459535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 21:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=D90IeMqZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-52867360efcso3733126a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 21:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683606365; x=1686198365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MkiUT7ImJbweJ82gFJmqoTBHpy5Ak+YmHOkRtAEvqc=;
        b=D90IeMqZnwX+DeVgxdwvmUZwdm7R/UxaZMvMlmLmi3e7AmP/OeWjzWk+Meg0ugY53L
         OvDlHIm3ida8APmVa9Wc2FvTSb39saJifXqCgo9CXGsx2VC/HlgZxTxrNcW65hfr3XG2
         FrTSOfbEutmCfUlWBKqtpsSfZUQzv7qkr9Ji7ejAxlmY4AuEhDXz0rJ4iox3gW39W/qH
         8txUPNAycKEfUVhW9+sFBVUQEctGR4ALTLNl3Kd9Uy79MRG1ofcY0AxiPyGFeGm31FNz
         TNaJ1fnRUkf+lMYwtBZjlAXUDhCgT/OSFOuLwxj93P9YQC+BsMECzIuwOSNPU0HYrpiq
         uf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683606365; x=1686198365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MkiUT7ImJbweJ82gFJmqoTBHpy5Ak+YmHOkRtAEvqc=;
        b=SGpL5AxawK0lxHQfwugZmcvfsh0Z+U68iWL70R4cxMf/28mfjYjSW04C31vWqvTw+Z
         XrY5M5djqWgartLzARCJqfn+xRid/BTHO/VrcRODU3rE9XGRGP7BWAmc6Qclfmx4pgp0
         UAr6MdVyuLn+FsX4fkc4+xI1EZDCaJm1h9NKvIIEXFq8yR3BsZ2nB/qt0u1T/Qq4xhh8
         OEohGlL1OvpqWR75zZhgU355rIv/gE/rURrSS6XWmMgq2ZGurducCtJhg9hwZ5nrq60p
         Ygl+89J+TzrL4yAxChSvTRqeywbxjiK2uFKL7yjisQ6/y1/Q8ZL+ZbAbPhpj72Byznd8
         h0EA==
X-Gm-Message-State: AC+VfDxu9dNw+b3Exdj2+zakVl3s3RdROzdLtCflT8SRXyocrvTyhS7+
	xRzfDPtzX/x1qLaR1xH0/DsmNB0iTlumCg==
X-Google-Smtp-Source: ACHHUZ527vw8CSE0+D5hK5qy05wZMxSZSg+fUSpKcXtFnXzl/8ezPaN4ERQoGZVeNPOxjTNLJllQSw==
X-Received: by 2002:a17:903:124f:b0:1aa:f6e9:4cb3 with SMTP id u15-20020a170903124f00b001aaf6e94cb3mr16002585plh.52.1683606364771;
        Mon, 08 May 2023 21:26:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902748500b001ac2a73dbf2sm321321pll.291.2023.05.08.21.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 21:26:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] enca: Remove buildpaths from target scripts
Date: Mon,  8 May 2023 21:26:02 -0700
Message-Id: <20230509042602.1052322-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 04:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102462

Using configure checks to detect mktemp can result in problems in
cross-builds where buildtime mktemp ( native ) maybe detected in a path
that does not exist on target, therefore rely upon PATH variable to find
this binary when executing this script.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-not-use-MKTEMP_PROG-in-cross-build.patch | 30 +++++++++++++++++++
 meta-oe/recipes-support/enca/enca_1.19.bb     |  4 +--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/enca/enca/0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch

diff --git a/meta-oe/recipes-support/enca/enca/0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch b/meta-oe/recipes-support/enca/enca/0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch
new file mode 100644
index 0000000000..32fa239084
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca/0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch
@@ -0,0 +1,30 @@
+From c6a59d512706978e8c67f9a2d84ec650f8763368 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 May 2023 18:02:52 -0700
+Subject: [PATCH] Do not use $MKTEMP_PROG in cross-build
+
+$MKTEMP_PROG points to native location which could be absolute path that
+wont exist on target rootfs. Therefore use it from PATH
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4852a2f..d23b384 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -186,7 +186,7 @@ ye_PATH_LOCALE_ALIAS
+ 
+ dnl Random filename generation in scripts
+ if test -n "$MKTEMP_PROG"; then
+-  SHELL_RANDOM_FILENAME='`'$MKTEMP_PROG' /tmp/enca-$$-XXXXXXXX`'
++  SHELL_RANDOM_FILENAME='`mktemp /tmp/enca-$$-XXXXXXXX`'
+ else
+   SHELL_RANDOM_FILENAME='/tmp/enca-$$-$RANDOM'
+ fi
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-support/enca/enca_1.19.bb b/meta-oe/recipes-support/enca/enca_1.19.bb
index eed0ad1b93..774f05f7c4 100644
--- a/meta-oe/recipes-support/enca/enca_1.19.bb
+++ b/meta-oe/recipes-support/enca/enca_1.19.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=24b9569831c46d4818450b55282476b4"
 SRC_URI = "https://dl.cihar.com/enca/enca-${PV}.tar.gz \
     file://dont-run-tests.patch \
     file://makefile-remove-tools.patch \
-    file://libenca-003-iconv.patch "
-
+    file://libenca-003-iconv.patch \
+    file://0001-Do-not-use-MKTEMP_PROG-in-cross-build.patch"
 SRC_URI[sha256sum] = "4c305cc59f3e57f2cfc150a6ac511690f43633595760e1cb266bf23362d72f8a"
 
 inherit autotools
-- 
2.40.1


