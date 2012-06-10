Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3j-0001fb-73
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:31 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=sHfw8YcjZDUvZAr8atf2sS+n/ZYprcp7FPFoKmZrr64=;
	b=VJxX92qJ52cFjgQpTSpW/emAt7L3KBpuJC2gaE6vgtWKTPJQz9DRXC74G7n0UyZj2n
	dpVu507KUvZQwISLUaTR/wuOzJju8qEo9bpHf/2VhEYTBhi7lJP8l97lA66LZXmM9sNH
	rjVbRc9rfHx0u+01ym2hHvYKIBDnn3D3QKXMwMy1x6FG9fYKWZaD3wuUkF8tKQLw7Q62
	Jcog4SpU+DGzEMt4NjBhiQaZlS8hMIxcFmvuaJbxRRYm++c3NRF9/pnE+oyOKV8J4Idy
	w0B5PYPoP4ODZoqL4P0E1lhd7qrDNNT0VfdX+13O0TE5zfJnp2EfEnlxN4pYfe1Q3f2W
	ICUw==
Received: by 10.216.207.67 with SMTP id m45mr3722721weo.175.1339364520862;
	Sun, 10 Jun 2012 14:42:00 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:42:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:53 +0200
Message-Id: <1339364820-2880-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 20/27] cloud9: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:31 -0000
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
index 0000000..7424a89
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
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
1.7.4.4



