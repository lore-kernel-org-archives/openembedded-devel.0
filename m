Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 55DC960556
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 14:47:42 +0000 (UTC)
Received: by wesw62 with SMTP id w62so151537wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 06:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ILdJv3NsnmKqL2Uh1FdVtommrFxbqUqEyVec2e3CLlU=;
	b=d9g5QnqGEBuMCeA9l9ycWY39gEmInuq2id4jwuylnaSPBytt0QDLkv/zRgk8faI9me
	TSB/ZaS+WAeOtKtap5zbnlGjXDQrkrsZHYCx7eyRWAngzbhhYWO4/BXwoJkIOHVx6Kcu
	KzMODQXYKhmO/mWo0S5VFQGXiUbeMHBm1EgVoPiUB04DGwdGnJyRloVjDxyqcobblLOM
	D2HJbyRjvs8NJesvFftXn0fgwFVHv4BnajnyCNRRAgVBveC/+eFHLVbz3vLTCeoV1825
	3o0BV0dK6C41RW0cmAdXiFHFWeVG7sTwiJv3+XaXxvK1Qm34jNzuapQ0p814Ng3YUDFB
	TMlw==
X-Received: by 10.194.176.33 with SMTP id cf1mr9375158wjc.19.1424357263722;
	Thu, 19 Feb 2015 06:47:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lu13sm34516108wic.10.2015.02.19.06.47.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 06:47:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Feb 2015 15:47:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150219144746.GB2311@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-2-git-send-email-schnitzeltony@googlemail.com>
	<20150218160919.GB2276@jama>
	<CALbNGRSSk=gNtvn=nwkLqO=BwPF7+WmL6hpQFdvSRXn5u_kJoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSSk=gNtvn=nwkLqO=BwPF7+WmL6hpQFdvSRXn5u_kJoA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 1/5] qtbase: remove patches required for native(-sdk) only
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
X-List-Received-Date: Thu, 19 Feb 2015 14:47:44 -0000
X-Groupsio-MsgNum: 54401
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 06:35:33PM +0100, Andreas M=FCller wrote:
> On Wed, Feb 18, 2015 at 5:09 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Tue, Jan 27, 2015 at 06:53:49AM +0100, Andreas M=FCller wrote:
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >
> > Are you sure these are useful only for native(sdk) only?
> >
> > FYI: I'm updating your patches for latest revision in 5.4 branch, I'll
> > update them together with 5.4.1 recipes (when 5.4.1 is released).
> >
> > Regards,
> >
> >> ---
> >>  recipes-qt/qt5/qtbase.inc    | 2 --
> >>  recipes-qt/qt5/qtbase_git.bb | 2 --
> >>  2 files changed, 4 deletions(-)
> >>
> >> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> >> index 5b2c08c..a8748ef 100644
> >> --- a/recipes-qt/qt5/qtbase.inc
> >> +++ b/recipes-qt/qt5/qtbase.inc
> >> @@ -5,8 +5,6 @@ SRC_URI +=3D "\
> >>      file://0001-Add-linux-oe-g-platform.patch \
> >>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.=
patch \
> >>      file://0003-Add-external-hostbindir-option.patch \
> >> -    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.=
patch \
> >> -    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patc=
h \
> >>      file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.pa=
tch \
> >>      file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..=
patch \
> >>      file://0008-configure-bump-path-length-from-256-to-512-character.=
patch \
> >> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.=
bb
> >> index f67ea16..611e19a 100644
> >> --- a/recipes-qt/qt5/qtbase_git.bb
> >> +++ b/recipes-qt/qt5/qtbase_git.bb
> >> @@ -10,8 +10,6 @@ SRC_URI +=3D "\
> >>      file://0001-Add-linux-oe-g-platform.patch \
> >>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.=
patch \
> >>      file://0003-Add-external-hostbindir-option.patch \
> >> -    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.=
patch \
> >> -    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patc=
h \
> >>      file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.pa=
tch \
> >>      file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..=
patch \
> >>      file://0008-configure-bump-path-length-from-256-to-512-character.=
patch \
> >> --
> >> 1.8.3.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> First of all thanks for doing this: I have these patches on my TODO
> but have other issues of higher priorities (ask my boss) to fix.

In the end the fix was simple..
0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
wasn't refreshed in qtbase-git directory, now it builds fine, I'll push
it to master soon.

> Answering your question frankly: No I am not 100% sure these patches
> can be removed from target build..
>=20
> * 0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch: If
> I don't go wrong here configureapp is the windows-replacement for
> configure script -> this patch is not needed AT ALL (except we build
> for windows which we usually don't).

Ah right, it was looking a bit different at 5.0.0 version and now after
many rebases it really looks useless, will drop with 5.4.1 (and now in
git recipe).

> * 0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch:
> Intention here was to keep target sysroot clean of host paths - as
> this patch was part qt-creator series. Raphael Philipe reported
> failures for -L/usr/lib when building qt5-creator I'd suggest to keep
> this patch in.

OK, thanks.

I've refreshed b5.4-shared b5.4-native b5.4-nativesdk b5.4-target
branches at https://github.com/meta-qt5/qtbase this will be used to
refresh patches for 5.4.1 recipes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTl95IACgkQN1Ujt2V2gBw6pgCgijFZuffoiUNCN8z8PqhKvdi8
ET0An0MNPq1UiLrF9SFQ3MCh4GtV6PAF
=YgBg
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
