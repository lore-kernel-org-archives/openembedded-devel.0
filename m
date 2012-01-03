Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Ri5en-0001EG-H7
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jan 2012 15:48:05 +0100
Received: (qmail invoked by alias); 03 Jan 2012 14:40:45 -0000
Received: from p5B0A12EF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.18.239]
	by mail.gmx.net (mp062) with SMTP; 03 Jan 2012 15:40:45 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+tIot48O+twsaBQGwDBKX2QfC2kMjLDrXDLzkpGs
	P38xywyLy5Tju7
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2012 15:41:49 +0100
Message-Id: <1325601709-13917-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1325601709-13917-1-git-send-email-schnitzeltony@gmx.de>
References: <1325601709-13917-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 2/2] libxfce4ui: remove gettext from DEPENDS since xfce.bbclass takes care
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
X-List-Received-Date: Tue, 03 Jan 2012 14:48:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
index 0887c38..ae9dddf 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ gettext intltool libxfce4util startup-notification xfconf"
+DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf"
 
 inherit xfce
 
-- 
1.7.4.4



