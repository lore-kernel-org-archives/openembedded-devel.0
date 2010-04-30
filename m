Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O7pLc-0001Sv-2h
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 14:29:40 +0200
Received: by wyf22 with SMTP id 22so105573wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=zn7PHfwYcJ2CFmYJRJbu9s6xU+ximqDbfeUUdk9Z1s8=;
	b=kHVIgPGGdqeL8HlnnKhaR1G1pq8KC80zX7Gj/29c2xFpmLSR8Z7pmGdyJ8aLGAflXB
	a/3pd1HS/x9Y2eVPx1MVKUuSqg/I3genab9DuL3sBLHSGzRCKFeRp0GRm0PBWx6FRayf
	YQDDW47edoWA1OGnfcmaCuigkasuHxMO96MnQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=TWejfXkuh08e3uMHWISU/QfEWvMoGYjCxBl+9CO/UzbN1QzCit2ObQCqryAOi4cJsG
	GSeZE3Ed+b8dW/e8QjxIz9d42Evwpy8ctU/rNKMBw5E7aqJADLKvn0BEwskfCO/M6nkD
	lz3GsXhGa6CxgTXJW0KTnD1rZewB2XDG2KBiQ=
Received: by 10.216.90.77 with SMTP id d55mr2548020wef.17.1272630353119;
	Fri, 30 Apr 2010 05:25:53 -0700 (PDT)
Received: from localhost.localdomain (delta360.server4you.de [85.25.136.130])
	by mx.google.com with ESMTPS id
	k13sm1004053wed.23.2010.04.30.05.25.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Apr 2010 05:25:52 -0700 (PDT)
Sender: Mickael Chazaux <mickael.chazaux@gmail.com>
From: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Apr 2010 14:25:40 +0200
Message-Id: <1272630340-30869-1-git-send-email-mchazaux@adeneo-embedded.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 30 Apr 2010 12:29:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

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
and continues parsing ignoring the wrong line. The file is then properly
regenerated.

Signed-off-by: Mickaël Chazaux <mchazaux@adeneo-embedded.com>
---
 recipes/stage-manager/files/stage-manager          |   14 +++++++++-----
 recipes/stage-manager/stagemanager-native_0.0.1.bb |    2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/recipes/stage-manager/files/stage-manager b/recipes/stage-manager/files/stage-manager
index 536d1af..039614f 100755
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
+            d = {}
+            d['ts'] = int(data[1])
+            d['size'] = int(data[2])
+            d['seen'] = False
+            cache[data[0]] = d
+	except (IndexError, ValueError):
+            print("Corrupted line in cachefile " + cachefile + " : " + l)
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



