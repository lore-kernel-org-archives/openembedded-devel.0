Return-Path: <Xudong.Zhu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8E96E85F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 09:58:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2B9wIAf014774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 02:58:18 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 02:58:17 -0700
From: "Xudong.zhu" <xudong.zhu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Mar 2014 17:58:10 +0800
Message-ID: <1394531890-8816-1-git-send-email-xudong.zhu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ndisc6: allow the package can be empty
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
X-List-Received-Date: Tue, 11 Mar 2014 09:58:20 -0000
Content-Type: text/plain

FILES_${PN} is set to null in original .bb file, this would cause
ndisc6 main package is missing in fullpkglist.query, then one build
error will happen.

"
Error: ndisc6 not found in the base feeds(ti_am335x armv7at2-vfp-neon
| armv7a-vfp-neon armv7at2-vfp armv7a-vfp armv7a armv6t-vfp armv6-vfp
| armv5te-vfp armv5e-vfp armv5te armv5e armv5t-vfp armv5- vfp armv5t
| armv5 armv4t armv4 arm noarch any all).
"

To fix this, need to set ALLOW_EMPTY_${PN} = "1".

Signed-off-by: Xudong.zhu <xudong.zhu@windriver.com>
---
 .../recipes-support/ndisc6/ndisc6_1.0.2.bb         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
index a958e37..8cf5d37 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "6acec8a0cb9efa3ac98456f46c3016aeec0598b0c7557c95242b5228ad
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 inherit autotools gettext
-
+ALLOW_EMPTY_${PN} = "1"
 # Split into seperate packages since we normal don't want them all
 # The main package is left empty and therefore not created.
 PACKAGES += "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
-- 
1.7.4.1


