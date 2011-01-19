Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pfd9k-00035L-LO
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 19:53:20 +0100
Received: by iwn8 with SMTP id 8so1163810iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=cgxw2cX3rMoCZqpY6EUxj6qg3lskJhnh93/1EVVeJwM=;
	b=JncOq70bfZ5JtGB2IB9NOe+EEETzre0Wad7YzGPfMbqxN4Nff+ddFjmwPZ7ptpyrvj
	RrbWdHG96W9pja1fSUQdxyL7Hd12oPSxWJoUt/4jX73yQbhf3GIIx8BnzfmoZsJ+U6Pb
	dFO7R46ZZ+QQdDN7EOkaffottQXFx4Bb0hJcQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TLI2ZRmp6REllal168cqs6c2VencQdXWQNQdpgtMMjXlleJXfanhbe/vvuwCkiqlCP
	Mavxbj6n3tHVb/FRNA/Q4RRzXZZB/xNXjrO7w7YHmcjiy00Z4OSZDPz3vzq43mOAb/mu
	d/+e8zGx8okyVZhLiPOIDf3rQ2sRApEPJdZeM=
MIME-Version: 1.0
Received: by 10.231.15.194 with SMTP id l2mr1312805iba.34.1295463162100; Wed,
	19 Jan 2011 10:52:42 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 10:52:42 -0800 (PST)
In-Reply-To: <4D370A54.6020607@xora.org.uk>
References: <4D36F9BE.1010601@xora.org.uk>
	<AANLkTi=sJGSCRxSF6tFPhrGb=NKfmiLNURg-n-Gmgc3Z@mail.gmail.com>
	<4D370A54.6020607@xora.org.uk>
Date: Wed, 19 Jan 2011 19:52:42 +0100
Message-ID: <AANLkTikUOPo2v+=qYF_afhSHxkyb1EK3HJC1_E4RRGub@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openembedded-core git repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jan 2011 18:53:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/19 Graeme Gregory <dp@xora.org.uk>:
> On 19/01/2011 15:33, Frans Meulenbroeks wrote:
>> 2011/1/19 Graeme Gregory <dp@xora.org.uk>:
>>> Hi, this email is sent as an ordinary member of OE.
>>>
>>> It seems to be on a technical level we are agreed that we should split
>>> parts of OE out into the so called openembedded-core which will have a
>>> stricter commit access and higher QA requirements on changes.
>>>
>>> I therefore think it is time to actually create the repository and let
>>> the people who are interested in merging the good stuff from poky with
>>> the good stuff from openembedded to create our "core". I don't think
>>> there is any need to wait on the political part of the Yocto/OE
>>> collaboration as its something we have agreed in principal to do anyway=
.
>>>
>>> I would request then that the TSC drive this forward with the server
>>> admins and create this repo so work can happen.
>>>
>>> Graeme
>> Graeme,
>>
>> Seems =A0a fine plan to me.
>> Do we already have an idea what would be the starting base?
>> And do we already have an idea on the QA requirements we want to impose =
on this?
>> Lastly we might try to define some common understanding what is core
>> and what not.
>>
>> I did some experiments with poky and found that some of the recipes I
>> needed were missing; some of them might perhaps become part of core
>> (e.g. i2ctools, squashfstools, libftdi, fastcgi), whereas others are
>> quite unlikely to end up in core (e.g. urjtag). For the latter we must
>> find another home (e.g. meta-openembedded), where hopefully we can
>> also raise the QA bar somewhat.
>>
>> I'll happily contribute to raise the quality bar. However, if the goal
>> is shuffling recipes without significant QA improvement or if QA
>> improvement is optional, I'll probably pass.
>>
>
> Well I would hope that openembedded-core has a pull model similar to
> poky/yocto but that is I think ultimately upto TSC members (with
> consultation with membership). Hopefully they shall give their opinions
> on the issue soon.

I would also encourage and support a pull model, driven by one or a
few fairly neutral developers.
>
> I would say the obvious starting point is poky, then merge OE
> improvements into that. I think this would be less work than stripping
> down OE to core level.
>
> I think all the tools you have mentioned are bad examples of stuff to go
> into core except possibly squashfs. Core should be purely enough to get
> a busybox minimal image build in ext2/3/jffs/ubi given a machine.conf.
> Basically enough to do board bringup and no more (with package
> management capabilities). If core was recipes people "needed" it wouldnt
> really be core fastcgi is pretty specialised bit of software.

I'm not really sure what would go into core, but I kinda figured it
would probably be something like poky/meta
http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta

The examples I gave are maybe not desirable in a minimal setting.
Then again I feel core should probably be a little bit more than board
bringup + busybox. I would hope that recipes like perl and python
become part of core.

Then again if oe core is similar to poky/meta the things I mentioned
might fit in better than say libid3tag.
If oe core is what is now in poky/recipes-core then I fully agree that
the things I mention do not belong there (but probably glib-2.0 does
not belong in a minimal layer either).

http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta/recipes-core

But I had the impression that most of the poky recipes should go into
oe-core (or I misunderstood that part of Richard's email).
It does not seem too wise to have two repo's with e.g. pango, zeroconf
and matchbox.
>
> Core should probably have a build bot which crunches a standard set of
> tests on each commit so unlike OE currently people don't wake up to bad
> day of debugging OE.

I'm not sure if that is needed (at least not on for every commit).
If we are aiming for a pull model, the maintainer(s) are the only ones
that can push and I would expect them to build things (maybe using a
buildbot to cover different architectures) before pushing.

Frans


