Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TRNTN-0002zu-Uq
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 15:27:45 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so817127wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=8nr0i7QxEYQR97HrYgriZCfl5hqjh3e3Q7nYNTZTOk4=;
	b=Izhe+VRkS+iXAwMxE2euB4BPDiLnMfLuA6dw7CtVIO93V8Qx/+ptnv/CsTvOyiluyk
	EVerAYYSd7V+Ti/kwlLtOuhHMaYT8uPe0Vk0sQ2lqElR7UusxqV9RZI/MOfSK3gwISmK
	LRHoOUpRbipyA3xG4F57at3WLtHn/yxY072M26j0kyZpgOq0gz14FdVWBNsqNg8aOv9K
	ksErxC0x4CUbhn8DliX9fVPiEYlgUQkauMnid1E6GmwxeP+GumoSanBUEr/fB6yl/qsE
	9w3wJQqQRmnhA7cVxUwJgEdbh+Urd3oepXrG8gBdO2RpEC8KP4tKgRsnJJg+ccVg790F
	IatQ==
Received: by 10.216.140.33 with SMTP id d33mr11325526wej.68.1351170857043;
	Thu, 25 Oct 2012 06:14:17 -0700 (PDT)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id f1sm9895911wiy.2.2012.10.25.06.14.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 06:14:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 15:13:05 +0200
Message-Id: <1351170785-9914-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome] gvfs-gdu-volume-monitor: fix build after oe-core's libexecdir transition
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
X-List-Received-Date: Thu, 25 Oct 2012 13:27:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tests:
* buildhistory check with libexecdir = /usr/libexec
* run test with libexecdir = /usr/lib/${BPN}

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
index 689f455..fe5af46 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
@@ -4,7 +4,7 @@ BPN = "gvfs"
 
 DEPENDS = "gvfs gnome-disk-utility"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 # we need gdu files only: reduce files to delete in libexecdir
 EXTRA_OECONF += "--disable-gphoto2"
@@ -13,7 +13,9 @@ do_install_append() {
 	rm -rf ${D}${sysconfdir}
 	rm -rf ${D}${bindir}
 	rm -rf ${D}${includedir}
-	rm -rf ${D}${libdir}
+	rm -rf ${D}${libdir}/gio
+	rm -rf ${D}${libdir}/lib*
+	rmdir --ignore-fail-on-non-empty ${D}${libdir}
 	rm -rf ${D}${datadir}/gvfs/mounts
 	rm -rf ${D}${datadir}/glib-2.0
 	rm -rf ${D}${datadir}/GConf
-- 
1.7.6.5



