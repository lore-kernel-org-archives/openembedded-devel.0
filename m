Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id C475576FDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:54 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so97099730wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=MenC/Fm7QiQeWbiqYmJMB0E6MsmgpOcN4k8aAbludE8=;
	b=ZkjONTu2kUIxksJJomll4HEvcGj41KzvBouFjq4UT8CTEqw1tsBpNXYUND35itF8Gm
	vMUn+UIy+AJgKKGC7yKz6Td/1rJlOD8qeFEhCKizEs2ucE/8e24GhKKpOKbZtBAPRr3x
	3O7ssiEM9zVrOtMGI+wEbH2NXd3k7vCW45HIpPRdx/RwaNs2oDqoq8Y+GtpTmpoYMzW1
	oBsYvuMc3E5tRpi4FjBmfBv3KMF2WU4iqczb8FhZRDxuXZUpXRMUiJYoZM7IhLFQgTpV
	R1v6MSIIUh23goIrIgxXJ1YI1q/3ZmDYIEKc2l+9g8DA/AXiLTQ9I4qXfhtQI5s3/nul
	RQVA==
X-Received: by 10.194.59.236 with SMTP id c12mr4538854wjr.23.1442450514288;
	Wed, 16 Sep 2015 17:41:54 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:25 +0200
Message-Id: <1442450491-14912-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/19] xfce4-power-manager: make upower a build dependency
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This one came up when upower failed:

| *** The required package upower-glib was not found on your system.
| *** Please install upower-glib (atleast version 0.9.7) or adjust
| *** the PKG_CONFIG_PATH environment variable if you
| *** installed the package in a nonstandard prefix so that
| *** pkg-config is able to find it.

xfce4-power-manager links against upower so we can expect shlibs causing upower
being added to RDEPENDS.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
index 623b2ed..4a9accf 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 inherit xfce
 
 DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
-           libxrandr virtual/libx11 libxext xfce4-panel"
+           libxrandr virtual/libx11 libxext xfce4-panel upower"
 
 SRC_URI[md5sum] = "e7d00548e58bf19229e727818184c1e0"
 SRC_URI[sha256sum] = "c50ec8aa7e7848c57c0f856dceb8132eb5f37585f0ac1627459ab8c882c73b07"
@@ -34,7 +34,7 @@ FILES_xfce4-powermanager-plugin = " \
 "
 
 RDEPENDS_xfce4-powermanager-plugin = "${PN}"
-RDEPENDS_${PN} = "networkmanager udisks upower ${@base_contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
+RDEPENDS_${PN} = "networkmanager udisks ${@base_contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
 
 # xfce4-brightness-plugin was replaced by xfce4-powermanager-plugin
 RPROVIDES_xfce4-powermanager-plugin += "xfce4-brightness-plugin"
-- 
2.1.0


