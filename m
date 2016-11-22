Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2263B719C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:33:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM7X2n7010588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:02 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:02 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:30:48 +0800
Message-ID: <b069fbd7355277e47a918622a8918568460a6d87.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 03/27] libunique: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

libunique depends on gtk+ which requires x11 distro feature.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
index be3a41f..3018398 100644
--- a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -24,4 +24,6 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 
-inherit autotools pkgconfig gobject-introspection
+inherit autotools pkgconfig gobject-introspection distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.8.3


