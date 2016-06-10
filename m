Return-Path: <prvs=9628b212d=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8E27E60290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 07:15:09 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2A4AgCMaFpX/0oKEKxdhBR9BqcWiAWJcYIPgXoahXmBbRQBAQEBAQEBgQyFFwEtKFo8AQ0FiBUDsxwBhx4Ng3sBAQEHAgEkhieHEIc7HAWYKjSBWIQshikBgXyBZ4dyDIU5hkKBOYdtHoI+GxaBN2wBiQh/AQEB
X-IPAS-Result: A2A4AgCMaFpX/0oKEKxdhBR9BqcWiAWJcYIPgXoahXmBbRQBAQEBAQEBgQyFFwEtKFo8AQ0FiBUDsxwBhx4Ng3sBAQEHAgEkhieHEIc7HAWYKjSBWIQshikBgXyBZ4dyDIU5hkKBOYdtHoI+GxaBN2wBiQh/AQEB
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Date: Fri, 10 Jun 2016 09:15:22 +0200
Message-ID: <1465542922-21002-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex1srv.skidata.net
	(172.16.10.92)
Subject: [meta-networking][jethro][backport][PATCH] samba: add volatile file to support readonly rootfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 07:15:12 -0000
Content-Type: text/plain

This patch adds a volatile file for samba which was removed by the
update from 3.6.25 to 4.1.12. This file is necessary to build a image
that uses the read-only-rootfs feature.

Backported from master 12e31ce

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba         | 3 +++
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb             | 2 ++
 2 files changed, 5 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba b/meta-networking/recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba
new file mode 100644
index 0000000..4bdfa7d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.1.12/volatiles.03_samba
@@ -0,0 +1,3 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/log/samba none
+d root root 0755 /var/run/samba none
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index 4d2ab66..733821b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -34,6 +34,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://19-systemd-daemon-is-contained-by-libsystemd.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch \
            file://21-add-config-option-without-valgrind.patch \
+           file://volatiles.03_samba \
           "
 
 SRC_URI[md5sum] = "232016d7581a1ba11e991ec2674553c4"
@@ -135,6 +136,7 @@ do_install_append() {
     install -d ${D}${sysconfdir}/samba
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
     install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
+    install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
 
     install -d ${D}${libdir}/tmpfiles.d
     install -m644 packaging/systemd/samba.conf.tmp ${D}${libdir}/tmpfiles.d/samba.conf
-- 
2.1.4


