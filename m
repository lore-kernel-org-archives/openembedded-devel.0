Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OqKP0-0000OP-Bd
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 08:33:02 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id B2588275D101; Tue, 31 Aug 2010 08:32:31 +0200 (CEST)
Received: from localhost (unknown [89.204.137.96])
	by gravedo.de (Postfix) with ESMTPSA id 04BAF275CCC2;
	Tue, 31 Aug 2010 08:32:29 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 08:32:02 +0200
Message-Id: <1283236322-5116-6-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
References: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_WEB
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/5] fsogsmd: fix dependencies for the palmpre machine
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
X-List-Received-Date: Tue, 31 Aug 2010 06:33:03 -0000

fsogsmd now depends on msmcommd-specs as this provides the DBus API definition how to
speak with the msmcomm daemon. At runtime it needs the msmcomm daemon to talk over the
DBus API to the modem.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/freesmartphone/fsogsmd_git.bb |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/recipes/freesmartphone/fsogsmd_git.bb b/recipes/freesmartphone/fsogsmd_git.bb
index b172611..0c54901 100644
--- a/recipes/freesmartphone/fsogsmd_git.bb
+++ b/recipes/freesmartphone/fsogsmd_git.bb
@@ -1,16 +1,21 @@
 require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 PV = "0.5.0+gitr${SRCPV}"
 PE = "1"
 
 DEPENDS += "libfsoresource libgsm0710mux ppp"
-# DEPENDS += "msmcommd"
 
 EXTRA_OECONF_append = "\
   --enable-libgsm0710mux \
-#  --enable-modem-qualcomm-palm \
+"
+
+# On the palmpre we need the msmcomm daemon to talk to the modem
+DEPENDS_palmpre += "msmcommd-specs"
+RDEPENDS_palmpre += "msmcommd"
+EXTRA_OECONF_append_palmpre = "\
+  --enable-modem-qualcomm-palm \
 "
 
 CONFFILES_${PN} = "${sysconfdir}/freesmartphone/conf/openmoko_gta/fsogsmd.conf \
-- 
1.7.0.4



