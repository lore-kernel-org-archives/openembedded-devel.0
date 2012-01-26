Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqVgf-0003XR-KS
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 21:12:49 +0100
Received: by lahc1 with SMTP id c1so486594lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 12:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=9ttwJ61V1KBD9tg00sSHweDSKMqJuAKAuViIELTBmr8=;
	b=X98RGzh0pmccQVYf3rRy5M87DIGr7qsltn2jMKSrxvXMqDvLLwtSCsWV1G4kQ436Bw
	Tj4aHDuQYzkpvquKvev7kXTByzWUUM0R8h1tO0lMVT75Bi2qFgtAi8FfEiBy1RorRCX6
	EHDRm06FD0hnU3MPoAqwdRlQIn2GMsplNFrj4=
Received: by 10.112.99.136 with SMTP id eq8mr1013680lbb.42.1327608301373; Thu,
	26 Jan 2012 12:05:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 26 Jan 2012 12:04:31 -0800 (PST)
In-Reply-To: <20120126090245.GB3747@jama.jama.net>
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
	<1908796.glHMrEiIxU@helios> <4F202735.8040405@balister.org>
	<CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
	<20120126090245.GB3747@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jan 2012 12:04:31 -0800
Message-ID: <CAMKF1spa+gg5vi_Fyg7rjQ-4cO8D_bS2cDQRCRPFPALDEaGUWw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Thu, 26 Jan 2012 20:12:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2012 at 1:02 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>
> What I'm missing is use-case when for example with libsoup-2.4 I'm
> adding unstable version, because actually webkit-efl has random runtime
> crashes with stable version, but works better with unstable one.
>
> So I want to be able to add recipe with D_P =3D -1 which would say, that
> this recipe is not used unless someone really wants and adds P_V to his
> layer to get it (I guess people using browsers based on webkit-efl).
>
> But right now it will pick this unstable version from meta-oe by default
> and you have to add P_V for that stable version in oe-core (and keep it
> up2date as long as stable version in oe-core is updated).
>
> And I guess the same use-case D_P should be used for all "not so well
> tested" or "deprecated" recipes in meta-oe or any other layer.

yes thats a good thing to do. But I still would prefer a layer separation
from meta-oe
>
> Even if there is meta-deprecated layer.. I guess nobody would prefer all
> deprecated recipes, but just some of them (ideally by pinning them with
> P_V).
>

yes meta-deprecated by default should be added to BBMASK

> Cheers,
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com


