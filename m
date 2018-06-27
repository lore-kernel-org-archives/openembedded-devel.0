Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC674747CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 03:09:08 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 21-v6so496644oip.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 20:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kJMEZAY8ZzwqB6hek6q9eSBl/7XmVYD276tlUeCRZac=;
	b=bT5b+l/apbz15JAkhbsbY3etmvTaBX6Eyw6OolvvTC5sP/OJD7Kbda07SGmQKnjj28
	CgakS03+DIWA6xzi0D62JQf0NDbU0576oZhI2LCQNsfcyyj23BY4KZtrRJ691z8W8ZmH
	LmpZu2/qo4zZOQGg9NgBsharh0KRc9+O87tnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kJMEZAY8ZzwqB6hek6q9eSBl/7XmVYD276tlUeCRZac=;
	b=ThRYfxhQNx0zmvWbj21uTX6S2m+TQuQiNZkezp9VxSp9fG8uk8F3LDTE8zL0kd5Ms9
	H4YtNKlJw7NZgXGoYL+1lJX6gX+2qn7RvawlSnPmH7OdNak63pA8MN66r9ObRSP9f9iu
	wQl/076xMxX5FJekyJTotpMz8BXYB5kN1IZj7FUg64TEUSckxMvmUu5ZBQayBrJKaCpG
	IKxC0xZF6s/Q0uWUgm0WgHmTxSRJg5in01i+edZ3H2SVl6nFo5wDF9v75/UDhM0RDBNG
	UOV1inM+A3L/m1r79Blg7OtWsSuev5iB8vdKGA2CUjFUyF0ykMMu0Yu9Xgl67XNC+pYo
	7D8g==
X-Gm-Message-State: APt69E0ergbJKZM6J3a+Zzc5urK7AQHIRLaURR6tP/xEQ2JTWxTqr1fD
	tPU6BqPJ95ybzPH0mGCn45R3XBw5T+U=
X-Google-Smtp-Source: AAOMgpcGYPFSCNMaC9EvTMJo+HxrDafD8v65AzR4u7vugls1B9NUbJN+r8DnST+du98s7qgeWMpziA==
X-Received: by 2002:aca:f186:: with SMTP id
	p128-v6mr2367321oih.286.1530068949142; 
	Tue, 26 Jun 2018 20:09:09 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-191-185.PCs.InterCable.net. [187.161.191.185])
	by smtp.googlemail.com with ESMTPSA id
	l17-v6sm2415494ote.76.2018.06.26.20.09.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jun 2018 20:09:07 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jun 2018 22:08:51 -0500
Message-Id: <1530068931-25298-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] bpftool: add new recipe
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
X-List-Received-Date: Wed, 27 Jun 2018 03:09:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bpftool allows for inspection and simple manipulation of
eBPF programs and maps, so common in the kernel selftests.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
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


