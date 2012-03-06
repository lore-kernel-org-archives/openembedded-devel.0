Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4io4-0002SH-Ke
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 02:03:12 +0100
Received: by eaae1 with SMTP id e1so1348015eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 16:54:37 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.106.17 as permitted sender)
	client-ip=10.213.106.17; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.106.17 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.106.17])
	by 10.213.106.17 with SMTP id v17mr2575763ebo.223.1330995277830
	(num_hops = 1); Mon, 05 Mar 2012 16:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Mv604o8nyuvfBsfhAkr+xuNp1hVC+W/M48UZ0dYWFw0=;
	b=RNh1BVyzO029nKgDalRnSLw/Ml+aqRC0EvV7D8b68KhsAinypMjORqIza0BolWi57k
	cX+0D65Z7WeCGeC5pl7yMoDj2FFlWCNG0p4Yf5YxKeuH+VUfiYy0G0E7341bhdSMrZnt
	PU1g8Pmsjn5frAJcUkRd6nkocv/V3jgRucE0jPUjs6uBIOBYAX78ybwpz9eaWPSB9tH4
	1IG4dVb8Dh+Rl0DHxNJdgu+jAfVV5rEAUCE1URWyK1z+TzfxMV241Y//SbH+FNmp+jUY
	SakHIIpOGOblptTpKhX4gCDoxA4dGP0ODPfe1ojYQuG0yRiK7gJNisSalT4gcqlZGYze
	Ov7A==
Received: by 10.213.106.17 with SMTP id v17mr1951566ebo.223.1330995277743;
	Mon, 05 Mar 2012 16:54:37 -0800 (PST)
Received: from localhost.localdomain (p4FDF114E.dip.t-dialin.net.
	[79.223.17.78])
	by mx.google.com with ESMTPS id s48sm67842976eem.0.2012.03.05.16.54.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 16:54:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 01:58:15 +0100
Message-Id: <1330995497-10440-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1330995497-10440-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330995497-10440-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, v2 1/3] gateone: remove unneeded systemd code
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
X-List-Received-Date: Tue, 06 Mar 2012 01:03:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/gateone/gateone_git.bb    |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 107b3f2..2469f9e 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
+PR = "r1"
+
 PV = "1.0"
 SRCREV = "0dfa4196ca514e075199c0dbf849353c6aa2976b"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
@@ -18,9 +20,6 @@ export prefix = "${localstatedir}/lib"
 do_install_append() {
 	install -d ${D}${localstatedir}/log/${BPN}
 
-	install -m 0755 -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system/
-
 	install -m 0755 -d ${D}${sysconfdir}/avahi/services/
 	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
 }
-- 
1.7.4.4



