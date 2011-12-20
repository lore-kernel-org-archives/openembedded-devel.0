Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rd0Mq-00044O-AU
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 15:08:32 +0100
Received: by eeit10 with SMTP id t10so2604639eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=rFm+eqBAd0Cqk91ixH4O0vA2uh5T9RpzMjc/oGyawdw=;
	b=w2uHqjGiCMclSAN0Byug4u3WTvs1IxTpgau8HuWDYuttF63Fp9JZ7ujlJO7zgX7lwN
	pygymXlIULjG3756jWE/AIcS01+KJ5AMAbMoLkdjLDqteTfmHkcNqLeJ0YNYLl+Ih0QL
	o4wIonILN20fumzgC2Gs4KrdDYO65NbC5Y2xY=
Received: by 10.213.9.197 with SMTP id m5mr3741968ebm.85.1324389685676;
	Tue, 20 Dec 2011 06:01:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm5983950eeb.11.2011.12.20.06.01.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 06:01:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 15:01:10 +0100
Message-Id: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <cover.1324389403.git.Martin.Jansa@gmail.com>
References: <cover.1324389403.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 1/7] e-base: bump EFL_SRCREV remove EFL_SRCREV_1.* and applied patches from libeflvala, elsa and python-elementary
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
X-List-Received-Date: Tue, 20 Dec 2011 14:08:32 -0000

* elementary (Evas_GL) and e-wm (backlight) depends on trunk again..

