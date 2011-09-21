Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6G47-0002hn-0O
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 08:13:51 +0200
Received: (qmail invoked by alias); 21 Sep 2011 06:08:32 -0000
Received: from p4FDF1C6D.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.109]
	by mail.gmx.net (mp011) with SMTP; 21 Sep 2011 08:08:32 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19VRqQsv7ZVjgoSJhh/JG1+Pb/wx5avzWzNOzjLhu
	IC3UIUBGIm4wzY
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 08:11:55 +0200
Message-Id: <1316585520-18605-7-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 06/11] garcon: Bump to version 0.1.9
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
X-List-Received-Date: Wed, 21 Sep 2011 06:13:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Added libxfce4util to DEPENDS see [1]

[1] http://mail.xfce.org/pipermail/xfce/2011-September/029145.html

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../garcon/{garcon_0.1.8.bb => garcon_0.1.9.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.1.8.bb => garcon_0.1.9.bb} (52%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.1.9.bb
similarity index 52%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.1.9.bb
index 344f2d4..e99cb4d 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.1.9.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Xfce Menu Library"
 SECTION = "x11/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
-DEPENDS = "glib-2.0 xfce4-dev-tools-native"
+DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util"
 
 PR = "r0"
 
@@ -10,5 +10,5 @@ inherit xfce
 
 FILES_${PN} += " ${datadir}/desktop-directories"
 
-SRC_URI[md5sum] = "18fbf523ed2865dfaccdfb40b4b20b05"
-SRC_URI[sha256sum] = "955a05e72ebbadc8207bb7b2c7349e71830dbdd596dbba3ea3665f0ecfb9cf63"
+SRC_URI[md5sum] = "a3ca1e54ad731c98f688900f6398fc20"
+SRC_URI[sha256sum] = "485e23c8ec1af0d3af423aa244e05467dd2f96afbb66efc70ca7689222cf31d5"
-- 
1.7.4.4



