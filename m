Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id D4BB76FA55
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 18:40:40 +0000 (UTC)
Received: from [98.142.68.106] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1WsG77-000Jxv-QI for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jun 2014 18:40:41 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	s54IeXaX017802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Jun 2014 13:40:40 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.68.106
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX18dt3g4JJhjmR/++ya0fNj2npKZT4vo1Dc=
From: blloyd <blloyd@familyhonor.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 13:40:31 -0500
Message-Id: <1401907231-5559-2-git-send-email-blloyd@familyhonor.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1401907231-5559-1-git-send-email-blloyd@familyhonor.net>
References: <1401907231-5559-1-git-send-email-blloyd@familyhonor.net>
Subject: [meta-oe][PATCH] Upgrade geode video driver to 2.11.15
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
X-List-Received-Date: Wed, 04 Jun 2014 18:40:41 -0000

Signed-off-by: blloyd <blloyd@familyhonor.net>
---
 .../xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch | 11 +++++++++++
 ...f86-video-geode_2.11.14.bb => xf86-video-geode_2.11.15.bb} |  6 ++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch
 rename meta-oe/recipes-graphics/xorg-driver/{nonworking/xf86-video-geode_2.11.14.bb => xf86-video-geode_2.11.15.bb} (60%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch
new file mode 100644
index 0000000..97d9d49
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch
@@ -0,0 +1,11 @@
+diff -up xf86-video-geode-2.11.14/src/geode_dcon.c.jx xf86-video-geode-2.11.14/src/geode_dcon.c
+--- xf86-video-geode-2.11.14/src/geode_dcon.c.jx	2012-11-24 05:01:15.000000000 -0500
++++ xf86-video-geode-2.11.14/src/geode_dcon.c	2013-10-25 16:19:35.950234174 -0400
+@@ -29,6 +29,7 @@
+ 
+ /* Includes that are used by all drivers */
+ #include <xf86.h>
++#include <xf86Modes.h>
+ #include <xf86_OSproc.h>
+ #include <compiler.h>
+ 
diff --git a/meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-geode_2.11.14.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
similarity index 60%
rename from meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-geode_2.11.14.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
index 2fdb210..07d2d9b 100644
--- a/meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-geode_2.11.14.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
@@ -4,8 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
 SUMMARY = "X.org server -- Geode GX2/LX display driver"
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "c9a4e1c5438240e5bdce332f92df9163"
-SRC_URI[sha256sum] = "4c750b46c932934faa008919922f5ac8a572afcfe265ac8d7c203b8167a0cfcc"
+SRC_URI[md5sum] = "7dafd19e274c771539b6d4d459423ccf"
+SRC_URI[sha256sum] = "00db3bd697b32286eb0e42f5dbd7fcc8d7255dd11c299b1ee16a06a244868ff0"
+
+SRC_URI += "file://xf86SetModeDefaultName.patch"
 
 COMPATIBLE_HOST = "i.86.*-linux"
 
-- 
1.9.0


