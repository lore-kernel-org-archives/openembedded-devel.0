Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OyWSK-0000rY-GP
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 23:02:22 +0200
Received: by pxi11 with SMTP id 11so276604pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=oKB3L0VNBv/O52tovjOkaeFK/RF6bQ65Cd6Ws5FkXYU=;
	b=G5Xu9oTi3Qek28EYOHzNdKfA3g9DTkiLHfvBQj4Tn7B0gaEGFo1UQrZ0AJx1z7wIpb
	Cruukr3Bxun+iMDIfm7HATQZxOg6tsYQhsnxQiM7qNH0uUHmGOymw4CPPp702MBnylNH
	bNTQnNM2xoQyPGvULSyYnl0KnPmXr4BId1LVc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=C1XbcxWrIED5tqdW27Br0LiNzxX3rpwjrqzZYX9T/izDjBtKpuT+S9SXklyqT189y/
	D7U1CVo3vjXp5ECCZ6NISjRu2jzE6P8AUWJ2pO2mn7CQlnBsv2+dpExXxaw/GZCzpqIe
	6FA1Y7NquPDH7wOLqzRakf1rzbqfnXnjYsH0E=
Received: by 10.114.107.18 with SMTP id f18mr867849wac.29.1285189333890;
	Wed, 22 Sep 2010 14:02:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c24sm18257483wam.7.2010.09.22.14.02.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Sep 2010 14:02:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Sep 2010 14:02:09 -0700
Message-Id: <1285189329-32344-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] oe/patch.py: Remove series file during Clean()
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
X-List-Received-Date: Wed, 22 Sep 2010 21:02:22 -0000

Currently if there is a failed do_patch the series files get appended
so if there were two patches

a.patch
b.patch
and b.patch failed during next run it would append a.patch again
a.patch
b.patch
a.patch

and this would keep growing.

We can remove series file in Clean() because we populate it in Import()
anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/oe/patch.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/lib/oe/patch.py b/lib/oe/patch.py
index d7f4ccb..05abccf 100644
--- a/lib/oe/patch.py
+++ b/lib/oe/patch.py
@@ -192,6 +192,7 @@ class QuiltTree(PatchSet):
     def Clean(self):
         try:
             self._runcmd(["pop", "-a", "-f"])
+            oe.path.remove(os.path.join(self.dir, "patches","series"))
         except Exception:
             pass
         self.initialized = True
-- 
1.7.1



