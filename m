Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63977C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 16:33:16 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.8374.1665419586013270459
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cmuk6Rz7;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id l22so16640349edj.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DW5Q6UVSdE//0uV+RyhSpXUV1zeIi2kRhyUkxicRJJ8=;
        b=cmuk6Rz7C6kr0/KL04GbxkICJ5VcU5k8qkY68qVpSHkijyta+taJyPEFCKLKfe1tq9
         K0QEpmUsknKzrKQVJVPdV9yOys7TXq436YDuE0QhZgMeiIL4yT2ITaeT4ez/VtIvJcSk
         gBJAePOaWJ1T3+a/Xz9KXUCDqubio1qHVcU6V30GLCPOqiqANk2fGNe/fxahG/6skRAF
         ZN1Ycjeq8+To3HVf9BaspJfdgZHto5RT8Sn294XAj37YUsKiLFb4KYxsEKB6cATWhmaQ
         JD2fXGPy1fdqpPSUmbXKr4R3UgW4JIFIQwytr3G39h1XvMmMd9fbQqepfjKV8Yt+xUs2
         2QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DW5Q6UVSdE//0uV+RyhSpXUV1zeIi2kRhyUkxicRJJ8=;
        b=CeHX8tshLUXhhr1himt25STiZcHj73b96a2EWOh2Y7AA1ahRE18+mTcypCU7y/f+Zp
         +OaTY/EBd2o8XHO7h5WHu6OHXigkOpbd+dhJPHqKYkaZUx4NdyWkCKLo9rQVbD3jRCAP
         6PJrNJZsurcnoGrHxzvUJrXe3y5ZlXLEARKh1u1gq4DU0noRUr+oCd1Ps3P3q6Sk33XX
         9o4zd/XFPfcfcWSxustPUxdf6GmsEuvKSSJdAG+j8l1e1Mmp/a4/wUVhOvhevYajHsio
         TODgqa3YNTlH2YaUUinPsdlO2q67Z2dN2AoQSYALD1jBYfAHNQ8mM/QQaYsFG4rKAGLH
         FQsA==
X-Gm-Message-State: ACrzQf367gFCQ3yjvNpXIpzIId1ek5KpgT5AEtRrMbH3T4LgOZRQmoeZ
	kpO4EbEflRsYGXrxS0/dFK2b7kipPHgzA226jGNUDg==
X-Google-Smtp-Source: 
 AMsMyM7ZGgyYSHYf/xBIE1f3RCdfoyauLMJg/6Cnl5rhbDX1treKeserW7NHoc4FU1MFFAgR5stf1Nf+5M4HpRLjwJg=
X-Received: by 2002:a05:6402:f08:b0:459:5f08:1b26 with SMTP id
 i8-20020a0564020f0800b004595f081b26mr18824929eda.190.1665419584397; Mon, 10
 Oct 2022 09:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221010132640.51046-1-vkumbhar@mvista.com>
In-Reply-To: <20221010132640.51046-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 10 Oct 2022 06:32:53 -1000
Message-ID: 
 <CAOSpxdaut=PvGVpfZ4LoehEuPnQy5Sf3mWi6xP2G0qajw_Lp8w@mail.gmail.com>
Subject: Re: [oe] [OE-core][dunfell][PATCH] CVE-2021-20196 QEMU: block: fdc:
 null pointer dereference may lead to guest crash
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 16:33:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99134

You sent this to the wrong list!  You should resend to
openembedded-core@lists.openembedded.org

A more standard subject/shortlog would be something like:
[OE-core][dunfell][PATCH] qemu: fix CVE-2021-20196

You can give a detailed description in the commit message, so you just
need the top level info in the subject line. And it should always
start with the package/recipe name.

Thanks!

Steve

On Mon, Oct 10, 2022 at 3:30 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
> MR: 111637
> Type: Security Fix
> Disposition: Backport from https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
> ChangeID: c1e435aa25bb60b362bb68ab253ff55504e0328d
> Description:
>     hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>
>     Guest might select another drive on the bus by setting the
>     DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
>     The current controller model doesn't expect a BlockBackend
>     to be NULL. A simple way to fix CVE-2021-20196 is to create
>     an empty BlockBackend when it is missing. All further
>     accesses will be safely handled, and the controller state
>     machines keep behaving correctly.
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/0001-CVE-2021-20196.patch       | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 7a963ad57c..2cdb718b1f 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -52,6 +52,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>            file://CVE-2019-20175.patch \
>            file://CVE-2020-24352.patch \
>            file://CVE-2020-25723.patch \
> +          file://0001-CVE-2021-20196.patch \
>            "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch
> new file mode 100644
> index 0000000000..affc8ead58
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch
> @@ -0,0 +1,40 @@
> +From a253e632aea9e0e3f3f2ad3d157f34908e9c2008 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Mon, 10 Oct 2022 10:00:53 +0530
> +Subject: [PATCH] CVE-2021-20196
> +
> +Upstream-Status: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
> +CVE: CVE-2021-20196
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + hw/block/fdc.c | 14 +++++++++++++-
> + 1 file changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> +index ac5d31e8..a887369c 100644
> +--- a/hw/block/fdc.c
> ++++ b/hw/block/fdc.c
> +@@ -1356,7 +1356,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
> +
> + static FDrive *get_cur_drv(FDCtrl *fdctrl)
> + {
> +-    return get_drv(fdctrl, fdctrl->cur_drv);
> ++    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
> ++
> ++    if (!cur_drv->blk) {
> ++        /*
> ++         * Kludge: empty drive line selected. Create an anonymous
> ++         * BlockBackend to avoid NULL deref with various BlockBackend
> ++         * API calls within this model (CVE-2021-20196).
> ++         * Due to the controller QOM model limitations, we don't
> ++         * attach the created to the controller device.
> ++         */
> ++        cur_drv->blk = blk_create_empty_drive();
> ++    }
> ++    return cur_drv;
> + }
> +
> + /* Status A register : 0x00 (read-only) */
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99128): https://lists.openembedded.org/g/openembedded-devel/message/99128
> Mute This Topic: https://lists.openembedded.org/mt/94236015/3620601
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

