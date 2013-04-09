Received: from mail-pd0-f172.google.com ([209.85.192.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPW3r-0002aq-00
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 12:46:05 +0200
Received: by mail-pd0-f172.google.com with SMTP id 5so3743749pdd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 03:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h2NQtXdPgiClGxAsKGvijrbEzfl3r9JgjVnjZTwdDMo=;
	b=TtzzfkAha9m1YJopT301axGH3JobbQ+U5GTicVG12xiy+MgwWOAE83h2AWGpxUs454
	eTbj3VzIcWDwHK5maEWW7I+d97wyrIC/aG33U1fxFdt4HgJBLS43Tnc64aby6CsDeogr
	r4D3sU0CAdsfloGzLmE12oEzMxT5azdlywLrOqh2KCs5Viw/WxTroBXml0Qdzigp/dWt
	QXM7yWrLNpOOtnSTt2AiFtO4GjZhjoZIwZ6yoRNgss4fV4YB4pRT0V8Fl99Hcv6AHDGH
	Ia1NEVQ0vrBk9DbrWI7Eg7LWG2oxftkNh0j9c0/IWoegLyHUaCiR9qsbPzOQ3jAHv+Te
	6X4Q==
X-Received: by 10.66.121.133 with SMTP id lk5mr43459929pab.171.1365503318193; 
	Tue, 09 Apr 2013 03:28:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mm9sm1694264pbc.43.2013.04.09.03.28.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 03:28:37 -0700 (PDT)
Date: Tue, 9 Apr 2013 12:28:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130409102828.GB2474@jama>
References: <cover.1364807977.git.apelete@seketeli.net>
	<25eb3d05e3b85bf4b3fb92029bc62d5aa23931dc.1364807977.git.apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <25eb3d05e3b85bf4b3fb92029bc62d5aa23931dc.1364807977.git.apelete@seketeli.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/1] ttf-fonts: import ttf-inconsolata recipe from oe-classic
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
X-List-Received-Date: Tue, 09 Apr 2013 10:46:07 -0000
X-Groupsio-MsgNum: 43993
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2013 at 11:35:47AM +0200, Apelete Seketeli wrote:
> Import ttf-inconsolata recipe from "oe-classic". This is intended to
> satisfy dependency chain of muffinman-image recipe for the JLime
> distribution.

ERROR: ttf-inconsolata: Recipe file does not have license file
information (LIC_FILES_CHKSUM)
ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix


>=20
> Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> ---
>  .../ttf-fonts/ttf-inconsolata/OFL.txt              |   97 ++++++++++++++=
++++++
>  .../ttf-fonts/ttf-inconsolata_20100526.bb          |   26 ++++++
>  2 files changed, 123 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OF=
L.txt
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20=
100526.bb
>=20
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt b=
/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt
> new file mode 100644
> index 0000000..1456c18
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt
> @@ -0,0 +1,97 @@
> +Copyright (c) <dates>, <Copyright Holder> (<URL|email>),
> +with Reserved Font Name <Reserved Font Name>.
> +Copyright (c) <dates>, <additional Copyright Holder> (<URL|email>),
> +with Reserved Font Name <additional Reserved Font Name>.
> +Copyright (c) <dates>, <additional Copyright Holder> (<URL|email>).
> +
> +This Font Software is licensed under the SIL Open Font License, Version =
1.1.
> +This license is copied below, and is also available with a FAQ at:
> +http://scripts.sil.org/OFL
> +
> +
> +-----------------------------------------------------------
> +SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
> +-----------------------------------------------------------
> +
> +PREAMBLE
> +The goals of the Open Font License (OFL) are to stimulate worldwide
> +development of collaborative font projects, to support the font creation
> +efforts of academic and linguistic communities, and to provide a free and
> +open framework in which fonts may be shared and improved in partnership
> +with others.
> +
> +The OFL allows the licensed fonts to be used, studied, modified and
> +redistributed freely as long as they are not sold by themselves. The
> +fonts, including any derivative works, can be bundled, embedded,=20
> +redistributed and/or sold with any software provided that any reserved
> +names are not used by derivative works. The fonts and derivatives,
> +however, cannot be released under any other type of license. The
> +requirement for fonts to remain under this license does not apply
> +to any document created using the fonts or their derivatives.
> +
> +DEFINITIONS
> +"Font Software" refers to the set of files released by the Copyright
> +Holder(s) under this license and clearly marked as such. This may
> +include source files, build scripts and documentation.
> +
> +"Reserved Font Name" refers to any names specified as such after the
> +copyright statement(s).
> +
> +"Original Version" refers to the collection of Font Software components =
as
> +distributed by the Copyright Holder(s).
> +
> +"Modified Version" refers to any derivative made by adding to, deleting,
> +or substituting -- in part or in whole -- any of the components of the
> +Original Version, by changing formats or by porting the Font Software to=
 a
> +new environment.
> +
> +"Author" refers to any designer, engineer, programmer, technical
> +writer or other person who contributed to the Font Software.
> +
> +PERMISSION & CONDITIONS
> +Permission is hereby granted, free of charge, to any person obtaining
> +a copy of the Font Software, to use, study, copy, merge, embed, modify,
> +redistribute, and sell modified and unmodified copies of the Font
> +Software, subject to the following conditions:
> +
> +1) Neither the Font Software nor any of its individual components,
> +in Original or Modified Versions, may be sold by itself.
> +
> +2) Original or Modified Versions of the Font Software may be bundled,
> +redistributed and/or sold with any software, provided that each copy
> +contains the above copyright notice and this license. These can be
> +included either as stand-alone text files, human-readable headers or
> +in the appropriate machine-readable metadata fields within text or
> +binary files as long as those fields can be easily viewed by the user.
> +
> +3) No Modified Version of the Font Software may use the Reserved Font
> +Name(s) unless explicit written permission is granted by the correspondi=
ng
> +Copyright Holder. This restriction only applies to the primary font name=
 as
