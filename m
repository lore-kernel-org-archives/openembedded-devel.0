Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NDxT2-00053I-9Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 10:50:23 +0100
Received: from homiemail-a21.g.dreamhost.com (caiajhbdcahe.dreamhost.com
	[208.97.132.74])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 8204017DA16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 01:48:48 -0800 (PST)
Received: from [192.168.1.154] (unknown [195.190.181.110])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPA id 22AD4300059
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 01:48:45 -0800 (PST)
Message-ID: <4B0FA07C.6070501@SSpaeth.de>
Date: Fri, 27 Nov 2009 10:48:44 +0100
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
Subject: bootchart-lite uses "install" in postinst
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
X-List-Received-Date: Fri, 27 Nov 2009 09:50:23 -0000
X-Groupsio-MsgNum: 14706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigC97150DC564567A3AD23AF8D"

--------------enigC97150DC564567A3AD23AF8D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

bootchart-lite uses "install" in postinst, which was not available on my
device.

Would it be preferable to RDEPENDS on coreutils, or should we be using a
simple "mkdir /etc/bootchart-lite" in postinst.

All it does is creating that empty dir.

spaetz


--------------enigC97150DC564567A3AD23AF8D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksPoHwACgkQVYX1jMgnoGIrpgCcDGTRZWR2sQI0MdZ3x4jYcAjF
3WwAmgIgb3ti/mnFOYZ09IZdnrKdv3u/
=h5Oe
-----END PGP SIGNATURE-----

--------------enigC97150DC564567A3AD23AF8D--
