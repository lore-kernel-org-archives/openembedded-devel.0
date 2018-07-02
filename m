Return-Path: <leon.anavi@konsulko.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 447F7787B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 09:23:30 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id k1-v6so7665022plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jul 2018 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zvS5TzmbW+qTnm+VXUM7ZEK3lJz/ZN0hR+m3zGhWbaY=;
	b=hAwSeiJB01hpVxTxP+xbdzQODCCpw3mtWCAtyIh5G+nD5oZgSY/BekdR9f0o9yyZsZ
	O4zzQpONxMuVW7ZfL747pHAupDnprs5zA1UH5piFTmolilZ+3c8yjQaegqsGC+Db85A5
	5g77GoL+8zm/AqBTgOKPoTAfv223pcr53AZ9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=zvS5TzmbW+qTnm+VXUM7ZEK3lJz/ZN0hR+m3zGhWbaY=;
	b=d6cdM96u6ocH4Dj89CBp85fF2WwdYwcCQBrHINUaKnjkJWBaCa6JD2LNtHrogjRvY7
	sTxvwedfNAPVA58i77piHeTWJFk84CyjTVrXAGIxY/ArJ81eh3HO6fZGQ5PA88e2DsbA
	7ZXD56EwDoDVpfn6NKYOgDftcFRduosB9IR0OL8KpKZ6EhNpZABoRyUyF+sWmlqtA7m9
	xZhtmwKGnfuVPDDMzgzQi7HA+8Jz/YDa4igJdFd0ubXoBcm2keo7PyOjtmBJ3NraCIfI
	CB1cm+K3g5wRfivgt8X0slXDgTFcl1MN+/OeEfvlSE6Z7vj82zqyaxdyUHQX7uJQskN0
	BQAg==
X-Gm-Message-State: APt69E0PZZ/DwbUhSaj7tNHb7tcuxpJsHD53UFOx7L3xrN78vIzR33jb
	nihv9kgn/f9WpMaxI6ljJC5qvxOx9g0=
X-Google-Smtp-Source: AAOMgpcVoIwA7DuX9ltQosFGdZpHJ6VTNTkiUn2fcoq56oG+Fn32lEbtUE+M+d8R9lEtms7B+7OZtA==
X-Received: by 2002:a17:902:1a9:: with SMTP id
	b38-v6mr13056073plb.89.1530523411150; 
	Mon, 02 Jul 2018 02:23:31 -0700 (PDT)
Received: from [192.168.4.209] ([78.130.197.109])
	by smtp.gmail.com with ESMTPSA id
	e189-v6sm8249390pfe.52.2018.07.02.02.23.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 02:23:30 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20180701091337.25336-1-leon.anavi@konsulko.com>
	<CAMKF1sowkACQjfoDcLr6a_HHwCbawy=-tmr8gS1M89ov9sJbKQ@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Openpgp: preference=signencrypt
Autocrypt: addr=leon.anavi@konsulko.com; prefer-encrypt=mutual; keydata=
	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
	Z14qQ+tQr2c=
Message-ID: <4b5c338b-c011-a534-10d1-143302874a34@konsulko.com>
Date: Mon, 2 Jul 2018 12:23:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sowkACQjfoDcLr6a_HHwCbawy=-tmr8gS1M89ov9sJbKQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Jul 2018 09:23:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem,

Thank you for the feedback. I will add more details to the git commit
messages and send the patch again.

Thanks,
Leon

