Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C077478890
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 05:53:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2M5rup8003839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 22:53:56 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 21 Mar 2018 22:53:55 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Mar 2018 13:53:53 +0800
Message-ID: <1521698033-27671-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [meta-python][PATCH] python-m2crypto: refresh patch
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
X-List-Received-Date: Thu, 22 Mar 2018 05:53:54 -0000
Content-Type: text/plain

Fix QA warning:

WARNING: python-m2crypto-native-0.26.4-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch
0001-setup.py-link-in-sysroot-not-in-host-directories.patch
patching file setup.py
Hunk #1 succeeded at 127 with fuzz 1 (offset 65 lines).
Hunk #2 succeeded at 143 (offset 68 lines).

Now at patch 0001-setup.py-link-in-sysroot-not-in-host-directories.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p.py-link-in-sysroot-not-in-host-directories.patch | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
index 819c8e5..c71b16f 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
+++ b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
@@ -1,4 +1,4 @@
-From f11b9c71080513f9b867ba8f40613ba2ebc6e960 Mon Sep 17 00:00:00 2001
+From dfb83a41aaeae326e9b6f02b233af375bc7b8815 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 29 Mar 2013 15:17:17 +0100
 Subject: [PATCH] setup.py: link in sysroot, not in host directories
@@ -10,12 +10,12 @@ Upstream-status: Unknown
  setup.py | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: M2Crypto-0.23.0/setup.py
-===================================================================
---- M2Crypto-0.23.0.orig/setup.py
-+++ M2Crypto-0.23.0/setup.py
-@@ -62,7 +62,7 @@ class _M2CryptoBuildExt(build_ext.build_
-             self.openssl = 'c:\\pkg'
+diff --git a/setup.py b/setup.py
+index 3407c82..15ed7cd 100644
+--- a/setup.py
++++ b/setup.py
+@@ -127,7 +127,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+                 self.openssl = os.path.join(self.openssl, 'OpenSSL')
          else:
              self.libraries = ['ssl', 'crypto']
 -            self.openssl = '/usr'
@@ -23,7 +23,7 @@ Index: M2Crypto-0.23.0/setup.py
  
      def finalize_options(self):
          '''Overloaded build_ext implementation to append custom openssl
-@@ -75,8 +75,8 @@ class _M2CryptoBuildExt(build_ext.build_
+@@ -143,8 +143,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
          if _openssl and os.path.isdir(_openssl):
              self.openssl = _openssl
  
@@ -34,3 +34,6 @@ Index: M2Crypto-0.23.0/setup.py
  
          if platform.system() == "Linux":
              if _multiarch:  # on Fedora/RHEL it is an empty string
+-- 
+2.7.4
+
-- 
2.7.4


