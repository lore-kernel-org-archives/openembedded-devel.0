Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UDwyj-0005os-G5
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 14:04:54 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Mar 2013 04:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,807,1355126400"; d="scan'208";a="297697083"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2013 04:47:09 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Mar 2013 14:47:06 +0200
Message-Id: <1362746826-22762-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1362746826-22762-1-git-send-email-laurentiu.palcu@intel.com>
References: <1362746826-22762-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [meta-browser][PATCH 1/1] chromium: add support for x86-64
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
X-List-Received-Date: Fri, 08 Mar 2013 13:04:55 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../chromium-24.0.1312.52/x86-64/include.gypi      |    5 +++++
 .../chromium-24.0.1312.52/x86-64/oe-defaults.gypi  |   15 +++++++++++++++
 recipes-browser/chromium/chromium_24.0.1312.52.bb  |    3 ++-
 3 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi
 create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi

diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi
new file mode 100644
index 0000000..c2e2a7d
--- /dev/null
+++ b/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi
@@ -0,0 +1,5 @@
+{
+  'variables': {
+    'target_arch': 'x64',
+  }
+}
diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi b/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi
new file mode 100644
index 0000000..0a6e8e8
--- /dev/null
+++ b/recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi
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
diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipes-browser/chromium/chromium_24.0.1312.52.bb
index 85d4173..3976a71 100644
--- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
+++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Chromium browser"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0750f191c9bbf46869b70508e7eb455b"
-DEPENDS = "xextproto cairo nss gtk+-native zlib-native libav libxi libgnome-keyring libxss cups ninja-native"
+DEPENDS = "xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native"
 
 SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.bz2 \
         file://include.gypi \
@@ -14,6 +14,7 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-- 
1.7.9.5