> +presented to the users.
> +
> +4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font
> +Software shall not be used to promote, endorse or advertise any
> +Modified Version, except to acknowledge the contribution(s) of the
> +Copyright Holder(s) and the Author(s) or with their explicit written
> +permission.
> +
> +5) The Font Software, modified or unmodified, in part or in whole,
> +must be distributed entirely under this license, and must not be
> +distributed under any other license. The requirement for fonts to
> +remain under this license does not apply to any document created
> +using the Font Software.
> +
> +TERMINATION
> +This license becomes null and void if any of the above conditions are
> +not met.
> +
> +DISCLAIMER
> +THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> +EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
> +MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
> +OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
> +COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> +INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
> +DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
> +OTHER DEALINGS IN THE FONT SOFTWARE.
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.=
bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
> new file mode 100644
> index 0000000..37c4120
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
> @@ -0,0 +1,26 @@
> +require ttf.inc
> +
> +DESCRIPTION =3D "Inconsolata font - TTF Version"
> +HOMEPAGE =3D "http://www.levien.com/type/myfonts/inconsolata.html"
> +LICENSE =3D "SIL Open Font License"
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://levien.com/type/myfonts/Inconsolata.otf \
> +	   file://OFL.txt"
> +
> +S =3D "${WORKDIR}/ttf-inconsolata-${PV}"
> +
> +FILES_${PN} =3D "${datadir}/fonts/truetype/Inconsolata.ttf \
> +	       ${datadir}/doc/ttf-inconsolata/*"
> +
> +do_configure() {
> +	mv ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
> +}
> +
> +do_install_append() {
> +	install -d ${D}${datadir}/doc/ttf-inconsolata/
> +	install -m 0644 ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/
> +}
> +
> +SRC_URI[md5sum] =3D "0fbe014c1f0fb5e3c71140ff0dc63edf"
> +SRC_URI[sha256sum] =3D "1561e616c414a1b82d6e6dfbd18e5726fd65028913ade191=
e5fa38b6ec375a1a"
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

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFj7UwACgkQN1Ujt2V2gBxb0ACfX96UGaeQFgo+poF1DPgn0/ET
XaEAn0qbp3O2YyftRQob4V5J0KfRuxxy
=18oh
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
