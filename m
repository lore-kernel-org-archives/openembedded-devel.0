Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TBvIY-00083I-9B
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 00:20:42 +0200
Received: by wibhm2 with SMTP id hm2so167109wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=ImNpJFUVWrWWtWchgOqXN5PK2IAIpoXoRjZiAc0YUUs=;
	b=qT/gGeBnqEzDaB8gkv6k0CDNMw2db08TCJhG6VuYd6W6iCcbml7W+QYcjbCSOvaGSU
	Oo1wRwMNDB4UvK7ox0n1D7CNPucxdihrAgqGRoJQdBwoBy7QxU2lsI8B8y9uiR1tHjHW
	PBGYYM5N7vHNzlX3Hy+7UcZJZGx0aTlaSUzLK4ZJB2ZKtF5jg1GiGzXYyVey585IQvhb
	Hz3GD2JOvASYytBCAZPAEQbfZVIs46dfup9nGipBy93XqZPWEpy6BrZgSdJnjT/J080a
	ObW6amhFJzXDVYBcqQU/j+hpp6Zs98Y8YRWBxz5ZOlhNeF/SxOVs8q1s+siVhwU+onpb
	ahVA==
Received: by 10.216.238.134 with SMTP id a6mr2065257wer.172.1347487689660;
	Wed, 12 Sep 2012 15:08:09 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3A61.dip.t-dialin.net.
	[91.10.58.97])
	by mx.google.com with ESMTPS id ct3sm10117315wib.5.2012.09.12.15.08.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 15:08:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Sep 2012 00:15:47 +0200
Message-Id: <1347488147-3404-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe, V2] xfce4-session: Don't loose xfwm4 when closing session with multiple windows waiting for user input
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
X-List-Received-Date: Wed, 12 Sep 2012 22:20:42 -0000
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



