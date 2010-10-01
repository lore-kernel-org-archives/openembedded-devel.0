Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1npj-0007Fj-Mm for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 00:12:04 +0200
Received: from f053035163.adsl.alicedsl.de ([78.53.35.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1npW-0003gJ-Lm for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 22:11:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=QQ_79Huh9Pu-yJyRrfRfojgnN5+YF5niOHrTp@mail.gmail.com>
References: <4CA44597.5070300@dresearch.de>
	<1285834219-17132-1-git-send-email-sledz@dresearch.de>
	<4CA606D5.4060608@dresearch.de>
	<AANLkTi=QQ_79Huh9Pu-yJyRrfRfojgnN5+YF5niOHrTp@mail.gmail.com>
Date: Sat, 02 Oct 2010 00:11:47 +0200
Message-ID: <1285971107.4148.8.camel@mattotaupa>
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
Subject: Re: [PATCH] epiphany-2.30.2: unbreak build by disabling CA files
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
X-List-Received-Date: Fri, 01 Oct 2010 22:12:05 -0000
X-Groupsio-MsgNum: 24281
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-gYxywA7Daiv2WXRuXUKI"

--=-gYxywA7Daiv2WXRuXUKI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 01.10.2010, 09:26 -0700 schrieb Khem Raj:
> On Fri, Oct 1, 2010 at 9:05 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> > Am 30.09.2010 10:10, schrieb Steffen Sledz:
> >> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> >> ---
> >>  recipes/gnome/epiphany_2.30.2.bb |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany=
_2.30.2.bb
> >> index 426d468..38798f7 100644
> >> --- a/recipes/gnome/epiphany_2.30.2.bb
> >> +++ b/recipes/gnome/epiphany_2.30.2.bb
> >> @@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] =3D "29b084acfa016540d91d3601e=
c3dff5c"
> >>  SRC_URI[archive.sha256sum] =3D "cd0124e71e72142593cfeb442d58d97e99ba9=
4ace6e31d94717fe977c0bfb98a"
> >>
> >>
> >> -EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distrib=
utor-name=3D${DISTRO}"
> >> +EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distrib=
utor-name=3D${DISTRO} --without-ca-file"
> >>
> >>  do_configure_prepend() {
> >>          touch ${S}/gnome-doc-utils.make
> >
> > Ping!
> >
> > The next 'testing-next' branch is knocking at the door. ;-)
>=20
> while the patch looks ok you need to bump the PR too as mentioned.
> Paul could you send your build logs
> somewhere to look at. We need to know if its something Stefan's build
> system problem or yours.

Sorry, for not finding this earlier. I have `ca-certificates` installed
on my build system.

        checking location of system Certificate Authority list... /etc/ssl/=
certs/ca-certificates.crt
        [=E2=80=A6]
        CA Certificates file       : /etc/ssl/certs/ca-certificates.crt

The question is, if `ca-certificates` should be added to `DEPENDS` and
if that would be picked up.

If not, Steffen=E2=80=99s patch is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-gYxywA7Daiv2WXRuXUKI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkymXJ0ACgkQPX1aK2wOHVjBYgCeLIE2k5qUWHYR6Ez96L9B7S4C
eoQAni6lcVgbyDksILkLnD/Ng2D98LoZ
=akMp
-----END PGP SIGNATURE-----

--=-gYxywA7Daiv2WXRuXUKI--
