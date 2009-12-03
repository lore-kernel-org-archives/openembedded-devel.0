Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NG6WS-0008SG-6Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Dec 2009 08:54:47 +0100
Received: from homiemail-a18.g.dreamhost.com (caiajhbdcagg.dreamhost.com
	[208.97.132.66])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 436F917DE17
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 23:53:08 -0800 (PST)
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a18.g.dreamhost.com (Postfix) with ESMTPA id 1F7D8250065
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 23:53:05 -0800 (PST)
Message-ID: <4B176E5A.3020806@SSpaeth.de>
Date: Thu, 03 Dec 2009 08:52:58 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <hf647c$erv$1@ger.gmane.org>
In-Reply-To: <hf647c$erv$1@ger.gmane.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: fso-apm breakage redux
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
X-List-Received-Date: Thu, 03 Dec 2009 07:54:47 -0000
X-Groupsio-MsgNum: 14806
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig5BC122D15C5AC93FB88EB090"

--------------enig5BC122D15C5AC93FB88EB090
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> Hi,
>=20
> fso-apm is now getting dragged in OE by default due to the excessive us=
e
> of RPROVIDES and RCONFLICTS.
>=20
> Please remove those and find a better solution (e.g. using u-a to
> replace regular apmd) instead of messing up everyones build.

According to our information the RPROVIDES would only be used if you
added that package to your dependency list somewhere. Apparently we were
wrong, sorry for this.

I think we could take up your recent proposal here again and do a

DISTRO_PROVIDER_APM ?=3D "apm"

and include that in RDEPENDS in task-base-apm (and all recipes pulling
apm). This would allow any distro to override the default apm provider
but not cause hassle for other distros.

Would that be acceptable? Is the variable naming ok? Open for
suggestions, I am not familiar with OE conventions here.

spaetz

P.s. u-a would install both apm and fso-apm which seems less optimal
here, given that we really only want one.


--------------enig5BC122D15C5AC93FB88EB090
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksXbmAACgkQVYX1jMgnoGLwIgCeMT5T8ebWu2Bod46G/9LzIq/+
JHsAn0uKozALauGncOIOyRy+ceR6E3Xa
=ZDlS
-----END PGP SIGNATURE-----

--------------enig5BC122D15C5AC93FB88EB090--
