Return-Path: <gg@slimlogic.co.uk>
X-Greylist: delayed 453 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Dec 2014 10:16:56 UTC
Received: from xora.vm.bytemark.co.uk (www.xora.org.uk [80.68.91.202])
	by mail.openembedded.org (Postfix) with ESMTP id 63F88728E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 10:16:56 +0000 (UTC)
Received: from xora-haswell.xora.org.uk
	(cpc27-thor5-2-0-cust51.14-2.cable.virginm.net [86.14.172.52])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 3C85714010;
	Fri, 19 Dec 2014 10:09:23 +0000 (GMT)
From: Graeme Gregory <gg@slimlogic.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Dec 2014 10:09:28 +0000
Message-Id: <1418983768-11857-1-git-send-email-gg@slimlogic.co.uk>
X-Mailer: git-send-email 2.1.3
Cc: Graeme Gregory <graeme.gregory@linaro.org>
Subject: [meta-oe][PATCH] fwts: add the Firmware Test Suite
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
X-List-Received-Date: Fri, 19 Dec 2014 10:17:05 -0000

The Firmware Test Suite is a set of tests for checking ACPI and EFI
implementations for common bugs and issues.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Graeme Gregory <graeme.gregory@linaro.org>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-test/fwts/fwts_git.bb

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
new file mode 100644
index 0000000..b943d6d
--- /dev/null
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Firmware testsuite"
+DESCRIPTION = "The tool fwts comprises of over fifty tests that are designed to exercise and test different aspects of a machine's firmware. Many of these tests need super user access to read BIOS data and ACPI tables, so the tool requires running with super user privileges (e.g. with sudo)."
+HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
+
+PV = "14.12.00"
+
+SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
+SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libpcre json-c glib-2.0"
+
+inherit autotools-brokensep
+
+CFLAGS += "-I${STAGING_INCDIR}/json-c"
+
+FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
+FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
+FILES_${PN}-staticdev += "${libdir}/fwts/lib*a"
+FILES_${PN}-dbg += "${libdir}/fwts/.debug"
-- 
2.1.3


