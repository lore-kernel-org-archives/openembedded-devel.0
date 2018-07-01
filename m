Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9B260079
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Jul 2018 17:50:19 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id r10-v6so8741221uao.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jul 2018 10:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/9TmzpAGuF7REHgHt68u0iW4prtGBxYi00nnwucMu7M=;
	b=H1hWUTu9RqSDgU09+2L2k363U7jFx41li+pwzP2N0GQS9lCnId/NN11WacsU5W3ODR
	TN1BC87ZDErXRB7in380N8lB06sdSVaFA59FsRA0lksf1HfxM2e8LCE24ESCc7ZOUUc+
	c/Y8ui+uxFbdojwOGcsGsjIFy/oXxV9hJThzqtKi4xlRgm+OGKZYmvWY80EBwor1mUHK
	TqttPaLlP2TvVOIPywY5DXrQB6vlsriLU89V4GzSJCn6h6m4o0gbpZygn4E2DfnWX0J8
	qaBuJt0jeDGjPxMxPkUVe0kGuPkYBpJbDUlOyCfoj/hssvOwB9k0/bH8d8awZWokglhW
	7NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/9TmzpAGuF7REHgHt68u0iW4prtGBxYi00nnwucMu7M=;
	b=cGu6TUNDAMAUPj7PRknaU7tWtJtE5AJz8v9pFV2fHjiMdpL2B98nXd3pdtKnEDJyBO
	lX1TNPwLeRgpHUtOwRIErkN5hr+Ig/kdco4zohqjPdoFjLJAQI4P47RpkwNvJWz6LCBi
	E1CBhXpP6uXtMVo+BHKAx2bt9yFn8RHHtELlSmoc+1gAzLgWP1Z7mN42XgOQ4HtPPPSl
	4lUeUfjRYiwQ1+iHnwXrpt3T/+Fg7ehxfNe+CQ1VfsBMNQ+MRa5opuivKx6iWmlJMJTz
	rzb6EO5Ea3ADhikX+b8kjkAUuSx4qv2HB7ig9eXcGU4UgHjLisWUj0E6ycufhgcckrJM
	Fxlw==
X-Gm-Message-State: APt69E2MBWcbyWDu3qY37qXB6CyWpZ8bUP21Dt4A5/lBzhZwPUDQshaU
	h2scgYKSLmLWruDwHLIOi8SztDW5v6DhjTVwasE=
X-Google-Smtp-Source: AAOMgpeOJ5SQ1HpJbx0pMoclMkmnfcwzEeGbbd0KBC3N5tJeNzuNvV8efpmE+lfecJqKg+MZbj4NgyGzMD23N5+hmss=
X-Received: by 2002:ab0:11dd:: with SMTP id
	q29-v6mr13943313uac.191.1530467420011; 
	Sun, 01 Jul 2018 10:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180701091337.25336-1-leon.anavi@konsulko.com>
In-Reply-To: <20180701091337.25336-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Jul 2018 10:49:54 -0700
Message-ID: <CAMKF1sowkACQjfoDcLr6a_HHwCbawy=-tmr8gS1M89ov9sJbKQ@mail.gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vim: update to 8.1.0133
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
X-List-Received-Date: Sun, 01 Jul 2018 17:50:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Leon

