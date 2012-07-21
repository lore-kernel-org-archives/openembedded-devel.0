Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsUrs-00036E-Rv
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 10:16:52 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm11so1108158wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 01:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=m48vFYPSkQcB/7s/Wq4niwLdxaK+MIPcujUb8Y8PKxs=;
	b=cO/X8nJ285BsDGNTZBwbVUwAhMozXKVuTaoHCPn///NdvqBi9epv1Ci+LCtljn24vl
	ipnCH8J/R7XBe6XAXQEflTgTtEB+4ITklnHgXu/NgfiesXRy86pFPRdUE+Ix/STsbzF0
	RdpgbkIm9Xlu4C4Rk+A/dXZ3OkA3flwsxDXMcz+eL3zy8bGrvBzLm0w/BW8Kzw6PIpSD
	vqBcRQRmWc76XroXfv8EmC+wJ3bi/Q5xGB02nRWFQLss/pVNLa+8pmplTQv2V2niW34q
	fvGHAJyZcH1SYIebzJDKYElP0ETeLXjDymSQOSu1P38y9D+BphMZpBZxDDwmwCZNl7D7
	5Dtg==
Received: by 10.180.106.137 with SMTP id gu9mr13186057wib.20.1342857930994;
	Sat, 21 Jul 2012 01:05:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm2475133wib.6.2012.07.21.01.05.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 01:05:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jul 2012 10:05:06 +0200
Message-Id: <e8265347d876946c64aeaa28d21bca13e8e2631e.1342857860.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342857860.git.Martin.Jansa@gmail.com>
References: <cover.1342857860.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342857860.git.Martin.Jansa@gmail.com>
References: <cover.1342857860.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][PATCH 2/3] udev-extra-rules: add mount.blacklist to CONFFILES
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
X-List-Received-Date: Sat, 21 Jul 2012 08:16:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/udev/udev-extra-rules.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev-extra-rules.bb b/meta-oe/recipes-core/udev/udev-extra-rules.bb
index ec3f017..7f9ca85 100644
--- a/meta-oe/recipes-core/udev/udev-extra-rules.bb
+++ b/meta-oe/recipes-core/udev/udev-extra-rules.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 inherit allarch
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = " \
        file://automount.rules \
@@ -17,7 +17,7 @@ SRC_URI = " \
 
 
 do_install() {
-	install -d ${D}${sysconfdir}/udev/rules.d
+    install -d ${D}${sysconfdir}/udev/rules.d
 
     install -m 0644 ${WORKDIR}/automount.rules     ${D}${sysconfdir}/udev/rules.d/automount.rules
     install -m 0644 ${WORKDIR}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
@@ -33,3 +33,4 @@ do_install() {
 
 FILES_${PN} = "${sysconfdir}/udev"
 RDEPENDS_${PN} = "udev"
+CONFFILES_${PN} = "${sysconfdir}/udev/mount.blacklist"
-- 
1.7.8.6



