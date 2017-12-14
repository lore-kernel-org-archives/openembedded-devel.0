Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 53A4F78821
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:36:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p84so4110335pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5b/YV/+0qgkaevwdGenRWATaqdqFyjexiDroTp9dJ1M=;
	b=tLlhUhgSHKQ0vVuABYEdqYNMoYtlVQdVlc+ah7d6bYhnYhlX0j+Wk+IBbTUeXAntMy
	a7ehgJvNnofqViHs19w1Sg3IyDhzaRBDWBXRI2zXO9owlDNcXqP+XK/xZ6MHzH9sqp3H
	o1Ku0fkc6luYOxwHxx53AcehooRtlh74BsC47WYbpdtVz1+iOjZxVlLJv4G221cCIEZ3
	a7BpdWA7IFS+iiM8Fj3kKzfTwK0OvDWYTdq4gnY7+1J69UzxpVlpDa1cpNyUhRvPVou7
	qPAuTXZBLNvRvdf7CMUShylSTZgyItm+F++sLwnCXYp98jkWmzi53WkM9Y+PskmRa1Rz
	2g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5b/YV/+0qgkaevwdGenRWATaqdqFyjexiDroTp9dJ1M=;
	b=noSnYIfqinK0IWdPMWm9t2g8hrFnBVyStmDAUqqOBg786K1/6n3rI0Mnyd464yyepw
	7Kmq3gPndFH0y+q5JLOgeRVtPEX/S0GD0n46fOoQCO07Nj3tJ7U/HZPTFWBHyM46EcOM
	eCv5Oy+h4Juz0GsEAHoJ8kDE5YRaf/Ae0ldN8+PA8aFTRelK1qjTPu8G2m2hUffibUQH
	3LysOFJaDlh0KBB7V6kfMRGjFlWoAfzO0KobLPfXu6lhxP6U3QwOe3sEHqZGvSTjiMVT
	qkj8QqhisbsmBk6RbzYiP0Ae/jYUL8NFUzJmtSrU78LFkfkW0FM0ga7ZjqsAOkoDSJ53
	Rimg==
X-Gm-Message-State: AKGB3mLRTNgV/enH0u4U1UuBhu/h6vnQdeqThC75MET0BFei+5H4pRT/
	O2k/1FbFRAEUBkMWX0eiRR5fdQ==
X-Google-Smtp-Source: ACJfBosu7c6ZtjMCg9zADUj9IrwVyvIoiz1txC4bihoZtsRw+0K/AjCd6hPJEZUa+MabR9HhMlGxfQ==
X-Received: by 10.84.214.136 with SMTP id j8mr10283778pli.408.1513273007235;
	Thu, 14 Dec 2017 09:36:47 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id l14sm7437748pgn.9.2017.12.14.09.36.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 09:36:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 09:36:31 -0800
Message-Id: <20171214173633.16405-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171214173633.16405-1-raj.khem@gmail.com>
References: <20171214173633.16405-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] glade: Fix build with glib-2.0 > 2.53.4
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
X-List-Received-Date: Thu, 14 Dec 2017 17:36:46 -0000

Fixes
| ../../glade-3.20.0/gladeui/glade-signal-model.c:68:1: error: conflicting types for 'g_ptr_array_find'
|  g_ptr_array_find (GPtrArray *array, gpointer data)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-g_ptr_array_find-from-GLib.patch      | 93 ++++++++++++++++++++++
 meta-oe/recipes-devtools/glade/glade_3.20.0.bb     |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/glade/glade/0001-Use-g_ptr_array_find-from-GLib.patch

