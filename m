Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3724B65D19
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 02:30:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t052UGZ2002965
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Jan 2015 18:30:16 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 Jan 2015 18:30:16 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 4 Jan 2015 18:30:13 -0800
Message-ID: <1420425013-19013-5-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
References: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [V2 PATCH 5/5] tomoyo-tools: use BP in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 02:30:18 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../tomoyo-tools/tomoyo-tools_2.5.0.bb             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
index bb2676b..adb538b 100644
--- a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -5,11 +5,11 @@ being useful purely as a system analysis tool."
 HOMEPAGE = "http://tomoyo.sourceforge.jp/"
 SECTION = "System Environment/Kernel"
 
-SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${PN}-${PV}-20140601.tar.gz"
+SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${BP}-20140601.tar.gz"
 SRC_URI[md5sum] = "888869b793127f00d6439a3246598b83"
 SRC_URI[sha256sum] = "118ef6ba1fbf7c0b83018c3a0d4d5485dfb9b5b7f647f37ce9f63841a3133c2a"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.tomoyo;md5=751419260aa954499f7abaabaa882bbe"
-- 
1.7.9.5


