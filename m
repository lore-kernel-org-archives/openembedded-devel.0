Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14B4CA5FED
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 02:16:52 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4595.1791339409448900545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 19:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M7L0OT8W;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1017426a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 19:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791339409; x=1791944209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrhURTwkf/vjU3XSS+4oUzqkCQTwiM8RCxMDDQHaY7Q=;
        b=M7L0OT8Wetp+tcaBSnq0nNqaOWPcOR9vVxKKN3JnAkuT5PUzyGJdtGSHi23wLSkGi5
         fQydfyq6gZB8dJSMALjkWgIVaR6VBf4RvQvRm2tnlG1x7A6xpSaVYCtve1pLFXXyjkCS
         SfopprRzvLizELDnqCD5KTDgaBl7QyMtV6G/YSo6XUhUyjGajv3cWCYepvb52/ILEx1B
         2XJWGId3YuYTOKDft0ZpeKIUY2HUaN1Tr3/6OQay7FUm5vSmvo2BYwsmq8hme6NCdayF
         bUYZtq7QEDfha6mL3KNmd37Pf63Kx1NUKiLgfKF9d8n86smjRv1DKHLEDLPuna7Aqc5W
         Oi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791339409; x=1791944209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrhURTwkf/vjU3XSS+4oUzqkCQTwiM8RCxMDDQHaY7Q=;
        b=PwkOHY15GY3D1aW1Ky68fK17GEM+mq2e9VmrmtYzbXxv337DUKOqvkBXLzxIySnTLR
         p0hI5ar6iEJcKgRu2joCqlgb8Lx7LuqIq/x47Br4rMUQdDdOxCH+m7/JKmik8o70wUjb
         adRsUXU6LX4rZiYzjbgErM34vrV/wFCryO8WryLWvHwEVf2HTsw4a9nmDdK8o+YDsJil
         6NUlaxAtNI8VM1A7Ya3Sj5ySSyoEHPzBMkoy2EjgAbe9xgOO8TKx0XxqcvoL+Zu4Rl32
         DnSiTooG7eddjiFVZ51yQXolLW9Nyo4sPUc5g02Vc5N7DCNZ9fVybtxk2e5uGWBWxYmL
         +uVQ==
X-Gm-Message-State: AFq9FYJezzrwiiG8rk9/ZTgDR+Fvmscusb8dxwVOPaqdAHXFjjpaWwtW
	HMhukhZJm8y3Js7NSWsNqTSU9SYSeJbQki1tFDfV5m8otj1O39G2WyAmJUp+MlQg
X-Gm-Gg: AYBFou2P9PRO5mw/h78QUtXy/nIsB3dV3ixkKdSpaKSkEWXzBZuZQ/FS0BNkRUt9jSf
	cahHz/cwRGnuaEZDPMndh6wIXSAHJspwr+EFwwcnsLU4ibXnx4rGADTunoFF8B2TAZjFkDhDstP
	+9y/C9kqqS1vWntc8ycj5khF/CAnLKxOjCSSGDWhS2SJBKc9ZG6c7ABwzIHbznvllihpYYth9Tp
	lUYMnadSWPq2xQFJ8PzhndPxW/FAiNoF4zAtac/wLZq4d+140wNtZk3xWg2LK1LEpk3QRzaxwu/
	AgQWsZifjph8bQL7FmxOKAhy5NrYEKrSfeP0TdaG3ObXhfEiZ6EacByLHO92/UNV6QXUd3rssGm
	vS+RfXTAniPadBwJOY16lhEhaht9xrwZQ1lv+LhZ1dFhJnZGFtBY9gzX4wJX8Yv9obj64xPBUQX
	QZWQltcYSStQNWR+8LX5aCWUvlZ9GMzE//qepjsIxNkzLWSf7SUeN3ZcF2TZN7gKOSSQgOxsqQ7
	IBKDbz19BRDSZbQxX8BHtI=
X-Received: by 2002:a17:90b:134d:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a8a0845143mr594150a91.23.1791339408691;
        Tue, 06 Oct 2026 19:16:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm7541636a91.13.2026.10.06.19.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 19:16:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH v2 2/2] rabbitmq-c: patch CVE-2026-44236
