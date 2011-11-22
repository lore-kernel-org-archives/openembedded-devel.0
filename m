Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RStbW-0006CV-DH
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 17:53:54 +0100
Received: by faat2 with SMTP id t2so631653faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 08:47:21 -0800 (PST)
Received: by 10.180.24.65 with SMTP id s1mr19671570wif.59.1321980441166;
	Tue, 22 Nov 2011 08:47:21 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id j5sm6917010wix.20.2011.11.22.08.47.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 08:47:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Nov 2011 17:47:15 +0100
Message-Id: <1321980435-4389-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-efl] e-wm: add missing dependency on dbus-x11
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
X-List-Received-Date: Tue, 22 Nov 2011 16:53:54 -0000

ERR<654>:e_dbus e_dbus.c:472 e_dbus_bus_get() Error connecting to bus: /usr/bin/dbus-launch terminated abnormally without any error message

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 2c2518b..9da788d 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r21"
+PR = "r22"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -53,6 +53,7 @@ RDEPENDS_${PN} += "\
   mime-support \
   edje-utils \
   ${PN}-utils \
+  dbus-x11 \
 "
 
 # Uclibc build don't have 'glibc-utils'
-- 
1.7.2.5



