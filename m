Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B4B387F896
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 07:20:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77731015"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 15:20:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 04B4F4CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 15:12:03 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 31 Oct 2019 15:20:02 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 31 Oct 2019 15:20:02 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 23:14:21 +0800
Message-ID: <1572534861-51039-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 04B4F4CE1511.A595D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] iozone3: upgrade 484 -> 487
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
X-List-Received-Date: Thu, 31 Oct 2019 07:20:02 -0000
Content-Type: text/plain

1) Update LIC_FILES_CHKSUM as line number has been changed.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-benchmark/iozone3/{iozone3_484.bb => iozone3_487.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_484.bb => iozone3_487.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_484.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_487.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_484.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_487.bb
index f218b87..42864be 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_484.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_487.bb
@@ -4,14 +4,14 @@ AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.or
 SECTION = "console/tests"
 LICENSE = "iozone3"
 LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea735b5f4b \
-    file://iozone.c;beginline=269;endline=275;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
+    file://iozone.c;beginline=276;endline=282;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
 "
 SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "aa6b88ab83793cb6809ca06949a6ab01"
-SRC_URI[sha256sum] = "e816e6ae2f02003f2a6d19d47fcd9a50fdd8078da4f35fe3d4b9caf91c3d7216"
+SRC_URI[md5sum] = "2dbe035caf99c5367625352e158bb866"
+SRC_URI[sha256sum] = "2c488a7ccddd624fd557af16e71442c367b131d6178e1b4023bbd532bacdda59"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.7.4




