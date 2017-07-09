Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9116FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jul 2017 15:47:48 +0000 (UTC)
Received: from localhost.localdomain (pub082136089155.dh-hfc.datazug.ch
	[82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4C75022C87;
	Sun,  9 Jul 2017 15:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C75022C87
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jul 2017 17:47:23 +0200
Message-Id: <20170709154723.4623-3-krzk@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170709154723.4623-1-krzk@kernel.org>
References: <20170709154723.4623-1-krzk@kernel.org>
Subject: [meta-python][PATCH 3/3] meta-python: Add pybluez recipe
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
X-List-Received-Date: Sun, 09 Jul 2017 15:47:48 -0000

Add recipe for PyBluez, Python wrapper over bluez.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../recipes-devtools/python/python-pybluez_0.22.bb      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pybluez_0.22.bb

diff --git a/meta-python/recipes-devtools/python/python-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
new file mode 100644
index 000000000000..eab9c542094a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pybluez_0.22.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Bluetooth Python extension module"
+HOMEPAGE = "http://karulis.github.io/pybluez/"
+SECTION = "devel/python"
+
+RDEPENDS_${PN} = "bluez5"
+DEPENDS = "bluez5"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
+
+inherit pypi setuptools
+
+SRC_URI = "https://pypi.python.org/packages/c1/98/3149481d508bee174335be6725880f00d297afebe75c15e917af8f6fe169/PyBluez-0.22.zip"
+SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
+SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
+
+S = "${WORKDIR}/PyBluez-${PV}"
-- 
2.11.0


