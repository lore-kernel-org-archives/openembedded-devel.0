Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UOGRP-0001Bb-B4
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:53:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2013 16:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,418,1363158000"; d="scan'208";a="313153734"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.194])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2013 16:35:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:35:42 +0100
Message-Id: <83a882b9aef9d5a8054e9b291db1b24b6157443e.1365204818.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/4] packagegroup-qte-toolchain-target: remove bbappend
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
X-List-Received-Date: Fri, 05 Apr 2013 23:53:08 -0000

This added Qwt to the Qt Embedded toolchain. This is a distro policy
decision, and in any case Qwt is a third-party library which is not part
of Qt. Distros that wish to do this should add this bbappend to their
own layers.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-qte-toolchain-target.bbappend     |    6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend

diff --git a/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
deleted file mode 100644
index f6e5dd9..0000000
--- a/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-RDEPENDS_${PN} += "qwt-e-dev"
-
-# qwt-e conflicts with qwt, so only one can be built in world and this pulls qwt-e
-EXCLUDE_FROM_WORLD = "1"
-
-PRINC := "${@int(PRINC) + 1}"
-- 
1.7.10.4



