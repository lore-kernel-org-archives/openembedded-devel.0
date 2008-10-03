Received: from [147.32.96.3] (helo=hades.mk.cvut.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Martin.Jansa@mk.cvut.cz>) id 1Klh4Y-00032S-Uc
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Oct 2008 11:35:42 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by hades.mk.cvut.cz (Postfix) with ESMTP id AB6AF2E3EC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2008 11:31:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mk.cvut.cz
Received: from hades.mk.cvut.cz ([127.0.0.1])
	by localhost (hades.mk.cvut.cz [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dhgeH0M805ty
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2008 11:31:25 +0200 (CEST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by hades.mk.cvut.cz (Postfix) with ESMTP id 8816B2E3EAC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2008 11:31:25 +0200 (CEST)
Date: Fri, 3 Oct 2008 11:31:09 +0200
From: Martin Jansa <Martin.Jansa@mk.cvut.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081003093109.GA4383@jama.home.cz>
References: <48E5857B.1070301@whitby.id.au>
MIME-Version: 1.0
In-Reply-To: <48E5857B.1070301@whitby.id.au>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: git fetcher failure?
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
X-List-Received-Date: Fri, 03 Oct 2008 09:35:43 -0000
X-Groupsio-MsgNum: 6070
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2008 at 12:07:47PM +0930, Rod Whitby wrote:
> Anyone know why this git fetch fails?
>=20
> The git tarball is downloaded from the angstrom tarball stash, but then
> when it is unpacked the specific git revision required can't be found:
>=20
> > fatal: failed to unpack tree object daf0729351631f93f9f2f22af33d46658c6=
f5d68
>=20
> I have already tried blowing away anything in the downloads area related
> to this git repo ...

I dont know how bitbake figure out which ${SRCREV} to use, but this
revision daf0729351631f93f9f2f22af33d46658c6f5d68 seems to be in
framework.git not fso-gpsd.git
http://git.freesmartphone.org/?p=3Dframework.git;a=3Dcommit;h=3Ddaf07293516=
31f93f9f2f22af33d46658c6f5d68

maybe its messed up be this commit message, where is broken link to
this revision
http://git.freesmartphone.org/?p=3Dfso-gpsd.git;a=3Dcommit;h=3Dfd1cd578d6ba=
9fa13aadceb59a9b46345108583b


--=20
uin:136542059                jid:JaMa@jabber.mk.cvut.cz
Jansa Martin                 sip:jamasip@voip.wengo.fr=20
JaMa                        =20

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkjl5l0ACgkQN1Ujt2V2gBwzDwCgjMI7f7dE3x20MzM9Whq3REGr
68wAoI/xvGCkw+q8KL18dcceCDsUSIhT
=CGt/
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
