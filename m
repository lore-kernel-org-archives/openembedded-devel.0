Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0062B731EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 05:03:17 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id o6so32273407qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sbPnr9QaBGVplpWT4MIczSNwkLswfAI3XyhCy6vGGbo=;
	b=XPZPxMgHbausZO1JFzsglqUqyGWQxQW/rqSI6vVGh4jlushNShdOBUA72m0TbTTZY5
	gO5SHGKeMp/okYmncPn4RQRP7ofHQEOeoYJ4D2X6QYKyELQZYNwkwTFRrkh1xm8KUSz9
	2oIVKQZXbe9B5+ev8PMaXXBML078GQKubI7lebohnz2n6tN8fIPjkvRpbq7tF2YPzG6a
	9BL7m+omdRpey2bJICKRx4M2dPGGLeq8fJupmkT+8MqxFHE7CK4DusiSsvrymw2rFS1H
	y1mISu/HLIB9l/W1zMdmwe35XXTSBJp99qtYEojd9HEJVU1KtlrC7Xz55t0xgYOTZvZr
	eowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sbPnr9QaBGVplpWT4MIczSNwkLswfAI3XyhCy6vGGbo=;
	b=Eqq0VjgDGNy74W0MXyC/9KHiFg75Pyj1z99S+hGOLVMzAdqJ9EK/PPk6K0UyutAHYj
	1z8kvLwb3XmjplTAcKkI8lh08mBdsGJyPKwTKTX8UxvZ8noC0WWHVTnFniXZs8H6YhAZ
	7kePUNP0jOJ++7pEUYEmwl4pl9bqMBKf1ZbW2YF2hlUvQBgXaTkuO8QyFIff8DQdmSUB
	5LiPMwiFt/vKIgWngXaWuYxNql4wtXLX3RexNPAn/5rkkMg56Ku9V0qT7sqe1Q0MXTyP
	+UIn3gLRkp93SaJRsxmjGb4tHis7L+fyd/1oAfqGgLSspBCB4IiPLHPcta5EFP3ESFJ0
	tx9Q==
X-Gm-Message-State: ALoCoQlfyYapPZ4k9c8nCHbVIlednzWKSpNn3yJkj/c7f9Oj4ucMdqI3NQtjC5SWzCsmKqpOnXU8Yi9GZYKlVLTpk0fimtCsJg==
X-Received: by 10.55.75.131 with SMTP id y125mr42382836qka.61.1453266197843;
	Tue, 19 Jan 2016 21:03:17 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c2sm13720662qkb.41.2016.01.19.21.03.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 21:03:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2016 05:03:10 +0000
Message-Id: <1453266190-95648-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1453266190-95648-1-git-send-email-raj.khem@gmail.com>
References: <1453266190-95648-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] polkit: Fix build with musl
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
X-List-Received-Date: Wed, 20 Jan 2016 05:03:19 -0000

Make features like netgroup optional, these are not supported by posix
secondly they are poked at during configure so nothing changes for glibc
based systems but it helps compiling with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-make-netgroup-support-configurable.patch  | 107 +++++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_0.113.bb    |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch b/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch
new file mode 100644
index 0000000..4e3af87
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-make-netgroup-support-configurable.patch
@@ -0,0 +1,107 @@
+From 7d5e205aa58a10e7b1ccc2fa75b443508a5c3e18 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Jan 2016 04:31:59 +0000
+Subject: [PATCH] make netgroup support configurable
+
+Disable using innetgr and *netigrent function if not available
+
+These functions are not available on all libc implementations e.g. musl
+doesnt have them.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac                                          | 2 +-
+ src/polkitbackend/polkitbackendinteractiveauthority.c | 6 +++++-
+ src/polkitbackend/polkitbackendjsauthority.c          | 5 ++---
+ 3 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 07982d1..21590b2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -158,7 +158,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
+ 	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
+ AC_SUBST(EXPAT_LIBS)
+ 
+-AC_CHECK_FUNCS(clearenv fdatasync)
++AC_CHECK_FUNCS(clearenv fdatasync getnetgrent innetgr)
+ 
+ if test "x$GCC" = "xyes"; then
+   LDFLAGS="-Wl,--as-needed $LDFLAGS"
+diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
+index 7019356..cf39d77 100644
+--- a/src/polkitbackend/polkitbackendinteractiveauthority.c
++++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
+@@ -2213,7 +2213,7 @@ get_users_in_group (PolkitIdentity                    *group,
+  out:
+   return ret;
+ }
+-
++#if defined HAVE_GETNETGRENT
+ static GList *
+ get_users_in_net_group (PolkitIdentity                    *group,
+                         gboolean                           include_root)
+@@ -2270,6 +2270,8 @@ get_users_in_net_group (PolkitIdentity                    *group,
+   return ret;
+ }
+ 
++#endif
++
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
+ static void
+@@ -2355,10 +2357,12 @@ authentication_agent_initiate_challenge (AuthenticationAgent         *agent,
+         {
+           user_identities = g_list_concat (user_identities, get_users_in_group (identity, FALSE));
+         }
++#if defined HAVE_GETNETGRENT
+       else if (POLKIT_IS_UNIX_NETGROUP (identity))
+         {
+           user_identities =  g_list_concat (user_identities, get_users_in_net_group (identity, FALSE));
+         }
++#endif
+       else
+         {
+           g_warning ("Unsupported identity");
+diff --git a/src/polkitbackend/polkitbackendjsauthority.c b/src/polkitbackend/polkitbackendjsauthority.c
+index 097dcc5..e59b3f7 100644
+--- a/src/polkitbackend/polkitbackendjsauthority.c
++++ b/src/polkitbackend/polkitbackendjsauthority.c
+@@ -1498,7 +1498,6 @@ js_polkit_spawn (JSContext  *cx,
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
+-
+ static JSBool
+ js_polkit_user_is_in_netgroup (JSContext  *cx,
+                                unsigned    argc,
+@@ -1518,6 +1517,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+   user = JS_EncodeString (cx, user_str);
+   netgroup = JS_EncodeString (cx, netgroup_str);
+ 
++#if defined HAVE_INNETGR
+   if (innetgr (netgroup,
+                NULL,  /* host */
+                user,
+@@ -1525,6 +1525,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+     {
+       is_in_netgroup =  JS_TRUE;
+     }
++#endif
+ 
+   JS_free (cx, netgroup);
+   JS_free (cx, user);
+@@ -1536,8 +1537,6 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+   return ret;
+ }
+ 
+-
+-
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
+ typedef struct
+-- 
+2.7.0
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
index b85122e..8a613ef 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
@@ -19,6 +19,7 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
+           file://0001-make-netgroup-support-configurable.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
 "
 SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
-- 
2.7.0


