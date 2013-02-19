Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7bxT-0002yG-Ao
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 02:25:23 +0100
Received: by mail-da0-f42.google.com with SMTP id z17so2690426dal.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 17:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=7Sins81sWXc8duGL0AZLLDrZdS1V6O7xLetF5lTIBuU=;
	b=re2SxdZLaL/MC4ZuJHQLySVuDZLCpvnOJFfkUgkmlZHeAfEpZvX2XeIhJC4OZAaxzh
	LC7oDKNi7OIf3/L8QEXdJ2BCD8IJQ5h/alOISL0vEG8UYJEBwTMdH1KYEUCzyzRV/0jI
	BPCgEQLg8G9bWHFNECo3k2pUm4iukQUkzi4GOEDmS89t22wBvuM4bewXi4tW1pwJoTyW
	rlPVabQf/beUxMNiVuh41IIhzq7C4D1RZ5T5XU5vppjpaknCbbwFrPepVANKmT4s/81j
	OuqXqM/eOysNmsX6HzYVe9ZOSIz7hygXlrtQDvz3M3rzMqeM8qQmLhKvUpxBRqmf0mo5
	5zmg==
X-Received: by 10.68.189.103 with SMTP id gh7mr35679485pbc.92.1361236153992;
	Mon, 18 Feb 2013 17:09:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o1sm28462792pax.2.2013.02.18.17.09.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 17:09:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2013 02:08:42 +0100
Message-Id: <7de05f853c75132d85ab926b170c5a27b8c8f72f.1361235235.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1361235235.git.Martin.Jansa@gmail.com>
References: <cover.1361235235.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1361235235.git.Martin.Jansa@gmail.com>
References: <cover.1361235235.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH][for-danny 1/2] meta-efl: include illume home button fix
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
X-List-Received-Date: Tue, 19 Feb 2013 01:25:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Märdian <luk@slyon.de>

 * Include upstream fix for illume home button
 * Upstream fixed it in SVN revision 76646

Signed-off-by: Lukas Märdian <luk@slyon.de>
---
 .../e17/e-wm/Fix-Illume-Home-Button.diff           | 166 +++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   3 +-
 2 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm/Fix-Illume-Home-Button.diff

