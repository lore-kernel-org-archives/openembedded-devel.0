Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 598786057B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 00:43:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2G0hKmt000919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 17:43:20 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 15 Mar 2016 17:43:19 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Mar 2016 08:38:38 +0800
Message-ID: <1458088718-28523-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] edac-utils: update the version
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
X-List-Received-Date: Wed, 16 Mar 2016 00:43:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The current edac-utils is v0.18, not v0.16 as the declaration in NEWS file:
  -------------------------------
  | Version 0.18 (2011-11-09);
  |- Do not print "No errors to report" with edac-util --quiet
  |- Add DIMM labels for Intel S2600JF and Supermicro H8QG6
  -------------------------------

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/edac-utils/edac-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
index d315324..76d5af4 100644
--- a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = " sysfsutils"
 
 SRCREV = "f9aa96205f610de39a79ff43c7478b7ef02e3138"
-PV = "0.16+git${SRCPV}"
+PV = "0.18+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


