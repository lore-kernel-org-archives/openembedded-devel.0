Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEEBD600E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 08:06:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8S86WBZ015404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 01:06:41 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 01:06:38 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Sep 2016 04:06:37 -0400
Message-ID: <1475049997-179733-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] webmin: Set PERLLIB to runtime path
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
X-List-Received-Date: Wed, 28 Sep 2016 08:06:42 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

This fixes:

  # on target
  $ grep PERLLIB /etc/webmin/start
  PERLLIB=/path/to/builddir/.../webmin/1.801-r0/image/usr/libexec/webmin

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-webserver/recipes-webadmin/webmin/files/setup.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/setup.sh b/meta-webserver/recipes-webadmin/webmin/files/setup.sh
index 8d24f92..64e6c9d 100755
--- a/meta-webserver/recipes-webadmin/webmin/files/setup.sh
+++ b/meta-webserver/recipes-webadmin/webmin/files/setup.sh
@@ -18,7 +18,7 @@ ver=`cat "$wadir/version"`
 cd "$wadir"
 
 # Work out perl library path
-PERLLIB=$wadir
+PERLLIB=$wadir_runtime
 
 # Validate source directory
 allmods=`cd "$wadir"; echo */module.info | sed -e 's/\/module.info//g'`
-- 
2.8.1