diff --git a/meta-efl/recipes-efl/e17/e-wm/Fix-Illume-Home-Button.diff b/meta-efl/recipes-efl/e17/e-wm/Fix-Illume-Home-Button.diff
new file mode 100644
index 0000000..09b5feb
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm/Fix-Illume-Home-Button.diff
@@ -0,0 +1,166 @@
+Index: e/src/modules/illume2/policies/illume/policy.c
+===================================================================
+--- e/src/modules/illume2/policies/illume/policy.c	(revision 67951)
++++ e/src/modules/illume2/policies/illume/policy.c	(revision 76646)
+@@ -13,4 +13,5 @@
+ static void _policy_border_move(E_Border *bd, int x, int y);
+ static void _policy_border_resize(E_Border *bd, int w, int h);
++static void _policy_border_hide_above(E_Border *bd);
+ static void _policy_border_hide_below(E_Border *bd);
+ static void _policy_border_show_below(E_Border *bd);
+@@ -124,23 +125,57 @@
+ 
+ static void 
++_policy_border_hide_above(E_Border *bd)
++{
++   int pos = 0, layer = 0, i;
++
++   if (!bd) return;
++
++   /* determine layering position */
++   layer = bd->layer;
++   if (layer < 0) layer = 0;
++   pos = 1 + (layer / 50);
++   if (pos > 10) pos = 10;
++
++   /* Find the windows above this one */
++   for (i = (pos + 1); i < 11; i++)
++     {
++        Eina_List *l;
++        E_Border *b;
++
++        EINA_LIST_REVERSE_FOREACH(bd->zone->container->layers[i].clients, l, b) 
++          {
++             /* skip if it's the same border */
++             if (b == bd) continue;
++
++             /* skip if it's not on this zone */
++             if (b->zone != bd->zone) continue;
++
++             /* skip special borders */
++             if (e_illume_border_is_indicator(b)) continue;
++             if (e_illume_border_is_softkey(b)) continue;
++             if (e_illume_border_is_keyboard(b)) continue;
++             if (e_illume_border_is_quickpanel(b)) continue;
++             if (e_illume_border_is_home(b)) continue;
++
++             e_border_iconify(b);
++          }
++     }
++}
++
++static void 
+ _policy_border_hide_below(E_Border *bd) 
+ {
+-   int pos = 0, i;
+-
+-//   printf("Hide Borders Below: %s %d %d\n", 
+-//          bd->client.icccm.name, bd->x, bd->y);
++   int pos = 0, layer = 0, i;
+ 
+    if (!bd) return;
+ 
+    /* determine layering position */
+-   if (bd->layer <= 0) pos = 0;
+-   else if ((bd->layer > 0) && (bd->layer <= 50)) pos = 1;
+-   else if ((bd->layer > 50) && (bd->layer <= 100)) pos = 2;
+-   else if ((bd->layer > 100) && (bd->layer <= 150)) pos = 3;
+-   else if ((bd->layer > 150) && (bd->layer <= 200)) pos = 4;
+-   else pos = 5;
++   layer = bd->layer;
++   if (layer < 0) layer = 0;
++   pos = 1 + (layer / 50);
++   if (pos > 10) pos = 10;
+ 
+    /* Find the windows below this one */
+-   for (i = pos; i >= 2; i--) 
++   for (i = (pos - 1); i >= 0; i--)
+      {
+         Eina_List *l;
+@@ -184,5 +219,5 @@
+    Eina_List *l;
+    E_Border *prev;
+-   int pos = 0, i;
++   int pos = 0, layer = 0, i;
+ 
+ //   printf("Show Borders Below: %s %d %d\n", 
+@@ -201,13 +236,11 @@
+ 
+    /* determine layering position */
+-   if (bd->layer <= 0) pos = 0;
+-   else if ((bd->layer > 0) && (bd->layer <= 50)) pos = 1;
+-   else if ((bd->layer > 50) && (bd->layer <= 100)) pos = 2;
+-   else if ((bd->layer > 100) && (bd->layer <= 150)) pos = 3;
+-   else if ((bd->layer > 150) && (bd->layer <= 200)) pos = 4;
+-   else pos = 5;
++   layer = bd->layer;
++   if (layer < 0) layer = 0;
++   pos = 1 + (layer / 50);
++   if (pos > 10) pos = 10;
+ 
+    /* Find the windows below this one */
+-   for (i = pos; i >= 2; i--) 
++   for (i = (pos + 1); i < 11; i++)
+      {
+         E_Border *b;
+@@ -1039,7 +1072,7 @@
+ _policy_border_add(E_Border *bd) 
+ {
+-//   printf("Border added: %s\n", bd->client.icccm.class);
+-
+    if (!bd) return;
++
++//   printf("\nBorder added: %s\n", bd->client.icccm.class);
+ 
+    /* NB: this call sets an atom on the window that specifices the zone.
+@@ -1159,5 +1192,5 @@
+         if ((ind = e_illume_border_indicator_get(bd->zone))) 
+           {
+-             /* we have the indicator, show it if needed */
++             /* we have the indicator, hide it if needed */
+ 	     if (ind->visible) e_illume_border_hide(ind);
+           }
+@@ -1178,7 +1211,7 @@
+ _policy_border_focus_out(E_Border *bd) 
+ {
++   if (!bd) return;
++
+ //   printf("Border focus out: %s\n", bd->client.icccm.name);
+-
+-   if (!bd) return;
+ 
+    /* NB: if we got this focus_out event on a deleted border, we check if 
+@@ -1202,5 +1235,5 @@
+    E_Border *sft;
+ 
+-//   printf("Border Activate: %s\n", bd->client.icccm.name);
++   printf("Border Activate: %s\n", bd->client.icccm.name);
+ 
+    if (!bd) return;
+@@ -1707,5 +1740,18 @@
+    if (!zone) return;
+    if (!(bd = e_illume_border_home_get(zone))) return;
+-   _policy_border_set_focus(bd);
++
++   /* if the border was hidden due to layout, we need to unhide */
++   if (!bd->visible) e_illume_border_show(bd);
++
++   if ((bd->iconic) && (!bd->lock_user_iconify)) 
++     e_border_uniconify(bd);
++
++   if (!bd->lock_user_stacking) e_border_raise(bd);
++
++   /* hide the border(s) above this one */
++   _policy_border_hide_above(bd);
++
++   /* focus the border */
++   e_border_focus_set(bd, 1, 1);
+ }
+ 
+@@ -1835,5 +1881,5 @@
+         h = kbd->border->h;
+ 
+-        /* adjust Y for keyboard visibility because keyboard uses fx_offset */
++        /* adjust for keyboard visibility because keyboard uses fx_offset */
+         y = 0;
+         if (kbd->border->fx.y <= 0) y = kbd->border->y;
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index a6f56bd..af3f9cf 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -14,6 +14,7 @@ SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http \
   file://enlightenment_start.oe \
   file://applications.menu \
+  file://Fix-Illume-Home-Button.diff \
 "
 
 EXTRA_OECONF = "\
-- 
1.8.1.2



