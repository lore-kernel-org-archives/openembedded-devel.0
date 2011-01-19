Received: from mail-yi0-f41.google.com ([209.85.218.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pfbch-00078X-Po
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 18:15:07 +0100
Received: by yia25 with SMTP id 25so415508yia.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=yTItSunsX3AJPrw00nul513HF0/GhSr6mu1akUQPbDw=;
	b=b+vr8yuyyEykXoU5kJJzbS+gZ2xhkwjyIEgQUpdovVPJRf1FoAA4beNb5Sz6NGuOxs
	nJiXb+MuLyERJAtzXOBVTkSFXtgL2Ue21QfJPcJ2HcGYDT4VaJuN0JBJIRrA8frL6B0d
	IkbEArJ6aMka68+G2Gf1sakIB4QdRSUoinuaY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=dxniIPBF/bKqLJjF+MHAEYe53wa6+KOFVGHoXPJm2DxQgl12bv0L2JDdyAnnVJKMyQ
	CdGDaQBgae7AJQNuuRQEeEnPYufcmj2eYz7oBTdtZ1EEBy24QeNml3bwpqmIV1I0jYYg
	05m4uRY721dlS8mR88FfykoLu2oAr4/fcTdpw=
Received: by 10.90.10.31 with SMTP id 31mr1236175agj.85.1295457266067; Wed, 19
	Jan 2011 09:14:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Wed, 19 Jan 2011 09:14:03 -0800 (PST)
In-Reply-To: <4D370A54.6020607@xora.org.uk>
References: <4D36F9BE.1010601@xora.org.uk>
	<AANLkTi=sJGSCRxSF6tFPhrGb=NKfmiLNURg-n-Gmgc3Z@mail.gmail.com>
	<4D370A54.6020607@xora.org.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jan 2011 09:14:03 -0800
Message-ID: <AANLkTikboQD_DzetzQHDrikhKQDWYcw_-PxX0=9M_prr@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Jan 2011 17:15:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2011 at 7:59 AM, Graeme Gregory <dp@xora.org.uk> wrote:
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
>> Seems =C2=A0a fine plan to me.
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
>
> I would say the obvious starting point is poky, then merge OE
> improvements into that. I think this would be less work than stripping
> down OE to core level.

Poky is a moving target too. So it will be a bit hard to follow do we plan =
to
sync oe-core with poky or will yocto start working on oe-core right away

>
> I think all the tools you have mentioned are bad examples of stuff to go
> into core except possibly squashfs. Core should be purely enough to get
> a busybox minimal image build in ext2/3/jffs/ubi given a machine.conf.
> Basically enough to do board bringup and no more (with package
> management capabilities). If core was recipes people "needed" it wouldnt
> really be core fastcgi is pretty specialised bit of software.
>
> Core should probably have a build bot which crunches a standard set of
> tests on each commit so unlike OE currently people don't wake up to bad
> day of debugging OE.
>
> Graeme
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


