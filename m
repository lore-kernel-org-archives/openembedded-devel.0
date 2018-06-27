Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3F56FFED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 17:43:58 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id f79-v6so2645182oib.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fatQDHA+6qs3NGdG0TsWdD4zzjUXmQV9C/5KyxfFYtc=;
	b=b4Ba+LsoW3TO8ozJ10hd3tAjD07jFn3H5KHMx4DDkImjnqeJzHlDUGuM7//TPhytgx
	ExykQFBZwbEj/BnImKbznIlgxMhWlGU5mkzwIyUeM5NaLLOO0iU849JYan0LNbsERzZ5
	vqFnHglqQn1yCi1EWJnKpIhHCprHyY9vqqI6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fatQDHA+6qs3NGdG0TsWdD4zzjUXmQV9C/5KyxfFYtc=;
	b=cgvDFgGIo0vyEK2ikXwvFIw7CMYwhroUhOqMZ7YvmYVnnw4CR6ALZS3Fwf7kYw9YVy
	G/4hJtghSX3eMXobVglGgs051OYFmIRLgN00wM/QNvpsAEDo09TPJ/12Jp84XGuThzub
	yui7oEzvqRK408xzEKFD+eDitEZIl0/wVeZ973AVIzyixu/8iAVC95FLHmAu8SsD7nhD
	wuayLTL8GQjTiXP+pwQNdZzxY13QHidh7nLfotXBsQl42Xf1aazDdEGsi5Rsp4Eg9/qS
	q7EflVJ6rL42LLYSuqpr4mEMtaHd3Tp9gwgY0r1oxywbLCuKfKwFbb66pxRjvDNFDmPd
	szbQ==
X-Gm-Message-State: APt69E2klcTzBvlEkDRl43YXhM+oFA4GFzrY6Nf0wKYZbTLaqj0++OTM
	KZ3pek+QYkaqi3X6S+m6bKBGoSEaMo8=
X-Google-Smtp-Source: AAOMgpe9/zlhF7AVmkEfedNTOEz9K6wlSXNpy8Yq8uIZzyu4xdIc6pb3XK+BSvpHNfjjdLgMetoXTQ==
X-Received: by 2002:aca:6b03:: with SMTP id
	g3-v6mr3545569oic.219.1530121439417; 
	Wed, 27 Jun 2018 10:43:59 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-191-185.PCs.InterCable.net. [187.161.191.185])
	by smtp.googlemail.com with ESMTPSA id
	h142-v6sm2848238oic.9.2018.06.27.10.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jun 2018 10:43:58 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jun 2018 12:43:51 -0500
Message-Id: <1530121431-7102-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] bpftool: add new recipe
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
X-List-Received-Date: Wed, 27 Jun 2018 17:43:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bpftool allows for inspection and simple manipulation of
eBPF programs and maps, so common in the kernel selftests.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: Drop superfluous chown

 meta-oe/recipes-kernel/bpftool/bpftool.bb | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool.bb

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
new file mode 100644
index 0000000..fd0653a
--- /dev/null
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -0,0 +1,31 @@
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


