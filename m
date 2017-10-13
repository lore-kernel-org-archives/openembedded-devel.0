Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id D97CF77BC3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 23:05:36 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id y7so2295422pgb.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LRAu9Shii9xsFjijUsgaZbngSmAiU9WPAuuipD+rgO4=;
	b=TslaGpDnXNj+qdFXhNffY9UD4grLjRRbBDbx1g807By6f/DHT4OZ1eJivfmsT88woL
	XZcr8DoPgw/RU3uUauEHNrusr3wT6iiKS/AdDsHS77XZV6XOqSzQNVYMWZZX93XKSRyv
	01WtZSbKI3PivJ//0aJqWjbPxAyEJnfSySlzgY3dynOAfsw9DpBlhz8YtgonMHS8MF1S
	O8mKuQtqU33NGg+UhZEx1cY4Mg8WUbzoCMTT9xmZAjR5lnUxuECAOxXHQO4r+sL8+bre
	zgbk71uqNrvnOPVZ2w7VFxLzCbylDZ2BcHEQ4oNSUusR1TxILOWANUjYm9BRDBCwuq9x
	kzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LRAu9Shii9xsFjijUsgaZbngSmAiU9WPAuuipD+rgO4=;
	b=jq3BkaWYCYTQ3MP/4OxMwGevI1HJMyQ2oZBd5LS9uOZXcqWZnNkZr1MYY6eBugBm9n
	yxAnnsLiQ2AqqlQqtqP7/oZudjxv3ozP/YoU5IuEnq9aABSIvO/qhtxhcObamWJb9FpV
	SyYRFDSgfW66qJ7h/Zm1h83F+SONNWsLw5bDDkfIb2jHSZPjA9ZQ0x9hLyyP/Ti6n5FT
	idULOcQwG1Q+wJM/UeyEP4hiv3mGHg/XM4cDZ6eglkveeKacR4UEfBj7MVyytM4VKoym
	um7vmvCOnLCFaOu8R2b+AugnOcCMgjS2MKUOYJLHB6YVKqSiQkmJ/RtCuycyIC2Tf53h
	L21w==
X-Gm-Message-State: AMCzsaV2bwXyoWn1q8jFDDwMkjfmG1YMz9kQcjggdD3NhnGn+GeQjcNY
	2b+SHVdD306byuEuesJUdJKu1nzy2ehqxkSLI0I=
X-Google-Smtp-Source: AOwi7QC/1NGLs44lbeIjZeQ/9G73EfQUPgohIXga+iyb3kWn5yMldM0s2JSx6DQjVSX+lCOhRuN481wAoCnBCUsDkx0=
X-Received: by 10.98.34.85 with SMTP id i82mr2576201pfi.111.1507935937985;
	Fri, 13 Oct 2017 16:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20171003234535.GG16828@denix.org>
	<20171013012110.GM9221@denix.org>
	<20171013034825.ispcwc762ls3ttes@apollo>
	<20171013173519.GO9221@denix.org>
	<CAMKF1sr7EzrpKKL=CEVisx-p6rB2ba1F4Bncjnij=TKNAcFT6A@mail.gmail.com>
	<20171013194729.GP9221@denix.org> <20171013203434.GQ9221@denix.org>
	<CAMKF1soc3_+t6KL5LJjLiDy64FzdVudqshwWFxyU6kTLEfmbdQ@mail.gmail.com>
	<20171013225833.GR9221@denix.org>
In-Reply-To: <20171013225833.GR9221@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2017 23:05:26 +0000
Message-ID: <CAMKF1sp5rEHc9Zs2QdW7A_PVzQDZmFypeO9SkLx9Mjzc3+ynzQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Oct 2017 23:05:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 3:58 PM Denys Dmytriyenko <denis@denix.org> wrote:

