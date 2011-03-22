Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1zWQ-0002wf-3j for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 12:13:10 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1zUg-0000Cq-JO for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 11:11:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CEA83D9.1070109@eukrea.com>
References: <AANLkTi=5Ypor=R4EXQV7D7gkQHFtPu+WukVMz1p57d3N@mail.gmail.com>
	<4CEA83D9.1070109@eukrea.com>
Date: Tue, 22 Mar 2011 12:11:21 +0100
Message-ID: <1300792281.26064.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: task fetch fails for <anoncvs.handhelds.org> (was: ipkg-utils)
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
X-List-Received-Date: Tue, 22 Mar 2011 11:13:10 -0000
X-Groupsio-MsgNum: 30498
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-6kkgSE7M0FHeDxmu+X+t"

--=-6kkgSE7M0FHeDxmu+X+t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,


Am Montag, den 22.11.2010, 15:53 +0100 schrieb Eric B=C3=A9nard:

> On 22/11/2010 15:36, Frans Meulenbroeks wrote:
> > ipkg-utils has two issues:
> >
> > - the fetch from handhelds.org failed, so we need an update of the SRC_=
URI
> > - the recipe is misnamed. It is ipkg-utils_1.6+cvs20050404.bb but it
> > says SRCDATE =3D "20050930"
> >
> > I can fix the latter, but not the former.
> > We need to resolve the handhelds.org references before the release!
> >
> I'm testing a patch which adds PREMIRROR to oe's mirrors which workaround=
 the=20
> handhelds CVS fetching problem and should be enough for the release.
> I hope to send it tonight or tomorrow.

did you commit something to tackle this problem? I could not find
anything in the commit log.

I am getting the following error with `bitbake e-image` which depends on
`rosetta`.

        NOTE: Running task 1363 of 2090 (ID: 8, /oe/openembedded/recipes/ro=
setta/rosetta_cvs.bb, do_fetch)
        cvs [checkout aborted]: connect to anoncvs.handhelds.org(128.31.0.2=
3):2401 failed: Connection refused
        NOTE: package rosetta-0.0+cvs20090514-r4: task do_fetch: Started
        WARNING: /oe/bitbake/lib/bb/fetch/cvs.py:140: DeprecationWarning: C=
all to deprecated function bb.mkdirhier: Please use bb.utils.mkdirhier inst=
ead.
          bb.mkdirhier(pkgdir)
       =20
        NOTE: package rosetta-0.0+cvs20090514-r4: task Fetch failed: Unable=
 to fetch URL cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=3Drose=
tta from any source.: Failed
        ERROR: Function 'Fetch failed: Unable to fetch URL cvs://anoncvs:an=
oncvs@anoncvs.handhelds.org/cvs;module=3Drosetta from any source.' failed
        ERROR: Task 8 (/oe/openembedded/recipes/rosetta/rosetta_cvs.bb, do_=
fetch) failed with exit code '1'
        ERROR: '/oe/openembedded/recipes/rosetta/rosetta_cvs.bb' failed


Thanks,

Paul

--=-6kkgSE7M0FHeDxmu+X+t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2Ig9kACgkQPX1aK2wOHVipuQCfZENcaFtzulF+K0wuOp/WRHgn
y6AAn3dNHagn/wGcwjkv4i18oxHSLEVh
=6vS5
-----END PGP SIGNATURE-----

--=-6kkgSE7M0FHeDxmu+X+t--
