Return-Path: <denis@denix.org>
X-Greylist: delayed 348 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 28 Sep 2019 01:02:29 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 77DE87F29F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 01:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9370440BE2;
	Sat, 28 Sep 2019 00:56:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Doinxvt-6z0U; Sat, 28 Sep 2019 00:56:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77FDB409E0;
	Sat, 28 Sep 2019 00:56:41 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A8201173BAD;
	Fri, 27 Sep 2019 20:56:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Sep 2019 20:56:39 -0400
Message-Id: <1569632199-7446-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [thud][PATCH] mariadb: update SRC_URI, as 5.5.64 has moved to archive
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
X-List-Received-Date: Sat, 28 Sep 2019 01:02:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

The old URL now gives 404 Not Found

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 4f7784b..f51667d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
+SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://fix-cmake-module-path.patch \
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
-- 
2.7.4


