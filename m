Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 32CAF60C6F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:23:56 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n10so6879288wrm.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 15:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=9p5Lt8QTt0oO/SChKll5BHg/2SKwqOyNiLHVlNFpyjQ=;
	b=EHISPqJ1COtJX3uTlp8S7uDr7dXpj7RX0ffZKTgmI2l57T/5NJ3CmK4QYd/w5raH9Z
	zJ0FAwo6Gy1l/mk7qZsJ5BhXmcOasYf8skSlJhBV6ZVGK86Ed4hhMOvQmtgb9Zcw1ZQU
	wzQ9vE1O5ygZFv8FoDUEVzW7a5exDKy0v/Ghg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9p5Lt8QTt0oO/SChKll5BHg/2SKwqOyNiLHVlNFpyjQ=;
	b=OvRfhxyeqRDZ89A+HsZmLROeuORKBJjaW9Y8m4rVZRcWiziJ8SQKqvCbNMjsnH44gI
	DzXPuyfj2wVX4ajIltl9cq5zIdYCQ4mLi9o7+W5NhJ0AhUBsL9t+O9ZAjmWV4NRduf9X
	g+ArF71v16uqE7hZTITNUPdmoiQ8ZjSJsEjD0gPKsvXmeKxu0YMZfSBlY+S7OEhBCI1h
	4jQPNrqSsdHzSZlUhQxXzCQNPjsji8CKx23Ushd0hScoQPMRGYefbdE9e9SGe+S3cDsw
	e+mZFNdiW/tlS6pNc/r2Qb0jKweBWeIxDX8y7dIwRfQC6iGEA7o6bfJGTF/aqlp9vNDw
	Z0Pg==
X-Gm-Message-State: APjAAAUr22fOvZ6SLGJ0wvjMZ7S44y8RuNpDKXhvAxyYGXEl9kgo1pax
	yrOBW8jZ0gOrdvGf0yfkGii54kVoDPKLHoIPP/I24UBhQDWEyouToMqEqY4IWvHObIIaKCSZuW7
	+aY3wjkfgdMMXjcbXyi2T6u3+5sL5692UUyLdm9QLxTHNQtoAQGykeEfV7Bkby7/4bEtCERRgln
	1WTf/YLOMuQg1rvuZ8/9vOLX28Ymw5MjU=
X-Google-Smtp-Source: APXvYqzQw5a3YLvYMVKoaQ3zUq8M1x3TB0DWYaWWKs/HluOrxJCOAcRdeFf3/B2Qu5DA4hAco8iESg==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr23692537wrn.283.1581636236364; 
	Thu, 13 Feb 2020 15:23:56 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	a62sm4970966wmh.33.2020.02.13.15.23.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 15:23:55 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Feb 2020 15:23:46 -0800
Message-Id: <20200213232346.109257-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Cc: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [meta-oe] spidev-test: Add initial version of recipe
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
X-List-Received-Date: Thu, 13 Feb 2020 23:23:56 -0000

From: Arun Parameswaran <arun.parameswaran@broadcom.com>

Allows for testing SPI interface using spidev driver and is part of the
kernel tools.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
Reviewed-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
Tested-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 .../recipes-kernel/spidev-test/spidev-test.bb | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/spidev-test/spidev-test.bb

diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
new file mode 100644
index 000000000..7dd199fe9
--- /dev/null
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Test SPI devices"
+DESCRIPTION = "SPI testing utility using the spidev driver"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+DEPENDS = "binutils elfutils"
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


