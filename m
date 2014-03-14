Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 67C886EEFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 18:03:33 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id kl14so2959490pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=PBlsKejQDm9bpSYDPIbgqDPpWqxUfSULF8gKcyQGpeA=;
	b=HGMMUmzyzuqz8iBIRtwMUophw7tD4JylG+zed75wSxEKW2ASMuZFH+NSH1MSwRz+lK
	RJNGvcoS8REoCehmrydKcXsj85YmrYB3kurFnrT4u2RYP15k4dXTScyKLGs0LJRKALxn
	5IaxtthXCsb1zw6fzH/1QbhUsDFX4fpibsBczJ6lGc9VPSv8w4WUFXJfQdF1vX+OIGm5
	NJQrKXUAPw+DqwvZrN4UR8bWCIMnxITA9OTnEZS+gfC2sM8ioBNBfj1D75WSxH4YVSUV
	zbk8IipXBA8T+kXDqfBtiUHbB+pJFpVzZvCOXf8UxxgDg6uDYB1Ma+wLVdKCjGsHAvBR
	MQyw==
X-Received: by 10.66.27.67 with SMTP id r3mr10478115pag.62.1394820214543;
	Fri, 14 Mar 2014 11:03:34 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	bz4sm18700231pbb.12.2014.03.14.11.03.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Mar 2014 11:03:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Mar 2014 11:04:59 -0700
Message-Id: <1394820299-22792-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-browser][PATCH V2] chromium: Upgrade 29 -> 35
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
X-List-Received-Date: Fri, 14 Mar 2014 18:03:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed already applied patches

License year changed thats why there is change in checksum

-// Copyright 2014 The Chromium Authors. All rights reserved.
+// Copyright (c) 2013 The Chromium Authors. All rights reserved.

we see

rpm/bin/debugedit: canonicalization unexpectedly shrank by one character

so we add PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"

Enable SUID sandbox

Install ICU configuration file which is required

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 ...tracker_notify_deprecated_since_ATK_2_9_4.patch |  17 --
 .../chromium-29.0.1518.2/armv6/include.gypi        |   8 -
 .../chromium-29.0.1518.2/armv6/oe-defaults.gypi    |  15 --
 .../chromium-29.0.1518.2/armv7a/include.gypi       |   9 -
 .../chromium-29.0.1518.2/armv7a/oe-defaults.gypi   |  15 --
 .../chromium/chromium-29.0.1518.2/google-chrome    |   7 -
 .../chromium-29.0.1518.2/google-chrome.desktop     | 222 ---------------------
 .../chromium-29.0.1518.2/i586/include.gypi         |   5 -
 .../chromium-29.0.1518.2/i586/oe-defaults.gypi     |  15 --
 .../chromium-29.0.1518.2/secitem_array.patch       |  26 ---
 .../uninitialised-warning.patch                    |  90 ---------
 .../chromium/chromium-29.0.1518.2/unistd-2.patch   |  27 ---
 .../chromium-29.0.1518.2/x86-64/include.gypi       |   5 -
 .../chromium-29.0.1518.2/x86-64/oe-defaults.gypi   |  15 --
 ...tracker_notify_deprecated_since_ATK_2_9_4.patch |  17 ++
 .../chromium/chromium/armv6/include.gypi           |   8 +
 .../chromium/chromium/armv6/oe-defaults.gypi       |  15 ++
 .../chromium/chromium/armv7a/include.gypi          |   9 +
 .../chromium/chromium/armv7a/oe-defaults.gypi      |  15 ++
 recipes-browser/chromium/chromium/google-chrome    |   8 +
 .../chromium/chromium/google-chrome.desktop        | 222 +++++++++++++++++++++
 .../chromium/chromium/i586/include.gypi            |   5 +
 .../chromium/chromium/i586/oe-defaults.gypi        |  15 ++
 .../chromium/chromium/secitem_array.patch          |  26 +++
 .../chromium/chromium/uninitialised-warning.patch  |  90 +++++++++
 recipes-browser/chromium/chromium/unistd-2.patch   |  27 +++
 .../chromium/chromium/x86-64/include.gypi          |   5 +
 .../chromium/chromium/x86-64/oe-defaults.gypi      |  15 ++
 recipes-browser/chromium/chromium_29.0.1518.2.bb   |  74 -------
 recipes-browser/chromium/chromium_35.0.1883.0.bb   |  79 ++++++++
 30 files changed, 556 insertions(+), 550 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
 create mode 100644 recipes-browser/chromium/chromium/armv6/include.gypi
 create mode 100644 recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium/armv7a/include.gypi
 create mode 100644 recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium/google-chrome
 create mode 100644 recipes-browser/chromium/chromium/google-chrome.desktop
 create mode 100644 recipes-browser/chromium/chromium/i586/include.gypi
 create mode 100644 recipes-browser/chromium/chromium/i586/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium/secitem_array.patch
 create mode 100644 recipes-browser/chromium/chromium/uninitialised-warning.patch
 create mode 100644 recipes-browser/chromium/chromium/unistd-2.patch
 create mode 100644 recipes-browser/chromium/chromium/x86-64/include.gypi
 create mode 100644 recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium_29.0.1518.2.bb
 create mode 100644 recipes-browser/chromium/chromium_35.0.1883.0.bb

diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch b/recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
deleted file mode 100644
index a44abff..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
+++ /dev/null
@@ -1,17 +0,0 @@
---- a/content/browser/accessibility/browser_accessibility_manager_gtk.cc	2013-05-26 00:43:54.000000000 +0200
-+++ b/content/browser/accessibility/browser_accessibility_manager_gtk.cc	2013-12-14 15:45:44.251138663 +0100
-@@ -55,11 +55,9 @@
-       RecursivelySendChildrenChanged(GetRoot()->ToBrowserAccessibilityGtk());
-       break;
-     case AccessibilityNotificationFocusChanged:
--      // Note: atk_focus_tracker_notify may be deprecated in the future;
--      // follow this bug for the replacement:
--      // https://bugzilla.gnome.org/show_bug.cgi?id=649575#c4
--      g_signal_emit_by_name(atk_object, "focus-event", true);
--      atk_focus_tracker_notify(atk_object);
-+      // Note: the focus-event was deprecated in ATK 2.9.4
-+      // See https://bugzilla.gnome.org/show_bug.cgi?id=649575#c8  
-+      g_signal_emit_by_name(atk_object, "focus-event", true); 
-       break;
-     default:
-       break;
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
deleted file mode 100644
index 2c88271..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
+++ /dev/null
@@ -1,8 +0,0 @@
-{
-  'variables': {
-    # Configure for armv6 compilation
-    'target_arch': 'arm',
-    'armv7': 0,
-    'arm_neon': 0,
-  }
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
deleted file mode 100644
index 27e1cfe..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 1,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 0,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
deleted file mode 100644
index 316cf48..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
+++ /dev/null
@@ -1,9 +0,0 @@
-{
-  'variables': {
-    # Configure for armv7 compilation
-    'target_arch': 'arm',
-    'armv7': 1,
-    'arm_thumb': 1,
-    'arm_neon': 1,
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
deleted file mode 100644
index 27e1cfe..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 1,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 0,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome b/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
deleted file mode 100644
index 2d17772..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-if [ "${USER}" = "root" ] ; then 
-	/usr/bin/chrome/chrome --user-data-dir=${HOME}/.chromium/ $@
-else
-	/usr/bin/chrome/chrome $@
-fi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop b/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
deleted file mode 100644
index 76a2533..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
+++ /dev/null
@@ -1,222 +0,0 @@
-[Desktop Entry]
-Version=1.0
-Name=Chromium
-# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
-# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
-GenericName=Web Browser
-GenericName[ar]=????? ??????
-GenericName[bg]=??? ???????
-GenericName[ca]=Navegador web
-GenericName[cs]=WWW prohlíže?
-GenericName[da]=Browser
-GenericName[de]=Web-Browser
-GenericName[el]=?????????? ?????
-GenericName[en_GB]=Web Browser
-GenericName[es]=Navegador web
-GenericName[et]=Veebibrauser
-GenericName[fi]=WWW-selain
-GenericName[fr]=Navigateur Web
-GenericName[gu]=??? ???????
-GenericName[he]=????? ???????
-GenericName[hi]=??? ????????
-GenericName[hu]=Webböngész?
-GenericName[it]=Browser Web
-GenericName[ja]=???????
-GenericName[kn]=??? ??????
-GenericName[ko]=? ????
-GenericName[lt]=Žiniatinklio naršykl?
-GenericName[lv]=T?mek?a p?rl?ks
-GenericName[ml]=???? ????????
-GenericName[mr]=??? ???????
-GenericName[nb]=Nettleser
-GenericName[nl]=Webbrowser
-GenericName[pl]=Przegl?darka WWW
-GenericName[pt]=Navegador Web
-GenericName[pt_BR]=Navegador da Internet
-GenericName[ro]=Navigator de Internet
-GenericName[ru]=???-???????
-GenericName[sl]=Spletni brskalnik
-GenericName[sv]=Webbläsare
-GenericName[ta]=???? ?????
-GenericName[th]=???????????????
-GenericName[tr]=Web Taray?c?
-GenericName[uk]=????????? ?????
-GenericName[zh_CN]=?????
-GenericName[zh_HK]=?????
-GenericName[zh_TW]=?????
-# Not translated in KDE, from Epiphany 2.26.1-0ubuntu1.
-GenericName[bn]=???? ????????
-GenericName[fil]=Web Browser
-GenericName[hr]=Web preglednik
-GenericName[id]=Browser Web
-GenericName[or]=????? ???????
-GenericName[sk]=WWW prehliada?
-GenericName[sr]=???????? ??????????
-GenericName[te]=????? ???????
-GenericName[vi]=B? duy?t Web
-# Gnome and KDE 3 uses Comment.
-Comment=Access the Internet
-Comment[ar]=?????? ??? ????????
-Comment[bg]=?????? ?? ????????
-Comment[bn]=??????????? ????????? ????
-Comment[ca]=Accedeix a Internet
-Comment[cs]=P?ístup k internetu
-Comment[da]=Få adgang til internettet
-Comment[de]=Internetzugriff
-Comment[el]=???????? ??? ?????????
-Comment[en_GB]=Access the Internet
-Comment[es]=Accede a Internet.
-Comment[et]=Pääs Internetti
-Comment[fi]=Käytä internetiä
-Comment[fil]=I-access ang Internet
-Comment[fr]=Accéder à Internet
-Comment[gu]=??????? ?????? ???
-Comment[he]=???? ?? ????????
-Comment[hi]=??????? ?? ????? ??????? ????
-Comment[hr]=Pristup Internetu
-Comment[hu]=Internetelérés
-Comment[id]=Akses Internet
-Comment[it]=Accesso a Internet
-Comment[ja]=????????????
-Comment[kn]=????????? ????? ?????????
-Comment[ko]=??? ??
-Comment[lt]=Interneto prieiga
-Comment[lv]=Piek??t internetam
-Comment[ml]=?????????????? ??????? ???????
-Comment[mr]=???????????? ?????? ???
-Comment[nb]=Gå til Internett
-Comment[nl]=Verbinding maken met internet
-Comment[or]=?????????? ?????? ??????
-Comment[pl]=Skorzystaj z internetu
-Comment[pt]=Aceder à Internet
-Comment[pt_BR]=Acessar a internet
-Comment[ro]=Accesa?i Internetul
-Comment[ru]=?????? ? ????????
-Comment[sk]=Prístup do siete Internet
-Comment[sl]=Dostop do interneta
-Comment[sr]=?????????? ?????????
-Comment[sv]=Gå ut på Internet
-Comment[ta]=???????? ????????
-Comment[te]=???????????? ??????? ????????
-Comment[th]=???????????????????
-Comment[tr]=?nternet'e eri?in
-Comment[uk]=?????? ?? ?????????
-Comment[vi]=Truy c?p Internet
-Comment[zh_CN]=?????
-Comment[zh_HK]=???????
-Comment[zh_TW]=???????
-Exec=/usr/bin/google-chrome %U
-Terminal=false
-Icon=/usr/bin/chrome/product_logo_48.png
-Type=Application
-Categories=Network;WebBrowser;
-MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
-X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognito
-
-[NewWindow Shortcut Group]
-Name=New Window
-Name[am]=??? ????
-Name[ar]=????? ?????
-Name[bg]=??? ????????
-Name[bn]=???? ??????
-Name[ca]=Finestra nova
-Name[cs]=Nové okno
-Name[da]=Nyt vindue
-Name[de]=Neues Fenster
-Name[el]=??? ????????
-Name[en_GB]=New Window
-Name[es]=Nueva ventana
-Name[et]=Uus aken
-Name[fa]=????? ????
-Name[fi]=Uusi ikkuna
-Name[fil]=New Window
-Name[fr]=Nouvelle fenêtre
-Name[gu]=??? ?????
-Name[hi]=?? ?????
-Name[hr]=Novi prozor
-Name[hu]=Új ablak
-Name[id]=Jendela Baru
-Name[it]=Nuova finestra
-Name[iw]=???? ???
-Name[ja]=???????
-Name[kn]=??? ?????
-Name[ko]=? ?
-Name[lt]=Naujas langas
-Name[lv]=Jauns logs
-Name[ml]=????? ???????
-Name[mr]=???? ?????
-Name[nl]=Nieuw venster
-Name[no]=Nytt vindu
-Name[pl]=Nowe okno
-Name[pt]=Nova janela
-Name[pt_BR]=Nova janela
-Name[ro]=Fereastr? nou?
-Name[ru]=????? ????
-Name[sk]=Nové okno
-Name[sl]=Novo okno
-Name[sr]=???? ??????
-Name[sv]=Nytt fönster
-Name[sw]=Dirisha Jipya
-Name[ta]=????? ??????
-Name[te]=??????? ?????
-Name[th]=????????????
-Name[tr]=Yeni Pencere
-Name[uk]=???? ?????
-Name[vi]=C?a s? M?i
-Name[zh_CN]=????
-Name[zh_TW]=????
-Exec=/usr/bin/google-chrome
-TargetEnvironment=Unity
-
-[NewIncognito Shortcut Group]
-Name=New Incognito Window
-Name[ar]=????? ????? ?????? ???????
-Name[bg]=??? ???????? „?????????“
-Name[bn]=???? ???????? ??????
-Name[ca]=Finestra d'incògnit nova
-Name[cs]=Nové anonymní okno
-Name[da]=Nyt inkognitovindue
-Name[de]=Neues Inkognito-Fenster
-Name[el]=??? ???????? ??? ??????? ?????????
-Name[en_GB]=New Incognito window
-Name[es]=Nueva ventana de incógnito
-Name[et]=Uus inkognito aken
-Name[fa]=????? ???? ???? ??????
-Name[fi]=Uusi incognito-ikkuna
-Name[fil]=Bagong Incognito window
-Name[fr]=Nouvelle fenêtre de navigation privée
-Name[gu]=??? ???? ?????
-Name[hi]=?? ????? ?????
-Name[hr]=Novi anoniman prozor
-Name[hu]=Új Inkognitóablak
-Name[id]=Jendela Penyamaran baru
-Name[it]=Nuova finestra di navigazione in incognito
-Name[iw]=???? ??? ?????? ????
-Name[ja]=????????? ?????
-Name[kn]=??? ?????? ?????
-Name[ko]=? ??? ?
-Name[lt]=Naujas inkognito langas
-Name[lv]=Jauns inkognito rež?ma logs
-Name[ml]=????? ??? ????????? ???????
-Name[mr]=???? ????? ?????
-Name[nl]=Nieuw incognitovenster
-Name[no]=Nytt inkognitovindu
-Name[pl]=Nowe okno incognito
-Name[pt]=Nova janela de navegação anónima
-Name[pt_BR]=Nova janela anônima
-Name[ro]=Fereastr? nou? incognito
-Name[ru]=????? ???? ? ?????? ?????????
-Name[sk]=Nové okno inkognito
-Name[sl]=Novo okno brez beleženja zgodovine
-Name[sr]=???? ?????? ?? ?????????? ??? ??????????
-Name[sv]=Nytt inkognitofönster
-Name[ta]=????? ????????? ??????
-Name[te]=??????? ?????? ?????
-Name[th]=???????????????????????????
-Name[tr]=Yeni Gizli pencere
-Name[uk]=???? ????? ? ?????? ?????????? ?????????
-Name[vi]=C?a s? ?n danh m?i
-Name[zh_CN]=??????
-Name[zh_TW]=???????
-Exec=/usr/bin/google-chrome --incognito
-TargetEnvironment=Unity
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
deleted file mode 100644
index 69f3a08..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  'variables': {
-    'target_arch': 'ia32',
-  }
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
deleted file mode 100644
index 0a6e8e8..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 0,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 1,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0,
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch b/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch
deleted file mode 100644
index 3537952..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch
+++ /dev/null
@@ -1,26 +0,0 @@
---- trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c	2013/06/13 22:43:39	206183
-+++ trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c	2013/06/13 22:44:52	206184
-@@ -6,6 +6,7 @@
-  * Support routines for SECItemArray data structure.
-  */
- 
-+#include "nssutil.h"
- #include "seccomon.h"
- #include "secitem.h"
- #include "secerr.h"
-@@ -13,10 +14,15 @@
- 
- typedef struct SECItemArrayStr SECItemArray;
- 
-+#define NSSUTIL_VERSION_NUM \
-+    (NSSUTIL_VMAJOR * 10000 + NSSUTIL_VMINOR * 100 + NSSUTIL_VPATCH)
-+#if NSSUTIL_VERSION_NUM < 31500
-+// Added in NSS 3.15.
- struct SECItemArrayStr {
-     SECItem *items;
-     unsigned int len;
- };
-+#endif
- 
- SECItemArray *
- SECITEM_AllocArray(PLArenaPool *arena, SECItemArray *array, unsigned int len)
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch b/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
deleted file mode 100644
index fac12bb..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Make gcc 4.8 happy. It complains about uninitialized symbols
-
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual uint64 webkit_glue::WebClipboardImpl::sequenceNumber(WebKit::WebClipboard::Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:80:48: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    return client_->GetSequenceNumber(buffer_type);
-|                                                 ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebVector<WebKit::WebString> webkit_glue::WebClipboardImpl::readAvailableTypes(WebKit::WebClipboard::Buffer, bool*)':
-| ../../webkit/glue/webclipboard_impl.cc:118:73: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|      client_->ReadAvailableTypes(buffer_type, &types, contains_filenames);
-|                                                                          ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebData webkit_glue::WebClipboardImpl::readImage(WebKit::WebClipboard::Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:169:45: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    client_->ReadImage(buffer_type, &png_data);
-|                                              ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readCustomData(WebKit::WebClipboard::Buffer, const WebKit::WebString&)':
-| ../../webkit/glue/webclipboard_impl.cc:180:52: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    client_->ReadCustomData(buffer_type, type, &data);
-|                                                     ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readHTML(WebKit::WebClipboard::Buffer, WebKit::WebURL*, unsigned int*, unsigned int*)':
-| ../../webkit/glue/webclipboard_impl.cc:158:56: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|                      static_cast<uint32*>(fragment_end));
-|                                                         ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readPlainText(WebKit::WebClipboard::Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:136:3: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    if (client_->IsFormatAvailable(ui::Clipboard::GetPlainTextFormatType(),
-|    ^
-| cc1plus: all warnings being treated as errors
-
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Unknown
-Index: chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
-===================================================================
---- chromium-29.0.1518.2.orig/webkit/glue/webclipboard_impl.cc
-+++ chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
-@@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
- }
- 
- uint64 WebClipboardImpl::sequenceNumber(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return 0;
- 
-@@ -112,7 +112,7 @@ bool WebClipboardImpl::isFormatAvailable
- 
- WebVector<WebString> WebClipboardImpl::readAvailableTypes(
-     Buffer buffer, bool* contains_filenames) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   std::vector<base::string16> types;
-   if (ConvertBufferType(buffer, &buffer_type)) {
-     client_->ReadAvailableTypes(buffer_type, &types, contains_filenames);
-@@ -121,7 +121,7 @@ WebVector<WebString> WebClipboardImpl::r
- }
- 
- WebString WebClipboardImpl::readPlainText(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
- 
-@@ -147,7 +147,7 @@ WebString WebClipboardImpl::readPlainTex
- WebString WebClipboardImpl::readHTML(Buffer buffer, WebURL* source_url,
-                                      unsigned* fragment_start,
-                                      unsigned* fragment_end) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
- 
-@@ -161,7 +161,7 @@ WebString WebClipboardImpl::readHTML(Buf
- }
- 
- WebData WebClipboardImpl::readImage(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebData();
- 
-@@ -172,7 +172,7 @@ WebData WebClipboardImpl::readImage(Buff
- 
- WebString WebClipboardImpl::readCustomData(Buffer buffer,
-                                            const WebString& type) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
- 
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch b/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
deleted file mode 100644
index 6b5018b..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/chrome/browser/memory_details_linux.cc b/chrome/browser/memory_details_linux.cc
-index bee24ce..299f237 100644
---- a/chrome/browser/memory_details_linux.cc
-+++ b/chrome/browser/memory_details_linux.cc
-@@ -7,6 +7,10 @@
- #include <map>
- #include <set>
- 
-+#if defined(OS_POSIX)
-+#include <unistd.h>
-+#endif
-+
- #include "base/bind.h"
- #include "base/process_util.h"
- #include "base/string_util.h"
-diff --git a/ipc/ipc_channel.h b/ipc/ipc_channel.h
-index 14c375b..345f9eb 100644
---- a/ipc/ipc_channel.h
-+++ b/ipc/ipc_channel.h
-@@ -10,6 +10,7 @@
- 
- #if defined(OS_POSIX)
- #include <sys/types.h>
-+#include <unistd.h>
- #endif
- 
- #include "base/compiler_specific.h"
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
deleted file mode 100644
index c2e2a7d..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  'variables': {
-    'target_arch': 'x64',
-  }
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
deleted file mode 100644
index 0a6e8e8..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 0,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 1,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0,
-  }, 
-}
diff --git a/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch b/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
new file mode 100644
index 0000000..a44abff
--- /dev/null
+++ b/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
@@ -0,0 +1,17 @@
+--- a/content/browser/accessibility/browser_accessibility_manager_gtk.cc	2013-05-26 00:43:54.000000000 +0200
++++ b/content/browser/accessibility/browser_accessibility_manager_gtk.cc	2013-12-14 15:45:44.251138663 +0100
+@@ -55,11 +55,9 @@
+       RecursivelySendChildrenChanged(GetRoot()->ToBrowserAccessibilityGtk());
+       break;
+     case AccessibilityNotificationFocusChanged:
+-      // Note: atk_focus_tracker_notify may be deprecated in the future;
+-      // follow this bug for the replacement:
+-      // https://bugzilla.gnome.org/show_bug.cgi?id=649575#c4
+-      g_signal_emit_by_name(atk_object, "focus-event", true);
+-      atk_focus_tracker_notify(atk_object);
++      // Note: the focus-event was deprecated in ATK 2.9.4
++      // See https://bugzilla.gnome.org/show_bug.cgi?id=649575#c8  
++      g_signal_emit_by_name(atk_object, "focus-event", true); 
+       break;
+     default:
+       break;
diff --git a/recipes-browser/chromium/chromium/armv6/include.gypi b/recipes-browser/chromium/chromium/armv6/include.gypi
new file mode 100644
index 0000000..2c88271
--- /dev/null
+++ b/recipes-browser/chromium/chromium/armv6/include.gypi
@@ -0,0 +1,8 @@
+{
+  'variables': {
+    # Configure for armv6 compilation
+    'target_arch': 'arm',
+    'armv7': 0,
+    'arm_neon': 0,
+  }
+}
diff --git a/recipes-browser/chromium/chromium/armv6/oe-defaults.gypi b/recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
new file mode 100644
index 0000000..27e1cfe
--- /dev/null
+++ b/recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 1,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 0,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium/armv7a/include.gypi b/recipes-browser/chromium/chromium/armv7a/include.gypi
new file mode 100644
index 0000000..316cf48
--- /dev/null
+++ b/recipes-browser/chromium/chromium/armv7a/include.gypi
@@ -0,0 +1,9 @@
+{
+  'variables': {
+    # Configure for armv7 compilation
+    'target_arch': 'arm',
+    'armv7': 1,
+    'arm_thumb': 1,
+    'arm_neon': 1,
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi b/recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
new file mode 100644
index 0000000..27e1cfe
--- /dev/null
+++ b/recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 1,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 0,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/chromium/google-chrome
new file mode 100644
index 0000000..2f6ad2e
--- /dev/null
+++ b/recipes-browser/chromium/chromium/google-chrome
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
+if [ "${USER}" = "root" ] ; then 
+	/usr/bin/chrome/chrome --user-data-dir=${HOME}/.chromium/ $@
+else
+	/usr/bin/chrome/chrome $@
+fi
diff --git a/recipes-browser/chromium/chromium/google-chrome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
new file mode 100644
index 0000000..76a2533
--- /dev/null
+++ b/recipes-browser/chromium/chromium/google-chrome.desktop
@@ -0,0 +1,222 @@
+[Desktop Entry]
+Version=1.0
+Name=Chromium
+# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
+# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
+GenericName=Web Browser
+GenericName[ar]=????? ??????
+GenericName[bg]=??? ???????
+GenericName[ca]=Navegador web
+GenericName[cs]=WWW prohlíže?
+GenericName[da]=Browser
+GenericName[de]=Web-Browser
+GenericName[el]=?????????? ?????
+GenericName[en_GB]=Web Browser
+GenericName[es]=Navegador web
+GenericName[et]=Veebibrauser
+GenericName[fi]=WWW-selain
+GenericName[fr]=Navigateur Web
+GenericName[gu]=??? ???????
+GenericName[he]=????? ???????
+GenericName[hi]=??? ????????
+GenericName[hu]=Webböngész?
+GenericName[it]=Browser Web
+GenericName[ja]=???????
+GenericName[kn]=??? ??????
+GenericName[ko]=? ????
+GenericName[lt]=Žiniatinklio naršykl?
+GenericName[lv]=T?mek?a p?rl?ks
+GenericName[ml]=???? ????????
+GenericName[mr]=??? ???????
+GenericName[nb]=Nettleser
+GenericName[nl]=Webbrowser
+GenericName[pl]=Przegl?darka WWW
+GenericName[pt]=Navegador Web
+GenericName[pt_BR]=Navegador da Internet
+GenericName[ro]=Navigator de Internet
+GenericName[ru]=???-???????
+GenericName[sl]=Spletni brskalnik
+GenericName[sv]=Webbläsare
+GenericName[ta]=???? ?????
+GenericName[th]=???????????????
+GenericName[tr]=Web Taray?c?
+GenericName[uk]=????????? ?????
+GenericName[zh_CN]=?????
+GenericName[zh_HK]=?????
+GenericName[zh_TW]=?????
+# Not translated in KDE, from Epiphany 2.26.1-0ubuntu1.
+GenericName[bn]=???? ????????
+GenericName[fil]=Web Browser
+GenericName[hr]=Web preglednik
+GenericName[id]=Browser Web
+GenericName[or]=????? ???????
+GenericName[sk]=WWW prehliada?
+GenericName[sr]=???????? ??????????
+GenericName[te]=????? ???????
+GenericName[vi]=B? duy?t Web
+# Gnome and KDE 3 uses Comment.
+Comment=Access the Internet
+Comment[ar]=?????? ??? ????????
+Comment[bg]=?????? ?? ????????
+Comment[bn]=??????????? ????????? ????
+Comment[ca]=Accedeix a Internet
+Comment[cs]=P?ístup k internetu
+Comment[da]=Få adgang til internettet
+Comment[de]=Internetzugriff
+Comment[el]=???????? ??? ?????????
+Comment[en_GB]=Access the Internet
+Comment[es]=Accede a Internet.
+Comment[et]=Pääs Internetti
+Comment[fi]=Käytä internetiä
+Comment[fil]=I-access ang Internet
+Comment[fr]=Accéder à Internet
+Comment[gu]=??????? ?????? ???
+Comment[he]=???? ?? ????????
+Comment[hi]=??????? ?? ????? ??????? ????
+Comment[hr]=Pristup Internetu
+Comment[hu]=Internetelérés
+Comment[id]=Akses Internet
+Comment[it]=Accesso a Internet
+Comment[ja]=????????????
+Comment[kn]=????????? ????? ?????????
+Comment[ko]=??? ??
+Comment[lt]=Interneto prieiga
+Comment[lv]=Piek??t internetam
+Comment[ml]=?????????????? ??????? ???????
+Comment[mr]=???????????? ?????? ???
+Comment[nb]=Gå til Internett
+Comment[nl]=Verbinding maken met internet
+Comment[or]=?????????? ?????? ??????
+Comment[pl]=Skorzystaj z internetu
+Comment[pt]=Aceder à Internet
+Comment[pt_BR]=Acessar a internet
+Comment[ro]=Accesa?i Internetul
+Comment[ru]=?????? ? ????????
+Comment[sk]=Prístup do siete Internet
+Comment[sl]=Dostop do interneta
+Comment[sr]=?????????? ?????????
+Comment[sv]=Gå ut på Internet
+Comment[ta]=???????? ????????
+Comment[te]=???????????? ??????? ????????
+Comment[th]=???????????????????
+Comment[tr]=?nternet'e eri?in
+Comment[uk]=?????? ?? ?????????
+Comment[vi]=Truy c?p Internet
+Comment[zh_CN]=?????
+Comment[zh_HK]=???????
+Comment[zh_TW]=???????
+Exec=/usr/bin/google-chrome %U
+Terminal=false
+Icon=/usr/bin/chrome/product_logo_48.png
+Type=Application
+Categories=Network;WebBrowser;
+MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
+X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognito
+
+[NewWindow Shortcut Group]
+Name=New Window
+Name[am]=??? ????
+Name[ar]=????? ?????
+Name[bg]=??? ????????
+Name[bn]=???? ??????
+Name[ca]=Finestra nova
+Name[cs]=Nové okno
+Name[da]=Nyt vindue
+Name[de]=Neues Fenster
+Name[el]=??? ????????
+Name[en_GB]=New Window
+Name[es]=Nueva ventana
+Name[et]=Uus aken
+Name[fa]=????? ????
+Name[fi]=Uusi ikkuna
+Name[fil]=New Window
+Name[fr]=Nouvelle fenêtre
+Name[gu]=??? ?????
+Name[hi]=?? ?????
+Name[hr]=Novi prozor
+Name[hu]=Új ablak
+Name[id]=Jendela Baru
+Name[it]=Nuova finestra
+Name[iw]=???? ???
+Name[ja]=???????
+Name[kn]=??? ?????
+Name[ko]=? ?
+Name[lt]=Naujas langas
+Name[lv]=Jauns logs
+Name[ml]=????? ???????
+Name[mr]=???? ?????
+Name[nl]=Nieuw venster
+Name[no]=Nytt vindu
+Name[pl]=Nowe okno
+Name[pt]=Nova janela
+Name[pt_BR]=Nova janela
+Name[ro]=Fereastr? nou?
+Name[ru]=????? ????
+Name[sk]=Nové okno
+Name[sl]=Novo okno
+Name[sr]=???? ??????
+Name[sv]=Nytt fönster
+Name[sw]=Dirisha Jipya
+Name[ta]=????? ??????
+Name[te]=??????? ?????
+Name[th]=????????????
+Name[tr]=Yeni Pencere
+Name[uk]=???? ?????
+Name[vi]=C?a s? M?i
+Name[zh_CN]=????
+Name[zh_TW]=????
+Exec=/usr/bin/google-chrome
+TargetEnvironment=Unity
+
+[NewIncognito Shortcut Group]
+Name=New Incognito Window
+Name[ar]=????? ????? ?????? ???????
+Name[bg]=??? ???????? „?????????“
+Name[bn]=???? ???????? ??????
+Name[ca]=Finestra d'incògnit nova
+Name[cs]=Nové anonymní okno
+Name[da]=Nyt inkognitovindue
+Name[de]=Neues Inkognito-Fenster
+Name[el]=??? ???????? ??? ??????? ?????????
+Name[en_GB]=New Incognito window
+Name[es]=Nueva ventana de incógnito
+Name[et]=Uus inkognito aken
+Name[fa]=????? ???? ???? ??????
+Name[fi]=Uusi incognito-ikkuna
+Name[fil]=Bagong Incognito window
+Name[fr]=Nouvelle fenêtre de navigation privée
+Name[gu]=??? ???? ?????
+Name[hi]=?? ????? ?????
+Name[hr]=Novi anoniman prozor
+Name[hu]=Új Inkognitóablak
+Name[id]=Jendela Penyamaran baru
+Name[it]=Nuova finestra di navigazione in incognito
+Name[iw]=???? ??? ?????? ????
+Name[ja]=????????? ?????
+Name[kn]=??? ?????? ?????
+Name[ko]=? ??? ?
+Name[lt]=Naujas inkognito langas
+Name[lv]=Jauns inkognito rež?ma logs
+Name[ml]=????? ??? ????????? ???????
+Name[mr]=???? ????? ?????
+Name[nl]=Nieuw incognitovenster
+Name[no]=Nytt inkognitovindu
+Name[pl]=Nowe okno incognito
+Name[pt]=Nova janela de navegação anónima
+Name[pt_BR]=Nova janela anônima
+Name[ro]=Fereastr? nou? incognito
+Name[ru]=????? ???? ? ?????? ?????????
+Name[sk]=Nové okno inkognito
+Name[sl]=Novo okno brez beleženja zgodovine
+Name[sr]=???? ?????? ?? ?????????? ??? ??????????
+Name[sv]=Nytt inkognitofönster
+Name[ta]=????? ????????? ??????
+Name[te]=??????? ?????? ?????
+Name[th]=???????????????????????????
+Name[tr]=Yeni Gizli pencere
+Name[uk]=???? ????? ? ?????? ?????????? ?????????
+Name[vi]=C?a s? ?n danh m?i
+Name[zh_CN]=??????
+Name[zh_TW]=???????
+Exec=/usr/bin/google-chrome --incognito
+TargetEnvironment=Unity
diff --git a/recipes-browser/chromium/chromium/i586/include.gypi b/recipes-browser/chromium/chromium/i586/include.gypi
new file mode 100644
index 0000000..69f3a08
--- /dev/null
+++ b/recipes-browser/chromium/chromium/i586/include.gypi
@@ -0,0 +1,5 @@
+{
+  'variables': {
+    'target_arch': 'ia32',
+  }
+}
diff --git a/recipes-browser/chromium/chromium/i586/oe-defaults.gypi b/recipes-browser/chromium/chromium/i586/oe-defaults.gypi
new file mode 100644
index 0000000..0a6e8e8
--- /dev/null
+++ b/recipes-browser/chromium/chromium/i586/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 0,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 1,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0,
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium/secitem_array.patch b/recipes-browser/chromium/chromium/secitem_array.patch
new file mode 100644
index 0000000..3537952
--- /dev/null
+++ b/recipes-browser/chromium/chromium/secitem_array.patch
@@ -0,0 +1,26 @@
+--- trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c	2013/06/13 22:43:39	206183
++++ trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c	2013/06/13 22:44:52	206184
+@@ -6,6 +6,7 @@
+  * Support routines for SECItemArray data structure.
+  */
+ 
++#include "nssutil.h"
+ #include "seccomon.h"
+ #include "secitem.h"
+ #include "secerr.h"
+@@ -13,10 +14,15 @@
+ 
+ typedef struct SECItemArrayStr SECItemArray;
+ 
++#define NSSUTIL_VERSION_NUM \
++    (NSSUTIL_VMAJOR * 10000 + NSSUTIL_VMINOR * 100 + NSSUTIL_VPATCH)
++#if NSSUTIL_VERSION_NUM < 31500
++// Added in NSS 3.15.
+ struct SECItemArrayStr {
+     SECItem *items;
+     unsigned int len;
+ };
++#endif
+ 
+ SECItemArray *
+ SECITEM_AllocArray(PLArenaPool *arena, SECItemArray *array, unsigned int len)
diff --git a/recipes-browser/chromium/chromium/uninitialised-warning.patch b/recipes-browser/chromium/chromium/uninitialised-warning.patch
new file mode 100644
index 0000000..afdd784
--- /dev/null
+++ b/recipes-browser/chromium/chromium/uninitialised-warning.patch
@@ -0,0 +1,90 @@
+Make gcc 4.8 happy. It complains about uninitialized symbols
+
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual uint64 webkit_glue::WebClipboardImpl::sequenceNumber(WebKit::WebClipboard::Buffer)':
+| ../../webkit/glue/webclipboard_impl.cc:80:48: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    return client_->GetSequenceNumber(buffer_type);
+|                                                 ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebVector<WebKit::WebString> webkit_glue::WebClipboardImpl::readAvailableTypes(WebKit::WebClipboard::Buffer, bool*)':
+| ../../webkit/glue/webclipboard_impl.cc:118:73: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|      client_->ReadAvailableTypes(buffer_type, &types, contains_filenames);
+|                                                                          ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebData webkit_glue::WebClipboardImpl::readImage(WebKit::WebClipboard::Buffer)':
+| ../../webkit/glue/webclipboard_impl.cc:169:45: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    client_->ReadImage(buffer_type, &png_data);
+|                                              ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readCustomData(WebKit::WebClipboard::Buffer, const WebKit::WebString&)':
+| ../../webkit/glue/webclipboard_impl.cc:180:52: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    client_->ReadCustomData(buffer_type, type, &data);
+|                                                     ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readHTML(WebKit::WebClipboard::Buffer, WebKit::WebURL*, unsigned int*, unsigned int*)':
+| ../../webkit/glue/webclipboard_impl.cc:158:56: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|                      static_cast<uint32*>(fragment_end));
+|                                                         ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readPlainText(WebKit::WebClipboard::Buffer)':
+| ../../webkit/glue/webclipboard_impl.cc:136:3: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    if (client_->IsFormatAvailable(ui::Clipboard::GetPlainTextFormatType(),
+|    ^
+| cc1plus: all warnings being treated as errors
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Unknown
+Index: chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
+===================================================================
+--- chromium-29.0.1518.2.orig/content/renderer/webclipboard_impl.cc
++++ chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
+@@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
+ }
+ 
+ uint64 WebClipboardImpl::sequenceNumber(Buffer buffer) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return 0;
+ 
+@@ -112,7 +112,7 @@ bool WebClipboardImpl::isFormatAvailable
+ 
+ WebVector<WebString> WebClipboardImpl::readAvailableTypes(
+     Buffer buffer, bool* contains_filenames) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   std::vector<base::string16> types;
+   if (ConvertBufferType(buffer, &buffer_type)) {
+     client_->ReadAvailableTypes(buffer_type, &types, contains_filenames);
+@@ -121,7 +121,7 @@ WebVector<WebString> WebClipboardImpl::r
+ }
+ 
+ WebString WebClipboardImpl::readPlainText(Buffer buffer) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return WebString();
+ 
+@@ -147,7 +147,7 @@ WebString WebClipboardImpl::readPlainTex
+ WebString WebClipboardImpl::readHTML(Buffer buffer, WebURL* source_url,
+                                      unsigned* fragment_start,
+                                      unsigned* fragment_end) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return WebString();
+ 
+@@ -161,7 +161,7 @@ WebString WebClipboardImpl::readHTML(Buf
+ }
+ 
+ WebData WebClipboardImpl::readImage(Buffer buffer) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return WebData();
+ 
+@@ -172,7 +172,7 @@ WebData WebClipboardImpl::readImage(Buff
+ 
+ WebString WebClipboardImpl::readCustomData(Buffer buffer,
+                                            const WebString& type) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return WebString();
+ 
diff --git a/recipes-browser/chromium/chromium/unistd-2.patch b/recipes-browser/chromium/chromium/unistd-2.patch
new file mode 100644
index 0000000..6b5018b
--- /dev/null
+++ b/recipes-browser/chromium/chromium/unistd-2.patch
@@ -0,0 +1,27 @@
+diff --git a/chrome/browser/memory_details_linux.cc b/chrome/browser/memory_details_linux.cc
+index bee24ce..299f237 100644
+--- a/chrome/browser/memory_details_linux.cc
++++ b/chrome/browser/memory_details_linux.cc
+@@ -7,6 +7,10 @@
+ #include <map>
+ #include <set>
+ 
++#if defined(OS_POSIX)
++#include <unistd.h>
++#endif
++
+ #include "base/bind.h"
+ #include "base/process_util.h"
+ #include "base/string_util.h"
+diff --git a/ipc/ipc_channel.h b/ipc/ipc_channel.h
+index 14c375b..345f9eb 100644
+--- a/ipc/ipc_channel.h
++++ b/ipc/ipc_channel.h
+@@ -10,6 +10,7 @@
+ 
+ #if defined(OS_POSIX)
+ #include <sys/types.h>
++#include <unistd.h>
+ #endif
+ 
+ #include "base/compiler_specific.h"
diff --git a/recipes-browser/chromium/chromium/x86-64/include.gypi b/recipes-browser/chromium/chromium/x86-64/include.gypi
new file mode 100644
index 0000000..c2e2a7d
--- /dev/null
+++ b/recipes-browser/chromium/chromium/x86-64/include.gypi
@@ -0,0 +1,5 @@
+{
+  'variables': {
+    'target_arch': 'x64',
+  }
+}
diff --git a/recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi b/recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
new file mode 100644
index 0000000..0a6e8e8
--- /dev/null
+++ b/recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 0,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 1,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0,
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium_29.0.1518.2.bb b/recipes-browser/chromium/chromium_29.0.1518.2.bb
deleted file mode 100644
index 1c62f1e..0000000
--- a/recipes-browser/chromium/chromium_29.0.1518.2.bb
+++ /dev/null
@@ -1,74 +0,0 @@
-DESCRIPTION = "Chromium browser"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2d164565cc10f298390174d9cb6d18d"
-DEPENDS = "xz-native pciutils pulseaudio xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
-SRC_URI = "\
-        http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
-        file://include.gypi \
-        file://oe-defaults.gypi \
-        file://unistd-2.patch \
-        file://google-chrome \
-        file://google-chrome.desktop \
-        file://uninitialised-warning.patch \
-	file://001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch \
-	file://secitem_array.patch;striplevel=2 \
-"
-SRC_URI[md5sum] = "2480c3fd109ef000575629acb8a906ca"
-SRC_URI[sha256sum] = "7f08624f7d9bd120de0043da7ee09985ae6b6990d22d8c1b1f7c66fd4ed681a1"
-
-# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
-COMPATIBLE_MACHINE_x86-64 = "(.*)"
-COMPATIBLE_MACHINE_armv6 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-inherit gettext
-
-EXTRA_OEGYP =	" \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
-	-I ${WORKDIR}/oe-defaults.gypi \
-	-I ${WORKDIR}/include.gypi \
-	-f ninja \
-"
-ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
-
-export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
-do_configure() {
-	cd ${S}
-	# replace LD with CXX, to workaround a possible gyp issue?
-	LD="${CXX}" export LD
-	CC="${CC}" export CC
-	CXX="${CXX}" export CXX
-	CC_host="gcc" export CC_host
-	CXX_host="g++" export CXX_host
-	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
-}
-
-do_compile() {
-	# build with ninja
-	ninja -C ${S}/out/Release chrome 
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
-
-	install -d ${D}${datadir}/applications
-	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
-
-	install -d ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
-	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
-
-	install -d ${D}${bindir}/chrome/locales/
-	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
-}
-
-FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications"
-FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
new file mode 100644
index 0000000..2497f10
--- /dev/null
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -0,0 +1,79 @@
+DESCRIPTION = "Chromium browser"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
+DEPENDS = "xz-native pciutils pulseaudio xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
+SRC_URI = "\
+        http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
+        file://include.gypi \
+        file://oe-defaults.gypi \
+        file://unistd-2.patch \
+        file://google-chrome \
+        file://google-chrome.desktop \
+"
+SRC_URI[md5sum] = "c0659bc3c6b540e106e043fd27f54358"
+SRC_URI[sha256sum] = "666d5948c6508072f9f5d6acff82290fa5939e1da1b94b042a1e05daf3357b61"
+
+# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
+inherit gettext
+
+EXTRA_OEGYP =	" \
+	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
+	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
+	-I ${WORKDIR}/oe-defaults.gypi \
+	-I ${WORKDIR}/include.gypi \
+	-f ninja \
+"
+ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
+
+export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
+do_configure() {
+	cd ${S}
+	# replace LD with CXX, to workaround a possible gyp issue?
+	LD="${CXX}" export LD
+	CC="${CC}" export CC
+	CXX="${CXX}" export CXX
+	CC_host="gcc" export CC_host
+	CXX_host="g++" export CXX_host
+	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
+}
+
+do_compile() {
+	# build with ninja
+	ninja -C ${S}/out/Release chrome chrome_sandbox
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
+
+	install -d ${D}${datadir}/applications
+	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
+
+	install -d ${D}${bindir}/chrome/
+	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
+	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/icudtl.dat ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/content_resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/keyboard_resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
+	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
+
+	install -d ${D}${sbindir}
+	install -m 4755 ${S}/out/Release/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
+
+	install -d ${D}${bindir}/chrome/locales/
+	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
+}
+
+FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}/"
+FILES_${PN}-dbg += "${bindir}/chrome/.debug/"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
-- 
1.9.0


