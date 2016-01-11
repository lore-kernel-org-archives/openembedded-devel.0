Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id E659F731C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 20:43:25 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id uo6so309917243pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 12:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=UQD19es9Zl39zq7uSrCrg4csnXZ6g3pzu6Tu0XB9xVc=;
	b=TUsqwLrAzxjvu6+XNWMsjg1f+z7WyXXsFAUXHv91FDvjxiBfMssIY/z1ZWsAEaRIWK
	WDy9x+fS+IvShVrhEcQznjn0vjpSpaQ5umghE3OZ8r44uDdEunCh37Q4j0UVM1a+j5e9
	a+JahmTn0s+ZOXf2QWMVy9711i4BN1+vDDjJXVgdHpOaP6GEFwYq6OLStlHlNyHQxK1c
	fCNNZPQconYo9grlonok81AZ5aCFkAw8ZKmu9AO4zCkgy7C3f4v/oWNNdUso57cj1xfz
	89PD8wzuKeoETCXfkAPtLf3Sp+F+yEwmcdRarHtQ3no7Y0AAWzYm4KYcu5yOygVdZp56
	G3pg==
X-Received: by 10.66.193.36 with SMTP id hl4mr183517449pac.153.1452545005892; 
	Mon, 11 Jan 2016 12:43:25 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	b28sm25210703pfd.24.2016.01.11.12.43.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 12:43:25 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1451901856-5089-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 11 Jan 2016 12:43:21 -0800
Message-Id: <3AC232C3-65B9-45D8-8E3B-00D1BBE261BE@gmail.com>
References: <1451901856-5089-1-git-send-email-schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [PATCH][meta-qt5][master/jethro] qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix segfault on armv7
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
X-List-Received-Date: Mon, 11 Jan 2016 20:43:27 -0000
X-Groupsio-MsgNum: 59470
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D5F4DD22-003D-4BB8-9F39-4CAB758ADACC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D5F4DD22-003D-4BB8-9F39-4CAB758ADACC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 4, 2016, at 2:04 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> We have a simple application containing a QWebView which segfaulted =
during
> loading a page on a CortexA9 (armv7 thumb2). After enabling debug =
information
> for qtwebkit and remote debug session the point of segfault was =
detected in
>=20
> Source/JavaScriptCore/llint/LowLevelInterpreter.asm:1082
>  callSlowPath(_llint_slow_path_new_func_exp)


yes llint has issues with arm mode on armv7
>=20
> Further digging around lead to similar source in:
>=20
> * qtwebkit: Source/JavaScriptCore/assembler/ARMv7Assembler.h
> * qtscript: =
src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMv7Assembler.h
>=20
> In these files a class ARMThumbImmediate is declared and used in many =
places.
> This lead me to the suspicion that compiligng for armv7 expects thumb =
support.
>=20
> The following tests were performed:
>=20
> * our application is working fine again
> * qtscript and qtwebkit were build with
>  'ARM_INSTRUCTION_SET =3D "thumb"' =3D> TUNE_FEATURES =3D "arm armv5 =
thumb dsp"
>  for qemuarm without issues
>=20
> This is a partial/rebased revert of:
> commit 932b32c1c9e9a3ac833c82ff9273683345056ec7
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Wed Apr 22 15:33:01 2015 +0200
>=20
>    qtscript,qtwebking: disable thumb
>=20
>    * qemuarm builds fail when thumb is enabled
>=20
>    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
> recipes-qt/qt5/qtscript_git.bb | 3 ++-
> recipes-qt/qt5/qtwebkit_git.bb | 3 ++-
> 2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtscript_git.bb =
b/recipes-qt/qt5/qtscript_git.bb
> index c6dca51..c53217a 100644
> --- a/recipes-qt/qt5/qtscript_git.bb
> +++ b/recipes-qt/qt5/qtscript_git.bb
> @@ -22,7 +22,8 @@ LIC_FILES_CHKSUM =3D " \
> #{standard input}:23: Error: selected processor does not support Thumb =
mode `stmdb sp!,{r4-r8,lr}'
> #{standard input}:30: Error: lo register required -- `ldmia =
sp!,{r4-r8,lr}'
> #{standard input}:43: Error: lo register required -- `ldmia =
sp!,{r4-r8,lr}'
> -ARM_INSTRUCTION_SET =3D "arm"
> +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> +ARM_INSTRUCTION_SET_armv5 =3D "arm"
>=20
> DEPENDS +=3D "qtbase"
>=20
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb =
b/recipes-qt/qt5/qtwebkit_git.bb
> index 862abd2..a952306 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -15,7 +15,8 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-native =
sqlite3 glib-2.0 libxslt"
> # | {standard input}: Assembler messages:
> # | {standard input}:106: Error: invalid immediate: 983040 is out of =
range
> # | {standard input}:106: Error: value of 983040 too large for field =
of 2 bytes at 146
> -ARM_INSTRUCTION_SET =3D "arm"
> +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> +ARM_INSTRUCTION_SET_armv5 =3D "arm"
>=20
> SRC_URI +=3D "\
>     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
> --
> 2.5.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_D5F4DD22-003D-4BB8-9F39-4CAB758ADACC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUE+wACgkQuwUzVZGdMxSTiACdEeO9e+qb4ZVv0UmyzkXgJlU7
FHwAn0c5BcX8EXKUGE9XRY30DBvKLM1l
=9LdO
-----END PGP SIGNATURE-----

--Apple-Mail=_D5F4DD22-003D-4BB8-9F39-4CAB758ADACC--
