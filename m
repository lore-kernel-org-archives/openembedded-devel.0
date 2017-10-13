Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id E2B377827A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 22:14:59 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id k70so1194404pgc.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 15:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j0ACq9XLHiHBvI40nLyxANC/B0sbI9LCxvOTlfKq/no=;
	b=kiWBnJb6O4wpZatMOftFZk1ShzRB2uJz6R+V4qhDKPIqGjS7K9DherN8eMJXJoNKdK
	NjWaXoI5gdjdyAcd91QHtRI3m1YKq1X+i+xkui5htD7T7Qj9AvRVm6PA0k9FKLj19v2b
	wHTgxznvUaHqnqubvCjC2XMdF2s241d1ipEAxOIM+23D66bIKSOQ5PdNSDXfoeAiGN0F
	t6OWPT7P3cL3wbEHDRrmfTvhWfE+XYvaBBdfA9bbHX015kTVrOIhUfk5u8pRiqJ/YeKv
	hk7Qoul3VpL0VSuH1KObG0oYPNHVOVcx8mm6MrY4oNcbaS5N9zFQKa19l+Eyl07fpzy0
	JF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j0ACq9XLHiHBvI40nLyxANC/B0sbI9LCxvOTlfKq/no=;
	b=aP+5qlSYEHlPRVJAreyII3zXnefT8Ow1e97e2ooRSF8Uz/efez/MRd8oY+qYsp32kT
	XFy8gAp2vdrGLn0o+LbCdf9QALIKWWVcmowJRNGqKXsKef3vkVDE6QUAZ1m9B5Ccco1l
	wFBp6eP1nlndm64FaSxS1WB5VuvF982XZgQMeRRJsBUvyvFcdeTPQ7+72yexUXP7ovrD
	ZYL3PcnPcZyNLu8QhBiMXeszbCMBDHAthV1+Jkq14bjKAk0ZL3Vxv1gvo1TZi5B6kj+j
	nWVotLJzjrOvcPK5XS7CZQJNKMG88DgZPLHluuXPieu67ZO9ZpQoqWJtzpKbJi1jyQgd
	XTOw==
X-Gm-Message-State: AMCzsaWSPEAx/BIYuWH4HKukKFc04w7HXSxn26XCRyPxQcyf0715I+4s
	0fzSWlCn9ztPYbrAN+2zpx1SrrSeHPYtGP5xn3M=
X-Google-Smtp-Source: AOwi7QBbzW9/cmUMlKNfXC+a21OQwwLeBrM6aqpfPnw2h2H7urPbA2bmdaWjx0OnelGNzvWnBpVPHQxht47j6ntxqKw=
X-Received: by 10.99.152.17 with SMTP id q17mr2346250pgd.287.1507932900954;
	Fri, 13 Oct 2017 15:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20171003234535.GG16828@denix.org>
	<20171013012110.GM9221@denix.org>
	<20171013034825.ispcwc762ls3ttes@apollo>
	<20171013173519.GO9221@denix.org>
	<CAMKF1sr7EzrpKKL=CEVisx-p6rB2ba1F4Bncjnij=TKNAcFT6A@mail.gmail.com>
	<20171013194729.GP9221@denix.org> <20171013203434.GQ9221@denix.org>
In-Reply-To: <20171013203434.GQ9221@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2017 22:14:49 +0000
Message-ID: <CAMKF1soc3_+t6KL5LJjLiDy64FzdVudqshwWFxyU6kTLEfmbdQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 13 Oct 2017 22:15:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 1:34 PM Denys Dmytriyenko <denis@denix.org> wrote:

