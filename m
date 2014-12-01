Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 69DFB72228
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:47 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id ft15so9700764pdb.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=MYD+ztItEMNsy288vwl/tH0eqaXjLETmL9MaJ3aofDc=;
	b=KppvqHeo7D82yUHM73CUaJjoQ3neyW+z9lanXK8YvCDbSzEonc1QJPSffyBg0sP6Cm
	tPSYlJVFqizE12Fwk3Wv1z2dtwbSswEkCqOVdF4dI9WIF6q6g2yvzQMrPRyT5CKDivqW
	7QqWgZ2DJ0IgK0nOt4L14GPnOnIfBtHjT7y7H9d38A0jxLebamQ1jgYH8EwXv02Gx7S4
	fzr+mZIERuXS9yAp3b3Y72usqF/ZvHK4MtLZ/m9dUmohpcDX4HP+zqFLRUwSZbhb/iGM
	GjFv9BEprjV1fRl9jvGOkDY1T7J01MTZp+Q382we3qneVkeFAG9Gn0cWFDE5dFgXA2WR
	drxw==
X-Received: by 10.66.179.16 with SMTP id dc16mr96560755pac.11.1417395888769;
	Sun, 30 Nov 2014 17:04:48 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:15 -0800
Message-Id: <94de8bcf6f8558bbd43374e69bb324237f8d8b0d.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [PATCH 13/15] syslog-ng: Fix memory leak when udp connection is used [ LIN7-1379 ]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Dec 2014 01:04:48 -0000

From: Xufeng Zhang <xufeng.zhang@windriver.com>

When udp connection is used, there are several memory leaks happen
after run a long time.

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../logwriter-dont-allocate-a-new-buffer.patch     | 26 +++++++
 .../logwriter-still-free-the-unconsumed-item.patch | 47 -----------
 .../rewrite-expr-grammar.ym-Free-up-token.patch    | 17 ++++
 .../files/still-free-the-unconsumed-item.patch     | 90 ++++++++++++++++++++++
 .../recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb |  4 +-
 5 files changed, 136 insertions(+), 48 deletions(-)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/still-free-the-unconsumed-item.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch b/meta-oe/recipes-support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch
