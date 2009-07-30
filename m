Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MWXAL-0001Af-Vx
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 17:03:34 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 9C6011402C; Thu, 30 Jul 2009 16:48:31 +0200 (CEST)
Date: Thu, 30 Jul 2009 16:48:31 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090730144831.GA30445@zlo.nu>
References: <BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
	<20090730105711.GA29595@zlo.nu>
	<1248952464.21030.110.camel@hammer.suse.cz>
	<20090730114922.GA29793@zlo.nu>
	<1248956053.21030.133.camel@hammer.suse.cz>
	<20090730125001.GA30052@zlo.nu>
	<c384c5ea0907300622k5ab4bc15yeae9f448312fb887@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0907300622k5ab4bc15yeae9f448312fb887@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks	libtool's do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 15:03:34 -0000
X-Groupsio-MsgNum: 12148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2009 at 03:22:19PM +0200, Leon Woestenberg wrote:
> > My /bin/sh is a dash, I should have known, my apologies. =A0I have a pa=
tch
> >
> Testing with dash rather than bash is GOOD due to it adhering to POSIX
> without much of the bash-specifics.

Well, I agree, but judging by commit
e0ed375a8dfb292bdd72f5891917ef81f361f15c to classes/sanity.bbclass, I
assumed the policy was to require /bin/bash for /bin/sh instead of
fixing bashisms.

To not be obligated to use bash, I added the attached patch.

> So please do not introduce 'bashisms'  (dependencies on bash behaviour).

I agree ;-)

Marc

--FL5UXtIhxfXey3p5
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="dash.patch"
Content-Transfer-Encoding: quoted-printable

commit d37e8ae3fb24b589793ae92062d665cc6384151e
Author: Marc Olzheim <marc@iphion.nl>
Date:   Thu Jun 11 12:44:34 2009 +0200

    Make allowing dash as /bin/sh a configuration option.

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index 29624c3..3ee9a0a 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -112,11 +112,12 @@ def check_sanity(e):
 		missing =3D missing.rstrip(',')
 		messages =3D messages + "Please install following missing utilities: %s\=
n" % missing
=20
-	try:
-	    if os.path.basename(os.readlink('/bin/sh')) =3D=3D 'dash':
-		    messages =3D messages + "Using dash as /bin/sh causes various subtle=
 build problems, please use bash instead.\n"
-	except:
-		pass
+	if not data.getVar( 'ALLOW_DASH_SH', e.data, True ):
+		try:
+		    if os.path.basename(os.readlink('/bin/sh')) =3D=3D 'dash':
+			    messages =3D messages + "Using dash as /bin/sh causes various subtl=
e build problems, please use bash instead.\n"
+		except:
+			pass
=20
 	omask =3D os.umask(022)
 	if omask & 0755:

--FL5UXtIhxfXey3p5--

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpxsr8ACgkQezjnobFOgrHQBwCdEOgl5m2WqmyF5X4laBxAR+P8
VQgAnRYR14zNAijrtIUOueaQEHxBN25Q
=8AwK
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
