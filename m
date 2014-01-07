Return-Path: <apelete@seketeli.net>
Received: from ms.seketeli.fr (seketeli.net [94.23.218.202])
	by mail.openembedded.org (Postfix) with ESMTP id D288E6CE97
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 18:31:48 +0000 (UTC)
Received: from amegan.ahome.fr (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.fr (Postfix) with ESMTPSA id 76EA5236005A;
	Tue,  7 Jan 2014 19:31:47 +0100 (CET)
Received: by amegan.ahome.fr (Postfix, from userid 1000)
	id 80D5AA4017E; Tue,  7 Jan 2014 19:31:46 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2014 19:31:04 +0100
Message-Id: <192412aae6ddd6e4df2d424b011cb8c8ae622b88.1389118170.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1389118170.git.apelete@seketeli.net>
References: <cover.1389118170.git.apelete@seketeli.net>
In-Reply-To: <cover.1389118170.git.apelete@seketeli.net>
References: <cover.1389118170.git.apelete@seketeli.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [meta-handheld][PATCH 2/2] linux-qi-ben-nanonote: rename previous linux-jlime-ben-nanonote recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2014 18:31:50 -0000

The kernel recipe for the Ben Nanonote machine is now relying on the
Qi-Hardware kernel source code instead of the JLime kernel source code
initially.
Rename linux-jlime-ben-nanonote recipe to linux-qi-ben-nanonote to
reflect the change.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 conf/machine/ben-nanonote.conf                                       |    2 +-
 ...inux-jlime-ben-nanonote_3.12.bb => linux-qi-ben-nanonote_3.12.bb} |    0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename recipes-kernel/linux/{linux-jlime-ben-nanonote_3.12.bb => linux-qi-ben-nanonote_3.12.bb} (100%)

diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
index e09eb70..d5e86bd 100644
--- a/conf/machine/ben-nanonote.conf
+++ b/conf/machine/ben-nanonote.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/tune-mips32.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben-nanonote"
+PREFERRED_PROVIDER_virtual/kernel = "linux-qi-ben-nanonote"
 
 # With 2.6.37 there is not yet uImage target (pending patches)
 #KERNEL_IMAGETYPE = "uImage"
diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote_3.12.bb b/recipes-kernel/linux/linux-qi-ben-nanonote_3.12.bb
similarity index 100%
rename from recipes-kernel/linux/linux-jlime-ben-nanonote_3.12.bb
rename to recipes-kernel/linux/linux-qi-ben-nanonote_3.12.bb
-- 
1.7.10.4


