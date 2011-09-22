Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktD-0007I5-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:41 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:20 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:20 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/7slM6d5X74hMDjs7DfUJmxy11cxNO5BNRIWX831
	+QnsJBCDFsuMb1
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:40 +0200
Message-Id: <1316704004-19647-10-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 09/13] xfdesktop: Bump to version 4.8.3 & recreate patch
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
X-List-Received-Date: Thu, 22 Sep 2011 15:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New version of relative-symlinks-docs.patch was sent to xfce-buglist [1]

[1] https://bugzilla.xfce.org/show_bug.cgi?id=7977

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xfdesktop/relative-symlinks-docs.patch         |   11 +++++++----
 .../{xfdesktop_4.8.2.bb => xfdesktop_4.8.3.bb}     |    4 ++--
 2 files changed, 9 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.8.2.bb => xfdesktop_4.8.3.bb} (73%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
index fa70f6e..751d7a6 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
@@ -1,11 +1,14 @@
-From 90e191cc4719172aa84e6a8ae694a6f2d6ee8989 Mon Sep 17 00:00:00 2001
-From: Andreas Mueller <schnitzeltony@gmx.de>
-Date: Fri, 22 Jul 2011 00:05:15 +0200
+From 5039e7834fff94f8393963ea8dbad81fa95ef810 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
+Date: Fri, 16 Sep 2011 21:09:05 +0200
 Subject: [PATCH] docs: On installation create relative paths in symlinks to
  images
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 
-Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
+Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
 ---
  doc/manual/Makefile.am |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb
similarity index 73%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb
index c3be330..2866280 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb
@@ -15,5 +15,5 @@ SRC_URI += " \
 
 FILES_${PN} += "${datadir}/xfce4/backdrops"
 
-SRC_URI[md5sum] = "ed25d59f478afda552d121e96657d16f"
-SRC_URI[sha256sum] = "9d0a48c4e9ed6723a3f9a1c5303e2bbe9b04a3b483c52472da46881df4595e71"
+SRC_URI[md5sum] = "617c667c469698e8c974e38412cb484c"
+SRC_URI[sha256sum] = "e58460f52ae96c389402f6db62c46db61cd51cdb550a42bd97c0ab2a5b62f424"
-- 
1.7.4.4



