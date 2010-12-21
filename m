Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PV79o-0006MB-I2
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 19:41:56 +0100
Received: by gyh20 with SMTP id 20so1854397gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 10:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Y5pf5qO8OeSDVO56Kf+D/DVG60anGz+tr08hWT7SVs8=;
	b=suaZvSowPlmLs/JLMiEVF7zM0HePxMkgP8Eb+JhFZpnjzvdusK5Zj+uTRDSWEjLQ4p
	agTUC9EyoA9RgBl1rAW9CdXPoodzG7v5qJ1nJzjOo2Jq1h0wAN1IRlYLG0Y+spp8xug8
	5qZb9GE53ee32gOPh64uNx5hb2Cv6+eAz/rlI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=F5y46sYl218QPou7TgPpYelBrCSbVICbi+YeBVEVrQhhej5EUmSTDdC2t44sVvdOw+
	5HLqxENpX+1FAfiDZECG8hFaU0GTca+yOCRHZZpguFnxzD3KLWf/s0hZ4qj4rZzXm3EM
	TtMQ2vs4EEtxjuarUp18VVREnDCKTUIzSB0xs=
Received: by 10.90.10.21 with SMTP id 21mr7416697agj.112.1292956908856; Tue,
	21 Dec 2010 10:41:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 21 Dec 2010 10:41:28 -0800 (PST)
In-Reply-To: <AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
References: <ienu66$5gf$1@dough.gmane.org> <4D0F8AB7.1020104@xora.org.uk>
	<AANLkTiks4PYZxZCQgsprveY1jNQgpy_mMVTOwg3DtsqX@mail.gmail.com>
	<iepnom$tk9$1@dough.gmane.org>
	<AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 10:41:28 -0800
Message-ID: <AANLkTi=FPA_K0R64NEmi4W-atjT4NPG3TE-odppxLYQ8@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Dec 2010 18:41:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 21, 2010 at 9:51 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/12/21 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 20-12-10 18:16, Frans Meulenbroeks wrote:
>>> Nice piece of work & a good plan but...
>>>
>>> Who will be the owners/maintainers of the layers?
>>
>> My intention was that the meta-openembedded layer will be maintained by
>> the people interested in it. There will be a new MAINTAINERS file inside
>> listing who feels responsible for various recipes.
>
> Ah ok.
> Seems a good plan.
>>
>>> An alternate approach would be to let the stuff live in poky-extras.
>>> See this proposal from RP:
>>> http://www.mail-archive.com/yocto@yoctoproject.org/msg00286.html
>>
>> The poky-extras thing is not what I want, and more importantly, I don't
>> want to start diluting the OE brand.
>
> Why wouldn't you want poky-extras?
> My concern is that we get lots of duplicated effort because both
> poky-extras and meta-openembedded might get the same recipes.
> Maybe this should be one of the items to be discussed with the yocto
> board (and maybe come to one user contributed layer).
>

duplication of recipes can occur within layers and will happen
deliberately too no matter where the layer is hosted. If someone wants
to override
the default provided layer. its a OE layer so hosting it on OE infra
is logical thing as most of OE users
will look it up here.

> BTW it seems good to come up with some guidelines on the
> meta-openembedded layer (or maybe usage rules or so).
> E.g. personally I would expect that if I put meta-openembedded on top
> of e.g. poky/laverne that a recipe in it builds).
> So no dependencies on non poky recipes. Is that an agreed assumption?
>
> Wrt diluting the OE brand. This is a completely different topic.
> IMHO the mere fact that yocto exists impacts OE.

It impacts but in a good way.

> Yocto also has much more resources (both people-hour wise as well as
> HW wise), so I strongly doubt we can compete on it wrt the quality of
> the base recipes.
>

you take is wrongly I think. I think its a good thing for
openemebedded as an architecture

> That leaves the question:
> Given the existence of Yocto in which parts do we see added value of
> OE and on which things should we as OE focus.

there is more closer collaboration needed on day to day bases to get
it to work seemlessly together.
You just cant say OE should focus on xyz only as yocto has
openembedded at its core.

> But I guess this is more something for a different thread.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


