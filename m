Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXruA-0004Wz-3I
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:05:42 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=aCBgpdBdMesOZ3MIuaVE8hIHJpDPNmIy6zd9DdGawtc=;
	b=RwLLgXOnVUFLxPboFQDYDQOQTecYiTSESNImAdITV5Zl4B5kRSD/fjRXCT3P63CXL5
	at6G9aEe2cMLq0cdwt6rQ+qbASohHrNWyCXRSU6QpYNMjZlu/tq32q8brqw2HvlUBG4c
	O2fkN0zN+em4GcZG6vd9S6HCL0xma5wXMwTUM=
Received: by 10.213.23.9 with SMTP id p9mr2227584ebb.147.1323165537017;
	Tue, 06 Dec 2011 01:58:57 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 58sm64592775eet.11.2011.12.06.01.58.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:58:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:12 +0100
Message-Id: <c80f20c4bc33755b90722c2a52d51e309faf7de9.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 13/16] elsa: fix to build with disabled PAM
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
X-List-Received-Date: Tue, 06 Dec 2011 10:05:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-build-really-without-PAM-support-if-PAM-.patch |  179 ++++++++++++++++++++
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    1 +
 2 files changed, 180 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch

diff --git a/meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch b/meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch
new file mode 100644
index 0000000..2ccdb72
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elsa/0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch
@@ -0,0 +1,179 @@
+From 0f97df8ddf1af3b7c8d670b8600a51e2ebe4e855 Mon Sep 17 00:00:00 2001
+From: Klaus 'mrmoku' Kurzmann <mok@mnet-online.de>
+Date: Sat, 19 Nov 2011 15:36:57 +0100
+Subject: [PATCH 1/2] elsa: fix to build really without PAM support if PAM is
+ disabled or not available
+
+* there as still issues in runtime without PAM, but at least it builds
+  now without PAM support and it's good start
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ PROTO/elsa/configure.ac              |    2 +-
+ PROTO/elsa/src/daemon/Makefile.am    |    6 ++++--
+ PROTO/elsa/src/daemon/elsa.c         |    8 ++++++++
+ PROTO/elsa/src/daemon/elsa.h         |    2 ++
+ PROTO/elsa/src/daemon/elsa_session.c |   11 +++++++++--
+ 5 files changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ac85872..82d0a3f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -123,7 +123,6 @@ if test "x${enable_pam}" = "xyes" ; then
+ fi
+ 
+ 
+-
+ ### Checks for header files
+ 
+ # Pam
+@@ -133,6 +132,7 @@ if test "x${have_pam}" = "xyes" ; then
+       [have_pam="no"])
+ fi
+ 
++AM_CONDITIONAL(HAVE_PAM, [test "x${have_pam}" = "xyes"])
+ 
+ ### Checks for types
+ 
+diff --git a/src/daemon/Makefile.am b/src/daemon/Makefile.am
+index cf1cd72..7919d90 100644
+--- a/src/daemon/Makefile.am
++++ b/src/daemon/Makefile.am
+@@ -29,8 +29,6 @@ elsa_session.h     \
+ elsa_session.c     \
+ elsa_xserver.h     \
+ elsa_xserver.c     \
+-elsa_pam.h         \
+-elsa_pam.c         \
+ ../event/elsa_event.c \
+ ../event/elsa_event.h \
+ elsa_server.h     \
+@@ -42,6 +40,10 @@ elsa_action.c     \
+ elsa.h            \
+ elsa.c
+ 
++if HAVE_PAM
++elsa_SOURCES += elsa_pam.h elsa_pam.c
++endif
++
+ elsa_LDFLAGS =
+ elsa_LDADD = @ELSA_LIBS@ -lpam -lrt
+ 
+diff --git a/src/daemon/elsa.c b/src/daemon/elsa.c
+index 8bc243f..23f971d 100644
+--- a/src/daemon/elsa.c
++++ b/src/daemon/elsa.c
+@@ -278,7 +278,9 @@ main (int argc, char ** argv)
+      }
+ 
+    elsa_user = getenv("ELSA_USER");
++#ifdef HAVE_PAM
+    elsa_pam_init(PACKAGE, dname, elsa_user);
++#endif
+    if (elsa_user)
+      {
+         char *quit;
+@@ -295,7 +297,9 @@ main (int argc, char ** argv)
+              exit(0);
+           }
+         sleep(3);
++#ifdef HAVE_PAM
+         elsa_pam_init(PACKAGE, dname, NULL);
++#endif
+      }
+    else
+      fprintf(stderr, "\n");
+@@ -322,7 +326,9 @@ main (int argc, char ** argv)
+         xcb_connection_t *disp = NULL;
+         disp = xcb_connect(dname, NULL);
+         ecore_main_loop_begin();
++#ifdef HAVE_PAM
+         elsa_pam_item_set(ELSA_PAM_ITEM_USER, elsa_config->userlogin);
++#endif
+         elsa_session_login(elsa_config->command.session_login, EINA_FALSE);
+         sleep(30);
+         xcb_disconnect(disp);
+@@ -347,8 +353,10 @@ main (int argc, char ** argv)
+      }
+    elsa_xserver_shutdown();
+    fprintf(stderr, PACKAGE": xserver shutdown\n");
++#ifdef HAVE_PAM
+    elsa_pam_shutdown();
+    fprintf(stderr, PACKAGE": pam shutdown\n");
++#endif
+    ecore_shutdown();
+    elsa_config_shutdown();
+    fprintf(stderr, PACKAGE": config shutdown\n");
+diff --git a/src/daemon/elsa.h b/src/daemon/elsa.h
+index 87d9f49..46f2584 100644
+--- a/src/daemon/elsa.h
++++ b/src/daemon/elsa.h
+@@ -13,7 +13,9 @@
+ #include <Ecore_File.h>
+ 
+ #include "elsa_session.h"
++#ifdef HAVE_PAM
+ #include "elsa_pam.h"
++#endif
+ #include "elsa_config.h"
+ #include "elsa_xserver.h"
+ #include "elsa_server.h"
+diff --git a/src/daemon/elsa_session.c b/src/daemon/elsa_session.c
+index 3da70b3..d926db9 100644
+--- a/src/daemon/elsa_session.c
++++ b/src/daemon/elsa_session.c
+@@ -91,7 +91,6 @@ _elsa_session_userid_set(struct passwd *pwd)
+ static Eina_Bool
+ _elsa_session_begin(struct passwd *pwd, const char *cookie)
+ {
+-   char *term;
+    fprintf(stderr, PACKAGE": Session Init\n");
+    if (pwd->pw_shell[0] == '\0')
+      {
+@@ -99,7 +98,8 @@ _elsa_session_begin(struct passwd *pwd, const char *cookie)
+         strcpy(pwd->pw_shell, getusershell());
+         endusershell();
+      }
+-   term = getenv("TERM");
++#ifdef HAVE_PAM
++   char *term = getenv("TERM");
+    if (term) elsa_pam_env_set("TERM", term);
+    elsa_pam_env_set("HOME", pwd->pw_dir);
+    elsa_pam_env_set("SHELL", pwd->pw_shell);
+@@ -109,6 +109,7 @@ _elsa_session_begin(struct passwd *pwd, const char *cookie)
+    elsa_pam_env_set("DISPLAY", ":0.0");
+    elsa_pam_env_set("MAIL", "");
+    elsa_pam_env_set("XAUTHORITY", cookie);
++#endif
+    return EINA_TRUE;
+ }
+ 
+@@ -164,9 +165,11 @@ elsa_session_end(const char *user)
+             "%s %s ", elsa_config->command.session_stop, user);
+    if (-1 == system(buf))
+      fprintf(stderr, PACKAGE": Error on session stop command %s", buf);
++#ifdef HAVE_PAM
+    elsa_pam_close_session();
+    elsa_pam_end();
+    elsa_pam_shutdown();
++#endif
+ }
+ 
+ void
+@@ -234,8 +237,12 @@ elsa_session_shutdown()
+ Eina_Bool
+ elsa_session_authenticate(const char *login, const char *passwd)
+ {
++#ifdef HAVE_PAM
+    return (!elsa_pam_auth_set(login, passwd)
+            && !elsa_pam_authenticate());
++#else
++   return (EINA_TRUE);
++#endif
+ }
+ 
+ Eina_Bool
+-- 
+1.7.8.rc4
+
diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index 949c7e1..c21c2e5 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -7,6 +7,7 @@ SECTION = "e/apps"
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
   file://0001-pam-use-common-auth-instead-of-system-auth.patch \
+  file://0001-elsa-fix-to-build-really-without-PAM-support-if-PAM-.patch \
   file://xserver-nodm.service \
 "
 S = "${WORKDIR}/${SRCNAME}"
-- 
1.7.8



