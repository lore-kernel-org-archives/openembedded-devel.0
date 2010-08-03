Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OgQOL-0006ch-9r
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 00:55:26 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id A7E11D4808B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 00:55:19 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>) id 1OgQU4-0006Uv-6X
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 01:01:20 +0200
Date: Wed, 4 Aug 2010 01:01:20 +0200
From: Yann Dirson <ydirson@free.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803230120.GN4752@home.lan>
References: <1280798728-13412-1-git-send-email-ydirson@altern.org>
MIME-Version: 1.0
In-Reply-To: <1280798728-13412-1-git-send-email-ydirson@altern.org>
X-Mailer: git-send-email 1.7.1
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] python-xdg: prevent infinite recursion in xdg.DesktopEntry.__cmp__().
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
X-List-Received-Date: Tue, 03 Aug 2010 22:55:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Delete cmp method which has been dropped from later releases.

Signed-off-by: Yann Dirson <ydirson@altern.org>
---
 recipes/python/python-pyxdg/desktopentry-cmp.patch |   15 +++++++++++++++
 recipes/python/python-pyxdg_0.15.bb                |    4 +++-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 recipes/python/python-pyxdg/desktopentry-cmp.patch

diff --git a/recipes/python/python-pyxdg/desktopentry-cmp.patch b/recipes/python/python-pyxdg/desktopentry-cmp.patch
new file mode 100644
index 0000000..bb2905a
--- /dev/null
+++ b/recipes/python/python-pyxdg/desktopentry-cmp.patch
@@ -0,0 +1,15 @@
+This method definition causes an infinite recursion, and has been dropped
+from later releases.
+
+--- pyxdg-0.15/xdg/DesktopEntry.py.orig	2010-08-03 03:01:34.000000000 +0200
++++ pyxdg-0.15/xdg/DesktopEntry.py	2010-08-03 03:01:46.000000000 +0200
+@@ -29,9 +29,6 @@
+ 	def __str__(self):
+ 		return self.getName()
+ 
+-	def __cmp__(self, other):
+-		return cmp(self, other)
+-
+ 	def parse(self, file):
+ 		IniFile.parse(self, file, ["Desktop Entry", "KDE Desktop Entry"])
+ 
diff --git a/recipes/python/python-pyxdg_0.15.bb b/recipes/python/python-pyxdg_0.15.bb
index 018af50..67b6c97 100644
--- a/recipes/python/python-pyxdg_0.15.bb
+++ b/recipes/python/python-pyxdg_0.15.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = "PyXDG is a python library to access freedesktop.org standards"
 SECTION = "devel/python"
 LICENSE = "GPL"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.freedesktop.org/~lanius/pyxdg-${PV}.tar.gz"
+SRC_URI += "file://desktopentry-cmp.patch"
+
 S = "${WORKDIR}/pyxdg-${PV}"
 
 inherit distutils
-- 
1.7.1



