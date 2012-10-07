Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKulX-0007a3-4n
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 19:35:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Oct 2012 10:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="222667683"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by orsmga002.jf.intel.com with ESMTP; 07 Oct 2012 10:22:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 18:22:28 +0100
Message-Id: <1349630548-10790-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] pinpoint: add new recipe
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
X-List-Received-Date: Sun, 07 Oct 2012 17:35:47 -0000

Add new recipe for the latest git version of pinpoint, the
hacker-friendly presentation tool.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
new file mode 100644
index 0000000..4949570
--- /dev/null
+++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A simple presentation tool for hackers"
+DESCRIPTION = "Pinpoint is a simple presentation tool that hopes to avoid audience death \
+               by bullet point and instead encourage presentations containing beautiful \
+               images and small amounts of concise text in slides."
+SECTION = "x11/multimedia"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
+                    file://pinpoint.c;beginline=6;endline=17;md5=201d438283607da393fae6aca085454c"
+
+DEPENDS = "gnome-common glib-2.0 gdk-pixbuf clutter-1.8 clutter-gst-1.8"
+
+inherit autotools gettext
+
+SRC_URI = "git://git.gnome.org/browse/pinpoint;protocol=http"
+
+SRCREV = "5b22660f5b247023ca409403f1c2cc834d8ce632"
+PV = "0.1.4+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
-- 
1.7.9.5



