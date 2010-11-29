Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PN6zE-0002pM-G2
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 17:54:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 83B6B908C06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 11:52:37 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29004-03 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 29 Nov 2010 11:52:37 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 40505908CEB; Mon, 29 Nov 2010 11:52:37 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 6129D9089FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 11:52:34 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 2D0F2502090; Mon, 29 Nov 2010 11:52:34 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Nov 2010 11:52:33 -0500
Message-Id: <1291049553-8442-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xf86-input-tslib 0.0.6: move udev rule to /etc/udev/rules.d
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
X-List-Received-Date: Mon, 29 Nov 2010 16:54:00 -0000

/lib/udev/rules.d is a symlink to /etc/udev/rules.d.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/xorg-driver/xf86-input-tslib_0.0.6.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb b/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
index a1cecaa..4b910dd 100644
--- a/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "X.Org X server -- tslib input driver"
 DEPENDS += "tslib"
 RRECOMMENDS_${PN} += "tslib-calibrate"
 RSUGGESTS_${PN} += "hal"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-input-tslib-${PV}.tar.bz2;name=archive \
            file://double-free-crash.patch \
@@ -20,8 +20,8 @@ do_configure_prepend() {
 do_install_append() {
         install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
         install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
-        install -d ${D}/lib/udev/rules.d
-        install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}/lib/udev/rules.d/
+        install -d ${D}/${sysconfdir}/udev/rules.d
+        install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}/${sysconfdir}/udev/rules.d/
 }
 
 FILES_${PN} += "${datadir}/hal /lib/udev"
-- 
1.6.3.2



