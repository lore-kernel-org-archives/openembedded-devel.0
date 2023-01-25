Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99803C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:56 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.44970.1674653492937625935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=axNDbNRh;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1631b928691so5024694fac.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yKBNffEUwes97jXhMAflr7O/sy3++vsJc9ncN2yJLw=;
        b=axNDbNRhjwg+tBbDjqPbwsy/MWOc2bI2z9nSwxbZwJb3eRVkwZdVj5jepKvSnzKDiQ
         2iDz0K3e9bjBr4P7eS2oyIBUqqqWAkFytD7BVMloTzed5/cVrCh5wbEkeOqfhQ4nVsbZ
         79RLnklAXqgijoFr0btF05nooIaPhxJQ4haAn63o4ZWstbWwXUbR1oKmc1WpP8QXIiwF
         LoTdI93/rqKKzIo+nOHeFCTmPNEAz3gZr3QKeIoTcDdeqYroinFsow3OtyW4x+OBzdB8
         0AqLX+uPPxkOTCs0c87cYlfmp8Lo+NbJR4zl1MLSuo9i97oT/VnhLgGdqcrp2ZMRR6xn
         lbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yKBNffEUwes97jXhMAflr7O/sy3++vsJc9ncN2yJLw=;
        b=xaDXReBuZ3q8tSRNXpFLeStD47/OB7rKQib43rNRVyKmudY6HTOpSxlMeNtg6u/2VF
         mNnqZOQ2nRR0rRmh37oHHPs3IJZlIHuwC9+J5tXQoRvqAVhBR/S9uyUG9mKgUTvfSBhB
         6KQj000t7HLhqJ1lgcDxuT5Dgo2KlVdGLxnR20BO7qF5tfh1j6f60W6XgzTBzd1JGL4O
         fbcX1kVt2OYJmZ7PqKYMNWuoiQvEcI66XIrv5+fmoX3+Tz7WOm87w63d5qUSJcjMmcUo
         40hZfJHlekrqEL4sSc1IgSOwGLOghDUh03JKrtlpwAvjdwErnldKMytZzRuyfuDKdYWf
         CitA==
X-Gm-Message-State: AFqh2kq41rUuANxeKZMMzm3bzsCEPaLnWyT0IjSyiAnKfC/bu6uIuVJC
	repuUkP9naNgyZHEE31vCP0c+oYMaC0=
X-Google-Smtp-Source: AMrXdXtZjY2X78OSuakcOIqva2eZu5700yOhBlEJLy4wg0I6sVuAIJISkjNHzG58XPcsOoRzrYwPuQ==
X-Received: by 2002:a05:6870:e8c1:b0:15f:ca22:b7f1 with SMTP id r1-20020a056870e8c100b0015fca22b7f1mr9981283oan.12.1674653514553;
        Wed, 25 Jan 2023 05:31:54 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 27/41] zsh: Fix CVE-2021-45444
Date: Wed, 25 Jan 2023 08:31:09 -0500
Message-Id: <065713a78cb8d27f8d822dc4f6c414256de1f1bf.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100762

From: Chee Yang Lee <chee.yang.lee@intel.com>

backport patch from debian

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../zsh/zsh/CVE-2021-45444_1.patch            |  60 ++++++++
 .../zsh/zsh/CVE-2021-45444_2.patch            | 140 ++++++++++++++++++
 .../zsh/zsh/CVE-2021-45444_3.patch            |  77 ++++++++++
 meta-oe/recipes-shells/zsh/zsh_5.8.bb         |   6 +-
 4 files changed, 282 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
 create mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch

diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch b/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
new file mode 100644
index 0000000000..fb8fa3427f
--- /dev/null
+++ b/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
@@ -0,0 +1,60 @@
+Origin: commit c187154f47697cdbf822c2f9d714d570ed4a0fd1
+From: Oliver Kiddle <opk@zsh.org>
+Date: Wed, 15 Dec 2021 01:56:40 +0100
+Subject: [PATCH 1/9] security/41: Don't perform PROMPT_SUBST evaluation on
+ %F/%K arguments
+
+Mitigates CVE-2021-45444
+
+https://salsa.debian.org/debian/zsh/-/raw/debian/5.8-6+deb11u1/debian/patches/cherry-pick-CVE-2021-45444_1.patch?inline=false
+Upstream-Status: Backport
+CVE: CVE-2021-45444
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ ChangeLog    |  5 +++++
+ Src/prompt.c | 10 ++++++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 8d7dfc169..eb248ec06 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,8 @@
++2022-01-27  dana  <dana@dana.is>
++
++	* Oliver Kiddle: security/41: Src/prompt.c: Prevent recursive
++	PROMPT_SUBST
++
+ 2020-02-14  dana  <dana@dana.is>
+ 
+ 	* unposted: Config/version.mk: Update for 5.8
+diff --git a/Src/prompt.c b/Src/prompt.c
+index b65bfb86b..91e21c8e9 100644
+--- a/Src/prompt.c
++++ b/Src/prompt.c
+@@ -244,6 +244,12 @@ parsecolorchar(zattr arg, int is_fg)
+ 	bv->fm += 2; /* skip over F{ */
+ 	if ((ep = strchr(bv->fm, '}'))) {
+ 	    char oc = *ep, *col, *coll;
++	    int ops = opts[PROMPTSUBST], opb = opts[PROMPTBANG];
++	    int opp = opts[PROMPTPERCENT];
++
++	    opts[PROMPTPERCENT] = 1;
++	    opts[PROMPTSUBST] = opts[PROMPTBANG] = 0;
++
+ 	    *ep = '\0';
+ 	    /* expand the contents of the argument so you can use
+ 	     * %v for example */
+@@ -252,6 +258,10 @@ parsecolorchar(zattr arg, int is_fg)
+ 	    arg = match_colour((const char **)&coll, is_fg, 0);
+ 	    free(col);
+ 	    bv->fm = ep;
++
++	    opts[PROMPTSUBST] = ops;
++	    opts[PROMPTBANG] = opb;
++	    opts[PROMPTPERCENT] = opp;
+ 	} else {
+ 	    arg = match_colour((const char **)&bv->fm, is_fg, 0);
+ 	    if (*bv->fm != '}')
+-- 
+2.34.1
diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch b/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
new file mode 100644
index 0000000000..e5b6d7cdc9
--- /dev/null
+++ b/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
@@ -0,0 +1,140 @@
+From 8a4d65ef6d0023ab9b238529410afb433553d2fa Mon Sep 17 00:00:00 2001
+From: Marc Cornellà <hello@mcornella.com>
+Date: Mon, 24 Jan 2022 09:43:28 +0100
+Subject: [PATCH 2/9] security/89: Add patch which can optionally be used to
+ work around CVE-2021-45444 in VCS_Info
+Comment: Updated to use the same file name without blanks as actually
+ used in the final 5.8.1 release.
+
+
+https://salsa.debian.org/debian/zsh/-/blob/debian/5.8-6+deb11u1/debian/patches/cherry-pick-CVE-2021-45444_2.patch
+Upstream-Status: Backport
+CVE: CVE-2021-45444
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ ChangeLog                                    |  5 +
+ Etc/CVE-2021-45444-VCS_Info-workaround.patch | 98 ++++++++++++++++++++
+ 2 files changed, 103 insertions(+)
+ create mode 100644 Etc/CVE-2021-45444-VCS_Info-workaround.patch
+
+diff --git a/ChangeLog b/ChangeLog
+index eb248ec06..9a05a09e1 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,5 +1,10 @@
+ 2022-01-27  dana  <dana@dana.is>
+ 
++	* Marc Cornellà: security/89:
++	Etc/CVE-2021-45444-VCS_Info-workaround.patch: Add patch which
++	can optionally be used to work around recursive PROMPT_SUBST
++	issue in VCS_Info
++
+ 	* Oliver Kiddle: security/41: Src/prompt.c: Prevent recursive
+ 	PROMPT_SUBST
+ 
+diff --git a/Etc/CVE-2021-45444-VCS_Info-workaround.patch b/Etc/CVE-2021-45444-VCS_Info-workaround.patch
+new file mode 100644
+index 000000000..13e54be77
+--- /dev/null
++++ b/Etc/CVE-2021-45444-VCS_Info-workaround.patch
+@@ -0,0 +1,98 @@
++From 972887bbe5eb6a00e5f0e73781d6d73bfdcafb93 Mon Sep 17 00:00:00 2001
++From: =?UTF-8?q?Marc=20Cornell=C3=A0?= <hello@mcornella.com>
++Date: Mon, 24 Jan 2022 09:43:28 +0100
++Subject: [PATCH] security/89: Partially work around CVE-2021-45444 in VCS_Info
++MIME-Version: 1.0
++Content-Type: text/plain; charset=UTF-8
++Content-Transfer-Encoding: 8bit
++
++This patch is a partial, VCS_Info-specific work-around for CVE-2021-45444,
++which is mitigated in the shell itself in 5.8.1 and later versions. It is
++offered for users who are concerned about an exploit but are unable to update
++their binaries to receive the complete fix.
++
++The patch works around the vulnerability by pre-escaping values substituted
++into format strings in VCS_Info. Please note that this may break some user
++configurations that rely on those values being un-escaped (which is why it was
++not included directly in 5.8.1). It may be possible to limit this breakage by
++adjusting exactly which ones are pre-escaped, but of course this may leave
++them vulnerable again.
++
++If applying the patch to the file system is inconvenient or not possible, the
++following script can be used to idempotently patch the relevant function
++running in memory (and thus must be re-run when the shell is restarted):
++
++
++# Impacted versions go from v5.0.3 to v5.8 (v5.8.1 is the first patched version)
++autoload -Uz is-at-least
++if is-at-least 5.8.1 || ! is-at-least 5.0.3; then
++  return
++fi
++
++# Quote necessary $hook_com[<field>] items just before they are used
++# in the line "VCS_INFO_hook 'post-backend'" of the VCS_INFO_formats
++# function, where <field> is:
++#
++#   base:       the full path of the repository's root directory.
++#   base-name:  the name of the repository's root directory.
++#   branch:     the name of the currently checked out branch.
++#   revision:   an identifier of the currently checked out revision.
++#   subdir:     the path of the current directory relative to the
++#               repository's root directory.
++#   misc:       a string that may contain anything the vcs_info backend wants.
++#
++# This patch %-quotes these fields previous to their use in vcs_info hooks and
++# the zformat call and, eventually, when they get expanded in the prompt.
++# It's important to quote these here, and not later after hooks have modified the
++# fields, because then we could be quoting % characters from valid prompt sequences,
++# like %F{color}, %B, etc.
++#
++#  32   │ hook_com[subdir]="$(VCS_INFO_reposub ${hook_com[base]})"
++#  33   │ hook_com[subdir_orig]="${hook_com[subdir]}"
++#  34   │
++#  35 + │ for tmp in base base-name branch misc revision subdir; do
++#  36 + │     hook_com[$tmp]="${hook_com[$tmp]//\%/%%}"
++#  37 + │ done
++#  38 + │
++#  39   │ VCS_INFO_hook 'post-backend'
++#
++# This is especially important so that no command substitution is performed
++# due to malicious input as a consequence of CVE-2021-45444, which affects
++# zsh versions from 5.0.3 to 5.8.
++#
++autoload -Uz +X regexp-replace VCS_INFO_formats
++
++# We use $tmp here because it's already a local variable in VCS_INFO_formats
++typeset PATCH='for tmp (base base-name branch misc revision subdir) hook_com[$tmp]="${hook_com[$tmp]//\%/%%}"'
++# Unique string to avoid reapplying the patch if this code gets called twice
++typeset PATCH_ID=vcs_info-patch-9b9840f2-91e5-4471-af84-9e9a0dc68c1b
++# Only patch the VCS_INFO_formats function if not already patched
++if [[ "$functions[VCS_INFO_formats]" != *$PATCH_ID* ]]; then
++  regexp-replace 'functions[VCS_INFO_formats]' \
++    "VCS_INFO_hook 'post-backend'" \
++    ': ${PATCH_ID}; ${PATCH}; ${MATCH}'
++fi
++unset PATCH PATCH_ID
++
++
++---
++ Functions/VCS_Info/VCS_INFO_formats | 4 ++++
++ 1 file changed, 4 insertions(+)
++
++diff --git a/Functions/VCS_Info/VCS_INFO_formats b/Functions/VCS_Info/VCS_INFO_formats
++index e0e1dc738..4d88e28b6 100644
++--- a/Functions/VCS_Info/VCS_INFO_formats
+++++ b/Functions/VCS_Info/VCS_INFO_formats
++@@ -32,6 +32,10 @@ hook_com[base-name_orig]="${hook_com[base_name]}"
++ hook_com[subdir]="$(VCS_INFO_reposub ${hook_com[base]})"
++ hook_com[subdir_orig]="${hook_com[subdir]}"
++ 
+++for tmp in base base-name branch misc revision subdir; do
+++    hook_com[$tmp]="${hook_com[$tmp]//\%/%%}"
+++done
+++
++ VCS_INFO_hook 'post-backend'
++ 
++ ## description (for backend authors):
++-- 
++2.34.1
+-- 
+2.34.1
diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch b/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
new file mode 100644
index 0000000000..adfc00ae57
--- /dev/null
+++ b/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
@@ -0,0 +1,77 @@
+From 4abf2fc193fc2f3e680deecbf81289a7b02e245b Mon Sep 17 00:00:00 2001
+From: dana <dana@dana.is>
+Date: Tue, 21 Dec 2021 13:13:33 -0600
+Subject: [PATCH 3/9] CVE-2021-45444: Update NEWS/README
+
+https://salsa.debian.org/debian/zsh/-/blob/debian/5.8-6+deb11u1/debian/patches/cherry-pick-CVE-2021-45444_3.patch
+Upstream-Status: Backport
+CVE: CVE-2021-45444
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ ChangeLog |  2 ++
+ NEWS      | 20 ++++++++++++++++++++
+ README    |  6 ++++++
+ 3 files changed, 28 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 9a05a09e1..93b0bc337 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,5 +1,7 @@
+ 2022-01-27  dana  <dana@dana.is>
+ 
++	* CVE-2021-45444: NEWS, README: Document preceding two changes
++
+ 	* Marc Cornellà: security/89:
+ 	Etc/CVE-2021-45444-VCS_Info-workaround.patch: Add patch which
+ 	can optionally be used to work around recursive PROMPT_SUBST
+diff --git a/NEWS b/NEWS
+index 964e1633f..d34b3f79e 100644
+--- a/NEWS
++++ b/NEWS
+@@ -4,6 +4,26 @@ CHANGES FROM PREVIOUS VERSIONS OF ZSH
+ 
+ Note also the list of incompatibilities in the README file.
+ 
++Changes since 5.8
++-----------------
++
++CVE-2021-45444: Some prompt expansion sequences, such as %F, support
++'arguments' which are themselves expanded in case they contain colour
++values, etc. This additional expansion would trigger PROMPT_SUBST
++evaluation, if enabled. This could be abused to execute code the user
++didn't expect. e.g., given a certain prompt configuration, an attacker
++could trick a user into executing arbitrary code by having them check
++out a Git branch with a specially crafted name.
++
++This is fixed in the shell itself by no longer performing PROMPT_SUBST
++evaluation on these prompt-expansion arguments.
++
++Users who are concerned about an exploit but unable to update their
++binaries may apply the partial work-around described in the file
++'Etc/CVE-2021-45444 VCS_Info workaround.patch' included with the shell
++source. [ Reported by RyotaK <security@ryotak.me>. Additional thanks to
++Marc Cornellà <hello@mcornella.com>. ]
++
+ Changes since 5.7.1-test-3
+ --------------------------
+ 
+diff --git a/README b/README
+index 7f1dd5f92..c9e994ab3 100644
+--- a/README
++++ b/README
+@@ -31,6 +31,12 @@ Zsh is a shell with lots of features.  For a list of some of these, see the
+ file FEATURES, and for the latest changes see NEWS.  For more
+ details, see the documentation.
+ 
++Incompatibilities since 5.8
++---------------------------
++
++PROMPT_SUBST expansion is no longer performed on arguments to prompt-
++expansion sequences such as %F.
++
+ Incompatibilities since 5.7.1
+ -----------------------------
+ 
+-- 
+2.34.1
diff --git a/meta-oe/recipes-shells/zsh/zsh_5.8.bb b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
index 0429cb9cc7..b023e8d297 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.8.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
@@ -10,7 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=1a4c4cda3e8096d2fd483ff2f4514fec"
 
 DEPENDS = "ncurses bison-native libcap libpcre gdbm groff-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/5.8/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/5.8/${BP}.tar.xz \
+	file://CVE-2021-45444_1.patch \
+	file://CVE-2021-45444_2.patch \
+	file://CVE-2021-45444_3.patch \
+	"
 SRC_URI[sha256sum] = "dcc4b54cc5565670a65581760261c163d720991f0d06486da61f8d839b52de27"
 
 inherit autotools-brokensep gettext update-alternatives manpages
-- 
2.25.1