Date: Wed,  7 Oct 2026 15:16:30 +1300
Message-ID: <20261007021630.3024955-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007021630.3024955-1-ankur.tyagi85@gmail.com>
References: <20261007021630.3024955-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 02:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130641

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44236

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rabbitmq-c/CVE-2026-44236.patch           | 145 ++++++++++++++++++
 .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44236.patch

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44236.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44236.patch
new file mode 100644
index 0000000000..3c8a5a71a3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44236.patch
@@ -0,0 +1,145 @@
+From 17f19124ba26f9c924f9ab53bca975cb8673f862 Mon Sep 17 00:00:00 2001
+From: Kevin Valerio <kvalerio@protonmail.com>
+Date: Tue, 28 Apr 2026 13:45:22 +0200
+Subject: [PATCH] fix(connection): enforce minimum frame_max
+
+(cherry picked from commit 4777d0b5c58cb02966a04a85832436bd66ed5d1f)
+
+CVE: CVE-2026-44236
+Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/4777d0b5c58cb02966a04a85832436bd66ed5d1f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ README.md                     |  6 ++++-
+ librabbitmq/amqp_connection.c |  4 +++
+ librabbitmq/amqp_socket.c     |  1 +
+ tests/CMakeLists.txt          |  5 +++-
+ tests/test_tune_connection.c  | 51 +++++++++++++++++++++++++++++++++++
+ 5 files changed, 65 insertions(+), 2 deletions(-)
+ create mode 100644 tests/test_tune_connection.c
+
+diff --git a/README.md b/README.md
+index 7c02d52..2682993 100644
+--- a/README.md
++++ b/README.md
+@@ -133,6 +133,10 @@ terminal window:
+ Please see the `examples` directory for short examples of the use of
+ the `librabbitmq` library.
+ 
++During login, `frame_max` negotiation follows the AMQP minimum frame size.
++Values below `AMQP_FRAME_MIN_SIZE` are raised before the client sizes its
++outbound frame buffer or sends `connection.tune-ok`.
++
+ ### Threading
+ 
+ You cannot share a socket, an `amqp_connection_state_t`, or a channel
+@@ -177,4 +181,4 @@ NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+-SOFTWARE.
+\ No newline at end of file
++SOFTWARE.
+diff --git a/librabbitmq/amqp_connection.c b/librabbitmq/amqp_connection.c
+index 4326ef7..f016fc1 100644
+--- a/librabbitmq/amqp_connection.c
++++ b/librabbitmq/amqp_connection.c
+@@ -113,6 +113,10 @@ int amqp_tune_connection(amqp_connection_state_t state, int channel_max,
+ 
+   ENFORCE_STATE(state, CONNECTION_STATE_IDLE);
+ 
++  if (frame_max < AMQP_FRAME_MIN_SIZE) {
++    frame_max = AMQP_FRAME_MIN_SIZE;
++  }
++
+   state->channel_max = channel_max;
+   state->frame_max = frame_max;
+ 
+diff --git a/librabbitmq/amqp_socket.c b/librabbitmq/amqp_socket.c
+index 094ceb7..a7206c7 100644
+--- a/librabbitmq/amqp_socket.c
++++ b/librabbitmq/amqp_socket.c
+@@ -1387,6 +1387,7 @@ static amqp_rpc_reply_t amqp_login_inner(amqp_connection_state_t state,
+   if (res < 0) {
+     goto error_res;
+   }
++  client_frame_max = (uint32_t)amqp_get_frame_max(state);
+ 
+   {
+     amqp_connection_tune_ok_t s;
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 8c0aee0..624e7f5 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -23,6 +23,10 @@ add_executable(test_status_enum
+ target_link_libraries(test_status_enum rabbitmq-static)
+ add_test(status_enum test_status_enum)
+ 
++add_executable(test_tune_connection test_tune_connection.c)
++target_link_libraries(test_tune_connection rabbitmq-static)
++add_test(tune_connection test_tune_connection)
++
+ add_executable(test_basic
+                test_basic.c)
+ target_link_libraries(test_basic rabbitmq-static)
+@@ -40,4 +44,3 @@ add_test(sasl_mechanism test_sasl_mechanism)
+ add_executable(test_merge_capabilities test_merge_capabilities.c)
+ target_link_libraries(test_merge_capabilities rabbitmq-static)
+ add_test(merge_capabilities test_merge_capabilities)
+-
+diff --git a/tests/test_tune_connection.c b/tests/test_tune_connection.c
+new file mode 100644
+index 0000000..276e18d
+--- /dev/null
++++ b/tests/test_tune_connection.c
+@@ -0,0 +1,51 @@
++// Copyright 2007 - 2021, Alan Antonuk and the rabbitmq-c contributors.
++// SPDX-License-Identifier: mit
++
++#include "amqp_private.h"
++#include <rabbitmq-c/amqp.h>
++#include <rabbitmq-c/framing.h>
++
++#include <stdio.h>
++#include <stdlib.h>
++
++static void expect_frame_max(int requested, int expected) {
++  int res;
++  amqp_connection_state_t state = amqp_new_connection();
++
++  if (state == NULL) {
++    fprintf(stderr, "amqp_new_connection failed\n");
++    abort();
++  }
++
++  state->state = CONNECTION_STATE_IDLE;
++
++  res = amqp_tune_connection(state, 0, requested, 0);
++  if (res != AMQP_STATUS_OK) {
++    fprintf(stderr, "amqp_tune_connection returned %d\n", res);
++    abort();
++  }
++
++  if (amqp_get_frame_max(state) != expected) {
++    fprintf(stderr, "expected frame_max %d, got %d\n", expected,
++            amqp_get_frame_max(state));
++    abort();
++  }
++
++  if (state->outbound_buffer.len != (size_t)expected) {
++    fprintf(stderr, "expected outbound buffer length %d, got %zu\n", expected,
++            state->outbound_buffer.len);
++    abort();
++  }
++
++  amqp_destroy_connection(state);
++}
++
++int main(void) {
++  expect_frame_max(0, AMQP_FRAME_MIN_SIZE);
++  expect_frame_max(1, AMQP_FRAME_MIN_SIZE);
++  expect_frame_max(AMQP_FRAME_MIN_SIZE - 1, AMQP_FRAME_MIN_SIZE);
++  expect_frame_max(AMQP_FRAME_MIN_SIZE, AMQP_FRAME_MIN_SIZE);
++  expect_frame_max(AMQP_DEFAULT_FRAME_SIZE, AMQP_DEFAULT_FRAME_SIZE);
++
++  return 0;
++}
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
index 642e1e443b..f3c2a52fa2 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
            file://CVE-2026-44235.patch \
+           file://CVE-2026-44236.patch \
 "
 SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
 

