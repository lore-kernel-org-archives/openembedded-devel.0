Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B350D6ACE3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:58:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s626wYxh013585
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:58:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:58:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:57:22 -0700
Message-ID: <1404284261-42377-56-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 55/74] gdal: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:58:35 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
index 4fa6de1..6a6e62f 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=b9bd75ae5af7ff87ab259be0121c4106"
 
 DEPENDS = "proj sqlite3 tiff"
 
-SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${P}.tar.xz"
+SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
 
 SRC_URI[md5sum] = "f354c614aea76e5630e4edbf06e5c292"
 SRC_URI[sha256sum] = "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
-- 
1.7.9.5


