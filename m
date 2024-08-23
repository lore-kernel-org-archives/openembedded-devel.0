Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF218C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 05:40:00 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.9874.1724391591541638033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 22:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXcW3Vpx;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5d5c8c1006eso1148416eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 22:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724391591; x=1724996391; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahHDAd9yyqGp4lujzC0Xl2b081oqN1FE3zeNMDOY8gU=;
        b=bXcW3Vpxlq3niMu6tmFuqhu2f3dIYgmgu4Ws8hyj++54ORUxTw7VxlmwkIL7PQCV+V
         Me90hlLi6xwThZ5Nv819TEl/Vj2ORwDRMJPX6pDsb6o16IYytndaDDjxIzRWMfe2djZH
         GX0r7SZ4qlT9II+MPO4O2q7cqrXjTWKT9dGUDqoLqjbXvilGLDAtMyafabuQghFMfgQ4
         9HE2eLxTjz5A46DIbu2H8PbiB5J/nxrO2x7rq1ZKb8QzuMm0nNiMuiuM/CQGVmylHsoE
         iWm5BT86kJOYEx49I35u0Ih3H47xbygD9yix8PcbfWdBsF9QA5OmjGx/WnONDX41jzUX
         8Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724391591; x=1724996391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahHDAd9yyqGp4lujzC0Xl2b081oqN1FE3zeNMDOY8gU=;
        b=Me3kW2M4OlrVpJhNQrieq1qr2jll5jj+bYFP1DXb3MjkS7pq2BoUqLVhtk4+55BY3O
         YrpcveNbOc5y4IaEAQYp441dlxrglVI0HsMLnYZCLHMHqjQnYKNold/N42fl8NLS//NH
         oea5eUSeq0dXc39rSFLQjKt2Z9Z8O6+/sqfbRugFqqw3wtbzJ+2eBCk9porX7BJ2KhmP
         5vbaDDYHfT/7Lm8VUTLSLSTWdIVUOG7Wz/tnrYQje5zaEuNBtGUfvCXBxeIK05bQ64Rs
         0w+OZ2CXJ+eiSWe6vUIpgaQSCuZOn/PidEy6ruP1KTAqLo3RqVgiRFwvf7TemGWJnFcE
         wYkg==
X-Gm-Message-State: AOJu0YzN5pU1OaCnT+jMwU/nV9S/i/93LKUYxHMa41wk1+2wqCOD3yIX
	f9t/xDHpHukuNhaWVj571vn6lnItbxo364vuMthAiigah0eGjiMjDQ7xsf3YEmFDpq4cNLyI2K9
	IPsQojEQMtyeMOck4hVjrWp6zPTA=
X-Google-Smtp-Source: AGHT+IG+dgXM4CZFvg2lYIuOhgFkgaM+Ityu7dFK/P2xBtrSWKX7WHjoXdSfsoW7aHdJknPxLE17Nw0ARsVpu7ScShI=
X-Received: by 2002:a05:6820:62a:b0:5dc:9ac7:25f3 with SMTP id
 006d021491bc7-5dcc6206e99mr1053122eaf.4.1724391590305; Thu, 22 Aug 2024
 22:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <18cbb26e53adb423c71a7f74b130cf1f84ac098d.1724345484.git.joerg.sommer@navimatix.de>
In-Reply-To: <18cbb26e53adb423c71a7f74b130cf1f84ac098d.1724345484.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Aug 2024 22:39:24 -0700
Message-ID: <CAMKF1srsr8SsvXvY59Z0d8zow2igZY-SFhMp+33PN-gPYO+m3w@mail.gmail.com>
Subject: Re: [oe] [PATCH] zsh: update 5.8 -> 5.9
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 05:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111910

runs into build QA issues

ERROR: zsh-5.9-r0 do_package_qa: QA Issue:
/usr/share/zsh/5.9/functions/test-repo-git-rebase-merge contained in
package zsh requires /usr/local/bin/zsh, but no providers found in
RDEPENDS:zsh? [file-rdeps]

Perhaps this testcase needs to change where its expecting z-shell

