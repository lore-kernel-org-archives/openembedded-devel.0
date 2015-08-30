Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id BC4407422C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:34:15 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so50741992wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=4ISuld8GSPPHLeLaEQMN8QwjPNe369JQOSiJA1skwE0=;
	b=bIsX5uaCMOdj5qAvQ91CZqAo/DmIP/Uori1nctiZLyaOKbsl2WAy00jypAZ6ngf9E0
	77DURqtnQDPfLojsNA6689y5NppJYQqjNt4wRQoM/+0CRWYLmPsXaRkPH/mMrxin4l6j
	Rl6fReqW2UKSyFnwUBlUVGfygXox00izmm6UqUJN7dh30vOKgVZE8gmn8zWzbinKKMxV
	zssGO0IAfXYI5kOJsV94d16YY9DCL0nYcpTnJCcrnVspvGcTjdxkNYs8C5sQJkNpDYi1
	vZ6bsXTZysfQ2qaR+tu9q63bA4U7pWDnRQtzp9TR8D/n/T7rqwh8NLUsHTRFMz+2e2mE
	P+ug==
X-Received: by 10.181.11.168 with SMTP id ej8mr14081281wid.83.1440930855405;
	Sun, 30 Aug 2015 03:34:15 -0700 (PDT)
Received: from localhost.localdomain (p54AA5C5E.dip0.t-ipconnect.de.
	[84.170.92.94]) by smtp.googlemail.com with ESMTPSA id
	h9sm16778522wjx.20.2015.08.30.03.34.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 03:34:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 12:33:58 +0200
Message-Id: <1440930840-3459-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCHv2 4/6] xfce4-notifyd: fix build for libnotify 0.7.x
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
X-List-Received-Date: Sun, 30 Aug 2015 10:34:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

the patch included during last commit only made latest xfce4-notifyd work with
old version of libnotify. I expected it to work also for libnotify 0.7.x but
that failed so remove the patch.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ore-libnotify-version-7.0.0-compatibility.patch | 152 ---------------------
 .../xfce4-notifyd/xfce4-notifyd_0.2.4.bb           |   1 -
 2 files changed, 153 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch b/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch
