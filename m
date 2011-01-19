Received: from mail.multitech.com ([65.126.90.84])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1PfdUr-0003xP-Ll
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 20:15:09 +0100
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from localhost.localdomain ([192.168.52.113]) by mail.multitech.com
	with Microsoft SMTPSVC(5.0.2195.7381); 
	Wed, 19 Jan 2011 13:11:33 -0600
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jan 2011 13:13:13 -0600
Message-Id: <1295464393-31400-1-git-send-email-jgilles@multitech.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 19 Jan 2011 19:11:33.0313 (UTC)
	FILETIME=[AF772310:01CBB80C]
Subject: [PATCH] logrotate: fix /etc/crontab entry -- run as root
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
X-List-Received-Date: Wed, 19 Jan 2011 19:15:10 -0000

* /etc/crontab entry was missing username field, so it never ran

Signed-off-by: Jesse Gilles <jgilles@multitech.com>
---
 recipes/logrotate/logrotate_3.7.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/logrotate/logrotate_3.7.1.bb b/recipes/logrotate/logrotate_3.7.1.bb
index 850d76a..c084dcc 100644
--- a/recipes/logrotate/logrotate_3.7.1.bb
+++ b/recipes/logrotate/logrotate_3.7.1.bb
@@ -5,7 +5,7 @@ DEPENDS = "popt"
 RDEPENDS_${PN} = "cron"
 SECTION = "admin"
 LICENSE = "GPL"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/l/logrotate/logrotate_${PV}.orig.tar.gz \
 	   file://logrotate-3.7.1.patch \
@@ -28,7 +28,7 @@ do_install () {
 
 pkg_postinst () {
     # Add the logrotate line to /etc/crontab
-    grep -q "${base_sbindir}/logrotate" ${sysconfdir}/crontab || echo "*/5 * * * *   ${base_sbindir}/logrotate ${sysconfdir}/logrotate.conf" >> ${sysconfdir}/crontab
+    grep -q "${base_sbindir}/logrotate" ${sysconfdir}/crontab || echo "*/5 * * * * root ${base_sbindir}/logrotate ${sysconfdir}/logrotate.conf" >> ${sysconfdir}/crontab
 }
 
 pkg_postrm() {
-- 
1.7.0.4



