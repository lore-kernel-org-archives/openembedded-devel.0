Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8527F7F687
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:49:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA67naO8024904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 23:49:36 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 23:49:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 23:49:29 -0800
Message-ID: <20191106074935.46751-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106074935.46751-1-hongxu.jia@windriver.com>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/8] python-importlib-metadata: add missing runtime depends
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
X-List-Received-Date: Wed, 06 Nov 2019 07:49:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From setup.cfg:
...
 20 install_requires =
 21     zipp>=0.5
 22     pathlib2; python_version=='3.4.*' or python_version < '3'
 23     contextlib2; python_version < '3'
 24     configparser>=3.5; python_version < '3'
...

Add missing runtime depends while python version < '3'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python-importlib-metadata_0.23.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
index 5c213004c..dd95cf360 100644
--- a/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
+++ b/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools
 require python-importlib-metadata.inc
+RDEPENDS_${PN} += "python-configparser \
+                   python-contextlib2 \
+                   python-pathlib2 \
+"
-- 
2.21.0


