Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QTSlg-0004mN-J8
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 07:54:29 +0200
Received: by gwb11 with SMTP id 11so1476934gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jun 2011 22:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=4WqRy7HQ8lUvjMO4yxyC7SDTUevzrVcJmwzLXIT2/X0=;
	b=KuQccvRI2y2L2ye5qXc18UvbecI2C0+hN4Tqp+DkfF8wRaGsQp4JFlTjh46M6iG1AX
	Kqnnr3sEVC/LNCNU3c3ByXYHxyzNz2RwThFzKJ508fiPGH6nVvKnOb03V0dubfx/BjWV
	9ehdt25+lCqpXB+1JiXem8g89HhKJGaEWhAxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=v/zNpjm5Hp8w8KzURWFMrC+U128lfCWHVCYLk3oJHIRm6ydrVG5g4SNlHiiglT1Qpc
	iD4Z8eyr+C7ariq3XsLJIQINliH6oFRYGU0AbdJUCeNvQSXw0wxtz6zlitAtZXvGK4bQ
	C2sbVXQHq5rROOpHMAyVHavgykRjFZGSk8Y18=
Received: by 10.151.84.5 with SMTP id m5mr3884697ybl.33.1307339467939;
	Sun, 05 Jun 2011 22:51:07 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u32sm3074328ann.4.2011.06.05.22.51.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Jun 2011 22:51:06 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2011 08:57:05 +0300
Message-Id: <1307339825-22007-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCHv2] ti-wifi-utils: install calibrator ini files to rootfs
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
X-List-Received-Date: Mon, 06 Jun 2011 05:54:29 -0000

In order to perform wifi calibration the calibrator needs to be
provided with a reference NVS file that matches the wifi chip and the
radio module that is being used.

This patch install these ini files to the root file system along with
the calibrator itself.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/ti/ti-wifi-utils_git.bb |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
index 8d10051..f193f27 100644
--- a/recipes/ti/ti-wifi-utils_git.bb
+++ b/recipes/ti/ti-wifi-utils_git.bb
@@ -3,7 +3,7 @@ LICENSE = "TI-BSD"
 
 DEPENDS = "libnl"
 
-PR ="r2"
+PR ="r3"
 PV ="0.0"
 PR_append = "+gitr${SRCPV}"
 
@@ -17,5 +17,16 @@ CFLAGS += " -DCONFIG_LIBNL20"
 
 do_install() {
 	install -d ${D}${bindir}
+	install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
+	install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
+
 	install -m 0755 calibrator ${D}${bindir}/	
+	install -m 0755 ${S}/ini_files/127x/* ${D}${datadir}/ti/wifi-utils/ini_files/127x
+	install -m 0755 ${S}/ini_files/128x/* ${D}${datadir}/ti/wifi-utils/ini_files/128x
 }
+
+FILES_${PN} +=" \
+	${datadir}/ti/wifi-utils/ini_files/127x \
+	${datadir}/ti/wifi-utils/ini_files/128x \
+	"
+
-- 
1.7.0.4



