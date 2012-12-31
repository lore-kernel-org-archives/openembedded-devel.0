Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjEC-0005wr-QY
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:54 +0100
Received: by mail-ee0-f45.google.com with SMTP id d49so6179095eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ZFH4kKv/xho40QDYFI2o8S3o28S5IEgLnG30F102B8s=;
	b=I24wnhzSvyTNFL41fkTkTEcYUV/a065iWFyem5ae4fmYZhR1nEAgBXk4FPnRWfs0KJ
	W0KZaKcdahM2zFWjZSP1ZsSzNvb2lcswnhvkI13f5gbtNJM6eBcLFcXsNSoD/LpH6ATX
	h2uvgkVeIIRwR4I4ewUF4n0r51RkALDecWSymUdIhf2gYDFziAjxV8uIbWgzZcYa7Q0j
	UG51pFs6qRtH8Yc4Hl04fqhPBAPxcOQ/uaDkpeDvevF1YJx+pqHNb0Y2byFLouEnr7sA
	zAApUaC+TP5EzzvYAIkiFnUlMfXBA0NdxeVWLsrXS144JuqwpRfmve0yDfe7mSoJT50k
	lNjg==
X-Received: by 10.14.3.195 with SMTP id 43mr111650759eeh.36.1356974265238;
	Mon, 31 Dec 2012 09:17:45 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:19 +0100
Message-Id: <1356974245-3497-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 04/10] xfce4-terminal: update to 0.6.0
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
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* renamed upstream Terminal -> xfce4-terminal [1]
* dependencies changed [1]

[1] http://mail.xfce.org/pipermail/xfce/2012-December/031872.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce-terminal/xfce-terminal_0.4.8.bb           |   20 --------------------
 .../xfce4-terminal/xfce4-terminal_0.6.0.bb         |   12 ++++++++++++
 2 files changed, 12 insertions(+), 20 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.0.bb

diff --git a/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb b/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
deleted file mode 100644
index 697c5c6..0000000
--- a/meta-xfce/recipes-apps/xfce-terminal/xfce-terminal_0.4.8.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "virtual/libx11 exo gtk+ vte dbus-glib"
-
-PR = "r0"
-
-inherit xfce
-
-# SRC_URI must follow inherited one
-SRC_URI = "http://archive.xfce.org/src/apps/terminal//${@'${PV}'[0:3]}/Terminal-${PV}.tar.bz2 \
-"
-
-S = "${WORKDIR}/Terminal-${PV}"
-
-FILES_${PN} += "${datadir}/Terminal \
-                ${datadir}/gnome-control-center/default-apps/Terminal-default-apps.xml"
-
-SRC_URI[md5sum] = "8dff62234da14e1a5e542fb56560ebe2"
-SRC_URI[sha256sum] = "fe5db0b7127ce87efa1e10f44d8915be88005b6ce4f0bfea6b64533e25cc788d"
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.0.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.0.bb
new file mode 100644
index 0000000..56816aa
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+DEPENDS = "glib-2.0 gtk+ vte libxfce4ui"
+
+inherit xfce-app
+
+FILES_${PN} += "${datadir}/xfce4 \
+                ${datadir}/gnome-control-center"
+
+SRC_URI[md5sum] = "afb729d37f0ffa003511a47459ed3baf"
+SRC_URI[sha256sum] = "5ef54194e69b4f3ada885d73f6950b7cf9d2300a532e71963b9b8ee4a7598edf"
-- 
1.7.4.4



