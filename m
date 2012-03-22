Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoJS-0006CA-FQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 21:08:46 +0100
Received: by wgbdr12 with SMTP id dr12so1451842wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=q9YZe44dCTkmYnRE6mVzuOE+CpO8hRnl510gJEhesoU=;
	b=d0hr/RG+TGthQXZL23e8K/GQTx6KNGf5pDOSy67DXhcttriEVUb/ruq7HmghX2aKKa
	wW8DyDwXKqAMvGqyPxZRs2fiQd0WAmf4sJ455IPx6jXjsblYs2qmAKl2BuS5oU6qv2Ba
	Nog6o3hMXq0aBr6tVghuo+Qlc8SCN3EgQ4AjLFHTGpbCW03vJ44R0Vp/fTDAR+4RdoLh
	6SabbMCuoys98QFUqEzIaOzKNU0uWPNNxBWLIeSA/iDPHvGJjcdTeTq7Y6P/EGl+YdtO
	tQUsLOUgoqH9f8wkV0YSYzIqEvwgveN7+15NZFN2Koe+Jxdfra8DbNmdlNSCsOQ5k5lg
	YJKg==
Received: by 10.180.88.199 with SMTP id bi7mr378445wib.12.1332446390526;
	Thu, 22 Mar 2012 12:59:50 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm7657734wia.11.2012.03.22.12.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:59:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:59:39 +0100
Message-Id: <1332446382-24958-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 5/8] udev_175: replace ${base_libdir}/systemd by ${systemd_unitdir} set in oe-core
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
X-List-Received-Date: Thu, 22 Mar 2012 20:08:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/udev/udev_175.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_175.bb b/meta-oe/recipes-core/udev/udev_175.bb
index e14dde2..2550db2 100644
--- a/meta-oe/recipes-core/udev/udev_175.bb
+++ b/meta-oe/recipes-core/udev/udev_175.bb
@@ -50,7 +50,7 @@ EXTRA_OECONF += " \
                   --libexecdir=${base_libdir}/udev \
                   --with-rootlibdir=${base_libdir} \
                   --disable-gtk-doc-html \
-                  --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+                  --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
 "
 
 do_configure_prepend() {
@@ -59,7 +59,7 @@ do_configure_prepend() {
 
 PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
 
-FILES_${PN}-systemd = "${base_libdir}/systemd"
+FILES_${PN}-systemd = "${systemd_unitdir}"
 RDEPENDS_${PN}-systemd += "udev"
 
 FILES_libudev = "${base_libdir}/libudev.so.*"
-- 
1.7.6.5



