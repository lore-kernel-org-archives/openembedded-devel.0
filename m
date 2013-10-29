Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 626846CE77
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 08:26:01 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e53so475628eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C3JJcKnG/I60hI5/T8EdKdivto4HQQdGx5luQEyFzD0=;
	b=Nsf+UFrzCMzZVawteOb1au8P80yo5dl8me0yS6gMOd9se+oHqU8CiRvdG1jM+OPSqd
	lOzhNXaIXLg7YKLEomJ0j40kBOuJTAv+LVTBdpxbyK8D7uqsKDsetL9txuwYFrwnJ5RN
	HcTt/SjfOaW+ITI8NkRBWChvNoU31RMoeKqHHuogj7hnJzZGxCQXQYrcRXJzfXjJPN3o
	S/va+3XPgCT3fIrnfYXThHFES0anrB0+addnx7FxfKrjE7nMMH7eUFAqOVaw3zmM2/o9
	D7kl2vObRQ+eE/kJYH0jFwjiyChSrTGCoYBcaQguRPwTcnki2R8z3DLG9roq7Xvi+44l
	2yOw==
X-Received: by 10.14.95.69 with SMTP id o45mr1560639eef.107.1383035162630;
	Tue, 29 Oct 2013 01:26:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	x47sm67329814eea.16.2013.10.29.01.26.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 01:26:01 -0700 (PDT)
Date: Tue, 29 Oct 2013 08:26:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131029072614.GC3697@jama>
References: <1383001576-26578-1-git-send-email-schnitzeltony@googlemail.com>
	<20131029070736.GA3697@jama>
	<CALbNGRT7oocf2dD1UCjQdea1GNWo_s8SWcre1bELeTz0DguJVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRT7oocf2dD1UCjQdea1GNWo_s8SWcre1bELeTz0DguJVg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][RFC] qtbase: fix build for gles2 enabled by PACKAGECONFIG
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
X-List-Received-Date: Tue, 29 Oct 2013 08:26:01 -0000
X-Groupsio-MsgNum: 46914
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2013 at 09:14:09AM +0100, Andreas M=FCller wrote:
> On Tue, Oct 29, 2013 at 8:07 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Tue, Oct 29, 2013 at 12:06:15AM +0100, Andreas M=FCller wrote:
> >> While playing around with QtQuick I needed gles2 support. Doing so I f=
aced tons
> >> of error messages as mentionet in patch. It is caused by include chain:
> >>
> >> EGL/egl.h -> EGL/eglplatform.h -> X11/Xlib.h -> X.h
> >>
> >> In X.h we find definitions like
> >>
> >> #ifndef None
> >> #define None                 0L       /* universal null resource or nu=
ll atom */
> >> #endif
> >>
> >> This causes building Qt to crash when using these kind of symbols.
> >>
> >> The patch was sent as RFC because:
> >>
> >> 1.  I would like ro discuss this at interest@qt-project.org and/or
> >>     development@qt-project.org but it was not possible to subscribe. I=
 sent
> >>     a mail to listmaster but no response either.
> >> 2.  qtbase_git might need same (and fails with the patch)
> >> 3.  This is not a proper solution: It is fragile and will return for f=
uture
> >>     changes. Proper soultion would be renaming the symbols Qt but I ca=
nnot
> >>     discuss due to 1.
> >> 4.  Nobody reported a build error for meta-qt5 so far.
> >
> > We had similar problem, but fixed gles2 provider instead, in our case we
> > were using libhybris and the fix was to prevent loading X11 headers when
> > we want to use just gles2 from it.
> >
> > Similar changes were added to mesa lately, can you do the same with
> > gles2 provider on your platform?
> It is the egl part causing trouble and the headers we use are the
> latest from khronos. I don't understand what the workaround exactly
> looks like - could you provide further hints?

Something like this:
https://github.com/stskeeps/libhybris/commit/6b2815973f98601e39d916a8f53a4f=
6acb76b22b

or directly in mesa:
http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/=
mesa/mesa?h=3Ddylan&id=3De4f5a568ec8df772f2b8c07f2ac946b2e9247ccd
or newer versions:
http://cgit.freedesktop.org/mesa/mesa/commit/?id=3D1a7275de9a0088cedab17131=
eec82bd2cada26c3

> >
> > I must admit that I haven't read the patch yet and haven't finished
> > morning coffee :).
> >
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJvYxYACgkQN1Ujt2V2gBztiwCglT0zYPWtjggVncroGYRlsCDX
8QsAnjbWtLE9jpBUM7sATH22gTvqzmvm
=/ZYl
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
