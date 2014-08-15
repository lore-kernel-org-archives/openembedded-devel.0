Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B44CD601A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 03:06:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7F36AQS020794
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 20:06:10 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 20:06:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Aug 2014 11:06:13 +0800
Message-ID: <1408071973-20141-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] traceroute: uprev it to 2.0.20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Aug 2014 03:06:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../{traceroute_2.0.18.bb => traceroute_2.0.20.bb}           |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.0.18.bb => traceroute_2.0.20.bb} (75%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
similarity index 75%
rename from meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
index 236bd12..58e32a4 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
@@ -8,19 +8,19 @@ show you where the trouble is coming from along the route."
 SECTION = "console/network"
 HOMEPAGE = "http://traceroute.sourceforge.net/"
 LICENSE = "GPL-2.0 LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 PR = "r1"
 
 inherit update-alternatives
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2.0.18/traceroute-2.0.18.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
            file://filter-out-the-patches-from-subdirs.patch \
 "
 
-SRC_URI[md5sum] = "b7254149b7f081cce07f4b9e065ba5ef"
-SRC_URI[sha256sum] = "5994a88520927fefe3c9754aaf1e02b4d0f3f8fb1f521a68fa86215c3fcab9ef"
+SRC_URI[md5sum] = "559f104e155e0e14ee0c717776a745fa"
+SRC_URI[sha256sum] = "2facba9525c95428d7bff3a313fc6ecfd8c529c678ae666c73015558a0edc271"
 
 do_compile() {
     export LDFLAGS="${TARGET_LDFLAGS} -L${S}/libsupp"
-- 
1.7.10.4


