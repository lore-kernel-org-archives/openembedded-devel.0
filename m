Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Oy7yE-00018C-P6
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 20:53:39 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Oy7y8-0007wU-7c
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:53:36 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 22:53:27 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <4C72C920.7080709@tycoelectronics.com>
	<AANLkTi=kCVt_+xBF+r400Nm6AXuApGk1ceuHVEim=K1c@mail.gmail.com>
	<20100921174726.GA5750@lundinova.se>
In-Reply-To: <20100921174726.GA5750@lundinova.se>
MIME-Version: 1.0
Message-Id: <201009212253.30968.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: several recipes give a link error: libc.so, needed by libgcc_s.so, not found
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
X-List-Received-Date: Tue, 21 Sep 2010 18:53:39 -0000
X-Groupsio-MsgNum: 23806
Content-Type: multipart/signed; boundary="nextPart1579596.ieXhvrQi6N";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1579596.ieXhvrQi6N
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 21 =D1=81=D0=B5=D0=BD=D1=82=D1=
=8F=D0=B1=D1=80=D1=8F 2010 21:47:26 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Johan Ho=
vold =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Mon, Aug 23, 2010 at 10:58:07PM +0200, Frans Meulenbroeks wrote:
> > libc.so contains:
> > frans@linux-suse:~/oe/tmp_angstrom/sysroots> cat
> > ./armv7a-angstrom-linux-gnueabi/usr/lib/libc.so
> > /* GNU ld script
> >    Use the shared library, but some functions are only in
> >    the static library, so try that secondarily.  */
> > OUTPUT_FORMAT(elf32-littlearm)
> > GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED (
> > /lib/ld-linux.so.3 ) )
> >
> > No idea if these should be paths in sysroots (I'm not a dynamic linking
> > expert).
>=20
> Any progress on this issue?
>=20
> Meanwhile, adding "-L${STAGING_DIR_TARGET}${base_libdir}" (and perhaps
> also a rpath-link directive) to TARGET_LDFLAGS in conf/bitbake.conf
> could serve as a work-around.

I have
http://sourceware.org/bugzilla/show_bug.cgi?id=3D10340
applied locally to binutils, and it works.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1579596.ieXhvrQi6N
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkyY/yoACgkQXJ70z+XgVcNYmQCfYQGXgIwT+SUlQFyoWnpdxL67
MO4AoMueOF18HupRwYQ3ot8imNrR0sr9
=YMAJ
-----END PGP SIGNATURE-----

--nextPart1579596.ieXhvrQi6N--
