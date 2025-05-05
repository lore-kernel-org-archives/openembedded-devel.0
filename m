Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F3FC3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 19:21:59 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.59513.1746472915992741172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 12:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout03.t-online.de (Postfix) with SMTP id 13CF5119E
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 May 2025 21:21:54 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.236.152]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uC1Nx-233y9B0; Mon, 5 May 2025 21:21:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: add patch to fix gcc-15 issue
Date: Mon,  5 May 2025 21:21:45 +0200
Message-ID: <20250505192145.1573522-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1746472913-F77FD99B-A5332AF6/10/3626336762 SUSPECT URL
X-TOI-MSGID: 5f09b36c-4ca9-4450-8ae0-f83bcec80356
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 19:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117330

Add a backport patch to fix:
libcli/smbreadline/smbreadline.c: In function =E2=80=98smb_readline=E2=80=
=99:
libcli/smbreadline/smbreadline.c:139:17: warning: =E2=80=98CPPFunction=E2=
=80=99 is deprecated [-Wdeprecated-declarations]
  139 |                 rl_attempted_completion_function =3D RL_COMPLETIO=
N_CAST completion_fn;
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
libcli/smbreadline/smbreadline.c:139:50: error: assignment to =E2=80=98ch=
ar ** (*)(const char *, int,  int)=E2=80=99 from incompatible pointer typ=
e =E2=80=98char ** (*)(void)=E2=80=99 [-Wincompatible-pointer-types]
  139 |                 rl_attempted_completion_function =3D RL_COMPLETIO=
N_CAST completion_fn;
      |

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...c43315d83c19514251a11c4fba5a137f2821.patch | 70 +++++++++++++++++++
 .../samba/samba_4.19.8.bb                     |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/9aa5=
c43315d83c19514251a11c4fba5a137f2821.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d=
83c19514251a11c4fba5a137f2821.patch b/meta-networking/recipes-connectivit=
y/samba/samba/9aa5c43315d83c19514251a11c4fba5a137f2821.patch
new file mode 100644
index 0000000000..e07e86e887
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c1951=
4251a11c4fba5a137f2821.patch
@@ -0,0 +1,70 @@
+From 9aa5c43315d83c19514251a11c4fba5a137f2821 Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@samba.org>
+Date: Tue, 21 Jan 2025 17:59:27 +0100
+Subject: [PATCH] lib:replace: Don't use deprecated readline CPPFunction =
cast
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+HAVE_RL_COMPLETION_FUNC_T was unused and not checking for the right
+function.
+
+libcli/smbreadline/smbreadline.c: In function =E2=80=98smb_readline=E2=80=
=99:
+libcli/smbreadline/smbreadline.c:139:17: warning: =E2=80=98CPPFunction=E2=
=80=99 is deprecated [-Wdeprecated-declarations]
+  139 |                 rl_attempted_completion_function =3D RL_COMPLETI=
ON_CAST completion_fn;
+      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+libcli/smbreadline/smbreadline.c:139:50: error: assignment to =E2=80=98c=
har ** (*)(const char *, int,  int)=E2=80=99 from incompatible pointer ty=
pe =E2=80=98char ** (*)(void)=E2=80=99 [-Wincompatible-pointer-types]
+  139 |                 rl_attempted_completion_function =3D RL_COMPLETI=
ON_CAST completion_fn;
+      |                                                  ^
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15788
+
+Signed-off-by: Andreas Schneider <asn@samba.org>
+Reviewed-by: Alexander Bokovoy <ab@samba.org>
+
+Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
+Autobuild-Date(master): Tue Jan 21 19:38:37 UTC 2025 on atb-devel-224
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/9a=
a5c43315d83c19514251a11c4fba5a137f2821]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ lib/replace/system/readline.h        | 4 +++-
+ libcli/smbreadline/wscript_configure | 8 +++++---
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/lib/replace/system/readline.h b/lib/replace/system/readline=
.h
+index 9a9af266ca6d..ac3604fc12e0 100644
+--- a/lib/replace/system/readline.h
++++ b/lib/replace/system/readline.h
+@@ -46,7 +46,9 @@
+ #endif
+=20
+ #ifdef HAVE_NEW_LIBREADLINE
+-#ifdef HAVE_CPPFUNCTION
++#if defined(HAVE_RL_COMPLETION_FUNC_T)
++#  define RL_COMPLETION_CAST (rl_completion_func_t *)
++#elif defined(HAVE_CPPFUNCTION)
+ #  define RL_COMPLETION_CAST (CPPFunction *)
+ #elif defined(HAVE_RL_COMPLETION_T)
+ #  define RL_COMPLETION_CAST (rl_completion_t *)
+diff --git a/libcli/smbreadline/wscript_configure b/libcli/smbreadline/w=
script_configure
+index 912ff53a150d..f5a401ebae00 100644
+--- a/libcli/smbreadline/wscript_configure
++++ b/libcli/smbreadline/wscript_configure
+@@ -51,10 +51,12 @@ conf.CHECK_CODE('''
+ #    endif
+ #  endif
+ #endif
+-int main(void) {rl_completion_t f; return 0;}
++int main(void) {rl_completion_func_t f; return 0;}
+ ''',
+-'HAVE_RL_COMPLETION_FUNC_T', execute=3DFalse, addmain=3DFalse,
+-msg=3D'Checking for rl_completion_t')
++                'HAVE_RL_COMPLETION_FUNC_T',
++                execute=3DFalse,
++                addmain=3DFalse,
++                msg=3D'Checking for rl_completion_func_t')
+=20
+ conf.CHECK_CODE('''
+ #ifdef HAVE_READLINE_READLINE_H
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb b=
/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
index 05dca8d9c0..0ec0051c43 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz =
\
            file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
            file://0007-Deleted-settiong-of-python-to-fix-the-install-con=
fli.patch \
+           file://9aa5c43315d83c19514251a11c4fba5a137f2821.patch \
            "
=20
 SRC_URI:append:libc-musl =3D " \
--=20
2.49.0


