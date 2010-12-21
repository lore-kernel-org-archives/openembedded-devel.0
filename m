Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PV6N4-00039h-4j
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 18:51:34 +0100
Received: by iwn8 with SMTP id 8so4598224iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=nmgI8IQtZbCXkaODshuPzeBHWdH9PRVX83Z4rvQdtzs=;
	b=Z6uOrkaCYnEmhsOI7pRJ1ju6ajRjlBbh7qzzMH00S/8DJkoa813QbK3FYP05GlbviC
	zgc+OL9eOi/nH8ZafnG0soG1TJvS9iOpuX9yNLq1uRjSM9HWgm+i9jNA2/Q1mhQLwT51
	Sekz8pwg3IF7knVEeMXt8VOGXV7q/Mxw3lljk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DnYWWRYu8+5vmspMU33GQ46043YUzrE9D23DYLjnadJSMXNwJy2fpe9pliiCN2w7jp
	LkNHFwisKloGGuOfm7tI4hWPPItlS2GW9XHHOrTHsOiSYpXuAw2yfjBQZbwOlPCwpA4x
	egFa61EkULKssP3HK2XpbfztJIC08oUwcmv+Q=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr5794709ibb.57.1292953885742;
	Tue, 21 Dec 2010 09:51:25 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 21 Dec 2010 09:51:25 -0800 (PST)
In-Reply-To: <iepnom$tk9$1@dough.gmane.org>
References: <ienu66$5gf$1@dough.gmane.org> <4D0F8AB7.1020104@xora.org.uk>
	<AANLkTiks4PYZxZCQgsprveY1jNQgpy_mMVTOwg3DtsqX@mail.gmail.com>
	<iepnom$tk9$1@dough.gmane.org>
Date: Tue, 21 Dec 2010 18:51:25 +0100
Message-ID: <AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Dec 2010 17:51:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/21 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-12-10 18:16, Frans Meulenbroeks wrote:
>> Nice piece of work & a good plan but...
>>
>> Who will be the owners/maintainers of the layers?
>
> My intention was that the meta-openembedded layer will be maintained by
> the people interested in it. There will be a new MAINTAINERS file inside
> listing who feels responsible for various recipes.

Ah ok.
Seems a good plan.
>
>> An alternate approach would be to let the stuff live in poky-extras.
>> See this proposal from RP:
>> http://www.mail-archive.com/yocto@yoctoproject.org/msg00286.html
>
> The poky-extras thing is not what I want, and more importantly, I don't
> want to start diluting the OE brand.

Why wouldn't you want poky-extras?
My concern is that we get lots of duplicated effort because both
poky-extras and meta-openembedded might get the same recipes.
Maybe this should be one of the items to be discussed with the yocto
board (and maybe come to one user contributed layer).

BTW it seems good to come up with some guidelines on the
meta-openembedded layer (or maybe usage rules or so).
E.g. personally I would expect that if I put meta-openembedded on top
of e.g. poky/laverne that a recipe in it builds).
So no dependencies on non poky recipes. Is that an agreed assumption?

Wrt diluting the OE brand. This is a completely different topic.
IMHO the mere fact that yocto exists impacts OE.
Yocto also has much more resources (both people-hour wise as well as
HW wise), so I strongly doubt we can compete on it wrt the quality of
the base recipes.

That leaves the question:
Given the existence of Yocto in which parts do we see added value of
OE and on which things should we as OE focus.
But I guess this is more something for a different thread.

Frans


