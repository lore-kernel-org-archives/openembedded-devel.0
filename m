Return-Path: <twoerner@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7C89F71A84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 15:08:25 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f8-v6so15515186wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5Q+VVHSvBgBn+wVDVcTvzRfbfmagfumH4OKLEMgzWes=;
	b=Itf4LDkbhFEqnlBpYxLVCLx9L428ianIq/MoD70U4Qn4uek8BSaCaROcBBxl6ElXtK
	guOnN1Q1nXA9MZO9E5bsTayzukNABEdB43OBy1zo91aqPyhXKc4uPcKEXjLIFgSYwQ/u
	9d49FHLdkWaM2UX+AcbSVJvgh7rEntHC/l5vAjdMnue2kxxAgr63Lc8lO0A5S18ilsO9
	/UOwI3HziHQJJyLZihaSu31FClc8hSlueVsffEtQmD4kOOu8jej74v4ICuWb0zsEYUWE
	+2NA6TvMEowhzXiQbg30ZddYGVQ0Zj8elKNwmMgtuwd3NcOzqiGKsg85Bt822vY7jMjC
	1m7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5Q+VVHSvBgBn+wVDVcTvzRfbfmagfumH4OKLEMgzWes=;
	b=DIM7ZKKlFSiKWSb4NOvw2UT7Qee2KlV0oKsQS0UEtxygbfI2tsZPIxe+sz3vXAdEsz
	KLTQOTD7N2tLi/9CexVvxAoyLFIIhKoIFCclHF3xcRuKQ+86masobl2XeXPXZ8a+A864
	TXZ5eC5VX7J9UsX6fxXaZGr04GzTHtc4otXNBatFa163QvIGbQrSviOe1fZb4G1F+sSd
	d7PIjgzyuGHRrePFdKBC6hXs52TPJo5yhdPmXkXJ9zYkPFtIZF8O1OI1SXYD95KRAN0N
	sjgXGU22oPgRrmsyBdJs9+n7u33+G6FkS4YBSa3zrnouFyP9t58EaazW4LuXBY5zUvu8
	ExaQ==
X-Gm-Message-State: ALKqPweSPT+WU1L/rZExHqfnzfV9HDScPQ1xWraQTQHVjFyxzQQmJzRG
	oZKgA5rZwX08c/uHbuBg81iFF1UKzR/iZ9dvSmA=
X-Google-Smtp-Source: AB8JxZodMB5+Hb3N4nFcxdzT8ao00icukZEtAYL/LAw2L8q49NW7GEhWCWDCwHVYgejU8qcmWk3QPKoA6mpUKNZ7Tk0=
X-Received: by 2002:a2e:9248:: with SMTP id
	v8-v6mr2014780ljg.133.1527260905898; 
	Fri, 25 May 2018 08:08:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Fri, 25 May 2018 08:08:25
	-0700 (PDT)
In-Reply-To: <d91e91a8-9196-b2b2-83d3-fcc69a58e3a4@intel.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
	<20180524143854.24096-17-twoerner@gmail.com>
	<d91e91a8-9196-b2b2-83d3-fcc69a58e3a4@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 25 May 2018 11:08:25 -0400
Message-ID: <CAHUNapT-m4v38C3RQqapxtchu_5wkg-zK3sGxc2B=QGHrtoDXw@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master-next][PATCH v3 16/17] opencv: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 25 May 2018 15:08:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 11:19 PM, Anuj Mittal <anuj.mittal@intel.com> wrote:

> On 05/24/2018 10:38 PM, Trevor Woerner wrote:
> > The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
> > ${datadir}/cmake end up in the dev package, so recipes no longer need to
> > provide custom packaging rules to handles these files.
> >
> >       http://git.openembedded.org/openembedded-core/commit/?id=
> d91dc4666683a96e9d03cbbd21b8a546f9069c93
> >
> > Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  meta-oe/recipes-support/opencv/opencv_3.3.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> > index ca62de7c8f..1cadbdb533 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> > @@ -167,7 +167,7 @@ PACKAGES_DYNAMIC += "^libopencv-.*"
> >
> >  FILES_${PN} = ""
> >  FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug/*
> ${datadir}/OpenCV/samples/bin/.debug/*"
> > -FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig
> ${datadir}/OpenCV/*.cmake"
>
> ${datadir}/OpenCV/*.cmake won't be handled by the bbclass and if you
> remove this change, *.cmake files in OpenCV directory will go to
> ${PN}-apps which is probably not the intention here.
>

Good catch, thank you!

