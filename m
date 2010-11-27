Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMNgm-0002y2-QP
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 17:31:53 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 00F391B421;
	Sat, 27 Nov 2010 17:31:54 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 17:30:37 +0100
Message-Id: <1290875437-20762-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] hvsc_45: fixed SRC_URI
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
X-List-Received-Date: Sat, 27 Nov 2010 16:31:53 -0000

fixed SRC_URI and add homepage
---
 recipes/hvsc/hvsc_45.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/hvsc/hvsc_45.bb b/recipes/hvsc/hvsc_45.bb
index 4d91b28..b1ed2e0 100644
--- a/recipes/hvsc/hvsc_45.bb
+++ b/recipes/hvsc/hvsc_45.bb
@@ -2,8 +2,9 @@ DESCRIPTION = "The High Voltage SID Collection (HVSC) \
 Commodore 64 music for the masses"
 LICENSE = "PD"
 SECTION = "multimedia"
+HOMEPAGE = "http://www.dottyflowers.com/HVSC/"
 
-SRC_URI = "http://gallium.prg.dtu.dk/HVSC/random/HVSC_${PV}-all-of-them.rar"
+SRC_URI = "http://www.dottyflowers.com/HVSC/HVSC_${PV}-all-of-them.rar"
 S = "${WORKDIR}"
 
 do_install() {
-- 
1.7.0.4



