Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf2-0006w1-2p
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:28 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:07 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:07 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+CwplM4hKClqYXmBlXZxBfWwZxue5Q7oIgQgEDGs
	09UNTW4muzdEX2
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:42 +0200
Message-Id: <1312232577-7948-5-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 04/19] libxfce4util: Add initial recipe with version 4.8.1
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:28 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../libxfce4util/libxfce4util_4.8.1.bb             |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb
new file mode 100644
index 0000000..5d94b6c
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Basic utility library for Xfce4"
+SECTION = "x11/libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
+DEPENDS = "intltool-native xfce4-dev-tools glib-2.0"
+
+PR = "r0"
+
+inherit xfce
+
+EXTRA_OECONF += "--with-broken-putenv=yes"
+
+SRC_URI[md5sum] = "2be3af4c7db5ad293a7525e1021e6f0f"
+SRC_URI[sha256sum] = "732aeb4f845fb92efb5487e49662f5b8544ea5feb9f1e4bd7629e726aaa70c81"
-- 
1.7.4.4



