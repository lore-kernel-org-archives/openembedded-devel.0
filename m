Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69C0060103
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 07:21:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6G7LaQP004174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 00:21:36 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 16 Jul 2018 00:21:35 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Mon, 16 Jul 2018 15:31:42 +0800
Message-ID: <1531726302-21202-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMKF1sqT8iAJnY4r6SkmaK_mANyn09_=afi=1dieu5+nBha9mw@mail.gmail.com>
References: <CAMKF1sqT8iAJnY4r6SkmaK_mANyn09_=afi=1dieu5+nBha9mw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH V2] polkit: 0.113 -> 0.115
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
X-List-Received-Date: Mon, 16 Jul 2018 07:21:37 -0000
Content-Type: text/plain

- Rebase patches to 0.115
  0001-make-netgroup-support-configurable.patch
  polkit-1_pam.patch

- Add --disable-libelogind which OE does not have recipe
  libelogind

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-make-netgroup-support-configurable.patch  | 56 ++++++++--------------
 .../polkit/polkit/polkit-1_pam.patch               | 18 +++++--
 .../polkit/{polkit_0.113.bb => polkit_0.115.bb}    | 10 ++--
 3 files changed, 43 insertions(+), 41 deletions(-)
 rename meta-oe/recipes-extended/polkit/{polkit_0.113.bb => polkit_0.115.bb} (87%)

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
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
similarity index 87%
rename from meta-oe/recipes-extended/polkit/polkit_0.113.bb
rename to meta-oe/recipes-extended/polkit/polkit_0.115.bb
index f34928f..ad0f66a 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -24,10 +24,13 @@ SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
     file://0001-make-netgroup-support-configurable.patch \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
 "
-SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
-SRC_URI[sha256sum] = "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
+SRC_URI[md5sum] = "f03b055d6ae5fc8eac76838c7d83d082"
+SRC_URI[sha256sum] = "2f87ecdabfbd415c6306673ceadc59846f059b18ef2fce42bac63fe283f12131"
 
-EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages"
+EXTRA_OECONF = "--with-os-type=moblin \
+                --disable-man-pages \
+                --disable-libelogind \
+               "
 
 do_compile_prepend () {
     export GIR_EXTRA_LIBS_PATH="${B}/src/polkit/.libs"
@@ -40,6 +43,7 @@ FILES_${PN}_append = " \
     ${nonarch_libdir}/${BPN}-1 \
     ${datadir}/dbus-1 \
     ${datadir}/${BPN}-1 \
+    ${datadir}/gettext \
 "
 
 FILES_${PN}-examples = "${bindir}/*example*"
-- 
2.7.4


