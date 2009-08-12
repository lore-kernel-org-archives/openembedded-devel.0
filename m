Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MbGRV-0007Tv-3s
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 18:12:49 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MbGBb-0004kA-Mo
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 16:56:23 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MbGBb-0007uO-HJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 16:56:23 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200908121433.31479.marcin@juszkiewicz.com.pl>
References: <4A81BE84.6010607@atmel.com>
	<200908121433.31479.marcin@juszkiewicz.com.pl>
Date: Wed, 12 Aug 2009 16:56:19 +0100
Message-Id: <1250092579.12282.73.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Wed, 12 Aug 2009 16:12:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-08-12 at 14:33 +0200, Marcin Juszkiewicz wrote:
> Dnia wtorek, 11 sierpnia 2009 o 20:55:00 Ulf Samuelsson napisa=C5=82(a):
> > I introduced the possibility to build linux using
> > make <board>_defconfig, instead of using a
> > defconfig in a board directory under linux.
> > LINUX26_DEFCONFIG needs to be defined.
>=20
> Interesting, will check. I see a problem anyway because linux_*.bb=20
> recipes by default use defconfig as part of SRC_URI. But we can use=20
> empty file to satisfy it.

We've tried this kind of thing before on various platforms and it
generally seems to be a losing proposition.  Even if your kernel sources
are targetting just a single MACHINE, the kernel isn't quite modular
enough yet that you can truly have a "one size fits all" configuration
to suit all DISTROs.

Also, if you are relying on the defconfig from upstream, any
configuration change at all requires that you either patch it, or
re-issue the upstream tarball.  Neither of those are as convenient as
just editing the defconfig locally in OE.

So, in general, I think you're probably better off sticking with the
"defconfig in FILESDIR" paradigm.  That's not to say I'm completely
opposed to adding the option to use the one from upstream, but I think
you would need to be a bit careful about where you use it.

p.




