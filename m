Return-Path: <daniel.markus@leica-geosystems.com>
Received: from outbound.sbg.se (outbound.sbg.se [83.241.165.85])
	by mail.openembedded.org (Postfix) with ESMTP id 74F4773B6C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 13:36:37 +0000 (UTC)
Received: from hermes.sbg.se (mail.sbg.se [83.241.165.77])
	by outbound.sbg.se (Postfix) with ESMTP id 77545184830;
	Thu, 12 Mar 2015 14:36:36 +0100 (CET)
Received: from localhost.localdomain (unknown [10.213.0.77])
	by hermes.sbg.se (Postfix) with ESMTP id E998D1403DE;
	Thu, 12 Mar 2015 14:35:13 +0100 (CET)
From: Daniel Markus <daniel.markus@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2015 14:34:49 +0100
Message-Id: <1426167289-12437-1-git-send-email-daniel.markus@leica-geosystems.com>
X-Mailer: git-send-email 1.9.1
X-SBG-MailScanner-ID: E998D1403DE.A7B5D
X-SBG-MailScanner: Found to be clean
X-SBG-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
	score=-102.9, required 5, autolearn=not spam, ALL_TRUSTED -1.00,
	BAYES_00 -1.90, USER_IN_WHITELIST -100.00)
X-SBG-MailScanner-From: daniel.markus@leica-geosystems.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] socorro-syms: Add directory arrangement needed by minidump_stackwalk
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
X-List-Received-Date: Thu, 12 Mar 2015 13:36:39 -0000

http://code.google.com/p/google-breakpad/wiki/LinuxStarterGuide

When extracting a stack trace out of a Breakpad minidump, the application
minidump_stackwalk is used. This application needs all symbol files to be
arranged in a particular directory structure in order to match the correct
symbol file with the version of the crashed program in question.

A directory structure is created in accordance with minidump_stackwalk. The
structure contains the name of the application binary and a hash value where the
hash corresponds to the binary the symbol file was produced from. The symbol
file is moved to the hash directory allowing multiple versions of the same
symbol file.

Signed-off-by: Daniel Markus <daniel.markus@leica-geosystems.com>
---
 meta-oe/classes/socorro-syms.bbclass | 50 +++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/socorro-syms.bbclass b/meta-oe/classes/socorro-syms.bbclass
index 766a9e6..c272952 100644
--- a/meta-oe/classes/socorro-syms.bbclass
+++ b/meta-oe/classes/socorro-syms.bbclass
@@ -42,6 +42,16 @@ python symbol_file_preprocess() {
     breakpad_sym_file_path = os.path.join(breakpad_syms_dir, sym_file_name)
     socorro_sym_file_path = os.path.join(socorro_syms_dir, sym_file_name)
 
+    create_socorro_sym_file(breakpad_sym_file_path, socorro_sym_file_path)
+
+    arrange_socorro_sym_file(socorro_sym_file_path, socorro_syms_dir)
+
+    return
+}
+
+
+def create_socorro_sym_file(breakpad_sym_file_path, socorro_sym_file_path):
+
     # In the symbol file, all source files are referenced like the following.
     # FILE 123 /path/to/some/File.cpp
     # Go through all references and replace the file paths with repository
@@ -56,7 +66,6 @@ python symbol_file_preprocess() {
                 socorro_sym_file.write(line)
 
     return
-}
 
 
 def socorro_file_reference(line):
@@ -162,3 +171,42 @@ def git_repository_path(source_file_path):
 
     return socorro_reference
 
+
+def arrange_socorro_sym_file(socorro_sym_file_path, socorro_syms_dir):
+
+    import re
+
+    # Breakpad's minidump_stackwalk needs a certain directory structure in order
+    # to find correct symbols when extracting a stack trace out of a minidump.
+    # The directory structure must look like the following.
+    # YourBinary/<hash>/YourBinary.sym
+    # YourLibrary.so/<hash>/YourLibrary.so.sym
+    # To be able to create such structure we need to extract the hash value that
+    # is found in each symbol file. The header of the symbol file looks
+    # something like this:
+    # MODULE Linux x86 A079E473106CE51C74C1C25AF536CCD30 YourBinary
+    # See
+    # http://code.google.com/p/google-breakpad/wiki/LinuxStarterGuide
+
+    # Create the directory with the same name as the binary.
+    binary_dir = re.sub("\.sym$", "", socorro_sym_file_path)
+    if not os.path.exists(binary_dir):
+        os.makedirs(binary_dir)
+
+    # Get the hash from the header of the symbol file.
+    with open(socorro_sym_file_path, 'r') as socorro_sym_file:
+
+        # The hash is the 4th argument of the first line.
+        sym_file_hash = socorro_sym_file.readline().split()[3]
+
+    # Create the hash directory.
+    hash_dir = os.path.join(binary_dir, sym_file_hash)
+    if not os.path.exists(hash_dir):
+        os.makedirs(hash_dir)
+
+    # Move the symbol file to the hash directory.
+    sym_file_name = os.path.basename(socorro_sym_file_path)
+    os.rename(socorro_sym_file_path, os.path.join(hash_dir, sym_file_name))
+
+    return
+
-- 
1.9.1


