Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1Si0Ge-0004hx-21
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 11:35:04 +0200
Received: by bkcjm2 with SMTP id jm2so1298281bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aQtL8HJsyCxTpl8P6T6TEnW7NGQz9/uQJNA0zU1iAUI=;
	b=c/iQnyv5LW2pzAFI5bHz6BiQbjU2iC8g2aaA9i86FUCvaHD8FYhfJdWzUMpofTvrwm
	jZdFWdkGy7n1MG7ZNuBNvozN+4PJTV77KltF8kDyIfzwMdK6j4Lq+cUpYWPErPXbCBkr
	H/W6dKbLgcOeTyBXjvej9Uzxw3sVPJBtBqXT+xxu0gmWhooVOheaKb28mm1lH5z+5Oad
	x9QqbfAS1gsM4sIT1/J+nqESqFLUFs28SqMHUN+ywLNbBd9zq22YqDch23R/ak2u5XX9
	3WEr5d4zrZs1DF5zRmvuPYg9I0g3mDzorExXjXvMMg3gKVFHmvVHLdaXkh+X8qnPf1X+
	sy1g==
Received: by 10.204.148.82 with SMTP id o18mr467126bkv.85.1340357057223;
	Fri, 22 Jun 2012 02:24:17 -0700 (PDT)
Received: from localhost.localdomain
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by mx.google.com with ESMTPS id x23sm35197793bkw.12.2012.06.22.02.24.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 02:24:16 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 11:23:48 +0200
Message-Id: <1340357028-26015-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH v2] libmodbus: update to 3.0.3
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
X-List-Received-Date: Fri, 22 Jun 2012 09:35:04 -0000

v2: also reword SRC_URI with ${BPN}/${BP}

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../{libmodbus_3.0.2.bb => libmodbus_3.0.3.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libmodbus/{libmodbus_3.0.2.bb => libmodbus_3.0.3.bb} (63%)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
similarity index 63%
rename from meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
rename to meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
index 03b7fcc..450add9 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
@@ -8,9 +8,9 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
+SRC_URI = "http://github.com/downloads/stephane/${BPN}/${BP}.tar.gz"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "1aaacce9d9779d3a84f7d1a75774c943"
-SRC_URI[sha256sum] = "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e12204229361c029f2615"
+SRC_URI[md5sum] = "b5042d833c6c132e6fb2551af133a342"
+SRC_URI[sha256sum] = "6fc7cf91f7293e522afde6ae5fc605c6cd7bdca4ee2ec953db5bb91158ab8677"
-- 
1.7.5.4



