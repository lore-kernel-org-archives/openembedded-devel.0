Return-Path: <Wenzong.Fan@windriver.com>
X-Greylist: delayed 3542 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Nov 2015 06:11:40 UTC
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7087704E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 06:11:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA25CbTb002374
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Nov 2015 21:12:38 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 1 Nov 2015 21:12:37 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Nov 2015 00:12:36 -0500
Message-ID: <1446441156-135546-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] netcat-openbsd: replace patch with quilt
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Nov 2015 06:11:41 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

If run bitbake -c patch -f netcat-openbsd twice, the patch conflict
will happen, so replace the patch with quilt to avoid do_patch failed.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 12409d4..89a646f 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -20,7 +20,8 @@ do_configure[noexec] = "1"
 
 netcat_do_patch() {
     cd ${S}
-    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; done < ${WORKDIR}/debian/patches/series
+    quilt pop -a || true
+    QUILT_PATCHES=${WORKDIR}/debian/patches QUILT_SERIES=${WORKDIR}/debian/patches/series quilt push -a
 }
 
 python do_patch() {
-- 
1.9.1