10:06:36 < JaMa> shouldn't elementary and e17 depend only on efl-1.1? | ./Elementary.h:372:21: fatal error: Evas_GL.h: No such file or directory and e/src/bin/e_backlight.c:43: undefined reference to
                 `ecore_x_randr_output_backlight_available'
10:07:32 < JaMa> but I'll recheck my configs
10:08:20 < moa> hum, that evas_gl.h would be a problem indeed
10:08:36 < moa> for e, i don't know
10:08:57 <@raster> elm requires svn evas
10:09:02 <@raster> thats unfortunately how it is
10:09:12 <@raster> requires evas_gl
10:09:35 < JaMa> maybe this is missing in 1.1 branch for e17? r65838
10:09:42 <@raster> yes
10:09:46 <@raster> its missing
10:09:50 <@raster> as its in trunk
10:09:53 <@raster> its a "new feature"
10:09:58 <@raster> not in stable
10:10:15 <@raster> uy'd have to patch out the support to make elm from svn build
10:10:42 < JaMa> raster: ok then I just didn't understand the dependency on "only" efl-1.1 right.. I'll update the rest of efl to same rev (instead of keeping them on 1.1 release)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass                    |    9 +-
 ...ementary-temporary-fix-for-build-breakage.patch |   49 ------
 .../python/python-elementary_svn.bb                |    2 -
 meta-efl/recipes-efl/e17/expedite_svn.bb           |    2 +-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/eina_svn.bb               |    2 +-
 ...-build-really-without-PAM-support-if-PAM-.patch |  179 --------------------
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    1 -
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
 ...a-update-genlist-gengrid-callbacks-s-labe.patch |   97 -----------
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    1 -
 17 files changed, 11 insertions(+), 347 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch
 delete mode 100644 meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch
 delete mode 100644 meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 79104ec..8b21675 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,13 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-# usually tracks svn trunk HEAD
-EFL_SRCREV ?= "65808"
-# revision when 1.1.0 (eet is actually 1.5.0) was released, 
-# so we can lock some release libs to this revision 
-# and use EFL_SRCREV to track e17 and elementary
-EFL_SRCREV_1.1.0 ?= "65800"
-# revision when 1.0.0 was released, for recipes which don't need rebuild so often
-EFL_SRCREV_1.0.0 ?= "56356"
+EFL_SRCREV ?= "66164"
 
 ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch b/meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch
deleted file mode 100644
index ef61c99..0000000
--- a/meta-efl/recipes-devtools/python/python-elementary/0001-python-elementary-temporary-fix-for-build-breakage.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 61b8233c582bcb1786bfcafa984abfd523fedcca Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 1 Dec 2011 22:07:38 +0100
-Subject: [PATCH] python-elementary: temporary fix for build breakage
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- .../include/elementary/c_elementary.pxd            |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/elementary/c_elementary.pxd b/include/elementary/c_elementary.pxd
-index 16535c5..09986f8 100644
---- a/include/elementary/c_elementary.pxd
-+++ b/include/elementary/c_elementary.pxd
-@@ -169,13 +169,13 @@ cdef extern from "Elementary.h":
-         evas.c_evas.Eina_Bool hover_top
-         evas.c_evas.Eina_Bool hover_bottom
- 
--    ctypedef char *(*GenlistItemLabelGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
-+    ctypedef char *(*GenlistItemTextGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
-     ctypedef evas.c_evas.Evas_Object *(*GenlistItemIconGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
-     ctypedef evas.c_evas.Eina_Bool (*GenlistItemStateGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
-     ctypedef void (*GenlistItemDelFunc)(void *data, evas.c_evas.Evas_Object *obj)
- 
-     ctypedef struct Elm_Genlist_Item_Class_Func:
--        GenlistItemLabelGetFunc label_get
-+        GenlistItemTextGetFunc text_get
-         GenlistItemIconGetFunc content_get
-         GenlistItemStateGetFunc state_get
-         GenlistItemDelFunc del_ "del"
-@@ -184,13 +184,13 @@ cdef extern from "Elementary.h":
-         char *item_style
-         Elm_Genlist_Item_Class_Func func
- 
--    ctypedef char *(*GengridItemLabelGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
-+    ctypedef char *(*GengridItemTextGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
-     ctypedef evas.c_evas.Evas_Object *(*GengridItemIconGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
-     ctypedef evas.c_evas.Eina_Bool (*GengridItemStateGetFunc)(void *data, evas.c_evas.Evas_Object *obj, const_char_ptr part)
-     ctypedef void (*GengridItemDelFunc)(void *data, evas.c_evas.Evas_Object *obj)
- 
-     ctypedef struct Elm_Gengrid_Item_Class_Func:
--        GengridItemLabelGetFunc label_get
-+        GengridItemTextGetFunc text_get
-         GengridItemIconGetFunc content_get
-         GengridItemStateGetFunc state_get
-         GengridItemDelFunc del_ "del"
--- 
-1.7.8.rc4
-
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index 37a8ffa..6d8b0b8 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -5,5 +5,3 @@ PR = "${INC_PR}.2"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
-
-SRC_URI += " file://0001-python-elementary-temporary-fix-for-build-breakage.patch"
diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-efl/e17/expedite_svn.bb
index dfcbcde..e6dc051 100644
--- a/meta-efl/recipes-efl/e17/expedite_svn.bb
+++ b/meta-efl/recipes-efl/e17/expedite_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
 DEPENDS = "eet evas"
 LICENSE = "MIT BSD"
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index 5cad73d..1d3706f 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -1,6 +1,6 @@
 require ecore.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index 5d79c02..ebe4312 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -1,6 +1,6 @@
 require edbus.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index c3e1a95..1fedfbc 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -1,6 +1,6 @@
 require edje.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index aad311b..42439cb 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -1,6 +1,6 @@
 require eet.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.5.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index b7986e1..9016348 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -1,6 +1,6 @@
 require eeze.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index 6c7661c..a711770 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,6 +1,6 @@
 require efreet.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index b510449..8256387 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -1,6 +1,6 @@
 require eina.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch b/meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch
deleted file mode 100644
index 2ccdb72..0000000
--- a/meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From 0f97df8ddf1af3b7c8d670b8600a51e2ebe4e855 Mon Sep 17 00:00:00 2001
-From: Klaus 'mrmoku' Kurzmann <mok@mnet-online.de>
-Date: Sat, 19 Nov 2011 15:36:57 +0100
-Subject: [PATCH 1/2] elsa: fix to build really without PAM support if PAM is
- disabled or not available
-
-* there as still issues in runtime without PAM, but at least it builds
-  now without PAM support and it's good start
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- PROTO/elsa/configure.ac              |    2 +-
- PROTO/elsa/src/daemon/Makefile.am    |    6 ++++--
- PROTO/elsa/src/daemon/elsa.c         |    8 ++++++++
- PROTO/elsa/src/daemon/elsa.h         |    2 ++
- PROTO/elsa/src/daemon/elsa_session.c |   11 +++++++++--
- 5 files changed, 24 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ac85872..82d0a3f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -123,7 +123,6 @@ if test "x${enable_pam}" = "xyes" ; then
- fi
- 
- 
--
- ### Checks for header files
- 
- # Pam
-@@ -133,6 +132,7 @@ if test "x${have_pam}" = "xyes" ; then
-       [have_pam="no"])
- fi
- 
-+AM_CONDITIONAL(HAVE_PAM, [test "x${have_pam}" = "xyes"])
- 
- ### Checks for types
- 
-diff --git a/src/daemon/Makefile.am b/src/daemon/Makefile.am
-index cf1cd72..7919d90 100644
---- a/src/daemon/Makefile.am
-+++ b/src/daemon/Makefile.am
-@@ -29,8 +29,6 @@ elsa_session.h     \
- elsa_session.c     \
- elsa_xserver.h     \
- elsa_xserver.c     \
--elsa_pam.h         \
--elsa_pam.c         \
- ../event/elsa_event.c \
- ../event/elsa_event.h \
- elsa_server.h     \
-@@ -42,6 +40,10 @@ elsa_action.c     \
- elsa.h            \
- elsa.c
- 
-+if HAVE_PAM
-+elsa_SOURCES += elsa_pam.h elsa_pam.c
-+endif
-+
- elsa_LDFLAGS =
- elsa_LDADD = @ELSA_LIBS@ -lpam -lrt
- 
-diff --git a/src/daemon/elsa.c b/src/daemon/elsa.c
-index 8bc243f..23f971d 100644
---- a/src/daemon/elsa.c
-+++ b/src/daemon/elsa.c
-@@ -278,7 +278,9 @@ main (int argc, char ** argv)
-      }
- 
-    elsa_user = getenv("ELSA_USER");
-+#ifdef HAVE_PAM
-    elsa_pam_init(PACKAGE, dname, elsa_user);
-+#endif
-    if (elsa_user)
-      {
-         char *quit;
-@@ -295,7 +297,9 @@ main (int argc, char ** argv)
-              exit(0);
-           }
-         sleep(3);
-+#ifdef HAVE_PAM
-         elsa_pam_init(PACKAGE, dname, NULL);
-+#endif
-      }
-    else
-      fprintf(stderr, "\n");
-@@ -322,7 +326,9 @@ main (int argc, char ** argv)
-         xcb_connection_t *disp = NULL;
-         disp = xcb_connect(dname, NULL);
-         ecore_main_loop_begin();
-+#ifdef HAVE_PAM
-         elsa_pam_item_set(ELSA_PAM_ITEM_USER, elsa_config->userlogin);
-+#endif
-         elsa_session_login(elsa_config->command.session_login, EINA_FALSE);
-         sleep(30);
-         xcb_disconnect(disp);
-@@ -347,8 +353,10 @@ main (int argc, char ** argv)
-      }
-    elsa_xserver_shutdown();
-    fprintf(stderr, PACKAGE": xserver shutdown\n");
-+#ifdef HAVE_PAM
-    elsa_pam_shutdown();
-    fprintf(stderr, PACKAGE": pam shutdown\n");
-+#endif
-    ecore_shutdown();
-    elsa_config_shutdown();
-    fprintf(stderr, PACKAGE": config shutdown\n");
-diff --git a/src/daemon/elsa.h b/src/daemon/elsa.h
-index 87d9f49..46f2584 100644
---- a/src/daemon/elsa.h
-+++ b/src/daemon/elsa.h
-@@ -13,7 +13,9 @@
- #include <Ecore_File.h>
- 
- #include "elsa_session.h"
-+#ifdef HAVE_PAM
- #include "elsa_pam.h"
-+#endif
- #include "elsa_config.h"
- #include "elsa_xserver.h"
- #include "elsa_server.h"
-diff --git a/src/daemon/elsa_session.c b/src/daemon/elsa_session.c
-index 3da70b3..d926db9 100644
---- a/src/daemon/elsa_session.c
-+++ b/src/daemon/elsa_session.c
-@@ -91,7 +91,6 @@ _elsa_session_userid_set(struct passwd *pwd)
- static Eina_Bool
- _elsa_session_begin(struct passwd *pwd, const char *cookie)
- {
--   char *term;
-    fprintf(stderr, PACKAGE": Session Init\n");
-    if (pwd->pw_shell[0] == '\0')
-      {
-@@ -99,7 +98,8 @@ _elsa_session_begin(struct passwd *pwd, const char *cookie)
-         strcpy(pwd->pw_shell, getusershell());
-         endusershell();
-      }
--   term = getenv("TERM");
-+#ifdef HAVE_PAM
-+   char *term = getenv("TERM");
-    if (term) elsa_pam_env_set("TERM", term);
-    elsa_pam_env_set("HOME", pwd->pw_dir);
-    elsa_pam_env_set("SHELL", pwd->pw_shell);
-@@ -109,6 +109,7 @@ _elsa_session_begin(struct passwd *pwd, const char *cookie)
-    elsa_pam_env_set("DISPLAY", ":0.0");
-    elsa_pam_env_set("MAIL", "");
-    elsa_pam_env_set("XAUTHORITY", cookie);
-+#endif
-    return EINA_TRUE;
- }
- 
-@@ -164,9 +165,11 @@ elsa_session_end(const char *user)
-             "%s %s ", elsa_config->command.session_stop, user);
-    if (-1 == system(buf))
-      fprintf(stderr, PACKAGE": Error on session stop command %s", buf);
-+#ifdef HAVE_PAM
-    elsa_pam_close_session();
-    elsa_pam_end();
-    elsa_pam_shutdown();
-+#endif
- }
- 
- void
-@@ -234,8 +237,12 @@ elsa_session_shutdown()
- Eina_Bool
- elsa_session_authenticate(const char *login, const char *passwd)
- {
-+#ifdef HAVE_PAM
-    return (!elsa_pam_auth_set(login, passwd)
-            && !elsa_pam_authenticate());
-+#else
-+   return (EINA_TRUE);
-+#endif
- }
- 
- Eina_Bool
--- 
-1.7.8.rc4
-
diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index c21c2e5..949c7e1 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -7,7 +7,6 @@ SECTION = "e/apps"
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
   file://0001-pam-use-common-auth-instead-of-system-auth.patch \
-  file://0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch \
   file://xserver-nodm.service \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index 7c185e7..ad1bb10 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -1,6 +1,6 @@
 require embryo.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index 284891e..a2641b9 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,6 +1,6 @@
 require evas.inc
 
-SRCREV = "${EFL_SRCREV_1.1.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch b/meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch
deleted file mode 100644
index 90c0de6..0000000
--- a/meta-efl/recipes-efl/efl/libeflvala/0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 3e51778fdba36c81204b9eca81e67624c6401972 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 1 Dec 2011 17:28:38 +0100
-Subject: [PATCH] BINDINS/vala: update genlist/gengrid callbacks
- s/label_get/text_get/g
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- BINDINGS/vala/examples/elementary/genlist.vala |    2 +-
- BINDINGS/vala/vapi/elementary.vapi             |   16 ++++++++--------
- 2 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/examples/elementary/genlist.vala b/examples/elementary/genlist.vala
-index b9fb42b..3a4a3b1 100644
---- a/examples/elementary/genlist.vala
-+++ b/examples/elementary/genlist.vala
-@@ -53,7 +53,7 @@ public class T.Genlist : T.Abstract
-     public static string getText( Elm.Object obj, string part )
-     {
-         int number = (int)obj;
--        debug( "label_get: %p", obj );
-+        debug( "text_get: %p", obj );
-         return "This is list item #%d".printf( number );
-     }
-     public static Elm.Object? getContent( Elm.Object obj, string part )
-diff --git a/vapi/elementary.vapi b/vapi/elementary.vapi
-index 8a6cc17..90b50f5c7 100644
---- a/vapi/elementary.vapi
-+++ b/vapi/elementary.vapi
-@@ -842,7 +842,7 @@ public class MenuItem
-     public Elm.Object object_get();
-     public void label_set( string label );
-     //public void del_cb_set( ... );
--    public unowned string label_get();
-+    public unowned string text_get();
-     public void icon_set( Elm.Object icon );
-     public void disabled_set( bool disabled );
-     public void* item_data_get();
-@@ -908,7 +908,7 @@ public class Slider : Elm.Object
-     public Slider( Elm.Object? parent );
- 
-     public void label_set( string label );
--    public unowned string label_get();
-+    public unowned string text_get();
-     public void icon_set( Elm.Object icon );
-     public Elm.Object icon_get();
-     public void span_size_set( Evas.Coord size );
-@@ -931,8 +931,8 @@ public enum GenlistItemFlags
-     SUBITEMS,
- }
- 
--[CCode (cname = "Elm_Gen_Item_Label_Get_Cb", has_target = false)]
--public delegate string GenlistItemLabelGetFunc( Elm.Object obj, string part );
-+[CCode (cname = "Elm_Gen_Item_Text_Get_Cb", has_target = false)]
-+public delegate string GenlistItemTextGetFunc( Elm.Object obj, string part );
- [CCode (cname = "Elm_Gen_Item_Content_Get_Cb", has_target = false)]
- public delegate Elm.Object? GenlistItemContentGetFunc( Elm.Object obj, string part );
- [CCode (cname = "Elm_Gen_Item_State_Get_Cb", has_target = false)]
-@@ -944,7 +944,7 @@ public delegate void GenlistItemDelFunc( Elm.Object obj );
- [CCode (cname = "Elm_Gen_Item_Class_Func", destroy_function = "")]
- public struct GenlistItemClassFunc
- {
--    public GenlistItemLabelGetFunc text_get;
-+    public GenlistItemTextGetFunc text_get;
-     public GenlistItemContentGetFunc content_get;
-     public GenlistItemStateGetFunc state_get;
-     public GenlistItemDelFunc del;
-@@ -1027,7 +1027,7 @@ public class Check : Elm.Object
-     public Check( Elm.Object? parent );
- 
-     public void label_set( string label );
--    public unowned string label_get();
-+    public unowned string text_get();
-     public void icon_set( Elm.Object icon );
-     public Elm.Object icon_get();
-     public void state_set( bool state );
-@@ -1044,7 +1044,7 @@ public class Radio : Elm.Object
-     public Radio( Elm.Object? parent );
- 
-     public void label_set( string label );
--    public unowned string label_get();
-+    public unowned string text_get();
-     public void icon_set( Elm.Object icon );
-     public Elm.Object icon_get();
-     public void group_add( Elm.Object group );
-@@ -1256,7 +1256,7 @@ public class ListItem
-     public void selected_set( bool selected );
-     public void show();
-     public void* data_get();
--    public unowned string label_get();
-+    public unowned string text_get();
-     public void label_set( string label );
-     public Elm.Object icon_get();
-     public void icon_set( Elm.Object icon );
--- 
-1.7.8.rc4
-
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index e2450aa..c18c8c9 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -13,7 +13,6 @@ SRCNAME = "vala"
 inherit e-base autotools pkgconfig vala
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};proto=http \
-  file://0001-BINDINS-vala-update-genlist-gengrid-callbacks-s-labe.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
-- 
1.7.8



