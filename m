Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 87BA670684
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:04:51 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so690109wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4DIE77T87iqA0HqMLNdC2kHkblMss2c1BXCVDDV/Nzk=;
	b=WdKTltDlH/jCIUYtQQHdDPAbU7c/rtmndgg/SBg0xlpD8dr2K/hgwLJaPAFyD80RFp
	kuzGCieFNPH22mDR3iH9a6oR/SQXieEX6cTXPXLBe0tByH4+13fCbT2oQx6DdnYHYXns
	PcPCO9vt1PpsSPsnU4onDt+hEGbWMmJE5wIJZIHs4pZmX4clTexZwPyHjwLmh3/jKpMS
	a5deDe3vgdNrMpbvZOB5LCSeFuPl1JojlnxVKUOjd+z97CKn1f6TEeweJxLQUw18uYoY
	0lkmAzR4fPAbqLKtjUb8fgqEkSUyLcl+qXGQdDHQ1jjI10hElAC8u5jduIELL5IZEoWZ
	drJQ==
X-Received: by 10.180.100.193 with SMTP id fa1mr3870514wib.16.1406282689914;
	Fri, 25 Jul 2014 03:04:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ey16sm4026498wid.14.2014.07.25.03.04.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 03:04:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 12:05:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140725100507.GS2492@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
	<CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
	<20140718182742.GR2433@jama>
	<CAEaCVQjMYWSZQQYj+wueXund=+XRyfnzXtmrg6WW8FyCSztukQ@mail.gmail.com>
	<20140720214725.GG22875@jama>
MIME-Version: 1.0
In-Reply-To: <20140720214725.GG22875@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Fri, 25 Jul 2014 10:04:53 -0000
X-Groupsio-MsgNum: 51249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hc4757KF+wLS/WHK"
Content-Disposition: inline

--hc4757KF+wLS/WHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 11:47:25PM +0200, Martin Jansa wrote:
> On Sun, Jul 20, 2014 at 03:15:00PM -0600, Eduardo Silva wrote:
> > Hi Martin,
> >=20
> > I was trying to reproduce the problem that you faced but here it worked
> > fine. My local.conf looks like this:
> >=20
> > --
> > BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_count()}"
> > PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"
> > MACHINE ??=3D "qemux86"
> > DISTRO ?=3D "poky"
> > PACKAGE_CLASSES ?=3D "package_rpm"
> > EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> > USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
> > PATCHRESOLVE =3D "noop"
> > BB_DISKMON_DIRS =3D "\
> >     STOPTASKS,${TMPDIR},1G,100K \
> >     STOPTASKS,${DL_DIR},1G,100K \
> >     STOPTASKS,${SSTATE_DIR},1G,100K \
> >     ABORT,${TMPDIR},100M,1K \
> >     ABORT,${DL_DIR},100M,1K \
> >     ABORT,${SSTATE_DIR},100M,1K"
> > PACKAGECONFIG_pn-qemu-native =3D "sdl"
> > ASSUME_PROVIDED +=3D "libsdl-native"
> > CONF_VERSION =3D "1"
> >=20
> > INHERIT +=3D ""
> >=20
> > IMAGE_INSTALL_append =3D " monkey dropbear"
> > DISTRO_FEATURES_append =3D " systemd"
> > VIRTUAL-RUNTIME_init_manager =3D "systemd"
> > DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "sysvinit"
> > VIRTUAL-RUNTIME_initscripts =3D ""
> > --
> >=20
> > a fresh build of 'bitbake -k core-image-sato' worked with the following=
 .bb:
> >=20
> >     b40e6ecaed2b10ba9c9aba4f128b029a  monkey_1.5.1.bb
> >=20
> > before the test i make sure to clean the monkey stuff with 'bitbake -c
> > cleanall monkey'.  Do you see any difference between your system and mi=
ne
> > ?, i am very interested into reproduce the problem you detected.
>=20
> Please see rm_sysvinit_initddir function in systemd.bbclass
>=20
> My builds are using "distroless" setup, if you're using poky then it's
> possible that there is still sysvinit added in your DISTRO_FEATURES
> somewhere (check bitbake -e monkay) so the sysv init script isn't
> removed in the end for you.

I've just noticed that CONFFILES is set to
${sysconfdir}/monkey/

so it's not caused by missing init.d script but whole
${sysconfdir}/monkey/ is empty in PN, can you check what's installed
there in your builds?

It's either not installed when some dependency is missing or it's
included in different package in my build (knowing which file to look
for would help).

Thanks

> Thanks
>=20
> > On Fri, Jul 18, 2014 at 12:27 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >=20
> > > On Fri, Jul 18, 2014 at 12:19:29PM -0600, Eduardo Silva wrote:
> > > > >
> > > > > Now it failed with:
> > > > >
> > > > > | NOTE: Not creating empty archive for monkey-locale-1.5.1-r0.2
> > > > > | *** Error: CONTROL/conffiles mentions conffile /etc/monkey/ whi=
ch
> > > does
> > > > > not exist
> > > > > |
> > > > > | opkg-build: Please fix the above errors and try again.
> > > > >
> > > > > I guess it's because sysvinit script was removed by
> > > update-rc.d.bbclass and
> > > > > then nothing was left in /etc/monkey
> > > > >
> > > > >
> > > > thanks for the report. Which specific build options did you use (and
> > > image)
> > > > ?, i would like to be able to reproduce that problem locally, not s=
ure
> > > why
> > > > my tests passed.
> > >
> > > world builds as described on
> > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > >
> > > probably the most important difference is:
> > > # use systemd
> > > DISTRO_FEATURES_append =3D " systemd"
> > > DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "sysvinit"
> > > VIRTUAL-RUNTIME_init_manager =3D "systemd"
> > > VIRTUAL-RUNTIME_initscripts =3D ""
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> >=20
> >=20
> > --=20
> > Eduardo Silva
> > Monkey Software
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hc4757KF+wLS/WHK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPSK9MACgkQN1Ujt2V2gByXzwCglxlkHE9egfkFNe3SlzRBU5nf
PzEAnRVjD7D6YyVoqOrWMLTK6P+o2ZQC
=EsLU
-----END PGP SIGNATURE-----

--hc4757KF+wLS/WHK--
