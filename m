Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB6577E99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 08:08:52 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id l196so4999414lfl.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Cp6UAWlrdIuka/1iXKLxAdYPJS1aBn/pWY3FeBMIwOE=;
	b=F/l720M+1CWZkBnd316doiO1i70yKUurMtpmU3DR4vhR9ErVSlnukRtDnKhlQgNzoY
	hmxLppJevf3q5ZSJpB6p3ynSAV+eKhXAG43hX1vnwMs7+u2B8IfRZ6xlUStEWdlhXuX4
	dWVo1zctJnEx266ML0LngRtkbcGMK8GpShIyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Cp6UAWlrdIuka/1iXKLxAdYPJS1aBn/pWY3FeBMIwOE=;
	b=ls9OKWdWw0SP+RGRY7h5KR0fxjtS0eK1GIqwPQv36BLYY9Hcr16FwM3BPhwJWr5mr8
	VmzEsMP1AENYcPz9JKKOJY7vrtOSvQGscftVgxEcrewpzo+6cbFEuhHuazj0N6h6WVPC
	YCFDSvGTYMhlfjdPYMWjA44ecUmYPYR84Evs6d7dkEQUqKdK0JXjRUe0958w9HAjuRqp
	9QYncX/ONwEAFz8MNi3FSYgDxEq1fMQAIg7CIinut0fxB1GC285jItkR2O+yRyLzvEf1
	3DdgNAIYYv8Y7yQOEYA96Eb8mtP+si5JJ/CoTq5fFivOSWECpnVcwTvWwJIiX+miqwZm
	CQXQ==
X-Gm-Message-State: AHPjjUhHG0FoC3d+3FPqFefNAlFU5A8LN2wJliL0HsRGUDp8whEX5LEV
	Ru6mYDxIlUAD4IRmPYG6m8ItvO2qfmY=
X-Google-Smtp-Source: AOwi7QBU4/TJ9Bkv9aeY6w/JBDYeEaX7SdJ+Kk09IgcIEHjGgZEADWCBflo7zKwerF7ZX8saOP/wsg==
X-Received: by 10.25.19.197 with SMTP id 66mr485278lft.221.1505981332792;
	Thu, 21 Sep 2017 01:08:52 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101])
	by smtp.gmail.com with ESMTPSA id h14sm128133lfe.30.2017.09.21.01.08.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 01:08:51 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:08:33 +0300
Message-Id: <20170921080833.32623-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.14.1
Cc: Roy Li <rongqing.li@windriver.com>
Subject: [meta-oe][PATCH v2] cpupower: add a new recipe
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
X-List-Received-Date: Thu, 21 Sep 2017 08:08:52 -0000

cpupower is a tool to show and set processor power related values.
In addition, it allows to run in-kernel selftests intel_pstate test.

The recipe is based on the initial work from Roy Li <rongqing.li@windriver.com>:
https://patchwork.openembedded.org/patch/118911/

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/cpupower/cpupower.bb

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
new file mode 100644
index 000000000..c963c8ef9
--- /dev/null
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Shows and sets processor power related values"
+DESCRIPTION = "cpupower is a collection of tools to examine and tune power \
+saving related features of your processor."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+DEPENDS = "pciutils"
+PROVIDES = "virtual/cpupower"
+
+inherit kernelsrc kernel-arch
+
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+EXTRA_OEMAKE = "-C ${S}/tools/power/cpupower O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    # Do not ship headers
+    rm -rf ${D}${includedir}
+    chown -R root:root ${D}
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "bash"
+
+python do_package_prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+}
+
+B = "${WORKDIR}/${BPN}-${PV}"
-- 
2.14.1


