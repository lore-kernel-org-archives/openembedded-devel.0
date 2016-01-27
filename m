Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77A03770AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:32:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0R6WChM030439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 22:32:12 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jan 2016 22:32:11 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jan 2016 14:30:57 +0800
Message-ID: <1453876257-30608-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba: update systemd service files
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
X-List-Received-Date: Wed, 27 Jan 2016 06:32:14 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update systemd service files of samba. There are no '@BASE_BINDIR@' and
'@SBINDIR@' in these service files, so drop the original replacement.
Command kill is installed to /bin/kill, then correct in the service files.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index a51d31f..2e3f118 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -112,9 +112,7 @@ do_install_append() {
         for i in nmb smb winbind; do
             install -m 0644 packaging/systemd/$i.service ${D}${systemd_unitdir}/system
         done
-        sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
-            -e 's,@SBINDIR@,${sbindir},g' \
-            -i ${D}${systemd_unitdir}/system/*.service
+        sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_unitdir}/system/*.service
 
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	echo "d ${localstatedir}/log/samba 0755 root root -" \
-- 
2.6.1


