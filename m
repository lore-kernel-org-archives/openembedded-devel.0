Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id C897F61128
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:44:31 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id ep11so4284994pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=akFrt4jCphROZ+s/iU38j18KKSiCU4Bef8FB6gRGpOI=;
	b=WFCKWWF05Wt561Ulh14l5CKmO29Kvv2Y1XjWLQkgLXTQWUYBhMdemPk+XjyFFEBkKt
	NEjHohPaV3s0tMjYZtO/SSqz5DeXQMzTvjAHJt0wqoBYfPDgLcq6NWMWF7z0eoXjoxMo
	G6w7T3b/OMbmXfyBCd/vyXg7089PhdUobtITE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=akFrt4jCphROZ+s/iU38j18KKSiCU4Bef8FB6gRGpOI=;
	b=iU7IuQjXa8FDGy3fhf0oTK4e3WZzlCeXmMDBm/n7Addn8XYUDPbWxKUvJ4bLAl+pBi
	BUtAMUE8tdlPIqTbSHX3hjh2goRqPeLptLm9sfDExNtWS9zdTu20n7Sl1PUws979kAmm
	44o4kmFuqj8e5Oo4sTOIBUwH/7JK0fwD+E4lnCLVhBn3a69ySdhjGRdNFk942Q2RU+Ju
	cGviXZgGytpokHQJwbqEclEW2DBOl+lmUJDYo+9ikFyBAHr5wrqITrLlj5WH/IcABCVP
	EFHwZfSCYAIha3TPSfEihCJvd2QIoHYcX7cVamO7NhB/G+g/Tgo7jFlgZTMDrgm4YKGk
	bD3Q==
X-Gm-Message-State: APjAAAUJ8VfRjchbzQszKguFy9LxfidWVsAiPC7nOKSLT1w5B7amxkAi
	tcO7AIsHBsWwnWQZWqheb3Hg8EqJb9+IOcXByy5SJJzCBvWyX28FAgAOAGnVpYBLYPDMIUegj5N
	Jd2GO0fJEqBNsOsOjDfEKghuojw4oW4kWIxwXVWcARM8E0iVIJ+j4F3IyG7qAc2AMVkNGLZohga
	oFy5N0B+mxqywj1R+AVWzebwHu4aCy8Q8=
X-Google-Smtp-Source: APXvYqxltahvvrTcBMTxYq8F0W111+ZBe10o9F1F4dZGg3YHuecQuTJc/4RbVTH+sQpHezlHLRlOXQ==
X-Received: by 2002:a17:90a:8586:: with SMTP id
	m6mr5525985pjn.121.1581709472404; 
	Fri, 14 Feb 2020 11:44:32 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	p17sm7509292pfn.31.2020.02.14.11.44.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 11:44:31 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 11:44:20 -0800
Message-Id: <20200214194420.106483-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Cc: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [meta-oe][PATCH v2 1/1] spidev-test: Add initial version of recipe
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
X-List-Received-Date: Fri, 14 Feb 2020 19:44:31 -0000

From: Arun Parameswaran <arun.parameswaran@broadcom.com>

Allows for testing SPI interface using spidev driver and is part of the
kernel tools.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
Reviewed-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
Tested-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 .../recipes-kernel/spidev-test/spidev-test.bb | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/spidev-test/spidev-test.bb

diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
new file mode 100644
index 000000000..662630291
--- /dev/null
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Test SPI devices"
+DESCRIPTION = "SPI testing utility using the spidev driver"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+PROVIDES = "virtual/spidev-test"
+
+inherit bash-completion kernelsrc kernel-arch
+
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+EXTRA_OEMAKE = "-C ${S}/tools/spi O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
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
2.17.1


