Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3A46D7FBA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 01:03:06 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id g24so805157wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PyuDrNXMRG1cRmEee2e7oSV704XtX2iPCwGbAiTmquM=;
	b=Pz15DDmtOk5Q+aTYOO22C/pILZ+UNOUkmkx/75PztDRhFGRKadD73CrKSfI/M1CH51
	uNugefc5jlbjSU9f5U95l0vjdQDK+D/zVH8CuB7FOaanQ/cufLR3WjF9zMyBK8VDf5MD
	DIDZMAyYgRLsgzBYCKc8Y9nYQl0XscnxUd/yhyDi5H/SDtdm0WhkfhxltyCVXufdYTzV
	o0xCdXGdMxSaEI78FAXvoC2nfy6gtMARwEkN4bUDgikcl709lH5iELBC2QbG4/9p9tJ/
	m9BGBIt0v488J3FutqAgC9EbNoOVLV8R94VInbH3/lw8pKONW1NS36gEsb39vDp6F0/4
	kcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PyuDrNXMRG1cRmEee2e7oSV704XtX2iPCwGbAiTmquM=;
	b=rDueiyRrKkx6LrRtWJC/yACIAuyhmLve6obSLN89rG2AopG819udTSlSEzPZB+TMe6
	BtP2tHdq67eIA/nSyWDcW30tIjznFcTrcy31vbg8gN8RG5umqs/CuLMJ6kUTjWB2rvfT
	wZCjvdMVuUaCCu/rz9oF9aSFEwqfbcqJ2fVsZM0TUPkXseAK/3iJ4uCZUm75Kon7f1bh
	gNAOeUr0fzqT2Xlw68bREZMxjIgO7hy9CKDn6u7nLbmInXfF3lSPjijO7QN2kFNvhyJZ
	S+6hj6RVlDaLyXU8a+J/ZthSF3lnOIXHiOn5BBhdHXCzPpUqdtHpGaAh/ELUpUTUIsxd
	2u+w==
X-Gm-Message-State: APjAAAWG+BcirDWg37IAtywN2BGLSf/WPKQ5yF6ZqjWdpFSxVK3VoDRD
	q8q1/j69vllk9IXCQb4Gk2ffqfrk
X-Google-Smtp-Source: APXvYqxAs5fkhN/46SIEsmNGOLodPsUlBa0Fd4r4ZEj3jAmXt2wK722NJyN/Q4b5w58pD1o5mnsQ3Q==
X-Received: by 2002:a1c:7c07:: with SMTP id x7mr1789166wmc.130.1572310986561; 
	Mon, 28 Oct 2019 18:03:06 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F3206985B50CF9AC855C254.dip0.t-ipconnect.de.
	[2003:f0:7f32:698:5b50:cf9a:c855:c254])
	by smtp.gmail.com with ESMTPSA id k3sm8758714wrn.95.2019.10.28.18.03.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 18:03:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 02:02:52 +0100
Message-Id: <20191029010253.5784-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029010253.5784-1-schnitzeltony@gmail.com>
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] unicode-ucd: initial add 12.1.0
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
X-List-Received-Date: Tue, 29 Oct 2019 01:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a build dependency for ibus

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../unicode-ucd/unicode-ucd_12.1.0.bb         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
new file mode 100644
index 000000000..88a116f63
--- /dev/null
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "C++11 command line parser"
+HOMEPAGE = "https://github.com/CLIUtils/CLI11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://unicode.org.license.html;beginline=42;endline=85;md5=67619d0c52706853c0256514e7fd04cd"
+
+SRC_URI = " \
+    https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd \
+    https://www.unicode.org/license.html;name=license;subdir=${BP};downloadfilename=unicode.org.license.html \
+"
+SRC_URI[ucd.md5sum] = "430cbdac2615451571dd69a976dd08f6"
+SRC_URI[ucd.sha256sum] = "25ba51a0d4c6fa41047b7a5e5733068d4a734588f055f61e85f450097834a0a6"
+
+SRC_URI[license.md5sum] = "f03bafb623258f85ff2032c1ce567b7c"
+SRC_URI[license.sha256sum] = "983225207de8a707d0903a8d70fb7a4b28c5e0f64f2366e84a6192a2d618fed4"
+
+inherit allarch
+
+do_configure[noexec] = "1"
+
+do_install() {
+    install -d ${D}${datadir}/unicode
+    cp -rf ${WORKDIR}/ucd ${D}${datadir}/unicode
+}
+
+FILES_${PN} = "${datadir}/unicode/ucd"
-- 
2.21.0


