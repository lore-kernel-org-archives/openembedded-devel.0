Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RZVxn-0006Yr-Fv
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Dec 2011 00:04:15 +0100
Received: by eaal1 with SMTP id l1so564902eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 14:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QK7jo8P7R/OwQyQ/IO0UFFhgpIVZ2ejgFUD7W+pp3dM=;
	b=xaoUdNEyPssFjPG92mqXOcKoDFfYz06EVugEjxwNZ+MtsTBKA7ahGU80DbEMhIZocN
	d3mVDeTmlHTz5J6xtLw30jtlRZvTv6KHaIlm0BXSkuKHmnDrZgq/x2B9W/SipfZgtIKi
	fO4O8dCph5px0Fj79BL1lebNXcYU7Ke4Q67Es=
Received: by 10.213.14.204 with SMTP id h12mr969529eba.21.1323557838594;
	Sat, 10 Dec 2011 14:57:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 58sm52402687eet.11.2011.12.10.14.57.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 14:57:17 -0800 (PST)
Date: Sat, 10 Dec 2011 23:57:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111210225705.GC3986@jama.jama.net>
References: <4EE3A963.8070504@comcast.net>
MIME-Version: 1.0
In-Reply-To: <4EE3A963.8070504@comcast.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011,03 maint] Confused about xserver-xorg + touchscreen
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
X-List-Received-Date: Sat, 10 Dec 2011 23:04:15 -0000
X-Groupsio-MsgNum: 36027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline

--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 10, 2011 at 10:48:03AM -0800, Ed Nelson wrote:
> I am trying to build a modified minimal-gpe-image to use xserver-xorg=20
> and use xinput-calibrator but for some reason it keeps building tslib. =
=20
> Consequently I have to modify xorg.conf so the touchscreen driver uses=20
> tslib and not evdev for the touchsceen to work.  This is OK but I=20
> thought that the new way to do the touchscreen was to use xinput and to=
=20
> calibrate the touchscreen was to use xinput-calibrator.  I tried to find=
=20
> a image recipe that used xinput-calbrator but didn't find one.
>=20
> Is it better to use xserver-xorg + xinput-calibrator  or use=20
> xserver-xorg + tslib + modify xorg.conf?
> Am I missing something in the minimal-gpe-image recipe?
> Shouldn't I see something for xinput-calibrator inside Xsessions?

See SHR overrides in xserver-common

Regards,

>=20
>=20
> Below is my minimal-gpe-image recipe
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> #Angstrom minimal gpe image
> # This image provides a barebone dm and 'desktop'
> # Very angstrom and opkg centric
>=20
> ANGSTROM_EXTRA_INSTALL +=3D " \
>                            "
>=20
> XSERVER =3D "xserver-xorg \
>             xf86-input-evdev \
>             xf86-input-mouse \
>             xf86-video-fbdev \
>             xf86-input-keyboard"
>=20
> SPLASH ?=3D ' ${@base_contains("MACHINE_FEATURES", "screen",=20
> "psplash-angstrom", "",d)}'
>=20
> export IMAGE_BASENAME =3D "minimal-gpe-image"
>=20
> PR =3D "r2"
>=20
> DEPENDS =3D "task-boot"
>=20
> IMAGE_INSTALL =3D "\
>      ${XSERVER} \
>      task-boot \
>      gpe-dm gpe-session-scripts gpe-login \
>      matchbox-wm \
>      gpe-terminal \
>      angstrom-feed-configs \
>      xinput-calibrator \
>      nano \
>      python \
>      ${SPLASH} \
>      ${ANGSTROM_EXTRA_INSTALL} \
>      "
>=20
> #zap root password for release images
> ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_conditional("DISTRO_TYPE",=20
> "release", "zap_root_password; ", "",d)}'
>=20
> inherit image
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This is my Xinit.d
>=20
> root@sbc9261:~# ls /etc/X11/Xinit.d/
> 01xrandr         40xmodmap        60xXDefaults     99gpe-login
> 11zaurus         50setdpi         89xTs_Calibrate
> 12keymap         55xScreenSaver   98keymap-fixup
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This is my Xsessions.d
>=20
> root@sbc9261:~# ls /etc/X11/Xsession.d/
> 50autolock        69ipaq-sleep      98standard-apps
> 60xXDefaults      89xdgautostart    99xWindowManager
> root@sbc9261:~#
>=20
> Thanks
> Ed
>=20
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7j48EACgkQN1Ujt2V2gBxtNwCbBZIs5TkGxvcY0dR98thQ22tE
PSkAoLTiY38poBqYjqpQzB4tSLlzWYuF
=HONf
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
