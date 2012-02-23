Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdp-0004lM-R6
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:21 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so492439eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.125.3 as permitted sender)
	client-ip=10.14.125.3; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.125.3 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.125.3])
	by 10.14.125.3 with SMTP id y3mr766935eeh.9.1329999062878 (num_hops =
	1); Thu, 23 Feb 2012 04:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=jIB8dpnqQr6+XgLVpYmO3vX+5ivYsSvKeinE2EAObqQ=;
	b=FP/LGOnLIG86TDUcBfidcUvthcoM0Sz66iTJfEO1+UdcqQUzIoSwPlCK5DeTUwivM9
	J6rUTL1DstgZd3ZIKRbs4fHCinCSWVMDnAF8k4puoy9hq3y94vz0l3BNDuJ25XqaG+Ri
	KGTfNC0txGoK3ahwzVXdVIuk+mMCH1JYlI8fs=
Received: by 10.14.125.3 with SMTP id y3mr607055eeh.9.1329999062510;
	Thu, 23 Feb 2012 04:11:02 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:46 +0100
Message-Id: <1329999054-23112-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 15/23] xserver-nodm-init: remove unneeded systemd code
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 2132eab..99edf21 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r12"
+PR = "r13"
 
 SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
@@ -25,14 +25,7 @@ SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
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
 RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
-- 
1.7.6.4



