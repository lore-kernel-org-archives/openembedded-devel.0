Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T41XZ-00041t-5o
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 05:23:33 +0200
Received: by daks35 with SMTP id s35so346644dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2012 20:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WSxlTSopelJ1vVABwrumTVRgHZXgW+IYzpFQfdqaGsQ=;
	b=ZGxeQXFf/CN2O4Wvir76WFXwio9IH41ci8uOyMXOY8nTX9rOp6mUUWA1Ef5jFUx8Xl
	FB8aCT16a5G6CEW5D471msENcdkoFRUe/ui9Mcj7VK9U0TGWp4VFp8soOl+lqH2S3BDr
	hUT6y5eHealCUc7uJuweq69cjTQ6jXzBm3Qvj1ToTvYHWP/pEtMqKCmz3hg82nzc9OpD
	51W/vths6425n8HYNpFR9fD3TpZZyCsc6pP7m2mU7BdfVNrirf3lkOmY9ldwPJ9fK4vE
	7uXWExakUqgyDgMjQMXbyp/428IublcC16GBmuVy4q4VUYjYQ2qPLCBAHLEz+MfBwifN
	69RA==
Received: by 10.66.78.73 with SMTP id z9mr43191915paw.9.1345605087944;
	Tue, 21 Aug 2012 20:11:27 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sr3sm2712964pbc.44.2012.08.21.20.11.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 20:11:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2012 20:10:56 -0700
Message-Id: <1345605057-18140-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] udev-173: Fix SRC_URI to fetch bz2 archive
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
X-List-Received-Date: Wed, 22 Aug 2012 03:23:33 -0000

gz archive is not available on source anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/udev/udev_173.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index b7d7ed3..576302c 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -19,7 +19,7 @@ DEPENDS = "gperf-native usbutils acl glib-2.0"
 PR = "r4"
 
 # version specific SRC_URI
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.bz2 \
            file://0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch \
            file://gtk-doc.make"
 
-- 
1.7.9.5