> On Fri, Oct 13, 2017 at 03:47:29PM -0400, Denys Dmytriyenko wrote:
> > On Fri, Oct 13, 2017 at 11:57:17AM -0700, Khem Raj wrote:
> > > On Fri, Oct 13, 2017 at 10:35 AM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > > > On Thu, Oct 12, 2017 at 08:48:25PM -0700, Khem Raj wrote:
> > > >> On Fri, Oct 13, 2017 at 01:21:10AM +0000, Denys Dmytriyenko wrote:
> > > >> > Khem,
> > > >> >
> > > >> > I tried following on your suggestion to add #include <cmath>, but
> it is
> > > >> > already there in src/corelib/global/qnumeric_p.h
> > > >> >
> > > >> > Not sure why target qtbase builds fine with oe-core gcc 6.3.0, but
> > > >> > nativesdk-qtbase fails with this error... Any more ideas? Thanks.
> > > >>
> > > >> Do you use uninative ? if not then try with uninative.
> > > >> It seems to be mixing headers from your build host and nativesdk
> sysroot
> > > >> there could be several reasons for that. You can also try to build
> on
> > > >> a different distro on host may be one which has gcc6 as host gcc.
> > > >
> > > > Tried uninative - didn't help, same issue.
> > > >
> > > > I'm not so sure host headers are getting in the mix - it's Ubuntu
> 16.04 with
> > > > gcc 5.4 on it, while switching between gcc 6.3 and gcc 7.2 in
> oe-core/master
> > > > works with 7.2, but not 6.3.
> > > >
> > > > I can see if I can try on a host with gcc 6...
> > >
> > > I have gcc 6.4 recipes here
> > >
> > > https://github.com/kraj/openembedded-core/tree/kraj/master
> > >
> > >
> https://github.com/kraj/openembedded-core/commit/c5afea428484b8af7449e80db109913b81f40f18
> > >
> https://github.com/kraj/openembedded-core/commit/e0c1d5bab99f6fd75fea5f89cecb7dcffdbae3bf
>
> And gcc 6.4 from 2 patches above didn't help on Ubuntu 16.04...
>
>
Ok I think it could be the c++ abi change that Ubuntu headers might be
having in combination with sdk

Did old OE releases with gcc6 on this host  fail in same way ?

>
> > BTW, tried on my Gentoo machine with gcc 6.4 as a host and it worked...
> > So, it does look like a host contamination in Ubuntu 16.04 with gcc 5.4.
> > But why didn't uninative help?
> >
> >
> > > >> > On Tue, Oct 03, 2017 at 07:45:35PM -0400, Denys Dmytriyenko wrote:
> > > >> > > Martin, Khem,
> > > >> > >
> > > >> > > Have you tried building Qt 5.9 with gcc 6.3 from oe-core? I'm
> seeing bunch of
> > > >> > > what seems to be C++11 related errors during do_configure of
> nativesdk-qtbase.
> > > >> > > Target qtbase builds fine and switching to gcc 7.2 seems to
> resolve it as well.
> > > >> > >
> > > >> > > Any ideas or pointers? Thanks!
> > > >>
> > > >>
> > > >> > >
> > > >> > >
> > > >> > > Errors are like these:
> > > >> > >
> > > >> > > In file included from
> ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> > > >> > >                  from
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> In function 'bool qnumeric_std_wrapper::__builtin_isnan(double)':
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45:
> error: '__builtin_isnan' is not a member of 'std'
> > > >> > >  static inline bool isnan(double d) { return std::isnan(d); }
> > > >> > >                                              ^~~
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45:
> note: suggested alternatives:
> > > >> > > <built-in>: note:   '__builtin_isnan'
> > > >> > > In file included from
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/recipe-sysroot/tmp/sdk/sysroots/x86_64-oe-linux/usr/include/c++/6.3.0/cmath:45:0,
> > > >> > >                  from
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:56,
> > > >> > >                  from
> ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1,
> > > >> > >                  from
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:20:
> note:   'qnumeric_std_wrapper::__builtin_isnan'
> > > >> > >  static inline bool isnan(double d) { return std::isnan(d); }
> > > >> > >                     ^
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> At global scope:
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:105:20:
> error: expected ')' before '(' token
> > > >> > >  static inline bool isinf(double d) { return std::isinf(d); }
> > > >> > >                     ^
> > > >> > > In file included from
> ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> > > >> > >                  from
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> In function 'bool qnumeric_std_wrapper::__builtin_isfinite(double)':
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48:
> error: '__builtin_isfinite' is not a member of 'std'
> > > >> > >  static inline bool isfinite(double d) { return
> std::isfinite(d); }
> > > >> > >                                                 ^~~
> > > >> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48:
> note: suggested alternatives:
> > > >> > > <built-in>: note:   '__builtin_isfinite'
> > > >> > > --
> > > >> > > _______________________________________________
> > > >> > > Openembedded-devel mailing list
> > > >> > > Openembedded-devel@lists.openembedded.org
> > > >> > >
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >>
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

