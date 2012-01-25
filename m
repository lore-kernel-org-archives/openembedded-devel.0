Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RpqUp-000116-1l
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 01:13:51 +0100
Received: from mizar.localdomain (79.24.249.251) by smtp206.alice.it
	(8.6.023.02) id 4F1836AD00A4550A; Wed, 25 Jan 2012 01:06:07 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jan 2012 01:05:58 +0100
Message-Id: <1327449958-9778-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1327449958-9778-1-git-send-email-andrea.adami@gmail.com>
References: <1327449958-9778-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe] [PATCH] udev: default disabling DEVCACHE
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
X-List-Received-Date: Wed, 25 Jan 2012 00:13:51 -0000

* This deprecated mechanism can break boot when root is RO on boot,
* probably does not cope well with sysvinit initscripts.
* Ininfluent when using systemd.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-core/udev/udev/default |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev/default b/meta-oe/recipes-core/udev/udev/default
index 5c4937a..d0050b8 100644
--- a/meta-oe/recipes-core/udev/udev/default
+++ b/meta-oe/recipes-core/udev/udev/default
@@ -1,4 +1,4 @@
 # Default for /etc/init.d/udev
 
 # Comment this out to disable device cache
-DEVCACHE="/etc/dev.tar"
+#DEVCACHE="/etc/dev.tar"
-- 
1.7.3.4



