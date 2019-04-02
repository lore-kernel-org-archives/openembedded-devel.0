Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4628D79C86
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 16:22:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44YZHW2dBpz3G;
	Tue,  2 Apr 2019 18:22:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554222152;
	bh=Xp/xYlU9FqW0abYeRVmDLP6MUb/qeCtcXAgwpoog1EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNfk4qZQIEjcsiWa0Eygx0XvzFB2kYar9cKCH6skrcIGe+WV1wtOKz/vIYdSFe+XF
	Qdt5jYZYsI9F03qiuSuJMVOxtJGm9zfLpUMQVQ1e9JhIDHlNusWcmeNQoYHXyRh4JE
	ZtvBP72Hc+HeJ68jTnNTmGi/39FtjF1Sak3cIMG/tywL4UhyS8dIu9lLpY3RGTAp0I
	QqdmE2ZHUF/d7ZIrGHWycDB+39uCcwm6Ts5zh5WksrM0CoWLJHStBtlikaAdli5cK2
	SwS4mCLg51xdxVEcFzXHj9uD+A7RBIzh5wb9gWXgBYo2q3N93kAw/+apSHa6LTKolo
	IyfpC6AsSHl4DhHkFvfGTVMXrcGk+VSKjTibeU+tcprs7tQG7VjoRwcxdaz8SDWLxJ
	l3Kk2vNEiLbSBFTo/OsGdgwV328tjHACyKyxfRJK0LsgWYZZkJ1OXV4dsSUXhn/hWw
	NT4eWve8p4iyuCbWoYQoVzqg9qfCpowICXclWMsg/BXF4SqyoxRsQuWmFKcpQ+nEoR
	iaPsPNYqs2pg972aUhkALDHoem0DuMkojv9XGh5zXJfPjzoysrkD9dLBsgf0oZMpwJ
	aXssX54XyC/aepn2c0ngYN72C4DDRGwyd1RCHKdYixX2UgQCfd1QstcFEoBcXDVIax
	U+kscaHM0eVxAEmEJ+j3Tddc=
Date: Tue, 2 Apr 2019 19:22:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Message-ID: <20190402162229.GA24313@localhost>
References: <20190204145940.17783-1-bunk@stusta.de>
	<a8c5c5d2-886e-5689-2a43-b4615df3a0bf@balister.org>
	<20190204221453.GE17997@localhost>
	<CAB2nKc9junw1S9xreQy-QSePg5nFvDZtyjB2uwRgPM3P3KO7+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAB2nKc9junw1S9xreQy-QSePg5nFvDZtyjB2uwRgPM3P3KO7+Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][thud][PATCH] Add czmq (C bindings for ZeroMQ)
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
X-List-Received-Date: Tue, 02 Apr 2019 16:22:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 02, 2019 at 05:50:56PM +0200, Vincent Prince wrote:
> Hi Adrian,

Hi Vincent,

> I'm planning to send patches for new stable zeromq/cppzmq (4.3.1) and czmq
> (4.2.0).
> I didn't saw your recipe before so I made a really short one, and I'm
> wondering why you defined custom PACKAGES for czmq recipe ?

for having the library packages named libczmq* instead of czmq*,
and also getting a separate czmq package for the zmakecert binary.

> Best regards,
> Vincent

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


