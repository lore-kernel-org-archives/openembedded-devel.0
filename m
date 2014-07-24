Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id F32E0609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:05:32 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rl12so2853935iec.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sxnsrfL1V6uFLMcmUOE+iKRsiDwQm1XrcMCuyTiAXNs=;
	b=yfSyTHsV+vwJKnLk8eoYydDicm6RfZ66C5XRdC3AYH7kNNyVEYXQKMvedokz2EtFau
	LzaCFCdGLZP9Yv/uOXstyHlPyZKTiGzYg2vgqo0tNAcIZZXUwGHzH0DqQsNu+QWybRNH
	9rr5G5W5slEtFnOSd43T0wJqnMK2xaBmeDl9d3gGASwyte87EGaazncIefGroJ7vBOb4
	VzXcl34BSWD0T3k/LsJ2HR4FA9uUkOO4fmQdT110mu3aXPPOSpBoVrRKWZNhOM/LkPSW
	jCXnZ2iUwwwrxnc/VxvuWiH4UeytnOQnyudUFUdI+T0EI2tNhgCrOTKz1cKs5RB9O4Qu
	p+ag==
X-Received: by 10.42.168.199 with SMTP id x7mr9546766icy.70.1406235934098;
	Thu, 24 Jul 2014 14:05:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Thu, 24 Jul 2014 14:05:04 -0700 (PDT)
In-Reply-To: <20140724204814.GE13324@nbbrfq.cc.univie.ac.at>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
	<CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
	<20140721204239.61b225fe@free-electrons.com>
	<CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
	<20140721212700.41e29653@free-electrons.com>
	<A7BE1426-88C8-457E-8FE5-0427CC5B1D72@workware.net.au>
	<53CF9F9D.60903@jodybruchon.com>
	<14764ab3680.2772.7d831ebe34b31eacf7a4325c447c5923@gmail.com>
	<20140724204814.GE13324@nbbrfq.cc.univie.ac.at>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2014 14:05:04 -0700
Message-ID: <CAMKF1sq_8JPtWzUPN8Ctuxon09rSS-ChuAEbsMGN6NHHmY65ag@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: openwrt-devel <openwrt-devel@openwrt.org>,
	uclibc-mailing list <uclibc@uclibc.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	buildroot <buildroot@buildroot.org>, Waldemar Brodkorb <wbx@uclibc-ng.org>,
	Carmelo Amoroso <carmelo73@gmail.com>
Subject: Re: [OpenWrt-Devel] uClibc-ng
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jul 2014 21:05:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 24, 2014 at 1:48 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Wed, Jul 23, 2014 at 09:20:51PM +0200, Carmelo Amoroso wrote:
>>
>>
>> Il 23 luglio 2014 13:42:38 Jody Bruchon <jody@jodybruchon.com> ha scritto:
>>
>> >On 7/22/2014 11:30 PM, Steve Bennett wrote:> I would like to add my
>> >support to Thomas' position.
>> > > Regardless of what happens with glibc and/or musl, an active community
>> > > supporting regular releases of uClibc is a good thing.
>> > > Time has spoken that we can't expect this to happen unless something
>> >changes.
>> >
>> >I agree. It is better to have a responsive maintainer releasing periodic
>> >"stable" versions than to have what is essentially no maintainer and
>> >sustained long-term fragmentation of what "uClibc" really is. If the
>> >uClibc maintainer wakes up in the future and begins releasing again, the
>> >new project's changes can always be merged back to the parent, as they
>> >did with eglibc and glibc. For now we need to focus on making a stable
>> >release, something which is grossly overdue and harms all projects
>> >currently using uClibc.
>> >
>> >I also agree that musl is an interesting project with a bright future
>> >(and a bright present for that matter), but it does not cover all of
>> >what uClibc covers and the number of projects that already require
>> >uClibc is too large to simply drop uClibc and move to musl.
>> >
>> >-Jody Bruchon
>>
>> Gents,
>> Are we considering anyway that Bernard has recently restarted with patches
>> review and commit without no contribution from the other co-maintainers
>> (myself the first) ?
>> Likely Bernard is already preparing a release !
>
> Yea, but very very slowly, i know.
> I just started preparing a meta-changelog for the release notes and
> then we'll call it an official tarball.
>
> Lots of changes, about 10% done, approx. 1h left before bedtime.
>
> Any prominent changes we should make absolutely sure to mention?

I think

ARC support would be one.
standalone execution on x86_64 now works
math tests are fixed
MIPS64R2 support is added




> _______________________________________________
> uClibc mailing list
> uClibc@uclibc.org
> http://lists.busybox.net/mailman/listinfo/uclibc

