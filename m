Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1283B7F9C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 23:51:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47DdYM5gWQzTd;
	Fri, 15 Nov 2019 00:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573775496;
	bh=ANx5CsN8iCwrDyNe6NveggeBgzmEZKIRFEXPmCdFVXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9gQlKmJRJi1nJVxWFzC5jZDu9EsZSixgTo/RjF8XvDTKiyZpJlHPGfgkUBlyX3g/
	oP7BPLC4HCIpbSNBZdfZIUF7G0guO336D5TKE6tNVtWJ32P800xr1dJGOJ5N/d8eV/
	BwFrRXW3zKgRmPQLtxi6euya/28fGxvhNhEFY7fdnaNeAFGY94ciOZlkvhyk3wtU6g
	7Y+m6FhNmTrT1fpbDSk+YrzoH4czgrzSggMGTygG3wx3vDphuRKoT5n/ZhUAxRCPn6
	lpi5CEEDtJHHexWTuI24qt813OReABs0dUNGGh/qI4Q9aa5Sq2Yez8WnvQye08A71l
	Z16kWU6bCzDA9aPar0QYnyW417KOooPTbfQ9F1xrOaQRIpC5iapDJpTaUl4pHA9+t3
	x4wMNKz8Xzgup/nh71WfgZDZ1JTttNOw07ZA8/b5rETBFyvfQr9tbIL86FoWDfHluf
	RnCqk+iMUltuheMNE4Y/r7AtgZH/gFUcL1ZQmTijKjOROKzqusBLEpHk9J6EzCcotg
	fLCVHPKH54FmPMGG+WXjAvyXkyCr818e79JO8/D8Oei4CMOaHd+oTA96oj5VGmceAc
	BEpQoTigggoYl3p4j6zO1asbuLsbfxlCN2NObDeOQTWUUvb4yKO7EVJLmhjK+6BDpk
	IX0ExeQHVZfllN584BBkCkOM=
Date: Fri, 15 Nov 2019 01:51:32 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191114235132.GA32743@localhost>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-16-schnitzeltony@gmail.com>
	<CAMKF1soTKvJ=uYgm-Q51yq8xGcissdwf4nKzR3qxXKwPTUXrgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soTKvJ=uYgm-Q51yq8xGcissdwf4nKzR3qxXKwPTUXrgA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 15/16] libwacom: initial add 0.33
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
X-List-Received-Date: Thu, 14 Nov 2019 23:51:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 14, 2019 at 01:39:01PM -0800, Khem Raj wrote:
> On Thu, Nov 14, 2019 at 11:51 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
> >
> > * it is a dependency for upcoming gnome-settings-daemon
> > * there are later versions of libwacom availabvle but due to genaration of
> >   udev-rule at build time these versions open nasty native dependencies:
> >   libgudev-native -> udev-native
> >
> > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > ---
> >  .../recipes-support/libwacom/libwacom_0.33.bb      | 14 ++++++++++++++
> 
> the latest release is 1.1, any specific reasons to not use that ?
>...

You missed the second bullet point above.

cu
Adrian

