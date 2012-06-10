Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3m-0002A7-UP
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:35 +0200
Received: by wibhn14 with SMTP id hn14so2644027wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=xJ6T5TMOCJ3M5K3tfK9V4t4xy54qRFhNnDarsneaMKY=;
	b=Dq37fqAV6sjfLQNeHb9d4Z4thCYbVnhY1t5z29dtDtcuyJiNVBPwEtjaGZOhyF419j
	H7Tqxg2lsZi6RXK/6hHlFcxvQbJNS4RYwmSCIDHjo4ThIjEYWbzYf4gfKIVdk4BJEqY1
	eInBmzjHQxnYpvO6LTa9kmkjQ1b39HKBZYASMsVCGl0D6DZAD5NjZpJAuT/CJdXQw1og
	RQZKa0GjzqmtAL5Ij00Y88Trkjku7YIJYBQq0LybTAonNr4fTRcNitr9lODTPdUHFAeI
	Hhv3NyVU7bscy/d81IMyKie+cuBXSGUVd0SEf7A/LfazeSqUBwPEPoq4xctpZvRuK0pa
	Pd1A==
Received: by 10.216.208.87 with SMTP id p65mr5113095weo.162.1339364522537;
	Sun, 10 Jun 2012 14:42:02 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.42.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:42:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:54 +0200
Message-Id: <1339364820-2880-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 21/27] xinput-calibrator: : move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    8 ++------
 .../xinput-calibrator/xinput-calibrator.service    |    0
 .../xinput-calibrator_0.7.5.bbappend               |   10 ++++++++++
 3 files changed, 12 insertions(+), 6 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
index fc5da49..edc10bd 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -4,13 +4,12 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
 DEPENDS = "virtual/libx11 libxi"
 
-PR = "r7"
+PR = "r8"
 
-inherit autotools systemd
+inherit autotools
 
 SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz \
            file://0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch \
-           file://xinput-calibrator.service \
            file://xinput-calibrator-autostart.desktop \
 "
 SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
@@ -29,9 +28,6 @@ do_install_append() {
         install -m 0644 ${WORKDIR}/xinput-calibrator-autostart.desktop ${D}${sysconfdir}/xdg/autostart
 }
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
-
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
 RDEPENDS_${PN} = "xinput xterm"
 RRECOMMENDS_${PN} = "pointercal-xinput"
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
similarity index 100%
rename from meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
rename to meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
new file mode 100644
index 0000000..3cd595d
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://xinput-calibrator.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
-- 
1.7.4.4



