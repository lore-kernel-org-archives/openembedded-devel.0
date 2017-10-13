Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9379578211
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 04:03:03 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id q190so3691482vkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 21:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=70GKfKdV0MKCPkUn7NgeRc6YrA8mKPHksZdXGE74um8=;
	b=M3p4+5ZiCeAV2t2/z/tzM28/oyTAJJPZXHnJla0VzpQcM5ZrldqIj59dLesYhKooex
	6PoitM33vSGFYwVsSpiD707K2CeVBAuJd21SSLivbtFYZW0u9xjYFQ/oy2I12Yhv+dPx
	oV/JxI59/xu42C0zl6cHgK9LsMeNwqoMTMN0E0nqQ9Ajl8LKDCRr3tQbGlR9qzFVkpX6
	fuyz5CaXFQfBVj5GCSH7ekAEOna9UmWBcBRGjEufrrqV56WRKR3Bf5YsOq+znXzpnUVk
	FW8e+UBda1sUIuVeCQEhHblGB5r+mcwNrMKNhXpea2182NXJGLgYrPiQ+Pbi3uOGxj2G
	dm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=70GKfKdV0MKCPkUn7NgeRc6YrA8mKPHksZdXGE74um8=;
	b=Dlv9qDvMF/cYEN1561PbbFaboN9OseGUx+Wc88dGzdBFFGjH+wh6e10KDHRg9LWtxE
	LgpygIj9mWgckBoUwyok3XpUtQs02sA9fkG9WoYV/HLDJn91MEmzvpj2amxR8Vvs7/Sb
	kZp+cFElzLsgNdE7Q4+k1OIwZERUqFuHSOJW7NMidVpfu6ZaeFEZAf08BCAF4Gsy0UWz
	CafU71D1q5Cdp2gIspVXcY/gJB2Nq2mXVUuCiz7vtBdNRbB4oneJ/j2x3I2FCRoldt7X
	AqklEXUudSVXbxyMyd3ja0DOsWvwbDENnTtEW7GtDyVf8mpNT9u/rLbZOsFlkwz8c+qW
	YATg==
X-Gm-Message-State: AMCzsaVXh1x+T0w7rSDdDTEsgBqd2bKP0+h/aIkYD4KDdt6W4IKWMm1x
	93stog10LCJ1Rq0dHbhXJ88SkEP1BDzXj39cKw0=
X-Google-Smtp-Source: AOwi7QCspmCgj2mneC+TrLFZFsiNylWs2zs98pJZ97vnIncv3BxkxGwyWYJqc1gntUjttAAIPXh7TAG4T/fl36HJ0pY=
X-Received: by 10.31.49.215 with SMTP id x206mr69150vkx.67.1507867385014; Thu,
	12 Oct 2017 21:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20171003234535.GG16828@denix.org>
	<20171013012110.GM9221@denix.org>
	<20171013034825.ispcwc762ls3ttes@apollo>
In-Reply-To: <20171013034825.ispcwc762ls3ttes@apollo>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 13 Oct 2017 04:02:54 +0000
Message-ID: <CANx9H-CEhtDdjF1SXqgnrKPmbqZhef0-Z9nOUmusmu4feVKf=g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: nativesdk-qtbase 5.9.2 C++11 errors with gcc 6.3?
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
X-List-Received-Date: Fri, 13 Oct 2017 04:03:04 -0000
Content-Type: text/plain; charset="UTF-8"

Or use one of the CROPS docker containers with gcc6
On Thu, Oct 12, 2017 at 8:48 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Oct 13, 2017 at 01:21:10AM +0000, Denys Dmytriyenko wrote:
> > Khem,
> >
> > I tried following on your suggestion to add #include <cmath>, but it is
> > already there in src/corelib/global/qnumeric_p.h
> >
> > Not sure why target qtbase builds fine with oe-core gcc 6.3.0, but
> > nativesdk-qtbase fails with this error... Any more ideas? Thanks.
>
> Do you use uninative ? if not then try with uninative.
> It seems to be mixing headers from your build host and nativesdk sysroot
> there could be several reasons for that. You can also try to build on
> a different distro on host may be one which has gcc6 as host gcc.
>
> >
> > --
> > Denys
> >
> >
> > On Tue, Oct 03, 2017 at 07:45:35PM -0400, Denys Dmytriyenko wrote:
> > > Martin, Khem,
> > >
> > > Have you tried building Qt 5.9 with gcc 6.3 from oe-core? I'm seeing
> bunch of
> > > what seems to be C++11 related errors during do_configure of
> nativesdk-qtbase.
> > > Target qtbase builds fine and switching to gcc 7.2 seems to resolve it
> as well.
> > >
> > > Any ideas or pointers? Thanks!
>
>
> > >
> > >
> > > Errors are like these:
> > >
> > > In file included from
> ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> > >                  from
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> In function 'bool qnumeric_std_wrapper::__builtin_isnan(double)':
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45:
> error: '__builtin_isnan' is not a member of 'std'
> > >  static inline bool isnan(double d) { return std::isnan(d); }
> > >                                              ^~~
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45:
> note: suggested alternatives:
> > > <built-in>: note:   '__builtin_isnan'
> > > In file included from
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/recipe-sysroot/tmp/sdk/sysroots/x86_64-oe-linux/usr/include/c++/6.3.0/cmath:45:0,
> > >                  from
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:56,
> > >                  from
> ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1,
> > >                  from
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:20:
> note:   'qnumeric_std_wrapper::__builtin_isnan'
> > >  static inline bool isnan(double d) { return std::isnan(d); }
> > >                     ^
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> At global scope:
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:105:20:
> error: expected ')' before '(' token
> > >  static inline bool isinf(double d) { return std::isinf(d); }
> > >                     ^
> > > In file included from
> ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> > >                  from
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> In function 'bool qnumeric_std_wrapper::__builtin_isfinite(double)':
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48:
> error: '__builtin_isfinite' is not a member of 'std'
> > >  static inline bool isfinite(double d) { return std::isfinite(d); }
> > >                                                 ^~~
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48:
> note: suggested alternatives:
> > > <built-in>: note:   '__builtin_isfinite'
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

