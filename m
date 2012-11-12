Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXspl-0002gP-HZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 13:09:48 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so476039eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=8nr0i7QxEYQR97HrYgriZCfl5hqjh3e3Q7nYNTZTOk4=;
	b=MXA3zag5avmodQL9N5Q0hgjMcrc7MxxE1oYve9MRG7DA1QH7W8wTXkQDljWBlyOoRx
	MJ+b5HWQvg8AnToAPUX/+teIMgl+/XFrxh75KhwTxMIuBfZWfT4MaVm3Ceonfz3VpkLe
	SsNudAGDfVHMsuVNkEpcL2rnE/GJw+JCBMaNtoOSITwH5zTpaNFiMpwytazybGhMxHWo
	M/TcB1c/tBY1WL7mkyzCLiwmPRaQUzme8jRtJJZeF3sKG2YtPxOUgzxKa+qCgRDYA2w0
	dKUQjDGkjR7SeXrklO9nX6evISVFMlP/6qrVDnqPFpGuMILUWcbOG9Pxx/6lEf30/wXL
	B9PA==
Received: by 10.14.182.5 with SMTP id n5mr62275280eem.5.1352721353100;
	Mon, 12 Nov 2012 03:55:53 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id f2sm15646402eep.2.2012.11.12.03.55.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 03:55:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 12:54:24 +0100
Message-Id: <1352721267-367-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
References: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 3/6] gvfs-gdu-volume-monitor: fix build after oe-core's libexecdir transition
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
X-List-Received-Date: Mon, 12 Nov 2012 12:10:00 -0000
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