On 1.07.2018 20:49, Khem Raj wrote:
> Hi Leon
>
> On Sun, Jul 1, 2018 at 3:07 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>> A few new features have been add and a lot of bugs have been
>> fixed in minor release Vim 8.1.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  .../recipes-support/vim/files/CVE-2017-17087.patch | 70 ----------------------
>>  .../vim/files/disable_acl_header_check.patch       | 27 ---------
>>  .../{vim-tiny_8.0.0983.bb => vim-tiny_8.1.0133.bb} |  0
>>  .../vim/{vim_8.0.0983.bb => vim_8.1.0133.bb}       |  7 +--
>>  4 files changed, 3 insertions(+), 101 deletions(-)
>>  delete mode 100644 meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
>>  delete mode 100644 meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
>>  rename meta-oe/recipes-support/vim/{vim-tiny_8.0.0983.bb => vim-tiny_8.1.0133.bb} (100%)
>>  rename meta-oe/recipes-support/vim/{vim_8.0.0983.bb => vim_8.1.0133.bb} (93%)
>>
>> diff --git a/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch b/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
>> deleted file mode 100644
>> index 937b9ba31..000000000
>> --- a/meta-oe/recipes-support/vim/files/CVE-2017-17087.patch
>> +++ /dev/null
>> @@ -1,70 +0,0 @@
>> -From 9c11f80339372b7aa2f43153d574f2b5abb79708 Mon Sep 17 00:00:00 2001
>> -From: Li Zhou <li.zhou@windriver.com>
>> -Date: Sun, 17 Dec 2017 23:09:35 -0800
>> -Subject: [PATCH] vim: patch 8.0.1263: others can read the swap file if a user
>> - is careless
>> -
>> -Problem:    Others can read the swap file if a user is careless with his
>> -            primary group.
>> -Solution:   If the group permission allows for reading but the world
>> -            permissions doesn't, make sure the group is right.
>> -
>> -Upstream-Status: Backport
>> -CVE: CVE-2017-17087
>> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ----
>> - src/fileio.c  | 24 +++++++++++++++++++++++-
>> - src/version.c |  2 ++
>> - 2 files changed, 25 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/src/fileio.c b/src/fileio.c
>> -index f54fb8465..2c7740af9 100644
>> ---- a/src/fileio.c
>> -+++ b/src/fileio.c
>> -@@ -716,7 +716,29 @@ readfile(
>> -       /* Set swap file protection bits after creating it. */
>> -       if (swap_mode > 0 && curbuf->b_ml.ml_mfp != NULL
>> -                         && curbuf->b_ml.ml_mfp->mf_fname != NULL)
>> --          (void)mch_setperm(curbuf->b_ml.ml_mfp->mf_fname, (long)swap_mode);
>> -+      {
>> -+          char_u *swap_fname = curbuf->b_ml.ml_mfp->mf_fname;
>> -+
>> -+          /*
>> -+           * If the group-read bit is set but not the world-read bit, then
>> -+           * the group must be equal to the group of the original file.  If
>> -+           * we can't make that happen then reset the group-read bit.  This
>> -+           * avoids making the swap file readable to more users when the
>> -+           * primary group of the user is too permissive.
>> -+           */
>> -+          if ((swap_mode & 044) == 040)
>> -+          {
>> -+              stat_T  swap_st;
>> -+
>> -+              if (mch_stat((char *)swap_fname, &swap_st) >= 0
>> -+                      && st.st_gid != swap_st.st_gid
>> -+                      && fchown(curbuf->b_ml.ml_mfp->mf_fd, -1, st.st_gid)
>> -+                                                                       == -1)
>> -+                  swap_mode &= 0600;
>> -+          }
>> -+
>> -+          (void)mch_setperm(swap_fname, (long)swap_mode);
>> -+      }
>> - #endif
>> -     }
>> -
>> -diff --git a/src/version.c b/src/version.c
>> -index a5cb078f0..5c0df475f 100644
>> ---- a/src/version.c
>> -+++ b/src/version.c
>> -@@ -770,6 +770,8 @@ static char *(features[]) =
>> - static int included_patches[] =
>> - {   /* Add new patch number below this line */
>> - /**/
>> -+    1263,
>> -+/**/
>> -     983,
>> - /**/
>> -     982,
>> ---
>> -2.11.0
>> -
>> diff --git a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
>> deleted file mode 100644
>> index 65e5f58c6..000000000
>> --- a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -Upstream-Status: pending
>> -
>> -Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
>> -
>> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> -================================================
>> -diff --git a/src/configure.ac b/src/configure.ac
>> -index fb965e5..d734064 100644
>> ---- a/src/configure.ac
>> -+++ b/src/configure.ac
>> -@@ -2511,7 +2511,7 @@ AC_CHECK_HEADERS(stdarg.h stdint.h stdlib.h string.h \
>> -       sys/systeminfo.h locale.h sys/stream.h termios.h \
>> -       libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
>> -       utime.h sys/param.h libintl.h libgen.h \
>> --      util/debug.h util/msg18n.h frame.h sys/acl.h \
>> -+      util/debug.h util/msg18n.h frame.h \
>> -       sys/access.h sys/sysinfo.h wchar.h wctype.h)
>> -
>> - dnl sys/ptem.h depends on sys/stream.h on Solaris
>> -@@ -3112,6 +3112,7 @@ AC_ARG_ENABLE(acl,
>> -       , [enable_acl="yes"])
>> - if test "$enable_acl" = "yes"; then
>> - AC_MSG_RESULT(no)
>> -+AC_CHECK_HEADERS(sys/acl.h)
>> - AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
>> -       AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
>> -                 AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
>> diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0133.bb
>> similarity index 100%
>> rename from meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb
>> rename to meta-oe/recipes-support/vim/vim-tiny_8.1.0133.bb
>> diff --git a/meta-oe/recipes-support/vim/vim_8.0.0983.bb b/meta-oe/recipes-support/vim/vim_8.1.0133.bb
>> similarity index 93%
>> rename from meta-oe/recipes-support/vim/vim_8.0.0983.bb
>> rename to meta-oe/recipes-support/vim/vim_8.1.0133.bb
>> index 44c868c74..f6b0770d6 100644
>> --- a/meta-oe/recipes-support/vim/vim_8.0.0983.bb
>> +++ b/meta-oe/recipes-support/vim/vim_8.1.0133.bb
>> @@ -4,14 +4,12 @@ DEPENDS = "ncurses gettext-native"
>>  # vimdiff doesn't like busybox diff
>>  RSUGGESTS_${PN} = "diffutils"
>>  LICENSE = "vim"
>> -LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=eea32ac1424bba14096736a494ae9045"
>> +LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
>>
> something changed here. Please describe the change in Commit log.
> Secondly a bit of update on
> reason for dropped patches might be helpful as well.
>
>>  SRC_URI = "git://github.com/vim/vim.git \
>> -           file://disable_acl_header_check.patch;patchdir=.. \
>>             file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
>> -           file://CVE-2017-17087.patch;patchdir=.. \
>>  "
>> -SRCREV = "3f9a1ff141412e9e85f7dff47d02946cb9be9228"
>> +SRCREV = "46577b5e5445c4aaa1e7ae1764373d11dae71663"
>>
>>  S = "${WORKDIR}/git/src"
>>
>> @@ -54,6 +52,7 @@ EXTRA_OECONF = " \
>>      vim_cv_memmove_handles_overlap=yes \
>>      vim_cv_stat_ignores_slash=no \
>>      vim_cv_terminfo=yes \
>> +    vim_cv_tgetent=zero \
> this is a fine change in cross build environent but please describe it
> as well in commit as well.
>
>>      vim_cv_tgent=non-zero \
>>      vim_cv_toupper_broken=no \
>>      vim_cv_tty_group=world \
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Leon Anavi
Software Engineer
konsulko.com


