Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NzDpo-0002VJ-3C
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 20:49:15 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id A97BA2DBDD; Tue,  6 Apr 2010 22:42:41 +0400 (MSD)
From: khimov@altell.ru
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Apr 2010 22:42:27 +0400
Message-Id: <1270579347-2085-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vladimir Sorokin <sorokin@altell.ru>
Subject: [PATCH] insane.bbclass: add x86_64 architecture for linux-uclibc
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
X-List-Received-Date: Tue, 06 Apr 2010 18:49:23 -0000

From: Vladimir Sorokin <sorokin@altell.ru>

Signed-off-by: Vladimir Sorokin <sorokin@altell.ru>
Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/insane.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index c85703e..7e42f45 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -61,6 +61,7 @@ def package_qa_get_machine_dict():
                         "i486":       (   3,     0,    0,          True,          True),
                         "i586":       (   3,     0,    0,          True,          True),
                         "i686":       (   3,     0,    0,          True,          True),
+                        "x86_64":     (  62,     0,    0,          True,          False),
                         "mips":       (   8,     0,    0,          False,         True),
                         "mipsel":     (   8,     0,    0,          True,          True),
                         "avr32":      (6317,     0,    0,          False,         True),
-- 
1.6.4.2



