Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5D19760800
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Oct 2018 08:43:21 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id r9-v6so5994125pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2018 01:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ceDY7rQTWaUKmrIKco/dNRs7ODenVbMAZACnDsFdQ8k=;
	b=rJJcrT0+C2aMdkrJdGqvaz8f+MMSz2FgS5kiAUALgqTdkOx4cSZGgtwAVg7JTXl+G1
	4x3zp0XlsM1zgW4gUW54+wgWd56ftykkoro3jKku7dswQwWkD89002It+C+hXMn2w6bh
	rfEQAs40v4GfgUH9XtB11cnqn1nY76wXBfp1uI+eEpgpY3Ms1iIQME6tR+3o8CdHWxBK
	pifGktu549iBWlDFV9AIb9OIkcv0YILWxg1541lEE0nAARSAWn6CTaC15FZvPHXJ6JM5
	xQizX/HUWvyGED1QVu1hKEHj1slVYitm9jtca0gtiLI7EkpaqLoOEffwe1fPEE7xCgrK
	C1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ceDY7rQTWaUKmrIKco/dNRs7ODenVbMAZACnDsFdQ8k=;
	b=ePVM9bgMAfMiJk9ina279CxpkaCtN9qClFEyWfE22fCfYzxp6vESBip7Xy5gQiBqEy
	k357mQkw6tG9ZPfyKIDX3BtA9FamJvj8V+J0NM1ABLZ1FkSX0bZ2rRibnm0tGGmGzk5V
	IIKvhHc252JvatFlh3tdc9+8DoQ2lVFTmRohtb68VSzR7eNdt54C00Lvm8grtterrrJa
	m3f3+aFkdGz02P43AXRsiqhmceCNtolHKNRBQIKe98QPrQQ3Izk0A55/eUUTYgbFf9aP
	dl6hgfBAseNLvcarNc2UtuoMF3z+UBeZR/Wx2lWPm9Ss3xA8I23oJnyxoMEiMZNaHjyu
	SBQQ==
X-Gm-Message-State: ABuFfojOq2/5HnmdCrciHegNuyuJFrQm0P6SJPr9x9iaw1XHh9N5B7p5
	sTRpYPuk6oh6BoFVD5MoIhVVWes7aro=
X-Google-Smtp-Source: ACcGV621D6nzxXwQgwGcIREGYGdize7ldzpnDU1eHEd9TtyxqZlvizFHneAhcybExxmAKm24/ZS9Aw==
X-Received: by 2002:a65:4882:: with SMTP id
	n2-v6mr12714641pgs.225.1538815402193; 
	Sat, 06 Oct 2018 01:43:22 -0700 (PDT)
Received: from ankit.iind.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	g6-v6sm13824148pfb.11.2018.10.06.01.43.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Oct 2018 01:43:21 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Oct 2018 14:09:54 +0530
Message-Id: <1538815194-5528-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] opencl-icd-loader: Initial recipe for OpenCL ICD loader
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
X-List-Received-Date: Sat, 06 Oct 2018 08:43:21 -0000

This patch provides ICD loader library and ICD loader test binary
and some helper library for test.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../opencl-icd-loader/opencl-icd-loader_git.bb     | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb

diff --git a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
new file mode 100644
index 0000000..f6a8fef
--- /dev/null
+++ b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
@@ -0,0 +1,47 @@
+SUMMARY  = "OpenCL ICD Loader"
+DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
+LICENSE  = "CLOSED"
+LIC_FILES_CHKSUM = "file://icd.h;beginline=1;endline=36;md5=c406ef72ec08f23326801455d7713b07"
+SECTION = "base"
+
+inherit pkgconfig cmake
+
+S = "${WORKDIR}/git"
+SRCREV = "b342ff7b7f70a4b3f2cfc53215af8fa20adc3d86"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git"
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/../build/bin/icd_loader_test ${D}${bindir}/
+	chrpath -d ${D}${bindir}/icd_loader_test
+	install -d ${D}${libdir}
+	install -m 0644 ${S}/../build/lib/libIcdLog.so ${D}${libdir}/
+	install -m 0644 ${S}/../build/lib/libOpenCLDriverStub.so ${D}${libdir}/
+	chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
+	install -m 0644 ${S}/../build/lib/libOpenCL.so.1.2 ${D}${libdir}/
+	cd ${D}${libdir}
+	ln -s libOpenCL.so.1.2 libOpenCL.so.1
+	ln -s libOpenCL.so.1 libOpenCL.so
+}
+
+PACKAGES = "opencl-icd-loader opencl-icd-loader-dev"
+PACKAGES += "libicdlog libicdlog-dbg"
+
+FILES_${PN} = " \
+	${bindir}/icd_loader_test \
+	${libdir}/libOpenCLDriverStub.so \
+	${libdir}/libOpenCL.so.1.2 \
+"
+FILES_${PN}-dev = " \
+	${libdir}/libOpenCL.so \
+	${libdir}/libOpenCL.so.1 \
+"
+
+FILES_libicdlog = "${libdir}/libIcdLog.so"
+FILES_libicdlog-dbg = "${libdir}/.debug/libIcdLog.so \
+	/usr/src/debug/opencl-icd-loader/git-${PR}/git/test \
+	/usr/src/debug/opencl-icd-loader/git-${PR}/git \
+"
+
+DEPENDS = "opencl-headers"
+RDEPENDS_${PN} = "opencl-headers libicdlog"
-- 
1.9.1


