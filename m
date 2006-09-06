Received: from [137.79.94.127] (helo=s383.jpl.nasa.gov)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <ehovland@s383.jpl.nasa.gov>) id 1GL1Cf-0007Bt-HU
	for openembedded-devel@openembedded.org; Wed, 06 Sep 2006 19:28:48 +0200
Received: from mage.jpl.nasa.gov (mage [137.78.15.62])
	by s383.jpl.nasa.gov (8.12.10/8.12.10) with ESMTP id k86HPrBm026010
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2006 10:25:53 -0700 (PDT)
Received: by mage.jpl.nasa.gov (Postfix, from userid 4960)
	id 2469E300016C; Wed,  6 Sep 2006 10:25:53 -0700 (PDT)
Date: Wed, 6 Sep 2006 10:25:53 -0700
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@openembedded.org
Message-ID: <20060906172553.GD14309@mage.jpl.nasa.gov>
Mime-Version: 1.0
User-Agent: Mutt/1.5.9i
Subject: new minimo update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2006 17:28:48 -0000
X-Groupsio-MsgNum: 187
Content-Type: multipart/mixed; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A very nice reporter came up with a new minimo package for familiar and
even opened a bug for it:
http://bugzilla.handhelds.org/show_bug.cgi?id=1716

I really want to see minimo for linux peer the same for pocketpc. So I
took a stab at integrating the tarball in that bug into OE. It took me a
while and I changed a few things about minimo. So I would prefer to get
some code review before pushing this into the OE monotone tree.

So here is my current patch against org.openembedded.dev. Please review
and critique. I would like to get ipks into familiar unstable so people
can try this package. So any help up front is very much appreciated.

Thanks

E

-- 
Erik Hovland
mail: erik AT hovland DOT org
web: http://hovland.org/
PGP/GPG public key available on request

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="minimo-update-to-0.016.patch"

