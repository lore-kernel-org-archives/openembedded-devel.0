Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1SFRn8-0001Xn-OM
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 17:06:34 +0200
Received: from localhost.localdomain (hanuta.TechFak.Uni-Bielefeld.DE
	[129.70.129.229])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id 746F2A5;
	Wed,  4 Apr 2012 16:47:28 +0200 (CEST)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2012 16:46:52 +0200
Message-Id: <1333550812-12948-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
Cc: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>
Subject: [meta-oe][PATCH] v4l-utils: correct license delimiter
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
X-List-Received-Date: Wed, 04 Apr 2012 15:06:34 -0000

From: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
index 3252ae3..c6100c1 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "v4l2 and IR applications"
-LICENSE = "GPLv2/LGPLv2.1"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
@@ -8,6 +8,8 @@ DEPENDS = "jpeg"
 # libv4l was absorbed into this, let OE know that
 PROVIDES = "libv4l"
 
+PR = "r1"
+
 SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git"
 SRCREV = "v4l-utils-${PV}"
 
-- 
1.7.0.4



