Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3974762B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 11:55:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b14so16947692wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=rMBKiDiRgegnFH3FICav/pXtWueZl919f0qEG8IT10c=;
	b=GIdfstAgnnruPFP4k1NK8996yfXQUqTMEo7a978Q9UXYaF8ZrYzoVGTJHHpOByR4g0
	W7IyQociWZZC1+CpizsUJ4PGdWXYAb9dJj1wmQl5oEDFLd69Cb8AYiHy+239v3ObYlE1
	eCUelFTzxjl/+fMSgM/wEAGHN2mEUvXQwkRywta5xyDMJYzv/vPx1mfnVWFXB8sIs6uk
	tcySQOHot+zYR2o/RBbxf57f4Rn68+3NLq9Ihnkld7HGv+WOL8d/ttMTHjxleuUoyc5w
	jUy0kQE65Rfrh9Fzxm2WH01cuxljvv1+bsMaIoqNCJjCOddLyToXqNwZEFFmiAdAoiOm
	tN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=rMBKiDiRgegnFH3FICav/pXtWueZl919f0qEG8IT10c=;
	b=mmoXsK7jDzDpNC6Kc2ySX1DauTNCAokVhaJBL9WgcwL+dFa2ozgu8MYQFrCcnQ1pN/
	TE3ZbcisULz+H4mrVJV8lJWMnbM/Ir/T52tYGhdpgm5OHW2s/PkkvMV1CNbKSIS6yJ8n
	w7FMcldRXCOftSfwF4ics63TynIJes+qhqxtxEq3f8GFrwcTj4J5EPk3EWlRPSL4AlfV
	qkYYVDFLgD602XhKWN+lfjIy6+0vycdfIZ5Lhja8jBT9HkHR1ohyDwX0IXWpPN6ObMqK
	p3pdVcSVMJELKYdTGQ6FzEyaoKZugm5she1nL3+jZfVyXxWVsIEgKnRYM84PF7TKHFn1
	ouag==
X-Gm-Message-State: AG10YOR90GWKDHHc+HtB+GGXzOBltiVoJz1fAga25qVkWDotbIkOI8KVwfdcAl/2BinQyg==
X-Received: by 10.28.224.134 with SMTP id x128mr25345751wmg.62.1453809351760; 
	Tue, 26 Jan 2016 03:55:51 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	m143sm2532503wma.17.2016.01.26.03.55.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jan 2016 03:55:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jan 2016 12:55:19 +0100
Message-Id: <1453809321-10937-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/3] frame: initial add 2.5.0
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
X-List-Received-Date: Tue, 26 Jan 2016 11:55:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Note: configure.ac asks for xorg-server explicitly.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../canonical-multitouch/frame_2.5.0.bb             | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb

diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
new file mode 100644
index 0000000..ecc9524
--- /dev/null
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Frame handles simultaneous touches"
+
+HOMEPAGE = "https://launchpad.net/frame"
+
+LICENSE = "GPLv3 & LGPLv3"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+    file://COPYING.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://launchpad.net/${BPN}/trunk/v${PV}/+download/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "02baa941091c5d198cd1623b3ad36e68"
+SRC_URI[sha256sum] = "cfb9ab52cdccd926f1822a457264d0014c7eb9f4600a72626063dd073b26256f"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--enable-x11, --disable-x11, libxi xext virtual/xserver"
+
+PACKAGE_BEFORE_PN += "${PN}-test"
+FILES_${PN}-test = "${bindir}/frame-test*"
-- 
2.5.0


