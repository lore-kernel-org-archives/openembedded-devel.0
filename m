Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R21kw-0004e8-5y
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 16:08:34 +0200
Received: by fxi1 with SMTP id 1so157279fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aljMHYWJLotG/WWAYZkJT9K/ev4xGJ/RlLfPL6/Ui+A=;
	b=x07rygpijkzLWNHWfiCslV84bWD+PlbXpTEwQXElAQDFjq1G4MA0Tx6C/XefKaR/HL
	3m6upgWEn0Yx80kWv5pYuRKVRYwelFvZz0yrtfO2WEOKJhCLc4U2pCbH/umLC7co8gn6
	uSnEHRh2Ra2kI9U69kpdq3FsG9gNGEy1ei5Rw=
Received: by 10.223.62.134 with SMTP id x6mr624588fah.39.1315577009724;
	Fri, 09 Sep 2011 07:03:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h22sm2902722fag.15.2011.09.09.07.03.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 07:03:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2011 16:03:17 +0200
Message-Id: <1315576997-18349-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [meta-oe][PATCH] udev-173: use tar.gz instead of git checkout
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
X-List-Received-Date: Fri, 09 Sep 2011 14:08:34 -0000

* today it's easier to find right tar.gz stored somewhere then working git.kernel.org

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/udev/udev_173.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index e1383d3..df39d42 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -16,11 +16,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
-SRCREV = "${PV}"
 PR = "r0"
 
 # version specific SRC_URI
-SRC_URI = "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protocol=git \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch \
            file://gtk-doc.make"
 
@@ -33,10 +32,10 @@ SRC_URI += " \
        file://cache \
 "
 
-# Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
-
+SRC_URI[md5sum] = "2afd20ee1c790eac6d7abe0498ebb414"
+SRC_URI[sha256sum] = "0f753ad9c3022a074d1c052bcee9139581db825283771ac78c0be0d1de109d0c"
 
-S = "${WORKDIR}/git"
+# Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
 
 inherit update-rc.d autotools
 
-- 
1.7.6.1



