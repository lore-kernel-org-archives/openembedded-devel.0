Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 18F58705A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 21:47:10 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so3368120wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IevC+qSZEQMjfCDfRyeIMDuZ3lRAwi0I7Cn86K5A5vM=;
	b=Wn1b+DgdCiekaCk5+cjNWIZjop7rGoYIuZcwYfvxMOMIiPnYJMEXVVWGCv+V2iR27E
	idrdOqYO3I8SAVo8hBZn9xxPW+WwfJsFir0mtpLxI8BloXXjeN3HVZjCv+OeiGfuuqZA
	KUjQ3Qzm98WIHQK/YQrx9IKlK2T7HiaaWUva64/S8KV76fpBCDvRoptVOuKK0LcGt/Lb
	ZmcVZ3SgoaS7nRE3q9AFhvP7JDWzWsVUmfc+Dp2iJZWi/W+p+EclLaBIosmY/qEdC1vN
	8EyUy+kdPkw3c0PBR3UfffmD2OvgQ0XPtJjL/SzsN5x4cOOLqYK8/7TQIIRMKF4fCXdS
	y5kg==
X-Received: by 10.194.185.238 with SMTP id ff14mr17018504wjc.9.1405892831332; 
	Sun, 20 Jul 2014 14:47:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm32601542wjr.22.2014.07.20.14.47.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 14:47:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 23:47:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140720214725.GG22875@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
	<CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
	<20140718182742.GR2433@jama>
	<CAEaCVQjMYWSZQQYj+wueXund=+XRyfnzXtmrg6WW8FyCSztukQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEaCVQjMYWSZQQYj+wueXund=+XRyfnzXtmrg6WW8FyCSztukQ@mail.gmail.com>
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
X-List-Received-Date: Sun, 20 Jul 2014 21:47:11 -0000
X-Groupsio-MsgNum: 51132
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6J7GEvtanOfV9oXA"
Content-Disposition: inline

--6J7GEvtanOfV9oXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 03:15:00PM -0600, Eduardo Silva wrote:
> Hi Martin,
>=20
> I was trying to reproduce the problem that you faced but here it worked
> fine. My local.conf looks like this:
>=20
> --
> BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_count()}"
> PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"
> MACHINE ??=3D "qemux86"
> DISTRO ?=3D "poky"
> PACKAGE_CLASSES ?=3D "package_rpm"
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
> PATCHRESOLVE =3D "noop"
> BB_DISKMON_DIRS =3D "\
>     STOPTASKS,${TMPDIR},1G,100K \
>     STOPTASKS,${DL_DIR},1G,100K \
>     STOPTASKS,${SSTATE_DIR},1G,100K \
>     ABORT,${TMPDIR},100M,1K \
>     ABORT,${DL_DIR},100M,1K \
>     ABORT,${SSTATE_DIR},100M,1K"
> PACKAGECONFIG_pn-qemu-native =3D "sdl"
> ASSUME_PROVIDED +=3D "libsdl-native"
> CONF_VERSION =3D "1"
>=20
> INHERIT +=3D ""
>=20
> IMAGE_INSTALL_append =3D " monkey dropbear"
> DISTRO_FEATURES_append =3D " systemd"
> VIRTUAL-RUNTIME_init_manager =3D "systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "sysvinit"
> VIRTUAL-RUNTIME_initscripts =3D ""
> --
>=20
> a fresh build of 'bitbake -k core-image-sato' worked with the following .=
bb:
>=20
>     b40e6ecaed2b10ba9c9aba4f128b029a  monkey_1.5.1.bb
>=20
> before the test i make sure to clean the monkey stuff with 'bitbake -c
> cleanall monkey'.  Do you see any difference between your system and mine
> ?, i am very interested into reproduce the problem you detected.

Please see rm_sysvinit_initddir function in systemd.bbclass

My builds are using "distroless" setup, if you're using poky then it's
possible that there is still sysvinit added in your DISTRO_FEATURES
somewhere (check bitbake -e monkay) so the sysv init script isn't
removed in the end for you.

Thanks

> On Fri, Jul 18, 2014 at 12:27 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Fri, Jul 18, 2014 at 12:19:29PM -0600, Eduardo Silva wrote:
> > > >
> > > > Now it failed with:
> > > >
> > > > | NOTE: Not creating empty archive for monkey-locale-1.5.1-r0.2
> > > > | *** Error: CONTROL/conffiles mentions conffile /etc/monkey/ which
> > does
> > > > not exist
> > > > |
> > > > | opkg-build: Please fix the above errors and try again.
> > > >
> > > > I guess it's because sysvinit script was removed by
> > update-rc.d.bbclass and
> > > > then nothing was left in /etc/monkey
> > > >
> > > >
> > > thanks for the report. Which specific build options did you use (and
> > image)
> > > ?, i would like to be able to reproduce that problem locally, not sure
> > why
> > > my tests passed.
> >
> > world builds as described on
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > probably the most important difference is:
> > # use systemd
> > DISTRO_FEATURES_append =3D " systemd"
> > DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "sysvinit"
> > VIRTUAL-RUNTIME_init_manager =3D "systemd"
> > VIRTUAL-RUNTIME_initscripts =3D ""
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>=20
>=20
> --=20
> Eduardo Silva
> Monkey Software
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6J7GEvtanOfV9oXA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPMOO0ACgkQN1Ujt2V2gBy/BACgp+JL+ZjKvEmL26lNS+nA0mqm
HXwAn0QlMRd8dmScGycDgQ/98pgcHm0b
=xRsu
-----END PGP SIGNATURE-----

--6J7GEvtanOfV9oXA--
