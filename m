Return-Path: <prvs=69472e970=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id B69C878F24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 14:33:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,215,1526335200"; d="scan'208";a="10808660"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Jun 2018 16:33:29 +0200
Message-ID: <20180612143331.2445-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180612143331.2445-1-richard.leitner@skidata.com>
References: <20180612143331.2445-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 2/4] README: add note on how to send a patch series with cover-letter
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
X-List-Received-Date: Tue, 12 Jun 2018 14:33:45 -0000
Content-Type: text/plain

As patch series should include a cover letter describing the whole
series shortly add a note on this in the README.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/README b/README
index 564a924..905c311 100644
--- a/README
+++ b/README
@@ -37,13 +37,18 @@ Source code:
     git://git.yoctoproject.org/meta-java
     http://git.yoctoproject.org/git/meta-java
 
-When creating patches, please use something like:
+When creating single patches, please use something like:
 
-    git format-patch -M -s --subject-prefix='meta-java][PATCH' origin
+    git format-patch -M -s --subject-prefix='meta-java][PATCH' -1
+
+When creating a patch series, please add a cover letter describing it shortly.
+Therefore use something like:
+
+    git format-patch -M -s --cover-letter --subject-prefix='meta-java][PATCH' origin
 
 When sending patches, please use something like:
 
-    git send-email --to openembedded-devel@lists.openembedded.org <generated patch>
+    git send-email --to openembedded-devel@lists.openembedded.org <generated patch(es)>
 
 Main layer maintainers:
 
-- 
2.11.0


