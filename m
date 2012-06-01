Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SaXkI-0002tG-78
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 21:42:50 +0200
Received: by wgbdr1 with SMTP id dr1so2092502wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2012 12:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9PsX9vCgNvD8a88czwuOEU4eNdCoYVLotl4jE0qbpgk=;
	b=LXKYmWoCEoPHQhJXdDpQ7lO44cpCxKcr7jIgUneZK8r2Fi5jiNgGbgKMGuD6dF2zUS
	AXIuXdPDWwIiOgu+A9HzvCAQk340AJsxJF/MeavpthwCP8FIT1a16OxOIPfx3Ko5Qima
	w3uR+zcw48qkHTI4bw9qEyW8d5z1jzZzB6i0ogo8iSq9jwtk59AKgGvZP5tFQG9XUuc2
	pBhaHLgfvF0khDqBDdKdh44P6rHj8dFNAWOH9UJIWjX4ZIZCkjLKXc2X6Sg6egMnybGj
	oADD2ymV2vbv7dY0XMStN5dXOsKG0dJ8AmepoVD0yO4HGKPvUE4625H4bMf7Lz4mReyA
	7ZhQ==
Received: by 10.216.198.65 with SMTP id u43mr3034369wen.170.1338579148695;
	Fri, 01 Jun 2012 12:32:28 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id ei4sm10378579wid.5.2012.06.01.12.32.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 12:32:28 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2012 21:32:18 +0200
Message-Id: <1338579138-15267-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] linux-xilinx: Update SRC_URI to git://git.xilinx.com/linux-xlnx.git
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
X-List-Received-Date: Fri, 01 Jun 2012 19:42:50 -0000

This commit updates the SRC_URI to git://git.xilinx.com/linux-xlnx.git
to match the project name on the Xilinx git repository.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes-kernel/linux/linux-xilinx_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-xilinx_git.bb b/recipes-kernel/linux/linux-xilinx_git.bb
index 0a80c7d..b2f6b6c 100644
--- a/recipes-kernel/linux/linux-xilinx_git.bb
+++ b/recipes-kernel/linux/linux-xilinx_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 PR = "r15"
 LINUX_VERSION = "2.6.37.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-SRC_URI = "git://git.xilinx.com/linux-2.6-xlnx.git;protocol=git \
+SRC_URI = "git://git.xilinx.com/linux-xlnx.git;protocol=git \
            file://defconfig"
 
 XILINX_BOARD ?= "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, 1), d)}"
-- 
1.7.9.5



