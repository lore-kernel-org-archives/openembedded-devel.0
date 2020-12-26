Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.16515.1608945662098928589
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SeeOBkyV;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id m25so12214312lfc.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P8x41QlmCM6Ui2P5O1jcb/JRBWD0iftbJMtCtFoApUo=;
        b=SeeOBkyVcHHJ2GszNPmKsgL4fETYs6fxvsLsGT4cd2yCvYfk9PfeAte0Epcqw+sjJb
         eDJBfSfhZ0cmGBcMQLUJ084beCBDDt8lvN0Ibkx5jvrdHY++H036p5adZXWT4n1fwTIs
         5kMO7m4+mmIj5TYmRtPbh7lvQHYLD1H5d/jJqny8mi9EFrK+2FfkIbIaPcOazZT6tKda
         1/3VwesFhbbmxbLwTOg6kYt4FEacmCT74UcA0MGp5UxdhlB3OWC797DMQsX39Gp5cMd+
         69ow9I1ee+lneSIN54FMdGxyPQ3ZeraAJtM02kmJ3ju73E6MHqVfHnCrzlGIKQiuR5xB
         XUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P8x41QlmCM6Ui2P5O1jcb/JRBWD0iftbJMtCtFoApUo=;
        b=L/WUrWPaQQT6SbFay54AgGTDxVIVesaF1xnNoSScBpPZVIwWCnR77hA9n/Nl0lD8Ji
         M1XDzxPSwqLCXEebDfUipbpz+SS2YrQsoqC0tsTnfRCetpSiLYy3hVgNZbGU1JDi6Epm
         1w8wGcPpmlLNwgWZvWrRhe5+OzuOJjqn6t+Htd3wVkhadDzN5cvI9xzOr88sEso9Dcvs
         yNOXe7J/T9BZ/K/CSH4djWbDKMtaOjqcNVRt8Z1GeivNgVx+s4vsuALqnLzIp03QRoca
         kSIvfa50F4wuN7t+mXG9OsDnOn7D0PMwijK4/55TBgKvGyp6Bql9XUhub9DpW0rDIPC2
         f4Zg==
X-Gm-Message-State: AOAM531Wvk5aiHMjCHgcsdYnCFIGMC5GMWO4Jt6Lt9DwsFfhqgdSsYhh
	TFbgy8XgHbQ961R7HZk4wcsQwCCHvjt2Fw==
X-Google-Smtp-Source: ABdhPJwfU63xtrw2Py0UjudzZxWNo4uz9LebV83hZ4dXem545ihWSi6idejmJci1dDHbKBq3E64dEQ==
X-Received: by 2002:a2e:3312:: with SMTP id d18mr18009007ljc.284.1608945659892;
        Fri, 25 Dec 2020 17:20:59 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id a15sm4306317lfg.27.2020.12.25.17.20.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 17:20:59 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/7] openbox-xdgmenu: Openbox menu generator
Date: Sat, 26 Dec 2020 04:20:51 +0300
Message-Id: <20201226012054.3689086-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Openbox has an ability to use external programs to generate menu.
Revive and forward port one of the simplest menu generators using XDG
desktop files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../openbox/openbox-xdgmenu/7_6.diff          |  13 ++
 .../openbox-xdgmenu/fix-menu-generation.patch |  27 +++
 .../openbox-xdgmenu/port-gnome-menus3.patch   | 184 ++++++++++++++++++
 .../openbox/openbox-xdgmenu_0.3.bb            |  32 +++
 4 files changed, 256 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
 create mode 100644 meta-oe/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
 create mode 100644 meta-oe/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
 create mode 100644 meta-oe/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb

