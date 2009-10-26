Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N2QPi-00016G-HA
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 15:19:17 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 7941716E22C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 15:18:08 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 376E32A428B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 15:18:08 +0100 (CET)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	hiob.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 26 Oct 2009 15:20:14 +0100
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 537AB7225F; Mon, 26 Oct 2009 15:18:07 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2009 15:17:39 +0100
Message-Id: <1256566659-32412-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
X-OriginalArrivalTime: 26 Oct 2009 14:20:14.0781 (UTC)
	FILETIME=[6F8F4ED0:01CA5647]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] glibc_2.9: disable parallel make
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
X-List-Received-Date: Mon, 26 Oct 2009 14:19:17 -0000

Parallel make for glibc_2.9.bb fails on different multi-cpu build hosts
(e.g. AMD Phenom(tm) 9150e Quad-Core Processor running openSUSE 11.1)
with various errors. :(

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/glibc/glibc_2.9.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index cddae98..428af03 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -75,6 +75,8 @@ SRC_URI_append_sh4 = " file://no-z-defs.patch;patch=1"
 #powerpc patches to add support for soft-float
 SRC_URI_append_powerpc= " file://powerpc-sqrt-hack.diff;patch=1"
 
+PARALLEL_MAKE = " "
+
 S = "${WORKDIR}/glibc-${PV}"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
1.6.4.2




