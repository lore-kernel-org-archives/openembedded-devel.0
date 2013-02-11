Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U52Hf-00084m-2X
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 23:55:43 +0100
Received: by mail-da0-f51.google.com with SMTP id n15so2904856dad.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 14:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bY96DVaXmfQOx8MqBSmZD620A96WOV0SO55F6+Kayks=;
	b=deVUz+crF5tOkq+zoM6GhnMLrgJIW82baJJIZOyYNRP9VVMNzFOQZDeAcNBux2NXG4
	SN1rv6CwqRicIzANMHOBiaqtbzewYSBz9D2ycNZci/cubi7Nrf94ZjO4zE9OO4b7zTj+
	eMXbR8iMiHqWcyFeAhFjc/hwoYjZni9Of0MKab1vADsc/WHEZa71nDaEPtx0xwj/K9Z/
	2ML1zaCN4IOzCbSAC2JJPIod9+SZ3MLUaTu3YjWFuWFbzid6T0gz902l5HYGfHKykHOV
	13qOmu7PuyoqBlT7WpynQFzsZsZ7uctN0/36QuzCK8H+Y0gIWkdzOLYsmKO77JfwwiZv
	LAVw==
X-Received: by 10.66.79.135 with SMTP id j7mr45584382pax.0.1360622375456;
	Mon, 11 Feb 2013 14:39:35 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d8sm69725361pax.23.2013.02.11.14.39.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 14:39:34 -0800 (PST)
Date: Mon, 11 Feb 2013 23:39:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130211223928.GC3300@jama>
References: <1360622110-15419-1-git-send-email-schnitzeltony@googlemail.com>
	<1360622110-15419-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1360622110-15419-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: =?UTF-8?B?UmU6IFttZXRhLW9lIDIvM10gdXBkYXRlLWZvbnRzLmJiY2xhc3M6IHJlbW92ZSAtIHdlIG5vdyB1c2Ugb2UtY29yZSdzIGZvbnRjYWNoZS5iYmNsYXNzIFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8c2Nobml0emVsdG9ueUBnb29nbGVtYWlsLmNvbT4=?=
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
X-List-Received-Date: Mon, 11 Feb 2013 22:55:43 -0000
X-Groupsio-MsgNum: 43106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please add newline before SOB line, otherwise looks good.

On Mon, Feb 11, 2013 at 11:35:09PM +0100, Andreas M=FCller wrote:
> ---
>  meta-oe/classes/update-fonts.bbclass |   40 ----------------------------=
------
>  1 files changed, 0 insertions(+), 40 deletions(-)
>  delete mode 100644 meta-oe/classes/update-fonts.bbclass
>=20
> diff --git a/meta-oe/classes/update-fonts.bbclass b/meta-oe/classes/updat=
e-fonts.bbclass
> deleted file mode 100644
> index db2e814..0000000
> --- a/meta-oe/classes/update-fonts.bbclass
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -
> -update_fonts_postinst() {
> -    if [ -z "$D" ]; then
> -        update-fonts
> -    fi
> -}
> -
> -# the same but keep it separate for now
> -update_fonts_postrm() {
> -    if [ -z "$D" ]; then
> -        update-fonts
> -    fi
> -}
> -
> -python populate_packages_append () {
> -    update_fonts_pkgs =3D d.getVar('UPDATE_FONTS_PACKAGES', True).split()
> -
> -    for pkg in update_fonts_pkgs:
> -        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar=
('pkg_postinst', True)
> -        if not postinst:
> -            postinst =3D '#!/bin/sh\n'
> -        postinst +=3D d.getVar('update_fonts_postinst', True)
> -        d.setVar('pkg_postinst_%s' % pkg, postinst)
> -
> -        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pk=
g_postrm', True)
> -        if not postrm:
> -            postrm =3D '#!/bin/sh\n'
> -        postrm +=3D d.getVar('update_fonts_postrm', True)
> -        d.setVar('pkg_postrm_%s' % pkg, postrm)
> -
> -        d.appendVar('RDEPENDS_%s' % pkg, ' font-update-common')
> -}
> -
> -python __anonymous() {
> -    if not bb.data.inherits_class('native', d) and not bb.data.inherits_=
class('cross', d):
> -        updatefonts_check =3D d.getVar('UPDATE_FONTS_PACKAGES')
> -        if not updatefonts_check:
> -            bb_filename =3D d.getVar('FILE')
> -            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits update-=
fonts but doesn't set UPDATE_FONTS_PACKAGES" % bb_filename
> -}
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEZcyAACgkQN1Ujt2V2gByCNwCZAaSRhHuBT+bzMwNIdthpVa0F
E3gAnRwOrKd2B4KtvZlKzxsaCpvL8Bbs
=N9Y3
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
