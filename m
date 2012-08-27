Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T5v12-0002WG-Ko
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 10:49:48 +0200
Received: by bkcik5 with SMTP id ik5so1161751bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 01:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=UKpFe1TGMT+BTGgJ21e0HrCAAZMGz8TooJCo94lnm7Y=;
	b=XTnefsy1DkFNfG2UykRSOKUOggzDVZ/k2lB14KhJ+hL9QsRrC4KwaCcDNeacklJpXN
	JGPFTvfbZVM7UZhLmH04qtgBvfLt7PfkYDtMM9jR9pRe6WuXY15PMLknxqcjsSnRifP6
	KjanMGIbwv/VWssRu4/WymvOSqDrrmOeCZ0z5qbOha2Tsf58AzezaxwOG6Yhcu9yzGwu
	F85+UFZ7/D61CXxnswtOLDV9MvvlEb30g/i0eURCMyVzC5m2qDpqW83/gQDUzBnvO/6t
	DGR/vprfWzn1ng5DYhynkPTyEQOF0iogehurj57zBNn3TF7AX67kd31fpeOAtMmL0u2c
	xzAA==
Received: by 10.204.136.215 with SMTP id s23mr3510454bkt.32.1346056657461;
	Mon, 27 Aug 2012 01:37:37 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id m9sm9940391bkm.10.2012.08.27.01.37.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 01:37:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2012 10:36:50 +0200
Message-Id: <1346056611-31432-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1346056611-31432-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346056611-31432-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd 1/2] xfwm4: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Mon, 27 Aug 2012 08:49:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
index 299c7ad..304ff66 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
@@ -3,6 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification"
+PR = "r1"
 
 inherit xfce update-alternatives
 
@@ -18,10 +19,9 @@ python populate_packages_prepend () {
 
 PACKAGES_DYNAMIC += "xfwm4-theme-*"
 
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/xfce4-session"
-ALTERNATIVE_PRIORITY = "30"
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/xfwm4"
+ALTERNATIVE_PRIORITY[x-window-manager] = "30"
 
 RDEPENDS_${PN} = "xfwm4-theme-default"
 FILES_${PN} += "${libdir}/xfce4/xfwm4/helper-dialog \
-- 
1.7.6.5



