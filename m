Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYH77-0003Hq-1q
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 14:00:45 +0100
Received: by eekb15 with SMTP id b15so383937eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 04:53:52 -0800 (PST)
Received: by 10.14.14.80 with SMTP id c56mr3418162eec.197.1323262431604;
	Wed, 07 Dec 2011 04:53:51 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id a60sm5387500eeb.4.2011.12.07.04.53.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 04:53:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2011 13:53:48 +0100
Message-Id: <1323262428-856-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-efl] places: add autopoint
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
X-List-Received-Date: Wed, 07 Dec 2011 13:00:45 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/recipes-efl/e17/places_svn.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
index 0abe138..103d720 100644
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ b/meta-efl/recipes-efl/e17/places_svn.bb
@@ -2,9 +2,13 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 PV = "0.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 require e-module.inc
 
+do_configure_prepend() {
+	autopoint || touch config.rpath
+}
+
 # Calls /usr/bin/eject for media
 RRECOMMENDS_${PN} += "eject"
-- 
1.7.2.5



