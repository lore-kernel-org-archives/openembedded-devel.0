Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB846F5A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:48:17 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so1228291eei.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=23y5T1yCmQnsWNQhRjYchlbIR6TnafSYFvdJMQY7CBo=;
	b=XVnmbqjZZOOjiXeHp6gDK5B9J/rpOVtWZIT/GQcP/dAnf2OIdpZh+/1C2CjwTsXt4S
	a3J9Cr3hR7SrA/8pFG2Y+rzouyFHwSSIbwKbwShbwZHpqyNoJU6XTvWB3q79UKbr547e
	YviUrLdl4Dpd0tfOAQzYU5aZHHN1Q1b1SqUivx6s5QYED4PWnKxwh8uCJ9k1OuoxFoR4
	lHQWA4uLNiNQ2HaP9TKqjx6g35DGi+MjcMsctBb+PyiuI39Pv54GJfdYTmthRki9+wsb
	g0V6shVXp+gQyBJ4GH6oJdUXsQO71LBvibuHLTp/MQtsYUQztNceW8twajwRf10+E4u/
	EuoQ==
X-Received: by 10.15.108.71 with SMTP id cc47mr13488991eeb.59.1394124498370;
	Thu, 06 Mar 2014 08:48:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i47sm23653899eeg.6.2014.03.06.08.48.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 08:48:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Mar 2014 17:48:14 +0100
Message-Id: <d42bb9bed778ec61dd98b2c09f58eebf00333329.1394124356.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 4/6] e-tasks: Migrate to eldbus
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
X-List-Received-Date: Thu, 06 Mar 2014 16:48:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-dbus-stuff-Convert-to-eldbus.patch        | 204 +++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-tasks_git.bb            |   4 +-
 2 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch

diff --git a/meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch b/meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch
new file mode 100644
index 0000000..f92a772
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-tasks/0001-dbus-stuff-Convert-to-eldbus.patch
@@ -0,0 +1,204 @@
+From 37223289b3d85ea8876e7ba7c9ff97ec428073ba Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 22 Feb 2014 14:36:38 +0100
+Subject: [PATCH] dbus-stuff: Convert to eldbus
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac     |  2 +-
+ src/Makefile.am  |  2 +-
+ src/dbus-stuff.c | 95 ++++++++++++++++++++++++++++++++------------------------
+ src/dbus-stuff.h | 13 ++------
+ src/main.c       |  2 +-
+ 5 files changed, 61 insertions(+), 53 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b3e4d12..4ace32a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,7 +15,7 @@ AC_HEADER_STDC
+ 
+ AM_PROG_LIBTOOL
+ 
+-PKG_CHECK_MODULES(TASKS, [elementary eina dbus-1 edbus sqlite3])
++PKG_CHECK_MODULES(TASKS, [elementary eina dbus-1 eldbus sqlite3])
+ 
+ AC_OUTPUT([
+ Makefile
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 2143dc9..31d5253 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -8,7 +8,7 @@ AM_CPPFLAGS = \
+ 	$(TASKS_CFLAGS)
+ 
+ AM_CFLAGS =\
+-         $(EDBUS_CFLAGS) \
++         $(ELDBUS_CFLAGS) \
+ 	 -Wall\
+ 	 -g
+ 
+diff --git a/src/dbus-stuff.c b/src/dbus-stuff.c
+index 50809bc..9f02ef3 100644
+--- a/src/dbus-stuff.c
++++ b/src/dbus-stuff.c
+@@ -1,8 +1,7 @@
+ /***************************************************************************
+  *            dbus-stuff.c
+  *
+- *  Copyright  2009  cchandel
+- *  <cchandel@yahoo.com>
++ *  Copyright  2009  cchandel <cchandel@yahoo.com>
+  ****************************************************************************/
+ 
+ /*
+@@ -21,51 +20,67 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor Boston, MA 02110-1301,  USA
+  */
+ #include "dbus-stuff.h"
+-#include <string.h>
+-#include <E_DBus.h>
+-#include <Elementary.h>
++#include "Eldbus.h"
+ 
+-void occupy_cpu(void)
++void on_usage_cb(void *data EINA_UNUSED, const Eldbus_Message *msg, Eldbus_Pending *pending EINA_UNUSED)
++{
++        const char *errname, *errmsg;
++        if (eldbus_message_error_get(msg, &errname, &errmsg))
++	        fprintf(stderr, "Error: %s %s\n", errname, errmsg);
++}
++
++int ousaged_resource(const char *resource, int used)
+ {	
+-	e_dbus_init();
+-	conn = e_dbus_bus_get(DBUS_BUS_SYSTEM);
+-	
+-	DBusMessage *msg;
+-	msg = dbus_message_new_method_call(
+-		"org.freesmartphone.ousaged",
+-		"/org/freesmartphone/Usage",
+-		"org.freesmartphone.Usage",
+-		"RequestResource"
+-	);
+-	
+-	const char *resource = "CPU";
+-	dbus_message_append_args (msg, DBUS_TYPE_STRING, &resource, DBUS_TYPE_INVALID);
++	eldbus_init();
++	const char *REQUEST = "RequestResource";
++	const char *RELEASE = "ReleaseResource";
++	const int   PREQUEST = 1;
+ 
+-	e_dbus_message_send(conn, msg, dbus_reply_cb, -1, NULL);
+-	dbus_message_unref(msg);
+-}
++        Eldbus_Connection *conn;
++        Eldbus_Object *obj;
++        Eldbus_Proxy *usage;
++        Eldbus_Pending *pending;
++	conn = eldbus_connection_get(ELDBUS_CONNECTION_TYPE_SYSTEM);
++        if (!conn)
++        {
++                fprintf(stderr, "Error: could not get system bus\n");
++                return EXIT_FAILURE;
++        }
+ 
+-void release_cpu(void)
+-{
+-	DBusMessage *msg;
+-	msg = dbus_message_new_method_call(
+-		"org.freesmartphone.ousaged",
+-		"/org/freesmartphone/Usage",
+-		"org.freesmartphone.Usage",
+-		"ReleaseResource"
+-	);
+-	
+-	const char *resource = "CPU";
+-	dbus_message_append_args (msg, DBUS_TYPE_STRING, &resource, DBUS_TYPE_INVALID);
++        obj = eldbus_object_get(conn, "org.freesmartphone.ousaged", "/org/freesmartphone/Usage");
++        if (!obj)
++        {
++                fprintf(stderr, "Error: could not get object\n");
++                return EXIT_FAILURE;
++        }
+ 
+-	e_dbus_message_send(conn, msg, dbus_reply_cb, -1, NULL);
+-	dbus_message_unref(msg);
++        usage = eldbus_proxy_get(obj, "org.freesmartphone.Usage");
++        if (!usage)
++        {
++                fprintf(stderr, "Error: could not get proxy\n");
++                return EXIT_FAILURE;
++        }
++
++        pending = eldbus_proxy_call(usage, used == PREQUEST ? REQUEST : RELEASE, on_usage_cb, NULL, -1, "ss", resource);
++        if (!pending)
++        {
++                fprintf(stderr, "Error: could not call\n");
++                return EXIT_FAILURE;
++        }
++        eldbus_proxy_unref(usage);
++        eldbus_object_unref(obj);
++        eldbus_connection_unref(conn);
++
++        eldbus_shutdown();
++	return EXIT_SUCCESS;
+ }
+ 
+-void dbus_reply_cb(void *data, DBusMessage *replymsg, DBusError *error)
++int request_cpu(void)
+ {
+-	if (dbus_error_is_set(error)) {
+-		printf("Error: %s - %s\n", error->name, error->message);
+-	}
++        return ousaged_resource("CPU", 1);
+ }
+ 
++int release_cpu(void)
++{
++        return ousaged_resource("CPU" , 0);
++}
+diff --git a/src/dbus-stuff.h b/src/dbus-stuff.h
+index 83d4778..a3c72cb 100644
+--- a/src/dbus-stuff.h
++++ b/src/dbus-stuff.h
+@@ -2,8 +2,7 @@
+  *            dbus.h
+  *
+  *  Fri Mar  6 12:32:57 2009
+- *  Copyright  2009  nidhin
+- *  <nidhin@nids-laptop.home>
++ *  Copyright  2009  nidhin <nidhin@nids-laptop.home>
+  ****************************************************************************/
+ 
+ /*
+@@ -22,11 +21,5 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor Boston, MA 02110-1301,  USA
+  */
+ 
+-#include <E_DBus.h>
+-#include <Elementary.h>
+-
+-void occupy_cpu(void);
+-void release_cpu(void);
+-void dbus_reply_cb(void *data, DBusMessage *replymsg, DBusError *error);
+-
+-E_DBus_Connection *conn;
++int request_cpu(void);
++int release_cpu(void);
+diff --git a/src/main.c b/src/main.c
+index 92d21de..4e4bbe2 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -76,7 +76,7 @@ elm_main(int argc, char **argv)
+ 	//restore state
+ 	restore_state();
+ 
+-	occupy_cpu();
++	request_cpu();
+ 
+ 	elm_run();
+ 	//clean up stuff
+-- 
+1.8.5.3
+
diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb b/meta-efl/recipes-efl/e17/e-tasks_git.bb
index d17e4e7..6065157 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_git.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_git.bb
@@ -4,7 +4,7 @@ AUTHOR = "cchandel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 SECTION = "e/apps"
-DEPENDS = "elementary eina edbus sqlite3"
+DEPENDS = "elementary eina eldbus sqlite3"
 
 inherit autotools
 
@@ -12,6 +12,8 @@ SRCREV = "890f5ee37d1a5fd1ceb2495950d15151d4cf756b"
 PV = "0.0.2+gitr${SRCPV}"
 
 SRC_URI = "git://github.com/shr-project/e-tasks.git"
+SRC_URI += "file://0001-dbus-stuff-Convert-to-eldbus.patch"
+
 S = "${WORKDIR}/git"
 
 do_install_append() {
-- 
1.9.0


