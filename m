Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm2-00063p-Ko
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:42 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479837eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=9BGGADyLRedzZUPMiwvvE8B8nXsG3EDeWw8AZ0oqsfY=;
	b=S+A4IFTpX3M3Uqm1iMB8oHn+ATzi0b5LNW4Bd7lltXCgweR53Cz4YxMxYiCmtSAZ7U
	ZsmYHQZAslxb+9rAm10UYpAzkTcpoDz+6Oai6q2mgHBrEIe4tMb0I9ICLS+79G61fx+1
	mW3zXP6FnIk9Y3XunFyPNE1CePrbn1Ry8POVk=
Received: by 10.14.94.134 with SMTP id n6mr336394eef.63.1329357631523;
	Wed, 15 Feb 2012 18:00:31 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:07 +0100
Message-Id: <1329357796-27398-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 13/22] xserver-nodm-init: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 2132eab..eec284e 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r12"
+PR = "r13"
 
 SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
@@ -25,14 +25,6 @@ SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
 do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install xserver-nodm ${D}${sysconfdir}/init.d
-
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 xserver-nodm.service ${D}${base_libdir}/systemd/system/
 }
 
-PACKAGES += "${PN}-systemd"
-
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
-
-FILES_${PN}-systemd += "${base_libdir}/systemd/system/"
-RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
-- 
1.7.4.4



