Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC43C6FA86
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:14 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.11322.1662276911253962887
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=igYaOzZp;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id fa2so5737305pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=T/CLbFnNYUEmeyvnP4E0oynfSXQDjUEE77AK6ipsnHE=;
        b=igYaOzZpQ935sSZvCzrO37Z/6DM9Okm9fpoOYrQSuB23tsHWYMgHil/8asPxF4POOK
         zi20FZBVTaTbPeuhuQN3ShY8by2hzWqF7l343lfpll/miqTWSrTlpbewR1ym/x0rhOtT
         3I5xbGzZGYK+KeCHqQJ2gLk2rgC4YvXBc9gvT20fxSuoQ/Da3M/SY+Rlx0rRuiQoQk61
         nGA4cR7DleGSTICfn1rDH4eoV+ylE1bAZqiiIFc/hTYPs6vqh9xYRxYr34VhvwvzWQrl
         DqyppeFX+FHxNDF3RKlzVjGzD6IOWErEHex7OPM11/mdadoAHtLVgEWiKh8QFAlf0H+P
         42Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=T/CLbFnNYUEmeyvnP4E0oynfSXQDjUEE77AK6ipsnHE=;
        b=kKoOPgLzMCZ8oDclqIYxzdP/k2AhhsniG700MY80YTNp8mCZwUwdX1hGUM9eeCFj3T
         iw+bBJYtIPOZFpuutoxyP9u/Kk/MHnEudagrrbQc47DwgBFt/n9WyH02ui8Fk17oXZ5/
         PnjRT7NY7teGp9j4ChGW0nQquvDbQrzJDqtY02QhBXQN541Tas5Sc5uWT4oZQaVcumey
         JWfi8Tfm7kfvaj9+Ehiz+vP0OSzYc1/3wWbzdlI2CjA61K+azHhek7Wf+ExF/Dp0kmCo
         UxraD0Uql+gongHBO7jWa1mZNORLeAf1ti5Sy1zm++AW2wq1hHoHRIxG31O/ZqZ+tOQe
         mjhg==
X-Gm-Message-State: ACgBeo3JSfv9YZ4STYlnP2iP8HkUA8zp1BNCSaMur2qflItzGMt54tyO
	vrZtMuRjkYp19Ig6REZZ6+cQbYtK8p28EA==
X-Google-Smtp-Source: 
 AA6agR7rrIvQVXTY5iqJa6nRjZmxGrB8G3qzewYhujDa6Sk78B+hc1yK8aXjwyVQKbcxcRHrHbjRNg==
X-Received: by 2002:a17:90b:3e8b:b0:1f5:2a52:9148 with SMTP id
 rj11-20020a17090b3e8b00b001f52a529148mr13187394pjb.175.1662276910450;
        Sun, 04 Sep 2022 00:35:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 49/63] enscript: Include string.h form str* function
 prototypes
Date: Sun,  4 Sep 2022 00:34:03 -0700
Message-Id: <20220904073417.3251865-49-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98643

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tring.h-for-strcmp-stcncmp-functions.patch | 27 +++++++++++++++++++
 .../enscript/enscript_1.6.6.bb                |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/enscript/enscript/0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch

diff --git a/meta-oe/recipes-extended/enscript/enscript/0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch b/meta-oe/recipes-extended/enscript/enscript/0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch
new file mode 100644
index 0000000000..a080b3aef7
--- /dev/null
+++ b/meta-oe/recipes-extended/enscript/enscript/0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch
@@ -0,0 +1,27 @@
+From faec0206611f8ea4ca6f70987866077ac8c3c6c1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 21:24:27 -0700
+Subject: [PATCH] getopt: Include string.h for strcmp/stcncmp functions
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compat/getopt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/compat/getopt.c b/compat/getopt.c
+index 752f28a..9b984b4 100644
+--- a/compat/getopt.c
++++ b/compat/getopt.c
+@@ -43,6 +43,7 @@
+ #endif
+ 
+ #include <stdio.h>
++#include <string.h> /* strcmp */
+ 
+ /* Comment out all this code if we are using the GNU C Library, and are not
+    actually compiling the library itself.  This code is part of the GNU C
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index 3f00621f71..9490ee09dc 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://enscript-autoconf.patch \
            file://0001-Fix-builds-with-recent-gettext.patch \
+           file://0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch \
            "
 
 inherit autotools gettext
-- 
2.37.3


