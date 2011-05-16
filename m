Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QLwDd-0006Jw-Jt
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:44:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B27603150E26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:41:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PUOZSapVZhef
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:41:15 +0200 (CEST)
Received: from pepe.dream-property.nete (dreamboxupdate.com [82.149.226.174])
	by mail.dream-property.net (Postfix) with SMTP id BD0A93150F12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:41:14 +0200 (CEST)
Received: by pepe.dream-property.nete (sSMTP sendmail emulation);
	Mon, 16 May 2011 11:41:14 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 11:41:14 +0000
Message-Id: <1305546074-18796-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] lib/oe/unpack.py: unpack rar archives
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
X-List-Received-Date: Mon, 16 May 2011 11:44:13 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 lib/oe/unpack.py |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/lib/oe/unpack.py b/lib/oe/unpack.py
index 8e8bf36..fa517d8 100644
--- a/lib/oe/unpack.py
+++ b/lib/oe/unpack.py
@@ -96,6 +96,8 @@ def unpack_file(file, destdir, parameters, env=None):
             if dos:
                 cmd = '%s -a' % cmd
             cmd = "%s '%s'" % (cmd, file)
+        elif file.endswith('.rar'):
+            cmd = 'unrar x %s' % file
 
     if not unpack or not cmd:
         if os.path.isdir(file):
-- 
1.7.2.5



