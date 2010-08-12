Received: from static.88-198-71-155.clients.your-server.de ([88.198.71.155]
	helo=socrates.bennee.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kernel-hacker@bennee.com>) id 1OjaKH-0004oa-QM
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 18:08:26 +0200
Received: from localhost ([127.0.0.1] helo=pitcairn.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.69)
	(envelope-from <kernel-hacker@bennee.com>)
	id 1OjZoU-0006Fl-Kj; Thu, 12 Aug 2010 17:35:26 +0200
From: kernel-hacker@bennee.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Aug 2010 16:35:36 +0100
Message-Id: <1281627336-686-3-git-send-email-kernel-hacker@bennee.com>
X-Mailer: git-send-email 1.7.2.1
In-Reply-To: <1281627336-686-1-git-send-email-kernel-hacker@bennee.com>
References: <1281627336-686-1-git-send-email-kernel-hacker@bennee.com>
X-SA-Exim-Connect-IP: 88.198.71.155
X-SA-Exim-Mail-From: kernel-hacker@bennee.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Alex Bennee <ajb@cbnl.com>
Subject: [PATCH 2/2] recode: Fix configure step.
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
X-List-Received-Date: Thu, 12 Aug 2010 16:08:27 -0000

From: Alex Bennee <ajb@cbnl.com>

Add space to appended CC/CXX otherwise configure fails

Signed-off-by: Alex Bennee <ajb@cbnl.com>
---
 recipes/recode/recode_3.6.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/recode/recode_3.6.bb b/recipes/recode/recode_3.6.bb
index 3e7c6cd..0cdd43d 100644
--- a/recipes/recode/recode_3.6.bb
+++ b/recipes/recode/recode_3.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNU_MIRROR}/recode/recode-${PV}.tar.gz \
 
 inherit autotools
 
-TARGET_CC_ARCH_append = "${LDFLAGS}"
+TARGET_CC_ARCH_append = " ${LDFLAGS}"
 
 do_configure() {
 	gnu-configize
-- 
1.7.2.1



