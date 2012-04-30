Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOjmo-00037f-MA
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:08:38 +0200
Received: by wibhm17 with SMTP id hm17so2016339wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VMsIoTAopLgKBoBIuhmuamDrCL2H021laWj6TeumpHw=;
	b=X/7wUTCN6q+QO10OmdcH+ihxfGiv71wEJH6zwPNS5a2BcUE/w/I4u7LeTRqc6vM2hk
	vk/U1t0vCgKDx76sdZnbqjosbEcSQCQ3q1L+h65ZbKgfWCubvkTnaRGcufa220RVjuWW
	wuhNi+gbRubcnCCn0kARQe/xXQ4ZBT3E615evMTHVN9CLMYoe/7Z+c1zjcbvNFK8wdlQ
	NV/wtE/OqetkQM5RNIPKzWoXLOE4RGzuyq8p5c5UOqBansCBwOnPB0gHvWWD3YDAyAs1
	s6mEBSTfSIOcmupEApkNDBfEy5w7OTJrbs4jVqQneELoBdnFP0n14lnXdofjJHj0B9M2
	SVxw==
Received: by 10.216.137.149 with SMTP id y21mr4689297wei.110.1335765537189;
	Sun, 29 Apr 2012 22:58:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg2sm41582925wib.7.2012.04.29.22.58.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 22:58:53 -0700 (PDT)
Date: Mon, 30 Apr 2012 07:58:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120430055852.GA3664@jama.jama.net>
References: <1335481339-4539-1-git-send-email-tasskjapp@gmail.com>
	<1335851575-20786-1-git-send-email-tasskjapp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1335851575-20786-1-git-send-email-tasskjapp@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v3] synergy: add synergy 1.3.8
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
X-List-Received-Date: Mon, 30 Apr 2012 06:08:38 -0000
X-Groupsio-MsgNum: 38458
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 01, 2012 at 07:52:54AM +0200, Tasslehoff Kjappfot wrote:
>=20

v2 was applied already few days ago..
http://git.openembedded.org/meta-openembedded/commit/?id=3D5a3d0de38a3af92d=
07503184fb214df6e9f57610

so if you want to fix it, then rebase it on top of meta-oe and send follow-=
up patch

> Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
> ---
>  meta-oe/recipes-support/synergy/synergy_1.3.8.bb |   22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-support/synergy/synergy_1.3.8.bb
>=20
> diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/r=
ecipes-support/synergy/synergy_1.3.8.bb
> new file mode 100644
> index 0000000..b8d1e6c
> --- /dev/null
> +++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Synergy - control multiple computers with one keyboard =
and mouse"
> +HOMEPAGE =3D "http://synergy.googlecode.com"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9772a11e3569985855e2ce450e56f=
991"
> +LICENSE =3D "GPL-2.0"
> +SECTION =3D "x11/utils"
> +
> +DEPENDS =3D "libx11 libxtst"
> +
> +SRC_URI =3D "http://synergy.googlecode.com/files/synergy-${PV}-Source.ta=
r.gz"
> +
> +SRC_URI[md5sum] =3D "3534c65ecfa6e47d7899c57975442f03"
> +SRC_URI[sha256sum] =3D "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da0=
5110943edbfacc03"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}-Source"
> +
> +inherit cmake
> +
> +do_install() {
> +	install -d ${D}/usr/bin
> +	install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
> +}
> +
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+eKhwACgkQN1Ujt2V2gBz+IgCdEaQ5Z33Nxaix8wiMNprFDzhK
KKsAnjcFUkezpkoJ5GF7keZFOGDm9ZMS
=R8Fm
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
