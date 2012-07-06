Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <iyadkq@gmail.com>) id 1SnHI3-00057Z-2v
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jul 2012 00:46:19 +0200
Received: by pbbrq2 with SMTP id rq2so14621884pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2012 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pimr0e9ZqDgak7s7Y8JY3KxLSc67LwReIZQbdcHQIlI=;
	b=LG9UUdP8Ld9am6WrV3YPQXNMtY6MY/d7ZCOQ9pk6Sd2tuiS4w3IxWNVack21CIg2TX
	vuCoxhA41rO0mm2P2wzRr08HIYlt1D4X+lnm1KKJcvvy3gciH6EqA0qH6FY1EAB2s8QG
	iyunZuQa4YFUuTwxkeSSYA38WmywfDWK1PI4+FN+N+MtzwMVZEfDFamRLEK1oo7RYG+c
	2sqxr7HnW3DQE5ROw2FF5sCxZTOL8UBMFbTWluSmrPsyTyBe5BUuoNhPETmX78czM8lL
	QtfbpuhtXhVHVL3acA00S6FjsDvna6eRikmNRyhxwrVi/PNouQ9HGjVuD1bMVP6mcjv3
	Eh2w==
Received: by 10.66.75.225 with SMTP id f1mr46931307paw.35.1341614112097;
	Fri, 06 Jul 2012 15:35:12 -0700 (PDT)
Received: from localhost.localdomain (palm-64-28-152-131.palm.com.
	[64.28.152.131])
	by mx.google.com with ESMTPS id hw6sm22624929pbc.73.2012.07.06.15.35.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jul 2012 15:35:11 -0700 (PDT)
From: Iyad Qumei <iyadkq@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2012 15:35:02 -0700
Message-Id: <1341614102-12515-1-git-send-email-iyadkq@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATH] fix build failure due to lic_files_chksum mismatch. The correction unpacks the source in the correct directory.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 22:46:19 -0000

Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
---
 meta/recipes-core/netbase/netbase_5.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
index 3aea874..ad80ef6 100644
--- a/meta/recipes-core/netbase/netbase_5.0.bb
+++ b/meta/recipes-core/netbase/netbase_5.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r0"
+PR = "r1"
 
 inherit update-rc.d
 
@@ -17,6 +17,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
            file://interfaces \
            file://nfsroot"
 
+S = "${WORKDIR}/${P}"
+
 SRC_URI[md5sum] = "a379d9199d44d817543eddc211a29b70"
 SRC_URI[sha256sum] = "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b7dc7122308afa9dc"
 
-- 
1.7.4.1



