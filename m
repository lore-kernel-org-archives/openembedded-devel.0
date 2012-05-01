Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SOjih-00031m-9l
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:04:23 +0200
Received: by lbbgo4 with SMTP id go4so1618065lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 22:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=up/7PMHxZQ8w6SfsBKmZ+IIkywz8MUZSDLgaRBkV/T0=;
	b=ZSmDr/l05NKbmTdJLsAS9t6CacwDqlEuAI0dc1KrvkLvadmMBA4NZQSMmg6vXnhDL4
	gVPFLiCuqv/4NCtqkapMBLf6vX1qt/O7QimhlZPKFKkuh61mz6PgFre73vlDREpBg8bf
	KTCf2UQZxNaNnkcPy5F5Uha+ZVMTBg1hnSw6ne8HBSwph5WG7yqBpFqy4N/QVt5s39LR
	lvF/95OBgTr32c/QtB/MQxS6PiLj33EqEZC0lkoSzpt5/CJW38gJHuLr3uacF9u1gGRC
	SLlh+d928tefo6Dxx+V1hvmkWA7Au+2G4yc/zOv1TayX8S+c96pX8OVyOOIGS3r+uvby
	KRUQ==
Received: by 10.112.85.200 with SMTP id j8mr9442070lbz.80.1335765281792;
	Sun, 29 Apr 2012 22:54:41 -0700 (PDT)
Received: from arpc01.inne.proxdynamics.com (147.84-49-231.nextgentel.com.
	[84.49.231.147])
	by mx.google.com with ESMTPS id fx5sm19229377lbb.5.2012.04.29.22.54.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 22:54:40 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 May 2012 07:52:54 +0200
Message-Id: <1335851575-20786-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1335481339-4539-1-git-send-email-tasskjapp@gmail.com>
References: <1335481339-4539-1-git-send-email-tasskjapp@gmail.com>
Subject: [meta-oe][PATCH v3] synergy: add synergy 1.3.8
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
X-List-Received-Date: Mon, 30 Apr 2012 06:04:23 -0000


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy_1.3.8.bb

diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
new file mode 100644
index 0000000..b8d1e6c
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Synergy - control multiple computers with one keyboard and mouse"
+HOMEPAGE = "http://synergy.googlecode.com"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
+LICENSE = "GPL-2.0"
+SECTION = "x11/utils"
+
+DEPENDS = "libx11 libxtst"
+
+SRC_URI = "http://synergy.googlecode.com/files/synergy-${PV}-Source.tar.gz"
+
+SRC_URI[md5sum] = "3534c65ecfa6e47d7899c57975442f03"
+SRC_URI[sha256sum] = "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da05110943edbfacc03"
+
+S = "${WORKDIR}/${PN}-${PV}-Source"
+
+inherit cmake
+
+do_install() {
+	install -d ${D}/usr/bin
+	install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
+}
+
-- 
1.7.9.5



