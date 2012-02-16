Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm4-00063p-B9
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:44 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479837eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=8ct4hDl5bZyqf81ly9ta+gtMGwIjSR5jzUfdbtOlFuo=;
	b=wpoDZIIbRnxSUJa/wV2MdScSfvOMM7aM08zlkIdK+CYyMM73RP2/aOuy3OtzAv4XHV
	4EeEWN+vcguQXs3ZDOm4okuG/y08Bss/rU9X+oWQvC1rh6B5gurtIfB8YQRRv1pM7GjJ
	X3Axbk1b1E0p7V+kmPbN7AFasMjyrIG/OL6Eg=
Received: by 10.14.183.195 with SMTP id q43mr327988eem.93.1329357633232;
	Wed, 15 Feb 2012 18:00:33 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:09 +0100
Message-Id: <1329357796-27398-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 15/22] udisks: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 55b115e..96b6086 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r2"
+PR = "r3"
 
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
1.7.4.4



