Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PV9ZC-0003fj-4s
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 22:16:18 +0100
Received: by iwn8 with SMTP id 8so4776576iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 13:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3u9R22RXJc/XKWCNMdzeAOcwCsIsHPCHe5jC6sYsEA8=;
	b=r4MeKMpi2n7llzfOAWM2S8RO+2S6QevQxQ6TRRIwQxazUlSN4p1zC2ceV05i04ULM6
	yE8LUGaKaO9GCqifwm1XQO9Fo2HwePP+Zj4Fxn1+zCjQuWSMQH+og+3mZ9WRYyRGdys8
	ToWnxPZ8aDSrgPWz4vyvK9haDRm+YrxByK4f0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pQFWSQpnrwQuIsplFa3q9OHoggOkUho03DM0jDomxNUZ3G0BbG1tadpHegCRiZdVZC
	DWaTjKEgKZ5qyA0yPCvlkvgEPwJ7STb7jYGxmvlTB7qgLa6NycZf2ocxipjaHuIONN3+
	6FF4RRhyZ5FvQK1P8E6nO9wlHtYYCwsUUd4r8=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr6043143ibb.57.1292966172554;
	Tue, 21 Dec 2010 13:16:12 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 21 Dec 2010 13:16:12 -0800 (PST)
In-Reply-To: <201012212128.17392.marcin@juszkiewicz.com.pl>
References: <ienu66$5gf$1@dough.gmane.org> <iepnom$tk9$1@dough.gmane.org>
	<AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
	<201012212128.17392.marcin@juszkiewicz.com.pl>
Date: Tue, 21 Dec 2010 22:16:12 +0100
Message-ID: <AANLkTim_hMWwZuuMrdvEwijB_Ww=mpXPyCJA6_pxoJUD@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Dec 2010 21:16:18 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Marcin, thanks for the good post!

2010/12/21 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia wtorek, 21 grudnia 2010 o 18:51:25 Frans Meulenbroeks napisa=B3(a):
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
> =A0pull only way of providing changes - just like Poky was
> - oe-core layer - extra images, classes required by OE builds. Same polic=
ies

Good plan.
I guess we need to decide on the procedure for something to get in.
I would propose that we maintain a version policy similar to yocto (if
I recall correctly what RP wrote about it, it was e.g. preferably only
one version of a recipe and keeping a fairly close tracking of new
versions, forgot the other wise words he said on the topic).
The key probem to me seems to be how to deal with new versions of e.g.
libs. Toolchain changed will probably be driven by yocto.
And ofc we need a volunteer (or some) to pull, verify that it works etc)

> =A0as Yocto core - only pull from user branches if changes pass test buil=
ds
> - oe-distro-DISTRO (for those distros which needs own layers - like angst=
rom
> =A0does) maintained by distro maintainers with their policies
> - oe-bsp-STH maintained by layer maintainers with their policies
> - oe-extra-STH (STH =3D opie, xfce, whatever) maintained by person/team
> - oe-unmaintained layer with everything not fit in layers

Seems a nice split to me.
>
> This way we can get stable core (yocto-core + oe-core) which builds alway=
s for
> selected targets + layers with UI environments, multimedia, boards/soc
> support, etc each of them maintained by person or team. How we will split
> metadata into layers (and subdirs in layers) is other thing and will need=
 to
> be discussed too.

I can also imagine testing comes around the corner here.
E.g. the OE-core maintainer pulls/picks changes, gives it a testing
tag then some people fire off testing builds, if these are all ok, the
changes get promoted.
But ofc we can also think about other scenarios.
(or maybe instead of testing we have a core-next layer that is
promoted to core once testing is succesful.

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

I agree on that.But it must be clear what our added value is.

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

Agree.
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

I agree. Actually I have a few of these boards myself.
But we're more than a bunch of BSP layers. (I don't think we disagree
on this :-) )
>
> If we do proper separation of layers then who knows - maybe some vendors =
which
> base on OE will start to base on Yocto directly. But as OE will also base=
 on
> Yocto then it will be not a problem to use vendor layers with our ones to
> provide extra packages.

Sure. I might even work for such a company!

Frans