# 
# old_revision [4e7386151d1273724db821c550dbd7106a83f5ab]
# 
# add_dir "packages/mozilla/minimo-20060720"
# 
# add_file "packages/mozilla/minimo/minimo"
#  content [a719c4320c5de6a4a3f904ae1bebacc7fd7dee8d]
# 
# add_file "packages/mozilla/minimo-20060720/minimo.patch"
#  content [12b7564c2721a04d1757120bd590d894bf8464cd]
# 
# add_file "packages/mozilla/minimo_20060720.bb"
#  content [81d1f09887abb7c37ef2afb924734f2cb227c936]
# 
# patch "packages/mozilla/files/minimo.desktop"
#  from [62c23c563fad279c25176c3408523df1395de262]
#    to [f4ae28d630c63aeae3de861655f5bc31fac6eed6]
# 
# patch "packages/mozilla/minimo/mozconfig"
#  from [4449c1f2641b766509e063350cfb786971ae0b6d]
#    to [cae8bd01272270ed8a51e43aa71515dd12f76564]
# 
# patch "packages/mozilla/minimo_cvs.bb"
#  from [7d2a9bbfa57864bf0ec24ef1e0af8c93aa6a7c51]
#    to [09d5549add94a93e089e7fe455dc155dd5b506b5]
# 
============================================================
--- packages/mozilla/minimo/minimo	a719c4320c5de6a4a3f904ae1bebacc7fd7dee8d
+++ packages/mozilla/minimo/minimo	a719c4320c5de6a4a3f904ae1bebacc7fd7dee8d
@@ -0,0 +1,4 @@
+#!/bin/sh
+export MOZILLA_FIVE_HOME=/usr/lib/mozilla-minimo
+export LD_LIBRARY_PATH=${MOZILLA_FIVE_HOME}
+exec ${MOZILLA_FIVE_HOME}/minimo "$@"
============================================================
--- packages/mozilla/minimo-20060720/minimo.patch	12b7564c2721a04d1757120bd590d894bf8464cd
+++ packages/mozilla/minimo-20060720/minimo.patch	12b7564c2721a04d1757120bd590d894bf8464cd
@@ -0,0 +1,567 @@
+Index: mozilla/content/html/content/src/nsFormSubmission.cpp
+===================================================================
+RCS file: /cvsroot/mozilla/content/html/content/src/nsFormSubmission.cpp,v
+retrieving revision 1.46
+diff --context=3 -r1.46 nsFormSubmission.cpp
+*** mozilla/content/html/content/src/nsFormSubmission.cpp	13 Jul 2005 16:55:59 -0000	1.46
+--- mozilla/content/html/content/src/nsFormSubmission.cpp	21 Jul 2006 00:27:14 -0000
+***************
+*** 1315,1325 ****
+    nsresult rv = NS_OK;
+  
+    nsCAutoString charset(aCharset);
+-   // canonical name is passed so that we just have to check against
+-   // *our* canonical names listed in charsetaliases.properties
+-   if (charset.EqualsLiteral("ISO-8859-1")) {
+-     charset.AssignLiteral("windows-1252");
+-   }
+  
+    // use UTF-8 for UTF-16* and UTF-32* (per WHATWG and existing practice of
+    // MS IE/Opera). 
+--- 1315,1320 ----
+Index: mozilla/embedding/base/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/embedding/base/Makefile.in,v
+retrieving revision 1.34.8.2
+diff --context=3 -r1.34.8.2 Makefile.in
+*** mozilla/embedding/base/Makefile.in	14 Feb 2006 05:28:31 -0000	1.34.8.2
+--- mozilla/embedding/base/Makefile.in	21 Jul 2006 00:27:14 -0000
+***************
+*** 43,48 ****
+--- 43,49 ----
+  
+  MODULE          = embed_base
+  LIBRARY_NAME    = embed_base_s
++ EXPORT_LIBRARY	= 1
+  XPIDL_MODULE	= embed_base
+  
+  include $(DEPTH)/config/autoconf.mk
+Index: mozilla/js/src/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/js/src/Makefile.in,v
+retrieving revision 3.95.4.4
+diff --context=3 -r3.95.4.4 Makefile.in
+*** mozilla/js/src/Makefile.in	7 Jul 2006 02:12:02 -0000	3.95.4.4
+--- mozilla/js/src/Makefile.in	21 Jul 2006 00:27:14 -0000
+***************
+*** 46,51 ****
+--- 46,52 ----
+  
+  MODULE		= js
+  LIBRARY_NAME	= mozjs
++ EXPORT_LIBRARY	= 1
+  LIB_IS_C_ONLY	= 1
+  GRE_MODULE	= 1
+  
+Index: mozilla/minimo/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/minimo/Makefile.in,v
+retrieving revision 1.1.2.2
+diff --context=3 -r1.1.2.2 Makefile.in
+*** mozilla/minimo/Makefile.in	29 Jun 2006 06:11:30 -0000	1.1.2.2
+--- mozilla/minimo/Makefile.in	21 Jul 2006 00:27:14 -0000
+***************
+*** 41,46 ****
+  
+  include $(DEPTH)/config/autoconf.mk
+  
+! DIRS = config components chrome locales customization base 
+  
+  include $(topsrcdir)/config/rules.mk
+--- 41,46 ----
+  
+  include $(DEPTH)/config/autoconf.mk
+  
+! DIRS = config chrome locales customization base 
+  
+  include $(topsrcdir)/config/rules.mk
+Index: mozilla/minimo/base/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/minimo/base/Makefile.in,v
+retrieving revision 1.3.2.7
+diff --context=3 -r1.3.2.7 Makefile.in
+*** mozilla/minimo/base/Makefile.in	18 Apr 2006 21:04:38 -0000	1.3.2.7
+--- mozilla/minimo/base/Makefile.in	21 Jul 2006 00:27:14 -0000
+***************
+*** 95,101 ****
+  
+  # this should move into the toolkit!
+  LOCAL_INCLUDES	= -I$(srcdir) -I$(topsrcdir)/xpfe/browser/src/
+- CPPSRCS    += nsBrowserStatusFilter.cpp nsBrowserInstance.cpp
+  
+  ifdef WINCE
+  RCINCLUDE  = wince/SplashScreen.rc
+--- 95,100 ----
+***************
+*** 139,148 ****
+  endif
+  
+  
+- FINAL_LINK_COMPS=$(topsrcdir)/minimo/base/$(FINAL_PLATFORM)/minimo-link-comps
+- FINAL_LINK_COMP_NAMES=$(topsrcdir)/minimo/base/$(FINAL_PLATFORM)/minimo-link-names
+- FINAL_LINK_LIBS=$(topsrcdir)/minimo/base/$(FINAL_PLATFORM)/minimo-link-libs
+- 
+  include $(topsrcdir)/config/static-config.mk
+  
+  EXTRA_DEPS     += $(STATIC_EXTRA_DEPS)
+--- 138,143 ----
+***************
+*** 176,189 ****
+  # (same as in mozilla/js/src/Makefile.in)
+  ifdef WINCE
+  LDFLAGS         += -OPT:NOICF
+  endif
+  
+- export::
+- 	$(NSINSTALL) $(topsrcdir)/xpfe/browser/src/nsBrowserStatusFilter.cpp .
+- 	$(NSINSTALL) $(topsrcdir)/xpfe/browser/src/nsBrowserInstance.cpp .
+- 
+- 
+- GARBAGE += nsBrowserStatusFilter.cpp nsBrowserInstance.cpp
+  
+  ifdef WINCE
+  package::
+--- 171,181 ----
+  # (same as in mozilla/js/src/Makefile.in)
+  ifdef WINCE
+  LDFLAGS         += -OPT:NOICF
++ else
++ # Hack to work around libxpcom_core.a / libunicharutil_s.a link order problem.
++ LDFLAGS		+= -u NS_StringGetData_P -u NS_StringGetMutableData_P
+  endif
+  
+  
+  ifdef WINCE
+  package::
+Index: mozilla/minimo/base/Minimo.cpp
+===================================================================
+RCS file: /cvsroot/mozilla/minimo/base/Minimo.cpp,v
+retrieving revision 1.1.2.11
+diff --context=3 -r1.1.2.11 Minimo.cpp
+*** mozilla/minimo/base/Minimo.cpp	11 Jul 2006 19:37:05 -0000	1.1.2.11
+--- mozilla/minimo/base/Minimo.cpp	21 Jul 2006 00:27:15 -0000
+***************
+*** 781,789 ****
+    CreateListenerWindow();
+  #endif
+    
+! #ifdef MOZ_WIDGET_GTK2
+    gtk_set_locale();
+    gtk_init(&argc, &argv);
+  #endif
+    
+  #ifdef HACKY_PRE_LOAD_LIBRARY
+--- 781,794 ----
+    CreateListenerWindow();
+  #endif
+    
+! #if defined(MOZ_WIDGET_GTK) || defined(MOZ_WIDGET_GTK2)
+! #if defined(MOZ_WIDGET_GTK)
+    gtk_set_locale();
++ #endif
+    gtk_init(&argc, &argv);
++ 
++   gtk_widget_set_default_visual(gdk_rgb_get_visual());
++   gtk_widget_set_default_colormap(gdk_rgb_get_cmap());
+  #endif
+    
+  #ifdef HACKY_PRE_LOAD_LIBRARY
+Index: mozilla/minimo/base/SplashScreen.cpp
+===================================================================
+RCS file: /cvsroot/mozilla/minimo/base/SplashScreen.cpp,v
+retrieving revision 1.1.2.3
+diff --context=3 -r1.1.2.3 SplashScreen.cpp
+*** mozilla/minimo/base/SplashScreen.cpp	11 Jul 2006 18:44:17 -0000	1.1.2.3
+--- mozilla/minimo/base/SplashScreen.cpp	21 Jul 2006 00:27:15 -0000
+***************
+*** 180,188 ****
+--- 180,203 ----
+  void KillSplashScreen() {}
+  void GetScreenSize(unsigned long* x, unsigned long* y)
+  {
++ #ifdef MOZ_WIDGET_GTK2
++   GdkDisplay* display = gdk_display_get_default();
++   if (display != NULL)
++   {
++     GdkScreen *screen;
++     screen = gdk_display_get_default_screen(display);
++     *x = gdk_screen_get_width(screen);
++     *y = gdk_screen_get_height(screen);
++   }
++   else
++   {
++ #endif
+    // we need to figure this out.
+    *x = 240;
+    *y = 320;
++ #ifdef MOZ_WIDGET_GTK2
++   }
++ #endif
+  }
+  
+  
+Index: mozilla/minimo/chrome/content/minimo.js
+===================================================================
+RCS file: /cvsroot/mozilla/minimo/chrome/content/minimo.js,v
+retrieving revision 1.9.2.90
+diff --context=3 -r1.9.2.90 minimo.js
+*** mozilla/minimo/chrome/content/minimo.js	11 Jul 2006 19:37:04 -0000	1.9.2.90
+--- mozilla/minimo/chrome/content/minimo.js	21 Jul 2006 00:27:16 -0000
+***************
+*** 1313,1319 ****
+           43 const FIND_LINKS = 2;
+           http://lxr.mozilla.org/mozilla/source/toolkit/components/typeaheadfind/content/findBar.js
+        */
+!       gBrowser.fastFind.find(vQuery,0);
+      }
+    } catch (e) {
+      onErrorHandler(e);
+--- 1313,1319 ----
+           43 const FIND_LINKS = 2;
+           http://lxr.mozilla.org/mozilla/source/toolkit/components/typeaheadfind/content/findBar.js
+        */
+!       gBrowser.fastFind.find(vQuery,0,this.mHasFocus);
+      }
+    } catch (e) {
+      onErrorHandler(e);
+***************
+*** 1324,1330 ****
+  
+  function DoBrowserFindNext() {
+    try { 
+! 	gBrowser.fastFind.findNext();
+    } catch (e) {
+      onErrorHandler(e);
+    }  
+--- 1324,1330 ----
+  
+  function DoBrowserFindNext() {
+    try { 
+! 	gBrowser.fastFind.findNext(this.mHasFocus);
+    } catch (e) {
+      onErrorHandler(e);
+    }  
+Index: mozilla/minimo/config/linux_package.sh
+===================================================================
+RCS file: /cvsroot/mozilla/minimo/config/linux_package.sh,v
+retrieving revision 1.8.2.3
+diff --context=3 -r1.8.2.3 linux_package.sh
+*** mozilla/minimo/config/linux_package.sh	30 Jun 2006 16:35:19 -0000	1.8.2.3
+--- mozilla/minimo/config/linux_package.sh	21 Jul 2006 00:27:16 -0000
+***************
+*** 29,37 ****
+  cp -pRL bin/libnssckbi.so                                  minimo
+  cp -pRL bin/libsmime3.so                                   minimo
+  cp -pRL bin/libsoftokn3.so                                 minimo
+- cp -pRL bin/libsoftokn3.chk                                minimo
+  cp -pRL bin/libfreebl3.so                                  minimo
+- cp -pRL bin/libfreebl3.chk                                 minimo
+  cp -pRL bin/libssl3.so                                     minimo
+  
+  mkdir -p minimo/chrome
+--- 29,35 ----
+***************
+*** 62,69 ****
+  cp -pRL bin/components/nsHelperAppDlg.js                   minimo/components
+  cp -pRL bin/components/nsProgressDialog.js                 minimo/components
+  
+- cp -pRL bin/extensions/spatial-navigation@extensions.mozilla.org/components/* minimo/components
+- 
+  mkdir -p minimo/greprefs
+  cp -pRL bin/greprefs/*                                     minimo/greprefs
+  
+--- 60,65 ----
+***************
+*** 80,86 ****
+  
+  echo Linking XPT files.
+  
+! bin/xpt_link minimo/components/all.xpt          bin/components/*.xpt
+  
+  echo Chewing on chrome
+  
+--- 76,82 ----
+  
+  echo Linking XPT files.
+  
+! host/bin/host_xpt_link minimo/components/all.xpt          bin/components/*.xpt
+  
+  echo Chewing on chrome
+  
+Index: mozilla/profile/dirserviceprovider/src/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/profile/dirserviceprovider/src/Makefile.in,v
+retrieving revision 1.7
+diff --context=3 -r1.7 Makefile.in
+*** mozilla/profile/dirserviceprovider/src/Makefile.in	6 Apr 2005 03:35:21 -0000	1.7
+--- mozilla/profile/dirserviceprovider/src/Makefile.in	21 Jul 2006 00:27:16 -0000
+***************
+*** 44,49 ****
+--- 44,50 ----
+  
+  MODULE		= profdirserviceprovider
+  LIBRARY_NAME	= profdirserviceprovider_s
++ EXPORT_LIBRARY	= 1
+  MOZILLA_INTERNAL_API = 1
+  
+  REQUIRES	= xpcom \
+Index: mozilla/security/coreconf/Linux.mk
+===================================================================
+RCS file: /cvsroot/mozilla/security/coreconf/Linux.mk,v
+retrieving revision 1.18.18.1
+diff --context=3 -r1.18.18.1 Linux.mk
+*** mozilla/security/coreconf/Linux.mk	3 Feb 2006 22:26:36 -0000	1.18.18.1
+--- mozilla/security/coreconf/Linux.mk	21 Jul 2006 00:27:16 -0000
+***************
+*** 117,122 ****
+--- 117,126 ----
+  	OS_REL_CFLAGS   = -DLINUX1_2 -D_XOPEN_SOURCE
+  	CPU_ARCH        = mips
+  else
++ ifeq ($(OS_TEST),arm)
++ 	OS_REL_CFLAGS   = -DLINUX1_2 -D_XOPEN_SOURCE
++ 	CPU_ARCH        = arm
++ else
+  	OS_REL_CFLAGS	= -DLINUX1_2 -Di386 -D_XOPEN_SOURCE
+  	CPU_ARCH	= x86
+  endif
+***************
+*** 133,138 ****
+--- 137,143 ----
+  endif
+  endif
+  endif
++ endif
+  
+  
+  LIBC_TAG		= _glibc
+Index: mozilla/security/coreconf/arch.mk
+===================================================================
+RCS file: /cvsroot/mozilla/security/coreconf/arch.mk,v
+retrieving revision 1.17.14.2
+diff --context=3 -r1.17.14.2 arch.mk
+*** mozilla/security/coreconf/arch.mk	3 Feb 2006 22:26:36 -0000	1.17.14.2
+--- mozilla/security/coreconf/arch.mk	21 Jul 2006 00:27:16 -0000
+***************
+*** 60,77 ****
+  	64BIT_TAG=
+  endif
+  
+! OS_ARCH := $(subst /,_,$(shell uname -s))
+  
+  #
+  # Attempt to differentiate between sparc and x86 Solaris
+  #
+  
+! OS_TEST := $(shell uname -m)
+! ifeq ($(OS_TEST),i86pc)
+!     OS_RELEASE := $(shell uname -r)_$(OS_TEST)
+! else
+!     OS_RELEASE := $(shell uname -r)
+! endif
+  
+  #
+  # Force the IRIX64 machines to use IRIX.
+--- 60,73 ----
+  	64BIT_TAG=
+  endif
+  
+! OS_ARCH := Linux
+  
+  #
+  # Attempt to differentiate between sparc and x86 Solaris
+  #
+  
+! OS_TEST := arm
+! OS_RELEASE := 2.6
+  
+  #
+  # Force the IRIX64 machines to use IRIX.
+Index: mozilla/toolkit/components/build/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/toolkit/components/build/Makefile.in,v
+retrieving revision 1.24.2.10
+diff --context=3 -r1.24.2.10 Makefile.in
+*** mozilla/toolkit/components/build/Makefile.in	13 Jul 2006 20:08:29 -0000	1.24.2.10
+--- mozilla/toolkit/components/build/Makefile.in	21 Jul 2006 00:27:17 -0000
+***************
+*** 112,118 ****
+  	$(NULL)
+  
+  SHARED_LIBRARY_LIBS = \
+- 	../startup/src/$(LIB_PREFIX)appstartup_s.$(LIB_SUFFIX) \
+  	$(NULL)
+  
+  ifdef MOZ_XPINSTALL
+--- 112,117 ----
+Index: mozilla/toolkit/components/startup/src/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/toolkit/components/startup/src/Makefile.in,v
+retrieving revision 1.7
+diff --context=3 -r1.7 Makefile.in
+*** mozilla/toolkit/components/startup/src/Makefile.in	27 Jul 2005 20:42:44 -0000	1.7
+--- mozilla/toolkit/components/startup/src/Makefile.in	21 Jul 2006 00:27:17 -0000
+***************
+*** 43,48 ****
+--- 43,49 ----
+  
+  MODULE     = toolkitcomps
+  LIBRARY_NAME = appstartup_s
++ EXPORT_LIBRARY = 1
+  FORCE_STATIC_LIB = 1
+  LIBXUL_LIBRARY = 1
+  
+Index: mozilla/toolkit/xre/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/toolkit/xre/Makefile.in,v
+retrieving revision 1.48.2.3
+diff --context=3 -r1.48.2.3 Makefile.in
+*** mozilla/toolkit/xre/Makefile.in	30 Sep 2005 19:52:44 -0000	1.48.2.3
+--- mozilla/toolkit/xre/Makefile.in	21 Jul 2006 00:27:17 -0000
+***************
+*** 45,51 ****
+  
+  MODULE = xulapp
+  LIBRARY_NAME = xulapp_s
+- EXPORT_LIBRARY = 1
+  LIBXUL_LIBRARY = 1
+  
+  REQUIRES = \
+--- 45,50 ----
+***************
+*** 176,189 ****
+  
+  include $(topsrcdir)/config/rules.mk
+  
+- ifdef BUILD_STATIC_LIBS
+- export::
+- 	@$(PERL) -I$(MOZILLA_DIR)/config $(MOZILLA_DIR)/config/build-list.pl $(FINAL_LINK_COMP_NAMES) Apprunner
+- #	embedding/browser/gtk/src/Makefile.in sucks! we need to add an empty line to 
+- # FINAL_LINK_COMPS to keep the two lists in sync :-(
+- 	@$(PERL) -I$(MOZILLA_DIR)/config $(MOZILLA_DIR)/config/build-list.pl $(FINAL_LINK_COMPS) ""
+- endif
+- 
+  LOCAL_INCLUDES += \
+  	-I$(srcdir) \
+  	-I$(topsrcdir)/xpfe/bootstrap \
+--- 175,180 ----
+Index: mozilla/xpcom/build/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/xpcom/build/Makefile.in,v
+retrieving revision 1.90.2.2
+diff --context=3 -r1.90.2.2 Makefile.in
+*** mozilla/xpcom/build/Makefile.in	29 Jan 2006 16:51:02 -0000	1.90.2.2
+--- mozilla/xpcom/build/Makefile.in	21 Jul 2006 00:27:17 -0000
+***************
+*** 61,67 ****
+  endif
+  
+  # Do not set EXPORT_LIBRARY as we do not want xpcom in the static libs list
+! #EXPORT_LIBRARY = 1
+  GRE_MODULE	= 1
+  MOZILLA_INTERNAL_API = 1
+  
+--- 61,67 ----
+  endif
+  
+  # Do not set EXPORT_LIBRARY as we do not want xpcom in the static libs list
+! EXPORT_LIBRARY = 1
+  GRE_MODULE	= 1
+  MOZILLA_INTERNAL_API = 1
+  
+Index: mozilla/xpcom/reflect/xptcall/src/md/unix/xptcstubs_arm.cpp
+===================================================================
+RCS file: /cvsroot/mozilla/xpcom/reflect/xptcall/src/md/unix/xptcstubs_arm.cpp,v
+retrieving revision 1.7
+diff --context=3 -r1.7 xptcstubs_arm.cpp
+*** mozilla/xpcom/reflect/xptcall/src/md/unix/xptcstubs_arm.cpp	18 Apr 2004 14:18:18 -0000	1.7
+--- mozilla/xpcom/reflect/xptcall/src/md/unix/xptcstubs_arm.cpp	21 Jul 2006 00:27:17 -0000
+***************
+*** 45,53 ****
+  #endif
+  
+  /* Specify explicitly a symbol for this function, don't try to guess the c++ mangled symbol.  */
+! static nsresult PrepareAndDispatch(nsXPTCStubBase* self, uint32 methodIndex, PRUint32* args) asm("_PrepareAndDispatch");
+  
+! static nsresult
+  PrepareAndDispatch(nsXPTCStubBase* self, uint32 methodIndex, PRUint32* args)
+  {
+  #define PARAM_BUFFER_COUNT     16
+--- 45,53 ----
+  #endif
+  
+  /* Specify explicitly a symbol for this function, don't try to guess the c++ mangled symbol.  */
+! nsresult PrepareAndDispatch(nsXPTCStubBase* self, uint32 methodIndex, PRUint32* args) asm("_PrepareAndDispatch");
+  
+! nsresult
+  PrepareAndDispatch(nsXPTCStubBase* self, uint32 methodIndex, PRUint32* args)
+  {
+  #define PARAM_BUFFER_COUNT     16
+Index: mozilla/xpfe/browser/src/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/xpfe/browser/src/Makefile.in,v
+retrieving revision 1.70
+diff --context=3 -r1.70 Makefile.in
+*** mozilla/xpfe/browser/src/Makefile.in	18 Mar 2005 21:23:45 -0000	1.70
+--- mozilla/xpfe/browser/src/Makefile.in	21 Jul 2006 00:27:17 -0000
+***************
+*** 44,49 ****
+--- 44,50 ----
+  
+  MODULE		= browser
+  LIBRARY_NAME	= mozbrwsr_s
++ EXPORT_LIBRARY	= 1
+  FORCE_STATIC_LIB = 1
+  LIBXUL_LIBRARY = 1
+  MODULE_NAME	= nsBrowserModule
+Index: mozilla/xpfe/components/build/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/xpfe/components/build/Makefile.in,v
+retrieving revision 1.69.8.1
+diff --context=3 -r1.69.8.1 Makefile.in
+*** mozilla/xpfe/components/build/Makefile.in	27 Sep 2005 00:15:25 -0000	1.69.8.1
+--- mozilla/xpfe/components/build/Makefile.in	21 Jul 2006 00:27:17 -0000
+***************
+*** 44,50 ****
+  
+  MODULE		= appcomps
+  LIBRARY_NAME	= appcomps
+- EXPORT_LIBRARY = 1
+  IS_COMPONENT	= 1
+  MODULE_NAME	= application
+  LIBXUL_LIBRARY	= 1
+--- 44,49 ----
+Index: mozilla/xpfe/components/filepicker/src/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/xpfe/components/filepicker/src/Makefile.in,v
+retrieving revision 1.9.8.1
+diff --context=3 -r1.9.8.1 Makefile.in
+*** mozilla/xpfe/components/filepicker/src/Makefile.in	22 May 2006 16:29:32 -0000	1.9.8.1
+--- mozilla/xpfe/components/filepicker/src/Makefile.in	21 Jul 2006 00:27:17 -0000
+***************
+*** 47,53 ****
+  MODULE		= filepicker
+  LIBRARY_NAME	= fileview
+  SHORT_LIBNAME	= fileview
+- EXPORT_LIBRARY	= 1
+  IS_COMPONENT	= 1
+  MODULE_NAME	= nsFileViewModule
+  MOZILLA_INTERNAL_API = 1
+--- 47,52 ----
+Index: mozilla/xpfe/components/find/src/Makefile.in
+===================================================================
+RCS file: /cvsroot/mozilla/xpfe/components/find/src/Makefile.in,v
+retrieving revision 1.37
+diff --context=3 -r1.37 Makefile.in
+*** mozilla/xpfe/components/find/src/Makefile.in	18 Mar 2005 21:23:46 -0000	1.37
+--- mozilla/xpfe/components/find/src/Makefile.in	21 Jul 2006 00:27:17 -0000
+***************
+*** 45,51 ****
+  MODULE		= appcomps
+  XPIDL_MODULE	= mozfind
+  LIBRARY_NAME	= mozfind
+- EXPORT_LIBRARY = 1
+  IS_COMPONENT	= 1
+  MODULE_NAME	= nsFindComponent
+  LIBXUL_LIBRARY	= 1
+--- 45,50 ----
============================================================
--- packages/mozilla/minimo_20060720.bb	81d1f09887abb7c37ef2afb924734f2cb227c936
+++ packages/mozilla/minimo_20060720.bb	81d1f09887abb7c37ef2afb924734f2cb227c936
@@ -0,0 +1,144 @@
+DESCRIPTION = "A minimal version of the Mozilla web browser for mobile devices"
+SECTION = "x11/network"
+LICENSE = "MPL/GPL/LGPL"
+HOMEPAGE = "http://www.mozilla.org/projects/minimo/"
+MAINTAINER = "Phil Blundell <pb@handhelds.org>"
+PRIORITY = "optional"
+
+DEPENDS = "libxrender xt xft fontconfig freetype libidl dbus-glib pango atk gtk+"
+
+CVSSVR="cvs-mirror.mozilla.org"
+BRTAG = "MOZILLA_1_8_BRANCH"
+PR = r0
+
+SRC_URI = "cvs://anonymous@${CVSSVR}/cvsroot;module=mozilla;tag=${BRTAG};date=${PV} \
+	   file://minimo.patch;patch=1 \
+           file://mozconfig file://minimo \
+           file://minimo.desktop file://minimo.png"
+
+S = "${WORKDIR}/mozilla"
+
+# mozilla/configure: Directory and file names:
+#EXTRA_OECONF += "--prefix=${prefix} "
+# mozilla/configure: Host type:
+EXTRA_OECONF += "--build=${BUILD_SYS} --host=${BUILD_SYS} --target=${TARGET_SYS} "
+PACKAGES = "${PN}"
+
+export MOZCONFIG = "${WORKDIR}/mozconfig"
+
+export CROSS_COMPILE="1"
+export ac_cv_prog_HOST_CC="${BUILD_CC}"
+export ac_cv_prog_HOST_CFLAGS="${BUILD_CFLAGS}"
+export ac_cv_prog_HOST_CXX="${BUILD_CXX}"
+export ac_cv_prog_HOST_CXXFLAGS="${BUILD_CXXFLAGS}"
+
+mozdir="${D}${libdir}/mozilla-minimo"
+
+FILES_${PN} += "${mozdir}"
+
+do_configure() {
+	cd ${S}
+	oe_runmake -f client.mk CONFIGURE_ARGS="${EXTRA_OECONF}" configure
+}
+
+do_compile() {
+	cd ${S}
+	oe_runmake -f client.mk build
+}
+
+do_install() {
+	cd ${WORKDIR}
+
+	install -d ${D}${bindir}
+	install -m 0755 minimo ${D}${bindir}
+
+	install -d ${D}${datadir}/applications
+	install -m 0644 minimo.desktop ${D}${datadir}/applications
+
+	install -d ${D}/${datadir}/pixmaps
+	install -m 0644 minimo.png ${D}${datadir}/pixmaps
+
+	cd ${S}
+
+	./minimo/config/linux_package.sh ${S} ${S}/minimo/config
+
+	cd dist/minimo
+
+	install -d ${D}${mozdir}
+	install -m 0755 minimo ${D}${mozdir}
+	install -m 0755 libfreebl3.so ${D}${mozdir}
+	install -m 0755 libnspr4.so ${D}${mozdir}
+	install -m 0755 libnss3.so ${D}${mozdir}
+	install -m 0755 libnssckbi.so ${D}${mozdir}
+	install -m 0755 libplc4.so ${D}${mozdir}
+	install -m 0755 libplds4.so ${D}${mozdir}
+	install -m 0755 libsmime3.so ${D}${mozdir}
+	install -m 0755 libsoftokn3.so ${D}${mozdir}
+	install -m 0755 libssl3.so ${D}${mozdir}
+
+	install -d ${D}${mozdir}/chrome
+	install -m 0644 chrome/classic.jar ${D}${mozdir}/chrome
+	install -m 0644 chrome/classic.manifest ${D}${mozdir}/chrome
+	install -m 0644 chrome/en-US.jar ${D}${mozdir}/chrome
+	install -m 0644 chrome/en-US.manifest ${D}${mozdir}/chrome
+	install -m 0644 chrome/minimo-skin-vga.jar ${D}${mozdir}/chrome
+	install -m 0644 chrome/minimo-skin-vga.manifest ${D}${mozdir}/chrome
+	install -m 0644 chrome/minimo-skin.jar ${D}${mozdir}/chrome
+	install -m 0644 chrome/minimo-skin.manifest ${D}${mozdir}/chrome
+	install -m 0644 chrome/minimo.jar ${D}${mozdir}/chrome
+	install -m 0644 chrome/minimo.manifest ${D}${mozdir}/chrome
+	install -m 0644 chrome/pippki.jar ${D}${mozdir}/chrome
+	install -m 0644 chrome/pippki.manifest ${D}${mozdir}/chrome
+	install -m 0644 chrome/toolkit.jar ${D}${mozdir}/chrome
+	install -m 0644 chrome/toolkit.manifest ${D}${mozdir}/chrome
+
+	install -d ${D}${mozdir}/components
+	install -m 0644 components/all.xpt ${D}${mozdir}/components
+	install -m 0644 components/nsHelperAppDlg.js ${D}${mozdir}/components
+	install -m 0644 components/nsProgressDialog.js ${D}${mozdir}/components
+
+	install -d ${D}${mozdir}/greprefs
+	install -m 0644 greprefs/all.js ${D}${mozdir}/greprefs
+	install -m 0644 greprefs/security-prefs.js ${D}${mozdir}/greprefs
+
+	install -d ${D}${mozdir}/res
+	install -m 0644 res/forms.css ${D}${mozdir}/res
+	install -m 0644 res/html.css ${D}${mozdir}/res
+	install -m 0644 res/quirk.css ${D}${mozdir}/res
+	install -m 0644 res/ua.css ${D}${mozdir}/res
+	install -m 0644 res/arrow.gif ${D}${mozdir}/res
+	install -m 0644 res/arrowd.gif ${D}${mozdir}/res
+	install -m 0644 res/broken-image.gif ${D}${mozdir}/res
+	install -m 0644 res/loading-image.gif ${D}${mozdir}/res
+	install -m 0644 res/charsetData.properties ${D}${mozdir}/res
+	install -m 0644 res/charsetalias.properties ${D}${mozdir}/res
+	install -m 0644 res/langGroups.properties ${D}${mozdir}/res
+	install -m 0644 res/language.properties ${D}${mozdir}/res
+	install -m 0644 res/unixcharset.properties ${D}${mozdir}/res
+
+	install -d ${D}${mozdir}/res/dtd
+	install -m 0644 res/dtd/xhtml11.dtd ${D}${mozdir}/res/dtd
+
+	install -d ${D}${mozdir}/res/entityTables
+	install -m 0644 res/entityTables/html40Latin1.properties ${D}${mozdir}/res/entityTables
+	install -m 0644 res/entityTables/html40Special.properties ${D}${mozdir}/res/entityTables
+	install -m 0644 res/entityTables/html40Symbols.properties ${D}${mozdir}/res/entityTables
+	install -m 0644 res/entityTables/htmlEntityVersions.properties ${D}${mozdir}/res/entityTables
+	install -m 0644 res/entityTables/transliterate.properties ${D}${mozdir}/res/entityTables
+
+	install -d ${D}${mozdir}/res/fonts
+	install -m 0644 res/fonts/fontEncoding.properties ${D}${mozdir}/res/fonts
+	install -m 0644 res/fonts/pangoFontEncoding.properties ${D}${mozdir}/res/fonts
+
+	install -d ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-audio.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-binary.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-find.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-image.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-menu.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-movie.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-sound.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-telnet.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-text.gif ${D}${mozdir}/res/html
+	install -m 0644 res/html/gopher-unknown.gif ${D}${mozdir}/res/html
+}
============================================================
--- packages/mozilla/files/minimo.desktop	62c23c563fad279c25176c3408523df1395de262
+++ packages/mozilla/files/minimo.desktop	f4ae28d630c63aeae3de861655f5bc31fac6eed6
@@ -1,9 +1,10 @@
 [Desktop Entry]
+Type=Application
 Name=Minimo
-Comment=Minimo web browser
-Exec=minimo http://www.mozilla.org/projects/minimo/home.html
-Terminal=0
-Type=Application
+GenericName=Web Browser
+Comment=Browse the web
 Icon=minimo.png
+Exec=minimo
+Terminal=false
+Categories=Network;WebBrowser;
+StartupNotify=true
-Categories=Application;Network;
-StartupNotify=True
============================================================
--- packages/mozilla/minimo/mozconfig	4449c1f2641b766509e063350cfb786971ae0b6d
+++ packages/mozilla/minimo/mozconfig	cae8bd01272270ed8a51e43aa71515dd12f76564
@@ -1,23 +1,36 @@
-mk_add_options MOZ_CO_PROJECT=minimo
-ac_add_options --enable-application=minimo
+# mozilla/configure: Features and packages:
 
-
-# use GTK+-2 widget set with XFT font rendering
+ac_add_options --enable-application=minimo
 ac_add_options --enable-default-toolkit=gtk2
+ac_add_options --disable-freetype2
 ac_add_options --enable-xft
-ac_add_options --disable-freetype2
-ac_add_options --disable-plugins 
-
+ac_add_options --disable-postscript
+ac_add_options --disable-xprint
+ac_add_options --disable-gnomevfs
+ac_add_options --disable-gnomeui
+ac_add_options --disable-jsd
+ac_add_options --disable-plugins
+ac_add_options --disable-view-source
+ac_add_options --disable-accessibility
+ac_add_options --disable-xpinstall
+ac_add_options --enable-single-profile
+ac_add_options --disable-jsloader
+ac_add_options --disable-printing
+ac_add_options --enable-native-uconv
+ac_add_options --enable-plaintext-editor-only
+ac_add_options --disable-xpcom-obsolete
+ac_add_options --disable-pref-extensions
+ac_add_options --disable-extensions
+ac_add_options --enable-image-decoders=png,gif,jpeg
+ac_add_options --disable-mathml
+ac_add_options --disable-installer
+ac_add_options --disable-updater
+ac_add_options --disable-tests
 ac_add_options --enable-optimize=-Os
+ac_add_options --disable-logging
 ac_add_options --enable-strip
-ac_add_options --disable-debug
-ac_add_options --enable-reorder
 ac_add_options --enable-elf-dynstr-gc
-
-# enable static build
 ac_add_options --disable-shared
 ac_add_options --enable-static
+ac_add_options --disable-profilesharing
+ac_add_options --disable-profilelocking
-
-# remove link dependency on libstdc++.so
-LIBS=-lsupc++
-
============================================================
--- packages/mozilla/minimo_cvs.bb	7d2a9bbfa57864bf0ec24ef1e0af8c93aa6a7c51
+++ packages/mozilla/minimo_cvs.bb	09d5549add94a93e089e7fe455dc155dd5b506b5
@@ -1,4 +1,4 @@
-DESCRIPTION = "A minimal version of the Mozilla web browser"
+DESCRIPTION = "A minimal version of the Mozilla web browser for mobile devices"
 HOMEPAGE="http://www.mozilla.org/projects/minimo/"
 SRC_URI = "cvs://anonymous@cvs-mirror.mozilla.org/cvsroot;module=mozilla \
 	   file://no-xmb.patch;patch=1 \
@@ -6,7 +6,7 @@ MAINTAINER = "Phil Blundell <pb@handheld
 	   file://minimo.png file://minimo.desktop"
 S = "${WORKDIR}/mozilla"
 MAINTAINER = "Phil Blundell <pb@handhelds.org>"
-SECTION = "x11"
+SECTION = "x11/network"
 PRIORITY = "optional"
 PV = "0.0+cvs${SRCDATE}"
 FILES_${PN} += "${libdir}/mozilla-minimo"

--gBBFr7Ir9EOA20Yy--
