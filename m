Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 58C1A72750
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 22:47:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t03MlcWW021754
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 3 Jan 2015 14:47:38 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 Jan 2015 14:47:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 3 Jan 2015 14:47:37 -0800
Message-ID: <1420325258-41206-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [V2 meta-networking] [PATCH 1/2] radiusclient-ng: use BPN in SRC_URI
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
X-List-Received-Date: Sat, 03 Jan 2015 22:47:38 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../radiusclient-ng/radiusclient-ng_0.5.6.bb       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
index 1fafe73..2350d4f 100644
--- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
@@ -5,7 +5,7 @@ protocol (RFCs 2128 and 2139)."
 HOMEPAGE = "http://sourceforge.net/projects/radiusclient-ng.berlios/"
 SECTION = "Applications/Internet"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/r/${PN}/${PN}_${PV}.orig.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/r/${BPN}/${BPN}_${PV}.orig.tar.gz \
    file://Modify-configure.in-and-etc-Makefile.am.patch \
    file://config-site.radiusclient-ng-${PV}"
 
-- 
1.7.9.5


