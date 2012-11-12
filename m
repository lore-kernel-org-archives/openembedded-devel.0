Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXspo-0002gR-3u
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 13:09:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id l10so390389eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 03:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Nqb1joMXmJBM6CzgW8akAdKtdUCxqszZdMPBrXRZYng=;
	b=BYxlOnUGrZ4Fd60weQXtAuFFSyX1K+LobWWq2cXo+lkEqDMuXTE5kWkmsi+Afwe7ks
	k4ajPTMxthlKbIU4qZEiCa+NtutivcyD0S95rGY6uXyHqiA/vKCmYItG3B6OeXZb8JWj
	qzW4HNSzpyYir0DoDI940x5O2i6+DCHS/rsWPFLABUuHcFMTZNLhEol11cjnHoUK1l/O
	L2HYC63r6yHL0edOaSN2cSnoUeXrcHgSgh33O+rMTBq60Mb2YxIIT1ycqh0MK0MahREU
	VNz20wjHSaN5Ndf4BJmD2+CeSZVX1ZNLw9yaEHfqi1T2cuHP9lkx6ijmyeGS701ciyr0
	CtWw==
Received: by 10.14.203.3 with SMTP id e3mr62365337eeo.35.1352721355667;
	Mon, 12 Nov 2012 03:55:55 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id f2sm15646402eep.2.2012.11.12.03.55.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 03:55:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 12:54:26 +0100
Message-Id: <1352721267-367-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
References: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 5/6] xarchiver: no RDEPENDS on unzip / busybox's unzip is good enough
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
X-List-Received-Date: Mon, 12 Nov 2012 12:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
index f47a3bc..79af6a4 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
 HOMEPAGE = "http://xarchiver.sourceforge.net"
 SECTION = "x11"
-PR = "r2"
+PR = "r3"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
@@ -14,4 +14,4 @@ SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa6
 
 inherit gettext pkgconfig autotools gtk-icon-cache
 
-RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip"
+RRECOMMENDS_${PN} = "lzop zip tar bzip2"
-- 
1.7.6.5



