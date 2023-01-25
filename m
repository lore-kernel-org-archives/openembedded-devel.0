Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935FEC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:56 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.44978.1674653508098724592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W8r+gYYf;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id z12-20020a4a490c000000b004f21c72be42so3136067ooa.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syReXHVTHWiWoL/zEq5So+Whh1iqSL/A4WC2wO4JbwY=;
        b=W8r+gYYftLNVwE48GSFhR+bfvw5Zffesh8RnKrYYfeQ1/gr3HADspDTjKWjpK+mN2G
         xV1XxNkiyiNWkNszBazl2g9fAflgs13Yd27q8DfRfWL9Qk5WJrd7Bl/2rTxEww92WhOc
         rDSh9lXOe3ttPkYYogce/4VMgJwp3+WCQJVRLHKqghB/91dHPP+BVfxppQEt5fwpslxF
         RR3HkHtJf0y5gXymPlLoKLvl/mAwVBJxDvtla7vWAupNXPRhRCJftMZego1ly4NTm8lU
         hkdTzqOV4qYjWUdsH1b2L0YTvrtjUzeho/wnPetIjqw/6fv0B9MQHsm1Hm1SgGlXeIK5
         s6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syReXHVTHWiWoL/zEq5So+Whh1iqSL/A4WC2wO4JbwY=;
        b=zgE0SUQT+VOlB5sMShC6YZgldW5Oc4ZMxnjcjs3dWs/WU1AUBhFAQeIz/Sv9mFeQUi
         YW0FLIoXd+37EDbmhg3LRkbh8K4TwfOMfiHaQePXJSYCSqTBz8qqZfm2jZUtwRK/g6dr
         RORVqQ6b29QTpKtAj3uhGd3kCJDNHR5SdN8dDz3kpMMcpLWybKfOMiWgjHyQKMEJx8O4
         0ovF0FaEnwT66AOJOtasZih+6KvpSwbVG3SADkQhDMz61MPTw+9UMGi/pQnQk0hOePKl
         uEQwi2a5RNA/ntVKQhooGCU1GqyXegE8ySf/SkYjRfT+rUc/zHvQteb/q/PMeMsnphFX
         6udw==
X-Gm-Message-State: AFqh2koJvTTgxtFaGS7h/8BqBAtFSlF/huoK5+2wEXEtFdE12/Gl+uXR
	dIszOLYH1pogD6DDJiY7kr85XFaMWz8=
X-Google-Smtp-Source: AMrXdXv6FaH9kVf1ws4VsKT1Noq6GUevuHyuaUs0Y+DFuBY7iiZS/EIDy4glyDirbI8rIgjk0tqWAw==
X-Received: by 2002:a4a:1843:0:b0:4f2:8fa2:acda with SMTP id 64-20020a4a1843000000b004f28fa2acdamr13703698ooo.5.1674653515317;
        Wed, 25 Jan 2023 05:31:55 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 28/41] fwupd: Fix CVE-2022-3287
Date: Wed, 25 Jan 2023 08:31:10 -0500
Message-Id: <f34c046760d0910ba7bf5538d501ddaf93096462.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100763

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fwupd/fwupd/CVE-2022-3287.patch           | 218 ++++++++++++++++++
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb      |   4 +-
 2 files changed, 221 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch b/meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch
