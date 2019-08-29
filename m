Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7E37F303
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 08:30:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7T8Tax3023210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 01:29:57 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 29 Aug 2019 01:29:45 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Aug 2019 04:29:42 -0400
Message-ID: <20190829082942.128713-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-oe][Patch] libwacom: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2019 08:30:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Package libinput has a package config 'libwacom'. When it is set,
package libwacom is required. So add the recipe of libwacom.

Add a patch to generate udev rules file on target that it is not
suitable for cross compile.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../generate-udev-rules-on-target.patch       | 59 +++++++++++++++++++
 .../recipes-extended/libwacom/libwacom_1.0.bb | 17 ++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.patch
 create mode 100644 meta-oe/recipes-extended/libwacom/libwacom_1.0.bb

diff --git a/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.patch b/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.patch
new file mode 100644
index 000000000..27e037c98
--- /dev/null
+++ b/meta-oe/recipes-extended/libwacom/libwacom/generate-udev-rules-on-target.patch
@@ -0,0 +1,59 @@
+libwacom create a native executable file to generate udev rules file. But it is
+not suitable for cross compile. And it is complicate to create libwacom-native
+that libgudev-native and udev-native are required.
+
+So do not generate udev rules file during compilation. Install the executable
+file to generate udev rules on target. It should put the generated rules file
+at /lib/udev/rules.d/65-libwacom.rules.
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/meson.build b/meson.build
+index 6584c86..4009f5f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -407,20 +407,20 @@ executable('libwacom-list-local-devices',
+ 	   include_directories: [includes_src],
+ 	   install: true)
+ 
+-tools_cflags = ['-DTOPSRCDIR="@0@"'.format(meson.source_root())]
++tools_cflags = ['-DTOPSRCDIR="@0@"'.format(meson.source_root()), '-DLIBWACOM_DATA_DIR="@0@"'.format(dir_data)]
+ 
+-gen_udev_rules = executable('generate-udev-rules',
++gen_udev_rules = executable('libwacom-generate-udev-rules',
+ 			    'tools/generate-udev-rules.c',
+ 			    dependencies: [dep_libwacom, dep_glib],
+ 			    include_directories: [includes_src],
+ 			    c_args: tools_cflags,
+-			    install: false)
+-custom_target('udev-rules',
+-	      command: gen_udev_rules,
+-	      capture: true,
+-	      output: '65-libwacom.rules',
+-	      install: true,
+-	      install_dir: join_paths(dir_udev, 'rules.d'))
++			    install: true)
++#custom_target('udev-rules',
++#	      command: gen_udev_rules,
++#	      capture: true,
++#	      output: '65-libwacom.rules',
++#	      install: true,
++#	      install_dir: join_paths(dir_udev, 'rules.d'))
+ 
+ executable('list-devices',
+ 	   'tools/list-devices.c',
+diff --git a/tools/generate-udev-rules.c b/tools/generate-udev-rules.c
+index bb00e7b..fbf49f0 100644
+--- a/tools/generate-udev-rules.c
++++ b/tools/generate-udev-rules.c
+@@ -229,7 +229,7 @@ int main(int argc, char **argv)
+ 	}
+ 
+ 
+-	db = libwacom_database_new_for_path(TOPSRCDIR"/data");
++	db = libwacom_database_new_for_path(LIBWACOM_DATA_DIR);
+ 
+ 	list = libwacom_list_devices_from_database(db, NULL);
+ 	if (!list) {
diff --git a/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb b/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
new file mode 100644
index 000000000..0787ad246
--- /dev/null
+++ b/meta-oe/recipes-extended/libwacom/libwacom_1.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "libwacom is a library to identify wacom tablets and their model-specific features."
+HOMEPAGE = "https://github.com/linuxwacom/libwacom/wiki"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
+
+DEPENDS = "libgudev libxml2"
+
+SRC_URI = "git://github.com/linuxwacom/libwacom.git;protocol=https \
+           file://generate-udev-rules-on-target.patch \
+           "
+SRCREV = "ae6c9cf78802844349986ac2a708d87e891a3e6e"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
-- 
2.20.0


