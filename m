Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmaIn-0001qT-Hm
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 01:19:57 +0100
Received: from mizar.localdomain (87.5.74.30) by smtp206.alice.it (8.6.023.02)
	id 4ECA607907BDFA6B; Mon, 16 Jan 2012 01:12:24 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jan 2012 01:12:11 +0100
Message-Id: <1326672731-7001-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
References: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 3/3] zaurus.inc: don't install device nodes, rely on devtmpfs
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
X-List-Received-Date: Mon, 16 Jan 2012 00:19:57 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 7ff56fc..b42799f 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -18,6 +18,8 @@ EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 EXTRA_IMAGEDEPENDS += "zaurus-installer"
 
+IMAGE_DEVICE_TABLES = ""
+
 #########
 # xserver
 #########
-- 
1.7.3.4



