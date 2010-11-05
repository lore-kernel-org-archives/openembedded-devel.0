Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEMKT-0006cy-O0 for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 14:27:48 +0100
Received: from f053040076.adsl.alicedsl.de ([78.53.40.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEMJe-0004M2-TH for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 13:26:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimzdQuJQ1Y5VpNJvF0Y1=1aFDzXL5g1u6LArpS3@mail.gmail.com>
References: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1288961484.3826.7.camel@mattotaupa>
	<AANLkTimzdQuJQ1Y5VpNJvF0Y1=1aFDzXL5g1u6LArpS3@mail.gmail.com>
Date: Fri, 05 Nov 2010 14:26:48 +0100
Message-ID: <1288963608.3826.15.camel@mattotaupa>
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
Subject: Re: [PATCH] libX11: patch configure.ac so a nios2 system is not seen as an os2 system.
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
X-List-Received-Date: Fri, 05 Nov 2010 13:28:08 -0000
X-Groupsio-MsgNum: 25904
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-am5B5BkxG5bxlrtg29Jc"

--=-am5B5BkxG5bxlrtg29Jc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 05.11.2010, 14:19 +0100 schrieb Frans Meulenbroeks:
> 2010/11/5 Paul Menzel <paulepanter@users.sourceforge.net>:
> > Am Freitag, den 05.11.2010, 13:08 +0100 schrieb Frans Meulenbroeks:
> >> configure.ac matches target_system against *os2* to detect if we're
> >> configuring for an os2 system. Unfortunately this also matches if the
> >> target_system is nios-linux (which is not an os2 system :-) )
> >> This patch adds an additional case. The patch is added to the individu=
al
> >> recipes and also made upstream.
> >
> > Please add a link to this commit message and the patch headers pointing
> > to the upstream commit, list message or ticket.
> >
> >> Patch is tested by fully building 1.3.2 and by running
> >> bitbake -c patch for the other recipes.
> >>
> >> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> >>
> >> a---
> >>  .../xorg-lib/libx11-1.1.5/configure.ac-nios2.patch |   12 +++++++++++=
+
> >>  .../xorg-lib/libx11-1.3.2/configure.ac-nios2.patch |   12 +++++++++++=
+
> >>  .../xorg-lib/libx11-1.3.6/configure.ac-nios2.patch |   12 +++++++++++=
+
> >>  .../libx11-1.3.99.903/configure.ac-nios2.patch     |   12 +++++++++++=
+
> >>  recipes/xorg-lib/libx11_1.1.5.bb                   |    3 ++-
> >>  recipes/xorg-lib/libx11_1.3.2.bb                   |    3 ++-
> >>  recipes/xorg-lib/libx11_1.3.6.bb                   |    3 ++-
> >>  recipes/xorg-lib/libx11_1.3.99.903.bb              |    3 ++-
> >>  8 files changed, 56 insertions(+), 4 deletions(-)
> >>  create mode 100644 recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.p=
atch
> >>  create mode 100644 recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.p=
atch
> >>  create mode 100644 recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.p=
atch
> >>  create mode 100644 recipes/xorg-lib/libx11-1.3.99.903/configure.ac-ni=
os2.patch
> >>
> >> diff --git a/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch b/=
recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
> >> new file mode 100644
> >> index 0000000..5605a59
> >> --- /dev/null
> >> +++ b/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
> >> @@ -0,0 +1,12 @@
> >> +Index: libX11-1.3.2/configure.ac
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- libX11-1.3.2.orig/configure.ac   2010-11-05 10:30:33.825536983 +0=
100
> >> ++++ libX11-1.3.2/configure.ac        2010-11-05 10:31:25.913899269 +0=
100
> >> +@@ -202,6 +202,7 @@
> >> + # arch specific things
> >> + WCHAR32=3D"1"
> >> + case $target_alias in
> >> ++  nios2*) os2=3D"false" ;;
> >> +   *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
> >> +   *) ;;
> >> + esac
> >
> > It looks like these three patches are exactly the same. Would one file
> > in the version independent directory be enough?
> >
> > [=E2=80=A6]
>=20
> They are exactly the same.
> I discussed this with Martin Jansa on irc, and we felt it would be
> best to submit the patch upstream.

I agree.

> Then if it is in the inc file, it needs to be taken out again when the
> next version comes.

Sorry, I did not make myself clear. My point was if you could put
`configure.ac-nios2.patch` into `libX11/` or `files`.

> Hence it was put in the individual files.
>=20
> BTW it looks like upstream might go for a slightly different patch.
> I'll leave it to Martin to decide whether to go for that one or for
> this one (he is on cc of the upstream correspondence).

Again, could you provide a link to that discussion.

> I'll be afk next week so can't give followup on this.

Understood. Thank you for your fast reply.


Thanks,

Paul

--=-am5B5BkxG5bxlrtg29Jc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzUBhgACgkQPX1aK2wOHVhVlACfY0//VyVJg04bW3Z7qKcyXuoJ
hX0AnRC7+zkaLTa49joIoDmGJdAd3uMx
=rVZg
-----END PGP SIGNATURE-----

--=-am5B5BkxG5bxlrtg29Jc--
