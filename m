Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B7BD877E8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I69PNm023084
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 23:09:25 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:07 -0400
Message-ID: <d714c13548914fab6bbc4427d6bc1f522c698463.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] python3-ntplib: add recipe 0.3.3
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:24 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
new file mode 100644
index 0000000..35440bc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "This module offers a simple interface to query NTP servers from Python."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://ntplib.py;beginline=1;endline=23;md5=afa07338a9595257e94c205c3e72224d"
+
+SRCNAME = "ntplib"
+SRC_URI[md5sum] = "c7cc8e9b09f40c84819859d70b7784ca"
+SRC_URI[sha256sum] = "c4621b64d50be9461d9bd9a71ba0b4af06fbbf818bbd483752d95c1a4e273ede"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools3 python3native pypi
-- 
2.8.1


