Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1Qtka5-0001BG-Tk
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 20:11:09 +0200
Received: by wyf19 with SMTP id 19so966044wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 11:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kCjYyZd97u5yLuvv7p3UpVgo3Sb0TvscH3vC/dxl/Ms=;
	b=ufhFUG/CzNUcPHnv/zHOAP2g/yiftptvapj4sW2e03RkodmIxq3wJdQv8JXNyGVjfp
	iOV4mysxAUxQpQ7tvYoDi9VrKoFxsZUINBqHGeD3VzM0EzwFoCj3t5YViZDJFXsqdmHO
	zp6bQySRqsBBVT4PjCNMQkj229GRJatWlEHAg=
Received: by 10.216.80.14 with SMTP id j14mr1400037wee.9.1313604390086;
	Wed, 17 Aug 2011 11:06:30 -0700 (PDT)
Received: from localhost.localdomain (70.pool85-50-85.dynamic.orange.es
	[85.50.85.70])
	by mx.google.com with ESMTPS id b1sm937667wed.34.2011.08.17.11.06.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 11:06:29 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2011 20:06:03 +0200
Message-Id: <1313604363-2973-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-efl] lightmediascanner: Add version 0.4.3.0 (initial recipe)
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
X-List-Received-Date: Wed, 17 Aug 2011 18:11:10 -0000

* Recipe based on recipe v0.4.1.0 from oe.dev (http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/lightmediascanner/lightmediascanner_0.4.1.0.bb?id=99ed67320060c4b9f686328a22f68980c2154c62)

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 .../lightmediascanner/lightmediascanner_0.4.3.0.bb |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.3.0.bb

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.3.0.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.3.0.bb
new file mode 100644
index 0000000..7c71d4a
--- /dev/null
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.3.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
+AUTHOR = "ProFUSION"
+HOMEPAGE = "http://lms.garage.maemo.org/"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+DEPENDS = "sqlite3 flac"
+
+PR = "r1"
+
+SRC_URI = "https://garage.maemo.org/frs/download.php/9439/lightmediascanner-${PV}.tar.bz2"
+SRC_URI[md5sum] = "188ff5188cfa0f2504a42934c969cb77"
+SRC_URI[sha256sum] = "bdbe76655ad212b936fb3cf6a9ca725e318ddeb57cd7d950d9c8409297d3b0da"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    install -d ${D}/${bindir}/
+    install -m 755 ${WORKDIR}/${PN}-${PV}/src/bin/.libs/test  ${D}/${bindir}/test-lms
+}
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/test-lms"
+
+FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
-- 
1.7.6



