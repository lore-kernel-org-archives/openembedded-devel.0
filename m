Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F0C9A6E668
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:28:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 29 Feb 2016 14:28:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="661432993"
Received: from tnaray1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.193])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Feb 2016 14:28:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2016 11:27:36 +1300
Message-Id: <1456784856-4642-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] Add .gitignore to ignore .pyc/.pyo files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 22:28:06 -0000

Since we just added lib/ containing python modules, we should really
ignore any compiled python objects since they will be produced if the
code is executed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..52e4e61
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,2 @@
+*.pyc
+*.pyo
-- 
2.5.0


