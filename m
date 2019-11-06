Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DEDD7F8BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:49:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA67ncnf005075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 23:49:38 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 23:49:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 23:49:31 -0800
Message-ID: <20191106074935.46751-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106074935.46751-1-hongxu.jia@windriver.com>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/8] python-scandir: add version 1.10.0
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
X-List-Received-Date: Wed, 06 Nov 2019 07:49:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It is required by python-pathlib2.

The recipe refers the duplicated one in meta-iot-cloud

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python-scandir_1.10.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-scandir_1.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb b/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb
new file mode 100644
index 000000000..253c2342b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-scandir_1.10.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A better directory iterator and faster os.walk()"
+HOMEPAGE = "https://github.com/benhoyt/scandir"
+AUTHOR = "Ben Hoyt"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=482ee62da51806409d432a80eed4e3ea"
+
+SRC_URI = "git://github.com/benhoyt/scandir.git"
+SRCREV = "982e6ba60e7165ef965567eacd7138149c9ce292"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
-- 
2.21.0


