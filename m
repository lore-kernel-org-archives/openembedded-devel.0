Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyryN-0007bz-5A
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 23:42:12 +0100
Received: by mail-ea0-f178.google.com with SMTP id a14so377330eaa.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=P/cIb10UWUpEqQLGot/gHsCbl9bQoDQLIYfCgchgw5c=;
	b=G+ZVXrno6i9W+PdMnEKquGWaMlXhb9zByhAPgXSphQnrI5rDGycWgqzoGO4GcTrs2t
	wMsgKOw9AIggsEDBe1FInNjiV+c7osJyMspaCmrWSVPJbA9PZar+aTEoAZF7LtT80iG3
	etasHYOu/yeM3c/keUtcd8kcoUzoepygWpXybc8o7piTiB5NcY/GyS+3jn9mlSDiE4Mm
	rfRfVmJFUcWKk6HRBxkTH+1dZ92BB3oe0hWAYkfnGsFU2xMapyGBn6543uqgeKKTPbCH
	TNfy9ataBsMHihjMHKcpqn4UgGquHuKLijljPzLo03qRLGZFpm+kZkUEQdSGtyHIkDM4
	DhnA==
X-Received: by 10.14.3.195 with SMTP id 43mr22502107eeh.36.1359152796673;
	Fri, 25 Jan 2013 14:26:36 -0800 (PST)
Received: from localhost.localdomain (p5B0A1952.dip.t-dialin.net.
	[91.10.25.82])
	by mx.google.com with ESMTPS id k4sm3566723eep.15.2013.01.25.14.26.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:26:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 23:26:18 +0100
Message-Id: <1359152782-23743-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd/V2 1/5] thunar: add RRECOMMENDS and RDEPENDS to ensure full functionality
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
X-List-Received-Date: Fri, 25 Jan 2013 22:42:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
index 55b54d4..973eb47 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
@@ -3,6 +3,7 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify xfce4-panel"
+PR = "r1"
 
 inherit xfce
 
@@ -22,3 +23,5 @@ FILES_${PN} += "${libdir}/thunarx-2/* \
 FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug/ \
                     ${libdir}/xfce4/panel/plugins/.debug/ \
                     ${libdir}/Thunar/.debug/"
+
+RRECOMMENDS_${PN} = "gvfs gvfsd-trash udisks"
-- 
1.7.4.4



