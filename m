Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OlTUH-0008IX-I4 for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 23:14:41 +0200
Received: from f053036067.adsl.alicedsl.de ([78.53.36.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OlTTr-0002PD-5m for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:13:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=baeypmvV4Kx2NtHxQOO6w8HPYNoZH=gm2QaM=@mail.gmail.com>
References: <1282072886-11562-1-git-send-email-jkridner@beagleboard.org>
	<1282072886-11562-2-git-send-email-jkridner@beagleboard.org>
	<AANLkTik73cayAjmykmJvp8KqsJ_XrBfQTOkM8MJWydsP@mail.gmail.com>
	<AANLkTik=gnhtadZjsjx7i-g38iJxyF=PFkNOE9JydCO-@mail.gmail.com>
	<AANLkTi=baeypmvV4Kx2NtHxQOO6w8HPYNoZH=gm2QaM=@mail.gmail.com>
Date: Tue, 17 Aug 2010 23:13:53 +0200
Message-ID: <1282079633.4314.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] beagleboard-olddemo-image: saved off beagleboard-demo-image
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
X-List-Received-Date: Tue, 17 Aug 2010 21:14:41 -0000
X-Groupsio-MsgNum: 22365
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xu1PX3Z5RCIvc4MUFhjR"

--=-xu1PX3Z5RCIvc4MUFhjR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 17.08.2010, 23:01 +0200 schrieb Frans Meulenbroeks:
> 2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
> > On Tue, Aug 17, 2010 at 3:54 PM, Frans Meulenbroeks
> > <fransmeulenbroeks@gmail.com> wrote:
> >> 2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
> >>> I want to use the name beagleboard-demo-image for what actually ships
> >>> with the xM boards.
> >>>
> >>> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> >>> ---
> >>>  recipes/images/beagleboard-olddemo-image.bb |   30 +++++++++++++++++=
++++++++++
> >>>  1 files changed, 30 insertions(+), 0 deletions(-)
> >>>  create mode 100644 recipes/images/beagleboard-olddemo-image.bb
> >>>
> >>> diff --git a/recipes/images/beagleboard-olddemo-image.bb b/recipes/im=
ages/beagleboard-olddemo-image.bb
> >>> new file mode 100644
> >>> index 0000000..d83281c
> >>> --- /dev/null
> >>> +++ b/recipes/images/beagleboard-olddemo-image.bb
> >>> @@ -0,0 +1,30 @@
> >>> +# Demo image for beagleboard
> >>> +
> >>> +IMAGE_LINGUAS =3D "de-de fr-fr en-gb en-us pt-br es-es kn-in ml-in t=
a-in"
> >>> +
> >>> +XSERVER ?=3D "xserver-xorg \
> >>> +           xf86-input-evdev \
> >>> +           xf86-input-mouse \
> >>> +           xf86-video-fbdev \
> >>> +           xf86-input-keyboard \
> >>> +"
> >>> +
> >>> +ANGSTROM_EXTRA_INSTALL ?=3D ""
> >>> +SPLASH =3D "exquisite exquisite-themes exquisite-theme-angstrom"
> >>> +
> >>> +export IMAGE_BASENAME =3D "Beagleboard-demo-image"
> >>> +
> >>> +DEPENDS =3D "task-base"
> >>> +IMAGE_INSTALL =3D "\
> >>> +    ${XSERVER} \
> >>> +    ${ANGSTROM_EXTRA_INSTALL} \
> >>> +    task-beagleboard-demo \
> >>> +    ${SPLASH} \
> >>> +    "
> >>> +
> >>> +IMAGE_PREPROCESS_COMMAND =3D "create_etc_timestamp"
> >>> +
> >>> +#zap root password for release images
> >>> +ROOTFS_POSTPROCESS_COMMAND +=3D 'install_linguas; ${@base_conditiona=
l("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
> >>> +
> >>> +inherit image
> >>> --
> >>
> >> What about a better name? E.g. XM-demo-iimage?
> >
> > I don't know why we need two demo images.  This should run on Rev Cx as=
 well.
>=20
> Actually XM-demo-image was just a proposal
> For me beagleboard-olddemo-image indicates that it is not really an up
> to date version.
> I think I would prefer a name that better indicates the purpose. Maybe
> add stable in the name?

So why create an =E2=80=9Cold=E2=80=9D image? What is the difference betwee=
n these two
images anyway?

> Another option would be to have the image delivered with the XM as
> e.g. beagleboard-demo-image_1.0 and the newer versions e.g. 1.1 etc
> (or 2.0 or whatever)

[=E2=80=A6]


Thanks,

Paul

--=-xu1PX3Z5RCIvc4MUFhjR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxq+4wACgkQPX1aK2wOHVjj4QCfSmWTxCnZNoFXYJsjVMrPuvtH
rb4An1a03Z8nDFzvQrnm+BR7PvtVdCH/
=cuZ0
-----END PGP SIGNATURE-----

--=-xu1PX3Z5RCIvc4MUFhjR--
