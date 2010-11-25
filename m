Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PLfZc-0001ui-Df for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 18:25:33 +0100
Received: from f053038108.adsl.alicedsl.de ([78.53.38.108]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PLfYR-0001QU-7j for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 17:24:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CEBB74A.6000606@opendreambox.org>
References: <4CEB3497.90607@gmail.com> <4CEBB582.3030106@opendreambox.org>
	<4CEBB74A.6000606@opendreambox.org>
Date: Thu, 25 Nov 2010 18:24:17 +0100
Message-ID: <1290705857.3777.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: mixing `vname_append` with `+=` (was: [PATCH v2] strace_4.5.20.bb: Fix build on mips{, el} when DISTRO_FEATURES lacks "largefile".)
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
X-List-Received-Date: Thu, 25 Nov 2010 17:25:33 -0000
X-Groupsio-MsgNum: 26594
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-gXSBFaRxpl2Ziem6DXc8"

--=-gXSBFaRxpl2Ziem6DXc8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 23.11.2010, 13:44 +0100 schrieb Andreas Oberritter:
> On 11/23/2010 01:37 PM, Andreas Oberritter wrote:
> > On 11/23/2010 04:27 AM, Graham Gower wrote:
> >> diff --git a/recipes/strace/strace_4.5.20.bb b/recipes/strace/strace_4=
.5.20.bb
> >> index 873ce52..086a4d7 100644
> >> --- a/recipes/strace/strace_4.5.20.bb
> >> +++ b/recipes/strace/strace_4.5.20.bb
> >> @@ -4,9 +4,13 @@ LICENSE =3D "GPL"
> >>  PR =3D "r0"
> >> =20
> >>  DEFAULT_PREFERENCE =3D "-1"
> >> +DEFAULT_PREFERENCE_mips =3D "1"
> >> +DEFAULT_PREFERENCE_mipsel =3D "1"
> >> =20
> >>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
> >>            "
> >> +SRC_URI_append_mipsel +=3D " file://mips-nolargefile.patch "
> >> +SRC_URI_append_mips +=3D " file://mips-nolargefile.patch "
> >=20
> > I think it would be better to apply this patch unconditionally, because
> > it doesn't impose negative effects on other archs, and future patches
> > which might only get compile-tested on other archs must make sure that
> > mips-nolargefile.patch still applies.
>=20
> Albeit, the correct syntax would be:
> SRC_URI_append_mipsel =3D " file://mips-nolargefile.patch"

Not necessarily. Quoting the user manual [1].

        Note that the appended information is a variable itself, and
        therefore it's possible to use +=3D or =3D+ to assign variables to
        the _append information:

Although I do not know about the advantages or disadvantages.


Thanks,

Paul


[1] http://docs.openembedded.org/usermanual/usermanual.html#recipes_syntax

--=-gXSBFaRxpl2Ziem6DXc8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzum7sACgkQPX1aK2wOHVgquwCfcBS8I/P+xUa7r8Pc9lo0dD25
Lg8An2+f8RetCrD/iq6CmZyw3b1CAYv4
=+Fli
-----END PGP SIGNATURE-----

--=-gXSBFaRxpl2Ziem6DXc8--
