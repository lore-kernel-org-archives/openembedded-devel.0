Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUupN-0002Hd-JR
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 09:08:49 +0200
Received: by wgbdr1 with SMTP id dr1so1283319wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 23:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Pu6Dx+G6IpVCPtdFVdcXzZGu9zPVdt/YxS6koIPqiNo=;
	b=V/Hz4pnHa/kEzhFGZFwXNc9r/DxRapx614cw55yCv6JFSkqTXOPb0OXX69h+vwkKKL
	atxr/ku3lYa7XxL4vY7tm76rq389XUNG54edmNJkvOFRrm0i4gNj/zloSwkqFYYSXqMh
	sctWzwq6SSNGZipEOyUL2sOtbh3n3IVfEzAws1XKBcHsuUm4lIKGxAYexfsrBbUawBxH
	mgz3E+7pfmWJaP2Yef2mvS5YEN/F0buP7B/aQPVmSetX5cPDlAalm/LCVFB3Ds9kX3B2
	1N9gFILNPCH70NvnePlGlMo7y8FAkIFGWbLhL56bQzXrQk0nBvncbF43ECTdpWnEZ7H/
	YB1A==
Received: by 10.180.106.7 with SMTP id gq7mr730349wib.4.1337237927384;
	Wed, 16 May 2012 23:58:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ez4sm55030567wid.3.2012.05.16.23.58.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 23:58:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2012 08:58:39 +0200
Message-Id: <1337237919-17155-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] pidgin: explicitly disable nss
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
X-List-Received-Date: Thu, 17 May 2012 07:08:49 -0000

* sometimes it leaks from meta-chromium and breaks pidgin build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
index dee1465..4e26c98 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
@@ -1,5 +1,5 @@
 require pidgin.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS += "farsight2 libidn"
 
@@ -19,4 +19,5 @@ EXTRA_OECONF += "\
   --disable-meanwhile \
   --disable-nm \
   --disable-screensaver \
+  --enable-nss=no \
 "
-- 
1.7.8.6



