Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PjHI5-0007g9-Ed
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 21:21:02 +0100
Received: by iyj18 with SMTP id 18so3828008iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=MddQ9DUc+npYgfOs0BS+c1D/2WsBBFML9e7oqZt93oA=;
	b=C4CUnyRbDEd9TeOSkntlEFi0Bu5x/S2gsW+Njyk+/L8sTbZ6AMP45IWqICbFWxFHdD
	S+fVWD+/j+EKy+dFtanlYHwUnF3Raby+8lW7VfU2n5tZTqXT5T3KVYhzzxTTN06SO7tj
	DFVWSxvyQoD5w2iF9GTVqrBxlInWsCP1L8Pwg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZTZwmGurlsOXg9hnoHo2wpE/t+/3bjKXnhzC41/C+QcNZChyh76XkYgHyIMLwyMbls
	wEH3V3xjppPGaW0OXdXMKUSWIPiHVhRdvwFXIf8duBBU+6CMS3x5FPan4f5oRfkR6E0S
	q5/EHeAtVRYfbK6a9ogkKxw5u2E2ZjUp+FXBo=
Received: by 10.42.175.70 with SMTP id az6mr5636596icb.428.1296332405070;
	Sat, 29 Jan 2011 12:20:05 -0800 (PST)
Received: from localhost.localdomain ([208.97.56.70])
	by mx.google.com with ESMTPS id u5sm14521787ics.18.2011.01.29.12.20.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Jan 2011 12:20:03 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Jan 2011 13:23:22 -0700
Message-Id: <1296332602-28899-1-git-send-email-coolaj86@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v3] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Sat, 29 Jan 2011 20:21:02 -0000

* left nodejs-v0.2.1 intact, patches renamed with -v0.2.1 suffix
* libev-cross-cc-v0.2.6.patch - turns off execution so that cross-compile succeeds
* node-cross-cc-v0.2.6.patch - enables cross-compiling of v8 for x86, x86_64, arm, and mips
---
 recipes/nodejs/files/libev-cross-cc-v0.2.1.patch |   18 ++++++++++++
 recipes/nodejs/files/libev-cross-cc-v0.2.6.patch |   13 +++++++++
 recipes/nodejs/files/libev-cross-cc.patch        |   18 ------------
 recipes/nodejs/files/node-cross-cc-v0.2.1.patch  |   14 +++++++++
 recipes/nodejs/files/node-cross-cc-v0.2.6.patch  |   19 +++++++++++++
 recipes/nodejs/files/node-cross-cc.patch         |   14 ---------
 recipes/nodejs/nodejs_0.2.1.bb                   |    6 ++--
 recipes/nodejs/nodejs_0.2.6.bb                   |   32 ++++++++++++++++++++++
 8 files changed, 99 insertions(+), 35 deletions(-)
 create mode 100644 recipes/nodejs/files/libev-cross-cc-v0.2.1.patch
 create mode 100644 recipes/nodejs/files/libev-cross-cc-v0.2.6.patch
 delete mode 100644 recipes/nodejs/files/libev-cross-cc.patch
 create mode 100644 recipes/nodejs/files/node-cross-cc-v0.2.1.patch
 create mode 100644 recipes/nodejs/files/node-cross-cc-v0.2.6.patch
 delete mode 100644 recipes/nodejs/files/node-cross-cc.patch
 create mode 100644 recipes/nodejs/nodejs_0.2.6.bb

diff --git a/recipes/nodejs/files/libev-cross-cc-v0.2.1.patch b/recipes/nodejs/files/libev-cross-cc-v0.2.1.patch
new file mode 100644
index 0000000..4dd34f4
--- /dev/null
+++ b/recipes/nodejs/files/libev-cross-cc-v0.2.1.patch
@@ -0,0 +1,18 @@
+diff --git node-v0.2.1/deps/libev/wscript.orig node-v0.2.1/deps/libev/wscript
+index 19e7bb2..f0a3d3b 100644
+--- node-v0.2.1/deps/libev/wscript.orig
++++ node-v0.2.1/deps/libev/wscript
+@@ -52,7 +52,12 @@ def configure(conf):
+           return 0;
+       }
+   """
+-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
++  # TODO determine this dynamically
++  CROSS = True
++  execute = True
++  if CROSS:
++    execute = False
++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=execute,
+                 msg="Checking for SYS_clock_gettime")
+ 
+   have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/recipes/nodejs/files/libev-cross-cc-v0.2.6.patch b/recipes/nodejs/files/libev-cross-cc-v0.2.6.patch
new file mode 100644
index 0000000..13ce4d8
--- /dev/null
+++ b/recipes/nodejs/files/libev-cross-cc-v0.2.6.patch
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
diff --git a/recipes/nodejs/files/node-cross-cc-v0.2.1.patch b/recipes/nodejs/files/node-cross-cc-v0.2.1.patch
new file mode 100644
index 0000000..0d15afc
--- /dev/null
+++ b/recipes/nodejs/files/node-cross-cc-v0.2.1.patch
@@ -0,0 +1,14 @@
+diff --git node-v0.2.1/wscript.orig node-v0.2.1/wscript
+index 9c4243c..3cf6689 100644
+--- node-v0.2.1/wscript.orig
++++ node-v0.2.1/wscript
+@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
+   arch = ""
+   if bld.env['DEST_CPU'] == 'x86_64':
+     arch = "arch=x64"
++  # XXX Better support cross-compilation
++  else:
++    arch = "arch=" + bld.env['DEST_CPU']
+ 
+   if variant == "default":
+     mode = "release"
diff --git a/recipes/nodejs/files/node-cross-cc-v0.2.6.patch b/recipes/nodejs/files/node-cross-cc-v0.2.6.patch
new file mode 100644
index 0000000..1087ce2
--- /dev/null
+++ b/recipes/nodejs/files/node-cross-cc-v0.2.6.patch
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
diff --git a/recipes/nodejs/nodejs_0.2.1.bb b/recipes/nodejs/nodejs_0.2.1.bb
index c2e9c41..1970766 100644
--- a/recipes/nodejs/nodejs_0.2.1.bb
+++ b/recipes/nodejs/nodejs_0.2.1.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "openssl"
 
 SRC_URI = " \
   http://nodejs.org/dist/node-v${PV}.tar.gz \
-  file://libev-cross-cc.patch \
-  file://node-cross-cc.patch \
+  file://libev-cross-cc-v${PV}.patch \
+  file://node-cross-cc-v${PV}.patch \
 "
 SRC_URI[md5sum] = "c6051dd216817bf0f95bea80c42cf262"
 SRC_URI[sha256sum] = "5bb7d084b2138ce43fcb34739ed894379c450a1dd569a1c710405bc39d2861c2"
diff --git a/recipes/nodejs/nodejs_0.2.6.bb b/recipes/nodejs/nodejs_0.2.6.bb
new file mode 100644
index 0000000..560adc6
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
+  file://libev-cross-cc-v${PV}.patch \
+  file://node-cross-cc-v${PV}.patch \
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
1.7.0.4



