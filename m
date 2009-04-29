Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lz7eN-0000ZC-Qn
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 13:08:27 +0200
Received: (qmail 1877 invoked by uid 813007); 29 Apr 2009 11:03:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 29 Apr 2009 11:03:12 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Apr 2009 13:03:07 +0200
Message-Id: <1241002987-24500-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [PATCH 1/1] bitbake.conf: make MACHINE_KERNEL_PR defaults to PR
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
X-List-Received-Date: Wed, 29 Apr 2009 11:08:28 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

By default MACHINE_KERNEL_PR defaults to 'r0' which makes build of
kernel for machines which not use MACHINE_KERNEL_PR harder
(kernel.bbclass uses M_K_P instead of PR).

Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 9e026e4..fd84ea2 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -164,7 +164,7 @@ P = "${PN}-${PV}"
 
 # Define a PR for kernels that machines can override so things like
 # modules get rebuilt
-MACHINE_KERNEL_PR ?= "r0"
+MACHINE_KERNEL_PR ?= "${PR}"
 
 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
-- 
1.6.3.rc0





