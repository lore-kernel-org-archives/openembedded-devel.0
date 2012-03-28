Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCr9R-0004db-IM
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 13:34:53 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so573859wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 04:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FnvgvVAUZoM/JlVHX3wMB3KI5VoYzhm0wIXUwGdzkDg=;
	b=xVlERlX5YW2aJAkZcMZc6N7/VyxiBNsLD6du6CKQkmJL29SAohbx4rLNNI3PMADr5Y
	ApimVkZSqWqHa8BndRwW1c0grsLBUS8gv/ekn8p6ATXRSrUBN7YhunXy3cRWaNFcaS9Y
	sNrpAUrV6jNZHhkDbIQeeslWXQHt0heyUz2mBbuBp+kqIWC1YrIYkZnPqUPJrrSIeEEw
	XCbn/2+nG7/b3NVv/Fj79e8Z7HZHLanpdBdK5Pscr8NNeaw0OOvAJl4/zJJG2AFwCjf+
	+PZkXrs4UwJS9i9SqbvJZJv2UcKtNAr3JZfjRDYS0CYXrhXHnXrV8COj7Jd9NYI6qin1
	8ZAQ==
Received: by 10.180.80.9 with SMTP id n9mr6248845wix.4.1332933953851;
	Wed, 28 Mar 2012 04:25:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm57247452wib.4.2012.03.28.04.25.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 04:25:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 13:25:26 +0200
Message-Id: <0167d303b04185f56e7dd408b4fb13a9307becb1.1332933826.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <5a7fc35885c7f07840731881c5e07b5c68299838.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
	<5a7fc35885c7f07840731881c5e07b5c68299838.1332933826.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] xinput-calibrator: add systemd service
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
X-List-Received-Date: Wed, 28 Mar 2012 11:34:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xinput-calibrator/xinput-calibrator.service    |   11 +++++++++++
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   11 ++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
new file mode 100644
index 0000000..e23bfc4
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Loads xinput calibration data
+ConditionPathExists=/etc/pointercal.xinput
+Requires=xserver-nodm.service
+After=xserver-nodm.service
+
+[Service]
+ExecStart=/usr/bin/xinput_calibrator_once.sh
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
index e39cc44..d823e0e 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -4,12 +4,14 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
 DEPENDS = "virtual/libx11 libxi"
 
-PR = "r3"
+PR = "r4"
 
-inherit autotools
+inherit autotools systemd
 
 SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz \
-           file://0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch"
+           file://0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch \
+           file://xinput-calibrator.service \
+"
 SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
 SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
 
@@ -23,5 +25,8 @@ do_install_append() {
         install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
 }
 
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
+
 RDEPENDS_${PN} = "xinput"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.7.8.5



