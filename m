Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 23BDB78948
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 21:09:36 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g21so6342214wrb.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2018 13:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MdFUEe3H0ujs3JENCmc+pUtmNhSeRFdNXIoDMhvobg0=;
	b=EvsPiIUStE3U9w3Nz1C2+gm14HBlRfx1hwDswoheYL2fDHSM/RUUcXyE8PVfnD/PMo
	ehV6Ccbsg9SjkzaqtSfdh9slx7dHmtRP21fUR2ZFpyOEQbxBTsnkKOKqI77t2s5S92NM
	TV9046d83dTROC/CUU8gjGV6SSWaZeP+TL8HKoMlQm6Dz6hlFXtBW/b7qZpDRd0efF44
	fJMpsuXLSFdZudYLfJHkA969V7RQbaVQ4B6w4YBeAQl2OmdlZfWRjjf63Fhl1QYlCpN7
	/Pxkskw2pWpbSKanhLG3uFyxkDpDh6jikTP2BPxXh4/YCHwdN/72+0geDmHsgtp6/vEo
	sUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MdFUEe3H0ujs3JENCmc+pUtmNhSeRFdNXIoDMhvobg0=;
	b=PqTjv4eiSAKr59Swg3IIcgKXjw89tyScP9/YOWlh89DEPqenNecNuUdqBph0H6F6c9
	FFf/Qbdrd5cUVylVyculA9Jcol3qrYK8Y8kl+yy3FbF6xOdogRz2XevtMfvh1wh3BfiW
	SOAB/mecc6NozOBD51HyFgE4RTuxMQFldsOwqPdmendBHcJ0Ei79tCyery9U0aAzRFdc
	+hZEDlfm2Abu5POTKv74aQ1yIPUmTnx0AW04a47X4GSHxY2qM/hOph3bP9aVV0ZPV2Pe
	SSsG/IaVbgpnYjoBB6o4PyXpIVjyW+JmYf0U+U7VHO4T7EQSWj3f7+lhdl86uMxzD5VI
	biEQ==
X-Gm-Message-State: AKGB3mLAOT/VKNNrNmK0qAagdi/7OP5SIp04QWp4xc4G9cQJulZWJ8wy
	SCPDu7u2rsZrHskfavUULjVXHQ==
X-Google-Smtp-Source: ACJfBospeXBQaFOUmfKv+a6bkfEftI8GYpc2hcY70nlFTqiYek7UlaJW2lFjr9Bnn9RvheEtboTw8w==
X-Received: by 10.223.158.136 with SMTP id a8mr11494274wrf.72.1515445777799;
	Mon, 08 Jan 2018 13:09:37 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d23sm14538033wma.48.2018.01.08.13.09.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 13:09:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jan 2018 21:09:34 +0000
Message-Id: <1515445774-768-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][pyro][PATCH] fluentbit: backport one patch from 0.12.0 to fix aarch64 build
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
X-List-Received-Date: Mon, 08 Jan 2018 21:09:37 -0000

* rocko and newer already have a version newer than 0.12.0
  so this change isn't needed there and 0.7.2 in morty doesn't
  need it as well.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fluentbit/fluentbit/aarch64.patch              | 64 ++++++++++++++++++++++
 .../recipes-extended/fluentbit/fluentbit_0.11.3.bb |  3 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/aarch64.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/aarch64.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/aarch64.patch
new file mode 100644
index 0000000..071dff1
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
index 8d756e6..a9433c2 100644
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
2.7.4


