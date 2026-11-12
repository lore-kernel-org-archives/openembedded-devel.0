Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7853.1794464079093777041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tafhub.de header.s=dkim header.b=SwsFe+of;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 714C82E400D9;
	Thu, 12 Nov 2026 07:14:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1794464076; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kOVs+Ap6/ch415RozihcJV+aPKYAaZ1jdm1eBinIKxc=;
	b=SwsFe+ofNuwh65Hza8UR3BDjnkRsKtS3IBMAqEfLAiItE8FU08KAm7EOQ7zxVONiR9rSjY
	SyO115S1+QImWYfzpAFCxRFWa6bFwdYq0Xmc8j0OQQw6e1tsGzfDjPGVx3g/X/1xVGpZBN
	sOBzx0wvxxSuMPwrHNPxwVh1hddTMzZemZT7eDEyfoXAp8R784wqqBKEG6Mum2bz+vaxqf
	13vQteOmZPWaKJ6HzmwD/7pzS08GoaFiGyOI7P4hcXpVB+FKtZSfMyU2KaNONllToQPLnG
	oo9bdQ2V4Pf2aMdeoPTqH1rKlEm/IH7MRhamgbWTiiJJ+7wq68tCUzObtgIUIg==
From: "Tafil Avdyli" <tafil@tafhub.de>
In-Reply-To: <CAMKF1sqwkkAtRkCh5Y8cgZoaadBDy2OgUa6P=0+6oTqb8y=5-Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20261110163904.15077-1-tafil@tafhub.de> <20261110163904.15077-3-tafil@tafhub.de> <CAMKF1sqwkkAtRkCh5Y8cgZoaadBDy2OgUa6P=0+6oTqb8y=5-Q@mail.gmail.com>
Date: Thu, 12 Nov 2026 07:14:35 +0100
Cc: openembedded-devel@lists.openembedded.org
To: "Khem Raj" <raj.khem@gmail.com>
MIME-Version: 1.0
Message-ID: <c55ee4f2-8006-4808-6f5b-eea7a7c72f20@tafhub.de>
Subject: =?utf-8?q?Re=3A?= [oe] [meta-oe][PATCH 3/3] =?utf-8?q?fastfetch=3A?= 
 upgrade =?utf-8?q?2=2E70=2E0?= -> =?utf-8?q?2=2E71=2E0?=
User-Agent: SOGoMail 5.12.12
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132169

On Wednesday, November 11, 2026 16:20 CET, Khem Raj <raj.khem@gmail.com=
> wrote:

> this fails with clang compiler
>=20
> /home/ubuntu/yoe/build/tmp/work/cortexa57-yoe-linux/fastfetch/2.71.0/=
sources/fastfetch-2.71.0/src/detection/users/users=5Flinux.c:189:5:
> error: use of undeclared identifier 'endutxent'; did you mean 'endute=
nt'?
>   189 |     endutxent();
>       |     ^~~~~~~~~
>       |     endutent
> /home/ubuntu/yoe/build/tmp/work/cortexa57-yoe-linux/fastfetch/2.71.0/=
recipe-sysroot/usr/include/utmp.h:68:13:
> note: 'endutent' declared here
>    68 | extern void endutent (void) =5F=5FTHROW;
>       |             ^
> 1 error generated.

Hi,

I was trying yesterday to reproduce it, but lacked build capacity. I al=
ready saw the new patch you sent and the fastfetch PR.=20
Thanks!

Best regards=20
Tafil


>=20
> On Tue, Nov 10, 2026 at 8:39=E2=80=AFAM Tafil Avdyli via openembedded=
-devel <tafil=3D
> tafhub.de@lists.openembedded.org> wrote:
>=20
> > Full changelog:
> > https://github.com/fastfetch-cli/fastfetch/blob/2.71.0/CHANGELOG.md
> >
> > Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
> > ---
> >  .../fastfetch/{fastfetch=5F2.70.0.bb =3D> fastfetch=5F2.71.0.bb}  =
    | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/fastfetch/{fastfetch=5F2.70.0.bb =3D=
>
> > fastfetch=5F2.71.0.bb} (98%)
> >
> > diff --git a/meta-oe/recipes-support/fastfetch/fastfetch=5F2.70.0.b=
b
> > b/meta-oe/recipes-support/fastfetch/fastfetch=5F2.71.0.bb
> > similarity index 98%
> > rename from meta-oe/recipes-support/fastfetch/fastfetch=5F2.70.0.bb
> > rename to meta-oe/recipes-support/fastfetch/fastfetch=5F2.71.0.bb
> > index 9db8b2cbce..c9ba3519b0 100644
> > --- a/meta-oe/recipes-support/fastfetch/fastfetch=5F2.70.0.bb
> > +++ b/meta-oe/recipes-support/fastfetch/fastfetch=5F2.71.0.bb
> > @@ -11,7 +11,7 @@ LIC=5FFILES=5FCHKSUM =3D
> > "file://LICENSE;md5=3D2090e7d93df7ad5a3d41f6fb4226ac76"
> >  DEPENDS =3D "yyjson"
> >
> >  SRC=5FURI =3D "git://
> > github.com/fastfetch-cli/fastfetch.git;protocol=3Dhttps;branch=3Dma=
ster;tag=3D${PV}
> > <http://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhttps;bra=
nch=3Dmaster;tag=3D$%7BPV%7D>
> > "
> > -SRCREV =3D "17bb3fd2384bd814b421d73b8c8b8d08e06cfa26"
> > +SRCREV =3D "8c9d9c0449dd515e0088c4a60a38d2dc40c5ccd0"
> >
> >  inherit cmake pkgconfig
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#132096):
> > https://lists.openembedded.org/g/openembedded-devel/message/132096
> > Mute This Topic: https://lists.openembedded.org/mt/122196593/199791=
4
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [
> > raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >

