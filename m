Return-Path: <gizero@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5811F6D8F4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2013 17:10:21 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so2015444eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2013 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E0htAVgp8+bFp1POCfMV21i/N/B/Yfr6tf5zR5Ixxj8=;
	b=PssTN+Nmq/ZzxgLJMGGBIBVhcNcramAQTighnzuOF3E4a8DKv68teIwptPtnby8lR3
	1m+1v230JUVdGwcWpkunxGY8fxMMDfCKNdtQTBfJ/ApV40YYa0+tKb13oM8KgigdAzgw
	8Dwz3PcEwJWS3dkw6ZrAh7fPPyjrDexys6e0mXpcvULrl/kN9hdQBQzFDP0hJU7rqYcM
	fPFJmWqave6omnXXRbZx8IBkuI6LxG7+jz4ha5P3P7aFIHwzHsx6O/0G4ZPNzETKUEJ5
	LrHmU0eR8mM/+shlOdc4MTEbHw3f1QXhh/6Tz+38sIQnAsgJAG2uI79dHrGcdWyqe0+V
	nT8A==
X-Received: by 10.15.43.140 with SMTP id x12mr5875176eev.4.1384708222140;
	Sun, 17 Nov 2013 09:10:22 -0800 (PST)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by mx.google.com with ESMTPSA id a45sm11847587eem.6.2013.11.17.09.10.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Nov 2013 09:10:21 -0800 (PST)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2013 18:09:56 +0100
Message-Id: <1384708196-7263-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] libmodbus: update to upstream stable version 3.0.5
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
X-List-Received-Date: Sun, 17 Nov 2013 17:10:22 -0000

* update SRC_URI according to download location for new releases

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../{libmodbus_3.0.3.bb => libmodbus_3.0.5.bb}     |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libmodbus/{libmodbus_3.0.3.bb => libmodbus_3.0.5.bb} (65%)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.5.bb
similarity index 65%
rename from meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
rename to meta-oe/recipes-extended/libmodbus/libmodbus_3.0.5.bb
index 450add9..19ca24c 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.5.bb
@@ -8,9 +8,9 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://github.com/downloads/stephane/${BPN}/${BP}.tar.gz"
+SRC_URI = "http://libmodbus.org/site_media/build/${BP}.tar.gz"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "b5042d833c6c132e6fb2551af133a342"
-SRC_URI[sha256sum] = "6fc7cf91f7293e522afde6ae5fc605c6cd7bdca4ee2ec953db5bb91158ab8677"
+SRC_URI[md5sum] = "18860375a7aa0ca9cba7d6ece54ab666"
+SRC_URI[sha256sum] = "19aad5d55fa315602d6e836a858a3802f1608f9d824afba05fa12a58a1b1e656"
-- 
1.7.9.5


