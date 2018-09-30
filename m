Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 92BA274CAF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 06:10:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q8-v6so5624681wmq.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 23:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1R6Saes9Ef0P91ngTd8N8SBGcOCmyz+MxUATFwdT4BE=;
	b=mNEyOZlDvKvTq5qsh0q/7YePK4y+1a+SpZQ+z9lMpG4YGTNXpEULt5z+WDXx3M/GxL
	+qr94vxY0pXCMSn67Fg49r0zzqQDplTpO9FTLcuv1KbyP9S+bvcmZvyU1CcAq363MEOI
	5/w30965W4WqXMeW+qTeUrVDyRFfygUEJLTi/uF+rqUTUMrPBzL7gKgoMsy708HVQXxb
	IjSoVnzTwieVV/muD96jus5dVjGp5zQipKGacBHXL2tmc31c1hzuKopjNdh8cHGuMQdK
	hACcnIaTVFAYFL0BoY2ugPRTDD7HR5n7/pmA41oYsagnUHnKd5vge6Eyq8pHZNAtfEy6
	6vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1R6Saes9Ef0P91ngTd8N8SBGcOCmyz+MxUATFwdT4BE=;
	b=GNB/zRTi1/PgFpj83oPv4jrFDp14DlQLoOLm9KtDQjC3G0giBVRrWS6qZGry/FLa53
	Zpenq1LkArJ44OFH7LRR0DOqwJOvV0FS314Ay4dcI8VU/a7SpefihRMFsnr+ieyvHVtp
	FzgvpFxfBmBMecNnU2zzfeahC6uxoq2BBmfmxy/s0K/pqN9dGqw3u0sHEYNHLxKi7fop
	yp0nVsyINJw4STWJ5SRwnxfnf/2sSX7P4dcAl3WYXLC31vkp+jM+t7q4RpSnDwZUs59u
	EVNawUx2VRqQyrIRHnLw6v3yDQL6fc37/r23avJ2ySWHRG11c/cPhUZjmpx1Usj3mJFm
	ryzg==
X-Gm-Message-State: ABuFfogbFnzbOayqTpI3FuunzMrRwUgP/QBkSRtT/C+ygUOUicgcVM/D
	9gM0+KOB6ni/7h9sdVGm2MM=
X-Google-Smtp-Source: ACcGV62zP2X3iDB+Z/XHs4VcBhlfQ4CtxlosIwZLEFNYIA9n9dLvxDBeMSuO6dBJTbxat4MKtE0WzQ==
X-Received: by 2002:a1c:e4c6:: with SMTP id
	b189-v6mr5777481wmh.114.1538287854074; 
	Sat, 29 Sep 2018 23:10:54 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n68-v6sm5211172wmn.5.2018.09.29.23.10.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 29 Sep 2018 23:10:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 30 Sep 2018 08:10:55 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180930061055.GD1449@jama>
References: <20180929193105.25864-1-akuster808@gmail.com>
	<20180929194635.GC1449@jama>
	<ba8e6994-685c-2ef8-40fc-7c6acc4f4b61@gmail.com>
	<CA+chaQe2D2Byk7CZof3dA64UtSV+PAWOXZ7HHSEdAye22Or22w@mail.gmail.com>
	<CAMKF1so46sTf9VCFcu+D+st5s90npvnPEktt14xyDnPZkC_7Hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so46sTf9VCFcu+D+st5s90npvnPEktt14xyDnPZkC_7Hg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue with mulitmedia
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
X-List-Received-Date: Sun, 30 Sep 2018 06:10:54 -0000
X-Groupsio-MsgNum: 74801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2018 at 11:04:11PM -0700, Khem Raj wrote:
> On Sat, Sep 29, 2018 at 10:55 PM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> >
> > The --- marker line serves the essential purpose of marking for patch
> > handling tools where the changelog message ends.
> >
> > One good use for the additional comments after the --- marker is for a
> > diffstat, to show what files have changed, and the number of inserted a=
nd
> > deleted lines per file. A diffstat is especially useful on bigger patch=
es.
> > Other comments relevant only to the moment or the maintainer, not suita=
ble
> > for the permanent changelog, should also go here. A good example of such
> > comments might be patch changelogs which describe what has changed betw=
een
> > the v1 and v2 version of the patch.
> >
>=20
> yeah, i have fixed it locally no need for next rev