deleted file mode 100644
index 9e61a0e..0000000
--- a/meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Restore-libnotify-version-7.0.0-compatibility.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From ebfbe9358068716ed7f39e253bce4d13e696bc9b Mon Sep 17 00:00:00 2001
-From: Ivailo Monev <xakepa10@gmail.com>
-Date: Wed, 11 Dec 2013 13:18:13 +0000
-Subject: [PATCH 1/1] Restore libnotify version < 7.0.0 compatibility
-
-Upstream-Status: Pending [1]
-
-[1] https://mail.xfce.org/pipermail/xfce/2013-December/032733.html
-
-Signed-off-by: Ivailo Monev <xakepa10@gmail.com>
----
- Makefile.am                 |  4 +++-
- configure.ac                |  2 +-
- tests/test-actions.c        |  7 ++++++-
- tests/test-positioning.c    |  7 ++++++-
- tests/test-text.c           | 21 ++++++++++++++++++---
- xfce4-notifyd-config/main.c |  7 ++++++-
- 6 files changed, 40 insertions(+), 8 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index df81bea..034d6c1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -271,9 +271,11 @@ noinst_PROGRAMS = \
- 
- tests_cflags = \
- 	-I$(top_srcdir) \
--	$(LIBNOTIFY_CFLAGS)
-+	$(LIBNOTIFY_CFLAGS) \
-+	$(common_cflags)
- 
- tests_ldadd = \
-+	$(common_ldadd) \
- 	$(LIBNOTIFY_LIBS)
- 
- tests_test_actions_SOURCES = tests/test-actions.c
-diff --git a/configure.ac b/configure.ac
-index cf5258f..9d2e8a7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -67,7 +67,7 @@ XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [0.1.0svn-r26876])
- XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.14.0])
- XDT_CHECK_PACKAGE([DBUS], [dbus-1], [1.0.0])
- XDT_CHECK_PACKAGE([DBUS_GLIB], [dbus-glib-1], [0.72])
--XDT_CHECK_PACKAGE([LIBNOTIFY], [libnotify], [0.7.0])
-+XDT_CHECK_PACKAGE([LIBNOTIFY], [libnotify], [0.5.0])
- 
- AC_PATH_PROG([DBUS_BINDING_TOOL], [dbus-binding-tool])
- AS_IF([test -z "$DBUS_BINDING_TOOL"],
-diff --git a/tests/test-actions.c b/tests/test-actions.c
-index a7f6494..4cdf882 100644
---- a/tests/test-actions.c
-+++ b/tests/test-actions.c
-@@ -106,7 +106,12 @@ int main (int argc, char **argv)
- 
-   notification = notify_notification_new ("Action!",
-                                           "Click my shiny actions",
--                                          NULL);
-+                                          NULL
-+#if NOTIFY_CHECK_VERSION > (0, 6, 9)
-+                                          );
-+#else
-+                                          ,NULL);
-+#endif
- 
-   notify_notification_add_action (notification,
-                                   "action1",
-diff --git a/tests/test-positioning.c b/tests/test-positioning.c
-index 4478a92..2a90c6e 100644
---- a/tests/test-positioning.c
-+++ b/tests/test-positioning.c
-@@ -60,7 +60,12 @@ int main (int argc, char **argv)
- 
-       notification = notify_notification_new (summary,
-                                               body,
--                                              NULL);
-+                                              NULL
-+#if NOTIFY_CHECK_VERSION > (0, 6, 9)
-+                                              );
-+#else
-+                                              ,NULL);
-+#endif
- 
-       if (!notify_notification_show (notification, NULL))
-         {
-diff --git a/tests/test-text.c b/tests/test-text.c
-index 7500cb2..ac95931 100644
---- a/tests/test-text.c
-+++ b/tests/test-text.c
-@@ -40,7 +40,12 @@ int main (int argc, char **argv)
- 
-   notification = notify_notification_new ("Test text support",
-                                           "Does it work?",
--                                          NULL);
-+                                          NULL
-+#if NOTIFY_CHECK_VERSION > (0, 6, 9)
-+                                          );
-+#else
-+                                          ,NULL);
-+#endif
- 
-   if (!notify_notification_show (notification, NULL))
-     {
-@@ -56,7 +61,12 @@ int main (int argc, char **argv)
- 
-   notification = notify_notification_new ("Summary only support",
-                                           NULL,
--                                          NULL);
-+                                          NULL
-+#if NOTIFY_CHECK_VERSION > (0, 6, 9)
-+                                          );
-+#else
-+                                          ,NULL);
-+#endif
- 
-   if (!notify_notification_show (notification, NULL))
-     {
-@@ -75,7 +85,12 @@ int main (int argc, char **argv)
-                                           "<b>Bold</b>\n"
-                                           "<u>Underlined</u>\n"
-                                           "<a href=\"http://www.xfce.org\">Xfce Web site</a>",
--                                          NULL);
-+                                          NULL
-+#if NOTIFY_CHECK_VERSION > (0, 6, 9)
-+                                          );
-+#else
-+                                          ,NULL);
-+#endif
- 
-   if (!notify_notification_show (notification, NULL))
-     {
-diff --git a/xfce4-notifyd-config/main.c b/xfce4-notifyd-config/main.c
-index 5977749..eff4994 100644
---- a/xfce4-notifyd-config/main.c
-+++ b/xfce4-notifyd-config/main.c
-@@ -56,7 +56,12 @@ xfce_notifyd_config_show_notification_preview(GtkWindow *parent_window)
-     notification =
-         notify_notification_new(_("Notification Preview"),
-                                 _("This is how notifications will look like"),
--                                "xfce4-notifyd");
-+                                "xfce4-notifyd"
-+#if NOTIFY_CHECK_VERSION > (0, 6, 9)
-+                                );
-+#else
-+                                ,NULL);
-+#endif
- 
-     notify_notification_add_action(notification,
-                                    "button",
--- 
-1.9.3
-
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb
index 9d0e198..5f874ad 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb
@@ -8,7 +8,6 @@ inherit xfce-app
 
 SRC_URI[md5sum] = "094be6f29206aac8299f27084e284e88"
 SRC_URI[sha256sum] = "8c7ed62f9496816d1391281f77d1b32216f9bf6fd22fbe4f6f3f4e07a6bbced0"
-SRC_URI += "file://0001-Restore-libnotify-version-7.0.0-compatibility.patch"
 
 do_compile_prepend() {
 	mkdir -p xfce4-notifyd
-- 
2.1.0


