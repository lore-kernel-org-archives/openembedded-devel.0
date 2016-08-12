Return-Path: <prvs=025316907=Richard.Leitner@skidata.com>
X-Greylist: delayed 617 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Aug 2016 08:18:19 UTC
Received: from mail2.skidata.com (mail2.skidata.com [80.120.57.43])
	by mail.openembedded.org (Postfix) with ESMTP id C40777723D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:18:18 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CpBABSgq1X/0oKEKxehBt8B7cVhAwghX2CFQEBAQEBAYEFhV4ogRYOBckwAQEBByeGKolZhQ8FmTyBYoQ8iHmBaYgBhVeGZIlJhFBshix/AQEB
X-IPAS-Result: A2CpBABSgq1X/0oKEKxehBt8B7cVhAwghX2CFQEBAQEBAYEFhV4ogRYOBckwAQEBByeGKolZhQ8FmTyBYoQ8iHmBaYgBhVeGZIlJhFBshix/AQEB
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Aug 2016 10:07:46 +0200
Message-ID: <1470989266-6267-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex2srv.skidata.net
	(172.16.10.93)
Subject: [meta-java][PATCH] README: fix branches of openembedded layers we depend on
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
X-List-Received-Date: Fri, 12 Aug 2016 08:18:22 -0000
Content-Type: text/plain

Since 33fbcd43 (rxtx: Add remove-libtool class to remove all .la files)
rxtx requires the remove-libtool class. This class was introduced
in the krogoth branch of openembedded-core and not backported.

Therefore update the branch names in the README to "krogoth".

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 259fa75..f766869 100644
--- a/README
+++ b/README
@@ -7,11 +7,11 @@ Yocto Project build systems.
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: daisy
+branch: krogoth
 revision: HEAD
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: daisy
+branch: krogoth
 revision: HEAD
 
 Contributing
-- 
2.1.4


