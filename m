Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NeE0E-00005p-6K
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 21:45:13 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id E032F1D360E2; Sun,  7 Feb 2010 21:42:35 +0100 (CET)
Date: Sun, 7 Feb 2010 21:42:35 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100207204235.GT24852@ibawizard.net>
References: <1264620764-22806-1-git-send-email-ynezz@true.cz>
	<hkn3ds$ci0$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hkn3ds$ci0$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] rt2x00: new recipe for rt3070 version 2.1.2.0
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
X-List-Received-Date: Sun, 07 Feb 2010 20:45:13 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Koen Kooi <k.kooi@student.utwente.nl> [2010-02-07 20:14:05]:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 27-01-10 20:32, Petr =A9tetiar wrote:
> > This patch adds support for rt3070 kernel driver, used for example by=
 the new
> > Belkin F6D4050v2 USB WiFi stick.
>=20
> How does this differ from recipes/ralink/rt3070_2.1.1.0.bb and why is i=
t
> in another directory?

Hm, looks like I overlooked this recipe:( I've seen rt61 and rt73 recipes=
 in
rt2x00 (was searching for packages starting with 'rt') dir and I thought,=
 that
this dir is appropriate for my recipe also.  Anyway rt3070 is called 3070=
, but
it's 2870 with some mods, you can see outputs of 2870 in dmesg, even conf=
ig
file is called RT2870sta.dat, it's a weird driver but the only option.

There's a difference in my recipe also, I create empty RT2870sta.dat file=
,
because I was unable to get it working with it (what a driver reading con=
fig
files from userspace) and I use it with iwconfig successfully.

There's a bug[1] for it and probably can be closed, patch[2] which can be
discarded also. And FYI the direct links at Ralink's site don't work
anymore(you've to agree with GNU/GPL EULA :D before downloading it), so I
kindly asked Laibsch if he could mirror it on OE.

So, should I prepare a patch which will move recipes from rt2x00 dir to r=
alink
dir and move my recipe there(newer version)? Thanks for you time reviewin=
g my
patch.

1. http://bugs.openembedded.org/show_bug.cgi?id=3D5322
2. http://patchwork.openembedded.org/patch/1089/

-- ynezz


