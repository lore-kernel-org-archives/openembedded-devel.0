Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIG9h-0003oC-4j
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 11:22:02 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so1227274pbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=pidMxyxoj/3z4UUoMzkuK/MkcCUWSMLK5M7ZeU8UO9w=;
	b=PpuURKpd4/PxHvRmUBX3QsHUSdfeR1It1sRVQOG2m1RlR5WKCFFdxdPqiyvOSyUYN6
	hFWT+8I9iWxLgd3Sm77PgkBEQ7YjNgiKaU/4oskiQ7/cX7abSc7VZOuUq6SXLdYJXiso
	qInzvifXsvqzcdOsQ/pbDCOWa5dwMUj9sITRjkXLVOagu03oZ8phWad4bYL9OKFyhkQS
	ZEZzDlfChvBP92B9scI/oSxCDRTX1juA/wCHFj1CRt/i/2tncayKLs+tNYc+MLywxffF
	w8+eI6VFfEQasGQeppvUbgJO5KP0CGh3jE04fz8l18GA42+lzNSROgvWFVevXb8gLWOj
	XmiA==
X-Received: by 10.68.252.193 with SMTP id zu1mr4573344pbc.175.1363773909599;
	Wed, 20 Mar 2013 03:05:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kb3sm1573904pbc.21.2013.03.20.03.05.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 03:05:08 -0700 (PDT)
Date: Wed, 20 Mar 2013 11:05:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130320100503.GA3220@jama>
References: <1363730433-8555-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1363730433-8555-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH v4] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Wed, 20 Mar 2013 10:22:02 -0000
X-Groupsio-MsgNum: 43617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2013 at 03:00:33PM -0700, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> Fingerterm is a terminal emulator for Nokia Harmattan, but it works in an=
y Qt4
> environment.
>=20
> This recipe can be extended by a .bbappend to add .desktop, icon and othe=
rs to
> the target device.

This part of commit message can be dropped now right?

I'll drop it before pushing it (if it builds OK on jenkins) no need for
v5 if nobody sends more comments.

> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   44 +++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>=20
> diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/=
recipes-qt/fingerterm/fingerterm_1.0.2.bb
> new file mode 100644
> index 0000000..59533a4
> --- /dev/null
> +++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION =3D "A terminal emulator for Harmattan (Nokia N9/N950) with =
a custom \
> +virtual keyboard and usability-enhancing features such as URL grabber, p=
an \
> +gestures and customizable shortcut menu. Designed especially to be used =
with \
> +screen and irssi."
> +HOMEPAGE =3D "http://hqh.unlink.org/harmattan"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +SECTION =3D "qt/app"
> +
> +PR =3D "r0"
> +
> +inherit qt4x11 pkgconfig
> +
> +SRC_URI =3D " \
> +  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \
> +"
> +
> +SRC_URI[md5sum] =3D "d53b0f463c025583cd52accf95715448"
> +SRC_URI[sha256sum] =3D "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a04=
4b6674dd82d95150"
> +
> +S =3D "${WORKDIR}/${PN}"
> +
> +FILES_${PN} =3D " \
> +  ${bindir}/${PN} \
> +  ${datadir}/applications/${PN}.desktop \
> +  ${datadir}/pixmaps/${PN}.png \
> +"
> +
> +do_install() {
> +  install -d ${D}${bindir}
> +  install -m 0744 ${S}/${PN} ${D}${bindir}
> +
> +  sed -i -e '/Exec.*/d' fingerterm.desktop
> +  sed -i -e '/Icon.*/d' fingerterm.desktop
> +
> +  echo 'Exec=3D${bindir}/${PN}' >> fingerterm.desktop
> +  echo 'Icon=3D${PN}' >> fingerterm.desktop
> +
> +  install -d ${D}${datadir}/applications
> +  install -m 0644 ${S}/${PN}.desktop ${D}${datadir}/applications
> +
> +  install -d ${D}${datadir}/pixmaps
> +  install -m 0644 ${S}/${PN}.png ${D}${datadir}/pixmaps
> +}
> \ No newline at end of file
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

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFJic8ACgkQN1Ujt2V2gBxZOwCfTyCdPx1MMThhF10v0bdcE3ng
ydEAnA+1aezTLaxgRixKWh70wjMFh6p2
=/MpN
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
