Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5D75960851
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 09:38:54 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l126so139066394wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 01:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=++xBtIpxsG/aTrwK9UepoVvqXpf/lOTnHNPzGzapVrw=;
	b=clyNS7pABux0M4l3K+z2K75U8pxWp6q/+f1JBcTidAh8As93LB7hwBziXqYBm+hnT/
	U9a1oyXt3QHJ/lKBzBlh2+4vo2vn4pIjT4MQXG7ytIRYMcJELY77jm2zOkvlDyPAm2bR
	Sv04071giIf32Ez1D0YmlqJkJ5YS7miPYUeCfYn4lsCHrPR1pncr+Aoyf1SvItN0XonR
	rm6W7fC7e+tvOyx+W4tdJ0/PSnw05JfQelNQYLuoKv3m77AZQFSNV2WEoDnScCEOpRde
	gLBqCtSQj1U0ex/u6u7+emqCbRkcbrBqdRALY+nMRPQS0pVIvpQOmcMvexSnAaQpj0QO
	cUuw==
X-Received: by 10.28.32.150 with SMTP id g144mr31008720wmg.92.1450863534397;
	Wed, 23 Dec 2015 01:38:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z137sm2242291wmc.8.2015.12.23.01.38.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Dec 2015 01:38:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Dec 2015 10:42:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151223094204.GA2569@jama>
References: <CALbNGRQzE+zG0GOPStWAjP6VMZr0YznhVfSD+X0b9CyzS=cKYA@mail.gmail.com>
	<CALbNGRSgYj_m2_uxFO4VEAND5Ru6aXLJgHkmKRmuC73Ys9YocA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSgYj_m2_uxFO4VEAND5Ru6aXLJgHkmKRmuC73Ys9YocA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5] qtscript, qtwebking: disable thumb issues on armv7
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
X-List-Received-Date: Wed, 23 Dec 2015 09:38:56 -0000
X-Groupsio-MsgNum: 59151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 10:13:45AM +0100, Andreas M=FCller wrote:
> On Wed, Dec 23, 2015 at 9:19 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > Hi
> >
> > The story occured on jethro but I think it is the same for master:
> On master fix for qtwebkit won't be necessary - qtwebkit will go away [1]
>=20
> [1] http://blog.qt.io/blog/2015/12/18/qt-5-6-beta-released/

True, but there are some attempts to keep 5.5* qtwebkit compatible with
latest 5.6:
http://lists.qt-project.org/pipermail/releasing/2015-December/002026.html

so I wouldn't hope for qtwebkit recipe removal soon.

>=20
> Andreas
> >
> > We have a simple application containing a QWebView which segfaulted
> > during loading a page on a CortexA9 (armv7 thumb2). After enabling
> > debug information for qtwebkit and remote debug session the point of
> > segfault was detected in
> >
> > qtwebkit: Source/JavaScriptCore/llint/LowLevelInterpreter.asm:1082
> >    callSlowPath(_llint_slow_path_new_func_exp)
> >
> > Further digging around lead to similar source in:
> >
> > * qtwebkit: Source/JavaScriptCore/assembler/ARMv7Assembler.h
> > * qtscript: src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMv7A=
ssembler.h
> >
> > In these files a class ARMThumbImmediate is declared and used in many
> > places. This lead me to the assumption that compiling for armv7
> > expects thumb support.
> >
> > So I removed the
> >
> > ARM_INSTRUCTION_SET =3D "arm"

You build it in distro with ARM_INSTRUCTION_SET set to "thumb", right?
Because the default is still "arm" so this issue you're describing is
still valid in default DISTRO-less builds.

> > and our application worked fine. To be a good boy I then build tested
> > with ARM_INSTRUCTION_SET =3D "thumb" and for qemuarm: It still fails.
> >
> > So what would the right way to go? Something like the pending patch
> > for icu replacing
> >
> > ARM_INSTRUCTION_SET =3D "arm"
> >
> > by
> >
> > ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > ARM_INSTRUCTION_SET_armv5 =3D "arm"

This is OK with me, there was even a plan to use .inc file for all of
these overrides which will be included only for thumb1 tunes.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717

but because I didn't get an answer about putting recipes from other
layers to this .inc file I've added them directly to affected recipes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ6bGsACgkQN1Ujt2V2gBwfxgCggz8Ks9otJf2uEMpZggQIeHkY
d1UAn30ei8pgnN93+ObkpF8GzySpJPQy
=BuYB
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
