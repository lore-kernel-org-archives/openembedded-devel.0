Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rzfuk-0002nY-LA
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 03:57:14 +0100
Received: by pbcum15 with SMTP id um15so1240800pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 18:48:55 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.132.166 as permitted sender) client-ip=10.68.132.166; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.132.166 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.132.166])
	by 10.68.132.166 with SMTP id ov6mr68869355pbb.122.1329792535259
	(num_hops = 1); Mon, 20 Feb 2012 18:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IihehFsRqBiybFlyGhma7A4a/VYp7yDDJWBSa1D6Y/A=;
	b=Sj9rAkQHJ/Kz2FvQ/Mi3pCXwx4c3YZY07muat08ySBotO+P57l2DChmMncpDUtFvve
	lvaKUA3/88ONkYJcJv9jnMHs/wnr+GuSW9ZOItEPmCf/bMjjQ+Y3USrfbTUy6vD7lRn+
	y4WN9qjogeh5uGMEgEJO9laUfMFd0QbbDYm/Y=
Received: by 10.68.132.166 with SMTP id ov6mr56716710pbb.122.1329792535233;
	Mon, 20 Feb 2012 18:48:55 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id 3sm14749462pbx.66.2012.02.20.18.48.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 18:48:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2012 18:47:37 -0800
Message-Id: <1329792457-3884-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] udev: Upgrade 180 -> 181
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
X-List-Received-Date: Tue, 21 Feb 2012 02:57:15 -0000

180 does not compile with kmod-5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/udev/{udev_180.bb => udev_181.bb} |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/udev/{udev_180.bb => udev_181.bb} (95%)

diff --git a/meta-oe/recipes-core/udev/udev_180.bb b/meta-oe/recipes-core/udev/udev_181.bb
similarity index 95%
rename from meta-oe/recipes-core/udev/udev_180.bb
rename to meta-oe/recipes-core/udev/udev_181.bb
index 4cabcce..1e0a02a 100644
--- a/meta-oe/recipes-core/udev/udev_180.bb
+++ b/meta-oe/recipes-core/udev/udev_181.bb
@@ -22,8 +22,9 @@ DEPENDS = "gperf-native usbutils acl glib-2.0 util-linux kmod"
 # version specific SRC_URI
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/${P}.tar.gz \
            file://gtk-doc.make"
-SRC_URI[md5sum] = "7a74429e5b4d5cc3d389945774807e46"
-SRC_URI[sha256sum] = "d8f021cc940da7c1f928e2e651c6aa00c5695f3227f560de4a65584e2f089115"
+
+SRC_URI[md5sum] = "86fed9d76060c8157e550ca1b4ee3250"
+SRC_URI[sha256sum] = "b4b0fb6553926bb83ff43b65df44f29a3bce0980a970bcc4a80d5e4f81946f30"
 
 # generic SRC_URI
 SRC_URI += " \
-- 
1.7.5.4



