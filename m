Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pfa2w-0004dH-Px
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 16:34:07 +0100
Received: by iyj18 with SMTP id 18so946253iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 07:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=JUSM9zOvOSOFlEUn3vEJHDzSKfTWXDI56oGsCo2Yf8w=;
	b=gwMaDjp9g96A0zaUSWz/TvdLVJU6HuiXhHn1MpZ7oHwhm2V+nPN5a426p5UFDIJmmF
	RxD47H9EY9xbx8LzB/I5Q6d2rJll8D8DSWsMsYWd33Dyo4nsdns88IIeW6OACRoHInGx
	NaEQsUmbeGSxyb3Op8/h6VPp6dkHrkEmLrkt4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TFz+vJSV+ex4JEx4a7+4At/99dyqfQaQYh10XkLK26iW1crOasEuNV183N2BRzyLkl
	B29plsxxH3dsBTXq/MRpmSPIkS5e26HBhrOQr3mpeUaGVkPiJE+taFXrVceQNQ32whvG
	wRwByMV6LKRMdVuRZWiEN4wsE+6C0nRnOU0DA=
MIME-Version: 1.0
Received: by 10.231.36.5 with SMTP id r5mr984559ibd.134.1295451205982; Wed, 19
	Jan 2011 07:33:25 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 07:33:25 -0800 (PST)
In-Reply-To: <4D36F9BE.1010601@xora.org.uk>
References: <4D36F9BE.1010601@xora.org.uk>
Date: Wed, 19 Jan 2011 16:33:25 +0100
Message-ID: <AANLkTi=sJGSCRxSF6tFPhrGb=NKfmiLNURg-n-Gmgc3Z@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Jan 2011 15:34:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/19 Graeme Gregory <dp@xora.org.uk>:
> Hi, this email is sent as an ordinary member of OE.
>
> It seems to be on a technical level we are agreed that we should split
> parts of OE out into the so called openembedded-core which will have a
> stricter commit access and higher QA requirements on changes.
>
> I therefore think it is time to actually create the repository and let
> the people who are interested in merging the good stuff from poky with
> the good stuff from openembedded to create our "core". I don't think
> there is any need to wait on the political part of the Yocto/OE
> collaboration as its something we have agreed in principal to do anyway.
>
> I would request then that the TSC drive this forward with the server
> admins and create this repo so work can happen.
>
> Graeme

Graeme,

Seems  a fine plan to me.
Do we already have an idea what would be the starting base?
And do we already have an idea on the QA requirements we want to impose on this?
Lastly we might try to define some common understanding what is core
and what not.

I did some experiments with poky and found that some of the recipes I
needed were missing; some of them might perhaps become part of core
(e.g. i2ctools, squashfstools, libftdi, fastcgi), whereas others are
quite unlikely to end up in core (e.g. urjtag). For the latter we must
find another home (e.g. meta-openembedded), where hopefully we can
also raise the QA bar somewhat.

I'll happily contribute to raise the quality bar. However, if the goal
is shuffling recipes without significant QA improvement or if QA
improvement is optional, I'll probably pass.

Frans.


