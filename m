Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OvvWK-0001hG-Mk
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 19:11:47 +0200
Received: by pvg6 with SMTP id 6so130867pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ObGU9R10okoUJCFhni2X+RHwIolS/R7FH4a9nZs45cg=;
	b=OXtpWsfu+PklMXMRSz6XP6xmY4EDsfIX4UGdstjrP1XiNVZ422NRu+B6Ywg+lCLkfk
	s1HZ4PYA+KwaMjjyRhtRPXNXW4inkDUOjWltsIshpF9OZn7LY4NnloYBAciIdkhQ6Wti
	4Xo5YN9QLyBkYPK9478PZzrA6AHXdLTRZ/kqs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=DQCTXPg/HYmR4pApSawV+/TS+rH0RYwyTYw/C4d9nwzbA4xI436meCjRYYmaSy1rcu
	ryXJPR5Q1bIc55Wgxr0BCf2umoE+4Kv4S2Jvvcs/ieYiZZGYKU0s+KDNJSM58E5XzuRj
	uUoOzTv606ZgxWmfw02WBHXI2ypWJQ20mZxtU=
Received: by 10.114.103.19 with SMTP id a19mr2207542wac.59.1284570651382;
	Wed, 15 Sep 2010 10:10:51 -0700 (PDT)
Received: from localhost.localdomain ([208.97.56.70])
	by mx.google.com with ESMTPS id x9sm2698390waj.15.2010.09.15.10.10.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Sep 2010 10:10:50 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Sep 2010 11:05:32 -0600
Message-Id: <1284570332-6484-1-git-send-email-coolaj86@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: AJ ONeal <coolaj86+fastr@gmail.com>
Subject: [PATCH] nodejs: replaced v0.2.0 with v0.2.1
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
X-List-Received-Date: Wed, 15 Sep 2010 17:11:47 -0000

From: AJ ONeal <coolaj86+fastr@gmail.com>

* now includes node-waf and node-repl
* updated pathname in libev-cross-cc and libev-cross-cc
* removed patch which is no longer necessary (applied upstream)

Signed-off-by: AJ ONeal <coolaj86@gmail.com>
---
 recipes/nodejs/files/libev-cross-cc.patch          |    6 ++--
 recipes/nodejs/files/node-cross-cc.patch           |    8 ++--
 .../node-dont-include-hosts-usr-include.patch      |   22 -------------
 recipes/nodejs/nodejs_0.2.0.bb                     |   32 --------------------
 recipes/nodejs/nodejs_0.2.1.bb                     |   28 +++++++++++++++++
 5 files changed, 35 insertions(+), 61 deletions(-)
 delete mode 100644 recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
 delete mode 100644 recipes/nodejs/nodejs_0.2.0.bb
 create mode 100644 recipes/nodejs/nodejs_0.2.1.bb

diff --git a/recipes/nodejs/files/libev-cross-cc.patch b/recipes/nodejs/files/libev-cross-cc.patch
index 446015b..4dd34f4 100644
--- a/recipes/nodejs/files/libev-cross-cc.patch
+++ b/recipes/nodejs/files/libev-cross-cc.patch
@@ -1,7 +1,7 @@
-diff --git node-v0.2.0/deps/libev/wscript.orig node-v0.2.0/deps/libev/wscript
+diff --git node-v0.2.1/deps/libev/wscript.orig node-v0.2.1/deps/libev/wscript
 index 19e7bb2..f0a3d3b 100644
---- node-v0.2.0/deps/libev/wscript.orig
-+++ node-v0.2.0/deps/libev/wscript
+--- node-v0.2.1/deps/libev/wscript.orig
++++ node-v0.2.1/deps/libev/wscript
 @@ -52,7 +52,12 @@ def configure(conf):
            return 0;
        }
diff --git a/recipes/nodejs/files/node-cross-cc.patch b/recipes/nodejs/files/node-cross-cc.patch
index 48a6226..0d15afc 100644
--- a/recipes/nodejs/files/node-cross-cc.patch
+++ b/recipes/nodejs/files/node-cross-cc.patch
@@ -1,7 +1,7 @@
-diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
-index df9ef53..a55d464 100644
---- node-v0.2.0/wscript.orig
-+++ node-v0.2.0/wscript
+diff --git node-v0.2.1/wscript.orig node-v0.2.1/wscript
+index 9c4243c..3cf6689 100644
+--- node-v0.2.1/wscript.orig
++++ node-v0.2.1/wscript
 @@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
    arch = ""
    if bld.env['DEST_CPU'] == 'x86_64':
