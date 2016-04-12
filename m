Return-Path: <Adrian.Dudau@enea.com>
X-Greylist: delayed 343 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Apr 2016 15:05:01 UTC
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.32])
	by mail.openembedded.org (Postfix) with ESMTP id C854F60107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:05:01 +0000 (UTC)
Received: from 1apzmf-00059L-TP by out10a.electric.net with emc1-ok (Exim 4.85)
	(envelope-from <Adrian.Dudau@enea.com>) id 1apzmf-0005DX-V6
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2016 07:59:17 -0700
Received: by emcmailer; Tue, 12 Apr 2016 07:59:17 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with smtp (Exim 4.85)
	(envelope-from <Adrian.Dudau@enea.com>) id 1apzmf-00059L-TP
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2016 07:59:17 -0700
Received: from sestovs32.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 12 Apr 2016 16:59:16 +0200
Received: by sestovs32.enea.se (Postfix, from userid 4451)	id D83DA2413BD;
	Tue, 12 Apr 2016 16:59:16 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Apr 2016 16:59:16 +0200
Message-ID: <1460473156-25279-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-oe][PATCH] Revert "umip: blacklist"
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
X-List-Received-Date: Tue, 12 Apr 2016 15:05:05 -0000
Content-Type: text/plain

This reverts commit d82b0d8f638d1e1c7d9175605eadabfb99a6d345.

The SRC_URI is up again, no need to blacklist the recipe anymore.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index 41e5340..76901ab 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -16,5 +16,3 @@ S = "${WORKDIR}/git"
 EXTRA_OE_CONF = "--enable-vt"
 
 inherit autotools-brokensep
-
-PNBLACKLIST[umip] ?= "BROKEN: SRC_URI seems to be down and build from premirror fails to find gram.h, see http://errors.yoctoproject.org/Errors/Details/56158/"
-- 
1.9.1


