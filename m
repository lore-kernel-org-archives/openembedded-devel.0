Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TvOfi-00068r-Ft
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 09:48:34 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so482122eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 00:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=dvqSbnf1jYxFi2OfCT90rLybrtFtAO+21KILCv2ks/M=;
	b=I4GrnleCxyEpsBYfEFuJuyWaT2+N+80/xaT89HwKUw2LukNS/mBqtRx69tFJNRoNUR
	w2ckQ2IktfW1GJNY23V7hyKJ0VyeAfJiH892OQ+rLPjXDh/3oLN30bF4kggorIlt+ycj
	3UYO10YflkLDCuk6RDbfoImAiJx4l+43/KVVbScmrqog7bRnDVEx3vswo3qNpnRZbJTx
	cpQtqZsSfeeCnqf9J5zxSxp3vRru6q/RIYtl4hgF1Q8QY8ta6GFJNmVOxaCTuq5+Wyc7
	dO0QT26tNRPFsCqjrISqp2C/EnvPIVyxrWrJpIrcMYBUHF3ob3ycF9pKciR34pxtJd2m
	O1og==
X-Received: by 10.14.213.134 with SMTP id a6mr748994eep.45.1358325193244;
	Wed, 16 Jan 2013 00:33:13 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w3sm28613338eel.17.2013.01.16.00.33.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 00:33:12 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jan 2013 09:32:46 +0100
Message-Id: <1358325167-18862-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358325167-18862-1-git-send-email-koen@dominion.thruhere.net>
References: <1358325167-18862-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmGNuGiE3VUqW97Sprxrr42TAxdyGZkQxA3iz7i8rUke0jNbwKL2cyz0qXD7dVoRfsjJdi8
Subject: [meta-oe][meta-gnome][danny][PATCH 2/3] cheese: disable scrollkeeper
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
X-List-Received-Date: Wed, 16 Jan 2013 08:48:35 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* we don't provide scrollkeeper-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index 4ac667b..f447817 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
 DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop evolution-data-server"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnome
 
@@ -14,3 +14,4 @@ SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afcff86ae0939a74f66ce030
 FILES_${PN} += "${datadir}/dbus-1"
 RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
 
+EXTRA_OECONF += "--disable-scrollkeeper"
-- 
1.8.1



