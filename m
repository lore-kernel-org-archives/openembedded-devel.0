Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OlzJ2-0000Lq-CB
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 09:12:57 +0200
Received: by pxi11 with SMTP id 11so587620pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 00:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=VtY2JYG1RTv0HsX1TGhCZg51Y5CY61umBdZTar0YcJE=;
	b=kFElGTWGbdooIGba+oDvqSecpsSh1hAV8xzYJrg009LrrAgNYSJ4Lx0ZusFKAKt65b
	M6+ewmrNiR5FrP/b6qWF2pTQGcNNNWJ8Bt+02RyOAoRSwBVFE1m3kkx+SulWswLisl22
	JyAoHWBE92IuG1wyJl38/erCsuA3X1gJa6ucA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=bKGfdA+Sy6AT3zVJZXqudyHXc7bnMzudlzqfPzPo/k8Is9F8AMVx3aJVNM53cGNJEE
	AMRH+4kxg7nVga/U+0+CSPUOztb75BtUPgW7QQKRxtINXZprFj/4D94T8kd342/XQmHF
	uVHgRrvXXqyrDkrc5QQKJsUTLjSZyxvvcFfmc=
Received: by 10.142.147.7 with SMTP id u7mr8007269wfd.218.1282198101542;
	Wed, 18 Aug 2010 23:08:21 -0700 (PDT)
Received: from localhost.localdomain ([76.8.213.37])
	by mx.google.com with ESMTPS id n2sm1282266wfl.13.2010.08.18.23.08.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 23:08:20 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>,
	"General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Date: Thu, 19 Aug 2010 00:07:48 -0600
Message-Id: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Thu, 19 Aug 2010 07:12:57 -0000

---
 recipes/node/files/libev-arm-cross.patch |   45 ++++++++++++++++++++++++++++++
 recipes/node/files/node-arm-cross.patch  |   31 ++++++++++++++++++++
 recipes/node/node_0.1.104.bb             |   28 ++++++++++++++++++
 recipes/node/node_v0.1.104.bb            |   23 +++++++++++++++
 4 files changed, 127 insertions(+), 0 deletions(-)
 create mode 100644 recipes/node/files/libev-arm-cross.patch
 create mode 100644 recipes/node/files/node-arm-cross.patch
 create mode 100644 recipes/node/node_0.1.104.bb
 create mode 100644 recipes/node/node_v0.1.104.bb