On Thu, Aug 22, 2024 at 9:51=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> The patches for CVE-2021-45444 were applied upstream on 2022-02-12.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../zsh/zsh/CVE-2021-45444_1.patch            |  60 --------
>  .../zsh/zsh/CVE-2021-45444_2.patch            | 140 ------------------
>  .../zsh/zsh/CVE-2021-45444_3.patch            |  77 ----------
>  .../zsh/{zsh_5.8.bb =3D> zsh_5.9.bb}            |   8 +-
>  4 files changed, 2 insertions(+), 283 deletions(-)
>  delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
>  delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
>  delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
>  rename meta-oe/recipes-shells/zsh/{zsh_5.8.bb =3D> zsh_5.9.bb} (88%)
>
> diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch b/meta=
-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
> deleted file mode 100644
> index fb8fa3427..000000000
> --- a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Origin: commit c187154f47697cdbf822c2f9d714d570ed4a0fd1
> -From: Oliver Kiddle <opk@zsh.org>
> -Date: Wed, 15 Dec 2021 01:56:40 +0100
> -Subject: [PATCH 1/9] security/41: Don't perform PROMPT_SUBST evaluation =
on
> - %F/%K arguments
> -
> -Mitigates CVE-2021-45444
> -
> -https://salsa.debian.org/debian/zsh/-/raw/debian/5.8-6+deb11u1/debian/pa=
tches/cherry-pick-CVE-2021-45444_1.patch?inline=3Dfalse
> -Upstream-Status: Backport
> -CVE: CVE-2021-45444
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ----
> - ChangeLog    |  5 +++++
> - Src/prompt.c | 10 ++++++++++
> - 2 files changed, 15 insertions(+)
> -
> -diff --git a/ChangeLog b/ChangeLog
> -index 8d7dfc169..eb248ec06 100644
> ---- a/ChangeLog
> -+++ b/ChangeLog
> -@@ -1,3 +1,8 @@
> -+2022-01-27  dana  <dana@dana.is>
> -+
> -+      * Oliver Kiddle: security/41: Src/prompt.c: Prevent recursive
> -+      PROMPT_SUBST
> -+
> - 2020-02-14  dana  <dana@dana.is>
> -
> -       * unposted: Config/version.mk: Update for 5.8
> -diff --git a/Src/prompt.c b/Src/prompt.c
> -index b65bfb86b..91e21c8e9 100644
> ---- a/Src/prompt.c
> -+++ b/Src/prompt.c
> -@@ -244,6 +244,12 @@ parsecolorchar(zattr arg, int is_fg)
> -       bv->fm +=3D 2; /* skip over F{ */
> -       if ((ep =3D strchr(bv->fm, '}'))) {
> -           char oc =3D *ep, *col, *coll;
> -+          int ops =3D opts[PROMPTSUBST], opb =3D opts[PROMPTBANG];
> -+          int opp =3D opts[PROMPTPERCENT];
> -+
> -+          opts[PROMPTPERCENT] =3D 1;
> -+          opts[PROMPTSUBST] =3D opts[PROMPTBANG] =3D 0;
> -+
> -           *ep =3D '\0';
> -           /* expand the contents of the argument so you can use
> -            * %v for example */
> -@@ -252,6 +258,10 @@ parsecolorchar(zattr arg, int is_fg)
> -           arg =3D match_colour((const char **)&coll, is_fg, 0);
> -           free(col);
> -           bv->fm =3D ep;
> -+
> -+          opts[PROMPTSUBST] =3D ops;
> -+          opts[PROMPTBANG] =3D opb;
> -+          opts[PROMPTPERCENT] =3D opp;
> -       } else {
> -           arg =3D match_colour((const char **)&bv->fm, is_fg, 0);
> -           if (*bv->fm !=3D '}')
> ---
> -2.34.1
> diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch b/meta=
-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
> deleted file mode 100644
> index e5b6d7cdc..000000000
> --- a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -From 8a4d65ef6d0023ab9b238529410afb433553d2fa Mon Sep 17 00:00:00 2001
> -From: Marc Cornell=C3=A0 <hello@mcornella.com>
> -Date: Mon, 24 Jan 2022 09:43:28 +0100
> -Subject: [PATCH 2/9] security/89: Add patch which can optionally be used=
 to
> - work around CVE-2021-45444 in VCS_Info
> -Comment: Updated to use the same file name without blanks as actually
> - used in the final 5.8.1 release.
> -
> -
> -https://salsa.debian.org/debian/zsh/-/blob/debian/5.8-6+deb11u1/debian/p=
atches/cherry-pick-CVE-2021-45444_2.patch
> -Upstream-Status: Backport
> -CVE: CVE-2021-45444
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ----
> - ChangeLog                                    |  5 +
> - Etc/CVE-2021-45444-VCS_Info-workaround.patch | 98 ++++++++++++++++++++
> - 2 files changed, 103 insertions(+)
> - create mode 100644 Etc/CVE-2021-45444-VCS_Info-workaround.patch
> -
> -diff --git a/ChangeLog b/ChangeLog
> -index eb248ec06..9a05a09e1 100644
> ---- a/ChangeLog
> -+++ b/ChangeLog
> -@@ -1,5 +1,10 @@
> - 2022-01-27  dana  <dana@dana.is>
> -
> -+      * Marc Cornell=C3=A0: security/89:
> -+      Etc/CVE-2021-45444-VCS_Info-workaround.patch: Add patch which
> -+      can optionally be used to work around recursive PROMPT_SUBST
> -+      issue in VCS_Info
> -+
> -       * Oliver Kiddle: security/41: Src/prompt.c: Prevent recursive
> -       PROMPT_SUBST
> -
> -diff --git a/Etc/CVE-2021-45444-VCS_Info-workaround.patch b/Etc/CVE-2021=
-45444-VCS_Info-workaround.patch
> -new file mode 100644
> -index 000000000..13e54be77
> ---- /dev/null
> -+++ b/Etc/CVE-2021-45444-VCS_Info-workaround.patch
> -@@ -0,0 +1,98 @@
> -+From 972887bbe5eb6a00e5f0e73781d6d73bfdcafb93 Mon Sep 17 00:00:00 2001
> -+From: =3D?UTF-8?q?Marc=3D20Cornell=3DC3=3DA0?=3D <hello@mcornella.com>
> -+Date: Mon, 24 Jan 2022 09:43:28 +0100
> -+Subject: [PATCH] security/89: Partially work around CVE-2021-45444 in V=
CS_Info
> -+MIME-Version: 1.0
> -+Content-Type: text/plain; charset=3DUTF-8
> -+Content-Transfer-Encoding: 8bit
> -+
> -+This patch is a partial, VCS_Info-specific work-around for CVE-2021-454=
44,
> -+which is mitigated in the shell itself in 5.8.1 and later versions. It =
is
> -+offered for users who are concerned about an exploit but are unable to =
update
> -+their binaries to receive the complete fix.
> -+
> -+The patch works around the vulnerability by pre-escaping values substit=
uted
> -+into format strings in VCS_Info. Please note that this may break some u=
ser
> -+configurations that rely on those values being un-escaped (which is why=
 it was
> -+not included directly in 5.8.1). It may be possible to limit this break=
age by
> -+adjusting exactly which ones are pre-escaped, but of course this may le=
ave
> -+them vulnerable again.
> -+
> -+If applying the patch to the file system is inconvenient or not possibl=
e, the
> -+following script can be used to idempotently patch the relevant functio=
n
> -+running in memory (and thus must be re-run when the shell is restarted)=
:
> -+
> -+
> -+# Impacted versions go from v5.0.3 to v5.8 (v5.8.1 is the first patched=
 version)
