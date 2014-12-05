Return-Path: <rapphil@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 351FF7238F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 17:50:45 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id s7so752545qap.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2014 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=031Ars/cRtpCbQdkHyF7zYvr45UHOywyRaqv/E5Sunw=;
	b=K6O7D6xnivdPA6x/pCm1cMJnCRjsIiZbDYWSVbESnwDEXkm21ody2vrvqS0M+Kxl+k
	O/3f2Sp0DgXoxrW7Q0kgapYNf+pCls4eOxQ4gdjD85sFa7/NhmOHQhZCu1kukrCvrIbC
	cm8Hvc7WWitsmddUB6dMPwCmaCCn5DS7Hm/TGsc8qbDoJmpgnM87J3jZFqbbxyfzgY+2
	QLySLLQXiApx0CXyMcYyYtcLPXBlpjNM7esMfaxM2Zwipx23ORSc4Jf4Shnn0XU1F5o/
	VURFnlaKq0L63xKJdC2wwxzMdGe2+C+jYzHTPsfVvKl4LA0n3OA+K3k//pAaJD4qaKsh
	Z3BA==
X-Received: by 10.140.104.236 with SMTP id a99mr27155681qgf.56.1417801846223; 
	Fri, 05 Dec 2014 09:50:46 -0800 (PST)
Received: from localhost.localdomain (host29.reason.com.br. [187.49.239.29])
	by mx.google.com with ESMTPSA id
	w44sm11884699qgw.40.2014.12.05.09.50.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Dec 2014 09:50:45 -0800 (PST)
From: Raphael Silva <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Dec 2014 15:50:29 -0200
Message-Id: <1417801829-2363-1-git-send-email-rapphil@gmail.com>
X-Mailer: git-send-email 2.2.0
Subject: [meta-oe][PATCH] libftdi: update to 1.1
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
X-List-Received-Date: Fri, 05 Dec 2014 17:50:52 -0000

Previous version was 0.19, but it had a failing recipe due to 
the fact that libusb was not detect during do_configure.
This problem does not happen in version 1.1.

Signed-off-by: Mario Goulart <mario.goulart@gmail.com>
Signed-off-by: Raphael Silva <rapphil@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb | 31 -------------------------
 meta-oe/recipes-support/libftdi/libftdi_1.1.bb  | 29 +++++++++++++++++++++++
 2 files changed, 29 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libftdi/libftdi_0.19.bb
 create mode 100644 meta-oe/recipes-support/libftdi/libftdi_1.1.bb

diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
deleted file mode 100644
index 773b791..0000000
--- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "libftdi is a library to talk to FTDI chips.\
-FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
-including the popular bitbang mode."
-HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
-SECTION = "libs"
-
-PR = "r1"
-
-LICENSE = "LGPLv2.1 GPLv2"
-LIC_FILES_CHKSUM= "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
-                   file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
-"
-
-PNBLACKLIST[libftdi] = "BROKEN: needs to be updated to detect libusb with pkg-config instead of libusb-config"
-
-DEPENDS = "virtual/libusb0"
-DEPENDS_virtclass-native = "virtual/libusb0-native"
-
-SRC_URI = "http://www.intra2net.com/en/developer/libftdi/download/libftdi-${PV}.tar.gz \
-           file://libtool-m4.patch \
-"
-SRC_URI[md5sum] = "e6e25f33b4327b1b7aa1156947da45f3"
-SRC_URI[sha256sum] = "567c9d2c42d92fc401c5aba2deed45ffb2433990984e816bcdf31e441aef06be"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[cpp-wrapper] = "--enable-libftdipp,--disable-libftdipp,boost"
-
-inherit autotools binconfig pkgconfig
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
new file mode 100644
index 0000000..641e5a7
--- /dev/null
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "libftdi is a library to talk to FTDI chips.\
+FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
+including the popular bitbang mode."
+HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 GPLv2"
+LIC_FILES_CHKSUM= "\
+    file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
+    file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
+"
+
+DEPENDS = "libusb1"
+
+SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "b79a6356978aa8e69f8eecc3a720ff79"
+SRC_URI[sha256sum] = "c0b1af1a13e2c6682a1d8041e5b164a1e0d90267cd378bb51e059bd62f821e21"
+
+S = "${WORKDIR}/${BPN}1-${PV}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on,-DFTDI_BUILD_CPP=off,boost"
+
+inherit cmake binconfig pkgconfig
+
+FILES_${PN}-dev += "${libdir}/cmake"
+
+BBCLASSEXTEND = "native"
-- 
2.2.0


