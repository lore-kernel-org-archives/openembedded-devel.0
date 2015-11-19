Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 918716010D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:08:51 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so24712206wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3GocO2m7FKJZ8R3oFlOhav3Q+0smhtpOHOlaBBPs6x8=;
	b=gBhVvSmwh3fZ1Ku19kJqMHnP+JkgVYVF3sPrFr3G74Rf7cPTESzjyJLkGDyUue8Pjq
	M4BXop1aOT2e1SRdrF/Wwhlt4BNdTpZTp4HcXz+iE0aJUqHqOkb+D8U06/wCRBNbAnmo
	4YzcTzgv1genf1X/yeSYA8XZOzAPYhHgyPXR29wlbLM9cTlM5anRGLuTLaf3fNCWWKS6
	cg1Eb/jBrfcYhek9sCUZ7J1HS461ea3acNL04iXYqmVNceLgvr187w/OhENGnQGk6eBB
	IUdxgm9XvXJo3XckefHVpw/XQLdFCxT6mKMOMvRuLa9WbCm7/2JufDdMW534dlu6hVam
	Qxlg==
X-Received: by 10.28.175.135 with SMTP id y129mr1110591wme.24.1447938531654;
	Thu, 19 Nov 2015 05:08:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c194sm8281173wmd.13.2015.11.19.05.08.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Nov 2015 05:08:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Nov 2015 14:09:12 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20151119130912.GA2241@jama>
References: <1446658209-27822-1-git-send-email-schnitzeltony@googlemail.com>
	<1446658209-27822-2-git-send-email-schnitzeltony@googlemail.com>
	<20151104225422.GB2556@jama>
	<CALbNGRTYEUrOur2hWhUa+WQApav7gagoA0S=Cd+e76Yk_RZA4w@mail.gmail.com>
	<CALbNGRTRM=tkVgGaogRhSvwQsSeA9ZPxA0sxEKprXad9U45pTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTRM=tkVgGaogRhSvwQsSeA9ZPxA0sxEKprXad9U45pTg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: align target qmake paths
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
X-List-Received-Date: Thu, 19 Nov 2015 13:08:51 -0000
X-Groupsio-MsgNum: 58726
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 02:06:07PM +0100, Andreas M=FCller wrote:
> On Thu, Nov 5, 2015 at 12:32 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Wed, Nov 4, 2015 at 11:54 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> On Wed, Nov 04, 2015 at 06:30:09PM +0100, Andreas M=FCller wrote:
> >>> With this we can setup qt-creator to build/debug on target again.
> >>
> >> Can we apply this change to qtbase-native and nativesdk-qtbase as well
> >> or will it break things?
> > Have not tested but I don't expect it to work for our cross/sysroot
> > magic: the patch wipes all host/sysroot paths out of (target) qmake.
> >>
> >> With 5.6 I was finally able to use the same patches for target qtbase
> >> and native(sdk) with only:
> >>     file://0008-Always-build-uic.patch \
> >>     file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
> >> included only for native(sdk) that makes my qtbase branches in
> >> github.com/meta-qt5/qtbase a lot easier to maintain.
> > Understood, happy and fully agreed :)
> >>
> >> If it cannot be changed for all, can we make it conditional, e.g.
> >> [ "$QT_CROSS_COMPILE" =3D "yes" ]
> >> like in new version of:
> >> https://github.com/meta-qt5/qtbase/commit/10283d010d7a66c485cda1e9b1c0=
cf7c41e358b3
> >>
> > Need a look into but this seems to me the path to take: handling
> > conditionals during build is what configure is made for :)
> >
> > As you might guess: I am using qt-creator on target from time to time
> > for building/debugging simple projects or profiling QML - so I am very
> > interested in qt-creator working on target.
> >
> Hey Martin,
>=20
> just saw that you applied this one to jethro-next - please wait with
> applying to jethro. I'll send new versions for master & jethro
> hopefully with same patch content with conditional modification of
> configure and setting linux-g++ as mkspec because linux-oe-g++ on
> target causes trouble.

Don't worry I wasn't planing to merge jethro-next anytime soon, it was
just to store the "jethro" applicable version somewhere until it's
resolved in master, if you send different version for jethro as well
I'll update it there.

But thanks for keeping an eye on me :).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZNyfcACgkQN1Ujt2V2gByM+wCgqcwB91ELS3lpbs+RPW5s00hA
/RUAoJkYGcHOXtO07PsbYyceoQrDbdfq
=sGzt
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
