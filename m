Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE9778AA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:14:32 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id o13-v6so555797wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=szzz/SvuKoyINrKaL7F4Syk7CYAYR0VsQXlx3JsQb8E=;
	b=bKwog/WGXx7l8QcwBa4caMj9XSljiBW1lLmClGXvqpjNDS+CyWMzF661fNHkWHOxAy
	Aj9OIXtY9JARX+iw6vTYkzxCf7cMr6WGXKWva3YxtDQRtjS4o3UxV7QvIcJt+DnmYOWr
	HnVMUjyWxlAt23qJXqMZBLRLuzYuHqVZJ2Uvy+rl1c8l9eYXlVsL603iedzd3evKCSOh
	BRZ4H8A6b4vCzYAHEkPRg0TM6ZeUZOWFVBgIg8trVLcy5BMle0KlO1y24RdSw/ALeoqh
	hOAoGHeRiL4pfgDVVkuhwQ23b3e7rLT2NLmbmmK/ratSbWWLL2SxTckF6vUEuyPk9Z7v
	7COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=szzz/SvuKoyINrKaL7F4Syk7CYAYR0VsQXlx3JsQb8E=;
	b=aJlEktbltB/A+i+hevlN2HMhZoRTxgj8ToVzPUpHXck0loOoWMKUeHkUYjd65iwV1w
	abayQ48+uiM+LBdf1+UmNObw8ViQmYfzOQwubPzE4jNIOmdIZk5JGIl0g4e9yh/Y6SeZ
	czIqV9ANFpFsJEu8xrbK/YCDcXDP5LEsCA7jWjhptGf7exavGyBwOor9gkpFqf4mPZ2+
	Y9x2w49AFsrrbtNELjlN3ol8/fE6wMv172vTdmLej2NPdDb698cchehWl/LjVt/sHGgf
	r7mHNUXIT1hDmKCWf6HZtnFD0FCHt+M2tjD8QHempSbbPwA6aqaSICWSuKWvBP2f8WAY
	Wexg==
X-Gm-Message-State: APt69E0nCSBj2VdjvAHCb3QwfuF8IR8Hs00w4t0v92R6jothraCO2AvK
	RdutxGbb8Q09Xw67tsvuhCGgrg==
X-Google-Smtp-Source: ADUXVKKYmJME1M6BS2Wpz94rLriL7n3vCbvINSiNgtewLz5sK+R1AmuJq1MLbN6k8WkYF1WGbJy/6w==
X-Received: by 2002:a1c:6d41:: with SMTP id
	i62-v6mr1023189wmc.25.1528827272789; 
	Tue, 12 Jun 2018 11:14:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b190-v6sm1677074wma.24.2018.06.12.11.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jun 2018 11:14:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 18:14:24 +0000
Message-Id: <20180612181426.2944-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][pyro][meta-oe 1/3] fluentbit: backport one patch from 0.12.0 to fix aarch64 build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2018 18:14:32 -0000

* rocko and newer already have a version newer than 0.12.0
  so this change isn't needed there and 0.7.2 in morty doesn't
  need it as well.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fluentbit/fluentbit/aarch64.patch         | 64 +++++++++++++++++++
 .../fluentbit/fluentbit_0.11.3.bb             |  3 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/aarch64.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/aarch64.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/aarch64.patch
new file mode 100644
index 0000000000..071dff1285
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/aarch64.patch
@@ -0,0 +1,64 @@
+From a9af19d2679442b679536b51276334149b0b6655 Mon Sep 17 00:00:00 2001
+From: Eduardo Silva <eduardo@treasure-data.com>
+Date: Wed, 19 Apr 2017 12:35:53 -0600
+Subject: [PATCH] lib: flb_libco: merged changes for aarch64 support (#228)
+
+This patch merge the following changes:
+
+ - 534e405 armv8: on arm64 (aarch64) use sjlj backend
+ - fdcb558 sjlj: include missing settings and adapt API
+ - 9dab058 settings: tweak for Windows build
+
+These changes needs further testing on a armv8 platform.
+
+Upstream-Status: Backport [from 0.12.0 https://github.com/fluent/fluent-bit/commit/a9af19d2679442b679536b51276334149b0b6655]
+
+Signed-off-by: Eduardo Silva <eduardo@treasure-data.com>
+---
+ lib/flb_libco/libco.c | 2 ++
+ lib/flb_libco/sjlj.c  | 5 ++++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/flb_libco/libco.c b/lib/flb_libco/libco.c
+index 13eb2379..2db92e95 100755
+--- a/lib/flb_libco/libco.c
++++ b/lib/flb_libco/libco.c
+@@ -14,6 +14,8 @@
+     #include "amd64.c"
+   #elif defined(__arm__)
+     #include "arm.c"
++  #elif defined(__aarch64__)
++    #include "sjlj.c"
+   #elif defined(_ARCH_PPC)
+     #include "ppc.c"
+   #elif defined(_WIN32)
+diff --git a/lib/flb_libco/sjlj.c b/lib/flb_libco/sjlj.c
+index dfa0aa45..36d110b7 100755
+--- a/lib/flb_libco/sjlj.c
++++ b/lib/flb_libco/sjlj.c
+@@ -15,6 +15,7 @@
+ #include <stdlib.h>
+ #include <signal.h>
+ #include <setjmp.h>
++#include "settings.h"
+ 
+ #ifdef __cplusplus
+ extern "C" {
+@@ -41,7 +42,8 @@ cothread_t co_active() {
+   return (cothread_t)co_running;
+ }
+ 
+-cothread_t co_create(unsigned int size, void (*coentry)(void)) {
++cothread_t co_create(unsigned int size, void (*coentry)(void),
++                     size_t *out_size) {
+   if(!co_running) co_running = &co_primary;
+ 
+   cothread_struct *thread = (cothread_struct*)malloc(sizeof(cothread_struct));
+@@ -78,6 +80,7 @@ cothread_t co_create(unsigned int size, void (*coentry)(void)) {
+     }
+   }
+ 
++  *out_size = size;
+   return (cothread_t)thread;
+ }
+ 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb
index 8d756e6a40..a9433c284a 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb
@@ -5,7 +5,8 @@ BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
 SRC_URI = "http://fluentbit.io/releases/0.11/fluent-bit-${PV}.tar.gz \
            file://0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch \
            file://0002-msgpack-Add-comment-for-intended-fallthrough.patch \
-           "
+           file://aarch64.patch \
+"
 SRC_URI[md5sum] = "9383262339412782b80cc49e7ad15609"
 SRC_URI[sha256sum] = "eb8a85c656fa60682b0bf8dd1ad58d848cd251dab4f35a6777acd552c65b0511"
 
-- 
2.17.1


