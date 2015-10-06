Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEA8600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:29:15 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so187193155wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=06egVR3BDD6Lc2/mlQ4Fsihm9aei7E+yleo3coznlEE=;
	b=jtE9mXyZh1xl1sOZlcMnBoVswxbO5e3t+FSvcj/mXxLz/9YF6aCCjy0BIcdFFLjg0n
	T8GRAzCiCySdsgfPgTfRCgfqr64tvL1pe8bGt2lkuucvxukRQrIkm1iAFU42ui3ZTlxP
	r+7vFGkZfA1iIWk1sZKbgoT+pl5T/URAZwiunq5XVa2q1aSwzReDxGDo/ANQ4866quOv
	Un4SvHEu98vRp9DvD2NjogeHeGWj+3dqk0rAMiQiKyXt19SBt7Y/83pHS/DAJ/ZZIsq1
	7z3qTT//KjI/hVFwTtYmiacVdBdSc9VofBvPH4TH5+VZIMqbtjp9fekQ9fe1MVs1Mnps
	ALGg==
X-Received: by 10.194.246.102 with SMTP id xv6mr38559748wjc.58.1444170555704; 
	Tue, 06 Oct 2015 15:29:15 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fz1sm21560028wic.8.2015.10.06.15.29.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:29:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Oct 2015 00:29:19 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151006222919.GC2383@jama>
References: <1443950022-18541-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKo0weXR60NYM_SUMDd-jZTxTVyq4ki90V5PDoBNdVihdg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo0weXR60NYM_SUMDd-jZTxTVyq4ki90V5PDoBNdVihdg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] freerdp: get out of "nonworking", fix build, improve
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
X-List-Received-Date: Tue, 06 Oct 2015 22:29:16 -0000
X-Groupsio-MsgNum: 57692
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline

--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2015 at 06:58:25PM -0300, Otavio Salvador wrote:
> On Sun, Oct 4, 2015 at 6:13 AM, Manuel Bachmann <manuel.bachmann@iot.bzh>=
 wrote:
> > We make the "freerdp" recipe active again, fix the build
> > by pulling a more recent version (the "stable" branches are
> > buggy and useless), and fix ARM runtime with -fPIC.
> >
> > We can then :
> > - make X11 non-mandatory ;
> > - add support for Wayland ("wlfreerdp" client) ;
> > - add support for DirectFB ("dfreerdp" client) ;
> > - add support for GStreamer 1.0 ;
> > - make "heavy" features such as pulseaudio, cups...
> > non-mandatory.
> >
> > We really want to install the "winpr-makecert" tool to have
> > TLS, but CMake does not position its RPATH cleanly, so let
> > us have a custom patch for that until it gets sorted out.
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
>=20
> I fully agree with the changes and those are very welcome. However, it
> would be good if you could move from nonworking in one patch and do
> the changes here in another patch.

I wanted to get rid of all nonworking directories, I'm sending patch
series which reverts the recipe moves and replaces it with PNBLACKLIST.

> Do you mind to rework it?

Please rebase it on top of current master-next which already has such
reverts.

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYUSz4ACgkQN1Ujt2V2gBwgHQCbBLZS/0IuoR5oLF0F0qBBgwd2
UbMAnRhqE1idG2BIQAl48q1PhkpLb3Ti
=ec3r
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
