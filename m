Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5DEFB7378D;
	Thu,  5 Mar 2015 23:02:01 +0000 (UTC)
Received: by wevk48 with SMTP id k48so9429220wev.5;
	Thu, 05 Mar 2015 15:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xwiw8cpgJ/+rPQfGgqyTsREzzWzrLkluBrY9Z1kyqVM=;
	b=q2eEfb9jzUXvCSsPMPwAIrOdwFW7LpK/D1YUZJDqO6FpzND1lTqa6dYdnCEND6bkZh
	JFr50Q8x0qJLmFXs5CD3IGZpmQDCEEtgQ7iGOOE3CFxb3t2sZQnB8fnck4lHMmd4+57W
	4TpoMPzWg4IoqxIgRE9vbZcg1Yg0ljdDAg8eaBf2BDJFO/E1RoX1iCf+TrtMJX/r6fNS
	jBH/dWiVkLXqkKIoN2TW83zXRSQqMkttmi5dtoY9avttGprrrq3raS3R6KSKVuu+jePR
	ulGzTvZXOY6rTaIDRzReb546mzzyXMfPngZHjLYcqVqPBlcY86fsR+htklAdvPift2QV
	kVEw==
X-Received: by 10.180.99.34 with SMTP id en2mr27647323wib.81.1425596522915;
	Thu, 05 Mar 2015 15:02:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vh8sm12440973wjc.12.2015.03.05.15.02.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 15:02:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Mar 2015 00:02:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150305230207.GB2337@jama>
References: <20150305151234.AD31A501C6@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150305151234.AD31A501C6@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Joe MacDonald : nis: blacklist updated yp tools
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
X-List-Received-Date: Thu, 05 Mar 2015 23:02:03 -0000
X-Groupsio-MsgNum: 54670
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bixl4pq/MaomSJT0"
Content-Disposition: inline

--Bixl4pq/MaomSJT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 03:12:34PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 345463da86ea4703bb61708f31e86f380ec8a093
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D345463da86ea4703bb61708f31e86f380ec8a093
>=20
> Author: Joe MacDonald <joe_macdonald@mentor.com>
> Date:   Thu Mar  5 10:11:11 2015 -0500
>=20
> nis: blacklist updated yp tools
>=20
> The updated yp-tools fails on qemuarm:
>=20
>     /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueab=
i/yp-tools/3.3-r0/yp-tools-3.3/lib/do_ypcall.c: In function 'do_ypcall_tr':
>     /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueab=
i/yp-tools/3.3-r0/yp-tools-3.3/lib/do_ypcall.c:461:27:
>     error: cast increases required alignment of target type [-Werror=3Dca=
st-align]
>          status =3D ypprot_err (((struct ypresp_val *) resp)->status);
>=20
> http://errors.yoctoproject.org/Errors/Details/9221/
>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>=20
> ---
>=20
>  meta-networking/recipes-support/nis/yp-tools_3.3.bb  | 2 ++
>  meta-networking/recipes-support/nis/ypbind-mt_2.2.bb | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/meta-n=
etworking/recipes-support/nis/yp-tools_3.3.bb
> index 75ad989..b89f0b8 100644
> --- a/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> +++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
> @@ -11,6 +11,8 @@ ypwhich, yppasswd, domainname, nisdomainname \
>  and ypdomainname. \
>  "
> =20
> +PNBLACKLIST[yp-tools] ?=3D "BROKEN: fails to build for qemuarm."
> +
>  SRC_URI =3D "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
>             file://domainname.service \
>             file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv=
4v6addr.patch \
> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-=
networking/recipes-support/nis/ypbind-mt_2.2.bb
> index b960757..0444bfe 100644
> --- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> @@ -18,6 +18,8 @@ HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/in=
dex.html"
>  DEPENDS =3D "yp-tools"
>  PROVIDES +=3D "ypbind"
> =20
> +PNBLACKLIST[yp-bind] ?=3D "BROKEN: Depends on broken yp-tools"

typo yp-bind ypbind-mt

as result ypbind-mt now fails to build with:
| configure: error: Package requirements (libnis) were not met:
|=20
| No package 'libnis' found
|=20
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|=20
| Alternatively, you may set the environment variables NIS_CFLAGS
| and NIS_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/ypbind-mt/2.2-r0=
/temp/log.do_configure.16370)
NOTE: recipe ypbind-mt-2.2-r0: task do_configure: Failed

probably because yp-tools are too old

> +
>  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
>             file://ypbind-yocto.init \
>             file://ypbind.service \
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bixl4pq/MaomSJT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT44G8ACgkQN1Ujt2V2gBwHhgCdH4R0e2BOzd8J+aKBwGKAr/D7
l3AAn1vlJH/xomUcPEDBZN2xVohkd9i+
=pZfv
-----END PGP SIGNATURE-----

--Bixl4pq/MaomSJT0--
