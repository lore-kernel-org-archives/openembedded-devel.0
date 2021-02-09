Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.7715.1612859370950524199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 00:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1198TKRR017361
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Feb 2021 00:29:25 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 00:29:20 -0800
Received: from pek-kkang-d1.wrs.com (128.224.162.141) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 9 Feb 2021 00:29:19 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] lxdm: disallow empty new password
Date: Tue, 9 Feb 2021 16:29:15 +0800
Message-ID: <20210209082915.90036-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <166206EE791CFB52.16565@lists.openembedded.org>
References: <166206EE791CFB52.16565@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Do not clear text of label 'promt' when skip_password is set. When user
is required to update password, it only shows input box without label
for about 1 second.

And disallow empty new password when user is required to update it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...reeter.c-disallow-empty-new-password.patch | 53 +++++++++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0009-greeter.c-disallow-empty-new-password.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0009-greeter.c-disallow-empty-new-password.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0009-greeter.c-disallow-empty-new-password.patch
new file mode 100644
index 000000000..3b12defb0
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0009-greeter.c-disallow-empty-new-password.patch
@@ -0,0 +1,53 @@
+From af1c347a31ae243d29c6087da8ffb423b23c74f2 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Mon, 1 Feb 2021 09:54:48 +0800
+Subject: [PATCH] greeter.c: disallow empty new password
+
+Do not clear text of label 'promt' when skip_password is set. When user
+is required to update password, it only shows input box without label
+for about 1 second.
+
+And disallow empty new password when user is required to update it.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/2/]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/greeter.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/greeter.c b/src/greeter.c
+index 7e4a168..c0e6b64 100644
+--- a/src/greeter.c
++++ b/src/greeter.c
+@@ -220,7 +220,6 @@ static void on_entry_activate(GtkEntry* entry)
+ 		}
+ 		if(g_key_file_get_integer(config,"base","skip_password",NULL)!=0)
+ 		{
+-			gtk_label_set_text( GTK_LABEL(prompt), "");
+ 			try_login_user(user);
+ 		}
+ 		else
+@@ -235,6 +239,10 @@ static void on_entry_activate(GtkEntry* entry)
+ 		if (pass_expired) {
+ 			if (!new_pass) {
+ 				new_pass = g_strdup(gtk_entry_get_text(entry));
++				if (strlen(new_pass) == 0) {
++					new_pass = NULL;
++					gtk_label_set_text((GtkLabel *)info, _("Empty password is not allowed."));
++				}
+ 				switch_to_input_passwd();
+ 			} else {
+ 				tmp = g_strdup(gtk_entry_get_text(entry));
+@@ -251,7 +259,7 @@ static void on_entry_activate(GtkEntry* entry)
+ 						gtk_label_set_text((GtkLabel *)info, _("Maximum number of failed update password attempts exceeded."));
+ 						switch_to_input_user();
+ 					}
+-				} else if (!strcmp(pass, g_base64_encode((guchar*)new_pass, strlen(new_pass) + 1))) {
++				} else if (pass && !strcmp(pass, g_base64_encode((guchar*)new_pass, strlen(new_pass) + 1))) {
+ 					// if new password is same as old one
+ 					g_free(new_pass);
+ 					new_pass = NULL;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index dcfd9e169..216bbb624 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.
            file://0006-themes-Industrial-add-info-label-in-ui.patch \
            file://0007-greeter.c-support-to-update-expired-password.patch \
            file://0008-greeter.c-show-information-on-gtk-label-info.patch \
+           file://0009-greeter.c-disallow-empty-new-password.patch \
            "
 SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
 SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
-- 
2.25.1

