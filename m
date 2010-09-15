Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvzOh-0003Uh-JX
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 23:20:08 +0200
Received: by pxi11 with SMTP id 11so199252pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=AHuL6xbSidlUxYnow7xhKctQljIiS1vvFrOmph7DHzw=;
	b=LQzw0OIDgWuPG5VRl3LpOAhaviscHakPu/uk8jMVFAu+nJPbwXDJLNkEdd0i/lJqcM
	Fczhi44lzQY1wl6mo04CrUW9ZsLsdGoauRWv4amoPQYIjrwhe7w2sJHRsIe1CWYdT9GR
	thv0YA7rDxnQl7j/901EIMUAyNv/IufdRKcjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=r8uPV3Bq2Wo995BalYiyl7pJ5T8683hXmdVN2tpYR0Dcoyo1B5BBjem9TacSNXBGoo
	qSqHtw6gggQj5kOjuV/5GpTu5iP6hDyy0jCrGFfyiuzMzZULQ05NtngO2F1hjlREWS4t
	/MyrBcS4iciZv+FRlSUyQJPjdv/RVBdkUoaSE=
Received: by 10.114.24.3 with SMTP id 3mr2524670wax.31.1284585557246;
	Wed, 15 Sep 2010 14:19:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c24sm3051377wam.7.2010.09.15.14.19.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Sep 2010 14:19:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Sep 2010 14:19:08 -0700
Message-Id: <1284585548-32430-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openmoko2.bbclass: Fix openmoko_two_get_license and openmoko_two_get_subdir
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
X-List-Received-Date: Wed, 15 Sep 2010 21:20:08 -0000

Usually openmoko inheriting recipes have SECTION like openmoko/libs
etc then the code works well but for packages e.g. -dev -dbg same
section is not true and the functions fail

File "openmoko2.bbclass", line 2, in openmoko_two_get_subdir
ValueError: need more than 1 value to unpack

This patch makes sure to split the string only if SECTION contains '/'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/openmoko2.bbclass |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/classes/openmoko2.bbclass b/classes/openmoko2.bbclass
index 1dfef64..25dea82 100644
--- a/classes/openmoko2.bbclass
+++ b/classes/openmoko2.bbclass
@@ -5,11 +5,17 @@ OPENMOKO_RELEASE ?= "OM-2007.2"
 OPENMOKO_MIRROR ?= "svn://svn.openmoko.org/trunk"
 
 def openmoko_two_get_license(d):
-    openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    if bb.data.getVar('SECTION', d, 1).find("/") != -1:
+    	openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    else:
+        section = bb.data.getVar('SECTION', d, 1)	
     return "LGPL GPL".split()[section != "libs"]
 
 def openmoko_two_get_subdir(d):
-    openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    if bb.data.getVar('SECTION', d, 1).find("/") != -1:
+        openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    else:
+        section = bb.data.getVar('SECTION', d, 1)
     if section == 'base': return ""
     elif section == 'libs': return "libraries"
     elif section in 'apps tools pim'.split(): return "applications"
-- 
1.7.1



