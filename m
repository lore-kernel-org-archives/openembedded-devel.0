Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D493C784E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 09:45:00 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 139so10357466wmn.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 01:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8BydUrxE6H14v0NG2HDqhDKHnDOZWO5jVxvUd/BdPRQ=;
	b=p2ig4agdsMai2kf553WFCu8pWeK8RUBjEV4ZEWxO4I6NE+t9QbT7byS0Zjmwdkr/ya
	m2/0Q1Tcd+GIw3cEFcv7MKPO6/6Og6+EYQspN/une/FyJs1KbfOTTljuFDvDOdJFpTfr
	3CNEIu9YR0QQDV5jj/4/1lfCEoDO9Y2xajTK0cNcj6e//XfBVNhcla8oK2yDLhDzIqJj
	iLfoyUYt926ePyfi/6BgRm5yN9I+sGsc3VdAkK7H4bMBjUMAbgnwz20LRvbeKqWC+ieJ
	xiWPhhRafyj6LuTkAIF59o18WSPPOrepa515R8mrCE+t4lnlUPPLWONPwfk6MnCifalc
	SeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8BydUrxE6H14v0NG2HDqhDKHnDOZWO5jVxvUd/BdPRQ=;
	b=mp1ExFtK8K5nlJ/2NTWbMbI6slCcG4jKSlLJzotLoP3I1yEw3LexpRzS/IjDaqQWJz
	WsW9ft6JijWy4mdckMUoJLohv8Z6LmL9bUddyay0fYOD4mLFeLdRpW7rQ9VH+6x9OocW
	UdTtV6jiggXMQBu15Td3TnY3dV28ivo3ofshcAEIQ3AbitkJKbeK7AXcceWGWzR/ApJT
	4FU3M57Vco4m8a0B5oH3vFAlyVGe06B49+9CyBN6RPMyjwHMtRrMI/M0DQVs/BBV2BMD
	Gz3k7iRpgm7VbUpGYfno0ef097mqooM1oXXm0m/+qYZGZY2I/Odbivn/PobUdCG0gC26
	BLGA==
X-Gm-Message-State: AElRT7ESIR7lpc848Jy6iul+9l/f0ZazE/nLcoAYsA8RUAUY4becPyM5
	iX6ZjxPYvz3vnNJAa5xvYk8=
X-Google-Smtp-Source: AG47ELs1pEEzbpj/p+ZG20wdzaVTxW6R3X+UQf1EKW1dxPiRDBVYrxPM+svkSM05yZjrDIPBkAzdvQ==
X-Received: by 10.28.50.69 with SMTP id y66mr1292565wmy.133.1519897501511;
	Thu, 01 Mar 2018 01:45:01 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y111sm3806136wrc.0.2018.03.01.01.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 01:45:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 Mar 2018 10:45:00 +0100
To: zboszor@pr.hu
Message-ID: <20180301094500.GB1347@jama>
References: <20180224105155.14511-1-Martin.Jansa@gmail.com>
	<f95e15a0e40deb7eb0d3f579fb5740d7@pr.hu>
MIME-Version: 1.0
In-Reply-To: <f95e15a0e40deb7eb0d3f579fb5740d7@pr.hu>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: upgrade to 5.2.6
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
X-List-Received-Date: Thu, 01 Mar 2018 09:45:01 -0000
X-Groupsio-MsgNum: 70994
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline

--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2018 at 06:37:21AM +0100, zboszor@pr.hu wrote:
> 2018-02-24 11:51 id=C5=91pontban Martin Jansa ezt =C3=ADrta:
>=20
> > * 5.1.26 doesn't build with 4.15 kernel
>=20
> But 5.1.32 does IIRC.

According to the changelog only 5.1.34 does:
https://www.virtualbox.org/wiki/Changelog-5.1
VirtualBox 5.1.34 (released 2018-02-27)

I've sent v2 which updated to 5.2.8 which includes 4.15 support as well:
https://www.virtualbox.org/wiki/Changelog
VirtualBox 5.2.8 (released 2018-02-27)

