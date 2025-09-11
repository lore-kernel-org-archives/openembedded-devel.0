Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E20CCAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 11:22:49 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.44059.1757589764090573836
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 04:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K1lnAY6p;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so73390366b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 04:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757589762; x=1758194562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlcbNz8EoUMM1kNECb34TNPBimTFyOH16W8VM1Jot94=;
        b=K1lnAY6pSmFUj27UW+z6Nmpf0Jr3N0AFJGrb1QReawaCZAxFlBE5Uiq+BuzYIf+UHi
         0b1ns0ne4zNwFzzCy+aXSA/CD/DVZTz2n0+5Vrps4iD5prb9ljdQ/x6+IEBzppiDDAsp
         EMKh2tXhxykVpKsHhA3FDs4GzEzZzpLz/1f+ftV7BUXBO21GFZljXJGkcK/R5J+hzwoc
         s16P5P8tKqfZnxMHs4IouwH0XvIIKvyNd7yILyKESFffn3moYxu5uPVclXCW+GlhyK4N
         blNaPo++F4I+xLLQW2utS8xLMbO9Wn+cwQ0MVrZg8VgncpDqgnz1GdTLojq81BAEyNHD
         MsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589762; x=1758194562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlcbNz8EoUMM1kNECb34TNPBimTFyOH16W8VM1Jot94=;
        b=vwPFXC+3nnHs1FfSCmvtVZRVlE8u2abibMi7SmsoLNerOVnOLpiy3GVXhzrEpRZYQF
         Qd++KrIBuo5YQNIxw7W8yW9o7oECe2NrJ1FfqyJdA2v0QLy/m4Gvo8l/GsDfFQElmM6e
         UDR5VeA7iMCUepeghpcd9PEP7zkKudtVOIat6fPtQ+5ChUIDVtYm4R205oVuSKXwl4ce
         07O9ngV0YdlVXTzxISsxW+nTbi3PYcv2fFueKhzt4T1E6YS+lt/WzqftwtnH4/svXp4U
         orQFhyJyvKIhMQoOjGbKvqLC+9hC7R6vxr2UEUaIDm47DS9vrGz1zRSAA2oPjmHl2lpC
         iJlg==
X-Gm-Message-State: AOJu0Ywn2TSykYajhGYZ/pD8KoAx9v7HeOdEsGDjJhSZIF4KEsCsoMK7
	SY0SdtAbuiBHkCzuQ8BZR3fKWJsJUVFsXE6tdnCrOatSLhJ8X/KDgRKsJded9Q==
X-Gm-Gg: ASbGncuP5l4UbaKCEt/vSyYd2Tf3i9cNId9qWKuTl/GrvzO14d3POeNXvBDhnC0/SaF
	sGE6D6V8wL/GlFkW6Uw7sfkVqH305j/msecyZEYuc8/0DPe8Cz57sNQdnJlQnPsnJ51W5Y9V514
	usTnwqeFKJvXvXiZm6tDBT+0Xyi0Y7kOA3fIjoDBLmwNofTSHp7E5TVMCHAM+xmFuqsPwf9f25K
	NN7ahEUJdHuLbKKgvjGKbi1nIBFBWqlf0h8Pky24Of4Nr2qbUSwKM4aMqg2DOyZlG9mtAeq0A9J
	zI7glSSCjtTQh6wseylS9qQMEE+Q2tE/t3iGNcQk9FqMkA8Dy8+4Dm5sfFCFGRCxEwjWwtasEpG
	Hqgq5l9asNGBHjHF56vry
X-Google-Smtp-Source: AGHT+IG8V1LR78wCz5mf9vVW3T4QpWgcgWGcLlIyoQNIKZ75ltJ46457MH7Kq0rtFgf0H1IlVqjWaw==
X-Received: by 2002:a17:906:7954:b0:af9:c119:3b4 with SMTP id a640c23a62f3a-b04b13fe1aemr1855571366b.13.1757589762160;
        Thu, 11 Sep 2025 04:22:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31295c9sm114824166b.43.2025.09.11.04.22.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:22:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH 4/4] pgpool2: fix compiling for 32-bit arches
Date: Thu, 11 Sep 2025 13:22:38 +0200
Message-ID: <20250911112238.3277434-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911112238.3277434-1-skandigraun@gmail.com>
References: <20250911112238.3277434-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 11:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119366

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
index d3bfd4ba79..8cec1535b8 100644
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

