Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E649BC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:22 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.11436.1685531593730273704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FON/xfLY;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bad97da58adso6321746276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531592; x=1688123592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9GqalaD8bMQMTCZ2ymCVsKadYGbUCRJ+e7GKOFewVs=;
        b=FON/xfLYFjHtQfXdFb+JeUCaPJsA/R9Gp5Apb8x54RXqK4nOtIQ2yRCjU/GdLlxvsz
         tvrp41jeV6kOtYQ4+Rc5kA0TA9qIv7zhryPT2tNKP+HyyRbxNvFuw7J4hHaSyRPWY3Ta
         5gK2ouvVCJrBy6SKh8V4ORssOGl6ruV3aPNct3RCGPqwuAomI1yp/XRLNMLkKJormb7T
         qEN6Yl9Z4/U85Ndk+5uD+j999at/egkEQzHfIoIS6jli5IZcxygbnZAPWI7CrWOY8rEq
         6Jd2hMFcAhTc37o4g6Ooxd9+Kc+sUb7UN9xJXLyApmNPUly0qmq7wZf+0Q8BnBF8qvTV
         PfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531592; x=1688123592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9GqalaD8bMQMTCZ2ymCVsKadYGbUCRJ+e7GKOFewVs=;
        b=h+a0QCGXgBzd+DnxKC7p0YxVW/vcjpxhol+x0t7ykca6BPXYv+fNEQ1ZmTAxj3UJsm
         30xUrl/icIr/0Yz6vN/NLK7KXgOqf8x/6Zt0kCLQDO0oANfAsa1WyE+ruXFHZ424OQib
         U7xhcM2mYPgvJXwTE9OCp3qvxnVi/J7D0azrULzytPh/0V1mQwo+0d0jyT6MFIEI8www
         wlIWjv97EWke2ts7uiSwlv7NzhU4RVKrNy0/3hiVIujrRdBOgNV/nEAWobaaZa5diTv0
         POXeA+xn9C22+bJrNgBqxp3BdjjJ0co/4e1Eca0z6hndWUkUFk+ca7n6hSGx+78bsmyy
         16sg==
X-Gm-Message-State: AC+VfDxzy5K+zfVSkrtcmkqIBjrXUiZ+lYKoltEVo5r+xv7OxQSWe23E
	hz/UoYWQ0jnItlI/QTbR+GgnI/lBouw=
X-Google-Smtp-Source: ACHHUZ4JwpFEsW+b5o5/4WDweUdoXmIQ/59KVJEW68EbqxjjXLiHC5jdwxLGOJ2h9Vn4oxN+q36wrw==
X-Received: by 2002:a81:6c84:0:b0:565:9fc7:9330 with SMTP id h126-20020a816c84000000b005659fc79330mr5422433ywc.17.1685531592631;
        Wed, 31 May 2023 04:13:12 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 03/36] enca: Remove buildpaths from target scripts
Date: Wed, 31 May 2023 07:12:36 -0400
Message-Id: <20230531111309.2454603-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103032

From: Khem Raj <raj.khem@gmail.com>

Using configure checks to detect mktemp can result in problems in
cross-builds where buildtime mktemp ( native ) maybe detected in a path
that does not exist on target, therefore rely upon PATH variable to find
this binary when executing this script.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3042c14399e0fdde7823b01af2e9a76027b37539)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


