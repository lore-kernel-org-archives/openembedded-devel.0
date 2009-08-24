Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1Mfg6P-0005ir-Cy
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 22:25:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 9424F54921A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16501-02 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 577065490CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id C158B7CE243; Mon, 24 Aug 2009 14:56:26 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2009 14:56:26 -0400
Message-Id: <1251140186-26944-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
X-Virus-Scanned: amavisd-new at cbnco.com
Cc: Evan Doiron <edoiron@cbnco.com>
Subject: [PATCH] rsync: add v3.0.6
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
X-List-Received-Date: Mon, 24 Aug 2009 20:25:20 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---
 conf/checksums.ini           |    4 ++++
 recipes/rsync/rsync_3.0.6.bb |   16 ++++++++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/rsync/rsync_3.0.6.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 3ee124d..ba06d5d 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -21714,6 +21714,10 @@ sha256=17697db5bb9de399b71f7927070f60b3554b70b0ecc0419b50455d56560ea169
 md5=2122d460b4119749c6e5993938a9b501
 sha256=17697db5bb9de399b71f7927070f60b3554b70b0ecc0419b50455d56560ea169
 
+[http://rsync.samba.org/ftp/rsync/src/rsync-3.0.6.tar.gz]
+md5=e9865d093a18e4668b9d31b635dc8e99
+sha256=33cc969364cb66b3e345fa7db2c651a8e07de0e58743ec03899c4ba86953e1b3
+
 [http://downloads.sourceforge.net/nogravity/rt-nogravity-data.zip]
 md5=c7536e907363ea1da63430b49e42931d
 sha256=d7d5a3d17f492049fceb2b9ea22c4c2af7243506219d83f7005b77ae410add29
diff --git a/recipes/rsync/rsync_3.0.6.bb b/recipes/rsync/rsync_3.0.6.bb
new file mode 100644
index 0000000..bdb2ba1
--- /dev/null
+++ b/recipes/rsync/rsync_3.0.6.bb
@@ -0,0 +1,16 @@
+require rsync.inc
+
+PR = "r0"
+
+SRC_URI += "\
+  file://m4.patch;patch=1 \
+  file://rsyncd.conf \
+"
+# The source tarball from 3.0.6 seems to need this
+do_configure_append(){
+  oe_runmake reconfigure
+}
+
+do_compile_prepend() {
+        sed -i "s/conf_stop make_stop//" Makefile
+}
-- 
1.6.0.2



