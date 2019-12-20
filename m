Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD86C7DB51
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 20:35:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s21so1847966plr.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 12:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=Q2fwA9tWXW79or9uLGDKmbTbV5TNl2wEYmDlFzrejUk=;
	b=j+VKP/aytqzu5lU9YQwT1ePK/9H68Gp+WynCtxn4zjJLRIiu6m9EIXi72bBjE/v6D6
	l0SeSUwFRVIFMslCkYSICARKC9IyNCqfxc0+7vbK+a4/FQFuGkYltKoxTdWAkBThBF2B
	Ym80hNtDyE/LPQECnSmfq14u6F9YqfQv/O8zj+ZigvsTLfsrUKFudrycxm+dE5GHpxhU
	1mqyzZY8faD4nFuJAYYFuix3uqZ02GmKjcR0vHE5hYkR9TFor5rdFLufJSPA7T/2bhxC
	ywhnoTIPaPjmGzc6lnE5F5Q0pmDtAdPCNn+mDHVK8fIqqYWeSBMDZvvjG//JeC3kiRGA
	M35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=Q2fwA9tWXW79or9uLGDKmbTbV5TNl2wEYmDlFzrejUk=;
	b=cIIwzqRLvVAg44AE/Zvws+w8oVg+xsf8ZkRKhqVHNsK6Un57fFR+CCJW/HnfIleG2t
	+kMdDPiB+K4RJ0tBW4BuU2Vh8o8AqxsufdMINcFGczI8JK1r5v7rhBvCxP0dS43ChIsr
	hP10r1T5C9IzsnZo6URWx4yxf/1A4WAFTIZfi5dcbcpod3hkUilWpYTIExDfovahA82a
	41iB+IgPluKdZcwvVbzCAmbcZi3yZ1C1xSJfRgZEqqZbL+iHjvRRb4ZFP2dLCooHbVbd
	hFT5ySqNb9J4ETL49r16X+gGj5fP8S1vSg8v2aO1W/ID8vvXKHQJg8s71AENZ6gouJzK
	tWUQ==
X-Gm-Message-State: APjAAAVXNeZKrVmxdN30gxR3za/O61urB46GlnJCKT6QwaYUYboxDI1K
	qtHuTB+Ahk8o9eTSIhIZXTPFe964OpVQQg==
X-Google-Smtp-Source: APXvYqxLIyKKJeLN22tWQj9KSpnEqcsUU75kC5oDqougHli3StnbHQ4cMjG23clSaxVfUFK+ejna2g==
X-Received: by 2002:a17:902:7102:: with SMTP id
	a2mr17251474pll.301.1576874127759; 
	Fri, 20 Dec 2019 12:35:27 -0800 (PST)
Received: from centrium.lab.ossystems ([189.103.49.163])
	by smtp.gmail.com with ESMTPSA id
	k23sm11794975pgg.7.2019.12.20.12.35.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 12:35:27 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:35:14 -0300
Message-Id: <20191220203515.27189-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH] nanopb: Add recipe for version 0.4.0
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
X-List-Received-Date: Fri, 20 Dec 2019 20:35:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/nanopb/nanopb_0.4.0.bb   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb

diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
new file mode 100644
index 000000000..aedd53a7a
--- /dev/null
+++ b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
@@ -0,0 +1,28 @@
+DESCRIPTION="Protocol Buffers with small code size"
+LICENSE="Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
+
+DEPENDS = "protobuf-native"
+
+SRC_URI = "git://github.com/nanopb/nanopb.git"
+SRCREV = "70f0de9877b1ce12abc0229d5df84db6349fcbfc"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pythonnative
+
+do_install_append() {
+    install -Dm 0755 ${S}/generator/nanopb_generator.py ${D}${bindir}/nanopb_generator.py
+    install -Dm 0755 ${S}/generator/protoc-gen-nanopb ${D}${bindir}/protoc-gen-nanopb
+    install -Dm 0755 ${S}/generator/proto/__init__.py ${D}${PYTHON_SITEPACKAGES_DIR}/proto/__init__.py
+}
+
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-dev += "${libdir}/cmake/${BPN}"
+
+RDEPENDS_${PN} += "\
+   ${PYTHON_PN}-protobuf \
+   protobuf-compiler \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


