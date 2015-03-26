Return-Path: <daniel.markus@leica-geosystems.com>
Received: from outbound.sbg.se (outbound.sbg.se [83.241.165.85])
	by mail.openembedded.org (Postfix) with ESMTP id E8AC76013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 08:21:15 +0000 (UTC)
Received: from hermes.sbg.se (mail.sbg.se [83.241.165.77])
	by outbound.sbg.se (Postfix) with ESMTP id 4B2D3184826;
	Thu, 26 Mar 2015 09:21:15 +0100 (CET)
Received: from localhost.localdomain (unknown [10.213.0.77])
	by hermes.sbg.se (Postfix) with ESMTP id 7F37F1407B0;
	Thu, 26 Mar 2015 09:20:38 +0100 (CET)
From: Daniel Markus <daniel.markus@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2015 09:20:06 +0100
Message-Id: <1427358006-6443-1-git-send-email-daniel.markus@leica-geosystems.com>
X-Mailer: git-send-email 1.9.1
X-SBG-MailScanner-ID: 7F37F1407B0.54B0E
X-SBG-MailScanner: Found to be clean
X-SBG-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
	score=-102.9, required 5, autolearn=not spam, ALL_TRUSTED -1.00,
	BAYES_00 -1.90, USER_IN_WHITELIST -100.00)
X-SBG-MailScanner-From: daniel.markus@leica-geosystems.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] socorro-syms: Add support for local repositories
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
X-List-Received-Date: Thu, 26 Mar 2015 08:21:17 -0000

This socorro-syms functionality tries to extract the host name out of the source
code repository origin. This causes problems when the origin is a local
repository.

The solution is to look for the origin in two steps. If the origin in the first
step is a local directory we assume it is a temporary download repository. In
the second step we look for the origin to that download repository and if that
also redirects to a local repository, we provide the absolute path instead of a
Socorro repository link.

Signed-off-by: Daniel Markus <daniel.markus@leica-geosystems.com>
---
 meta-oe/classes/socorro-syms.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/socorro-syms.bbclass b/meta-oe/classes/socorro-syms.bbclass
index c272952..0312031 100644
--- a/meta-oe/classes/socorro-syms.bbclass
+++ b/meta-oe/classes/socorro-syms.bbclass
@@ -108,6 +108,12 @@ def run_command(command, directory):
     return output.rstrip()
 
 
+def is_local_url(url):
+
+    return \
+        url.startswith("file:") or url.startswith("/") or url.startswith("./")
+
+
 def git_repository_path(source_file_path):
 
     import re
@@ -125,12 +131,18 @@ def git_repository_path(source_file_path):
 
     # The URL could be a local download directory. If so, get the URL again
     # using the local directory's config file.
-    if os.path.isdir(source_long_url):
+    if is_local_url(source_long_url):
         git_config_file = os.path.join(source_long_url, "config")
         source_long_url = run_command(
             "git config --file %s --get remote.origin.url" % git_config_file,
             source_file_dir)
 
+        # If also the download directory redirects to a local git directory,
+        # then we're probably using source code from a local debug branch which
+        # won't be accessible by Socorro.
+        if is_local_url(source_long_url):
+            return None
+
     # The URL can have several formats. A full list can be found using
     # git help clone. Extract the server part with a regex.
     url_match = re.search(".*(://|@)([^:/]*).*", source_long_url)
-- 
1.9.1


