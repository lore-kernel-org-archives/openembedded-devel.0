Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SiW2i-00025W-Vm
	for openembedded-devel@openembedded.org; Sat, 23 Jun 2012 21:30:49 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 2B732EA040;
	Sat, 23 Jun 2012 21:27:10 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id DD67E604DE; Sat, 23 Jun 2012 21:19:57 +0200 (CEST)
Date: Sat, 23 Jun 2012 21:19:57 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120623191957.GO4845@hermes>
References: <20120623191635.GN4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120623191635.GN4845@hermes>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][udev][PATCH 1/5] udev: update SRC_URI of udev-151 recipe
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
X-List-Received-Date: Sat, 23 Jun 2012 19:30:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch updates the SRC_URI of udev_151.bb to www.mirrorservice.org
because the corresponding source package is no longer available at
kernel.org.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/udev/udev_151.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index b977b7d..2f28a1c 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -12,7 +12,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://udev-replace-le16toh.patch \
 	   file://udev-replace-lutimes.patch \
 	   file://mount.blacklist \
-- 
1.7.10

-- 
        Apelete


