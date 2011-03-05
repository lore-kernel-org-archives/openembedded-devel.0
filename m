Received: from 7.26.mail-out.ovh.net ([46.105.40.147] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pvz9v-0001dw-Dp
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Mar 2011 22:37:07 +0100
Received: (qmail 20534 invoked by uid 503); 5 Mar 2011 20:56:19 -0000
Received: from b9.ovh.net (HELO mail407.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 5 Mar 2011 20:56:18 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Mar 2011 23:28:54 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Mar 2011 23:28:54 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Mar 2011 22:30:02 +0100
Message-Id: <1299360603-24687-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12328041031501458761
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 1/2] dropbear: add 0.53.1
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
X-List-Received-Date: Sat, 05 Mar 2011 21:37:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0.53.1 brings some improvements over 0.52 which was released
more than 2 years ago. For more details, check the changelog here :
http://matt.ucc.asn.au/dropbear/CHANGES
* Please note that DROPBEAR_SMALL_CODEis now disabled which may
increase the size of the binaries.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/dropbear/dropbear-0.53.1/allow-nopw.patch  |   40 ++++++++++++++++++++
 recipes/dropbear/dropbear-0.53.1/configure.patch   |   27 +++++++++++++
 .../dropbear/dropbear-0.53.1/fix-2kb-keys.patch    |   12 ++++++
 .../dropbear/dropbear-0.53.1/no-host-lookup.patch  |   12 ++++++
 .../urandom-xauth-changes-to-options.h.patch       |   13 ++++++
 recipes/dropbear/dropbear_0.53.1.bb                |    9 ++++
 6 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dropbear/dropbear-0.53.1/allow-nopw.patch
 create mode 100644 recipes/dropbear/dropbear-0.53.1/configure.patch
 create mode 100644 recipes/dropbear/dropbear-0.53.1/fix-2kb-keys.patch
 create mode 100644 recipes/dropbear/dropbear-0.53.1/no-host-lookup.patch
 create mode 100644 recipes/dropbear/dropbear-0.53.1/urandom-xauth-changes-to-options.h.patch
 create mode 100644 recipes/dropbear/dropbear_0.53.1.bb

diff --git a/recipes/dropbear/dropbear-0.53.1/allow-nopw.patch b/recipes/dropbear/dropbear-0.53.1/allow-nopw.patch
new file mode 100644
index 0000000..3f3e8b1
--- /dev/null
+++ b/recipes/dropbear/dropbear-0.53.1/allow-nopw.patch
@@ -0,0 +1,40 @@
+Index: dropbear-0.51/svr-auth.c
+===================================================================
+--- dropbear-0.51.orig/svr-auth.c
++++ dropbear-0.51/svr-auth.c
+@@ -270,7 +270,7 @@ static int checkusername(unsigned char *
+ 		send_msg_userauth_failure(0, 1);
+ 		return DROPBEAR_FAILURE;
+ 	}
+-
++#ifdef DISALLOW_EMPTY_PW
+ 	/* check for an empty password */
+ 	if (ses.authstate.pw_passwd[0] == '\0') {
+ 		TRACE(("leave checkusername: empty pword"))
+@@ -279,7 +279,7 @@ static int checkusername(unsigned char *
+ 		send_msg_userauth_failure(0, 1);
+ 		return DROPBEAR_FAILURE;
+ 	}
+-
++#endif
+ 	TRACE(("shell is %s", ses.authstate.pw_shell))
+ 
+ 	/* check that the shell is set */
+Index: dropbear-0.51/svr-authpasswd.c
+===================================================================
+--- dropbear-0.51.orig/svr-authpasswd.c
++++ dropbear-0.51/svr-authpasswd.c
+@@ -64,9 +64,13 @@ void svr_auth_password() {
+ 	 * since the shadow password may differ to that tested
+ 	 * in auth.c */
+ 	if (passwdcrypt[0] == '\0') {
++#ifdef DISALLOW_EMPTY_PW
+ 		dropbear_log(LOG_WARNING, "user '%s' has blank password, rejected",
+ 				ses.authstate.pw_name);
+ 		send_msg_userauth_failure(0, 1);
++#else
++		send_msg_userauth_success();
++#endif
+ 		return;
+ 	}
+ 
diff --git a/recipes/dropbear/dropbear-0.53.1/configure.patch b/recipes/dropbear/dropbear-0.53.1/configure.patch
new file mode 100644
index 0000000..fa24efc
--- /dev/null
+++ b/recipes/dropbear/dropbear-0.53.1/configure.patch
@@ -0,0 +1,27 @@
+Index: dropbear-0.50/configure.in
+===================================================================
+--- dropbear-0.50.orig/configure.in
++++ dropbear-0.50/configure.in
+@@ -164,14 +164,20 @@ AC_ARG_ENABLE(openpty,
+ 			AC_MSG_NOTICE(Not using openpty)
+ 		else
+ 			AC_MSG_NOTICE(Using openpty if available)
+-			AC_SEARCH_LIBS(openpty, util, [AC_DEFINE(HAVE_OPENPTY,,Have openpty() function)])
++			AC_SEARCH_LIBS(openpty, util, [dropbear_cv_func_have_openpty=yes])
+ 		fi
+ 	],
+ 	[
+ 		AC_MSG_NOTICE(Using openpty if available)
+-		AC_SEARCH_LIBS(openpty, util, [AC_DEFINE(HAVE_OPENPTY)])
++		AC_SEARCH_LIBS(openpty, util, [dropbear_cv_func_have_openpty=yes])
+ 	]
+ )
++
++if test "x$dropbear_cv_func_have_openpty" = "xyes"; then
++	AC_DEFINE(HAVE_OPENPTY,,Have openpty() function)
++	no_ptc_check=yes
++	no_ptmx_check=yes
++fi
+ 		
+ 
+ AC_ARG_ENABLE(syslog,
diff --git a/recipes/dropbear/dropbear-0.53.1/fix-2kb-keys.patch b/recipes/dropbear/dropbear-0.53.1/fix-2kb-keys.patch
new file mode 100644
index 0000000..bb7a4d3
--- /dev/null
+++ b/recipes/dropbear/dropbear-0.53.1/fix-2kb-keys.patch
@@ -0,0 +1,12 @@
+Index: dropbear-0.50/kex.h
+===================================================================
+--- dropbear-0.50.orig/kex.h
++++ dropbear-0.50/kex.h
+@@ -59,6 +59,6 @@ struct KEXState {
+ 
+ };
+ 
+-#define MAX_KEXHASHBUF 2000
++#define MAX_KEXHASHBUF 3000
+ 
+ #endif /* _KEX_H_ */
diff --git a/recipes/dropbear/dropbear-0.53.1/no-host-lookup.patch b/recipes/dropbear/dropbear-0.53.1/no-host-lookup.patch
new file mode 100644
index 0000000..d7c2ccd
--- /dev/null
+++ b/recipes/dropbear/dropbear-0.53.1/no-host-lookup.patch
@@ -0,0 +1,12 @@
+diff -urN dropbear-0.51/options.h dropbear-0.51.new/options.h
+--- dropbear-0.51/options.h	2008-03-27 14:34:39.000000000 +0100
++++ dropbear-0.51.new/options.h	2008-06-22 00:22:09.000000000 +0200
+@@ -112,7 +112,7 @@
+ /* #define DSS_PROTOK */
+ 
+ /* Whether to do reverse DNS lookups. */
+-#define DO_HOST_LOOKUP
++/* #define DO_HOST_LOOKUP */
+ 
+ /* Whether to print the message of the day (MOTD). This doesn't add much code
+  * size */
diff --git a/recipes/dropbear/dropbear-0.53.1/urandom-xauth-changes-to-options.h.patch b/recipes/dropbear/dropbear-0.53.1/urandom-xauth-changes-to-options.h.patch
new file mode 100644
index 0000000..bd1657d
--- /dev/null
+++ b/recipes/dropbear/dropbear-0.53.1/urandom-xauth-changes-to-options.h.patch
@@ -0,0 +1,13 @@
+diff --git a/options.h b/options.h
+index d309ab4..7fbe97b 100644
+--- a/options.h
++++ b/options.h
+@@ -236,7 +236,7 @@ much traffic. */
+ /* The command to invoke for xauth when using X11 forwarding.
+  * "-q" for quiet */
+ #ifndef XAUTH_COMMAND
+-#define XAUTH_COMMAND "/usr/bin/X11/xauth -q"
++#define XAUTH_COMMAND "xauth -q"
+ #endif
+ 
+ /* if you want to enable running an sftp server (such as the one included with
diff --git a/recipes/dropbear/dropbear_0.53.1.bb b/recipes/dropbear/dropbear_0.53.1.bb
new file mode 100644
index 0000000..fd6b970
--- /dev/null
+++ b/recipes/dropbear/dropbear_0.53.1.bb
@@ -0,0 +1,9 @@
+require dropbear.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://no-host-lookup.patch"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI[md5sum] = "0284ea239083f04c8b874e08e1aca243"
+SRC_URI[sha256sum] = "e24d3cbecd3bc850b2b336b8eb50c845a285ceef8e22544938a582e163d36393"
-- 
1.7.0.4



