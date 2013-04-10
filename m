Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPxgE-0008CL-GO
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:15:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Apr 2013 08:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="320376220"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.51])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2013 08:58:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:57:58 +0100
Message-Id: <9e1b810be2a70ac9b33252d9f8a160f74118f46f.1365609345.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365609345.git.paul.eggleton@linux.intel.com>
References: <cover.1365609345.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365609345.git.paul.eggleton@linux.intel.com>
References: <cover.1365609345.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v2 1/2] packagegroup-qte-toolchain-target: remove bbappend content
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
X-List-Received-Date: Wed, 10 Apr 2013 16:15:29 -0000

This added Qwt to the Qt Embedded toolchain. This is a distro policy
decision, and in any case Qwt is a third-party library which is not part
of Qt. Distros that wish to do this should add this bbappend to their
own layers.

(We have to preserve the PRINC value to avoid PR going backwards.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-qte-toolchain-target.bbappend      |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
index f6e5dd9..d9f1c29 100644
--- a/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
+++ b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
@@ -1,6 +1 @@
-RDEPENDS_${PN} += "qwt-e-dev"
-
-# qwt-e conflicts with qwt, so only one can be built in world and this pulls qwt-e
-EXCLUDE_FROM_WORLD = "1"
-
 PRINC := "${@int(PRINC) + 1}"
-- 
1.7.10.4



