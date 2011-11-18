Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prathap@bangubntigfx>) id 1RRIzs-0005rg-5l
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 08:36:28 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAI7HTL5005231
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 01:17:31 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAI7HRtO000427
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 12:47:29 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 18 Nov 2011 12:47:27 +0530
Received: from bangubntigfx (bangubntigfx.india.ti.com [172.24.132.46])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAI7HQ0m014120;
	Fri, 18 Nov 2011 12:47:27 +0530 (IST)
Received: from prathap by bangubntigfx with local (Exim 4.72)	(envelope-from
	<prathap@bangubntigfx>)	id 1RRIhS-0002Ba-33;
	Fri, 18 Nov 2011 12:47:26 +0530
From: Prathap M S <msprathap@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Nov 2011 12:47:23 +0530
Message-ID: <1321600643-8366-1-git-send-email-msprathap@ti.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH v2 1/3] kernel.bbclass: stage additional directories
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
X-List-Received-Date: Fri, 18 Nov 2011 07:36:28 -0000
Content-Type: text/plain

* The graphics SDK requires additional directories to be staged
  for compilation.

Signed-off-by: Prathap M S <msprathap@ti.com>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 0109ce6..bf731e6 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -168,7 +168,7 @@ sysroot_stage_all_append() {
 	mkdir -p $kerneldir/include/asm-generic
 	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
 
-	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen crypto/ocf; do
+	for entry in drivers/crypto drivers/media drivers/video drivers/gpu drivers/base include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen crypto/ocf; do
 		if [ -d $entry ]; then
 			mkdir -p $kerneldir/$entry
 			cp -fR $entry/* $kerneldir/$entry/
-- 
1.7.1



