Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sgl3J-0005oN-Oq
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 01:08:09 +0200
Received: from mizar.localdomain (79.21.254.221) by smtp206.alice.it
	(8.6.023.02) id 4F9BF1D3061152D5; Tue, 19 Jun 2012 00:57:29 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 00:57:17 +0200
Message-Id: <1340060237-28718-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1340060237-28718-1-git-send-email-andrea.adami@gmail.com>
References: <1340060237-28718-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] zaurus.inc: redefine XZ compression level
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
X-List-Received-Date: Mon, 18 Jun 2012 23:08:09 -0000

* xz -7 makes sense if your vmlinux is much larger than 16 MiB uncompressed

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 268b9fd..45c82d3 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -38,7 +38,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
 KERNEL_IMAGETYPE ?= "zImage"
 
 # sane defaults for devices with only 32Mb RAM (see man xz)
-XZ_COMPRESSION_LEVEL = "-e -7"
+XZ_COMPRESSION_LEVEL = "-2e"
 
 # kernel bootlogo
 LOGO_SIZE = '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
-- 
1.7.3.4



