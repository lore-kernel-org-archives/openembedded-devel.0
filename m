Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NwfoL-0007wW-6z
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 20:05:09 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 4F0B22DC51; Tue, 30 Mar 2010 21:59:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Mar 2010 21:58:58 +0400
Message-Id: <1269971938-6900-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] removal.txt: proposal to remove ClamAV versions < 0.95 in April
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
X-List-Received-Date: Tue, 30 Mar 2010 18:05:09 -0000

http://www.clamav.net/lang/en/2009/10/05/eol-clamav-094/

Without database updates AV is almost completely useless, and
starting on April 15 2010 ClamAV < 0.95 will get no db updates,
so there is no reason to support that versions.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 removal.txt |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/removal.txt b/removal.txt
index 7c9dc25..f7bad84 100644
--- a/removal.txt
+++ b/removal.txt
@@ -25,3 +25,9 @@ Maintainer:     None
 Reason:         Obsoleted by task-base
 Proposed by:    Koen Kooi
 Note:		Moved to packages/obsolete/tasks on 2006-12-22
+
+Package Name:	ClamAV, versions < 0.95
+Removal Date:	2009-04-15
+Maintainer:	Jamie Lenehan
+Reason:		http://www.clamav.net/lang/en/2009/10/05/eol-clamav-094/
+Proposed by:	Roman I Khimov <khimov@altell.ru>
-- 
1.6.4.2



