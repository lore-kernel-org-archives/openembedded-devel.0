Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 27E19733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:14 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id k14so2997757wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=aeL4ulyx95BLVWjRL8OgIHPS0plX1D6O+eHx+1Lt0pc=;
	b=bxl9IT+AxEZVqKQNA1gNate6jxglEpYGFaiX5AFeKLfwNkxCX3a41C/lLM7u4d+fjs
	1ia7jIXLatpESAuL/IOBvh2P9FJoyEnl9l5Jj2vTadQC5lIqpb+gUyXC3s94OlSgQ+9e
	GDx0wgN918NdLvRRGXdb66mIU+xG4QIpVjl6/LG/EE6jvAUm/9C2jqO5fa0Chyo4Zuao
	KflgRFijAFnxuNnAPP33L3zbQ0IhTeIa0NxB1O5XbFWZ8fYPwa7Rm6+CwFmCrUXGicSM
	RXGeThoy2VbECCznjcPlMgui5rf7nFEEatHTqgA/TXsDUf/aPlX29hIE3ga4SDXDoaAO
	kXxQ==
X-Received: by 10.180.105.66 with SMTP id gk2mr488345wib.30.1423776135208;
	Thu, 12 Feb 2015 13:22:15 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:42 +0100
Message-Id: <1423776119-14981-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/19] libqmi: initial add 1.12.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Feb 2015 21:22:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
new file mode 100644
index 0000000..a111c1f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "libqmi is a glib-based library for talking to WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libqmi"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+
+DEPENDS = "glib-2.0"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "5b3b6b37a57e2fa828fd4cb6f86d7a9f"
+SRC_URI[sha256sum] = "d1661d73b510482b29b93b7e396756c433d35360b3d44c72afa7921339a98624"
-- 
1.9.3