> -+autoload -Uz is-at-least
> -+if is-at-least 5.8.1 || ! is-at-least 5.0.3; then
> -+  return
> -+fi
> -+
> -+# Quote necessary $hook_com[<field>] items just before they are used
> -+# in the line "VCS_INFO_hook 'post-backend'" of the VCS_INFO_formats
> -+# function, where <field> is:
> -+#
> -+#   base:       the full path of the repository's root directory.
> -+#   base-name:  the name of the repository's root directory.
> -+#   branch:     the name of the currently checked out branch.
> -+#   revision:   an identifier of the currently checked out revision.
> -+#   subdir:     the path of the current directory relative to the
> -+#               repository's root directory.
> -+#   misc:       a string that may contain anything the vcs_info backend=
 wants.
> -+#
> -+# This patch %-quotes these fields previous to their use in vcs_info ho=
oks and
> -+# the zformat call and, eventually, when they get expanded in the promp=
t.
> -+# It's important to quote these here, and not later after hooks have mo=
dified the
> -+# fields, because then we could be quoting % characters from valid prom=
pt sequences,
> -+# like %F{color}, %B, etc.
> -+#
> -+#  32   =E2=94=82 hook_com[subdir]=3D"$(VCS_INFO_reposub ${hook_com[bas=
e]})"
> -+#  33   =E2=94=82 hook_com[subdir_orig]=3D"${hook_com[subdir]}"
> -+#  34   =E2=94=82
> -+#  35 + =E2=94=82 for tmp in base base-name branch misc revision subdir=
; do
> -+#  36 + =E2=94=82     hook_com[$tmp]=3D"${hook_com[$tmp]//\%/%%}"
> -+#  37 + =E2=94=82 done
> -+#  38 + =E2=94=82
> -+#  39   =E2=94=82 VCS_INFO_hook 'post-backend'
> -+#
> -+# This is especially important so that no command substitution is perfo=
rmed
> -+# due to malicious input as a consequence of CVE-2021-45444, which affe=
cts
> -+# zsh versions from 5.0.3 to 5.8.
> -+#
> -+autoload -Uz +X regexp-replace VCS_INFO_formats
> -+
> -+# We use $tmp here because it's already a local variable in VCS_INFO_fo=
rmats
> -+typeset PATCH=3D'for tmp (base base-name branch misc revision subdir) h=
ook_com[$tmp]=3D"${hook_com[$tmp]//\%/%%}"'
> -+# Unique string to avoid reapplying the patch if this code gets called =
twice
> -+typeset PATCH_ID=3Dvcs_info-patch-9b9840f2-91e5-4471-af84-9e9a0dc68c1b
> -+# Only patch the VCS_INFO_formats function if not already patched
> -+if [[ "$functions[VCS_INFO_formats]" !=3D *$PATCH_ID* ]]; then
> -+  regexp-replace 'functions[VCS_INFO_formats]' \
> -+    "VCS_INFO_hook 'post-backend'" \
> -+    ': ${PATCH_ID}; ${PATCH}; ${MATCH}'
> -+fi
> -+unset PATCH PATCH_ID
> -+
> -+
> -+---
> -+ Functions/VCS_Info/VCS_INFO_formats | 4 ++++
> -+ 1 file changed, 4 insertions(+)
> -+
> -+diff --git a/Functions/VCS_Info/VCS_INFO_formats b/Functions/VCS_Info/V=
CS_INFO_formats
> -+index e0e1dc738..4d88e28b6 100644
> -+--- a/Functions/VCS_Info/VCS_INFO_formats
> -++++ b/Functions/VCS_Info/VCS_INFO_formats
> -+@@ -32,6 +32,10 @@ hook_com[base-name_orig]=3D"${hook_com[base_name]}"
> -+ hook_com[subdir]=3D"$(VCS_INFO_reposub ${hook_com[base]})"
> -+ hook_com[subdir_orig]=3D"${hook_com[subdir]}"
> -+
> -++for tmp in base base-name branch misc revision subdir; do
> -++    hook_com[$tmp]=3D"${hook_com[$tmp]//\%/%%}"
> -++done
> -++
> -+ VCS_INFO_hook 'post-backend'
> -+
> -+ ## description (for backend authors):
> -+--
> -+2.34.1
> ---
> -2.34.1
> diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch b/meta=
-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
> deleted file mode 100644
> index adfc00ae5..000000000
> --- a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 4abf2fc193fc2f3e680deecbf81289a7b02e245b Mon Sep 17 00:00:00 2001
> -From: dana <dana@dana.is>
> -Date: Tue, 21 Dec 2021 13:13:33 -0600
> -Subject: [PATCH 3/9] CVE-2021-45444: Update NEWS/README
> -
> -https://salsa.debian.org/debian/zsh/-/blob/debian/5.8-6+deb11u1/debian/p=
atches/cherry-pick-CVE-2021-45444_3.patch
> -Upstream-Status: Backport
> -CVE: CVE-2021-45444
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ----
> - ChangeLog |  2 ++
> - NEWS      | 20 ++++++++++++++++++++
> - README    |  6 ++++++
> - 3 files changed, 28 insertions(+)
> -
> -diff --git a/ChangeLog b/ChangeLog
> -index 9a05a09e1..93b0bc337 100644
> ---- a/ChangeLog
> -+++ b/ChangeLog
> -@@ -1,5 +1,7 @@
> - 2022-01-27  dana  <dana@dana.is>
> -
> -+      * CVE-2021-45444: NEWS, README: Document preceding two changes
> -+
> -       * Marc Cornell=C3=A0: security/89:
> -       Etc/CVE-2021-45444-VCS_Info-workaround.patch: Add patch which
> -       can optionally be used to work around recursive PROMPT_SUBST
> -diff --git a/NEWS b/NEWS
> -index 964e1633f..d34b3f79e 100644
> ---- a/NEWS
> -+++ b/NEWS
> -@@ -4,6 +4,26 @@ CHANGES FROM PREVIOUS VERSIONS OF ZSH
> -
> - Note also the list of incompatibilities in the README file.
> -
> -+Changes since 5.8
> -+-----------------
> -+
> -+CVE-2021-45444: Some prompt expansion sequences, such as %F, support
> -+'arguments' which are themselves expanded in case they contain colour
> -+values, etc. This additional expansion would trigger PROMPT_SUBST
> -+evaluation, if enabled. This could be abused to execute code the user
> -+didn't expect. e.g., given a certain prompt configuration, an attacker
> -+could trick a user into executing arbitrary code by having them check
> -+out a Git branch with a specially crafted name.
> -+
> -+This is fixed in the shell itself by no longer performing PROMPT_SUBST
> -+evaluation on these prompt-expansion arguments.
> -+
> -+Users who are concerned about an exploit but unable to update their
> -+binaries may apply the partial work-around described in the file
> -+'Etc/CVE-2021-45444 VCS_Info workaround.patch' included with the shell
> -+source. [ Reported by RyotaK <security@ryotak.me>. Additional thanks to
> -+Marc Cornell=C3=A0 <hello@mcornella.com>. ]
> -+
> - Changes since 5.7.1-test-3
> - --------------------------
> -
> -diff --git a/README b/README
> -index 7f1dd5f92..c9e994ab3 100644
> ---- a/README
> -+++ b/README
> -@@ -31,6 +31,12 @@ Zsh is a shell with lots of features.  For a list of =
some of these, see the
> - file FEATURES, and for the latest changes see NEWS.  For more
> - details, see the documentation.
> -
> -+Incompatibilities since 5.8
> -+---------------------------
> -+
> -+PROMPT_SUBST expansion is no longer performed on arguments to prompt-
> -+expansion sequences such as %F.
> -+
> - Incompatibilities since 5.7.1
> - -----------------------------
> -
> ---
> -2.34.1
> diff --git a/meta-oe/recipes-shells/zsh/zsh_5.8.bb b/meta-oe/recipes-shel=
ls/zsh/zsh_5.9.bb
> similarity index 88%
> rename from meta-oe/recipes-shells/zsh/zsh_5.8.bb
> rename to meta-oe/recipes-shells/zsh/zsh_5.9.bb
> index 7602ff9f6..036a200ca 100644
> --- a/meta-oe/recipes-shells/zsh/zsh_5.8.bb
> +++ b/meta-oe/recipes-shells/zsh/zsh_5.9.bb
> @@ -10,12 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8=
096d2fd483ff2f4514fec"
>
>  DEPENDS =3D "ncurses bison-native libcap libpcre gdbm groff-native"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/5.8/${BP}.tar.x=
z \
> -       file://CVE-2021-45444_1.patch \
> -       file://CVE-2021-45444_2.patch \
> -       file://CVE-2021-45444_3.patch \
> -       "
> -SRC_URI[sha256sum] =3D "dcc4b54cc5565670a65581760261c163d720991f0d06486d=
a61f8d839b52de27"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz"
> +SRC_URI[sha256sum] =3D "9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba1=
0ab863842d45acd5"
>
>  inherit autotools-brokensep gettext update-alternatives manpages
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111905): https://lists.openembedded.org/g/openembedde=
d-devel/message/111905
> Mute This Topic: https://lists.openembedded.org/mt/108041468/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

