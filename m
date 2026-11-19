Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11493.1795083951357897126
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=DA9oeFnQ;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id 02EABED56
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 11:25:49 +0100 (CET)
Received: from localhost.localdomain ([79.219.238.229]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xTzKu-41P5Cz0; Thu, 19 Nov 2026 11:25:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] emacs: add PACKAGECONFIG for tree-sitter
Date: Thu, 19 Nov 2026 11:25:42 +0100
Message-ID: <20261119102542.104648-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119102542.104648-1-f_l_k@t-online.de>
References: <20261119102542.104648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795083948-3BFFC92B-4C1D73F0/0/0 CLEAN NORMAL
X-TOI-MSGID: 121b498e-3078-49f9-ba6f-b856fd34ce79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795083948; i=f_l_k@t-online.de;
	bh=9DN9dsJPjeyx2mFxfsCkAJfO6M2zLeg7sUSK6OhiSS4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DA9oeFnQ06bCtYL6UUNSydDumI0t/U8N0aYK/+SACA3pppndsD4QFvzppc9Eh0/AM
	 75r0GG7UsLaHfihv3b031a7j0GYirM3H+u+Un9h4uWf4Gr2uCyhsZzzSkcr5651j9h
	 r3/I7LrFfP23euC3hejXV06BkMMQkoONO034KstNmJebd1eMYaQ15LEmQtcb3lD7Mx
	 hF7so/X05ybSsHiexge2t96/aFPSsPvHqQOy4pnA/hnktMUgcM+CWh53hBw1cQUOr6
	 FBh/JO2FMnnX7oNUSBOylozVInU9lIA4N96Abh8Iuelit/LN20eypsRzqy2iLL9t0F
	 0obNpOmDIjbPQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132673
Content-Type: text/plain; charset="utf-8"

Emacs can use libtree-sitter for its tree-sitter based major modes
such as c-ts-mode and python-ts-mode. Add a PACKAGECONFIG for it,
disabled by default.

Emacs 30.2 still calls ts_language_version, which tree-sitter 0.26
removed. Backport the upstream fix that uses ts_language_abi_version
instead (Upstream-Status: Backport).

Tested on intel-corei7-64 with tree-sitter 0.27.2: emacs links
libtree-sitter, treesit-available-p returns t and C code parses with
tree-sitter-c 0.24.1.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/emacs/emacs_30.2.bb   |   6 +-
 ...t-Tree-sitter-version-0.26-and-later.patch | 118 ++++++++++++++++++
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-Support-Tree=
-sitter-version-0.26-and-later.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_30.2.bb b/meta-oe/recipe=
s-support/emacs/emacs_30.2.bb
index 95769aa94c..839036d987 100644
--- a/meta-oe/recipes-support/emacs/emacs_30.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_30.2.bb
@@ -4,7 +4,10 @@ HOMEPAGE =3D "https://www.gnu.org/software/emacs/"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
-SRC_URI =3D "${GNU_MIRROR}/emacs/${BP}.tar.xz"
+SRC_URI =3D " \
+    ${GNU_MIRROR}/emacs/${BP}.tar.xz \
+    file://0001-Support-Tree-sitter-version-0.26-and-later.patch \
+"
 UPSTREAM_CHECK_URI =3D "${GNU_MIRROR}/emacs/"
=20
 SRC_URI:append:class-target =3D " \
@@ -21,6 +24,7 @@ PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes,--with-g=
nutls=3Dno,gnutls"
 PACKAGECONFIG[kerberos] =3D "--with-kerberos=3Dyes,--with-kerberos=3Dno,=
krb5"
 PACKAGECONFIG[libgmp] =3D "--with-libgmp=3Dyes,--with-libgmp=3Dno,gmp"
 PACKAGECONFIG[selinux] =3D "--with-selinux=3Dyes,--with-selinux=3Dno,lib=
selinux"
+PACKAGECONFIG[tree-sitter] =3D "--with-tree-sitter=3Dyes,--with-tree-sit=
ter=3Dno,libtreesitter"
=20
 PACKAGECONFIG ??=3D "gnutls kerberos libgmp"
