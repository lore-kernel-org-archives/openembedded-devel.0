Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T14nf-0000fI-Aa
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 02:15:59 +0200
Received: by wgbdr1 with SMTP id dr1so3401230wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=TSbzPiA6pf4g/jGbTzY9wbOLIIhXiVCjKJE245kvny0=;
	b=Jvv+YQvBcWyPlaZ6q3rp7EVD+jIYbbb+Fif6ZY0Ecz+2fdHH5OLT68e+1GUHaVMEZO
	0076kHeRW6zU2DhQp2lhWZWOFkwd3AS+xJq6lCzEgi1tu+pa1J90xLri0APdsiaASWJt
	UNWlO7QvGgxE2VlWPaZV0mdDnYu+tV/sqGa7DxkHRNlM8lNZ6PUh82Kvod6WqY+cF9Ya
	omLs+T6bn63+ToVpUq+M+UrZyqm70j5YGCaDbXMFdTTsZX79spqGOXR/rU6iUm45n621
	SOop6oxLRKxMRVCrjyQrwYXxwC3OAw0DGpAciqo99J8PkON1jaz9A9EzoaMZRNp1CppM
	cx5w==
Received: by 10.180.19.169 with SMTP id g9mr22558914wie.9.1344902645083;
	Mon, 13 Aug 2012 17:04:05 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3A26.dip.t-dialin.net.
	[91.10.58.38])
	by mx.google.com with ESMTPS id el6sm19297370wib.8.2012.08.13.17.04.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 17:04:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2012 02:10:48 +0200
Message-Id: <1344903048-2800-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-systemd,v2] wpa-supplicant: add systemd support
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
X-List-Received-Date: Tue, 14 Aug 2012 00:15:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* native systemd support came in with v1.0 [1]
* needs [2] to work properly
* mends my wlan under control of networkmanager

[1] http://hostap.epitest.fi/gitweb/gitweb.cgi?p=hostap-1.git;a=blob_plain;f=wpa_supplicant/ChangeLog
[2] http://patches.openembedded.org/patch/34335/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |    3 ---
 .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |   14 ++++++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend

diff --git a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend b/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
deleted file mode 100644
index 54da0ff..0000000
--- a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
- 
-PRINC = "1"
diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
new file mode 100644
index 0000000..6f62cd8
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
@@ -0,0 +1,14 @@
+PRINC = "2"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "wpa_supplicant.service"
+
+do_install_append () {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
+}
+
+# systemd.bbclass does not catch all multiple-instance-service-files
+FILES_${PN}-systemd += "${systemd_unitdir}/system/"
-- 
1.7.4.4



