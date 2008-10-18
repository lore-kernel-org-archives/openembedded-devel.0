Received: from [147.32.96.3] (helo=hades.mk.cvut.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Martin.Jansa@mk.cvut.cz>) id 1KrGa0-0002rB-Mh
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 20:31:12 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by hades.mk.cvut.cz (Postfix) with ESMTP id 149DD2E4166
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2008 20:31:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mk.cvut.cz
Received: from hades.mk.cvut.cz ([127.0.0.1])
	by localhost (hades.mk.cvut.cz [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fMc3Z2sZ3BbX
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2008 20:31:01 +0200 (CEST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by hades.mk.cvut.cz (Postfix) with ESMTPSA id DC9E32E4745
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2008 20:30:55 +0200 (CEST)
Date: Sat, 18 Oct 2008 20:30:16 +0200
From: Martin Jansa <Martin.Jansa@mk.cvut.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081018183016.GA4310@jama>
References: <20081017131704.GA4334@jama>
	<200810172041.10116.openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <200810172041.10116.openembedded@haerwu.biz>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: checksums.ini - should check only against filename not	uri_src
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
X-List-Received-Date: Sat, 18 Oct 2008 18:31:12 -0000
X-Groupsio-MsgNum: 6290
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2008 at 08:41:09PM +0200, Marcin Juszkiewicz wrote:
> If they have different checksums then they are not same.

And they shouldn't be fetched to the same DL_DIR in the first place, so
checksums.ini can define both with pn-filename, and then bitbake would
show an error when the other file would be stored in DL_DIR.

> Your patch lack part which would write simplified checksums.ini file.=20
>=20
> I think that mirrors informations would be still handy as there were=20
> ideas to write wget-like tool for fetching sources which would use own=20
> database for informations about source locations. We could make use of=20
> format like this:
>=20
> [DirectFB-1.1.0.tar.gz]
> url0=3Dhttp://www.directfb.org/download/DirectFB/DirectFB-1.1.0.tar.gz
> url1=3Dhttp://www.directfb.org/downloads/Old/DirectFB-1.1.0.tar.gz
> md5=3Dda30fa2748c7501913c8832a83e654ab
> sha256=3D0ee87256a278079955d78e4f235c15a174afbb507b5434f1966cd3e5f5a3f23a
> =20
> And any change to checksums.ini format would require updating=20
> contrib/source-checker/ scripts as they are used to check source mirrors=
=20
> integrity and to sort checksums.ini file.

Thanks for comments.

I would like to improve the patch and add parts for scripts too, if you thi=
nk it
could be used. From discussion on irc it seemed like global checksums.ini
is not a good idea at all, at least because of high probability of merge
conflicts, and that checksums should be moved to .bb files or defined on
per-package files.

Regards,

--=20
uin:136542059                jid:JaMa@jabber.mk.cvut.cz
Jansa Martin                 sip:jamasip@voip.wengo.fr=20
JaMa                        =20

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkj6KzgACgkQN1Ujt2V2gByxmgCbBux6q77wwBqC5G5U8wtypNet
vU8An21fWjvNTQffQd8kmiS0Afzh8Gl7
=kp6l
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
