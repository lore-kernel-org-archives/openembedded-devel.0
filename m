Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 49C1F7840F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:20:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6S7KgJn018689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 00:20:42 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 28 Jul 2017 00:20:42 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jul 2017 15:20:16 +0800
Message-ID: <81b2bcaf89a6633a0b34e50b3b6e00ddb098098d.1501226187.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501226187.git.jackie.huang@windriver.com>
References: <cover.1501226187.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] openl2tp: add LGPL-2.1 license
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
X-List-Received-Date: Fri, 28 Jul 2017 07:20:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

cli and usl use license LGPL-2.1.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index e1670b3ae..9be1c7956 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -7,8 +7,15 @@ different configuration. It is used by several ISPs to provide \
 L2TP services and by corporations to implement L2TP VPNs."
 HOMEPAGE = "http://www.openl2tp.org/"
 SECTION = "net"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585"
+
+# cli and usl use license LGPL-2.1
+LICENSE = "GPL-2.0 & LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585 \
+                    file://LICENSE;md5=f8970abd5ea9be701a0deedf5afd77a5 \
+                    file://cli/LICENSE;md5=9c1387a3c5213aa40671438af3e00793 \
+                    file://usl/LICENSE;md5=9c1387a3c5213aa40671438af3e00793 \
+                    "
+
 DEPENDS = "popt flex readline"
 
 SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
-- 
2.11.0


