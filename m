Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O6KkK-0002sr-9s
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 11:36:58 +0200
Received: by wyf22 with SMTP id 22so1012629wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=5thCfqxHuBIFuUAKvI1Xf7T7nmKxf1rcr47yT0V86zo=;
	b=OXEFciaohJWZjdaIjtOzSy6LBphQKibMjQhFS+n0funNfuThXALx4B+e2PPJ5NUjLc
	cQYWWXHWS8UcF5V0TUfrnSfxfdnh/sxNDA7Kt9Mw/kXwbB8hKpbEAuYe8KlDz/myMim+
	5Yu01I5BE1cYAZsZldHpEHjS4Fc8+WtHv0pjg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=b4V1TsOyc6U7RiOFAGvjw1GkmG1FBa7Ux9/LyxrJ78CHpUIT9FiKc2vSaDa2w/iyMf
	ekZ5kHxPnDQnUCvUSSYWGOsXPL9Hb9S9jbpjL1QeIqqsSvSLWYsq6MmgMyv4ekF3yLJZ
	uqYFOSbZ5CSErLIcetu9wlMR04ZeeHaY0vZcs=
Received: by 10.216.90.130 with SMTP id e2mr4855921wef.210.1272274389607;
	Mon, 26 Apr 2010 02:33:09 -0700 (PDT)
Received: from localhost.localdomain (delta360.server4you.de [85.25.136.130])
	by mx.google.com with ESMTPS id v59sm358414wec.15.2010.04.26.02.33.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Apr 2010 02:33:08 -0700 (PDT)
Sender: Mickael Chazaux <mickael.chazaux@gmail.com>
From: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Apr 2010 11:33:02 +0200
Message-Id: <1272274382-1983-1-git-send-email-mchazaux@adeneo-embedded.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
Subject: [PATCH] Add error handling to read_cache in stage-manager
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
X-List-Received-Date: Mon, 26 Apr 2010 09:36:58 -0000

Sometimes stage-manager crashes with this message :
Traceback (most recent call last):
 File "/home/mchazaux/projet/OE/openembedded/recipes/stage-manager/files/stage-manager",
line 79, in <module>
   cache = read_cache(options.cachefile)
 File "/home/mchazaux/projet/OE/openembedded/recipes/stage-manager/files/stage-manager",
line 34, in read_cache
   cache[data[0]]['ts'] = int(data[1])
IndexError: list index out of range

This is due to a corrupted cache file. This patch adds an error message
telling the cause of the crash to the user.
---
 recipes/stage-manager/files/stage-manager          |   14 +++++++++-----
 recipes/stage-manager/stagemanager-native_0.0.1.bb |    2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/recipes/stage-manager/files/stage-manager b/recipes/stage-manager/files/stage-manager
index 536d1af..93196ff 100755
--- a/recipes/stage-manager/files/stage-manager
+++ b/recipes/stage-manager/files/stage-manager
@@ -29,11 +29,15 @@ def read_cache(cachefile):
     lines = f.readlines()
     f.close()
     for l in lines:
-        data = l.split('|')
-        cache[data[0]] = {}
-        cache[data[0]]['ts'] = int(data[1])
-        cache[data[0]]['size'] = int(data[2])
-        cache[data[0]]['seen'] = False
+	try:
+            data = l.split('|')
+            d = cache[data[0]] = {}
+            d['ts'] = int(data[1])
+            d['size'] = int(data[2])
+            d['seen'] = False
+	except IndexError, e:
+            print("Corrupted line in cachefile " + cachefile + " : " + l)
+	    raise e
     return cache
 
 def mkdirhier(dir):
diff --git a/recipes/stage-manager/stagemanager-native_0.0.1.bb b/recipes/stage-manager/stagemanager-native_0.0.1.bb
index 5708045..4357517 100644
--- a/recipes/stage-manager/stagemanager-native_0.0.1.bb
+++ b/recipes/stage-manager/stagemanager-native_0.0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Helper script for packaged-staging.bbclass"
-PR = "r11"
+PR = "r13"
 
 SRC_URI = "file://stage-manager \
            file://stage-manager-ipkg \
-- 
1.6.3.3



