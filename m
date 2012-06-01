Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SaXab-0002iW-7n
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 21:32:49 +0200
Received: by werg55 with SMTP id g55so1604084wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2012 12:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=T1XDYiK/HOxiPYY2uEejo4eCB5qyf0Izr8Ee/LnJ+YE=;
	b=CuqjkfwMqOUBI49CELUw33/zuWGweAX0Ywr978YRB6kaIxRgGIIrNPUPf2b4hEQv4j
	pud9UZL8WoTXQxorXOHdElBrQdPjlm3wJcUnmFRBFq3KRCnj5/Ts8NBgoUs8QzkPuWK7
	qt/qmewDJX7f68xngwkDVCAV15YwmbreiFVEXHDzmTY8Uj5mjgM/1nmjN+UBYYlado7F
	gTkMkzPsI/esKBkCW2QT7QURriLVSiwS8xtqe6v3h20DdTLwIghqg8WZrbfEd2gXiHFW
	qb2grbE0MuQlDmZd/apa4KKcq6DxazrppcTSGon5zqRKztc0JHeEo5IIqCIS8YCO++YS
	jSDA==
Received: by 10.216.27.200 with SMTP id e50mr3115943wea.23.1338578544682;
	Fri, 01 Jun 2012 12:22:24 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id hv7sm10318973wib.0.2012.06.01.12.22.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 12:22:22 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2012 21:22:08 +0200
Message-Id: <1338578528-11087-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] linux-xilinx: Correct license to GPLv2.
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
X-List-Received-Date: Fri, 01 Jun 2012 19:32:49 -0000

This commits corrects the license for the linux-xilinx recipe to GPLv2.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes-kernel/linux/linux-xilinx_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-xilinx_git.bb b/recipes-kernel/linux/linux-xilinx_git.bb
index 9d562fb..0a80c7d 100644
--- a/recipes-kernel/linux/linux-xilinx_git.bb
+++ b/recipes-kernel/linux/linux-xilinx_git.bb
@@ -4,7 +4,7 @@ require recipes-kernel/linux/linux-dtb.inc
 DESCRIPTION = "Linux kernel for Xilinx platforms"
 COMPATIBLE_MACHINE = "(virtex4|virtex5|virtex5mb|spartan6-sp605|spartan6-lx9mb)"
 
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 PR = "r15"
-- 
1.7.9.5



