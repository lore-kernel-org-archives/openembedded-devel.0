Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CA599785D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 15:45:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6DFjHT7005597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Jul 2018 08:45:17 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 13 Jul 2018 08:45:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Fri, 13 Jul 2018 23:55:17 +0800
Message-ID: <1531497317-26576-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531497317-26576-1-git-send-email-hongxu.jia@windriver.com>
References: <1531497317-26576-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] polkit: 0.113 -> 0.115
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
X-List-Received-Date: Fri, 13 Jul 2018 15:45:17 -0000
Content-Type: text/plain

- Rebase patches to 0.115
  0001-make-netgroup-support-configurable.patch
  polkit-1_pam.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-make-netgroup-support-configurable.patch  | 56 ++++++++--------------
 .../polkit/polkit/polkit-1_pam.patch               | 18 +++++--
 meta-oe/recipes-extended/polkit/polkit_0.113.bb    | 51 --------------------
 meta-oe/recipes-extended/polkit/polkit_0.115.bb    | 52 ++++++++++++++++++++
 4 files changed, 88 insertions(+), 89 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit_0.113.bb
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.115.bb

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch b/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch
index 4e3af87..3b0ef5e 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch
@@ -12,16 +12,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Pending
 
+Rebase to 0.115
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
  configure.ac                                          | 2 +-
  src/polkitbackend/polkitbackendinteractiveauthority.c | 6 +++++-
- src/polkitbackend/polkitbackendjsauthority.c          | 5 ++---
- 3 files changed, 8 insertions(+), 5 deletions(-)
+ src/polkitbackend/polkitbackendjsauthority.cpp        | 2 ++
+ 3 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 07982d1..21590b2 100644
+index 8b3e1b1..1c392df 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -158,7 +158,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
+@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
  	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
  AC_SUBST(EXPAT_LIBS)
  
@@ -31,10 +34,10 @@ index 07982d1..21590b2 100644
  if test "x$GCC" = "xyes"; then
    LDFLAGS="-Wl,--as-needed $LDFLAGS"
 diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
-index 7019356..cf39d77 100644
+index cb6fdab..de3f752 100644
 --- a/src/polkitbackend/polkitbackendinteractiveauthority.c
 +++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
