Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8856C433EF
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 22:16:59 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.19663.1653776216702750792
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 15:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YxtLytPg;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id i19so1374538qvu.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 15:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+rdkdErIUYoMM8+M8ZoAKSENrs6P+svbVV+P+dspg68=;
        b=YxtLytPgOXN5SuVhy/Fm5HrkA/GbIE/gKACQ4ET+72cCaeHfPqylncnr9VM15iuEP4
         Ke5SF082pmGbYRv5Mv6IU2CBj2gn/NTdTHjMHrXh+sPFa6eD0M3aCAAi9geUUScerddm
         /pwi2LdstoanqAP/C64Uq5hQIWohji8mXZ8WVI+D3xBCA3kNMp+uDDx+FHznEGDj5DDt
         kvwyineXFzAecbDBAEggRZ7JdRrWcIhJ4RuG8ibkhrnVUAHrGcRlRq1vAbH1Myqv9WZq
         e9nVFDmrq8iPcu3h2UuhLPz2bdcpfCjZpV7wT9JAohHONSvbrH6ukd2yw/wA2Trpm6aS
         bYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+rdkdErIUYoMM8+M8ZoAKSENrs6P+svbVV+P+dspg68=;
        b=XGizFup1IcVy9dyMfh4mC5y5TMNh9QYcvOtZ9XX3aE5FF6nikq0b4duYC+2Wjsno+9
         uoZEdX7YFm1mo5xI0z/r6LgK0xFUGwgsgu4B0nZ9RDfyh5zTNFpFSdJ5+E7ayaz0gBqB
         hWm8/Idpzdja3IgJWefq1AHQhkWe/CkDZwZy1Q/VYtGDZtHvxTZGMvSNdbbW65+vBK1z
         WJyX4qFy979nyE7f2CQShmBu1txT8lFzZi/eK0oplCfQ+bJdhgTNoRF1xeoga1aCbgPr
         sGnZLDhu/pSVwJOrKHEAbyQHYOHIgzbRhr76EgZRS1/v/GsocgOyYl3rPvSbKoXDNExj
         e1DQ==
X-Gm-Message-State: AOAM530Mp1dAelh0L/v/68a9r5LYD/gKA+KuTEy88mwSBDzqxwAWq5FH
	5LvyDpWUSjihkkGJLpTeAUen0jtnEAQQdpTVM6w=
X-Google-Smtp-Source: 
 ABdhPJz2DX53riDdXlNIa9A0YsxVQ+79x4F5wlVGWcYsoFeDAnv74iWWKeP3fYpO3srbYMRbL7UFVzZeHKeldCdCvvA=
X-Received: by 2002:ad4:4ee1:0:b0:462:7725:e59a with SMTP id
 dv1-20020ad44ee1000000b004627725e59amr11509191qvb.24.1653776215746; Sat, 28
 May 2022 15:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220528084648.3641611-1-uvv.mail@gmail.com>
In-Reply-To: <20220528084648.3641611-1-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 May 2022 15:16:29 -0700
Message-ID: 
 <CAMKF1spqsYBfFxd107PwcbHnNdzQ82CY3mL4GEdpC6xMOt0iMg@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] xfstests: add new recipe
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 May 2022 22:16:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97313

Please address this warning

stdio: WARNING: xfstests-git-r0 do_package_qa: QA Issue: Recipe
LICENSE includes obsolete licenses GPL-2.0 [obsolete-license]

On Sat, May 28, 2022 at 1:47 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> File system QA test suite
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  .../recipes-utils/xfstests/xfstests_git.bb    | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
>
> diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
> new file mode 100644
> index 000000000..238dbf889
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
> @@ -0,0 +1,61 @@
> +SUMMARY = "File system QA test suite"
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"
> +
> +SRCREV_FORMAT = "xfstests_unionmount"
> +
> +SRC_URI = "\
> +    git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests \
> +    git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
> +"
> +
> +SRCREV_xfstests = "37881397f1aa62df3c63468049c80b301b0e89eb"
> +SRCREV_unionmount = "cec4c51a3bf8ba80bb99fc74b302749d4e3d2f1d"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep useradd
> +
> +DEPENDS += "xfsprogs acl"
> +RDEPENDS:${PN} += "\
> +    bash \
> +    bc \
> +    coreutils \
> +    e2fsprogs \
> +    e2fsprogs-tune2fs \
> +    e2fsprogs-resize2fs \
> +    libcap-bin \
> +    overlayfs-progs \
> +    perl \
> +    python3 \
> +    python3-core \
> +    xfsprogs \
> +    acl \
> +"
> +
> +USERADD_PACKAGES = "${PN}"
> +# these users are necessary to run the tests
> +USERADD_PARAM:${PN} = "-U -m fsgqa; -N 123456-fsgqa; -N fsgqa2"
> +
> +EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
> +
> +# install-sh script in the project is outdated
> +# we use the one from the latest libtool to solve installation issues
> +# It looks like the upstream is not interested in having it fixed :(
> +# https://www.spinics.net/lists/fstests/msg16981.html
> +do_configure:prepend() {
> +    cp ${STAGING_DIR_NATIVE}${datadir}/libtool/build-aux/install-sh ${B}
> +}
> +
> +do_install:append() {
> +    unionmount_target_dir=${D}/usr/xfstests/unionmount-testsuite
> +    install -d ${D}/usr/xfstests/unionmount-testsuite/tests
> +    install -D ${WORKDIR}/unionmount-testsuite/tests/* -t $unionmount_target_dir/tests
> +    install ${WORKDIR}/unionmount-testsuite/*.py -t $unionmount_target_dir
> +    install ${WORKDIR}/unionmount-testsuite/run -t $unionmount_target_dir
> +    install ${WORKDIR}/unionmount-testsuite/README -t $unionmount_target_dir
> +}
> +
> +FILES:${PN} += "\
> +    /usr/xfstests \
> +"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97311): https://lists.openembedded.org/g/openembedded-devel/message/97311
> Mute This Topic: https://lists.openembedded.org/mt/91392360/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

