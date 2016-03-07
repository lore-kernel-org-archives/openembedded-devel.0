Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 86C186FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 12:10:57 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so105543870wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 04:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YfzCms5UjrlO8PI6Qdb35uYdul1NCynYHBOLdosVbn8=;
	b=kMEvsSgXNCKmMnZvH77Ojx+szbq3UhXPy9OWS1Fs9HkW7YGKyISY9lFV0ibShqroiR
	nmcfh/PETjDZdg5Nzitj+5Bz/vVXSMF1TKoZbsAeuVWpdqtqwe4Y7MfaWzcBLVzNfy7f
	ykwTI5GsKayLe7+8WUVzmZSBL5lSkNgTOanrxmQQ6bkboz0a5vLEDTZepenmmaXv6Q1h
	lQEruvUAjRvd0n6H9Aqjwi/9jQIaiy+KQwXv1Wqn9W+HYOLFz1dfuKud3Z53QB0R+bzO
	d80iMwde+LD9O+RGY05R9/UJ8TvIRM9VHn+mC+O+f6lX0s9InR3HoGRz68qdpGZ/nP8m
	dB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YfzCms5UjrlO8PI6Qdb35uYdul1NCynYHBOLdosVbn8=;
	b=aimNLwe5sMni0ip1Pj+zfBIPwBw7V0MPoNaUGpPMqL87PMTStd4/zPeXAK33PsSC/t
	m9zI4aBEbHr8IVdR3luV7fLOBOY4krXE3By0lvJzA46MmZaHj1f7wTk+ZcXVrdWdpVDA
	m3KMkGv/rFvWD+3Lq18ehNNY9uXieJ1X8a5f42wQbKycDLl8dItOxd6PpmyuPGrVTjQr
	dLR05hMwpNGpA1pMY60YMlTip4M5LivigI08dlQ3yLeSyxsMEP0tNAoTtQSDLwUdh5wt
	O8/6jZyrId/7DOTBS57UCR7fbueDJou2s1jNSJUjGbNTEho6kQH8SiFLsf6Kt+FTpvKi
	s5vg==
X-Gm-Message-State: AD7BkJI7nSjNSjKRbSwB6KPgyLLIW32J3pwdhnFe45wmWabrjGJqgUlEhSnSpMPN49q6bQ==
X-Received: by 10.194.90.137 with SMTP id bw9mr22211842wjb.120.1457352657382; 
	Mon, 07 Mar 2016 04:10:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r62sm13455785wmd.15.2016.03.07.04.10.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Mar 2016 04:10:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 7 Mar 2016 13:13:24 +0100
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20160307121324.GE2549@jama>
References: <1456995129-777-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1456995129-777-1-git-send-email-alexandre.belloni@free-electrons.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][master][jethro][PATCH] qtquick1: fix qtwebkit support
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
X-List-Received-Date: Mon, 07 Mar 2016 12:10:57 -0000
X-Groupsio-MsgNum: 60364
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Content-Disposition: inline

--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2016 at 09:52:09AM +0100, Alexandre Belloni wrote:
> 40b7a93a3c6cf05136c606824c1cea848b75bcb6 ("qtquick1: allow to disable
> qtwebkit support") allowed to disable qtwebkit but actually disabled it in
> every cases.
>=20
> Use the same mechanism as qttools to implement the feature.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  recipes-qt/qt5/qtquick1_git.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git=
=2Ebb
> index e0a264d4fa2d..cb5e395b9d67 100644
> --- a/recipes-qt/qt5/qtquick1_git.bb
> +++ b/recipes-qt/qt5/qtquick1_git.bb
> @@ -16,11 +16,13 @@ LIC_FILES_CHKSUM =3D " \
>  DEPENDS +=3D "qtscript qtsvg qtxmlpatterns"
>  # qttools
> =20
> -PACKAGECONFIG ??=3D "webkit"
> -PACKAGECONFIG[webkit] =3D "CONFIG+=3Denable-webkit,CONFIG-=3Denable-webk=
it,qtwebkit"
> +PACKAGECONFIG ??=3D "qtwebkit"
> +PACKAGECONFIG[qtwebkit] =3D ",,qtwebkit"

Is there reason for renaming the packageconfig option?

Where did you see this issue? Weren't you testing master-next with:
http://patchwork.openembedded.org/patch/116717/
without corresponding oe-core change?

> +
> +EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtwebkit', =
'', 'CONFIG+=3Dnoqtwebkit', d)}"
> =20
>  do_configure_prepend() {
> -    sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(w=
ebkitwidgets):#g' ${S}/src/imports/imports.pro
> +    sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):=
!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
>  }
> =20
>  SRCREV =3D "87f2415adf34da08e6cd58f5da6f6a7d0d9cf141"
> --=20
> 2.7.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbdcGMACgkQN1Ujt2V2gBx9TACgkVRzDuoJQuz+xxzJddecHjR0
1qQAoKO8Pn0QzPpobaMd/njW+GAUkYW+
=KFOg
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--