new file mode 100644
index 0000000..9e3d64b
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch
@@ -0,0 +1,26 @@
+logwriter: Don't allocate a new buffer if fails to consume current item
+
+Upstream-Status: Pending
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+---
+--- a/lib/logwriter.c
++++ b/lib/logwriter.c
+@@ -1010,7 +1010,7 @@
+         {
+           status = log_proto_client_post(proto, (guchar *) self->line_buffer->str, self->line_buffer->len, &consumed);
+ 
+-          if (consumed)
++          if (consumed && status != LPS_ERROR)
+             log_writer_realloc_line_buffer(self);
+ 
+           if (status == LPS_ERROR)
+@@ -1028,7 +1028,7 @@
+                     NULL);
+           consumed = TRUE;
+         }
+-      if (consumed)
++      if (consumed && status != LPS_ERROR)
+         {
+           if (lm->flags & LF_LOCAL)
+             step_sequence_number(&self->seq_num);
diff --git a/meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch b/meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch
deleted file mode 100644
index 3111093..0000000
--- a/meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-logwritter: still free the unconsumed item during reloading configuration
-
-Otherwise we have no chance to free this stuff.
-
-Upstream-Status: Pending
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
----
---- a/lib/logwriter.c
-+++ b/lib/logwriter.c
-@@ -39,6 +39,7 @@
- #include <iv.h>
- #include <iv_event.h>
- #include <iv_work.h>
-+#include "logproto/logproto-text-client.h"
- 
- typedef enum
- {
-@@ -978,6 +979,7 @@
-   gint count = 0;
-   gboolean ignore_throttle = (flush_mode >= LW_FLUSH_QUEUE);
-   LogProtoStatus status = LPS_SUCCESS;
-+  LogProtoTextClient *self_text;
-   
-   if (!proto)
-     return FALSE;
-@@ -1035,7 +1037,18 @@
-         }
-       else
-         {
--          /* push back to the queue */
--          log_queue_push_head(self->queue, lm, &path_options);
-+          self_text = (LogProtoTextClient *) proto;
-+          /* free the unconsumed message during reloading configuration */ 
-+          if ((LW_FLUSH_QUEUE == flush_mode) && self_text->partial_free && self_text->partial)
-+            {
-+              self_text->partial_free(self_text->partial);
-+              self_text->partial = NULL;
-+              log_msg_unref(lm);
-+            }
-+          else
-+            {
-+              /* push back to the queue */
-+              log_queue_push_head(self->queue, lm, &path_options);
-+            }
-           msg_set_context(NULL);
-           log_msg_refcache_stop();
diff --git a/meta-oe/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch b/meta-oe/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
new file mode 100644
index 0000000..1951af9
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
@@ -0,0 +1,17 @@
+rewrite-expr-grammar.ym: Free up token.
+
+Upsteam-Status: Backport
+
+Reported-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+Signed-off-by: Viktor Tusa <tusavik@gmail.com>
+---
+--- a/lib/rewrite/rewrite-expr-grammar.ym
++++ b/lib/rewrite/rewrite-expr-grammar.ym
+@@ -78,6 +78,7 @@
+ 
+ 	    $$ = log_template_new(configuration, $1);
+ 	    CHECK_ERROR(log_template_compile($$, $1, &error), @1, "Error compiling template (%s)", error->message);
++            free($1);
+ 	  }
+ 	;
+ 
diff --git a/meta-oe/recipes-support/syslog-ng/files/still-free-the-unconsumed-item.patch b/meta-oe/recipes-support/syslog-ng/files/still-free-the-unconsumed-item.patch
new file mode 100644
index 0000000..ea18682
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/still-free-the-unconsumed-item.patch
@@ -0,0 +1,90 @@
+From 365020c5c0823c91a8011e34597f970a7cfb4fb3 Mon Sep 17 00:00:00 2001
+From: Tusa Viktor <tusavik@gmail.com>
+Date: Wed, 23 Apr 2014 17:10:58 +0000
+Subject: [PATCH] logwriter: still free the unconsumed item during reloading
+ configuration
+
+Upstream-Status: Backport
+
+Otherwise we have no chance to free this stuff.
+
+Reported-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+Signed-off-by: Tusa Viktor <tusavik@gmail.com>
+Signed-off-by: Gergely Nagy <algernon@madhouse-project.org>
+---
+ lib/logproto/logproto-client.h      |    2 +-
+ lib/logproto/logproto-text-client.c |   11 +++++++++++
+ lib/logwriter.c                     |    9 +++++++--
+ 3 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/lib/logproto/logproto-client.h b/lib/logproto/logproto-client.h
+index 254ecf9..5adc917 100644
+--- a/lib/logproto/logproto-client.h
++++ b/lib/logproto/logproto-client.h
+@@ -47,7 +47,6 @@ void log_proto_client_options_defaults(LogProtoClientOptions *options);
+ void log_proto_client_options_init(LogProtoClientOptions *options, GlobalConfig *cfg);
+ void log_proto_client_options_destroy(LogProtoClientOptions *options);
+ 
+-
+ struct _LogProtoClient
+ {
+   LogProtoStatus status;
+@@ -107,6 +106,7 @@ log_proto_client_reset_error(LogProtoClient *s)
+ gboolean log_proto_client_validate_options(LogProtoClient *self);
+ void log_proto_client_init(LogProtoClient *s, LogTransport *transport, const LogProtoClientOptions *options);
+ void log_proto_client_free(LogProtoClient *s);
++void log_proto_client_free_method(LogProtoClient *s);
+ 
+ #define DEFINE_LOG_PROTO_CLIENT(prefix) \
+   static gpointer                                                       \
+diff --git a/lib/logproto/logproto-text-client.c b/lib/logproto/logproto-text-client.c
+index 3248759..a5100f3 100644
+--- a/lib/logproto/logproto-text-client.c
++++ b/lib/logproto/logproto-text-client.c
+@@ -146,12 +146,23 @@ log_proto_text_client_post(LogProtoClient *s, guchar *msg, gsize msg_len, gboole
+ }
+ 
+ void
++log_proto_text_client_free(LogProtoClient *s)
++{
++  LogProtoTextClient *self = (LogProtoTextClient *)s;
++  if (self->partial_free)
++    self->partial_free(self->partial);
++  self->partial = NULL;
++  log_proto_client_free_method(s);
++};
++
++void
+ log_proto_text_client_init(LogProtoTextClient *self, LogTransport *transport, const LogProtoClientOptions *options)
+ {
+   log_proto_client_init(&self->super, transport, options);
+   self->super.prepare = log_proto_text_client_prepare;
+   self->super.flush = log_proto_text_client_flush;
+   self->super.post = log_proto_text_client_post;
++  self->super.free_fn = log_proto_text_client_free;
+   self->super.transport = transport;
+   self->next_state = -1;
+ }
+diff --git a/lib/logwriter.c b/lib/logwriter.c
+index 3292e31..470bcdb 100644
+--- a/lib/logwriter.c
++++ b/lib/logwriter.c
+@@ -1063,8 +1063,13 @@ log_writer_flush(LogWriter *self, LogWriterFlushMode flush_mode)
+         }
+       else
+         {
+-          /* push back to the queue */
+-          log_queue_push_head(self->queue, lm, &path_options);
++          if (flush_mode == LW_FLUSH_QUEUE)
++            log_msg_unref(lm);
++          else
++            {
++              /* push back to the queue */
++              log_queue_push_head(self->queue, lm, &path_options);
++            }
+           msg_set_context(NULL);
+           log_msg_refcache_stop();
+           break;
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
index d5939e4..b548420 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
@@ -9,10 +9,12 @@ SRC_URI += " \
     file://Fix-the-memory-leak-problem-for-mutex.patch \
     file://Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch \
     file://free-global-LogTemplateOptions.patch \
-    file://logwriter-still-free-the-unconsumed-item.patch \
+    file://still-free-the-unconsumed-item.patch \
     file://syslog-ng-verify-the-list-before-del.patch \
     file://configure.patch \
     file://dbifix.patch \
+    file://rewrite-expr-grammar.ym-Free-up-token.patch \
+    file://logwriter-dont-allocate-a-new-buffer.patch \
 "
 
 SRC_URI[md5sum] = "ff3bf223ebafbaa92b69a2d5b729f368"
-- 
1.9.1


