Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1Dx5-0004OD-0y for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 09:53:16 +0200
Received: from f053042246.adsl.alicedsl.de ([78.53.42.246]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1Dwu-0007cg-2B for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 07:53:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285792594-10032-19-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
	<1285792594-10032-19-git-send-email-obi@opendreambox.org>
Date: Thu, 30 Sep 2010 09:53:02 +0200
Message-ID: <1285833182.3805.17.camel@mattotaupa>
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
Subject: Re: [PATCH 18/18] mjpegtools-1.9.0: initial recipe
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
X-List-Received-Date: Thu, 30 Sep 2010 07:53:16 -0000
X-Groupsio-MsgNum: 24201
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-tiIHSmoxfaUCUsUsRjqt"

--=-tiIHSmoxfaUCUsUsRjqt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 29.09.2010, 20:36 +0000 schrieb Andreas Oberritter:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../mjpegtools/files/mjpegtools-fix-include.patch  |   65 ++++++++++++++=
++++++
>  .../files/mjpegtools-remove-sdl-dependency.patch   |   15 +++++
>  .../files/mjpegtools-v4l-doesnt-mean-x11.patch     |   12 ++++
>  recipes/mjpegtools/mjpegtools_1.9.0.bb             |   18 ++++++
>  4 files changed, 110 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/mjpegtools/files/mjpegtools-fix-include.patch
>  create mode 100644 recipes/mjpegtools/files/mjpegtools-remove-sdl-depend=
ency.patch
>  create mode 100644 recipes/mjpegtools/files/mjpegtools-v4l-doesnt-mean-x=
11.patch
>  create mode 100644 recipes/mjpegtools/mjpegtools_1.9.0.bb

[=E2=80=A6]

> diff --git a/recipes/mjpegtools/mjpegtools_1.9.0.bb b/recipes/mjpegtools/=
mjpegtools_1.9.0.bb
> new file mode 100644
> index 0000000..3552b6e
> --- /dev/null
> +++ b/recipes/mjpegtools/mjpegtools_1.9.0.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "MJPEG video capture/editting/playback MPEG encoding"
> +HOMEPAGE =3D "http://sourceforge.net/projects/mjpeg/"
> +SECTION =3D "optional"
> +LICENSE =3D "GPLv2"
> +
> +SRC_URI =3D " \
> +	${SOURCEFORGE_MIRROR}/mjpeg/${P}.tar.gz \
> +	file://mjpegtools-fix-include.patch \
> +	file://mjpegtools-remove-sdl-dependency.patch \
> +	file://mjpegtools-v4l-doesnt-mean-x11.patch \
> +	"
> +
> +SRC_URI[md5sum] =3D "309a6fcf0900a010d6a9c1e91afc2f5c"
> +SRC_URI[sha256sum] =3D "a9322aaab1e0835fbaa00fc10e58e885833454fa0ad6f57c=
60c89a78f7ed1711"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--without-x"

Using minimal (eglibc) and building mjpegtools from scratch I got

        [=E2=80=A6]
        | checking for jpeg_start_compress in -ljpeg... no
        | configure: error: JPEG 6b library missing - Go to http://www.ijg.=
org/
        | ERROR: Function do_configure failed
        NOTE: package mjpegtools-1.9.0-r0: task do_configure: Failed
        [=E2=80=A6]

Adding `DEPENDS =3D jpeg` fixed this for me.

I build your recipe with this addition for minimal-{libc,eglibc,uclibc}
and angstrom-2008.1 on `MACHINE =3D "beagleboard"` and it worked. I just
saw the following warning.

        NOTE: package mjpegtools-1.9.0-r0: task do_populate_sysroot: Succee=
ded
        NOTE: Multiple libraries (libmplex2-1.9.so.0, liblavfile-1.9.so.0, =
libmpeg2encpp-1.9.so.0, liblavrec-1.9.so.0, liblavplay-1.9.so.0, liblavjpeg=
-1.9.so.0, libmjpegutils-1.9.so.0) found and LEAD_SONAME not defined

I have not run tested this recipe though.

With the DEPENDS change this patch is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-tiIHSmoxfaUCUsUsRjqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykQd4ACgkQPX1aK2wOHVhWWACeNj7lBPvnqaDmDkF5Mqzg94Wg
Ss8AnRwj1UK5dHIIyczepr0Lx47fPzvV
=AQnt
-----END PGP SIGNATURE-----

--=-tiIHSmoxfaUCUsUsRjqt--
