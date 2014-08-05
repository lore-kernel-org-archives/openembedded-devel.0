Return-Path: <pab@pabigot.com>
X-Greylist: delayed 432 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Aug 2014 14:36:14 UTC
Received: from p3plsmtpa09-09.prod.phx3.secureserver.net
	(p3plsmtpa09-09.prod.phx3.secureserver.net [173.201.193.238])
	by mail.openembedded.org (Postfix) with ESMTP id 1518A60017
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 14:36:14 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa09-09.prod.phx3.secureserver.net with 
	id b2V11o00C1mTNtu012V1H1; Tue, 05 Aug 2014 07:29:03 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Aug 2014 09:28:59 -0500
Message-Id: <1407248939-17872-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1407097958-26267-1-git-send-email-pab@pabigot.com>
References: <1407097958-26267-1-git-send-email-pab@pabigot.com>
Subject: [meta-python][PATCH v2] python-smbus: upgrade to 3.1.1
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
X-List-Received-Date: Tue, 05 Aug 2014 14:36:16 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
V2 changes: Remove SECURITY_CFLAGS setting.
See: http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095269.html

 .../python/{python-smbus_3.0.3.bb => python-smbus_3.1.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-smbus_3.0.3.bb => python-smbus_3.1.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python-smbus_3.0.3.bb b/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
rename to meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
index 14548a9..df47df6 100644
--- a/meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://smbusmodule.c;startline=1;endline=17;md5=fa24df321a52
 
 SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
 "
-SRC_URI[md5sum] = "511376eed04455cdb277ef19c5f73bb4"
-SRC_URI[sha256sum] = "23b28e474741834e3f1b35b0686528769a13adc92d2ff5603cbda1d6bd5e5629"
+SRC_URI[md5sum] = "0fdbff53ebd0b8d9249256d6c56480b1"
+SRC_URI[sha256sum] = "14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700"
 
 DEPENDS = "i2c-tools"
 
-- 
1.8.5.5


