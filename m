Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitap@ti.com>) id 1RPzuS-0002QF-TJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 18:01:29 +0100
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAEGrSu2007285
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 10:53:29 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pAEGrSRV021821
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 10:53:28 -0600 (CST)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAEGrSLM013124
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 10:53:28 -0600 (CST)
Received: from DNCE03.ent.ti.com ([fe80::19cb:d761:16a6:9b51]) by
	DNCE73.ent.ti.com ([fe80::a454:462:d009:b2c%21]) with mapi id
	14.01.0323.003; Mon, 14 Nov 2011 17:53:27 +0100
From: "Preskovsky, Vita" <vitap@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] bluez4: Add version 4.95 - resend
Thread-Index: AQHMou01AJ5W+gbT30+/bj2aIsvJHJWslZEQ
Date: Mon, 14 Nov 2011 16:53:27 +0000
Message-ID: <99AD691F1FA415449470C6EA37B6FE46086140@DNCE03.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: FW: [PATCH] bluez4: Add version 4.95 - resend
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
X-List-Received-Date: Mon, 14 Nov 2011 17:01:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 Second version of the patch adresses comments made by community=20
 members. Checked on angstrom, version 2011.09.
---
 recipes/bluez/bluez4_4.95.bb |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez4_4.95.bb

diff --git a/recipes/bluez/bluez4_4.95.bb b/recipes/bluez/bluez4_4.95.bb
new file mode 100644
index 0000000..290dff6
--- /dev/null
+++ b/recipes/bluez/bluez4_4.95.bb
@@ -0,0 +1,30 @@
+require bluez4.inc
+
+SRC_URI =3D "\
+  ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \
+  file://bluetooth.conf \
+"
+SRC_URI[md5sum] =3D "341294b2849a04a4afff5c96bfbf30b2"
+SRC_URI[sha256sum] =3D "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c0ce6=
bebd27fa4120f6"
+
+DEFAULT_PREFERENCE =3D "-1"
+DEFAULT_PREFERENCE_angstrom =3D "1"
+
+DEPENDS +=3D "libsndfile1"
+
+PR =3D "${INC_PR}.0"
+
+# Not all distros have a recent enough udev
+BTUDEV =3D " --disable-udevrules"
+BTUDEV_angstrom =3D " --enable-udevrules"
+BTUDEV_shr =3D " --enable-udevrules"
+
+EXTRA_OECONF +=3D "${BTUDEV}"
+do_configure_append(){
+	echo "#define LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE" >> ${S}/config=
.h
+}
+
+FILES_${PN}-dbg +=3D "\
+  ${base_libdir}/udev/.debug \
+  ${libdir}/*/.debug \
+"
--=20
1.7.0.4



