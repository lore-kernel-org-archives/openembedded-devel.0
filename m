Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.48200.1598857639315261832
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=HqWXQtrH;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=505975d9f=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1598857639; x=1630393639;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ij3TBHvmlc3+IGRRIgyyuVigQ3N89Z8vDW2M7FoI4zA=;
  b=HqWXQtrHge/wMzAOTlHRc3rB9HNT1zbJvd6DGdaduD2akQJ60EyVHh/W
   djDvMueWQlLFUgJg20VWN2vh+idScn7VjCRBM2JyasAt5OnAGlAaN+Ulo
   ABVy1Cj8YWT+5xxCIYgsFScVfvcOpxQi7SKfiKHKeDaWq3F90aPqlFB6m
   A=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 31 Aug 2020 09:07:16 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw6.muc with ESMTP/TLS;
 31 Aug 2020 09:07:16 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp) ([160.48.96.46])
 by esabb4.muc with ESMTP/TLS; 31 Aug 2020 09:07:16 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10j.europe.bmw.corp
 (160.48.96.46) with Microsoft SMTP Server (TLS;
 Mon, 31 Aug 2020 09:07:16 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Mon,
 31 Aug 2020 09:07:16 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <raj.khem@gmail.com>
CC: <martin.jansa@gmail.com>, <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] nss: Upgrade to 3.56
Thread-Topic: [oe] [meta-oe][PATCH v2] nss: Upgrade to 3.56
Thread-Index: AQHWfN+MvXpmlv6bSUCVz34BTLqvLKlNd+8AgAAIhYCAAB6fgIAEEFIA
Date: Mon, 31 Aug 2020 07:07:16 +0000
Message-ID: <20200831070706.GA2162@korppu>
References: <20200828020411.1988431-1-raj.khem@gmail.com>
 <eca6954a-0a7d-8990-70ab-2b141c53ce69@gmail.com>
 <CA+chaQcn6Ep4YRRJDaXLbdRoTA791VzEsqBb29yWj_GT6K6U1g@mail.gmail.com>
 <1460d060-bcec-4e42-d34a-0d3d336e96ef@gmail.com>
In-Reply-To: <1460d060-bcec-4e42-d34a-0d3d336e96ef@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <030CF16F36C21C49B9FDC02CC590E9EB@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2020 at 10:03:39AM -0700, Khem Raj wrote:
>=20
>=20
> On 8/28/20 8:14 AM, Martin Jansa wrote:
> > I'm seeing this postinst issue already without Khem's nss changes, I
> > guess it is caused by:
> > 31552510b1 nss: fix postinst script for nativesdk build
> >=20
>=20
> seems so. Although my upgrade patch had compile issues during build whic=
h
> are fixed now.
>=20
> perhaps we should revert 31552510b1 unless there is a better fix Mikko a=
ny
> ideas ?

I'm catching up on emails but checking this now.

-Mikko

