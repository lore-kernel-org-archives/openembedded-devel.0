Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TKb2H-0002Id-5n
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Oct 2012 22:31:45 +0200
Received: by mail-gh0-f175.google.com with SMTP id z2so894714ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2012 13:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=wJpusawGN8LZhYWhnJhn1jIKQPQbq0vkmLGGfCD+SIs=;
	b=ToxfKbB/bskWxpAFpnbmze/YuIxjlX6+J+lvlArmISKg+0g2PX8B4P9ZZoaueJ93AX
	Bi0cA/WK7jdJSE4VDlbU4I6WjlqTl0dlH1wlAacsq2DPXCVQbmKORABwYwl4Qfz6pk4j
	zLgtW7SC37dlFZvsdStnoPHDyOHWO/uhf0D+g8dlEp3kS2/3T+ZO4xGAYAx363yZrIaa
	4f6hoeJIxWGnU9MvOH1aKFfVWAUBif0laCUBrkikqV2ILAihFY6mueINkOFGqds/HJLt
	CjJ7uN+G3FvHL53wx22+72W2vEhThvmH6Dw/dEJc7Ii0gxJclQUCZX5kQNHmHxyCjRlC
	bc3w==
Received: by 10.236.165.1 with SMTP id d1mr11723280yhl.26.1349554720626;
	Sat, 06 Oct 2012 13:18:40 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h15sm13150353ank.2.2012.10.06.13.18.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 13:18:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Oct 2012 17:18:26 -0300
Message-Id: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/5] owfs: Update to 2.8p20 version
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
X-List-Received-Date: Sat, 06 Oct 2012 20:31:45 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../owfs/{owfs_2.8p15.bb => owfs_2.8p20.bb}        |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/owfs/{owfs_2.8p15.bb => owfs_2.8p20.bb} (94%)

diff --git a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb b/meta-oe/recipes-extended/owfs/owfs_2.8p20.bb
similarity index 94%
rename from meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
rename to meta-oe/recipes-extended/owfs/owfs_2.8p20.bb
index d7c5040..d010867 100644
--- a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
+++ b/meta-oe/recipes-extended/owfs/owfs_2.8p20.bb
@@ -8,13 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "fuse virtual/libusb0"
 
-PR = "r1"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
            file://owhttpd \
            file://owserver "
-SRC_URI[md5sum] = "24ec3d04ded1b199831f03e70d9e2f1f"
-SRC_URI[sha256sum] = "5bbc4ff01865e114f52ef75fd7dd3a5ee52b9ad6841504cc6155a353c516ed87"
+SRC_URI[md5sum] = "9aebee6c0e724553f5be6a542494eae5"
+SRC_URI[sha256sum] = "2374ce7864927a430da83691eb994382407e2dba492f9789b560d025841cc8ba"
 
 inherit autotools update-rc.d
 
@@ -69,4 +67,3 @@ INITSCRIPT_NAME_owserver = "owserver"
 INITSCRIPT_NAME_owhttpd = "owhttpd"
 INITSCRIPT_PARAMS_owserver = "defaults 20"
 INITSCRIPT_PARAMS_owhttpd = "defaults 21"
-
-- 
1.7.2.5



