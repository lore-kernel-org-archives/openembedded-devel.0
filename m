Received: from mail-wg0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T0ydL-00086V-6f
	for openembedded-devel@lists.linuxtogo.org;
	Mon, 13 Aug 2012 19:40:55 +0200
Received: by wgbez12 with SMTP id ez12so3591375wgb.6
	for <openembedded-devel@lists.linuxtogo.org>;
	Mon, 13 Aug 2012 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=EZm0fvHYQEXtlllR5ff4CA/pyWDVevPOs70lnjqW/Xc=;
	b=sSFtvDzuN3FdjJ8xkIDqq6o7aJ46vpz0IHQBVh1k5bnd6XLsDslreQW5XlCcHNKvw7
	13n02uZWlLDgI8M9bhDF391BApdFn2BwH/l6JR0Z1WgyEHRfLdGA4cD+x1ntmtbMewi2
	z32jsgI+8oKDb3kTRQZUru4p/n3Qcm7XouEIsEbfdzcP2iV9Dfl+M5zDvnuMWXW/SJyH
	rT4NKIN9fjC5284+jrIZ0DYS97ysLtMJevleHXeNzMwmHAz9TleNvvpboQBbGlM5gH1O
	eMghQZoORbacEN/W3hPiGGYf1/CTBNJijCMZdGHM9KtnsurU0XTzTccSCQnI+/Wfg7YK
	tNAA==
Received: by 10.180.78.5 with SMTP id x5mr20159648wiw.13.1344878941595;
	Mon, 13 Aug 2012 10:29:01 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fb20sm25448486wid.1.2012.08.13.10.28.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 10:29:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.linuxtogo.org
Date: Mon, 13 Aug 2012 19:28:26 +0200
Message-Id: <1344878906-17790-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd] wpa-supplicant: add systemd support
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
X-List-Received-Date: Mon, 13 Aug 2012 17:40:55 -0000
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
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend

diff --git a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend b/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
deleted file mode 100644
index 54da0ff..0000000
--- a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
- 
-PRINC = "1"
diff --git a/meta-systemd/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
new file mode 100644
index 0000000..6f62cd8
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
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
1.7.6.5



