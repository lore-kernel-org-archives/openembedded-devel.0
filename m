Received: from caiajhbdcahe.dreamhost.com ([208.97.132.74]
	helo=homiemail-a23.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NGShD-0001ce-OJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 08:35:22 +0100
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPA id BDCF44B0060
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 23:33:43 -0800 (PST)
Message-ID: <4B18BB50.2050505@SSpaeth.de>
Date: Fri, 04 Dec 2009 08:33:36 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>
	<1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
In-Reply-To: <1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 208.97.132.74
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] task-base: Introduce DISTRO_apm and convert recipes to use it.
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
X-List-Received-Date: Fri, 04 Dec 2009 07:35:23 -0000
X-Groupsio-MsgNum: 14824
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig634593D32A6A402896365797"

--------------enig634593D32A6A402896365797
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sebastian Spaeth wrote:
> --- a/recipes/matchbox2/matchbox-panel-2_svn.bb
> +++ b/recipes/matchbox2/matchbox-panel-2_svn.bb
=2E..
> +
> +DISTRO_apm ?=3D "apm"
=2E..
> -DEPENDS +=3D " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",=
d)}"
> +DEPENDS +=3D " ${@base_contains("MACHINE_FEATURES", "${DISTRO_apm}", "=
apmd", "",d)}"

This change is of course bogus and would not go in!
spaetz


--------------enig634593D32A6A402896365797
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksYu1YACgkQVYX1jMgnoGJd0gCgijBbDCe4vuKIFk9vKCLzdJVd
G+wAniaUmrNdLdHBJ5WRx0VL4/8VUkq1
=hn+/
-----END PGP SIGNATURE-----

--------------enig634593D32A6A402896365797--
