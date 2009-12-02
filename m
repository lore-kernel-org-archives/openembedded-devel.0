Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NFofY-0002lm-PG
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 13:51:00 +0100
Received: from homiemail-a19.g.dreamhost.com (caiajhbdcahe.dreamhost.com
	[208.97.132.74])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 764EF17A36B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 04:49:20 -0800 (PST)
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPA id 1A56B604069
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 04:49:17 -0800 (PST)
Message-ID: <4B16624C.3090400@SSpaeth.de>
Date: Wed, 02 Dec 2009 13:49:16 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Proposed change to om-gta02.conf
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
X-List-Received-Date: Wed, 02 Dec 2009 12:51:00 -0000
X-Groupsio-MsgNum: 14787
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDAD60C952FD12AEBC12705DF"

--------------enigDAD60C952FD12AEBC12705DF
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I would like to propose a change to om-gta0[1|2].conf:


+ module_autoload_g_ether =3D "g_ether"


Many other machines also use that already, and the name is generic
enough to work with all kernel variants that we have. Also, having a
Freerunner but not being able to connect to it via USB does not make
sense in most cases.

Thanks for feedback,
spaetz


--------------enigDAD60C952FD12AEBC12705DF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksWYkwACgkQVYX1jMgnoGKMygCeL+K6cFhED6Mn8sIUYAGp8Yah
VDMAnAmBa5B8CN8X/N5gpHWuRLmXMUgS
=47fB
-----END PGP SIGNATURE-----

--------------enigDAD60C952FD12AEBC12705DF--
