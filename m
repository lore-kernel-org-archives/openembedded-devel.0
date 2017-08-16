Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7A097780D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 05:38:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7G5cHCN004652
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:38:18 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 Aug 2017 22:38:17 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Aug 2017 13:37:40 +0800
Message-ID: <20170816053740.24934-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] vlock: add new recipe
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
X-List-Received-Date: Wed, 16 Aug 2017 05:38:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

vlock is a program to lock one or more
sessions on the Linux console.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../vlock/vlock-2.2.3/disable_vlockrc.patch        |  37 +++++++
 .../vlock/vlock-2.2.3/vlock-no_tally.patch         | 107 +++++++++++++++++++++
 .../recipes-extended/vlock/vlock-2.2.3/vlock_pam   |   3 +
 .../vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch |  19 ++++
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb      |  59 ++++++++++++
 5 files changed, 225 insertions(+)
 create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
 create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
 create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam
 create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
 create mode 100644 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb

diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
new file mode 100644
index 000000000..ee0d074de
--- /dev/null
+++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Inappropriate [configuration]
+
+written by: Jeff Polk <jeff.polk@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Index: vlock-2.2.2/man/vlock.1
+===================================================================
+--- vlock-2.2.2.orig/man/vlock.1	2010-07-26 14:12:42.000000000 -0400
++++ vlock-2.2.2/man/vlock.1	2010-07-26 14:13:06.000000000 -0400
+@@ -111,11 +111,6 @@
+ to an invalid value or 0 no timeout is used.  \fBWarning\fR: If this value is
+ too low, you may not be able to unlock your session.
+ .PP
+-.SH FILES
+-.B ~/.vlockrc
+-.IP
+-This file is read by \fBvlock\fR on startup if it exists.  All the variables
+-mentioned above can be set here.
+ .SH SECURITY
+ See the SECURITY file in the \fBvlock\fR distribution for more information.
+ .PP
+Index: vlock-2.2.2/src/vlock.sh
+===================================================================
+--- vlock-2.2.2.orig/src/vlock.sh	2010-07-26 14:12:32.000000000 -0400
++++ vlock-2.2.2/src/vlock.sh	2010-07-26 14:13:33.000000000 -0400
+@@ -35,11 +35,6 @@
+ 
+ ${VLOCK_ENTER_PROMPT}"
+ 
+-# Read user settings.
+-if [ -r "${HOME}/.vlockrc" ] ; then
+-  . "${HOME}/.vlockrc"
+-fi
+-
+ # "Compile" time variables.
+ VLOCK_MAIN="%PREFIX%/sbin/vlock-main"
+ VLOCK_VERSION="%VLOCK_VERSION%"
diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
new file mode 100644
index 000000000..6e8a6a9fd
--- /dev/null
+++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-no_tally.patch
@@ -0,0 +1,107 @@
+Upstream-Status: Pending
+
+written by: Jeff Polk <jeff.polk@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+--- a/Makefile
++++ b/Makefile
+@@ -126,6 +126,10 @@ ifeq ($(AUTH_METHOD),shadow)
+ vlock-main : override LDLIBS += $(CRYPT_LIB)
+ endif
+ 
++ifneq ($(ENABLE_FAIL_COUNT),yes)
++vlock-main.o : override CFLAGS += -DNO_FAIL_COUNT
++endif
++
+ ifeq ($(ENABLE_PLUGINS),yes)
+ vlock-main: plugins.o plugin.o module.o process.o script.o tsort.o list.o
+ # -rdynamic is needed so that the all plugin can access the symbols from console_switch.o
+--- a/configure
++++ b/configure
+@@ -44,6 +44,7 @@ Optional Features:
+   --enable-shadow         enable shadow authentication [disabled]
+   --enable-root-password  enable unlogging with root password [enabled]
+   --enable-debug          enable debugging
++  --enable-fail-count     enable failed login attempt summary [enabled]
+ 
+ Additional configuration:
+   --with-scripts=SCRIPTS  enable the named scripts []
+@@ -78,6 +79,9 @@ enable_feature() {
+     root-password)
+       ENABLE_ROOT_PASSWORD="$2"
+     ;;
++    fail-count)
++      ENABLE_FAIL_COUNT="$2"
++    ;;
+     pam|shadow)
+       if [ "$2" = "yes" ] ; then
+         if [ -n "$auth_method" ] && [ "$auth_method" != "$1" ] ; then
+@@ -232,6 +232,7 @@ set_defaults() {
+   AUTH_METHOD="pam"
+   ENABLE_ROOT_PASSWORD="yes"
+   ENABLE_PLUGINS="yes"
++  ENABLE_FAIL_COUNT="yes"
+   SCRIPTS=""
+ 
+   VLOCK_GROUP="vlock"
+@@ -356,10 +356,14 @@ ENABLE_PLUGINS = ${ENABLE_PLUGINS}
+ # which plugins should be build
+ MODULES = ${MODULES}
+ # which scripts should be installed
+ SCRIPTS = ${SCRIPTS}
+ 
++# display a summary of failed authentication attempts after successfully
++# unlocking?
++ENABLE_FAIL_COUNT = ${ENABLE_FAIL_COUNT}
++
+ # root's group
+ ROOT_GROUP = ${ROOT_GROUP}
+ 
+ # group for privileged plugins
+ VLOCK_GROUP = ${VLOCK_GROUP}
+--- a/src/vlock-main.c
++++ b/src/vlock-main.c
+@@ -111,7 +111,9 @@ static void restore_terminal(void)
+   (void) tcsetattr(STDIN_FILENO, TCSANOW, &term);
+ }
+ 
++#ifdef ENABLE_FAIL_COUNT
+ static int auth_tries;
++#endif /* ENABLE_FAIL_COUNT */
+ 
+ static void auth_loop(const char *username)
+ {
+@@ -181,7 +183,9 @@ static void auth_loop(const char *userna
+     }
+ #endif
+ 
++#ifdef ENABLE_FAIL_COUNT
+     auth_tries++;
++#endif /* ENABLE_FAIL_COUNT */
+   }
+ 
+   /* Free timeouts memory. */
+@@ -189,11 +193,13 @@ static void auth_loop(const char *userna
+   free(prompt_timeout);
+ }
+ 
++#ifdef ENABLE_FAIL_COUNT
+ void display_auth_tries(void)
+ {
+   if (auth_tries > 0)
+     fprintf(stderr, "%d failed authentication %s.\n", auth_tries, auth_tries > 1 ? "tries" : "try");
+ }
++#endif /* ENABLE_FAIL_COUNT */
+ 
+ #ifdef USE_PLUGINS
+ static void call_end_hook(void)
+@@ -216,7 +222,9 @@ int main(int argc, char *const argv[])
+   if (username == NULL)
+     fatal_perror("vlock: could not get username");
+ 
++#ifdef ENABLE_FAIL_COUNT
+   ensure_atexit(display_auth_tries);
++#endif /* ENABLE_FAIL_COUNT */
+ 
+ #ifdef USE_PLUGINS
+   for (int i = 1; i < argc; i++)
diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam
new file mode 100644
index 000000000..a919682b0
--- /dev/null
+++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam
@@ -0,0 +1,3 @@
+# Use the default auth and account policies for vlock
+auth       include      common-auth
+account    include      common-account
diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
new file mode 100644
index 000000000..4ce0abc71
--- /dev/null
+++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Pending
+
+written by: Jeff Polk <jeff.polk@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Index: vlock-2.2.2/src/auth-pam.c
+===================================================================
+--- vlock-2.2.2.orig/src/auth-pam.c	2010-06-14 14:38:51.000000000 -0400
++++ vlock-2.2.2/src/auth-pam.c	2010-06-14 14:39:12.000000000 -0400
+@@ -148,6 +148,9 @@
+ 
+   if (pam_status != PAM_SUCCESS) {
+     fprintf(stderr, "vlock: %s\n", pam_strerror(pamh, pam_status));
++  } else {
++    pam_status = pam_acct_mgmt(pamh, 0);
++    if (pam_status == PAM_SUCCESS) pam_setcred(pamh, PAM_REINITIALIZE_CRED);
+   }
+ 
+ end:
diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
new file mode 100644
index 000000000..259d3a5e1
--- /dev/null
+++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
@@ -0,0 +1,59 @@
+SUMMARY = "Virtual Console lock program"
+DESCRIPTION = "Sometimes a malicious local user could cause more problems \
+  than a sophisticated remote one. vlock is a program that locks one or more \
+  sessions on the Linux console to prevent attackers from gaining physical \
+  access to the machine. \
+  "
+SECTION = "utils"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
+
+SRC_URI = "${GENTOO_MIRROR}/${BP}.tar.gz \
+       file://disable_vlockrc.patch \
+       file://vlock_pam_tally2_reset.patch \
+       file://vlock-no_tally.patch \
+       file://vlock_pam \
+       "
+
+SRC_URI[md5sum] = "378175c7692a8f288e65fd4dbf8a38eb"
+SRC_URI[sha256sum] = "85aa5aed1ae49351378a0bd527a013078f0f969372a63164b1944174ae1a5e39"
+
+inherit autotools-brokensep update-alternatives
+
+# authentification method: either pam or shadow
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', 'shadow', d)}"
+PACKAGECONFIG[pam] = "--enable-pam,,libpam,"
+PACKAGECONFIG[shadow] = "--enable-shadow,,shadow,"
+
+CFLAGS += "-Wall -W -pedantic -std=gnu99"
+
+do_configure () {
+    # The configure tries to use 'getent' to get the group
+    # info from the host, which should be avoided.
+    sed -i 's/\(ROOT_GROUP=\).*/\1"root"/' ${CONFIGURE_SCRIPT}
+
+    ${CONFIGURE_SCRIPT} \
+        VLOCK_GROUP=root \
+        ROOT_GROUP=root \
+        CC="${CC}" \
+        CFLAGS="${CFLAGS}" \
+        LDFLAGS="${LDFLAGS}" \
+        --prefix=${prefix} \
+        --libdir=${libdir} \
+        --mandir=${mandir} \
+        --with-modules="all.so new.so nosysrq.so ttyblank.so vesablank.so" \
+        --disable-root-password --enable-debug --disable-fail-count \
+        ${PACKAGECONFIG_CONFARGS}
+}
+
+do_install_append () {
+    if [ ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', '', d)} = yes ]; then
+        install -d -m 0755 ${D}/${sysconfdir}/pam.d
+        install -m 0644 ${WORKDIR}/vlock_pam ${D}${sysconfdir}/pam.d/vlock
+    fi
+}
+
+ALTERNATIVE_${PN} = "vlock"
+ALTERNATIVE_PRIORITY = "60"
+ALTERNATIVE_LINK_NAME[vlock] = "${bindir}/vlock"
-- 
2.11.0


