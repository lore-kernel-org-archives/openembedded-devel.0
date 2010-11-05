Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PEHKB-0002bz-8k
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 09:07:17 +0100
Received: by iwn42 with SMTP id 42so2575728iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qeidqz/diuSJ/tDXbNHP1MD3IzViHoYfnpwLVIzmYLY=;
	b=Ao4E/KMRQxMRGAHsoO+d7q56tfvBAH2A96t290h1Z1WDfxYK8x867FUk8lA39m1m1S
	BMvFoYrPilxA+PhCz/H/Lra5xf+z4LTg0GbIG6UX5Mtqri7UgBaK2nuNtJ4c1ZsiAYhw
	XqnN1s7LuUeaXlN3KnIiLIrAqU828TaBFwR80=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VZ0mQWhI4eAdkKTD5wyy2h9RingJsMHd2bHDrhdVoGG5GZbCjH8+MIgq0v5W9zw0bL
	GTtEuBppNmr9V7usAM6ZpDEFjiaKLJ16BxYQGuk/0sXTB3Qg++zW1EZ8kMG6ySaVQ6LH
	rq0cpPDVMDQDwce0chgJIxwcnrt/etwbGdY4Q=
MIME-Version: 1.0
Received: by 10.42.74.137 with SMTP id w9mr1261347icj.201.1288944372018; Fri,
	05 Nov 2010 01:06:12 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 5 Nov 2010 01:06:11 -0700 (PDT)
In-Reply-To: <20101105073448.GD3702@excalibur.local>
References: <AANLkTin8J-vi624U2Z4Emr=Zajq0+CsSnFR=a8+kjuOv@mail.gmail.com>
	<20101105010014.GA6115@denix.org>
	<20101105073448.GD3702@excalibur.local>
Date: Fri, 5 Nov 2010 09:06:11 +0100
Message-ID: <AANLkTin2SRV5M5GEfgVkj4hDeqdi5p7O1e7jS90DHcC=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Moving to layered structure of openembedded metadata
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
X-List-Received-Date: Fri, 05 Nov 2010 08:07:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/5 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> On Thu, 2010-11-04 at 21:00, Denys Dmytriyenko wrote:
>>
>> That is already being discussed and decided. See the following previous =
topics
>> on the mailing list...
>
> To clear this up a bit. There can't be a real decision for now. Not all
> developers have been present at the OEDEM and we haven't discussed =A0eve=
ry detail
> their either. :)
>
> Most, if not all, people liked the idea during the OEDEM discussions, but=
 we
> would need more input on problem that this may rise. As it stands I'm hap=
py to
> see Khem coming up to put this on the ml. :)
>
> One I currently see is how we can keep it all working when the layers are
> maintained in different places and what kid of combinational explosion we=
 will
> have with layers in different places.
>

Good points!

To keep things working I feel it is important to minimize the inter
layer dependencies (and make the ones that exist explicit).
My suggestion is that every layer has a maintainer/custodian/owner or
whatever name you want to give it who is responsible to keep the layer
in good shape.
Presumably this means we get a structure where there are two versions
of a layer: the last validated/integrated/accepted one and the working
one.

Frans


