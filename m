Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PhoTR-0005sD-Cu
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 20:22:41 +0100
Received: by pxi17 with SMTP id 17so1053998pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+mHhqKeLOD5O57pq+a27d9QOsvCC1JgHJO1doga3aZI=;
	b=X10eeZxqHpWxa5xd1NqZz4c7GJ3QgcCvfwLj+3Wdv2DJZ7zb0L4SeslVwNdxvwuMiy
	dViOaqRwG5tXxL1bJN9L+zMJEkI1Qb4+4SMfGhCXa86BflusL0SD3wd/QdP34sT0KvCe
	5neq79am3YjkgXy598tNzw93n6agz+1c1uTn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=mMpt1qo4gjgUnc/HSu5TuKP2rBFw7AMai5coQGlCJUHrgg6mh0byKEsrS2bqNuw2Bm
	CefmG0da5CHjFF4HP0aAhOB1SK9HoVToRpLZN6SE9KQasT4vj/k75lnUICO8h+FnZDxX
	1CpggGJefgNTTkSfRY9atYrxk9RVJV8jMOgzQ=
Received: by 10.142.178.7 with SMTP id a7mr2219009wff.194.1295983313752;
	Tue, 25 Jan 2011 11:21:53 -0800 (PST)
Received: from localhost.localdomain ([208.97.56.70])
	by mx.google.com with ESMTPS id v19sm19204022wfh.0.2011.01.25.11.21.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Jan 2011 11:21:51 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jan 2011 12:24:39 -0700
Message-Id: <1295983479-15511-1-git-send-email-coolaj86@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Tue, 25 Jan 2011 19:22:41 -0000

* libev-cross-cc.patch - turns off execution so that cross-compile succeeds
* node-cross-cc.patch - enables cross-compiling of v8 for x86, x86_64, arm, and mips
---
 recipes/nodejs/files/libev-cross-cc.patch |   17 +++++---------
 recipes/nodejs/files/node-cross-cc.patch  |   19 ++++++++++------
 recipes/nodejs/nodejs_0.2.6.bb            |   34 +++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 18 deletions(-)
 create mode 100644 recipes/nodejs/nodejs_0.2.6.bb

diff --git a/recipes/nodejs/files/libev-cross-cc.patch b/recipes/nodejs/files/libev-cross-cc.patch
index 4dd34f4..13ce4d8 100644
--- a/recipes/nodejs/files/libev-cross-cc.patch
+++ b/recipes/nodejs/files/libev-cross-cc.patch
@@ -1,18 +1,13 @@
-diff --git node-v0.2.1/deps/libev/wscript.orig node-v0.2.1/deps/libev/wscript
-index 19e7bb2..f0a3d3b 100644
---- node-v0.2.1/deps/libev/wscript.orig
-+++ node-v0.2.1/deps/libev/wscript
-@@ -52,7 +52,12 @@ def configure(conf):
+diff --git node-v0.2.6/deps/libev/wscript.orig node-v0.2.6/deps/libev/wscript
+index 19e7bb2..5ec9143 100644
+--- node-v0.2.6/deps/libev/wscript.orig
++++ node-v0.2.6/deps/libev/wscript
+@@ -52,7 +52,7 @@ def configure(conf):
            return 0;
        }
    """
 -  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
-+  # TODO determine this dynamically
-+  CROSS = True
-+  execute = True
-+  if CROSS:
-+    execute = False
-+  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=execute,
++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
                  msg="Checking for SYS_clock_gettime")
  
    have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/recipes/nodejs/files/node-cross-cc.patch b/recipes/nodejs/files/node-cross-cc.patch
index 0d15afc..1087ce2 100644
--- a/recipes/nodejs/files/node-cross-cc.patch
+++ b/recipes/nodejs/files/node-cross-cc.patch
@@ -1,14 +1,19 @@
-diff --git node-v0.2.1/wscript.orig node-v0.2.1/wscript
-index 9c4243c..3cf6689 100644
---- node-v0.2.1/wscript.orig
-+++ node-v0.2.1/wscript
-@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
+diff --git node-v0.2.6/wscript.orig node-v0.2.6/wscript
+index a6bade2..566bf5e 100644
+--- node-v0.2.6/wscript.orig
++++ node-v0.2.6/wscript
+@@ -338,6 +338,14 @@ def v8_cmd(bld, variant):
    arch = ""
    if bld.env['DEST_CPU'] == 'x86_64':
      arch = "arch=x64"
-+  # XXX Better support cross-compilation
++  elif bld.env['DEST_CPU'] == 'x86':
++    arch = "arch=x86"
++  elif bld.env['DEST_CPU'] == 'arm':
++    arch = "arch=arm"
++  elif bld.env['DEST_CPU'] == 'mips':
++    arch = "arch=mips"
 +  else:
-+    arch = "arch=" + bld.env['DEST_CPU']
++    raise Exception(bld.env['DEST_CPU'], "is not one of these supported architectures: x86, x86_64, arm, mips")
  
    if variant == "default":
      mode = "release"
diff --git a/recipes/nodejs/nodejs_0.2.6.bb b/recipes/nodejs/nodejs_0.2.6.bb
new file mode 100644
index 0000000..e2d8b19
--- /dev/null
+++ b/recipes/nodejs/nodejs_0.2.6.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT"
+
+PR = "r4"
+
+DEPENDS = "openssl"
+
+SRC_URI = " \
+  http://nodejs.org/dist/node-v${PV}.tar.gz \
+  file://libev-cross-cc.patch \
+  file://node-cross-cc.patch \
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



