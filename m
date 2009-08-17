Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1Md2XD-0006Tv-UK
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 15:46:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 59D0D4291D6;
	Mon, 17 Aug 2009 09:29:06 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21843-09; Mon, 17 Aug 2009 09:29:06 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 3241A4C8116; Mon, 17 Aug 2009 09:29:06 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 3C57D408F23;
	Mon, 17 Aug 2009 09:29:05 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 26EBFA0C0D3; Mon, 17 Aug 2009 09:29:05 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 09:29:01 -0400
Message-Id: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/3] nasm: fix COMPATIBLE_HOST to match any vendor
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
X-List-Received-Date: Mon, 17 Aug 2009 13:46:09 -0000

On x86_64, it was looking for x86_64-linux, not x86_64-blah-linux;
it broke the build for syslinux if a BUILD_VENDOR was set.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/nasm/nasm_0.98.38.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/nasm/nasm_0.98.38.bb b/recipes/nasm/nasm_0.98.38.bb
index 86e7f2b..abe47fe 100644
--- a/recipes/nasm/nasm_0.98.38.bb
+++ b/recipes/nasm/nasm_0.98.38.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "General-purpose x86 assembler"
 SECTION = "devel"
 LICENSE = "GPL"
-COMPATIBLE_HOST = '(x86_64|i.86.*)-(linux|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nasm/nasm-${PV}.tar.bz2"
 
-- 
1.6.3



