Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 56ABB65CCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:04:04 +0000 (UTC)
Received: by wijp15 with SMTP id p15so18736665wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+Y01+wF2lt8qOA586jFbX112Cxqmoh4xBhTTZHpYfZw=;
	b=jsTedznW3lyG4TGyEQXzf8bWJyAq9nr0+RRmVdBTbsXPglwgL+c0QUFVlYFZCGV9dU
	B7yzZ9KvKUUbc4vW0SKe53qBNq5d69CW3E31m3bci6wCTO/OaWG2/preIb28S0O8amnj
	KYE+86qNTGSNZhd8toIX5Ms7wRIN/5vfvBKRF7oK6VjEhH87QwcBGitUQA8ZNw4G1ek6
	hC/ghKQtyPlwR/34JIF2EvXERMZPPUeixX87xeONW0EBhzMRFkxDbbUzk07jilnb48lv
	oQOC/mSFzhkZSizUFsRtCsw9qEeOuqs2MVlWqJuaMhNPQqiSNp/s5tssTV0/W6Yoek8d
	o36Q==
X-Received: by 10.194.122.132 with SMTP id ls4mr6523475wjb.130.1440083044467; 
	Thu, 20 Aug 2015 08:04:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ej5sm5945403wjd.22.2015.08.20.08.04.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:04:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 17:04:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820150431.GJ2446@jama>
References: <1435559647-37696-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1435559647-37696-1-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] sysdig: add new recipe
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
X-List-Received-Date: Thu, 20 Aug 2015 15:04:04 -0000
X-Groupsio-MsgNum: 56838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="451BZW+OUuJBCAYj"
Content-Disposition: inline

--451BZW+OUuJBCAYj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 02:34:07PM +0800, Bian Naimeng wrote:
> sysdig is a tool for system-level exploration and troubleshooting
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb | 32 +++++++++++++++++=
++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
>=20
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb b/meta-oe/=
recipes-extended/sysdig/sysdig_0.1.101.bb
> new file mode 100644
> index 0000000..72a0386
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "A New System Troubleshooting Tool Built for the Way You Wor=
k"
> +DESCRIPTION =3D "Sysdig is open source, system-level exploration: captur=
e \
> +system state and activity from a running Linux instance, then save, \
> +filter and analyze."
> +HOMEPAGE =3D "http://www.sysdig.org/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS =3D "luajit zlib ncurses"
> +RDEPENDS_${PN} =3D "bash"
> +
> +
> +SRC_URI =3D "https://github.com/draios/sysdig/archive/${PV}.tar.gz"

Don't use github archives, they are regenerated from time to time with=20
different checksums and they have stupid filenames (prone to collision=20
with other recipes).

> +
> +SRC_URI[md5sum] =3D "5fe96a3a0fd98b2157a40cb29af41afc"
> +SRC_URI[sha256sum] =3D "6995e39be565514901b5cb587689ee2efbf8359293e4e597=
362382cccf0e9db6"
> +
> +DIR_ETC=3D"/etc"
> +EXTRA_OECMAKE =3D ' -DUSE_BUNDLED_LUAJIT=3D"OFF" \
> +                  -DUSE_BUNDLED_ZLIB=3D"OFF" \
> +                  -DBUILD_DRIVER=3D"OFF" \
> +                  -DUSE_BUNDLED_NCURSES=3D"OFF" \
> +                  -DDIR_ETC=3D"${DIR_ETC}" \
> +                '
> +
> +FILES_${PN} +=3D " \
> +    ${DIR_ETC}/* \
> +    ${datadir}/zsh/* \=20
> +    ${prefix}/src/*  \
> +"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--451BZW+OUuJBCAYj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV7H4ACgkQN1Ujt2V2gBwg4gCfRY6npa8Rg2CzW07mnQiWQ1hl
QmMAniR0jNuJ52Pxq968519aiFILzrc9
=iYEs
-----END PGP SIGNATURE-----

--451BZW+OUuJBCAYj--
