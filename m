Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RJDAp-0005JL-Tz
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 01:46:19 +0200
Received: (qmail invoked by alias); 26 Oct 2011 23:40:20 -0000
Received: from p4FDF0B1A.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.11.26]
	by mail.gmx.net (mp070) with SMTP; 27 Oct 2011 01:40:20 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19urMwik8BueC+COUPyzvwJ3+qQQsqqHceMc564jf
	GA4vrcwLeM6fxL
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Oct 2011 01:45:03 +0200
Message-Id: <1319672704-7181-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1319672704-7181-1-git-send-email-schnitzeltony@gmx.de>
References: <1319672704-7181-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 2/3] ristretto: update to 0.2.1
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
X-List-Received-Date: Wed, 26 Oct 2011 23:46:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../{ristretto_0.1.1.bb => ristretto_0.2.1.bb}     |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.1.1.bb => ristretto_0.2.1.bb} (51%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.2.1.bb
similarity index 51%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.2.1.bb
index 8944a29..179c589 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.2.1.bb
@@ -5,11 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
 
-inherit xfce
+inherit xfce-app
 
-# SRC_URI must follow inherited one
-SRC_URI = "http://archive.xfce.org/src/apps/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2 \
-"
-
-SRC_URI[md5sum] = "4b0f58c00ef99f13ebf134979ee76980"
-SRC_URI[sha256sum] = "8f4986a646460b24282cc95cc30f03484a5c8e0f1c568a9f4ef5749a66ec62da"
+SRC_URI[md5sum] = "df5c2082013f4ad2fc49cd7c25965741"
+SRC_URI[sha256sum] = "ffe0ce560cd9b9677537ab0759e8521a779edc697068e88afad98366fab8a561"
-- 
1.7.4.4



