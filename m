Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4FBC636CC
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 20:21:23 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.19701.1676751680623989889
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 12:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qAnKOXzH;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-171a987211aso1791662fac.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 12:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zJG3Wd8ggDwAkyokbZX3ACNFusEjQ8/fodQ8THtaCoc=;
        b=qAnKOXzHh81lCj2ZDQ9RyEti68xxVcy2tUpWJyKvxoxWe7VYE1A7m985MjiR6zSrMN
         VisTzxJ3X/OPFwScA/MWa+/6vTX7NWkVwDGA5AVEut2uucfzM0nz5bfp1oYxxUMRXNwe
         qDXO66Um4ehvHHvRWTsdBzSbATmyVmBcl6Qz/yRR3TfgsLsEzcfApIMndv7mS6c6ubVQ
         ioQqpzMww3A///8xe1nRT2sowBpgsUr+WJ5GQNWciATGoMqC5Fhb/hje6CxLn8NvSKzf
         DKG4iB1va+Y1mqkfZ0zLmHFlp2nJBcBssAk93EzcpPwsnCh6ZJag2pj5LOOa3ZxhGUD6
         xwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJG3Wd8ggDwAkyokbZX3ACNFusEjQ8/fodQ8THtaCoc=;
        b=wwi3ifuLcDoLLlp/xs+fMClvu7hr+rix99l+RSaS0ywePNpOXSnljPNtr49jon4v3u
         SP9RxxRLQfGSALjJOfCVvpPvlrE7UGQrSRUIIaszNFLyUbSmvGJXOZARqPO7z4hr9EAZ
         Z8m8DptZ9+MoqnDTaNTWRkNI0e/suziqJEj9d6L1GIE9NP4MlBIk3wBc0kD6IgjWWNR3
         jxFp37LEllVg5+bQ6YLsDTcox/IWKhQUrGC5iyQLC+ga7SlB9U27nyV1vv3/wrHP3Q0G
         kKnClKZJlVBmA3CLMUxE/ED+BXwciTy9R4NDmGoM+k+fYy4+Wx71PI2ocYkcPVJbhT2u
         M2Fg==
X-Gm-Message-State: AO0yUKUnvfLNPVsIlUPA1v2ZzFmCz6NBb/SSUGID3ZUbRltNhsSaAy8G
	nUtiUfAEqeI7IhXqEvRHF+USYNxATwbfQkDvwidULNjfPkg=
X-Google-Smtp-Source: AK7set/+m7o12JPgh2vW3SfSkOp2owkAqOl943a3s12zu4vmGtFGQW1ohKK6GY3IPmpEexjD5tDXQ7ChpFUAoSGSYwk=
X-Received: by 2002:a05:6870:d1c9:b0:163:767b:82cb with SMTP id
 b9-20020a056870d1c900b00163767b82cbmr697680oac.277.1676751679415; Sat, 18 Feb
 2023 12:21:19 -0800 (PST)
MIME-Version: 1.0
References: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Feb 2023 12:20:53 -0800
Message-ID: <CAMKF1srib_29=6LTxU8CvuweDcF2O7xLU8huLbqfTmbQ2bzBmw@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] libldb: upgrade 2.6.1 -> 2.7.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 20:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101146

this upgrade also needs samba upgrade to 4.18 in lock step. Plesse
submit both upgrades in one go. See

https://errors.yoctoproject.org/Errors/Details/690068/
https://github.com/openembedded/meta-openembedded/commit/a0fb09aa3a69ec695b80f71d689d1ee89378d674#commitcomment-101119598

