Return-Path: <pbarker@toganlabs.com>
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by mail.openembedded.org (Postfix) with ESMTP id EAC98776D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 17:49:32 +0000 (UTC)
Received: from mfilter24-d.gandi.net (mfilter24-d.gandi.net [217.70.178.152])
	by relay6-d.mail.gandi.net (Postfix) with ESMTP id 44826FB89E;
	Mon, 13 Mar 2017 18:49:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter24-d.gandi.net
Received: from relay6-d.mail.gandi.net ([IPv6:::ffff:217.70.183.198])
	by mfilter24-d.gandi.net (mfilter24-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id 69Omf_Pzjugp; Mon, 13 Mar 2017 18:49:31 +0100 (CET)
X-Originating-IP: 86.24.150.36
Received: from host0.betafive.co.uk
	(cpc15-shep11-2-0-cust35.8-3.cable.virginm.net [86.24.150.36])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 165C4FB8A3;
	Mon, 13 Mar 2017 18:49:30 +0100 (CET)
Received: by host0.betafive.co.uk (Postfix, from userid 2525)
	id 59580426C8DD; Mon, 13 Mar 2017 17:49:00 +0000 (GMT)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Mar 2017 17:48:57 +0000
Message-Id: <20170313174858.19815-1-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH 1/2] toybox: Fix configure failure
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
X-List-Received-Date: Mon, 13 Mar 2017 17:49:33 -0000

do_configure is currently failing as HOSTCC defaults to just 'cc' in the
toybox Makefile.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta-oe/recipes-core/toybox/toybox_0.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.2.bb b/meta-oe/recipes-core/toybox/toybox_0.7.2.bb
index 93ef45bb5..84146584d 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.2.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.2.bb
@@ -16,6 +16,8 @@ SECTION = "base"
 
 TOYBOX_BIN = "generated/unstripped/toybox"
 
+EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+
 do_configure() {
     oe_runmake defconfig
 
-- 
2.11.0


