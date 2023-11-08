Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BBCC4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 07:11:14 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.8574.1699427474003384901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 23:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CPYBXWXg;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1ef36a04931so3815117fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 23:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699427473; x=1700032273; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9hXsrCSlxQWpgBWox7+hIVNxQmhxaejeskt6AHgPsY=;
        b=CPYBXWXgUYgi+z+iaaLiYPxDW3kykUETBEF/EXEPDxrcDf0oZwOtyau4wQvnJxWJDl
         9idLFR6/N8SvTY+9ZVbRxyNXQVnQbLeyeV2hC+A+8xrFRmdnxG/UPmuRjbyYoFi50E6Q
         jnTIaGR0Pn3Bit3MJImX3lVyWEJDJw+Hf98fvSF1oRGrOb3PD+Y8pLSjvFbamrRwOOG3
         d6DpTDBAtl7wz/oUOkqZqGEtLRkDnK6tJ1DCJEIbUTbUZeKVaYJ+Yovvq83SDXedrPHp
         dczoW7heAxNTibEZ/RhSc3jI45/yw0gznh6mx7kbTwit8fCj1Gcgwd1hpb6Jwc8m4OzF
         F6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699427473; x=1700032273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9hXsrCSlxQWpgBWox7+hIVNxQmhxaejeskt6AHgPsY=;
        b=dVouRB+XqVZuhfPR3InJVBPoUrH2pqWVO3vOLQprR2Id5Ia5XzNrdx6HdofF8UG2/1
         p0Jo92VJoC92vhu//01Nw3PNVhT22zeSwc+rak9iSchwefZcbez5Kk4srbcegABzx7Yu
         b05u5ZPhNDw5/0wX/7DRD+20qOHTP26/eDAUN3rab97HwKXhLts5EyWCR3e4Df76FUnx
         R9fqXPPl37FjuuIcbjxkLIlXCgdL4OHSUOsfykaopgGeF1UjmxKJ0/bVJEBZVtw9YLT8
         rHUfXZci4Nq7DJvjUpbYiMEzteHIHmqrIr7XOkq7xlQjgzOH3cHNgiM47056WabIfKm7
         iVnA==
X-Gm-Message-State: AOJu0YyNl0knrmVr/cBxEXR8/lXfsGwdMRPkYFpyVBUt/JvzXb+Dlo8L
	d64ZbK6+t5y/qVKbNYZCXTSJgWj94+ntfFy6iRsU8j5HYrdDlg==
X-Google-Smtp-Source: AGHT+IEkGcfvVseOzjgSz5MDmQn+U91SSezJYcu1vi0BVoJh+uXRhKjGtQ/d7niH2KIQyqLAKH3ASiV/3GDq+jJN5tM=
X-Received: by 2002:a05:6870:1242:b0:1e9:c252:4853 with SMTP id
 2-20020a056870124200b001e9c2524853mr1019270oao.5.1699427473016; Tue, 07 Nov
 2023 23:11:13 -0800 (PST)
MIME-Version: 1.0
References: <20231107071240.1519631-1-pkj@axis.com> <20231107071240.1519631-12-pkj@axis.com>
In-Reply-To: <20231107071240.1519631-12-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Nov 2023 23:10:47 -0800
Message-ID: <CAMKF1spsaOrfWFLpiOC_1+sVmD1OB9CeiVi+L7f0hYxyTiExYg@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 12/16] xfstests: Update to
 2023.10.29 properly
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 07:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106466

this seems to fail a QA check

ERROR: xfstests-2023.10.29-r0 do_package_qa: QA Issue:
/usr/xfstests/src/soak_duration.awk contained in package xfstests
requires /usr/bin/awk, but no providers found in RDEPENDS:xfstests?
[file-rdeps]
ERROR: xfstests-2023.10.29-r0 do_package_qa: Fatal QA errors were
found, failing task.