On Sun, Jul 1, 2018 at 3:07 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> A few new features have been add and a lot of bugs have been
> fixed in minor release Vim 8.1.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../recipes-support/vim/files/CVE-2017-17087.patch | 70 ----------------------
>  .../vim/files/disable_acl_header_check.patch       | 27 ---------
>  .../{vim-tiny_8.0.0983.bb => vim-tiny_8.1.0133.bb} |  0
>  .../vim/{vim_8.0.0983.bb => vim_8.1.0133.bb}       |  7 +--
>  4 files changed, 3 insertions(+), 101 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
>  delete mode 100644 meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
>  rename meta-oe/recipes-support/vim/{vim-tiny_8.0.0983.bb => vim-tiny_8.1.0133.bb} (100%)
>  rename meta-oe/recipes-support/vim/{vim_8.0.0983.bb => vim_8.1.0133.bb} (93%)
>
> diff --git a/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch b/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
> deleted file mode 100644
> index 937b9ba31..000000000
> --- a/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 9c11f80339372b7aa2f43153d574f2b5abb79708 Mon Sep 17 00:00:00 2001
> -From: Li Zhou <li.zhou@windriver.com>
> -Date: Sun, 17 Dec 2017 23:09:35 -0800
> -Subject: [PATCH] vim: patch 8.0.1263: others can read the swap file if a user
> - is careless
> -
> -Problem:    Others can read the swap file if a user is careless with his
> -            primary group.
> -Solution:   If the group permission allows for reading but the world
> -            permissions doesn't, make sure the group is right.
> -
> -Upstream-Status: Backport
> -CVE: CVE-2017-17087
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - src/fileio.c  | 24 +++++++++++++++++++++++-
> - src/version.c |  2 ++
> - 2 files changed, 25 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/fileio.c b/src/fileio.c
> -index f54fb8465..2c7740af9 100644
> ---- a/src/fileio.c
> -+++ b/src/fileio.c
> -@@ -716,7 +716,29 @@ readfile(
> -       /* Set swap file protection bits after creating it. */
> -       if (swap_mode > 0 && curbuf->b_ml.ml_mfp != NULL
> -                         && curbuf->b_ml.ml_mfp->mf_fname != NULL)
> --          (void)mch_setperm(curbuf->b_ml.ml_mfp->mf_fname, (long)swap_mode);
> -+      {
> -+          char_u *swap_fname = curbuf->b_ml.ml_mfp->mf_fname;
> -+
> -+          /*
> -+           * If the group-read bit is set but not the world-read bit, then
> -+           * the group must be equal to the group of the original file.  If
> -+           * we can't make that happen then reset the group-read bit.  This
> -+           * avoids making the swap file readable to more users when the
> -+           * primary group of the user is too permissive.
> -+           */
> -+          if ((swap_mode & 044) == 040)
> -+          {
> -+              stat_T  swap_st;
> -+
> -+              if (mch_stat((char *)swap_fname, &swap_st) >= 0
> -+                      && st.st_gid != swap_st.st_gid
> -+                      && fchown(curbuf->b_ml.ml_mfp->mf_fd, -1, st.st_gid)
> -+                                                                       == -1)
> -+                  swap_mode &= 0600;
> -+          }
> -+
> -+          (void)mch_setperm(swap_fname, (long)swap_mode);
> -+      }
> - #endif
> -     }
> -
> -diff --git a/src/version.c b/src/version.c
> -index a5cb078f0..5c0df475f 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -770,6 +770,8 @@ static char *(features[]) =
> - static int included_patches[] =
> - {   /* Add new patch number below this line */
> - /**/
> -+    1263,
> -+/**/
> -     983,
> - /**/
> -     982,
> ---
> -2.11.0
> -
> diff --git a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
> deleted file mode 100644
> index 65e5f58c6..000000000
> --- a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Upstream-Status: pending
> -
> -Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> -================================================
> -diff --git a/src/configure.ac b/src/configure.ac
> -index fb965e5..d734064 100644
> ---- a/src/configure.ac
> -+++ b/src/configure.ac
> -@@ -2511,7 +2511,7 @@ AC_CHECK_HEADERS(stdarg.h stdint.h stdlib.h string.h \
> -       sys/systeminfo.h locale.h sys/stream.h termios.h \
> -       libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
> -       utime.h sys/param.h libintl.h libgen.h \
> --      util/debug.h util/msg18n.h frame.h sys/acl.h \
> -+      util/debug.h util/msg18n.h frame.h \
> -       sys/access.h sys/sysinfo.h wchar.h wctype.h)
> -
> - dnl sys/ptem.h depends on sys/stream.h on Solaris
> -@@ -3112,6 +3112,7 @@ AC_ARG_ENABLE(acl,
> -       , [enable_acl="yes"])
> - if test "$enable_acl" = "yes"; then
> - AC_MSG_RESULT(no)
> -+AC_CHECK_HEADERS(sys/acl.h)
> - AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
> -       AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
> -                 AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
> diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0133.bb
> similarity index 100%
> rename from meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb
> rename to meta-oe/recipes-support/vim/vim-tiny_8.1.0133.bb
> diff --git a/meta-oe/recipes-support/vim/vim_8.0.0983.bb b/meta-oe/recipes-support/vim/vim_8.1.0133.bb
> similarity index 93%
> rename from meta-oe/recipes-support/vim/vim_8.0.0983.bb
> rename to meta-oe/recipes-support/vim/vim_8.1.0133.bb
> index 44c868c74..f6b0770d6 100644
> --- a/meta-oe/recipes-support/vim/vim_8.0.0983.bb
> +++ b/meta-oe/recipes-support/vim/vim_8.1.0133.bb
> @@ -4,14 +4,12 @@ DEPENDS = "ncurses gettext-native"
>  # vimdiff doesn't like busybox diff
>  RSUGGESTS_${PN} = "diffutils"
>  LICENSE = "vim"
> -LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=eea32ac1424bba14096736a494ae9045"
> +LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
>

something changed here. Please describe the change in Commit log.
Secondly a bit of update on
reason for dropped patches might be helpful as well.

>  SRC_URI = "git://github.com/vim/vim.git \
> -           file://disable_acl_header_check.patch;patchdir=.. \
>             file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
> -           file://CVE-2017-17087.patch;patchdir=.. \
>  "
> -SRCREV = "3f9a1ff141412e9e85f7dff47d02946cb9be9228"
> +SRCREV = "46577b5e5445c4aaa1e7ae1764373d11dae71663"
>
>  S = "${WORKDIR}/git/src"
>
> @@ -54,6 +52,7 @@ EXTRA_OECONF = " \
>      vim_cv_memmove_handles_overlap=yes \
>      vim_cv_stat_ignores_slash=no \
>      vim_cv_terminfo=yes \
> +    vim_cv_tgetent=zero \

this is a fine change in cross build environent but please describe it
as well in commit as well.

>      vim_cv_tgent=non-zero \
>      vim_cv_toupper_broken=no \
>      vim_cv_tty_group=world \
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

