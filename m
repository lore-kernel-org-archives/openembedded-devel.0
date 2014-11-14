Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id DDBB86A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 12:00:07 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so2404112wiw.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 04:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A0HI9d50TN+vx0LH+D9cDNiVhEAObjg6i68ZPAQGzp0=;
	b=v+N/luLw7VJCw9ApQ3XL9CXnkcoyqrZK62wajsxEPP0B2d97HX/rZRmOUz55ce8EiL
	x3um6XaeoSoc2eYiaYLPkDQbrIJjsEBIO5tYU50cZ4RywR/95nWFzAoGW46OAv6v1h4C
	zEG/+3fO0/8vbkrsVM1oqp7btf/LmDaoqaFtowLSSmvjvaTXFCjchkQ3L+l8IEuvs1+U
	/wLTZhIbxCp4Xctr7JTGseQYRJ6yCKv/1uyvLM00mvtRPUNnrqzhqW4ktl8/4sPfAPP+
	P5UWSmkZkZyHtWxwaruFJKPjMDnAw6j+SzE+FwiOpjXHK5CfKGrCw/csrWt14VdMvtCu
	pZUw==
X-Received: by 10.180.91.137 with SMTP id ce9mr7047049wib.60.1415966407876;
	Fri, 14 Nov 2014 04:00:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fa7sm39377522wjd.27.2014.11.14.04.00.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Nov 2014 04:00:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Nov 2014 13:00:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141114120013.GD2458@jama>
References: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
	<1415956804-56497-2-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415956804-56497-2-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/3] Porting dash from openembedded and upgrade to 0.5.8
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
X-List-Received-Date: Fri, 14 Nov 2014 12:00:11 -0000
X-Groupsio-MsgNum: 52880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GpGaEY17fSl8rd50"
Content-Disposition: inline

--GpGaEY17fSl8rd50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 05:20:02PM +0800, Bian Naimeng wrote:
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/dash/dash_0.5.8.bb | 27 +++++++++++++++++++++++=
++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/dash/dash_0.5.8.bb
>=20
> diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/recipe=
s-extended/dash/dash_0.5.8.bb
> new file mode 100644
> index 0000000..3b9ea16
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "Small and fast POSIX-compliant shell"

This should be SUMMARY
This time I'll change it when cherry-picking.

> +HOMEPAGE =3D "http://gondor.apana.org.au/~herbert/dash/"
> +SECTION =3D "System Environment/Shells"
> +LICENSE =3D "BSD GPLv2+"
> +
> +inherit autotools update-alternatives
> +
> +SRC_URI =3D "http://gondor.apana.org.au/~herbert/dash/files/${PN}-${PV}.=
tar.gz"
> +
> +SRC_URI[md5sum] =3D "5c152209680dab3c319e8923f6c51378"
> +SRC_URI[sha256sum] =3D "c6db3a237747b02d20382a761397563d813b306c020ae28c=
e25a1c3915fac60f"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db5262b4a1a1bff72b48e935531976=
d2e"
> +
> +EXTRA_OECONF +=3D "--bindir=3D${base_bindir}"
> +
> +ALTERNATIVE_${PN} =3D "sh"
> +ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
> +ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/dash"
> +ALTERNATIVE_PRIORITY =3D "10"
> +
> +pkg_postinst_${PN} () {
> +	grep -q "^${base_bindir}/dash$" $D${sysconfdir}/shells || echo ${base_b=
indir}/dash >> $D${sysconfdir}/shells
> +}
> +
> +pkg_postrm_${PN} () {
> +	printf "$(grep -v "^${base_bindir}/dash$" $D${sysconfdir}/shells)\n" > =
$D${sysconfdir}/shells
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GpGaEY17fSl8rd50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRl7s0ACgkQN1Ujt2V2gBxgxQCeKh8Y0jFnKv83x301gCgJV+zE
IFUAn04ulJo+fRtE9R7bL1qvLpuPEujf
=M2MX
-----END PGP SIGNATURE-----

--GpGaEY17fSl8rd50--
