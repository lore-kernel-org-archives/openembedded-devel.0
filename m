Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95691CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 11:16:29 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.43966.1757589383604695145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 04:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RB9kvq6D;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-620724883e6so1253109a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 04:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757589382; x=1758194182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2yVFBC2kSy6LB3dg6XVBx6JdxqZE8qcVKmQoPb8BKQ=;
        b=RB9kvq6Dhz+0gIOri8myUdTVX0ozYmNpLfBma5TD0OHzrt8VN6EM9JmjvMX7A3Q5Kz
         DxEzoqhtWc0RSUmN4lPeoUZomhNjOEq88zHJZcdYBlC131JJGQPAYQjy/OfexsRINHGi
         etC1rD7YS6XDi7Ztg6lGMcJi3C4Bn5kZTrVt6nM/88mrJjcOolMj8IdarExSo2ZWjSPh
         zXReMutIhdDfYE/0yBCbV8detjvDDD+YERgwxXMH14Jf4+y7n26pwXoO5ZNFz1nZVB91
         byFJ9Go9r0XbkU2r13SnTRZOau6ko8VQAWvsN+ySlrd5BLiZCcvb/bD6Xa2jZ2qdBkeV
         cqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589382; x=1758194182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2yVFBC2kSy6LB3dg6XVBx6JdxqZE8qcVKmQoPb8BKQ=;
        b=Ya0JHQmDWFdSgGGr1zAcFbT8pUvMOtAH6q9s47Hm3clpbY6jcQ58NJMmSZ4ejRuP2h
         khNLO1Xsj8TqpMbPo5spJu+e3WZ75RBtbMIBQrsmYHV48REr9qNgh1sHqS0hqGhOHzMX
         1GeTKVzT5HZnM/8fJLTIheIgqfo9fiaKVWWZHamlsgcGk+sFHbfrip/9bQfc7mBUebot
         BKo2c0CrpIts5OwTP/3PIihmkN/X1PFEovP9d7hM3Xh5BvgUpZvPCBTdSz1XQSEKJWxp
         LPRrsCzBiNL7AOHiLIubD1q5qIxjzBoMWzUImaXZ11qAzpXjbeFSRp6P6I8bGMtVExWB
         G7VA==
X-Gm-Message-State: AOJu0YyIYw6ltLmBLMrDOqNGKgR8/nhnOWK82LU/ilFv6OG12r4wtu0V
	WjksnBhQD9ITau8VMa3kecR983B7ir7QfKruiooWhzK3wIDoXJdhOdXS3ch2RQ==
X-Gm-Gg: ASbGncu2CBIJgJY2DRpUFyz0TaQFOTMz7PqpRGYhm0GHM04PFQlHv5tgwNPlCXcFZJ6
	zJU/Kap+xF79Z8G9uyuURQj5sKha8dKtAQiK3cb7EqTWrOpd3gu6LdnwG7zaCbb5EEpnXsTdtud
	/HDlPRVNBUOGjtRJcXxYHr5Uqufq4WtmUrMBg86AClQOfKYwfiRnYyZjeDVm8ztbOsULR6UjMZW
	Hmp+EM26l5875N6pv98l2DWqEXwN2Ppnz7c1tbz8yUThO63+fRwkkd8OdlZFcpJe/AJe7f8sy4l
	6TdsUHY5Ei+W1jp6fSUiRoz6izBh3hffnYUY/uB1/Kctfp0rxJW/qNvO6RScKHF/+yXKXSJ13iR
	ZIFG26faJK0wUM1mCd+YT
X-Google-Smtp-Source: AGHT+IGqOr+mtzaIrUFnQLieltJudSnFGOCL6mKLRl3o0en/d7m29lEInZcWZ/BB0rr05IPuwfZVRg==
X-Received: by 2002:a17:907:960b:b0:b04:8d6c:507a with SMTP id a640c23a62f3a-b04b167e206mr1823149966b.50.1757589381431;
        Thu, 11 Sep 2025 04:16:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f35cdsm108757866b.92.2025.09.11.04.16.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:16:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] pgpool2: fix compiling for 32-bit arches
Date: Thu, 11 Sep 2025 13:16:19 +0200
Message-ID: <20250911111619.3141859-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 11:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119362

When compiling for 32-bit targets, two issues came to surface:

1. gcc was complaining that math.h is not included in snprintf, and some
   calls were implicitly defined. Added a patch that includes the required
   headers in snprintf.c file:

| snprintf.c: In function 'fmtfloat':
| snprintf.c:1232:13: error: implicit declaration of function 'isnan' [-Wimplicit-function-declaration]
|  1232 |         if (isnan(value))
|       |             ^~~~~
| snprintf.c:50:1: note: include '<math.h>' or provide a declaration of 'isnan'

2. The code passes a time_t argument to a function that expects a long. This works for
   64-bit targets, because on those usually time_t is long.
   However on 32-bit systems time_t is usually long long, which makes compilation fail
   with the following error:

| wd_json_data.c:540:66: error: passing argument 3 of 'json_get_long_value_for_key' from incompatible pointer type [-Wincompatible-pointer-types]
|   540 |         if (json_get_long_value_for_key(root, "StartupTimeSecs", &wdNode->startup_time.tv_sec))
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

   To account for this, add a new helper method in a patch that returns the required json value
   as a time_t value.

The patches are in pending state, because the mailing list of the project is sufferring from
technical problems - when the site loads, sign up attempts throw internal server errors.

