Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 82DD674586
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 13:37:16 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f18-v6so9193612pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=DkeRwhcEzl+2f12dv5dF/0lGlhXIW72Ei2mD9n56a3A=;
	b=rgra6Sip5AhqkoxxNT6sOsagQUbkYEK9PEC33Z/SpqivS0uDQHHS80D1Fj1WKoTPL/
	YqAG6mrfFMALHgYyw4yfb0ESuFMT8LTd9m5XrfxmZSlLkVouDf+dUxXrEVsfy9v5JOgJ
	5errTVSmnrKddeEOoN0FjN81oc96MAcWKTaAa36h45r+bFYPNKQmBYxb8PKWRuBc0D3J
	a7EUC5VWbWLM6SUPMkOSAmwYHwReEVMoCGtH6FLELtHBIX4wC+edI9EG4ODbkTAdBrjS
	4vG2HmgjQJuRlnZg88tO0anqROKUxbAnXQEm7BOfkXeCsRQbycjiyZhfzLyZtAY7gF7n
	cR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DkeRwhcEzl+2f12dv5dF/0lGlhXIW72Ei2mD9n56a3A=;
	b=a3wFIpNN9Ugfp44F0x7jR5aoUs+8ZjQ5uuvkL/1nEAlBzNFq+YdKeZoGKHPw/4B8Kd
	mfiFuQD1ycP/SKNgo4dgWBBGYJ3a3UPP0aNEv6RxLQcq3Yoip7KkAqoaAzC3ACOXS4mJ
	EwfpvTv+h8kK2kmEG4ArjwcsGHCeT03XjS8lff6BxN9PkAaAoqUwFjHxamY2WiFuUBP2
	0K6mCww5lHCu0FnZIq1uzIUXM/6b8F7Mor4Kad7a1tTSiJsmiGGQOdzFadgN4JjS3BVh
	yw4P5NoYHxYxPyFEJvKfU5Pdn6SpMClGNf6vDeWbGCRDLmdOmvLYuH05KIkjeSmwAuK4
	MsGg==
X-Gm-Message-State: ABuFfogjMabYQnFhWPbp2zzGIUTtclAqST9erEXoosC82rCUddS6yovP
	MxJ3AXZErBjanp4pk7NOgi9LBUCxVAU=
X-Google-Smtp-Source: ACcGV608rtyzo+Bb1cgv9mw/iA5qL94sEBD/l0O1ArRwTzKloo4MIY1J0JihNgGW+mpF99+IqBo7vw==
X-Received: by 2002:a63:7744:: with SMTP id
	s65-v6mr16174870pgc.197.1539610637288; 
	Mon, 15 Oct 2018 06:37:17 -0700 (PDT)
Received: from ankit.iind.intel.com ([192.55.54.41])
	by smtp.gmail.com with ESMTPSA id
	h87-v6sm20696549pfj.78.2018.10.15.06.37.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Oct 2018 06:37:16 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Oct 2018 19:03:52 +0530
Message-Id: <1539610432-25870-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] opencl-icd-loader: Initial recipe for OpenCL ICD loader
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
X-List-Received-Date: Mon, 15 Oct 2018 13:37:16 -0000

This patch provides ICD loader library, ICD loader test binary
and some helper library for test.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../opencl-icd-loader/opencl-icd-loader_git.bb     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb

diff --git a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
new file mode 100644
index 0000000..7c49c8d
--- /dev/null
+++ b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
@@ -0,0 +1,45 @@
+SUMMARY  = "OpenCL ICD Loader"
+DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
+LICENSE  = "Khronos"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ec724732ce73269486574c718ef0c79b"
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
+	install -m 0755 ${B}/bin/icd_loader_test ${D}${bindir}/
+	chrpath -d ${D}${bindir}/icd_loader_test
+	install -d ${D}${libdir}
+	install -m 0644 ${B}/lib/libIcdLog.so ${D}${libdir}/
+	install -m 0644 ${B}/lib/libOpenCLDriverStub.so ${D}${libdir}/
+	chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
+	install -m 0644 ${B}/lib/libOpenCL.so.1.2 ${D}${libdir}/
+	cd ${D}${libdir}
+	ln -s libOpenCL.so.1.2 libOpenCL.so.1
+	ln -s libOpenCL.so.1 libOpenCL.so
+}
+
+PACKAGES = "opencl-icd-loader opencl-icd-loader-dev"
+PACKAGES += "libicdlog libicdlog-dbg"
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
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
+FILES_libicdlog-dbg = "${libdir}/.debug/libIcdLog.so"
+
+DEPENDS = "opencl-headers"
+RDEPENDS_${PN} = "libicdlog"
-- 
1.9.1


