Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UIRRp-0001Qe-BK
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 23:25:31 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Mar 2013 23:08:36 +0100
Message-Id: <1363817316-31547-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] busybox: move /etc/default/busybox-syslog to ${PN}-syslog
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
X-List-Received-Date: Wed, 20 Mar 2013 22:25:32 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
index 0741b76..5d06265 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -9,3 +9,5 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
 }
+
+FILES_${PN}-syslog += "${sysconfdir}/default/busybox-syslog"
-- 
1.7.10.4



