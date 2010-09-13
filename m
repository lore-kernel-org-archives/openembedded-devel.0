Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OvAcu-0001Ct-4d
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 17:08:54 +0200
Received: (qmail invoked by alias); 13 Sep 2010 15:06:33 -0000
Received: from p50882653.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.38.83]
	by mail.gmx.net (mp037) with SMTP; 13 Sep 2010 17:06:33 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+tN4Rw7NSt/y949GrDyrJRA9uFDdvWCfPr+yJf6E
	arXUFeg7Bc9SoO
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 14:33:11 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009131433.11900.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xfwm4: depends libwnck
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
X-List-Received-Date: Mon, 13 Sep 2010 15:10:42 -0000
X-List-Received-Date: Mon, 13 Sep 2010 15:10:42 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/xfce-base/xfwm4_4.6.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xfce-base/xfwm4_4.6.2.bb b/recipes/xfce-base/xfwm4_4.6.2.bb
index 3ea7f52..87a492b 100644
--- a/recipes/xfce-base/xfwm4_4.6.2.bb
+++ b/recipes/xfce-base/xfwm4_4.6.2.bb
@@ -2,13 +2,13 @@
 
 DESCRIPTION="Xfce4 Window Manager"
 SECTION = "x11/wm"
-PR = "r0"
+PR = "r1"
 
 inherit xfce46 update-alternatives
 
 FILES_${PN} += "${datadir}/xfwm4/defaults ${datadir}/xfwm4/themes/default.keys/*"
 
-DEPENDS = "startup-notification virtual/libx11 libxpm libxfce4util libxfcegui4"
+DEPENDS = "startup-notification virtual/libx11 libxpm libxfce4util libxfcegui4 libwnck"
 RDEPENDS_${PN} = "xfwm4-theme-default"
 
 EXTRA_OECONF += " --enable-startup-notification"
-- 
1.5.3.4


