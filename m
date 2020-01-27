Return-Path: <tgamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 534657FDF0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00RKhXca024837
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 12:43:43 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 27 Jan 2020 12:43:22 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 8EC1C900B8B;
	Mon, 27 Jan 2020 12:43:22 -0800 (PST)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jan 2020 12:43:22 -0800
Message-ID: <20200127204322.143707-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200127204322.143707-1-trevor.gamblin@windriver.com>
References: <20200127204322.143707-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][zeus][PATCH 2/2] pyhamcrest: add python3 version of recipe
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
X-List-Received-Date: Mon, 27 Jan 2020 20:43:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Twisted requires pyhamcrest for /usr/bin/twistd to work, but in zeus
there is only a python2 recipe for this package, thus the twistd daemon
won't be able to run properly for python3.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-pyhamcrest_1.9.0.bb                 | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
new file mode 100644
index 000000000..04aa9b47f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Hamcrest framework for matcher objects"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f"
+
+PYPI_PACKAGE = "PyHamcrest"
+
+SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
+SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
+
+inherit pypi setuptools3
-- 
2.23.0