On Fri, Feb 17, 2023 at 10:38 PM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0002-ldb-Add-configure-options-for-packages.patch
> refreshed for new version.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...b-Add-configure-options-for-packages.patch | 26 ++++++++++---------
>  .../{libldb_2.6.1.bb => libldb_2.7.1.bb}      |  3 +--
>  2 files changed, 15 insertions(+), 14 deletions(-)
>  rename meta-networking/recipes-support/libldb/{libldb_2.6.1.bb => libldb_2.7.1.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
> index 988931c49..7a30bbedf 100644
> --- a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
> +++ b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
> @@ -20,13 +20,16 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
>
>  Rebase to 2.3.0
>  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
> +upgrade to 2.7.1
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>  ---
>   lib/replace/wscript | 90 +++++++++++++++++++++++++++++++++++----------
> - wscript             |  8 ++++
> - 2 files changed, 78 insertions(+), 20 deletions(-)
> + wscript             |  7 ++++
> + 2 files changed, 77 insertions(+), 20 deletions(-)
>
>  diff --git a/lib/replace/wscript b/lib/replace/wscript
> -index 4c774d9..63c9967 100644
> +index 5c2b750..f86f863 100644
>  --- a/lib/replace/wscript
>  +++ b/lib/replace/wscript
>  @@ -25,6 +25,41 @@ def options(opt):
> @@ -71,7 +74,7 @@ index 4c774d9..63c9967 100644
>   @Utils.run_once
>   def configure(conf):
>       conf.RECURSE('buildtools/wafsamba')
> -@@ -35,12 +70,25 @@ def configure(conf):
> +@@ -38,12 +73,25 @@ def configure(conf):
>       conf.DEFINE('HAVE_LIBREPLACE', 1)
>       conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
>
> @@ -98,10 +101,10 @@ index 4c774d9..63c9967 100644
>  +    if Options.options.enable_libcap:
>  +        conf.CHECK_HEADERS('sys/capability.h')
>  +
> -     conf.CHECK_HEADERS('port.h')
>       conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
>       conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
> -@@ -110,8 +158,9 @@ def configure(conf):
> +     conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
> +@@ -113,8 +161,9 @@ def configure(conf):
>       conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
>       conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
>
> @@ -113,7 +116,7 @@ index 4c774d9..63c9967 100644
>       conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
>       conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
>       conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
> -@@ -434,20 +483,21 @@ def configure(conf):
> +@@ -436,20 +485,21 @@ def configure(conf):
>
>       strlcpy_in_bsd = False
>
> @@ -131,7 +134,7 @@ index 4c774d9..63c9967 100644
>  -
>  -    if not conf.CHECK_FUNCS('closefrom'):
>  -        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
> -+    if Options.options.enable_libbsd:
> ++    if Options.options.enable_libbsd:
>  +        # libbsd on some platforms provides strlcpy and strlcat
>  +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
>  +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
> @@ -150,10 +153,10 @@ index 4c774d9..63c9967 100644
>       conf.CHECK_CODE('''
>                   struct ucred cred;
>  diff --git a/wscript b/wscript
> -index 60bb7cf..7f14847 100644
> +index 03076e6..ad40ac9 100644
>  --- a/wscript
>  +++ b/wscript
> -@@ -40,6 +40,14 @@ def options(opt):
> +@@ -40,6 +40,13 @@ def options(opt):
>                      help='disable new LMDB backend for LDB',
>                      action='store_true', dest='without_ldb_lmdb', default=False)
>
> @@ -163,11 +166,10 @@ index 60bb7cf..7f14847 100644
>  +    opt.add_option('--without-valgrind',
>  +                   help=("disable use of valgrind"),
>  +                   action="store_false", dest='enable_valgrind', default=False)
> -+
>  +
>
>   def configure(conf):
>       conf.RECURSE('lib/tdb')
>  --
> -2.25.1
> +2.34.1
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_2.6.1.bb b/meta-networking/recipes-support/libldb/libldb_2.7.1.bb
> similarity index 95%
> rename from meta-networking/recipes-support/libldb/libldb_2.6.1.bb
> rename to meta-networking/recipes-support/libldb/libldb_2.7.1.bb
> index 7c7701acc..473774b14 100644
> --- a/meta-networking/recipes-support/libldb/libldb_2.6.1.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_2.7.1.bb
> @@ -35,8 +35,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>                      file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
>                      file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
>
> -SRC_URI[md5sum] = "3a5f54f511fb237b83e1f34e2c7e25cd"
> -SRC_URI[sha256sum] = "467403f77df86782c3965bb175440baa2ed751a9feb9560194bd8c06bf1736c9"
> +SRC_URI[sha256sum] = "c4632c9a7f81f8a45ed46fc14d18eb507edf4e79f6e88d16977478ef95ed5b7f"
>
>  inherit pkgconfig waf-samba
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101130): https://lists.openembedded.org/g/openembedded-devel/message/101130
> Mute This Topic: https://lists.openembedded.org/mt/97045080/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