Only the commit message, right?

Because the PACKAGECONFIG is still incorrect in:
http://cgit.openembedded.org/meta-openembedded-contrib/commit/?h=3Dyoe/mut&=
id=3D14a9f80296aa0141ea9a065439970f8fc1e0c36b

There is also typo in the subject and
"mpd: enable aac PACKAGECONFIG only with commercial LICENSE_FLAGS

* fix yocto-check-layer issue with multimedia"

would be better commit message IMHO.

> >
> > On Sat, Sep 29, 2018 at 10:16 PM akuster808 <akuster808@gmail.com> wrot=
e:
> >
> > >
> > >
> > > On 09/29/2018 12:46 PM, Martin Jansa wrote:
> > >
> > > On Sat, Sep 29, 2018 at 12:31:05PM -0700, Armin Kuster wrote:
> > >
> > > ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-ope=
nembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS=
 on or otherwise requires it)
> > >
> > > enable aac only if LICENSE_FLAGS is commercial
> > >
> > > [v2]
> > > fix typo in commit message
> > > rebase on latest master
> > >
> > >
> > > This belongs to cover later or under ---.
> > >
> > > I failed to have a [V2] in the subject.  I guess a V3 is inorder for =
that.
> > >
> > > Can you point me to the doc that says where a [v2] comments in a git
> > > header should be. I can not find it. I seem to be reminded that when =
I do
> > > revisions I am doing them wrong.
> > >
> > > I don't see reference to this policy:
> > > https://www.openembedded.org/wiki/Styleguide#Patches
> > > https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > >
> > > per kernel process:
> > > "The --- marker line serves the essential purpose of marking for patch
> > > handling tools where the changelog message ends."
> > > Are you saying I should violate that?
> > >
> > > is there somewhere else I should be looking?
> > >
> > > - armin
> > >
> > >
> > >
> > > Signed-off-by: Armin Kuster <akuster808@gmail.com> <akuster808@gmail.=
com>
> > > ---
> > >  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.b=
b b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > > index 9123673fb..f91ce4d62 100644
> > > --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > > +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > > @@ -26,7 +26,8 @@ S =3D "${WORKDIR}/git"
> > >  EXTRA_OECONF =3D "enable_bzip2=3Dyes"
> > >  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd'=
, '--with-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-sy=
stemdsystemunitdir', d)}" <$%7B@bb.utils.contains('DISTRO_FEATURES','system=
d','--with-systemdsystemunitdir=3D$%7Bsystemd_unitdir%7D/system/','--withou=
t-systemdsystemunitdir',d)%7D>
> > >
> > > -PACKAGECONFIG ??=3D "aac alsa ao bzip2 daemon ffmpeg fifo flac fluid=
synth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile u=
pnp openal opus oss recorder vorbis wavpack zlib"
> > > +PACKAGECONFIG ??=3D "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 ja=
ck libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack=
 zlib"
> > > +PACKAGECONFIG +=3D "${@bb.utils.contains('LICENSE_FLAGS', 'commercia=
l', 'aac', '', d)}" <$%7B@bb.utils.contains('LICENSE_FLAGS','commercial','a=
ac','',d)%7D>
> > >
> > >
> > > This removes much more than just aac now.
> > >
> > > Why did you remove daemon, fifo, libwrap, httpd, oss, recorder, vorbi=
s?
> > >
> > >
> > >
> > >  PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,faad2"
> > >  PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing listOpenembedded-devel@lists.openembedded.=
orghttp://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW7Bo7wAKCRA3VSO3ZXaA
HPPHAJ47f58IyylNUetz1gibfb3VJHuXrgCfadxYfn56cB8o2lzOlOGD1rIMeV4=
=wo5B
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
