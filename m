Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041A2ECAAD7
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.34052.1661494322473954913
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZAK+CxN8;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id f4so519762pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=L+JONN56G/6eKgM7SaFfUq1IL49oE54j7rz9RgMZfso=;
        b=ZAK+CxN8Iy5gCkk3BDNuUm8kEzdJvnLeZUQabgOGKEajhnUKA2VNjMu2juGIGB3P7H
         Oem6fkW5jZjIau4gN4osYTQ7ebRCcPRj5dRPCwAobwS3lLfL7cVCTitFtBVDVJn9odC7
         TJsNA2K07PPp3DvC/8q2GmH5aWZSJPzgi/LzQg8NiNNvKP8aPI1zrLcSJM6ULcppVlZ4
         nu8Zq/fD4y+7L2dAu4cp+l1xxdn0Ilu1O3QaHJQqs5RfPOxNqPx0vumQxHFfwfFt6JVJ
         zbQdTJYN2wDtLN//oiL078tFz0H6O6yjGyGdPNoRGgaog8mDgH2pXqMj66pFoKd+WKAa
         b0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=L+JONN56G/6eKgM7SaFfUq1IL49oE54j7rz9RgMZfso=;
        b=V4gc76k797Dv7yQXZh1+zzCPADMmx2DwOeqTaltHrRpFYyk1bEzSyhLmil6gYoDrUN
         daqi/WQDuv3Zm8FHAt55Wlu0lhMQdshnu6/tModAlXEbm8ahT0VYm4Uu8DSzYfmKBbVn
         jb63+Ec+9ebeqD+CO1l9XiM3GaEtSS//uUYMnAFt/eL0Za93ftFFkH/ymA2yQ9Rrr/IX
         v+Za7da5rQrHKAv6UqMKVzrPqO0QLyANwWT/n+9CEe7jON+vA5TzuBqgUTmchGZfSh2J
         XjT+H4dtrxPl4YOPZ/bUsDPIEy/WBVuyAQ9qFKtjRsrfOynAPc8RjOe3gEwamRcmSgqv
         nIFQ==
X-Gm-Message-State: ACgBeo02WvL5VzksNCT5kWQ+K3rfO0LiA6EzlunA0a7lpukzjRPkObAq
	k26/LdkyNepTj3r0SlBVi51O1VIy6mIE0Q==
X-Google-Smtp-Source: 
 AA6agR56oEpoukcerbYWINuYB1jE4VPaAzKPnrvfPl+bIpt8C8RNNhyP8KGq1QVJ5UfhFOJd9Xvbqw==
X-Received: by 2002:a63:485:0:b0:42b:1d81:8619 with SMTP id
 127-20020a630485000000b0042b1d818619mr1986747pge.343.1661494321601;
        Thu, 25 Aug 2022 23:12:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:12:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 9/9] satyr: Fix build on musl/clang
Date: Thu, 25 Aug 2022 23:11:50 -0700
Message-Id: <20220826061150.3030485-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826061150.3030485-1-raj.khem@gmail.com>
References: <20220826061150.3030485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98472

Fixes
| py_base_stacktrace.c:301:5: error: call to undeclared function 'g_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
|     g_free(text);
|     ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-py_base_stacktrace.c-include-glib.h.patch | 29 +++++++++++++++++++
 meta-oe/recipes-support/satyr/satyr_0.39.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/satyr/files/0001-py_base_stacktrace.c-include-glib.h.patch

diff --git a/meta-oe/recipes-support/satyr/files/0001-py_base_stacktrace.c-include-glib.h.patch b/meta-oe/recipes-support/satyr/files/0001-py_base_stacktrace.c-include-glib.h.patch
new file mode 100644
index 0000000000..fe3b1c12d2
--- /dev/null
+++ b/meta-oe/recipes-support/satyr/files/0001-py_base_stacktrace.c-include-glib.h.patch
@@ -0,0 +1,29 @@
+From 3b84fe4375292d00ebb605a5917e66129fe5f0cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Aug 2022 23:26:46 -0700
+Subject: [PATCH] py_base_stacktrace.c: include glib.h
+
+This file has references to g_free from glib-2.0 which needs this header
+
+Upstream-Status: Submitted [https://github.com/abrt/satyr/pull/333]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ python/py_base_stacktrace.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/py_base_stacktrace.c b/python/py_base_stacktrace.c
+index b9bd16c..301db84 100644
+--- a/python/py_base_stacktrace.c
++++ b/python/py_base_stacktrace.c
+@@ -17,7 +17,7 @@
+     with this program; if not, write to the Free Software Foundation, Inc.,
+     51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ */
+-
++#include <glib.h>
+ #include "py_common.h"
+ #include "py_base_thread.h"
+ #include "py_base_stacktrace.h"
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-support/satyr/satyr_0.39.bb b/meta-oe/recipes-support/satyr/satyr_0.39.bb
index 32f27f5cbd..be1ef3f790 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.39.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.39.bb
@@ -9,6 +9,7 @@ inherit autotools-brokensep python3native pkgconfig
 
 SRC_URI = "git://github.com/abrt/satyr.git;branch=master;protocol=https \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
+           file://0001-py_base_stacktrace.c-include-glib.h.patch \
 "
 SRCREV = "f8a0dbfe7fcc6e44f03d66ca5c81363aea318380"
 S = "${WORKDIR}/git"
-- 
2.37.2


