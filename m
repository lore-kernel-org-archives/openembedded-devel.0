Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QGdSt-0001Ht-Pd
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 22:42:03 +0200
Received: (qmail invoked by alias); 01 May 2011 20:39:25 -0000
Received: from p579634A8.dip.t-dialin.net (EHLO localhost.localdomain)
	[87.150.52.168]
	by mail.gmx.net (mp028) with SMTP; 01 May 2011 22:39:25 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19jMgVIwDpjqrdXt2XX5q2LHh+/dFTC8Gt2SUhjh0
	fwIuVtmFZ2oZ8m
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 May 2011 22:39:59 +0200
Message-Id: <1304282399-2932-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH v2] libgpsbt: add dbus-glib to DEPENDS
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
X-List-Received-Date: Sun, 01 May 2011 20:42:03 -0000

Error message during configure was
| checking for GLIB... yes
| checking for DBUS... configure: error: Package requirements ( dbus-glib-1 >= 0.23 ) were not met:
|
| No package 'dbus-glib-1' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables DBUS_CFLAGS
| and DBUS_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
NOTE: package libgpsbt-0.1-r2: task do_configure: Failed

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/maemo4/libgpsbt_0.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/maemo4/libgpsbt_0.1.bb b/recipes/maemo4/libgpsbt_0.1.bb
index c6c6ea6..a41501e 100644
--- a/recipes/maemo4/libgpsbt_0.1.bb
+++ b/recipes/maemo4/libgpsbt_0.1.bb
@@ -2,7 +2,7 @@ LICENSE = "nokia"
 
 PR = "r2"
 
-DEPENDS = "libgpsmgr dbus"
+DEPENDS = "libgpsmgr dbus dbus-glib"
 
 # This is proprietary software in Chinook, so we have to stay with the last released
 # free version.
-- 
1.7.4.4



