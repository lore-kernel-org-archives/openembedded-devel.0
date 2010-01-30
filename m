Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NbCPJ-0001CS-Vo
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 13:26:39 +0100
Received: from [192.168.0.5] (e180161075.adsl.alicedsl.de [85.180.161.75])
	by drlauer-research.com (Postfix) with ESMTP id 20CE3584117
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 14:16:51 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11001300253t63c2b50bj32a2f0ec2c50aae5@mail.gmail.com>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org>
	<ac9c93b11001300253t63c2b50bj32a2f0ec2c50aae5@mail.gmail.com>
Organization: Vanille-Media
Date: Sat, 30 Jan 2010 13:24:11 +0100
Message-ID: <1264854251.31614.11.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Sat, 30 Jan 2010 12:26:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 30.01.2010, 11:53 +0100 schrieb Frans Meulenbroeks:
> 2010/1/30 Rolf Leggewie <no2spam@nospam.arcornews.de>:
> > Frans Meulenbroeks wrote:
> >> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
> >> DISTRO_EXTRA_INSTALL ?
> >
> > This has been discussed before, but not changed.  I think it made sense
> > back then and I think it makes sense now.
> >
> > I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
> > found for the variable.  Maybe IMAGE_EXTRA_INSTALL?
> >
> Actually mistyped tye filename, it was console-base-image.bb
> and in the beginning it says that it is an angstrom bootstrap image,
> so having angstrom specific env vars in it makes sense, but guess the
> name then should be angstrom-console-base-image.bb, just like other
> images are prefixed with openmoko, nylon, opie, slugos and whatever

Well, it used to be an angstrom recipe, but (as with many other angstrom
recipes...) it is very useful for other distros as well, so it has bgeen
renamed some time ago. 

A natural consequence of it being so versatile would be to change the
ANGSTROM_ vars to DISTRO_, so that would get my vote.

Cheers,

-- 
:M:



