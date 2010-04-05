Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NysvK-00056T-To
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Apr 2010 22:29:31 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Nyss3-0001IL-AO
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 00:26:12 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 6 Apr 2010 00:22:51 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1268415992-19603-4-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1268415992-19603-4-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
Message-Id: <201004060022.54403.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] uClibc: redo configuration
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
X-List-Received-Date: Mon, 05 Apr 2010 20:29:32 -0000
X-Groupsio-MsgNum: 18429
Content-Type: multipart/signed; boundary="nextPart4782107.pdrj8O7iU6";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4782107.pdrj8O7iU6
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 12 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 20:46:32 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Bernhard Reutner-Fischer=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> +# Map distro and machine features to config settings
> +def features_to_uclibc_settings(d):
> +	cnf, rem =3D ([], [])
> +	features =3D bb.data.getVar('DISTRO_FEATURES', d).split()
> +	uclibc_cfg('ipv4', features, 'UCLIBC_HAS_IPV4', cnf, rem)
> +	uclibc_cfg('ipv6', features, 'UCLIBC_HAS_IPV6', cnf, rem)
> +	uclibc_cfg('nls',  features, 'UCLIBC_HAS_LOCALE', cnf, rem)
> +	uclibc_cfg('bx',   features, 'USE_BX', cnf, rem)
> +	return "\n".join(cnf), "\n".join(rem)

Last time I've tried to do something similar in recipes it was considered a=
s=20
BAD (USE-flag like) thing. Although I'm fine with it.

But in general, I don't see how it makes life any easier. It adds logic to=
=20
determine some of options, but then there are still lots of other ones. And=
=20
they would still come through machine and distro config which would still b=
e=20
carried around and stored for each version. If this dynamic things somehow=
=20
eliminated any need in those, than it would be excellent, but from what I s=
ee=20
it's not the case and probably there is no way to sanely implement it.

What could make sense is to improve those static configs we have. From what=
 I=20
understand, most of machine config parts are not changing from version to=20
version and even if they do, it should mostly be adding things, which shoul=
d=20
be harmless for old versions. So we can try to move this configs from=20
uclibc-${PV}/ to files/ or uclibc/, so that they would be reused in all=20
versions.

Distro configs do change between versions, but than there are not that much=
=20
distros that care about uclibc and each of those could store their version =
of=20
config if there is any need for that.

>  b/recipes/uclibc/uclibc-initial_git.bb index 00330e2..3a33bd8 100644
> --- a/recipes/uclibc/uclibc-initial_git.bb
> +++ b/recipes/uclibc/uclibc-initial_git.bb
> @@ -7,19 +7,16 @@ PACKAGES =3D ""
>=20
>  do_install() {
>  	# Install initial headers into the cross dir
> -	make V=3D1 CC=3D"${CC}" PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME=
_PREFIX=3D/
>  \ +	make PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME_PREFIX=3D/ \
>  		install_headers
>  	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
>=20
> -	# This conflicts with the c++ version of this header
> -	rm -f ${D}${includedir}/bits/atomicity.h
>  	install -d ${D}${libdir}/
=2E....
>  do_compile () {
> -	make V=3D1 CC=3D"${CC}" PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME=
_PREFIX=3D/
>  \ +	make PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME_PREFIX=3D/ \


I guess these are things that just not needed with newer uClibc versions? I=
f=20
so, this would justify moving old uclibc.inc to uclibc-old.inc and adopting=
=20
newer simpler uclibc.inc (with recipes clean up) IMO.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart4782107.pdrj8O7iU6
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAku6Rp4ACgkQXJ70z+XgVcMQQACeOsEAPDmFHTKfoKu7opfLSRtP
lsYAn1pN6X9N916Mwo0L5B+L2obSgFiN
=2f4b
-----END PGP SIGNATURE-----

--nextPart4782107.pdrj8O7iU6--
