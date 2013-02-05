Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2r7w-0002BU-5F
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 23:36:37 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so358465eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 14:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PzYts+TbMU85iZN5gvlhXQCBz6SrcP2cfZZaFpglBcc=;
	b=HkkV2/vYo+Vvx5Ke15Rgyac/I49KvlJ9iRe0GR2FYsawyDRuorbj6iLdmzheCwF1LN
	tCDhq19AgmVq/0B71fwy4m0dhTF6/i5NFGpJzUdY0R6kDgoO4qcyQBh3RPEgkjoini8c
	wBdLxfwlxj9+d/kGm34eJFrOP9StQlRxkmbXEIRhZuucyVPvErN90kbCcFNeyreuJnSL
	HGgvYKWN8i6GcJiLg3/zJ+StgHZNsbCTGcR0b8ZLsYz1rP4hPm7ttG52Oa78/z397je5
	bwYbrMwLeo9AGgGhED+9XUfrpoOe46P8UwJ2ZKStte49dIr7frl2LBdOL9YpA0oIFl+s
	o3oA==
X-Received: by 10.14.213.7 with SMTP id z7mr89948110eeo.2.1360102842292;
	Tue, 05 Feb 2013 14:20:42 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q5sm33901931eep.11.2013.02.05.14.20.41
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 14:20:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 23:18:42 +0100
Message-Id: <1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe-meta-systemd 4/5] pointercal-xinput: remove
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
X-List-Received-Date: Tue, 05 Feb 2013 22:36:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Calibration values are stored now in /etc/xorg.conf.d/99-<device>.conf. After
this is accepted patches to layers appending pointercal-xinput will be send.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../pointercal-xinput/pointercal.xinput            |    1 -
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   19 -------------------
 .../xinput-calibrator/xinput-calibrator_git.bb     |    3 +--
 3 files changed, 1 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
deleted file mode 100644
index 9633fc5..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
+++ /dev/null
@@ -1 +0,0 @@
-# replace with valid machine specific pointercal.xinput
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
deleted file mode 100644
index 9b68d54..0000000
--- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PR = "r4"
-
-SRC_URI = "file://pointercal.xinput"
-S = "${WORKDIR}"
-
-do_install() {
-	# Only install file if it has a contents
-	if [ -s ${S}/pointercal.xinput ]; then
-	        install -d ${D}${sysconfdir}/
-	        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
-	fi
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 199ee34..8ef774b 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 inherit autotools
 
@@ -58,4 +58,3 @@ do_install_append() {
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart ${systemd_unitdir}/system"
 RDEPENDS_${PN} = "xterm"
-RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.7.6.5



