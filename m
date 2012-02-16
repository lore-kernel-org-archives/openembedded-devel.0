Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm9-000644-Q0
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:50 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so504566eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Ii8g80s3UysFDyyiQeBHz6KmRTHKIyas9pSS/zNjoA4=;
	b=KQ0BEahlTrvX3ZjmIaVwyq2nmnMEGgzM+CPqsf4k5/4SOROk1T/pWrQxesIxbrA3Si
	6gHRVvDPC5lZFmw1cPXMt6OzfAm1ViWN2MNpfRHYK5CTBLzGeiETf0MQdYK8Na7VVtkU
	SV/fRKE6ZfRl4hYj42xW+EETGTOQQZmintDcc=
Received: by 10.14.28.199 with SMTP id g47mr360334eea.16.1329357639163;
	Wed, 15 Feb 2012 18:00:39 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:16 +0100
Message-Id: <1329357796-27398-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 22/22] gpsd: use ${PN}.service instead ${PN}.socket in SYSTEMD_SERVICE to enable service
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
index 927107a..2738548 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
@@ -28,7 +28,7 @@ INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.socket"
+SYSTEMD_SERVICE = "${PN}.service"
 
 
 LDFLAGS += "-L${STAGING_LIBDIR} -lm"
-- 
1.7.4.4



