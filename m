Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SOkOJ-0005VP-SM
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:47:23 +0200
Received: by lagw12 with SMTP id w12so1626713lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JBfM2Txqifc3XP4q8o6b4HV54LeOnV4U/0BJj4tJGy4=;
	b=YqnRQnhkJmXWHWkR0OMOHcW7dN8hnWeM4Ui2hK14H8NY4++7kyhn/2fGtJO3jTM1tt
	CIaiDX+PO8CBSKSaN56haf56sbEgO42Yo5IxEhNEXg50aqi5oZ1eBBR9e+Ir0pYOtMuS
	+oio6d6+sAGjR4EGmKaCbIWVwwy6XsvTT8Afsjo4wUgVuAo2yUneU7CVpWxtSUf6N0eJ
	7dSk7UaZxhMOSx7hnZN8D3XNzNNRcDV4PQaoGWz5Nfj5HT/sgKIyeWEImpfKNl4PRaim
	bwDVnw+Tmq3TrUJ/CAoC19Psug+3+pQQvO0GTBdt5Fd5dBudy2DjSV3gz7ksOo9ZeBk9
	yRiQ==
Received: by 10.152.112.100 with SMTP id ip4mr19127545lab.1.1335767861950;
	Sun, 29 Apr 2012 23:37:41 -0700 (PDT)
Received: from arpc01.inne.proxdynamics.com (147.84-49-231.nextgentel.com.
	[84.49.231.147])
	by mx.google.com with ESMTPS id j6sm19363212lbl.0.2012.04.29.23.37.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:37:41 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 May 2012 08:16:02 +0200
Message-Id: <1335852962-27548-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] synergy: remove inherit of siteinfo and fix license string
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
X-List-Received-Date: Mon, 30 Apr 2012 06:47:24 -0000


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
index 40efcb1..b8d1e6c 100644
--- a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
+++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Synergy - control multiple computers with one keyboard and mouse"
 HOMEPAGE = "http://synergy.googlecode.com"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0"
 SECTION = "x11/utils"
 
 DEPENDS = "libx11 libxtst"
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da05110943edb
 
 S = "${WORKDIR}/${PN}-${PV}-Source"
 
-inherit cmake siteinfo
+inherit cmake
 
 do_install() {
 	install -d ${D}/usr/bin
-- 
1.7.9.5