=20
diff --git a/meta-oe/recipes-support/emacs/files/0001-Support-Tree-sitter=
-version-0.26-and-later.patch b/meta-oe/recipes-support/emacs/files/0001-=
Support-Tree-sitter-version-0.26-and-later.patch
new file mode 100644
index 0000000000..f771e56206
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/0001-Support-Tree-sitter-versio=
n-0.26-and-later.patch
@@ -0,0 +1,118 @@
+From d587ce8c65a0e22ab0a63ef2873a3dfcfbeba166 Mon Sep 17 00:00:00 2001
+From: Eli Zaretskii <eliz@gnu.org>
+Date: Fri, 17 Oct 2025 14:15:41 +0300
+Subject: [PATCH] Support Tree-sitter version 0.26 and later
+
+* src/treesit.c (init_treesit_functions)
+[TREE_SITTER_LANGUAGE_VERSION >=3D 15]: Define prototype for, and
+load 'ts_language_abi_version' instead of the deprecated (and
+removed in tree-sitter 0.26) 'ts_language_version'.
+(ts_language_abi_version) [TREE_SITTER_LANGUAGE_VERSION >=3D 15]:
+Define on WINDOWSNT, instead of 'ts_language_version'.
+(treesit_language_abi_version): New compatibility function.
+(treesit_load_language, Ftreesit_language_abi_version): Use
+'treesit_language_abi_version' instead of 'ts_language_version'.
+(Bug#79627)
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/emacs.git/c=
ommit/?id=3Dd587ce8c65a0e22ab0a63ef2873a3dfcfbeba166]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+The hunk for treesit_load_language was applied by hand, the code around
+it differs in 30.2.
+---
+ src/treesit.c | 36 ++++++++++++++++++++++++++++++++++--
+ 1 file changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/src/treesit.c b/src/treesit.c
+--- a/src/treesit.c
++++ b/src/treesit.c
+@@ -34,7 +34,11 @@
+ # include "w32common.h"
+=20
+ /* In alphabetical order.  */
++#if TREE_SITTER_LANGUAGE_VERSION >=3D 15
++#undef ts_language_abi_version
++#else
+ #undef ts_language_version
++#endif
+ #undef ts_node_child
+ #undef ts_node_child_by_field_name
+ #undef ts_node_child_count
+@@ -89,7 +93,11 @@
+ #undef ts_tree_get_changed_ranges
+ #undef ts_tree_root_node
+=20
++#if TREE_SITTER_LANGUAGE_VERSION >=3D 15
++DEF_DLL_FN (uint32_t, ts_language_abi_version, (const TSLanguage *));
++#else
+ DEF_DLL_FN (uint32_t, ts_language_version, (const TSLanguage *));
++#endif
+ DEF_DLL_FN (TSNode, ts_node_child, (TSNode, uint32_t));
+ DEF_DLL_FN (TSNode, ts_node_child_by_field_name,
+ 	    (TSNode, const char *, uint32_t));
+@@ -166,7 +174,11 @@
+   if (!library)
+     return false;
+=20
++#if TREE_SITTER_LANGUAGE_VERSION >=3D 15
++  LOAD_DLL_FN (library, ts_language_abi_version);
++#else
+   LOAD_DLL_FN (library, ts_language_version);
++#endif
+   LOAD_DLL_FN (library, ts_node_child);
+   LOAD_DLL_FN (library, ts_node_child_by_field_name);
+   LOAD_DLL_FN (library, ts_node_child_count);
+@@ -224,7 +236,11 @@
+   return true;
+ }
+=20
++#if TREE_SITTER_LANGUAGE_VERSION >=3D 15
++#define ts_language_abi_version fn_ts_language_abi_version
++#else
+ #define ts_language_version fn_ts_language_version
++#endif
+ #define ts_node_child fn_ts_node_child
+ #define ts_node_child_by_field_name fn_ts_node_child_by_field_name
+ #define ts_node_child_count fn_ts_node_child_count
+@@ -632,6 +648,22 @@
+     }
+ }
+=20
++/* This function is a compatibility shim.  Tree-sitter 0.25 introduced
++   ts_language_abi_version as a replacement for ts_language_version, an=
d
++   tree-sitter 0.26 removed ts_language_version.  Here we use the fact
++   that 0.25 bumped TREE_SITTER_LANGUAGE_VERSION to 15, to use the new
++   function instead of the old one, when Emacs is compiled against
++   tree-sitter version 0.25 or newer.  */
++static uint32_t
++treesit_language_abi_version (const TSLanguage *ts_lang)
++{
++#if TREE_SITTER_LANGUAGE_VERSION >=3D 15
++  return ts_language_abi_version (ts_lang);
++#else
++  return ts_language_version (ts_lang);
++#endif
++}
++
+ /* Load the dynamic library of LANGUAGE_SYMBOL and return the pointer
+    to the language definition.
+=20
+@@ -746,7 +778,7 @@
+     {
+       *signal_symbol =3D Qtreesit_load_language_error;
+       *signal_data =3D list2 (Qversion_mismatch,
+-			    make_fixnum (ts_language_version (lang)));
++			    make_fixnum (treesit_language_abi_version (lang)));
+       return NULL;
+     }
+   return lang;
+@@ -817,7 +849,7 @@
+ 						       &signal_data);
+       if (ts_language =3D=3D NULL)
+ 	return Qnil;
+-      uint32_t version =3D  ts_language_version (ts_language);
++      uint32_t version =3D  treesit_language_abi_version (ts_language);
+       return make_fixnum((ptrdiff_t) version);
+     }
+ }
--=20
2.56.0

