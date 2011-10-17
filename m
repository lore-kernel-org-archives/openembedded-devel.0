Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwob-0006aY-Ra
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:41:53 +0200
Received: by mail-ey0-f175.google.com with SMTP id 9so15949eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8ef47e7INptWaI9h2YoCa1XgQo4EIchEn3oU9gWXBfo=;
	b=xhwycM6aX49GPXT2pyfLl9cvtfXExVkXtY4Qa9/K+gi/u9P47Mpo7UXAo3plE9m8KE
	n/VuGKQ7TRNLQ94/yQNqxLJEJ8mCeTMMG2pvb9uNy2wcdYdhnNx4WB8wypGtq0UvDt8U
	3dHDMfiiIxIG8viVGua9+eZeFKcKdkMVFxit0=
Received: by 10.223.14.134 with SMTP id g6mr3574faa.11.1318894567084;
	Mon, 17 Oct 2011 16:36:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n12sm194587fan.9.2011.10.17.16.36.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:36:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:24 +0200
Message-Id: <7714140fe7fd7411a497f61abfce8c89c8a38cd6.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 05/10] ttf-droid: add LIC_FILES_CHKSUM, switch to github.com
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
X-List-Received-Date: Mon, 17 Oct 2011 23:41:54 -0000

* android.git.kernel.org seems not available
* SRCREV magic didn't work for me with fetch2
* PV changed to get upgradable path

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index a23170a..e0a6c65 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -3,18 +3,16 @@ require ttf.inc
 DESCRIPTION = "Droid fonts - TTF Edition"
 HOMEPAGE = "http://www.droidfonts.com/"
 LICENSE = "Apache-2.0"
-PR = "r1"
-# git magic below - SRCREV is an ID of /data/fonts subtree
-# (so we don't need to fetch full platform/frameworks/base.git)
-SRCREV = "31f255e44e618ff3b923f332e8fcb83403fd39f5"
-PV = "0.0+${PR}+gitr${SRCREV}"
+LIC_FILES_CHKSUM = "file://README.txt;md5=83544262a86f1f1ec761e75897df92bc"
+SRCREV = "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
+PV = "0.1+gitr${SRCPV}"
 
-SRC_URI = "git://android.git.kernel.org/platform/frameworks/base.git;protocol=git;branch=master"
+SRC_URI = "git://github.com/android/platform_frameworks_base.git;protocol=git;branch=master"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/data/fonts"
 
 do_install_prepend() {
-	rm ${S}/Ahem.ttf # we're not packaging it
+	rm ${S}/Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf DroidSansThai.ttf Clockopia.ttf MTLmr3m.ttf DroidSansHebrew.ttf DroidSansFallbackLegacy.ttf # we're not packaging it
 }
 
 PACKAGES = "${PN}-dbg ttf-droid-sans ttf-droid-sans-mono \
-- 
1.7.7



