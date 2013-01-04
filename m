Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tr6VA-0008Ra-LD
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 13:36:07 +0100
Received: by mail-ee0-f42.google.com with SMTP id c41so8245111eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 04:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=8y4NuVGWYUBWthHbP5M6FZhhsSgoK+mBsRN1sPsuZ24=;
	b=ePVjVZl5vGCzWDsYKUGN2vcE2hGws3ExBbwUNAN8p3UrCySmTWlzgsq8VUWQ9Vhr9v
	sJUr+IZKOLrgpNcDf9qHbST+sHXJ1K2Bo2xMFG5oPEO6FLAMgHHw+ytAc/d/Wlg/zKMD
	BkJ02dzk72W7TjG4mz8eTT8AhOB0hGORsqUU2FTNDM0nIqzvmBrZ2dIZ4WM98Uq95RaR
	YIxJ4YcFUBFfFFVIVpAr+wXCXyeljVTrgSvSC0dSpMBA1YdCGtp0TyI30mw0dvI/AhGf
	Wx0YBA4IoeGhWC0TdQECisrA6EbnBWE7YapfkNuyuKMCc1osuntXlU77+/uj1P5v9SFL
	iozQ==
X-Received: by 10.14.173.69 with SMTP id u45mr143081208eel.21.1357302051856;
	Fri, 04 Jan 2013 04:20:51 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	f49sm110378128eep.12.2013.01.04.04.20.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 04:20:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2013 13:20:36 +0100
Message-Id: <bc2c9f00732529f810ddb34337b44a2db30aa3ee.1357301108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][danny][PATCH 6/6] packagegroup-cli-tools: remove mdbus2, mterm2, mkdump, mioctl
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
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Missing or unbuildable dependency chain was: ['mdbus2']
Missing or unbuildable dependency chain was: ['mterm2']
Missing or unbuildable dependency chain was: ['mkdump']
Missing or unbuildable dependency chain was: ['mioctl']

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index 07fb056..88b62b8 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -4,7 +4,7 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r20"
+PR = "r21"
 
 inherit packagegroup allarch
 
@@ -24,9 +24,7 @@ RDEPENDS_${PN} = "\
   iptables \
   lsof \
   mbuffer \
-  mdbus2 \
   mtd-utils \
-  mterm2 \
   nano \
   nfs-utils-client \
   nmon \
@@ -41,8 +39,6 @@ RDEPENDS_${PN}-debug = "\
   devmem2 \
   i2c-tools \
   gdb \
-  mkdump \
-  mioctl \
   procps \
   pxaregs \
   s3c24xx-gpio \
-- 
1.8.0.2



