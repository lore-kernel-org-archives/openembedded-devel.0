Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OqKOy-0000O3-Fr
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 08:33:01 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id B2677275D105; Tue, 31 Aug 2010 08:32:29 +0200 (CEST)
Received: from localhost (unknown [89.204.137.96])
	by gravedo.de (Postfix) with ESMTPSA id 2C0F9275CCC2;
	Tue, 31 Aug 2010 08:32:27 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 08:32:01 +0200
Message-Id: <1283236322-5116-5-git-send-email-morphis@gravedo.de>
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
Subject: [PATCH 4/5] libfsotransport: add dependency on palmpre-systems-deps-native for palmpre machine
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
X-List-Received-Date: Tue, 31 Aug 2010 06:33:01 -0000

libfsotransport provides a special hsuart transport which only works and is used on
the palmpre machine. For this the palmpre-systems-deps are needed to provide ioctl
support for the hsuart.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/freesmartphone/libfsotransport_git.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/freesmartphone/libfsotransport_git.bb b/recipes/freesmartphone/libfsotransport_git.bb
index 7e7e6d6..882fc12 100644
--- a/recipes/freesmartphone/libfsotransport_git.bb
+++ b/recipes/freesmartphone/libfsotransport_git.bb
@@ -4,3 +4,6 @@ SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PV = "0.9.6+gitr${SRCPV}"
 PE = "1"
 PR = "${INC_PR}.0"
+
+EXTRA_OECONF_palmpre = "--with-machine=palmpre"
+DEPENDS_palmpre = "palmpre-system-deps-native"
-- 
1.7.0.4



