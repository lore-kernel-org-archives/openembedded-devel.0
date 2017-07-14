Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 966EC780C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:35 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z6so9725771pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5NBmwW89YRGxY8Dydsaa+DDX9TDB9uvqV1AOOyOIcwU=;
	b=KOuaYerPHozbM+mgBlaTUnSMXSBS6TuMex2vtzJGZ7mVKO+Ok/6CNKlXVE3Pft63pv
	tH+8qN3ddrdEwiG7/DYn5Q+/bfN8dMYOtCI/p9dzF+Vj0dMk8MgZ6lS7mLdejzEuUUec
	p85UU5HGMQzax92LDCUrmdr7OOY4pwz15+7OeNqVeZFKsBPeT6iJ0WKnJYNIpEYmtr8y
	A0K6JSf8FqhoSvoi88LYA7eIXNigzwo7UnVrl1RVXd4KpEMq/QWPsg5NC8O3VU2wKSCw
	TTI6w+9vEXQTXkT7K3qBtR1vo0g5EDhvmaujfrmKpeKvB00OfeghCAzBQEATuSAFIbTv
	YK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5NBmwW89YRGxY8Dydsaa+DDX9TDB9uvqV1AOOyOIcwU=;
	b=GBhzRVC2jY5WrMt0FJTw4YIuTjAjdppUbKXALtG//zh36Qt2mw8hA6HynlNO4m4sbU
	4yyuRobZ3XFZocrBvx6qghWWIkrYAK8ws6MV9aegZN20Z2feNzyizTYJ2WH0xulTpUYl
	Jq67yEC3awvttUFHO0cEgYqwdLhCb9e8T+Na5wc3edL0O5U88xyrwPJeZWCYeLLJ4pUh
	DU/v9MHVzUgn2znDmiJvqyvVwohcU9om74cFkSWYN66zifOnS52WnrYrUaFSuKI5dnMw
	gTjNidycXxzXdt5ksEm3O8BjAAzpH1RMgusmxV2S53kOdfHty8hRBaKz+A1oZ+C7nsd3
	g++w==
X-Gm-Message-State: AIVw113uzpaRhj66zMN2EpDuZd9n2GFotY8q+9wT44+cJBe7vKLBafIR
	BAIzV7RCkJ0nbbln
X-Received: by 10.84.128.46 with SMTP id 43mr14165087pla.113.1500010836901;
	Thu, 13 Jul 2017 22:40:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:04 -0700
Message-Id: <20170714054013.34458-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 09/18] imsettings: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Rename-use-of-stdout-and-stderr.patch     | 72 ++++++++++++++++++++++
 .../imsettings/imsettings_1.7.2.bb                 |  4 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch b/meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch
new file mode 100644
index 000000000..d77ce4d25
--- /dev/null
+++ b/meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch
@@ -0,0 +1,72 @@
+From 7ee62ef0083844ab2fffcd106e3ee2e5f29b2a91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 18:53:56 -0700
+Subject: [PATCH] Rename use of stdout and stderr
+
+Since it shadow the standard definitions especially
+seen on musl where libc defines these as macros they
+cause all short of compilation errors on musl, using
+a leading underscore makes it unique
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ imsettings-daemon/imsettings-proc.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/imsettings-daemon/imsettings-proc.c b/imsettings-daemon/imsettings-proc.c
+index 915e78b..b78fcff 100644
+--- a/imsettings-daemon/imsettings-proc.c
++++ b/imsettings-daemon/imsettings-proc.c
+@@ -39,8 +39,8 @@
+ #define MAXRESTART 3
+ 
+ typedef struct _IMSettingsProcInfo {
+-	GIOChannel     *stdout;
+-	GIOChannel     *stderr;
++	GIOChannel     *_stdout;
++	GIOChannel     *_stderr;
+ 	GPid            pid;
+ 	GTimeVal        started_time;
+ 	guint           id;
+@@ -368,12 +368,12 @@ _start_process(IMSettingsProc     *proc,
+ 					     &ofd, &efd,
+ 					     error)) {
+ 			pinfo->pid = pid;
+-			pinfo->stdout = g_io_channel_unix_new(ofd);
+-			pinfo->stderr = g_io_channel_unix_new(efd);
+-			g_io_channel_set_close_on_unref(pinfo->stdout, TRUE);
+-			g_io_channel_set_close_on_unref(pinfo->stderr, TRUE);
+-			pinfo->oid = g_io_add_watch(pinfo->stdout, G_IO_IN, _log_write_cb, proc);
+-			pinfo->eid = g_io_add_watch(pinfo->stderr, G_IO_IN, _log_write_cb, proc);
++			pinfo->_stdout = g_io_channel_unix_new(ofd);
++			pinfo->_stderr = g_io_channel_unix_new(efd);
++			g_io_channel_set_close_on_unref(pinfo->_stdout, TRUE);
++			g_io_channel_set_close_on_unref(pinfo->_stderr, TRUE);
++			pinfo->oid = g_io_add_watch(pinfo->_stdout, G_IO_IN, _log_write_cb, proc);
++			pinfo->eid = g_io_add_watch(pinfo->_stderr, G_IO_IN, _log_write_cb, proc);
+ 			g_get_current_time(&pinfo->started_time);
+ 			pinfo->id = g_child_watch_add(pid, _watch_im_status_cb, proc);
+ 
+@@ -521,13 +521,13 @@ imsettings_proc_get_property(GObject    *object,
+ static void
+ imsettings_proc_info_finalize(IMSettingsProcInfo *pinfo)
+ {
+-	if (pinfo->stdout) {
+-		g_io_channel_unref(pinfo->stdout);
+-		pinfo->stdout = NULL;
++	if (pinfo->_stdout) {
++		g_io_channel_unref(pinfo->_stdout);
++		pinfo->_stdout = NULL;
+ 	}
+-	if (pinfo->stderr) {
+-		g_io_channel_unref(pinfo->stderr);
+-		pinfo->stderr = NULL;
++	if (pinfo->_stderr) {
++		g_io_channel_unref(pinfo->_stderr);
++		pinfo->_stderr = NULL;
+ 	}
+ 	if (pinfo->oid > 0) {
+ 		g_source_remove(pinfo->oid);
+-- 
+2.13.2
+
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb
index 4b2ca4947..7a4ce05bf 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb
@@ -11,7 +11,9 @@ inherit autotools gtk-doc gobject-introspection
 
 SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
            file://gtk-is-required-by-notify.patch \
-           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
+           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch \
+           file://0001-Rename-use-of-stdout-and-stderr.patch \
+           "
 
 SRC_URI[md5sum] = "8153b0583a9f47d8a62af1f92fb9d3bf"
 SRC_URI[sha256sum] = "41addf0458f760212b6b6100835066e16deb3a8a50eb005a0fc17fbac0a2ae66"
-- 
2.13.2


