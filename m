Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0501A731CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 15:35:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e201so5659772wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 08:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bynx2JM9zvKmWqHT9IjlVRuMrhq75sIWpH1IyqxXGQA=;
	b=KhZ1vH8opdhXllZjRHfXazPKrvzCYo5J2lEC8ggNTWJnHoOAG+Ow1xouYLZWxOwlnb
	19+MwUhypsxEsrKWSRDb+68qIBkYhOk709R8wXvRG6oJEq4382m+9lRz8Xxre8OuAKRz
	uXlS8I1jMRbAasgBizQpB58670z4A05QYuBinJ3cxggc3yZAoPHvyi3Jgj+J+1+QEySW
	za5aIGLD0stJB25Pba+vXNA3LjT1USG9PADK3xQkvDUSeVPv2V3d/tKL250LkfayYpI2
	/9AyQG4CJrz1998JY2WYDIntiiW0hKViPpx7VyH8WSMiQed7PJkXn4uqiaZxgbZWSW5r
	qX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bynx2JM9zvKmWqHT9IjlVRuMrhq75sIWpH1IyqxXGQA=;
	b=lkqnL6eL5Ya/M4/87h8l1XWsKr1Vp3K2F4C01nQjd/VnlzeYlnBSdEh8lHdcvECwG5
	1wXPExOAAF3rJCr6hjZqTvvZaPwbTzufU6HDMu/C9ruMcvAgz1URtheAAifZsQDDrZqK
	oEpsi1z4ZPesEhYTgOF08icc0p0RWF458w1/9o5N6AOI+Rxrx7Cf7nHzt/5ofIzIHqfG
	vr1hETeD1pit4BVbGjW69DcLOoDCSU6eFPwE+kAyWhOCnP+r83P2Cd3bUxWpSRFfDGkr
	EzS3U/RFtlmxLBUOWTz88UTlev/pGyl31KABGdeF0xGKp4fk3Jk9RTcsp7Y6WVDxtsXc
	uoaQ==
X-Gm-Message-State: AOPr4FUZv8T15jzP6XXbXU2hCqoTWQ8PUI10rP/Dy/+1XZk0u8pjgdCnG3hcWMzILXCNTA==
X-Received: by 10.194.231.169 with SMTP id th9mr2480061wjc.32.1463499325870;
	Tue, 17 May 2016 08:35:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g197sm24719495wme.15.2016.05.17.08.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 May 2016 08:35:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 May 2016 17:35:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160517153542.GC2559@jama>
References: <cover.1462896891.git.hongxu.jia@windriver.com>
	<1462930752-234960-1-git-send-email-hongxu.jia@windriver.com>
	<573B38A0.9020806@windriver.com>
MIME-Version: 1.0
In-Reply-To: <573B38A0.9020806@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: koen.kooi@linaro.org
Subject: Re: [PATCH V6] efivar: fix unknown option while gold linker used
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
X-List-Received-Date: Tue, 17 May 2016 15:35:27 -0000
X-Groupsio-MsgNum: 61521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline

--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 11:28:32PM +0800, Hongxu Jia wrote:
> Ping Martin,
>=20
> Could you apply the V6? It should be ok with gold linker

I think it's already in master-next and will be merged after next round
of world builds.

> //Hongxu
>=20
> On 05/11/2016 09:39 AM, Hongxu Jia wrote:
> > - Use '-fPIC' to replace 'PIC';
> >
> > - Use 'pie' to replace 'PIE'
> >
> > - Remove unknown '--add-needed'
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   .../0004-fix-unknow-option-for-gold-linker.patch   | 38 +++++++++++++=
+++++++++
> >   meta-oe/recipes-extended/efivar/efivar_0.23.bb     |  1 +
> >   2 files changed, 39 insertions(+)
> >   create mode 100644 meta-oe/recipes-extended/efivar/efivar/0004-fix-un=
know-option-for-gold-linker.patch
> >
> > diff --git a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-opt=
ion-for-gold-linker.patch b/meta-oe/recipes-extended/efivar/efivar/0004-fix=
-unknow-option-for-gold-linker.patch
> > new file mode 100644
> > index 0000000..5d50c19
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for=
-gold-linker.patch
> > @@ -0,0 +1,38 @@
> > +From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17 00:00:00 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Tue, 10 May 2016 11:34:50 -0400
> > +Subject: [PATCH]  fix unknow option for gold linker
> > +
> > +- Revert the following patch, since oe-core work with gcc 5
> > +...
> > +commit 3055a3797f16693dfdd855fa68bc57fd900dc408
> > +Author: Peter Jones <pjones@redhat.com>
> > +Date:   Mon Feb 15 14:15:40 2016 -0500
> > +
> > +    Make gcc.specs work with gcc 6 / binutils 2.26
> > +
> > +    Apparently binutils 2.26 gets real picky about "ld -PIC" vs "ld -f=
PIC".
> > +
> > +    Signed-off-by: Peter Jones <pjones@redhat.com>
> > +...
> > +
> > +- Remove unknown option '--add-needed'
> > +
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + gcc.specs | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc.specs b/gcc.specs
> > +index 24fabc2..5b0fdef 100644
> > +--- a/gcc.specs
> > ++++ b/gcc.specs
> > +@@ -14,4 +14,4 @@
> > + + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -W=
l,-static -static -Wl,-z,relro,-z,now}
> > +
> > + *link:
> > +-+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib=
-undefined --add-needed -z now --build-id %{!static:%{!shared:-PIE}} %{shar=
ed:-z relro -PIC} %{static:%<pie}
> > +++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib=
-undefined -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro -=
fPIC} %{static:%<pie}
> > +--
> > +2.8.1
> > +
> > diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/r=
ecipes-extended/efivar/efivar_0.23.bb
> > index 9c47461..6e9a51f 100644
> > --- a/meta-oe/recipes-extended/efivar/efivar_0.23.bb
> > +++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
> > @@ -12,6 +12,7 @@ SRC_URI =3D "git://github.com/rhinstaller/efivar.git"
> >   SRC_URI_append_class-target =3D " file://0001-efivar-fix-for-cross-co=
mpile.patch \
> >                                   file://0002-disable-static-build.patc=
h \
> >                                   file://0003-efivar-fix-for-cross-comp=
ile.patch \
> > +                                file://0004-fix-unknow-option-for-gold=
-linker.patch \
> >                                 "
> >  =20
> >   S =3D "${WORKDIR}/git"
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc7Ok4ACgkQN1Ujt2V2gBzeIACgkHS4PUFHZX6ArASO6Z+JW6F6
+zMAnjVuPBu4dN44yvSVaWp59WY1jaHo
=Cmec
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
