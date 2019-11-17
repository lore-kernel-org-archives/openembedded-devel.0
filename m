Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0A01B6B8BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 14:42:43 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i12so16445456wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 06:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=sez9zlBM/DtG0KtAowo+i0qyiB+6KhrM2wiMRjP76eY=;
	b=rjREym+IaWPSrv9y3eToBQWBlXMBJ71xecEt9+0/OpJY9cPSo9GexzdxFkYqCMFtqO
	i6jRDOwHyr+oMAJ7qEvUtt456ZMUHVB9qsKBrnzBPaQa46OkrvpziTxR1BJh7Fh2Oh5e
	cPu7DxQ845CU5wNU0laqr2GCKBQprBTOoP8brFIJVg1/YAavzJ8VG5peRSSC+tlJ1ukQ
	IMprGlyJTIVvoYUu4+3M7IC3thHEa83kxA/cd/3jGtzXSW21/wGBXj81B66oE669PwGb
	y6KwiWhzQohkBcfpQFYAxxbEZ5IHrLuq8EvU5GumQ2KXI/dfwvEEj4bA+hhqacZ6CPfD
	40CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=sez9zlBM/DtG0KtAowo+i0qyiB+6KhrM2wiMRjP76eY=;
	b=IHqDG9vIEC8OMKOrWFrDi65Y4jEvO7OeL2UhIxNASjTBSMTnKSatZY9e80CZMg4PVX
	zXDhSNBOtd78FcrrKNTRy1lOX3dX+AgvanPxlkpnub5jnlh/5dF/nRea9Qnej5SL1X2Y
	lODehBRnHbQsJVRUIF9iBkXXYO2KN+IxuWq5t7ijJfK3xIrvcKrAzXSZS70KV6ObWLH8
	XTd3RHSIdzWQea3liq/ZG88I79A7e8bmXSFrV6XXxwsupVp3Y/QUWOHXz6sG1pmu/pEk
	LxtNvXvIWkSMUabFmljJ7QXG7KGCUy27/70boXYoviOmNUjGH77DebNTm5Qv4yn3aET9
	uF5Q==
X-Gm-Message-State: APjAAAVKRZtvo61wX+h+YHJbHuLFIMIUJM+UeOIA1bQh2qtR0vL2ZzMS
	xzOjvbf91zLdidv8akUhrjw=
X-Google-Smtp-Source: APXvYqzCZkAu7qCsZKE6EBIkC/iM8wRzI088cSMCNBhakag1TUtGJfQYtCoeX6zEGyiOG4bCFw/zOg==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr23527097wrm.94.1574001764612; 
	Sun, 17 Nov 2019 06:42:44 -0800 (PST)
Received: from ?IPv6:2a01:598:818c:b5f5:cc60:c16:c0f0:6c96?
	([2a01:598:818c:b5f5:cc60:c16:c0f0:6c96])
	by smtp.gmail.com with ESMTPSA id
	k14sm20189873wrw.46.2019.11.17.06.42.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2019 06:42:44 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <1573997112-20833-1-git-send-email-leon.anavi@konsulko.com>
Date: Sun, 17 Nov 2019 15:42:42 +0100
Message-Id: <8ECFF12A-D752-410D-B1AA-24BD1A4384C3@gmail.com>
References: <1573997112-20833-1-git-send-email-leon.anavi@konsulko.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv3] surf: Add a simple web browser
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
X-List-Received-Date: Sun, 17 Nov 2019 14:42:44 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Why is there a dependency on both gtk 2(obsolete) and gtk 3?

Alex

> On 17 Nov 2019, at 14.25, Leon Anavi <leon.anavi@konsulko.com> wrote:
>=20
> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
>=20
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
> .../0001-config.mk-Fix-compiler-and-linker.patch   | 41 ++++++++++++++++++=
++++
> meta-oe/recipes-graphics/surf/surf_2.0.bb          | 26 ++++++++++++++
> 2 files changed, 67 insertions(+)
> create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-c=
ompiler-and-linker.patch
> create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compile=
r-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-c=
ompiler-and-linker.patch
> new file mode 100644
> index 0000000..fb90432
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-l=
inker.patch
> @@ -0,0 +1,41 @@
> +=46rom e97bb73851f5bbd94260da553a222526485cdfb1 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Fri, 15 Nov 2019 18:24:42 +0000
> +Subject: [PATCH] config.mk: Fix compiler and linker
> +
> +Do not set explicitly compiler and linker.
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + config.mk | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/config.mk b/config.mk
> +index df6e812..5deb991 100644
> +--- a/config.mk
> ++++ b/config.mk
> +@@ -15,17 +15,17 @@ GTKINC =3D `pkg-config --cflags gtk+-3.0 webkit2gtk-4=
.0`
> + GTKLIB =3D `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
> +=20
> + # includes and libs
> +-INCS =3D -I. -I/usr/include -I${X11INC} ${GTKINC}
> +-LIBS =3D -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
> ++INCS =3D ${GTKINC}
> ++LIBS =3D -lc -lX11 ${GTKLIB} -lgthread-2.0
> +=20
> + # flags
> + CPPFLAGS =3D -DVERSION=3D\"${VERSION}\" -DWEBEXTDIR=3D\"${LIBPREFIX}\" -=
D_DEFAULT_SOURCE
> + CFLAGS =3D -std=3Dc99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
> +-LDFLAGS =3D -s ${LIBS}
> ++LDFLAGS =3D ${LIBS}
> +=20
> + # Solaris
> + #CFLAGS =3D -fast ${INCS} -DVERSION=3D\"${VERSION}\"
> + #LDFLAGS =3D ${LIBS}
> +=20
> + # compiler and linker
> +-CC =3D cc
> ++CC ?=3D cc
> +--=20
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-g=
raphics/surf/surf_2.0.bb
> new file mode 100644
> index 0000000..d57efa6
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Simple web browser"
> +DESCRIPTION =3D "Simple open source web browser based on WebKit2/GTK"
> +HOMEPAGE =3D "https://surf.suckless.org/"
> +SECTION =3D "x11/graphics"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db57e7f7720307a02d5a6598b00fe3a=
fa"
> +
> +DEPENDS =3D "webkitgtk gtk+ gtk+3 glib-2.0"
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +SRC_URI =3D "git://git.suckless.org/surf;branch=3Dsurf-webkit2 \
> +           file://0001-config.mk-Fix-compiler-and-linker.patch \
> +"
> +SRCREV =3D "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig distro_features_check
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/surf ${D}${bindir}
> +}
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

