Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1B275D22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 19:49:03 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fi15so1488630pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=712/2epdYfUGvvUNgsPPWRttRMz78H44/Xa+YFEg0C0=;
	b=YValPNeSEFAgOEFww86ygrnGTaylQezG24uoXJg+nwYafPr/+jyuy+TZcb4Mmsywsc
	salUIZoocZTAjC0M5f+0SfOMN/y1WQZaxCaaCrNcXR+C64/TbUfWHPqFD3iRHf2P7UaB
	RX9e8ZaWtZe2zyEAIAtZK4tD9I6RTsTkWrEfYWQugKatJ6bs4Y22hxg82IoI1AVJCXKc
	2KW7ycA7b18jhzGT8ENc3B5VRHUEfq2jU/1C+siMIZmiNzBnU5EkWa5mcRFPguSrSXW+
	pX5ycoNsmW0ZhDDivhrJPhluNq96C1yis9dPogN/mixPiC78/MZyFMNIc4pGeVwhrEqE
	yWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=712/2epdYfUGvvUNgsPPWRttRMz78H44/Xa+YFEg0C0=;
	b=VwFMXMjcW0c27id15mfhVRhpcMP/D8cxPXSeVntgjQEjgFqa43NgEY6i6JPb4R4Gjy
	8lZn90/GhF6jBipK0y7W/s0tYFA8PyF8Ei4+wSfdLJZAEBOdc4aBSAVfyo/kOB4mxwf6
	44O3/j7xHfumKIXIIODaUeG3lWjOBEjy1D3xjVYxywsRu6WVH2vjTKKP95t7W7NwCvyp
	/BCnXd3KWFHBXxffPJ6IMxr5GlfEnhiei5g+zYx7RV1F6dgSD4Jzoa+SntoEIhxfHE3X
	+OkXi0i2DTKjnV6xrNuPXiwxyR86se/HK8VEnUbdJpWQ8gCbO39qDG3IVI/GPNAhitQ7
	x7Jw==
X-Gm-Message-State: AEkoouseySPJgr0r7VNFOILPM6+sDlYGbt636wO28bXMZynlRFDXKjb54l+v4JYXlTyrIA==
X-Received: by 10.66.171.197 with SMTP id aw5mr20303524pac.36.1470944944101;
	Thu, 11 Aug 2016 12:49:04 -0700 (PDT)
Received: from [192.168.0.5] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id d3sm7238609pfk.37.2016.08.11.12.49.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 12:49:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <bef7bc37-7691-5631-d232-80ffc0e29e26@smile.fr>
Date: Thu, 11 Aug 2016 12:49:50 -0700
Message-Id: <7B2B61C7-6834-4047-AD4A-A87793FD7A35@gmail.com>
References: <bef7bc37-7691-5631-d232-80ffc0e29e26@smile.fr>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [Jethro] Can't compile gcc-cross when gcc-6 is the host compiler
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
X-List-Received-Date: Thu, 11 Aug 2016 19:49:04 -0000
X-Groupsio-MsgNum: 62566
Content-Type: multipart/signed;
	boundary="Apple-Mail=_83F8E012-4FFC-490E-9CB7-33EE56116E6A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_83F8E012-4FFC-490E-9CB7-33EE56116E6A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 11, 2016, at 5:40 AM, J=C3=A9r=C3=A9my Rosen =
<jeremy.rosen@smile.fr> wrote:
>=20
> Hello everybody
>=20
> I am working on a jethro-based project on my Debian/testing machine, =
and debian just migrated it's default gcc from gcc-5 to gcc-6
>=20
> As expected, this caused all sort of errors in my build, starting by =
pkgconfig-native not being compilable anymore (new gcc warnings coupled =
with -Werror)
>=20
>=20
> That's OK. I don't expect jethro to support future compilers out of =
the box so I installed gcc-5 in parallel to gcc-6 while keeping gcc-6 as =
the default compiler.
>=20
> I then set the following variables in local.conf
>=20
> #gcc-5
> export BUILD_CC =3D "${CCACHE}${BUILD_PREFIX}gcc-5 ${BUILD_CC_ARCH}"
> export BUILD_CXX =3D "${CCACHE}${BUILD_PREFIX}g++-5 ${BUILD_CC_ARCH}"
> export BUILD_FC =3D "${CCACHE}${BUILD_PREFIX}gfortran-5 =
${BUILD_CC_ARCH}"
> export BUILD_CPP =3D "${BUILD_PREFIX}gcc-5 ${BUILD_CC_ARCH} -E"
> export BUILD_LD =3D "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
> export BUILD_CCLD =3D "${BUILD_PREFIX}gcc-5 ${BUILD_CC_ARCH}"
> export BUILD_AR =3D "${BUILD_PREFIX}gcc-ar-5"
> export BUILD_AS =3D "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
> export BUILD_RANLIB =3D "${BUILD_PREFIX}gcc-ranlib-5"
> export BUILD_STRIP =3D "${BUILD_PREFIX}strip"
> export BUILD_NM =3D "${BUILD_PREFIX}gcc-nm-5"
>=20
> This helped, and allowed me to go much further in my build, but the =
recipe gcc-cross-arm still failed. To be able to compile my build I had =
to add the following to my local.conf
>=20
> CC_pn-gcc-cross-arm=3D "${BUILD_CC}"
> CXX_pn-gcc-cross-arm=3D "${BUILD_CXX}"
> CC_pn-gcc-crosssdk-x86_64=3D "${BUILD_CC}"
> CXX_pn-gcc-crosssdk-x86_64=3D "${BUILD_CXX}"
>=20
>=20
> So apparently, gcc still has some reference to $CC and $CXX hardcoded =
somewhere (I think it's in do_configure)
>=20
> It seems to set $CC in the do_compile correctly, but not in =
do_configure. And it never sets $CXX
>=20
> I tried to understand what the GCC recipe was doing wrong, but I =
couldn't find out on first look and it's a really complicated recipe
>=20
>=20
> I hope this is enough clues to allow someone more knowledgeable to =
create a proper fix=E2=80=A6


Just change the default gcc to gcc5 on your host. The host packages do =
not isolate compiler as well as target packages.

--Apple-Mail=_83F8E012-4FFC-490E-9CB7-33EE56116E6A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAles1t4ACgkQuwUzVZGdMxTcOwCfVk71mFHaSiX//AWcp4Q7cmDU
OjIAn3imsPTE6GjUkYnSZwtL6JKIo744
=wV6N
-----END PGP SIGNATURE-----

--Apple-Mail=_83F8E012-4FFC-490E-9CB7-33EE56116E6A--
