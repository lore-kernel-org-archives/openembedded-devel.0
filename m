Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SUEVu-0004zF-H3
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 11:57:54 +0200
Received: by bkcjm2 with SMTP id jm2so4890646bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=QTJlOMa1TayiPnFAIqwj4A/QUWF4obIEXQGoHLFtOm0=;
	b=XNxBX5mbU6cJgy5yJk8BQUti9vH7hVjCahoLZTWh+JebnXgzV98fV5SA4WNAoMRc5R
	jHReVJdB98eA3zQtparIRRKHYtK6101zxdCrgNNt+hEC5QPJ2WpUWN2++SEQitBtk0Y/
	WUY9qTNMrvxWtxBF+hvMIWng4yBdl63Bcxi6nkpPIH0fGkq1FSOvBJTBzroi9TlPgdMY
	774HZ5rgvssyiWZkPebni1bHM5ET1DcyWO7lnxjGnnVBRqq+Yd/S1QaJGThr8rgSuJ/k
	+zQ6T1WrBPxvNqO+ch09qqQjgrmVK7yNeCI0kXoge3ziZj+AD++iUEBTWGxlOz++7c1t
	E2qQ==
Received: by 10.204.133.199 with SMTP id g7mr4598909bkt.47.1337075272705;
	Tue, 15 May 2012 02:47:52 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id 9sm40236255bku.9.2012.05.15.02.47.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 02:47:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2012 11:47:47 +0200
Message-Id: <1337075267-9817-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome] gnome-settings-daemon: fix staticdev QA warnings
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
X-List-Received-Date: Tue, 15 May 2012 09:57:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gnome-settings-daemon_2.32.1.bb                |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 55e6b78..6567080 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME settings daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS = "libsndfile1 libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
 
@@ -30,4 +30,6 @@ FILES_${PN} += "${libdir}/gnome-settings-daemon-2.0/*.so ${libdir}/gnome-setting
                 ${datadir}/xsession*"
 
 FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
-FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.a ${libdir}/gnome-settings-daemon-2.0/*.la"
+FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/gnome-settings-daemon-2.0/*.a"
+
-- 
1.7.6.5



