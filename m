Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OgQOY-0006d4-02
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 00:55:39 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id F3C13D4807B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 00:55:31 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>) id 1OgQUG-0006V7-Gu
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 01:01:32 +0200
Date: Wed, 4 Aug 2010 01:01:32 +0200
From: Yann Dirson <ydirson@free.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803230132.GO4752@home.lan>
References: <1280798728-13412-1-git-send-email-ydirson@altern.org>
	<1280798728-13412-2-git-send-email-ydirson@altern.org>
MIME-Version: 1.0
In-Reply-To: <1280798728-13412-2-git-send-email-ydirson@altern.org>
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
Subject: [PATCH 2/2] gnome-python-desktop: build a separate python-rsvg package.
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
X-List-Received-Date: Tue, 03 Aug 2010 22:55:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

That package has no dependency on gnome, and is useful of its own.

Signed-off-by: Yann Dirson <ydirson@altern.org>
---
 recipes/gnome/gnome-python-desktop_2.30.0.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/recipes/gnome/gnome-python-desktop_2.30.0.bb b/recipes/gnome/gnome-python-desktop_2.30.0.bb
index 8dd73fa..9c72ed4 100644
--- a/recipes/gnome/gnome-python-desktop_2.30.0.bb
+++ b/recipes/gnome/gnome-python-desktop_2.30.0.bb
@@ -1,6 +1,8 @@
 LICENSE = "GPL/LGPL"
 DEPENDS = "librsvg libwnck totem-pl-parser libgtop gnome-panel gnome-desktop eds-dbus python-pygtk gnome-python libgnomeprint libgnomeprintui"
 
+PR = "r1"
+
 inherit gnome distutils-base
 
 EXTRA_OECONF += " ac_cv_path_PYGOBJECT_CODEGEN=${STAGING_DATADIR}/pygobject/2.0/codegen/codegen.py \
@@ -26,5 +28,10 @@ do_configure_prepend() {
 
 FILES_${PN}-dev += "${datadir}/pygtk"
 
+PACKAGES =+ "python-rsvg"
+FILES_python-rsvg = " \
+	/usr/lib/python*/site-packages/gtk-2.0/rsvg.* \
+"
+
 SRC_URI[archive.md5sum] = "a6d448d46a6b3062ce7a1b6a9fddfb48"
 SRC_URI[archive.sha256sum] = "db997a3c81967d6dc7210dd83e06f18ac6417f804f672e42f15a1d68af371f49"
-- 
1.7.1



