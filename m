Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id D2A2072513
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 20:52:14 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so23014045wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=j2rICVNqoN4E4D1uMQaDIBBQe6urnjwMBFBL5qVzLUc=;
	b=jeDsMr67XcTueYNVAR7eDc88Ur/x7vZ5rpyW/jKm7yP8Hz0qhEA1o6nEetrw5Mlqrx
	MIk+iDQHNsSWXP8V8DLVAQwMfkmxQYt2JP6FTTcHJb9gsjVrQJkp/FQQjvjIdhit9Ko4
	dwtbp+ql4y70x0qG+vdg9WN0z9ChKdCktrj/nowT4PIZa6Z1WPOYoH40jQ+25wGAXbcg
	t9pna6MNWtGDFIugBKy3nO/stLd1Zd6GE1syPX6rP+9g3Voqw/m/pnuPo2Ccj4RlRJi6
	cYpTkTaAVBsGOmL2NqUuby6szOFLzwtiUqoPek044RQccheeX/Sl6if1jYnuvnfij6Ei
	t0AA==
X-Received: by 10.180.73.206 with SMTP id n14mr101014725wiv.60.1419886334647; 
	Mon, 29 Dec 2014 12:52:14 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id l9sm40827016wic.21.2014.12.29.12.52.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Dec 2014 12:52:12 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Dec 2014 13:50:17 -0700
Message-Id: <1419886217-19360-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] rng-tools: obey the sysvinit distro feature
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
X-List-Received-Date: Mon, 29 Dec 2014 20:52:17 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-support/rng-tools/rng-tools_4.bb | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
index f10fad1..0b40fc5 100644
--- a/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
+++ b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
@@ -10,16 +10,26 @@ SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
 SRC_URI[md5sum] = "ae89dbfcf08bdfbea19066cfbf599127"
 SRC_URI[sha256sum] = "b71bdfd4222c05e8316001556be90e1606f2a1bac3efde60153bd84e873cc195"
 
+# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
+# manually to avoid unnecessary postinst/preinst generated.
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
 inherit autotools update-rc.d
 
 do_install_append() {
-    install -d "${D}${sysconfdir}/init.d"
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \
-        ${D}${sysconfdir}/init.d/rng-tools
+    # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d "${D}${sysconfdir}/init.d"
+        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \
+            ${D}${sysconfdir}/init.d/rng-tools
 
-    install -d "${D}${sysconfdir}/default"
-    install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default
+        install -d "${D}${sysconfdir}/default"
+        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default
+    fi
 }
 
 INITSCRIPT_NAME = "rng-tools"
-- 
1.8.3.4


