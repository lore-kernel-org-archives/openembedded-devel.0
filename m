Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4E66011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 17:33:57 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id f206so15334432wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 09:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GpbD0DO3z1o4GMu+eqE7rbuYogVflyt7cWdmO9uwbys=;
	b=NWHg+ZGMwjc8UasywyVZFla91Mcqe2gCupC4BPYkGc88JkRuRNjzjdOhPLd5hPiGQD
	2xsFNOfRpSv0/GP7wq/qjkD1TQy10oaupjwKGjHc45/0tHEQKqKR2uXAGhUA88fF3cTy
	qkkdHGvhSIEFjuIF5LZIjISBgqpk3HbJI2AsLySZUdAzqbaxwnl7CdHcRhwsbSBrB4Bi
	ZIEJ9CKFqz+1G/cbIZdF69iDj+dk/MvCxND1t3FibxvapwEoJVelOLGsOwhzDwxR5hMy
	TF4Y0AJB/Cvb50pPUpjzHPMZIE1TJE7uMQhXi/y1B5+4+lRpcLFHptMIUXfJHVx5Wsuy
	3wGQ==
X-Received: by 10.194.205.103 with SMTP id lf7mr58676471wjc.147.1451324037763; 
	Mon, 28 Dec 2015 09:33:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i63sm23808793wmf.24.2015.12.28.09.33.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Dec 2015 09:33:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 28 Dec 2015 18:37:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151228173713.GG2569@jama>
References: <011977994B5AE74ABA2BD08E983BAAABDBE8EAD6@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <011977994B5AE74ABA2BD08E983BAAABDBE8EAD6@ALA-MBB.corp.ad.wrs.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5] qtwebengine link errors agains icu
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Dec 2015 17:33:58 -0000
X-Groupsio-MsgNum: 59203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8XZ+2Hy8Kj8wLPZ"
Content-Disposition: inline

--O8XZ+2Hy8Kj8wLPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2015 at 05:14:48PM +0000, Lerner, Dave wrote:
> On branches jethro and jethro-next I get several link errors building qtw=
ebengine like:
> ...
> qtwebengine/5.5.1+gitAUTOINC+qtwebengine_146ebe26dc-r0/git/src/3rdparty/c=
hromium/ui/gfx/render_text.cc:1186: error: undefined reference to 'icu_52::=
UnicodeString::UnicodeString(unsigned short const*)'
> /ord-dlerner-d81/dlerner/poky_19/qtwebengine-qtqtuick-errors-jethro/tmp/w=
ork/core2-64-poky-linux/qtwebengine/5.5.1+gitAUTOINC+qtwebengine_146ebe26dc=
-r0/git/src/3rdparty/chromium/ui/gfx/render_text.cc:1186: error: undefined =
reference to 'icu_52::StringCharacterIterator::StringCharacterIterator(icu_=
52::UnicodeString const&)'
> ...
>=20
> My local.conf includes
> MACHINE ?=3D "qemux86-64"
> PACKAGECONFIG_pn-qtbase_append =3D " accessibility"
> IMAGE_INSTALL_append +=3D " qtbase qtbase-fonts qtbase-plugins qtwebengin=
e"
> PREFERRED_PROVIDER_jpeg =3D "libjpeg-turbo"
> PREFERRED_PROVIDER_jpeg-native =3D "libjpeg-turbo-native"
>=20
> This bug is referenced upstream in Task-number: QTBUG-49693 and the bug i=
s already fixed in the repo referenced by the meta-qt5 recipe at  git://git=
hub.com/qtproject/qtwebengine.git commit 1847e158e09e24af704b02c8fb30adbf04=
d3befa branch 5.5, 17 commits after the current meta-qt5 qtwebengine_git.bb=
 SRCREV_qtwebengine =3D "ce095e94b6861".  =20
>=20
> The change below corrects the link issue.
>      file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.pat=
ch \
>      file://0002-chromium-third_party-boringssl-Demand-for-newer-POSI.pat=
ch \
>  "
> -SRCREV_qtwebengine =3D "ce095e94b686196629244073990530441b9b5f4f"
> +SRCREV_qtwebengine =3D "1847e158e09e24af704b02c8fb30adbf04d3befa"

Can you please send proper patch with git send-email?

>=20
> Regards,
> Dave
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O8XZ+2Hy8Kj8wLPZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaBc0gACgkQN1Ujt2V2gBz3qACeNBI1pQHiFb92JB3z47RuReEm
lxcAnAs3cUODqPxf6G5+lYT4EWZwlpDS
=fBm8
-----END PGP SIGNATURE-----

--O8XZ+2Hy8Kj8wLPZ--
