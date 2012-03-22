Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoJQ-0006BN-Pr
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 21:08:46 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so2162877wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=O3kJ3oXY0KJbpawMicg0rQAmsqMD2k5qILpJDgwaT84=;
	b=GwpJS729KDRGeC9+hQxChy7GT1LZigFYUY3OfpeFeclxLF1MCNa7cIgjFvQ6A/lww0
	pTWBvBnVJ3bPY8dEtHSA/Z2AkMCANd7gysUySzegvnwlZtzoiPzsy3gLBCYZXXQ0v0hR
	AFqhjZJ+9klGUiR0efbmxffZDqPilzUIaAafuCUA/jbrj4Xm1+O2j6H0QDUpdDIlqRa/
	lcTwFvkYBHgr3K+yPnxO/cteybv/0v3djwL2S6DbzpRwZnf3f94ldaK6ZI26evLq9Ro3
	v0CmKypLMUl1HrBHM0euHeQ8MCvmY2uGZ3NXf3EMm/J4RuvM8V/K0JlHncsu0yBmkKMN
	7Bew==
Received: by 10.180.80.104 with SMTP id q8mr366706wix.14.1332446391896;
	Thu, 22 Mar 2012 12:59:51 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm7657734wia.11.2012.03.22.12.59.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:59:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:59:40 +0100
Message-Id: <1332446382-24958-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 6/8] udev_182: replace ${base_libdir}/systemd by ${systemd_unitdir} set in oe-core
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
 meta-oe/recipes-core/udev/udev_182.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_182.bb b/meta-oe/recipes-core/udev/udev_182.bb
index a7bf068..f2bdd75 100644
--- a/meta-oe/recipes-core/udev/udev_182.bb
+++ b/meta-oe/recipes-core/udev/udev_182.bb
@@ -44,7 +44,7 @@ EXTRA_OECONF += " \
                   --with-rootlibdir=${base_libdir} \
                   --with-rootprefix= \
                   --disable-gtk-doc-html \
-                  --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+                  --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
 "
 
 do_configure_prepend() {
@@ -53,7 +53,7 @@ do_configure_prepend() {
 
 PACKAGES =+ "${PN}-systemd libudev libgudev udev-consolekit udev-utils"
 
-FILES_${PN}-systemd = "${base_libdir}/systemd"
+FILES_${PN}-systemd = "${systemd_unitdir}"
 RDEPENDS_${PN}-systemd += "udev"
 
 FILES_libudev = "${base_libdir}/libudev.so.*"
-- 
1.7.6.5



