Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58866C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:46:03 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.6166.1658839554951174173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 05:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=Pb5lOfEw;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.44,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f44.google.com with SMTP id z23so25697846eju.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 05:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2YQHjXqwAYzVKy4I+gG3IDy7A3vVN1Azyk9DOX0ZUjo=;
        b=Pb5lOfEwol+MD9bx1ZjyAcDuJY4a/8DdxS1rL4cjcjMmX2+LBTr6w5j0NGDLC++RF1
         gOHxx9M9b3rmXm+kt1I3h6MjcEJbuckV8TxwIIuF6TZuXhnGGlD2sNPbk/xGNRst0ut0
         IKd3/RTUBDDVYOffMPXwspDbldx+hctssFpMXouVEfJvnKntsTAlSgEPkKRIwYB4gVMs
         o+jHb8QNuxG+c5jL311NRtS3YJzarMdkxeUDusNCCxMGGpvbMMIoDnlH4nscY0Ba04Wd
         wQRskL2VWt/3ooo4JR2PlYr47W8t/DLuEyDgDPJu4guTFOjDRUBfwivtWQVLB/7qpjgq
         6NwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2YQHjXqwAYzVKy4I+gG3IDy7A3vVN1Azyk9DOX0ZUjo=;
        b=VeZQ1etlBy27yYzNs6N4Jde/QBfvYt1yJ3rsnpmebmsfPevhcX00PtocnsZo5WWfbC
         L/QcZqxtjEesyLr0xNl0Ua53/aOZVf5Np2ekoCrPEL9e3s9F/YNHjRbasBhHl93i5Mdw
         CZsRC8Wit+ECOgTY5wzHg2IgGz/zrh3LQRtVG7PfGXIAmu2m2QJt+5pZXyvg/IdRGy0n
         GvOeY9ZMic+wCqv5FP0t6s0C0uuJPg8grfZzBFKqAuRPQvVLsgBaj4FZDLVjVYraRVyt
         nZbgHbGM0fEsNiwfmlhI928rGrVQmARGilwPN1jOcbSGaf6WZVt/SDZei88HWno2GmTU
         003Q==
X-Gm-Message-State: AJIora/uuIkrYGS8ILdTRUEihow9p3FDBWMXG1LVkF4DTXlu1QAzORBt
	/fbh0L/lL2t43V7f3K/MI+pxaTDaqBwoHx/Y4VJzYg==
X-Google-Smtp-Source: 
 AGRyM1vocHmWwiq1si/V4FKU7w77EQ/Sdfaewz/Ppc4oSEIXKLVLYXFw9U8U9aCDkUwtZIeWqx+zAl0F3OD0QJtHv7M=
X-Received: by 2002:a17:907:7d8a:b0:72b:86ef:acf6 with SMTP id
 oz10-20020a1709077d8a00b0072b86efacf6mr14312756ejc.101.1658839553212; Tue, 26
 Jul 2022 05:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220725154744.97466-1-brgl@bgdev.pl> <Yt8PUO7xoVlWTKMc@kudzu.us>
In-Reply-To: <Yt8PUO7xoVlWTKMc@kudzu.us>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Jul 2022 14:45:42 +0200
Message-ID: 
 <CAMRc=MdCyeTqqm15b7az=jm_Fm9sHO6Vg59Qm3Og3cxvEjnSFA@mail.gmail.com>
Subject: Re: [PATCH] zephyr-kernel-src: bump the v3 version to v3.1.0
To: Jon Mason <jdmason@kudzu.us>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>,
	=?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <elizabeth.flanagan@huawei.com>,
	yocto@lists.yoctoproject.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 12:46:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97989

On Mon, Jul 25, 2022 at 11:46 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Jul 25, 2022 at 05:47:44PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
> >
> > This upgrades the 3.x series to using v3.1.0.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
>
> With this patch, I'm seeing:
>
> WARNING: interrupt-3.1.0+gitAUTOINC+2ddd73feaf_5f86244bad-r0 do_patch: Fuzz detected:
> Applying patch 0001-cmake-add-yocto-toolchain.patch
> patching file cmake/compiler/gcc/target.cmake
> Hunk #1 succeeded at 94 with fuzz 1 (offset 26 lines).
> patching file cmake/toolchain/yocto/generic.cmake
> patching file cmake/toolchain/yocto/target.cmake
> The context lines in the patches can be updated with devtool:
>     devtool modify interrupt
>     devtool finish --force-patch-refresh interrupt <layer_path>
>
> And similar errors for all the other tests.  You can see them all at
> https://gitlab.com/jonmason00/meta-zephyr/-/pipelines/596452936
>
> It should be a trival rebase and everything will be happy.  Aside from
> this, it looks like all the tests are passing.
>
> Thanks,
> Jon
>

Actually it required two versions of this patch as we're still supporting v2.7.

Bart

