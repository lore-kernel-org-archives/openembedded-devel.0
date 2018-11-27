Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFC36D251
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:40:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR9e32g024256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:40:03 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:40:03 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:39:11 +0800
Message-ID: <1543311554-293342-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
References: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/7] pangomm: upgrade to 2.42.0
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
X-List-Received-Date: Tue, 27 Nov 2018 09:40:02 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-graphics/pango/{pangomm_2.40.1.bb => pangomm_2.42.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.40.1.bb => pangomm_2.42.0.bb} (83%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb b/meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb
similarity index 83%
rename from meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb
index e0f72cd..8a85db4 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb
@@ -9,8 +9,8 @@ DEPENDS = "mm-common cairomm glibmm pango"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
-SRC_URI[md5sum] = "874eadd9434613dbacf0272c82c3ac23"
-SRC_URI[sha256sum] = "9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af"
+SRC_URI[md5sum] = "6cffedf2225c4e72645a7d757fb5b832"
+SRC_URI[sha256sum] = "ca6da067ff93a6445780c0b4b226eb84f484ab104b8391fb744a45cbc7edbf56"
 
 inherit distro_features_check autotools pkgconfig
 
-- 
2.7.4


