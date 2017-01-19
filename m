Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE056FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d140so10010427wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C8VCBtrPbIMhIkVDbJJE0S0INYfIl4CjCiGfpQGJzHI=;
	b=LsmkqI3pw9+1GM7uK81GA14Pl601/4l5J5oNHDOHbOpfd+I49+UzU2LKoycrZCW/yy
	3YQPI24i/JeVWRLb3jwQ/SR62WzFd5uxSdhb+Mq4G5353EWTmLL9Z/1Tr6kraIY5YTrT
	sXrrOtgPciTaueN8uoKQfQLhG2yxSY0NqMVVWuMC9FquFDdCykkOabrc/ZGEzEt515hp
	0y2DQawgjWmRAKTaGi8o0gDAK+obLZ5xjhJYZPgxh5HNkqQcSZvwElgGLl41lhZaTKUI
	cYSoBAiP7Qs30jXnUgV+AJ9rnJ1CDoojlNm2lHH+3HWZqlCJt4WNty5ibBpEhV/USI8u
	oIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C8VCBtrPbIMhIkVDbJJE0S0INYfIl4CjCiGfpQGJzHI=;
	b=gIL8i233RmfWhSyFBw95BJMwIIxDLP0Siw/V55qv+it8INbSpusJucuYjozlwlikS7
	FVKiHJkZhqjzzuh5M09XDFsPdbKyKWfzaMCTErgW6ky3AKHbqw+DNmyzgmkLKIZIew4C
	y9KYi9aTmIyN17KIkCOBW5VZ7tTcbzN7Ech9gnFH9+vuKp/JEe3unXfWo897TUBs6rD7
	3PruVc3hFJX/LEq8jhnMFjNv745lJdRA8KHK5S/D3seQztvE8xbC2G55o1EKjtW9cHzn
	AWu3iahvluOPZtjcoFcwDTr/0+JMH0PuWpYwKdUjLaTJDpLojsPU+K7ccimWmDJmBnG6
	u5dg==
X-Gm-Message-State: AIkVDXKn/rUwY0Akm+7kvyQDynmyDvA9asb2DZZwsmjp9Y1mRV1U/GopbTQTVhhhZ0ZFoQ==
X-Received: by 10.28.207.7 with SMTP id f7mr24590700wmg.112.1484812421342;
	Wed, 18 Jan 2017 23:53:41 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:24 +0100
Message-Id: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/9] onboard: initial add 1.3.0
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/onboard/onboard_1.3.0.bb | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/onboard/onboard_1.3.0.bb

diff --git a/meta-oe/recipes-support/onboard/onboard_1.3.0.bb b/meta-oe/recipes-support/onboard/onboard_1.3.0.bb
new file mode 100644
index 0000000..82393c3
--- /dev/null
+++ b/meta-oe/recipes-support/onboard/onboard_1.3.0.bb
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
2.7.4


