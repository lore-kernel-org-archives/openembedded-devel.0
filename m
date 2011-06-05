Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QTFMp-0005Gj-IP
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 17:35:56 +0200
Received: by gwb11 with SMTP id 11so1347936gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jun 2011 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=2hczjUzqQTzrwsdi3lLwxPBQi5lXOHjOSCdwnTHKmdA=;
	b=skfxoLubu9EUyV52k0O+CjHeG88vtZWl64qMG+iJ6KelY0uK5SSXgzgfv47YqpuUj1
	mTIls+dMJqPaQzPOWdGsHlmbq6iwPwVNV/wwCrRxJINzcLBEh1K+s/wKzV2K1ej7CF9T
	QyGzJ7SkQ+golt8OLzw6jIgFDnlddsf8tDUo0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=s4nxE0nMFuoaLX6H/jCHsDd+HDd1LptK+nDFULUYp7BgaSMzuwoIka1OAu71Px3QUS
	8KBxtFbbsiAv6mOxy6UUfZ0rqX9XxvaQs5cEv5DnimvX0CpJjP/jVASuCda3S7HBLEfJ
	oHIrqe5OYdtgr+un+4DXd5eVMiVrAN0sBaisY=
Received: by 10.236.76.233 with SMTP id b69mr5159402yhe.34.1307287959793;
	Sun, 05 Jun 2011 08:32:39 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id e24sm1341233yhk.65.2011.06.05.08.32.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Jun 2011 08:32:39 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Jun 2011 18:32:34 +0300
Message-Id: <1307287954-21084-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] ti-wifi-utils: install calibrator ini files to rootfs
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
X-List-Received-Date: Sun, 05 Jun 2011 15:35:56 -0000

In order to perform wifi calibration the calibrator needs to be
provided as input with a reference NVS file that matches the wifi chip 
and the radio mudule that is being used.

This patch install these ini files to the root file system so they can 
be used when performing the calibration.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/ti/ti-wifi-utils_git.bb |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
index 8d10051..d5e548b 100644
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
+	install -d ${D}${bindir}/ti-wifi-utils/ini_files/127x
+	install -d ${D}${bindir}/ti-wifi-utils/ini_files/128x
+
 	install -m 0755 calibrator ${D}${bindir}/	
+	install -m 0755 ${S}/ini_files/127x/* ${D}${bindir}/ti-wifi-utils/ini_files/127x
+	install -m 0755 ${S}/ini_files/128x/* ${D}${bindir}/ti-wifi-utils/ini_files/128x
 }
+
+FILES_${PN} +=" \
+	${bindir}/ti-wifi-utils/ini_files/127x \
+	${bindir}/ti-wifi-utils/ini_files/128x \
+	"
+
-- 
1.7.0.4



