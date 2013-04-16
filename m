Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3or-0006d2-8Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:13:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811903"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:54:01 +0100
Message-Id: <566bb201593e6366c7ecfaf5b0a2fe24eb21a677.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking, meta-oe][PATCH 7/9] ipsec-tools: move to meta-networking and tweak
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
X-List-Received-Date: Tue, 16 Apr 2013 11:13:17 -0000

* Add purpose and Upstream-Status to patch

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/ipsec-tools/files/ipsec-tools-install.patch    |    4 ++++
 .../recipes-support/ipsec-tools/ipsec-tools.inc                    |    0
 .../recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb               |    0
 3 files changed, 4 insertions(+)
 rename {meta-oe => meta-networking}/recipes-support/ipsec-tools/files/ipsec-tools-install.patch (90%)
 rename {meta-oe => meta-networking}/recipes-support/ipsec-tools/ipsec-tools.inc (100%)
 rename {meta-oe => meta-networking}/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb (100%)

diff --git a/meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch b/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
similarity index 90%
rename from meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
rename to meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
index 6b9c39b..85035b1 100644
--- a/meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
+++ b/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
@@ -1,3 +1,7 @@
+Avoid attempting to install vmbuf.h twice
+
+Upstream-Status: Accepted
+
 Taken from pld-linux.org:
 http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/ipsec-tools/ipsec-tools-install.patch
 
diff --git a/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc b/meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc
similarity index 100%
rename from meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc
rename to meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc
diff --git a/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
similarity index 100%
rename from meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
rename to meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
-- 
1.7.10.4



