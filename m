Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUDGq-00088r-4s
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 08:29:14 +0200
Received: by iwn34 with SMTP id 34so1728330iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 23:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=N9Nhmmth5EnN2agoCOUODnFl+d8+ziiCuJIWf/Pu2oU=;
	b=nks4XuXzGO7YqMDh5m/haaGNadwSSRQ3Xx734x/mXIiyrK1ySd7nmxSUca0egNSHyf
	OEpFVMY+UVj8PeR+FhXKJUacV2P0Eyl2uNMFsGMaEIG9plfpdEANzwiP1Jap3K5hk+hp
	ZFEsxA3uztkVpmBjUgHDjJ1dHFH0WMsrjcLNk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=F8aOeacxH0UYNVP473ntjik5J0gLQK9WhWHKq/6KZRur9yCuMKfC4l3aoexQ32qJUd
	TUH9g1wPKimn6vDw72rbTtHN1wuANXkFZuhf14ghclGhi556B0VgcC7yzXa/ucCFeYRh
	XX242niPJRQ5sDXp3vT4l+enF5mpthE7lizwU=
Received: by 10.231.161.135 with SMTP id r7mr10243265ibx.47.1277965469187; 
	Wed, 30 Jun 2010 23:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Wed, 30 Jun 2010 23:24:09 -0700 (PDT)
In-Reply-To: <4C2BE886.8000900@gmail.com>
References: <4C2BE886.8000900@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jun 2010 23:24:09 -0700
Message-ID: <AANLkTikyD3zXs5XAWDCCszKvlKHnoIom4GfZr7zmIv7y@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xserver-kdrive_1.5.3.bb: enable the XCALIBRATE extension.
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
X-List-Received-Date: Thu, 01 Jul 2010 06:29:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2010 at 5:59 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0.../xserver-kdrive-1.5.3/enable-xcalibrate.patch =A0 | =A0 58 ++++++++=
++++++++++++
> =A0recipes/xorg-xserver/xserver-kdrive_1.5.3.bb =A0 =A0 =A0 | =A0 =A03 +-
> =A02 files changed, 60 insertions(+), 1 deletions(-)
> =A0create mode 100644 recipes/xorg-xserver/xserver-kdrive-1.5.3/enable-xc=
alibrate.patch
>
> diff --git a/recipes/xorg-xserver/xserver-kdrive-1.5.3/enable-xcalibrate.=
patch b/recipes/xorg-xserver/xserver-kdrive-1.5.3/enable-xcalibrate.patch
> new file mode 100644
> index 0000000..ed6c5dc
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-kdrive-1.5.3/enable-xcalibrate.patch
> @@ -0,0 +1,58 @@
> +diff -ur xorg-server-1.5.3-blah/configure.ac xorg-server-1.5.3/configure=
.ac
> +--- xorg-server-1.5.3-blah/configure.ac =A0 =A0 =A0 =A02010-07-01 09:54:=
18.000000000 +0930
> ++++ xorg-server-1.5.3/configure.ac =A0 =A0 2010-07-01 09:59:24.000000000=
 +0930
