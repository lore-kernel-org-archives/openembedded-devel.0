Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 41BB378273
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:00:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L60g2N018232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Aug 2017 23:00:42 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 20 Aug 2017 23:00:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Aug 2017 02:00:36 -0400
Message-ID: <a5dd46427a8eaa3f0dae09da369976b4a5a230eb.1503295148.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503295148.git.hongxu.jia@windriver.com>
References: <cover.1503295148.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] multipath-tools: add bash to RDEPENDS
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
X-List-Received-Date: Mon, 21 Aug 2017 06:00:43 -0000
Content-Type: text/plain

Fix the following file-rdeps QA issue:
...
|ERROR: multipath-tools-0.7.1-r0 do_package_qa: QA Issue: /sbin/mpathconf
contained in package multipath-tools requires /bin/bash, but no
providers found in RDEPENDS_multipath-tools? [file-rdeps]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
index 610ba7a..a13efbe 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
@@ -97,7 +97,7 @@ FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
 PACKAGES =+ "${PN}-libs"
 FILES_${PN}-libs = "${base_libdir}/lib*.so.* \
                     ${base_libdir}/multipath/lib*.so*"
-RDEPENDS_${PN} += "${PN}-libs"
+RDEPENDS_${PN} += "${PN}-libs bash"
 
 PROVIDES += "device-mapper-multipath"
 RPROVIDES_${PN} += "device-mapper-multipath"
-- 
2.8.1