new file mode 100644
index 0000000000..5360e981ce
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/CVE-2022-3287.patch
@@ -0,0 +1,218 @@
+From ea676855f2119e36d433fbd2ed604039f53b2091 Mon Sep 17 00:00:00 2001
+From: Richard Hughes <richard@hughsie.com>
+Date: Wed, 21 Sep 2022 14:56:10 +0100
+Subject: [PATCH] Never save the Redfish passwords to a file readable by users
+
+When the redfish plugin automatically creates an OPERATOR user account on the
+BMC we save the autogenerated password to /etc/fwupd/redfish.conf, ensuring it
+is chmod'ed to 0660 before writing the file with g_key_file_save_to_file().
+
+Under the covers, g_key_file_save_to_file() calls g_file_set_contents() with
+the keyfile string data.
+I was under the impression that G_FILE_CREATE_REPLACE_DESTINATION was being
+used to copy permissions, but alas not.
+
+GLib instead calls g_file_set_contents_full() with the mode hardcoded to 0666,
+which undoes the previous chmod().
+
+Use g_file_set_contents_full() with the correct mode for newer GLib versions,
+and provide a fallback with the same semantics for older versions.
+
+https://github.com/fwupd/fwupd/commit/ea676855f2119e36d433fbd2ed604039f53b2091
+Upstream-Status: Backport
+CVE: CVE-2022-3287
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ contrib/fwupd.spec.in         |  3 ++
+ libfwupdplugin/fu-plugin.c    | 65 +++++++++++++++++++++++++++++------
+ libfwupdplugin/fu-self-test.c | 57 ++++++++++++++++++++++++++++++
+ 3 files changed, 114 insertions(+), 11 deletions(-)
+
+diff --git a/contrib/fwupd.spec.in b/contrib/fwupd.spec.in
+index b011292b1b..42ea2024a8 100644
+--- a/contrib/fwupd.spec.in
++++ b/contrib/fwupd.spec.in
+@@ -326,6 +326,9 @@ for fn in /etc/fwupd/remotes.d/*.conf; do
+     fi
+ done
+ 
++# ensure this is private
++chmod 0660 /etc/fwupd/redfish.conf
++
+ %preun
+ %systemd_preun fwupd.service
+ 
+diff --git a/libfwupdplugin/fu-plugin.c b/libfwupdplugin/fu-plugin.c
+index 9744af9d60..b431f6d418 100644
+--- a/libfwupdplugin/fu-plugin.c
++++ b/libfwupdplugin/fu-plugin.c
+@@ -9,6 +9,7 @@
+ #include "config.h"
+ 
+ #include <errno.h>
++#include <fcntl.h>
+ #include <fwupd.h>
+ #include <glib/gstdio.h>
+ #include <gmodule.h>
+@@ -2417,6 +2418,46 @@ fu_plugin_set_config_value(FuPlugin *self, const gchar *key, const gchar *value,
+ 	return g_key_file_save_to_file(keyfile, conf_path, error);
+ }
+ 
++#if !GLIB_CHECK_VERSION(2, 66, 0)
++
++#define G_FILE_SET_CONTENTS_CONSISTENT 0
++typedef guint GFileSetContentsFlags;
++static gboolean
++g_file_set_contents_full(const gchar *filename,
++			 const gchar *contents,
++			 gssize length,
++			 GFileSetContentsFlags flags,
++			 int mode,
++			 GError **error)
++{
++	gint fd;
++	gssize wrote;
++
++	if (length < 0)
++		length = strlen(contents);
++	fd = g_open(filename, O_CREAT, mode);
++	if (fd <= 0) {
++		g_set_error(error,
++			    G_IO_ERROR,
++			    G_IO_ERROR_FAILED,
++			    "could not open %s file",
++			    filename);
++		return FALSE;
++	}
++	wrote = write(fd, contents, length);
++	if (wrote != length) {
++		g_set_error(error,
++			    G_IO_ERROR,
++			    G_IO_ERROR_FAILED,
++			    "did not write %s file",
++			    filename);
++		g_close(fd, NULL);
++		return FALSE;
++	}
++	return g_close(fd, error);
++}
++#endif
++
+ /**
+  * fu_plugin_set_secure_config_value:
+  * @self: a #FuPlugin
+@@ -2438,7 +2479,8 @@ fu_plugin_set_secure_config_value(FuPlugin *self,
+ 				  GError **error)
+ {
+ 	g_autofree gchar *conf_path = fu_plugin_get_config_filename(self);
+-	gint ret;
++	g_autofree gchar *data = NULL;
++	g_autoptr(GKeyFile) keyfile = g_key_file_new();
+ 
+ 	g_return_val_if_fail(FU_IS_PLUGIN(self), FALSE);
+ 	g_return_val_if_fail(error == NULL || *error == NULL, FALSE);
+@@ -2447,17 +2489,18 @@ fu_plugin_set_secure_config_value(FuPlugin *self,
+ 		g_set_error(error, FWUPD_ERROR, FWUPD_ERROR_NOT_FOUND, "%s is missing", conf_path);
+ 		return FALSE;
+ 	}
+-	ret = g_chmod(conf_path, 0660);
+-	if (ret == -1) {
+-		g_set_error(error,
+-			    FWUPD_ERROR,
+-			    FWUPD_ERROR_INTERNAL,
+-			    "failed to set permissions on %s",
+-			    conf_path);
++	if (!g_key_file_load_from_file(keyfile, conf_path, G_KEY_FILE_KEEP_COMMENTS, error))
+ 		return FALSE;
+-	}
+-
+-	return fu_plugin_set_config_value(self, key, value, error);
++	g_key_file_set_string(keyfile, fu_plugin_get_name(self), key, value);
++	data = g_key_file_to_data(keyfile, NULL, error);
++	if (data == NULL)
++		return FALSE;
++	return g_file_set_contents_full(conf_path,
++					data,
++					-1,
++					G_FILE_SET_CONTENTS_CONSISTENT,
++					0660,
++					error);
+ }
+ 
+ /**
+diff --git a/libfwupdplugin/fu-self-test.c b/libfwupdplugin/fu-self-test.c
+index 2dbc9c94ff..aaf49c172b 100644
+--- a/libfwupdplugin/fu-self-test.c
++++ b/libfwupdplugin/fu-self-test.c
+@@ -674,6 +674,62 @@ _plugin_device_added_cb(FuPlugin *plugin, FuDevice *device, gpointer user_data)
+ 	fu_test_loop_quit();
+ }
+ 
++static void
++fu_plugin_config_func(void)
++{
++	GStatBuf statbuf = {0};
++	gboolean ret;
++	gint rc;
++	g_autofree gchar *conf_dir = NULL;
++	g_autofree gchar *conf_file = NULL;
++	g_autofree gchar *fn = NULL;
++	g_autofree gchar *testdatadir = NULL;
++	g_autofree gchar *value = NULL;
++	g_autoptr(FuPlugin) plugin = fu_plugin_new(NULL);
++	g_autoptr(GError) error = NULL;
++
++	/* this is a build file */
++	testdatadir = g_test_build_filename(G_TEST_BUILT, "tests", NULL);
++	(void)g_setenv("FWUPD_SYSCONFDIR", testdatadir, TRUE);
++	conf_dir = fu_path_from_kind(FU_PATH_KIND_SYSCONFDIR_PKG);
++
++	/* remove existing file */
++	fu_plugin_set_name(plugin, "test");
++	conf_file = g_strdup_printf("%s.conf", fu_plugin_get_name(plugin));
++	fn = g_build_filename(conf_dir, conf_file, NULL);
++	ret = fu_path_mkdir_parent(fn, &error);
++	g_assert_no_error(error);
++	g_assert_true(ret);
++	g_remove(fn);
++	ret = g_file_set_contents(fn, "", -1, &error);
++	g_assert_no_error(error);
++	g_assert_true(ret);
++
++	/* set a value */
++	ret = fu_plugin_set_config_value(plugin, "Key", "True", &error);
++	g_assert_no_error(error);
++	g_assert_true(ret);
++	g_assert_true(g_file_test(fn, G_FILE_TEST_EXISTS));
++
++	/* check it is world readable */
++	rc = g_stat(fn, &statbuf);
++	g_assert_cmpint(rc, ==, 0);
++	g_assert_cmpint(statbuf.st_mode & 0777, ==, 0644);
++
++	/* read back the value */
++	value = fu_plugin_get_config_value(plugin, "Key");
++	g_assert_cmpstr(value, ==, "True");
++	g_assert_true(fu_plugin_get_config_value_boolean(plugin, "Key"));
++
++	/* check it is private, i.e. only readable by the user/group */
++	ret = fu_plugin_set_secure_config_value(plugin, "Key", "False", &error);
++	g_assert_no_error(error);
++	g_assert_true(ret);
++	rc = g_stat(fn, &statbuf);
++	g_assert_cmpint(rc, ==, 0);
++	g_assert_cmpint(statbuf.st_mode & 0777, ==, 0640);
++}
++
+ static void
+ fu_plugin_devices_func(void)
+ {
+@@ -3598,6 +3654,7 @@ main(int argc, char **argv)
+ 	g_test_add_func("/fwupd/progress{finish}", fu_progress_finish_func);
+ 	g_test_add_func("/fwupd/bios-attrs{load}", fu_bios_settings_load_func);
+ 	g_test_add_func("/fwupd/security-attrs{hsi}", fu_security_attrs_hsi_func);
++	g_test_add_func("/fwupd/plugin{config}", fu_plugin_config_func);
+ 	g_test_add_func("/fwupd/plugin{devices}", fu_plugin_devices_func);
+ 	g_test_add_func("/fwupd/plugin{device-inhibit-children}",
+ 			fu_plugin_device_inhibit_children_func);
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
index 99077923dc..794a678833 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
@@ -6,7 +6,9 @@ DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://c54ae9c524998e449b822feb465a0c90317cd735.patch \
-           file://run-ptest"
+           file://run-ptest \
+           file://CVE-2022-3287.patch \
+           "
 SRC_URI[sha256sum] = "adfa07434cdc29ec41c40fef460e8d970963fe0c7e849dec7f3932adb161f886"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-- 
2.25.1


