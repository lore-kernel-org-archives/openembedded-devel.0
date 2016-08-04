Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B76A87391A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 03:42:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u743gTNr004002
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Aug 2016 20:42:30 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Aug 2016 20:42:29 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Aug 2016 23:42:24 -0400
Message-ID: <14408fdd8fdcb48e2c367ce04ffaf5abc18ad6f4.1470281253.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470281253.git.jackie.huang@windriver.com>
References: <cover.1470281253.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 2/2] Revert "gnome-disk-utility: blacklist because of avahi-ui"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2016 03:42:29 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This reverts commit 5cdb839fa676ccc738c749e9f4c7679080ee9f2d.

The issue is fixed by the following commits:
in oe-core: "71b3516 avahi-ui: use PACKAGECONFIG for gtk features"
in meta-gnome: "0e19635 meta-gnome/layer.conf: enable gtk for avahi-ui"

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb      | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index b90fc3e..2f427e7 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -35,6 +35,3 @@ FILES_${PN}-libs += "${libdir}/libgdu*.so.*"
 FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
 FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug"
-
-# http://errors.yoctoproject.org/Errors/Details/69555/
-PNBLACKLIST[gnome-disk-utility] ?= "BROKEN: fails to find avahi-ui even when it's in depends"
-- 
2.8.1


