Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.7643.1612859237462669672
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 00:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1198R2gH017105
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Feb 2021 00:27:07 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 00:26:55 -0800
Received: from pek-kkang-d1.wrs.com (128.224.162.141) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 9 Feb 2021 00:26:55 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] lxdm: support to change user password
Date: Tue, 9 Feb 2021 16:26:52 +0800
Message-ID: <20210209082652.89531-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update lxdm to support change user password when the password expired.
It also add a label to show useful information to tell user that 'Authentication
failed' or 'password expired' etc.

It only work with distro feature 'pam'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...et-visible-when-switch-to-input-user.patch |  33 ++++
 .../lxdm/0002-greeter-gdk.c-fix-typo.patch    |  28 +++
 ...ck-whether-password-expired-with-pam.patch |  46 +++++
 ...function-to-change-password-with-pam.patch | 124 ++++++++++++
 ...sword-expire-and-update-new-password.patch |  53 ++++++
 ...emes-Industrial-add-info-label-in-ui.patch | 124 ++++++++++++
 ...c-support-to-update-expired-password.patch | 180 ++++++++++++++++++
 ...c-show-information-on-gtk-label-info.patch |  99 ++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb   |   8 +
 9 files changed, 695 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-greeter-set-visible-when-switch-to-input-user.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0002-greeter-gdk.c-fix-typo.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0003-check-whether-password-expired-with-pam.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0004-lxdm.c-add-function-to-change-password-with-pam.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0005-ui.c-handle-password-expire-and-update-new-password.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0006-themes-Industrial-add-info-label-in-ui.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0007-greeter.c-support-to-update-expired-password.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0008-greeter.c-show-information-on-gtk-label-info.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-greeter-set-visible-when-switch-to-input-user.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0001-greeter-set-visible-when-switch-to-input-user.patch
