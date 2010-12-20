Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PUmOh-0003dH-26
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 21:31:55 +0100
Received: by iyj18 with SMTP id 18so2646326iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 12:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bfHOivmpNufWuO43uBlHQN5N0pev0bDj8SNf/5dwo/w=;
	b=gi2gWLocv6ZYCw/Ih8poB3/8j8bciOXtOphlN3DKzR6lupj/ppNAUXjsa8n8VOrjDD
	QRHAdM+VNLzAvlhAP05//CFWT9c5o0yU9Zy104k9wBpJo/SLbrB3qHTWYjRyWRv+SQk7
	bw+/62noyUpSbXXnhLftj5ThzFwmvMADpgDTA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=q4FoHnaIlgXzKPmUgIDU0QW1X38cfp7g08weoDempK2QvHHgPUhFsSjdeKOK5RCcZu
	65WeTT+YCM3sYXyKRtnsFYa83G/yDIIhsdOfCsQDZQoExpMONXedboBnWk5b6e/n7aZu
	zWOQLyP9D8sesrC9j4F81kPRrMDs9UZq8hDMM=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr4591680ibb.57.1292877107175;
	Mon, 20 Dec 2010 12:31:47 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 20 Dec 2010 12:31:47 -0800 (PST)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080329E93051@dlee06.ent.ti.com>
References: <ienu66$5gf$1@dough.gmane.org> <4D0F8AB7.1020104@xora.org.uk>
	<AANLkTiks4PYZxZCQgsprveY1jNQgpy_mMVTOwg3DtsqX@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080329E93051@dlee06.ent.ti.com>
Date: Mon, 20 Dec 2010 21:31:47 +0100
Message-ID: <AANLkTindrD3sTPPYsBpErVZ=zK3=56ZCHWp=sTmXvrfP@mail.gmail.com>
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
X-List-Received-Date: Mon, 20 Dec 2010 20:31:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/20 Maupin, Chase <chase.maupin@ti.com>:
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Frans Meulenbroeks
>> Sent: Monday, December 20, 2010 11:17 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [RFC] meta-openembedded layer for yocto hosted on oe.o=
rg
>>
>> Nice piece of work & a good plan but...
>>
>> Who will be the owners/maintainers of the layers?
>> I maintain several multimedia recipes (mythtv with all that is dragged
>> in (which is a.o. a lot of perl stuff), various cd* =A0related recipes,
>> python-coherence and the python stuff it uses, mediatomb, and it seems
>> recently people seem to see me as the first line of contact if they
>> have musicpd issues), as well as some file sharing recipes.
>> Any idea on how I get them added, and how to deal with updates for these=
?
>>
>> An alternate approach would be to let the stuff live in poky-extras.
>> See this proposal from RP:
>> http://www.mail-archive.com/yocto@yoctoproject.org/msg00286.html
>
> Frans,
>
> What is the difference between poky-extras and angstrom-layers in regards=
 to the intention. =A0My understanding is that Koen wanted to put the meta-=
openembedded layer on OE so it would be open to anyone. =A0Couldn't you the=
n add recipes for the components you maintain into this layer in places lik=
e recipes-multimedia?
>
> Or are you concerned about who would maintain some of the individual reci=
pe groupings like multimedia? =A0i.e. if recipes-multimedia is part of meta=
-openembedded are you concerned that you won't be able to push changes to y=
our recipes? =A0I see your issue here in that you want to maintain your rec=
ipes without restriction but at the same time if everyone just puts their r=
ecipes into their own layer we would have way too many layers and it would =
be extremely hard to keep track of.
>
> So would a good solution be to have multiple committers to the meta-opene=
mbedded layer (like Koen was suggesting) and let each committer be a mainta=
iner with an emphasis on a particular area (Also seems in line with what Ri=
chard was suggesting)?
>
> Perhaps I am misunderstanding the proposal here but it seems like we are =
really discussing whether we use poky-extras or angstrom-layers, or somethi=
ng with another name. =A0I would say that we leave angstrom-layers containi=
ng the angstrom stuff, make an openembedded layer hosted on OE (like Koen s=
uggested) rather than cramming everything into poky-extras (since poky is j=
ust one distribution and there are others).
>
> I guess an alternative suggestion is to have each functional grouping lik=
e multimedia be its own layer and then you can have one or more maintainers=
 per layer. =A0Then you can just group these layers under the OE name (whic=
h is basically what Richard was suggesting but calling it poky-extras).
>

Chase, all,

Only a brief reply as I stuck with the flu at the moment (and maybe
that'll make my mails even less coherent than usual :-) )

Koen talks also about pull model and maintainers. Richards direction
seems to be to have layer maintainers (who probably pull changes)
This seems a good plan for the bsp and the distro layers.
But I am not sure that for the oe tree a pull model would be a good
step now, not even on the layer level (that is why I brought the
multimedia example).
Of course we could be fairly open to maintainer for a layer if we
wanted to.In a sense in OE everyone can change everything, and that is
no good either.
I'd love to see some more info on how we propose to deal with that part.

The concern I have of this proposal compared to poky-extras was that
we might see the same same recipe surface at different places, which
does not seem to desirable.

BTW: I am seeing poky as a build system (actually iirc the official
name is platform builder) not as a distro.

Back to my orange juice. Frans


