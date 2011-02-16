Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ppeic-0000xO-FA
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:34:46 +0100
Received: (qmail 19852 invoked by uid 503); 16 Feb 2011 11:16:18 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 16 Feb 2011 11:16:18 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Feb 2011 12:33:37 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Feb 2011 12:33:35 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:33:49 +0100
Message-Id: <1297852433-31160-5-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297852433-31160-1-git-send-email-eric@eukrea.com>
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12105394324504227149
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 05/10] nodejs: add 0.4.0
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
X-List-Received-Date: Wed, 16 Feb 2011 10:34:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

compile tested for armv5, previous node-cross-cc_0.2.6.patch
doesn't seems anymore necessary unless I made a mistake, AJ may
you please check this point ?

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: AJ ONeal <coolaj86@gmail.com>
---
 recipes/nodejs/files/libev-cross-cc_0.4.0.patch |   13 +++++++++
 recipes/nodejs/nodejs_0.4.0.bb                  |   32 +++++++++++++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 recipes/nodejs/files/libev-cross-cc_0.4.0.patch
 create mode 100644 recipes/nodejs/nodejs_0.4.0.bb

diff --git a/recipes/nodejs/files/libev-cross-cc_0.4.0.patch b/recipes/nodejs/files/libev-cross-cc_0.4.0.patch
new file mode 100644
index 0000000..2b9838f
--- /dev/null
+++ b/recipes/nodejs/files/libev-cross-cc_0.4.0.patch
@@ -0,0 +1,13 @@
+diff --git a/deps/libev/wscript b/deps/libev/wscript
+index 4f6c9a8..1796749 100644
+--- a/deps/libev/wscript
++++ b/deps/libev/wscript
+@@ -58,7 +58,7 @@ def configure(conf):
+           return 0;
+       }
+   """
+-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
+                 msg="Checking for SYS_clock_gettime")
+ 
+   have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/recipes/nodejs/nodejs_0.4.0.bb b/recipes/nodejs/nodejs_0.4.0.bb
new file mode 100644
index 0000000..be3d23e
--- /dev/null
+++ b/recipes/nodejs/nodejs_0.4.0.bb
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
+"
+
+SRC_URI[md5sum] = "18f89256751f9b8e27dee8494f508171"
+SRC_URI[sha256sum] = "4a30bd9963373cb86a994479bdd451ab3b6f2124f0089493366315da79d3408e"
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



