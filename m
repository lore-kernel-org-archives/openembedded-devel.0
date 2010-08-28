Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxu-0001ra-Jf
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:28 +0200
Received: by pxi11 with SMTP id 11so1624299pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=rwMh6xqRq1Clhs2uI1/malidsnNSA9MEn6S5WzMt23A=;
	b=G39QBm9aJ40yrsuNHKQ44ZcI6wQsoShVOiZ6MFBwYm0qMM7YCi60xQEO5F8rcaCzRJ
	xEXCorEKMTf3yWVkyYDriUNmQNcxvE4WKTOx8VTAEnZDC2WqaVD3pkCvQfo/xE0YA1p9
	lYMt+v4Bh+ujOT5PaPJWV1teCA5S0eM9xehT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SfeXJ4Yx6nNpIHnlmwftUfU8kkDrCOnLj/8bMH0lmDBE8MV2S5MKbprehzmc+n40sN
	/c0Bl0slz6h1Glr+4aYXMqya3Wrgk6YLGbVRdrvn+UEZ/p1X0PNTA9FGQ/y5dzK9uRoi
	IBNzip/2Iz2I7SctUJ0XRSNyzxuTUvPZj2/U8=
Received: by 10.142.171.9 with SMTP id t9mr2635047wfe.318.1283027092591;
	Sat, 28 Aug 2010 13:24:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:18 -0700
Message-Id: <1283027073-12308-9-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/23] task-demo-x11.bb: Replace non existing libgles-omap3-demos with libgles-omap3-x11demos
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/tasks/task-demo-x11.bb |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/recipes/tasks/task-demo-x11.bb b/recipes/tasks/task-demo-x11.bb
index 39b68e7..e342658 100644
--- a/recipes/tasks/task-demo-x11.bb
+++ b/recipes/tasks/task-demo-x11.bb
@@ -8,7 +8,7 @@ ECONFIG ?= "places e-wm-config-angstrom e-wm-config-angstrom-touchscreen e-wm-co
 
 RDEPENDS_${PN} = "\
     task-base-extended \
-	task-gstreamer-ti \
+    task-gstreamer-ti \
     angstrom-x11-base-depends \
     angstrom-gpe-task-base \
     angstrom-gpe-task-settings \
@@ -20,16 +20,15 @@ RDEPENDS_${PN} = "\
     firefox midori \
     hicolor-icon-theme gnome-icon-theme \
     mplayer \
-	angstrom-gnome-icon-theme-enable \
-	picodlp-control \
-	connman-gnome \
-	gnome-bluetooth \
-	alsa-utils-aplay \
-	alsa-utils-alsamixer \
+    angstrom-gnome-icon-theme-enable \
+    picodlp-control \
+    connman-gnome \
+    gnome-bluetooth \
+    alsa-utils-aplay \
+    alsa-utils-alsamixer \
     libgles-omap3 \
-    libgles-omap3-demos \
+    libgles-omap3-x11demos \
     libgles-omap3-tests \
-    bc-cat-omap3-module-tests \
 "
 
 # Install all kernel modules
-- 
1.7.1



