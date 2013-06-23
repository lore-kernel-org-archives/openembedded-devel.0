Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6DD60780
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2013 10:49:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jun 2013 03:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,922,1363158000"; d="scan'208";a="334147412"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.45])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2013 03:49:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jun 2013 11:49:00 +0100
Message-Id: <df55c6cbc892939729f0713513dc8dba6f5b9751.1371984424.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1371984424.git.paul.eggleton@linux.intel.com>
References: <cover.1371984424.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1371984424.git.paul.eggleton@linux.intel.com>
References: <cover.1371984424.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] pinpoint: fix and update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Jun 2013 10:49:35 -0000

* Fix for update and PN change of clutter in OE-Core
* Fix SRC_URI
* Use +git instead of +gitr in PV
* Update to latest upstream git revision

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
index 4949570..7cb40c3 100644
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
@@ -7,14 +7,14 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://pinpoint.c;beginline=6;endline=17;md5=201d438283607da393fae6aca085454c"
 
-DEPENDS = "gnome-common glib-2.0 gdk-pixbuf clutter-1.8 clutter-gst-1.8"
+DEPENDS = "gnome-common glib-2.0 gdk-pixbuf clutter-1.0 clutter-gst-1.0"
 
 inherit autotools gettext
 
-SRC_URI = "git://git.gnome.org/browse/pinpoint;protocol=http"
+SRC_URI = "git://git.gnome.org/pinpoint"
 
-SRCREV = "5b22660f5b247023ca409403f1c2cc834d8ce632"
-PV = "0.1.4+gitr${SRCPV}"
+SRCREV = "80a056c57e819d0b75035424638813b0670830e1"
+PV = "0.1.4+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.1.2


