Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 479A9609AE
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 15:12:22 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id p9so310276lbv.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ArladNk0PK+JPLeLr3BK4GWiWj/JmBPNk56v0FR1cQs=;
	b=DY2NmWDsflHIv3UnJr/Y8NVRrkFyXvKpHNqdlfBOxe6SBhs0seyOjOry4lglnBSQpN
	xxtuIJ8WstY8eHichtrEbPyXxOzKVi5nNrUGt/t+KzQ55qlwJpgGqY0XYTTPZd89q2vF
	C108L3p2oULB1GloxpAJqFPuXWKb6E2oS/GUZrFNnf8YInrXAlRzH3XEN5tJJV5ODs7E
	XntTxQ2MA0mBYp+gWJMAw7WYCsu0a0JPvkrQ0Opyd9QwGSvtoVICNH1Q25QhOpgFJm5M
	wW+YR9p0ex0PQyR0afaSwPC6AlkfGzBbtoSKccQkXeIKwK0ApZiuR/u77o/hyFXi6xQk
	rsAw==
X-Received: by 10.112.61.199 with SMTP id s7mr21774885lbr.25.1399216343098;
	Sun, 04 May 2014 08:12:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id w1sm5360199lal.1.2014.05.04.08.12.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 08:12:21 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 4 May 2014 17:12:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140504151235.GE2486@jama>
References: <1399101781-5560-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1399101781-5560-1-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libjpeg-turbo: update 1.3.0 -> 1.3.1
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
X-List-Received-Date: Sun, 04 May 2014 15:12:23 -0000
X-Groupsio-MsgNum: 49679
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ptbm0t6/mLuCAH75"
Content-Disposition: inline

--Ptbm0t6/mLuCAH75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2014 at 12:23:01AM -0700, Andre McCurdy wrote:
> This commit also modifies SRC_URI to fetch a release tarfile instead
> of checking out from SourceForge SVN and makes some minor updates to
> the jpeg-tools DESCRIPTION text.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb    | 39 ++++++++++++++++=
++++++
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb     | 36 ----------------=
----
>  2 files changed, 39 insertions(+), 36 deletions(-)
>  create mode 100644 meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
>  delete mode 100644 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb b/meta-o=
e/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
> new file mode 100644
> index 0000000..d30811e
> --- /dev/null
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION =3D "libjpeg-turbo is a derivative of libjpeg that uses SIMD=
 instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and=
 decompression"
> +HOMEPAGE =3D "http://libjpeg-turbo.org/"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D12;md5=3D78fa8dbac547bb5=
b2a0e6457a6cfe21d \
> +                    file://jpeglib.h;endline=3D14;md5=3Da08bb0a80f782a9f=
8da313cc4015ed6f \
> +                    file://djpeg.c;endline=3D9;md5=3D7629c51aed78174711c=
20a40194a8f1b \
> +"
> +
> +BASEPV =3D "${@d.getVar('PV',1).split('+')[1]}"

,1 -> ,True

> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${BASEPV}.tar.gz"

PN -> BPN

> +SRC_URI[md5sum] =3D "2c3a68129dac443a72815ff5bb374b05"
> +SRC_URI[sha256sum] =3D "c132907417ddc40ed552fe53d6b91d5fecbb14a356a60ddc=
7ea50d6be9666fb9"
> +
> +S =3D "${WORKDIR}/${PN}-${BASEPV}"

PN -> BPN

I did above changes in master-next, because otherwise
libjpeg-turbo-native fails to fetch:

NOTE: Running task 1098 of 25448 (ID: 24931, virtual:native:/home/jenkins/o=
e/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-core/jpeg/li=
bjpeg-turbo_8d+1.3.1.bb, do_fetch)
NOTE: recipe libjpeg-turbo-native-8d+1.3.1-r0: task do_fetch: Started
WARNING: Failed to fetch URL http://downloads.sourceforge.net/libjpeg-turbo=
-native/libjpeg-turbo-native-1.3.1.tar.gz, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
http://downloads.sourceforge.net/libjpeg-turbo-native/libjpeg-turbo-native-=
1.3.1.tar.gz:
2014-05-03 19:52:48 ERROR 404: Not Found.

