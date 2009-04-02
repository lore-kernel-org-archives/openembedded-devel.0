Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LpMYV-0001V4-OX
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 15:02:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 162C12C823
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 12:58:13 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPyj1Du7yaVq
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 12:58:11 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 30D202C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 12:58:11 +0000 (UTC)
Message-ID: <49D4B6BA.2090404@gmail.com>
Date: Thu, 02 Apr 2009 14:59:38 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [STABLE][PATCH] 3/3 modified linux recipe for at91sam9g20ek support
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
X-List-Received-Date: Thu, 02 Apr 2009 13:02:38 -0000
Content-Type: text/x-diff;
	name="0003-modified-linux-recipe-for-at91sam9g20ek-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="0003-modified-linux-recipe-for-at91sam9g20ek-support.patch"

From b3d301887620f5647e6d344028c2d94ba580bc6c Mon Sep 17 00:00:00 2001
From: Marco Cavallini <m.cavallini@koansoftware.com>
Date: Thu, 2 Apr 2009 14:50:13 +0200
Subject: [PATCH] modified linux recipe for at91sam9g20ek support

---
 recipes/linux/linux_2.6.28.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux_2.6.28.bb b/recipes/linux/linux_2.6.28.bb
index 6e6b280..2a9d92d 100644
--- a/recipes/linux/linux_2.6.28.bb
+++ b/recipes/linux/linux_2.6.28.bb
@@ -1,11 +1,12 @@
 require linux.inc
 
-PR = "r6"
+PR = "r7"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
 
 DEFAULT_PREFERENCE_at91sam9263ek = "28"
+DEFAULT_PREFERENCE_at91sam9g20ek = "28"
 DEFAULT_PREFERENCE_ronetix-pm9263 = "28"
 DEFAULT_PREFERENCE_stb225 = "28"
 DEFAULT_PREFERENCE_collie = "1"
@@ -19,6 +20,10 @@ SRC_URI_append_at91sam9263ek = " \
            file://linux-2.6.28-at91.patch.bz2;patch=1 \
 	   file://linux-2.6.28-exp.patch.bz2;patch=1 "
 
+SRC_URI_append_at91sam9g20ek = " \
+           file://linux-2.6.28-at91.patch.bz2;patch=1 \
+           file://linux-2.6.28-exp.patch.bz2;patch=1 "
+
 SRC_URI_append_ronetix-pm9263 = " \
            file://linux-2.6.28-at91.patch.bz2;patch=1 \
            file://linux-2.6.28-exp.patch.bz2;patch=1 \
-- 
1.5.6.5


