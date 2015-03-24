Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 589FF60034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 20:54:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Mar 2015 13:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,460,1422950400"; d="scan'208";a="685032264"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2015 13:54:06 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 24 Mar 2015 13:54:06 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
	ORSMSX112.amr.corp.intel.com (10.22.240.13) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 24 Mar 2015 13:54:05 -0700
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.172]) by
	FMSMSX119.amr.corp.intel.com ([10.18.124.207]) with mapi id
	14.03.0195.001; Tue, 24 Mar 2015 13:54:05 -0700
From: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][dylan][PATCH] opencv: Update SRC_URI to use git
Thread-Index: AQHQWr7Sxjsn+Db/x0KJlRKyMSYTq50sHN2g
Date: Tue, 24 Mar 2015 20:54:05 +0000
Message-ID: <6741EAAB26B57F4995668065CB62D86B490E37D7@fmsmsx116.amr.corp.intel.com>
References: <1425942761-8314-1-git-send-email-krzysztof.m.sywula@intel.com>
In-Reply-To: <1425942761-8314-1-git-send-email-krzysztof.m.sywula@intel.com>
Accept-Language: en-GB, pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][dylan][PATCH] opencv: Update SRC_URI to use git
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
X-List-Received-Date: Tue, 24 Mar 2015 20:54:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys, will this patch be applied? OpenCV download URI is broken on Dylan=
 otherwise.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Krzysztof Sywula
Sent: Monday, March 09, 2015 4:13 PM
To: openembedded-devel@lists.openembedded.org
Cc: koen@dominion.thruhere.net
Subject: [oe] [meta-oe][dylan][PATCH] opencv: Update SRC_URI to use git

From: Khem Raj <raj.khem@gmail.com>

opencv now has moved to using git. Lets use the git version to fetch SRCs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{opencv-samples_2.4.3.bb =3D> opencv-samples_2.4.bb}     |   12 +++++-=
------
 .../opencv/{opencv_2.4.3.bb =3D> opencv_2.4.bb}              |   10 ++++--=
----
 2 files changed, 9 insertions(+), 13 deletions(-)  rename meta-oe/recipes-=
support/opencv/{opencv-samples_2.4.3.bb =3D> opencv-samples_2.4.bb} (82%)  =
rename meta-oe/recipes-support/opencv/{opencv_2.4.3.bb =3D> opencv_2.4.bb} =
(91%)

diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb b/meta-=
oe/recipes-support/opencv/opencv-samples_2.4.bb
similarity index 82%
rename from meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
rename to meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
index 50efd77..e00a5e6 100644
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
@@ -7,14 +7,12 @@ DEPENDS =3D "opencv"
=20
 LIC_FILES_CHKSUM =3D "file://include/opencv2/opencv.hpp;endline=3D41;md5=
=3D6d690d8488a6fca7a2c192932466bb14 \  "
+SRCREV =3D "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
+SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
+          "
+PV =3D "2.4.3+git${SRCPV}"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-=
${PV}.tar.bz2 \ -"
-
-SRC_URI[md5sum] =3D "c0a5af4ff9d0d540684c0bf00ef35dbe"
-SRC_URI[sha256sum] =3D "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b0352=
33f58146f6f59b"
-
-S =3D "${WORKDIR}/OpenCV-${PV}"
+S =3D "${WORKDIR}/git"
=20
 do_install() {
     cd samples/c
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/recip=
es-support/opencv/opencv_2.4.bb
similarity index 91%
rename from meta-oe/recipes-support/opencv/opencv_2.4.3.bb
rename to meta-oe/recipes-support/opencv/opencv_2.4.bb
index 39b608a..3ca32f9 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,16 +9,14 @@ ARM_INSTRUCTION_SET =3D "arm"
=20
 DEPENDS =3D "python-numpy v4l-utils libav gtk+ libtool swig swig-native py=
thon jpeg bzip2 zlib libpng tiff glib-2.0"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-=
${PV}.tar.bz2 \
+SRCREV =3D "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
+SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
            file://opencv-fix-pkgconfig-generation.patch \  "
=20
-SRC_URI[md5sum] =3D "c0a5af4ff9d0d540684c0bf00ef35dbe"
-SRC_URI[sha256sum] =3D "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b0352=
33f58146f6f59b"
+PV =3D "2.4.3+git${SRCPV}"
=20
-PR =3D "r2"
-
-S =3D "${WORKDIR}/OpenCV-${PV}"
+S =3D "${WORKDIR}/git"
=20
 # Do an out-of-tree build
 OECMAKE_SOURCEPATH =3D "${S}"
--
1.7.10.4

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

