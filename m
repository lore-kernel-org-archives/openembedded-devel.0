Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4B7C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 04:35:13 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.5483.1634618112212285671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LExYuI/T;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id v17so17264085qtp.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gGZxPWItxfU2QWUlevZLYNf8Jdnh0x4Q8Bs+KaOe40w=;
        b=LExYuI/TuF8SqWrKyvOQHcbDvwepqireNqIDCPJ9tBn8j+gnt54xOhwiCI0rfG0QFn
         dsghXpqDgUDq6v3wNOc8WXESHm317CuoqzYvYv9p0MzUW2ckNpgok79DUESJaHn+pfLW
         eBzkX5y+L5+Vq5gMc3oXCdI7VRuO/+oizLvQMD8eqH0rv90BWPjx6aoXvFfpAYGJ/1I7
         V82ZEl4b3fOy69KtN4tDDDlRTyMFrIo+5WA+3ShyRt947S/vgycy1u8Oxl7AabEPrD4J
         3GlwDCH3gKhKeKeL1xU17erRvTqZ5PcMLPKkA7TpBDIoDiHaTy0tJJ7mpcJCGKWXwZkP
         tyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gGZxPWItxfU2QWUlevZLYNf8Jdnh0x4Q8Bs+KaOe40w=;
        b=AGXs3gYO/vqrqjXG15dw1eyuBnAwzF1xLOfyTl8gKBWa7j0XmmS5HADvqWm8fAxGOu
         0pd1j46q1uu8+bj+ftoZ40KtJjVEuoTZWHYJZyU4ucONyzVmTw9gA48Tg+V35jlDgQwQ
         8qtaM4RAxquYB51bDR+iiGCK5H5n8J1bCDp/av7s4bKTdLcrEfMOGpT+H0YY6t1EBW2n
         RHH6SMWt0yyTbCynt8EgVZozZYq2HU/UkgPK0xIDyjD2XXRRobfMTZNtd9bfSljU5yF1
         iB2l2ICWRrM7qYQCXQCha1iwbHe9X0HYNIto2T7Ypt5Mnl9BkYD1Vt63EYs8aWlTFcjG
         amvg==
X-Gm-Message-State: AOAM531dlYL8PVJncW9VoCfrwlXibV2Tqc40HN42vpXqJPwxl92gdVUy
	8D3U48OaDNcEahLSTEYg31ZnlXdq2/XGxJvxdHHsykVRoQmbOA==
X-Google-Smtp-Source: 
 ABdhPJykE0Dr9Ysf5hqWgvqaX01MI8TSvWYygt26W/5stLa2in9lJvhsaKZlHXVJg/ugKzgEAijK9UDf5Tk1kLV1Smk=
X-Received: by 2002:ac8:1e0b:: with SMTP id
 n11mr33495450qtl.274.1634618111327;
 Mon, 18 Oct 2021 21:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211018142247.32594-1-koansoftware@gmail.com>
 <1bfddba8-01e0-1bc7-c6d7-2a1f1ec65f7a@gmail.com>
 <3c6c68b7-f3c2-4259-5400-0e8a804f3fb8@gmail.com>
 <98970f4b-5513-43c3-225d-610e7c9606e3@gmail.com>
In-Reply-To: <98970f4b-5513-43c3-225d-610e7c9606e3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Oct 2021 21:34:45 -0700
Message-ID: 
 <CAMKF1soE15JQtzANqxr1mZuNVJURzBgt514g2QxRuAe34yHm8Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] bluepy_git.bb: Added recipe for
 BluePy - Python interface to Bluetooth LE on Linux
To: Marco Cavallini <koansoftware@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 04:35:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93453

this is failing to build also see

https://errors.yoctoproject.org/Errors/Details/613234/
https://errors.yoctoproject.org/Errors/Details/613235/

On Mon, Oct 18, 2021 at 9:54 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 10/18/21 9:38 AM, Marco wrote:
> > On 18/10/21 17:53, Khem Raj wrote:
> >>
> >>
> >> On 10/18/21 7:22 AM, Marco Cavallini wrote:
> >>> From: Marco Cavallini <m.cavallini@koansoftware.com>
> >>>
> >>> Signed-off-by: Marco Cavallini <koansoftware@gmail.com>
> >>> ---
> >>>   .../recipes-connectivity/bluepy/bluepy_git.bb    | 16 ++++++++++++++++
> >>>   1 file changed, 16 insertions(+)
> >>>   create mode 100644
> >>> meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> >>>
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> >>> b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> >>> new file mode 100644
> >>> index 000000000..651a75254
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> >>> @@ -0,0 +1,16 @@
> >>> +DESCRIPTION = "Python interface to Bluetooth LE on Linux"
> >>> +HOMEPAGE = "https://github.com/IanHarvey/bluepy"
> >>> +SECTION = "devel/python"
> >>> +
> >>> +DEPENDS = "${PYTHON_PN} glib-2.0"
> >>> +RDEPENDS_${PN} = "bluez5"
> >>> +
> >>> +LICENSE = "GPLv2"
> >>
> >> It also has pubic domain licensed code as I see in
> >> https://github.com/IanHarvey/bluepy/blob/master/LICENSE.txt so perhaps
> >> PD would also need to be added here.
> >>
> >
> > Hi Khem,
> > What about replacing with this?
> >
> > LICENSE = "GPLv2 & PD"
> > LIC_FILES_CHKSUM =
> > "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > LIC_FILES_CHKSUM =
> > "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> >
> >
>
> that would work.
>
> >
> >>> +LIC_FILES_CHKSUM =
> >>> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> >>>
> >>> +
> >>> +inherit setuptools3
> >>> +
> >>> +SRC_URI =
> >>> "git://github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09"
> >>>
> >>> +S = "${WORKDIR}/git"
> >>> +
> >>> +TARGET_CC_ARCH += "${LDFLAGS}"
> >>
> >> do we know why this is needed ?
> >> is it ignoring LDFLAGS ?
> >>
> >
> > If I remove it:
> > ERROR: bluepy-git-r0 do_package_qa: QA Issue: File
> > /usr/lib/python3.8/site-packages/bluepy/bluepy-helper in package bluepy
> > doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
> >
> > Thanks
> > --
> > Marco
> >

