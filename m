Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xds-0004lJ-7R
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:24 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506551eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:05 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.97.131 as permitted sender)
	client-ip=10.14.97.131; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.97.131 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.97.131])
	by 10.14.97.131 with SMTP id t3mr777235eef.3.1329999065267 (num_hops =
	1); Thu, 23 Feb 2012 04:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uikMqMzo6xf79UxOQFyz5vCA4vN/YijbLjPRouNEqtg=;
	b=f0bOm+cflN6cov4+Sgjg2ma6a63yC2jdQ/roeSYMMqZzcE/zuEcXGxV2DU763tQVT0
	DMaqCX40UZfuX8C28mVV+96+v1J9di1+9IN3g4Ij+6VuAZeMDLCcq/12yBvCj8s6Ow8+
	D7EyAbZrzBTdnafrwBPB8ZzgSJycO692JW9Bo=
Received: by 10.14.97.131 with SMTP id t3mr612174eef.3.1329999064860;
	Thu, 23 Feb 2012 04:11:04 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:48 +0100
Message-Id: <1329999054-23112-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 17/23] udisks: remove unneeded systemd code
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 9ffaca5..0018a5f 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r3"
+PR = "r4"
 
 inherit autotools systemd
 
@@ -21,11 +21,6 @@ SYSTEMD_SERVICE_${PN}-systemd = "udisks-daemon.service"
 
 EXTRA_OECONF = "--disable-man-pages"
 
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
-RDEPENDS_${PN}-systemd = "${PN}"
-
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
                 ${datadir}/polkit-1 \
@@ -33,5 +28,3 @@ FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
 "
 
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
-
-
-- 
1.7.6.4



