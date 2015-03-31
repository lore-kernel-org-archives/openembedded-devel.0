Return-Path: <daniel.markus@leica-geosystems.com>
Received: from outbound.sbg.se (outbound.sbg.se [83.241.165.85])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE05724B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:01:28 +0000 (UTC)
Received: from hermes.sbg.se (mail.sbg.se [83.241.165.77])
	by outbound.sbg.se (Postfix) with ESMTP id 60D6E1847BC;
	Tue, 31 Mar 2015 15:01:27 +0200 (CEST)
Received: from localhost.localdomain (unknown [10.213.0.77])
	by hermes.sbg.se (Postfix) with ESMTP id D0FA1140156;
	Tue, 31 Mar 2015 15:00:13 +0200 (CEST)
From: Daniel Markus <daniel.markus@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2015 14:59:57 +0200
Message-Id: <1427806797-560-1-git-send-email-daniel.markus@leica-geosystems.com>
X-Mailer: git-send-email 1.9.1
X-SBG-MailScanner-ID: D0FA1140156.7E482
X-SBG-MailScanner: Found to be clean
X-SBG-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
	score=-102.9, required 5, autolearn=not spam, ALL_TRUSTED -1.00,
	BAYES_00 -1.90, USER_IN_WHITELIST -100.00)
X-SBG-MailScanner-From: daniel.markus@leica-geosystems.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] socorro-syms: Correct the extraction of repository branch
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
X-List-Received-Date: Tue, 31 Mar 2015 13:01:33 -0000

When a recipe has git-cloned source code to compile, it may be checked out with
a detached HEAD. The current VCS information extraction in socorro-syms
incorrectly assumes a detached HEAD belongs to the master branch.

With the proper git command we find the branch the detached HEAD belongs to and
use that in the Socorro link.

Signed-off-by: Daniel Markus <daniel.markus@leica-geosystems.com>
---
 meta-oe/classes/socorro-syms.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/socorro-syms.bbclass b/meta-oe/classes/socorro-syms.bbclass
index 0312031..7a7b208 100644
--- a/meta-oe/classes/socorro-syms.bbclass
+++ b/meta-oe/classes/socorro-syms.bbclass
@@ -148,12 +148,10 @@ def git_repository_path(source_file_path):
     url_match = re.search(".*(://|@)([^:/]*).*", source_long_url)
     source_server = url_match.group(2)
 
-    # (2) Get the branch for this file. If it's detached and just shows HEAD
-    # then set it to master and hope we can get the correct revision from there.
-    source_branch = run_command(
-        "git rev-parse --abbrev-ref HEAD", source_file_dir)
-    if source_branch == "HEAD":
-        source_branch = "master"
+    # (2) Get the branch for this file.
+    source_branch_list = run_command("git show-branch --list", source_file_dir)
+    source_branch_match = re.search(".*?\[(.*?)\].*", source_branch_list)
+    source_branch = source_branch_match.group(1)
 
     # (3) Since the repo root directory name can be changed without affecting
     # git, we need to extract the name from something more reliable.
-- 
1.9.1