diff --git a/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff b/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
new file mode 100644
index 000000000000..8ab5386dc143
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/7_6.diff
@@ -0,0 +1,13 @@
+=== modified file 'openbox-xdgmenu.c'
+--- openbox-xdgmenu.c	2011-09-03 20:13:39 +0000
++++ openbox-xdgmenu.c	2013-12-28 17:41:04 +0000
+@@ -235,7 +235,7 @@
+     }
+     
+     g_printf("<item label=\"%s\">\n", g_strjoinv("&amp;", g_strsplit(name,"&",0))),
+-    g_printf("<action name=\"Execute\"><execute>%s</execute></action>\n", exec),
++    g_printf("<action name=\"Execute\"><command>%s</command></action>\n", exec),
+     g_printf("</item>\n");
+     
+     g_free(name);
+
diff --git a/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch b/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
new file mode 100644
index 000000000000..03b357263f61
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
@@ -0,0 +1,27 @@
+Index: openbox-xdgmenu-0.3/openbox-xdgmenu.c
+===================================================================
+--- openbox-xdgmenu-0.3.orig/openbox-xdgmenu.c
++++ openbox-xdgmenu-0.3/openbox-xdgmenu.c
+@@ -197,7 +197,7 @@ void process_entry(GMenuTreeEntry *entry
+ {
+     GDesktopAppInfo *appinfo = gmenu_tree_entry_get_app_info (entry);
+     char *name = g_strdup (g_app_info_get_name(G_APP_INFO(appinfo)));
+-    char *exec = g_strdup (g_app_info_get_executable(G_APP_INFO(appinfo)));
++    char *exec = g_strdup (g_app_info_get_commandline(G_APP_INFO(appinfo)));
+     int i;
+     
+     for (i = 0; i < strlen(exec) - 1; i++) {
+@@ -217,8 +217,11 @@ void process_entry(GMenuTreeEntry *entry
+         }
+     }
+     
+-    g_printf("<item label=\"%s\">\n", g_strjoinv("&amp;", g_strsplit(name,"&",0))),
+-    g_printf("<action name=\"Execute\"><command>%s</command></action>\n", exec),
++    g_printf("<item label=\"%s\">\n", g_strjoinv("&amp;", g_strsplit(name,"&",0)));
++    g_printf("<action name=\"Execute\"><command>%s%s</command></action>\n",
++            g_desktop_app_info_get_boolean(appinfo, G_KEY_FILE_DESKTOP_KEY_TERMINAL) ?
++            "x-terminal-emulator -e " : "",
++            exec);
+     g_printf("</item>\n");
+     
+     g_free(name);
diff --git a/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch b/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
new file mode 100644
index 000000000000..3fcc319164e9
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
@@ -0,0 +1,184 @@
+Index: openbox-xdgmenu-0.3/openbox-xdgmenu.c
+===================================================================
+--- openbox-xdgmenu-0.3.orig/openbox-xdgmenu.c
++++ openbox-xdgmenu-0.3/openbox-xdgmenu.c
+@@ -32,7 +32,7 @@
+ #include <string.h>
+ #include <glib.h>
+ #include <glib/gprintf.h>
+-#include <gnome-menus/gmenu-tree.h>
++#include <gnome-menus-3.0/gmenu-tree.h>
+ 
+ /*=============================================================================
+  * Declarations
+@@ -42,7 +42,6 @@ static void process_directory(GMenuTreeD
+ static void process_entry(GMenuTreeEntry *entry);
+ static void process_separator(GMenuTreeSeparator *entry);
+ 
+-gboolean option_show_amount_of_entries = 0;
+ gboolean option_do_not_use_categories = 0;
+ 
+ /*=============================================================================
+@@ -61,11 +60,6 @@ int main (int argc, char **argv)
+           g_free (xdgfile);
+           return 0;
+         }
+-        else if ((strcmp (argv[i], "--show-amount") == 0) ||
+-        (strcmp (argv[i], "-a") == 0))
+-        {
+-            option_show_amount_of_entries = 1;
+-        }
+         else if ((strcmp (argv[i], "--plain") == 0) ||
+         (strcmp (argv[i], "-p") == 0))
+         {
+@@ -93,16 +87,15 @@ int main (int argc, char **argv)
+         return 1;
+     }
+     
+-    FILE * file;
+-    if (!(file = fopen(xdgfile, "r")))
++    GMenuTree *menuTree = gmenu_tree_new (xdgfile,  GMENU_TREE_FLAGS_NONE );
++
++    GError *error = NULL;
++    if (!gmenu_tree_load_sync(menuTree, &error))
+     {
+-        g_printf ("Could not read file \"%s\".\n", xdgfile);
+-        g_free (xdgfile);
+-        return 2;
++        g_printerr ("Failed to load tree: %s\n", error->message);
++        g_clear_error (&error);
++        return 3;
+     }
+-    fclose(file);
+-    
+-    GMenuTree *menuTree = gmenu_tree_lookup (xdgfile,  GMENU_TREE_FLAGS_NONE );
+     
+     GMenuTreeDirectory *rootDirectory = gmenu_tree_get_root_directory(menuTree);
+     
+@@ -129,11 +122,10 @@ void show_help()
+     g_printf ("  openbox-xdgmenu [options] <Xdg menu file>\n");
+     g_printf ("\n");
+     g_printf ("Options:\n");
+-    g_printf ("  -a: Show the amount of items in each category next to its name.\n");
+     g_printf ("  -p: Do not use categories.\n");
+     g_printf ("\n");
+     g_printf ("For example:\n");
+-    g_printf ("  openbox-xdgmenu \"/etc/xdg/menus/applications.menu\"\n\n");
++    g_printf ("  openbox-xdgmenu \"gnome-applications.menu\"\n\n");
+ }
+ 
+ /*=============================================================================
+@@ -141,72 +133,61 @@ void show_help()
+  */
+ void process_directory(GMenuTreeDirectory *directory, gboolean isRoot)
+ {
+-    int hasSeparator = 0;
++    GMenuTreeSeparator *separator = NULL;
+     int hasMenu = 0;
+     GMenuTreeItemType entryType;
+-    GSList *entryList = gmenu_tree_directory_get_contents (directory);
+-    GSList *l;
+-    
+-    if (option_do_not_use_categories == 00 && isRoot == 0 &&
+-    g_slist_length(entryList) > 0)
++    GMenuTreeIter *iter = gmenu_tree_directory_iter (directory);
++    GMenuTreeItemType next_type;
++
++    while ((next_type = gmenu_tree_iter_next (iter)) != GMENU_TREE_ITEM_INVALID)
+     {
+-        hasMenu = 1;
+-        
+-        if (option_show_amount_of_entries == 1)
++        if (option_do_not_use_categories == 00 && isRoot == 0 && hasMenu == 0)
+         {
++            hasMenu = 1;
++ 
+             g_printf(
+-              "<menu id=\"xdg-menu-%s\" label=\"%s (%d)\">\n",
+-              g_strjoinv("&amp;", g_strsplit(gmenu_tree_directory_get_name(directory),"&",0)),
+-              g_strjoinv("&amp;", g_strsplit(gmenu_tree_directory_get_name(directory),"&",0)),
+-              g_slist_length(entryList));
++                  "<menu id=\"xdg-menu-%s\" label=\"%s\">\n",
++                  g_strjoinv("&amp;", g_strsplit(gmenu_tree_directory_get_name(directory),"&",0)),
++                  g_strjoinv("&amp;", g_strsplit(gmenu_tree_directory_get_name(directory),"&",0)));
+         }
+-        else
+-        {
+-            g_printf(
+-              "<menu id=\"xdg-menu-%s\" label=\"%s\">\n",
+-              g_strjoinv("&amp;", g_strsplit(gmenu_tree_directory_get_name(directory),"&",0)),
+-              g_strjoinv("&amp;", g_strsplit(gmenu_tree_directory_get_name(directory),"&",0)));
+-        }
+-    }
+ 
+-    for (l = entryList; l; l = l->next)
+-    {
+-        GMenuTreeItem *item = l->data;
+-        
+-        entryType = gmenu_tree_item_get_type (GMENU_TREE_ITEM(item));
+-        
+-        switch (entryType)
++        switch (next_type)
+         {
++            case GMENU_TREE_ITEM_INVALID:
++                break;
+             case GMENU_TREE_ITEM_DIRECTORY:
+-                if (hasSeparator)
++                if (separator != NULL)
+                 {
+-                    process_separator(GMENU_TREE_SEPARATOR(item));
+-                    hasSeparator = 0;
++                    process_separator(separator);
++                    gmenu_tree_item_unref (separator);
++                    separator = NULL;
+                 }
+-                process_directory(GMENU_TREE_DIRECTORY(item), 0);
++                process_directory(gmenu_tree_iter_get_directory(iter), 0);
+                 break;
+             case GMENU_TREE_ITEM_ENTRY:
+-                if (hasSeparator)
++                if (separator != NULL)
+                 {
+-                    process_separator(GMENU_TREE_SEPARATOR(item));
+-                    hasSeparator = 0;
++                    process_separator(separator);
++                    gmenu_tree_item_unref (separator);
++                    separator = NULL;
+                 }
+-                process_entry(GMENU_TREE_ENTRY(item));
++                process_entry(gmenu_tree_iter_get_entry(iter));
+                 break;
+             case GMENU_TREE_ITEM_SEPARATOR:
+-                hasSeparator = 1;
++                separator = gmenu_tree_iter_get_separator(iter);
+                 break;
+         }
+-        
+-        gmenu_tree_item_unref (item);
+     }
+     
+     if (hasMenu == 1)
+     {
+         g_printf("</menu>\n");
+     }
++
++    if (separator != NULL)
++        gmenu_tree_item_unref (separator);
+     
+-    g_slist_free (entryList);
++    gmenu_tree_iter_unref (iter);
+ }
+ 
+ /*=============================================================================
+@@ -214,8 +195,9 @@ void process_directory(GMenuTreeDirector
+  */
+ void process_entry(GMenuTreeEntry *entry)
+ {
+-    char *name = g_strdup (gmenu_tree_entry_get_name(entry));
+-    char *exec = g_strdup (gmenu_tree_entry_get_exec(entry));
++    GDesktopAppInfo *appinfo = gmenu_tree_entry_get_app_info (entry);
++    char *name = g_strdup (g_app_info_get_name(G_APP_INFO(appinfo)));
++    char *exec = g_strdup (g_app_info_get_executable(G_APP_INFO(appinfo)));
+     int i;
+     
+     for (i = 0; i < strlen(exec) - 1; i++) {
diff --git a/meta-oe/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb b/meta-oe/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
new file mode 100644
index 000000000000..6e565c483c02
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Openbox configuration tool"
+AUTHOR = "Siegfried Gevatter"
+HOMEPAGE = "https://launchpad.net/openbox-xdgmenu/"
+SECTION = "x11/wm"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+DEPENDS = " \
+    gnome-menus3 \
+    glib-2.0 \
+"
+PV = "0.3"
+
+SRC_URI = " \
+    http://launchpad.net/openbox-xdgmenu/trunk/0.3/+download/openbox-xdgmenu-0.3.tar.gz \
+    file://7_6.diff;striplevel=0 \
+    file://port-gnome-menus3.patch \
+    file://fix-menu-generation.patch \
+"
+SRC_URI[sha256sum] = "824e099928aab2fb628f0fa4870ef7bba10b95581e47c2d8fa216709a0f399b3"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE = " \
+    CC='${CC}' \
+    CFLAGS='${CPPFLAGS} ${CFLAGS} `pkg-config --cflags glib-2.0 libgnome-menu-3.0` -DGMENU_I_KNOW_THIS_IS_UNSTABLE' \
+    LDFLAGS='${LDFLAGS} `pkg-config --libs glib-2.0 libgnome-menu-3.0`' \
+"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 openbox-xdgmenu ${D}${bindir}
+}
-- 
2.29.2

