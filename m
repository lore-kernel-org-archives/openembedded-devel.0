Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDyln-0001n9-8h
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:23 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=OWQdNZlwOcVPXEbZ8VuYcwyBsrNifShi/ugn6ydEG6g=;
	b=m6+j0C57TqMbEcEjvntRz/AhrxtebDo1NLu468OnddZFElMpTpBi6IUQI2TRHw3Mry
	lHrMrEKXObMt/PbVmfbE9fsICmLJDTWfRZmhcK+UKyHQytCykEUUBTtQ37NAX4ypU2oY
	lAymM4zIcw6tzsC+7zFTNLEst8LbzZDEqF1mA26aMl1/mFUoIKDBPh0Rs7/SjAfKFzGl
	Gq4YO3A2e7WapmzAeREbrPGnUPRhvzcLIf206DB+JO/x4e2QsnVgc4I8BAfrc+uHtJ17
	DTYxTFwONryEOyZe+74X4Pj+nZJ26CvNh1GaIZLrfj6Op5CKDoB6ozh+sxmniUeEB5k+
	A3TA==
Received: by 10.204.128.214 with SMTP id l22mr153171bks.86.1347977685521;
	Tue, 18 Sep 2012 07:14:45 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:02 +0200
Message-Id: <1347977601-28665-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 21/40] thunar-volman: update to 0.8.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...unar-volman_0.6.0.bb => thunar-volman_0.8.0.bb} |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.6.0.bb => thunar-volman_0.8.0.bb} (50%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
similarity index 50%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
index c7cc0ed..4444820 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
@@ -2,12 +2,11 @@ DESCRIPTION = "Automatic management of removable drives and media for thunar"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo gtk+ libxfce4ui libxfce4util xfconf libnotify udev"
-PR = "r1"
+DEPENDS = "exo glib-2.0 gtk+ libxfce4ui libxfce4util xfconf libnotify udev"
 
 inherit xfce
 
-SRC_URI[md5sum] = "2f166662dd100d5195da238af417f305"
-SRC_URI[sha256sum] = "b1afd2b3b285cfcf07c11caa3d37fa5ff1fc06f7dc68fcca07f9a0d70daa694f"
+SRC_URI[md5sum] = "250af757ea629c7c27f554d17119080c"
+SRC_URI[sha256sum] = "ff0887c862b578580d05f4cd7db66081382ff143f9cc7ea3c9ba58cf5d02bceb"
 
 RDEPENDS_${PN} = "eject"
-- 
1.7.6.5



