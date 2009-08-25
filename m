Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1Mfz74-00075b-94
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 18:43:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id DC88D38F039;
	Tue, 25 Aug 2009 12:25:22 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04243-09; Tue, 25 Aug 2009 12:25:22 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 8DD235035B8;
	Tue, 25 Aug 2009 12:25:22 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id 5667B7CE23B; Tue, 25 Aug 2009 12:24:08 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 12:24:08 -0400
Message-Id: <1251217448-8279-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <4A93F7F2.7030207@cbnco.com>
References: <4A93F7F2.7030207@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH v2] rsync: add v3.0.6
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
X-List-Received-Date: Tue, 25 Aug 2009 16:43:18 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---
 conf/checksums.ini           |    4 ++++
 recipes/rsync/rsync_3.0.6.bb |   12 ++++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)
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
index 0000000..614b051
--- /dev/null
+++ b/recipes/rsync/rsync_3.0.6.bb
@@ -0,0 +1,12 @@
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
-- 
1.6.0.2



