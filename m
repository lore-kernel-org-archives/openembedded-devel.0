Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PsQdI-0005yz-T4
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 03:08:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 60E20314DC81
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:07:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id pwqyH9wOctni
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:07:21 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id DF5AA314CA15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 03:07:20 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 24 Feb 2011 02:07:20 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Feb 2011 02:07:20 +0000
Message-Id: <1298513240-2010-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH resend] netkit-base-0.17: use update-alternatives
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
X-List-Received-Date: Thu, 24 Feb 2011 02:08:45 -0000

* Give netkit-inetd a priority of 70.
* Add inetd.conf to CONFFILES_${PN}.
* RPROVIDE inetd.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
Last time, this patch didn't make it into patchwork. The patch to
create an inetd package for busybox has already been merged.

 recipes/netkit-base/netkit-base_0.17.bb |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/recipes/netkit-base/netkit-base_0.17.bb b/recipes/netkit-base/netkit-base_0.17.bb
index 8ab8935..19fdaee 100644
--- a/recipes/netkit-base/netkit-base_0.17.bb
+++ b/recipes/netkit-base/netkit-base_0.17.bb
@@ -1,7 +1,8 @@
 SECTION = "base"
 DESCRIPTION = "netkit-base includes the inetd daemon."
 LICENSE = "BSD"
-PR = "r2"
+RPROVIDES_${PN} = "inetd"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-base-${PV}.tar.gz \
            file://configure.patch \
@@ -28,10 +29,18 @@ do_compile () {
 do_install () {
 	install -d ${D}${sysconfdir}/init.d ${D}${sbindir}
 	install -m 0755 inetd/inetd ${D}${sbindir}/inetd
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/inetd
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/inetd.${PN}
 	install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}
 }
 
+pkg_prerm_${PN} () {
+        update-alternatives --remove inetd-init inetd.${PN}
+}
+pkg_postinst_${PN} () {
+        update-alternatives --install ${sysconfdir}/init.d/inetd inetd-init inetd.${PN} 70
+}
+
+CONFFILES_${PN} = "${sysconfdir}/inetd.conf"
 
 SRC_URI[md5sum] = "1f0193358e92559ec0f598b09ccbc0ec"
 SRC_URI[sha256sum] = "16dd81625ebfc8f5dcb0dfd2e6bac223aad325a9405d66a556fe349446b3c332"
-- 
1.7.2.3



