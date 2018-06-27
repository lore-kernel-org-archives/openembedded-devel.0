Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 038E5747EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 03:22:43 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id n84-v6so514944oib.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 20:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I7BbBaoPM2pFUTLq9IEEC+ef8iM+UPa5MIAwJkL8Y6w=;
	b=a2cqV8s6nvtrapg/hsVXWUvJXnijELQKooi+91aZGpRXJ1R9zwGx3zZzkQ4wwPggOD
	L+mjOfMJ+XDJDPFVQWMRA2408nZL1Pg4CD80Q0xPkhZYi2hrTxOcBFHxaaabTbN065l0
	6sl7BzQ7ribdJgSzdmr/qFPH6KdTJe6iwO3pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I7BbBaoPM2pFUTLq9IEEC+ef8iM+UPa5MIAwJkL8Y6w=;
	b=iGiWjCfOol4VSLguZyFAQdJq+dv/eNTf56HnGRNxiFFXhev1Mz1rkl+vcjBUF1ybfE
	FDUNQxjHr6SfVwV4vkF6QgtgJPklZqlqmiXcWbdu8Hc7HxW18WTGse3O6CF/b9oIFMkY
	dqMEapcVvJwLkgxhXE96GAdC7DYYZOVsjtHbXGTZT9PxWfZJCm5+SLNvUNvmStSg6u8L
	cM1kVveaoinDLc6dBLKmLjliJXyKr8htskJGVKmlmu8l0Ksm2k0TrejnkDDkclGsT1wz
	nCih7w/jiBDd/z+WwKIJ55A+8DFrmnKzw4jEXsDuZG86nZ4RIA9Z1WztLwN/8zTB6Urm
	I4Gw==
X-Gm-Message-State: APt69E3KCS8fy9fIdT2a1NpIZuGX4kpzgUvA7jB+gOHUeL8M1GuBlc3b
	P968vVmUknQtAF97k7a32ixpsyaOKJs=
X-Google-Smtp-Source: AAOMgpcS5M5vNLJ+PLoB0eo4lOJdrz1gWOwz/AHFQb3+7bw0RJ0Oac8lZs9A2kr7IgKYin2EAB5qlQ==
X-Received: by 2002:aca:be86:: with SMTP id
	o128-v6mr2372325oif.301.1530069286662; 
	Tue, 26 Jun 2018 20:14:46 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-191-185.PCs.InterCable.net. [187.161.191.185])
	by smtp.googlemail.com with ESMTPSA id
	w10-v6sm1580765oif.41.2018.06.26.20.14.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jun 2018 20:14:45 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jun 2018 22:14:35 -0500
Message-Id: <1530069275-25999-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] bpftool: add new recipe
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
X-List-Received-Date: Wed, 27 Jun 2018 03:22:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bpftool allows for inspection and simple manipulation of
eBPF programs and maps, so common in the kernel selftests.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
Apologies for sending without [meta-oe] earlier.

 meta-oe/recipes-kernel/bpftool/bpftool.bb | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool.bb

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
new file mode 100644
index 0000000..887f079
--- /dev/null
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Inspect and manipulate eBPF programs and maps"
+DESCRIPTION = "bpftool is a kernel tool for inspection and simple manipulation \
+of eBPF programs and maps."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+DEPENDS = "binutils elfutils"
+PROVIDES = "virtual/bpftool"
+
+inherit bash-completion kernelsrc kernel-arch
+
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+EXTRA_OEMAKE = "-C ${S}/tools/bpf/bpftool O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    chown -R root:root ${D}
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+python do_package_prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+}
+
+B = "${WORKDIR}/${BPN}-${PV}"
-- 
2.7.4


