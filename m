Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1ODDgv-0001AV-Im
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 11:29:55 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id D762C4B00C1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 11:25:56 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 11:25:55 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 May 2010 11:23:34 +0200
Message-Id: <1273915414-3417-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1273915414-3417-1-git-send-email-eric@eukrea.com>
References: <1273915414-3417-1-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] libmimedir: add glib-2.0 dependency
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
X-List-Received-Date: Sat, 15 May 2010 09:29:56 -0000

bitbake meta-toolchain with task-sdk-basae fails without this when
runned from scratch with the following error log :
mimedir-attachment.h:24:18: error: glib.h: No such file or directory
mimedir-attachment.h:25:25: error: glib-object.h: No such file or directory

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/libmimedir/libmimedir_0.4.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libmimedir/libmimedir_0.4.2.bb b/recipes/libmimedir/libmimedir_0.4.2.bb
index 6364246..3a37037 100644
--- a/recipes/libmimedir/libmimedir_0.4.2.bb
+++ b/recipes/libmimedir/libmimedir_0.4.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "RFC2425 MIME Directory Profile library, supporting vCard and iCal
 SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "LGPL"
-DEPENDS = "intltool-native"
+DEPENDS = "intltool-native glib-2.0"
 PR = "r0"
 
 inherit autotools pkgconfig gpe
-- 
1.6.3.3



