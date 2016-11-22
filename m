Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C938605C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:33:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM7XD7F010595
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:13 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:12 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:30:54 +0800
Message-ID: <8f35d9101be1477450a413f9eb629b920ea059f8.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 09/27] libxklavier: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

libxklavier depends on gtk+ and libxi which require
x11 distro feature.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
index 384841a..872c868 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
@@ -6,7 +6,10 @@ DEPENDS = "xkbcomp gtk+ iso-codes libxi libxml2"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-inherit gnomebase gettext gobject-introspection
+inherit gnomebase gettext gobject-introspection distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[archive.md5sum] = "290ea2a8abc40f78a3a16bdae6f02808"
 SRC_URI[archive.sha256sum] = "ebec3bc54b5652838502b96223152fb1cd8fcb14ace5cb02d718fc3276bbd404"
 
-- 
2.8.3


