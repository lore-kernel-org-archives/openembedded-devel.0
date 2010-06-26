Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OSQtY-0002aZ-1V
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 10:37:49 +0200
Received: by bwz14 with SMTP id 14so3349207bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 01:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YXZzRUjAXkhbG4ux1i17ZSscodb5mWNm4EtkO6aBMY4=;
	b=P7GY4gROvLAk3Yjwq7qeS8AlDeUdqCg2e+AMqEnOrzLOxZl+0IkIodKbyG+A7JeRbx
	7YXXJ8eS0K+8IlAysbH/Wy7NcIuJ/MlWdOQzOzTYVg8ys1d8uSKkXBM2PXOWPmj1ajpX
	nuFA9mLGtMRJiAdD9+zqlIkKOlYKhoBjcHyKk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WOK9fkhpIaG1NuDqs55VPEFsEbaPS332UsA8U/23Bb/vUAcq66gEiBcsJOi3TLncBH
	dfuVmHDAdutuxCIbXFz5HXni6nF8FrVkkRJa8MKupeZvq5iRiGJqojfnwbhVeamJ0F78
	+5uoctAFFt4Gipz+IpFvyfY610CFUyDify8CQ=
MIME-Version: 1.0
Received: by 10.204.47.34 with SMTP id l34mr1272871bkf.77.1277541190725; Sat, 
	26 Jun 2010 01:33:10 -0700 (PDT)
Received: by 10.204.123.210 with HTTP; Sat, 26 Jun 2010 01:33:10 -0700 (PDT)
In-Reply-To: <1277468383-16679-6-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
	<1277468383-16679-6-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 26 Jun 2010 10:33:10 +0200
Message-ID: <AANLkTikxhrxxH4c6Vzwlc7bRispfUZrtSpXLSWOvitU7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/9] mesa: remove 7.4 release, which is not pinned in 	any distro/include config
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
X-List-Received-Date: Sat, 26 Jun 2010 08:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/25 Martin Jansa <martin.jansa@gmail.com>:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/mesa/mesa-dri_7.4.bb =A0| =A0 27 ---------------------------
> =A0recipes/mesa/mesa-xlib_7.4.bb | =A0 24 ------------------------
> =A0recipes/mesa/mesa_7.4.bb =A0 =A0 =A0| =A0 =A02 --
> =A03 files changed, 0 insertions(+), 53 deletions(-)
> =A0delete mode 100644 recipes/mesa/mesa-dri_7.4.bb
> =A0delete mode 100644 recipes/mesa/mesa-xlib_7.4.bb
> =A0delete mode 100644 recipes/mesa/mesa_7.4.bb
>
> diff --git a/recipes/mesa/mesa-dri_7.4.bb b/recipes/mesa/mesa-dri_7.4.bb
> deleted file mode 100644
> index a78c03f..0000000
> --- a/recipes/mesa/mesa-dri_7.4.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -include mesa-common.inc
> -
> -PROTO_DEPS =3D "xf86driproto glproto dri2proto expat"
> -LIB_DEPS =3D "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfi=
xes"
> -
> -DEPENDS =3D "${PROTO_DEPS} =A0${LIB_DEPS}"
> -
> -PR =3D "${INC_PR}.0"
> -
> -# most of our targets do not have DRI so will use mesa-xlib
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -# ASUS EeePC 901 has DRI support so use mesa-dri by default
> -DEFAULT_PREFERENCE_eee901 =3D "1"
> -
> -PACKAGES =3D+ "${PN}-xprogs"
> -
> -FILES_${PN} +=3D "${libdir}/dri/*.so"
> -FILES_${PN}-dbg +=3D "${libdir}/dri/.debug/*"
> -FILES_${PN}-xprogs =3D "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/g=
lxheads ${bindir}/glxinfo"
> -
> -EXTRA_OECONF +=3D "--with-driver=3Ddri --with-dri-drivers=3Dswrast,${MAC=
HINE_DRI_MODULES}"
> -
> -SRC_URI[archive.md5sum] =3D "7ecddb341a2691e0dfdb02f697109834"
> -SRC_URI[archive.sha256sum] =3D "6e945389add4e5b41f2c403ced13c343767565f2=
eacde4b16de2d0f9f8a6aac4"
> -SRC_URI[demos.md5sum] =3D "02816f10f30b1dc5e069e0f68c177c98"
> -SRC_URI[demos.sha256sum] =3D "c3de74d62f925e32030adb3d0edcfb3c7a4129fc92=
c48181a389eeed8f14b897"
> diff --git a/recipes/mesa/mesa-xlib_7.4.bb b/recipes/mesa/mesa-xlib_7.4.b=
b
> deleted file mode 100644
> index 68e7218..0000000
> --- a/recipes/mesa/mesa-xlib_7.4.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -include mesa-common.inc
> -
> -PROTO_DEPS =3D "xf86driproto glproto"
> -LIB_DEPS =3D "virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
> -
> -DEPENDS =3D "${PROTO_DEPS} =A0${LIB_DEPS}"
> -
> -PR =3D "${INC_PR}.0"
> -
> -EXTRA_OECONF +=3D "--with-driver=3Dxlib"
> -
> -PACKAGES =3D+ "${PN}-xprogs"
> -
> -FILES_${PN}-xprogs =3D "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/g=
lxheads ${bindir}/glxinfo"
> -
> -do_install_append () {
> - =A0 =A0install -d ${D}/${bindir}
> - =A0 =A0install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glx=
info} ${D}/${bindir}
> -}
> -
> -SRC_URI[archive.md5sum] =3D "7ecddb341a2691e0dfdb02f697109834"
> -SRC_URI[archive.sha256sum] =3D "6e945389add4e5b41f2c403ced13c343767565f2=
eacde4b16de2d0f9f8a6aac4"
> -SRC_URI[demos.md5sum] =3D "02816f10f30b1dc5e069e0f68c177c98"
> -SRC_URI[demos.sha256sum] =3D "c3de74d62f925e32030adb3d0edcfb3c7a4129fc92=
c48181a389eeed8f14b897"
> diff --git a/recipes/mesa/mesa_7.4.bb b/recipes/mesa/mesa_7.4.bb
> deleted file mode 100644
> index 43cde67..0000000
> --- a/recipes/mesa/mesa_7.4.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# This is a dummy package so OE can use the poky mesa files
> -require mesa-dri_${PV}.bb
> --
> 1.7.0.2
>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


