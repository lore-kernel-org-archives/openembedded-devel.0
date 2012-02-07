Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqs-0001Jt-3q
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:02 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1955916eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GycZcKXJHQBKcbSR91HOisjymrWR/UWEvMZPqozqXgM=;
	b=G9Gyc2pu2TbJ9DBodOIEOoeFpT8QDc1W8rxM4uAHV4Z19Yn2lZtoJUAn1C8vDpJjyx
	uMUneu1obkLy4uK6CvBf5QAkxnF4keBTjWb1Ja75/QMb5Tph2OeMXaqs7b+cPoWP600X
	/jho1NB7GGxVhP8/xffnZ8c00VtSyIc4NpO0c=
Received: by 10.213.35.129 with SMTP id p1mr2159084ebd.19.1328627581542;
	Tue, 07 Feb 2012 07:13:01 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:35 +0100
Message-Id: <1328627573-5217-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 09/27] xserver-nodm-init: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:02 -0000
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
1.7.6.4



