Return-Path: <aatrapps@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 798777F37B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 17:17:46 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id y204so8051687yby.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9DEUnxYu1LW81wJeRRDcT4r0fTzEnKzRmMuohNc3gU4=;
	b=OZnSPM/3e2FC9tk2vYrCE/q+8jkuVgsyKR2yOLP0+nPvXVdj0sMkVfAcTwH9aVHG/V
	QwoQWkW6Nbe09xrUfTpwWvCrqYYri3m9Dj+cpnhbqBnZkzr+AFULixy+IEb0pXxXKCNP
	X4t6iqZ6dPLPQaatowo8jE68cU+5F5hTLZKMh0/GGANqGTYDiLZE8gShy1B7i6EqVv31
	4aCOQCJRHykre102qdWDYu2TVkmjrvMajwrrF89EzqD0UN3MOyWBVhHsMFjr43aUJdZd
	C310NInXB+YQnKjkvC6DOHeJvKKDtaiLDS0Am8bzlTdHKD55X4pk31ekLSF/yV3ULQEC
	ce+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9DEUnxYu1LW81wJeRRDcT4r0fTzEnKzRmMuohNc3gU4=;
	b=fyH92RDVN6Hvm0RsAxRYSz8tGTcmwGivyahCfQqPYnq/dfUZBRuYjU1R0GGpGSWGv/
	Sa7SOUoDi/q7Lhn2WFKda86czLMRtVI3G+j45liGCNR9HnvlnV4G9DIcKf96skRgB/Mc
	9CxEq6rajG5DktyI1bOCfWyhRtmp7MVzZa1TjIpNkjRpZbiADfKmTT7nqVzgbTGkz/l1
	dOspndmmWg+cR4NbOycVl4wzrKOkSRtJw/zJZnm20aqr4p0rYkMsMLjmPhdu6Ad5V7y4
	8ABIqYldRqSs4y6y/Z3Zl5fGKZXv6fpMostSuK5noc4AN21c8BII4XXu843WiOmGQy0g
	qWWQ==
X-Gm-Message-State: APjAAAWxtSpjaTfxtmWX+zyFnZI9SiBO0jsaCBNQNx/xFe55CY3cRrb6
	E2WKuU3go03NmaYMEFR/5KJ2o1wRvrc=
X-Google-Smtp-Source: APXvYqzzEbonL13G+PR4Q6e3BckFaUF9GMvGSyiTDjtlLXTVa/dnCFazwXdOP79+vCgK9j8ZZgiVfg==
X-Received: by 2002:a25:da07:: with SMTP id n7mr29599386ybf.418.1571246266874; 
	Wed, 16 Oct 2019 10:17:46 -0700 (PDT)
Received: from aatir-VirtualBox.ibmmobiledemo.com ([170.225.9.143])
	by smtp.gmail.com with ESMTPSA id
	l77sm6237562ywb.32.2019.10.16.10.17.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 10:17:46 -0700 (PDT)
From: Aatir <aatrapps@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Oct 2019 12:17:38 -0500
Message-Id: <20191016171738.9703-1-aatrapps@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] nlohmann-fifo: Add recipe
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
X-List-Received-Date: Wed, 16 Oct 2019 17:17:46 -0000

From: Tekkub <aatrapps@gmail.com>

Adding nlohmann-fifo, a c++ header library for fifo maps.

Signed-off-by: Aatir <aatrapps@gmail.com>
---
 .../nlohmann-fifo/nlohmann-fifo_git.bb        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb

diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
new file mode 100644
index 000000000..326a4abfb
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "fifo maps for c++"
+HOMEPAGE = "https://github.com/nlohmann/fifo_map"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=b67209a1e36b682a8226de19d265b1e0"
+
+SRC_URI = "git://github.com/nlohmann/fifo_map.git"
+
+PV = "1.0.0+git${SRCPV}"
+
+SRCREV = "0dfbf5dacbb15a32c43f912a7e66a54aae39d0f9"
+
+S = "${WORKDIR}/git"
+
+# nlohmann-fifo is a header only C++ library, so the main package will be empty.
+
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install() {
+    install -d ${D}${includedir}
+    install -m 0644 ${S}/src/fifo_map.hpp ${D}${includedir} 
+}
-- 
2.17.1


