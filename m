Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NSxYi-0002AO-Vl for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 19:58:16 +0100
Received: from g229060098.adsl.alicedsl.de ([92.229.60.98]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NSxWj-0002Z2-Nv for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 18:56:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262698046.3209.28.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100105095147.GA3433@rhein.zuhause.netz>
	<1262694630.3209.10.camel@mattotaupa.wohnung.familie-menzel.net>
	<1262698046.3209.28.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Thu, 07 Jan 2010 19:56:08 +0100
Message-ID: <1262890568.3218.7.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Tester needed for `bitbake vdr`
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
X-List-Received-Date: Thu, 07 Jan 2010 18:58:16 -0000
X-Groupsio-MsgNum: 15462
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-y1cqWniSfAS+C84w1ZOw"

--=-y1cqWniSfAS+C84w1ZOw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 05.01.2010, 14:27 +0100 schrieb Paul Menzel:
> Am Dienstag, den 05.01.2010, 13:30 +0100 schrieb Paul Menzel:
> > Am Dienstag, den 05.01.2010, 10:51 +0100 schrieb Henning Heinold:
> > > seems I forgot the depency. Will check them in later. This happens wh=
en one
> > > done build vom clean oetmp.
> >=20
> > I merged your changes, did `bitbake -c clean vdr`, `bitbake vdr` and
> > still get the same errors as yesterday/this night. I also tried `bitbak=
e
> > libintl` manually with no success.
> >=20
> > Is there something messed up with my setup?
>=20
> just to rule this out, can someone please try a test build on his/her
> system (merge current Git HEAD of org.openembedded.dev and do `bitbake
> vdr`) and report back to this list.

zecke on IRC tested it and it failed for him too.

        10:52 < zecke> PaulePanter: the build fails for me on cortex-a8
        10:52 < zecke> PaulePanter: and with -lintl not being found
        10:53 < zecke> PaulePanter: and vdr is not using autotools?
        10:54 < zecke> PaulePanter: the -lintl does not need to present wit=
h glibc (AFAIK)
        10:59 < PaulePanter> zecke: Thanks for trying. As far as I know VDR=
 is not using autotools.
        11:00 < PaulePanter> zecke: I will try to remove the `-lintl` from =
the call.
        11:02 < zecke> PaulePanter: it works then. For uclibc and such we n=
eed -lintl but not for glibc (AFAIK)

I will submit a patch in the other thread.


Thanks,

Paul

--=-y1cqWniSfAS+C84w1ZOw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktGLkgACgkQPX1aK2wOHVjenACfQimuz7ccab9X/VWfXlD5tg01
vv0AnRJK5Pl61iFJMXrE7hvMNi1jRWdO
=Yzyz
-----END PGP SIGNATURE-----

--=-y1cqWniSfAS+C84w1ZOw--
