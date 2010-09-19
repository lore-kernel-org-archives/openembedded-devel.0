Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OxMFC-0001lw-R2
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 17:55:59 +0200
Received: (qmail invoked by alias); 19 Sep 2010 15:55:05 -0000
Received: from p508858D6.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.88.214]
	by mail.gmx.net (mp016) with SMTP; 19 Sep 2010 17:55:05 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+kSwgSzBykL7Na63KMRWatuMw2xUF47KOOVlDSGC
	vHkO5f3/BRDheQ
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Sep 2010 17:53:42 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009191753.42404.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] clutter: remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 19 Sep 2010 15:55:59 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

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
 
-COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm37x-evm|am37x-evm|beagleboard|overo|omap3evm|
omap5912osk)"
-
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
 BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --enable-conformance "
 
-- 
1.5.3.4


