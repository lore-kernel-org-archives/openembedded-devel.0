Return-Path: <jbriance@cisco.com>
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mail.openembedded.org (Postfix) with ESMTP id CA6FC76D6C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=17097; q=dns/txt;
	s=iport; t=1440608472; x=1441818072;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=MJ2OOukeFcuizorqzHB5iQihjgrQJHSFHrRhPUJ02VQ=;
	b=ZQwBe5F9ENCJZ42e6TiO4m0ebMT9pRfHRWD0FhuuL7WWUIt/zvYm/CyY
	lpfOS3QE3pAX9aR146aPoNQopb5ndaVNkeBj6D6SOAZmG6Zti7cpe1sxC
	+M5nROH2OF7tR1jfTOdOdAH+M6BU5uaXcyM2aPZ/COBOljuGwYAuDV9Fy E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0CjAgCW8N1V/5RdJa1dgxtUaQaqP5MoAQmBdIV/AoE8OBQBAQEBAQEBfwuEJAEBBDo/EAIBKhQQMiUCBA4FCIgmyQoBAQEBAQEBAQEBAQEBAQEBAQEBAQEXkDQxB4MYgRQFlTkBhQWJNpBgiDQmghAbgVRxgUiBBQEBAQ
X-IronPort-AV: E=Sophos;i="5.17,417,1437436800"; d="scan'208";a="21821024"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
	by rcdn-iport-9.cisco.com with ESMTP; 26 Aug 2015 17:01:10 +0000
Received: from XCH-RCD-015.cisco.com (xch-rcd-015.cisco.com [173.37.102.25])
	by rcdn-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id t7QH1AcQ016903
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 17:01:10 GMT
Received: from xch-rcd-015.cisco.com (173.37.102.25) by XCH-RCD-015.cisco.com
	(173.37.102.25) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Wed, 26 Aug 2015 12:01:09 -0500
Received: from xhc-rcd-x15.cisco.com (173.37.183.89) by xch-rcd-015.cisco.com
	(173.37.102.25) with Microsoft SMTP Server (TLS) id 15.0.1104.5 via
	Frontend Transport; Wed, 26 Aug 2015 12:01:09 -0500
Received: from xmb-aln-x12.cisco.com ([169.254.7.226]) by
	xhc-rcd-x15.cisco.com ([173.37.183.89]) with mapi id 14.03.0248.002;
	Wed, 26 Aug 2015 12:01:09 -0500
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH] qt5: Update LGPL-Exception in LICENSE list
Thread-Index: AQHQ4CCWHmE94LxhpkCFIZZuh+f4zJ4egTeA
Date: Wed, 26 Aug 2015 17:01:08 +0000
Message-ID: <5940D1D9F240BA44AEF939055CF1358D05A51A50@xmb-aln-x12.cisco.com>
References: <1440608366-22790-1-git-send-email-jbriance@cisco.com>
In-Reply-To: <1440608366-22790-1-git-send-email-jbriance@cisco.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.62.125]
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt5: Update LGPL-Exception in LICENSE list
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
X-List-Received-Date: Wed, 26 Aug 2015 17:01:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* Since 5.5, Qt modules (except qtimageformats) have moved from "Digia"
  to "The Qt Company" in their LGPL_Exception file
* qtwebkit-examples doesn't include a LGPL Exception file, so remove
  it from LICENSE list

Signed-off-by: Julien Brianceau <jbriance@cisco.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb   | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb      | 2 +-
 recipes-qt/qt5/qtbase_git.bb             | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb     | 2 +-
 recipes-qt/qt5/qtdeclarative_git.bb      | 2 +-
 recipes-qt/qt5/qtenginio_git.bb          | 2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb | 2 +-
 recipes-qt/qt5/qtlocation_git.bb         | 2 +-
 recipes-qt/qt5/qtmultimedia_git.bb       | 2 +-
 recipes-qt/qt5/qtquick1_git.bb           | 4 ++--
 recipes-qt/qt5/qtscript_git.bb           | 4 ++--
 recipes-qt/qt5/qtsensors_git.bb          | 2 +-
 recipes-qt/qt5/qtserialport_git.bb       | 2 +-
 recipes-qt/qt5/qtsvg_git.bb              | 2 +-
 recipes-qt/qt5/qttools_git.bb            | 2 +-
 recipes-qt/qt5/qttranslations_git.bb     | 2 +-
 recipes-qt/qt5/qtwayland-native_git.bb   | 2 +-
 recipes-qt/qt5/qtwayland_git.bb          | 2 +-
 recipes-qt/qt5/qtwebchannel_git.bb       | 2 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb  | 2 +-
 recipes-qt/qt5/qtwebsockets_git.bb       | 2 +-
 recipes-qt/qt5/qtx11extras_git.bb        | 2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb      | 2 +-
 23 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/native=
