Return-Path: <aaron.chun.yew.chan@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id DD9307D5C3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2019 06:17:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2019 23:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,285,1559545200"; d="scan'208";a="159315328"
Received: from kmsmsx153.gar.corp.intel.com ([172.21.73.88])
	by orsmga007.jf.intel.com with ESMTP; 19 Jul 2019 23:17:15 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.4]) by
	KMSMSX153.gar.corp.intel.com ([169.254.5.152]) with mapi id
	14.03.0439.000; Sat, 20 Jul 2019 14:07:43 +0800
From: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [meta-python][PATCH v2] python3-pyatspi: Add Dbus ATSPI recipe
Thread-Index: AQHVPsEK4NxBpe6OrkKmwhkD8w3bU6bTBMDw
Date: Sat, 20 Jul 2019 06:07:43 +0000
Message-ID: <AA9B40170ABA1047B45E714CB2B866B706BC069D@PGSMSX103.gar.corp.intel.com>
References: <1563602668-35526-1-git-send-email-andromeda@intel.com>
In-Reply-To: <1563602668-35526-1-git-send-email-andromeda@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmRmYzFjNDktNzM2MC00NzQwLWJmYmQtNGQ5ZGM0NDU2ZmZhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQ0V0M0JzbmJEcXFrVkpQTkhQeXNiT1B1YWhuS21Hd3V1ckdWTVR1b1A0V000SnZhdUEwMjV1bmRKbU5qYVdDbSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: [meta-python][PATCH v2] python3-pyatspi: Add Dbus ATSPI recipe
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
X-List-Received-Date: Sat, 20 Jul 2019 06:17:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Aaron Chan <aaron.chun.yew.chan@intel.com>

pyatspi provide python3 support for Assistive Technology Service Provide In=
terface (AT-SPI2) protocol over Dbus.

This is useful not only for Accessibility (a11y) but also provides a medium=
 for automation of GUI testing (such as python3-dogtail).

Signed-off-by: Aaron Chan <aaron.chun.yew.chan@intel.com>
---
 .../recipes-devtools/python/python3-pyatspi_2.32.1.bb    | 16 ++++++++++++=
++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyatspi_2.3=
2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb =
b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
new file mode 100644
index 0000000..6d80c10
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Python bindings for DBus AT-SPI2 accessibility"
+DESCRIPTION =3D "AT-SPI2 is a protocol over DBus, toolkit widgets use to p=
rovide content to screen readers such as Orca"
+SECTION =3D "devel/python"
+HOMEPAGE =3D "https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9f288ba982d60518f375b589828388=
6 \
+                    file://COPYING.GPL;md5=3D751419260aa954499f7abaabaa882=
bbe"
+DEPENDS =3D "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ pytho=
n3-pygobject"
+
+SRC_URI =3D "git://github.com/GNOME/pyatspi2.git;protocol=3Dhttps;branch=
=3Dgnome-3-32"
+SRCREV =3D "dc4565208fca00da06b972915a080ad3c63f640d"
+S =3D "${WORKDIR}/git"=20
+
+inherit pkgconfig autotools python3native
+
+FILES_${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}/pyatspi/*"
--
2.7.4


