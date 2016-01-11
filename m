Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35D18731E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:08:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B58RRE013441
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:08:28 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 21:08:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 10 Jan 2016 21:08:27 -0800
Message-ID: <1452488907-37191-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] dfu-util: use BP in SRC_URI
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
X-List-Received-Date: Mon, 11 Jan 2016 05:08:28 -0000
Content-Type: text/plain

The PN caused multilib do_fetch error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
index 51d00c6..51f4ae1 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 
-SRC_URI = "http://dfu-util.gnumonks.org/releases/${PN}-${PV}.tar.gz \
+SRC_URI = "http://dfu-util.gnumonks.org/releases/${BP}.tar.gz \
     file://0001-configure.ac-Don-t-check-for-usbpath.patch \
 "
 
-- 
1.7.9.5