sdk-qtbase_git.bb
index 320cad6..9fe4554 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -3,7 +3,7 @@ DEPENDS =3D "nativesdk-zlib nativesdk-dbus qtbase-native"
 SECTION =3D "libs"
 HOMEPAGE =3D "http://qt-project.org"
=20
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-na=
tive_git.bb
index ac68f2b..3efcb55 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Native version of Qt/[X11|Mac|Embedded]"
 DEPENDS =3D "zlib-native dbus-native"
 SECTION =3D "libs"
 HOMEPAGE =3D "http://qt-project.org"
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 729c795..44579c6 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnec=
tivity_git.bb
index 0cb724e..4781be1 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0) | GPL-2.0"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclara=
tive_git.bb
index f9689e6..15d176b 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -2,7 +2,7 @@ require qt5.inc
 require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git=
.bb
index f80e42e..0e2a0ce 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LICENSE =3D "BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL=
-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgr=
aphicaleffects_git.bb
index 64c9a10..ef14672 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -3,7 +3,7 @@ require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
 # There are no GPLv2 licensed files in this component.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_g=
it.bb
index b67a956..191dfcf 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0) | GPL-2.0"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimed=
ia_git.bb
index 5c05145..f190b9f 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -2,7 +2,7 @@ require qt5.inc
 require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.b=
b
index 1dcba1e..905fcd9 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -3,8 +3,8 @@ require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
 # There are no GPLv2 licensed files in this component.
-# Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception-1=
.1.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+# Note that some files are LGPL-2.1 only without The-Qt-Company-Qt-LGPL-Ex=
ception-1.1.
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.b=
b
index a54deb8..0a04d15 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -2,8 +2,8 @@ require qt5.inc
 require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
-# Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception-1=
.1.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+# Note that some files are LGPL-2.1 only without The-Qt-Company-Qt-LGPL-Ex=
ception-1.1.
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git=
.bb
index 02688a6..5a01ce0 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -3,7 +3,7 @@ require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
 # There are no GPLv2 licensed files in this component.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialpo=
rt_git.bb
index 5f41974..0f8ec30 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -3,7 +3,7 @@ require qt5-git.inc
=20
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than wh=
at
 # other qt* components use :/
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 6350e97..5fb84ca 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -2,7 +2,7 @@ require qt5.inc
 require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 59f51bd..1c3c9ce 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttransl=
ations_git.bb
index 10ec1aa..d5fda1a 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LICENSE =3D "(LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayl=
and-native_git.bb
index 330473e..1a93284 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -2,7 +2,7 @@ require qt5-native.inc
 require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
-LICENSE =3D "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LICENSE =3D "BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL=
-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git=
.bb
index 361b54a..7484a87 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -2,7 +2,7 @@ require qt5.inc
 require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
-LICENSE =3D "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LICENSE =3D "BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL=
-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchann=
el_git.bb
index 236eb47..923ada8 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -3,7 +3,7 @@ require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
 # There are no GPLv2 licensed files in this component.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtweb=
kit-examples_git.bb
index 62e9612..20202d5 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -3,7 +3,7 @@ require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
 # There are no GPLv2 licensed files in this component.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsocke=
ts_git.bb
index b1e2951..73f95a3 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0=
)"
+LICENSE =3D "GFDL-1.3 & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 |=
 LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras=
_git.bb
index e73feb7..70480df 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0) | GPL-2.0"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatt=
erns_git.bb
index 3c273db..f6a0c41 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -2,7 +2,7 @@ require qt5.inc
 require qt5-git.inc
=20
 # There are no LGPLv3-only licensed files in this component.
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0)"
+LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception=
-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
--=20
1.9.5


