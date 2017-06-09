Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFF4E78286
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:40:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v596efgO009103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jun 2017 23:40:41 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 23:40:40 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:40:33 +0800
Message-ID: <7a8affe1cd168ad90c80082ac0e063f90bc92a0d.1496990155.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496990155.git.jackie.huang@windriver.com>
References: <cover.1496990155.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] microcode-ctl: add new recipe
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
X-List-Received-Date: Fri, 09 Jun 2017 06:40:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The microcode_ctl utility is a companion to the
IA32 microcode driver.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../0001-add-support-for-other-distributions.patch | 27 ++++++++++
 .../files/0001-fix-the-help-return-code.patch      | 57 ++++++++++++++++++++
 .../files/fix-No-GNU_HASH-in-the-elf-binary.patch  | 30 +++++++++++
 .../microcode-ctl/files/microcode_ctl.service      | 11 ++++
 .../recipes-bsp/microcode-ctl/microcode-ctl_git.bb | 62 ++++++++++++++++++++++
 5 files changed, 187 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-other-distributions.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-code.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-elf-binary.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
 create mode 100755 meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb

diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-other-distributions.patch b/meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-other-distributions.patch
new file mode 100644
index 000000000..fe5428493
--- /dev/null
+++ b/meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-other-distributions.patch
@@ -0,0 +1,27 @@
+Subject: [PATCH] add support for other distributions
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ microcode_ctl.start | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/microcode_ctl.start b/microcode_ctl.start
+index 6fa9d72..e9321d0 100755
+--- a/microcode_ctl.start
++++ b/microcode_ctl.start
+@@ -47,8 +47,8 @@ elif [ -f /etc/slackware-version ]; then
+ 		END=slack_end
+ 	fi
+ else
+-	echo "$0: Can't guess distribution, aborting!"
+-	exit 1
++	START=
++	END=
+ fi
+ 
+ # Lets just be sure we have a device file...
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-code.patch b/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-code.patch
new file mode 100644
index 000000000..cbe7755e9
--- /dev/null
+++ b/meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-code.patch
@@ -0,0 +1,57 @@
+[PATCH] fix the help return code
+
+Upstream-Status: Pending
+
+not always return 1 when call usage(), differ the return code by user action;
+if a use wants to get help information, it is normal action, should be
+return 0;
+if input parameter is wrong, and microcode_ctl prompts the help information,
+it should be return 1;
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ microcode_ctl.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/microcode_ctl.c b/microcode_ctl.c
+index 3f9c151..cdcdc10 100644
+--- a/microcode_ctl.c
++++ b/microcode_ctl.c
+@@ -40,7 +40,6 @@ static void usage(void)
+ 			"  -u	upload microcode (default filename:\"%s\"\n"
+ 			"  -f	upload microcode from named Intel formatted file\n\n", 
+ 			progname, MICROCODE_FILE_DEFAULT);
+-	exit(1);
+ }
+ 
+ /* 
+@@ -141,6 +140,7 @@ int main(int argc, char *argv[])
+ 		switch(c) {
+ 			case 'h':
+ 				usage();
++				return 0;
+ 
+ 			case 'q':
+ 				print_normal_messages=0;
+@@ -168,14 +168,17 @@ int main(int argc, char *argv[])
+ 
+ 			case '?':
+ 				usage();
++				return 0;
+ 		}
+ 	}
+ 
+ 	if (upload) {
+ 		if((return_code = do_update(device, filename)))
+ 			exit(return_code);
+-	} else
++	} else {
+ 		usage();
++		return 1;
++	}
+ 
+ 	return 0;
+ }
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-elf-binary.patch b/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-elf-binary.patch
new file mode 100644
index 000000000..87d8f7dfe
--- /dev/null
+++ b/meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-elf-binary.patch
@@ -0,0 +1,30 @@
+From a5d4baf79ee332cf73e5259a2568958babcdbce2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 1 Aug 2016 07:00:35 -0400
+Subject: [PATCH] fix No GNU_HASH in the elf binary
+
+Let recipe's LDFLAGS work in Makefile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 590ae7e..d4e0610 100644
+--- a/Makefile
++++ b/Makefile
+@@ -37,7 +37,7 @@ RCFILETO        = $(RCDIR)/$(RCHOMEDIR)
+ all: microcode_ctl
+ 
+ microcode_ctl: microcode_ctl.c
+-	$(CC) $(CFLAGS) -o $(PROGRAM) microcode_ctl.c
++	$(CC) $(CFLAGS) -o $(PROGRAM) microcode_ctl.c $(LDFLAGS)
+ 	mkdir intel-ucode amd-ucode
+ 	tar xfz $(MICROCODE_INTEL) -C intel-ucode
+ 	tar --strip-components 1 -xf $(MICROCODE_AMD) -C amd-ucode
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service b/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
new file mode 100644
index 000000000..0658ff378
--- /dev/null
+++ b/meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Apply Cpu Microcode
+
+[Service]
+Type=forking
+KillMode=process
+RemainAfterExit=yes
+ExecStart=@SBINDIR@/microcode_ctl -Qu
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb b/meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
new file mode 100755
index 000000000..12fa5f564
--- /dev/null
+++ b/meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
@@ -0,0 +1,62 @@
+SUMMARY = "Microcode Control Tool"
+DESCRIPTION = "The microcode_ctl utility is a companion to the IA32 microcode driver \
+  The utility has two uses: \
+  a) it decodes and sends new microcode to the kernel driver to be uploaded \
+     to Intel IA32 family processors. (Pentium Pro, PII, Celeron, PIII, \
+     Xeon, Pentium 4 etc, x86_64) \
+  b) it signals the kernel driver to release any buffers it may hold \
+"
+HOMEPAGE = "https://pagure.io/microcode_ctl/"
+SECTION = "console/utils"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "git://pagure.io/microcode_ctl.git;protocol=https \
+           file://0001-add-support-for-other-distributions.patch \
+           file://0001-fix-the-help-return-code.patch \
+           file://fix-No-GNU_HASH-in-the-elf-binary.patch \
+           file://microcode_ctl.service \
+          "
+
+SRCREV = "8c8ae77e661bdba298f256948867d5a619bf1588"
+
+# DO NOT use the v2.x which is in the obsolete branch
+PV = "v1.34+git${SRCREV}"
+
+S = "${WORKDIR}/git"
+
+inherit update-rc.d systemd
+
+INITSCRIPT_PACKAGES = "microcode-ctl"
+INITSCRIPT_NAME_microcode-ctl = "microcode_ctl"
+INITSCRIPT_PARAMS_microcode-ctl = "start 80 2 3 4 5 . stop 20 0 1 6 ."
+
+SYSTEMD_SERVICE_${PN} = "microcode_ctl.service"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+FIRMWARE_DIR = "${nonarch_base_libdir}/firmware"
+
+EXTRA_OEMAKE = "'CC=${CC}' \
+                'CFLAGS+=-Wall -I${STAGING_KERNEL_DIR}/include' \
+               "
+
+do_install() {
+    oe_runmake install DESTDIR=${D} PREFIX=${prefix}
+    rm -rf ${D}${FIRMWARE_DIR}/amd-ucode
+
+    install -d ${D}${systemd_system_unitdir}
+    install -D -m 0644 ${WORKDIR}/microcode_ctl.service ${D}${systemd_system_unitdir}/microcode_ctl.service
+    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/microcode_ctl.service
+}
+
+# do_populate_sysroot is not needed for this package,
+# otherwise, it will conflict with the linux-firmware,
+do_populate_sysroot[noexec] = "1"
+
+PACKAGES += "${PN}-firmware"
+
+FILES_${PN}-firmware = "${FIRMWARE_DIR}/microcode.dat"
+
+RDEPENDS_${PN} = "${PN}-firmware bash"
-- 
2.11.0


