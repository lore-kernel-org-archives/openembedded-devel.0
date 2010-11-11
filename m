Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PGXMS-0001h0-Kk
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 14:38:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8AC438F09E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 08:37:40 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22536-01 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 11 Nov 2010 08:37:40 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id E0CB78F09E3; Thu, 11 Nov 2010 08:37:39 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 09ABF8EE29A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 08:37:38 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id EBB861411D92; Thu, 11 Nov 2010 08:37:37 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Nov 2010 08:37:35 -0500
Message-Id: <1289482655-20086-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1289482655-20086-1-git-send-email-msmith@cbnco.com>
References: <1289482655-20086-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] usbutils 0.86: delete usb.ids if gzipped version is installed
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
X-List-Received-Date: Thu, 11 Nov 2010 13:38:45 -0000

Also split update-usbids.sh to a separate package, and allow building
when sbindir != /sbin.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/usbutils/usbutils_0.86.bb |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/recipes/usbutils/usbutils_0.86.bb b/recipes/usbutils/usbutils_0.86.bb
index 905ad53..000fcca 100644
--- a/recipes/usbutils/usbutils_0.86.bb
+++ b/recipes/usbutils/usbutils_0.86.bb
@@ -4,19 +4,32 @@ DEPENDS += "virtual/libusb0"
 LICENSE = "GPLv2"
 PRIORITY = "optional"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/linux-usb/usbutils-${PV}.tar.gz \
 	  "
 inherit autotools
 
 EXTRA_OECONF = "--program-prefix="
-sbindir = "/sbin"
-bindir = "/bin"
+sbindir = "${base_sbindir}"
+bindir = "${base_bindir}"
+
+PACKAGES =+ "${PN}-update"
 
 FILES_${PN} += "${datadir}/usb*"
+FILES_${PN}-update = "${sbindir}/update-usbids.sh"
 
 do_configure_prepend() {
 	rm -rf ${S}/libusb
 }
 
+do_install_append() {
+	# The 0.86 Makefile.am installs both usb.ids and usb.ids.gz.
+	if [ -f ${D}${datadir}/usb.ids.gz ]
+	then
+		rm -f ${D}${datadir}/usb.ids
+	fi
+}
+
 SRC_URI[md5sum] = "34979f675d2bcb3e1b45012fa830a53f"
 SRC_URI[sha256sum] = "b3b2bea6d2cd87660c8201a47071bf2a9889d8ed90c7203cc768b597799c12f4"
-- 
1.7.0.4



