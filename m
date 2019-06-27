Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 223106D7A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 02:34:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5R2Y1G3023959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2019 19:34:01 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 26 Jun 2019 19:33:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 27 Jun 2019 10:33:47 +0800
Message-ID: <1561602827-2393-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH V2] tvheadend: do not inherit gitpkgv
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
X-List-Received-Date: Thu, 27 Jun 2019 02:34:02 -0000
Content-Type: text/plain

Do not inherit gitpkgv in meta-oe, since meta-multimedia
does not depends on meta-oe.

The pkg version will be minor changed

Before the fix:
tvheadend-4.3+git10478+bdc2ae9-r0.core2_64.rpm

After the fix:
tvheadend-4.3+git0+bdc2ae9e19-r0.core2_64.rpm

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index dc6cd46..bbe4ce0 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tvheadend: TV streaming server and recorder"
 HOMEPAGE = "https://tvheadend.org/"
 
-inherit autotools-brokensep gettext gitpkgv pkgconfig
+inherit autotools-brokensep gettext pkgconfig
 
 DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl uriparser zlib"
 
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/tvheadend/tvheadend.git"
 
 SRCREV = "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
 PV = "4.3+git${SRCPV}"
-PKGV = "4.3+git${GITPKGV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


