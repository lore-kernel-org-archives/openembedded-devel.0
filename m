Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NBUR9-0005T5-TG
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:26:15 +0100
Received: from homiemail-a15.g.dreamhost.com (caiajhbdcaid.dreamhost.com
	[208.97.132.83])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 0FE4917C6AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 06:24:49 -0800 (PST)
Received: from [192.168.1.154] (unknown [195.190.181.110])
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPA id EE95176C073
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 06:24:43 -0800 (PST)
Message-ID: <4B06A6A7.1080204@SSpaeth.de>
Date: Fri, 20 Nov 2009 15:24:39 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <he689r$c57$1@ger.gmane.org>
In-Reply-To: <he689r$c57$1@ger.gmane.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_FEATURE changes
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
X-List-Received-Date: Fri, 20 Nov 2009 14:26:15 -0000
X-Groupsio-MsgNum: 14535
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig6C9B262E94562545C66D46A7"

--------------enig6C9B262E94562545C66D46A7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> Can someone please explain to me what
>=20
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1bfa409=
a3a28cee60c4800d3caf33ce3f100d4ca
> is trying to accomplish? It looks like this makes task-base unusable on=

> om-gta0X, am I right?

FSO/SHR based distros use fso-apm rather than "apm".
Using PROVIDES in fso-apm however means that it's pulled into other
distros too.
We could do this with a virtual/apm but that would mean we need to set a
preferred provider for all other distros too.

So the least intrusive change seemed to remove apm from om-gtaX.
Mickey (informally) agreed with me, and as this change is very limited
in scope, it went in. It is more distro than machine-specific I have to
admit.

Better suggestions on how to achieve this are welcome.

spaetz



--------------enig6C9B262E94562545C66D46A7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksGpqkACgkQVYX1jMgnoGLuCACbB0c23SVtd03d64MBE9JlzED1
caEAnjLhzcFUaSRiQooXEG1I3rgdbHsF
=9tWp
-----END PGP SIGNATURE-----

--------------enig6C9B262E94562545C66D46A7--