diff --git a/recipes/node/files/libev-arm-cross.patch b/recipes/node/files/libev-arm-cross.patch
new file mode 100644
index 0000000..340dd98
--- /dev/null
+++ b/recipes/node/files/libev-arm-cross.patch
@@ -0,0 +1,45 @@
+diff --git node-v0.1.104/deps/libev/wscript.orig node-v0.1.104/deps/libev/wscript
+index 19e7bb2..a62f418 100644
+--- node-v0.1.104/deps/libev/wscript.orig
++++ node-v0.1.104/deps/libev/wscript
+@@ -40,20 +40,27 @@ def configure(conf):
+   if conf.check_cc(header_name="sys/eventfd.h"):
+     conf.check_cc(header_name="sys/eventfd.h", function_name="eventfd")
+ 
++  # TODO find a way to determine this from the environment
++  CROSS = True
++  TARGET_OS = "linux"
+ 
+-  code = """
+-      #include <syscall.h>
+-      #include <time.h>
+-      #include <stdio.h>
+-
+-      int main() {
+-          struct timespec ts; 
+-          int status = syscall(SYS_clock_gettime, CLOCK_REALTIME, &ts);
+-          return 0;
+-      }
+-  """
+-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
+-                msg="Checking for SYS_clock_gettime")
++  if CROSS:
++    if TARGET_OS == 'linux':
++      conf.define("HAVE_CLOCK_SYSCALL", 1)
++  else:
++    code = """
++        #include <syscall.h>
++        #include <time.h>
++        #include <stdio.h>
++
++        int main() {
++            struct timespec ts; 
++            int status = syscall(SYS_clock_gettime, CLOCK_REALTIME, &ts);
++            return 0;
++        }
++    """
++    conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
++                  msg="Checking for SYS_clock_gettime")
+ 
+   have_librt = conf.check(lib='rt', uselib_store='RT')
+   if have_librt:
diff --git a/recipes/node/files/node-arm-cross.patch b/recipes/node/files/node-arm-cross.patch
new file mode 100644
index 0000000..8ee6c18
--- /dev/null
+++ b/recipes/node/files/node-arm-cross.patch
@@ -0,0 +1,31 @@
+diff --git node-v0.1.104/wscript.orig node-v0.1.104/wscript
+index ba60514..d6a54fe 100644
+--- node-v0.1.104/wscript.orig
++++ node-v0.1.104/wscript
+@@ -313,17 +313,25 @@ def v8_cmd(bld, variant):
+   # cannot see symbols in the executable which are hidden, even if the
+   # executable is statically linked together...
+ 
++  HOST_CPU = 'not-arm' # TODO probe for this
++  snapshot = 'snapshot=on'
++
+   # XXX Remove this when v8 defaults x86_64 to native builds
+   arch = ""
+   if bld.env['DEST_CPU'] == 'x86_64':
+     arch = "arch=x64"
++  elif bld.env['DEST_CPU'] == 'arm':
++    arch = "arch=arm"
++
++  if bld.env['DEST_CPU'] != HOST_CPU:
++    snapshot = ""
+ 
+   if variant == "default":
+     mode = "release"
+   else:
+     mode = "debug"
+ 
+-  cmd_R = 'python "%s" -j %d -C "%s" -Y "%s" visibility=default mode=%s %s library=static snapshot=on'
++  cmd_R = 'python "%s" -j %d -C "%s" -Y "%s" visibility=default mode=%s %s library=static ' + snapshot
+ 
+   cmd = cmd_R % ( scons
+                 , Options.options.jobs
diff --git a/recipes/node/node_0.1.104.bb b/recipes/node/node_0.1.104.bb
new file mode 100644
index 0000000..a99eaff
--- /dev/null
+++ b/recipes/node/node_0.1.104.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+PR = "r0"
+DEPENDS = "openssl"
+SRC_URI = " \
+http://nodejs.org/dist/node-v${PV}.tar.gz \
+file://libev-arm-cross.patch;apply=yes \
+file://node-arm-cross.patch;apply=yes \
+"
+SRC_URI[md5sum] = "907fa1e0a2f1f0c3df5efc97fd05a7d2"
+SRC_URI[sha256sum] = "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c27448ad85bec272df"
+S = "${WORKDIR}/node-v${PV}"
+do_configure () {
+export DEST_CPU=arm
+./configure
+# skip complaints about 'config.log'
+cat /dev/null > ${S}/build/config.log
+}
+do_qa_configure () {
+}
+do_compile () {
+export DEST_CPU=arm
+make
+}
+do_install () {
+install -d ${D}${bindir}/
+install -m 0755 ${S}/node ${D}${bindir}/
+}
+FILES_${PN} = "${bindir}/node"
diff --git a/recipes/node/node_v0.1.104.bb b/recipes/node/node_v0.1.104.bb
new file mode 100644
index 0000000..368b8fb
--- /dev/null
+++ b/recipes/node/node_v0.1.104.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+PR = "r0"
+DEPENDS = "openssl"
+SRC_URI = " \
+http://nodejs.org/dist/node-v${PV}.tar.gz \
+"
+#libev-cross.patch
+#node-cross.patch
+SRC_URI[md5sum] = "907fa1e0a2f1f0c3df5efc97fd05a7d2"
+SRC_URI[sha256sum] = "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c27448ad85bec272df"
+S = "${WORKDIR}/node-v${PV}"
+do_configure () {
+./configure
+}
+do_compile () {
+export DEST_CPU=arm
+make
+}
+do_install () {
+install -d ${D}${bindir}/
+install -m 0755 ${S}/node ${D}${bindir}/
+}
+FILES_${PN} = "${bindir}/node"
-- 
1.6.0.4