> > On Fri, Aug 28, 2020 at 4:43 PM akuster <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >=20
> >=20
> >=20
> >     On 8/27/20 7:04 PM, Khem Raj wrote:
> >      > Forward port
> >     0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> >      >
> >      > Signed-off-by: Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>>
> >      > ---
> >      > v2: Update armv8 hw crypto patch to work on arm32
> >=20
> >     Did you add this to an image?
> >=20
> >     I am seeing new error when nss is appended to an image.
> >=20
> >     WARNING: security-build-image-1.0-r0 do_rootfs: nss.postinst
> >     returned 127, marking as unpacked only, configuration required on
> >     target.
> >     2020-08-28 02:07:33 - ERROR=A0 =A0 - ERROR: security-build-image-1=
.0-r0
> >     do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the
> >     intention is to defer them to first boot,
> >     2020-08-28 02:07:33 - ERROR=A0 =A0 - then please place them into
> >     pkg_postinst_ontarget_${PN} ().
> >     2020-08-28 02:07:33 - ERROR=A0 =A0 - Deferring to first boot via '=
exit
> >     1' is no longer supported.
> >=20
> >     - Armin
> >=20
> >      >
> >      >=A0 ...figure-option-to-disable-ARM-HW-cryp.patch | 32
> >     ++++++-------------
> >      >=A0 .../nss/{nss_3.54.bb <http://nss_3.54.bb> =3D> nss_3.56.bb
> >     <http://nss_3.56.bb>}=A0 =A0 =A0 =A0 =A0 |=A0 3 +-
> >      >=A0 2 files changed, 11 insertions(+), 24 deletions(-)
> >      >=A0 rename meta-oe/recipes-support/nss/{nss_3.54.bb
> >     <http://nss_3.54.bb> =3D> nss_3.56.bb <http://nss_3.56.bb>} (99%)
> >      >
> >      > diff --git
> >     a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-opti=
on-to-disable-ARM-HW-cryp.patch
> >     b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-opti=
on-to-disable-ARM-HW-cryp.patch
> >      > index 1a87a0577f..f1f76bd1b7 100644
> >      > ---
> >     a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-opti=
on-to-disable-ARM-HW-cryp.patch
> >      > +++
> >     b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-opti=
on-to-disable-ARM-HW-cryp.patch
> >      > @@ -14,21 +14,18 @@ Signed-off-by: Alexander Kanavin
> >     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>
> >      >=A0 =A0nss/lib/freebl/gcm.c=A0 =A0 | 2 ++
> >      >=A0 =A02 files changed, 6 insertions(+)
> >      >
> >      > -diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> >      > -index f99f769..b0ec81b 100644
> >      >=A0 --- a/nss/lib/freebl/Makefile
> >      >=A0 +++ b/nss/lib/freebl/Makefile
> >      > -@@ -125,6 +125,9 @@ else
> >      > -=A0 =A0 =A0 =A0 =A0DEFINES +=3D -DNSS_X86
> >      > +@@ -126,6 +126,8 @@ else
> >      >=A0 =A0endif
> >      >=A0 =A0endif
> >      > -+
> >      > + ifdef NS_USE_GCC
> >      >=A0 +ifdef NSS_USE_ARM_HW_CRYPTO
> >      >=A0 +=A0 =A0 DEFINES +=3D -DNSS_USE_ARM_HW_CRYPTO
> >      >=A0 =A0ifeq ($(CPU_ARCH),aarch64)
> >      > -=A0 =A0 =A0DEFINES +=3D -DUSE_HW_AES -DUSE_HW_SHA2
> >      > -=A0 =A0 =A0EXTRA_SRCS +=3D aes-armv8.c gcm-aarch64.c sha256-ar=
mv8.c
> >      > -@@ -148,6 +151,7 @@ endif
> >      > +=A0 =A0 =A0DEFINES +=3D -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SH=
A2
> >      > +=A0 =A0 =A0EXTRA_SRCS +=3D aes-armv8.c gcm-aarch64.c sha1-armv=
8.c
> >     sha256-armv8.c
> >      > +@@ -150,6 +152,7 @@ endif
> >      >=A0 =A0 =A0 =A0 =A0 =A0endif
> >      >=A0 =A0 =A0 =A0endif
> >      >=A0 =A0endif
> >      > @@ -36,23 +33,14 @@ index f99f769..b0ec81b 100644
> >      >
> >      >=A0 =A0ifeq ($(OS_TARGET),OSF1)
> >      >=A0 =A0 =A0 =A0DEFINES +=3D -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WO=
RD
> >      > -diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
> >      > -index c2cc18d..b77f573 100644
> >      >=A0 --- a/nss/lib/freebl/gcm.c
> >      >=A0 +++ b/nss/lib/freebl/gcm.c
> >      > -@@ -18,6 +18,7 @@
> >      > +@@ -20,7 +20,7 @@
> >      >
> >      > - #include <limits.h>
> >      > -
> >      > -+#ifdef NSS_USE_ARM_HW_CRYPTO
> >      >=A0 =A0/* old gcc doesn't support some poly64x2_t intrinsic */
> >      >=A0 =A0#if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && =
\
> >      > -=A0 =A0 =A0(defined(__clang__) || defined(__GNUC__) && __GNUC_=
_ > 6)
> >      > -@@ -27,6 +28,7 @@
> >      > - /* We don't test on big endian platform, so disable this on b=
ig
> >     endian. */
> >      > +-=A0 =A0 (defined(__clang__) || defined(__GNUC__) && __GNUC__ =
> 6)
> >      > ++=A0 =A0 (defined(__clang__) && defined(NSS_USE_ARM_HW_CRYPTO)=
 ||
> >     defined(__GNUC__) && __GNUC__ > 6)
> >      >=A0 =A0#define USE_ARM_GCM
> >      > - #endif
> >      > -+#endif
> >      > -
> >      > - /* Forward declarations */
> >      > - SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
> >      > + #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
> >      > +=A0 =A0 =A0!defined(NSS_DISABLE_ARM32_NEON)
> >      > diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb
> >     <http://nss_3.54.bb> b/meta-oe/recipes-support/nss/nss_3.56.bb
> >     <http://nss_3.56.bb>
> >      > similarity index 99%
> >      > rename from meta-oe/recipes-support/nss/nss_3.54.bb
> >     <http://nss_3.54.bb>
> >      > rename to meta-oe/recipes-support/nss/nss_3.56.bb
> >     <http://nss_3.56.bb>
> >      > index 1cc94735bb..4aa5d29ec2 100644
> >      > --- a/meta-oe/recipes-support/nss/nss_3.54.bb <http://nss_3.54.=
bb>
> >      > +++ b/meta-oe/recipes-support/nss/nss_3.56.bb <http://nss_3.56.=
bb>
> >      > @@ -34,8 +34,7 @@ SRC_URI =3D
> >     "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VE=
RSIO
> >     <http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$%7B=
VERSIO>
> >      >
> > =A0file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.pa=
tch
> > \
> >      >
> > =A0file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
> >      >=A0 =A0 =A0 =A0 =A0 =A0 =A0"
> >      > -
> >      > -SRC_URI[sha256sum] =3D
> >     "dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43"
> >      > +SRC_URI[sha256sum] =3D
> >     "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
> >      >
> >      >=A0 UPSTREAM_CHECK_URI =3D
> >     "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS=
_Releases"
> >      >=A0 UPSTREAM_CHECK_REGEX =3D "NSS_(?P<pver>.+)_release_notes"
> >      >
> >      >
> >=20
> >    =20
> >
