Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE7773F95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 08:04:56 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so27066646pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=nYrr97tzcmBJ7aiKuLPI3v0uRxRJOntfAIUzuUQG2w4=;
	b=uqG4kloZsYKv7EybCJTEi/vussOiluhgd6k8Qx0ii8+6ns/JPA/IWhoQs5mwXI2SAS
	hB//fQdQ21sYP2zTpIil2YSuXaJMPOSWT1OPv3OmxZpQRIHieF+VmIGVcZhgqtWiChhW
	jEJIA/xC77321i3btS1fyTuGNkn7vG5neOmsAuL53e614Wc3M6+/1QKuBTHOw4fi8Efn
	2vZ9FIDcjv/6/hKXCFtOQP6vmzGfejEubfbX831QsRnCDGstj/AK9FhGsL3Jviuuc85F
	VRxMHT6J7EqVW3e+Dqkj+/5HscDzk8B5E8zF/Et4DNWcpDebYXXsDaJbFUUHWovXufbO
	cVpQ==
X-Received: by 10.66.248.72 with SMTP id yk8mr52790718pac.112.1440489896894;
	Tue, 25 Aug 2015 01:04:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ded:b62b:f72d:209d?
	([2601:646:8601:4580:4ded:b62b:f72d:209d])
	by smtp.gmail.com with ESMTPSA id
	kn8sm11207531pab.38.2015.08.25.01.04.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 01:04:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRTraUfFbCArpaMR0L7w9nME5+8-hN2q9R0Q=dwbULRM_w@mail.gmail.com>
Date: Tue, 25 Aug 2015 01:04:56 -0700
Message-Id: <D39F2E7E-DBAD-4C82-BD00-E2FC01C29912@gmail.com>
References: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
	<1440438239-19765-2-git-send-email-raj.khem@gmail.com>
	<CALbNGRTraUfFbCArpaMR0L7w9nME5+8-hN2q9R0Q=dwbULRM_w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-qt5][PATCH V2 2/4] qtwayland: Fix build for raspberryPi
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
X-List-Received-Date: Tue, 25 Aug 2015 08:04:58 -0000
X-Groupsio-MsgNum: 57003
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E08AA47F-A004-4C79-90A1-A6D1A01AD4AE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E08AA47F-A004-4C79-90A1-A6D1A01AD4AE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 25, 2015, at 12:00 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> On Mon, Aug 24, 2015 at 7:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> rpi uses bcom EGL implementation and it has descrepency when it comes =
to
>> defining 'EGLNativePixmapType', lets typecast the ussage of this type =
to
>> avoid this sort of errors.
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Upstream-Status?

Pending

>> ---
>> ...egl-Typecast-proper-EGLNativeWindowType-t.patch | 56 =
++++++++++++++++++++++
>> recipes-qt/qt5/qtwayland_git.bb                    |  1 +
>> 2 files changed, 57 insertions(+)
>> create mode 100644 =
recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNativeWind=
owType-t.patch
>>=20
>> diff --git =
a/recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNativeWi=
ndowType-t.patch =
b/recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNativeWi=
ndowType-t.patch
>> new file mode 100644
>> index 0000000..2e1f2c4
>> --- /dev/null
>> +++ =
b/recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNativeWi=
ndowType-t.patch
>> @@ -0,0 +1,56 @@
>> +=46rom 91746518a0cd56d7b0bfda69ba6cf743bf051fb9 Mon Sep 17 00:00:00 =
2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 23 Aug 2015 17:33:25 -0700
>> +Subject: [PATCH] xcomposite-egl: Typecast proper EGLNativeWindowType =
to
>> + eglCreateWindowSurface params
>> +
>> +This surfaces on rpi which has slightly different definition of
>> +EGLNativeWindowType
>> +
>> +Fixes errors like
>> +
>> =
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp=
-neon-angstrom-linux-gnueabi/qtwayland/5.4.2+gitAUTOINC+182488129c-r0/git/=
src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration=
.cpp:117:26: error: no matching function for call
>> +      to 'eglCreatePixmapSurface'
>> +    EGLSurface surface =3D =
eglCreatePixmapSurface(mEglDisplay,config,pixmap,attribList.constData());
>> +                         ^~~~~~~~~~~~~~~~~~~~~~
>> =
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/raspberryp=
i2/usr/include/EGL/egl.h:270:31: note: candidate function not viable: no =
known conversion from 'Pixmap' (aka 'unsigned long') to =
'EGLNativePixmapType' (aka 'void *') for 3rd argument; take the
>> +      address of the argument with &
>> +EGLAPI EGLSurface EGLAPIENTRY eglCreatePixmapSurface(EGLDisplay dpy, =
EGLConfig config,
>> +                              ^
>> +1 error generated.
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + .../client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp           =
    | 2 +-
>> + .../compositor/xcomposite-egl/xcompositeeglintegration.cpp          =
    | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git =
a/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindo=
w.cpp =
b/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindo=
w.cpp
>> +index 01d6324..e268ede 100644
>> +--- =
a/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindo=
w.cpp
>> ++++ =
b/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindo=
w.cpp
>> +@@ -122,7 +122,7 @@ void =
QWaylandXCompositeEGLWindow::createEglSurface()
>> +     XCompositeRedirectWindow(m_glxIntegration->xDisplay(), =
m_xWindow, CompositeRedirectManual);
>> +     XMapWindow(m_glxIntegration->xDisplay(), m_xWindow);
>> +
>> +-    m_surface =3D =
eglCreateWindowSurface(m_glxIntegration->eglDisplay(), m_config, =
m_xWindow,0);
>> ++    m_surface =3D =
eglCreateWindowSurface(m_glxIntegration->eglDisplay(), m_config, =
(EGLNativeWindowType)m_xWindow,0);
>> +     if (m_surface =3D=3D EGL_NO_SURFACE) {
>> +         qFatal("Could not make eglsurface");
>> +     }
>> +diff --git =
a/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegrati=
on.cpp =
b/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegrati=
on.cpp
>> +index 2401d67..61664b5 100644
>> +--- =
a/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegrati=
on.cpp
>> ++++ =
b/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegrati=
on.cpp
>> +@@ -114,7 +114,7 @@ void =
XCompositeEglClientBufferIntegration::bindTextureToBuffer(struct =
::wl_resou
>> +     attribList.append(EGL_TEXTURE_2D);
>> +     attribList.append(EGL_NONE);
>> +
>> +-    EGLSurface surface =3D =
eglCreatePixmapSurface(mEglDisplay,config,pixmap,attribList.constData());
>> ++    EGLSurface surface =3D =
eglCreatePixmapSurface(mEglDisplay,config,(EGLNativeWindowType)pixmap,attr=
ibList.constData());
> ^ When looking at [1] this does not look correct to me.
>=20
> Generally I think errors caused by a specific egl implementation
> should not be fixed in packets using egl - and yes I know we have
> these hacks in qt.
>=20
> [1] =
https://www.khronos.org/registry/egl/sdk/docs/man/html/eglCreatePixmapSurf=
ace.xhtml
>=20
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_E08AA47F-A004-4C79-90A1-A6D1A01AD4AE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXcIagACgkQuwUzVZGdMxTPiQCeLYQ2A0G0FxwzJAwIn6h1H9sI
NQkAn3/n6BnBSD2gffoi1MVwFepWkbTL
=2VMi
-----END PGP SIGNATURE-----

--Apple-Mail=_E08AA47F-A004-4C79-90A1-A6D1A01AD4AE--
