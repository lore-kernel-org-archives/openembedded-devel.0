Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QtYBi-0000oc-2h
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 06:57:10 +0200
Received: by wwe32 with SMTP id 32so456131wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 21:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=oSubpdyyHFEuwet+BOlHsRcUQnF8xUxpVfAd5PaWpug=;
	b=EbEcYB+Kc3YqJ6iJHj3tlAY3V8kF+87WrmDay4lT8AYh7ZeXC5igusnu3dNZavpnss
	aPEuGyADUmIb+UyAZmjCM3o4CXbtIBZbmTVb+GIGYXgh8OgXChtv2ZT/ka/490dZYOgU
	FPmIfZIfndDdgh1Q/hp8Jo8cyPUHGIpcLQk84=
Received: by 10.216.67.134 with SMTP id j6mr430081wed.0.1313556752007;
	Tue, 16 Aug 2011 21:52:32 -0700 (PDT)
Received: from localhost.localdomain (70.pool85-50-85.dynamic.orange.es
	[85.50.85.70])
	by mx.google.com with ESMTPS id p49sm492690weq.31.2011.08.16.21.52.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 21:52:30 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2011 06:51:54 +0200
Message-Id: <1313556715-28652-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 1/2] lightmediascanner: added recipe for v0.4.3
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
X-List-Received-Date: Wed, 17 Aug 2011 04:57:10 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 .../recipes-efl/e17/lightmediascanner_0.4.3.0.bb   |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb

diff --git a/meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb b/meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb
new file mode 100644
index 0000000..dd0b283
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
+SECTION = "libs/multimedia"
+AUTHOR = "Profusion"
+LICENSE = "LGPLv2.1+"
+DEPENDS = "sqlite3 flac"
+SRC_URI = "https://garage.maemo.org/frs/download.php/9439/lightmediascanner-${PV}.tar.bz2"
+
+PE = "1"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    install -d ${D}/${bindir}/
+    install -m 755 ${WORKDIR}/${PN}-${PV}/src/bin/.libs/test  ${D}/${bindir}/test-lms
+}
+
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/test-lms"
+
+FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
+
+SRC_URI[md5sum] = "188ff5188cfa0f2504a42934c969cb77"
+SRC_URI[sha256sum] = "bdbe76655ad212b936fb3cf6a9ca725e318ddeb57cd7d950d9c8409297d3b0da"
+
+
-- 
1.7.6



