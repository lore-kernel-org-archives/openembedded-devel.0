Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id CDA9C60CA9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 22:01:12 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 01F386004D;
	Thu, 12 Mar 2020 23:01:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584050472;
	bh=IgVUwXlyT4SSaqApy5mETVjzoPFPEmF0IS8+rvxXVwc=;
	h=From:To:Cc:Subject:Date:From;
	b=j5C9zhXVvSimGAbWi3Y+3ERr4eXuocUIUMeNr/q5rkWLFh3sgjsN0UvSZZKH8Rttk
	0qYIxk/Zkq5DFi4ftyFBzWx+O1c8EtesMSWVbTTmg5JBg5CTEO92RzuumrKernt6Zn
	YtfInEp80753VMBoNDwgVaSgssuT/6yOY757bsroX0I0QtmDyHnpElnIK4YQmWyoRN
	630laknCr8P1O0WDrkEOaU4jVhxPqWOVj8UDmWllrm4t+SKG89h0NKtNDaAJw93mg5
	vkLiqE846c6FCFI3t9K7JiI7yCh+7K8nK6xeaal/Di1DaKjVS9IeKOhwGG4b9Oyq1F
	k4bQ1DgM5St/g==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2020 23:00:49 +0100
Message-Id: <1584050449-21380-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] cryptsetup: upgrade 2.3.0 -> 2.3.1
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
X-List-Received-Date: Thu, 12 Mar 2020 22:01:13 -0000

This is a bug-fix release, see full changelog:

 - https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.3/v2.3.1-ReleaseNotes

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../cryptsetup/{cryptsetup_2.3.0.bb => cryptsetup_2.3.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.0.bb => cryptsetup_2.3.1.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.0.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb
index 0e36ed4..ec375fe 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.1.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "48be3bd7c557d051f638047d280e93ee"
-SRC_URI[sha256sum] = "395690de99509428354d3cd15cf023bed01487e6f1565b2181e013dc847bbc85"
+SRC_URI[md5sum] = "cef482c0579f34d9524311ac70c0875f"
+SRC_URI[sha256sum] = "92aba4d559a2cf7043faed92e0f22c5addea36bd63f8c039ba5a8f3a159fe7d2"
 
 inherit autotools gettext pkgconfig
 
-- 
2.7.4


