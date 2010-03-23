Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1Nu5BV-0001Hy-1B
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 15:34:26 +0100
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 11B98687F0;
	Tue, 23 Mar 2010 17:31:04 +0300 (MSK)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1Nu53Y-0005Rg-BB; Tue, 23 Mar 2010 17:26:08 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 17:26:06 +0300
Message-Id: <1269354368-20910-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269354368-20910-1-git-send-email-khimov@altell.ru>
References: <1269346975-842-2-git-send-email-khimov@altell.ru>
	<1269354368-20910-1-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 11B98687F0.3B3E2
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lowpan-tools: fix lowpan-tools-tests packaging
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
X-List-Received-Date: Tue, 23 Mar 2010 14:34:26 -0000

RDEPENDS on python, wants python-native at build time.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/lowpan-tools/lowpan-tools_git.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/lowpan-tools/lowpan-tools_git.bb b/recipes/lowpan-tools/lowpan-tools_git.bb
index f05d60a..5423c3a 100644
--- a/recipes/lowpan-tools/lowpan-tools_git.bb
+++ b/recipes/lowpan-tools/lowpan-tools_git.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "LoWPAN utilities (IEEE802.15.4)"
 LICENSE = "GPL"
 SRCREV = "b30f459c9ef500b73043d105597f382ec4f53f1b"
 SRC_URI = "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee;protocol=git"
-DEPENDS = "libnl bison-native flex-native"
-PR = "r8"
+DEPENDS = "libnl bison-native flex-native python-native"
+PR = "r9"
 
 S = "${WORKDIR}/git"
 PACKAGES += "${PN}-tests-dbg"
@@ -14,6 +14,7 @@ FILES_${PN} = "${sbindir}/iz ${sbindir}/izconfig \
 FILES_${PN}-dbg += "${libdir}/ip/.debug/link_wpan.so"
 FILES_${PN}-tests = "${libexecdir}/lowpan-tools ${PYTHON_SITEPACKAGES_DIR}"
 FILES_${PN}-tests-dbg = "${libexecdir}/lowpan-tools/.debug"
+RDEPENDS_${PN}-tests += "${PN} python-core"
 
 EXTRA_OECONF = "--disable-manpages"
 
-- 
1.5.6.5



