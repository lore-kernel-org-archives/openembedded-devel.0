Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB79E78247
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 06:21:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id k15so1591371wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=EStDaW6pdlNCmn7YtYvngkUjOrffzo5cHIdgyuiV1N4=;
	b=bKmCLdsPqH3b5xxXJQVFWK7HmmwJpE1uv8YN3/LylZkPkmCpRQBMrx8R4lwhEf16iB
	y2tB41CG3EtZxP79D6HyIb2lWR8xC3EV6727eo1Ty7wmmxPm1Nh40orFshVyx4+BqkXb
	sHB/vVE3yYRElU4GxbEpM462yiMemM5vJW95CnYxTcPZWPUObWcRx4Hk+f5OBBmP3lfM
	On67q/GlQRPVrxE4vEbQ7bk0oCGxjOs6dx7ZKU0GatghRnuVzJt5dVfs/0h5XjOGGvz+
	ZUcVk7JGUXJbkN8OJeTHduGO3fsztfkNq/XfOlsNI33rlKL7jKD8OShKnb4EhHG1dlLC
	bRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=EStDaW6pdlNCmn7YtYvngkUjOrffzo5cHIdgyuiV1N4=;
	b=cu8mzZGpoIqJBpriBfyv4nVDAihOWyg+9V16+ReAfJ2MDWhBUKDBolnXKsIkXqFjHr
	cMAAOXkL1FqUSDR1XCvrDz8tpwVa6HayHHfYpLs7gXdsBOceMAqGMQU6cnwr2BfwR/ai
	5BJnURJJ2lZ2VR/DnGy4Mp/fSI8irESVxcV/wVgdojDiZHVul4oVQENdCCT3rFQW781d
	crbsLo+CN/YCHRExS6Bz5Ed7Qao9Mr5e7YhyG7Oog42oFtsG/gAV5d2l4M3j95u7JglI
	aVqvhE2CoPn+ChSZB00Nx0/IYFx5sJ80L+Tmta1tiuOWn03yFBkZ0+qLxOIyoQ7yGHG8
	3wNA==
X-Gm-Message-State: AODbwcCxyiagw/DQid5JCGlBLhI27AGhh1nWQQxrrWgUaUo13C7xALQM
	1wzlxCo90NWpa/Gf
X-Received: by 10.28.65.213 with SMTP id o204mr11464822wma.43.1495779693942;
	Thu, 25 May 2017 23:21:33 -0700 (PDT)
Received: from mbuntu.sueba (81.89.61.168.host.vnet.sk. [81.89.61.168])
	by smtp.gmail.com with ESMTPSA id
	c34sm13444963wrc.7.2017.05.25.23.21.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 May 2017 23:21:32 -0700 (PDT)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 May 2017 08:21:19 +0200
Message-Id: <1495779679-26874-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [PATCH][meta-oe] recipes-support: Move libgpiod to meta-oe directory
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
X-List-Received-Date: Fri, 26 May 2017 06:21:35 -0000

Previously it was placed in meta directory which is
wrong. Move to meta-oe.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.bb | 30 ++++++++++++++++++++++++++++
 meta/recipes-support/libgpiod/libgpiod.bb    | 30 ----------------------------
 2 files changed, 30 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.bb
 delete mode 100644 meta/recipes-support/libgpiod/libgpiod.bb

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.bb b/meta-oe/recipes-support/libgpiod/libgpiod.bb
new file mode 100644
index 0000000..fe56f7b
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.bb
@@ -0,0 +1,30 @@
+SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+HOMEPAGE = "https://github.com/brgl/libgpiod"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
+
+UPSTREAM_CHECK_URI = "git://github.com/brgl/libgpiod/releases"
+
+SRC_URI = "git://github.com/brgl/libgpiod.git"
+
+SRCREV = "7ab5e53b69cce313ba87033a442cabd417f5d895"
+
+PV = "0.2+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "68f039487e940c15bbfc50a10ab4715b"
+SRC_URI[sha256sum] = "7d7085d4e9cb811742ca8c5fe03458067efaeaa8abc23968d2e3c56bcc2d2ef8"
+
+inherit autotools pkgconfig
+
+# enable tools
+PACKAGECONFIG ?= "tools"
+
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
+
+PACKAGES += " ${PN}-tools"
+
+FILES_${PN}-tools = "${bindir}/*"
diff --git a/meta/recipes-support/libgpiod/libgpiod.bb b/meta/recipes-support/libgpiod/libgpiod.bb
deleted file mode 100644
index fe56f7b..0000000
--- a/meta/recipes-support/libgpiod/libgpiod.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "C library and tools for interacting with the linux GPIO character device"
-HOMEPAGE = "https://github.com/brgl/libgpiod"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
-
-UPSTREAM_CHECK_URI = "git://github.com/brgl/libgpiod/releases"
-
-SRC_URI = "git://github.com/brgl/libgpiod.git"
-
-SRCREV = "7ab5e53b69cce313ba87033a442cabd417f5d895"
-
-PV = "0.2+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-SRC_URI[md5sum] = "68f039487e940c15bbfc50a10ab4715b"
-SRC_URI[sha256sum] = "7d7085d4e9cb811742ca8c5fe03458067efaeaa8abc23968d2e3c56bcc2d2ef8"
-
-inherit autotools pkgconfig
-
-# enable tools
-PACKAGECONFIG ?= "tools"
-
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
-PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
-
-PACKAGES += " ${PN}-tools"
-
-FILES_${PN}-tools = "${bindir}/*"
-- 
2.7.4


