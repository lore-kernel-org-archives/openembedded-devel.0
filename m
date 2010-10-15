Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P6jDT-0002xO-85
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 14:17:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id B15333149EA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 14:16:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Q69xdMdGGps7; Fri, 15 Oct 2010 14:16:12 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 72CA13149E83;
	Fri, 15 Oct 2010 14:16:11 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 15 Oct 2010 12:16:10 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 12:16:00 +0000
Message-Id: <1287144965-6419-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] automake-1.11.1: omit compilation of pyc files on install
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
X-List-Received-Date: Fri, 15 Oct 2010 12:17:05 -0000

* On install, automake calls py-compile, which previously
  compiled python source code to pyc and pyo, which both
  got packaged.
* The python interpreter in OE contains patches to enable
  optimization (pyo) by default:
    04-default-is-optimized.patch
    99-ignore-optimization-flag.patch
* automake created pyc files by calling py_compile.compile()
  and adding the c suffix manually, resulting in identical
  byte code for both pyc and pyo files.
* 0001-py-compile-compile-only-optimized-byte-code.patch
  applies to automake 1.11 and automake master, but older
  versions require a slightly modified patch. However,
  older versions are only pinned by chinook-compat and
  nylon, so I left them untouched.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/automake/automake_1.11.1.bb                |    4 +-
 ...-compile-compile-only-optimized-byte-code.patch |   42 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 recipes/automake/files/0001-py-compile-compile-only-optimized-byte-code.patch

diff --git a/recipes/automake/automake_1.11.1.bb b/recipes/automake/automake_1.11.1.bb
index 74477e7..0579875 100644
--- a/recipes/automake/automake_1.11.1.bb
+++ b/recipes/automake/automake_1.11.1.bb
@@ -1,5 +1,7 @@
 require automake.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://0001-py-compile-compile-only-optimized-byte-code.patch"
 
 SRC_URI[automake.md5sum] = "c2972c4d9b3e29c03d5f2af86249876f"
 SRC_URI[automake.sha256sum] = "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723f17e2e1e0295c7ae"
diff --git a/recipes/automake/files/0001-py-compile-compile-only-optimized-byte-code.patch b/recipes/automake/files/0001-py-compile-compile-only-optimized-byte-code.patch
new file mode 100644
index 0000000..1eca0a8
--- /dev/null
+++ b/recipes/automake/files/0001-py-compile-compile-only-optimized-byte-code.patch
@@ -0,0 +1,42 @@
+upstream: OE-only
+
+From 4f84894b3df47ce797100f25d2d79f08bb27cd0d Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Thu, 14 Oct 2010 12:25:50 +0200
+Subject: [PATCH] py-compile: compile only optimized byte code
+
+---
+ lib/py-compile |   17 -----------------
+ 1 files changed, 0 insertions(+), 17 deletions(-)
+
+diff --git a/lib/py-compile b/lib/py-compile
+index 3f9d05b..101c814 100755
+--- a/lib/py-compile
++++ b/lib/py-compile
+@@ -101,23 +101,6 @@ else
+     filetrans="filepath = os.path.normpath('$destdir' + os.sep + path)"
+ fi
+ 
+-$PYTHON -c "
+-import sys, os, py_compile
+-
+-files = '''$files'''
+-
+-sys.stdout.write('Byte-compiling python modules...\n')
+-for file in files.split():
+-    $pathtrans
+-    $filetrans
+-    if not os.path.exists(filepath) or not (len(filepath) >= 3
+-                                            and filepath[-3:] == '.py'):
+-	    continue
+-    sys.stdout.write(file)
+-    sys.stdout.flush()
+-    py_compile.compile(filepath, filepath + 'c', path)
+-sys.stdout.write('\n')" || exit $?
+-
+ # this will fail for python < 1.5, but that doesn't matter ...
+ $PYTHON -O -c "
+ import sys, os, py_compile
+-- 
+1.7.0.4
+
-- 
1.7.1



