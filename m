Return-Path: <aaron.chun.yew.chan@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Jul 2019 03:34:55 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3356C42C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 03:34:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2019 20:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,280,1559545200"; d="scan'208";a="367557508"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2019 20:27:49 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.4]) by
	PGSMSX101.gar.corp.intel.com ([169.254.1.22]) with mapi id
	14.03.0439.000; Fri, 19 Jul 2019 11:27:48 +0800
From: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH] python3-pyatspi: Add Dbus ATSPI recipe
Thread-Index: AQHVPd7G5ZG6ZGbAqEGJwKSfY+vFSabRR6uw
Date: Fri, 19 Jul 2019 03:27:47 +0000
Message-ID: <AA9B40170ABA1047B45E714CB2B866B706BBFD0D@PGSMSX103.gar.corp.intel.com>
References: <1563505477-77594-1-git-send-email-aaron.chun.yew.chan@intel.com>
In-Reply-To: <1563505477-77594-1-git-send-email-aaron.chun.yew.chan@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjk4Mzc2NTMtNjg5NC00NjcwLWFiODYtY2E2N2M5YWI0YzZjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWFwvWWtLRCtSOERnZGF5ZEcyQldNWW82N3NDdzJWaEJqNW9BcUR6NXFvRjIxM3lLYXAxczFRalNNWlJPRFN6dmgifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-pyatspi: Add Dbus ATSPI recipe
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
X-List-Received-Date: Fri, 19 Jul 2019 03:34:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Aaron Chan <aaron.chun.yew.chan@intel.com>

pyatspi provide python3 support for Assistive Technology Service Provider I=
nterface (AT-SPI2) protocol over Dbus.

This is useful not only for Accessibility (a11y) but also provides a medium=
 for automation of GUI testing (such as with python3-dogtail)

Signed-off-by: Aaron Chan <aaron.chun.yew.chan@intel.com>
---
 .../recipes-devtools/python/python3-pyatspi_2.32.1.bb   | 17 +++++++++++++=
++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyatspi_2.3=
2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb =
b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
new file mode 100644
index 0000000..5899744
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Python bindings for DBus AT-SPI2 accessibility"
+DESCRIPTION =3D "AT-SPI2 is a protocol over DBus, toolkit widgets use to=20
+provide \ content to screen readers such as Orca"
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


