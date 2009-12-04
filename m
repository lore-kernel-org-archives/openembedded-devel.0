Received: from caiajhbdcbhh.dreamhost.com ([208.97.132.177]
	helo=homiemail-a11.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NGVxe-000766-Oa
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 12:04:33 +0100
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPA id 7039F19406D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 03:02:53 -0800 (PST)
Message-ID: <4B18EC5B.8030704@SSpaeth.de>
Date: Fri, 04 Dec 2009 12:02:51 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>	<1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
	<hfahsd$ofp$1@ger.gmane.org>
In-Reply-To: <hfahsd$ofp$1@ger.gmane.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 208.97.132.177
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
X-List-Received-Date: Fri, 04 Dec 2009 11:04:34 -0000
X-Groupsio-MsgNum: 14837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig6B7291971D3528296F7DF494"

--------------enig6B7291971D3528296F7DF494
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> Don't forget to remove the (R)PROVIDES in fso-apmd which are causing al=
l
> the problems. Some comment as mickey, please use caps for vars.

I have pushed this now (using caps), to get angstrom fixed. I agree with
Phil that using "virtaul/apm" would be cleaner though, so I will be
working towards using that.

Removing the RPROVIDES now from fsp-apm.

spaetz



--------------enig6B7291971D3528296F7DF494
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksY7FsACgkQVYX1jMgnoGKpsQCfeIa/XA0NKud/Y+AMzb7PS6mi
z0QAn38tYTLiwmE0h6CMPS4DqCWzx+Sx
=F4Fh
-----END PGP SIGNATURE-----

--------------enig6B7291971D3528296F7DF494--
