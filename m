Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGATI-00069x-Fn
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:16:48 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so923474bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dlzFaGw9lgc5azB5uQIpHN/OK4xJpsVcRv0uZu/3Aj0=;
	b=G8GNUfVf/6sVYxSXxyvHDdNQxyfLBIHB/glCBcFyKDN2tGuP8dqZqods/JTL8BRwf0
	q1qCys/wMePVOrebsB+HQWyoxJLTWmOoHxFDwjeUIVEpwAfAWBOtaqjRPhn2uL8c+/bQ
	5uMIEra2THbBCNPp0dKgazvkZ6L05uUziPuXk=
Received: by 10.204.7.83 with SMTP id c19mr1932021bkc.81.1318947052385;
	Tue, 18 Oct 2011 07:10:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm2307310bkw.5.2011.10.18.07.10.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 07:10:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 16:10:27 +0200
Message-Id: <c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318946821.git.Martin.Jansa@gmail.com>
References: <cover.1318946821.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 18 Oct 2011 14:16:48 -0000

From: pespin <pespin.shar@gmail.com>

* Copied from oe-classic <http://git.openembedded.org/openembedded/commit/?id=63d3969b0f839fc4b7bf7fe836daec729d9d3c53>
* Remove PE=1
* Add LIC_FILES_CHKSUM
* Builds fine using SHR distro
* JaMa: removed PR

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../lightmediascanner/lightmediascanner_0.4.4.bb   |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
new file mode 100644
index 0000000..96f4ba8
--- /dev/null
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
+AUTHOR = "ProFUSION"
+HOMEPAGE = "http://lms.garage.maemo.org/"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+DEPENDS = "sqlite3 flac virtual/libiconv"
+
+SRC_URI = "http://git.profusion.mobi/cgit.cgi/lightmediascanner.git/snapshot/release_${PV}.tar.bz2 \
+"
+SRC_URI[md5sum] = "f423376a70f8f321af69b12563b176fe"
+SRC_URI[sha256sum] = "302a7f6cc355467cd20332f4e02c8b87ba6c0c7a6818a6a987e007aace19b41e"
+
+S = "${WORKDIR}/release_${PV}"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    install -d ${D}/${bindir}/
+    install -m 755 ${S}/src/bin/.libs/test  ${D}/${bindir}/test-lms
+}
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/test-lms"
+
+FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
-- 
1.7.7



