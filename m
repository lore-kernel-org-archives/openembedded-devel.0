Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76BE478369
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 01:36:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5F1ae9k005190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 18:36:40 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 14 Jun 2017 18:36:39 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Jun 2017 09:36:37 +0800
Message-ID: <88d795d0702cfafe40b7a821c2d09df76b6f3dc0.1497428466.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497428466.git.jackie.huang@windriver.com>
References: <cover.1497428466.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1 v2] microcode-ctl: add new recipe
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
X-List-Received-Date: Thu, 15 Jun 2017 01:36:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The microcode_ctl utility is a companion to the
IA32 microcode driver.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/licenses/Intel-ucode                       | 30 ++++++++++
 .../0001-add-support-for-other-distributions.patch | 27 +++++++++
 .../files/0001-fix-the-help-return-code.patch      | 57 +++++++++++++++++++
 .../files/fix-No-GNU_HASH-in-the-elf-binary.patch  | 30 ++++++++++
 .../microcode-ctl/files/microcode_ctl.service      | 11 ++++
 .../recipes-bsp/microcode-ctl/microcode-ctl_git.bb | 65 ++++++++++++++++++++++
 6 files changed, 220 insertions(+)
 create mode 100644 meta-oe/licenses/Intel-ucode
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-other-distributions.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-code.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-elf-binary.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
 create mode 100755 meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb

diff --git a/meta-oe/licenses/Intel-ucode b/meta-oe/licenses/Intel-ucode
new file mode 100644
index 000000000..964953bb9
--- /dev/null
+++ b/meta-oe/licenses/Intel-ucode
@@ -0,0 +1,30 @@
+    Copyright (c) <1995-2017>, Intel Corporation.
+All rights reserved.
+
+Redistribution. Redistribution and use in binary form, without modification, are
+permitted provided that the following conditions are met:
+    .Redistributions must reproduce the above copyright notice and the following
+disclaimer in the documentation and/or other materials provided with the
+distribution.
+    .Neither the name of Intel Corporation nor the names of its suppliers may be used
+to endorse or promote products derived from this software without specific prior
+written permission.
+    .No reverse engineering, decompilation, or disassembly of this software is
+permitted.
+    ."Binary form" includes any format commonly used for electronic conveyance
+which is a reversible, bit-exact translation of binary representation to ASCII or
+ISO text, for example, "uuencode."
+
+DISCLAIMER. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT
+HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
+WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
+OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
index 000000000..81ee5fbbb
--- /dev/null
+++ b/meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
@@ -0,0 +1,65 @@
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
+LICENSE = "GPLv2 & Intel-ucode"
+LICENSE_${PN} = "GPLv2"
+LICENSE_${PN}-firmware = "Intel-ucode"
+
+LIC_FILES_CHKSUM = "file://microcode_ctl.c;endline=12;md5=4b3c92a397fc1c9efc2cf13a82981424 \
+                    file://intel-ucode/microcode.dat;endline=33;md5=e5199e4965078af6c7dee6aa7c5d8404 \
+                   "
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
+EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS+=-Wall'"
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


