Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175AEC433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 08:49:35 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.13183.1653727766974099477
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 01:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E0v3jqQ+;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id l30so4881554lfj.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 May 2022 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/Ty5si3XDvqYBzh2lfQKajg0cjjqwCPjzLuJpa/B2JE=;
        b=E0v3jqQ+wFQNq3lvoMIs290kyjj3cEBJlLfvNIB9EswVBOlgflN6ovTtT29B6MY17V
         xUyOE9+LUbVvPVbr2OPwzLMuWg2iX03c3grFtJa8CKeex7CB3V6bvX3b8qzJ8Ye5GNCb
         2rr0Bz1XweAjorxrjqFLxCb/BclmFQeX9vpYIm8BUwY7z0dQ96LmeCzqdx+XFOMYcnvC
         mTUMHSnrCFx53nXIVq8zLmjIv/1NcEyeNKCzakE//I6ziwWBlbfgr2jcR97DdjH3qqbM
         KMGx8Zcwqwa0FtHKVuKYTWLZUDWbcL2QfsopmempgSsFR8DmrMlR0ehrMHX6Od8mBOcL
         fUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/Ty5si3XDvqYBzh2lfQKajg0cjjqwCPjzLuJpa/B2JE=;
        b=wW8L9vkaesg52lVt9yH4hOQCOQVih/QfMt+1VSD0rFJ3Na/UKArcn8fsFc8Yixt1Yu
         iLiwoLScBiD75T3ODJLfp3fSfSc8ZZA66M6TlRx84ogOUlyDw5KEIKyYtXU6GiHDB8X/
         M6k6jeqx5PMRpK+zakZk7Vb67URP3Y9toygmpB3jmpfDxLYhz8g98uuaErMPZIXTCBVd
         HN7mETyz0oyPIaAPn+/O7pcMbVFRHDycCz0++oy5x6BiIROpvWhUdOXrA0L9MbdReY4u
         vla4MkJKPECgsmzevaOpxCV9zVuqsRB8NcWxFY62kXxRYsIe74iWtQg1dOK/QY9Vidhe
         PSSA==
X-Gm-Message-State: AOAM533EntkZYFBzzFpabOKzhj3pIixuYgHgjlcpTF2qtVPdw+a96iv6
	NqVn8hiI0pWj2qmFfYZCUQcaQa/i381hJj01
X-Google-Smtp-Source: 
 ABdhPJzBrwbFDSyK0gVv0/ruU23TjNZFo58BzttP6jueLNe7KqTwzi3p15cgUnIx9xwnaSNW9wnBTg==
X-Received: by 2002:a05:6512:2205:b0:478:53d5:bdb1 with SMTP id
 h5-20020a056512220500b0047853d5bdb1mr28013407lfu.561.1653727764605;
        Sat, 28 May 2022 01:49:24 -0700 (PDT)
Received: from [10.133.219.60] ([185.253.97.11])
        by smtp.gmail.com with ESMTPSA id
 u22-20020a197916000000b0047255d210d6sm1238536lfc.5.2022.05.28.01.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 01:49:24 -0700 (PDT)
Message-ID: <a86d219a-ab40-8bcb-c518-2856f6fda73a@gmail.com>
Date: Sat, 28 May 2022 10:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [oe] [meta-filesystems][PATCH] xfstests: add new recipe
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <16F33883D5579ABC.21867@lists.openembedded.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <16F33883D5579ABC.21867@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 May 2022 08:49:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97312

Requires a recipe from master-next, so should be queued respectively.

Thanks,
Vyacheslav

On 28.05.2022 10:46, Vyacheslav Yurkov via lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> File system QA test suite
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>   .../recipes-utils/xfstests/xfstests_git.bb    | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
>   create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97311): https://lists.openembedded.org/g/openembedded-devel/message/97311
> Mute This Topic: https://lists.openembedded.org/mt/91392360/4455192
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

