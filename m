Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MdnXd-0000oL-21
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 17:57:37 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD0060C8EA for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 17:40:24 +0200
Message-ID: <4A8C1CE7.1050106@atmel.com>
Date: Wed, 19 Aug 2009 17:40:23 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250551346.5083.3@zaurus>
	<1250591188.3555.5.camel@utx.utx.cz>	<4A8AC753.8000008@atmel.com>
	<1250620560.4550.17.camel@utx.utx.cz>
In-Reply-To: <1250620560.4550.17.camel@utx.utx.cz>
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Wed, 19 Aug 2009 15:57:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-Printable

Stanislav Brabec skrev:
> Ulf Samuelsson wrote:
>> Stanislav Brabec skrev:
>>> Stanislav Brabec wrote:
>=20
>>> It didn't work for kdrive based builds, because kdrive recipe wants
>>> libxcalibrate, but xtscal wants xcalibrate. One dependency chain
>>> overwrites the another with undefined result depending on the build
>>> order.
>> What is the difference between "xserver-kdrive-1300" and
>> "kdrive based builds" ?
>=20
> Just a package selection for particular target that causes different
> order of overwriting of staged files.
>=20
>> Do you mean it does not work with later revisions of xserver-kdrive?
>=20
> xserver-kdrive-1300 is the oldest version in the tree. If=EF=BB=BF the =
latest
> libxcalibrate works with it, I guess that it will work with any newer
> version.
>=20
>> Should we try to focus on xorg-xserver-1.6.1 which seems to have kdriv=
e
>> support?
>=20
> Are you sure that it is "kdrive support" and not just "kdrive in the
> source tree", as it was in past (i. e. deprecated and without support)?
>=20

No, I am on really deep water here.
This weekend was the first time I ever looked at X-Windows source.
Thankfully there are competent people here to answer questions.
Phil Blundell seems to have written most of the files I looked at!


> Well, anything newer than ancient xserver-kdrive-1300 working on
> machines like spitz would be a win.
>=20
> With a highly modularized Xorg, upgrade to full Xorg may be an option,
> as it could support modern desktop extensions.
>=20
> It also seems, that Xorg has much better performance in rotated fbdev
> driver than xserver-kdrive-1300.
>=20
> I was even able to run Xorg with OpenGL (Mesa emulated) on my Zaurus
> (5-8FPS in glxgears).
>=20
> Problems that block upgrage:
>=20
> - broken keyboard driver (keyboard map loads only sometimes, some keys
> or autorepeat doesn't load, kdrive > 1.3.0.0)

I think I saw that Autorepeat requires an extension which has been remove=
d

> - support for different orientation of touchscreen and display (both
> kdrive > 1.3.0.0 and xorg)
> - working XRandR in fbdev driver (xorg, last time I tested it, just a
> code for runtime rotation was missing, rotation itself was already
> implemented)
>=20
>=20
> _______________________________________________________________________=
_
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Best Regards
Ulf Samuelsson



