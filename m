Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSj-00080Q-9q
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:59 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247528bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=IMvIEviGmLdElm916nMP+PBnPpLcjNAL9FkBCWAtt4M=;
	b=wAkjVi0Ak6Vq50ze67KWryROc4EgwzSWa0yQf9Yjg7Q/Fn1mx4tn0krKXBcppIrnNL
	MvWi4eTi0JAwCwJiJwOftvQesmt671W7PcH+7UEPUziDCSiy4d4tTPmK2ffTRbOJuPSf
	um/smZiIKJObLcioZtoCQuPZbg/eyhPAX7FhF4EghwqmofJ+R2O7YW9VjDcgVjJpN8DL
	OS0Z62E0x0XXfiDO1sNsZPZauvkAEFMUionrq4c8OGHPo8DvqK4dFdghtdlZfAGsSV0C
	0kIZzNvA0Tv6kEMhpdaG5gXeZ1rD1LcgcqhbswJ8HbminpXBiuWSkUShRP3TQjndcaPn
	p/aw==
Received: by 10.204.156.17 with SMTP id u17mr157211bkw.52.1342168305286;
	Fri, 13 Jul 2012 01:31:45 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:33 +0200
Message-Id: <1342168240-7760-26-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 25/32] cloud9: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      |    9 +--------
 .../recipes-devtools/cloud9/cloud9/cloud9.service  |    0
 .../recipes-devtools/cloud9/cloud9_0.6.bbappend    |   13 +++++++++++++
 3 files changed, 14 insertions(+), 8 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-devtools/cloud9/cloud9/cloud9.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 0f0c09c..a78c653 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "libxml2 nodejs-native"
 
@@ -31,7 +31,6 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/treehugger.git;destsuffix=git/support/treehugger;name=treehugger \
            git://github.com/ajaxorg/UglifyJS.git;destsuffix=git/support/uglify-js;name=uglify-js \
            file://index.js \
-           file://cloud9.service \
            file://cloud9-avahi.service \
            file://0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch \
           "
@@ -104,9 +103,3 @@ FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o
                    "
 
 RDEPENDS_${PN} = "nodejs4 nodejs gzip"
-
-inherit systemd
-
-NATIVE_SYSTEMD_SUPPORT = "1"
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "cloud9.service"
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
similarity index 100%
rename from meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
rename to meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
new file mode 100644
index 0000000..777d2f4
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://cloud9.service"
+
+inherit systemd
+
+NATIVE_SYSTEMD_SUPPORT = "1"
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "cloud9.service"
-- 
1.7.6.5