diff --git a/meta-oe/recipes-devtools/glade/glade/0001-Use-g_ptr_array_find-from-GLib.patch b/meta-oe/recipes-devtools/glade/glade/0001-Use-g_ptr_array_find-from-GLib.patch
new file mode 100644
index 000000000..d2071f5d2
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade/0001-Use-g_ptr_array_find-from-GLib.patch
@@ -0,0 +1,93 @@
+
+m 8a73d114ca5b4d37a770d0b6b69dd17a366dbcf4 Mon Sep 17 00:00:00 2001
+From: Jonh Wendell <jonh.wendell@redhat.com>
+Date: Thu, 4 May 2017 11:05:48 -0300
+Subject: Use g_ptr_array_find() from GLib
+
+https://bugzilla.gnome.org/show_bug.cgi?id=782161
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ configure.ac                 |  2 ++
+ gladeui/glade-signal-model.c | 30 ++++++++++--------------------
+ 2 files changed, 12 insertions(+), 20 deletions(-)
+
+Index: glade-3.20.0/configure.ac
+===================================================================
+--- glade-3.20.0.orig/configure.ac
++++ glade-3.20.0/configure.ac
+@@ -146,8 +146,10 @@ dnl ====================================
+ dnl Check for gtk+
+ dnl ================================================================
+ GTK_REQUIRED=3.20.0
++GLIB_REQUIRED=2.53.2
+ PKG_CHECK_MODULES([GTK],[
+   gtk+-3.0 >= $GTK_REQUIRED
++  glib-2.0 >= $GLIB_REQUIRED
+   gmodule-2.0
+   libxml-2.0 >= 2.4.0
+ ])
+Index: glade-3.20.0/gladeui/glade-signal-model.c
+===================================================================
+--- glade-3.20.0.orig/gladeui/glade-signal-model.c
++++ glade-3.20.0/gladeui/glade-signal-model.c
+@@ -64,18 +64,6 @@ G_DEFINE_TYPE_WITH_CODE (GladeSignalMode
+                          G_IMPLEMENT_INTERFACE (GTK_TYPE_TREE_DRAG_SOURCE,
+                                                 gtk_tree_drag_source_iface_init))
+ 
+-static gint
+-g_ptr_array_find (GPtrArray *array, gpointer data)
+-{
+-  gint i;
+-  for (i = 0; i < array->len; i++)
+-    {
+-      if (array->pdata[i] == data)
+-	return i;
+-    }
+-  return -1;
+-}
+-
+ static void
+ glade_signal_model_init (GladeSignalModel *object)
+ {
+@@ -524,13 +512,11 @@ glade_signal_model_get_path (GtkTreeMode
+ 	    {
+ 	      if (handlers)
+ 		{
+-		  gint handler_index = g_ptr_array_find (handlers, handler);
+-		  if (handler_index == -1) /* dummy handler */
+-		    {
+-		      index1 += handlers->len;
+-		    }
+-		  else
++		  guint handler_index;
++		  if (g_ptr_array_find (handlers, handler, &handler_index))
+ 		    index1 += handler_index;
++		  else
++		    index1 += handlers->len;
+ 		}
+ 	      break;
+ 	    }
+@@ -582,7 +568,8 @@ glade_signal_model_get_value (GtkTreeMod
+         {
+           GPtrArray *handlers = g_hash_table_lookup (sig_model->priv->signals,
+                                                      glade_signal_get_name (signal));
+-          if (!handlers || !handlers->len || g_ptr_array_find (handlers, signal) == 0)
++          guint index;
++          if (!handlers || !handlers->len || (g_ptr_array_find (handlers, signal, &index) && index == 0))
+             g_value_set_boolean (value, TRUE);
+           else
+             g_value_set_boolean (value, FALSE);
+@@ -718,7 +705,10 @@ glade_signal_model_iter_next (GtkTreeMod
+ 	}
+       else if (handlers)
+ 	{
+-	  gint new_index = g_ptr_array_find (handlers, handler) + 1;
++	  guint new_index = 0;
++	  if (g_ptr_array_find (handlers, handler, &new_index))
++	    new_index++;
++
+ 	  if (new_index < handlers->len)
+ 	    {
+ 	      glade_signal_model_create_signal_iter (sig_model, widget,
diff --git a/meta-oe/recipes-devtools/glade/glade_3.20.0.bb b/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
index f33b6e31b..ff6dcce26 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
@@ -13,6 +13,7 @@ inherit autotools pkgconfig gnomebase gobject-introspection
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.20/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
+           file://0001-Use-g_ptr_array_find-from-GLib.patch \
           "
 SRC_URI[md5sum] = "9964a2da14c5f845eae363889586ca43"
 SRC_URI[sha256sum] = "82d96dca5dec40ee34e2f41d49c13b4ea50da8f32a3a49ca2da802ff14dc18fe"
-- 
2.15.1


