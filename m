Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B829478087
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 18:57:46 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 17so11065774pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u6M1Qjnw0uZYS3XDt83+XSU8vXll/OeCR+IG/pmD/3s=;
	b=StUQiAK7yANljFtyUwfV85CAf+ivV/am2bOe89FdOErOK+5MQxDdGCudKVD9qWjxce
	an04WklEZMELXy+GvFgNwTQWdWgx/48Wedgx06CiUQEDIWNFCzNPzgkXvsWdbRwpl9Cy
	t+M9NvssHZYA8p/VoG4n3knnkOAM8tv+itk/kVkSh4pOI11QUX3g4tF38L77LJ+e1Yiv
	+Kjc3/3TSycBLZKf6X9Ldqk6zQ76nFsU5WiEluS7hKTG2dFEby1U/oyMTbLc4CUxzrnl
	x3O87+m1zchUBhzO74YNWydutWwQ6lLmS8hARIjCzjKPA496NDaLkfILpW1aqVz6BgMM
	XZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u6M1Qjnw0uZYS3XDt83+XSU8vXll/OeCR+IG/pmD/3s=;
	b=crdIcFNmAfTiagwT2Td+Gn4nGRHYLvqEyylI8gvbrnIfjx4E+yL2JG3C5fC4MD7KQp
	5VSVKA9cjXdZx1xjRftI8GiDerHW4R9zCT4HDanGtnAZn2eDfc/NN7YH4y4rA93iMIsy
	lut6SIXrBoFho6a5EHu0AhD5pLN6pweA55wvJVo1d5sY0mR7wpbHj0RLBLeUXHovB9yk
	k5nTrQ5W7P6P/g1Zun2EE9/wtXAlWRcjoVSkdOUhBzfLMkRhTd/yalssXZfsQRihGyFO
	GKTuw/V0zS87EKdewUiGGr1oRqh+56KmiNlD1LnVsUE4PTK++EXMTxmrajQ+tLKp0Cxx
	KwcQ==
X-Gm-Message-State: AMCzsaXa/21JYlHcDHrNSgunfPfcsu0Bb9yhYy+s0I/4FgsErrWuBCUZ
	hF0Fv16WI82cbq9untikHIAzGeIfihvcl7P8nrd3ZA==
X-Google-Smtp-Source: AOwi7QAvt8u0BWodvmiGtmOGXUJ6LJP7wa7eqEcFHZSUsuTurC0zNarMgjaadpjT8wwYaeD56ixdQUimAkREoaNqbN0=
X-Received: by 10.98.150.149 with SMTP id s21mr2143556pfk.151.1507921067628;
	Fri, 13 Oct 2017 11:57:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 13 Oct 2017 11:57:17 -0700 (PDT)
In-Reply-To: <20171013173519.GO9221@denix.org>
References: <20171003234535.GG16828@denix.org>
	<20171013012110.GM9221@denix.org>
	<20171013034825.ispcwc762ls3ttes@apollo>
	<20171013173519.GO9221@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2017 11:57:17 -0700
Message-ID: <CAMKF1sr7EzrpKKL=CEVisx-p6rB2ba1F4Bncjnij=TKNAcFT6A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Fri, 13 Oct 2017 18:57:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 10:35 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Oct 12, 2017 at 08:48:25PM -0700, Khem Raj wrote:
>> On Fri, Oct 13, 2017 at 01:21:10AM +0000, Denys Dmytriyenko wrote:
>> > Khem,
>> >
>> > I tried following on your suggestion to add #include <cmath>, but it is
>> > already there in src/corelib/global/qnumeric_p.h
>> >
>> > Not sure why target qtbase builds fine with oe-core gcc 6.3.0, but
>> > nativesdk-qtbase fails with this error... Any more ideas? Thanks.
>>
>> Do you use uninative ? if not then try with uninative.
>> It seems to be mixing headers from your build host and nativesdk sysroot
>> there could be several reasons for that. You can also try to build on
>> a different distro on host may be one which has gcc6 as host gcc.
>
> Tried uninative - didn't help, same issue.
>
> I'm not so sure host headers are getting in the mix - it's Ubuntu 16.04 with
> gcc 5.4 on it, while switching between gcc 6.3 and gcc 7.2 in oe-core/master
> works with 7.2, but not 6.3.
>
> I can see if I can try on a host with gcc 6...
>

I have gcc 6.4 recipes here

https://github.com/kraj/openembedded-core/tree/kraj/master

https://github.com/kraj/openembedded-core/commit/c5afea428484b8af7449e80db109913b81f40f18
https://github.com/kraj/openembedded-core/commit/e0c1d5bab99f6fd75fea5f89cecb7dcffdbae3bf

>
>> > On Tue, Oct 03, 2017 at 07:45:35PM -0400, Denys Dmytriyenko wrote:
>> > > Martin, Khem,
>> > >
>> > > Have you tried building Qt 5.9 with gcc 6.3 from oe-core? I'm seeing bunch of
>> > > what seems to be C++11 related errors during do_configure of nativesdk-qtbase.
>> > > Target qtbase builds fine and switching to gcc 7.2 seems to resolve it as well.
>> > >
>> > > Any ideas or pointers? Thanks!
>>
>>
>> > >
>> > >
>> > > Errors are like these:
>> > >
>> > > In file included from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
>> > >                  from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: In function 'bool qnumeric_std_wrapper::__builtin_isnan(double)':
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45: error: '__builtin_isnan' is not a member of 'std'
>> > >  static inline bool isnan(double d) { return std::isnan(d); }
>> > >                                              ^~~
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45: note: suggested alternatives:
>> > > <built-in>: note:   '__builtin_isnan'
>> > > In file included from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/recipe-sysroot/tmp/sdk/sysroots/x86_64-oe-linux/usr/include/c++/6.3.0/cmath:45:0,
>> > >                  from ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:56,
>> > >                  from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1,
>> > >                  from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:20: note:   'qnumeric_std_wrapper::__builtin_isnan'
>> > >  static inline bool isnan(double d) { return std::isnan(d); }
>> > >                     ^
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: At global scope:
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:105:20: error: expected ')' before '(' token
>> > >  static inline bool isinf(double d) { return std::isinf(d); }
>> > >                     ^
>> > > In file included from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
>> > >                  from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: In function 'bool qnumeric_std_wrapper::__builtin_isfinite(double)':
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48: error: '__builtin_isfinite' is not a member of 'std'
>> > >  static inline bool isfinite(double d) { return std::isfinite(d); }
>> > >                                                 ^~~
>> > > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48: note: suggested alternatives:
>> > > <built-in>: note:   '__builtin_isfinite'
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

