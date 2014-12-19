Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6292A729CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 19:12:35 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so2129802wgg.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lc5DGrAERK7q3xIor955N758s/K8a/6g/jaAWoOKIPA=;
	b=p0S0O2Al/G0mfCGaPUOJN3BYsiyv27aKbWhxqoAfJFiimhhgRjg8TUtWxzJtWVTUTr
	rJhdhb8uBekzwGVFCsyg9N1Qyc1OeZS0Vtp+ZbggpylsHfoYnOovzASvSWc1CRiXMr8N
	6fTNiVRFVAsjhEpiOcC0HTaogqzunoUVLlcBAzfsmbFr5XcH0QNi2lwAyvFN9wBVOHFe
	so5bNPq5OFrnpWkYOP5ZaB1uMpaOAalb84/Ocm7xZKBd2f+ZMUCoAZHycGiorIcp9fOf
	mVmVsbwce5sWdOZGzX2KPp6ZKN7e4nrOUSB3r3sqehDdpyDJvyqXSDPq2TlWtbQoBJk2
	dvvQ==
X-Received: by 10.194.110.69 with SMTP id hy5mr17803062wjb.121.1419016355336; 
	Fri, 19 Dec 2014 11:12:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex9sm3368387wib.14.2014.12.19.11.12.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Dec 2014 11:12:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 Dec 2014 20:12:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141219191240.GA2461@jama>
References: <1418781894-1975-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1418781894-1975-2-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418781894-1975-2-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] makedev: add new recipe
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
X-List-Received-Date: Fri, 19 Dec 2014 19:12:43 -0000
X-Groupsio-MsgNum: 53402
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2014 at 10:04:53AM +0800, Li xin wrote:
> makedev is a tool for creating the necessary static
> device nodes, usually residing in the /dev directory.

Can this be used as replacement for
openembedded-core/meta/recipes-devtools/makedevs
?

And if yes, shouldn't it be applied there?

> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/makedev/makedev_3.24.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-support/makedev/makedev_3.24.bb
>=20
> diff --git a/meta-oe/recipes-support/makedev/makedev_3.24.bb b/meta-oe/re=
cipes-support/makedev/makedev_3.24.bb
> new file mode 100644
> index 0000000..18395df
> --- /dev/null
> +++ b/meta-oe/recipes-support/makedev/makedev_3.24.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "MAKEDEV is a script for creating the necessary static \
> +device nodes, usually residing in the /dev directory."
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +SECTION =3D "base"
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/MAKEDEV/MAKEDEV-${P=
V}-1.tar.gz/38546d1306ead17afbc34f60c06fcb20/MAKEDEV-${PV}-1.tar.gz"
> +SRC_URI[md5sum] =3D "38546d1306ead17afbc34f60c06fcb20"
> +SRC_URI[sha256sum] =3D "554f9b4a7344addf6a7ea2264f21c726939976cfdd08520e=
3ed8dd38c5605ffa"
> +
> +inherit autotools-brokensep pkgconfig
> +S =3D "${WORKDIR}/MAKEDEV-3.24"
> +do_install () {
> +    oe_runmake DESTDIR=3D${D} makedevdir=3D/sbin install
> +    rm -fr ${D}/dev
> +}
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

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSUeKgACgkQN1Ujt2V2gBwx1ACfVJp6U9UiqzhRWDN85HN6SzKL
gxQAoITZ++f4gKzWEXXSKgrfQj4/GI9H
=r3hh
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
