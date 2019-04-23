Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 161146C154
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 06:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44pCfv57SSz4V;
	Tue, 23 Apr 2019 08:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555999688;
	bh=uZn7NcSapKeyl/cUAq9iAi9Q4/17J1ObNLuof8eYHIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlLdKaaOkKOHwgmUceNCa0D86UaV4yOp/Mb+AcSzIyahiD4RXQNDXyMts1BzlZiV4
	UvwZTMDbe0KvHDPrR69xrDM8DHVbSn6WrbM176ntlbJ5nRdAPae3UnxHLrp5zf7GTa
	IWHSgs+PuL+ZKTAV+86ONyqzdlt72Md1hqxLmPUfNJSulMsteOC3GZf8OhjN5WFvhl
	iQprnbCJS4JBZVibKfj0xwZ5uFMx74YEAM1vD6A6uvKefU6sEtE2LMEpG1ha8CXqbl
	LfYZ3dHBr0cwUQ0py64sLkrCnWqKwDPBpORIutQYS2jxFppKKYzBLVGVGeBLUORUkd
	XwXvxqwgd2yMq8O+z6bRBXzMcND3AnEvgpn8mBH/s69MuWJKcU1a8adnjZrMN40p9f
	9JhBXlUjSljqTVTsi8xIe3G7LPoqoJFrYlF0djq2g0PyDhrjHilNRM/9eoZMnYcETM
	TXMrR23nSz1V+yY19L9/oSVRSY2zNC3yoBcpNcwKrAX4s/cCPPOoPm0kMGEWp6AQaC
	M5hd0NcKJ2OX7Uj/UcEkyGEJrAakk9Fu0qG2JoBmb5mqTcCr5gxCMiTliLcloxstk4
	8QQfIk4XLSdLHoSmpFNjtWd0oH2ZvrwqrsvggQ1Ngvl2Zm6r6u28DCa407aDNR2GU5
	18VjfRGDuNYrDYJA573Ae9wE=
Date: Tue, 23 Apr 2019 09:08:05 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190423060805.GD18826@localhost>
References: <20190422234617.5419-1-schnitzeltony@gmail.com>
	<e9587755-4b63-90cf-1738-930b808da883@betafive.co.uk>
	<CALbNGRQdfS-xNdheKuj=AA1zaChsA_g1gb6kMkiU8jGXngfw0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQdfS-xNdheKuj=AA1zaChsA_g1gb6kMkiU8jGXngfw0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] vlc: rework qt PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2019 06:08:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 23, 2019 at 02:07:02AM +0200, Andreas Müller wrote:
> On Tue, Apr 23, 2019 at 1:55 AM Paul Barker <paul@betafive.co.uk> wrote:
> > On 23/04/2019 00:46, Andreas Müller wrote:
>...
> > > -PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> > > +PACKAGECONFIG ?= " \
> > > +    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
> > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> > > +    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)} \
> >
> > I don't like this change based on BBFILE_COLLECTIONS, it's just a
> > different way of having things change when you add an extra layer. We
> > wouldn't want an unconditional bbappend in meta-qt5 to set this and so
> > we don't want to set it here when that layer is added.
> >
> > Perhaps we should have qt5 as a distro feature instead?
> Isn't that a different naming for the same thing not working properly
> if you don't have meta-qt5 in layers?

Isn't this a reason for moving vlc out of meta-openembedded?
Or alternatively moving qt5 to meta-openembedded.

> Andreas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


