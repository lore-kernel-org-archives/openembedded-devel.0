Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0201560125
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 02:43:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9N2hn9Q015916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Oct 2018 19:43:49 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 22 Oct 2018 19:43:48 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 23 Oct 2018 10:43:46 +0800
Message-ID: <1540262627-38314-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] snort: Update SRC_URI
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
X-List-Received-Date: Tue, 23 Oct 2018 02:43:50 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update SRC_URI for snort as the previous
one is invalid.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
index 22f52b5..a99138d 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
 DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native libtirpc bison-native"
 
-SRC_URI = "https://www.snort.org/downloads/snort/${BP}.tar.gz \
+SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://snort.init \
     file://0001-libpcap-search-sysroot-for-headers.patch \
     file://fix-host-contamination-when-enable-static-daq.patch \
-- 
2.7.4


