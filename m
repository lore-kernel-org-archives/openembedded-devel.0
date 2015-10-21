Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3A2769A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 14:28:56 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so99465149igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=TyWSEdngNWJlDfFt/MGHcArnRoq/tJw+msuPTj1+2L4=;
	b=KK+jhRzRvs+5L2nAZFq2vXsJWiHCkBfUrWUbYns3HnX4+ws5nAvouoHgVJtxzvqjo2
	JJuNEs0ZBj9F9TXShOrtPlrpzVAhYFX+mK6ZxzTXS9UT2CoSGd7aiTmaTyoYN8eEkXTU
	cAQ+w/+icca1rIRsWRPr+gd4SNAl1xkDlkmKKoy4CBbGNjYrdryxYIBh6hgrLUY4qmvL
	8R1LbXlHkzHdFXeDo2X5SmzPHCrrkpFNHv9gqL/01bQOTYCi3f/GIYqPml5fIsw/Ja1T
	ZAOADkY8AbuCly07nEBRzTcdnR/Z5qEN+/8N5ZMWIQXvtEpp5rYYuai7QauMXqNMyhtz
	F1+g==
X-Gm-Message-State: ALoCoQkv5lQO34PzxIwhmrktUn11ON/vYKonTIesDnZroQKg0KIDZ3U00pL+NDjgozJ7JUs4tMwd
X-Received: by 10.50.60.104 with SMTP id g8mr15195713igr.89.1445437737159;
	Wed, 21 Oct 2015 07:28:57 -0700 (PDT)
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com.
	[209.85.213.172]) by smtp.gmail.com with ESMTPSA id
	g10sm3721126igy.22.2015.10.21.07.28.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 07:28:55 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igdg1 with SMTP id g1so87523556igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:28:55 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.128.194 with SMTP id nq2mr10292581igb.19.1445437735057;
	Wed, 21 Oct 2015 07:28:55 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 21 Oct 2015 07:28:54 -0700 (PDT)
In-Reply-To: <20151021141118.GC2556@jama>
References: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
	<20151021105937.GA2556@jama> <20151021110944.GB2556@jama>
	<20151021141118.GC2556@jama>
Date: Wed, 21 Oct 2015 12:28:54 -0200
Message-ID: <CAP9ODKpELjyK-=1CuuqEMcazzTS0FNtm59RoBAYCnj2_j-ZTzw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/6] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Wed, 21 Oct 2015 14:28:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 21, 2015 at 12:11 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Oct 21, 2015 at 01:09:44PM +0200, Martin Jansa wrote:
>> On Wed, Oct 21, 2015 at 12:59:37PM +0200, Martin Jansa wrote:
>> > On Wed, Oct 14, 2015 at 08:48:51PM +0200, Jens Rehsack wrote:
>> > >
>> > > llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM in 3.5
>> > > (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-backend).
>> > >
>> > > Ensure JIT is built with llvm
>> >
>> > I'm tempted to leave this one after jethro is branched, unless
>> > default LLVM_RELEASE is updated in oe-core/jethro mesa as well.
>> >
>> > Otherwise everybody will need to set LLVM_RELASE in their mesa bbappend
>> > or we'll need to bbappend it in meta-oe.
>>
>> Or better, update this to keep 3.3 as llvm is meant to allow multiple
>> versions being built and installed in parallel.
>
> Another reason to keep 3.3 around is build on older hosts, current 3.5
> fails in Ubuntu-12.04
>
> | checking whether GCC is new enough... no
> | configure: error:
> | The selected GCC C++ compiler is not new enough to build LLVM. Please upgrade
> | to GCC 4.7. You may pass --disable-compiler-version-checks to configure to
> | bypass these sanity checks.

I agree to keep 3.3 however supporting 12.04 is a goal? Poky does not
support it anymore so will OE-Core keep it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

