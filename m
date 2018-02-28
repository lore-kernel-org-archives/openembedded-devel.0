Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 77A8878856
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:53:20 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id z3so1679212uae.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 06:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rNY946YJVavyWpH9ni40wF2sO4BysdcwLxN8S26Edmg=;
	b=N8Gee43O8uK0qRrYhe/0udl0AQHgy2IC6AHvAIVuuaiWxSOTUr6tYMjpg3k95M/3SA
	LLaK9FTrE8r706V/Jv3Q1L11ZT4VBinOZE3erDAuUAGLY1bQoFoG7LLjWjOUN3dUOZSx
	oKiRkxywM/DHHXYNNimSjhyQ2e+gj5giRou3qnJ1sqhZyKjhpWFIE2W5Ap8BPU/ejSAj
	iw46o+IVp9FxgWQzPeBhu6wWj3YfRDILf82kCCGVSSGMLR6pdnch32b6VBA6JiDJSHPC
	VhQYljEhPw7mIc9NvNknD7PCFZioRFEVFkxc52lb+kLvWaS+CxXvdHzPTAgwzcR/733d
	0L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rNY946YJVavyWpH9ni40wF2sO4BysdcwLxN8S26Edmg=;
	b=fkJ15qKeWSrQxJ/6EdURjb+Gnorfyo4IEWdCXQD13xleDzPaK7uMRUKNBKpwqktA30
	utxbtQpyKmkQ+hGI22CLnsVE5gKvqETlgxZKSd6RUVN5X2Ae11onWDAY7dP6vq3z+ssx
	iK7Xx0beJJnm9fLPUAu4RQNhT25CN5+wYNm9gNeC5XJw+OpyUv5/M0rlod0DljgB2KV8
	erSH2aEo0DM624Ilt6v8dIvzow6nc/fnRJkJ7BOJ2hBArfDjmZohvShSLPNVwi7nd48a
	mw+OMBnEu6YVsI9o2hTLoTVYPNWAI68ZqCiDMwW0Kdq//V1QDXfLwMEacQwWFs+pQfhu
	424A==
X-Gm-Message-State: APf1xPBLm/VKWhuv+fOK9X65Ux/XDR8i6xET8k1zW4HmAJEZBgPE56rI
	eU2BNi7Wz9w+CpLm/xEgdVHmPhD6
X-Google-Smtp-Source: AG47ELs9v70Y/waiTACXLmPObFq9NDIHJTNA2qef/zjuLrLUnd4hJTb/+uY9XKGrH4ig/kHwTmvttA==
X-Received: by 10.176.2.244 with SMTP id 107mr2180046uah.52.1519829601530;
	Wed, 28 Feb 2018 06:53:21 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id j192sm321962vke.9.2018.02.28.06.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Feb 2018 06:53:21 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 08:53:12 -0600
Message-Id: <1519829592-17286-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v3] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Wed, 28 Feb 2018 14:53:21 -0000

GstShark is an open-source project from RidgeRun that provides
benchmarks and profiling tools for GStreamer 1.7.1 (and above).
It includes tracers for generating debug information plus some
tools to analyze the debug information. GstShark provides easy
to use and useful tracers, paired with analysis tools to enable
straightforward optimizations.

Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
---
 .../gstreamer-1.0/gst-shark_0.2.1.bb               | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
new file mode 100644
index 0000000..8ca165c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Gst-Shark Tracers"
+DESCRIPTION = "Benchmarks and profiling tools for GStreamer"
+HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=GstShark"
+SECTION = "multimedia" 
+LICENSE = "GPLv2+" 
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
+
+SRCBRANCH ?= "master"
+
+SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+
+SRC_URI = " \
+    git://github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
+    git://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
+    "
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG_CONFARGS = " \
+	--disable-graphviz \
+	--enable-gtk-doc=no \
+"
+
+FILES_${PN} += "\
+	${libdir}/gstreamer-1.0/libgstsharktracers.so  \
+	${libdir}/gstreamer-1.0/libgstsharktracers.la \
+"
+
+inherit autotools gettext 
+
+do_configure() {
+	${S}/autogen.sh --noconfigure
+	oe_runconf
+}
-- 
1.9.1


