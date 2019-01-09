Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8A59279CC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jan 2019 18:19:24 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id n32so9332838qte.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2019 10:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PQWbA1inRX0FZQFvJ8A/kgT5a3sElPWRfqhQcSwoeh4=;
	b=X1JN9CeLDcCqYk8/554Ih8zrSGpEGyaoyQ5OUI1L+hoOsGLl1vZUztIjq8eVlcmTSN
	5s05Zt5xdp4QwTt1ZLlT1p10xwtZk6oH0vvoSH+DwhwinrNT930iyDQhZQQrH9m88o80
	SdB+LOkyUNMyBsQNKGoY9gMotb961uB+3bUhvczywW5r+LSyRgsZntCD7Ta05nMUXCJM
	H2qPkF4MZJsRMJUAWGtlUuOCq7fV92fo9kDvr6AzsDRKeRLcBCkqOfutAC3gNjTCAWus
	gaej05HdnnlQyfp/4ZMZ73OQ6pBMMfCJdukz4J2IXDMj0IBBLkvl2vXjBrkxKSx815AX
	SJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PQWbA1inRX0FZQFvJ8A/kgT5a3sElPWRfqhQcSwoeh4=;
	b=X9txgi0WaM+ra5ab4EVoWYw7yjEjFxRUDVduyRRcgVYit++cT1M26q81j3wHsyjXOD
	+aWQermQINH0k6RnhwL7fpUSe8oaiCw31YcRdQyjrQxm4XvRCHhEr+BxSYoKA2n4wtr5
	znr++jlrRgijEh0NYiJiqiToePd54geqmZVHHJY89K4juivrYxTLGOsCCioKC6KbgG7L
	Ofo3j9cPo1uVyzpSLDmlqJKRB1ckDHpPpYXRVxqXzAFtaotgVf3qgqik9ZG02dfQh/7/
	+F6zC4LFbT09O9gghsW/MNlJatRLPjIppaACt9/0he0L71T0Ep5hhIGVWbRAeNp4mMbC
	nBFQ==
X-Gm-Message-State: AJcUukdrhSN+5kgi+ad1IXvKvRxcvbQXYmAshiHESCTzkAb7+9IEQebv
	CgVmNnEWBesSdk7GmapcMlB/b6Zp7E/Kj5j1IUgExO9prdo=
X-Google-Smtp-Source: ALg8bN4BV0Yk/LgEn+BEtnq3/1+6WdpTYh+wgICB9eNU4bhqRC7TZyTKXErFSMW14BHp0mren6/+XdgHdwpg8n/c60c=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr6733626qte.29.1547057964911; 
	Wed, 09 Jan 2019 10:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20190109061610.34471-1-yongxin.liu@windriver.com>
	<CAMKF1sqOE7M7boiRNyqjtNXJxECv5bZyD2SG9MXNOwet+8ZJdw@mail.gmail.com>
	<597B109EC20B76429F71A8A97770610D129ED63A@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <597B109EC20B76429F71A8A97770610D129ED63A@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2019 10:18:58 -0800
Message-ID: <CAMKF1sqJTnt6R7F83Ta47Kbt3nzyeT5-LYYgyzAm2Q6y0j2Gaw@mail.gmail.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pmdk: fix install error
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
X-List-Received-Date: Wed, 09 Jan 2019 18:19:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 9, 2019 at 2:17 AM Liu, Yongxin <Yongxin.Liu@windriver.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Wednesday, January 9, 2019 18:06
> > To: Liu, Yongxin
> > Cc: openembeded-devel
> > Subject: Re: [oe] [meta-oe][PATCH] pmdk: fix install error
> >
> > On Tue, Jan 8, 2019 at 10:20 PM Yongxin Liu <yongxin.liu@windriver.com>
> > wrote:
> > >
> > > .so files are not generated in usr/local/lib/ but in usr/local/lib64.
> > >
> > > Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ---
> > >  meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-
> > oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > index 3da22a970..af2229f1c 100644
> > > --- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > @@ -43,10 +43,10 @@ do_install() {
> > >         mv ${D}/usr/local/bin/daxio ${D}${bindir}/
> > >
> > >         install -d ${D}${libdir}
> > > -       mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> > > +       mv ${D}/usr/local/lib64/*so* ${D}${libdir}/
> > >
> >
> > I wonder if this should be using /usr/local/${base_libdir} here
>
> Since ${base_libdir} is "/lib64", should we use "/usr/local${base_libdir}" ?
> Or it is fine to go with "/usr/local//lib64" after parsing?

using /usr/local${base_libdir} is fine

>
>
> Thanks,
> Yongxin
>
> > >         install -d ${D}${libdir}/pkgconfig
> > > -       mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> > > +       mv ${D}/usr/local/lib64/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> > >
> > >         install -d ${D}${includedir}
> > >         mv ${D}/usr/local/include/* ${D}${includedir}/
> > > --
> > > 2.14.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

