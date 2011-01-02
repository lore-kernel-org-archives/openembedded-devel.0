Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PZM89-0006FL-71
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 12:29:45 +0100
Received: by iwn8 with SMTP id 8so13118706iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jan 2011 03:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LdcFQP1L0QkCj4jUYPdzPcgVAceCCIXp3lFAPLHNFhU=;
	b=KWBfvU8R+WIFDklHGIcCIuwGu6oXgJH9eu5wz2mvqcgyrJ3BI3X4/pQUh8dPg7T7ao
	wxxb3RsWehAOD5P9V7yYT2xl1a2zBVt4W9GoNGhcg0EhPs0jBjIwyLtaVI73Iofg5Rtb
	iUvSNe9Ya0rWLKEubUhdC/33GuS01Nn9KGKgo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WvjayDEH9Cn1fvqULGl8tiuthBZymtZnAJqNAe7Jm4MYvou96Q7S/AcUrftKP6jQcG
	tw8BxnYLXYngBrqL3UpDRfT2+06A3pfYbgrVMSVTLAK/wEuuk0iY7lmEong2PDfUCKYI
	n/R5t4nDi2wqavLS4n6BRz4VDY7utAAWD2MUw=
MIME-Version: 1.0
Received: by 10.231.199.77 with SMTP id er13mr3402674ibb.44.1293967762467;
	Sun, 02 Jan 2011 03:29:22 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Sun, 2 Jan 2011 03:29:22 -0800 (PST)
In-Reply-To: <201012212128.17392.marcin@juszkiewicz.com.pl>
References: <ienu66$5gf$1@dough.gmane.org> <iepnom$tk9$1@dough.gmane.org>
	<AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
	<201012212128.17392.marcin@juszkiewicz.com.pl>
Date: Sun, 2 Jan 2011 12:29:22 +0100
Message-ID: <AANLkTi=MC8dELQ2BmCDKfKcojZNStjo-rUPX9TmHO6oF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Sun, 02 Jan 2011 11:29:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There hasn't been too much discussion on Marcin's proposal below
(maybe lots of people enjoyed a good Xmas holiday!)

I still feel Marcin's proposal is a good plan.
Do we want to move this way?

If so, what about some action?

Frans


2010/12/21 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia wtorek, 21 grudnia 2010 o 18:51:25 Frans Meulenbroeks napisa=C5=82(a=
):
>> 2010/12/21 Koen Kooi <k.kooi@student.utwente.nl>:
>> >> Nice piece of work & a good plan but...
>> >> Who will be the owners/maintainers of the layers?
>> >
>> > My intention was that the meta-openembedded layer will be maintained b=
y
>> > the people interested in it. There will be a new MAINTAINERS file insi=
de
>> > listing who feels responsible for various recipes.
>
>> Seems a good plan.
>
> I just gave on irc how I see cooperation with Yocto:
>
> - yocto-core layer - maintained by Yocto, builds always for selected targ=
ets,
> =C2=A0pull only way of providing changes - just like Poky was
> - oe-core layer - extra images, classes required by OE builds. Same polic=
ies
> =C2=A0as Yocto core - only pull from user branches if changes pass test b=
uilds
> - oe-distro-DISTRO (for those distros which needs own layers - like angst=
rom
> =C2=A0does) maintained by distro maintainers with their policies
> - oe-bsp-STH maintained by layer maintainers with their policies
> - oe-extra-STH (STH =3D opie, xfce, whatever) maintained by person/team
> - oe-unmaintained layer with everything not fit in layers
>
> This way we can get stable core (yocto-core + oe-core) which builds alway=
s for
> selected targets + layers with UI environments, multimedia, boards/soc
> support, etc each of them maintained by person or team. How we will split
> metadata into layers (and subdirs in layers) is other thing and will need=
 to
> be discussed too.
>
>> >> An alternate approach would be to let the stuff live in poky-extras.
>> >> See this proposal from RP:
>> >> http://www.mail-archive.com/yocto@yoctoproject.org/msg00286.html
>> >
>> > The poky-extras thing is not what I want, and more importantly, I don'=
t
>> > want to start diluting the OE brand.
>>
>> Why wouldn't you want poky-extras?
>> My concern is that we get lots of duplicated effort because both
>> poky-extras and meta-openembedded might get the same recipes.
>
> Poky-extras is part of Poky not OpenEmbedded. Our brand has 7 years and w=
e do
> not want to let it disappear. This will send wrong message to people who =
use
> our work.
>
>> Wrt diluting the OE brand. This is a completely different topic.
>> IMHO the mere fact that yocto exists impacts OE.
>> Yocto also has much more resources (both people-hour wise as well as
>> HW wise), so I strongly doubt we can compete on it wrt the quality of
>> the base recipes.
>
> Thats why we should move to use Yocto as base. We have skilled developers=
 too
> which can and will provide changes to yocto-core layer. But those changes=
 will
> require testing before being merged which can be new thing for some of OE
> developers ;)
>
>> That leaves the question:
>> Given the existence of Yocto in which parts do we see added value of
>> OE and on which things should we as OE focus.
>
> OE supports more targets then Yocto does or will ever support. I do not e=
xpect
> Yocto to support Intel Mainstone or Simpad or even Alix.1c which I use fo=
r my
> router. But OE supports those machines (more or less) and this is our val=
ue.
> There are boards outside which boots to OpenEmbedded derived root filesys=
tems
> - not Yocto or Poky but OE based.
>
> If we do proper separation of layers then who knows - maybe some vendors =
which
> base on OE will start to base on Yocto directly. But as OE will also base=
 on
> Yocto then it will be not a problem to use vendor layers with our ones to
> provide extra packages.
>
> Regards,
> --
> JID: =C2=A0 =C2=A0 =C2=A0hrw@jabber.org
> Website: =C2=A0http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


