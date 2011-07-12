Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qgl2d-0004B7-3I
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 00:02:55 +0200
Received: by iwn4 with SMTP id 4so5144165iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2McIQsWBTPMhKS431s2YoXSo783QK5lKHqP+xCoE9bs=;
	b=fdaqttIbypyEca8KaHXd0I5z1se0IM7qozPSiM5ial6HdqrFrFOMYBFdMfbciHEjlf
	MEZlPcCJknWhioskq7xiQhoCgI2K2DXYyTr86RUsLxozeCTUqJBMIcUkfl7iZEHZcqLb
	jNEwUok+5uETrw2znrZRjmLcnvT8tSBSahBkQ=
Received: by 10.42.150.134 with SMTP id a6mr405190icw.370.1310507443646;
	Tue, 12 Jul 2011 14:50:43 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id dn23sm5019ibb.29.2011.07.12.14.50.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 14:50:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2011 14:51:40 -0700
Message-Id: <1310507500-12965-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1310507500-12965-1-git-send-email-raj.khem@gmail.com>
References: <1310507500-12965-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] icon-naming-utils: Inherit perlnative
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
X-List-Received-Date: Tue, 12 Jul 2011 22:02:55 -0000

So we get the staged native perl to use

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
index 5b977ff..88d0779 100644
--- a/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ b/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libxml-simple-perl-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
 SRC_URI[md5sum] = "2c5c7a418e5eb3268f65e21993277fba"
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5
 
 S = "${WORKDIR}/icon-naming-utils-${PV}"
 
-inherit autotools allarch
+inherit autotools allarch perlnative
 
 do_configure_append() {
         # replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
-- 
1.7.4.1



