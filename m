Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id B98346AB93
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:30:06 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3395299eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ImiCZY4Hjn1iHw7ZrGNPlA5K32flsrqDku0rHGtcmME=;
	b=ZH3+LyZS+W0WOQKzvrhMb5ljn7//Kpu4QRqOR7NYqj7m+Er9HjifS+jg579DbUfQir
	WUeE8YE3V1hRVwdOzFzv8dwvVkvI0OeoOe8OhjVpChFhs2tS1jHc/pZ2y7Dhljpup1qM
	34R8HBrp5VHgVSKiu7cSSK+bfE8dqIQe0OMwBrAS+ZVlB9FzG2J8vjwBkxqaYjyZBX72
	legH5UHayADrvaLiJN9HfxztCFm1oMcjF3TNxyrOsVMyEQFfWt6vnITVrVQi6YTRJwlW
	n24YAt7aw9PDM6T8EOzpeCXWVn0rm7iEbLGbNJgI6MptCtLhb7RWoYIiHqaTyrim8STt
	Ctuw==
X-Received: by 10.15.108.142 with SMTP id cd14mr3503167eeb.125.1371663007480; 
	Wed, 19 Jun 2013 10:30:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.30.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:30:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:25 +0200
Message-Id: <1371662967-31734-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 18/20] xarchiver: update to 0.5.3 for various bugfixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 17:30:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xarchiver is unmaintained for long time. Since I think it is worth to invest
further development I did collect pending patches, wrote some myself, pushed
into my git repo and contacted the developer. He signalled 'green light' for me
maintaining xarchiver in the future. As long as I have not yet created/uploaded
a tarball let us use my git-repo for the sources.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xarchiver_0.5.2.bb => xarchiver_git.bb}       |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.2.bb => xarchiver_git.bb} (60%)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
similarity index 60%
rename from meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
rename to meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index 6482adc..b616267 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -1,22 +1,28 @@
 DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
 HOMEPAGE = "http://xarchiver.sourceforge.net"
 SECTION = "x11"
-PR = "r3"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
-SRC_URI[md5sum] = "2bc7f06403cc6582dd4a8029ec9d038d"
-SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa677ad2a"
+SRC_URI = "git://gitorious.org/xfce/xarchiver.git;protocol=git;branch=master"
+SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
+PV = "0.5.3"
+S = "${WORKDIR}/git"
 
 inherit gettext pkgconfig autotools gtk-icon-cache
 
 # install tap files for thunar-archive-plugin in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
 
+EXTRA_OECONF += "--enable-maintainer-mode"
+
+do_configure_prepend() {
+       NOCONFIGURE=yes ./autogen.sh
+}
+
 FILES_${PN} += "${libdir}/thunar-archive-plugin"
 
-RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip"
+RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip xz"
-- 
1.7.4.4


