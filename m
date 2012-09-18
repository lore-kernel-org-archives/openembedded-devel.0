Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDym1-0001lE-MU
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:37 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=e4W6wdPPELNGM/QawA1f1mNW8d8uTB6GWTejOQSRnZA=;
	b=lZp+tn55tcUBTxgMfr6Wwgl0vK2IifzM42Y6XZyjBEINTJYyAZqV4T4YWho/2IJjjE
	KIWRtQ3R8UyJWhW6AhueEdf8J7kaLE+2Y5go447bV7SOUEXIozXBcrRYBeEBOLg8BlzJ
	rSSDMUn1GExJhhWOgS/CYEItjOdxAL7l6J5fVunFoWv+r+8FB3ooa+WaqzIKYj3Ze+3e
	kM7RJNNoCMVd2+RZfCT5RIlG8gYoi6khKKhYe5SOUfxDSqobKp0Y0EHqNyRkzYUbJ/st
	lH5YfehDyzIlAyi8axXCIdl7r76WGutn9ksGXW9PU//ZxQ9X2viy+gCDIBWGRWYYH0hS
	H0Ww==
Received: by 10.204.154.131 with SMTP id o3mr153517bkw.87.1347977699968;
	Tue, 18 Sep 2012 07:14:59 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:12 +0200
Message-Id: <1347977601-28665-32-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 31/40] xfce4-fsguard-plugin: initial add 1.0.1
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
X-List-Received-Date: Tue, 18 Sep 2012 14:30:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../fsguard/xfce4-fsguard-plugin_1.0.1.bb          |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.1.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.1.bb
new file mode 100644
index 0000000..1446115
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.1.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "The FSGuard panel plugin checks free space on a chosen mount point frequently and displays a message when a limit is reached"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin?&#recet_releases"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "9c179371475e2837004cc208026e30c1"
+SRC_URI[sha256sum] = "fffb7ee09769ec0b991b8752b848578e6434a675a939c5588f0728c2ef33aab7"
-- 
1.7.6.5



