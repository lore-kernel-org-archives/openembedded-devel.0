Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PV96Z-0002yg-6h
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 21:46:43 +0100
Received: by wyb40 with SMTP id 40so4432566wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 12:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=GO8gvn/geyyZLf+aWAKTj0Sedb4yb7/CzGLZz6J0zxs=;
	b=OUCuCZfwS/q6Q7weEdfElFomgEJEkmHeZHetW0IeZmTJRTf33toOSf9ovGNa7qGruz
	WOhIe5q1nmJwy8XNAq49PHWj8diIUuLxNGEDLw3KOwrYMG7glgH4WAQWSRGBE9ZX54iN
	bbroUf8rQYpI4R80RzktB6uH2X3F5sAK+wAhc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=YEwJkZ01Cqs+K7tD+LRsd27OZ9jl2u+4WAUX/v8fwJ0imnIGpOkdc60Ivmqr9FIcR7
	WnIjZMPd6GvgavYH2O3oHGCJ1cezfi0rmiONCvCyiu86dLIt5pL2nu6ONFIl1jrMNZN1
	/H2sdhvn3eQ/jsktKeEEdseOfMx6+YvQY8PKQ=
Received: by 10.216.165.85 with SMTP id d63mr6763817wel.12.1292963983897; Tue,
	21 Dec 2010 12:39:43 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 21 Dec 2010 12:39:23 -0800 (PST)
In-Reply-To: <AANLkTi=NMydMgVW4GF10we=_csy+gtpncR-5Dq4vmVJc@mail.gmail.com>
References: <ienu66$5gf$1@dough.gmane.org>
	<AANLkTimSZHSb23N1opQc=zQ4cNgsEzA_jaO_rn0=pV3o@mail.gmail.com>
	<4D10F69B.8080604@mentor.com>
	<AANLkTi=NMydMgVW4GF10we=_csy+gtpncR-5Dq4vmVJc@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Dec 2010 13:39:23 -0700
X-Google-Sender-Auth: iJcnf1XrdMfi8lg6uY1yXeYdt8Q
Message-ID: <AANLkTin8BiwPE+hOGrV5tL3NFWH0H=ADKATxOyi3fb85@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Dec 2010 20:46:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 12:25 PM, Cliff Brake <cliff.brake@gmail.com> wrote=
:
> On Tue, Dec 21, 2010 at 1:48 PM, Tom Rini <tom_rini@mentor.com> wrote:
>
>>> yes this is something what we should do. We need to setup gitolite on
>>> the git server
>>
>> Can I just put in my 2 cents for some github love? =C2=A0Chris got me st=
arted
>> using it and I'm quite happy. =C2=A0It'd also be less admin work and sin=
ce I
>> forked Chris' tree, my space usage is still practically nil (I'm not sur=
e
>> about his), so the free accounts are fine.
>
> I'm sure our gitserver will never compare to github in features, but
> it seems like there is a fundamental limit in that github cannot
> possible host every git repo on the planet, especially for larger
> projects like OE where you have a lot of people pulling. =C2=A0I think
> there is some value in:

Like Tom says, each user has a limit of what they can store with a
free account.  Any single git repository doesn't take much space.
When someone wants to do some personal work, they fork the upstream
repo into theirs (so they now have a single copy of the oe repository
in their account), and they work there.  I don't think space is much
of a concern.  The other points, about branding, etc are valid.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


