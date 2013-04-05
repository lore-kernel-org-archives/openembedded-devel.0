Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UOFwN-0006pZ-8X
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:21:09 +0200
Received: by mail-ee0-f51.google.com with SMTP id c4so1534658eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 16:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=ulVLXyJsjdiP3g5MLwu39TCQNWDjtqaRa3rX9efdI5U=;
	b=McGVR3UCJr0Us6ythJns5M+nbgWiyraLGYRXYg2Stcma/G15aeJEgYcE5ATdfUIRcu
	X5K4JSoIgtC/sbm/z2lGYSYdiGENBZiW8ldZxNGTEhH6kOxvN2Ogtj+ZsVt3+4A8ha3V
	NsCAT8+/yrhxn4uyY/j3dV8dJkEN9yYH9NpHJXhe5lkm+DLBLJhG2/khuTB4Ex2XnTP1
	jqDkXxnlWAh8OEJvQ5NRI+bjoKPBEsX2l+5MvrjPAv1ybZC/qROx98mYNQpxbbGvYb/S
	gzcJt1lz9ZfuHBHHf1wcg2sSzS4m6EPp4X1ZjX9vpzeLcr264OleQjFYxuI14mECjXYK
	3hog==
X-Received: by 10.14.182.72 with SMTP id n48mr24065766eem.3.1365203028579;
	Fri, 05 Apr 2013 16:03:48 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2C0A.dip.t-dialin.net.
	[91.10.44.10])
	by mx.google.com with ESMTPS id a1sm18010579eep.2.2013.04.05.16.03.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 16:03:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 01:03:31 +0200
Message-Id: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce++ 1/6] exo: create a package for exo-csource - it is not required on target
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
X-List-Received-Date: Fri, 05 Apr 2013 23:21:20 -0000
X-List-Received-Date: Fri, 05 Apr 2013 23:21:20 -0000
X-List-Received-Date: Fri, 05 Apr 2013 23:21:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index f16d544..ff529db 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
 DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native"
-PR = "r2"
+PR = "r3"
 
 inherit xfce pythonnative perlnative
 
@@ -28,6 +28,8 @@ do_install_append () {
 	install -m 755 ${WORKDIR}//gnome-mount ${D}${bindir}/exo-mount-wrapper
 }
 
+PACKAGES =+ "exo-csource"
+
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
 FILES_${PN} += "${datadir}/xfce4/ \
@@ -37,4 +39,6 @@ FILES_${PN} += "${datadir}/xfce4/ \
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
                    "
 
+FILES_exo-csource += "${bindir}/exo-csource"
+
 BBCLASSEXTEND = "native"
-- 
1.7.4.4



