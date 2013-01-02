Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQI0-0000YA-FP
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:32 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so6858579eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=QXDRF/Ehs9ZMLEQkhwbFrN7qctp8wZfI8WDuwPSQWZI=;
	b=Rab2EgXILR6IFADkLOjTnMmRTjxqjU+uePJLewDJnVz1I4y1Oc5vrCasD5B/CnIzIR
	mZlJAMyAqdkTl2URFZHX3k0hcnsy6pneRdsrq6NrZq9vYE2aVMrWsbs+9sU/LMaLkzY+
	tFEmQSoYUArNmAz4lR5ZlGJ2s5iLyXYfWeBtr69Ggq6UtU2vOaXss4DJJyg7pH7eGwx2
	ZvBg6Og2BPmT6XWP5hQm1pQtWJztYudLuXMyYk4KTxjC7XdPb8lB1fQHCjP1QmNKDyKW
	aClP2yVRGwHr1Qjz9TlCP7jeALv3tbH2wzuC0MauPVo4/lPG6F9aRPeW2VRBkdCzpXvp
	qZPw==
X-Received: by 10.14.205.198 with SMTP id j46mr126605727eeo.27.1357139790277; 
	Wed, 02 Jan 2013 07:16:30 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:07 +0100
Message-Id: <1357139774-4364-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 03/10] thunar: update to 1.6.2
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:32 -0000
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



