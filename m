Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Or74v-000750-C7
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 12:31:44 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Or74L-0007i6-OC from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 03:30:57 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Sep 2010 12:30:56 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Sep 2010 16:29:59 +0600
Message-Id: <1283423399-17804-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 02 Sep 2010 10:30:56.0284 (UTC)
	FILETIME=[ED5385C0:01CB4A89]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH V2] sqlite3: Extend target recipe to native recipe using BBCLASSEXTEND
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
X-List-Received-Date: Thu, 02 Sep 2010 10:31:52 -0000

* Set BBCLASSEXTEND to "native" to use target recipe as native recipe
* In include file tcl-native was present in DEPENDS list, remove it from DEPENDS list by setting DEPENDS_virtclass-native = "readline-native ncurses-native"
* Bump PR "${INC_PR}.1"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sqlite/sqlite3_3.6.23.1.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/sqlite/sqlite3_3.6.23.1.bb b/recipes/sqlite/sqlite3_3.6.23.1.bb
index 7bed4d4..24f3731 100644
--- a/recipes/sqlite/sqlite3_3.6.23.1.bb
+++ b/recipes/sqlite/sqlite3_3.6.23.1.bb
@@ -1,6 +1,10 @@
 require sqlite3.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+DEPENDS_virtclass-native = "readline-native ncurses-native"
 
 SRC_URI[md5sum] = "d99f1b31da0eb33271464bee15cec701"
 SRC_URI[sha256sum] = "1a0517438a573a68ab73e8ed75d194086d55d75883542ab1d5ae1080bbddd492"
 
+BBCLASSEXTEND = "native"
+
-- 
1.6.3.3



