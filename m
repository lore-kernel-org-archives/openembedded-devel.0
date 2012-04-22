Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SM5Hq-0000Kl-UF
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 00:29:42 +0200
Received: from mizar.localdomain (87.5.26.19) by smtp205.alice.it (8.6.023.02)
	id 4F421F7B071BFE01; Mon, 23 Apr 2012 00:20:12 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2012 00:19:50 +0200
Message-Id: <e3ea4434356f8c3cd627eb13db7b74caf58f4854.1335132155.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1335132155.git.andrea.adami@gmail.com>
References: <cover.1335132155.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1335132155.git.andrea.adami@gmail.com>
References: <cover.1335132155.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] zaurus: use linux-yocto as virtual/kernel
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
X-List-Received-Date: Sun, 22 Apr 2012 22:29:43 -0000

* tested 3.2 on c7x0, poodle, spitz

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index a43db8b..1ef3213 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -31,7 +31,7 @@ PREFERRED_PROVIDER_virtual/libgl = "mesa-xlib"
 # kernel
 ########
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
 
 # Default bootloader expects "zImage", use "uImage" for u-boot
 # Note: kexecboot can boot both kind of images
-- 
1.7.3.4