> +@@ -544,6 +544,7 @@
> + AC_ARG_ENABLE(xace, =A0 =A0 =A0 =A0 =A0 AS_HELP_STRING([--disable-xace]=
, [Build X-ACE extension (default: enabled)]), [XACE=3D$enableval], [XACE=
=3Dyes])
> + AC_ARG_ENABLE(xselinux, =A0 =A0 =A0 AS_HELP_STRING([--disable-xselinux]=
, [Build SELinux extension (default: disabled)]), [XSELINUX=3D$enableval], =
[XSELINUX=3Dno])
> + AC_ARG_ENABLE(xcsecurity, =A0 =A0 AS_HELP_STRING([--disable-xcsecurity]=
, [Build Security extension (default: disabled)]), [XCSECURITY=3D$enableval=
], [XCSECURITY=3Dno])
> ++AC_ARG_ENABLE(xcalibrate, =A0 =A0 AS_HELP_STRING([--enable-xcalibrate],=
 [Build XCalibrate extension (default: disabled)]), [XCALIBRATE=3D$enableva=
l], [XCALIBRATE=3Dno])
> + AC_ARG_ENABLE(appgroup, =A0 =A0 =A0 AS_HELP_STRING([--disable-appgroup]=
, [Build XC-APPGROUP extension (default: disabled)]), [APPGROUP=3D$enableva=
l], [APPGROUP=3D$XCSECURITY])
> + AC_ARG_ENABLE(xcalibrate, =A0 =A0 AS_HELP_STRING([--enable-xcalibrate],=
 [Build XCalibrate extension (default: disabled)]), [XCALIBRATE=3D$enableva=
l], [XCALIBRATE=3Dno])
> + AC_ARG_ENABLE(tslib, =A0 =A0 =A0 =A0 =A0AS_HELP_STRING([--enable-tslib]=
, [Build kdrive tslib touchscreen support (default: disabled)]), [TSLIB=3D$=
enableval], [TSLIB=3Dno])
> +@@ -906,6 +907,12 @@
> + =A0 =A0 =A0 AC_DEFINE(XCSECURITY, 1, [Build Security extension])
> + fi
> +
> ++AM_CONDITIONAL(XCALIBRATE, [test "x$XCALIBRATE" =3D xyes])
> ++if test "x$XCALIBRATE" =3D xyes; then
> ++ =A0 =A0 =A0AC_DEFINE(XCALIBRATE, 1, [Build XCalibrate extension])
> ++ =A0 =A0 =A0REQUIRED_MODULES=3D"$REQUIRED_MODULES xcalibrateproto"
> ++fi
> ++
> + AM_CONDITIONAL(XEVIE, [test "x$XEVIE" =3D xyes])
> + if test "x$XEVIE" =3D xyes; then
> + =A0 =A0 =A0 AC_DEFINE(XEVIE, 1, [Build XEvIE extension])
> +diff -ur xorg-server-1.5.3-blah/include/kdrive-config.h.in xorg-server-1=
.5.3/include/kdrive-config.h.in
> +--- xorg-server-1.5.3-blah/include/kdrive-config.h.in =A02010-07-01 09:5=
4:18.000000000 +0930
> ++++ xorg-server-1.5.3/include/kdrive-config.h.in =A0 =A0 =A0 2010-07-01 =
09:55:02.000000000 +0930
> +@@ -31,4 +31,7 @@
> + /* Have execinfo.h for backtrace(). */
> + #undef HAVE_EXECINFO_H
> +
> ++/* Enable XCalibrate extension */
> ++#undef XCALIBRATE
> ++
> + #endif /* _KDRIVE_CONFIG_H_ */
> +diff -ur xorg-server-1.5.3-blah/mi/miinitext.c xorg-server-1.5.3/mi/miin=
itext.c
> +--- xorg-server-1.5.3-blah/mi/miinitext.c =A0 =A0 =A02010-07-01 09:54:17=
.000000000 +0930
> ++++ xorg-server-1.5.3/mi/miinitext.c =A0 2010-07-01 09:55:02.000000000 +=
0930
> +@@ -374,6 +374,9 @@
> + #ifdef DMXEXT
> + extern void DMXExtensionInit(INITARGS);
> + #endif
> ++#ifdef XCALIBRATE
> ++extern void XCalibrateExtensionInit(INITARGS);
> ++#endif
> + #ifdef XEVIE
> + extern void XevieExtensionInit(INITARGS);
> + #endif
> +@@ -664,6 +667,9 @@
> + =A0 =A0 GlxPushProvider(&__glXDRISWRastProvider);
> + =A0 =A0 if (!noGlxExtension) GlxExtensionInit();
> + #endif
> ++#ifdef =A0XCALIBRATE
> ++ =A0 =A0XCalibrateExtensionInit ();
> ++#endif
> + }
> +
> + void
> diff --git a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb b/recipes/xorg-=
xserver/xserver-kdrive_1.5.3.bb
> index 7fbdff2..9fa5579 100644
> --- a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
> +++ b/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
> @@ -6,7 +6,7 @@ RDEPENDS_${PN} +=3D "hal"
> =A0DEFAULT_PREFERENCE =3D "-99"
>
> =A0PE =3D "1"
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> =A0SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.b=
z2 \
> =A0 =A0 =A0 =A0${KDRIVE_COMMON_PATCHES} \
> @@ -21,6 +21,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-ser=
ver-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0file://drmfix.patch \
> =A0 =A0 =A0 =A0file://no_xkb.patch \
> =A0 =A0 =A0 =A0file://keyboard_device.patch \
> + =A0 =A0 =A0 file://enable-xcalibrate.patch \
> =A0 =A0 =A0 =A0 "
>
> =A0S =3D "${WORKDIR}/xorg-server-${PV}"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


