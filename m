Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PpXjr-0000RQ-8i
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 04:07:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id BE678314D6EB;
	Wed, 16 Feb 2011 04:06:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 28Cv7sZ5DFNe; Wed, 16 Feb 2011 04:06:22 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 57EC2314ACA7;
	Wed, 16 Feb 2011 04:06:20 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 16 Feb 2011 03:06:20 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 03:06:20 +0000
Message-Id: <1297825580-21244-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] utils.py: use bb.utils.vercmp_string instead of bb.vercmp
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
X-List-Received-Date: Wed, 16 Feb 2011 03:07:35 -0000

* Fixes deprecation warning with BitBake master.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Chris Larson <chris_larson@mentor.com>
---
 lib/oe/utils.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/oe/utils.py b/lib/oe/utils.py
index f7d2946..edd0e50 100644
--- a/lib/oe/utils.py
+++ b/lib/oe/utils.py
@@ -35,7 +35,7 @@ def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
         return falsevalue
 
 def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-    result = bb.vercmp(bb.data.getVar(variable,d,True), checkvalue)
+    result = bb.utils.vercmp_string(bb.data.getVar(variable,d,True), checkvalue)
     if result <= 0:
         return truevalue
     else:
-- 
1.7.2.3



