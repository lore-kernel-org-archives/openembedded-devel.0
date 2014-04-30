Return-Path: <marc.ferland@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 65194606E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 19:30:59 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id ih12so2141350qab.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=g+Q2p49JpAbvjz+4HOdn7Yet1nj8q+4FiS46IYX66xs=;
	b=gove183NlmlwYLdFaIvUz9Lx15dnbZMB+qCxYPe9uMSTWs9HhYuLcv/QtiQqpKZHaD
	KmAYwYU+2jLiXuoEnp2+dzzsGjk3Uvz1h0RR+R9Z9vVK2Rv+NO46mvxEGOFDwHutct+A
	36l0iLE6C7aB8w9GPVv8qE5Mvms/Y/Y1H7uca8BAIt8+U5GGG/7GHWibWd6jMU2O8ST4
	QJAMUZ4z5iLbg16YxP2dxXvgF7aPQvqgkRyD0hXnYqnSPMGdT1HpTUE7arecLQx5QXDg
	xBKcsfYSs9alqGwFsSMh7phWU/JqmHVJHOJo0B18Qs4VgO/JCiMBrPrLlEmHSRPjOh72
	pWRg==
X-Received: by 10.224.12.74 with SMTP id w10mr8308232qaw.34.1398886260422;
	Wed, 30 Apr 2014 12:31:00 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPSA id
	z96sm31914121qge.10.2014.04.30.12.30.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 30 Apr 2014 12:30:59 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Wed, 30 Apr 2014 15:31:01 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 15:31:01 -0400
Message-Id: <1398886261-23886-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] lmsensors: update 3.3.3 -> 3.3.5
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
X-List-Received-Date: Wed, 30 Apr 2014 19:31:02 -0000

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 .../lm_sensors/{lmsensors_3.3.3.bb => lmsensors_3.3.5.bb}        | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/lm_sensors/{lmsensors_3.3.3.bb => lmsensors_3.3.5.bb} (93%)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
similarity index 93%
rename from meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
rename to meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
index a965c29..6c9b3fd 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
@@ -11,8 +11,10 @@ SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2
            file://fancontrol.init \
            file://sensord.init \
 "
-SRC_URI[md5sum] = "73c2fcccdab6049d289c5e0c596192a1"
-SRC_URI[sha256sum] = "ecc91ba3d918e96fb7d5eb9acce978af803b130e0b33b08d5ea05b2bfca84955"
+SRC_URI[md5sum] = "da506dedceb41822e64865f6ba34828a"
+SRC_URI[sha256sum] = "5dae6a665e1150159a93743c4ff1943a7efe02cd9d3bb12c4805e7d7adcf4fcf"
+
+PR = "r1"
 
 inherit update-rc.d
 
@@ -67,7 +69,7 @@ PACKAGES =+ "${PN}-fancontrol ${PN}-fancontrol-doc"
 PACKAGES =+ "${PN}-sensorsdetect ${PN}-sensorsdetect-doc"
 
 # sensors-conf-convert script
-PACKAGES =+ "${PN}-sensorsconfconvert"
+PACKAGES =+ "${PN}-sensorsconfconvert ${PN}-sensorsconfconvert-doc"
 
 # pwmconfig script
 PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
@@ -109,6 +111,7 @@ RDEPENDS_${PN}-sensorsdetect = "${PN}-sensors perl perl-modules"
 
 # sensors-conf-convert script files
 FILES_${PN}-sensorsconfconvert = "${bindir}/sensors-conf-convert"
+FILES_${PN}-sensorsconfconvert-doc = "${mandir}/man8/sensors-conf-convert.8"
 RDEPENDS_${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
 
 # pwmconfig script files
-- 
1.8.3.2