new file mode 100644
index 000000000..e01dc7fa7
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0001-greeter-set-visible-when-switch-to-input-user.patch
@@ -0,0 +1,33 @@
+From f6b8e141e00c4837239f5b69af4e7bee1204abba Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Thu, 17 Dec 2020 10:18:58 +0800
+Subject: [PATCH 1/8] greeter: set visible when switch to input user
+
+It switches back to input user entry if press Esc key when input the
+password. At this time, the user name input is shown as '*' rather than
+plain text. Set the visibility to fix this issue. And clean the text as
+well.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/1/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/greeter.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/greeter.c b/src/greeter.c
+index 2c6e5be..f100c72 100644
+--- a/src/greeter.c
++++ b/src/greeter.c
+@@ -139,6 +139,8 @@ static void switch_to_input_user(void)
+ 		pass=NULL;
+ 	}
+ 	gtk_label_set_text( GTK_LABEL(prompt), _("User:"));
++	gtk_entry_set_text(GTK_ENTRY(login_entry), "");
++	gtk_entry_set_visibility(GTK_ENTRY(login_entry), TRUE);
+ 	gtk_widget_show(prompt);
+ 	if(user_list)
+ 	{
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0002-greeter-gdk.c-fix-typo.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0002-greeter-gdk.c-fix-typo.patch
new file mode 100644
index 000000000..da0212975
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0002-greeter-gdk.c-fix-typo.patch
@@ -0,0 +1,28 @@
+From 3a3c5c644c9790cb3f88f3ce3757c2803cff90c5 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Thu, 17 Dec 2020 14:32:40 +0800
+Subject: [PATCH 2/8] greeter-gdk.c: fix typo
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/1/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/greeter-gdk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/greeter-gdk.c b/src/greeter-gdk.c
+index 1b27d2e..5aa3e7f 100644
+--- a/src/greeter-gdk.c
++++ b/src/greeter-gdk.c
+@@ -299,7 +299,7 @@ void ui_prepare(void)
+         attr.wclass = GDK_INPUT_OUTPUT;
+         win = gdk_window_new(root, &attr, mask);
+         gdk_window_set_decorations(win,0);
+-        gdk_window_set_title(win,"lxdm-greter-gdk");
++        gdk_window_set_title(win,"lxdm-greeter-gdk");
+         
+         scr=gdk_screen_get_default();
+         g_signal_connect(scr, "size-changed", G_CALLBACK(on_screen_size_changed), win);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0003-check-whether-password-expired-with-pam.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0003-check-whether-password-expired-with-pam.patch
new file mode 100644
index 000000000..c64854373
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0003-check-whether-password-expired-with-pam.patch
@@ -0,0 +1,46 @@
+From 497e0fc7010969759c8247f7013a89589c44234a Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Thu, 17 Dec 2020 18:12:29 +0800
+Subject: [PATCH 3/8] check whether password expired with pam
+
+Introduce a new enum AuthResult type AUTH_PASSWD_EXPIRE. When user's
+password is expired, return it. Only work with pam.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/1/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/lxdm.h | 1 +
+ src/pam.c  | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/lxdm.h b/src/lxdm.h
+index 568573f..1c2f837 100644
+--- a/src/lxdm.h
++++ b/src/lxdm.h
+@@ -41,6 +41,7 @@ enum AuthResult
+     AUTH_SUCCESS,
+     AUTH_BAD_USER,
+     AUTH_FAIL,
++    AUTH_PASSWD_EXPIRE,
+     AUTH_PRIV,
+     AUTH_ERROR
+ };
+diff --git a/src/pam.c b/src/pam.c
+index 43bd687..16a36f0 100644
+--- a/src/pam.c
++++ b/src/pam.c
+@@ -257,6 +257,10 @@ int lxdm_auth_user_authenticate(LXDM_AUTH *a,const char *user,const char *pass,i
+ 			return AUTH_FAIL;
+ 		}
+ 		ret=pam_acct_mgmt(a->handle,PAM_SILENT);
++		if (ret == PAM_NEW_AUTHTOK_REQD) {
++			g_debug("user %s account has expired\n", user);
++			return AUTH_PASSWD_EXPIRE;
++		}
+ 		if(ret!=PAM_SUCCESS)
+ 		{
+ 			g_debug("user %s acct mgmt fail with %d\n",user,ret);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0004-lxdm.c-add-function-to-change-password-with-pam.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0004-lxdm.c-add-function-to-change-password-with-pam.patch
new file mode 100644
index 000000000..29c1000d1
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0004-lxdm.c-add-function-to-change-password-with-pam.patch
@@ -0,0 +1,124 @@
+From d4de5497bd89c408377194b9fa9026ba8e68b634 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Mon, 11 Jan 2021 14:11:05 +0800
+Subject: [PATCH 4/8] lxdm.c: add function to change password with pam
+
+Add function to change user's password when pam is enabled. It is useful
+to change user's password when the password is expired.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/1/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/lxdm.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/lxdm.h |  1 +
+ 2 files changed, 69 insertions(+)
+
+diff --git a/src/lxdm.c b/src/lxdm.c
+index 638c30f..fe17a71 100644
+--- a/src/lxdm.c
++++ b/src/lxdm.c
+@@ -104,6 +104,10 @@ static int old_tty=1,def_tty = 7,nr_tty=0;
+ static int def_display=0;
+ static GSList *session_list;
+ 
++#if HAVE_LIBPAM
++static const char *new_passwd = NULL;
++#endif
++
+ static void lxdm_startx(LXSession *s);
+ 
+ static int get_active_vt(void)
+@@ -759,6 +763,69 @@ int lxdm_auth_user(int type,char *user, char *pass, struct passwd **ppw)
+ 	return ret;
+ }
+ 
++
++#if HAVE_LIBPAM
++
++static int do_conv(int num, const struct pam_message **msg,struct pam_response **resp, void *arg)
++{
++	int result = PAM_SUCCESS;
++	int i;
++
++	*resp = (struct pam_response *) calloc(num, sizeof(struct pam_response));
++	for(i = 0; i < num; i++)
++	{
++		switch (msg[i]->msg_style) {
++			case PAM_PROMPT_ECHO_ON:
++				break;
++			case PAM_PROMPT_ECHO_OFF:
++				resp[i]->resp = strdup(new_passwd);
++				break;
++			case PAM_ERROR_MSG:
++			case PAM_TEXT_INFO:
++				break;
++			default:
++				break;
++		}
++	}
++	return result;
++}
++
++static int lxdm_change_passwd_pam(const char *service, const char *user, const char *pass)
++{
++	pam_handle_t *pamh = NULL;
++	static struct pam_conv conv = {
++		do_conv,
++		NULL
++	};
++
++	int ret = pam_start("lxdm", user, &conv, &pamh);
++	if (PAM_SUCCESS != ret) {
++		g_warning("pam_start failed.");
++		return 1;
++	}
++
++	new_passwd = pass;
++	ret = pam_chauthtok(pamh, 0);
++	if (PAM_SUCCESS != ret) {
++		g_warning("pam_chauthtok failed: %s", pam_strerror(pamh, ret));
++		return 1;
++	}
++
++	(void)pam_end(pamh, PAM_SUCCESS);
++
++	return 0;
++}
++#endif
++
++int lxdm_change_passwd(const char *user, const char *pass)
++{
++#if HAVE_LIBPAM
++	return lxdm_change_passwd_pam("lxdm", user, pass);
++#else
++	return 0;
++#endif
++}
++
+ static void close_left_fds(void)
+ {
+ 	struct dirent **list;
+@@ -1446,6 +1513,7 @@ int lxdm_do_auto_login(void)
+ 			lxdm_do_login(pw,session,lang,option);
+ 			success=1;
+ 		}
++
+ 		g_free(user);g_free(session);g_free(lang);
+ 	}
+ 	g_free(last_lang);
+diff --git a/src/lxdm.h b/src/lxdm.h
+index 1c2f837..be3c81f 100644
+--- a/src/lxdm.h
++++ b/src/lxdm.h
+@@ -30,6 +30,7 @@ G_BEGIN_DECLS
+ extern GKeyFile *config;
+ 
+ int lxdm_auth_user(int type,char *user,char *pass,struct passwd **ppw);
++int lxdm_change_passwd(const char *user, const char *pass);
+ void lxdm_do_login(struct passwd *pw,char *session,char *lang,char *option);
+ void lxdm_do_reboot(void);
+ void lxdm_do_shutdown(void);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0005-ui.c-handle-password-expire-and-update-new-password.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0005-ui.c-handle-password-expire-and-update-new-password.patch
new file mode 100644
index 000000000..ecbe68d14
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0005-ui.c-handle-password-expire-and-update-new-password.patch
@@ -0,0 +1,53 @@
+From 54b2ed18ca52fa682ade2fe84e1b0d19d1b78cc4 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Mon, 11 Jan 2021 16:48:26 +0800
+Subject: [PATCH 5/8] ui.c: handle password-expire and update-new-password
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/1/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/ui.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/src/ui.c b/src/ui.c
+index f233589..3ddb484 100644
+--- a/src/ui.c
++++ b/src/ui.c
+@@ -161,6 +161,9 @@ static gboolean on_greeter_input(GIOChannel *source, GIOCondition condition, gpo
+ 				ui_drop();
+ 				lxdm_do_login(pw, session, lang,NULL);
+ 			}
++			else if (AUTH_PASSWD_EXPIRE == ret) {
++				xwrite(greeter_pipe[0], "password-expire\n", 16);
++			}
+ 			else
+ 			{
+ 				if(pass!=NULL)
+@@ -205,6 +208,23 @@ static gboolean on_greeter_input(GIOChannel *source, GIOCondition condition, gpo
+ 		g_free(session);
+ 		g_free(lang);
+ 	}
++	else if (!strncmp(str, "update-new-password", 19)) {
++		xwrite(greeter_pipe[0], "update-new-password\n", 20);
++		char *user = greeter_param(str, "user");
++		char *pass = greeter_param(str, "newpass");
++		char *session = greeter_param(str, "session");
++		char *lang = greeter_param(str, "lang");
++
++		int ret = lxdm_change_passwd(user, pass);
++		if (ret) {
++			xwrite(greeter_pipe[0], "invalid-new-password\n", 21);
++		} else {
++			struct passwd *pw;
++			ret = lxdm_auth_user(AUTH_TYPE_NORMAL, user, pass, &pw);
++			ui_drop();
++			lxdm_do_login(pw, session, lang, NULL);
++		}
++	}
+ 	g_free(str);
+ 	return TRUE;
+ }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0006-themes-Industrial-add-info-label-in-ui.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0006-themes-Industrial-add-info-label-in-ui.patch
new file mode 100644
index 000000000..4cadc3d9b
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0006-themes-Industrial-add-info-label-in-ui.patch
@@ -0,0 +1,124 @@
+From 8414d63343cc7909bc7a972941c678509d5d5be6 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Mon, 11 Jan 2021 10:15:45 +0800
+Subject: [PATCH 6/8] themes/Industrial: add info label in ui
+
+Adjust the layout and add a new label "info" under the labe "prompt" in
+themes/Industrial to tell user some useful information such as
+"Authentication failed" or "Invalid password".
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/1/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ data/themes/Industrial/greeter-gtk3.ui | 27 +++++++++++++++++++++++++-
+ data/themes/Industrial/greeter.ui      | 27 +++++++++++++++++++++++++-
+ data/themes/Industrial/gtk.css         |  5 +++++
+ 3 files changed, 57 insertions(+), 2 deletions(-)
+
+diff --git a/data/themes/Industrial/greeter-gtk3.ui b/data/themes/Industrial/greeter-gtk3.ui
+index 2f4e631..e59eee3 100644
+--- a/data/themes/Industrial/greeter-gtk3.ui
++++ b/data/themes/Industrial/greeter-gtk3.ui
+@@ -45,7 +45,12 @@
+                     <property name="xscale">0</property>
+                     <property name="yscale">0</property>
+                     <child>
+-                      <object class="GtkHBox" id="hbox3">
++                      <object class="GtkVBox" id="vbox3">
++                      <property name="visible">True</property>
++                      <property name="orientation">vertical</property>
++                      <property name="spacing">12</property>
++                      <child>
++                        <object class="GtkHBox" id="hbox3">
+                         <property name="visible">True</property>
+                         <property name="spacing">12</property>
+                         <child>
+@@ -91,6 +96,26 @@
+                           </packing>
+                         </child>
+                       </object>
++                      </child>
++                      <child>
++                        <object class="GtkHBox" id="hbox4">
++                        <property name="visible">True</property>
++                        <property name="spacing">12</property>
++                        <child>
++                          <object class="GtkLabel" id="info">
++                            <property name="visible">True</property>
++                            <property name="label" translatable="yes"></property>
++                            <property name="yalign">0.2</property>
++                          </object>
++                          <packing>
++                            <property name="expand">False</property>
++                            <property name="fill">False</property>
++                            <property name="position">0</property>
++                          </packing>
++                        </child>
++                        </object>
++                      </child>
++                      </object>
+                     </child>
+                   </object>
+                   <packing>
+diff --git a/data/themes/Industrial/greeter.ui b/data/themes/Industrial/greeter.ui
+index 3413922..6a02d8d 100644
+--- a/data/themes/Industrial/greeter.ui
++++ b/data/themes/Industrial/greeter.ui
+@@ -47,7 +47,12 @@
+                     <property name="xscale">0</property>
+                     <property name="yscale">0</property>
+                     <child>
+-                      <object class="GtkHBox" id="hbox3">
++                      <object class="GtkVBox" id="vbox3">
++                      <property name="visible">True</property>
++                      <property name="orientation">vertical</property>
++                      <property name="spacing">12</property>
++                      <child>
++                        <object class="GtkHBox" id="hbox3">
+                         <property name="visible">True</property>
+                         <property name="spacing">12</property>
+                         <child>
+@@ -93,6 +98,26 @@
+                           </packing>
+                         </child>
+                       </object>
++                      </child>
++                      <child>
++                        <object class="GtkHBox" id="hbox4">
++                        <property name="visible">True</property>
++                        <property name="spacing">12</property>
++                        <child>
++                          <object class="GtkLabel" id="info">
++                            <property name="visible">True</property>
++                            <property name="label" translatable="yes"></property>
++                            <property name="yalign">0.2</property>
++                          </object>
++                          <packing>
++                            <property name="expand">False</property>
++                            <property name="fill">False</property>
++                            <property name="position">0</property>
++                          </packing>
++                        </child>
++                        </object>
++                      </child>
++                      </object>
+                     </child>
+                   </object>
+                   <packing>
+diff --git a/data/themes/Industrial/gtk.css b/data/themes/Industrial/gtk.css
+index 7621345..be15f43 100644
+--- a/data/themes/Industrial/gtk.css
++++ b/data/themes/Industrial/gtk.css
+@@ -22,3 +22,8 @@
+ 	font: Sans 12;
+ 	color: #9E9D9B;
+ }
++
++#info {
++        font: Sans 14;
++        font-style: italic;
++}
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0007-greeter.c-support-to-update-expired-password.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0007-greeter.c-support-to-update-expired-password.patch
new file mode 100644
index 000000000..84a9faebb
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0007-greeter.c-support-to-update-expired-password.patch
@@ -0,0 +1,180 @@
+From bae6a2b3a2232abd16a8d8558dda542d4970f1bb Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 12 Jan 2021 09:23:05 +0800
+Subject: [PATCH 7/8] greeter.c: support to update expired password
+
+Update greeter to work with ui to handle expired password. It checks
+whether password is expired after input user and password. If expired,
+force user to update password immediately. It allows 3 times to try. If
+exceeds, reset to input user.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/1/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/greeter.c | 83 +++++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 81 insertions(+), 2 deletions(-)
+
+diff --git a/src/greeter.c b/src/greeter.c
+index f100c72..804fca0 100644
+--- a/src/greeter.c
++++ b/src/greeter.c
+@@ -77,6 +77,8 @@ static GtkWidget *lang_menu;
+ 
+ static char* user = NULL;
+ static char* pass = NULL;
++static char* new_pass = NULL;
++static gboolean pass_expired = FALSE;
+ 
+ static char* ui_file = NULL;
+ static char *ui_nobody = NULL;
+@@ -167,10 +169,19 @@ static void switch_to_input_passwd(void)
+ 		else
+ 			gtk_widget_hide(user_list);
+ 	}
+-	gtk_label_set_text( GTK_LABEL(prompt), _("Password:") );
++	if (pass_expired) {
++		if (!new_pass) {
++			gtk_label_set_text(GTK_LABEL(prompt), _("New password:"));
++		} else {
++			gtk_label_set_text(GTK_LABEL(prompt), _("Retype new password:"));
++		}
++	} else {
++		gtk_label_set_text( GTK_LABEL(prompt), _("Password:") );
++	}
+ 	gtk_entry_set_text(GTK_ENTRY(login_entry), "");
+ 	gtk_entry_set_visibility(GTK_ENTRY(login_entry), FALSE);
+ 	gtk_widget_show(login_entry);
++	gtk_widget_show(prompt);
+ 	gtk_widget_grab_focus(login_entry);
+ }
+ 
+@@ -189,6 +200,8 @@ static void try_login_user(const char *user)
+ 
+ static void on_entry_activate(GtkEntry* entry)
+ {
++	static int count = 0;
++
+ 	char* tmp;
+ 	if( !user )
+ 	{
+@@ -217,6 +230,46 @@ static void on_entry_activate(GtkEntry* entry)
+ 	}
+ 	else
+ 	{
++		if (pass_expired) {
++			if (!new_pass) {
++				new_pass = g_strdup(gtk_entry_get_text(entry));
++				switch_to_input_passwd();
++			} else {
++				tmp = g_strdup(gtk_entry_get_text(entry));
++				if (strcmp(new_pass, tmp)) {
++					g_free(new_pass);
++					new_pass = NULL;
++					// if new passwords not match, retry for 3 times at most
++					if (++count < 3) {
++						switch_to_input_passwd();
++					} else {
++						count = 0;
++						pass_expired = FALSE;
++						switch_to_input_user();
++					}
++				} else if (!strcmp(pass, g_base64_encode((guchar*)new_pass, strlen(new_pass) + 1))) {
++					// if new password is same as old one
++					g_free(new_pass);
++					new_pass = NULL;
++					if (++count < 3) {
++						switch_to_input_passwd();
++					} else {
++						count = 0;
++						pass_expired = FALSE;
++						switch_to_input_user();
++					}
++				} else {
++					char *session_exec=get_session_exec();
++					char *session_lang=get_session_lang();
++
++					printf("update-new-password user=%s newpass=%s session=%s lang=%s\n",
++						user, new_pass, session_exec, session_lang);
++				}
++			}
++
++			return ;
++		}
++
+ 		char *session_exec=get_session_exec();
+ 		char *session_lang=get_session_lang();
+ 		
+@@ -227,6 +280,7 @@ static void on_entry_activate(GtkEntry* entry)
+ 		printf("login user=%s pass=%s session=%s lang=%s\n",
+ 			user, pass, session_exec, session_lang);
+ 
++#if 0
+ 		/* password check failed */
+ 		g_free(user);
+ 		user = NULL;
+@@ -241,6 +295,7 @@ static void on_entry_activate(GtkEntry* entry)
+ 		gtk_label_set_text( GTK_LABEL(prompt), _("User:") );
+ 		gtk_entry_set_text(GTK_ENTRY(entry), "");
+ 		gtk_entry_set_visibility(GTK_ENTRY(entry), TRUE);
++#endif
+ 	}
+ }
+ 
+@@ -1091,8 +1146,12 @@ static void on_screen_size_changed(GdkScreen *screen,GtkWidget *win)
+ 
+ static gint login_entry_on_key_press (GtkWidget *widget,GdkEventKey *event)
+ {
+-	if(event->keyval == GDK_Escape)
++	if(event->keyval == GDK_Escape) {
++		g_free(new_pass);
++		new_pass = NULL;
++		pass_expired = FALSE;
+ 		switch_to_input_user();
++	}
+ 	return FALSE;
+ }		     
+ 
+@@ -1285,8 +1344,10 @@ static void create_win()
+ 
+ static gboolean on_lxdm_command(GIOChannel *source, GIOCondition condition, gpointer data)
+ {
++
+ 	GIOStatus ret;
+ 	char *str;
++	static int count = 0;
+ 
+ 	if( !(G_IO_IN & condition) )
+ 		return FALSE;
+@@ -1300,10 +1361,28 @@ static gboolean on_lxdm_command(GIOChannel *source, GIOCondition condition, gpoi
+ 	{
+ 		switch_to_input_user();
+ 	}
++	else if (!strncmp(str, "password-expire", 15))
++	{
++		pass_expired = TRUE;
++		switch_to_input_passwd();
++	}
+ 	else if( !strncmp(str, "password", 8))
+ 	{
+ 		switch_to_input_passwd();
+ 	}
++	else if (!strncmp(str, "invalid-new-password", 20))
++	{
++		g_free(new_pass);
++		new_pass = NULL;
++
++		if (count++ < 3) {
++			switch_to_input_passwd();
++		} else {
++			count = 0;
++			pass_expired = FALSE;
++			switch_to_input_user();
++		}
++	}
+ 	g_free(str);
+ 	return TRUE;
+ }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0008-greeter.c-show-information-on-gtk-label-info.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0008-greeter.c-show-information-on-gtk-label-info.patch
new file mode 100644
index 000000000..eab9fd5e2
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0008-greeter.c-show-information-on-gtk-label-info.patch
@@ -0,0 +1,99 @@
+From bb4ff4b134383bfdadf7cb5353d3553a8a72d47e Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 13 Jan 2021 10:45:48 +0800
+Subject: [PATCH 8/8] greeter.c: show information on gtk label 'info'
+
+Show information on a gtk label 'info' which is added under label
+'prompt' in the .glade or .ui files.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/1/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/greeter.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/greeter.c b/src/greeter.c
+index 804fca0..a4a2336 100644
+--- a/src/greeter.c
++++ b/src/greeter.c
+@@ -64,6 +64,7 @@ static GtkWidget* win;
+ static GtkWidget* alignment2;
+ static GtkWidget* prompt;
+ static GtkWidget* login_entry;
++static GtkWidget* info;
+ static GtkWidget* user_list_scrolled;
+ static GtkWidget* user_list;
+ 
+@@ -241,10 +242,12 @@ static void on_entry_activate(GtkEntry* entry)
+ 					new_pass = NULL;
+ 					// if new passwords not match, retry for 3 times at most
+ 					if (++count < 3) {
++						gtk_label_set_text((GtkLabel *)info, _("Passwords do not match, please retry."));
+ 						switch_to_input_passwd();
+ 					} else {
+ 						count = 0;
+ 						pass_expired = FALSE;
++						gtk_label_set_text((GtkLabel *)info, _("Maximum number of failed update password attempts exceeded."));
+ 						switch_to_input_user();
+ 					}
+ 				} else if (!strcmp(pass, g_base64_encode((guchar*)new_pass, strlen(new_pass) + 1))) {
+@@ -252,6 +255,7 @@ static void on_entry_activate(GtkEntry* entry)
+ 					g_free(new_pass);
+ 					new_pass = NULL;
+ 					if (++count < 3) {
++						gtk_label_set_text((GtkLabel *)info, _("New password is same as old one, password unchanged."));
+ 						switch_to_input_passwd();
+ 					} else {
+ 						count = 0;
+@@ -1146,6 +1150,9 @@ static void on_screen_size_changed(GdkScreen *screen,GtkWidget *win)
+ 
+ static gint login_entry_on_key_press (GtkWidget *widget,GdkEventKey *event)
+ {
++
++	gtk_label_set_text(GTK_LABEL(info), "");
++
+ 	if(event->keyval == GDK_Escape) {
+ 		g_free(new_pass);
+ 		new_pass = NULL;
+@@ -1211,11 +1218,14 @@ static void create_win()
+     login_entry = (GtkWidget*)gtk_builder_get_object(builder, "login_entry");
+     if(login_entry!=NULL)
+     {
+-		g_signal_connect_after(login_entry,"key-press-event",G_CALLBACK(login_entry_on_key_press),NULL);
++        g_signal_connect(login_entry,"key-press-event",G_CALLBACK(login_entry_on_key_press),NULL);
+ 	}
+ 
+     g_signal_connect(login_entry, "activate", G_CALLBACK(on_entry_activate), NULL);
+ 
++    info = (GtkWidget *)gtk_builder_get_object(builder, "info");
++    gtk_label_set_text(GTK_LABEL(info), "");
++
+     if( g_key_file_get_integer(config, "display", "bottom_pane", 0)==1)
+     {
+         /* hacks to let GtkEventBox paintable with gtk pixmap engine. */
+@@ -1359,11 +1369,13 @@ static gboolean on_lxdm_command(GIOChannel *source, GIOCondition condition, gpoi
+ 	gtk_main_quit();
+ 	else if( !strncmp(str, "reset", 5) )
+ 	{
++		gtk_label_set_text(GTK_LABEL(info), _("Authentication failed."));
+ 		switch_to_input_user();
+ 	}
+ 	else if (!strncmp(str, "password-expire", 15))
+ 	{
+ 		pass_expired = TRUE;
++		gtk_label_set_text(GTK_LABEL(info), _("You are required to change your password immediately."));
+ 		switch_to_input_passwd();
+ 	}
+ 	else if( !strncmp(str, "password", 8))
+@@ -1376,6 +1388,7 @@ static gboolean on_lxdm_command(GIOChannel *source, GIOCondition condition, gpoi
+ 		new_pass = NULL;
+ 
+ 		if (count++ < 3) {
++			gtk_label_set_text(GTK_LABEL(info), _("Invalid new password. Please input new password again."));
+ 			switch_to_input_passwd();
+ 		} else {
+ 			count = 0;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index db4767bb3..dcfd9e169 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -9,6 +9,14 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.
            file://0002-let-autotools-create-lxdm.conf.patch \
            file://0003-check-for-libexecinfo-providing-backtrace-APIs.patch \
            file://0004-fix-css-under-gtk-3.20.patch \
+           file://0001-greeter-set-visible-when-switch-to-input-user.patch \
+           file://0002-greeter-gdk.c-fix-typo.patch \
+           file://0003-check-whether-password-expired-with-pam.patch \
+           file://0004-lxdm.c-add-function-to-change-password-with-pam.patch \
+           file://0005-ui.c-handle-password-expire-and-update-new-password.patch \
+           file://0006-themes-Industrial-add-info-label-in-ui.patch \
+           file://0007-greeter.c-support-to-update-expired-password.patch \
+           file://0008-greeter.c-show-information-on-gtk-label-info.patch \
            "
 SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
 SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
-- 
2.25.1

