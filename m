Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbvLn-0007Pm-WC
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:39:32 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9B3EB4A029;
	Fri, 23 Nov 2012 16:25:29 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2012 16:24:42 +0100
Message-Id: <1353684287-19180-5-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 4/9] packagegroup-cli-tools: remove mdbus2, mterm2, mkdump, mioctl
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
X-List-Received-Date: Fri, 23 Nov 2012 15:39:32 -0000

Missing or unbuildable dependency chain was: ['mdbus2']
Missing or unbuildable dependency chain was: ['mterm2']
Missing or unbuildable dependency chain was: ['mkdump']
Missing or unbuildable dependency chain was: ['mioctl']

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index 07fb056..88b62b8 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -4,7 +4,7 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r20"
+PR = "r21"
 
 inherit packagegroup allarch
 
@@ -24,9 +24,7 @@ RDEPENDS_${PN} = "\
   iptables \
   lsof \
   mbuffer \
-  mdbus2 \
   mtd-utils \
-  mterm2 \
   nano \
   nfs-utils-client \
   nmon \
@@ -41,8 +39,6 @@ RDEPENDS_${PN}-debug = "\
   devmem2 \
   i2c-tools \
   gdb \
-  mkdump \
-  mioctl \
   procps \
   pxaregs \
   s3c24xx-gpio \
-- 
1.8.0