diff --git a/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
deleted file mode 100644
index edbf7c4..0000000
--- a/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
-index 3c5ebc5..905bd58 100644
---- node-v0.2.0/wscript.orig
-+++ node-v0.2.0/wscript
-@@ -162,11 +162,12 @@ def configure(conf):
-   if Options.options.efence:
-     conf.check(lib='efence', libpath=['/usr/lib', '/usr/local/lib'], uselib_store='EFENCE')
- 
--  if not conf.check(lib="execinfo", includes=['/usr/include', '/usr/local/include'], libpath=['/usr/lib', '/usr/local/lib'], uselib_store="EXECINFO"):
--    # Note on Darwin/OS X: This will fail, but will still be used as the
--    # execinfo stuff are part of the standard library.
--    if sys.platform.startswith("freebsd"):
--      conf.fatal("Install the libexecinfo port from /usr/ports/devel/libexecinfo.")
-+  # OpenEmbedded doesn't like us checking here
-+  #if not conf.check(lib="execinfo", includes=['/usr/include', '/usr/local/include'], libpath=['/usr/lib', '/usr/local/lib'], uselib_store="EXECINFO"):
-+  #  # Note on Darwin/OS X: This will fail, but will still be used as the
-+  #  # execinfo stuff are part of the standard library.
-+  #  if sys.platform.startswith("freebsd"):
-+  #    conf.fatal("Install the libexecinfo port from /usr/ports/devel/libexecinfo.")
- 
-   if not Options.options.without_ssl:
-     if conf.check_cfg(package='openssl',
diff --git a/recipes/nodejs/nodejs_0.2.0.bb b/recipes/nodejs/nodejs_0.2.0.bb
deleted file mode 100644
index 7dfa04e..0000000
--- a/recipes/nodejs/nodejs_0.2.0.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT"
-
-DEPENDS = "openssl"
-
-SRC_URI = " \
-  http://nodejs.org/dist/node-v${PV}.tar.gz \
-  file://node-cross-cc.patch \
-  file://libev-cross-cc.patch \
-  file://node-dont-include-hosts-usr-include.patch \
-"
-SRC_URI[md5sum] = "99a6dacc44b3f9c6ec376ccb446dd0b8"
-SRC_URI[sha256sum] = "3d3eff9287c9917af4044f3cef99ae5b17946710a71e83039de4fcb4b0a26631"
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
diff --git a/recipes/nodejs/nodejs_0.2.1.bb b/recipes/nodejs/nodejs_0.2.1.bb
new file mode 100644
index 0000000..5479118
--- /dev/null
+++ b/recipes/nodejs/nodejs_0.2.1.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT"
+DEPENDS = "openssl"
+SRC_URI = " \
+  http://nodejs.org/dist/node-v${PV}.tar.gz \
+  file://libev-cross-cc.patch \
+  file://node-cross-cc.patch \
+"
+SRC_URI[md5sum] = "c6051dd216817bf0f95bea80c42cf262"
+SRC_URI[sha256sum] = "5bb7d084b2138ce43fcb34739ed894379c450a1dd569a1c710405bc39d2861c2"
+S = "${WORKDIR}/node-v${PV}"
+do_configure () {
+  ./configure --without-snapshot
+}
+do_compile () {
+  make
+}
+do_install () {
+  #oe_runmake install # doesn't install to correct location
+
+  # This works
+  install -d ${D}${bindir}/
+  install -m 0755 ${S}/build/default/node ${D}${bindir}/
+  install -m 0755 ${S}/bin/node-waf ${D}${bindir}/
+  install -m 0755 ${S}/bin/node-repl ${D}${bindir}/
+}
+FILES_${PN} = "${bindir}/node ${bindir}/node-repl ${bindir}/node-waf"
-- 
1.6.3.3



