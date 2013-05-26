Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id BC6FB6065B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 May 2013 21:37:01 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so6102429pbb.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 May 2013 14:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=lOcAXnGFNqT5MH3UC2nbDomXLnqbN13BIhCCWrJqDsk=;
	b=jE9X8J0F/BYec50HJQzwHSRszPLyWPlP8Vh1jVZ91XIkQF5CVX1aWqYfNarbtSV2Bh
	4uCtBbnj4JlQ0bhkFcJcF1EBhffOW+21YsOKVNFYNYBRcYOjmNZ1u48ocoytEzjf/sVZ
	ATmITeXJpbDMo1kTe4D+Ft4n+aEUQC1sn9Sw0G537TuRy1eAW+uaWQ+5iVzm/7R78Evz
	5/FF/G6rEmiIjWGTebEvrUm8t88lrWuC2ojAxLmIY8Ybm3p65yyKNpM9i1+h9wPTlNFc
	ZINx5uyXw+A2dtnSR2rM33/wkxUu0XoG00pnt2q+nyyaONFVe4Cqq/RbCzNjzjko6gWm
	Kk3Q==
X-Received: by 10.68.247.68 with SMTP id yc4mr26601493pbc.54.1369604223044;
	Sun, 26 May 2013 14:37:03 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	qb1sm25659069pbb.33.2013.05.26.14.37.01 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 14:37:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 May 2013 14:35:03 -0700
Message-Id: <1369604103-31315-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1369604103-31315-1-git-send-email-raj.khem@gmail.com>
References: <1369604103-31315-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-browser][PATCH 2/2] chromium: Add recipes for 29.0.1518
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
X-List-Received-Date: Sun, 26 May 2013 21:37:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: Eric Bénard <eric@eukrea.com>
CC: Denis Carikli <denis@eukrea.com>
CC: Otavio Salvador <otavio@ossystems.com.br>

---
 .../chromium-29.0.1518.2/armv6/include.gypi        |  8 ++
 .../chromium-29.0.1518.2/armv6/oe-defaults.gypi    | 15 ++++
 .../chromium-29.0.1518.2/armv7a/include.gypi       |  9 +++
 .../chromium-29.0.1518.2/armv7a/oe-defaults.gypi   | 15 ++++
 .../chromium-29.0.1518.2/i586/include.gypi         |  5 ++
 .../chromium-29.0.1518.2/i586/oe-defaults.gypi     | 15 ++++
 .../uninitialised-warning.patch                    | 90 ++++++++++++++++++++++
 .../chromium/chromium-29.0.1518.2/unistd-2.patch   | 27 +++++++
 .../chromium-29.0.1518.2/x86-64/include.gypi       |  5 ++
 .../chromium-29.0.1518.2/x86-64/oe-defaults.gypi   | 15 ++++
 recipes-browser/chromium/chromium_29.0.1518.2.bb   | 72 +++++++++++++++++
 11 files changed, 276 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
 create mode 100644 recipes-browser/chromium/chromium_29.0.1518.2.bb

diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
new file mode 100644
index 0000000..2c88271
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
@@ -0,0 +1,8 @@
+{
+  'variables': {
+    # Configure for armv6 compilation
+    'target_arch': 'arm',
+    'armv7': 0,
+    'arm_neon': 0,
+  }
+}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
new file mode 100644
index 0000000..27e1cfe
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 1,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 0,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
new file mode 100644
index 0000000..316cf48
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
@@ -0,0 +1,9 @@
+{
+  'variables': {
+    # Configure for armv7 compilation
+    'target_arch': 'arm',
+    'armv7': 1,
+    'arm_thumb': 1,
+    'arm_neon': 1,
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
new file mode 100644
index 0000000..27e1cfe
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 1,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 0,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
new file mode 100644
index 0000000..69f3a08
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
@@ -0,0 +1,5 @@
+{
+  'variables': {
+    'target_arch': 'ia32',
+  }
+}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
new file mode 100644
index 0000000..0a6e8e8
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 0,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 1,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0,
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch b/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
new file mode 100644
index 0000000..fac12bb
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
@@ -0,0 +1,90 @@
+Make gcc 4.8 happy. It complains about uninitialized symbols
+
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual uint64 webkit_glue::WebClipboardImpl::sequenceNumber(WebKit::WebClipboard::Buffer)':
+| ../../webkit/glue/webclipboard_impl.cc:80:48: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    return client_->GetSequenceNumber(buffer_type);
+|                                                 ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebVector<WebKit::WebString> webkit_glue::WebClipboardImpl::readAvailableTypes(WebKit::WebClipboard::Buffer, bool*)':
+| ../../webkit/glue/webclipboard_impl.cc:118:73: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|      client_->ReadAvailableTypes(buffer_type, &types, contains_filenames);
+|                                                                          ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebData webkit_glue::WebClipboardImpl::readImage(WebKit::WebClipboard::Buffer)':
+| ../../webkit/glue/webclipboard_impl.cc:169:45: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    client_->ReadImage(buffer_type, &png_data);
+|                                              ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readCustomData(WebKit::WebClipboard::Buffer, const WebKit::WebString&)':
+| ../../webkit/glue/webclipboard_impl.cc:180:52: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    client_->ReadCustomData(buffer_type, type, &data);
+|                                                     ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readHTML(WebKit::WebClipboard::Buffer, WebKit::WebURL*, unsigned int*, unsigned int*)':
+| ../../webkit/glue/webclipboard_impl.cc:158:56: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|                      static_cast<uint32*>(fragment_end));
+|                                                         ^
+| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readPlainText(WebKit::WebClipboard::Buffer)':
+| ../../webkit/glue/webclipboard_impl.cc:136:3: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    if (client_->IsFormatAvailable(ui::Clipboard::GetPlainTextFormatType(),
+|    ^
+| cc1plus: all warnings being treated as errors
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Unknown
+Index: chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
+===================================================================
+--- chromium-29.0.1518.2.orig/webkit/glue/webclipboard_impl.cc
++++ chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
+@@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
+ }
+ 
+ uint64 WebClipboardImpl::sequenceNumber(Buffer buffer) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return 0;
+ 
+@@ -112,7 +112,7 @@ bool WebClipboardImpl::isFormatAvailable
+ 
+ WebVector<WebString> WebClipboardImpl::readAvailableTypes(
+     Buffer buffer, bool* contains_filenames) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   std::vector<base::string16> types;
+   if (ConvertBufferType(buffer, &buffer_type)) {
+     client_->ReadAvailableTypes(buffer_type, &types, contains_filenames);
+@@ -121,7 +121,7 @@ WebVector<WebString> WebClipboardImpl::r
+ }
+ 
+ WebString WebClipboardImpl::readPlainText(Buffer buffer) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return WebString();
+ 
+@@ -147,7 +147,7 @@ WebString WebClipboardImpl::readPlainTex
+ WebString WebClipboardImpl::readHTML(Buffer buffer, WebURL* source_url,
+                                      unsigned* fragment_start,
+                                      unsigned* fragment_end) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return WebString();
+ 
+@@ -161,7 +161,7 @@ WebString WebClipboardImpl::readHTML(Buf
+ }
+ 
+ WebData WebClipboardImpl::readImage(Buffer buffer) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return WebData();
+ 
+@@ -172,7 +172,7 @@ WebData WebClipboardImpl::readImage(Buff
+ 
+ WebString WebClipboardImpl::readCustomData(Buffer buffer,
+                                            const WebString& type) {
+-  ui::Clipboard::Buffer buffer_type;
++  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
+   if (!ConvertBufferType(buffer, &buffer_type))
+     return WebString();
+ 
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch b/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
new file mode 100644
index 0000000..6b5018b
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
@@ -0,0 +1,27 @@
+diff --git a/chrome/browser/memory_details_linux.cc b/chrome/browser/memory_details_linux.cc
+index bee24ce..299f237 100644
+--- a/chrome/browser/memory_details_linux.cc
++++ b/chrome/browser/memory_details_linux.cc
+@@ -7,6 +7,10 @@
+ #include <map>
+ #include <set>
+ 
++#if defined(OS_POSIX)
++#include <unistd.h>
++#endif
++
+ #include "base/bind.h"
+ #include "base/process_util.h"
+ #include "base/string_util.h"
+diff --git a/ipc/ipc_channel.h b/ipc/ipc_channel.h
+index 14c375b..345f9eb 100644
+--- a/ipc/ipc_channel.h
++++ b/ipc/ipc_channel.h
+@@ -10,6 +10,7 @@
+ 
+ #if defined(OS_POSIX)
+ #include <sys/types.h>
++#include <unistd.h>
+ #endif
+ 
+ #include "base/compiler_specific.h"
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
new file mode 100644
index 0000000..c2e2a7d
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
@@ -0,0 +1,5 @@
+{
+  'variables': {
+    'target_arch': 'x64',
+  }
+}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
new file mode 100644
index 0000000..0a6e8e8
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 0,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 1,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0,
+  }, 
+}
diff --git a/recipes-browser/chromium/chromium_29.0.1518.2.bb b/recipes-browser/chromium/chromium_29.0.1518.2.bb
new file mode 100644
index 0000000..c8e8aa9
--- /dev/null
+++ b/recipes-browser/chromium/chromium_29.0.1518.2.bb
@@ -0,0 +1,72 @@
+DESCRIPTION = "Chromium browser"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2d164565cc10f298390174d9cb6d18d"
+DEPENDS = "xz-native pciutils pulseaudio xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
+SRC_URI = "\
+        http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
+        file://include.gypi \
+        file://oe-defaults.gypi \
+        file://unistd-2.patch \
+        file://google-chrome \
+        file://google-chrome.desktop \
+        file://uninitialised-warning.patch \
+"
+SRC_URI[md5sum] = "2480c3fd109ef000575629acb8a906ca"
+SRC_URI[sha256sum] = "7f08624f7d9bd120de0043da7ee09985ae6b6990d22d8c1b1f7c66fd4ed681a1"
+
+# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
+inherit gettext
+
+EXTRA_OEGYP =	" \
+	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
+	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
+	-I ${WORKDIR}/oe-defaults.gypi \
+	-I ${WORKDIR}/include.gypi \
+	-f ninja \
+"
+ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
+
+export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
+do_configure() {
+	cd ${S}
+	# replace LD with CXX, to workaround a possible gyp issue?
+	LD="${CXX}" export LD
+	CC="${CC}" export CC
+	CXX="${CXX}" export CXX
+	CC_host="gcc" export CC_host
+	CXX_host="g++" export CXX_host
+	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
+}
+
+do_compile() {
+	# build with ninja
+	ninja -C ${S}/out/Release chrome 
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
+
+	install -d ${D}${datadir}/applications
+	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
+
+	install -d ${D}${bindir}/chrome/
+	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
+	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
+	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
+
+	install -d ${D}${bindir}/chrome/locales/
+	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
+}
+
+FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications"
+FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
-- 
1.8.1.2