On Mon, Nov 6, 2023 at 11:13=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> The "update" in commit 2af7d3f63e added a SRCREV rather than updating
> SRCREV_xfstests. Change the recipe to actually use SRCREV so that it is
> compatible with future AUH updates.
>
> Also replace "/usr" with "${prefix}".
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> I wonder if this recipe really should have been updated to 2023.10.29,
> since that tag is on the "for-next" branch, which I assume means it is
> not released yet. But I cannot find a way to make devtool upgrade only
> look for revisions that are available from a specific branch.
>
>  ...itly-use-int-for-return-type-for-aio.patch | 30 -------------------
>  .../xfstests/xfstests_2023.10.29.bb           | 17 +++++------
>  2 files changed, 7 insertions(+), 40 deletions(-)
>  delete mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001=
-ltp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch
>
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fs=
x.h-Explicitly-use-int-for-return-type-for-aio.patch b/meta-filesystems/rec=
ipes-utils/xfstests/xfstests/0001-ltp-fsx.h-Explicitly-use-int-for-return-t=
ype-for-aio.patch
> deleted file mode 100644
> index 5e9e9d9a7..000000000
> --- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.h-Exp=
licitly-use-int-for-return-type-for-aio.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 0927d0def968ea7e19905c7e39182f65961c11cf Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 5 Nov 2023 01:17:52 -0700
> -Subject: [PATCH] ltp/fsx.h: Explicitly use int for return type for aio_r=
w()
> -
> -Fixes build with clang-17+
> -error: type specifier missing, defaults to 'int'; ISO C99 and later do n=
ot support implicit int [-Wimplicit-int]
> -
> -Upstream-Status: Submitted [https://marc.info/?l=3Dfstests&m=3D169917222=
008646&w=3D2]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - ltp/fsx.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ltp/fsx.c b/ltp/fsx.c
> -index ee4b8fe4..c0aec23f 100644
> ---- a/ltp/fsx.c
> -+++ b/ltp/fsx.c
> -@@ -2581,7 +2581,7 @@ out_error:
> -       return -1;
> - }
> - #else
> --aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
> -+int aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
> - {
> -       fprintf(stderr, "io_rw: need AIO support!\n");
> -       exit(111);
> ---
> -2.42.1
> -
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.=
bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
> index 4e8e31840..be7c2d473 100644
> --- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
> @@ -3,18 +3,15 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3D74274e8a218423e49eef=
dea80bc55038"
>
>  SRCREV =3D "11914614784735c504f43b5b6baabaa713375984"
> -SRCREV_FORMAT =3D "xfstests_unionmount"
> +SRCREV_unionmount =3D "e3825b16b46f4c4574a1a69909944c059835f914"
> +SRCREV_FORMAT =3D "default_unionmount"
>
> -SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dfor-next;name=3Dxfstests \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dfor-next \
>             git://github.com/amir73il/unionmount-testsuite.git;branch=3Dm=
aster;protocol=3Dhttps;name=3Dunionmount;destsuffix=3Dunionmount-testsuite =
\
> -           file://0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-=
aio.patch \
>             file://0002-Drop-detached_mounts_propagation-and-remove-sys-m=
oun.patch \
>             file://0001-add-missing-FTW_-macros-when-not-available-in-lib=
c.patch \
>             "
>
> -SRCREV_xfstests =3D "f7765774a1b5cb98c2f21a892e82b3421f40e791"
> -SRCREV_unionmount =3D "e3825b16b46f4c4574a1a69909944c059835f914"
> -
>  S =3D "${WORKDIR}/git"
>
>  inherit autotools-brokensep useradd
> @@ -53,14 +50,14 @@ do_configure:prepend() {
>  }
>
>  do_install:append() {
> -    unionmount_target_dir=3D${D}/usr/xfstests/unionmount-testsuite
> -    install -d ${D}/usr/xfstests/unionmount-testsuite/tests
> -    install -D ${WORKDIR}/unionmount-testsuite/tests/* -t $unionmount_ta=
rget_dir/tests
> +    unionmount_target_dir=3D${D}${prefix}/xfstests/unionmount-testsuite
> +    install -d $unionmount_target_dir/tests
> +    install ${WORKDIR}/unionmount-testsuite/tests/* $unionmount_target_d=
ir/tests
>      install ${WORKDIR}/unionmount-testsuite/*.py -t $unionmount_target_d=
ir
>      install ${WORKDIR}/unionmount-testsuite/run -t $unionmount_target_di=
r
>      install ${WORKDIR}/unionmount-testsuite/README -t $unionmount_target=
_dir
>  }
>
>  FILES:${PN} +=3D "\
> -    /usr/xfstests \
> +    ${prefix}/xfstests \
>  "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106427): https://lists.openembedded.org/g/openembedde=
d-devel/message/106427
> Mute This Topic: https://lists.openembedded.org/mt/102438671/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

