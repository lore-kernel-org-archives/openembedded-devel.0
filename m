Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D13A96FD63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 17:17:25 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so4082986wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tRpLOxwDYFBInxqdDcL0xKHM4+wGrg5YmM1I+bmc0jU=;
	b=W6mdevOp6vhozN/FYXP6/eWJLeAxK6/EixPHBwdus+G4gkT6KCSBykWWtZ0/4awGVc
	mAdHEMuSQqCsBPoPo70maRYMmtabFdHGVz6xAJFFq562aJM04GNjPTmddF0w7BUaCCTt
	ouLnOLbvqHDGPzadCnyreGkmg1uChILYG6DicV+qsGppbDANZ6JFsbDFLzk9OvEcwt+C
	U1mPtgr6pA/+WGlJoIBRJLasUd+kVpMGemU0V+7F9Pex6PVegK6HdctTtnKbttjYwUGt
	eayRVhARy6w23XYLDVOlQy5Ac7F+k+pNNg5HIhVNj5ypD8Sy6jTZkWCoC5GI6F0r45wC
	cS4Q==
X-Received: by 10.14.3.5 with SMTP id 5mr67573eeg.58.1402420646552;
	Tue, 10 Jun 2014 10:17:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a45sm53381844eez.2.2014.06.10.10.17.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jun 2014 10:17:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Jun 2014 19:17:46 +0200
To: Ash Charles <ashcharles@gmail.com>
Message-ID: <20140610171745.GI2433@jama>
References: <20140610112139.GD2433@jama>
	<1402418201-4389-1-git-send-email-ashcharles@gmail.com>
	<CAK8F28nWie5hLac3mFiB739BRfw=MQQ8q=39rZoV3i39vuvvcw@mail.gmail.com>
	<20140610171143.GH2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140610171143.GH2433@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Patch v2] xfce4-screenshooter: Ensure lib directory exists.
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
X-List-Received-Date: Tue, 10 Jun 2014 17:17:32 -0000
X-Groupsio-MsgNum: 50258
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vs0rQTeTompTJjtd"
Content-Disposition: inline

--vs0rQTeTompTJjtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2014 at 07:11:43PM +0200, Martin Jansa wrote:
> On Tue, Jun 10, 2014 at 09:42:17AM -0700, Ash Charles wrote:
> > Hi,
> >=20
> > Newbie question:
> > I sent this correction as a v2 on the patch as committed on
> > master-next (which, unintentionally meant that I carried over Martin's
> > SOB).  Is this the correct approach or
>=20
> I don't mind my SOB being carried (I can still remove it when
> re-cherry-picking to master next)
>=20
> > 1. would you rather a completely new patch to resolve just the issue
> > as the original has already been committed to master-next
>=20
> No, being in master-next only means that it's being tested in my Jenkins
> builds, I'm rebasing master-next every time I push something to master,
> so I'll just replace original patch with v2 in master-next for next Jenki=
ns
> build.
>=20
> > 2. would you rather a v2 on the original patch I sent to the list?
>=20
> Sending PATCHv2 with --in-reply-to as you did now, is the best for me, th=
anks

Two smaller nitpicks I've noticed when cherry-picking v2.

1) Subject prefix should be PATCHv2 (not just v2) for people who filter
patches based on subject.

2) vN changes in commit message are usually written bellow --- so that
they are in e-mail for reviewers to see, but not part of final commit
message (usually the incremental process isn't interesting in final
commit, if it is, it should be mentioned in proper commit message).

3) Upstream-Status this belongs to individual .patch files (applied
through SRC_URI), not in commit message of whole "metadata change".

I've removed v2:.* and Upstream-Status when cherry-picking it, so no
need to send v3 this time.

> > thanks,
> > --Ash
> >=20
> > On Tue, Jun 10, 2014 at 9:36 AM, Ash Charles <ashcharles@gmail.com> wro=
te:
> > > Screenshooter autogenerates screenshooter-marshal.[ch] in lib/ during
> > > compilation.  The source directory contains a lib/ but this directory
> > > doesn't exist in a build directory by default so we add one manually.
> > > Really, this should be corrected in the upstream package.
> > >
> > > v2: only make lib/ if it doesn't exist
> > >
> > > Upstream-Status: pending
> > >
> > > Signed-off-by: Ash Charles <ashcharles@gmail.com>
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  .../recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb   =
  | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screens=
hooter_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screensh=
ooter_1.8.1.bb
> > > index 4cda352..0e2e327 100644
> > > --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_=
1.8.1.bb
> > > +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_=
1.8.1.bb
> > > @@ -11,5 +11,9 @@ SRC_URI +=3D "file://0001-Fix-panel-plugin-build.pa=
tch"
> > >  SRC_URI[md5sum] =3D "d0ffea2052a8e70154cf13789070711f"
> > >  SRC_URI[sha256sum] =3D "40419892bd28989315eed053c159bba0f4264ed8c6c6=
738806024e481eab9492"
> > >
> > > +do_compile_prepend() {
> > > +       mkdir -p lib
> > > +}
> > > +
> > >  FILES_${PN} +=3D "${datadir}/xfce4/panel/plugins \
> > >          ${libdir}/xfce4/panel/plugins"
> > > --
> > > 1.8.3.2
> > >
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vs0rQTeTompTJjtd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOXPbkACgkQN1Ujt2V2gByD7ACffEizAETeiym6rdmjnLTr4VU8
b9wAnAjY/l4wu3IhwMyh3wh0GZX+kVpG
=NjqK
-----END PGP SIGNATURE-----

--vs0rQTeTompTJjtd--
