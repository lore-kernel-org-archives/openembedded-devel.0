Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0D0270738
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 01:24:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I1OLZA010964
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 18:24:21 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 18:24:20 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Aug 2014 09:24:26 +0800
Message-ID: <1408325066-27738-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking][v2] traceroute: uprev it to 2.0.20
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
X-List-Received-Date: Mon, 18 Aug 2014 01:24:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. uprev to 2.0.20
2. Update the license md5sum, since the address is changed in COPYING*:
From:
    Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
To:
    Copyright (C) 1989, 1991 Free Software Foundation, Inc.
    59 Temple Place, Suite 330, Boston, MA  02111-1307

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../{traceroute_2.0.18.bb => traceroute_2.0.20.bb}         |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.0.18.bb => traceroute_2.0.20.bb} (75%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
similarity index 75%
rename from meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
index 236bd12..9f637b8 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
@@ -8,19 +8,17 @@ show you where the trouble is coming from along the route."
 SECTION = "console/network"
 HOMEPAGE = "http://traceroute.sourceforge.net/"
 LICENSE = "GPL-2.0 LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
-
-PR = "r1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 inherit update-alternatives
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2.0.18/traceroute-2.0.18.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
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


