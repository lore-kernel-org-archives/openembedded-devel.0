Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIhcJ-0005OB-Pg
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 13:23:15 +0200
Received: (qmail 26820 invoked by uid 813007); 22 Jun 2009 11:12:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 11:12:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 13:11:37 +0200
Message-Id: <1245669099-30990-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906221206.37496.marcin@juszkiewicz.com.pl>
References: <200906221206.37496.marcin@juszkiewicz.com.pl>
Cc: Martin Dietze <martin@the-little-red-haired-girl.org>
Subject: [STABLE][PATCH 080/125] mobilemesh: fixed broken download URL
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
X-List-Received-Date: Mon, 22 Jun 2009 11:23:16 -0000

From: Martin Dietze <martin@the-little-red-haired-girl.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/mobilemesh/mobilemesh_1.2.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/mobilemesh/mobilemesh_1.2.bb b/recipes/mobilemesh/mobilemesh_1.2.bb
index df8f2f9..4fdf2ab 100644
--- a/recipes/mobilemesh/mobilemesh_1.2.bb
+++ b/recipes/mobilemesh/mobilemesh_1.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "MobileMesh mobile ad-hoc routing protocol"
 HOMEPAGE = "http://www.mitre.org/work/tech_transfer/mobilemesh/"
 LICENSE = "GPL"
 DEPENDS = "openssl"
-SRC_URI = "http://meshcube.org/download/mobilemesh_1.2.tgz"
+SRC_URI = "http://download.berlin.freifunk.net/meshcube.org/nylon/stable/sources/mobilemesh_1.2.tgz"
 PR = "r1"
 
 S = "${WORKDIR}/mobilemesh"
@@ -34,4 +34,7 @@ do_install() {
 	install ${S}/mobilemesh.init ${D}${sysconfdir}/init.d/mobilemesh
 }
 
+FILES_${PN}-dbg += "${sysconfdir}/mobilemesh/mmtodot.debug ${sysconfdir}/mobilemesh/mmborder.debug \
+	${sysconfdir}/mobilemesh/mmrp.debug ${sysconfdir}/mobilemesh/mmdiscover.debug"
 CONFFILES_${PN}_nylon = "${sysconfdir}/mobilemesh/mmrp.conf ${sysconfdir}/mobilemesh/mmdiscover.conf"
+
-- 
1.6.3.1





