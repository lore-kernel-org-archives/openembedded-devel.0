Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RKTsa-0001H0-Sx
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 12:48:44 +0100
Received: (qmail invoked by alias); 30 Oct 2011 11:42:41 -0000
Received: from p4FDF1C25.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.37]
	by mail.gmx.net (mp068) with SMTP; 30 Oct 2011 12:42:41 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+t3GZchN6tbCpQkmFzD8/+NFaM0GnmJNP0mpCK5Q
	0E/iDdXHT3UZ/D
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Oct 2011 12:47:20 +0100
Message-Id: <1319975241-10849-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1319975241-10849-1-git-send-email-schnitzeltony@gmx.de>
References: <1319975241-10849-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 2/3] ristretto: update to 0.2.2
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
X-List-Received-Date: Sun, 30 Oct 2011 11:48:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../{ristretto_0.1.1.bb => ristretto_0.2.2.bb}     |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.1.1.bb => ristretto_0.2.2.bb} (51%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.2.2.bb
similarity index 51%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.2.2.bb
index 8944a29..78d090c 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.1.1.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.2.2.bb
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
+SRC_URI[md5sum] = "ee812d1200674960c246a7e05a1cbc6d"
+SRC_URI[sha256sum] = "c43832d7e6e37b670c3dd04dcf406266ff5980dc80abed7b8a82aa7c7defaa69"
-- 
1.7.4.4



