Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PnyGe-0008E8-8l
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 20:02:56 +0100
Received: by gyd8 with SMTP id 8so1194546gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+YqFr+eARGSWBElZU5yXBE4XNeRYAVDT6yLgX+lSMBQ=;
	b=hh8cnCCL2Rpt8Hhu+V9NrNaWgJoGWx4E3E1ctwYMjGXjlFnfe1OI1hWaiy7BCS9RBC
	EMSR8XOpX13Kq7FZd3VhPwX2tfbKF+3wQF9E5kpq3srjR7txsXC332RQUgQYVfdqkQ9/
	9odFzZfoG1jc3HQeRCwPRGoL/icQZ6Wsdzuk8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZhF6BO69NQYDHE/WpBHeVdyz29mhvra9ZakN7Pt92AAnanXJ0rlna+UtZOAanK6jGK
	nmtRgAhSHFVH6gduQUUGD9jR0rbGYH1c9FdfNwBNsW6tA72dy2B622M2pCjq8go9a3em
	01f6K7/qkzwxqR0J17l4LJtaXE6Km9gPDizpM=
Received: by 10.150.199.16 with SMTP id w16mr990621ybf.136.1297450906907;
	Fri, 11 Feb 2011 11:01:46 -0800 (PST)
Received: from localhost.localdomain ([208.97.56.73])
	by mx.google.com with ESMTPS id p2sm754639ybh.3.2011.02.11.11.01.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 11:01:45 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:01:35 -0700
Message-Id: <1297450895-15614-1-git-send-email-coolaj86@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH v5] nodejs: updated to 0.2.6
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
X-List-Received-Date: Fri, 11 Feb 2011 19:02:56 -0000

* added version number to patches
* libev-cross-cc_0.2.6.patch - turns off execution so that cross-compile succeeds
* node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86, x86_64, arm, and mips

Signed-off-by: AJ ONeal <coolaj86@gmail.com>
---
 recipes/nodejs/files/libev-cross-cc.patch       |   18 ------------
 recipes/nodejs/files/libev-cross-cc_0.2.6.patch |   13 +++++++++
 recipes/nodejs/files/node-cross-cc.patch        |   14 ---------
 recipes/nodejs/files/node-cross-cc_0.2.6.patch  |   19 +++++++++++++
 recipes/nodejs/nodejs_0.2.1.bb                  |   34 -----------------------
 recipes/nodejs/nodejs_0.2.6.bb                  |   32 +++++++++++++++++++++
 6 files changed, 64 insertions(+), 66 deletions(-)
 delete mode 100644 recipes/nodejs/files/libev-cross-cc.patch
 create mode 100644 recipes/nodejs/files/libev-cross-cc_0.2.6.patch
 delete mode 100644 recipes/nodejs/files/node-cross-cc.patch
 create mode 100644 recipes/nodejs/files/node-cross-cc_0.2.6.patch
 delete mode 100644 recipes/nodejs/nodejs_0.2.1.bb
 create mode 100644 recipes/nodejs/nodejs_0.2.6.bb

