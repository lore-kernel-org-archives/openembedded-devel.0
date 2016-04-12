Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 36FC96B6F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:00:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2016 15:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,476,1455004800"; d="scan'208";a="953630550"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga002.jf.intel.com with ESMTP; 12 Apr 2016 15:00:43 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:00:39 -0700
Message-Id: <1460498439-18426-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-oe][PATCH] devtool: sdk-update fails on remote hosts
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
X-List-Received-Date: Tue, 12 Apr 2016 22:00:44 -0000

This fixes bug #9426:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9426

Skip .git folders when copying the build system.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index dd0e664..7b9a0ee 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -8,7 +8,7 @@ def _smart_copy(src, dest):
     # source is a file or a directory.
     mode = os.stat(src).st_mode
     if stat.S_ISDIR(mode):
-        shutil.copytree(src, dest, symlinks=True)
+        shutil.copytree(src, dest, symlinks=True, ignore=shutil.ignore_patterns('.git'))
     else:
         shutil.copyfile(src, dest)
         shutil.copymode(src, dest)
-- 
2.8.0


