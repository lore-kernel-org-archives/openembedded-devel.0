Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDWZL-0005IU-DB
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 10:20:39 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2156766bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 01:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ImNpJFUVWrWWtWchgOqXN5PK2IAIpoXoRjZiAc0YUUs=;
	b=xzf6T8d+sjvexiXz/zLDems/KBqkJdYUbQonyo9+vzQw3JaRP0m/YEyGiUgZC/w9io
	a4ovi6lL/qmSP/dthmwxV8XLNNQ3pF+wUwsQ2wzlKSCzSaRSTSpfm3TpKt4Z4uS+WB91
	nhN0KSwgNdevAlJdtST2uhYXp5LkEsQKHQSr21nNllNt1oZFQLtDyeRUkY/duKHDdNjE
	Bv2TOigqqo/Y7CcXMK+8tYviim7trm8mdroSfKwqRmb8Zvyi6npnF3mUKYEkHE2Ano72
	GaRbZ7zPmadfXreaUQPzA85QfSpRYrUIs8/1Ip5pq+02xeN2GT6kNhW9pKx48NHPj/Tf
	o6OQ==
Received: by 10.204.145.82 with SMTP id c18mr3847049bkv.133.1347869283222;
	Mon, 17 Sep 2012 01:08:03 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1A7D.dip.t-dialin.net.
	[79.223.26.125])
	by mx.google.com with ESMTPS id a17sm1387041bkw.5.2012.09.17.01.08.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 01:08:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 10:15:46 +0200
Message-Id: <1347869747-14271-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 6/7] xfce4-session: Don't loose xfwm4 when closing session with multiple windows waiting for user input
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 08:20:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-xfwm4-when-closing-session-with-multiple.patch |  169 ++++++++++++++++++++
 .../xfce4-session/xfce4-session_4.8.3.bb           |    4 +-
 2 files changed, 172 insertions(+), 1 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/files/0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-session/files/0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch b/meta-xfce/recipes-xfce/xfce4-session/files/0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch
new file mode 100644
index 0000000..50bade8
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/files/0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch
@@ -0,0 +1,169 @@
+From 64c0acb072057023870881f9fbac29ce08d357db Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 5 Sep 2012 20:14:09 +0200
+Subject: [PATCH] Don't loose xfwm4 when closing session with multiple windows
+ waiting for user input
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When closing a session with more than one window open and waiting for unsaved
+data to be closed, at the next session xfwm4 was not started properly.
+
+The bug(fix) could be reproduced by
+
+* opening gedit
+* entering some text
+* opening terminal
+* closing session (no YNC-dialog / wait ~1min to close session)
+* reopen session
+
+Bugreport with this patch is found at [1] further discussion at [2].
+
+Upstream-Status: Pending
+
+[1] https://bugzilla.xfce.org/show_bug.cgi?id=5379
+[2] http://mail.xfce.org/pipermail/xfce/2012-August/031174.html
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ xfce4-session/xfsm-manager.c |   81 ++++++++++++++++++++++++-----------------
+ 1 files changed, 47 insertions(+), 34 deletions(-)
+
+diff --git a/xfce4-session/xfsm-manager.c b/xfce4-session/xfsm-manager.c
+index 3078d6a..3cc4c89 100644
+--- a/xfce4-session/xfsm-manager.c
++++ b/xfce4-session/xfsm-manager.c
+@@ -96,6 +96,7 @@ struct _XfsmManager
+ 
+   XfsmManagerState state;
+   XfsmShutdownType shutdown_type;
++  gboolean         save_session;
+ 
+   gboolean         session_chooser;
+   gchar           *session_name;
+@@ -225,6 +226,7 @@ xfsm_manager_init (XfsmManager *manager)
+   manager->session_chooser = FALSE;
+   manager->failsafe_mode = TRUE;
+   manager->shutdown_type = XFSM_SHUTDOWN_LOGOUT;
++  manager->save_session = TRUE;
+ 
+   manager->pending_properties = g_queue_new ();
+   manager->starting_properties = g_queue_new ();
+@@ -981,7 +983,9 @@ xfsm_manager_interact (XfsmManager *manager,
+           XfsmClient *cl = lp->data;
+           if (xfsm_client_get_state (cl) == XFSM_CLIENT_INTERACTING)
+             {
+-              xfsm_client_set_state (cl, XFSM_CLIENT_WAITFORINTERACT);
++              /* a client is already interacting, so new client has to wait */
++              xfsm_client_set_state (client, XFSM_CLIENT_WAITFORINTERACT);
++              xfsm_manager_cancel_client_save_timeout(manager, client);
+               return;
+             }
+         }
+@@ -1158,44 +1162,47 @@ xfsm_manager_save_yourself_global (XfsmManager     *manager,
+     }
+ #endif
+ 
+-  if (!shutdown || shutdown_save)
++  /* don't save the session if shutting down without save */
++  manager->save_session = !shutdown || shutdown_save;
++
++  if (save_type == SmSaveBoth && !manager->save_session)
+     {
+-      xfsm_manager_set_state (manager,
+-                              shutdown
+-                              ? XFSM_MANAGER_SHUTDOWN
+-                              : XFSM_MANAGER_CHECKPOINT);
++      /* saving the session, so clients should
++       * (prompt to) save the user data only */
++      save_type = SmSaveGlobal;
++    }
+ 
+-      /* handle legacy applications first! */
+-      xfsm_legacy_perform_session_save ();
++  xfsm_manager_set_state (manager,
++                          shutdown
++                          ? XFSM_MANAGER_SHUTDOWN
++                          : XFSM_MANAGER_CHECKPOINT);
+ 
+-      for (lp = g_queue_peek_nth_link (manager->running_clients, 0);
+-           lp;
+-           lp = lp->next)
+-        {
+-          XfsmClient *client = lp->data;
+-          XfsmProperties *properties = xfsm_client_get_properties (client);
+-          const gchar *program;
++  /* handle legacy applications first! */
++  if (manager->save_session)
++      xfsm_legacy_perform_session_save ();
+ 
+-          /* xterm's session management is broken, so we won't
+-           * send a SAVE YOURSELF to xterms */
+-          program = xfsm_properties_get_string (properties, SmProgram);
+-          if (program != NULL && strcasecmp (program, "xterm") == 0)
+-            continue;
++  for (lp = g_queue_peek_nth_link (manager->running_clients, 0);
++       lp;
++       lp = lp->next)
++    {
++      XfsmClient *client = lp->data;
++      XfsmProperties *properties = xfsm_client_get_properties (client);
++      const gchar *program;
+ 
+-          if (xfsm_client_get_state (client) != XFSM_CLIENT_SAVINGLOCAL)
+-            {
+-              SmsSaveYourself (xfsm_client_get_sms_connection (client), save_type, shutdown,
+-                               interact_style, fast);
+-            }
++      /* xterm's session management is broken, so we won't
++       * send a SAVE YOURSELF to xterms */
++      program = xfsm_properties_get_string (properties, SmProgram);
++      if (program != NULL && strcasecmp (program, "xterm") == 0)
++        continue;
+ 
+-          xfsm_client_set_state (client, XFSM_CLIENT_SAVING);
+-          xfsm_manager_start_client_save_timeout (manager, client);
++      if (xfsm_client_get_state (client) != XFSM_CLIENT_SAVINGLOCAL)
++        {
++          SmsSaveYourself (xfsm_client_get_sms_connection (client), save_type, shutdown,
++                           interact_style, fast);
+         }
+-    }
+-  else
+-    {
+-      /* shutdown session without saving */
+-      xfsm_manager_perform_shutdown (manager);
++
++      xfsm_client_set_state (client, XFSM_CLIENT_SAVING);
++      xfsm_manager_start_client_save_timeout (manager, client);
+     }
+ }
+ 
+@@ -1267,7 +1274,12 @@ xfsm_manager_save_yourself_done (XfsmManager *manager,
+                                  XfsmClient  *client,
+                                  gboolean     success)
+ {
+-  if (xfsm_client_get_state (client) != XFSM_CLIENT_SAVING && xfsm_client_get_state (client) != XFSM_CLIENT_SAVINGLOCAL)
++  /* In xfsm_manager_interact_done we send SmsShutdownCancelled to clients in
++     XFSM_CLIENT_WAITFORINTERACT state. They respond with SmcSaveYourselfDone
++     (xsmp_shutdown_cancelled in libxfce4ui library) so we allow it here. */
++  if (xfsm_client_get_state (client) != XFSM_CLIENT_SAVING &&
++      xfsm_client_get_state (client) != XFSM_CLIENT_SAVINGLOCAL &&
++      xfsm_client_get_state (client) != XFSM_CLIENT_WAITFORINTERACT)
+     {
+       xfsm_verbose ("Client Id = %s send SAVE YOURSELF DONE, while not being "
+                     "in save mode. Prepare to be nuked!\n",
+@@ -1539,7 +1551,8 @@ xfsm_manager_complete_saveyourself (XfsmManager *manager)
+   xfsm_verbose ("Manager finished SAVE YOURSELF, session data will be stored now.\n\n");
+ 
+   /* all clients done, store session data */
+-  xfsm_manager_store_session (manager);
++  if (manager->save_session)
++    xfsm_manager_store_session (manager);
+ 
+   if (manager->state == XFSM_MANAGER_CHECKPOINT)
+     {
+-- 
+1.7.6.5
+
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
index 3c84a72..4b9b32e 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
@@ -4,10 +4,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf xfce4-panel gconf gnome-keyring"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit"
-PR = "r1"
+PR = "r2"
 
 inherit xfce
 
+SRC_URI += "file://0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch"
+
 # protect from frightening message that xfce might not work correctly
 pkg_postinst_${PN} () {
     echo 127.0.0.1    ${MACHINE} >> /etc/hosts
-- 
1.7.4.4



