Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9058160722
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 07:45:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8Q7jVoX011272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 00:45:31 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Sep 2016 00:45:31 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Sep 2016 15:41:45 +0800
Message-ID: <1474875705-4768-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] geoip-perl: upgrade to 1.50
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
X-List-Received-Date: Mon, 26 Sep 2016 07:45:33 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Upgrade geoip-perl from 1.45 to 1.50
* Update LIC_FILES_CHKSUM to check LICENSE file instead
  of the previous README as no README file in 1.50

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../geoip/{geoip-perl_1.45.bb => geoip-perl_1.50.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoip-perl_1.45.bb => geoip-perl_1.50.bb} (82%)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
similarity index 82%
rename from meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
rename to meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
index fd3aae9..a8c8bcf 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "perl library for country/city/organization to IP address or hostn
 HOMEPAGE = "http://www.maxmind.com/app/ip-location"
 SECTION = "libdevel"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;md5=b0fa745303912bd2d64430f7ae69487d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b7a36f55e8ba62aadd74e4f0886a405e"
 
 # Note that we do not want to use the upstream file name locally.
 #
@@ -15,8 +15,8 @@ SRC_URI = "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz;downlo
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "0ce57140890bf81958e0cea4fe1885b2"
-SRC_URI[sha256sum] = "c56437b1cc8887736cb1e435d0320c1c1ff3754830249516317b99137005fb23"
+SRC_URI[md5sum] = "2d7f8b1b54e6ba6d9e3fefce52675815"
+SRC_URI[sha256sum] = "86da0dd67f417a43dc70f15a49bd3619f668970c117b9e7f737b4ab246c240a6"
 
 S = "${WORKDIR}/geoip-api-perl-${PV}"
 
-- 
2.8.1


