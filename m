Return-Path: <sjl@dent.vctlabs.com>
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id F3DC7770EC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Oct 2015 00:57:05 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 5376BC0780; Sat,  3 Oct 2015 18:13:11 -0700 (PDT)
Date: Sat, 3 Oct 2015 18:13:11 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151004011311.GG3552@dent.vctlabs.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-oe][PATCH] libimobiledevice: fix gcc 5 link failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Oct 2015 00:57:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Drop 'inline' from some functions that had 'inline' keyword without
a definition at that point (they were defined in a different file).

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../files/inline-without-definition.patch          | 31 ++++++++++++++++++++++
 .../libimobiledevice/libimobiledevice_1.1.4.bb     |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/files/inline-without-definition.patch

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/files/inline-without-definition.patch b/meta-oe/recipes-connectivity/libimobiledevice/files/inline-without-definition.patch
new file mode 100644
index 0000000..eec60e8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice/files/inline-without-definition.patch
@@ -0,0 +1,31 @@
+Fix link error with gcc 5 toolchains
+
+ afc.c:258: error: undefined reference to 'debug_buffer'
+ collect2: error: ld returned 1 exit status
+
+debug.h header was declaring things inline without providing a definition.
+Files that included this header then failed to link against the corresponding
+external symbol in debug.c, because the linker took the 'inline' keyword
+seriously rather than ignoring it.
+
+--- libimobiledevice-1.1.4/src/debug.h.orig	2015-10-03 16:24:08.758740386 -0700
++++ libimobiledevice-1.1.4/src/debug.h	2015-10-03 16:24:22.706740355 -0700
+@@ -44,14 +44,14 @@
+ #define debug_plist(a)
+ #endif
+ 
+-LIBIMOBILEDEVICE_INTERNAL inline void debug_info_real(const char *func,
++LIBIMOBILEDEVICE_INTERNAL void debug_info_real(const char *func,
+ 											const char *file,
+ 											int	line,
+ 											const char *format, ...);
+ 
+-LIBIMOBILEDEVICE_INTERNAL inline void debug_buffer(const char *data, const int length);
+-LIBIMOBILEDEVICE_INTERNAL inline void debug_buffer_to_file(const char *file, const char *data, const int length);
+-LIBIMOBILEDEVICE_INTERNAL inline void debug_plist_real(const char *func,
++LIBIMOBILEDEVICE_INTERNAL void debug_buffer(const char *data, const int length);
++LIBIMOBILEDEVICE_INTERNAL void debug_buffer_to_file(const char *file, const char *data, const int length);
++LIBIMOBILEDEVICE_INTERNAL void debug_plist_real(const char *func,
+ 											const char *file,
+ 											int	line,
+ 											plist_t plist);
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
index 06260f7..32aca96 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
@@ -12,6 +12,7 @@ DEPENDS = "libplist usbmuxd libtasn1 gnutls libgcrypt"
 SRC_URI = " \
     http://www.libimobiledevice.org/downloads/libimobiledevice-${PV}.tar.bz2 \
     file://configure-fix-largefile.patch \
+    file://inline-without-definition.patch \
 "
 
 SRC_URI[md5sum] = "3f28cbc6a2e30d34685049c0abde5183"
-- 
1.9.1


