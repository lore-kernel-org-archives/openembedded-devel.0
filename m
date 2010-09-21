Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1Oy3fU-0000F9-Rl
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 16:18:01 +0200
Received: (qmail invoked by alias); 21 Sep 2010 14:17:56 -0000
Received: from mail2.zera.de (EHLO localhost.localdomain) [62.225.102.139]
	by mail.gmx.net (mp008) with SMTP; 21 Sep 2010 16:17:56 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX187PSsZg5Y7CaLIJ22o5Llq3wHQvxdl3d1Fd84J49
	M5ihzIliBSAUQ3
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 16:16:28 +0200
Message-Id: <1285078588-20827-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.0.2
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] clutter: remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 21 Sep 2010 14:18:04 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index e29164f..85fe552 100644
--- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -8,8 +8,6 @@ INC_SRC_URI = "file://sample.desktop \
 
 PARALLEL_MAKE = ""
 
-COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm37x-evm|am37x-evm|beagleboard|overo|omap3evm|omap5912osk)"
-
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
 BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --enable-conformance "
 
-- 
1.7.0.2



