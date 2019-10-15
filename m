Return-Path: <aatrapps@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA11D7F455
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:38:12 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id z2so3751911ybn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c3HMsAgYcTt7Gz8BfVfO4er6/gNsw+b6I1hNnR77voM=;
	b=as1z8jzrtdDuTVYd78DHdF53kPfxb9YYil3XaER7bs4wehRw1CZk8hnAL+VASomAVd
	igRv+a4RqIGR3nqKG4GpO7j1v8sONzDVP/HIkW45qsfhfUP4eu8F6fAGmZfu+c8mjwRf
	Uyi8l6yRlF5We+lCAFmv96hZZaiTdEGclEdLiUapcdYCHvgJO/jSHvmn1Rk24UmQesRA
	vRc0Sn5/tXNsbXcsEHJaKWYo277diURdkgEYu977zusIqbUs1DyndOnlfcrdCaK0FjU4
	+7UootIpI0naczE+pdPYp9Rkbu2jIAKleGscp09zL8FkkJRqD3yOa+xtXCvOpqTyhhej
	ECQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c3HMsAgYcTt7Gz8BfVfO4er6/gNsw+b6I1hNnR77voM=;
	b=if1Pla9xqaV8dcZ31OERuEqFPDgOvmk9tIkdY5jfafgRAPMNuKU8gvcAx8pcWtMSue
	S4+RE/n4Y/XEhiIG/82XWboBhPRXNdYpDcaa3bJ+KBzMrn0rlMkT7GiQX6YVQcKLlYog
	PsjMJiETG9m3KxebniPqpgI3A0HMA4WtMH6PHfsRE4Cqj9hYe7sHOlyAuJOQQMFC2p1n
	SuG8ZDTq5O8QuSwDIOcTHBzQobnZwIMf+GOKHcxi/4Q8Hx/prhhjEo/q/Z1bueePzb5W
	Ef1phc0C9JRZ5ZDP17QUBmF+a8nFJ0o3LhaZnRqcyNdUjGWC5mIFm/77RfauRRT80L+j
	2wyg==
X-Gm-Message-State: APjAAAVPKjCThaHgHXjVOi8ulQcywLULTnTfamiANN8TWKJ+1WT4MPbF
	/hz6FOs1uc9wG1UyfHP8L5hBwg/T
X-Google-Smtp-Source: APXvYqwYi8y4kXfrpi2dnDF+nTytT3JqptwC83RPNcBVN3ql9autkZBM/Z4gmozKaRq3rmz2BIzDeQ==
X-Received: by 2002:a25:32ca:: with SMTP id y193mr24145499yby.73.1571157493328;
	Tue, 15 Oct 2019 09:38:13 -0700 (PDT)
Received: from aatir-VirtualBox.ibmmobiledemo.com ([170.225.9.143])
	by smtp.gmail.com with ESMTPSA id
	b73sm5331685ywe.35.2019.10.15.09.38.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Oct 2019 09:38:12 -0700 (PDT)
From: Aatir <aatrapps@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 11:38:01 -0500
Message-Id: <20191015163801.1963-1-aatrapps@gmail.com>
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
X-List-Received-Date: Tue, 15 Oct 2019 16:38:13 -0000

From: Tekkub <aatrapps@gmail.com>

Adding nlohmann-fifo, a c++ header library for fifo maps.

Signed-off-by: Aatir <aatrapps@gmail.com>
---
 .../nlohmann-fifo/nlohmann-fifo_git.bb        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb

diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
new file mode 100644
index 000000000..5ea6cf063
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -0,0 +1,22 @@
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