ERROR: Function failed: Fetcher failure for URL: 'http://downloads.sourcefo=
rge.net/libjpeg-turbo-native/libjpeg-turbo-native-1.3.1.tar.gz'. Unable to =
fetch URL from any source.
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/x86_64-linux/libjpeg-turbo-native/8d+1.3.1-r0/temp/lo=
g.do_fetch.5294
NOTE: recipe libjpeg-turbo-native-8d+1.3.1-r0: task do_fetch: Failed
ERROR: Task 24931 (virtual:native:/home/jenkins/oe/shr-core-branches/shr-co=
re/meta-openembedded/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb, d=
o_fetch) failed with exit code '1'

> +
> +# Drop-in replacement for jpeg
> +PROVIDES =3D "jpeg"
> +RPROVIDES_${PN} +=3D "jpeg"
> +RREPLACES_${PN} +=3D "jpeg"
> +RCONFLICTS_${PN} +=3D "jpeg"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--with-jpeg8 "
> +
> +PACKAGES =3D+ "jpeg-tools libturbojpeg"
> +
> +DESCRIPTION_jpeg-tools =3D "The jpeg-tools package includes client progr=
ams to access libjpeg functionality.  These tools allow for the compression=
, decompression, transformation and display of JPEG files and benchmarking =
of the libjpeg library."
> +FILES_jpeg-tools =3D "${bindir}/*"
> +
> +FILES_libturbojpeg =3D "${libdir}/libturbojpeg.so"
> +INSANE_SKIP_libturbojpeg =3D "dev-so"
> +
> +BBCLASSEXTEND =3D "native"
> +DEPENDS =3D "nasm-native"
> +
> +LEAD_SONAME =3D "libjpeg.so.8"
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/rec=
ipes-core/jpeg/libjpeg-turbo_svn.bb
> deleted file mode 100644
> index fa4acfd..0000000
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -DESCRIPTION =3D "libjpeg-turbo is a derivative of libjpeg that uses SIMD=
 instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and=
 decompression"
> -HOMEPAGE =3D "http://libjpeg-turbo.org/"
> -
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D12;md5=3D78fa8dbac547bb5=
b2a0e6457a6cfe21d \
> -                    file://jpeglib.h;endline=3D14;md5=3Da08bb0a80f782a9f=
8da313cc4015ed6f \
> -                    file://djpeg.c;endline=3D13;md5=3D03db065044529233c2=
96324be85530ab \
> -"
> -PV =3D "8d+1.3.0"
> -SRCREV =3D "988"
> -SRC_URI =3D "svn://svn.code.sf.net/p/libjpeg-turbo/code;protocol=3Dsvn;m=
odule=3Dtrunk"
> -
> -S =3D "${WORKDIR}/trunk"
> -
> -# Drop-in replacement for jpeg
> -PROVIDES =3D "jpeg"
> -RPROVIDES_${PN} +=3D "jpeg"
> -RREPLACES_${PN} +=3D "jpeg"
> -RCONFLICTS_${PN} +=3D "jpeg"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF =3D "--with-jpeg8 "
> -
> -PACKAGES =3D+ "jpeg-tools libturbojpeg"
> -
> -DESCRIPTION_jpeg-tools =3D "The jpeg-tools package includes the client p=
rograms for access libjpeg functionality.  These tools allow for the compre=
ssion, decompression, transformation and display of JPEG files."
> -FILES_jpeg-tools =3D "${bindir}/*"
> -
> -FILES_libturbojpeg =3D "${libdir}/libturbojpeg.so"
> -INSANE_SKIP_libturbojpeg =3D "dev-so"
> -
> -BBCLASSEXTEND =3D "native"
> -DEPENDS =3D "nasm-native"
> -
> -LEAD_SONAME =3D "libjpeg.so.8"
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ptbm0t6/mLuCAH75
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNmWOMACgkQN1Ujt2V2gBzpqgCgk1jhkptN9OkmFpF1l2+DXoiM
ceMAoKE35O8kPpQNHyX9z0olTL801BbM
=8ZSX
-----END PGP SIGNATURE-----

--Ptbm0t6/mLuCAH75--
