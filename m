Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qynbk-0000sz-At
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 18:25:44 +0200
Received: (qmail invoked by alias); 31 Aug 2011 16:20:49 -0000
Received: from p4FDF0F36.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.15.54]
	by mail.gmx.net (mp011) with SMTP; 31 Aug 2011 18:20:49 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18lTE1UdNMlcPWVjXM2pcoL6Ov6paeR/3qp+TBnyP
	NGmzXVEk0p43b4
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 18:24:13 +0200
Message-Id: <1314807853-3174-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1314807853-3174-1-git-send-email-schnitzeltony@gmx.de>
References: <1314807853-3174-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][PATCH v2 1/1] thunar-volman: Add initial recipe with version 0.6.0
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
X-List-Received-Date: Wed, 31 Aug 2011 16:25:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build & partially run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../thunar-volman/thunar-volman_0.6.0.bb           |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
new file mode 100644
index 0000000..377561c
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Automatic management of removable drives and media for thunar"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "exo gtk+ libxfce4ui libxfce4util xfconf libnotify"
+
+inherit xfce
+
+SRC_URI[md5sum] = "2f166662dd100d5195da238af417f305"
+SRC_URI[sha256sum] = "b1afd2b3b285cfcf07c11caa3d37fa5ff1fc06f7dc68fcca07f9a0d70daa694f"
-- 
1.7.4.4



