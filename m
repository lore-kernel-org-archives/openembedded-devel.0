Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LuNcc-0004VX-LJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 11:14:09 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 19338189362; Thu, 16 Apr 2009 11:10:38 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2009 11:10:38 +0200
Message-Id: <1239873038-2840-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] python 2.6.1: fix build for architectures lacking libffi support
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
X-List-Received-Date: Thu, 16 Apr 2009 09:14:34 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../05-enable-ctypes-cross-build.patch             |    2 +-
 recipes/python/python_2.6.1.bb                     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch b/recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch
index 874b8be..58b8078 100644
--- a/recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch
+++ b/recipes/python/python-2.6.1/05-enable-ctypes-cross-build.patch
@@ -22,7 +22,7 @@ Index: Python-2.6.1/setup.py
                  res = os.system(cmd)
                  if res or not os.path.exists(ffi_configfile):
 -                    print "Failed to configure _ctypes module"
-+                    print "Failed to configure _ctypes module (ret=%d) or missing conffile=%s" % ( ret, ffi_configfile )
++                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
                      return False
  
              fficonfig = {}
diff --git a/recipes/python/python_2.6.1.bb b/recipes/python/python_2.6.1.bb
index 57c64df..e50ca43 100644
--- a/recipes/python/python_2.6.1.bb
+++ b/recipes/python/python_2.6.1.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl tk zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "ml4"
+PR = "ml5"
 
 SRC_URI = "\
   http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
-- 
1.5.6.5



