Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A69086AC6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 06:20:58 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id n12so2191505wgh.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 23:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zEBtxR0+xQp0x1Dh9AExMtzBE/Pf+gSz7gXibbSLU4c=;
	b=wPuMliiOie8BWZuqO41KQ7CxDB5qv8t/Hm7U1U+gt+N3+IGSpmsxMeIfjSTQFWU3u9
	Fc/mPI+JzIlW5TKIwy8d925/v6P9r4DwKSwgDTMGsOKN9BQJbt06awm4eaPZzcA0rjw+
	6q8uX4Zj3ucPxEz8nPsJ/Mix6AvDePuTtsmtBVOnDZ/rOyxswksUVmOQVit20jF5Csho
	q01oZkBBPM2jrip5msa0mz+rajLPIzAVRdddsedxCn7oroWwG7z0o0m/MtgbUd6ujPMA
	e0vEr6B/1jsrcrTjbfAgSKAaKA64L1PRghk4k5SQvnMRrhvr+QMd8s8SE44+jXc2nEMj
	TFxQ==
X-Received: by 10.180.20.69 with SMTP id l5mr1247575wie.45.1412230859366;
	Wed, 01 Oct 2014 23:20:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id f7sm58418wix.22.2014.10.01.23.20.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 23:20:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Oct 2014 08:21:54 +0200
To: openembedded-devel@lists.openembedded.org,
	Brian Lloyd <blloyd@familyhonor.net>,
	Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20141002062154.GG25706@jama>
References: <1402343170-17707-1-git-send-email-blloyd@familyhonor.net>
MIME-Version: 1.0
In-Reply-To: <1402343170-17707-1-git-send-email-blloyd@familyhonor.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] Upgrade geode video driver to 2.11.15
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Oct 2014 06:21:06 -0000
X-Groupsio-MsgNum: 52333
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cMwMn/tF35tO7kHm"
Content-Disposition: inline

--cMwMn/tF35tO7kHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2014 at 02:46:10PM -0500, Brian Lloyd wrote:
> From: blloyd <blloyd@familyhonor.net>
>=20
> The latest driver corrected a number of issues and compiles without warni=
ngs with just one patch.  The header included by the given patch is already=
 included in the geode master line, so will not be be required after the ne=
xt geode version release.

xf86-video-geode is broken again, would you mind fixing it to build with
glibc-2.20?

|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586=
-oe-linux/xf86-video-geode/2_2.11.16-r21.0/xf86-video-geode-2.11.16/src/lx_=
memory.c:26:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/xo=
rg/os.h:579:1: error: expected identifier or '(' before '__extension__'
|  strndup(const char *str, size_t n);
|  ^


>=20
> Signed-off-by: Brian Lloyd <blloyd@familyhonor.net>
> ---
>  .../xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch | 11 +++++=
++++++
>  ...f86-video-geode_2.11.14.bb =3D> xf86-video-geode_2.11.15.bb} |  6 +++=
+--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
/xf86SetModeDefaultName.patch
>  rename meta-oe/recipes-graphics/xorg-driver/{nonworking/xf86-video-geode=
_2.11.14.bb =3D> xf86-video-geode_2.11.15.bb} (60%)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86Se=
tModeDefaultName.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ge=
ode/xf86SetModeDefaultName.patch
> new file mode 100644
> index 0000000..97d9d49
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDe=
faultName.patch
> @@ -0,0 +1,11 @@
> +diff -up xf86-video-geode-2.11.14/src/geode_dcon.c.jx xf86-video-geode-2=
=2E11.14/src/geode_dcon.c
> +--- xf86-video-geode-2.11.14/src/geode_dcon.c.jx	2012-11-24 05:01:15.000=
000000 -0500
> ++++ xf86-video-geode-2.11.14/src/geode_dcon.c	2013-10-25 16:19:35.950234=
174 -0400
> +@@ -29,6 +29,7 @@
> +=20
> + /* Includes that are used by all drivers */
> + #include <xf86.h>
> ++#include <xf86Modes.h>
> + #include <xf86_OSproc.h>
> + #include <compiler.h>
> +=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-g=
eode_2.11.14.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.1=
1.15.bb
> similarity index 60%
> rename from meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-ge=
ode_2.11.14.bb
> rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
> index 2fdb210..07d2d9b 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-geode_2.=
11.14.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
> @@ -4,8 +4,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De7f3e39474aee=
a5af381a8e103dafc36"
>  SUMMARY =3D "X.org server -- Geode GX2/LX display driver"
>  PR =3D "${INC_PR}.0"
> =20
> -SRC_URI[md5sum] =3D "c9a4e1c5438240e5bdce332f92df9163"
> -SRC_URI[sha256sum] =3D "4c750b46c932934faa008919922f5ac8a572afcfe265ac8d=
7c203b8167a0cfcc"
> +SRC_URI[md5sum] =3D "7dafd19e274c771539b6d4d459423ccf"
> +SRC_URI[sha256sum] =3D "00db3bd697b32286eb0e42f5dbd7fcc8d7255dd11c299b1e=
e16a06a244868ff0"
> +
> +SRC_URI +=3D "file://xf86SetModeDefaultName.patch"
> =20
>  COMPATIBLE_HOST =3D "i.86.*-linux"
> =20
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cMwMn/tF35tO7kHm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQs7wIACgkQN1Ujt2V2gBw/yQCbBKXXZvujnmUblu84aNMbCMKo
3WYAn12EcROsN0B7BvUZMtTPBwBcZyQO
=hgkw
-----END PGP SIGNATURE-----

--cMwMn/tF35tO7kHm--
