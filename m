Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF74374825
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 08:54:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4O8s9lk031709
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 May 2018 01:54:30 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 01:54:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>
Date: Thu, 24 May 2018 17:03:33 +0800
Message-ID: <1527152613-12583-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527147551-32644-1-git-send-email-hongxu.jia@windriver.com>
References: <1527147551-32644-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH V2] metacity: fix version number typo 3.38.0 -> 3.28.0
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
X-List-Received-Date: Thu, 24 May 2018 08:54:55 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-gnome/metacity/{metacity_3.38.0.bb => metacity_3.28.0.bb}   | 2 ++
 1 file changed, 2 insertions(+)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.38.0.bb => metacity_3.28.0.bb} (99%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
similarity index 99%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
index 48fc914..ce97a80 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b4cce53560b8e619ffa7c830fb8761aa \
                     file://src/include/main.h;endline=24;md5=72148ede07a6dadd01de6a882d20a9ad"
 
+PE = "1"
+
 DEPENDS = "gsettings-desktop-schemas startup-notification \
            gnome-doc-utils gdk-pixbuf-native \
            gtk+3 glib-2.0 libcanberra libgtop intltool-native"
-- 
2.7.4


