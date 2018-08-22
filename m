Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 276AD74A32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:13:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7M9DpZG026399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 02:13:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 22 Aug 2018 02:13:50 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Aug 2018 17:13:49 +0800
Message-ID: <1534929229-207708-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nmap: install ndiff
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
X-List-Received-Date: Wed, 22 Aug 2018 09:13:50 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Currently, the ndiff isn't built and installed
as ndiff is python2 compatible script and it
checks PYTHON_VERSION to determine whether
build and install ndiff in configure phase.

Update to inherit pythonnative to let the
PYTHON_VERSION to be 2 to let ndiff be built
and installed.

Apart from ndiff python script, there is another
script named ndiff.py used by ndiff, export
PYTHON_SITEPACKAGES_DIR to make ndiff.py installed
in the correct place.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-security/nmap/nmap_7.70.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb b/meta-oe/recipes-security/nmap/nmap_7.70.bb
index e47d09f..01be151 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.70.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.70.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "84eb6fbe788e0d4918c2b1e39421bf79"
 SRC_URI[sha256sum] = "847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18"
 
-inherit autotools-brokensep pkgconfig python3native
+inherit autotools-brokensep pkgconfig pythonnative
 
 PACKAGECONFIG ?= "ncat nping ndiff pcap"
 
@@ -36,6 +36,8 @@ EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subv
 # disable for now until py3 is supported
 EXTRA_OECONF += "--without-zenmap"
 
+export PYTHON_SITEPACKAGES_DIR
+
 do_configure() {
     autoconf
     oe_runconf
-- 
2.7.4


