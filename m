Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Ri6Yi-0003E8-7t
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jan 2012 16:45:52 +0100
Received: (qmail invoked by alias); 03 Jan 2012 15:38:31 -0000
Received: from p5B0A12EF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.18.239]
	by mail.gmx.net (mp019) with SMTP; 03 Jan 2012 16:38:31 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18KHaFmgtoKadflgkux4qc9OGoffYzAhwUJybOZ5U
	E6vZdmTnpDzJab
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2012 16:39:37 +0100
Message-Id: <1325605177-5372-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] ristretto: fix build error by including locale.h
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
X-List-Received-Date: Tue, 03 Jan 2012 15:45:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

build tested / error was:

| util.c: In function 'rstto_launch_help':
| util.c:36:35: error: 'LC_MESSAGES' undeclared (first use in this function)
| util.c:36:35: note: each undeclared identifier is reported only once for each function it appears in
| make[3]: *** [ristretto-util.o] Error 1
| make[3]: Leaving directory `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/ristretto-0.3.0-r0/ristretto-0.3.0/src'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/ristretto-0.3.0-r0/ristretto-0.3.0/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/ristretto-0.3.0-r0/ristretto-0.3.0'
| make: *** [all] Error 2
| + die 'oe_runmake failed'

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../ristretto/files/add-locale_h.patch             |   13 +++++++++++++
 .../recipes-apps/ristretto/ristretto_0.3.0.bb      |    3 +++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/ristretto/files/add-locale_h.patch

diff --git a/meta-xfce/recipes-apps/ristretto/files/add-locale_h.patch b/meta-xfce/recipes-apps/ristretto/files/add-locale_h.patch
new file mode 100644
index 0000000..a149500
--- /dev/null
+++ b/meta-xfce/recipes-apps/ristretto/files/add-locale_h.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Applied in git repo
+---
+--- a/src/util.c.old	2011-11-05 22:12:00.000000000 +0100
++++ b/src/util.c	2012-01-03 16:18:21.435234961 +0100
+@@ -18,7 +18,7 @@
+ 
+ #include <config.h>
+ #include <glib.h>
+-
++#include <locale.h>
+ #include <exo/exo.h>
+ 
+ 
diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb
index 9a5d077..4fb28f0 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb
@@ -4,9 +4,12 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
+PR = "r1"
 
 inherit xfce-app
 
+SRC_URI += "file://add-locale_h.patch"
+
 RRECOMMENDS_${PN} += "tumbler"
 
 SRC_URI[md5sum] = "124c4e98f837e35c728b0ff1d9078b1a"
-- 
1.7.4.4



