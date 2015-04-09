Return-Path: <daniel.markus@leica-geosystems.com>
Received: from outbound.sbg.se (outbound.sbg.se [83.241.165.85])
	by mail.openembedded.org (Postfix) with ESMTP id CCA6E606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 09:19:48 +0000 (UTC)
Received: from hermes.sbg.se (mail.sbg.se [83.241.165.77])
	by outbound.sbg.se (Postfix) with ESMTP id 4D1EF1846E3;
	Thu,  9 Apr 2015 11:19:47 +0200 (CEST)
Received: from localhost.localdomain (unknown [10.213.0.77])
	by hermes.sbg.se (Postfix) with ESMTP id AC8431400E2;
	Thu,  9 Apr 2015 11:19:16 +0200 (CEST)
From: Daniel Markus <daniel.markus@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:18:59 +0200
Message-Id: <1428571139-31627-1-git-send-email-daniel.markus@leica-geosystems.com>
X-Mailer: git-send-email 1.9.1
X-SBG-MailScanner-ID: AC8431400E2.570E6
X-SBG-MailScanner: Found to be clean
X-SBG-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
	score=-102.9, required 5, autolearn=not spam, ALL_TRUSTED -1.00,
	BAYES_00 -1.90, USER_IN_WHITELIST -100.00)
X-SBG-MailScanner-From: daniel.markus@leica-geosystems.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] socorro-syms: Limit the search for repository to within the build directory
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
X-List-Received-Date: Thu, 09 Apr 2015 09:19:49 -0000

When we search for the git repository associated with a file and the there's no
repository associated, we incorrectly find the yocto repository itself.

To prevent the search from finding an incorrect repository, we only accept
repositories found within the build directory.

Signed-off-by: Daniel Markus <daniel.markus@leica-geosystems.com>
---
 meta-oe/classes/socorro-syms.bbclass | 39 ++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/meta-oe/classes/socorro-syms.bbclass b/meta-oe/classes/socorro-syms.bbclass
index 7a7b208..3f6ae63 100644
--- a/meta-oe/classes/socorro-syms.bbclass
+++ b/meta-oe/classes/socorro-syms.bbclass
@@ -42,7 +42,7 @@ python symbol_file_preprocess() {
     breakpad_sym_file_path = os.path.join(breakpad_syms_dir, sym_file_name)
     socorro_sym_file_path = os.path.join(socorro_syms_dir, sym_file_name)
 
-    create_socorro_sym_file(breakpad_sym_file_path, socorro_sym_file_path)
+    create_socorro_sym_file(d, breakpad_sym_file_path, socorro_sym_file_path)
 
     arrange_socorro_sym_file(socorro_sym_file_path, socorro_syms_dir)
 
@@ -50,7 +50,16 @@ python symbol_file_preprocess() {
 }
 
 
-def create_socorro_sym_file(breakpad_sym_file_path, socorro_sym_file_path):
+def run_command(command, directory):
+
+    (output, error) = bb.process.run(command, cwd=directory)
+    if error:
+        raise bb.process.ExecutionError(command, error)
+
+    return output.rstrip()
+
+
+def create_socorro_sym_file(d, breakpad_sym_file_path, socorro_sym_file_path):
 
     # In the symbol file, all source files are referenced like the following.
     # FILE 123 /path/to/some/File.cpp
@@ -61,18 +70,19 @@ def create_socorro_sym_file(breakpad_sym_file_path, socorro_sym_file_path):
 
         for line in breakpad_sym_file:
             if line.startswith("FILE "):
-                socorro_sym_file.write(socorro_file_reference(line))
+                socorro_sym_file.write(socorro_file_reference(d, line))
             else:
                 socorro_sym_file.write(line)
 
     return
 
 
-def socorro_file_reference(line):
+def socorro_file_reference(d, line):
 
     # The 3rd position is the file path. See example above.
     source_file_path = line.split()[2]
-    source_file_repo_path = repository_path(os.path.normpath(source_file_path))
+    source_file_repo_path = repository_path(
+        d, os.path.normpath(source_file_path))
 
     # If the file could be found in any repository then replace it with the
     # repository's path.
@@ -82,7 +92,7 @@ def socorro_file_reference(line):
     return line
 
 
-def repository_path(source_file_path):
+def repository_path(d, source_file_path):
 
     if not os.path.isfile(source_file_path):
         return None
@@ -91,6 +101,14 @@ def repository_path(source_file_path):
     (output, error) = bb.process.run("git status",
         cwd=os.path.dirname(source_file_path))
     if not error:
+        # Make sure the git repository we just found wasn't the yocto repository
+        # itself, i.e. the root of the repository we're looking for must be a
+        # child of the build directory TOPDIR.
+        git_root_dir = run_command(
+            "git rev-parse --show-toplevel", os.path.dirname(source_file_path))
+        if not git_root_dir.startswith(d.getVar("TOPDIR", True)):
+            return None
+
         return git_repository_path(source_file_path)
 
     # Here we can add support for other VCSs like hg, svn, cvs, etc.
@@ -99,15 +117,6 @@ def repository_path(source_file_path):
     return None
 
 
-def run_command(command, directory):
-
-    (output, error) = bb.process.run(command, cwd=directory)
-    if error:
-        raise bb.process.ExecutionError(command, error)
-
-    return output.rstrip()
-
-
 def is_local_url(url):
 
     return \
-- 
1.9.1


