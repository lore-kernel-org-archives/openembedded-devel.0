Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4176EFD3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 06:55:57 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so7451512eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 22:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kSMDWvFs7sl44rcoJ1eYZQwdxAJ9um51LojAPj8tlDY=;
	b=G7rlUeiU7ay08Zc/Ic3CEvH4cJWtIwBfBsEAvJ/pUVFSBM3sg4KpLkLGxdT99VEOEm
	jyeYGPVGvKxXL8BJYRQ4+lTbdTYzd3tMPloJYvsHVRDQm1m0OgUz/bvMu5b2mCz3YV6K
	vCw3FJTXJ2cF8gGiZIpacHlAjKBBnfGclOfPjSP2Yz7ql9AdIYNIA61BtdwxeI9GIDhO
	NezRs0N8EAlJ8zqKcLRE+lob5QrO1ux+b8LuS+HQmpZ9GpZcljDBD16s7QLkEFSjkcvt
	LWu/lei9H76hdVPc7wFwZ6d1UVeyFiREtYR7FWY+X1DZ2KCtxAKqeA43xsiEN7eK9aRD
	TdXg==
X-Received: by 10.15.22.65 with SMTP id e41mr31602766eeu.5.1392706557117;
	Mon, 17 Feb 2014 22:55:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm66364378een.7.2014.02.17.22.55.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 22:55:53 -0800 (PST)
Date: Tue, 18 Feb 2014 07:56:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140218065625.GG4067@jama>
References: <CAP71Wjy4dxnDZFb3x_5zPg5HV-VOakeYtFz+8o0h2xk08R1=zQ@mail.gmail.com>
	<20140217214623.GU22890@denix.org> <20140217230307.GE4067@jama>
	<CAJ86T=XEkEEMn-Tu=Ja4-1C5o=Ur7LdnsoN-RYskz_W_V0t2Rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XEkEEMn-Tu=Ja4-1C5o=Ur7LdnsoN-RYskz_W_V0t2Rw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5] why does Qt5 build with ARM_INSTRUCTION_SET = "arm"
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
X-List-Received-Date: Tue, 18 Feb 2014 06:55:58 -0000
X-Groupsio-MsgNum: 48188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GBuTPvBEOL0MYPgd"
Content-Disposition: inline

--GBuTPvBEOL0MYPgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2014 at 09:33:10PM -0800, Andre McCurdy wrote:
> On Mon, Feb 17, 2014 at 3:03 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Mon, Feb 17, 2014 at 04:46:23PM -0500, Denys Dmytriyenko wrote:
> >> On Mon, Feb 17, 2014 at 02:27:51PM -0700, Nicolas Dechesne wrote:
> >> > hi,
> >> >
> >> > does anybody know why in Qt5/qtbase.inc, we have:
> >> >
> >> > ARM_INSTRUCTION_SET =3D "arm"
> >> >
> >> > Could it be an a low hanging fruit from the past? e.g. before
> >> > https://bugreports.qt-project.org/browse/QTBUG-16402 or
> >> > https://qt.gitorious.org/qt/qtbase/commit/a3bd9d4c0f3d9e80dbe35bd886=
49b245dca5f410?
> >>
> >> Hmm, I would assume that's here from 4.8 days, although I haven't tried
> >> dropping that line for latest Qt5... Would make sense to do some more =
testing.
> >>
> >> > as a matter of fact, for our project Qt5 (and QtWebkit) are building
> >> > (and working fine) when built with Thumb2, outside of OE. Also using
> >> > ARM instruction set instead of Thumb2 enforces Webkit to use the ARM
> >> > version of the javascript JIT, while the Thumb2 JIT engine seems to
> >> > work a lot better in our testing...
> >>
> >> Seems like worth the effort to re-test the need for that setting. Unle=
ss
> >> someone else has tried it already and found out the issue is still the=
re
> >
> > IIRC it was failing to build for armv4t (at least with 5.0.0) if someone
> > tests that armv4t builds with 5.2.*, I'll accept the patch.
>=20
> With ARM_INSTRUCTION_SET forced to thumb I'm able to build qtbase
> 5.1.1 and 5.2.1 tuned for both armv4t and cortexa9thf-neon.

Cool, can you please send the patch removing ARM_INSTRUCTION_SET?

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GBuTPvBEOL0MYPgd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMDBBkACgkQN1Ujt2V2gBxOdQCfS04QTSZ0k7iDl58KoV7J2LVK
2L0An2DunXSnSuOfW7OkIMoQ1pMPwuiK
=2f0z
-----END PGP SIGNATURE-----

--GBuTPvBEOL0MYPgd--
