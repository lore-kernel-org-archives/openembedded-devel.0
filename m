Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C54D78744
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 06:40:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w216eXBI029800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 22:40:34 -0800
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.163.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.361.1; Wed, 28 Feb 2018 22:40:05 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Mar 2018 14:36:02 +0800
Message-ID: <20180301063602.23146-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [128.224.163.239]
Subject: [meta-networking][PATCH] ebtables: enable KERNEL_64_USERSPACE_32 for arm
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
X-List-Received-Date: Thu, 01 Mar 2018 06:40:33 -0000
Content-Type: text/plain

On arm64 board, run the kernel as 64bit with 32bit userpace ebtables,
then run ebtables command:
ebtables -A OUTPUT -p arp -o eth3 -j DROP
Below error occurs:
kernel msg: ebtables bug: please report to author: Standard target size too big

To solve this, enable KERNEL_64_USERSPACE_32 for arm as the commit
<ebtables: enable KERNEL_64_USERSPACE_32 for powerpc> do.

Use TARGET_ARCH to replace KARCH here because that KARCH can't always get
value by default.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index d5e7341..d89ee1a 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -42,10 +42,10 @@ inherit update-rc.d systemd
 python __anonymous () {
     import re
 
-    karch = d.getVar('KARCH')
+    karch = d.getVar('TARGET_ARCH')
     multilib = d.getVar('MLPREFIX')
 
-    if multilib and karch == 'powerpc64':
+    if multilib and ( karch == 'powerpc64' or karch == 'arm' ):
         searchstr = "lib.?32"
         reg = re.compile(searchstr)
         if reg.search(multilib):
-- 
2.9.3


