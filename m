Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anandb@ti.com>) id 1QTDQ6-0003I1-0c
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 15:31:10 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p55DRp6V029112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jun 2011 08:27:53 -0500
Received: from dbde71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id p55DRosd020550
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jun 2011 18:57:50 +0530 (IST)
Received: from dbde02.ent.ti.com ([172.24.170.145]) by dbde71.ent.ti.com
	([172.24.170.149]) with mapi; Sun, 5 Jun 2011 18:57:50 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 5 Jun 2011 18:57:48 +0530
Thread-Topic: [PATCH] libgles-omap3: Specify the Window System to be updated
	in powervr.ini
Thread-Index: AcwhJWWUqVsnIR8ASRGBSe2lGR1TgQCXkG4Q
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B0375258FF3@dbde02.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] libgles-omap3: Specify the Window System to be updated in powervr.ini
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
X-List-Received-Date: Sun, 05 Jun 2011 13:31:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can we include this patch in OpenEmbedded? This patch makes it easier for d=
istro providers to customize the window system according to their needs.

Regards,
Anand

-----Original Message-----
From: Balagopalakrishnan, Anand=20
Sent: Thursday, June 02, 2011 6:33 PM
To: 'openembedded-devel@lists.openembedded.org'
Subject: [PATCH] libgles-omap3: Specify the Window System to be updated in =
powervr.ini

From a5a2d6f4356db3a8be1c7cb536d78af834aa60f9 Mon Sep 17 00:00:00 2001
From: Anand Balagopalakrishnan <anandb@ti.com>
Date: Thu, 26 May 2011 21:11:50 +0530
Subject: [PATCH] libgles-omap3: Specify the Window System to be updated in =
powervr.ini

* SGX driver looks at /etc/powervr.ini for the Window System to be used.
  This patch introduces a variable to specify which Window System should
  be specified in powervr.ini file.
* By having this variable, it's easy to override the default Window System
  through a config file or amendment

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 recipes/powervr-drivers/libgles-omap3.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-dr=
ivers/libgles-omap3.inc
index db7681d..36c311d 100644
--- a/recipes/powervr-drivers/libgles-omap3.inc
+++ b/recipes/powervr-drivers/libgles-omap3.inc
@@ -28,6 +28,8 @@ ES3LOCATION ?=3D "${S}/gfx_rel_es3.x"
 ES5LOCATION ?=3D "${S}/gfx_rel_es5.x"
 ES6LOCATION ?=3D "${S}/gfx_rel_es6.x"
=20
+LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_FRONTWSEGL.so.1"
+
 do_configure() {
 	# Attempt to fix up the worst offenders for file permissions
 	for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c") $(find ${S} -n=
ame "Make*") ; do
@@ -152,7 +154,7 @@ do_install () {
=20
 	install -d ${D}${sysconfdir}
 	echo "[default]" > ${D}${sysconfdir}/powervr.ini
-	echo "WindowSystem=3DlibpvrPVR2D_FRONTWSEGL.so.1" >> ${D}${sysconfdir}/po=
wervr.ini
+	echo "WindowSystem=3D${LIBGLESWINDOWSYSTEM}" >> ${D}${sysconfdir}/powervr=
.ini
=20
 	# The ES2.x, ES3.x, ES5.x and ES6.x CPUs have different SGX hardware, so =
we need to install multiple sets of userspace
=20
--=20
1.7.4.1



