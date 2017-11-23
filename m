Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E7B5D787D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9Uu6013309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:30 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:06 -0500
Message-ID: <1db85115f3af1cede8ceaf038eb6d44a2beebfc1.1511437793.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/15] meta-installer: add gtk+3 bbappend
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:30 -0000
Content-Type: text/plain

Here is easy way to reproduce the failure:
...
root@localhost:~# python
>>> from gi.repository import Gtk, AnacondaWidgets
>>> builder = Gtk.Builder()
>>> builder.get_type_from_name("AnacondaStandaloneWindow")
<GType invalid (0)>
...

Which is expected:
...
root@localhost:~# python
>>> from gi.repository import Gtk, AnacondaWidgets
>>> builder = Gtk.Builder()
>>> builder.get_type_from_name("AnacondaStandaloneWindow")
<GType AnacondaStandaloneWindow (7297024)>
...

The root cause is the issue of 'g_module_open' and 'g_module_symbol' in libgmodule-2.0.so.0:
While invoking 'g_module_open("libAnacondaWidgets.so.4.0.0",G_MODULE_BIND_LAZY);',
the following invoking 'g_module_open(NULL, G_MODULE_BIND_LAZY);'
could not find its symbol by invoking g_module_symbol.

So hardcode to load the anaconda module explicitly to workaround
failure while anaconda installer loading libAnacondaWidgets.

The bbappend works only if DISTRO = "anaconda".

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...for-anaconda-installer-while-loading-libA.patch | 84 ++++++++++++++++++++++
 .../recipes-gnome/gtk+/gtk+3_%.%.%.bbappend        |  3 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-installer/recipes-gnome/gtk+/files/workaround-for-anaconda-installer-while-loading-libA.patch
 create mode 100644 meta-installer/recipes-gnome/gtk+/gtk+3_%.%.%.bbappend

diff --git a/meta-installer/recipes-gnome/gtk+/files/workaround-for-anaconda-installer-while-loading-libA.patch b/meta-installer/recipes-gnome/gtk+/files/workaround-for-anaconda-installer-while-loading-libA.patch
new file mode 100644
index 0000000..581618d
--- /dev/null
+++ b/meta-installer/recipes-gnome/gtk+/files/workaround-for-anaconda-installer-while-loading-libA.patch
@@ -0,0 +1,84 @@
+From a99480777c259c1ef0db3ac972abae348d930b41 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 9 Oct 2015 07:12:36 -0400
+Subject: [PATCH] workaround for anaconda installer while loading
+ libAnacondaWidgets
+
+Here is easy way to reproduce the failure:
+...
+root@localhost:~# python
+>>> from gi.repository import Gtk, AnacondaWidgets
+>>> builder = Gtk.Builder()
+>>> builder.get_type_from_name("AnacondaStandaloneWindow")
+<GType invalid (0)>
+...
+
+Which is expected:
+...
+root@localhost:~# python
+>>> from gi.repository import Gtk, AnacondaWidgets
+>>> builder = Gtk.Builder()
+>>> builder.get_type_from_name("AnacondaStandaloneWindow")
+<GType AnacondaStandaloneWindow (7297024)>
+...
+
+The root cause is the issue of 'g_module_open' and 'g_module_symbol'
+in libgmodule-2.0.so.0:
+While invoking 'g_module_open("libAnacondaWidgets.so.4.0.0", G_MODULE_BIND_LAZY);'
+, the following invoking 'g_module_open(NULL, G_MODULE_BIND_LAZY);' could not
+find its symbol by invoking g_module_symbol.
+
+So we hardcode to load the anaconda module explicitly.
+
+Upstream-Status: inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gtk/gtkbuilder.c | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/gtk/gtkbuilder.c b/gtk/gtkbuilder.c
+index f9599ab..8315638 100644
+--- a/gtk/gtkbuilder.c
++++ b/gtk/gtkbuilder.c
+@@ -398,6 +398,27 @@ type_name_mangle (const gchar *name)
+ }
+ 
+ static GType
++_gtk_builder_resolve_type_lazily_anaconda (const gchar *name)
++{
++  static GModule *module = NULL;
++  GTypeGetFunc func;
++  gchar *symbol;
++  GType gtype = G_TYPE_INVALID;
++
++  if (!module)
++  {
++    module = g_module_open ("libAnacondaWidgets.so.4", 0);
++  }
++  symbol = type_name_mangle (name);
++  if (g_module_symbol (module, symbol, (gpointer)&func))
++    gtype = func ();
++
++  g_free (symbol);
++
++  return gtype;
++}
++
++static GType
+ _gtk_builder_resolve_type_lazily (const gchar *name)
+ {
+   static GModule *module = NULL;
+@@ -405,6 +426,9 @@ _gtk_builder_resolve_type_lazily (const gchar *name)
+   gchar *symbol;
+   GType gtype = G_TYPE_INVALID;
+ 
++  if (strncmp(name, "Anaconda", strlen("Anaconda")) == 0)
++    return _gtk_builder_resolve_type_lazily_anaconda(name);
++
+   if (!module)
+     module = g_module_open (NULL, 0);
+   
+-- 
+1.9.1
+
diff --git a/meta-installer/recipes-gnome/gtk+/gtk+3_%.%.%.bbappend b/meta-installer/recipes-gnome/gtk+/gtk+3_%.%.%.bbappend
new file mode 100644
index 0000000..752b2f1
--- /dev/null
+++ b/meta-installer/recipes-gnome/gtk+/gtk+3_%.%.%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend_anaconda := "${THISDIR}/files:"
+SRC_URI_append_anaconda = " file://workaround-for-anaconda-installer-while-loading-libA.patch \
+"
-- 
2.8.1


