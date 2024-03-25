Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A68C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 19:48:31 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.1463.1711396110688215263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 12:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y+z722Q7;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2228c3ffcbdso1997734fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711396110; x=1712000910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhZ+k+jDI+iFCV5aWFRv0/jreg5FkBwCxz4zd0KuAro=;
        b=Y+z722Q7nLeVBnrekOCc1+o2BaaxfiiR0bT47BfQjxxPjdSBAoB+ruN57b646UP+JK
         TajjTrn7kN74H2ALFpZzX8KkOX1X2NER/Jhh2hVblfhGHuzWEOlSWYGLSzxa25ZvqKTh
         nTa7OZgl6NlsItjVGxz/ygKsxER4MA5TayuLNpoh2rjgz23+3eQekVbRugo3hsFIXjyc
         dak/qrkPs1p/iUzbwHKxz/q3elaA7NPamNSLCD5UNvkwS963rWfJ+YJh7SyE9LbzpmOx
         UuMJ2uX3f7bdTmK0wUwqC3+ffDeRxmrUPnOJiCMSIhSb45gtcgQlgwq2//wOTu1fbu2M
         zELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711396110; x=1712000910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhZ+k+jDI+iFCV5aWFRv0/jreg5FkBwCxz4zd0KuAro=;
        b=RrJddnL2etP3cXq5lkfhz+nCGW5wS8vmXysvrN5c9ePJB7PBOaYJbIC6NBIL8a0tS+
         6wrAEEiUgaIKmjrIXDt1+LS5/ifql8jvro/3akxXqDL5FkPPbDCxRgeT+kI7DaoYyQqX
         cFjeuixbtsWE8L3M+WuIvlV9FNgw7vJgjzJ7sdVUVLJPdbx8vU/YrHOihqkk7ltmU+nB
         tns+lH4WeC5BtvHBSBDqDfMQ5Gn+yX9w11O75rzKHLMi6xp6z8vPqoA2qsTpxTUvS/YW
         yBflylUrtYnMoz7UJUvI8uyS0wDgs9n1eoOak0jce26Qkk1UpsoG/MUVl/yPsyfpl4vl
         j/hw==
X-Gm-Message-State: AOJu0YxoqCe7QfAXkm5F0sxKG36C0M3+70/apaDSEl93DSHpKdvrDibE
	EOVgae6myfrehVEWdtv+rSZJ/1eDE/aqslqcYxyFk5BamDRdZ/LndmRthm0Q
X-Google-Smtp-Source: AGHT+IFcwgRdWkDSnvrZOaofD1Ns7T/ENfLdSmg75zvCzqQiFyq+MgfYZgJf3Mvbd92mxY+zM9sf0w==
X-Received: by 2002:a05:6870:9714:b0:229:cea1:243e with SMTP id n20-20020a056870971400b00229cea1243emr7866318oaq.0.1711396109658;
        Mon, 25 Mar 2024 12:48:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id r14-20020a6560ce000000b005ce472f2d0fsm5122282pgv.66.2024.03.25.12.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:48:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] ssmtp: Fix build with musl >= 1.2.5
Date: Mon, 25 Mar 2024 12:48:24 -0700
Message-ID: <20240325194825.641241-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325194825.641241-1-raj.khem@gmail.com>
References: <20240325194825.641241-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109602

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-libgen.h-for-basename.patch  | 32 +++++++++++++++++++
 .../recipes-support/ssmtp/ssmtp_2.64.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/0001-include-libgen.h-for-basename.patch

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/0001-include-libgen.h-for-basename.patch b/meta-networking/recipes-support/ssmtp/ssmtp/0001-include-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..094ba5afa2
--- /dev/null
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/0001-include-libgen.h-for-basename.patch
@@ -0,0 +1,32 @@
+From b48840952ec9a68363bed960e98dd6c7aaa3acec Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 11:55:59 -0700
+Subject: [PATCH] include libgen.h for basename
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ssmtp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ssmtp.c b/ssmtp.c
+index 0a719ac..4dedaf8 100644
+--- a/ssmtp.c
++++ b/ssmtp.c
+@@ -23,6 +23,7 @@
+ #include <signal.h>
+ #include <setjmp.h>
+ #include <string.h>
++#include <libgen.h>
+ #include <ctype.h>
+ #include <netdb.h>
+ #ifdef HAVE_SSL
+-- 
+2.44.0
+
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
index 05d2bb18ff..499a79d1ed 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -8,6 +8,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
            file://build-ouside_srcdir.patch \
            file://use-DESTDIR.patch \
            file://0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch \
+           file://0001-include-libgen.h-for-basename.patch \
            "
 
 SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
-- 
2.44.0


