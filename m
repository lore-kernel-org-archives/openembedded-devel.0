Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3614572165
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 09:52:34 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so11434153wiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 01:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b6ShBgbYGUDBRzdSI4bcvUO/osJNOWxcUj6CMXFvijk=;
	b=S8b/Jatg+0Oq2+KUY7wUz6ELUhp9+DJAlvjeY9HgWhsR8gJfE7wdZsoAdoP9QIEm8A
	9NYvbbGXijcp+BiNGY4Y9/UKY42vGA/sw8p9JlMTtJMDLTO9NF02LqP3B4/Z8bBH77c4
	JybLAMIKYPALVvnAIASB4+262CJuQjGxIWDskEQUuQznm+NXME+wyk4ZbmPagaV7uB3F
	HknAenB+i98v6bFVPar25SSU2VoViXBHTGEeE3Ko92AcEON0+aBOD/X8VEPr3+4mG9Uo
	790MEKIajkZrjPEDHRnlksvTal4wT/5FvcCup/jjpk1MdPkG+a/4FhcVzT4nveitkezm
	rxOw==
X-Received: by 10.180.24.193 with SMTP id w1mr3482477wif.34.1416563550066;
	Fri, 21 Nov 2014 01:52:30 -0800 (PST)
Received: from localhost ([89.176.104.3])
	by mx.google.com with ESMTPSA id w10sm7343673wje.10.2014.11.21.01.52.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 01:52:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 10:52:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141121095230.GA2163@jama>
References: <20141119154912.GP3315@jama>
	<1416556558-15428-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1416556558-15428-3-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416556558-15428-3-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2 2/2] Indent: Add new recipe
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
X-List-Received-Date: Fri, 21 Nov 2014 09:52:36 -0000
X-Groupsio-MsgNum: 52965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2014 at 03:55:58PM +0800, Qian Lei wrote:
> Indent is a GNU program for beautifying C code, so that it is easier
> to read. Indent can also convert from one C writing style to a different
> one. Indent understands correct C syntax and tries to handle incorrect C
> syntax.
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/indent/indent_2.2.10.bb | 22 ++++++++++++++++++=
++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/indent/indent_2.2.10.bb
>=20
> diff --git a/meta-oe/recipes-extended/indent/indent_2.2.10.bb b/meta-oe/r=
ecipes-extended/indent/indent_2.2.10.bb
> new file mode 100644
> index 0000000..df40cc0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/indent/indent_2.2.10.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "A GNU program for formatting C code"
> +HOMEPAGE =3D "http://www.gnu.org/software/indent/"
> +SECTION =3D "Applications/Text"
> +DESCRIPTION =3D "Indent is a GNU program for beautifying C code, so that=
 \
> +it is easier to read. Indent can also convert from one C writing style \
> +to a different one. Indent understands correct C syntax and tries to han=
dle \
> +incorrect C syntax. \
> +Install the indent package if you are developing applications in C and \
> +you want a program to format your code."
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +DEPENDS =3D "virtual/gettext"
> +
> +SRC_URI =3D "${GNU_MIRROR}/indent/${BP}.tar.gz"

indent -> BPN

> +SRC_URI[md5sum] =3D "be35ea62705733859fbf8caf816d8959"
> +SRC_URI[sha256sum] =3D "8a9b41be5bfcab5d8c1be74204b10ae78789fc3deabea077=
5fdced8677292639"
> +
> +inherit autotools gettext
> +
> +FILES_${PN} +=3D "/usr/doc/indent/indent.html"

shouldn't this be installed in /usr/share/doc ($docdir)?

and should it be included in $PN or $PN-doc?

Also move this change before umip which is using it.

> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvC14ACgkQN1Ujt2V2gBwIqACfc9VQaeRzuP8lnrjNiarTS54w
WJwAnAhVUGV8U0NVOUFKBNdglu3NyGht
=6nDx
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
