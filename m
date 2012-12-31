Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjEB-0005wq-7W
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:53 +0100
Received: by mail-ea0-f179.google.com with SMTP id i12so5153987eaa.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=QXDRF/Ehs9ZMLEQkhwbFrN7qctp8wZfI8WDuwPSQWZI=;
	b=xPA6XatV+2W2oDjUYcPDiY8hKJ5D/15jX6CtD0APGpxAgk8jqiuapuJV74ZVCKVQRj
	d6TP9l4yV1rrBuzo63nVsmlyIXTFPr+3G7HMUnkUsYtymmasMUE4XAFMMLQgfoqHgKN4
	MvtzsOT+Qd34lvxqHYxgrOIwT5o+qGOa4rumK4GuhVM4MX2mVDdpTxoS3jwbVKWudat3
	Nfnx7cWf3C/YLG1B7Z6lMd/oE8fTxJ91i3Hdkymg7X5mV3r7EU+87f/yR1l5S10tHQEe
	8+Z3cBUQpuUh2DbsWrveMBLQb/VikKocqU4lbyHv5LJQsGc4Asg3AnjC6ItN5I5O3no9
	UWUA==
X-Received: by 10.14.214.132 with SMTP id c4mr111674992eep.18.1356974263685;
	Mon, 31 Dec 2012 09:17:43 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:18 +0100
Message-Id: <1356974245-3497-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 03/10] thunar: update to 1.6.2
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
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../thunar/{thunar_1.4.0.bb => thunar_1.6.2.bb}    |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.4.0.bb => thunar_1.6.2.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
index 2d5b767..55b54d4 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
@@ -3,12 +3,11 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify xfce4-panel"
-PR = "r1"
 
 inherit xfce
 
-SRC_URI[md5sum] = "737ad2c36ed36b10fef82e860b9e990a"
-SRC_URI[sha256sum] = "2c11a19e64cef708a264fb4d5d933389899c3d132fe7b1e313dd6e37bfe4c8ba"
+SRC_URI[md5sum] = "a446103ab90855cc8ba484dfeedb82d8"
+SRC_URI[sha256sum] = "7dbd172ae396e7a2533f47dc1ff703a9ea1a61af3edfdc6f4877b9b9331abd85"
 SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
 
 S = "${WORKDIR}/Thunar-${PV}/"
-- 
1.7.4.4



