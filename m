Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMVp5-0001gU-6r
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 02:40:47 +0200
Received: by pxi14 with SMTP id 14so2474208pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 17:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8Yaq6UtzPz1ITnf2qx1mRGTXhIZ1NziuikjESlCRcK0=;
	b=PhLOxfFaW9AWYvu46TYm8BCBhTp7cqfTlODFjNSejolIY2cY6J/8eExfLZGMzk6J0b
	2w3pEN78pbd3wdvuSSycW+uW8kKonbLZlIdKBtzuPl2VY3fXLTox5vvJA6IowAczwIiw
	uYxFMBWX/W9ADqLpXO78dLyBAnfnlXkGfZDTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uQAJqXtE+UREljkuOzpAUSobYrQrVeEEz1KJ+TzueueyG91zPnLf3pFX3ISaQycLem
	+SFLFdLS1yxZLrwXC6coVYNcJpw8KJn4cqiIuTZt/bA/zxDee1esUGkPDCFk1jHQHgfl
	Xb4BzHz9YWdMkcmxyhv1ICpvYwJV82E7hbeWs=
Received: by 10.142.151.38 with SMTP id y38mr2114683wfd.219.1276130179821;
	Wed, 09 Jun 2010 17:36:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a23sm70635820wam.2.2010.06.09.17.36.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 17:36:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jun 2010 17:36:15 -0700
Message-Id: <1276130175-28095-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lib/oe/patch.py: Dont import patches but symlink them instead
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
X-List-Received-Date: Thu, 10 Jun 2010 00:40:47 -0000

* This patch removes the usage of quilt import <patch>
  instead it creasted a symlink to the patch in the patches
  directory and synthesizes the series file which otherwise
  would be done automatically by quilt import.

* This should help a bit in reducing build time as it avoids
  copying of the patch and also other things that quilt import
  would otherwise do.

* Tested by doing minimal-image on qemuarm.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/oe/patch.py |   13 ++++---------
 1 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/lib/oe/patch.py b/lib/oe/patch.py
index 7f6b0fe..607ad44 100644
--- a/lib/oe/patch.py
+++ b/lib/oe/patch.py
@@ -230,15 +230,10 @@ class QuiltTree(PatchSet):
         if not self.initialized:
             self.InitFromDir()
         PatchSet.Import(self, patch, force)
-
-        args = ["import", "-p", patch["strippath"]]
-        if force:
-            args.append("-f")
-            args.append("-dn")
-        args.append(patch["file"])
-
-        self._runcmd(args)
-
+        os.symlink(patch["file"], self._quiltpatchpath(patch["file"]))
+        f = open(os.path.join(self.dir, "patches","series"), "a");
+        f.write(os.path.basename(patch["file"]) + " -p" + patch["strippath"]+"\n")
+        f.close()
         patch["quiltfile"] = self._quiltpatchpath(patch["file"])
         patch["quiltfilemd5"] = bb.utils.md5_file(patch["quiltfile"])
 
-- 
1.7.0.4



