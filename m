Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXc58-0005Td-Ih
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 14:58:22 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1LXc3s-0000IQ-1B
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 16:57:04 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 16:56:50 +0300
User-Agent: KMail/1.9.9
References: <200902121426.26727.roman@khimov.ru> <gn160m$8s4$1@ger.gmane.org>
	<200902121624.02569.jay4mail@gmail.com>
In-Reply-To: <200902121624.02569.jay4mail@gmail.com>
MIME-Version: 1.0
Message-Id: <200902121656.56180.roman@khimov.ru>
Subject: Re: [PATCH] Fix rpm2cio sums
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
X-List-Received-Date: Thu, 12 Feb 2009 13:58:22 -0000
X-Groupsio-MsgNum: 7637
Content-Type: multipart/signed; boundary="nextPart1708336.dWnRhr22nf";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1708336.dWnRhr22nf
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yuri Bushmelev:
> Hello!
>
> > > Now another question is why OE package uses such tarball as source at
> > > all. So, probably we can change the source to something like
> > >
> > > http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/
> > >rp
> > > m2cpio/files/rpm2cpio?rev=3D1.2;content-type=3Dtext%2Fplain;only_with=
_tag
> > >=3DRE LEASE_7_1_0
> > >
> > > which is the only file we need and it's rev'd tagged
> > > should-be-non-volatile.
> >
> > Seeing the current sitation with the freebsd people this would get my
> > vote.
>
> You can grab it via cvs. E.g. (from taiwan mirror):
> ...
> Or you can grab it from cvsweb as Roman says.
>
> Or you cat grab precompiled package but from some release.=20

Hmmm. So, what is the preferred color of bikeshed this season? ;)

I don't think we can trust precompiled packages with this situation. And cvs
checkout for one file... Well, maybe something like this:

=2D-- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -18682,9 +18682,9 @@ sha256=3Da515675401cc9aff33cf8fd48d23a177cb93859077=
58c0e29a1dab693f55efe2
 md5=3Db8f0661ac765ce1a2de66ca53e37af83
 sha256=3Da8168b8884ab40aadebba0ba696b889e25020d32a88e646d4f4bc56f2236b184
=20
=2D[ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.=
2_2.tbz]
=2Dmd5=3D63f39118ea5ef7cda84a0638002ed6d2
=2Dsha256=3D27ffe0392ae193eb04786a2159c099a00fe38ccdaebcebd72afc842c528bb6d3
+[http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/rpm2=
cpio/files/rpm2cpio?rev=3D1.2]
+md5=3D07f64fa3dae6eb8b1b578d01473a5c07
+sha256=3Da98cb1d9903192c4fcf40d82c705e091a5c193f87327703217749a5f4cc6197d
=20
 [http://downloads.sourceforge.net/rpyc/rpyc-3.02.tar.gz]
 md5=3D4e855372c4a533b9ed605503156e6e04
=2D-- a/packages/rpm2cpio/rpm2cpio-native_1.2_2.bb
+++ b/packages/rpm2cpio/rpm2cpio-native_1.2_2.bb
@@ -4,7 +4,7 @@
=20
 DEPENDS=3D"perl-native"
 LICENSE=3D"BSD"
=2DSRC_URI=3D"${FREEBSD_MIRROR}/ports/packages/archivers/rpm2cpio-1.2_2.tbz"
+SRC_URI=3D"http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/arch=
ivers/rpm2cpio/files/rpm2cpio?rev=3D1.2"
=20
 inherit native
=20
@@ -15,7 +15,7 @@ do_compile() {
=20
 do_stage() {
 	install -d ${STAGING_BINDIR}
=2D	sed -e '1,1s|${bindir}/|${bindir}/env |' bin/rpm2cpio.pl \
+	sed -e '1,1s|${bindir}/|${bindir}/env |' "rpm2cpio?rev=3D1.2" \
 		> ${STAGING_BINDIR}/rpm2cpio.pl
=20
 	my_PERL=3D"/usr/bin/env perl"

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1708336.dWnRhr22nf
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmUKqIACgkQXJ70z+XgVcPqdwCfQcC8sOiEQyhnUwLy5Ylh9mcZ
tEYAoNCs4FhABP3gwSSjL485EUeDM0F+
=zm+m
-----END PGP SIGNATURE-----

--nextPart1708336.dWnRhr22nf--
