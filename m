Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T4Gfa-0000iE-KB
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 21:32:50 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so1834923pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=IRKceA0umIuYHCfp/4a+rdAOrnpoQUJlZ9m+JX/tSQc=;
	b=0kb3xFRfhoMKvwsHliDmJ2eJgFyFiH9lrb1EB0drXx5ydJeDdebpvvRfa0OeNnVWXo
	/xBj4tSAfoW7lCa3NocJqSuocLgRh+5bLkxbuPZ6tzsyHiqCbJadonHqkyF4tPp4siYg
	769iOa7nwmlDTsetLZcXfefnrkJDfbONVVWaDQireEybBUJknNf+OwAAqW60TZYHGuQa
	PUrIw1Pe5o+E22CC0iPYgaaNSrvv5m3H4MoaWC8E5wI0WypYskCsAfBfc+3KKulH5Nit
	D+1eIBlR71wRIjL6DdGflheiEHFV9m45N25qcJ29U5Ewr2asRztnARYpd3rNHlC6YNLw
	sbGQ==
Received: by 10.66.74.67 with SMTP id r3mr48540138pav.1.1345663247207;
	Wed, 22 Aug 2012 12:20:47 -0700 (PDT)
Received: from eos.du.ae ([94.205.108.162])
	by mx.google.com with ESMTPS id oj8sm4254996pbb.54.2012.08.22.12.20.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 12:20:46 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 23:20:22 +0400
Message-Id: <1345663224-42350-5-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
References: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 5/7] xilinx-boot.bbclass: Add support for selecting the xilinx hardware bitstream file.
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
X-List-Received-Date: Wed, 22 Aug 2012 19:32:50 -0000

* Remove hard-coded references to the xilinx hardware bitstream file, and
  allow selection via a variable XILINX_BITSTREAM_FILE .

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 classes/xilinx-boot.bbclass |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/xilinx-boot.bbclass b/classes/xilinx-boot.bbclass
index 85fb6d9..871f82a 100644
--- a/classes/xilinx-boot.bbclass
+++ b/classes/xilinx-boot.bbclass
@@ -104,7 +104,9 @@ fi
 # For Xilinx EDK 13.1 Bootloop is set by default
 #
 cd ${XILINX_BSP_PATH}
-if [ ! -f implementation/download.bit ]; then
+#XILINX_BITSTREAM_FILE=implementation/download.bit
+XILINX_BITSTREAM_FILE=implementation/system.bit
+if [ ! -f ${XILINX_BITSTREAM_FILE} ]; then
 	# Bitstream not found generate it
 	bbnote "bitstream not found, generating it"
 	make -f ${XILINX_BSP_PATH}/system.make init_bram
@@ -114,7 +116,7 @@ if [ "${TARGET_ARCH}" = "powerpc" ]; then
 	# Find u-boot start address
 	start_address=`${TARGET_PREFIX}objdump -x u-boot | grep -w "start address" | cut -d ' ' -f3`
 	# Generate ACE image
-	xmd -tcl genace.tcl -hw implementation/download.bit -elf u-boot \
+	xmd -tcl genace.tcl -hw ${XILINX_BITSTREAM_FILE} -elf u-boot \
 	-target ppc_hw -start_address ${start_address} -ace u-boot-${XILINX_BOARD}.ace \
 	-board ${XILINX_BOARD}
 fi
-- 
1.7.9.5



