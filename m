Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id CF9466080F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:37:54 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p187so143083637wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 02:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/C4Utx5083w0yFcpJvjC9RoWFcto1aGFIGOGAw2h0/M=;
	b=rCT/c87In5P5GIZXOU/KQeiPhWjbDjyBToqyA2E+LBVmUqeQxZTIF3Sqspddv5gAyR
	NIycARxxLd5PidZcZ5y9g1BbrnIQsOtOCkyc4HjzOrYporFUbg9ctwmJSBDefNi0WNnR
	WZpxmuKBWFB9oTyIMYTNJLbUBjLop+p/91rtS2FtXDrmzeznhlckz23vHEq/bT3qCBxe
	CK5RUgZfya5vNaC1hWPlVRbN6E3KB05VaLFVYkpuRceHGc9kwwSao+eEDOspmBBRiZZl
	Ydnbhd4LIRpjFKHynIKoAzV572yj7h3anXQSpoX5268IsNA7Pq0pGho1zoM9hbizcAXs
	YlQg==
X-Received: by 10.194.47.231 with SMTP id g7mr33147506wjn.42.1450867074757;
	Wed, 23 Dec 2015 02:37:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i63sm2895579wmf.24.2015.12.23.02.37.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Dec 2015 02:37:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Dec 2015 11:41:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151223104104.GD2569@jama>
References: <CALbNGRQzE+zG0GOPStWAjP6VMZr0YznhVfSD+X0b9CyzS=cKYA@mail.gmail.com>
	<CALbNGRSgYj_m2_uxFO4VEAND5Ru6aXLJgHkmKRmuC73Ys9YocA@mail.gmail.com>
	<20151223094204.GA2569@jama>
	<CALbNGRRPPHk4FXahtc=sMeKd4mGp+J1wW5aUQnN=dwofgLJK9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRPPHk4FXahtc=sMeKd4mGp+J1wW5aUQnN=dwofgLJK9Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Dec 2015 10:37:55 -0000
X-Groupsio-MsgNum: 59157
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline

--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 10:57:18AM +0100, Andreas M=FCller wrote:
> On Wed, Dec 23, 2015 at 10:42 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Wed, Dec 23, 2015 at 10:13:45AM +0100, Andreas M=FCller wrote:
> >> On Wed, Dec 23, 2015 at 9:19 AM, Andreas M=FCller
> >> <schnitzeltony@googlemail.com> wrote:
> >> > Hi
> >> >
> >> > The story occured on jethro but I think it is the same for master:
> >> On master fix for qtwebkit won't be necessary - qtwebkit will go away =
[1]
> >>
> >> [1] http://blog.qt.io/blog/2015/12/18/qt-5-6-beta-released/
> >
> > True, but there are some attempts to keep 5.5* qtwebkit compatible with
> > latest 5.6:
> > http://lists.qt-project.org/pipermail/releasing/2015-December/002026.ht=
ml
> >
> > so I wouldn't hope for qtwebkit recipe removal soon.
> Yes - also in the blog I linked it was mentioned in the lower area but
> my mail was already out when I read that.
> >
> >>
> >> Andreas
> >> >
> >> > We have a simple application containing a QWebView which segfaulted
> >> > during loading a page on a CortexA9 (armv7 thumb2). After enabling
> >> > debug information for qtwebkit and remote debug session the point of
> >> > segfault was detected in
> >> >
> >> > qtwebkit: Source/JavaScriptCore/llint/LowLevelInterpreter.asm:1082
> >> >    callSlowPath(_llint_slow_path_new_func_exp)
> >> >
> >> > Further digging around lead to similar source in:
> >> >
> >> > * qtwebkit: Source/JavaScriptCore/assembler/ARMv7Assembler.h
> >> > * qtscript: src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARM=
v7Assembler.h
> >> >
> >> > In these files a class ARMThumbImmediate is declared and used in many
> >> > places. This lead me to the assumption that compiling for armv7
> >> > expects thumb support.
> >> >
> >> > So I removed the
> >> >
> >> > ARM_INSTRUCTION_SET =3D "arm"
> >
> > You build it in distro with ARM_INSTRUCTION_SET set to "thumb", right?
> Correct
>=20
> > Because the default is still "arm" so this issue you're describing is
> > still valid in default DISTRO-less builds.
> Ooh yes - so the right way for now (as long as other arm variants
> don't fail) would be something like
>=20
> ARM_INSTRUCTION_SET =3D "arm"
> ARM_INSTRUCTION_SET_armv7 =3D "thumb"
>=20
> If agreed I would send out patches for master and jethro with this.

I'm not sure if I would go that far to set it to "thumb" here, just add
comment (even better with link to upstream bug).

It would be IMHO first case where we force thumb from the recipe.

Also note that there isn't armv7 override only armv7a, armv7m, armv7r,
armv7ve.

>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ6ekAACgkQN1Ujt2V2gBy4egCglk2xoi1JmDRLhgIjRCG7jzqX
hJwAoJ1U/VYZjU0Y1dxp0XZbLQzuBcwy
=/Evc
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
