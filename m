Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC77-0007Gk-5g
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:33 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkYp021269;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00015D-ED; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:40 +0200
Message-Id: <5b160cf460453dfb437c1b2c8972e4f3678e6aad.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <cc617cfc6a87cb5e145ace9c07d91a4cf4853600.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
	<2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
	<d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
	<cc617cfc6a87cb5e145ace9c07d91a4cf4853600.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 07/13] insane.bbclass: add exceptions for canadian-* classes
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:33 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 classes/insane.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index a599689..21ece16 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -280,7 +280,7 @@ def package_qa_check_arch(path,name,d):
     target_arch = bb.data.getVar('TARGET_ARCH', d, True)
 
     # FIXME: Cross package confuse this check, so just skip them
-    if bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d):
+    if bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('canadian-cross', d) or bb.data.inherits_class('canadian-sdk', d):
         return True
 
     # avoid following links to /usr/bin (e.g. on udev builds)
@@ -339,7 +339,7 @@ def package_qa_check_staged(path,d):
     workdir = os.path.join(tmpdir, "work")
 
     installed = "installed=yes"
-    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
+    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d) or bb.data.inherits_class("canadian-native", d) or bb.data.inherits_class("canadian-cross", d):
         pkgconfigcheck = workdir
     else:
         pkgconfigcheck = tmpdir
@@ -353,7 +353,7 @@ def package_qa_check_staged(path,d):
             if file[-2:] == "la":
                 file_content = open(path).read()
                 # Don't check installed status for native/cross packages
-                if not bb.data.inherits_class("native", d) and not bb.data.inherits_class("cross", d):
+                if not bb.data.inherits_class("native", d) and not bb.data.inherits_class("cross", d) and not bb.data.inherits_class("canadian-native", d) and not bb.data.inherits_class("canadian-cross", d):
                     if installed in file_content:
                         error_msg = "%s failed sanity test (installed) in path %s" % (file,root)
                         sane = package_qa_handle_error(5, error_msg, "staging", path, d)
-- 
1.5.4.3



