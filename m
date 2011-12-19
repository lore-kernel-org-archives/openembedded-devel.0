Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RcRcY-00017l-HW
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 02:02:26 +0100
Received: (qmail invoked by alias); 19 Dec 2011 00:55:24 -0000
Received: from p4FDF03DA.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.218]
	by mail.gmx.net (mp032) with SMTP; 19 Dec 2011 01:55:24 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+nT5B/i9anvxhu4wyld8ymEyARWPDRmHg4ZnEkmH
	TOi3snPjulR3lv
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2011 01:56:00 +0100
Message-Id: <1324256160-1478-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe] libgphoto2: Fix QA issues
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
X-List-Received-Date: Mon, 19 Dec 2011 01:02:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index a6516d6..fbce4fd 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "libtool jpeg virtual/libusb0 libexif"
 
@@ -46,6 +46,7 @@ FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 
 FILES_${PN} += "${base_libdir}/udev/* ${datadir}/hal"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
+FILES_${PN}-dev += "${libdir}/*/*/*.la"
 
 
 
-- 
1.7.4.4



