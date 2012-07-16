Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqn43-0005Wm-Ga
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 17:18:23 +0200
Received: by bkcik5 with SMTP id ik5so3612740bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JzOubkfmgEIu/FT2LPS5xPFbUJlqjm1FMjdh4g7nyaA=;
	b=Kw+6TAZSd8sRK5wWSIx2CNQui7h8W7Rs64sIhZ+XzIogKr0aq/pjv9U4NQ+fP8OauN
	elhWRLIKb0B/PfD55WCz323mIY7V0GvTOCOjUru0qXutNZon0ouaz3hyJmgSLILp6ZHe
	gRdvM6XxdQRTDMfIxKsDpR0VLzdE3tnxfbwpQ6NYI4xJKofLgruznGCx0pz31h77anTx
	JrEeAt07ko+8s07a1U/JOi03L1acvDwpHWkPvwNnkL4bRTSQ8qsrtO3J1IGts+O2bNcg
	E/bYtRCe/AfM5Wztm38OkMOW6CgZ5MsirfpyBN1esBJ9qjqb+05zncwvHj1uOsArMUZz
	GUQQ==
Received: by 10.205.134.6 with SMTP id ia6mr5125107bkc.51.1342451225275;
	Mon, 16 Jul 2012 08:07:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o4sm8336292bkv.15.2012.07.16.08.07.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 08:07:03 -0700 (PDT)
Date: Mon, 16 Jul 2012 17:07:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120716150711.GG3729@jama.jama.net>
References: <1342430652-15388-1-git-send-email-koen@dominion.thruhere.net>
	<20120716120823.GE3729@jama.jama.net>
	<28779B0A-D02E-42D3-A7D9-3C7438D0BF04@dominion.thruhere.net>
	<20120716135933.GF3729@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120716135933.GF3729@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][meta-oe][meta-systemd][PATCH] systemd: update to 186+git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 15:18:23 -0000
X-Groupsio-MsgNum: 39686
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhYGnrYv1PEJ5gA2"
Content-Disposition: inline

--nhYGnrYv1PEJ5gA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 03:59:33PM +0200, Martin Jansa wrote:
> On Mon, Jul 16, 2012 at 02:16:01PM +0200, Koen Kooi wrote:
> >=20
> > Op 16 jul. 2012, om 14:08 heeft Martin Jansa het volgende geschreven:
> >=20
> > > On Mon, Jul 16, 2012 at 11:24:12AM +0200, Koen Kooi wrote:
> > >> This is a combined udev+systemd recipe: it will build both udev and =
systemd in one go, but keep the old (sub)package layout:
> > >>=20
> > >> 	udev
> > >> 	udev-utils
> > >> 	udev-systemd
> > >> 	systemd
> > >> 	systemd-vconsole-setup
> > >> 	systemd-analyze
> > >> 	systemd-initramfs
> > >>=20
> > >> And all libraries are seperated out:
> > >> =09
> > >> 	libgudev-1.0-0
> > >> 	libsystemd-daemon0
> > >> 	libsystemd-id128-0
> > >> 	libsystemd-journal0
> > >> 	libsystemd-login0
> > >> 	libudev1
> > >>=20
> > >> The SRCREV is 94 patches ahead of the v186 tag to drag in compile fi=
xes for 'old' gcc versions like 4.5.x.
> > >>=20
> > >> Runtime tested with build from scratch and opkg upgrade with angstrom
> > >=20
> > > With this upgrade (opkg upgraded) I see few services failing to start.
> > > I'll try to reproduce it on other devices (this is on qemux86-64) and
> > > maybe it was caused by some other changes (like meta-systemd move).
> > >=20
> > > SHR root@qemux86-64 ~ $ systemctl status systemd-modules-load.service
> > > systemd-modules-load.service - Load Kernel Modules
> > >          Loaded: loaded (/lib/systemd/system/systemd-modules-load.ser=
vice; static)
> > >          Active: failed (Result: exit-code) since Mon, 16 Jul 2012 12=
:03:35 +0000; 2s ago
> > >            Docs: man:systemd-modules-load.service(8)
> > >                  man:modules-load.d(5)
> > >         Process: 524 ExecStart=3D/lib/systemd/systemd-modules-load (c=
ode=3Dexited, status=3D1/FAILURE)
> > >          CGroup: name=3Dsystemd:/system/systemd-modules-load.service
> > >=20
> > > Jul 16 12:03:35 qemux86-64 systemd-modules-load[524]: Failed to find =
module '...
> >=20
> > can you add a '-a' to the systemctl line, that will show the actual err=
or :)
>=20
> Ah, much better :)
>=20
> so this is because there is no ipv6 module in latest greatest 3.4.4-yocto=
-standard, not systemd fault
>=20
> >=20
> > >=20
> > > SHR root@qemux86-64 ~ $ systemctl status busybox-syslog.service
> > > busybox-syslog.service - System Logging Service
> > >          Loaded: loaded (/lib/systemd/system/busybox-syslog.service; =
enabled)
> > >          Active: failed (Result: exit-code) since Mon, 16 Jul 2012 12=
:03:55 +0000; 1s ago
> > >         Process: 532 ExecStartPre=3D/bin/systemctl stop systemd-kmsg-=
syslogd.service (code=3Dexited, status=3D1/FAILURE)
> > >          CGroup: name=3Dsystemd:/system/busybox-syslog.service
> > >=20
> > > Jul 16 12:03:56 qemux86-64 systemctl[532]: Failed to issue method cal=
l: Unit....
>=20
> Jul 16 12:25:18 qemux86-64 systemctl[149]: Failed to issue method call:
> Unit systemd-kmsg-syslogd.service not loaded.
>=20
> /lib/systemd/system/busybox-syslog.service:
> ExecStartPre=3D/bin/systemctl stop systemd-kmsg-syslogd.service
>=20
> and systemd-kmsg-syslogd.service seems gone (for quite a while since
> replaced by journald), maybe hit wasn't fatal before..
>=20
> Cheers,

There is also libudev soname change.. so stuff depending on old libudev0
should be PR bumped, in my image:

 * print_dependents_warning:    libphone-ui-shr
 * print_dependents_warning:    e-wm
 * print_dependents_warning:    libemotion-backend-gstreamer
 * print_dependents_warning:    shr-e-gadgets
 * print_dependents_warning:    shr-wizard
 * print_dependents_warning:    xserver-xorg
 * print_dependents_warning:    libemotion1
 * print_dependents_warning:    ethumb
 * print_dependents_warning:    bluez4
 * print_dependents_warning:    elementary
 * print_dependents_warning:    python-elementary
 * print_dependents_warning:    eeze

I can send PR bump patch for those if you want, but not sure if oe-core wil=
l accept more=20
PR bumps especially when it's not their udev changing soname..



And for some machines I got unpackaged file:
NOTE: package systemd-git-r5: task do_package: Started
WARNING: QA Issue: systemd: Files/directories were installed but not shipped
  /etc/rpm
  /etc/rpm/macros.systemd

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nhYGnrYv1PEJ5gA2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAELh8ACgkQN1Ujt2V2gBy2wACeJ/8pSGzv/rL7FOygEfgPeVVK
XloAn0W6hXX6H3wBjZEV7UwgG0/ROStm
=k5Gn
-----END PGP SIGNATURE-----

--nhYGnrYv1PEJ5gA2--