It is planned to submit the patches and to update the status once their infrastructure is back.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...0001-fix-compiling-on-32-bit-systems.patch | 83 +++++++++++++++++++
 ...h.h-to-ensure-isnan-and-isinf-are-de.patch | 40 +++++++++
 .../recipes-support/pgpool2/pgpool2_4.5.4.bb  |  2 +
 3 files changed, 125 insertions(+)
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
new file mode 100644
index 0000000000..cb6da7b08e
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
@@ -0,0 +1,83 @@
+From 523ca5546b0178be693943f2a3a880c0bd6ea239 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 11 Sep 2025 12:36:29 +0200
+Subject: [PATCH] fix compiling on 32-bit systems
+
+The timespec struct's tv_sec size can change between architectures.
+Usually on 64 bit systems it's long, but on 32 bit systems it is frequently long long.
+
+When the watchdog is trying to get the uptime, it is trying to get the value
+as long - however on 32 bit systems this fails due to different time_t size:
+
+| wd_json_data.c:540:66: error: passing argument 3 of 'json_get_long_value_for_key' from incompatible pointer type [-Wincompatible-pointer-types]
+|   540 |         if (json_get_long_value_for_key(root, "StartupTimeSecs", &wdNode->startup_time.tv_sec))
+|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+To account for this, introduce a new helper function to get a json value as
+a time_t type.
+
+Upstream-Status: Pending [project ML registration is down]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/include/utils/json.h    |  5 +++--
+ src/utils/json.c            | 14 ++++++++++++++
+ src/watchdog/wd_json_data.c |  2 +-
+ 3 files changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/src/include/utils/json.h b/src/include/utils/json.h
+index 67cc0255a..93be83c3a 100644
+--- a/src/include/utils/json.h
++++ b/src/include/utils/json.h
+@@ -311,10 +311,11 @@ extern "C"
+ #endif
+ 
+ /* pgpool-II extensions */
+-json_value *json_get_value_for_key(json_value * source, const char *key);
++json_value		*json_get_value_for_key(json_value * source, const char *key);
+ int			json_get_int_value_for_key(json_value * source, const char *key, int *value);
+ int			json_get_long_value_for_key(json_value * source, const char *key, long *value);
+-char	   *json_get_string_value_for_key(json_value * source, const char *key);
++char			*json_get_string_value_for_key(json_value * source, const char *key);
+ int			json_get_bool_value_for_key(json_value * source, const char *key, bool *value);
++int			json_get_time_value_for_key(json_value * source, const char *key, time_t *value);
+ 
+ #endif
+diff --git a/src/utils/json.c b/src/utils/json.c
+index 319c8fdbf..bce99466c 100644
+--- a/src/utils/json.c
++++ b/src/utils/json.c
+@@ -1204,6 +1204,20 @@ json_get_long_value_for_key(json_value * source, const char *key, long *value)
+ 	return 0;
+ }
+ 
++int
++json_get_time_value_for_key(json_value * source, const char *key, time_t *value)
++{
++        json_value *jNode;
++
++        jNode = json_get_value_for_key(source, key);
++        if (jNode == NULL)
++                return -1;
++        if (jNode->type != json_integer)
++                return -1;
++        *value = jNode->u.integer;
++        return 0;
++}
++
+ /*
+  * pgpool extension:
+  * returns string value if found for the key.
+diff --git a/src/watchdog/wd_json_data.c b/src/watchdog/wd_json_data.c
+index 474fc37a4..53053cd4b 100644
+--- a/src/watchdog/wd_json_data.c
++++ b/src/watchdog/wd_json_data.c
+@@ -537,7 +537,7 @@ get_watchdog_node_from_json(char *json_data, int data_len, char **authkey)
+ 	if (root == NULL || root->type != json_object)
+ 		goto ERROR_EXIT;
+ 
+-	if (json_get_long_value_for_key(root, "StartupTimeSecs", &wdNode->startup_time.tv_sec))
++	if (json_get_time_value_for_key(root, "StartupTimeSecs", &wdNode->startup_time.tv_sec))
+ 	{
+ 		bool		escalated;
+ 		long		seconds_since_node_startup;
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch
new file mode 100644
index 0000000000..335761c9bf
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch
@@ -0,0 +1,40 @@
+From c0b6ae020ad87040b5bc6fbae94fb815f10884d2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 11 Sep 2025 11:58:02 +0200
+Subject: [PATCH] snprintf: Add math.h to ensure isnan and isinf are defined
+
+When building for 32-bit arm arch, compilation fails with the following error:
+| snprintf.c: In function 'fmtfloat':
+| snprintf.c:1232:13: error: implicit declaration of function 'isnan' [-Wimplicit-function-declaration]
+|  1232 |         if (isnan(value))
+|       |             ^~~~~
+| snprintf.c:50:1: note: include '<math.h>' or provide a declaration of 'isnan'
+|    49 | #include "postgresql/server/port.h"
+|   +++ |+#include <math.h>
+|    50 |
+| snprintf.c:1254:21: error: implicit declaration of function 'isinf' [-Wimplicit-function-declaration]
+|  1254 |                 if (isinf(value))
+|       |                     ^~~~~
+| snprintf.c:1254:21: note: include '<math.h>' or provide a declaration of 'isinf'
+
+To avoid the error, add math.h to snprintf.c.
+
+Upstream-Status: Pending [project ML registration is down]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/parser/snprintf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/parser/snprintf.c b/src/parser/snprintf.c
+index 6dd4a50..cce7951 100644
+--- a/src/parser/snprintf.c
++++ b/src/parser/snprintf.c
+@@ -36,6 +36,7 @@
+ #include "c.h"
+ #endif
+ 
++#include <math.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <stdint.h>
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
index 706e7360a2..5eb06e0298 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 
 SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
+           file://0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch \
+           file://0001-fix-compiling-on-32-bit-systems.patch \
 	   file://define_SIGNAL_ARGS.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \

