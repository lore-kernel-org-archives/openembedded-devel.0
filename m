Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9Lyz-0003Yl-63
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 22:13:53 +0200
Received: by wgbdr1 with SMTP id dr1so808783wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=B/gaw8kL5oTGwDRMFCUQEXutMplH72kDy1fvgG4qBVE=;
	b=blMTL8rJVGt0quTR7hGwDyIrO+ceBjC0ESu7mXzo3hhNW5hpPux9nZXEkfy4D1eE19
	B6PtMblClF19wKHcXDabT+e5OY9xh5ggPI+R5eUPLAMMQeel5KasvFpGgCaV/+Zw3xp7
	LBQciZsZ90H4/08ZMqVrdyvHTHKcpoqQAqn97LVfSEB0iQgur6l1aZhVpSMr+fDS/j8p
	PwivebFbe8779iRunNCTkOP+sxscJgQrltqL387iceANMnNjgvdvRXXR69XMpyYlNCKc
	KQMfmPjYjCPjAO7eddwiQpI09ww8L/64kRZbLZgiLEd1eQuqDPjjHnEGIp7VANdDceuU
	PQgQ==
Received: by 10.180.106.137 with SMTP id gu9mr40388052wib.20.1346875289944;
	Wed, 05 Sep 2012 13:01:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm273024wiv.11.2012.09.05.13.01.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 13:01:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 22:01:38 +0200
Message-Id: <9a8a4fbead0160d4a3bd1e2d01844de18cf198c6.1346875241.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346875241.git.Martin.Jansa@gmail.com>
References: <cover.1346875241.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346875241.git.Martin.Jansa@gmail.com>
References: <cover.1346875241.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/2] task-x11-illume: rename to packagegroup-x11-illume
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
X-List-Received-Date: Wed, 05 Sep 2012 20:13:53 -0000

* add RPROVIDES/RREPLACES/RCONFLICTS task-x11-illume for upgrade path
* RDEPEND on packagegroup-core-x11* from oe-core now with task-x11-*
  gone from meta-oe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroup-x11-illume.bb}                               | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-efl/recipes-efl/{tasks/task-x11-illume.bb => packagegroups/packagegroup-x11-illume.bb} (67%)

diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
similarity index 67%
rename from meta-efl/recipes-efl/tasks/task-x11-illume.bb
rename to meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
index eb628b7..11b01f6 100644
--- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
@@ -3,17 +3,20 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${TOPDIR}/meta-openembedded/meta-efl/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r3"
+PR = "r5"
 
-inherit task allarch
+inherit packagegroup allarch
 
 # Default theme and config
 ETHEME ?= "e-wm-theme-default"
 ECONFIG ?= "e-wm-config-mobile"
 
+RPROVIDES_${PN} += "task-x11-illume"
+RREPLACES_${PN} += "task-x11-illume"
+RCONFLICTS_${PN} += "task-x11-illume"
 RDEPENDS_${PN} = "\
-  task-x11-server \
-  task-x11-utils \
+  packagegroup-core-x11-xserver \
+  packagegroup-core-x11-utils \
   \
   e-wm \
   ${ECONFIG} \
-- 
1.7.12



