Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1On1Fo-0001Zk-9X
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 05:29:56 +0200
Received: by pvg6 with SMTP id 6so1848787pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 20:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ktmryXAkYJee/pDYJKcXXxl5zP1ivTqLA8q6KiZMj4U=;
	b=t44l3JmdZxpstubI+8hGWem+LOwOjBEbfbT0yNdTi1UngJcUgMJp4ZKCk63Kwlx/1T
	B5zCwy4N6ck3E7RUJg4Djkj9RSOFMhltM4bwYD7ddqqCGhV1qoOU0tRDIQib+ZA4zCu4
	oKGDRwCYQTel8xbBr6LgFoUc3E8fAfzsMcok4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pyb6r+V4WIZMqeANcNJVio3jh0Ecc0g+XYDDltLuKMb8ozfDW0lNGyYei5HBl4YOoE
	fKrpgIzKyqSLQNkqO3i3umUxKO9I7EbUh+LgmAGTIJVGmlROuIO+bmJyzlGq4ZZXb0NE
	62XTQyPtQHuu+jayoksRBmk/0J/JyxWASH4GU=
Received: by 10.114.111.13 with SMTP id j13mr3834254wac.123.1282447767827;
	Sat, 21 Aug 2010 20:29:27 -0700 (PDT)
Received: from localhost.localdomain ([76.8.213.37])
	by mx.google.com with ESMTPS id c10sm8930693wam.1.2010.08.21.20.29.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 21 Aug 2010 20:29:27 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Aug 2010 21:28:29 -0600
Message-Id: <1282447709-15130-1-git-send-email-coolaj86@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] [v2] added recipe for nodejs
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
X-List-Received-Date: Sun, 22 Aug 2010 03:29:56 -0000

---
 recipes/nodejs/files/libev-cross-cc.patch          |   18 ++++++++++++
 recipes/nodejs/files/node-cross-cc.patch           |   14 ++++++++++
 .../node-dont-include-hosts-usr-include.patch      |   22 +++++++++++++++
 recipes/nodejs/nodejs_0.2.0.bb                     |   28 ++++++++++++++++++++
 4 files changed, 82 insertions(+), 0 deletions(-)
 create mode 100644 recipes/nodejs/files/libev-cross-cc.patch
 create mode 100644 recipes/nodejs/files/node-cross-cc.patch
 create mode 100644 recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
 create mode 100644 recipes/nodejs/nodejs_0.2.0.bb

diff --git a/recipes/nodejs/files/libev-cross-cc.patch b/recipes/nodejs/files/libev-cross-cc.patch
new file mode 100644
index 0000000..446015b
--- /dev/null
+++ b/recipes/nodejs/files/libev-cross-cc.patch
@@ -0,0 +1,18 @@
+diff --git node-v0.2.0/deps/libev/wscript.orig node-v0.2.0/deps/libev/wscript
+index 19e7bb2..f0a3d3b 100644
+--- node-v0.2.0/deps/libev/wscript.orig
++++ node-v0.2.0/deps/libev/wscript
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
diff --git a/recipes/nodejs/files/node-cross-cc.patch b/recipes/nodejs/files/node-cross-cc.patch
new file mode 100644
index 0000000..48a6226
--- /dev/null
+++ b/recipes/nodejs/files/node-cross-cc.patch
@@ -0,0 +1,14 @@
+diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
+index df9ef53..a55d464 100644
+--- node-v0.2.0/wscript.orig
++++ node-v0.2.0/wscript
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
diff --git a/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
new file mode 100644
index 0000000..edbf7c4
--- /dev/null
+++ b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
@@ -0,0 +1,22 @@
+diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
+index 3c5ebc5..905bd58 100644
+--- node-v0.2.0/wscript.orig
++++ node-v0.2.0/wscript
+@@ -162,11 +162,12 @@ def configure(conf):
+   if Options.options.efence:
+     conf.check(lib='efence', libpath=['/usr/lib', '/usr/local/lib'], uselib_store='EFENCE')
+ 
+-  if not conf.check(lib="execinfo", includes=['/usr/include', '/usr/local/include'], libpath=['/usr/lib', '/usr/local/lib'], uselib_store="EXECINFO"):
+-    # Note on Darwin/OS X: This will fail, but will still be used as the
+-    # execinfo stuff are part of the standard library.
+-    if sys.platform.startswith("freebsd"):
+-      conf.fatal("Install the libexecinfo port from /usr/ports/devel/libexecinfo.")
++  # OpenEmbedded doesn't like us checking here
++  #if not conf.check(lib="execinfo", includes=['/usr/include', '/usr/local/include'], libpath=['/usr/lib', '/usr/local/lib'], uselib_store="EXECINFO"):
++  #  # Note on Darwin/OS X: This will fail, but will still be used as the
++  #  # execinfo stuff are part of the standard library.
++  #  if sys.platform.startswith("freebsd"):
++  #    conf.fatal("Install the libexecinfo port from /usr/ports/devel/libexecinfo.")
+ 
+   if not Options.options.without_ssl:
+     if conf.check_cfg(package='openssl',
diff --git a/recipes/nodejs/nodejs_0.2.0.bb b/recipes/nodejs/nodejs_0.2.0.bb
new file mode 100644
index 0000000..83bfa2e
--- /dev/null
+++ b/recipes/nodejs/nodejs_0.2.0.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT"
+DEPENDS = "openssl"
+SRC_URI = " \
+  http://nodejs.org/dist/node-v${PV}.tar.gz \
+  file://node-cross-cc.patch \
+  file://libev-cross-cc.patch \
+  file://node-dont-include-hosts-usr-include.patch \
+"
+#file://libev-arm-cross.patch \
+SRC_URI[md5sum] = "99a6dacc44b3f9c6ec376ccb446dd0b8"
+SRC_URI[sha256sum] = "3d3eff9287c9917af4044f3cef99ae5b17946710a71e83039de4fcb4b0a26631"
+S = "${WORKDIR}/node-v${PV}"
+do_configure () {
+  ./configure --prefix=${D} --without-snapshot
+}
+do_compile () {
+  make
+}
+do_install () {
+  #oe_runmake install # doesn't install to correct location
+
+  # This works
+  install -d ${D}${bindir}/
+  install -m 0755 ${S}/node ${D}${bindir}/
+}
+FILES_${PN} = "${bindir}/node"
-- 
1.6.0.4



