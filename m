Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SiW7R-0002S9-PD
	for openembedded-devel@openembedded.org; Sat, 23 Jun 2012 21:35:41 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id E8C55EA042;
	Sat, 23 Jun 2012 21:32:05 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id B52B5604DE; Sat, 23 Jun 2012 21:23:18 +0200 (CEST)
Date: Sat, 23 Jun 2012 21:23:18 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120623192318.GS4845@hermes>
References: <20120623191635.GN4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120623191635.GN4845@hermes>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][udev][PATCH 5/5] udev: update SRC_URI of udev-168 recipe
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
X-List-Received-Date: Sat, 23 Jun 2012 19:35:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


This patch updates the SRC_URI of udev_168.bb to www.mirrorservice.org
because the corresponding source package is no longer available at
kernel.org.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/udev/udev_168.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/udev/udev_168.bb b/recipes/udev/udev_168.bb
index 4ff2e22..744def1 100644
--- a/recipes/udev/udev_168.bb
+++ b/recipes/udev/udev_168.bb
@@ -15,7 +15,7 @@ PR = "r2"
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz"
+SRC_URI = "http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz"
 SRC_URI[md5sum] = "08eb7c2564bc89defcefdaa6ec4a9fc1"
 SRC_URI[sha256sum] = "1d5c548d7c85d30b3508b82ad88d853e28dddb6c526d0e67aa92ac18af93d218"
 
-- 
1.7.10

-- 
        Apelete


