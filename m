Return-Path: <prvs=920c251a5=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [80.120.57.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA3E7704E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 06:54:55 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CpBAC3AyNX/0oKEKxehAt9BrdVhBMahXWBeAEBAQEBAYENhRMBLSiBFg4Fv3cBi2ABAQgghiGIcmKFCgWNVIo9gVWEJ4gdgWVOhxyFQIYkiQyET2oBhmh/AQEB
X-IPAS-Result: A2CpBAC3AyNX/0oKEKxehAt9BrdVhBMahXWBeAEBAQEBAYENhRMBLSiBFg4Fv3cBi2ABAQgghiGIcmKFCgWNVIo9gVWEJ4gdgWVOhxyFQIYkiQyET2oBhmh/AQEB
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Apr 2016 08:55:21 +0200
Message-ID: <1461912921-12837-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex1srv.skidata.net
	(172.16.10.92)
Subject: [meta-networking][PATCH] samba: fix paths in sysv initscript
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
X-List-Received-Date: Fri, 29 Apr 2016 06:54:58 -0000
Content-Type: text/plain

The sysv initscript provided by samba assumes smbd and nmbd are
installed in /opt/samba/bin/. In our case both binaries are installed to
/usr/sbin/ by default. Therefore fix these paths.

Furthermore fix the log and config directory as well as the name of the
initscript in its usage text.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index 9358ca5..5b5ed58 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -103,6 +103,11 @@ do_install_append() {
     elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba.sh
+        sed -e 's,/opt/samba/bin,${sbindir},g' \
+            -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
+            -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
+            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \
+            -i ${D}${sysconfdir}/init.d/samba.sh
         update-rc.d -r ${D} samba.sh start 20 3 5 .
         update-rc.d -r ${D} samba.sh start 20 0 1 6 .
     fi
-- 
2.1.4


