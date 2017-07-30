Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BF937783BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jul 2017 15:19:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6UFJO1F022682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 30 Jul 2017 16:19:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dbq04-0001b9-M0; Sun, 30 Jul 2017 16:19:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Jul 2017 16:19:20 +0100
Message-Id: <1501427963-6097-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 30 Jul 2017 16:19:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/5] sstate: Improve SSTATE_SKIP_CREATION
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
X-List-Received-Date: Sun, 30 Jul 2017 15:19:27 -0000

Currently, dummy archives are created for skipped sstate tasks. We relied
on these never being installed (the setscene task is missing) however this
leads to odd behaviour as for example the setscene stamps are never looked
at.

Rather than trying to continue with the two separate behaviours, really
skip package creation. We do need the file manipulation steps to install files
under sstate control from a manifest perspective so we only skip at the final
creation step.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f446c3d..6af0d38 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -346,8 +346,6 @@ def sstate_installpkgdir(ss, d):
         oe.path.remove(dir)
 
     for state in ss['dirs']:
-        if d.getVar('SSTATE_SKIP_CREATION') == '1':
-            continue
         prepdir(state[1])
         os.rename(sstateinst + state[0], state[1])
     sstate_install(ss, d)
@@ -596,8 +594,6 @@ def sstate_package(ss, d):
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
-        if d.getVar('SSTATE_SKIP_CREATION') == '1':
-            continue
         srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
         # Find and error for absolute symlinks. We could attempt to relocate but its not
         # clear where the symlink is relative to in this context. We could add that markup
@@ -625,6 +621,10 @@ def sstate_package(ss, d):
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_PKG', sstatepkg)
+    d.setVar('SSTATE_INSTDIR', sstatebuild)
+
+    if d.getVar('SSTATE_SKIP_CREATION') == '1':
+        return
 
     for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
              ['sstate_create_package', 'sstate_sign_package'] + \
@@ -634,8 +634,6 @@ def sstate_package(ss, d):
 
     bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
 
-    d.setVar('SSTATE_INSTDIR', sstatebuild)
-
     return
 
 def pstaging_fetch(sstatefetch, sstatepkg, d):
-- 
2.7.4