Linux guests: Linux 4.15 support (bugs #17311, #17320, #17282)

> Anyway, kernel 4.15 includes the vboxguest and vboxvideo
> drivers which has the advantage that these drivers are
> signed properly (in case you have set it in the kernel config)
> unlike the drivers coming from vboxguestdrivers.

I think that 4.15 contains only vboxvideo, not vboxguest and vboxsf
provided by vboxguestdrivers. 4.16 contains vboxguest (I don't know
about vboxsf support in vanilla).

Regards,
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > .../linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff | 90=20
> > ++++++++++++++++++++++
> > ...drivers_5.1.26.bb =3D> vboxguestdrivers_5.2.6.bb} | 22 ++++--
> > 2 files changed, 107 insertions(+), 5 deletions(-)
> > create mode 100644=20
> > meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-=
rc8-VBoxGuestAdditions-amd64.diff
> > rename=20
> > meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.26.bb =
=3D>=20
> > vboxguestdrivers_5.2.6.bb} (69%)
> >=20
> > diff --git=20
> > a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.=
0-rc8-VBoxGuestAdditions-amd64.diff=20
> > b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.=
0-rc8-VBoxGuestAdditions-amd64.diff
> > new file mode 100644
> > index 0000000000..23a9021f04
> > --- /dev/null
> > +++=20
> > b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.=
0-rc8-VBoxGuestAdditions-amd64.diff
> > @@ -0,0 +1,90 @@
> > +Based on:
> > +https://raw.githubusercontent.com/mjmaravillo/misc/master/linux-4.15.0=
-rc8-VBoxGuestAdditions-amd64.diff=20
> > [1]
> > +
> > +Upstream-Status: Pending (hopefully new vbox will be released soon=20
> > with proper 4.15 support, this patch isn't backwards compatible)
> > +
> > +--- vbox_module.orig/vboxvideo/vbox_mode.c 2018-02-18=20
> > 16:42:47.000000000 +0000
> > ++++ vbox_module/vboxvideo/vbox_mode.c 2018-02-18 16:55:14.466029313=20
> > +0000
> > +@@ -396,7 +396,7 @@
> > +
> > + /* pick the encoder ids */
> > + if (enc_id)
> > +- return drm_encoder_find(connector->dev, enc_id);
> > ++ return drm_encoder_find(connector->dev, NULL, enc_id);
> > +
> > + return NULL;
> > + }
> > +--- vbox_module.orig/vboxguest/VBoxGuest-linux.c 2018-02-18=20
> > 16:42:28.000000000 +0000
> > ++++ vbox_module/vboxguest/VBoxGuest-linux.c 2018-02-18=20
> > 16:54:36.793049118 +0000
> > +@@ -1058,7 +1058,7 @@
> > + #if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2, 6, 0)
> > +
> > + /** log and dbg_log parameter setter. */
> > +-static int vgdrvLinuxParamLogGrpSet(const char *pszValue, struct=20
> > kernel_param *pParam)
> > ++static int vgdrvLinuxParamLogGrpSet(const char *pszValue, const=20
> > struct kernel_param *pParam)
> > + {
> > + if (g_fLoggerCreated)
> > + {
> > +@@ -1073,7 +1073,7 @@
> > + }
> > +
> > + /** log and dbg_log parameter getter. */
> > +-static int vgdrvLinuxParamLogGrpGet(char *pszBuf, struct kernel_param=
=20
> > *pParam)
> > ++static int vgdrvLinuxParamLogGrpGet(char *pszBuf, const struct=20
> > kernel_param *pParam)
> > + {
> > + PRTLOGGER pLogger =3D pParam->name[0] =3D=3D 'd' ? RTLogDefaultInstan=
ce() :=20
> > RTLogRelGetDefaultInstance();
> > + *pszBuf =3D '\0';
> > +@@ -1084,7 +1084,7 @@
> > +
> > +
> > + /** log and dbg_log_flags parameter setter. */
> > +-static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, struct=20
> > kernel_param *pParam)
> > ++static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, const=20
> > struct kernel_param *pParam)
> > + {
> > + if (g_fLoggerCreated)
> > + {
> > +@@ -1098,7 +1098,7 @@
> > + }
> > +
> > + /** log and dbg_log_flags parameter getter. */
> > +-static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, struct=20
> > kernel_param *pParam)
> > ++static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, const struct=20
> > kernel_param *pParam)
> > + {
> > + PRTLOGGER pLogger =3D pParam->name[0] =3D=3D 'd' ? RTLogDefaultInstan=
ce() :=20
> > RTLogRelGetDefaultInstance();
> > + *pszBuf =3D '\0';
> > +@@ -1109,7 +1109,7 @@
> > +
> > +
> > + /** log and dbg_log_dest parameter setter. */
> > +-static int vgdrvLinuxParamLogDstSet(const char *pszValue, struct=20
> > kernel_param *pParam)
> > ++static int vgdrvLinuxParamLogDstSet(const char *pszValue, const=20
> > struct kernel_param *pParam)
> > + {
> > + if (g_fLoggerCreated)
> > + {
> > +@@ -1123,7 +1123,7 @@
> > + }
> > +
> > + /** log and dbg_log_dest parameter getter. */
> > +-static int vgdrvLinuxParamLogDstGet(char *pszBuf, struct kernel_param=
=20
> > *pParam)
> > ++static int vgdrvLinuxParamLogDstGet(char *pszBuf, const struct=20
> > kernel_param *pParam)
> > + {
> > + PRTLOGGER pLogger =3D pParam->name[0] =3D=3D 'd' ? RTLogDefaultInstan=
ce() :=20
> > RTLogRelGetDefaultInstance();
> > + *pszBuf =3D '\0';
> > +@@ -1134,7 +1134,7 @@
> > +
> > +
> > + /** r3_log_to_host parameter setter. */
> > +-static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, struct=
=20
> > kernel_param *pParam)
> > ++static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, const=
=20
> > struct kernel_param *pParam)
> > + {
> > + if ( pszValue =3D=3D NULL
> > + || *pszValue =3D=3D '\0'
> > +@@ -1152,7 +1152,7 @@
> > + }
> > +
> > + /** r3_log_to_host parameter getter. */
> > +-static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, struct=20
> > kernel_param *pParam)
> > ++static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, const struct=
=20
> > kernel_param *pParam)
> > + {
> > + strcpy(pszBuf, g_DevExt.fLoggingEnabled ? "enabled" : "disabled");
> > + return strlen(pszBuf);
> > diff --git=20
> > a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb=
=20
> > b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
> > similarity index 69%
> > rename from=20
> > meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
> > rename to=20
> > meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
> > index fdefe03172..c018b789f2 100644
> > ---=20
> > a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
> > +++=20
> > b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
> > @@ -12,22 +12,27 @@ COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64)"
> > VBOX_NAME =3D "VirtualBox-${PV}"
> >=20
> > SRC_URI =3D=20
> > "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2=
=20
> > [2] \
> > - file://Makefile.utils [3] \
> > + file://Makefile.utils [3] \
> > "
> > -SRC_URI[md5sum] =3D "d3aec8190c649d7e0d92ba374779dfe3"
> > -SRC_URI[sha256sum] =3D=20
> > "b5715035e681a11ef1475f83f9503d34a00f0276b89c572eebec363dda80c8a9"
> > +
> > +# For default linux-yocto 4.15
> > +SRC_URI +=3D "file://linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff [4=
]"
> > +
> > +SRC_URI[md5sum] =3D "4490d6929dfae41cdf05e34f583318c8"
> > +SRC_URI[sha256sum] =3D=20
> > "fe705288ee50efcce10ff4c80e461a1c7091e461a7b55f98842fa1c9772ca4e7"
> >=20
> > S =3D "${WORKDIR}/vbox_module"
> >=20
> > export BUILD_TARGET_ARCH=3D"${ARCH}"
> > export BUILD_TARGET_ARCH_x86-64=3D"amd64"
> > -export KERN_DIR=3D"${STAGING_KERNEL_DIR}"
> > +
> > +EXTRA_OEMAKE +=3D "KERN_DIR=3D'${WORKDIR}/${KERNEL_VERSION}/build'"
> >=20
> > addtask export_sources before do_patch after do_unpack
> >=20
> > do_export_sources() {
> > mkdir -p "${S}"
> > - ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules=20
> > ${T}/vbox_modules.tar.gz
> > + ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh=20
> > ${T}/vbox_modules.tar.gz
> > tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
> >=20
> > # add a mount utility to use shared folder from VBox Addition Source=20
> > Code
> > @@ -38,6 +43,13 @@ do_export_sources() {
> >=20
> > }
> >=20
> > +do_configure_prepend() {
> > + #=20
> > vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header=
:99:=20
> > *** The variable KERN_DIR must be a kernel build folder and end with=20
> > /build without a trailing slash, or KERN_VER must be set. Stop.
> > + #=20
> > vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header=
:108:=20
> > *** The kernel build folder path must end in <version>/build, or the=20
> > variable KERN_VER must be set. Stop.
> > + mkdir -p ${WORKDIR}/${KERNEL_VERSION}
> > + ln -snf ${STAGING_KERNEL_DIR} ${WORKDIR}/${KERNEL_VERSION}/build
> > +}
> > +
> > # compile and install mount utility
> > do_compile_append() {
> > oe_runmake 'LD=3D${CC}' 'LDFLAGS=3D${LDFLAGS}' -C ${S}/utils
> > --
> > 2.15.1
>=20
>=20
>=20
> Links:
> ------
> [1]=20
> https://raw.githubusercontent.com/mjmaravillo/misc/master/linux-4.15.0-rc=
8-VBoxGuestAdditions-amd64.diff
> [2] http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
> [3] file://Makefile.utils
> [4] file://linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWpfLmAAKCRA3VSO3ZXaA
HKYHAJwLSEzzNsNDfhxK4W3Db1s8Yy3jFwCggIRZnq++ceFgOlbRsGx9hws3Yps=
=XMjS
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
