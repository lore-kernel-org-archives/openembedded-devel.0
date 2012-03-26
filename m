Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCCla-0002E4-Iv
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2012 18:27:34 +0200
Received: by wibhj13 with SMTP id hj13so4146690wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2012 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=QBXGgQwwyE2mG7aBvTMzhPi8iWpDuKlAFIxAPy72EMo=;
	b=M6O65z0Hk9TodcnqZ+qi0FtcT0WHUDGV5C5V+x6L9dsb7u0Z+FDQ2NCUYSKAPn7Fiw
	QCY/i2Og3YGp62e6qutv0Bl1S8/G0xnF09B4QG6l2Zi6xlhKW4KMUadi4nd0JrEo9Ojv
	3qBfomgcW3zmycX024wD++BpFwT/Xo0uSR+3fA4+bzxXNstStEEYnZtfUGUVPF7CMz4Q
	GBuFhYEA+kNwRcyYa6YPrmLV2JJHjPCsnGMSqPviua45mGXCkXM4ZPH5Z2axnnJNKMCe
	fAYQs1NoUpRzB306MRvbiYg7On9vnO2cy0d5c8X4Wsxl/4L0bBkcN9uGlQCVpsYIEYgn
	1cHQ==
Received: by 10.216.134.24 with SMTP id r24mr12662333wei.84.1332778710899;
	Mon, 26 Mar 2012 09:18:30 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id gg2sm68798034wib.7.2012.03.26.09.18.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 09:18:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Mar 2012 18:18:30 +0200
Message-Id: <1332778710-28970-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] evince: Fix QA warnings / clean packaging
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
X-List-Received-Date: Mon, 26 Mar 2012 16:27:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index ec54fbc..f92a599 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnome pkgconfig gtk-icon-cache
 
@@ -30,8 +30,10 @@ PACKAGES =+ "${PN}-nautilus-extension"
 FILES_${PN} += "${datadir}/dbus-1"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug \
                     ${libdir}/*/*/*/.debug"
-FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
+FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la \
+                    ${libdir}/evince/*/backends/*.la"
+FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
+                          ${libdir}/evince/*/backends/*.a"
 FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
 
 pkg_postinst_${PN} () {
-- 
1.7.6.5



