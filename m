Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UMCuh-0005Fd-GE
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Mar 2013 09:42:53 +0200
Received: by mail-da0-f48.google.com with SMTP id p8so684597dan.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2013 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U3Jg68EHKUO35cXQlRRHAMXwIMa95U+Ngd8rupDfxAI=;
	b=dAd8zmyWBuc/eZhIjtpqNuPbDbnTLARQqlXa9sR8+4l/+0/ZrV5QB5J+FKCettOQC2
	9THsDVmKLnYWmvBqGm/PAmZWMHRhG8kk9RHejn9rtBgfr4WXIeIe1OLA1AjOciXVBZAb
	MxYFgiaYCz0+L/jey9BTnx1CBuwi4IIh7raJBuUaZke7ef3CEuJ83SOkFWBFRfm6UYsR
	ijOHrLaLcHYOyuIP0YVF5CcKLZxSMFXkJ28/ce0eiqY9If+smzlvDKFPoGNpxQhSdD1X
	gvzdGgXgcAn9OgFnaqsbzFFPEVBPGFfzPnjdy0EeWtjLViivJ5PXjzwL3PTX4LzP/JmX
	sw6Q==
X-Received: by 10.68.24.33 with SMTP id r1mr11974813pbf.139.1364714743850;
	Sun, 31 Mar 2013 00:25:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wm3sm9201534pbc.4.2013.03.31.00.25.40
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 31 Mar 2013 00:25:42 -0700 (PDT)
Date: Sun, 31 Mar 2013 09:25:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130331072539.GO11120@jama>
References: <1364700773-32662-1-git-send-email-hmatrjp@users.sourceforge.jp>
MIME-Version: 1.0
In-Reply-To: <1364700773-32662-1-git-send-email-hmatrjp@users.sourceforge.jp>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core][PATCH] pcmciautils: Correct definition of PCMCIAUTILS_VERSION to avoid segmentation fault
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
X-List-Received-Date: Sun, 31 Mar 2013 07:43:17 -0000
X-Groupsio-MsgNum: 43820
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jx/LfW4V5TfZLeq7"
Content-Disposition: inline

--jx/LfW4V5TfZLeq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 31, 2013 at 12:32:53PM +0900, Takeshi Hamasaki wrote:
> This is to fix segmentation fault from pccardctl command.
> -DPCMCIAUTILS_VERSION=3D\'${PV}\' passes PCMCIAUILTS_VERSION to compiler =
as a=20
> multi-character constant, not a string.

oe-core patches need to go to
openembedded-core@lists.openembedded.org

please resend

>=20
> ---
>  meta/recipes-bsp/pcmciautils/pcmciautils.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-=
bsp/pcmciautils/pcmciautils.inc
> index 80271d6..0651236 100644
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> @@ -21,7 +21,7 @@ export udevrulesdir =3D "${nonarch_base_libdir}/udev/ru=
les.d"
>  export UDEV =3D "1"
>  LD =3D "${CC}"
>  CFLAGS =3D+ "-I${S}/src"
> -CFLAGS =3D+ "-DPCMCIAUTILS_VERSION=3D\'${PV}\'"
> +CFLAGS =3D+ "-DPCMCIAUTILS_VERSION=3D\\"${PV}\\""
> =20
>  PARALLEL_MAKE =3D ""
>  EXTRA_OEMAKE =3D "-e 'STRIP=3Decho' 'LIB_OBJS=3D-lc -lsysfs' 'LEX=3Dflex=
'"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jx/LfW4V5TfZLeq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFX5PMACgkQN1Ujt2V2gBzKaACguk9ud/mZYSLvO/6MKHRQBgp1
LEUAn02mmvlFkfGLwtCOvi5TfHaZzL8C
=uZ4R
-----END PGP SIGNATURE-----

--jx/LfW4V5TfZLeq7--
