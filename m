Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYN-0003jR-AP
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:09 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id 685AE1B79D; Wed, 19 Aug 2009 20:25:50 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:35 -0700
Message-Id: <1250738680-20274-4-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
In-Reply-To: <1250738680-20274-3-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
Cc: Dale Farnsworth <dfarnsworth@mvista.com>
Subject: [PATCH] kernel.bbclass: Set EXTRA_OEMAKE to null for kernel
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
X-List-Received-Date: Thu, 20 Aug 2009 03:43:14 -0000

From: Dale Farnsworth <dfarnsworth@mvista.com>

Currently the only thing in EXTRA_OEMAKE is '-e MAKEFLAGS='.  We don't
want to overide the kernel's Makefile variables from the environment.
It caused the passed -j<N> parameter from PARALLEL_MAKE to be ignored.

Signed-off-by: Dale Farnsworth <dfarnsworth@mvista.com>
Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/kernel.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 3ee7f53..2947d4d 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -78,6 +78,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 UBOOT_ENTRYPOINT ?= "20008000"
 UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 
+# For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.
+# We don't want to override kernel Makefile variables from the environment
+EXTRA_OEMAKE = ""
+
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-- 
1.6.0



