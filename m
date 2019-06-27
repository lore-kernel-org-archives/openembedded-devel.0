Return-Path: <radovan.scasny@siemens.com>
X-Greylist: delayed 447 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Jun 2019 07:23:13 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B82E07E6F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:23:13 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5R7Fkkw008994
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 27 Jun 2019 09:15:46 +0200
Received: from dev.vm6.ccp.siemens.com (md1yarhc.ad001.siemens.net
	[163.242.44.42])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x5R7FhXQ024165;
	Thu, 27 Jun 2019 09:15:43 +0200
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id E4D9E233CC4F;
	Thu, 27 Jun 2019 09:15:43 +0200 (CEST)
From: Radovan Scasny <radovan.scasny@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 09:14:36 +0200
Message-Id: <20190627071436.4561-1-radovan.scasny@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
References: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
Cc: open.source@oleksandr-kravchuk.com
Subject: [meta-networking][PATCH v3] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Thu, 27 Jun 2019 07:23:14 -0000

License checksum changed due to modified copyright year.

Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
---
 .../dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb}                     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb} (78%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
similarity index 78%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
index 84c3db7a5..9c3f4f7a4 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
@@ -5,12 +5,12 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1e8f17e4edcccc38152ccf60374e0f89"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "77bbb1d73b6f30d6ddcc8b0fd3eae266"
-SRC_URI[sha256sum] = "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c432f36362dc9b5"
+SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
+SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
 
 SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
 
-- 
2.11.0


