Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjYHj-0003WW-9Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jun 2012 18:06:35 +0200
Received: by dalh21 with SMTP id h21so75127dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2012 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vQZKw0twRSuqgY5mAKRLu9xp0A4KVk4qiIw/NX1L7b4=;
	b=nVjvgMGyhrKm/zpeQJqRz7xRVBWnug7BKE9EBDqTXodi0bU4feS4CHB1ys5S5ugMcJ
	BCGMhEfsEhBaPKwEKBohc2qj9jQLH7ozbh0GGnEjVtAdu4MAUJsuy4uP3Wv7CMrRDXJv
	TWPSWU62QjgfzLfP8MIzAOG6i6O3gg2WwIadv4OelLgQJOPvHiAp8YOV4e+AfAL8KtUE
	MBvHLWxgmnUEvIy2v9+C41km6V00jfKZni1TaOSuNzc1oh7OCQ+kNyuaDCdq2nhbIj0M
	/1aPj/+XEdasW27oZy/5ogJIuf5ats+yRP0Wb7dLU6N7zeqA69RstgAUeD3eR5+THY+8
	KDHQ==
Received: by 10.68.220.163 with SMTP id px3mr53545710pbc.167.1340726142373;
	Tue, 26 Jun 2012 08:55:42 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id wf7sm12210523pbc.34.2012.06.26.08.55.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 08:55:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jun 2012 08:55:23 -0700
Message-Id: <1340726124-30861-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1340726124-30861-1-git-send-email-raj.khem@gmail.com>
References: <1340726124-30861-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] udev: link librt explicitly on uclibc
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
X-List-Received-Date: Tue, 26 Jun 2012 16:06:35 -0000

Some functions used by udev are in librt in uclibc case
therefore add -lrt to linker flags when building for uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/udev/udev_182.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/udev/udev_182.bb b/meta-oe/recipes-core/udev/udev_182.bb
index f2bdd75..7d88aed 100644
--- a/meta-oe/recipes-core/udev/udev_182.bb
+++ b/meta-oe/recipes-core/udev/udev_182.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/COPYING;md5=17c4e5fb495e6707ac92a3864926f979 \
                     file://src/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
 
+PR = "r1"
 # glib-2.0: Needed for udev-extras
 # util-linux: Needed for libblkid
 # kmod: needed for libkmod
@@ -51,6 +52,7 @@ do_configure_prepend() {
 	cp ${WORKDIR}/gtk-doc.make ${S}
 }
 
+LDFLAGS_prepend-libc-uclibc = " -lrt "
 PACKAGES =+ "${PN}-systemd libudev libgudev udev-consolekit udev-utils"
 
 FILES_${PN}-systemd = "${systemd_unitdir}"
-- 
1.7.9.5