-@@ -2213,7 +2213,7 @@ get_users_in_group (PolkitIdentity                    *group,
+@@ -2224,7 +2224,7 @@ get_users_in_group (PolkitIdentity                    *group,
   out:
    return ret;
  }
@@ -43,7 +46,7 @@ index 7019356..cf39d77 100644
  static GList *
  get_users_in_net_group (PolkitIdentity                    *group,
                          gboolean                           include_root)
-@@ -2270,6 +2270,8 @@ get_users_in_net_group (PolkitIdentity                    *group,
+@@ -2285,6 +2285,8 @@ get_users_in_net_group (PolkitIdentity                    *group,
    return ret;
  }
  
@@ -52,7 +55,7 @@ index 7019356..cf39d77 100644
  /* ---------------------------------------------------------------------------------------------------- */
  
  static void
-@@ -2355,10 +2357,12 @@ authentication_agent_initiate_challenge (AuthenticationAgent         *agent,
+@@ -2369,10 +2371,12 @@ authentication_agent_initiate_challenge (AuthenticationAgent         *agent,
          {
            user_identities = g_list_concat (user_identities, get_users_in_group (identity, FALSE));
          }
@@ -65,43 +68,26 @@ index 7019356..cf39d77 100644
        else
          {
            g_warning ("Unsupported identity");
-diff --git a/src/polkitbackend/polkitbackendjsauthority.c b/src/polkitbackend/polkitbackendjsauthority.c
-index 097dcc5..e59b3f7 100644
---- a/src/polkitbackend/polkitbackendjsauthority.c
-+++ b/src/polkitbackend/polkitbackendjsauthority.c
-@@ -1498,7 +1498,6 @@ js_polkit_spawn (JSContext  *cx,
- 
- /* ---------------------------------------------------------------------------------------------------- */
- 
--
- static JSBool
- js_polkit_user_is_in_netgroup (JSContext  *cx,
-                                unsigned    argc,
-@@ -1518,6 +1517,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
-   user = JS_EncodeString (cx, user_str);
-   netgroup = JS_EncodeString (cx, netgroup_str);
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
+index 517f3c6..6042dd2 100644
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
+@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+   user = JS_EncodeString (cx, args[0].toString());
+   netgroup = JS_EncodeString (cx, args[1].toString());
  
 +#if defined HAVE_INNETGR
    if (innetgr (netgroup,
                 NULL,  /* host */
                 user,
-@@ -1525,6 +1525,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1509,6 +1510,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
      {
-       is_in_netgroup =  JS_TRUE;
+       is_in_netgroup =  true;
      }
 +#endif
  
    JS_free (cx, netgroup);
    JS_free (cx, user);
-@@ -1536,8 +1537,6 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
-   return ret;
- }
- 
--
--
- /* ---------------------------------------------------------------------------------------------------- */
- 
- typedef struct
 -- 
-2.7.0
+2.7.4
 
diff --git a/meta-oe/recipes-extended/polkit/polkit/polkit-1_pam.patch b/meta-oe/recipes-extended/polkit/polkit/polkit-1_pam.patch
index 74647ef..c491abf 100644
--- a/meta-oe/recipes-extended/polkit/polkit/polkit-1_pam.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/polkit-1_pam.patch
@@ -4,9 +4,18 @@ Upstream-Status:Inappropriate [configuration]
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
---- a/configure.ac	2011-03-04 02:26:20.000000000 +0800
-+++ b/configure.ac.new	2011-07-18 10:14:12.516818852 +0800
-@@ -350,10 +350,10 @@
+Upstream-Status: Inappropriate [oe specific]
+Rebase to 0.115
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 36df239..8b3e1b1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -471,10 +471,10 @@ elif test x$with_os_type = xfreebsd -o x$with_os_type = xnetbsd; then
      PAM_FILE_INCLUDE_PASSWORD=system
      PAM_FILE_INCLUDE_SESSION=system
  else
@@ -21,3 +30,6 @@ Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
  fi
  
  AC_SUBST(PAM_FILE_INCLUDE_AUTH)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
deleted file mode 100644
index f34928f..0000000
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "PolicyKit Authorization Framework"
-DESCRIPTION = "The polkit package is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/polkit"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
-                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
-
-DEPENDS = "expat glib-2.0 intltool-native mozjs"
-
-inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection
-
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-                 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
-                    bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
-                "
-
-PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
-PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunitdir=${systemd_unitdir}/system/,--enable-libsystemd-login=no --with-systemdsystemunitdir=,systemd"
-# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
-PACKAGECONFIG[consolekit] = ",,,consolekit"
-
-PAM_SRC_URI = "file://polkit-1_pam.patch"
-SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
-    file://0001-make-netgroup-support-configurable.patch \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-"
-SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
-SRC_URI[sha256sum] = "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
-
-EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages"
-
-do_compile_prepend () {
-    export GIR_EXTRA_LIBS_PATH="${B}/src/polkit/.libs"
-}
-
-PACKAGES =+ "${PN}-examples"
-
-FILES_${PN}_append = " \
-    ${libdir}/${BPN}-1 \
-    ${nonarch_libdir}/${BPN}-1 \
-    ${datadir}/dbus-1 \
-    ${datadir}/${BPN}-1 \
-"
-
-FILES_${PN}-examples = "${bindir}/*example*"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
-
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
new file mode 100644
index 0000000..3ca173e
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -0,0 +1,52 @@
+SUMMARY = "PolicyKit Authorization Framework"
+DESCRIPTION = "The polkit package is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes."
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/polkit"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
+                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
+
+DEPENDS = "expat glib-2.0 intltool-native mozjs"
+
+inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection
+
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
+                    bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
+                "
+
+PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
+PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunitdir=${systemd_unitdir}/system/,--enable-libsystemd-login=no --with-systemdsystemunitdir=,systemd"
+# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
+PACKAGECONFIG[consolekit] = ",,,consolekit"
+
+PAM_SRC_URI = "file://polkit-1_pam.patch"
+SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
+    file://0001-make-netgroup-support-configurable.patch \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+"
+SRC_URI[md5sum] = "f03b055d6ae5fc8eac76838c7d83d082"
+SRC_URI[sha256sum] = "2f87ecdabfbd415c6306673ceadc59846f059b18ef2fce42bac63fe283f12131"
+
+EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages"
+
+do_compile_prepend () {
+    export GIR_EXTRA_LIBS_PATH="${B}/src/polkit/.libs"
+}
+
+PACKAGES =+ "${PN}-examples"
+
+FILES_${PN}_append = " \
+    ${libdir}/${BPN}-1 \
+    ${nonarch_libdir}/${BPN}-1 \
+    ${datadir}/dbus-1 \
+    ${datadir}/${BPN}-1 \
+    ${datadir}/gettext \
+"
+
+FILES_${PN}-examples = "${bindir}/*example*"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.7.4


