Return-Path: <yang.lyu@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A565D6FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 09:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6F010184EF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 10:17:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id S3RPV4jH6U7K
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 10:17:50 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 621E4182EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 10:17:50 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 459FC1E07C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 10:17:50 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A6BC1E078
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 10:17:50 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 10:17:50 +0100 (CET)
Received: from lnxyangl.se.axis.com (lnxyangl.se.axis.com [10.92.172.14])
	by seth.se.axis.com (Postfix) with ESMTP id 2EF401A58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 10:17:50 +0100 (CET)
Received: by lnxyangl.se.axis.com (Postfix, from userid 12173)
	id 29D54400B5; Fri, 23 Mar 2018 10:17:50 +0100 (CET)
From: Yang Lyu <yang.lyu@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2018 10:17:44 +0100
Message-Id: <1521796664-16869-1-git-send-email-yangl@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH] dbus-broker: Add recipe
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
X-List-Received-Date: Fri, 23 Mar 2018 09:17:52 -0000

DBus-broker is a drop-in replacement for dbus-daemon. It is an implementation of a message
bus as defined by the D-Bus specification. Its aim is to provide high performance and
reliability, while keeping compatibility to the D-Bus reference implementation.

0001-Comment-rst2man-related-stuff.patch avoids using rst2man.

0002-Correct-including-directory-for-conf.patch fixs path computation for <include> node.
The patch should be dropped when a newer version of dbus-broker that includes commit:
    https://github.com/bus1/dbus-broker/commit/9af79016f0f6b1ee60779bc6dc4acd7b4b9e6c70
is available.

Signed-off-by: Yang Lyu <yang.lyu@axis.com>
---
 .../0001-Comment-rst2man-related-stuff.patch       | 34 ++++++++++++++++++++++
 ...0002-Correct-including-directory-for-conf.patch | 25 ++++++++++++++++
 meta-oe/recipes-core/dbus/dbus-broker_git.bb       | 29 ++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker_git.bb

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
new file mode 100644
index 0000000..f10c49e
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
@@ -0,0 +1,34 @@
+From a92fd7da3a262e21c0970a3908eb0b4502819a01 Mon Sep 17 00:00:00 2001
+From: Yang Lyu <yangl@axis.com>
+Date: Fri, 23 Feb 2018 16:31:49 +0100
+Subject: [PATCH] Comment rst2man related stuff
+
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 56d38e4..3c3b109 100644
+--- a/meson.build
++++ b/meson.build
+@@ -15,7 +15,7 @@ add_project_arguments('-DBINDIR="' + join_paths(get_option('prefix'), get_option
+ cc = meson.get_compiler('c')
+ conf = configuration_data()
+ mod_pkgconfig = import('pkgconfig')
+-prog_rst2man = find_program('rst2man', 'rst2man.py')
++#prog_rst2man = find_program('rst2man', 'rst2man.py')
+ 
+ sub_cdvar = subproject('c-dvar', version: '>=1')
+ sub_clist = subproject('c-list', version: '>=3')
+@@ -56,7 +56,7 @@ endif
+ 
+ conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir')))
+ 
+-subdir('docs')
++#subdir('docs')
+ subdir('src')
+ 
+ if use_launcher
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch b/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
new file mode 100644
index 0000000..4909dea
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
@@ -0,0 +1,25 @@
+From 4b79f603b948709906c108796087de7b5643f61a Mon Sep 17 00:00:00 2001
+From: Yang Lyu <yangl@axis.com>
+Date: Mon, 26 Feb 2018 12:48:34 +0100
+Subject: [PATCH] Correct including directory for conf
+
+---
+ src/launch/config.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/launch/config.c b/src/launch/config.c
+index 6a68699..579471b 100644
+--- a/src/launch/config.c
++++ b/src/launch/config.c
+@@ -1022,7 +1022,7 @@ static void config_parser_end_fn(void *userdata, const XML_Char *name) {
+                                     state->file,
+                                     state->current->include.selinux_root_relative ?
+                                         bus_selinux_policy_root() :
+-                                        state->file->path,
++                                        NULL,
+                                     state->current->cdata);
+                 if (r) {
+                         state->error = error_trace(r);
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
new file mode 100644
index 0000000..c21f1c6
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "dbus broker"
+DESCRIPTION = "Drop-in replacement for dbus-daemon."
+
+SECTION = "base"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
+
+DEPENDS = "dbus glib-2.0 expat"
+
+PV = "9+git${SRCPV}"
+SRCREV = "ccd06b284892182af569e69046262331150e3536"
+
+SRC_URI = "git://github.com/bus1/dbus-broker"
+SRC_URI += "file://0001-Comment-rst2man-related-stuff.patch"
+SRC_URI += "file://0002-Correct-including-directory-for-conf.patch"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+
+FILES_${PN} += "${systemd_system_unitdir}"
+FILES_${PN} += "${systemd_user_unitdir}"
+
+RDEPENDS_${PN} = "dbus systemd"
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


