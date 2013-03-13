Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFjp5-0005kv-EB
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 12:26:20 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so901514pbb.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rh6f4moYxyW6UD7SvY/lBd1z/gnobYRgfRgdHBn8elE=;
	b=ZxuPOzLb9Gytfa1Vu8bVlXD2TgmQuS7lQaavMe6JCRmLD0L2DRav5TOEZ9x8a1Ec3G
	qfrc9HgcDhtqL9D2XG8VbS/lkl40XXBkGVXpyio73bQEjdk0qgqQguPoRdf7yxgg9PP8
	30ITjDHh0bLX7XkBfb4mptnY4uustK73laAWxlTVLbSVdIPImhm0XEDb3606NhikxruF
	AU4M7/ymzKX85iYj7vzqtnqGmqe1nG3S5ht8ADSurtZVdCYdeDjLRqd6Tzcy1inY/IdB
	rbV3VZfjJ/1rgE3DUD7I/VqRbBM6ieacyH2ofQluMhdon1cfHQ4PBdF3AajMmxpU/hEf
	sL4Q==
X-Received: by 10.68.232.162 with SMTP id tp2mr44508056pbc.192.1363172976829; 
	Wed, 13 Mar 2013 04:09:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vd4sm29122126pbc.35.2013.03.13.04.09.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 04:09:35 -0700 (PDT)
Date: Wed, 13 Mar 2013 12:09:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313110926.GA3260@jama>
References: <1362163066-376-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1362163066-376-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH v2] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Wed, 13 Mar 2013 11:26:20 -0000
X-Groupsio-MsgNum: 43512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 10:37:46AM -0800, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> Fingerterm is a terminal emulator for Nokia Harmattan, but it works in an=
y Qt4
> environment.
>=20
> This recipe can be extended by a .bbappend to add .desktop, icon and othe=
rs to
> the target device.
>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   30 +++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>=20
> diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/=
recipes-qt/fingerterm/fingerterm_1.0.2.bb
> new file mode 100644
> index 0000000..e828672
> --- /dev/null
> +++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "A terminal emulator for Harmattan (Nokia N9/N950) with =
a custom \
> +virtual keyboard and usability-enhancing features such as URL grabber, p=
an \
> +gestures and customizable shortcut menu. Designed especially to be used =
with \
> +screen and irssi."
> +HOMEPAGE =3D "http://hqh.unlink.org/harmattan"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"

Hi,

in v2 you have changed LIC_FILES_CHKSUM, old one was correct, new one is
not:

NOTE: recipe fingerterm-1.0.2-r0: task do_configure: Started
ERROR: fingerterm: md5 data is not matching for file://COPYING;md5=3Dd32239=
bcb673463ab874e80d47fae504
ERROR: fingerterm: The new md5 checksum is b234ee4d69f5fce4486a80fdaf4a4263
ERROR: fingerterm: Check if the license information has changed in
ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
ERROR: Function failed: do_qa_configure

Please send tested v3.

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
> +"
> +
> +do_install() {
> +  install -d ${D}${bindir}
> +  install -m 0744 ${S}/${PN} ${D}${bindir}
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

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAXmYACgkQN1Ujt2V2gBzfLACeOHqIHDZWgUoohi6kb2tAAGWz
NokAn3AMg7TZx1VbrNE/cpb/IgV0plqS
=S6hN
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
