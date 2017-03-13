Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9BE776BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:30:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D3UjD7020482
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 20:30:45 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 12 Mar 2017 20:30:44 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Mar 2017 11:29:19 +0800
Message-ID: <20170313032921.8669-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170313032921.8669-1-kai.kang@windriver.com>
References: <20170313032921.8669-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] libdnet: update SRC_URI
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
X-List-Received-Date: Mon, 13 Mar 2017 03:30:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The official site libdnet.googlecode.com is redirected to github. So
update SRC_URI and its checksums. And update S as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
index 28b6c82..aff64c2 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -4,10 +4,12 @@ SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
 
-SRC_URI = "http://libdnet.googlecode.com/files/libdnet-${PV}.tgz"
+SRC_URI = "https://github.com/dugsong/${BPN}/archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "9253ef6de1b5e28e9c9a62b882e44cc9"
-SRC_URI[sha256sum] = "83b33039787cf99990e977cef7f18a5d5e7aaffc4505548a83d31bd3515eb026"
+SRC_URI[md5sum] = "d2f1b72eac2a1070959667e9e61dcf20"
+SRC_URI[sha256sum] = "b6360659c93fa2e3cde9e0a1fc9c07bc4111f3448c5de856e095eb98315dd424"
+
+S = "${WORKDIR}/${BPN}-${BP}"
 
 inherit autotools
 
-- 
2.10.1


