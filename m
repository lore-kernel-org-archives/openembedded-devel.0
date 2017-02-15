Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87D5271E14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:03:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1FI3aMn016270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 15 Feb 2017 10:03:36 -0800
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 10:03:35 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Feb 2017 13:03:31 -0500
Message-ID: <1487181811-31445-4-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487181811-31445-1-git-send-email-paul.gortmaker@windriver.com>
References: <1487181811-31445-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] farsight/xfce4-mixer: unblacklist recipes
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
X-List-Received-Date: Wed, 15 Feb 2017 18:03:36 -0000
Content-Type: text/plain

These were 3rd level fallout from gstreamer being blacklisted, as
they depended on packages that depended on gstreamer.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb     | 3 ---
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb | 2 --
 2 files changed, 5 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 8c783a9f4770..2989850e9875 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -28,6 +28,3 @@ FILES_${PN}-dbg += "${libdir}/*/.debug"
 
 SRC_URI[md5sum] = "e1f540cf3ebab06c3d7db1f46b44ac88"
 SRC_URI[sha256sum] = "3ae59aa61a8071c9fad111e5fd606aabc27961eb4192f8729987a27dae6b3974"
-
-PNBLACKLIST[farsight2] ?= "Depends on blacklisted libnice"
-PNBLACKLIST[farsight2] ?= "Depends on blacklisted gst-plugins-base"
diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
index 2c91fa9b930e..bdbec458bc47 100644
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
@@ -12,5 +12,3 @@ SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
 SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
 
 RDEPENDS_${PN} = "gst-meta-audio"
-
-PNBLACKLIST[xfce4-mixer] ?= "Depends on blacklisted gst-plugins-base"
-- 
2.7.4


