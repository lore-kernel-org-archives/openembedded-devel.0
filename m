Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D14ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 08:25:34 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web09.34786.1661502327208138234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b23oo/KA;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-33dba2693d0so17996497b3.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=u9gnRBnRiaeOcl3Xzn2TY9dzCDGZ4s930IZbFaXRpko=;
        b=b23oo/KAOArLDooRphXO4VEK7yNDSkzM3lWJ+YSkeUjjjx7pl4bC67HBz8P+ZZAyHU
         UtReLgu1ZI+i4UnQQ9g/2BkOAqKQLCduUnmvw/GClTZ0YhGcsZ1B15CVLaoOprYQbF3E
         s40W/vpPYdcgo+0hclWtQsUgDz/WlAZEQZzGg6bOoW2l6H3EVtdVFWJ9hCnRnsH6pCXu
         85f9ko69C6BQT5lp/Clphg6o1o9jJVd3otOlIwfSkT43uQV4VE1xFNDCQ6DQuCZmIH8A
         LZNd5m7Q4nFZ1rNKGCHss2SXx7Z+tDFQ1ZpELvIDXvWZ+fsT74LUwWDBl7zTD9S6vVDR
         xKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=u9gnRBnRiaeOcl3Xzn2TY9dzCDGZ4s930IZbFaXRpko=;
        b=AYLUauXQ285lya5yb50eUP9gkcL1Z58SH+c6B3cICyI1Yo34RSf1NSZpeSPXmCoaDF
         7m5ML/j5dqo98dKrzZWQG9kuvhwEJ7Z19CYUe4A3lJPPQDQFxqkDVH4YWGBQQKOvBq8v
         gp+DpelZ+sn225MXzAKZyeGpVI2zGRXKeP2OTwqsKpwyJ0SSgUUGQgQuEVlHHB3kFXi7
         99ZXXEAdbrtXf6yAiITGASObvwbDUrT7auQV9pJBQrHarJZq/lXnidME0YWyC4zdfy3t
         MFb7Dq8U2tBOjmSSwwhsXUYgYAuqDQVD9WmMM7YuReyCVmfscUSDF95W2SDnTYlhLgBS
         mXTQ==
X-Gm-Message-State: ACgBeo1uh84oNEw3nbasGvRJccBZHXdsTmxRxRvP2vKOnU+AquhaafQM
	aCy2bd6bvrGxrJ8cnnXwih42erSb5tvRnQX+X+PeXm5KBX5ZdQ==
X-Google-Smtp-Source: 
 AA6agR5QZdK2VhuQtqkuKNTay6uDI0SEH/5zYrejkjenGBGIZx6HtQJxsArRbM66qMYOjuWXi09wCH197jw11nu3/Fg=
X-Received: by 2002:a25:db42:0:b0:695:8d22:3a8e with SMTP id
 g63-20020a25db42000000b006958d223a8emr6375163ybf.428.1661502326254; Fri, 26
 Aug 2022 01:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220826011930.2818670-1-yi.zhao@windriver.com>
 <20220826011930.2818670-3-yi.zhao@windriver.com>
In-Reply-To: <20220826011930.2818670-3-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Aug 2022 01:25:00 -0700
Message-ID: 
 <CAMKF1sooV1+yriJF5OCugP=JdpD9ffm6gC1C6pAfXQDZyecv0w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 3/3] samba: fix buildpaths issue
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 08:25:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98479

On Thu, Aug 25, 2022 at 6:19 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> The test case tfork_cmd_send in smbtorture fails on target as it
> requries a script located in the source directory:
>
> $ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
> test: tfork_cmd_send
> /buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
> Failed to exec child - No such file or directory
>
> This also triggers the buildpaths warning:
> QA Issue: File /usr/bin/smbtorture in package samba-testsuite contains reference to TMPDIR [buildpaths]
>
> Skip this test case in smbtorture to avoid the warning. And also disable
> rpath build.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...orture-skip-test-case-tfork_cmd_send.patch | 38 +++++++++++++++++++
>  .../samba/samba_4.14.14.bb                    |  2 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch b/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
> new file mode 100644
> index 000000000..90ee31786
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
> @@ -0,0 +1,38 @@
> +From 059b517f9ef6cbdc696e0983ce255b1728042827 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 25 Aug 2022 16:46:04 +0800
> +Subject: [PATCH] smbtorture: skip test case tfork_cmd_send
> +
> +The test case tfork_cmd_send fails on target as it requires a script
> +located in the source directory:
> +
> +$ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
> +test: tfork_cmd_send
> +/buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
> +Failed to exec child - No such file or directory
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + lib/util/tests/tfork.c | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/lib/util/tests/tfork.c b/lib/util/tests/tfork.c
> +index 70ae975..4826ce6 100644
> +--- a/lib/util/tests/tfork.c
> ++++ b/lib/util/tests/tfork.c
> +@@ -839,10 +839,6 @@ struct torture_suite *torture_local_tfork(TALLOC_CTX *mem_ctx)
> +                                     "tfork_threads",
> +                                     test_tfork_threads);
> +
> +-      torture_suite_add_simple_test(suite,
> +-                                    "tfork_cmd_send",
> +-                                    test_tfork_cmd_send);
> +-
> +       torture_suite_add_simple_test(suite,
> +                                     "tfork_event_file_handle",
> +                                     test_tfork_event_file_handle);
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
> index cb3678d7b..8877b8e1a 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
> @@ -21,6 +21,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>             file://0004-Add-options-to-configure-the-use-of-libbsd.patch \
>             file://0005-samba-build-dnsserver_common-code.patch \
>             file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
> +           file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
>             "
>
>  SRC_URI:append:libc-musl = " \
> @@ -114,6 +115,7 @@ EXTRA_OECONF += "--enable-fhs \
>                   --with-modulesdir=${libdir}/samba \
>                   --with-lockdir=${localstatedir}/lib/samba \
>                   --with-cachedir=${localstatedir}/lib/samba \
> +                 --disable-rpath \

this means that private libs installed in /usr/lib/samba are not
detected by dependent packages anymore
try to build meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb

It errors like this
https://errors.yoctoproject.org/Errors/Details/669955/

but the real error is a configure test failure

/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/smbnetfs/0.6.3-r0/recipe-sysroot-native/usr/bin/x86_64-yoe-linux-musl/x86_64-yoe-linux-musl-ld:
warning: liblibsmb-samba4.so, needed by
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/smbnetfs/0.6.3-r0/recipe-sysroot/usr/lib/libsmbclient.so,
not found (try using -rpath or -rpath-link)

this library is in usr/lib/samba

>                   --disable-rpath-install \
>                   --with-shared-modules=${SAMBA4_MODULES} \
>                   --bundled-libraries=${SAMBA4_LIBS} \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98439): https://lists.openembedded.org/g/openembedded-devel/message/98439
> Mute This Topic: https://lists.openembedded.org/mt/93261519/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

