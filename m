Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T4U0O-0005aa-HT
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2012 11:47:12 +0200
Received: by wibhn17 with SMTP id hn17so527556wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1GXArB0mBy07o6/UtHTEMm4tRzLTc7EdaRdUULWErqw=;
	b=hH9xDqG4CiNu8DSEOdtl0Mdq7nkOzjWEBIRutM49qa8tbI4nT1M2YLmEa4px4YTTN0
	4YL5PlS9i7fQhpt8aB29UewtAcIIZYlcEugdd5roS8r9FIsoUPHVcGumDoGmCZDtWE1J
	hqHETnOpTYwbTC3nGTNyuBq1aPtkvgVduHVlL0n9J4h/CDZBJ4M3wC1nTzfrzyb1Kbge
	vRgspZFeTL8VgnmiQ31o3tifFJtblQY+6FopDGBsU1jB4dUmJL1wrc80R/CF0yQVC4Fj
	zTcNUzwLBZdDsSxp+mQV4jvcp9nlgP01kATQiryNU7I5Hq3QdBtUvox4ECrR1LJnssbL
	Mg2w==
Received: by 10.180.81.38 with SMTP id w6mr2544014wix.10.1345714506427;
	Thu, 23 Aug 2012 02:35:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r9sm10133347wia.2.2012.08.23.02.35.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 02:35:05 -0700 (PDT)
Date: Thu, 23 Aug 2012 11:35:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120823093511.GM3029@jama.jama.net>
References: <CALbNGRTC=AL5g+CPvHQzVijDf9AJj3dHmxs7H7MeY4y5VygYKQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTC=AL5g+CPvHQzVijDf9AJj3dHmxs7H7MeY4y5VygYKQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gnome.bbclass
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
X-List-Received-Date: Thu, 23 Aug 2012 09:47:12 -0000
X-Groupsio-MsgNum: 40331
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lRF4gxo9Z9M++D0O"
Content-Disposition: inline

--lRF4gxo9Z9M++D0O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2012 at 11:22:03AM +0200, Andreas M=FCller wrote:
> Hi,
>=20
> we have gnome.bbclass in oe-core and meta-oe. The only difference I
> see is meta-oe extends
>=20
> BBCLASSEXTEND +=3D "native"
>=20
> Could somebody help me why we need to build all gnome recipes native?

git log says it was because of 'hicolor-icon-theme-native' and 'gnome-commo=
n-native'

If it's not needed anymore, then it would be nice to drop meta-oe gnome.bbc=
lass now.

Cheers,

commit aac01cbce74cef20283752c16d70043ca6d2e483
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sat Dec 4 18:17:26 2010 +0100

    meta-openembedded: add BBCLASSEXTEND =3D native to gnome.bbclass

    This fixes the missing 'hicolor-icon-theme-native' and 'gnome-common-na=
tive' deps

    Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

diff --git a/classes/gnome.bbclass b/classes/gnome.bbclass
index 7bc5d9c..0a32a77 100644
--- a/classes/gnome.bbclass
+++ b/classes/gnome.bbclass
@@ -1,4 +1,4 @@
 inherit gnomebase gtk-icon-cache gconf mime

 EXTRA_OECONF +=3D "--enable-introspection=3Dno"
-
+BBCLASSEXTEND +=3D "native"

>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lRF4gxo9Z9M++D0O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA1+U8ACgkQN1Ujt2V2gBwxXgCbBFuiVSziFNvGeSpXH2pwqBWp
5W8Anjj1nKlr8XGm9hXSCa3hugJc6ZG8
=Ypfd
-----END PGP SIGNATURE-----

--lRF4gxo9Z9M++D0O--
