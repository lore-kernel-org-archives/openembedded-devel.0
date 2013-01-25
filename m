Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tyi32-00034u-TP
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 13:06:21 +0100
Received: by mail-ee0-f43.google.com with SMTP id c50so148275eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 03:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=dFdAu9liOI6NjpF5EAdBu8OpjtycxLAZVbeupE5nxiI=;
	b=gcku8TjQt3XXul5sLZr/w5glCJR7pqHnNGT/Rms77/gD00ebujDp2W8dFPcqyu2UHS
	Zwln2PxLjDIWK79ZNmNXcGwkMcD3BDN9d8akx/T5KY0PtT4fhnugFy7q+RtB3ni8H4jE
	k3hTh45QCrDHtm8KGz2HJbojOEK2XlEnnPvCo1eh7pHxR08h7Q7Fu1MacbVfzrc9fMnG
	/ZWXT3+dWM3JLbOqpAeUwdo9upMh7WiUJxqjHVK8XqXPAdN91WZ+VOAtrPrWP3EidKmT
	hBK1Z51Tyyx7aEE1hZ7zJ4lXR4BwDyn64Ck5djdyql68/aTEuleC63VNKt3O8pYNL0A9
	CpJw==
X-Received: by 10.14.218.71 with SMTP id j47mr13456475eep.28.1359114646639;
	Fri, 25 Jan 2013 03:50:46 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id f6sm1244955eeo.7.2013.01.25.03.50.45
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 03:50:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 12:48:52 +0100
Message-Id: <1359114536-3823-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd 1/5] thunar: add RRECOMMENDS and RDEPENDS to ensure full functionality
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
X-List-Received-Date: Fri, 25 Jan 2013 12:06:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
index 55b54d4..aec2db1 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
@@ -3,6 +3,7 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify xfce4-panel"
+PR = "r1"
 
 inherit xfce
 
@@ -22,3 +23,7 @@ FILES_${PN} += "${libdir}/thunarx-2/* \
 FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug/ \
                     ${libdir}/xfce4/panel/plugins/.debug/ \
                     ${libdir}/Thunar/.debug/"
+
+# RRECOMMENDS does not drag in charmaps (tested with opkg)
+RDEPENDS_${PN} = "eglibc-charmaps"
+RRECOMMENDS_${PN} = "gvfs gvfsd-trash udisks"
-- 
1.7.6.5



