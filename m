Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 976ED77FF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:37 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id q86so25368009pfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0GlnrqrS+yqZyHE3rSVhEqFhTM0GAkbb3wYnsxGFYIw=;
	b=CFlCpNXf5x+UdNkoTHmdne8jvGYqEnsUDjly92YFvjuh6RUqgpG1+ugX1QXPOACct1
	7RenKysKMNUKqQzM8QA1aMC/+jwdCgjIKG6E54VlVdi/QUdHGWjZfUPxsWgpYuKB11fb
	BxrpS1pE3Y+qvkool41wXSgNxvy6COegpbd5IsyGwB4CSkrS0mbXmXKoBVErepGGw/XO
	Edx3gbDGbRZ4kWRGjTHHUDog6QiIcHOfAUdihdhLKBaAvso20dWR6hJjDEt7JGm77Zu9
	kxNBgZQwpeIa2RB9mUQHPHO5ksoPpWwbd1sLSsWU8f3/dDQCq7KD4gy0bbdFWXtB51Ye
	WQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0GlnrqrS+yqZyHE3rSVhEqFhTM0GAkbb3wYnsxGFYIw=;
	b=rCCeWFwoYQRpZKr9V0fv9fQbOgJNfv+/FNHycIkjxIGEVAmhKEIooevIARWWFlz3rc
	GfKjz09MS9NnIKG7v2wyzOS29WbLSyf6+A3C65OUWM1G/50173xAti/g9m1GifT+bi0h
	6e7QkJV1VSFqRyXUQMBSxmJz8gszLTmY/sP/AUZtfNDHhQtEPV7hFiR+LnA1w0IXAMsG
	IxvCE2gDkFr5Xs2ziUB3jsbhvkbV7EJx6Zb4yI3DifVhjLJTNvRdndkNacAEN+L8LMVv
	HqIBpDci+AaVrGgX3dXEqGHuPMuT9kO34jtSpCICUsiyV3tQUmt+z+HIdOda9K1S/xO7
	ZJVQ==
X-Gm-Message-State: AKS2vOyR2oIK7Tcd/W+zK8Pg1urqVF33L+yfRauwkRl1RB/03yuOtfCq
	2goXZKRSmcTWLCty
X-Received: by 10.98.89.129 with SMTP id k1mr8371277pfj.28.1498615718471;
	Tue, 27 Jun 2017 19:08:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:08 -0700
Message-Id: <20170628020819.17047-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/13] networkmanager: Fix build with hardening
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:37 -0000

Drop using xlocale.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...stemd-xlocale.h-is-dropped-by-newer-glibc.patch | 29 ++++++++++
 ...-string-in-g_dbus_message_new_method_erro.patch | 67 ++++++++++++++++++++++
 .../networkmanager/networkmanager_1.4.4.bb         |  2 +
 3 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
new file mode 100644
index 000000000..4234e2be2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
@@ -0,0 +1,29 @@
+From a9bfe6f2029d75caf28fcdf3e740843cf6359615 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 07:31:25 -0700
+Subject: [PATCH 1/2] systemd: xlocale.h is dropped by newer glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/systemd/src/basic/parse-util.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/systemd/src/basic/parse-util.c b/src/systemd/src/basic/parse-util.c
+index 9c21e5a..dd95d1f 100644
+--- a/src/systemd/src/basic/parse-util.c
++++ b/src/systemd/src/basic/parse-util.c
+@@ -25,11 +25,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#ifdef __GLIBC__
+-#include <xlocale.h>
+-#else
+ #include <locale.h>
+-#endif
+ #include "alloc-util.h"
+ #include "extract-word.h"
+ #include "macro.h"
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
new file mode 100644
index 000000000..e32b5c00d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
@@ -0,0 +1,67 @@
+From adc0668b854289a11cfc29597b5566ba1869d17e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 07:32:09 -0700
+Subject: [PATCH 2/2] user format string in g_dbus_message_new_method_error ()
+
+This fixes format errors with -Werror=format-security
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nm-manager.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/nm-manager.c b/src/nm-manager.c
+index c3d65cd..e814912 100644
+--- a/src/nm-manager.c
++++ b/src/nm-manager.c
+@@ -4871,6 +4871,7 @@ prop_set_auth_done_cb (NMAuthChain *chain,
+ 	if (error || (result != NM_AUTH_CALL_RESULT_YES)) {
+ 		reply = g_dbus_message_new_method_error (pfd->message,
+ 		                                         NM_PERM_DENIED_ERROR,
++		                                         "%s",
+ 		                                         (error_message = "Not authorized to perform this operation"));
+ 		if (error)
+ 			error_message = error->message;
+@@ -4882,6 +4883,7 @@ prop_set_auth_done_cb (NMAuthChain *chain,
+ 	if (!object) {
+ 		reply = g_dbus_message_new_method_error (pfd->message,
+ 		                                         "org.freedesktop.DBus.Error.UnknownObject",
++		                                         "%s",
+ 		                                         (error_message = "Object doesn't exist."));
+ 		goto done;
+ 	}
+@@ -4890,6 +4892,7 @@ prop_set_auth_done_cb (NMAuthChain *chain,
+ 	if (!nm_exported_object_get_interface_by_type (object, pfd->interface_type)) {
+ 		reply = g_dbus_message_new_method_error (pfd->message,
+ 		                                         "org.freedesktop.DBus.Error.InvalidArgs",
++		                                         "%s",
+ 		                                         (error_message = "Object is of unexpected type."));
+ 		goto done;
+ 	}
+@@ -4905,6 +4908,7 @@ prop_set_auth_done_cb (NMAuthChain *chain,
+ 		if (global_dns && !nm_global_dns_config_is_internal (global_dns)) {
+ 			reply = g_dbus_message_new_method_error (pfd->message,
+ 			                                         NM_PERM_DENIED_ERROR,
++			                                         "%s",
+ 			                                         (error_message = "Global DNS configuration already set via configuration file"));
+ 			goto done;
+ 		}
+@@ -4949,6 +4953,7 @@ do_set_property_check (gpointer user_data)
+ 	if (!pfd->subject) {
+ 		reply = g_dbus_message_new_method_error (pfd->message,
+ 		                                         NM_PERM_DENIED_ERROR,
++		                                         "%s",
+ 		                                         (error_message = "Could not determine request UID."));
+ 		goto out;
+ 	}
+@@ -4958,6 +4963,7 @@ do_set_property_check (gpointer user_data)
+ 	if (!chain) {
+ 		reply = g_dbus_message_new_method_error (pfd->message,
+ 		                                         NM_PERM_DENIED_ERROR,
++		                                         "%s",
+ 		                                         (error_message = "Could not authenticate request."));
+ 		goto out;
+ 	}
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
index 0de4383fb..e7dd4ef31 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
@@ -34,6 +34,8 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManag
            file://0001-check-for-strndupa-before-using-it.patch \
            file://0001-dns-resolved-add-systemd-resolved-backend.patch \
            file://0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch \
+           file://0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch \
+           file://0002-user-format-string-in-g_dbus_message_new_method_erro.patch \
            "
 SRC_URI[md5sum] = "63f1e0d6d7e9099499d062c84c927a75"
 SRC_URI[sha256sum] = "829378f318cc008d138a23ca6a9191928ce75344e7e47a2f2c35f4ac82133309"
-- 
2.13.2


