Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Shc0X-0001Cx-KQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 09:40:49 +0200
Received: by wgbdr1 with SMTP id dr1so255489wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TsTEUIhsMTNvbjkfJ4/fJIh77Mgo7rCJXica4aAb0JY=;
	b=Y5sq/bUPNqa2uSOqw5vevhQ1CdoMZepyioFXDvUumRA7sr1hrX03RQga4moHIbrW7S
	k+xhewUzuTjG1T44aALkDeQoJCFjZ0HCVcwQbQ1zsyceJQslv1YAm7rf6M2TQ7XAi9GF
	YMGR+5/avWBtlS9AW8YOtxQhtVsd/bAGzWjQFNEh6zuLn6CEooNC7E7lOYQuyDy2cIk7
	tz0pNrtJQuwwFq0wjUDRObNh1ZGxHJYi0EbupyLJ/9Vrr0z4UsH8DfftNC7+OC18Wds6
	RxKT20ORXBbo1LR6oBOnXm5st6EEge2gmQGy3uXRUupo5diALAwO9HQebTvFNB5SF1o+
	M1bg==
Received: by 10.216.216.30 with SMTP id f30mr13315731wep.96.1340263803036;
	Thu, 21 Jun 2012 00:30:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gb9sm44351949wib.8.2012.06.21.00.30.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 00:30:01 -0700 (PDT)
Date: Thu, 21 Jun 2012 09:30:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120621073000.GE9352@jama.jama.net>
References: <1340025471-3337-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1340025471-3337-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] libjpeg-turbo: update 1.2.1 / use version 8d to follow oe-core libjpeg update
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
X-List-Received-Date: Thu, 21 Jun 2012 07:40:49 -0000
X-Groupsio-MsgNum: 39316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline

--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2012 at 03:17:51PM +0200, Andreas M=FCller wrote:
> without following oe-core's version PREFERRED_PROVIDER_jpeg does not work=
 and
> libjpeg is build.

Hi,

this upgrade is causing many runtime dep issues, because
libjpeg-turbo package now has not only:
/usr/lib/libjpeg.so.8 /usr/lib/libjpeg.so.8.0.2
but also:
/usr/lib/libturbojpeg.so.0 /usr/lib/libturbojpeg.so.0.0.0

http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dblobdiff;f=3Dpacka=
ges/armv4t-oe-linux-gnueabi/libjpeg-turbo/libjpeg-turbo/latest;h=3De449fd89=
2c297995bf2f6a856eb875f7b5df42c0;hp=3Dfdc1ae08fa4dbbf180b8d1e0b7ed54acb5a67=
43a;hb=3D9fe63f73e65260b6c8a3dfa5c488dac046667bba;hpb=3D10a01924024d30e90c9=
663c1317472830395f486

so packages got renamed from=20
=2E/067/ipk/armv7a-vfp-neon/libjpeg8_8c+1.2.0-r0_armv7a-vfp-neon.ipk
=2E/067/ipk/armv7a-vfp-neon/libturbojpeg_8c+1.2.0-r0_armv7a-vfp-neon.ipk
to packages
=2E/068/ipk/armv7a-vfp-neon/libjpeg-turbo_8d+1.2.1-r0_armv7a-vfp-neon.ipk
=2E/068/ipk/armv7a-vfp-neon/libturbojpeg_8d+1.2.1-r0_armv7a-vfp-neon.ipk

and runtime deps like "libjpeg8 (>=3D 8c+1.2.0)" are not satisfied anymore
(e.g. do_rootfs fails).

Don't know why packaging is not showing warning about multiple .sonames
and asking for LEAD_SONAME :/.

Will send patch for it in few minutes.

Paul: is there some way to record "runtime" names of packages in
buildhistory? From this diff:
http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3Da2b=
23ff61e9b1baeb64bbbd01f115c8dc71a86a3
it's not possible to see that libjpeg-turbo_8d+1.2.1-r0 was renamed to
libjpeg8_8d+1.2.1-r1.

Cheers,


>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/rec=
ipes-core/jpeg/libjpeg-turbo_svn.bb
> index 76e2da4..16fb2c7 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D12;md5=3D=
78fa8dbac547bb5b2a0e6457a6cfe
>                      file://jpeglib.h;endline=3D14;md5=3D7bb9a39828a1b1e8=
4acd4e8aec1e5532 \
>                      file://djpeg.c;endline=3D13;md5=3De85613b52f2906c5df=
c0e21ec902cb33 \
>  "
> -PV =3D "8c+1.2.0"
> -SRCREV =3D "733"
> +PV =3D "8d+1.2.1"
> +SRCREV =3D "837"
>  SRC_URI =3D "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-tur=
bo;proto=3Dhttps;module=3Dtrunk"
> =20
>  S =3D "${WORKDIR}/trunk"
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/izXgACgkQN1Ujt2V2gBx0WACgkIXcxJF8Bn4gjm0CA18Bt0Tz
jqEAniOzB8c5qEPVpxJ3d3R2T3PKmq3Z
=X/N7
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