diff --git a/recipes/nodejs/files/libev-cross-cc.patch b/recipes/nodejs/files/libev-cross-cc.patch
deleted file mode 100644
index 4dd34f4..0000000
--- a/recipes/nodejs/files/libev-cross-cc.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-diff --git node-v0.2.1/deps/libev/wscript.orig node-v0.2.1/deps/libev/wscript
-index 19e7bb2..f0a3d3b 100644
---- node-v0.2.1/deps/libev/wscript.orig
-+++ node-v0.2.1/deps/libev/wscript
-@@ -52,7 +52,12 @@ def configure(conf):
-           return 0;
-       }
-   """
--  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
-+  # TODO determine this dynamically
-+  CROSS = True
-+  execute = True
-+  if CROSS:
-+    execute = False
-+  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=execute,
-                 msg="Checking for SYS_clock_gettime")
- 
-   have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/recipes/nodejs/files/libev-cross-cc_0.2.6.patch b/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
new file mode 100644
index 0000000..13ce4d8
--- /dev/null
+++ b/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
@@ -0,0 +1,13 @@
+diff --git node-v0.2.6/deps/libev/wscript.orig node-v0.2.6/deps/libev/wscript
+index 19e7bb2..5ec9143 100644
+--- node-v0.2.6/deps/libev/wscript.orig
++++ node-v0.2.6/deps/libev/wscript
+@@ -52,7 +52,7 @@ def configure(conf):
+           return 0;
+       }
+   """
+-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
+                 msg="Checking for SYS_clock_gettime")
+ 
+   have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/recipes/nodejs/files/node-cross-cc.patch b/recipes/nodejs/files/node-cross-cc.patch
deleted file mode 100644
index 0d15afc..0000000
--- a/recipes/nodejs/files/node-cross-cc.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff --git node-v0.2.1/wscript.orig node-v0.2.1/wscript
-index 9c4243c..3cf6689 100644
---- node-v0.2.1/wscript.orig
-+++ node-v0.2.1/wscript
-@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
-   arch = ""
-   if bld.env['DEST_CPU'] == 'x86_64':
-     arch = "arch=x64"
-+  # XXX Better support cross-compilation
-+  else:
-+    arch = "arch=" + bld.env['DEST_CPU']
- 
-   if variant == "default":
-     mode = "release"
diff --git a/recipes/nodejs/files/node-cross-cc_0.2.6.patch b/recipes/nodejs/files/node-cross-cc_0.2.6.patch
new file mode 100644
index 0000000..1087ce2
--- /dev/null
+++ b/recipes/nodejs/files/node-cross-cc_0.2.6.patch
@@ -0,0 +1,19 @@
+diff --git node-v0.2.6/wscript.orig node-v0.2.6/wscript
+index a6bade2..566bf5e 100644
+--- node-v0.2.6/wscript.orig
++++ node-v0.2.6/wscript
+@@ -338,6 +338,14 @@ def v8_cmd(bld, variant):
+   arch = ""
+   if bld.env['DEST_CPU'] == 'x86_64':
+     arch = "arch=x64"
++  elif bld.env['DEST_CPU'] == 'x86':
++    arch = "arch=x86"
++  elif bld.env['DEST_CPU'] == 'arm':
++    arch = "arch=arm"
++  elif bld.env['DEST_CPU'] == 'mips':
++    arch = "arch=mips"
++  else:
++    raise Exception(bld.env['DEST_CPU'], "is not one of these supported architectures: x86, x86_64, arm, mips")
+ 
+   if variant == "default":
+     mode = "release"
diff --git a/recipes/nodejs/nodejs_0.2.1.bb b/recipes/nodejs/nodejs_0.2.1.bb
deleted file mode 100644
index c2e9c41..0000000
--- a/recipes/nodejs/nodejs_0.2.1.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT"
-
-PR = "r1"
-
-DEPENDS = "openssl"
-
-SRC_URI = " \
-  http://nodejs.org/dist/node-v${PV}.tar.gz \
-  file://libev-cross-cc.patch \
-  file://node-cross-cc.patch \
-"
-SRC_URI[md5sum] = "c6051dd216817bf0f95bea80c42cf262"
-SRC_URI[sha256sum] = "5bb7d084b2138ce43fcb34739ed894379c450a1dd569a1c710405bc39d2861c2"
-
-S = "${WORKDIR}/node-v${PV}"
-
-# v8 errors out if you have set CCACHE
-CCACHE = ""
-
-do_configure () {
-  ./configure --prefix=${prefix} --without-snapshot
-}
-
-do_compile () {
-  make
-}
-
-do_install () {
-  DESTDIR=${D} oe_runmake install
-}
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/nodejs/nodejs_0.2.6.bb b/recipes/nodejs/nodejs_0.2.6.bb
new file mode 100644
index 0000000..76ad993
--- /dev/null
+++ b/recipes/nodejs/nodejs_0.2.6.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT"
+
+DEPENDS = "openssl"
+
+SRC_URI = " \
+  http://nodejs.org/dist/node-v${PV}.tar.gz \
+  file://libev-cross-cc_${PV}.patch \
+  file://node-cross-cc_${PV}.patch \
+"
+SRC_URI[md5sum] = "b1c50ceb43bee1b221be210b7bc7a216"
+SRC_URI[sha256sum] = "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
+
+S = "${WORKDIR}/node-v${PV}"
+
+# v8 errors out if you have set CCACHE
+CCACHE = ""
+
+do_configure () {
+  ./configure --prefix=${prefix} --without-snapshot
+}
+
+do_compile () {
+  make
+}
+
+do_install () {
+  DESTDIR=${D} oe_runmake install
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.1



