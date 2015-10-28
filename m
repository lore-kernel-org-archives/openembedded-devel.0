Return-Path: <prvs=736b72a50=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id BD3AE76710
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:40:25 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqoEAMDBMFasEApK/2dsb2JhbABehHkGum2GCYULgRACggoBAQEBAQGBC4Q2AQEEbgsQGDlXBg4FiDXFPwEBAQEGAQEBAQEehneJKWUHF4QXBZY9jn2EP4MYkwSEaHGENEOBBgEBAQ
X-IPAS-Result: AqoEAMDBMFasEApK/2dsb2JhbABehHkGum2GCYULgRACggoBAQEBAQGBC4Q2AQEEbgsQGDlXBg4FiDXFPwEBAQEGAQEBAQEehneJKWUHF4QXBZY9jn2EP4MYkwSEaHGENEOBBgEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Oct 2015 13:38:55 +0100
Message-ID: <1446035935-3070-2-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1446035935-3070-1-git-send-email-richard.leitner@skidata.com>
References: <1446035935-3070-1-git-send-email-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Subject: [meta-java][PATCH 2/2] README: add -M to git format-patch suggestion
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 12:40:26 -0000
Content-Type: text/plain

Add the detect renames parameter to the git-format-patch suggestion in
the README file. This should be used for patches sent to the mailinglist.
For more information on the parameter see "man git-format-patch"

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 630e368..3b95c13 100644
--- a/README
+++ b/README
@@ -36,7 +36,7 @@ Source code:
 
 When creating patches, please use something like:
 
-    git format-patch -s --subject-prefix='meta-java][PATCH' origin
+    git format-patch -M -s --subject-prefix='meta-java][PATCH' origin
 
 When sending patches, please use something like:
 
-- 
2.1.4


