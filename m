Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U7Lmb-0007kD-VE
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 09:09:15 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 838C9D22B3;
	Mon, 18 Feb 2013 08:53:01 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Feb 2013 08:52:54 +0100
Message-Id: <1361173974-9291-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <20130215214048.GP3300@jama>
References: <20130215214048.GP3300@jama>
Subject: [meta-oe][PATCH 8/8] libmemcached: add 1.0.15 and 1.0.7 versions
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
X-List-Received-Date: Mon, 18 Feb 2013 08:09:16 -0000

1.0.15 is latest
1.0.7 is required by HipHopVM

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../libmemcached/files/crosscompile.patch          | 30 ++++++++++++++++++++++
 .../recipes-support/libmemcached/libmemcached.inc  | 10 ++++++++
 .../libmemcached/libmemcached_1.0.15.bb            |  6 +++++
 .../libmemcached/libmemcached_1.0.7.bb             |  8 ++++++
 4 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-support/libmemcached/files/crosscompile.patch
 create mode 100644 meta-networking/recipes-support/libmemcached/libmemcached.inc
 create mode 100644 meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb
 create mode 100644 meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb

diff --git a/meta-networking/recipes-support/libmemcached/files/crosscompile.patch b/meta-networking/recipes-support/libmemcached/files/crosscompile.patch
new file mode 100644
index 0000000..63511bf
--- /dev/null
+++ b/meta-networking/recipes-support/libmemcached/files/crosscompile.patch
@@ -0,0 +1,30 @@
+ libmemcached/backtrace.cc |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- libmemcached-1.0.15.orig/libmemcached/backtrace.cc
++++ libmemcached-1.0.15/libmemcached/backtrace.cc
+@@ -75,10 +75,11 @@ void custom_backtrace(void)
+     {
+       for (int x= 0; x < stack_frames; x++) 
+       {
+         bool was_demangled= false;
+ 
++#if USE_DEMANGLE == 1
+         if (USE_DEMANGLE)
+         {
+ #ifdef HAVE_DLFCN_H
+           Dl_info dlinfo;
+           if (dladdr(backtrace_buffer[x], &dlinfo))
+@@ -107,11 +108,11 @@ void custom_backtrace(void)
+                       dlinfo.dli_fname);
+             }
+           }
+ #endif
+         }
+-
++#endif
+         if (was_demangled == false)
+         {
+           fprintf(stderr, "?%d  %p in %s\n", x, backtrace_buffer[x], symbollist[x]);
+         }
+       }
diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.inc b/meta-networking/recipes-support/libmemcached/libmemcached.inc
new file mode 100644
index 0000000..448a15d
--- /dev/null
+++ b/meta-networking/recipes-support/libmemcached/libmemcached.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "open source C/C++ client library and tools for the memcached server"
+DEPENDS = "libevent util-linux"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=865490941c91ba790f0ea78dec93bd60"
+
+SRC_URI = "http://launchpad.net/libmemcached/1.0/${PV}/+download/libmemcached-${PV}.tar.gz"
+
+TARGET_LDFLAGS += "-luuid"
+
+inherit autotools gettext pkgconfig
diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb
new file mode 100644
index 0000000..18232b4
--- /dev/null
+++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb
@@ -0,0 +1,6 @@
+require libmemcached.inc
+
+SRC_URI += "file://crosscompile.patch"
+
+SRC_URI[md5sum] = "616297a1aedefc52b3f6922eda5d559a"
+SRC_URI[sha256sum] = "dd7e9560029835bddf761a5b4c2339d9e5c7374558659b6c11b2c95e7d3a4325"
diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
new file mode 100644
index 0000000..0aa3050
--- /dev/null
+++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
@@ -0,0 +1,8 @@
+require libmemcached.inc
+
+SRC_URI[md5sum] = "d59a462a92d296f76bff2d9bc72b2516"
+SRC_URI[sha256sum] = "3efa86c9733eaad55d7119cb16769424e2aa6c22b3392e8f973946fce6678d81"
+
+do_configure_prepend_aarch64() {
+    export ac_cv_c_endian=little
+}
-- 
1.8.1.2



