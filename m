Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 26 Mar 2016 19:19:42 UTC
Received: from smtp05.mail.online.nl (smtp05.mail.online.nl [194.134.25.75])
	by mail.openembedded.org (Postfix) with ESMTP id CDE1B6018C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 19:19:42 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp05.mail.online.nl (Postfix) with ESMTP id 457FE20006C;
	Sat, 26 Mar 2016 20:13:00 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 20:12:56 +0100
Message-Id: <1459019576-32765-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] waf-cross-answers: Add cross-answers-mipsel.txt
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
X-List-Received-Date: Sat, 26 Mar 2016 19:19:45 -0000

Build fails on "mipsel" platforms due to missing cross-answers-mipsel.txt.
Fix this by linking it to cross-answers-mips.txt, since there's no hint
of taking endianess into account.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-oe/files/waf-cross-answers/cross-answers-mipsel.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 meta-oe/files/waf-cross-answers/cross-answers-mipsel.txt

diff --git a/meta-oe/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-oe/files/waf-cross-answers/cross-answers-mipsel.txt
new file mode 120000
index 0000000..61bc751
--- /dev/null
+++ b/meta-oe/files/waf-cross-answers/cross-answers-mipsel.txt
@@ -0,0 +1 @@
+cross-answers-mips.txt
\ No newline at end of file
-- 
2.1.4


