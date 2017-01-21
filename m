Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1947A601F2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jan 2017 20:21:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so15619135wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jan 2017 12:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7YPjp4geK1hLmc7JdaELo9BQgkCDsYErczM4eUk3vYQ=;
	b=XFAuLEZ/j+fMT3hLDZv1AhSzaCIRgs142uX5floFafvLQ6pLsaptYnfN9OVjVsk6RW
	8TfDvOAoaFjoetXIdtRPr/4lq5aQz+StHac6gnHOFtFrav5c9OPLNge6eUvfbVmX8X0I
	p75FtJshfVmu2ji2pyunMnA0Qf5rq5BEA36LhHNWGysweZlZPFPYT8vVPida5t+qE1yf
	lFWjnE/IQoFvKrvkXJ4fm3ZeC7BKBSxfwCUWr+AvhLaFBnnNo1tpDtJuVH4B4kEDR9bP
	vXs6z3BrD/q1ABqTCugJ/XUZpfPRlV7aM797hmUlJJMsIJxzdsviQ8eq812PpuI7qZJ5
	jv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7YPjp4geK1hLmc7JdaELo9BQgkCDsYErczM4eUk3vYQ=;
	b=NQE7neHVOgvsTLQNlnMLLhlK8q7mYrrnnNTc029jMtJ+TGJ1PvE2KFsdy/gdthxlMs
	42ZTCKPH5FZZjqxmL3BZz+Qr5Kk96sSOGZDXEADl5oVBiFN+VZmGcjH5wyyPSjT5hoPD
	t3TNb/pW1toJqsKBLQi/dLLAEAntMQ2eG4T+HdXDCFB4sgMecMxLCWt5mmTXkKUO5boB
	AWcMt/rOU2OGC0Bb9EKdAHA7j0BfjrsG2hsjg86ktI8ZyicjJCY+QDB+aRiLSdmgtfRF
	PbZTs9SzbQ9cKAXQBaHIGhoewaFV/Apo/ljRjDNVX5QqemZVb/054uhInM4jmrPUy5Ay
	f5Yw==
X-Gm-Message-State: AIkVDXKHsonWHYJmgEwcS5absIE2LgehGqg5N9dphaRPWnoDKy3/eCXjwH7CVIJyltIUqQ==
X-Received: by 10.28.51.205 with SMTP id z196mr7786940wmz.22.1485030099113;
	Sat, 21 Jan 2017 12:21:39 -0800 (PST)
Received: from localhost.localdomain (p579F7403.dip0.t-ipconnect.de.
	[87.159.116.3]) by smtp.googlemail.com with ESMTPSA id
	u198sm12448350wmf.9.2017.01.21.12.21.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jan 2017 12:21:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jan 2017 21:21:22 +0100
Message-Id: <1485030082-4808-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH V2] onboard: initial add 1.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jan 2017 20:21:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---

V1 -> V2: move recipe to meta-gnome

 .../recipes-support/onboard/onboard_1.3.0.bb       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-gnome/recipes-support/onboard/onboard_1.3.0.bb

diff --git a/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb b/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
new file mode 100644
index 0000000..82393c3
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "An onscreen keyboard"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e"
+
+DEPENDS += "gtk+3 hunspell libcanberra libxkbfile dconf"
+
+SRC_URI = "https://launchpad.net/onboard/1.3/${PV}/+download/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "8000df3e789512a90fcb227580fd60ff"
+SRC_URI[sha256sum] = "fd74b54b8bd7a075cf5f6e1a8ca3e6de5cd2663507adb690d7b1a85e71afa2e4"
+
+inherit setuptools3 pkgconfig gtk-icon-cache gsettings
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/icons \
+    ${datadir}/gnome-shell \
+    ${datadir}/help \
+"
+
+RDEPENDS_${PN} += " \
+    ncurses \
+    python3-dbus \
+    python3-pycairo \
+    python3-pygobject \
+"
-- 
2.5.5


