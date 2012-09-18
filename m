Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylW-0001lE-7L
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:06 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=yzW45tNq+dTo14/36+w5R3/BKgtYFsoje4Eq4OvFa/Y=;
	b=dbtGj1Ijh2WwM5F82U5pMyNXMj2ADiFPgYZJdjRqo+ffw84c976mGBZWOCBNadwvR+
	Rr717dnxa3KLBr60tXJxlcVw3eyB3eczrgfCwd/7AcqIyxHbsHkduyZVK87UoZejSwNl
	t1XaJipVxNj7vsRq1Yf9IwYIcwuDsu3zvIosNC3zy7h9wqdPv+RXzngPpUSINAGJ8JtK
	GvzEiLgXR9TSnAXKDpdHRAG7UEsWUipJ50gU3rKTUJj8l9SSUrL3DyoY/6h83BGYFka4
	Qmy+R9CklzNzpxZ8GWhgXWYMgf0ZqqgQ9MslxkyjXsBHZmxgXRsZPkw6UfJstrGwuYqX
	8aQQ==
Received: by 10.204.133.194 with SMTP id g2mr22746bkt.13.1347977668456;
	Tue, 18 Sep 2012 07:14:28 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:51 +0200
Message-Id: <1347977601-28665-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 10/40] xfce4-session: update to 4.10.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ltiple-interactive-session-save-bug-5379.patch} |   61 +++++++-------------
 ...e4-session_4.8.3.bb => xfce4-session_4.10.0.bb} |   14 ++---
 2 files changed, 28 insertions(+), 47 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/files/{0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch => 0001-Handle-multiple-interactive-session-save-bug-5379.patch} (77%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.8.3.bb => xfce4-session_4.10.0.bb} (62%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/files/0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch b/meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch
similarity index 77%
rename from meta-xfce/recipes-xfce/xfce4-session/files/0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch
rename to meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch
index 50bade8..38949a5 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/files/0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch
+++ b/meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch
@@ -1,56 +1,39 @@
-From 64c0acb072057023870881f9fbac29ce08d357db Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 5 Sep 2012 20:14:09 +0200
-Subject: [PATCH] Don't loose xfwm4 when closing session with multiple windows
- waiting for user input
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
+From 9f3077be682355e1cd07e9a9463e76307292208c Mon Sep 17 00:00:00 2001
+From: Dimitar Zhekov <hamster@mbox.contact.bg>
+Date: Thu, 30 Aug 2012 22:52:14 +0200
+Subject: [PATCH] Handle multiple interactive session save (bug #5379).
 
-When closing a session with more than one window open and waiting for unsaved
-data to be closed, at the next session xfwm4 was not started properly.
+Additionnaly, we now use SmSaveGlobal on log out / shutdown without
+session save which avoids data loss. Previously clients would not save
+anything on log out without session save.
 
-The bug(fix) could be reproduced by
-
-* opening gedit
-* entering some text
-* opening terminal
-* closing session (no YNC-dialog / wait ~1min to close session)
-* reopen session
-
-Bugreport with this patch is found at [1] further discussion at [2].
-
-Upstream-Status: Pending
-
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=5379
-[2] http://mail.xfce.org/pipermail/xfce/2012-August/031174.html
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Based on original work by Chris Bainbridge (chris.bainbridge@gmail.com).
 ---
+Upstream-status: applied
  xfce4-session/xfsm-manager.c |   81 ++++++++++++++++++++++++-----------------
  1 files changed, 47 insertions(+), 34 deletions(-)
 
 diff --git a/xfce4-session/xfsm-manager.c b/xfce4-session/xfsm-manager.c
-index 3078d6a..3cc4c89 100644
+index bf6a446..35811c5 100644
 --- a/xfce4-session/xfsm-manager.c
 +++ b/xfce4-session/xfsm-manager.c
-@@ -96,6 +96,7 @@ struct _XfsmManager
+@@ -98,6 +98,7 @@ struct _XfsmManager
  
-   XfsmManagerState state;
-   XfsmShutdownType shutdown_type;
-+  gboolean         save_session;
+   XfsmShutdownType  shutdown_type;
+   XfsmShutdown     *shutdown_helper;
++  gboolean          save_session;
  
    gboolean         session_chooser;
    gchar           *session_name;
-@@ -225,6 +226,7 @@ xfsm_manager_init (XfsmManager *manager)
-   manager->session_chooser = FALSE;
+@@ -230,6 +231,7 @@ xfsm_manager_init (XfsmManager *manager)
    manager->failsafe_mode = TRUE;
    manager->shutdown_type = XFSM_SHUTDOWN_LOGOUT;
+   manager->shutdown_helper = xfsm_shutdown_get ();
 +  manager->save_session = TRUE;
  
    manager->pending_properties = g_queue_new ();
    manager->starting_properties = g_queue_new ();
-@@ -981,7 +983,9 @@ xfsm_manager_interact (XfsmManager *manager,
+@@ -989,7 +991,9 @@ xfsm_manager_interact (XfsmManager *manager,
            XfsmClient *cl = lp->data;
            if (xfsm_client_get_state (cl) == XFSM_CLIENT_INTERACTING)
              {
@@ -61,9 +44,9 @@ index 3078d6a..3cc4c89 100644
                return;
              }
          }
-@@ -1158,44 +1162,47 @@ xfsm_manager_save_yourself_global (XfsmManager     *manager,
+@@ -1138,44 +1142,47 @@ xfsm_manager_save_yourself_global (XfsmManager     *manager,
+         }
      }
- #endif
  
 -  if (!shutdown || shutdown_save)
 +  /* don't save the session if shutting down without save */
@@ -140,7 +123,7 @@ index 3078d6a..3cc4c89 100644
      }
  }
  
-@@ -1267,7 +1274,12 @@ xfsm_manager_save_yourself_done (XfsmManager *manager,
+@@ -1249,7 +1256,12 @@ xfsm_manager_save_yourself_done (XfsmManager *manager,
                                   XfsmClient  *client,
                                   gboolean     success)
  {
@@ -154,7 +137,7 @@ index 3078d6a..3cc4c89 100644
      {
        xfsm_verbose ("Client Id = %s send SAVE YOURSELF DONE, while not being "
                      "in save mode. Prepare to be nuked!\n",
-@@ -1539,7 +1551,8 @@ xfsm_manager_complete_saveyourself (XfsmManager *manager)
+@@ -1521,7 +1533,8 @@ xfsm_manager_complete_saveyourself (XfsmManager *manager)
    xfsm_verbose ("Manager finished SAVE YOURSELF, session data will be stored now.\n\n");
  
    /* all clients done, store session data */
@@ -165,5 +148,5 @@ index 3078d6a..3cc4c89 100644
    if (manager->state == XFSM_MANAGER_CHECKPOINT)
      {
 -- 
-1.7.6.5
+1.7.4.4
 
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
similarity index 62%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
index 4b9b32e..4df9894 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf xfce4-panel gconf gnome-keyring"
-RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit"
-PR = "r2"
+DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf gnome-keyring"
+RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit upower"
 
 inherit xfce
 
-SRC_URI += "file://0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch"
+SRC_URI[md5sum] = "4768e1a41a0287af6aad18b329a0f230"
+SRC_URI[sha256sum] = "bb8aa9a74c3d382840596fb4875144d66c7f3f47c8e9ee81d31e3428a72c46ce"
+SRC_URI += "file://0001-Handle-multiple-interactive-session-save-bug-5379.patch"
 
 # protect from frightening message that xfce might not work correctly
 pkg_postinst_${PN} () {
@@ -17,12 +18,9 @@ pkg_postinst_${PN} () {
 
 FILES_${PN} += "${libdir}/xfce4/*/*/*.so \
                 ${libdir}/xfce4/session/*-*-* \
-                ${datadir}/xfce4/*/* \
+                ${datadir}/xsessions \
                 ${datadir}/themes/Default/balou/*"
 
 FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
 
 FILES_${PN}-staticdev += "${libdir}/xfce4/*/*/*.*a"
-
-SRC_URI[md5sum] = "461cc38bbd37cab881adbdf943f9a402"
-SRC_URI[sha256sum] = "f0801b8c0ffa7e5d41b29b8df281ac127adf467bf50e8ded8aebe5a02bd99338"
-- 
1.7.6.5



