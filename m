Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SNKLr-00085o-KB
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 10:46:59 +0200
Received: by lbjn8 with SMTP id n8so743017lbj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=piJEA2QMoVkko7hhnshko+RL4FIc7CY+mw4dg9KnqBs=;
	b=J8U76UhcMwwTDx1DjHBZ4UZeaCy9qz87cqQ+lBJD9VcDP83EedotKE95grefTc9Euc
	I3sVH9guvUuvpe2Kih1q61X1TM2/QdnWF9XOs1HBQUFWMxwkwrAs8ktdsN7r4+UFdsAm
	IseKRS7s4TcCd+NAPRsUgypbfJSC9FWScjUeIlTfcmx/03vPejbzS9VEFwM7WCepQUM7
	D8j5rWGmCiNLHTtEZ0sFCahWCvwxEd+aWVFPizGOmPaBLXz4EoUTNoTJPD/z4lDFfDjH
	cX5aoS5W+16kR9sSJWoZ7FSKciYtx3eBd/obobsS1CCbEK9/iqYD31RVO0Yif9keNjGK
	5HYg==
Received: by 10.112.38.36 with SMTP id d4mr2862171lbk.72.1335429442470;
	Thu, 26 Apr 2012 01:37:22 -0700 (PDT)
Received: from arpc01.inne.proxdynamics.com ([84.49.231.147])
	by mx.google.com with ESMTPS id oi3sm2394428lab.12.2012.04.26.01.37.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 01:37:21 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 22:35:44 +0200
Message-Id: <1335472546-9653-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Recipe for Synergy 1.3.8
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
X-List-Received-Date: Thu, 26 Apr 2012 08:46:59 -0000


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy_1.3.8.bb

diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
new file mode 100644
index 0000000..83d8983
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Synergy - control multiple computers with one keyboard and mouse"
+HOMEPAGE = "http://synergy.googlecode.com"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
+LICENSE = "GPLv2"
+SECTION = "x11/utils"
+
+DEPENDS = "libx11 libxtst"
+PR = "r0"
+
+SRC_URI = "http://synergy.googlecode.com/files/synergy-1.3.8-Source.tar.gz"
+
+S = "${WORKDIR}/${PN}-${PV}-Source"
+
+inherit cmake siteinfo
+
+do_install() {
+	install -d ${D}/usr/bin
+	cp ${S}/bin/synergy* ${D}/usr/bin/
+}
+
+SRC_URI[md5sum] = "3534c65ecfa6e47d7899c57975442f03"
+SRC_URI[sha256sum] = "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da05110943edbfacc03"
-- 
1.7.9.5



