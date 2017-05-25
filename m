Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 674 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 May 2017 07:05:33 UTC
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id 78E6E71C9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 07:05:33 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym01.jp.fujitsu.com with smtp
	id 3024_1722_433be762_699f_4289_8e10_88bae1327a5e;
	Thu, 25 May 2017 15:54:14 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8439BAC0168
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 15:54:13 +0900 (JST)
Received: from G01JPEXCHYT13.g01.fujitsu.local
	(G01JPEXCHYT13.g01.fujitsu.local [10.128.194.52])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	7D26458431D for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 15:54:12 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT13.g01.fujitsu.local (10.128.194.52) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 25 May 2017 15:54:12 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 May 2017 15:55:27 +0900
Message-ID: <1495695327-24056-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] nodejs: update to 4.8.3
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
X-List-Received-Date: Thu, 25 May 2017 07:05:35 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.8.2.bb => nodejs_4.8.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.8.2.bb => nodejs_4.8.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.8.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.8.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb
index ae84ad3..7fde778 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.8.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "aea6139f952bb7e1d66f76afedee813c"
-SRC_URI[sha256sum] = "b961350b8490c791bdd3663925662ba0fbe01e004b43f1c2779baffcc816b930"
+SRC_URI[md5sum] = "dc40053a74100ce6df641a5b4c4d4d1e"
+SRC_URI[sha256sum] = "d84e7544c2e31a2d0825b4f8b093d169bf8bdb1881ee8cf75ff937918e59e9cb"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.9.1