> On Fri, Oct 13, 2017 at 10:14:49PM +0000, Khem Raj wrote:
> > On Fri, Oct 13, 2017 at 1:34 PM Denys Dmytriyenko <denis@denix.org>
> wrote:
> >
> > > On Fri, Oct 13, 2017 at 03:47:29PM -0400, Denys Dmytriyenko wrote:
> > > > On Fri, Oct 13, 2017 at 11:57:17AM -0700, Khem Raj wrote:
> > > > > On Fri, Oct 13, 2017 at 10:35 AM, Denys Dmytriyenko <
> denis@denix.org>
> > > wrote:
> > > > > > On Thu, Oct 12, 2017 at 08:48:25PM -0700, Khem Raj wrote:
> > > > > >> On Fri, Oct 13, 2017 at 01:21:10AM +0000, Denys Dmytriyenko
> wrote:
> > > > > >> > Khem,
> > > > > >> >
> > > > > >> > I tried following on your suggestion to add #include <cmath>,
> but
> > > it is
> > > > > >> > already there in src/corelib/global/qnumeric_p.h
> > > > > >> >
> > > > > >> > Not sure why target qtbase builds fine with oe-core gcc
> 6.3.0, but
> > > > > >> > nativesdk-qtbase fails with this error... Any more ideas?
> Thanks.
> > > > > >>
> > > > > >> Do you use uninative ? if not then try with uninative.
> > > > > >> It seems to be mixing headers from your build host and nativesdk
> > > sysroot
> > > > > >> there could be several reasons for that. You can also try to
> build
> > > on
> > > > > >> a different distro on host may be one which has gcc6 as host
> gcc.
> > > > > >
> > > > > > Tried uninative - didn't help, same issue.
> > > > > >
> > > > > > I'm not so sure host headers are getting in the mix - it's Ubuntu
> > > 16.04 with
> > > > > > gcc 5.4 on it, while switching between gcc 6.3 and gcc 7.2 in
> > > oe-core/master
> > > > > > works with 7.2, but not 6.3.
> > > > > >
> > > > > > I can see if I can try on a host with gcc 6...
> > > > >
> > > > > I have gcc 6.4 recipes here
> > > > >
> > > > > https://github.com/kraj/openembedded-core/tree/kraj/master
> > > > >
> > > > >
> > >
> https://github.com/kraj/openembedded-core/commit/c5afea428484b8af7449e80db109913b81f40f18
> > > > >
> > >
> https://github.com/kraj/openembedded-core/commit/e0c1d5bab99f6fd75fea5f89cecb7dcffdbae3bf
> > >
> > > And gcc 6.4 from 2 patches above didn't help on Ubuntu 16.04...
> > >
> > >
> > Ok I think it could be the c++ abi change that Ubuntu headers might be
> > having in combination with sdk
> >
> > Did old OE releases with gcc6 on this host  fail in same way ?
>
> Nope, been using Ubuntu 16.04 with morty a lot w/o any issues, including
> past
> versions of Qt5. This is the first time I see this issue with Qt 5.9...



It probably never got tested in previous versions with this particular case
May be try reducing the testcase to small one or see if you can compile
same version of qt with morty

>
>
>
> > > > BTW, tried on my Gentoo machine with gcc 6.4 as a host and it
> worked...
> > > > So, it does look like a host contamination in Ubuntu 16.04 with gcc
> 5.4.
> > > > But why didn't uninative help?
> > > >
> > > >
> > > > > >> > On Tue, Oct 03, 2017 at 07:45:35PM -0400, Denys Dmytriyenko
> wrote:
> > > > > >> > > Martin, Khem,
> > > > > >> > >
> > > > > >> > > Have you tried building Qt 5.9 with gcc 6.3 from oe-core?
> I'm
> > > seeing bunch of
> > > > > >> > > what seems to be C++11 related errors during do_configure of
> > > nativesdk-qtbase.
> > > > > >> > > Target qtbase builds fine and switching to gcc 7.2 seems to
> > > resolve it as well.
> > > > > >> > >
> > > > > >> > > Any ideas or pointers? Thanks!
> > > > > >>
> > > > > >>
> > > > > >> > >
> > > > > >> > >
> > > > > >> > > Errors are like these:
> > > > > >> > >
> > > > > >> > > In file included from
> > > ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> > > > > >> > >                  from
> > >
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> > > In function 'bool qnumeric_std_wrapper::__builtin_isnan(double)':
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45:
> > > error: '__builtin_isnan' is not a member of 'std'
> > > > > >> > >  static inline bool isnan(double d) { return std::isnan(d);
> }
> > > > > >> > >                                              ^~~
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45:
> > > note: suggested alternatives:
> > > > > >> > > <built-in>: note:   '__builtin_isnan'
> > > > > >> > > In file included from
> > >
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/recipe-sysroot/tmp/sdk/sysroots/x86_64-oe-linux/usr/include/c++/6.3.0/cmath:45:0,
> > > > > >> > >                  from
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:56,
> > > > > >> > >                  from
> > > ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1,
> > > > > >> > >                  from
> > >
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:20:
> > > note:   'qnumeric_std_wrapper::__builtin_isnan'
> > > > > >> > >  static inline bool isnan(double d) { return std::isnan(d);
> }
> > > > > >> > >                     ^
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> > > At global scope:
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:105:20:
> > > error: expected ')' before '(' token
> > > > > >> > >  static inline bool isinf(double d) { return std::isinf(d);
> }
> > > > > >> > >                     ^
> > > > > >> > > In file included from
> > > ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> > > > > >> > >                  from
> > >
> /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:
> > > In function 'bool qnumeric_std_wrapper::__builtin_isfinite(double)':
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48:
> > > error: '__builtin_isfinite' is not a member of 'std'
> > > > > >> > >  static inline bool isfinite(double d) { return
> > > std::isfinite(d); }
> > > > > >> > >                                                 ^~~
> > > > > >> > >
> > >
> ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48:
> > > note: suggested alternatives:
> > > > > >> > > <built-in>: note:   '__builtin_isfinite'
> > > > > >> > > --
> > > > > >> > > _______________________________________________
> > > > > >> > > Openembedded-devel mailing list
> > > > > >> > > Openembedded-devel@lists.openembedded.org
> > > > > >> > >
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > > >>
> > > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
>

