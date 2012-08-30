Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T73JR-0004lv-EL
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 13:53:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 157D35BC597;
	Thu, 30 Aug 2012 13:33:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ACw5Qb+hKvll; Thu, 30 Aug 2012 13:33:14 +0200 (CEST)
Received: from haze.lan (unknown [IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id 15AD15BC4CE;
	Thu, 30 Aug 2012 13:33:14 +0200 (CEST)
From: Sander van Grieken <sander@outrightsolutions.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 13:33:06 +0200
Message-Id: <1346326386-23626-1-git-send-email-sander@outrightsolutions.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] avahi: use systemd.bbclass for avahi-systemd
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
X-List-Received-Date: Thu, 30 Aug 2012 11:53:29 -0000

The original behaviour is to enable the service in the package postinst phase. This patch
will enable the service also when building the rootfs, so it fixes the case when no
package-management is enabled. It also now delegates systemd enablement to the systemd
bbclass, instead of using explicit code in the recipe itself.

Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
---
 .../avahi/avahi_0.6.31.bbappend                    |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
new file mode 100644
index 0000000..63a63c6
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
@@ -0,0 +1,11 @@
+#FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "avahi-daemon.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+FILES_${PN}-systemd += "${systemd_unitdir}/system/"
-- 
1.7.9.5



